# Biometric SDK 

## Overview

![](_images/sdk.png)

## Application
* Registration client
* Backend quality check
* Biometric authentication during onboarding (internal auth)


## BioSDK library
The library is used by [Registration Client](registration-client.md) to perform 1:N match, segmentation, extraction etc.

A simulation of this library is available as [Mock BioSDK](https://github.com/mosip/mosip-mock-services/tree/release-1.2.0/mock-sdk). The same is installed in [MOSIP sandbox](sandbox-deployment.md).

## BioSDK service
For 1:1 match and quality check of biometrics at MOSIP backend, the bioSDK must be running as a service that can be accessed by [Registration Processor](registration-processor.md) and [IDA Internal Services](id-authentication-services.md#internal-services). The service exposes REST APIs specified [here](#api).

A [simulation (mock) service](https://github.com/mosip/biosdk-services/tree/release-1.2.0) has been provided. The mock service loads [mock BioSDK](https://github.com/mosip/mosip-mock-services/tree/release-1.2.0/mock-sdk) internally on the startup and exposes the endpoints to perform 1:N match, segmentation, extraction as per [IBioAPI](https://github.com/mosip/commons/blob/release-1.2.0/kernel/kernel-biometrics-api/src/main/java/io/mosip/kernel/biometrics/spi/IBioApi.java).

The service may be packaged as a docker running inside [MOSIP Kubernetes cluster](https://github.com/mosip/mosip-infra/blob/release-1.2.0/deployment/v3/cluster/README.md) or running separately on a server.  It is important that scalability of this service is taken care depending on the load on the system, i.e. rate of enrolment and ID authentication.

## API
1. BioSDK library: [IBioAPI](https://github.com/mosip/commons/blob/release-1.2.0/kernel/kernel-biometrics-api/src/main/java/io/mosip/kernel/biometrics/spi/IBioApi.java).
1. BioSDK service: TBD.

## Testing kit
BioSDK server request/response may be tested using [BioSDK testing kit](https://github.com/mosip/biosdk-testing-kit.git).

## Configuration 
The following properties in [`application-default.properties`]() need to be updated to integrate bioSDK libray and service with MOSIP.

```
mosip.fingerprint.provider=io.mosip.kernel.bioapi.impl.BioApiImpl
mosip.face.provider=io.mosip.kernel.bioapi.impl.BioApiImpl
mosip.iris.provider=io.mosip.kernel.bioapi.impl.BioApiImpl
mosip.ida.biosdk-service.url=http://mock-biosdk-service.default:80
mosip.regproc.biosdk-service.url=http://mock-biosdk-service.default:80
mosip.idrepo.biosdk-service.url=http://mock-biosdk-service.default:80
```




