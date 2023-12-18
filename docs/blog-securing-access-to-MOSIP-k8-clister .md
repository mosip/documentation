# Securing the access for MOSIP environment kubernetes clusters
## What is kubernetes cluster?
Kubernetes is an open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications. It allows you to abstract away the underlying infrastructure, providing a consistent and declarative way to manage containerized workloads.
## Kubernetes clusters in MOSIP
Overall in MOSIP there are two kubernetes clusters for an environment.
  * Observation Cluster : One for a country/SI/Organisation wide cluster, this is where other kubernetes clusters are imported for adding/updating/viewing  the other kubernetes resources.  
  * MOSIP cluster : Kubernetes cluster in which all the MOSIP and its dependent services are deployed. 
## Securing MOSIP's kubernetes clusters
* Securing Kubernetes clusters in the context of MOSIP involves a combination of VPN solutions, identity and access management, service mesh for traffic control, and additional security measures.
* This multi-layered approach is essential to meet the security requirements of a country-wide Identity system like MOSIP, ensuring:
  * Protection against potential threats.
  * Maintaining Funtionality.
  * Ensuring Confidentiality.
  * Preventing data breaches.
  * Environments have 99% uptime.
## How do we secure MOSIP's kubernetes cluster ?
Below are the mentioned steps taken for securing the kubernetes clusters:
* Wireguard: Limiting access to the Kubernetes nodes to authorized administrators.
  * WireGuard is a lightweight and secure VPN (Virtual Private Network) solution that can be used to establish encrypted communication channels between user and different nodes.
  * In the context of securing Kubernetes nodes and limiting access to authorized administrators, you can use WireGuard to create a secure communication channel between administrators and the Kubernetes nodes.
  * So nobody will be able to access the kunernetes nodes without having proper wireguard configuration provided by DevOps Admin.
  * This approach centralizes access through the Bastion server, providing an additional layer of security and control over who can access the Kubernetes nodes.
  * Here's a general outline of the steps to be taken:
    * Setting up Wireguard [Bastion](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#setup-wireguard-vm-and-wireguard-bastion-server) : Create a Wireguard Bastion server to secure access to all the nodes by configuring it for defined CIDR range in which all the k8 nodes are present.
    * [Wireguad client](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#setup-wireguard-client-in-your-pc) on Administrator's device.
    * Sharing Unique and proper wireguard configuration files to each adminstrator.
* Rancher + Keycloak : Implement Role-Based Access Control (RBAC) to control access to resources within each Kubernetes cluster.
  * Rancher acts as a management platform for Kubernetes clusters.
  * Keycloak serves as an identity provider and handles authentication.
  * Below are the steps for setting up Rancher .
* Istio: Secure access to administrative dashboards within the Kubernetes clusters.
  * This involves leveraging Istio's capabilities for traffic management, access control, and security policies.
  * Istio provides powerful features to control and secure the flow of traffic between services.
  * Below are general steps to secure access to administrative dashboards within Kubernetes clusters using Istio
    * In MOSIP we have two ingress controllers:
      * Ingress Controller: Ingress controller is a component that manages external access to services within a cluster. It acts as a traffic manager, routing incoming requests to the appropriate services based on defined rules.
      * Two ingress controllers in MOSIP:
        * ingressgateway : It exposes the publically available required dashboards outside of wireguard. These dashboards can be accessed without using dashboards.
        * ingressgateway-internal : It exposes the multiple administrative dashboards via wireguard. You need wireguard to connect to these dashboards.
    * We also have multiple gateways linked to each UI dashboards in MOSIP.
      * Gateways : Gateway is a resource that defines how external traffic should be routed to services within the cluster.
      * Gateways are often associated with service meshes, where they play a key role in managing ingress and egress traffic
      * The gateways of the required adminstrative dashboards always points to the `ingressgateway-internal`.
      * After pointing to right `ingressgateway` make sure it is pointing to correct host.
    * Each Services and UI has its own `virtualservices`.
      * Virtualservice: VirtualService is a resource that defines a set of rules that determine how requests to a Kubernetes service should be routed within the Istio service mesh.
      * The primary purpose of a VirtualService is to define routing rules for incoming traffic to a service.
      * You can specify various conditions based on which traffic should be routed to different destination services or versions.
      * From each `virtualservices` we link them correctly to their `gateway` and context paths so that they gets configured correctly to recieve traffice from relevant ingressgateway.
    * This way we make sure that all the admintrative dashboard's access is restricted to wireguard via use of relevant `ingressgateway`, `gateways` and `virtualservices`.
