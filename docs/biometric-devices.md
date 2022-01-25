# Biometric Devices

## Overview
Biometric devices capture individuals biometric data (fingerprint, iris scan, photo) and send it to registration client or authentication client (app). The functional architecture of various entities involved is shown below.

![](_images/sdk.png)

## Device types 

### Purpose
* Registration
* Authentication

### Modalities
1. Fingerprint
1. Iris
1. Face

Typical selection of devices is given below.  An adopter may choose to have different sub-types, however, the certification needs to be adhered to.

|Purpose|Type|Sub Type|Certification|Specification|
|---|---|---|---|---|
|Registration|Fingerprint|Slap scanner|L0|[Fingerprint image spec](biometric-image-specification.md#fingerprint)|
|Registration|Iris|Double eye scanner|L0|[Iris image spec](biometric-image-specification.md#iris)|
|Registration|Face|Camera|L0|[Face image spec](biometric-image-specification.md#face)|
|Authentication|Fingerprint|Single finger scanner|L1|[Fingerprint image spec](biometric-image-specification.md#fingerprint)|
|Authentication|Iris|Single eye scanner|L1|[Iris image spec](biometric-image-specification.md#iris)|
|Authentication|Face|Camera|L1|[Face image spec](biometric-image-specification.md#face)|

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

## Devices calculator for production

## Partners

Onboarding of these partners.

* Device Provider
* FTM Providers
 






