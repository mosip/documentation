# Helm Charts

## Overview
All MOSIP services are packeged as Helm charts for ease of installation on Kubernetes cluster. The source code of Helm charts is available in [`mosip-helm`](https://github.com/mosip/mosip-helm) repository. The packaged charts (`*.tgz`) are checked in `gh-pages` branch of `mosip-helm` repo. Github automatically hosts them at `https://mosip.github.io/mosip-helm/index.yaml`.  See sections below for futher details.

## Versioning 
Refer [Versioning](sandbox-deployment.md#versioning).

Make sure version in `Charts.yaml` is updated for all charts when a new branch is created on `mosip-helm`.

## Installing charts
To install the charts add the respository as below:
```sh
helm repo add mosip https://mosip.github.io/mosip-helm
```
## Publishing charts
To publish charts manually follow these steps:

* In the branch where changes have been made run the following from `mosip-helm` folder
```sh
helm package charts/<chart name>
```
* You will see packaged `.tgz` files created in current directory.
* Copy the `.tgz` files to `gh-pages` branch of `mosip-helm` repo. You can clone another copy of the repo and check out `gh-pages` branch to achieve this.
* Run 
```sh
./publish.sh
```

## Active branches
Branches of `mosip-helm` chart that are being actively update are listed below. Other branches are assumed to be frozen. Make sure any changes are reflected in these branches (if applicable).
* `develop`


