# Deploy

## Inji Deployment Guide

## Before you begin

You can choose to deploy entire Inji Stack or implement one of the following as you need it.

* Inji Certify
* Inji Verify
* Inji Wallet

How is this guide organized?

This Installation Guide is structured as below:

1. System Requirements
2. Deploy Prerequisites
3. Deploy Inji ....

### Architecture \[TODO]

Architecture Diagram to be updated.

### Prerequisites

#### Tools and utilities

* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
* [Rancher](../rancher/).
* Command line utilities:
  * kubectl
  * helm
  * rke (rke version: v1.3.10)
  * istioctl (istioctl version: v1.15.0)
*   Helm repos:

    ```sh
    helm repo add bitnami https://charts.bitnami.com/bitnami
    helm repo add mosip https://mosip.github.io/mosip-helm

    ```

#### System Requirements

Ensure all required hardware and software dependencies are prepared before proceeding with the installation.

* Hardware, network, certificate requirements

**Hardware, network and certificate requirements**

* Virtual Machines (VMs) can use any operating system as per convenience.
* For this installation guide, Ubuntu OS is referenced throughout.

| Sl no. | Purpose                                                                        | vCPU's | RAM  | Storage (HDD) | no. of VM's | HA                                                  |
| ------ | ------------------------------------------------------------------------------ | ------ | ---- | ------------- | ----------- | --------------------------------------------------- |
| 1.     | Wireguard Bastion Host                                                         | 2      | 4 GB | 8 GB          | 1           | (ensure to setup active-passive)                    |
| 2.     | Observation Cluster nodes                                                      | 2      | 8 GB | 32 GB         | 2           | 2                                                   |
| 3.     | Observation Nginx server (use Loadbalancer if required)                        | 2      | 4 GB | 16 GB         | 1           | Nginx+                                              |
| 4.     | Inji Stack Cluster nodes along with Nginx server, Use Loadbalancer if required | 8      | 4 GB | 32 GB         | 3           | Allocate etcd, control plane and worker accordingly |

**Network Requirements:**

* All the VM's should be able to communicate with each other.
* Need stable Intra network connectivity between these VM's.
* All the VM's should have stable internet connectivity for docker image download (in case of local setup ensure to have a locally accessible docker registry).
* Server Interface requirement as mentioned in below table:

| Sl no. | Purpose                  | Network Interfaces                                                                                                                                                                                                                                                                                       |
| ------ | ------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1.     | Wireguard Bastion Host   | <p><em>One Private interface</em>: that is on the same network as all the rest of nodes (e.g.: inside local NAT Network).<br><br><em>One public interface</em>: Either has a direct public IP, or a firewall NAT (global address) rule that forwards traffic on 51820/udp port to this interface IP.</p> |
| 2.     | K8 Cluster nodes         | One internal interface: with internet access and that is on the same network as all the rest of nodes (e.g.: inside local NAT Network).                                                                                                                                                                  |
| 3.     | Observation Nginx server | One internal interface: with internet access and that is on the same network as all the rest of nodes (e.g.: inside local NAT Network).                                                                                                                                                                  |
| 4.     | Inji Nginx server        | <p><em>One internal interface</em>: that is on the same network as all the rest of nodes (e.g.: inside local NAT Network).<br><br><em>One public interface</em>: Either has a direct public IP, or a firewall NAT (global address) rule that forwards traffic on 443/tcp port to this interface IP.</p>  |

**DNS requirements (TODO)**

|     | Domain Name                  | Mapping details                                                     | Purpose                                                                                                                                                                                                |
| --- | ---------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 1.  | rancher.xyz.net              | Private IP of Nginx server or load balancer for Observation cluster | Rancher dashboard to monitor and manage the kubernetes cluster.                                                                                                                                        |
| 2.  | keycloak.xyz.net             | Private IP of Nginx server for Observation cluster                  | Administrative IAM tool (keycloak). This is for the kubernetes administration.                                                                                                                         |
| 3.  | sandbox.xyx.net              | Private IP of Nginx server for MOSIP cluster                        | Index page for links to different dashboards of MOSIP env. (This is just for reference, please do not expose this page in a real production or UAT environment)                                        |
| 4.  | api-internal.sandbox.xyz.net | Private IP of Nginx server for MOSIP cluster                        | Internal API’s are exposed through this domain. They are accessible privately over wireguard channel                                                                                                   |
| 5.  | api.sandbox.xyx.net          | Public IP of Nginx server for MOSIP cluster                         | All the API’s that are publically usable are exposed using this domain.                                                                                                                                |
| 6.  | iam.sandbox.xyz.net          | Private IP of Nginx server for MOSIP cluster                        | MOSIP uses an OpenID Connect server to limit and manage access across all the services. The default installation comes with Keycloak. This domain is used to access the keycloak server over wireguard |
| 7.  | postgres.sandbox.xyz.net     | Private IP of Nginx server for MOSIP cluster                        | This domain points to the postgres server. You can connect to postgres via port forwarding over wireguard                                                                                              |
| 8.  | onboarder.sandbox.xyz.net    | Private IP of Nginx server for MOSIP cluster                        | Accessing reports of MOSIP partner onboarding over wireguard                                                                                                                                           |
| 9.  | Web.sandbox.xyz.net          | Public IP of Nginx server for MOSIP cluster                         | Accessing Inji Web portal publically                                                                                                                                                                   |
| 10. | certify.sandbox.xyz.net      | Public IP of Nginx server for MOSIP cluster                         | Accessing Inji Certify portal publically                                                                                                                                                               |
| 11. | verify.sandbox.xyz.net       | Public IP of Nginx server for MOSIP cluster                         | Accessing Inji Verify portal publically                                                                                                                                                                |

