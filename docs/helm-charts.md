# Helm Charts

## Overview
All MOSIP services are packeged as Helm charts for ease of installation on Kubernetes cluster. The Helm charts are available in [`mosip-helm`](https://github.com/mosip/mosip-helm) repository.

## Versioning 
Helm charts follow the following versioning convention:

* [Helm chart version](https://helm.sh/docs/topics/charts/#charts-and-versioning) == branch of [`mosip-helm`](https://github.com/mosip/mosip-helm) repo == MOSIP release version
* Helm charts contain default compatible MOSIP services Docker versions. 
* `appVersion` field in `Charts.yaml` is not used. 

Helm chart versions are mentioned in [`Charts.yaml`](https://github.com/mosip/mosip-helm/blob/1.2.0/charts/artifactory/Chart.yaml) file under the field `versions`. 

## Compatiblity matrix

