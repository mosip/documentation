# Inji Deployment Guide - Revised Outline





## Overview

### What is Inji?

Inji is a digital credentialing stack that provides a way to share tamper-proof, instantly verifiable data which is cryptographically signed by a trusted issuer, and users can store them securely on their devices or browsers and share them when needed.

### What to expect from this guide and how is this guide organized?

This guide is structured to provide a step-by-step approach for deploying the Inji stack, covering all essential aspects from prerequisites to troubleshooting:

#### Basics

1. **Overview**: Introduction to Inji, its modules, deployment scenarios, required skillsets, architecture, deployment order, key considerations, dependencies, and supported environments.
2. **Prerequisites**: On-Prem Server Environment Details on Software (Kubernetes, NGINX etc.) and Hardware (System Specifications - CPU, RAM, Disk Space and VM specs), infrastructure, including tools and initial setup steps.
3. **Base Infrastructure Setup**: Instructions for setting up Kubernetes clusters, NGINX, cluster configuration, and optional observation clusters.
4. **Core Infra setup and configurations**: This section covers the installation and configuration of essential infrastructure components required for the Inji stack, including configmaps, databases, object storage, secrets management, configuration server, and artifactory.
5. **Inji Stack Deployment**: Guidance on configuring and deploying core Inji components, including configuration management and object storage. Stepwise deployment instructions for Inji Certify, Mimoto, Web UI, and Verify modules.
6. **Troubleshooting**: Common issues and solutions encountered during deployment.

Each section references detailed steps and external resources where applicable, ensuring a comprehensive and actionable deployment process.

### Key Deployment Considerations

#### Basic Skill-sets Required

Deploying Inji Stack is easier if you have Base Infrastructure ready, still, if you want to deploy it 'On-Premise' and from scratch this guide will help you with the instructions to do so.

{% hint style="success" %}
**Note**: The basic Skill-sets mentioned here includes the skills you will need to setup the infrastructure also by yourself.
{% endhint %}

* **Kubernetes Administration**: Understanding of Kubernetes concepts, cluster setup, resource management, and troubleshooting.
* **Linux System Administration**: Proficiency in Linux command-line operations, user and permission management, and basic networking.
* **Containerization**: Experience with Docker or similar container technologies for building and managing service containers.
* **Helm**: Familiarity with Helm for managing Kubernetes manifests and deployments.
* **Networking Fundamentals**: Knowledge of firewalls, load balancers, DNS, and secure network configuration.
* **Database Management**: Basic skills in managing PostgreSQL or similar databases, including initialization and schema setup.
* **Configuration Management**: Ability to manage application configuration files, secrets, and certificates securely.
* **Monitoring and Logging**: Understanding of logging and monitoring tools to observe system health and troubleshoot issues.
* **Security Best Practices**: Awareness of secure credential handling, certificate management, and access control.
* **Scripting**: Basic scripting skills (e.g., Bash, Python) for automation and operational tasks.
* **Familiarity with CI/CD Pipelines**: Understanding of continuous integration and deployment processes is a plus.

#### Key Infrastructure Notes

* Inji modules are deployed as microservices in a Kubernetes cluster.
* Wireguard is used as a trust network extension to access the admin, control, and observation panes.
* Inji uses Nginx server for:
  * SSL termination
  * Reverse Proxy
  * CDN/Cache management
  * Load balancing
* Kubernetes cluster is administered using the Rancher and rke tools.
  * We have two Kubernetes clusters:
    * \[Optional] **Observation cluster** - This cluster is part of the observation plane and assists with administrative tasks. By design, this is kept independent from the actual cluster as a good security practice and to ensure clear segregation of roles and responsibilities. As a best practice, this cluster or its services should be internal and should never be exposed to the external world.
    * Rancher is used for managing the Inji cluster.
    * Keycloak in this cluster is used to manage user access and rights for the observation plane.
      * It is recommended to configure log monitoring and network monitoring in this cluster.
      * In case you have an internal container registry, then it should run here.
  * **Inji cluster** - This cluster runs all the Inji components and certain third-party components like the kafka, keycloak etc.
  * Inji External Components
  * Inji Services

### Deployment Architecture of Inji

The diagram below illustrates the high-level deployment architecture for Inji Web, showing how core components interact within the Kubernetes cluster, including ingress, services, and external integrations.

<figure><img src="../../.gitbook/assets/iww-deployment-diagram.png" alt="Inji Web Deployment Architecture"><figcaption><p><strong>Inji Web Deployment Architecture:</strong></p></figcaption></figure>

## Prerequisites - (Base Infrastructure)

Before deploying any Inji Stack module, ensure that the following common prerequisites are met. These requirements apply to all modules and must be fulfilled to guarantee a smooth and successful deployment process.

### Overview

* **Hardware and Infrastructure**: Provision virtual machines or servers as per the recommended specifications for CPU, memory, storage, and network connectivity.
* **Operating System**: Use a supported OS (preferably Linux) with all necessary system updates applied.
* **Network Configuration**: Ensure stable internal network connectivity between all nodes, and configure required firewall rules and DNS entries.
* **SSL Certificates**: Obtain and install valid SSL certificates for all relevant domains and subdomains.
* **Required Tools**: Install essential tools such as Docker, kubectl, Helm, Ansible, rke, and istioctl on your local machine and relevant servers.
* **Access and Permissions**: Set up passwordless SSH access to all cluster nodes and ensure correct permissions for key files.
* **Container Registry**: If using a private container registry, ensure it is accessible from all nodes.
* **Wireguard Setup**: Configure Wireguard for secure access to the clusters, if required.
* **Configuration Files**: Prepare and update configuration files (such as `hosts.ini`, `values.yaml`, and config maps) with environment-specific details.