**Certificate requirements:**

As only secured https connections are allowed via nginx server will need below mentioned valid ssl certificates:

1. Wildcard SSL Certificate for the Observation Cluster:
   * A valid wildcard SSL certificate for the domain used to access the Observation cluster.
   * This certificate must be stored inside the Nginx server VM for the Observation cluster.
   * For example, a domain like \*.org.net could serve as the corresponding example.
2. Wildcard SSL Certificate for the Inji K8s Cluster:
   * A valid wildcard SSL certificate for the domain used to access the inji Kubernetes cluster.
   * This certificate must be stored inside the Nginx server VM for the inji cluster.
   * For example, a domain like \*.sandbox.xyz.net could serve as the corresponding example.

#### Tools to be installed on Personal Computers (Tools for Secure Access)

Follow the steps mentioned [here](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem#prerequisites) to install the required tools on your personal computer to create and manage the k8 cluster using RKE1.

**Wireguard**

Secure access solution that establishes private channels to Observation and inji clusters.

_If you already have a Wireguard bastion host then you may skip this step._

* A Wireguard bastion host (Wireguard server) provides a secure private channel to access the Observation and inji cluster.
* The host restricts public access and enables access to only those clients who have their public key listed in the Wireguard server.
* Wireguard listens on UDP port51820.

**Setup Wireguard Bastion server:**

1. Create a Wireguard server VM with above mentioned Hardware and Network requirements.
2. Open ports and Install docker on Wireguard VM.

* create a copy of `hosts.ini.sample` as `hosts.ini` and update the required details for wireguard VM `cp hosts.ini.sample hosts.ini`
* execute ports.yml to enable ports on VM level using ufw: `ansible-playbook -i hosts.ini ports.yaml`

**Note**:

* Permission of the pem files to access nodes should have 400 permission. `sudo chmod 400 ~/.ssh/privkey.pem`
* These ports are only needed to be opened for sharing packets over UDP.
* Take necessary measure on firewall level so that the Wireguard server can be reachable on 51820/udp publically.
* Make sure to clone the [k8s-infra](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem#prerequisites) github repo for required scripts in above steps and perform the steps from linked directory.
* If you already have Wireguard server for the VPC used you can skip the setup Wireguard Bastion server section.

3. execute docker.yml to install docker and add user to docker group:

```yaml
    ansible-playbook -i hosts.ini docker.yaml
```

4.  Setup Wireguard server

    * SSH to wireguard VM
    * Create directory for storing wireguard config files.

    ```sh
       mkdir -p wireguard/config
    ```

    * Install and start wireguard server using docker as given below:

    ```sh
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

Note:

* Increase the no. of peers above in case more than 30 wireguard client confs (-e PEERS=30) are needed.
* Change the directory to be mounted to wireguard docker as per need. All your wireguard confs will be generated in the mounted directory (`-v /home/ubuntu/wireguard/config:/config`).

**Setup Wireguard Client on your PC and follow the below steps:**

1. Install [Wireguard client](https://www.wireguard.com/install/) on your PC.
2. Assign `wireguard.conf`:

* SSH to the wireguard server VM.
* `cd /home/ubuntu/wireguard/config`
* Assign one of the PR for yourself and use the same from the PC to connect to the server.
*   Create `assigned.txt` file to assign the keep track of peer files allocated and update everytime some peer is allocated to someone.

    ```sh
    peer1 :   peername
    peer2 :   xyz
    ```
* Use `ls` cmd to see the list of peers.
* Get inside your selected peer directory, and add mentioned changes in `peer.conf`:
  * `cd peer1`
  * `nano peer1.conf`
    * Delete the DNS IP.
    * Update the allowed IP's to subnets CIDR ip . e.g. 10.10.20.0/23
* Share the updated `peer.conf` with respective peer to connect to wireguard server from Personel PC.
* Add `peer.conf` in your PC’s `/etc/wireguard` directory as `wg0.conf`.

3. Start the wireguard client and check the status:

```sh
sudo systemctl start wg-quick@wg0
sudo systemctl status wg-quick@wg0
```

4. Once connected to wireguard, you should be now able to login using private IP’s.

#### Observation cluster setup and configuration

The observation cluster is a Kubernetes cluster used for monitoring and managing the overall infrastructure. It includes tools like Rancher for cluster management, Keycloak for IAM, and other monitoring and logging tools. Setting it up ensures that the infrastructure is properly monitored, managed, and secured.

#### Observation K8s Cluster setup:

1. Install all the required tools mentioned in pre-requisites for the PC.

* [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl).
* [helm](https://helm.sh/docs/intro/install/).
* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
* rke (version 1.3.10)
* istioctl (version v1.15.0)

2. Setup Observation Cluster node VM’s as per the hardware and network requirements as mentioned above.
3. Setup passwordless SSH into the cluster nodes via pem keys. (Ignore if VM’s are accessible via pem’s).
   * Generate keys on your PC `ssh-keygen -t rsa`
   * Copy the keys to remote observation node VM’s `ssh-copy-id <remote-user>@<remote-ip>`
   * SSH into the node to check password-less SSH `ssh -i ~/.ssh/<your private key> <remote-user>@<remote-ip>`

**Note**:

* Make sure the permission for `privkey.pem` for ssh is set to 400.
* Clone [`k8s-infra`](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/rancher/on-prem) and move to required direcyory as per hyperlink.

4. Setup Observation cluster following [steps](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#observation-k8s-cluster-setup-and-configuration).
5. Once cluster setup is completed, setup k8's cluster ingress and storage class following [steps](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#observation-k8s-cluster-ingress-and-storage-class-setup).
6. Once Observation K8 cluster is created and configured setup nginx server for same using [steps](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#setting-up-nginx-server-for-observation-k8s-cluster).
7. Once Nginx server for observation plane is done, continue with [installation of required apps:](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#observation-k8s-cluster-apps-installation).

* Install Rancher UI.

## Deploy Inji

### Deployment Repos

#### Inji K8 Cluster setup:

1. [k8s-infra](https://github.com/mosip/k8s-infra/tree/v1.2.0.1) : contains the scripts to install and configure Kubernetes cluster with required monitoring, logging and alerting tools.
2. Clone the Kubernetes Infrastructure Repository:

make sure to use the released tag. Specifically v1.2.0.2.

```sh
git clone -b v1.2.0.2 https://github.com/mosip/k8s-infra.git
cd k8s-infra/mosip/onprem
```

3. Create copy of hosts.ini.sample as hosts.ini. Update the IP addresses.
4.
   5. Open the ports for the nodes: Execute [`ports.yml`](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem#ports) to open all the required ports.
5.
   6. Docker installation: Install [Docker](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem#docker) on all the required VM's.
6. Create [RKE1 K8](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem#rke-cluster-setup) cluster for Inji services hosting.
7. Apply global config map: https://github.com/mosip/k8s-infra/blob/v1.2.0.2/mosip/global\_configmap.yaml.sample
8. [Import](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem#register-the-cluster-with-rancher) newly created K8 cluster to Rancher UI.

**Nginx for Inji K8 Cluster:**

1. Setup [Nginx](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem/nginx) for exposing services from newly created Inji K8 cluster.

**Inji K8 Cluster Configuration:**

* Setup [NFS](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/nfs#nfs-setup) for persistence in k8 cluster as well as standalone VM (Nginx VM).
* Setup [Monitoring](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/monitoring#cluster-monitoring) for K8 cluster Monitoring.
* Setup [Logging](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/logging#logging) for K8 cluster.
* Setup [Istio](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem/istio#istio) and kiali.

## Deploying Inji

* Postgres installation: https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/external/postgres
* conf-secret installation: https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/mosip/conf-secrets
* config-server installation: https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/mosip/config-server
* artifactory installation: https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/mosip/artifactory
* NOTE: When installing Datashare,and Mimoto , ensure that the active_profile_env parameter in the config-map of the config-server-share is correctly set. Use the following environment profiles based on the respective services: default,inji-default,standalone
* datashare installation: https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/mosip/datashare
* mimoto installation: https://github.com/mosip/mimoto/tree/develop/helm/mimoto
* Inji web and datashare installation: https://github.com/mosip/inji-web/tree/v0.10.0/helm/inji-web
* Inji Verify installation: https://github.com/mosip/inji-verify/tree/v0.10.0
* NOTE: When installing certify , ensure that the active_profile_env parameter in the config-map of the config-server-share is correctly set. Use the following environment profiles based on your requirment. For example : default,mock-identity
* Inji Certify installation: https://github.com/mosip/inji-certify/tree/v0.9.1
