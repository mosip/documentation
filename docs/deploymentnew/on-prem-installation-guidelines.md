# On-prem 1.2.0.1-B2 Installation Guidelines

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
* In case you have a internal container registry then it should run here.

**MOSIP cluster** - This cluster runs all the MOSIP components and certain third party components to secure the cluster, API’s and data.

* [MOSIP External Components](https://github.com/mosip/mosip-infra/blob/v1.2.0.1-B1/deployment/v3/external/README.md#mosip-external-components) 
* [MOSIP Services](https://github.com/mosip/mosip-infra/blob/v1.2.0.1-B1/deployment/v3/mosip/README.md#mosip-services)

## Architecture Diagram: TODO

### Deployment Repos

* [k8s-infra](https://github.com/mosip/k8s-infra/tree/v1.2.0.1-B1) : contains the scripts to install and configure Kubernetes cluster with required monitoring, logging and alerting tools.

* [mosip-infra](https://github.com/mosip/mosip-infra/tree/v1.2.0.1-B1/deployment/v3) : contains the deployment scripts to run charts in defined sequence.

* [mosip-config](https://github.com/mosip/mosip-config/tree/v1.2.0.1-B1) : contains all the configuration files required by the MOSIP modules.

* [mosip-helm](https://github.com/mosip/mosip-helm/tree/v1.2.0.1-B1) : contains packaged helm charts for all the MOSIP modules. 

**Pre-requisites**:

#### Hardware Requirements

* VM’s required can be with any OS as per convenience. 
* Here, we are referting to Ubuntu OS throughout this installation guide.

| Sl no.|  Purpose               | vCPU's   | RAM      | Storage (HDD) | no. ofVM's  | HA  |
|-------|------------------------|----------|----------|---------------|-------------|-----|
| 1.    | Wireguard Bastion Host  |  2    | 4 GB     |   8 GB        |     1       |(ensure to setup active-passive)|
| 2.    | Rancher Cluster nodes   |  2 | 8 GB      | 32 GB    |  2   | 2  |
| 3.    | Rancher Nginx server (use Loadbalancer if required)  | 2  |  4 GB     | 16 GB    |  2   | Nginx+ |
| 4.   |MOSIP Cluster nodes    | 2  |   32 GB    |  128 GB   |  6   | 6  |
| 5. |MOSIP Nginx server ( use Loadbalancer if required)  | 2  | 4 GB      | 16 GB    |  1   | Nginx+ |

#### Network Requirements

* All the VM's should be able to communicate with each other.

* Need stable Intra network connectivity between these VM's.

* All the VM's should have stable internet connectivity for docker image download (in case of local setup ensure to have a locally accesible docker registry).

* Server Interface requirement as mentioned in below table:

| Sl no.|  Purpose               | Network Interfaces                           |
|-------|------------------------|----------------------------------------------|
|1.     |Wireguard Bastion Host| _One Private interface_ : that is on the same network as all the rest of nodes (e.g.: inside local NAT Network).<br><br>_One public interface_ : Either has a direct public IP, or a firewall NAT (global address) rule that forwards traffic on 51820/udp port to this interface IP.|
|2.     | K8 Cluster nodes | One internal interface: with internet access and that is on the same network as all the rest of nodes (e.g.: inside local NAT Network )|
|3.     | Rancher Nginx server | One internal interface: with internet access and that is on the same network as all the rest of nodes (e.g.: inside local NAT Network). |
|4. |Mosip Nginx server| _One internal interface_ : that is on the same network as all the rest of nodes (e.g.: inside local NAT Network).<br><br>_One public interface_ : Either has a direct public IP, or a firewall NAT (global address) rule that forwards traffic on 443/tcp port to this interface IP.|

#### DNS Requirements:

TO DO


#### Certificate requirements

As only secured https connections are allowed via nginx server will need below mentioned valid ssl certificates:

* One valid wildcard ssl certificate related to domain used for accesing Rancher cluster, this needs to be stored inside the nginx server VM for rancher cluster. In above e.g.: *.org.net is the similiar example domain.

* One valid wildcard ssl certificate related to domain used for accesing Mosip cluster, this needs to be stored inside the nginx server VM for mosip cluster. In above e.g.: *.sandbox.xyz.net is the similiar example domain.

**Tools to be installed in Personel Computers for complete deployment**

* [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)- any client version above 1.19

* [helm](https://helm.sh/docs/intro/install/)- any client version above 3.0.0 and add below repos as well:

```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add mosip https://mosip.github.io/mosip-helm
```
* [Istioctl](https://istio.io/latest/docs/setup/getting-started/#download) : version: 1.15.0
* [rke](https://rancher.com/docs/rke/latest/en/installation/) : version: [1.3.10](https://github.com/rancher/rke/releases/tag/v1.3.10)
* [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html: version > 2.12.4
* Create a directory as mosip in your PC and:
    * clone k8’s infra repo with tag : 1.2.0.1-B2 inside mosip directory.<br>
      `git clone https://github.com/mosip/k8s-infra  -b v1.2.0.1-B2`
    * clone mosip-infra with tag : 1.2.0.1-B2 inside mosip directory.<br>
      `git clone https://github.com/mosip/mosip-infra -b v1.2.0.1-B2`
    * Set below mentioned variables in bashrc
    
    ```
    export MOSIP_ROOT=<location of mosip directory>
    export K8_ROOT=$MOSIP_ROOT/k8s-infra
    export INFRA_ROOT=$MOSIP_ROOT/mosip-infra
    ```
    `source .bashrc`
    
    >Note: Above mentioned environment variables will be used throughout the installation to move between one directory to other to run install scripts.
