---
hidden: true
---

# Deployment Architecture

## Deployment Architecture

<figure><img src="../../../.gitbook/assets/iww-deployment-diagram.png" alt=""><figcaption><p>Inji Web Deployment Architecture</p></figcaption></figure>

### Firewall

A firewall is a network security device that monitors and filters incoming and outgoing network traffic based on an organization's established security policies. It protects against outside cyberattacks by shielding the network from malicious or unnecessary network traffic. All incoming traffic from the internet is routed through the firewall.

### Load Balancer

A load balancer is a network device or service that evenly distributes incoming network traffic across multiple servers or resources. It operates based on predetermined rules or algorithms and helps optimize the use of these resources. The primary purpose of a load balancer is to ensure that no single server becomes overwhelmed with traffic, thereby improving performance, availability, and reliability for users accessing a particular service or application.

Additionally, we use it in the following cases:

1. SSL termination
2. Proxy pass
3. TCP communication
4. UDP communication
5. Reverse Proxy

### IAM

Wireguard is used as a trusted network extension to provide secure access to control and monitoring panels for operational team members, making sure that restricted APIs are not publically accessible.

The internal IAM system is used to manage access control for the operation team and client management API calls from client management systems

### Deployment Layers

Deployment layers can be sectioned into the below three sections.

#### Application Cluster

eSignet application services are deployed in the form of pods in the Kubernetes cluster.

**Artifactory Service**

This pod contains environment-specific libraries like HSM client and eSignet plugins. When the eSignet service pod starts, these libraries are downloaded from the artifactory and added to the application loader path.

**Config Server**

This pod is responsible for serving the external property files to application service pods. These property files are maintained in a private Git repository and the Config service acts more like a secure proxy.

**OIDC UI**

This pod will expose all the UI component files that are requested from the browser once the eSignet portal is accessed.

**PostgreSQL DB Cluster**

All the data related to client policies, consent, etc. are stored in this cluster. It should be a highly available cluster with necessary replication levels using solutions like Citus.

**Redis Cache Cluster**

All transactional caching needs are taken care of by the Redis cluster.

_**Note:**_ Below additional Kubernetes-compatible tools are also configured into the Kubernetes cluster to take care of security and routing needs.

**Ingress Gateway**

An ingress Gateway is a load balancer operating at the edge of the mesh that receives incoming HTTP/TCP connections. It configures exposed ports, protocols, etc.

**Istio Service Mesh**

This is a service mesh used as an ingress gateway in the k8 cluster. Istio is used to manage the request routing in service-to-service communication. It can also help with service discovery, load balancing, failure recovery, metrics, and monitoring.

**Docker Registry**

Local docker registry is used to improve restart timings of containers where the images are configured to be pulled every time to the running node. It also helps with reducing the usage of internal bandwidth since images are caching within the setup.

**Kubernetes Secrets**

Kubernetes Secret is used for storing and managing sensitive information like DB passwords, keycloak secrets, etc.. that is required by application pods. It gives us more control over how sensitive information is used and reduces the risk of accidental exposure.

#### Control Panel

Tools in the Control Panel will be used by operations team members to manage the deployment and maintain the uptime in the Kubernetes cluster

**Rancher**

Rancher is a complete stack for managing containers. It addresses the operational and security challenges of managing multiple Kubernetes clusters while providing DevOps teams with integrated tools for running containerized workloads. Rancher is integrated with IAM for the authentication of users.

**Helm Chart**

Helm chart is a package manager for Kubernetes-based Objects. For each module, multiple related components are grouped and their deployment scripts are packaged as hosted helm charts, so each module can be installed and upgraded independently.

#### Monitoring Panel

Monitoring Panel will be used by operations team members to observe the health of various application pods and debug specific issues using application logs.

Application logs and metrics are collected by Fluentbit and dumped into Elastic Search and Prometheus respectively.

The application log data stored in elastic search is configured as reports using Kibana and can be used for searching logs when debugging application issues. The metric data stored in Prometheus are configured as charts in Grafana to continuously monitor the health of the environment and containers. Explicit notifications can be configured as alerts when the metrics reach a particular threshold.
