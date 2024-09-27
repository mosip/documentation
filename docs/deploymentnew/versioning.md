# Versioning

The following versioning conventions are followed for repos related to deployment:

* [`mosip-infra`](https://github.com/mosip/mosip-infra) branch == MOSIP release version == [`mosip-helm`](https://github.com/mosip/mosip-helm) branch.
* [`k8s-infra`](https://github.com/mosip/k8s-infra) is on `main` branch.
* [Helm chart version](versioning.md#glossary) \~= [MOSIP release version](versioning.md#glossary) but with following versioning convention:
  * MOSIP release version: `w.x.y.z`. Example `1.2.0.1`
  * Helm chart version: `wx.y.z`. Example `12.0.1` (as Helm follows 3 digit versioning).
  * In case of `develop` branch of `mosip-helm` `version` in `Chart.yaml` points to next planned release version of MOSIP (as Helm does not allow version like `develop`).
* [Docker image tag](versioning.md#glossary) in `values.yaml` of Helm chart == MOSIP release version.
* Helm charts contain default compatible docker image tag.
* `appVersion` field in `Charts.yaml` is not used.

## Glossary

| Term                  | Description                                                                                                                                |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| Helm chart version    | `version` field in [`Charts.yaml`](https://github.com/mosip/mosip-helm/blob/1.2.0/charts/artifactory/Chart.yaml)                           |
| MOSIP release version | Version as [published](../releases/). If a release is `w.x.y`, it implies `w.x.y.0`. Patch releases may have have 4 digits like `w.x.y.z`. |
| Docker image tag      | Version of MOSIP service/module published as docker on Docker Hub.                                                                         |
