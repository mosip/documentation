# Biometric SDK

## Overview

![](../.gitbook/assets/sdk.png)

## Applications

* Registration Client.
* Backend quality check.
* Biometric authentication during onboarding (internal auth).
* ID Authentications.

## Biometric SDK library

The library is used by [Registration Client](../modules/registration-client/) to perform 1:N match, segmentation, extraction etc. For more information on integration with Registration Client, refer to [Registration Client Biometric SDK Integration Guide](../registration-client-sdk-integration.md).

A simulation of this library is available as [Mock BioSDK](https://github.com/mosip/mosip-mock-services/tree/release-1.2.0/mock-sdk). The same is installed in the [MOSIP sandbox](../sandbox-details.md).

## Biometric SDK service

For 1:1 match and quality check of biometrics at the MOSIP backend, the BioSDK must be running as a service that can be accessed by [Registration Processor](../modules/registration-processor/) and [IDA Internal Services](../modules/id-authentication-services/#internal-services). The service exposes REST APIs specified [here](biometric-sdk.md#api).

A [simulation (mock) service](https://github.com/mosip/biosdk-services/tree/release-1.2.0) has been provided. The mock service loads [mock BioSDK](https://github.com/mosip/mosip-mock-services/tree/release-1.2.0/mock-sdk) internally on the startup and exposes the endpoints to perform 1:N match, segmentation, extraction as per [IBioAPI](https://github.com/mosip/commons/blob/release-1.2.0/kernel/kernel-biometrics-api/src/main/java/io/mosip/kernel/biometrics/spi/IBioApi.java).

The service may be packaged as a docker running inside [MOSIP Kubernetes cluster](https://github.com/mosip/mosip-infra/blob/release-1.2.0/deployment/v3/cluster/README.md) or running separately on a server. It is important that the scalability of this service is taken care depending on the load on the system, i.e., the rate of enrolment and ID authentication.

## API

1. BioSDK library: [IBioAPI](https://github.com/mosip/commons/blob/release-1.2.0/kernel/kernel-biometrics-api/src/main/java/io/mosip/kernel/biometrics/spi/IBioApi.java).
2. BioSDK service: TBD.

## Testing kit

BioSDK server request/response may be tested using [BioSDK testing kit](https://github.com/mosip/biosdk-testing-kit.git).

## Configuration

The following properties in [`application-default.properties`](biometric-sdk.md) needs to be updated to integrate the BioSDK library and service with MOSIP.

```
mosip.fingerprint.provider=io.mosip.kernel.bioapi.impl.BioApiImpl
mosip.face.provider=io.mosip.kernel.bioapi.impl.BioApiImpl
mosip.iris.provider=io.mosip.kernel.bioapi.impl.BioApiImpl
mosip.ida.biosdk-service.url=http://mock-biosdk-service.default:80
mosip.regproc.biosdk-service.url=http://mock-biosdk-service.default:80
mosip.idrepo.biosdk-service.url=http://mock-biosdk-service.default:80
```
