# Helm Charts

## Overview
All MOSIP services are packeged as Helm charts for ease of installation on Kubernetes cluster. The Helm charts are available in [`mosip-helm`](https://github.com/mosip/mosip-helm) repository.

## Versioning 
Helm charts follow the following versioning convention:

* Branch of [`mosip-helm`](https://github.com/mosip/mosip-helm) repo == MOSIP release version
* [Helm chart version](https://helm.sh/docs/topics/charts/#charts-and-versioning) ~= MOSIP release version but with following versioning convention:
    * MOSIP release version: `w.x.y.z`. Example `1.2.0.1`
    * Helm chart version: `wx.y.z`. Example `12.0.1`
* Only execption to the above case is `develop` branch of `mosip-helm` in which `version` in `Chart.yaml` will point to next planned release version of MOSIP.
* Helm charts contain default compatible MOSIP services Docker versions. 
* `appVersion` field in `Charts.yaml` is not used. 

Helm chart versions are mentioned in [`Charts.yaml`](https://github.com/mosip/mosip-helm/blob/1.2.0/charts/artifactory/Chart.yaml) file under the field `versions`. 

Make sure version in `Charts.yaml` is update for all charts when a new branch is created of `mosip-helm`.

## Compatiblity matrix

