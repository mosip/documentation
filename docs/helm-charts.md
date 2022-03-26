# Helm Charts

## Overview
All MOSIP services are packeged as Helm charts for ease of installation on Kubernetes cluster. The Helm charts are available in [`mosip-helm`](https://github.com/mosip/mosip-helm) repository.

## Versioning 
Helm charts follow their own versioning with following conventions:

* Helm chart version == branch of [`mosip-helm`](https://github.com/mosip/mosip-helm) repo.
* MOSIP release version == branch of [`mosip-infra`](https://github.com/mosip/mosip-infra) repo
* Docker/image version of a MOSIP module used with given MOSIP release version explicitly mentioned in `install.sh` files of [`mosip-infra`](https://github.com/mosip/mosip-infra).
* Helm chart version is changed only if there are changes in the chart necessary for a given version of MOSIP. Chart versions **do not** change if docker/image version is changed.
 
Helm chart versions are mentioned in [`Charts.yaml`](https://github.com/mosip/mosip-helm/blob/1.2.0/charts/artifactory/Chart.yaml) file under the field `versions`. 

## Compatiblity matrix

