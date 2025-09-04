# Inji Deployment Guide - Revised Outline

# Overview

## What is Inji?
Inji is a digital credentialing stack that provides a way to share tamper-proof, instantly verifiable data which is cryptographically signed by a trusted issuer, and users can store them securely on their devices or browsers and share them when needed.



## What to expect from this guide and how is this guide organized?
This guide is structured to provide a step-by-step approach for deploying the Inji stack, covering all essential aspects from prerequisites to troubleshooting:

### Heading-3

1. **Overview**: Introduction to Inji, its modules, deployment scenarios, required skillsets, architecture, deployment order, key considerations, dependencies, and supported environments.
2. **Prerequisites**: Details on hardware, infrastructure, and software requirements, including tools, system specifications, and initial setup steps.
3. **Base Infrastructure Setup**: Instructions for setting up Kubernetes clusters, NGINX, cluster configuration, and optional observation clusters.
4. **Core Infra setup and configurations**: This section covers the installation and configuration of essential infrastructure components required for the Inji stack, including configmaps, databases, object storage, secrets management, configuration server, and artifactory.
5. **Inji Stack Deployment**: Guidance on configuring and deploying core Inji components, including configuration management and object storage. Stepwise deployment instructions for Inji Certify, Mimoto, Web UI, and Verify modules.
6. **Troubleshooting**: Common issues and solutions encountered during deployment.

Each section references detailed steps and external resources where applicable, ensuring a comprehensive and actionable deployment process.

### Typical Deployment Scenarios - [sanchi singh]

#### Dependencies on MOSIP Modules (eSignet) - [Deployment Scenario consideration - With and Without eSignet - Configuration changes in Inji Certify and Wallet to support ] - Discuss again with - [varaniya]





## Considerations


### Basic Skillsets Required

To successfully deploy and manage the Inji stack, the following skillsets are recommended:

- **Kubernetes Administration**: Understanding of Kubernetes concepts, cluster setup, resource management, and troubleshooting.
- **Linux System Administration**: Proficiency in Linux command-line operations, user and permission management, and basic networking.
- **Containerization**: Experience with Docker or similar container technologies for building and managing service containers.
- **Helm**: Familiarity with Helm for managing Kubernetes manifests and deployments.
- **Networking Fundamentals**: Knowledge of firewalls, load balancers, DNS, and secure network configuration.
- **Database Management**: Basic skills in managing PostgreSQL or similar databases, including initialization and schema setup.
- **Configuration Management**: Ability to manage application configuration files, secrets, and certificates securely.
- **Monitoring and Logging**: Understanding of logging and monitoring tools to observe system health and troubleshoot issues.
- **Security Best Practices**: Awareness of secure credential handling, certificate management, and access control.
- **Scripting**: Basic scripting skills (e.g., Bash, Python) for automation and operational tasks.
- **Familiarity with CI/CD Pipelines**: Understanding of continuous integration and deployment processes is a plus.


### Key Infrastructure Notes

* Inji modules are deployed as microservices in a Kubernetes cluster.
* Wireguard is used as a trust network extension to access the admin, control, and observation panes.
* Inji uses Nginx server for:
  * SSL termination
  * Reverse Proxy
  * CDN/Cache management
  * Load balancing

* Kubernetes cluster is administered using the Rancher and rke tools.

  * We have two Kubernetes clusters:

    * **Observation cluster** - This cluster is part of the observation plane and assists with administrative tasks. By design, this is kept independent from the actual cluster as a good security practice and to ensure clear segregation of roles and responsibilities. As a best practice, this cluster or its services should be internal and should never be exposed to the external world.

    * Rancher is used for managing the Inji cluster.

    * Keycloak in this cluster is used to manage user access and rights for the observation plane.
      * It is recommended to configure log monitoring and network monitoring in this cluster.

      * In case you have an internal container registry, then it should run here.

  * **Inji cluster** - This cluster runs all the Inji components and certain third-party components like the kafka, keycloak etc.

  * Inji External Components

  * Inji Services


## High-Level Architecture of Inji [Keshav  Singh]

<figure><img src="../../.gitbook/assets/iww-deployment-diagram.png" alt=""><figcaption><p>Inji Web Deployment Architecture</p></figcaption></figure>

## Deployment Order

The recommended order for deploying the Inji stack ensures that dependencies are met and each component functions as intended. Follow this sequence for a smooth deployment:

[A flow diagram]

## OS and Deployment Environment

### Supported Operating Systems (Local Machine)

The Inji stack can be deployed with the following operating systems, however for this guide we have considered a linux machine with Ubuntu 22.04 LTS.

- **Linux** (Ubuntu 22.04 LTS - recommended for production deployments)
- **Windows**
- **macOS (OSX)**

> **Note:** Most deployment scripts and tools are tested primarily on Linux. For Windows and macOS, ensure compatibility of required tools (e.g., Docker, Kubernetes CLI, Helm) and consider using WSL (Windows Subsystem for Linux) or virtualization where necessary.

### Supported Deployment Environments (Server Environment)
(**On-prem**, Cloud, Hybrid), For this guide we have considered a On-prem deployment [Ubuntu Server - 22.04 LTS].
Note: If your are going for large scale / security concern - go with On Prem , if evanzelasing - Go with Cloud








# Prerequisites - (Base Infrastructure) 

Before installing any Inji Stack module, ensure that the following common prerequisites are met. These requirements apply to all modules and must be fulfilled to guarantee a smooth and successful deployment process.

## Overview

* **Hardware and Infrastructure**: Provision virtual machines or servers as per the recommended specifications for CPU, memory, storage, and network connectivity.
* **Operating System**: Use a supported OS (preferably Linux) with all necessary system updates applied.
* **Network Configuration**: Ensure stable internal network connectivity between all nodes, and configure required firewall rules and DNS entries.
* **SSL Certificates**: Obtain and install valid SSL certificates for all relevant domains and subdomains.
* **Required Tools**: Install essential tools such as Docker, kubectl, Helm, Ansible, rke, and istioctl on your local machine and relevant servers.
* **Access and Permissions**: Set up passwordless SSH access to all cluster nodes and ensure correct permissions for key files.
* **Container Registry**: If using a private container registry, ensure it is accessible from all nodes.
* **Wireguard Setup**: Configure Wireguard for secure access to the clusters, if required.
* **Configuration Files**: Prepare and update configuration files (such as `hosts.ini`, `values.yaml`, and config maps) with environment-specific details.

