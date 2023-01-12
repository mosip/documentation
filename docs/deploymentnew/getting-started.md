# Overview

MOSIP releases the below mentioned artifacts in open source:

* Jars: Artifacts released into Maven Central Repository after sucessfull compilation of tagged code from all Mosip repositories.

* Docker images: Docker images for all MOSIP services.

* MOSIP helm: Packaged charts for each and every MOSIP services. 

> helm repo add mosip https://mosip.github.io/mosip-helm

* K8s Infra: Scripts to create [kubernetes]() cluster and configure it for MOSIP.

* Deployment scripts: These scripts are a part of `mosip-infra` to install the helm charts in a desired sequence.

## MOSIP Installations

MOSIP by default supports two ways of installation:

* V2 - A simple sandbox-based implementation with very low resources to help understand the working modules (deprecated).

* V3  - A scalable deployment with a service mesh, HA and other security protection (supported from V1.2.0.1-B1).

Apart from these installation models, customers can adopt a model of their choice. We recommend using Kubernetes or equivalent container orchestration tools for better management of the microservices. 

TODO: Actual image to be attached.

Reference deployment architecture: MOSIP SecArc 