> **Note:** Review the detailed hardware, network, and software requirements in the sections below before proceeding with the installation steps for any Inji Stack module.

### On-Prem Server Requirements

> **Note:** You can deploy Inji on an environment and operating system that supports Kubernetes-based deployments. Ensure your chosen OS and infrastructure meet the prerequisites and compatibility requirements. **Note**: This guide refrences using **Ubuntu Server 22.04 LTS**. **Note:** For large-scale deployments or environments with strict security requirements, an on-premises setup is recommended. For pilot projects, demonstrations, or rapid prototyping, a cloud-based deployment may be more suitable.

#### Requirements - Wireguard, Kubernetes Cluster VMs-Virtual Machines (Hardware, Network, Certificate and DNS)

Ensure all required hardware and software dependencies are prepared before proceeding with the installation.

> **Note**: Virtual Machines (VMs) can use any operating system as per convenience. For this installation guide, Ubuntu OS is referenced throughout.

**Wireguard Bastion Host**

* VMs and Hardware Specifications
  * 1 VM (ensure to set up active-passive for HA)
  * Specification - 2 vCPUs, 4 GB RAM, 8 GB Storage (HDD)
* Server Network Interfaces
  * Private interface: On the same internal network as all other nodes (e.g., local NAT network).
  * Public interface: Either a direct public IP or a firewall/NAT rule forwarding UDP port 51820 to this interface's IP address.

**Inji Stack Cluster nodes along with Nginx server\*\* (use Loadbalancer if required)**

* **VMs and Hardware Specifications**
  * 3 VMs (allocate etcd, control plane, and worker nodes accordingly for HA)
  * Specification - 8 vCPUs, 32 GB RAM, 64 GB Storage (HDD)
* **Network Interfaces**
  * Internal interface: On the same internal network as all other nodes, with internet access.
* **Wildcard SSL Certificate for the Inji K8s Cluster**
  * A valid wildcard SSL certificate for the domain used to access the inji Kubernetes cluster.
  * This certificate must be stored inside the Nginx server VM for the inji cluster.
  * For example, a domain like \*.sandbox.xyz.net could serve as the corresponding example.

{% hint style="success" %}
**Note**: Network Requirements

* All the VM's should be able to communicate with each other.
* Need stable Intra network connectivity between these VM's.
* All the VM's should have stable internet connectivity for docker image download (in case of local setup ensure to have a locally accessible docker registry).
{% endhint %}

**DNS requirements \[TODO]**

#### DNS Requirements

Below is a sample mapping of domain names to their respective IP addresses and purposes for a typical Inji deployment. Update these as per your environment.

<table><thead><tr><th width="80.9375">Sl No.</th><th>Domain Name</th><th>Mapping Details</th><th>Purpose</th></tr></thead><tbody><tr><td>1.</td><td>rancher.xyz.net</td><td>Private IP of Nginx server or load balancer (Observation cluster)</td><td>Rancher dashboard for monitoring and managing the Kubernetes cluster.</td></tr><tr><td>2.</td><td>keycloak.xyz.net</td><td>Private IP of Nginx server (Observation cluster)</td><td>Administrative IAM tool (Keycloak) for Kubernetes administration.</td></tr><tr><td>3.</td><td>sandbox.xyz.net</td><td>Private IP of Nginx server (MOSIP cluster)</td><td>Index page for links to MOSIP environment dashboards (not for production/UAT use).</td></tr><tr><td>4.</td><td>api-internal.sandbox.xyz.net</td><td>Private IP of Nginx server (MOSIP cluster)</td><td>Internal APIs, accessible privately over Wireguard.</td></tr><tr><td>5.</td><td>api.sandbox.xyz.net</td><td>Public IP of Nginx server (MOSIP cluster)</td><td>Publicly exposed APIs.</td></tr><tr><td>6.</td><td>iam.sandbox.xyz.net</td><td>Private IP of Nginx server (MOSIP cluster)</td><td>OpenID Connect server (default: Keycloak) for service access, accessible over Wireguard.</td></tr><tr><td>7.</td><td>postgres.sandbox.xyz.net</td><td>Private IP of Nginx server (MOSIP cluster)</td><td>Points to Postgres server, connect via port forwarding over Wireguard.</td></tr><tr><td>8.</td><td>onboarder.sandbox.xyz.net</td><td>Private IP of Nginx server (MOSIP cluster)</td><td>Access MOSIP partner onboarding reports over Wireguard.</td></tr><tr><td>9.</td><td>injiweb.sandbox.xyz.net</td><td>Public IP of Nginx server (MOSIP cluster)</td><td>Public access to Inji Web portal.</td></tr><tr><td>10.</td><td>injicertify.sandbox.xyz.net</td><td>Public IP of Nginx server (MOSIP cluster)</td><td>Public access to Inji Certify portal.</td></tr><tr><td>11.</td><td>injiverify.sandbox.xyz.net</td><td>Public IP of Nginx server (MOSIP cluster)</td><td>Public access to Inji Verify portal.</td></tr></tbody></table>

> **Note:** Ensure all DNS records are created and point to the correct IP addresses (public or private) as per your network design. For private domains, access is typically restricted via Wireguard VPN.

### Personal Computers

{% hint style="success" %}
**Note**: Follow the steps mentioned [here](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem#prerequisites) to install the required tools on your personal computer to create and manage the k8 cluster using RKE1.
{% endhint %}

#### Operating Systems

The Inji stack can be deployed with a PC having one of the following operating systems, however for this guide we have considered a linux machine with Ubuntu 22.04 LTS.

* **Linux** (Ubuntu 22.04 LTS - recommended for production deployments)
* **Windows**
* **macOS (OSX)**

{% hint style="success" %}
**Note:** Most deployment scripts and tools are tested primarily on Linux.
{% endhint %}



#### Tools and utilities

* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).
* [Rancher](../../inji-wallet/inji-web/rancher).
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