> **Note:** Review the detailed hardware, network, and software requirements in the sections above before proceeding with the installation steps for any Inji Stack module.



## Server Environment

## Tools and utilities

* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
* [Rancher](../../inji-wallet/inji-web/rancher/).
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



## System Requirements (Server)

Ensure all required hardware and software dependencies are prepared before proceeding with the installation.

### Hardware, network and certificate requirements

#### Hardware Requirements

* Virtual Machines (VMs) can use any operating system as per convenience.
* For this installation guide, Ubuntu OS is referenced throughout.

| Sl no. | Purpose                                                                        | vCPU's | RAM   | Storage (HDD) | no. of VM's | HA                                                  |
| ------ | ------------------------------------------------------------------------------ | ------ | ----- | ------------- | ----------- | --------------------------------------------------- |
| 1.     | Wireguard Bastion Host                                                         | 2      | 4 GB  | 8 GB          | 1           | (ensure to setup active-passive)                    |
| 2.     | Observation Cluster nodes                                                      | 2      | 8 GB  | 32 GB         | 2           | 2                                                   |
| 3.     | Observation Nginx server (use Loadbalancer if required)                        | 2      | 4 GB  | 16 GB         | 1           | Nginx+                                              |
| 4.     | Inji Stack Cluster nodes along with Nginx server, Use Loadbalancer if required | 8      | 32 GB | 64 GB         | 3           | Allocate etcd, control plane and worker accordingly |


#### Network Requirements

* All the VM's should be able to communicate with each other.
* Need stable Intra network connectivity between these VM's.
* All the VM's should have stable internet connectivity for docker image download (in case of local setup ensure to have a locally accessible docker registry).
* Server Interface requirement as mentioned in below table:

| Sl no. | Purpose                   | Network Interfaces                                                                                                                                                                                                                      |
|--------|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1.     | Wireguard Bastion Host    | **Private interface:** On the same internal network as all other nodes (e.g., local NAT network).<br>**Public interface:** Either a direct public IP or a firewall/NAT rule forwarding UDP port 51820 to this interface's IP address. |
| 2.     | K8 Cluster nodes          | **Internal interface:** On the same internal network as all other nodes, with internet access.                                                                                                                                        |
| 3.     | Observation Nginx server  | **Internal interface:** On the same internal network as all other nodes, with internet access.                                                                                                                                        |
| 4.     | Inji Nginx server         | **Internal interface:** On the same internal network as all other nodes.<br>**Public interface:** Either a direct public IP or a firewall/NAT rule forwarding TCP port 443 to this interface's IP address.                           |


#### DNS requirements \[TODO]

### DNS Requirements

Below is a sample mapping of domain names to their respective IP addresses and purposes for a typical Inji/MOSIP deployment. Update these as per your environment.

| Sl No. | Domain Name                     | Mapping Details                                         | Purpose                                                                                   |
|--------|---------------------------------|--------------------------------------------------------|-------------------------------------------------------------------------------------------|
| 1.     | rancher.xyz.net                 | Private IP of Nginx server or load balancer (Observation cluster) | Rancher dashboard for monitoring and managing the Kubernetes cluster.                     |
| 2.     | keycloak.xyz.net                | Private IP of Nginx server (Observation cluster)        | Administrative IAM tool (Keycloak) for Kubernetes administration.                         |
| 3.     | sandbox.xyz.net                 | Private IP of Nginx server (MOSIP cluster)              | Index page for links to MOSIP environment dashboards (not for production/UAT use).        |
| 4.     | api-internal.sandbox.xyz.net    | Private IP of Nginx server (MOSIP cluster)              | Internal APIs, accessible privately over Wireguard.                                       |
| 5.     | api.sandbox.xyz.net             | Public IP of Nginx server (MOSIP cluster)               | Publicly exposed APIs.                                                                    |
| 6.     | iam.sandbox.xyz.net             | Private IP of Nginx server (MOSIP cluster)              | OpenID Connect server (default: Keycloak) for service access, accessible over Wireguard.  |
| 7.     | postgres.sandbox.xyz.net        | Private IP of Nginx server (MOSIP cluster)              | Points to Postgres server, connect via port forwarding over Wireguard.                    |
| 8.     | onboarder.sandbox.xyz.net       | Private IP of Nginx server (MOSIP cluster)              | Access MOSIP partner onboarding reports over Wireguard.                                   |
| 9.     | injiweb.sandbox.xyz.net         | Public IP of Nginx server (MOSIP cluster)               | Public access to Inji Web portal.                                                         |
| 10.    | injicertify.sandbox.xyz.net     | Public IP of Nginx server (MOSIP cluster)               | Public access to Inji Certify portal.                                                     |
| 11.    | injiverify.sandbox.xyz.net      | Public IP of Nginx server (MOSIP cluster)               | Public access to Inji Verify portal.                                                      |

> **Note:** Ensure all DNS records are created and point to the correct IP addresses (public or private) as per your network design. For private domains, access is typically restricted via Wireguard VPN.

#### Certificate requirements

As only secured https connections are allowed via nginx server will need below mentioned valid ssl certificates:

1. Wildcard SSL Certificate for the Observation Cluster:
   * A valid wildcard SSL certificate for the domain used to access the Observation cluster.
   * This certificate must be stored inside the Nginx server VM for the Observation cluster.
   * For example, a domain like \*.org.net could serve as the corresponding example.
2. Wildcard SSL Certificate for the Inji K8s Cluster:
   * A valid wildcard SSL certificate for the domain used to access the inji Kubernetes cluster.
   * This certificate must be stored inside the Nginx server VM for the inji cluster.
   * For example, a domain like \*.sandbox.xyz.net could serve as the corresponding example.




### Tools to be installed on Personal Computers (Tools for Secure Access)

