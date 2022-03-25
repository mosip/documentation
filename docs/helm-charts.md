# Helm Charts

## Overview
All MOSIP services are packeged as Helm charts for ease of installation on Kubernetes cluster. The Helm charts are available in [`mosip-helm`](https://github.com/mosip/mosip-helm) repository.

## Versioning 
Helm charts follow their own versioning. However, Helm versions and branch version of `mosip-infra` repo must match for ease of maintance. Example, in `mosip-infra` branch `1.2.0` all Helm charts' versions must also be `1.2.0`. 

Helm chart versions are mentioned in [`Charts.yaml`](https://github.com/mosip/mosip-helm/blob/1.2.0/charts/artifactory/Chart.yaml) file under the field `versions`. 

The docker version inside `values.yaml` will have a default value, but that may be overridden in specific MOSIP installation of `mosip-infra`.  Version of MOSIP must match `mosip-infra` branch. The specific Helm chart version and Docker version is mentioned under `./install.sh` scripts of `mosip-infra`.

* `mosip-infra` branch == MOSIP version
* `mosip-helm` branch == Helm chart version

## Compatiblity matrix