## Setting Up Wireguard

### Wireguard

{% hint style="success" %}
**Note**: In case you already have VPN configured to access nodes privately please skip Wireguard installation and continue to use the same VPN.
{% endhint %}

Wireguard bastian server provides secure private channel to access Inji cluster. Bastian server restricts public access, and enables access to only those clients who have their public key listed in Wireguard server.

WireGuard is a modern, fast, and secure VPN (Virtual Private Network) protocol and software that creates encrypted tunnels between devices.

* Wireguard bastian server provides secure private channel to access Inji cluster.
* Bastian server restricts public access, and enables access to only those clients who have their public key listed in Wireguard server.
* Bastion server listens on UDP port 51820.

#### Setup Wireguard VM and wireguard bastion server

Create a Wireguard server VM with the mentioned [**On-Prem Server Requirements**](#on-prem-server-requirements).

Before proceeding, ensure that a dedicated VM (the Bastion server) has already been provisioned according to the specified hardware and network requirements. This VM will be used to set up the Wireguard server. Once the VM is ready, open the required ports on the Bastion server VM.

**Open required ports in the Bastian server VM**

Configure the firewall on the Bastion server virtual machine to allow network traffic through specific ports needed for your application or remote access.

* `cd $K8_ROOT/wireguard/`
* Create copy of `hosts.ini.sample` as `hosts.ini` and update the required details for wireguard VM
* `cp hosts.ini.sample hosts.ini`

{% hint style="success" %}
**Note**:

* Remove `[Cluster]` complete section from copied `hosts.ini` file.
* Add below mentioned details:
  * ansible\_host : public IP of Wireguard Bastion server. eg. 100.10.20.56
  * ansible\_user : user to be used for installation. In this ref-impl we use Ubuntu user.
  * ansible\_ssh\_private\_key\_file : path to pem key for ssh to wireguard server. eg. `~/.ssh/wireguard-ssh.pem`![hosts.ini](../../../_images/wireguard-hosts-ini.png)
{% endhint %}

* Execute ports.yml to enable ports on VM level using ufw:`ansible-playbook -i hosts.ini ports.yaml`

{% hint style="success" %}
**Note**:

* Permission of the pem files to access nodes should have 400 permission. `sudo chmod 400 ~/.ssh/privkey.pem`
* These ports are only needed to be opened for sharing packets over UDP.
* Take necessary measure on firewall level so that the Wireguard server can be reachable on 51820/udp.
{% endhint %}

**Install docker**

* execute docker.yml to install docker and add user to docker group:

```sh
ansible-playbook -i hosts.ini docker.yaml
```

* Setup Wireguard server
  * SSH to wireguard VM
  * `ssh -i <path to .pem> ubuntu@<Wireguard server public ip>`
  * Create directory for storing wireguard config files.`mkdir -p wireguard/config`
  *   Install and start wireguard server using docker as given below:

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

{% hint style="success" %}
**Note**:

* Increase the number of peers above in case more than 30 wireguard client confs (-e PEERS=30) are needed.
* Change the directory to be mounted to wireguard docker as per need. All your wireguard confs will be generated in the mounted directory (`-v /home/ubuntu/wireguard/config:/config`).
{% endhint %}

#### Setup Wireguard Client on your PC\*\*

* Install Wireguard client on your PC using [steps](https://www.wireguard.com/install/).
* Assign `wireguard.conf`:
* SSH to the wireguard server VM.
* `cd /home/ubuntu/wireguard/config`
* assign one of the PR for yourself and use the same from the PC to connect to the server.

```
* create `assigned.txt` file to assign the keep track of peer files allocated and update everytime some peer is allocated to someone.
```

````
```sh
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
````

* Add `peer.conf` in your PC’s `/etc/wireguard` directory as `wg0.conf`.
* Start the wireguard client and check the status:

```sh
sudo systemctl start wg-quick@wg0
sudo systemctl status wg-quick@wg0
```

* Once connected to wireguard, you should be now able to access and login using private IP’s.

## Base Infrastructure Setup

### What is meant by "Base Infrastructure Setup" here?

"Base Infrastructure Setup" refers to preparing all foundational resources and configurations needed before deploying the Inji stack. This includes provisioning servers/VMs, configuring networks and firewalls, setting up SSL certificates, installing Kubernetes clusters and required tools (Docker, kubectl, Helm, etc.), establishing secure access (e.g., Wireguard VPN), and deploying essential services like NGINX, storage, monitoring, and logging. It ensures the environment is ready for Inji stack installation.

* **Provisioning foundational resources** required for the Inji stack, including:
  * Virtual machines (VMs) or servers as per hardware requirements.
  * Network configuration (internal connectivity, firewall rules, DNS).
  * SSL certificate setup for secure communications.
* **Setting up Kubernetes clusters**:
  * Installing and configuring Kubernetes (using RKE, Rancher, etc.).
  * Ensuring cluster nodes are accessible and properly networked.
* **Configuring supporting infrastructure**:
  * Installing Docker and required CLI tools (kubectl, helm, ansible, istioctl).
  * Setting up passwordless SSH access to all nodes.
  * Preparing configuration files (hosts.ini, values.yaml, etc.).
* **Deploying essential services**:
  * Setting up NGINX for SSL termination, reverse proxy, and load balancing.
  * Configuring storage classes (e.g., NFS) for persistent storage.
  * Setting up monitoring, logging, and alerting tools (Prometheus, Grafana, Fluentd, etc.).
* **Establishing secure access**:
  * Installing and configuring Wireguard VPN for secure cluster access.
  * Ensuring only authorized users can access the infrastructure.
* **Importing clusters into management tools** (e.g., Rancher) for centralized administration.

### Inji K8 (Kubernetes) Cluster setup\*\*

### Prerequisites

#### Local PC Requirements

You should have these tools installed on your local machine from where you will be running the ansible playbooks to create and manage the k8 cluster using RKE1.

<table><thead><tr><th width="121.9765625">Tool</th><th width="427.8671875">Description</th><th>Official Installation Guide</th></tr></thead><tbody><tr><td>kubectl</td><td>Command-line tool for interacting with Kubernetes clusters.</td><td><a href="https://kubernetes.io/docs/tasks/tools/#kubectl">Install kubectl</a></td></tr><tr><td>helm</td><td>Kubernetes package manager for deploying and managing applications.</td><td><a href="https://helm.sh/docs/intro/install/">Install Helm</a></td></tr><tr><td>ansible</td><td>Automation tool for configuration management and application deployment.</td><td><a href="https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html">Install Ansible</a></td></tr><tr><td>rke</td><td>Rancher Kubernetes Engine for provisioning Kubernetes clusters (v1.3.10).</td><td><a href="https://rke.docs.rancher.com/installation/">Install RKE</a></td></tr></tbody></table>

{% hint style="success" %}
> **Note:**\
> Add Helm repositories after installing Helm:
>
> ```sh
> helm repo add bitnami https://charts.bitnami.com/bitnami
> helm repo add mosip https://mosip.github.io/mosip-helm
> ```

> **Note**: For VM provisioning and hardware/network requirements, refer to the [System Requirements section](#on-prem-server-requirements).
{% endhint %}

* Find the **kubernetes infrastructure repository** [here](https://github.com/mosip/k8s-infra/tree/v1.2.0.1) which contains the scripts to install and configure Kubernetes cluster with required monitoring, logging and alerting tools.
  * After reviewing the `k8s-infra` repository and ensuring you have all required tools installed on your local machine, the next step is to provision and configure your Kubernetes cluster nodes (VMs or servers) according to the hardware and network requirements specified earlier. Once your nodes are ready and accessible, proceed to run the provided Ansible playbooks and scripts from the `k8s-infra` repository to set up the Kubernetes cluster, networking, and essential infrastructure components.
*   Run `env-check-setup.yaml` to check if cluster nodes are fine and doesn't have known issues in it.

    * `cd $K8_ROOT/rancher/on-prem`
    * Create copy of `hosts.ini.sample` as `hosts.ini` and update the required details for MOSIP k8 cluster nodes.
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
* Open ports and Install docker on Inji K8 Cluster node VM’s.
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
* As result of rke config command `cluster.yml` file will be generated inside same directory, update the below mentioned fields:
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

### Inji K8 (Kubernetes) Cluster, Ingress and Storage Class setup

#### a. [Istio](https://istio.io/) Ingress setup

It is a service mesh for the MOSIP K8 cluster which provides transparent layers on top of existing microservices along with powerful features enabling a uniform and more efficient way to secure, connect, and monitor services.

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

#### b. Storage classes

Multiple storage classes options are available for onprem K8's cluster. In this reference deployment will continue to use NFS as a storage class.

* Move to nfs directory in your personel computer.

```sh
cd $K8_ROOT/mosip/nfs
```

* Create a copy of hosts.ini.sample as hosts.ini.

```sh
cp hosts.ini.sample hosts.ini

```

*   Update the NFS machine details in `hosts.ini` file.

    > Note :
    >
    > * Add below mentioned details:
    > * ansible\_host : internal IP of NFS server. eg. 10.12.23.21
    > * ansible\_user : user to be used for installation, in this ref-impl we use Ubuntu user.
    > * ansible\_ssh\_private\_key\_file : path to pem key for ssh to wireguard server. eg. `~/.ssh/wireguard-ssh.pem` ![hosts.ini](../../../_images/nfs-hosts-ini.png).
* Make sure Kubeconfig file is set correctly to point to required mosip cluster.

```sh
kubectl config view
```

{% hint style="success" %}
**Note**:

* Output should show the cluster name to confirm you are pointing to right kubernetes cluster.
* If not pointing to right K8 cluster change the kubeconfig to connect to right K8 cluster.
* Enable firewall with required ports:
{% endhint %}

```sh
  ansible-playbook -i ./hosts.ini nfs-ports.yaml
```

* SSH to the nfs node:

```sh
ssh -i ~/.ssh/nfs-ssh.pem ubuntu@<internal ip of nfs server>

```

* Clone `k8s-infra` repo in nginx VM:

```sh
git clone https://github.com/mosip/k8s-infra -b v1.2.0.1
```

* Move to the nfs directory:

```sh
cd /home/ubuntu/k8s-infra/mosip/nfs/

```

* Execute script to install nfs server:

```sh
sudo ./install-nfs-server.sh

```

> Note: > \* Script prompts for below mentioned user inputs: > > `> ..... > Please Enter Environment Name: <envName> > ..... > ..... > ..... > [ Export the NFS Share Directory ] > exporting *:/srv/nfs/mosip/<envName> > NFS Server Path: /srv/nfs/mosip/<envName> >` > > \* envName: env name eg. dev/qa/uat...

* Switch to your personel computer and excute below mentioned commands:

```sh
cd $K8_ROOT/mosip/nfs/ <!-- mosip or inji -->
```

```sh
./install-nfs-client-provisioner.sh
```

{% hint style="success" %}
<pre><code><strong>Note: 
</strong>
Script prompts for:
* NFS Server: NFS server ip for persistence.
* NFS Path : NFS path for storing the persisted data. eg. /srv/nfs/mosip/
</code></pre>
{% endhint %}

* Post installation check:
  * Check status of NFS Client Provisioner.

```sh
kubectl -n nfs get deployment.apps/nfs-client-provisioner 
```

* Check status of nfs-client storage class.

```sh
  kubectl get storageclass
  NAME                 PROVISIONER                            RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
  longhorn (default)   driver.longhorn.io                     Delete          Immediate           true                   57d
  nfs-client           cluster.local/nfs-client-provisioner   Delete          Immediate           true                   40s
```

### Inji K8 (Kubernetes) cluster Nginx server setup

#### a. SSL certificates creation

* For Nginx server setup, we need ssl certificate, add the same into Nginx server.
* Incase valid ssl certificate is not there generate one using letsencrypt:
  * SSH into the nginx server
  * Install Pre-requisites:

```sh
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

#### b. Nginx server setup for MOSIP K8's cluster

* Move to nginx directory in your local:
* `cd $K8_ROOT/mosip/on-prem/nginx/`
* Open required ports :
  * Use any editor to create new `hosts.ini` file:

```sh
  nano hosts.ini
```

* Add below mentioned lines with updated details of nginx server to the `hosts.ini` and save.

```sh
[nginx]
node-nginx ansible_host=<internal ip> ansible_user=root ansible_ssh_private_key_file=<pvt .pem file>
```

* Execute below mentoned command to open required ports:

```sh
  ansible-playbook -i hosts.ini mosip/on-prem/nginx/nginx_ports.yaml

```

* Login to the nginx server node.
* Clone k8s-infra

```sh
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

#### c. Check Overall nginx and istio wiring

* Install `httpbin`: This utility docker returns http headers received inside the cluster.
* `httpbin` can be used for general debugging - to check ingress, headers etc.

```sh
  cd $K8_ROOT/utils/httpbin
  ./install.sh
```

* To see what is reaching the httpbin (example, replace with your domain name):

```sh
curl https://api.sandbox.xyz.net/httpbin/get?show_env=true
curl https://api-internal.sandbox.xyz.net/httpbin/get?show_env=true
```

### \[Optional] Monitoring module deployment

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

### \[Optional] Alerting setup

**Note**:

* Alerting in the sandbox environment is optional and can be deployed if required.
* For production environments, alternative alerting tools can be used.
* These steps can also be skipped in development environments if alerting is not needed.



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

### \[Optional] Logging module setup and installation

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

### Core Infrastructure Components Setup

This section covers the installation and configuration of essential infrastructure components required for the Inji stack, including configmaps, databases, object storage, secrets management, configuration server, and artifactory.

#### Inji Stack Configmap: For inji K8's env

* `inji-stack-config` configmap: For inji K8's env, `inji-stack-config` configmap in `default` namespace contains Domain related information. Follow below steps to add domain details for `inji-stack-config` configmap.
* Update the domain names in `inji-stack-cm.yaml` correctly for your environment.

{% hint style="success" %}
**Note**: You can find the `inji-stack-cm.yaml` file in the deployment scripts or configuration directory of the Inji stack repository, typically under the `deploy` or `k8s` folder. If it is not present, you can create it using the sample configmap YAML provided in this guide, and then update the domain names as per your environment before applying it to your Kubernetes cluster
{% endhint %}

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

#### Postgres installation

* [Postgres installation](https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/external/postgres)

#### Object store installation

* [Object store installation](https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/external/object-store)

#### conf-secret installation

* [conf-secret installation](https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/mosip/conf-secrets)

#### Config Server Installation

**Create values.yaml**

```sh
cd /path/to/config-server/
touch values.yaml
```

This ensures that `values.yaml` is available for your Helm install command and can be referenced directly during the config-server deployment.

* Create a `values.yaml` file that will contain the configuration for the chart and send it to your config-server installation.

```sh
  touch values.yaml
```

* Review `values.yaml` and make sure git repository parameters are as per your installation and enable only the required environment variables.

````yaml
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

#### Create configserver.sh

* Create a file named `configserver.sh`:

```sh
  touch configserver.sh
````

* Open the file and paste the following content into it in the same directory where `values.yaml` is created.

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

* Run the Script

```sh
    chmod +x configserver.sh
    ./configserver.sh
```

#### Artifactory Installation

Artifactory is a universal artifact repository manager used to store, manage, and distribute build artifacts (such as Docker images, Helm charts, binaries, and other deployment packages) required by the Inji stack and related services. Installing Artifactory ensures that all deployment dependencies are securely managed and easily accessible during automated deployments and upgrades.

**Why install Artifactory?**

* Centralizes storage of deployment artifacts for consistency and reliability.
* Enables version control and traceability of all build packages.
* Facilitates automated CI/CD pipelines by providing a secure and scalable repository.
* Supports integration with Kubernetes, Docker, and Helm for seamless deployments.

For installation instructions, refer to the [artifactory installation guide](https://github.com/mosip/artifactory-ref-impl/tree/v0.10.0-INJI/deploy).

## Inji Stack Deployment

Once **Prerequisites**, **Base Infrastructure**, and the **Core Infrastructure Setup and Configuration** are complete, now you can proceed with the deployment of the Inji stack components.

### Deploying Inji Certify

While you have deployment environment ready you can now proceed with the installation of Inji Certify by following the steps explained here.

The [Inji Certify](https://github.com/mosip/inji-certify/tree/master/deploy) repo has the deployment directory which contains deployment scripts and configurations.

**Note**:

* Refer to an always updated instruction here inside Inji-Certify [README](https://github.com/mosip/inji-certify/tree/develop/deploy).
* To know more about the latest or earlier versions of Inji Certify, refer to the releases [Inji Certify - Release](../../inji-certify/releases).

#### Understanding the Deployment Model

Inji Certify is deployed as **containerized microservices** in your Kubernetes cluster.

#### Deployment Flow

```mermaid
flowchart LR
  A[Your PC] --> B[kubectl/helm]
  B --> C[K8s Cluster]
  C --> D[Inji Certify Pods]
  D --> E[NGINX Ingress]
  E --> F[External Users]
  A -.-> G[Deployment Scripts]
  G -.-> C
```

**Where Does Inji Certify Run?**

* **Target Environment**: Your main Kubernetes cluster
* **Deployment Method**: Helm charts that pull Docker images from container registries
* **Access Point**: Through your configured NGINX ingress at `https://injicertify.sandbox.xyz.net`

**What Gets Installed?**

1. **Kubernetes Pods**: Running Inji Certify microservices
2. **Services**: For internal communication
3. **Ingress Rules**: For external access via NGINX
4. **ConfigMaps & Secrets**: For configuration and credentials

#### Deployment Process

**Step 1: Prepare Your Deployment Environment**

From your **local machine**, you'll run deployment scripts that:

* Connect to your Kubernetes cluster via `kubectl`
* Deploy containerized services using Helm charts
* Configure ingress rules through Istio

**Step 2: Clone and Navigate to Deployment Scripts**

```bash
# On your local machine (connected to K8s cluster via kubectl)
git clone https://github.com/mosip/inji-certify.git
cd inji-certify/deploy
```

**Step 3: Verify Prerequisites**

Ensure these components are running in your K8s cluster:

* Config Server (for application configuration)
* PostgreSQL (for data storage)
* Redis (for caching)
* Object Store (MinIO/S3 for file storage)

**Step 4: Deploy Redis (if not already deployed)**

```bash
cd redis
./install.sh
```

**Step 5: Initialize Database**

```bash
cd ../db_scripts
# Update init_values.yaml with your database configuration, update the necessary parameters for your PostgreSQL database. Provide path or how to navigate to this yaml in cloned repo.
./init_db.sh
```

**Step 6: Deploy Inji Certify Microservices**

```bash
cd ../inji-certify
./install.sh
```

#### What Happens During Installation

1. **Helm Charts Execution**: Downloads and deploys Docker containers
2. **Service Registration**: Services register with config-server for configuration
3. **Database Initialization**: Creates required tables and seed data
4. **Ingress Configuration**: Configures routes through Istio gateway
5. **Health Checks**: Verifies all pods are running and healthy

#### Verification Steps

**Check Pod Status**

```sh
kubectl get pods -n inji-certify
```

**Verify Service Endpoints**

```sh
kubectl get services -n inji-certify
```

**Test External Access**

```sh
curl -k https://injicertify.sandbox.xyz.net/health
```

#### Important Notes

* **Remote Deployment**: You deploy from your local machine to the remote K8s cluster
* **Container Registry**: Docker images are pulled from public/private registries during deployment
* **Configuration**: All configuration comes from your config-server and configmaps

#### Troubleshooting

If deployment fails, check:

1. **Cluster Connectivity**: `kubectl cluster-info`
2. **Prerequisites**: Ensure config-server, postgres, redis are running
3. **Resources**: Verify cluster has sufficient CPU/memory
4. **Network**: Ensure ingress and DNS are properly configured

### Deploying Mimoto

This section provides a structured, step-by-step guide to deploy Mimoto, which serves as the backend for Inji Mobile Wallet and Inji Web. Follow these instructions to ensure a successful and reproducible deployment.

#### Understanding the Deployment Model

Mimoto is deployed as **containerized microservices** in your Kubernetes cluster.

**Deployment Flow**

```mermaid
flowchart LR
  A[Your PC] --> B[kubectl/helm]
  B --> C[K8s Cluster]
  C --> D[Mimoto Pods]
  D --> E[NGINX Ingress]
  E --> F[External Users]
  A -.-> G[Deployment Scripts]
  G -.-> C
```

**Where Does Mimoto Run?**

* **Target Environment**: Your main Kubernetes cluster
* **Deployment Method**: Helm charts and shell scripts that pull Docker images from container registries
* **Access Point**: Through your configured NGINX ingress (domain as configured)

**What Gets Installed?**

1. **Kubernetes Pods**: Running Mimoto microservices
2. **Services**: For internal communication
3. **Ingress Rules**: For external access via NGINX/Istio
4. **ConfigMaps & Secrets**: For configuration and credentials

#### Prerequisites

Before proceeding, ensure these components are running in your K8s cluster:

* Config Server (for configuration management)
* PostgreSQL (for data storage)
* Redis (for caching)
* Object Store (MinIO/S3 or NFS for file storage)
* Ingress (NGINX/Istio for external access)

#### Deployment Process

**Step 1: Install Redis**

To install Redis, run:

```sh
cd deploy/redis
./install.sh
```

**Step 2: Initialize Database**

Update the values file for PostgreSQL initialization as needed, then run:

```sh
cd ../../db_scripts
./init_db.sh
```

**Step 3: Install Partner Onboarder**

To install the Partner Onboarder module:

```sh
cd ../partner-onboarder
./install.sh
```

During the execution of the `install.sh` script, you will be prompted to provide information for the S3 bucket, including its name and URL.

Once the job completes, log in to your S3 or NFS storage and verify the reports. There should be no failures.

{% hint style="success" %}
**Note:**\
If you are running the Onboarder in a separate INJI cluster, update the `extraEnvVars` section in `values.yaml` accordingly.
{% endhint %}

**Step 4: Install Mimoto**

Before installing Mimoto, ensure that the database host and port are correctly configured in the `values.yaml` file.

To install Mimoto:

```sh
cd ../deploy/mimoto
./install.sh
```

During the execution of the `install.sh` script, you will be prompted to specify whether a public domain and a valid SSL certificate are present on the server.

* If the server does **not** have a public domain and valid SSL certificate, select `n`.\
  This will enable an init-container with an `emptyDir` volume, which will download the server's self-signed SSL certificate and mount it to the Java keystore (`cacerts`) within the container.\
  This is useful for deployments using self-signed SSL certificates.

**Step 5: Onboarding a New Issuer for VCI**

To onboard a new issuer for VCI:

1. Create a folder named `certs` in the root directory.
2. Inside `certs`, create a file named `oidckeystore.p12`.
3. Store the keys as different aliases for each issuer in this file.

For more details, refer to the official documentation or the relevant section in the repository.

#### Verification Steps

*   **Check Pod Status:**

    ```sh
    kubectl get pods -n mimoto
    ```
*   **Check Service Endpoints:**

    ```sh
    kubectl get services -n mimoto
    ```
*   **Test External Access:**

    ```sh
    curl -k https://<your-mimoto-domain>/health
    ```

#### Important Notes

* **Remote Deployment**: You deploy from your local machine to the remote K8s cluster.
* **Container Registry**: Docker images are pulled from public/private registries during deployment.
* **Configuration**: All configuration comes from your config-server and configmaps.

#### Troubleshooting

If deployment fails, check:

1. **Cluster Connectivity**: `kubectl cluster-info`
2. **Prerequisites**: Ensure config-server, postgres, redis are running
3. **Resources**: Verify cluster has sufficient CPU/memory
4. **Network**: Ensure ingress and DNS are properly configured
5. **Logs**: Check pod logs for errors: `kubectl logs <pod-name> -n mimoto`

For more details, refer to the [Mimoto Deployment Guide](https://github.com/mosip/mimoto/tree/develop/deploy).

Note: To know about the latest or earlier versions of Mimoto, refer to the releases [Inji Wallet Mobile - Release](../../inji-wallet/inji-mobile/versions) and [Inji Web Releases](../../inji-wallet/inji-web/versions).

### Deploying Inji Web UI and DataShare

This section provides a clear, step-by-step guide to deploy the Inji Web UI and DataShare modules. Follow these instructions to ensure a successful and reproducible deployment.

#### Understanding the Deployment Model

Inji Web UI and DataShare are deployed as **containerized microservices** in your Kubernetes cluster.

**Deployment Flow**

```mermaid
flowchart LR
  A[Your PC] --> B[kubectl/helm]
  B --> C[K8s Cluster]
  C --> D[Inji Web UI & DataShare Pods]
  D --> E[NGINX Ingress]
  E --> F[External Users]
  A -.-> G[Deployment Scripts]
  G -.-> C
```

**Where Do Inji Web UI and DataShare Run?**

* **Target Environment**: Your main Kubernetes cluster
* **Deployment Method**: Helm charts that pull Docker images from container registries
* **Access Point**: Through your configured NGINX ingress at `https://injiweb.sandbox.xyz.net` (and DataShare endpoints as configured)

**What Gets Installed?**

1. **Kubernetes Pods**: Running Inji Web UI and DataShare microservices
2. **Services**: For internal communication
3. **Ingress Rules**: For external access via NGINX/Istio
4. **ConfigMaps & Secrets**: For configuration and credentials

#### Prerequisites

Before proceeding, ensure these components are running in your K8s cluster:

* Config Server (for configuration management)
* PostgreSQL (for data storage)
* Redis (for caching)
* Object Store (MinIO/S3 for file storage)
* Ingress (NGINX/Istio for external access)

#### Deployment Process

**Step 1: Prepare Your Deployment Environment**

From your **local machine**, you'll run deployment scripts that:

* Connect to your Kubernetes cluster via `kubectl`
* Deploy containerized services using Helm charts
* Configure ingress rules through Istio/NGINX

**Step 2: Clone and Navigate to Deployment Scripts**

```sh
git clone https://github.com/mosip/inji-web.git
cd inji-web/deploy
```

**Step 3: Prepare Configuration**

* Review and update the `values.yaml` file for your environment (domain names, DB connection, object store endpoints, etc.).
*   Ensure the `active_profile_env` parameter in the config map of the `config-server-share` is set to:

    ```
    default,inji-default,standalone
    ```

**Step 4: Deploy DataShare (if required)**

If DataShare is a separate module, deploy it first:

```sh
cd datashare
./install.sh
cd ..
```

**Step 5: Deploy Inji Web UI**

From the `deploy` directory:

```sh
cd injiweb
./install.sh
```

**Step 6: Verification Steps**

*   Check pod status:

    ```sh
    kubectl get pods -n injiweb
    ```
*   Check service endpoints:

    ```sh
    kubectl get services -n injiweb
    ```
*   Test external access:

    ```sh
    curl -k https://injiweb.sandbox.xyz.net/health
    ```

**Step 7: Post-Installation Configuration**

* Confirm that the `active_profile_env` in the config-server-share config map is set as described above.
* Ensure DNS records for `injiweb.sandbox.xyz.net` and any DataShare endpoints are correctly mapped to your ingress controller.

#### Important Notes

* **Remote Deployment**: You deploy from your local machine to the remote K8s cluster
* **Container Registry**: Docker images are pulled from public/private registries during deployment
* **Configuration**: All configuration comes from your config-server and configmaps

#### Troubleshooting

If deployment fails, check:

1. **Cluster Connectivity**: `kubectl cluster-info`
2. **Prerequisites**: Ensure config-server, postgres, redis are running
3. **Resources**: Verify cluster has sufficient CPU/memory
4. **Network**: Ensure ingress and DNS are properly configured
5. **Logs**: Check pod logs for errors: `kubectl logs <pod-name> -n injiweb`

For more details, refer to the [Inji Web Deployment Guide](https://github.com/mosip/inji-web/tree/develop/deploy).

### Deploying Inji Verify

This section provides step-by-step instructions to install Inji Verify. Follow these guidelines to ensure a successful setup in your environment.

Refer to the [Inji Verify Readme](https://github.com/mosip/inji-verify/tree/develop/deploy) for the latest deployment details.

#### Understanding the Deployment Model

Inji Verify is deployed as **containerized microservices** in your Kubernetes cluster.

#### Deployment Flow

```mermaid
flowchart LR
  A[Your PC] --> B[kubectl/helm]
  B --> C[K8s Cluster]
  C --> D[Inji Verify Pods]
  D --> E[NGINX Ingress]
  E --> F[External Users]
  A -.-> G[Deployment Scripts]
  G -.-> C
```

**Where Does Inji Verify Run?**

* **Target Environment**: Your main Kubernetes cluster
* **Deployment Method**: Helm charts that pull Docker images from container registries
* **Access Point**: Through your configured NGINX ingress at `https://injiverify.sandbox.xyz.net`

**What Gets Installed?**

1. **Kubernetes Pods**: Running Inji Verify microservices
2. **Services**: For internal communication
3. **Ingress Rules**: For external access via NGINX
4. **ConfigMaps & Secrets**: For configuration and credentials

#### Deployment Process

**Step 1: Prepare Your Deployment Environment**

From your **local machine**, you'll run deployment scripts that:

* Connect to your Kubernetes cluster via `kubectl`
* Deploy containerized services using Helm charts
* Configure ingress rules through Istio

**Step 2: Clone and Navigate to Deployment Scripts**

```sh
git clone https://github.com/mosip/inji-verify.git
cd inji-verify/deploy
```

**Step 3: Verify Prerequisites**

Ensure these components are running in your K8s cluster:

* Config Server (for application configuration)
* PostgreSQL (for data storage)
* Redis (for caching)
* Object Store (MinIO/S3 for file storage)

**Step 4: Initialize Database**

Update the values file for PostgreSQL initialization as needed.

```sh
cd ../db_scripts
# Update init_values.yaml with your database configuration, update the necessary parameters for your PostgreSQL database.
./init_db.sh
cd ../deploy
```

**Step 5: Deploy Inji Verify Microservices**

```sh
./install-all.sh
```

#### What Happens During Installation

1. **Helm Charts Execution**: Downloads and deploys Docker containers
2. **Service Registration**: Services register with config-server for configuration
3. **Database Initialization**: Creates required tables and seed data
4. **Ingress Configuration**: Configures routes through Istio gateway
5. **Health Checks**: Verifies all pods are running and healthy

#### Verification Steps

**Check Pod Status**

```sh
kubectl get pods -n inji-verify
```

**Verify Service Endpoints**

```sh
kubectl get services -n inji-verify
```

**Test External Access**

```sh
curl -k https://injiverify.sandbox.xyz.net/health
```

#### Managing Inji Verify Services

*   **Delete all services:**

    ```sh
    ./delete-all.sh
    ```
*   **Restart all services:**

    ```sh
    ./restart-all.sh
    ```

#### Important Notes

* **Remote Deployment**: You deploy from your local machine to the remote K8s cluster
* **Container Registry**: Docker images are pulled from public/private registries during deployment
* **Configuration**: All configuration comes from your config-server and configmaps

#### Troubleshooting

If deployment fails, check:

1. **Cluster Connectivity**: `kubectl cluster-info`
2. **Prerequisites**: Ensure config-server, postgres, redis are running
3. **Resources**: Verify cluster has sufficient CPU/memory
4. **Network**: Ensure ingress and DNS are properly configured
5. **Logs**: Check pod logs for errors: `kubectl logs <pod-name> -n inji-verify`

***

## Observation cluster setup and configuration (Optional)

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

\{% hint style="warning" %\} **Note**:

* Make sure the permission for `privkey.pem` for ssh is set to 400.
* Clone [`k8s-infra`](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/rancher/on-prem) and move to required direcyory as per hyperlink. \{% endhint %\}

4. Setup Observation cluster following [steps](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#observation-k8s-cluster-setup-and-configuration).
5. Once cluster setup is completed, setup k8's cluster ingress and storage class following [steps](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#observation-k8s-cluster-ingress-and-storage-class-setup).
6. Once Observation K8 cluster is created and configured setup nginx server for same using [steps](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#setting-up-nginx-server-for-observation-k8s-cluster).
7. Once Nginx server for observation plane is done, continue with [installation of required apps:](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#observation-k8s-cluster-apps-installation).

* Install Rancher UI.

***

## FAQs

### Q. Do I need to care about each and every section of this document?

***

## Important notes:

* SSH to nodes is not explained, do that.
* Establish this well that if the 'Base Infra' is ready then Inji can easily be deployed. This should be established throughout the doc. and also use tips, notes etc. to say doc too is approching it in modular way.
* Some places it is just not clear that where as a user you should be to deploy that stuff, User might not want to deploy every stuff at once, can come back to where he left and start from there, So it is important to mention that.
* Mimoto is still crude
* Generic sections like basic skill-sests etvc can be revised with AI/Copilot again giving it docs context.
* Artifactory Installation is not explained, add that.
* Remove 'trubleshoot' section, or rename it to 'common issues and resolutions' and add some common issues faced during deployment and their resolutions. Or something similar
* Prerequisite can go to each section or wherever required, not to hesitate and can be renamed as well, think it.
* Add more and more mermaid diagrams wherever possible and css animation or try end-to-end flow diagram animation.
* Some headings can be renamed
* Mini TOC to add
* Tips, Notes, Cautions, Warnings to be added wherever required.- Atleast Tips and Notes
* Relative and Cross linking

## Crude

```mermaid
flowchart LR
    A[VM Provisioning] --> B[Wireguard Setup]
    B --> C[K8s Cluster Creation]
    C --> D[Core Components]
    D --> E[Inji Services]
    E --> F[Verification]
    
    style A fill:#f9f,stroke:#333,stroke-width:4px
    style F fill:#9f9,stroke:#333,stroke-width:4px
```
