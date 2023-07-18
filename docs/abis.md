# ABIS

## Overview

Providing a unique identity for a resident is one of the key features of any identity platform. To achieve this, MOSIP interfaces with an **Automated Biometric Identification System (ABIS)** to perform the de-duplication of a resident's biometric data.

The ABIS system never learns about residents' identities. Any Personally Identifiable Information (PII), such as demographic details or an applicant's AID (application ID), is not shared with the ABIS system. Internally, MOSIP maintains a mapping between the ABIS-specific reference ID and the AID of the resident.

{% hint style="info" %}
ABIS is used for 1:N deduplication. For 1:1 authentication, [Biometric SDK](biometric-sdk.md) is used. MOSIP does not recommend using an ABIS for 1:1 authentication.
{% endhint %}

![](\_images/abis.png)

## MOSIP-ABIS interface

MOSIP interacts with ABIS only via message queues. The JSON format is used for all control messages in the queue. MOSIP [ABIS middleware](https://github.com/mosip/registration/tree/release-1.2.0/registration-processor/core-processor/registration-processor-abis-middleware-stage) sends requests to the inbound queue address and receives responses from the outbound queue address. ABIS must comply with the interface defined in [ABIS API Specifications](abis-api.md)

The interface may be tested using the [ABIS testing kit](https://github.com/mosip/abis-testing-kit/tree/1.2.0).

ABIS must support the following types of biometric images:

* Individual fingerprint images (segmented)
* Iris images (left, right)
* Face image

Biometrics data in MOSIP is exchanged as per formats defined in [Biometric Image Specification](broken-reference).

## Test kits

MOSIP provides kits to test the interface. Refer to the [abis-testing-kit repo](https://github.com/mosip/abis-testing-kit/tree/1.2.0)

## ABIS deployment

* ABIS must comply with [ABIS API Specifications](abis-api.md).
* The queues can be configured in the [RegistrationProcessorAbis-env.json](https://github.com/mosip/mosip-config/blob/master/config-templates/RegistrationProcessorAbis-env.json) file. The ABIS system connects to the queues using a pre-defined user ID and password.
* It is recommended that ABIS be deployed in the same secure zone (military zone) where the registration processor is deployed.
* ABIS system is not recommended to connect to any external network.
