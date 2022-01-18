# Biometric Devices

## Overview
Biometric devices capture individuals biometric data (fingerprint, iris scan, photo) and send it to registration client or authentication client (app). The functional architecture of various entities involved is shown below.

![](_images/sdk.png)

## Device types 
Supported modalities
1. Fingerprint
1. Iris
1. Camera

* Auth and registration devices.

## Device recommendations

### Device Specification
The MOSIP device specification provides compliance guidelines to devices for them to work with MOSIP. The compliance is based on device capability, trust and communication protocols. A MOSIP compliant device would follow the standards established in this document. It is expected that the devices are compliant to this specification and tested and validated. The details of each of these are outlined in the subsequent sections.

### Device Capability
The MOSIP compliant device is expected to perform the following,
* Should have the ability to collect one or more biometric
* Should have the ability to sign the captured biometric image or template.
* Should have the ability to protect secret keys
* Should have no mechanism to inject the biometric

### Base Specifications for Devices
For details about biometric data specifications please view the page [MOSIP Biometric Specification](Biometric-Specification.md).

We recommend that countries look at ergonomics, accessibility, ease of usage, and common availability of devices while choosing devices for use in registration and authentication scenarios.

---

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

## SBI

## Test kits

## Management server




 






