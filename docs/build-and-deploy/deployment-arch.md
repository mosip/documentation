# Deployment Architecture

This page has the proposed deployment architecture for e-Signet.

<figure><img src="../.gitbook/assets/deployment-diagram.png" alt=""><figcaption><p><em>e-Signet Deployment Diagram</em></p></figcaption></figure>

Firewall is a network security device that monitors and filters incoming and outgoing network traffic based on an organization's established security policies. It provides protection against outside cyber attackers by shielding the network from malicious or unnecessary network traffic. All incomming traffic from internet is routed through the firewall.A firewall is a network security device. It monitors and filters both incoming and outgoing network traffic according to the organization's predefined security policies. By shielding the network from malicious or unnecessary traffic, it provides protection against external cyber attackers. All incoming internet traffic is routed through the firewall.

A load balancer is a network device or service that evenly distributes incoming network traffic across multiple servers or resources. It operates based on predetermined rules or algorithms and helps optimize the use of these resources. The primary purpose of a load balancer is to ensure that no single server becomes overwhelmed with traffic, thereby improving performance, availability, and reliability for users accessing a particular service or application. Additionaly we use it for following mentioned used cases: 1. SSL termination. 2. Proxy pass . 3. TCP communication. 4. UDP communication. 5. Reverse Proxy.

Wireguard is used as a trusted network extension to provide secure access to control and monitoring panels for operational team members making sure that restricted api's are not publically accessible.

Internal IAM system is used to manage the access control for operation team and client management API calls from client management systems

Deployment layers can be sectioned into below 3 sections.

1. Application cluster

eSignet application services are deployed in the form of pods in kubernetes cluster.

Artifactory Service - This pod contains enviroment specific libraries like HSM client and eSignet plugins. When eSignet service pod starts, these libraries are download from artifactory and added to the application loader path.

Config Server - This pod is responsible to serve the external property files to application service pods. These property files are actually maintained in a private Git repository and Config service acts more like a secure proxy.]

OIDC UI - This pod will expose all the UI component files that is requested from browser once eSignet portal is accessed

eSigent Service - This is the actuall backend service which exposes all the RESTfull API endpoints, which includes all endpoints related to OIDC, VCI, UI and client management. This service has a plugin based mechanism to integrate with the ID system for actual user verification. It also connects to the below cluster for various needs.

```
PostgreSQL DB cluster - All the data related to client policies, consent etc.. are stored in this cluster. It should be a highly available cluster with necessary replication levels using solutions like Citus
Redis cache cluster - All transactional caching needs are taken care by redis cluster 
HSM Cluster - This cluster provides the necessary security to the crptographic keys used in the application. Access to this cluster should be allowed only from few selected nodes to control access and improve security
```

Below additional kubernetes compatible tools are also configured into the kubernetes cluster to take care of security and routing needs.

Ingress Gateway - An ingress Gateway is a load balancer operating at the edge of the mesh that receives incoming HTTP/TCP connections. It configures exposed ports, protocols, etc.

Istio Service mesh - is a service mesh used as ingress gateway also in the k8 cluster. Istio is used to managing the request routing in service to service communication. It can also help with service discovery, load balancing, failure recovery, metrics, and monitoring.

Docker Registry - Local docker registry is used to improve restart timings of containers where the images are configured to be pulled everytime to the running node. It also help with redusing the usage internal bandwidth since images are caching within the setup

Kubernetes Secrets - Kubernetes Secret is used for storing and managing sensitive information like DB passwords, keycloak sectets etc.. that is required by application pods. It gives us more control over how sensitive information is used and reduces the risk of accidental exposure.

2. Control Panel

Tools in the control Panel will be used by operations team members to manage the deployment and maintain the uptime in Kubernetes cluster

Rancher is a complete stack for managing containers. It addresses the operational and security challenges of managing multiple Kubernetes clusters, while providing DevOps teams with integrated tools for running containerized workloads. Rancher is integrated with IAM for authentication of users.

Helm chart is a package manager for kubernetes based Objects. For each module, multiple related components are grouped together and their deployment scripts are packaged as hosted helm charts, so each module can be installed and upgraded independently.

3. Monitoring Panel

Monitoring Panel will be used by operations team members to observe the health of various application pods and debug specific issues using application logs.

Application logs and metrics are collected by fluentbit and dumped into elastic search and prometheus respectively.

The application log data stored in elastic search is configured as reports using Kibana and can be used for searching logs when debugging application issues. The metric data stored in prometheus are configured as charts in Grafana to continously montitor the health of the enviroment and containers. Explict notifications can be configured as alerts when the metrics reaches a particular threshold.

