# On-Prem Installation Guidelines

## Overview

* MOSIP modules are deployed in the form of microservices in kubernetes cluster.
* [Wireguard](https://www.wireguard.com/) is used as a trust network extension to access the admin, control, and observation pane.
* It is also used for the on-the-field registrations.
* MOSIP uses [Nginx](https://www.nginx.com/) server for:
  * SSL termination
  * Reverse Proxy
  * CDN/Cache management
  * Loadbalancing
* Kubernetes cluster is administered using the [Rancher](https://rancher.com/docs/rancher/v1.3/en/kubernetes/#rancher-ui) and [rke](https://www.rancher.com/products/rke) tools.
* In V3, we have two Kubernetes clusters:

**Observation cluster** - This cluster is a part of the observation plane and it helps in administrative tasks. By design, this is kept independent of the actual cluster as a good security practice and to ensure clear segregation of roles and responsibilities. As a best practice, this cluster or it's services should be internal and should never be exposed to the external world.

* [Rancher](https://rancher.com/docs/rancher/v1.3/en/kubernetes/#rancher-ui) is used for managing the MOSIP cluster.
* [Keycloak](https://www.keycloak.org/) in this cluster is used for cluster user access management.
* It is recommended to configure log monitoring and network monitoring in this cluster.
* In case you have an internal container registry, then it should run here.

**MOSIP cluster** - This cluster runs all the MOSIP components and certain third party components to secure the cluster, API’s and data.

* [MOSIP External Components](https://github.com/mosip/mosip-infra/blob/v1.2.0.1-B1/deployment/v3/external/README.md#mosip-external-components)
* [MOSIP Services](https://github.com/mosip/mosip-infra/blob/v1.2.0.1-B1/deployment/v3/mosip/README.md#mosip-services)

### Architecture diagram

![](\_images/deployment\_architecture.png)

### Deployment repos

* [k8s-infra](https://github.com/mosip/k8s-infra/tree/v1.2.0.1-B1) : contains the scripts to install and configure Kubernetes cluster with required monitoring, logging and alerting tools.
* [mosip-infra](https://github.com/mosip/mosip-infra/tree/v1.2.0.1-B1/deployment/v3) : contains the deployment scripts to run charts in defined sequence.
* [mosip-config](https://github.com/mosip/mosip-config/tree/v1.2.0.1-B1) : contains all the configuration files required by the MOSIP modules.
* [mosip-helm](https://github.com/mosip/mosip-helm/tree/v1.2.0.1-B1) : contains packaged helm charts for all the MOSIP modules.

### Pre-requisites

#### Hardware requirements

* VM’s required can be with any OS as per convenience.
* Here, we are referting to Ubuntu OS throughout this installation guide.

| Sl no. | Purpose                                                 | vCPU's | RAM   | Storage (HDD) | no. ofVM's | HA                               |
| ------ | ------------------------------------------------------- | ------ | ----- | ------------- | ---------- | -------------------------------- |
| 1.     | Wireguard Bastion Host                                  | 2      | 4 GB  | 8 GB          | 1          | (ensure to setup active-passive) |
| 2.     | Observation Cluster nodes                               | 2      | 8 GB  | 32 GB         | 2          | 2                                |
| 3.     | Observation Nginx server (use Loadbalancer if required) | 2      | 4 GB  | 16 GB         | 2          | Nginx+                           |
| 4.     | MOSIP Cluster nodes                                     | 12     | 32 GB | 128 GB        | 6          | 6                                |
| 5.     | MOSIP Nginx server ( use Loadbalancer if required)      | 2      | 4 GB  | 16 GB         | 1          | Nginx+                           |

#### Network requirements

* All the VM's should be able to communicate with each other.
* Need stable Intra network connectivity between these VM's.
* All the VM's should have stable internet connectivity for docker image download (in case of local setup ensure to have a locally accesible docker registry).
* Server Interface requirement as mentioned in below table:

| Sl no. | Purpose                  | Network Interfaces                                                                                                                                                                                                                                                                                         |
| ------ | ------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1.     | Wireguard Bastion Host   | <p><em>One Private interface</em> : that is on the same network as all the rest of nodes (e.g.: inside local NAT Network).<br><br><em>One public interface</em> : Either has a direct public IP, or a firewall NAT (global address) rule that forwards traffic on 51820/udp port to this interface IP.</p> |
| 2.     | K8 Cluster nodes         | One internal interface: with internet access and that is on the same network as all the rest of nodes (e.g.: inside local NAT Network )                                                                                                                                                                    |
| 3.     | Observation Nginx server | One internal interface: with internet access and that is on the same network as all the rest of nodes (e.g.: inside local NAT Network).                                                                                                                                                                    |
| 4.     | Mosip Nginx server       | <p><em>One internal interface</em> : that is on the same network as all the rest of nodes (e.g.: inside local NAT Network).<br><br><em>One public interface</em> : Either has a direct public IP, or a firewall NAT (global address) rule that forwards traffic on 443/tcp port to this interface IP.</p>  |

#### DNS requirements

|     | Domain Name                  | Mapping details                                                     | Purpose                                                                                                                                                                                                                                           |
| --- | ---------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1.  | rancher.xyz.net              | Private IP of Nginx server or load balancer for Observation cluster | Rancher dashboard to monitor and manage the kubernetes cluster.                                                                                                                                                                                   |
| 2.  | keycloak.xyz.net             | Private IP of Nginx server for Observation cluster                  | Administrative IAM tool (keycloak). This is for the kubernetes administration.                                                                                                                                                                    |
| 3.  | sandbox.xyx.net              | Private IP of Nginx server for MOSIP cluster                        | Index page for links to different dashboards of MOSIP env. (This is just for reference, please do not expose this page in a real production or UAT environment)                                                                                   |
| 4.  | api-internal.sandbox.xyz.net | Private IP of Nginx server for MOSIP cluster                        | Internal API’s are exposed through this domain. They are accessible privately over wireguard channel                                                                                                                                              |
| 5.  | api.sandbox.xyx.net          | Public IP of Nginx server for MOSIP cluster                         | All the API’s that are publically usable are exposed using this domain.                                                                                                                                                                           |
| 6.  | prereg.sandbox.xyz.net       | Public IP of Nginx server for MOSIP cluster                         | Domain name for MOSIP's pre-registration portal. The portal is accessible publicly.                                                                                                                                                               |
| 7.  | activemq.sandbox.xyx.net     | Private IP of Nginx server for MOSIP cluster                        | Provides direct access to `activemq` dashboard. It is limited and can be used only over wireguard.                                                                                                                                                |
| 8.  | kibana.sandbox.xyx.net       | Private IP of Nginx server for MOSIP cluster                        | Optional installation. Used to access kibana dashboard over wireguard.                                                                                                                                                                            |
| 9.  | regclient.sandbox.xyz.net    | Private IP of Nginx server for MOSIP cluster                        | Registration Client can be downloaded from this domain. It should be used over wireguard.                                                                                                                                                         |
| 10. | admin.sandbox.xyz.net        | Private IP of Nginx server for MOSIP cluster                        | MOSIP's admin portal is exposed using this domain. This is an internal domain and is restricted to access over wireguard                                                                                                                          |
| 11. | object-store.sandbox.xyx.net | Private IP of Nginx server for MOSIP cluster                        | Optional- This domain is used to access the object server. Based on the object server that you choose map this domain accordingly. In our reference implementation, MinIO is used and this domain let's you access MinIO’s Console over wireguard |
| 12. | kafka.sandbox.xyz.net        | Private IP of Nginx server for MOSIP cluster                        | Kafka UI is installed as part of the MOSIP’s default installation. We can access kafka UI over wireguard. Mostly used for administrative needs.                                                                                                   |
| 13. | iam.sandbox.xyz.net          | Private IP of Nginx server for MOSIP cluster                        | MOSIP uses an OpenID Connect server to limit and manage access across all the services. The default installation comes with Keycloak. This domain is used to access the keycloak server over wireguard                                            |
| 14. | postgres.sandbox.xyz.net     | Private IP of Nginx server for MOSIP cluster                        | This domain points to the postgres server. You can connect to postgres via port forwarding over wireguard                                                                                                                                         |
| 15. | pmp.sandbox.xyz.net          | Private IP of Nginx server for MOSIP cluster                        | MOSIP’s partner management portal is used to manage partners accessing partner management portal over wireguard                                                                                                                                   |
| 16. | onboarder.sandbox.xyz.net    | Private IP of Nginx server for MOSIP cluster                        | Accessing reports of MOSIP partner onboarding over wireguard                                                                                                                                                                                      |
| 17. | resident.sandbox.xyz.net     | Public IP of Nginx server for MOSIP cluster                         | Accessing resident portal publically                                                                                                                                                                                                              |
| 18. | idp.sandbox.xyz.net          | Public IP of Nginx server for MOSIP cluster                         | Accessing IDP over public                                                                                                                                                                                                                         |
| 19. | smtp.sandbox.xyz.net         | Private IP of Nginx server for MOSIP cluster                        | Accessing mock-smtp UI over wireguard                                                                                                                                                                                                             |

#### Certificate requirements

As only secured https connections are allowed via nginx server will need below mentioned valid ssl certificates:

* One valid wildcard ssl certificate related to domain used for accessing Observation cluster, this needs to be stored inside the nginx server VM for Observation cluster. In above e.g.: \*.org.net is the similiar example domain.
* One valid wildcard ssl certificate related to domain used for accesing Mosip cluster, this needs to be stored inside the nginx server VM for mosip cluster. In above e.g.: \*.sandbox.xyz.net is the similiar example domain.

**Tools to be installed in Personel Computers for complete deployment**

* [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)- any client version above 1.19
* [helm](https://helm.sh/docs/intro/install/)- any client version above 3.0.0 and add below repos as well:

```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add mosip https://mosip.github.io/mosip-helm
```

* [Istioctl](https://istio.io/latest/docs/setup/getting-started/#download) : version: 1.15.0
* [rke](https://rancher.com/docs/rke/latest/en/installation/) : version: [1.3.10](https://github.com/rancher/rke/releases/tag/v1.3.10)
* \[Ansible]\(https://docs.ansible.com/ansible/latest/installation\_guide/intro\_installation.html: version > 2.12.4
*   Create a directory as mosip in your PC and:

    * clone k8’s infra repo with tag : 1.2.0.1-B2 (**whichever is the latest version**) inside mosip directory.\
      `git clone https://github.com/mosip/k8s-infra -b v1.2.0.1-B2`
    * clone mosip-infra with tag : 1.2.0.1-B2 (**whichever is the latest version**) inside mosip directory.\
      `git clone https://github.com/mosip/mosip-infra -b v1.2.0.1-B2`
    * Set below mentioned variables in bashrc

    ```
    export MOSIP_ROOT=<location of mosip directory>
    export K8_ROOT=$MOSIP_ROOT/k8s-infra
    export INFRA_ROOT=$MOSIP_ROOT/mosip-infra
    ```

    `source .bashrc`

    > Note: Above mentioned environment variables will be used throughout the installation to move between one directory to other to run install scripts.

### Installation

#### Wireguard

A Wireguard bastion host (Wireguard server) provides secure private channel to access MOSIP cluster. The host restricts public access, and enables access to only those clients who have their public key listed in Wireguard server. Wireguard listens on UDP port51820.

#### Setup Wireguard VM and wireguard bastion server

* Create a Wireguard server VM with above mentioned Hardware and Network requirements.
* Open ports and Install docker on Wireguard VM.
  * cd $K8\_ROOT/wireguard/
  *   create copy of `hosts.ini.sample` as `hosts.ini` and update the required details for wireguard VM\\

      `cp hosts.ini.sample hosts.ini`
  *   execute ports.yml to enable ports on VM level using ufw:

      `ansible-playbook -i hosts.ini ports.yaml`

> Note: 
>  *  Permission of the pem files to access nodes should have 400 permission. `sudo chmod 400 ~/.ssh/privkey.pem`
>  *  These ports are only needed to be opened for sharing packets over UDP.
>  *  Take necessary measure on firewall level so that the Wireguard server can be reachable on 51820/udp.

```
* execute docker.yml to install docker and add user to docker group:

    `ansible-playbook -i hosts.ini docker.yaml`
    
```

*   Setup Wireguard server

    * SSH to wireguard VM
    * Create directory for storing wireguard config files.\
      `mkdir -p wireguard/config`
    * Install and start wireguard server using docker as given below:

    ```
    sudo docker run -d \
    --name=wireguard \
    --cap-add=NET_ADMIN \
    --cap-add=SYS_MODULE \
    -e PUID=1000 \
    -e PGID=1000 \
    -e TZ=Asia/Calcutta \
    -e PEERS=30 \
    -p 51820:51820/udp \
    -v /home/ubuntu/wireguard/config:/config \
    -v /lib/modules:/lib/modules \
    --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
    --restart unless-stopped \
    ghcr.io/linuxserver/wireguard
    ```

> Note:

>  *  Increase the no. of peers above in case more than 30 wireguard client confs (-e PEERS=30) are needed.  
>  *  Change the directory to be mounted to wireguard docker as per need. All your wireguard confs will be generated in the mounted directory (`-v /home/ubuntu/wireguard/config:/config`).

#### Setup Wireguard Client in your PC

* Install Wireguard client in your PC.
* Assign `wireguard.conf`:
  * SSH to the wireguard server VM.
  * `cd /home/ubuntu/wireguard/config`
  *   assign one of the PR for yourself and use the same from the PC to connect to the server.

      * create `assigned.txt` file to assign the keep track of peer files allocated and update everytime some peer is allocated to someone.

      ```
      peer1 :   peername
      peer2 :   xyz
      ```

      * use `ls` cmd to see the list of peers.
      * get inside your selected peer directory, and add mentioned changes in `peer.conf`:
        * `cd peer1`
        * `nano peer1.conf`
          * Delete the DNS IP.
          * Update the allowed IP's to subnets CIDR ip . e.g. 10.10.20.0/23
        * Share the updated `peer.conf` with respective peer to connect to wireguard server from Personel PC.
* add `peer.conf` in your PC’s `/etc/wireguard` directory as `wg0.conf`.
* start the wireguard client and check the status:

```
sudo systemctl start wg-quick@wg0
sudo systemctl status wg-quick@wg0
```

* Once connected to wireguard, you should be now able to login using private IP’s.

## Observation K8s Cluster setup and configuration

**Observation K8s Cluster setup**

* Install all the required tools mentioned in pre-requisites for PC.
  * kubectl
  * helm
  * ansible
  * rke (version 1.3.10)
* Setup Observation Cluster node VM’s as per the hardware and network requirements as mentioned above.
* Setup passwordless SSH into the cluster nodes via pem keys. (Ignore if VM’s are accessible via pem’s).
    *  Generate keys on your PC
       `ssh-keygen -t rsa`
    *  Copy the keys to remote observation node VM’s
       `ssh-copy-id <remote-user>@<remote-ip>`
    *  SSH into the node to check password-less SSH
       `ssh -i ~/.ssh/<your private key> <remote-user>@<remote-ip>`
> Note:
> *  Make sure the permission for `privkey.pem` for ssh is set to 400.

* Run `env-check.yaml` to check if cluster nodes are fine and do not have known issues in it.
  * cd $K8\_ROOT/rancher/on-prem
  * create copy of `hosts.ini.sample` as `hosts.ini` and update the required details for Observation k8 cluster nodes.
    * `cp hosts.ini.sample hosts.ini`
    * `ansible-playbook -i hosts.ini env-check.yaml`
    * This ansible checks if localhost mapping is already present in /etc/hosts file in all cluster nodes, if not it adds the same.
* Open ports and install docker on Observation K8 Cluster node VM’s.
  * `cd $K8_ROOT/rancher/on-prem`
  * Ensure that `hosts.ini` is updated with nodal details.
  * Update vpc\_ip variable in `ports.yaml` with vpc CIDR ip to allow access only from machines inside same vpc.
  * Execute `ports.yml` to enable ports on VM level using ufw:
    * `ansible-playbook -i hosts.ini ports.yaml`
  * Disable swap in cluster nodes. (Ignore if swap is already disabled)
    * ansible-playbook -i hosts.ini swap.yaml
  * execute `docker.yml` to install docker and add user to docker group:
    * ansible-playbook -i hosts.ini docker.yaml
* Creating RKE Cluster Configuration file
  * `rke config`
  *   Command will prompt for nodal details related to cluster, provide inputs w.r.t below mentioned points:

      * `SSH Private Key Path` :
      * `Number of Hosts`:
      * `SSH Address of host` :
      * `SSH User of host` :
      *

      ```
      Is host (<node1-ip>) a Control Plane host (y/n)? [y]: y
      Is host (<node1-ip>) a Worker host (y/n)? [n]: y
      Is host (<node1-ip>) an etcd host (y/n)? [n]: y
      ```

      * Make all the nodes `Worker host` by default.
      * To create an HA cluster, specify more than one host with role `Control Plane` and `etcd host`.
  * `Network Plugin Type` : Continue with canal as default network plugin.
  * For rest of other configurations, opt the required or default value.
* As result of `rke config` command `cluster.yml` file will be generated inside same directory, update the below mentioned fields:
  *   `nano cluster.yml`

      * Remove the default Ingress install

      ```
      ingress:
      provider: none
      ```
  * Add the name of the kubernetes cluster
    * `cluster_name: sandbox-name`
* For production deplopyments edit the `cluster.yml`, according to this [RKE Cluster Hardening Guide](https://github.com/mosip/k8s-infra/blob/v1.2.0.1-B1/docs/rke-cluster-hardening.md).
*   Setup up the cluster:

    *   Once `cluster.yml` is ready, you can bring up the kubernetes cluster using simple command.

        * This command assumes the `cluster.yml` file is in the same directory as where you are running the command.
        * `rke up`
        *

        ````
        INFO[0000] Building Kubernetes cluster
        INFO[0000] [dialer] Setup tunnel for host [10.0.0.1]
        INFO[0000] [network] Deploying port listener containers   
        INFO[0000] [network] Pulling image [alpine:latest] on host [10.0.0.1]
        ...
        INFO[0101] Finished building Kubernetes cluster successfully
        ```
        * The last line should read `Finished building Kubernetes cluster` successfully to indicate that your cluster is ready to use.
        ````
    * As part of the Kubernetes creation process, a `kubeconfig` file has been created and written at `kube_config_cluster.yml`, which can be used to start interacting with your Kubernetes cluster.
    * Copy the kubeconfig files

    ```
    cp kube_config_cluster.yml $HOME/.kube/<cluster_name>_config
    chmod 400 $HOME/.kube/<cluster_name>_config
    ```

    * To access the cluster using `kubeconfig` file use any one of the below method:
      * `cp $HOME/.kube/<cluster_name>_config $HOME/.kube/config`\
        **Alternatively**
      * `export KUBECONFIG="$HOME/.kube/<cluster_name>_config`
    * Test cluster access:
      * `kubect get nodes`
        * Command will result in details of the nodes of the Observation cluster.
    * Save your files
      * Save a copy of the following files in a secure location, they are needed to maintain, troubleshoot and upgrade your cluster.
        * `cluster.yml`: The RKE cluster configuration file.
        * `kube_config_cluster.yml`: The [Kubeconfig file](https://rancher.com/docs/rke/latest/en/kubeconfig/) for the cluster, this file contains credentials for full access to the cluster.
        * `cluster.rkestate`: The [Kubernetes Cluster State file](https://rancher.com/docs/rke/latest/en/installation/#kubernetes-cluster-state), this file contains credentials for full access to the cluster.

## Observation K8s Cluster Ingress and Storage class setup

Once the rancher cluster is ready, we need ingress and storage class to be set for other applications to be installed.

* [Nginx Ingress Controller](https://kubernetes.github.io/ingress-nginx/deploy/): used for ingress in rancher cluster.

```
cd $K8_ROOT/rancher/rancher-ui
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo update
helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --create-namespace \
  -f rancher-values.yaml
```

this will install ingress in ingress-nginx namespace of rancher cluster.

* Storage class setup: [Longhorn](https://longhorn.io/) creates a storage class in the cluster for creating pv (persistence volume) and pvc (persistence volume claim).

Pre-requisites:

```
cd $K8_ROOT/longhorn
./pre_install.sh
```

Install Longhorn via helm

* `./install.sh`
*   Note: Values of below mentioned parametrs are set as by default Longhorn installation script:

    *   PV replica count is set to 1. Set the replicas for the storage class appropriately.

        ```
        persistence.defaultClassReplicaCount=1
        defaultSettings.defaultReplicaCount=1
        ```
    * Total available node CPU allocated to **each** `instance-manager` pod in the `longhorn-system` namespace.

    ```
    guaranteedEngineManagerCPU: 5
    guaranteedReplicaManagerCPU: 5   
    ```

    * The value "5" means 5% of the total available node CPU.
    * This value should be fine for sandbox and pilot but you may have to increase the default to "12" for production.
    * The value can be updated on Longhorn UI after installation.
* Access the Longhorn dashboard from Rancher UI once installed.
* Setup Backup : In case you want to bacup the pv data from longhorn to s3 periodically follow [instructions](https://github.com/mosip/k8s-infra/blob/main/docs/longhorn-backupstore-and-tests.md). (Optional, ignore if not required)

### Setting up nginx server for Observation K8s Cluster

* For Nginx server setup we need ssl certificate, add the same into Nginx server.
*   Incase valid ssl certificate is not there generate one using letsencrypt:

    * SSH into the nginx server
    * Install Pre-requisites

    ```
    sudo apt update -y
    sudo apt-get install software-properties-common -y
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt-get update -y
    sudo apt-get install python3.8 -y
    sudo apt install letsencrypt -y
    sudo apt install certbot python3-certbot-nginx -y
    ```
*   Generate wildcard SSL certificates for your domain name.

    * `sudo certbot certonly --agree-tos --manual --preferred-challenges=dns -d *.org.net`
      * replace `org.net` with your domain.
      * The default challenge HTTP is changed to DNS challenge, as we require wildcard certificates.
      * Create a DNS record in your DNS service of type TXT with host `_acme-challenge.org.net`, with the string prompted by the script.
      * Wait for a few minutes for the above entry to get into effect.

    **Verify**:

    `host -t TXT _acme-challenge.org.net`

    * Press enter in the `certbot` prompt to proceed.
    * Certificates are created in `/etc/letsencrypt` on your machine.
    * Certificates created are valid for 3 months only.
* Wildcard SSL certificate [renewal](https://github.com/mosip/k8s-infra/blob/main/docs/wildcard-ssl-certs-letsencrypt.md#ssl-certificate-renewal). This will increase the validity of the certificate for next 3 months.
*   Clone [k8s-infra](https://github.com/mosip/k8s-infra)

    ```
    cd $K8_ROOT/rancher/on-prem/nginx
    sudo ./install.sh
    ```
* Provide below mentioned inputs as and when promted
  * Rancher nginx ip : internal ip of the nginx server VM.
  * SSL cert path : path of the ssl certificate to be used for ssl termination.
  * SSL key path : path of the ssl key to be used for ssl termination.
  * Cluster node ip's : ip’s of the rancher cluster node
*   Post installation check:

    * `sudo systemctl status nginx`
    * Steps to Uninstall nginx (in case required)

    `sudo apt purge nginx nginx-common`

    DNS mapping: Once nginx server is installed sucessfully, create DNS mapping for rancher cluster related domains as mentioned in DNS requirement section. (rancher.org.net, keycloak.org.net)

## Observation K8's Cluster Apps Installation

**Rancher UI**: Rancher provides full CRUD capability of creating and managing kubernetes cluster.

* Install rancher using Helm, update `hostname` in `rancher-values.yaml` and run the following command to install.

```
cd $K8_ROOT/rancher/rancher-ui
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo update
helm install rancher rancher-latest/rancher \
--namespace cattle-system \
--create-namespace \
-f rancher-values.yaml
```

*   Login:

    * Open [Rancher](https://rancher.org.net) page.
    * Get Bootstrap password using

    ```
    kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{ .data.bootstrapPassword|base64decode}}{{ "\n" }}'
    ```

    Assign a password. IMPORTANT: makes sure this password is securely saved and retrievable by Admin.
* [Keycloak](https://www.keycloak.org/): Keycloak is an OAuth 2.0 compliant Identity Access Management (IAM) system used to manage the access to Rancher for cluster controls.

```
cd $K8_ROOT/rancher/keycloak
./install.sh <iam.host.name>
```

`keycloak_client.json`: Used to create SAML client on Keycloak for Rancher integration.

## Keycloak - Rancher UI Integration

* Login as `admin` user in Keycloak and make sure an email id, and first name field is populated for admin user. This is important for Rancher authentication as given below.
* Enable authentication with Keycloak using the steps given [here](https://ranchermanager.docs.rancher.com/v2.6/how-to-guides/new-user-guides/authentication-permissions-and-global-configuration/authentication-config/configure-keycloak-saml).
* In Keycloak add another Mapper for the rancher client (in Master realm) with following fields:
  * Protocol: saml
  * Name: username
  * Mapper Type: User Property
  * Property: username
  * Friendly Name: username
  * SAML Attribute Name: username
  * SAML Attribute NameFormat: Basic
  * Specify the following mappings in Rancher's Authentication Keycloak form:
    * Display Name Field: givenName
    * User Name Field: email
    * UID Field: username
    * Entity ID Field: https://your-rancher-domain/v1-saml/keycloak/saml/metadata
    * Rancher API Host: https://your-rancher-domain
    * Groups Field: member

**RBAC** :

* For users in Keycloak assign roles in Rancher - **cluster** and **project** roles. Under `default` project add all the namespaces. Then, to a non-admin user you may provide Read-Only role (under projects).
* If you want to create custom roles, you can follow the steps given [here](https://github.com/mosip/k8s-infra/blob/main/docs/create-custom-role.md).
* Add a member to cluster/project in Rancher:
  * Give member name exactly as `username` in Keycloak
  * Assign appropriate role like Cluster Owner, Cluster Viewer etc.
  * You may create new role with fine grained acccess control.

**Certificates expiry**

In case you see certificate expiry message while adding users, on **local** cluster run these commands:

## MOSIP K8s Cluster setup

* Pre-requisites:
* Install all the required tools mentioned in Pre-requisites for PC.
  * kubectl
  * helm

```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add mosip https://mosip.github.io/mosip-helm
```

* ansible
* rke (version 1.3.10)
* Setup MOSIP K8 Cluster node VM’s as per the hardware and network requirements as mentioned above.
* Run `env-check.yaml` to check if cluster nodes are fine and dont have known issues in it.
  * cd $K8\_ROOT/rancher/on-prem
  * create copy of `hosts.ini.sample` as `hosts.ini` and update the required details for MOSIP k8 cluster nodes.
    * `cp hosts.ini.sample hosts.ini`
    * `ansible-playbook -i hosts.ini env-check.yaml`
    * This ansible checks if localhost mapping ia already present in `/etc/hosts` file in all cluster nodes, if not it adds the same.
* Setup passwordless ssh into the cluster nodes via pem keys. (Ignore if VM’s are accessible via pem’s).
  * Generate keys on your PC
    * `ssh-keygen -t rsa`
  * Copy the keys to remote rancher node VM’s:
    * `ssh-copy-id <remote-user>@<remote-ip>`
  * SSH into the node to check password-less SSH
    * `ssh -i ~/.ssh/<your private key> <remote-user>@<remote-ip>`
  * Rancher UI : (deployed in Rancher K8 cluster)
* Open ports and Install docker on MOSIP K8 Cluster node VM’s.
  * `cd $K8_ROOT/mosip/on-prem`
  * create copy of `hosts.ini.sample` as `hosts.ini` and update the required details for wireguard VM.
    * `cp hosts.ini.sample hosts.ini`
  * Update `vpc_ip` variable in `ports.yaml` with `vpc CIDR ip` to allow access only from machines inside same vpc.
  * execute `ports.yml` to enable ports on VM level using ufw:
    * `ansible-playbook -i hosts.ini ports.yaml`
  * Disable swap in cluster nodes. (Ignore if swap is already disabled)
    * ansible-playbook -i hosts.ini swap.yaml
  * execute `docker.yml` to install docker and add user to docker group:
    * ansible-playbook -i hosts.ini docker.yaml
* Creating RKE Cluster Configuration file
  * rke config
  *   Command will prompt for nodal details related to cluster, provide inputs w.r.t below mentioned points:

      * `SSH Private Key Path` :
      * `Number of Hosts`:
      * `SSH Address of host` :
      * `SSH User of host` :

      ```
      Is host (<node1-ip>) a Control Plane host (y/n)? [y]: y
      Is host (<node1-ip>) a Worker host (y/n)? [n]: y
      Is host (<node1-ip>) an etcd host (y/n)? [n]: y
      ```

      * Make all the nodes Worker `host` by default.
      * To create an HA cluster, specify more than one host with role `Control Plane` and `etcd host`.
  * `Network Plugin Type` : Continue with canal as default network plugin.
  * For rest for other configuration opt the required or default value.
*   As result of rke config command `cluster.ymlfile` will be generated inside same directory, update the below mentioned fields:

    * `nano cluster.yml`
    * Remove the default Ingress install

    ```
    ingress:
    provider: none
    ```

    * Add the name of the kubernetes cluster

    ```
    `cluster_name: sandbox-name`
    ```

    * For production deplopyments edit the `cluster.yml`, according to this [RKE Cluster Hardening Guide](https://github.com/mosip/k8s-infra/blob/v1.2.0.1-B1/docs/rke-cluster-hardening.md).
* Setup up the cluster:
  * Once `cluster.yml` is ready, you can bring up the kubernetes cluster using simple command.
    *   This command assumes the `cluster.yml` file is in the same directory as where you are running the command.

        * rke up

        ```
        INFO[0000] Building Kubernetes cluster
        INFO[0000] [dialer] Setup tunnel for host [10.0.0.1]
        INFO[0000] [network] Deploying port listener containers
        INFO[0000] [network] Pulling image [alpine:latest] on host [10.0.0.1]
        ...
        INFO[0101] Finished building Kubernetes cluster successfully
        ```
    * The last line should read `Finished building Kubernetes cluster successfully` to indicate that your cluster is ready to use.
    *   Copy the kubeconfig files

        ```
        cp kube_config_cluster.yml $HOME/.kube/<cluster_name>_config
        chmod 400 $HOME/.kube/<cluster_name>_config
        ```
  * To access the cluster using kubeconfig filr use any one of the below method:
  * `cp $HOME/.kube/<cluster_name>_config $HOME/.kube/config`

**Alternatively**

```
* `export KUBECONFIG="$HOME/.kube/<cluster_name>_config`
```

* Test cluster access:
  * `kubect get nodes`
  * Command will result in details of the nodes of the rancher cluster.
* Save Your files
  * Save a copy of the following files in a secure location, they are needed to maintain, troubleshoot and upgrade your cluster.:
    * `cluster.yml`: The RKE cluster configuration file.
    * `kube_config_cluster.yml`: The [Kubeconfig file](https://rke.docs.rancher.com/kubeconfig) for the cluster, this file contains credentials for full access to the cluster.
    * `cluster.rkestate`: The [Kubernetes Cluster State file](https://rke.docs.rancher.com/installation#kubernetes-cluster-state), this file contains credentials for full access to the cluster.

### MOSIP K8 Cluster Global configmap, Ingress and Storage Class setup

**Global configmap**: Global configmap contains the list of neccesary details to be used throughout the namespaces of the cluster for common details.

* `cd $K8_ROOT/mosip`
* Copy `global_configmap.yaml.sample` to `global_configmap.yaml`.
* Update the domain names in `global_configmap.yaml` and run.
* `kubectl apply -f global_configmap.yaml`
* [Istio](https://istio.io/) Ingress setup: It is a service mesh for the MOSIP K8 cluster which provides transparent layers on top of existing microservices along with powerful features enabling a uniform and more efficient way to secure, connect, and monitor services.
  * `cd $K8_ROOT/mosip/on-prem/istio`
  * `./install.sh`
  * This will bring up all the Istio components and the Ingress Gateways.
  * Check Ingress Gateway services:
    * `kubectl get svc -n istio-system`
      * `istio-ingressgateway`: external facing istio service.
      * `istio-ingressgateway-internal`: internal facing istio service.
      * `istiod`: Istio daemon for replicating the changes to all envoy filters.
*   Storage class setup: Longhorn creates a storage class in the cluster for creating pv (persistence volume) and pvc (persistence volume claim).

    * Pre-requisites:

    ```
    cd $K8_ROOT/longhorn
    ./pre_install.sh
    ```

    * Install Longhorn via helm
      * `./install.sh`
      *   Note: Values of below mentioned parameters are set as by default Longhorn installation script:

          * PV replica count is set to 1. Set the replicas for the storage class appropriately.

          ```
          persistence.defaultClassReplicaCount=1
          defaultSettings.defaultReplicaCount=1
          ```

          * Total available node CPU allocated to **each** `instance-manager` pod in the `longhorn-system` namespace.

          ```
          guaranteedEngineManagerCPU: 5
          guaranteedReplicaManagerCPU: 5   
          ```

          * The value "5" means 5% of the total available node CPU
          * This value should be fine for sandbox and pilot but you may have to increase the default to "12" for production.
          * The value can be updated on Longhorn UI after installation.

### Import MOSIP Cluster into Rancher UI

* Login as admin in Rancher console
* Select `Impor`t Existing for cluster addition.
* Select `Generic` as cluster type to add.
* Fill the `Cluster Name` field with unique cluster name and select `Create`.
* You will get the kubecl commands to be executed in the kubernetes cluster. Copy the command and execute from your PC (make sure your `kube-config` file is correctly set to MOSIP cluster).

```
e.g.:
kubectl apply -f https://rancher.e2e.mosip.net/v3/import/pdmkx6b4xxtpcd699gzwdtt5bckwf4ctdgr7xkmmtwg8dfjk4hmbpk_c-m-db8kcj4r.yaml
```

* Wait for few seconds after executing the command for the cluster to get verified.
* Your cluster is now added to the rancher management server.

### MOSIP K8 cluster Nginx server setup

* For Nginx server setup, we need ssl certificate, add the same into Nginx server.
* Incase valid ssl certificate is not there generate one using letsencrypt:
  * SSH into the nginx server
  *   Install Pre-requisites:

      ```
      sudo apt update -y
      sudo apt-get install software-properties-common -y
      sudo add-apt-repository ppa:deadsnakes/ppa
      sudo apt-get update -y
      sudo apt-get install python3.8 -y
      sudo apt install letsencrypt -y
      sudo apt install certbot python3-certbot-nginx -y
      ```
  * Generate wildcard SSL certificates for your domain name.
    * `sudo certbot certonly --agree-tos --manual --preferred-challenges=dns -d *.sandbox.mosip.net -d sandbox.mosip.net`
      * replace `sanbox.mosip.net` with your domain.
      * The default challenge HTTP is changed to DNS challenge, as we require wildcard certificates.
      * Create a DNS record in your DNS service of type TXT with host `_acme-challenge.sandbox.xyz.net`, with the string prompted by the script.
      * Wait for a few minutes for the above entry to get into effect.\
        \*\* Verify\*\*: `host -t TXT _acme-challenge.sandbox.mosip.net`
      * Press enter in the `certbot` prompt to proceed.
      * Certificates are created in `/etc/letsencrypt` on your machine.
      * Certificates created are valid for 3 months only.
  * `Wildcard SSL certificate` [renewal](https://github.com/mosip/k8s-infra/blob/main/docs/wildcard-ssl-certs-letsencrypt.md#ssl-certificate-renewal). This will increase the validity of the certificate for next 3 months.
*   Clone k8s-infra

    ```
    cd $K8_ROOT/mosip/on-prem/nginx
    sudo ./install.sh
    ```
* Provide below mentioned inputs as and when prompted
  * MOSIP nginx server internal ip
  * MOSIP nginx server public ip
  * Publically accessible domains (comma seperated with no whitespaces)
  * SSL cert path
  * SSL key path
  * Cluster node ip's (comma seperated no whitespace)
* Post installation check\\
  * `sudo systemctl status nginx`
  * Steps to uninstall nginx (incase it is required)\
    `sudo apt purge nginx nginx-common`
  * **DNS mapping**: Once nginx server is installed sucessfully, create DNS mapping for observation cluster related domains as mentioned in DNS requirement section.
*   Check Overall if nginx and istio wiring is set correctly

    * `Install httpbin`: This utility docker returns http headers received inside the cluster. You may use it for general debugging - to check ingress, headers etc.

    ```
    cd $K8_ROOT/utils/httpbin
    ./install.sh
    ```

    * To see what is reaching the httpbin (example, replace with your domain name):

    ```
    curl https://api.sandbox.xyz.net/httpbin/get?show_env=true
    curl https://api-internal.sandbox.xyz.net/httpbin/get?show_env=true
    ```

### Monitoring module deployment

* Prometheus and Grafana and Alertmanager tools are used for cluster monitoring.
* Select 'Monitoring' App from Rancher console -> `Apps & Marketplaces`.
*   In Helm options, open the YAML file and disable Nginx Ingress.

    ```
     ingressNginx:
     enabled: false
    ```
* Click on `Install`.

### Alerting setup

Alerting is part of cluster monitoring, where alert notifications are sent to the configured email or slack channel.

* Monitoring should be deployed which includes deployment of prometheus, grafana and alertmanager.
* Create [slack incoming webhook](https://api.slack.com/messaging/webhooks).
*   After setting slack incoming webhook update `slack_api_url` and `slack_channel_name` in `alertmanager.yml`.

    * `cd $K8_ROOT/monitoring/alerting/`
    * `nano alertmanager.yml`
    * Update:

    ```
    global:
    resolve_timeout: 5m
    slack_api_url: <YOUR-SLACK-API-URL>
    ...
    slack_configs:
    - channel: '<YOUR-CHANNEL-HERE>'
    send_resolved: true
    ```
* Update `Cluster_name` in `patch-cluster-name.yaml`.
* `cd $K8_ROOT/monitoring/alerting/`
* `nano patch-cluster-name.yaml`
* Update:

```
spec:
externalLabels:
cluster: <YOUR-CLUSTER-NAME-HERE>
```

* Install Default alerts along some of the defined custom alerts:

```
cd $K8_ROOT/monitoring/alerting/
./install.sh
```

* Alerting is installed.

### Logging module setup and installation

MOSIP uses [Rancher Fluentd](https://ranchermanager.docs.rancher.com/v2.0-v2.4/explanations/integrations-in-rancher/cluster-logging/fluentd) and elasticsearch to collect logs from all services and reflect the same in Kibana Dashboard.

* Install Rancher FluentD system : for screpping logs outs of all the microservices from MOSIP k8 cluster.
  * Install Logging from Apps and marketplace within the Rancher UI.
  * Select Chart Version `100.1.3+up3.17.7` from Rancher console -> Apps & Marketplaces.
* Configure Rancher FluentD
  * Create `clusteroutput`
    * `kubectl apply -f clusteroutput-elasticsearch.yaml`
  * Start `clusterFlow`
    * `kubectl apply -f clusterflow-elasticsearch.yaml`
  *   Install elasticsearch, kibana and Istio addons\\

      ```
      cd $K8_ROOT/logging
      ./intall.sh
      ```
  * set `min_age` in `elasticsearch-ilm-script.sh` and execute the same.
  *   `min_age` : is the minimum no. of days for which indices will be stored in elasticsearch.

      ```
       cd $K8_ROOT/logging

      ./elasticsearch-ilm-script.sh
      ```
  * MOSIP provides set of Kibana Dashboards for checking logs and throughputs.
    * Brief description of these dashboards are as follows:
      * [01-logstash.ndjson](https://github.com/mosip/k8s-infra/blob/main/logging/dashboards/01-logstash.ndjson) contains the logstash _Index_ Pattern required by the rest of the dashboards.
      * [02-error-only-logs.ndjson](https://github.com/mosip/k8s-infra/blob/main/logging/dashboards/03-service-logs.ndjson) contains a Search dashboard which shows only the error logs of the services, called `MOSIP Error Logs` dashboard.
      * [03-service-logs.ndjson](https://github.com/mosip/k8s-infra/blob/main/logging/dashboards/03-service-logs.ndjson) contains a Search dashboard which show all logs of a particular service, called MOSIP Service Logs dashboard.
      * [04-insight.ndjson](https://github.com/mosip/k8s-infra/blob/main/logging/dashboards/04-insight.ndjson) contains dashboards which show insights into MOSIP processes, like the number of UINs generated (total and per hr), the number of Biometric deduplications processed, number of packets uploaded etc, called `MOSIP Insight` dashboard.
      * [05-response-time.ndjson](on-prem-installation-guidelines.md) contains dashboards which show how quickly different MOSIP Services are responding to different APIs, over time, called `Response Time` dashboard.
* Import dashboards:
  * `cd K8_ROOT/logging/dashboard`
  * `./load_kibana_dashboards.sh ./dashboards <cluster-kube-config-file>`
* View dashboards

Open kibana dashboard from `https://kibana.sandbox.xyz.net`.

Kibana --> Menu (on top left) --> Dashboard --> Select the dashboard.

### MOSIP External Dependencies setup

External Dependencies are set of external requirements that are needed for functioning of MOSIP’s core services like DB, Object Store, HSM etc.

```
cd $INFRA_ROOT/deployment/v3/external/all
./install-all.sh
```

Click [here](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/mosip-external-dependencies) to check the detailed installation instructions of all the external components.

### MOSIP Modules Deployment

Now that all the Kubernetes cluster and external dependencies are already installed, will continue with MOSIP service deployment.

```
cd $INFRA_ROOT/deployment/v3/mosip/all
./install-all.sh
```

Check detailed [MOSIP Modules Deployment](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/mosip-modules-deployment) installation steps.


