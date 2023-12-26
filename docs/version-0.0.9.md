# Version 0.0.9

**Release Name**: CTK 0.0.9 (Beta)

**Upgrade From**: NA (First Release)

**Release Date**: 1st December, 2022

## Overview

The 0.0.9 version of MOSIP’s Compliance Tool Kit is the first beta release which covers the essential features to test an SBI and Biometric SDK which follows MOSIP’s biometric specifications. The subsequent releases will have more aggressive test scenarios and integration components (like ABIS, Manual Adjudication & Manual Verification systems).

## Features Covered

The basic features such as,

* Create a Project
* Create a Collection
* Run a Collection
* View Details of a Test Run
* Add Biometric Data

are available as part of the releases.

The current version can be used by the device and biometric SDK vendors to test their SBIs and SDKs.

As a part of the SBI test suite, we support the verification schema and signature verification of,

* Interfaces
  * Device discovery
  * Device info
  * Capture
  * RCapture
* Certification Level
  * L0
  * L1
* Biometric Modalities
  * Fingerprints
  * Iris
  * Face

As a part of the SDK test suite in the current version, we support the verification of schema and interface level verification for,

* Interfaces
  * Initialization
  * Quality Check
  * Matcher
  * Extractor
  * Converter
* Biometric Modalities
  * Fingerprint
  * Iris
  * Face

The detailed list of the test cases for SBI and SDK in the 0.9.0 version of the Compliance Tool Kit is available here:

* [SBI Test Cases](https://github.com/mosip/mosip-compliance-toolkit/blob/0.0.9/resources/compliance\_test\_definitions\_sbi.json)
* [SDK Test Cases](https://github.com/mosip/mosip-compliance-toolkit/blob/0.0.9/resources/compliance\_test\_definitions\_sdk.json)

## Dependency

* Artifactory: mosipid/artifactory-ref-impl: 1.2.0.1-B2
* Audit manager: mosipid/kernel-auditmanager-service: 1.2.0.1-B1
* Auth Manager: mosipid/kernel-authmanager: 1.2.0.1-B1
* Key Manager: modipid/kernel-keymanager-service: 1.2.0.1-B1
* Partner Management: mosipid/partner-management-service: 1.2.0.1-B1
* KeyCloak: mosipid/keycloak-init: 1.2.0.1-B1
* Postgres: mosipid/postgres-init: 1.2.0.1-B1
* Config Server: config-server: mosipid/config-server: 1.1.2
* Notification Service: mosipid/kernel-notification-service: 1.2.0.1-B1
* ClamAV: clamav/clamav: latest
* MinIO

Post installation please follow the setup steps available [here](setup-steps-0.0.9.md).

## Documentation

* [Feature Documentation](./)
* [Compliance Tool Kit User Guide](user-guide.md)
* [QA Report](https://docs.mosip.io/compliance-tool-kit/versions/version-0.0.9/test-report-0.0.9)
* [Videos](https://www.youtube.com/playlist?list=PLJH-POb\_55z8YYS\_qAk\_QNBQeiQ2VrtZD)
