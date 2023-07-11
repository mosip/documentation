# AWS Installation Guidelines

## Overview

* MOSIP modules are deployed in the form of microservices in kubernetes cluster.

* [Wireguard](https://www.wireguard.com/) is used as a trust network extension to access the admin, control, and observation pane. It is also used for on-the-field registrations.

* Mosip uses AWS load balancers for:

    * SSL termination

    * Reverse Proxy

    * CDN/Cache management

    * Loadbalancing

* Kubernetes cluster is administered using the [Rancher](https://rancher.com/docs/rancher/v1.3/en/kubernetes/#rancher-ui) and [EKS](https://docs.aws.amazon.com/whitepapers/latest/overview-deployment-options/amazon-elastic-kubernetes-service.html).

* In V3 we have two Kubernetes clusters:

    * Observation Cluster - This cluster is a part of the observation plane and it helps in administrative tasks. By design, this is kept independent of the actual cluster as a good security practice and to ensure clear segregation of roles and responsibilities. As a best practice, this cluster or its services should be internal and should never be exposed to the external world.

        * [Rancher](https://rancher.com/docs/rancher/v1.3/en/kubernetes/#rancher-ui) is used for managing the MOSIP cluster.

        * [Keycloak](https://www.keycloak.org/) in this cluster is used for cluster user access management.

        * It is recommended to configure log monitoring and network monitoring in this cluster.

        * In case you have an internal container registry then it should run here.

    * MOSIP Cluster - This cluster runs all the MOSIP components and certain third party components to secure the cluster, API’s and Data.

        * [MOSIP External Components](https://github.com/mosip/mosip-infra/blob/v1.2.0.1-B1/deployment/v3/external/README.md#mosip-external-components)

        * [MOSIP Services](https://github.com/mosip/mosip-infra/blob/v1.2.0.1-B1/deployment/v3/mosip/README.md#mosip-services)
