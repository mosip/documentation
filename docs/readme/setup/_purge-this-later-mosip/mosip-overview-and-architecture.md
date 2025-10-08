# Overview and Architecture

## Overview

* MOSIP modules are deployed as microservices in a Kubernetes cluster.
* [Wireguard](https://www.wireguard.com/) is used as a trust network extension to access the admin, control, and observation panes.
* In case of on-field registration, WireGuard is extended to the registration client machines as one of the sources of trust.
* MOSIP uses [Nginx](https://www.nginx.com/) server for:
  * SSL termination
  * Reverse Proxy
  * CDN/Cache management
  * Load balancing
* Kubernetes cluster is administered using the [Rancher](https://rancher.com/docs/rancher/v1.3/en/kubernetes/#rancher-ui) and [rke](https://www.rancher.com/products/rke) tools.
* We have two Kubernetes clusters:

**Observation cluster** - This cluster is part of the observation plane and assists with administrative tasks. By design, this is kept independent from the actual cluster as a good security practice and to ensure clear segregation of roles and responsibilities. As a best practice, this cluster or its services should be internal and should never be exposed to the external world.

* [Rancher](https://rancher.com/docs/rancher/v1.3/en/kubernetes/#rancher-ui) is used for managing the MOSIP cluster.
* [Keycloak](https://www.keycloak.org/) in this cluster is used to manage user access and rights for the observation plane.&#x20;
* It is recommended to configure log monitoring and network monitoring in this cluster.
* In case you have an internal container registry, then it should run here.

**MOSIP cluster** - This cluster runs all the MOSIP components and certain third-party components like the kafka, keycloak etc.

* [MOSIP External Components](https://github.com/mosip/mosip-infra/blob/v1.2.0.1-B1/deployment/v3/external/README.md#mosip-external-components)
* [MOSIP Services](https://github.com/mosip/mosip-infra/blob/v1.2.0.1-B1/deployment/v3/mosip/README.md#mosip-services)

## Architecture diagram



<figure><img src="../../../../.gitbook/assets/deployment_architecture.png" alt=""><figcaption></figcaption></figure>

### Deployment repos

These are the repos that we would use for installing and configuring the MOSIP deployment. For detailed steps, please follow the guide. This section is for reference.

* [k8s-infra](https://github.com/mosip/k8s-infra/tree/v1.2.0.2) : contains the scripts to install and configure a Kubernetes cluster with required monitoring, logging, and alerting tools.
* [mosip-infra](https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3) : contains the deployment scripts to run charts in a defined sequence.
* [mosip-config](https://github.com/mosip/mosip-config/tree/v1.2.0.1) : contains all the configuration files required by the MOSIP modules.
* [mosip-helm](https://github.com/mosip/mosip-helm/tree/v1.2.0.2) : contains packaged Helm charts for all the MOSIP modules.
