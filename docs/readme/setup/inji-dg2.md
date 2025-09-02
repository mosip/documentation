# Inji Deployment Guide - Revised Outline

# Overview

## What is Inji?
Inji is a verifiable credentialing stack that provides a way to share tamper-proof, instantly verifiable data which is cryptographically signed by a trusted issuer, and users can store them securely on their devices or browsers and share them when needed.


## Key Infrastructure Notes

* Inji modules are deployed as microservices in a Kubernetes cluster.
* Wireguard is used as a trust network extension to access the admin, control, and observation panes.
* Inji uses Nginx server for:
  * SSL termination
  * Reverse Proxy
  * CDN/Cache management
  * Load balancing

* Kubernetes cluster is administered using the Rancher and rke tools.

  * We have two Kubernetes clusters:

    * Observation cluster - This cluster is part of the observation plane and assists with administrative tasks. By design, this is kept independent from the actual cluster as a good security practice and to ensure clear segregation of roles and responsibilities. As a best practice, this cluster or its services should be internal and should never be exposed to the external world.

    * Rancher is used for managing the Inji cluster.

  * Keycloak in this cluster is used to manage user access and rights for the observation plane.
    * It is recommended to configure log monitoring and network monitoring in this cluster.

  * In case you have an internal container registry, then it should run here.

* Inji cluster - This cluster runs all the Inji components and certain third-party components like the kafka, keycloak etc.

* Inji External Components

* Inji Services


## What to expect from this guide and how is this guide organized?
This guide is structured to provide a step-by-step approach for deploying the Inji stack, covering all essential aspects from prerequisites to troubleshooting:

1. **Overview**: Introduction to Inji, its modules, deployment scenarios, required skillsets, architecture, deployment order, key considerations, dependencies, and supported environments.
2. **Prerequisites**: Details on hardware, infrastructure, and software requirements, including tools, system specifications, and initial setup steps.
3. **Base Infrastructure Setup**: Instructions for setting up Kubernetes clusters, NGINX, cluster configuration, and optional observation clusters.
Core Infrastructure Components Setup
4. **Core Infra setup and configurations**: This section covers the installation and configuration of essential infrastructure components required for the Inji stack, including configmaps, databases, object storage, secrets management, configuration server, and artifactory.
5. **Inji Stack Deployment**: Guidance on configuring and deploying core Inji components, including configuration management and object storage. Stepwise deployment instructions for Inji Certify, Mimoto, Web UI, and Verify modules.
6. **Troubleshooting**: Common issues and solutions encountered during deployment.

Each section references detailed steps and external resources where applicable, ensuring a comprehensive and actionable deployment process.

## About Inji Modules

**Inji Certify**  
Inji Certify is the module responsible for issuing and managing digital credentials. It interfaces with identity systems and ensures that credentials are securely generated, signed, and delivered to the Inji Wallet.

**Inji Wallet**  
The Inji Wallet is a secure digital wallet that allows users to store, manage, and present their digital credentials. It is available in two variants:
- **Web**: A browser-based application enabling users to access their credentials from any device with internet connectivity. 
- **Mobile**: A mobile app providing secure, on-the-go access to credentials, supporting offline functionality and enhanced security features.

**Verify** 
The Verify module enables the validation of digital credentials presented by users. It checks the authenticity and integrity of credentials, ensuring they are valid and have not been tampered with, supporting both online and offline verification scenarios.


## Considerations

### Typical Deployment Scenarios - [sanchi singh]

### Skillset Required [Keshav Singh]

#### Basic Skillsets Required

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


## High-Level Architecture of Inji [Keshav  Singh]

<figure><img src="../../.gitbook/assets/iww-deployment-diagram.png" alt=""><figcaption><p>Inji Web Deployment Architecture</p></figcaption></figure>

## Deployment Order

The recommended order for deploying the Inji stack ensures that dependencies are met and each component functions as intended. Follow this sequence for a smooth deployment:

1. **Certify**  
  Deploy the Certify module first, as it is responsible for issuing and managing digital credentials. Other modules depend on Certify for credential operations.

2. **Wallet**  
  After Certify, deploy the Inji Wallet, which allows users to store and manage their credentials. Deploy both variants as needed:
  - **Mobile**: For users requiring on-the-go access and offline capabilities.
  - **Web**: For browser-based access to credentials.

3. **Verify**  
  Deploy the Verify module last. It relies on both Certify and Wallet to validate and authenticate credentials presented by users.

> **Note:** Ensure that all prerequisites and infrastructure components (such as databases, storage, and configuration servers) are set up before starting the deployment of these modules.

This order helps maintain system integrity and ensures that each module is operationally ready for the next.

## Supported Operating Systems

The Inji stack can be deployed with the following operating systems, however for this guide we have considered a linux machine with Ubuntu 20.04 LTS.

- **Linux** (recommended for production deployments)
- **Windows**
- **macOS (OSX)**

> **Note:** Most deployment scripts and tools are tested primarily on Linux. For Windows and macOS, ensure compatibility of required tools (e.g., Docker, Kubernetes CLI, Helm) and consider using WSL (Windows Subsystem for Linux) or virtualization where necessary.

## Supported Deployment Environments (**On-prem**, Cloud, Hybrid), For this guide we have considered a On-prem deployment.

## Dependencies on MOSIP Modules (eSignet) - [Deployment Scenario consideration - With and Without eSignet - Configuration changes in Inji Certify and Wallet to support ] - Discuss again with - [varaniya]