Follow the steps mentioned [here](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem#prerequisites) to install the required tools on your personal computer to create and manage the k8 cluster using RKE1.


## 1. Wireguard

* Wireguard bastian server provides secure private channel to access MOSIP cluster.
* Bastian server restricts public access, and enables access to only those clients who have their public key listed in Wireguard server.
* Bastion server listens on UDP port 51820.
* In case you already have VPN configured to access nodes privately please skip Wireguard installation and continue to use the same VPN.

**Setup Wireguard VM and wireguard bastion server**

* Create a Wireguard server VM with mentioned '[**Hardware and Network Requirements**'](pre-requisites.md).
*   Open required ports in the Bastian server VM.

    * `cd $K8_ROOT/wireguard/`
    * Create copy of `hosts.ini.sample` as `hosts.ini` and update the required details for wireguard VM
    * `cp hosts.ini.sample hosts.ini`

    > Note :
    >
    > * Remove `[Cluster]` complete section from copied `hosts.ini` file.
    > * Add below mentioned details:
    >   * ansible\_host : public IP of Wireguard Bastion server. eg. 100.10.20.56
    >   * ansible\_user : user to be used for installation. In this ref-impl we use Ubuntu user.
    >   * ansible\_ssh\_private\_key\_file : path to pem key for ssh to wireguard server. eg. `~/.ssh/wireguard-ssh.pem`![hosts.ini](../../../../_images/wireguard-hosts-ini.png)

    * Execute ports.yml to enable ports on VM level using ufw:`ansible-playbook -i hosts.ini ports.yaml`

> Note:
>
> * Permission of the pem files to access nodes should have 400 permission. `sudo chmod 400 ~/.ssh/privkey.pem`
> * These ports are only needed to be opened for sharing packets over UDP.
> * Take necessary measure on firewall level so that the Wireguard server can be reachable on 51820/udp.

* Install docker
  *   execute docker.yml to install docker and add user to docker group:

      ```
      ansible-playbook -i hosts.ini docker.yaml
      ```
* Setup Wireguard server
  * SSH to wireguard VM
  * `ssh -i <path to .pem> ubuntu@<Wireguard server public ip>`
  * Create directory for storing wireguard config files.`mkdir -p wireguard/config`
  *   Install and start wireguard server using docker as given below:

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
>
> * Increase the no. of peers above in case more than 30 wireguard client confs (-e PEERS=30) are needed.
> * Change the directory to be mounted to wireguard docker as per need. All your wireguard confs will be generated in the mounted directory (`-v /home/ubuntu/wireguard/config:/config`).

**Setup Wireguard Client in your PC**

