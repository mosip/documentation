# Biometric Devices

## Overview
Biometric devices capture individuals biometric data (fingerprint, iris scan, photo) and send it to registration client or authentication client (app). The functional architecture of various entities involved is shown below.

![](_images/sdk.png)

## Modalities
Modalities supported in MOSIP are
1. [Fingerprint](biometric-image-specification.md#fingerprint)
1. [Iris](biometric-image-specification.md#iris)
1. [Face](biometric-image-specification.md#face)

## Device types 
|Purpose|Type|Subtype\*|Certification|Specification|
|---|---|---|---|---|
|Registration|Fingerprint|Slap scanner|SBI 1.0|[Fingerprint image spec](biometric-image-specification.md#fingerprint)|
|Registration|Iris|Double eye scanner|SBI 1.0|[Iris image spec](biometric-image-specification.md#iris)|
|Registration|Face|Camera|SBI 1.0|[Face image spec](biometric-image-specification.md#face)|
|Authentication|Fingerprint|Single finger scanner|SBI 2.0|[Fingerprint image spec](biometric-image-specification.md#fingerprint)|
|Authentication|Iris|Single eye scanner|SBI 2.0|[Iris image spec](biometric-image-specification.md#iris)|
|Authentication|Face|Camera|SBI 2.0|[Face image spec](biometric-image-specification.md#face)|

\* An adopter may choose to have different subtypes, however, the certification needs to be adhered to.

## Encrolment flow

![](_images/devices-enrolment.png)

## Authentication flow

![](_images/devices-authentication.png)

## Device trust
MOSIP compliant devices provide a trust environment for the devices to be used in registration, KYC and AUTH scenarios. The trust level is established based on the device support for trusted execution.

### Types of encryption keys
* Device key [TBD]
* FTM key
* MOSIP public key

### L0
* L0 - The trust is provided at the software level. No hardware related trust exist. This type of compliance is used in controlled environments.
* Digital id and data encryption
 
### L1
* The trust is provided by a secure chip - [FTM](ftm.md) - with secure execution environment.
* Digital id and data encryption

### Key rotation

## Device onboarding


## Test kits

## Management server

## Devices calculator 
The following calculator may be used to estimate number of devices required for a rollout. 

[MOSIPDevicesCalculator](_files/mosip-devices-calculator.xls)

## Partners
Providers of biometric devices are Partners of MOSIP and need to be onboarded to a given deployment of MOSIP. Specifically,
* [Device Partner](partners.md#device-partner-dp)
* [FTM Partner](partners.md#ftm-partner-ftmp)
 