# Prerequisites

Before installing any Inji Stack module, ensure that the following common prerequisites are met. These requirements apply to all modules and must be fulfilled to guarantee a smooth and successful deployment process.

## Basics

- **Hardware and Infrastructure**: Provision virtual machines or servers as per the recommended specifications for CPU, memory, storage, and network connectivity.
- **Operating System**: Use a supported OS (preferably Linux) with all necessary system updates applied.
- **Network Configuration**: Ensure stable internal network connectivity between all nodes, and configure required firewall rules and DNS entries.
- **SSL Certificates**: Obtain and install valid SSL certificates for all relevant domains and subdomains.
- **Required Tools**: Install essential tools such as Docker, kubectl, Helm, Ansible, rke, and istioctl on your local machine and relevant servers.
- **Access and Permissions**: Set up passwordless SSH access to all cluster nodes and ensure correct permissions for key files.
- **Container Registry**: If using a private container registry, ensure it is accessible from all nodes.
- **Wireguard Setup**: Configure Wireguard for secure access to the clusters, if required.
- **Configuration Files**: Prepare and update configuration files (such as `hosts.ini`, `values.yaml`, and config maps) with environment-specific details.

> **Note:** Review the detailed hardware, network, and software requirements in the sections above before proceeding with the installation steps for any Inji Stack module.



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

## System Requirements

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


#### Wireguard

Secure access solution that establishes private channels to Observation and inji clusters.

_If you already have a Wireguard bastion host then you may skip this step._

* A Wireguard bastion host (Wireguard server) provides a secure private channel to access the Observation and inji cluster.
* The host restricts public access and enables access to only those clients who have their public key listed in the Wireguard server.
* Wireguard listens on UDP port51820.

**Setup Wireguard Bastion server**

1. Create a Wireguard server VM with above mentioned Hardware and Network requirements.
2. Open ports and Install docker on Wireguard VM.

* Create a copy of `hosts.ini.sample` as `hosts.ini` and update the required details for wireguard VM `cp hosts.ini.sample hosts.ini`
* Execute ports.yml to enable ports on VM level using ufw: `ansible-playbook -i hosts.ini ports.yaml`

{% hint style="warning" %}
**Note**:

* Permission of the pem files to access nodes should have 400 permission. `sudo chmod 400 ~/.ssh/privkey.pem`
* These ports are only needed to be opened for sharing packets over UDP.
* Take necessary measure on firewall level so that the Wireguard server can be reachable on 51820/udp publically.
* Make sure to clone the [k8s-infra](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem#prerequisites) github repo for required scripts in above steps and perform the steps from linked directory.
* If you already have Wireguard server for the VPC used you can skip the setup Wireguard Bastion server section.
* execute docker.yml to install docker and add user to docker group:

```yaml
    ansible-playbook -i hosts.ini docker.yaml
```
{% endhint %}

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

{% hint style="warning" %}
**Note**:

* Increase the no. of peers above in case more than 30 wireguard client confs (-e PEERS=30) are needed.
* Change the directory to be mounted to wireguard docker as per need. All your wireguard confs will be generated in the mounted directory (`-v /home/ubuntu/wireguard/config:/config`).
{% endhint %}

#### Setup Wireguard Client on your PC and follow the below steps**

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

## Observation cluster setup and configuration (Optional)

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



# Base Infrastructure Setup

## K8 Cluster setup**

1. [k8s-infra](https://github.com/mosip/k8s-infra/tree/v1.2.0.1): contains the scripts to install and configure Kubernetes cluster with required monitoring, logging and alerting tools.
2. Clone the Kubernetes Infrastructure Repository:

make sure to use the released tag. Specifically v1.2.0.2. <!-- Check this - Very poor instruction -->

```sh
git clone -b v1.2.0.2 https://github.com/mosip/k8s-infra.git
cd k8s-infra/mosip/onprem
```

3. Create copy of hosts.ini.sample as hosts.ini. Update the IP addresses.
   1. Open the ports for the nodes: Execute [`ports.yml`](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem#ports) to open all the required ports.
   2. Docker installation: Install [Docker](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem#docker) on all the required VM's.
4. Create [RKE1 K8](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem#rke-cluster-setup) cluster for Inji services hosting.
5. Apply global config map: https://github.com/mosip/k8s-infra/blob/v1.2.0.2/mosip/global\_configmap.yaml.sample
6. [Import](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem#register-the-cluster-with-rancher) newly created K8 cluster to Rancher UI.

## Nginx for Inji K8 Cluster**

1. Setup [Nginx](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem/nginx) for exposing services from newly created Inji K8 cluster.

## K8 Cluster Configuration

* Setup [NFS](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/nfs#nfs-setup) for persistence in k8 cluster as well as standalone VM (Nginx VM).
* Setup [Monitoring](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/monitoring#cluster-monitoring) for K8 cluster Monitoring.
* Setup [Logging](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/logging#logging) for K8 cluster.
* Setup [Istio](https://github.com/mosip/k8s-infra/tree/v1.2.0.2/mosip/on-prem/istio#istio) and kiali.




# Inji Stack Deployment

## Core Infrastructure Components Setup

This section covers the installation and configuration of essential infrastructure components required for the Inji stack, including configmaps, databases, object storage, secrets management, configuration server, and artifactory.

### inji-stack-config` configmap: For inji K8's env

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




































***


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
