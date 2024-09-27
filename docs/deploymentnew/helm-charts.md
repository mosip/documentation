# Helm Charts

## Overview

All MOSIP services are packaged as Helm charts for ease of installation on the Kubernetes cluster. The source code of Helm charts is available in [`mosip-helm`](https://github.com/mosip/mosip-helm) repository. The packaged charts (`*.tgz`) are checked in `gh-pages` branch of `mosip-helm` repo. GitHub automatically hosts them at `https://mosip.github.io/mosip-helm/index.yaml`. See the sections below for further details.

## Chart versioning

Refer [Versioning](versioning.md).

Make sure the version in `Charts.yaml` is updated for all charts when a new branch is created on `mosip-helm`.

## Installing charts

To install the charts, add the repository as below:

```
helm repo add mosip https://mosip.github.io/mosip-helm
```

## Publishing charts

To publish charts manually follow these steps:

* In the branch where changes have been made run the following from `mosip-helm` folder

```
helm package charts/<chart name>
```

* You will see packaged `.tgz` files created in the current directory.
* Copy the `.tgz` files to `gh-pages` branch of `mosip-helm` repo. You can clone another copy of the repo and check out `gh-pages` branch to achieve this.
* Run

```
./publish.sh
```