* Install Wireguard client in your PC using [steps](https://www.wireguard.com/install/).
*   Assign `wireguard.conf`:

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
          *   `nano peer1.conf`

              * Delete the DNS IP.
              * Update the allowed IP's to subnets CIDR ip . e.g. 10.10.20.0/23

              > Note:
              >
              > * CIDR Range will be shared by the Infra provider.
              > * Make sure all the nodes are covered in the provided CIDR range. (nginx server, K8 cluster nodes for observation as well as mosip).
          * Share the updated `peer.conf` with respective peer to connect to wireguard server from Personel PC.
    * Add `peer.conf` in your PC’s `/etc/wireguard` directory as `wg0.conf`.
    * Start the wireguard client and check the status:

    ```
    sudo systemctl start wg-quick@wg0
    sudo systemctl status wg-quick@wg0
    ```


* Once connected to wireguard, you should be now able to access and login using private IP’s.












# Base Infrastructure Setup

## K8 Cluster setup**

Here you can find the kubernetes infrastructure repository [k8s-infra](https://github.com/mosip/k8s-infra/tree/v1.2.0.1) which contains the scripts to install and configure Kubernetes cluster with required monitoring, logging and alerting tools.

<!-- Observation: Repo readme talks in terms of MOSIP-->

* Pre-requisites:
  *   Install all the required tools mentioned in Pre-requisites for PC.

      * kubectl
      * helm

      ```
      helm repo add bitnami https://charts.bitnami.com/bitnami
      helm repo add mosip https://mosip.github.io/mosip-helm
      ```
  * ansible
  * rke (version 1.3.10)
  * Setup MOSIP K8 Cluster node VM’s as per '[**Hardware and Network Requirements**'](mosip/pre-requisites.md).
* Run `env-check-setup.yaml` to check if cluster nodes are fine and doesn't have known issues in it.
  * `cd $K8_ROOT/rancher/on-prem`
  *   Create copy of `hosts.ini.sample` as `hosts.ini` and update the required details for MOSIP k8 cluster nodes.

      * `cp hosts.ini.sample hosts.ini`

      > Note:
      >
      > * Ensure you are inside `on-prem` directory as mentioned above.
      > * ansible\_host : internal IP of nodes. eg. 100.10.20.56, 100.10.20.57 ...
      > * ansible\_user : user to be used for installation. In this ref-implementation we use Ubuntu user.
      > * ansible\_ssh\_private\_key\_file : path to pem key for ssh to wireguard server. eg. `~/.ssh/nodes-ssh.pem`![hosts.ini](../../../_images/nodes-hosts-ini.png)
  * `ansible-playbook -i hosts.ini env-check-setup.yaml`
  * This ansible checks if localhost mapping ia already present in `/etc/hosts` file in all cluster nodes, if not it adds the same.
* Setup passwordless ssh into the cluster nodes via pem keys. (Ignore if VM’s are accessible via pem’s).
  * Generate keys on your PC
    * `ssh-keygen -t rsa`
  * Copy the keys to remote rancher node VM’s:
    * `ssh-copy-id <remote-user>@<remote-ip>`
  * SSH into the node to check password-less SSH
    * `ssh -i ~/.ssh/<your private key> <remote-user>@<remote-ip>`
  * Rancher UI : (deployed in Observation K8 cluster)
* Open ports and Install docker on MOSIP K8 Cluster node VM’s.
  * `cd $K8_ROOT/mosip/on-prem`
  * create copy of `hosts.ini.sample` as `hosts.ini` and update the required details for wireguard VM.
    * `cp hosts.ini.sample hosts.ini`
  *   Update `vpc_ip` variable in `ports.yaml` with `vpc CIDR ip` to allow access only from machines inside same vpc.

      > Note:
      >
      > * CIDR Range will be shared by the Infra provider.
      > * Make sure all the nodes are covered in the provided CIDR range. (nginx server, K8 cluster nodes for observation as well as mosip).
  * execute `ports.yml` to enable ports on VM level using ufw:`ansible-playbook -i hosts.ini ports.yaml`
  *   Disable swap in cluster nodes. (Ignore if swap is already disabled)

      * `ansible-playbook -i hosts.ini swap.yaml`

      > Caution: Always verify swap status with `swapon --show` before running the playbook to avoid unnecessary operations.
  * execute `docker.yml` to install docker and add user to docker group:`ansible-playbook -i hosts.ini docker.yaml`
* Creating RKE Cluster Configuration file
  * `rke config`
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
* As result of rke config command `cluster.ymlfile` will be generated inside same directory, update the below mentioned fields:
  * `nano cluster.yml`
  *   Remove the default Ingress install

      ```
      ingress:
      provider: none
      ```
  *   Update the name of the kubernetes cluster in `cluster.yaml`

      ```
      `cluster_name: sandbox-name`
      ```
  * For production deplopyments edit the `cluster.yml`, according to this [RKE Cluster Hardening Guide](https://github.com/mosip/k8s-infra/blob/v1.2.0.1-B1/docs/rke-cluster-hardening.md).
*   Setup up the cluster:

    * Once `cluster.yml` is ready, you can bring up the kubernetes cluster using simple command.
      *   This command assumes the `cluster.yml` file is in the same directory as where you are running the command.

          * `rke up`

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
    * `cp $HOME/.kube/<cluster_name>_config $HOME/.kube/config`**Alternatively**

    ```
    * `export KUBECONFIG="$HOME/.kube/<cluster_name>_config`
    ```
* Test cluster access:
  * `kubectl get nodes`
  * Command will result in details of the nodes of the rancher cluster.
* Save Your files
  * Save a copy of the following files in a secure location, they are needed to maintain, troubleshoot and upgrade your cluster.:
    * `cluster.yml`: The RKE cluster configuration file.
    * `kube_config_cluster.yml`: The [Kubeconfig file](https://rke.docs.rancher.com/kubeconfig) for the cluster, this file contains credentials for full access to the cluster.
    * `cluster.rkestate`: The [Kubernetes Cluster State file](https://rke.docs.rancher.com/installation#kubernetes-cluster-state), this file contains credentials for full access to the cluster.

## 7. MOSIP K8 Cluster Global configmap, Ingress and Storage Class setup

### 7.a. Global configmap:

* Global configmap contains the list of neccesary details to be used throughout the namespaces of the cluster for common details.
* `cd $K8_ROOT/mosip`
* Copy `global_configmap.yaml.sample` to `global_configmap.yaml`.
  * `cp global_configmap.yaml.sample global_configmap.yaml`
* Update the domain names in `global_configmap.yaml` and run.
* `kubectl apply -f global_configmap.yaml`

### 7.b. [Istio](https://istio.io/) Ingress setup:

* It is a service mesh for the MOSIP K8 cluster which provides transparent layers on top of existing microservices along with powerful features enabling a uniform and more efficient way to secure, connect, and monitor services.
  * `cd $K8_ROOT/mosip/on-prem/istio`
  * `./install.sh`
  * This will bring up all the Istio components and the Ingress Gateways.
  *   Check Ingress Gateway services:

      * `kubectl get svc -n istio-system`

      > Note: Response should contain service names as mentioned below.
      >
      > * `istio-ingressgateway`: external facing istio service.
      > * `istio-ingressgateway-internal`: internal facing istio service.
      > * `istiod`: Istio daemon for replicating the changes to all envoy filters.

### 7.c. Storage classes

Multiple storage classes options are available for onprem K8's cluster. In this reference deployment will continue to use NFS as a storage class.

*   Move to nfs directory in your personel computer.

    ```
    cd $K8_ROOT/mosip/nfs
    ```
*   Create a copy of hosts.ini.sample as hosts.ini.

    ```
    cp hosts.ini.sample hosts.ini
    ```
*   Update the NFS machine details in `hosts.ini` file.

    > Note :
    >
    > * Add below mentioned details:
    > * ansible\_host : internal IP of NFS server. eg. 10.12.23.21
    > * ansible\_user : user to be used for installation, in this ref-impl we use Ubuntu user.
    > * ansible\_ssh\_private\_key\_file : path to pem key for ssh to wireguard server. eg. `~/.ssh/wireguard-ssh.pem` ![hosts.ini](../../../_images/nfs-hosts-ini.png).
*   Make sure Kubeconfig file is set correctly to point to required mosip cluster.

    ```
    kubectl config view
    ```

    Note:

    * Output should show the cluster name to confirm you are pointing to right kubernetes cluster.
    * If not pinting to right K8 cluster change the kubeconfig to connect to right K8 cluster.
*   Enable firewall with required ports:

    ```
    ansible-playbook -i ./hosts.ini nfs-ports.yaml
    ```
*   SSH to the nfs node:

    ```
    ssh -i ~/.ssh/nfs-ssh.pem ubuntu@<internal ip of nfs server>
    ```
*   Clone `k8s-infra` repo in nginx VM:

    ```
    git clone https://github.com/mosip/k8s-infra -b v1.2.0.1
    ```
*   Move to the nfs directory:

    ```
    cd /home/ubuntu/k8s-infra/mosip/nfs/
    ```
*   Execute script to install nfs server:

    ```
    sudo ./install-nfs-server.sh
    ```

    Note:

    > * Script prompts for below mentioned user inputs:
    >
    > ```
    > .....
    > Please Enter Environment Name: <envName>
    > .....
    > .....
    > .....
    > [ Export the NFS Share Directory ] 
    > exporting *:/srv/nfs/mosip/<envName>
    > NFS Server Path: /srv/nfs/mosip/<envName>
    > ```
    >
    > * envName: env name eg. dev/qa/uat...
*   Switch to your personel computer and excute below mentioned commands:

    ```
    cd $K8_ROOT/mosip/nfs/

    ./install-nfs-client-provisioner.sh
    ```

    Note:

    > * Script prompts for:
    > * NFS Server: NFS server ip for persistence.
    > * NFS Path : NFS path for storing the persisted data. eg. /srv/nfs/mosip/
* Post installation check:
  *   Check status of NFS Client Provisioner.

      ```
      kubectl -n nfs get deployment.apps/nfs-client-provisioner 
      ```
  *   Check status of nfs-client storage class.

      ```
       kubectl get storageclass
       NAME                 PROVISIONER                            RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
       longhorn (default)   driver.longhorn.io                     Delete          Immediate           true                   57d
       nfs-client           cluster.local/nfs-client-provisioner   Delete          Immediate           true                   40s
      ```

## 8. Import MOSIP Cluster into Rancher UI

* Login as admin in Rancher console
* Select `Import` Existing for cluster addition.
* Select `Generic` as cluster type to add.
* Fill the `Cluster Name` field with unique cluster name and select `Create`.
* You will get the kubectl commands to be executed in the kubernetes cluster. Copy the command and execute from your PC (make sure your `kube-config` file is correctly set to MOSIP cluster).

```
e.g.:
kubectl apply -f https://rancher.e2e.mosip.net/v3/import/pdmkx6b4xxtpcd699gzwdtt5bckwf4ctdgr7xkmmtwg8dfjk4hmbpk_c-m-db8kcj4r.yaml
```

* Wait for few seconds after executing the command for the cluster to get verified.
* Your cluster is now added to the rancher management server.

## 9. MOSIP K8 cluster Nginx server setup

### 9.a. SSL certificates creation

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
  * `Wildcard SSL certificate` [renewal](https://github.com/mosip/k8s-infra/blob/v1.2.0.1/docs/wildcard-ssl-certs-letsencrypt.md#ssl-certificate-renewal). This will increase the validity of the certificate for next 3 months.

### 9.b. Nginx server setup for MOSIP K8's cluster

* Move to nginx directory in your local:
* `cd $K8_ROOT/mosip/on-prem/nginx/`
* Open required ports :
  * Use any editor to create new `hosts.ini` file:
  * ```
    nano hosts.ini
    ```
  *   Add below mentioned lines with updated details of nginx server to the `hosts.ini` and save.

      ```
      [nginx]
      node-nginx ansible_host=<internal ip> ansible_user=root ansible_ssh_private_key_file=<pvt .pem file>
      ```
  *   Execute below mentoned command to open required ports:

      ```
      ansible-playbook -i hosts.ini mosip/on-prem/nginx/nginx_ports.yaml
      ```
* Login to the nginx server node.
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
* Post installation check
  * `sudo systemctl status nginx`
  * Steps to uninstall nginx (incase it is required)\
    `sudo apt purge nginx nginx-common`
  * **DNS mapping**: Once nginx server is installed sucessfully, create DNS mapping for observation cluster related domains as mentioned in DNS requirement section.

### 9.c. Check Overall nginx and istio wiring

* Install `httpbin`: This utility docker returns http headers received inside the cluster.
*   `httpbin` can be used for general debugging - to check ingress, headers etc.

    ```
    cd $K8_ROOT/utils/httpbin
    ./install.sh
    ```

    * To see what is reaching the httpbin (example, replace with your domain name):

    ```
    curl https://api.sandbox.xyz.net/httpbin/get?show_env=true
    curl https://api-internal.sandbox.xyz.net/httpbin/get?show_env=true
    ```

## 10. Monitoring module deployment

> Note :
>
> * Monitoring in the sandbox environment is optional and can be deployed if required.
> * For production environments, alternative monitoring tools can be used.
> * These steps can also be skipped in development environments if monitoring is not needed.
> * Incase skipping execute below commands to install monitoring crd as the same is required by mosip services:
>
> ```
> helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
> helm repo update
> kubectl create ns cattle-monitoring-system
> helm -n cattle-monitoring-system install rancher-monitoring-crd mosip/rancher-monitoring-crd
> ```

* Prometheus and Grafana and Alertmanager tools are used for cluster monitoring.
* Select 'Monitoring' App from Rancher console -> `Apps & Marketplaces`.
*   In Helm options, open the YAML file and disable Nginx Ingress.

    ```
     ingressNginx:
     enabled: false
    ```
* Click on `Install`.

## 11. Alerting setup

> Note :
>
> * Alerting in the sandbox environment is optional and can be deployed if required.
> * For production environments, alternative alerting tools can be used.
> * These steps can also be skipped in development environments if alerting is not needed.

* Alerting is part of cluster monitoring, where alert notifications are sent to the configured email or slack channel.
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

## 12. Logging module setup and installation

> Note :
>
> * Logging in the sandbox environment is optional and can be deployed if required.
> * For production environments, alternative logging tools can be used.
> * These steps can also be skipped in development environments if logging is not needed.

MOSIP uses [Rancher Fluentd](https://ranchermanager.docs.rancher.com/v2.0-v2.4/explanations/integrations-in-rancher/cluster-logging/fluentd) and elasticsearch to collect logs from all services and reflect the same in Kibana Dashboard.

* Install Rancher FluentD system : Required for screpping logs outs of all the microservices from MOSIP k8 cluster.
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
      * [01-logstash.ndjson](https://github.com/mosip/k8s-infra/blob/v1.2.0.1/logging/dashboards/01-logstash.ndjson) contains the logstash _Index_ Pattern required by the rest of the dashboards.
      * [02-error-only-logs.ndjson](https://github.com/mosip/k8s-infra/blob/v1.2.0.1/logging/dashboards/03-service-logs.ndjson) contains a Search dashboard which shows only the error logs of the services, called `MOSIP Error Logs` dashboard.
      * [03-service-logs.ndjson](https://github.com/mosip/k8s-infra/blob/v1.2.0.1/logging/dashboards/03-service-logs.ndjson) contains a Search dashboard which show all logs of a particular service, called MOSIP Service Logs dashboard.
      * [04-insight.ndjson](https://github.com/mosip/k8s-infra/blob/v1.2.0.1/logging/dashboards/04-insight.ndjson) contains dashboards which show insights into MOSIP processes, like the number of UINs generated (total and per hr), the number of Biometric deduplications processed, number of packets uploaded etc, called `MOSIP Insight` dashboard.
      * [05-response-time.ndjson](mosip/on-prem-installation-guidelines.md) contains dashboards which show how quickly different MOSIP Services are responding to different APIs, over time, called `Response Time` dashboard.
* Import dashboards:
  * `cd K8_ROOT/logging`
  * `./load_kibana_dashboards.sh ./dashboards <cluster-kube-config-file>`
* View dashboards

Open kibana dashboard from `https://kibana.sandbox.xyz.net`.

Kibana --> Menu (on top left) --> Dashboard --> Select the dashboard.

## 13. MOSIP External Dependencies setup

External Dependencies are set of external requirements that are needed for functioning of MOSIP’s core services like DB, Object Store, HSM etc.

```
cd $INFRA_ROOT/deployment/v3/external/all
./install-all.sh
```

Click [here](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/mosip-external-dependencies) to check the detailed installation instructions of all the external components.

> Note:
>
> * Connect to `mosip_pms` DB in postgres and execute the query to change `valid_to_date` for `mpolicy-default-mobile` in `pms.auth_policy` table.
>   * Open the terminal.
>   *   Use the psql command to connect to the PostgreSQL server. The general syntax is:
>
>       ```
>       psql -h <host> -p 5432 -U postgres -d mosip_pms
>       ```
>
>       * : The server address (e.g., localhost or an IP address).
>       * Assuming other details remain same like port and user.
>
>       ```
>       UPDATE pms.auth_policy SET valid_to_date = valid_to_date + interval '1 year' WHERE name = 'mpolicy-default-mobile';
>       ```



## Core Infrastructure Components Setup

This section covers the installation and configuration of essential infrastructure components required for the Inji stack, including configmaps, databases, object storage, secrets management, configuration server, and artifactory.

### Inji Stack Configmap: For inji K8's env

* `inji-stack-config` configmap: For inji K8's env, `inji-stack-config` configmap in `default` namespace contains Domain related information. Follow below steps to add domain details for `inji-stack-config` configmap.
*   Update the domain names in `inji-stack-cm.yaml` correctly for your environment.

    ```yaml
    kubectl apply -f - <<EOF
    ## The data here is of generic interest to modules in different namespaces hence this is marked as inji-stack-config.
    ## Replace your domain names here.
    ## api-host:  External public access. (Typically required only in production rollouts).
    ## api-internal-host: Internal secure access over Wireguard.
    ## By default all domains and subdomains listed below point to api-internal-host. Modify this default behavior ONLY in production rollout as follows:
    apiVersion: v1
    kind: ConfigMap
    metadata:
      name: inji-stack-config
      namespace: default
    data:
      inji-version: develop
      installation-domain: sandbox.xyz.net
      api-host: api.sandbox.xyz.net
      iam-external-host: iam.sandbox.xyz.net
      api-internal-host: api-internal.sandbox.xyz.net
      injiweb-host: injiweb.sandbox.xyz.net
      injiverify-host: injiverify.sandbox.xyz.net
      injicertify-host: injicertify.sandbox.xyz.net
      inji-postgres-host: postgres.sandbox.xyz.net
      esignet-mock-host: esignet-mock.sandbox.xyz.net
      mosipid-identity-esignet-host: esignet-mosipid.sandbox.xyz.net
      esignet-insurance-host: esignet-insurance.sandbox.xyz.net
      minio-host: minio.sandbox.mosip.net
    EOF
    ```

### Postgres installation

* [Postgres installation](https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/external/postgres)

### Object store installation

* [Object store installation](https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/external/object-store)

### conf-secret installation

* [conf-secret installation](https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/mosip/conf-secrets)

### config-server installation

*   Create a `values.yaml` file that will contain the configuration for the chart and send it to your config-server installation.

    ```
     touch values.yaml
    ```
*   Review `values.yaml` and make sure git repository parameters are as per your installation and enable only the required environment variables.

    ```yaml
    gitRepo:
      uri: https://github.com/mosip/inji-config
      version: release-0.8.x
      ## Folders within the base repo where properties may be found.
      searchFolders: ""
      private: false
      ## User name of user who has access to the private repo. Ignore for public repo
      username: ""
      token: ""

    envVariables:
      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_API_PUBLIC_HOST
        valueFrom:
          configMapKeyRef:
            name: inji-stack-config
            key: api-host
        enabled: true

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_API_INTERNAL_HOST
        valueFrom:
          configMapKeyRef:
            name: inji-stack-config
            key: api-internal-host
        enabled: true

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_PARTNER_CRYPTO_P12_PASSWORD
        valueFrom:
          secretKeyRef:
            key: mosip-partner-crypto-p12-password
            name: conf-secrets-various
        enabled: false

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MPARTNER_DEFAULT_MOBILE_SECRET
        valueFrom:
          secretKeyRef:
            key: mpartner_default_mobile_secret
            name: keycloak-client-secrets
        enabled: false

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_KEYCLOAK_INTERNAL_URL
        valueFrom:
          configMapKeyRef:
            name: keycloak-host
            key: keycloak-internal-url
        enabled: false

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_KEYCLOAK_EXTERNAL_URL
        valueFrom:
          configMapKeyRef:
            name: keycloak-host
            key: keycloak-external-url
        enabled: false

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_KEYCLOAK_INTERNAL_HOST
        valueFrom:
          configMapKeyRef:
            name: keycloak-host
            key: keycloak-internal-host
        enabled: false

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_KEYCLOAK_EXTERNAL_HOST
        valueFrom:
          configMapKeyRef:
            name: keycloak-host
            key: keycloak-external-host
        enabled: false

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_DB_DBUSER_PASSWORD
        valueFrom:
          secretKeyRef:
            name: db-common-secrets
            key: db-dbuser-password
        enabled: false

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_S3_ACCESSKEY
        valueFrom:
          configMapKeyRef:
            name: s3
            key: s3-user-key
        enabled: false

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_S3_REGION
        valueFrom:
          configMapKeyRef:
            name: s3
            key: s3-region
        enabled: false

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_S3_SECRETKEY
        valueFrom:
          secretKeyRef:
            name: s3
            key: s3-user-secret
        enabled: false

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_ESIGNET_HOST
        valueFrom:
          configMapKeyRef:
            key: esignet-host
            name: inji-stack-config
        enabled: false
        
      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_ESIGNET_MOCK_HOST
        valueFrom:
          configMapKeyRef:
            key: esignet-mock-host
            name: inji-stack-config
        enabled: true

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIPID_IDENTITY_ESIGNET_HOST
        valueFrom:
          configMapKeyRef:
            key: mosipid-identity-esignet-host
            name: inji-stack-config
        enabled: false

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_ESIGNET_INSURANCE_HOST
        valueFrom:
          configMapKeyRef:
            key: esignet-insurance-host
            name: inji-stack-config
        enabled: false  

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_INJI_DATASHARE_HOST
        valueFrom:
          configMapKeyRef:
            key: inji-datashare-host
            name: inji-stack-config
        enabled: false

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_INJIWEB_HOST
        valueFrom:
          configMapKeyRef:
            key: injiweb-host
            name: inji-stack-config
        enabled: true

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_INJIVERIFY_HOST
        valueFrom:
          configMapKeyRef:
            key: injiverify-host
            name: inji-stack-config
        enabled: true

      - name: SPRING_CLOUD_CONFIG_SERVER_OVERRIDES_MOSIP_INJICERTIFY_HOST
        valueFrom:
          configMapKeyRef:
            key: injicertify-host
            name: inji-stack-config
        enabled: true

    ```
*   Create a file named `configserver.sh`:

    ```
    touch configserver.sh
    ```
*   Open the file and paste the following content into it in the same directory where `values.yaml` is created.

    ```sh
    #!/bin/bash
    # Installs config-server
    ## Usage: ./install.sh [kubeconfig]

    if [ $# -ge 1 ] ; then
    export KUBECONFIG=$1
    fi

    NS=config-server
    CHART_VERSION=12.0.1

    read -p "Is conf-secrets module installed?(Y/n) " yn
    if [ $yn = "Y" ]; then read -p "Is values.yaml for config-server chart set correctly as part of Pre-requisites?(Y/n) " yn; fi
    if [ $yn = "Y" ]
    then
    echo Create $NS namespace
    kubectl create ns $NS

        # set commands for error handling.
        set -e
        set -o errexit   ## set -e : exit the script if any statement returns a non-true return value
        set -o nounset   ## set -u : exit the script if you try to use an uninitialised variable
        set -o errtrace  # trace ERR through 'time command' and other functions
        set -o pipefail  # trace ERR through pipes

        echo Istio label
        kubectl label ns $NS istio-injection=enabled --overwrite
        helm repo update

        UTIL_URL=https://raw.githubusercontent.com/mosip/mosip-infra/master/deployment/v3/utils/copy_cm_func.sh
        COPY_UTIL=./copy_cm_func.sh
        DST_NS=config-server # DST_NS: Destination namespace
        wget -q $UTIL_URL -O copy_cm_func.sh && chmod +x copy_cm_func.sh
        echo Copy configmaps and secrets
        $COPY_UTIL configmap inji-stack-config default $NS
        if kubectl -n conf-secrets get secret conf-secrets-various >/dev/null 2>&1; then
            $COPY_UTIL secret conf-secrets-various conf-secrets $NS
        else
            echo "Skipping copy, conf-secrets-various secret not found"
        fi
        if kubectl -n s3 get configmap s3 >/dev/null 2>&1 && kubectl -n s3 get secret s3 >/dev/null 2>&1; then
            $COPY_UTIL configmap s3 s3 $NS
            $COPY_UTIL secret s3 s3 $NS
        else
            echo "Skipping copy, s3 config or secret not found"
        fi

        echo Installing config-server
        helm -n $NS install config-server mosip/config-server -f values.yaml --wait --version $CHART_VERSION
        echo Installed Config-server.
    else
    echo Exiting the MOSIP installation. Please meet the pre-requisites and than start again.
    kill -9 `ps --pid $$ -oppid=`; exit
    fi
    ```
*   Run the Script

    ```
    chmod +x configserver.sh
    ./configserver.sh
    ```

### Artifactory installation

* [artifactory installation](https://github.com/mosip/artifactory-ref-impl/tree/v0.10.0-INJI/deploy)








# Inji Stack Deployment
Once you are done with ensuring **Prerequisites**, **Base Infrastructure**, and the **Core Infrastructure Setup and Configuration**, now you can proceed with the deployment of the Inji stack components. The recommended order of installation is as follows:



## Deploying Inji Certify

This section provides step-by-step instructions to install the Inji Certify, Follow these guidelines to ensure a successful setup of Inji Certify in your environment.

Refer to the [Inji Certify Readme](https://github.com/mosip/inji-certify/tree/develop/deploy) file under the Inji Certify Repo.

Note: To know more about the latest or earlier versions of Inji Certify, refer to the releases [Inji Certify - Release](../../inji-certify/releases/).


<!--

## Pulling content from repo

* The following instruction refers to the repository readme where it has described the process
* The link [link](link) takes you to the repository
* can you read the repository readme and bring content here and put it here?
* This also has listed the pre-requisites, but in this guide pre 
## Pre-requisites
* Base infrastructure setup
  * Tools and utilities to be installed locally 
  * System Requirements: Hardware, network and certificate requirements
  * Set up Wireguard Bastion Host
  * K8s Cluster setup
  * NGINX setup and configuration
  * K8s Cluster Configuration
* inji-stack-config ConfigMap
* Postgres installation
  * Note: Before running the Postgres install script, update the `POSTGRES_HOST` value in `install.sh` with the correct PostgreSQL host.
* Config server secerts
* Config server installation
* Artifactory installation

* redis installation
```
cd deploy/redis
./install.sh
```

## Initialise pre-requisites
### [DB init](../db_scripts)
* Update values file for postgres init [here](../db_scripts/init_values.yaml).
  ```
   cd ../../db_scripts
  ./init_db.sh
  ```

## Install inji certify

  ```
   cd ../inji-certify
    ./install.sh
   ```
## [inji certify apitestrig](inji-certify-apitestrig)


-->






## Installing Mimoto

This section provides step-by-step instructions to install Mimoto. Follow these guidelines to ensure a successful setup of Mimoto in your environment.

Refer to the [Readme](https://github.com/mosip/mimoto/tree/develop/deploy).

Note: To know about the latest or earlier versions of Mimoto, refer to the releases [Inji Wallet Mobile - Release](../../inji-wallet/inji-mobile/versions/) and [Inji Web Releases](../../inji-wallet/inji-web/versions/).



## Installing Inji Web UI and 'Datashare Installation'

This section provides step-by-step instructions to install the Inji Web UI.

Refer to the [Readme](https://github.com/mosip/inji-web/tree/develop/deploy) file for an always updated Inji Web Deployment Guide.

* [Inji web and datashare installation](https://github.com/mosip/inji-web/tree/develop/deploy)
* **Note**: After installing inji web and datashare, ensure that the active\_profile\_env parameter in the config-map of the config-server-share is correctly set to: default,inji-default,standalone.


Note: To know about the latest or earlier versions of Inji Web Wallet refer to the releases [Inji Wallet Web - Release](../../inji-wallet/inji-web/inji-web/).



## Installing Inji Verify

This section provides step-by-step instructions to install the Inji Verify.

Refer to the [Readme](https://github.com/mosip/inji-verify/tree/develop/deploy) file for an always updated Inji Verify Deployment Guide.



# Troubleshoot






























# Observation cluster setup and configuration (Optional) <!-- If opted, This will come after Wireguard Setup -->

The observation cluster is a Kubernetes cluster used for monitoring and managing the overall infrastructure. It includes tools like Rancher for cluster management, Keycloak for IAM, and other monitoring and logging tools. Setting it up ensures that the infrastructure is properly monitored, managed, and secured.

### Observation K8s Cluster setup:

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

{% hint style="warning" %}
**Note**:

* Make sure the permission for `privkey.pem` for ssh is set to 400.
* Clone [`k8s-infra`](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/rancher/on-prem) and move to required direcyory as per hyperlink.
{% endhint %}

4. Setup Observation cluster following [steps](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#observation-k8s-cluster-setup-and-configuration).
5. Once cluster setup is completed, setup k8's cluster ingress and storage class following [steps](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#observation-k8s-cluster-ingress-and-storage-class-setup).
6. Once Observation K8 cluster is created and configured setup nginx server for same using [steps](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#setting-up-nginx-server-for-observation-k8s-cluster).
7. Once Nginx server for observation plane is done, continue with [installation of required apps:](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#observation-k8s-cluster-apps-installation).

* Install Rancher UI.







***

<!-- 

How do we create VMs?

-->




<!-- 

Out of this we need to be specific where does a deplyer find it difficult?

# Wireguard

# Base Infrastructure Setup
## K8 Cluster setup**
## Nginx for Inji K8 Cluster**
## K8 Cluster Configuration

# Core Infrastructure Components Setup
## inji-stack-config` configmap: For inji K8's env
## Postgres installation
## Object store installation
## conf-secret installation
## config-server installation
## Artifactory installation

# Inji Stack Deployment
## Deploying Inji Certify
## Installing Mimoto
## Installing Inji Web UI and 'Datashare Installation'
## Installing Inji Verify
# Troubleshoot



## Observation cluster setup and configuration (Optional)
### Observation K8s Cluster setup:

-->





<!--

* Base Infra setup:
  * tools to be installed in local
  * hardware , network and ..... requirement
  * K8 cluster creation
  * K8 cluster configuration
  
  ...
  
* Configmap

-----------------------------------------------------



Inji Deployment

Wireguard installation:

Observation cluster creation and setup:

Observation cluster configuration:

Main Cluster creation : 

Main Cluster configuration :

Pre-requisites installation : 
eg.
    1. postgres: required for inji certify
                 required for inji verify etc

    2. Continues....

Inji Web deployment:

    1. Pre-requisites check

    2. pre-requisites init.

    3. Module deployment

    4. Module deployment

Inji verify

    1. Pre-requisites check

    2. pre-requisites init.

    3. Module deployment

    4. Module deployment

Inji Certify

    1. Pre-requisites check

    2. pre-requisites init.

    3. Module deployment

    4. Module deployment

etc ... continues


-->


<!--



# Inji Deployment Guide - Revised Outline
# Overview
## What is Inji?
## Key Infrastructure Notes
## What to expect from this guide and how is this guide organized?
## About Inji Modules
## Considerations
### Typical Deployment Scenarios - [sanchi singh]
### Skillset Required [Keshav Singh]
#### Basic Skillsets Required
## High-Level Architecture of Inji [Keshav  Singh]
## Deployment Order
## Supported Operating Systems
## Supported Deployment Environments (**On-prem**, Cloud, Hybrid), For this guide we have considered a On-prem deployment.
## Dependencies on MOSIP Modules (eSignet) - [Deployment Scenario consideration - With and Without eSignet - Configuration changes in Inji Certify and Wallet to support ] - Discuss again with - [varaniya]
# Prerequisites
## Basics
## Tools and utilities
## System Requirements
### Hardware, network and certificate requirements
#### Hardware Requirements
#### Network Requirements
#### DNS requirements \[TODO]
#### Certificate requirements
### Tools to be installed on Personal Computers (Tools for Secure Access)
#### Wireguard
## Observation cluster setup and configuration (Optional)
### Observation K8s Cluster setup:
# Base Infrastructure Setup
## K8 Cluster setup**
## Nginx for Inji K8 Cluster**
## K8 Cluster Configuration
# Inji Stack Deployment
## Core Infrastructure Components Setup
### inji-stack-config` configmap: For inji K8's env
### Postgres installation
### Object store installation
### conf-secret installation
### config-server installation
### Artifactory installation
# Inji Stack Deployment
## Deploying Inji Certify
## Installing Mimoto
## Installing Inji Web UI and 'Datashare Installation'
## Installing Inji Verify
# Troubleshoot



-->