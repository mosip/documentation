# Helm Charts

## Overview
All MOSIP services are packeged as Helm charts for ease of installation on Kubernetes cluster. The source code of Helm charts is available in [`mosip-helm`](https://github.com/mosip/mosip-helm) repository. The charts are published in `gh-pages` branch of `mosip-helm` repo which then hosted at `https://mosip.github.io/mosip-helm/index.yaml`.

## Versioning 
Helm charts follow the following versioning convention:

* Branch of [`mosip-helm`](https://github.com/mosip/mosip-helm) repo == MOSIP release version
* [Helm chart version](https://helm.sh/docs/topics/charts/#charts-and-versioning) ~= MOSIP release version but with following versioning convention:
    * MOSIP release version: `w.x.y.z`. Example `1.2.0.1`
    * Helm chart version: `wx.y.z`. Example `12.0.1` (as Helm follows 3 digit versioning).
* Only execption to the above case is `develop` branch of `mosip-helm` where `version` in `Chart.yaml` points to next planned release version of MOSIP (as Helm does not allow version like `develop`).
* Docker image tag in `values.yaml` of Helm chart == MOSIP release version.
* Helm charts contain default compatible docker image tag.
* `appVersion` field in `Charts.yaml` is not used. 

Helm chart versions are mentioned in [`Charts.yaml`](https://github.com/mosip/mosip-helm/blob/1.2.0/charts/artifactory/Chart.yaml) file under the field `versions`. 

Make sure version in `Charts.yaml` is updated for all charts when a new branch is created on `mosip-helm`.

## Glossary
|Term|Description|
|---|---|
|Helm chart version|`version` field in `Chart.yaml`.|
|MOSIP release version| Version as [published](releases.md). If a release is `w.x.y`, it implies `w.x.y.0`. Patch releases may have have 4 digits like `w.x.y.z`.|
|Docker image tag|Version of MOSIP serivce/module published as docker on Docker Hub.|

