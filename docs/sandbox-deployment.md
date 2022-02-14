# Sandbox Deployment

## Overview
MOSIP components are available as Dockers on [Docker Hub](). We provide deployment guide and scripts to install the same on [Kubernetes](https://kubernetes.io).

## Single click installer (V2)
The [single click installer](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/sandbox-v2), also called V2 is an installer based on Ansible scripts. The sandbox may be used for development and testing.

The configuration properties used in this installer are available [here](https://github.com/mosip/mosip-config/tree/release-1.2.0).

## Production grade deployment (V3) 
Currently available as _Beta_, [V3](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/v3) is a reference implementation of a Kubernetes based production grade deployment of MOSIP. The same may be deployed both as a sandbox or full-scale production deployment. Several security features and enhancements have been added over the single click installer.

The configuration properties used in this installer are available [here](https://github.com/mosip/mosip-config/tree/develop3-v3).



