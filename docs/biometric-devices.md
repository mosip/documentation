# Biometric Devices

## Overview

Biometric devices capture individuals' biometric data (fingerprint, iris scan, photo) and send it to a registration client or authentication client (app). The functional architecture of the various entities involved is shown below.

![](\_images/sdk.png)

## Device types

| Purpose        | Type        | Subtype\*             | Certification | Specification                               |
| -------------- | ----------- | --------------------- | ------------- | ------------------------------------------- |
| Registration   | Fingerprint | Slap scanner          | SBI 1.0       | [Fingerprint image spec](broken-reference/) |
| Registration   | Iris        | Double eye scanner    | SBI 1.0       | [Iris image spec](broken-reference/)        |
| Registration   | Face        | Camera                | SBI 1.0       | [Face image spec](broken-reference/)        |
| Authentication | Fingerprint | Single finger scanner | SBI 2.0       | [Fingerprint image spec](broken-reference/) |
| Authentication | Iris        | Single eye scanner    | SBI 2.0       | [Iris image spec](broken-reference/)        |
| Authentication | Face        | Camera                | SBI 2.0       | [Face image spec](broken-reference/)        |

\* An adopter may choose to have different subtypes, however, the certification needs to be adhered to.

## Enrolment flow

![](\_images/devices-enrolment.png)

## Authentication flow

![](\_images/devices-authentication.png)

## SBI test kit

Compliance of a device may be tested using an [Compliance Tool Kit (CTK)](https://docs.mosip.io/compliance-tool-kit).

## Devices calculator

The following calculator may be used to estimate the number of devices required for a rollout.

[MOSIPDevicesCalculator](\_files/mosip-devices-calculator.xls)

## Partners

Providers of biometric devices are Partners of MOSIP and need to be onboarded to a given deployment of MOSIP. Specifically,

* [Device Provider](partners.md#device-partner-dp)
* [FTM Provider](partners.md#ftm-partner-ftmp)
