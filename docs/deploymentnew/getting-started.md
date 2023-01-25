# Overview

MOSIP is deployed as a combination of microservices. MOSIP deployment as mircroservices adds more scalability, robustness, resilience and fault tolerance. MOSIP services are grouped as multiple modules like Kernel, prereg, regproc etc. These modules can be deployed independently with all its dependencies as per the business needs. 

MOSIP releases the below mentioned artifacts in open source:

* [Jars](https://repo1.maven.org/maven2/io/mosip/) : Artifacts released into Maven Central Repository after successful compilation of tagged code from all Mosip repositories.

* [Docker images](https://hub.docker.com/search?q=mosipid) : Docker images for all MOSIP services.

* MOSIP helm: Packaged charts for every MOSIP service. 

    `helm repo add mosip https://mosip.github.io/mosip-helm`

* [K8s Infra](https://github.com/mosip/k8s-infra): Scripts to create [kubernetes](https://kubernetes.io/) cluster and configure it for MOSIP.

* Deployment scripts: These scripts are a part of [mosip-infra](https://github.com/mosip/mosip-infra) to install the helm charts in a desired sequence.

## MOSIP installations

MOSIP by default supports two ways of installation:

* [V2](https://docs.mosip.io/1.2.0/deploymentnew/v2-installer) - A simple sandbox-based implementation with very low resources to help understand the working modules (deprecated).

* [V3](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation)  - A scalable deployment with a service mesh, HA and other security protection (supported from v1.2.0.1-B1).

Apart from these installation models, countries can adopt a model of their choice. We recommend using Kubernetes or equivalent container orchestration tools for better management of the microservices. 

