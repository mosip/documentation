## Overview

Providing unique identity for a resident is one of key features of any identity platform. To achieve this, MOSIP interfaces with an Automated Biometric Identification System (ABIS) to perform de-duplication of a resident's biometric data. 

MOSIP is designed to integrate with multiple ABISs to leverage expertise of different ABIS providers. A country may use one ABIS for fingerprint and another for Iris or use multiple ABISs for the same biometric data and evaluate the best ABIS based on de-duplication quality. 

The ABIS system will never come to know about hte resident's identity. Any PII information such as demographic details of the resident or RID (Request ID for Registration) will be shared with the ABIS system. But, MOSIP maintains a mapping between the ABIS specific referenceID and RID of the resident.

**_Note:_** ABIS is used for deduplication during registration, but not for authentication.

![](_images/arch_diagrams/ABIS_middleware.png)

## ABIS middleware
MOSIP's ABIS middleware has the following components
- MOSIP ABIS request handler 
- Request router (based on routing policy, an ABIS request is routed to the correct ABIS system)
- ABIS response handler

![MOSIP ABIS Middleware](_images/arch_diagrams/MOSIP_ABIS_middleware.png)

## ABIS interface
MOSIP interacts with ABIS only via message queues. JSON format is used for all control messages in the queue for details go through the [ABIS API Specifications](ABIS-APIs.md).

ABIS must support the following types of biometric images,
* Individual fingerprint images (segmented)
* IRIS images (left, right)
* Face photograph

Biometrics data in MOSIP is exchanged as per formats defined in [Biometric Data Specification](Biometric-Data-Specification.md). The biometric data is wrapped in [CBEFF XML](CBEFF-XML.md) and sent to ABIS.

## ABIS queue
ABIS queue can be configured in [RegistrationProcessorAbis-env.json](https://github.com/mosip/mosip-config/blob/master/config-templates/RegistrationProcessorAbis-env.json) file. MOSIP ABIS middleware communicates to ABIS through queues configured by sending requests to inbound queue address and receiving responses from outbound queue address.

## ABIS deployment
* It is recommended that the MOSIP adopters deploy ABIS on the same secure zone (military zone) where the registration processor is deployed. 
* ABIS system will connect to the queue using a pre-defined user id and password. 
* ABIS system is not recommended to connect to any external network.

