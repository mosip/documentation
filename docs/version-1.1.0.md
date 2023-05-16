# Version 1.1.0

**Release Name**: CTK 1.1.0 

**Upgrade From**: CTK 1.0.0

**Support**: Stable Release

**Release Date**: 19 May, 2023

## Overview

The 1.1.0 version of CTK includes the two new features:
1. Multiple Language support in CTK
2. Android SBI testing

**Multiple Language support in CTK**

* CTK will now support the application in multiple languages.
* While logging in, the partner can select a language from the dropdown.
* Therafter, the application will be displayed in the selected language.
* By default, CTK will support three languages- English, French and Arabic.


**Android SBI testing**

CTK will now support Android SBI testing using the Android CTK App.

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

The detailed list of the test cases for SBI and SDK in the 1.1.0 version of the Compliance Tool Kit are available here:

* [SBI Test Cases](https://github.com/mosip/mosip-compliance-toolkit/blob/1.1.0/resources/compliance\_test\_definitions\_sbi.json)
* [SDK Test Cases](https://github.com/mosip/mosip-compliance-toolkit/blob/1.1.0/resources/compliance\_test\_definitions\_sdk.json)

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

Post installation, follow the setup steps available [here](setup-steps-1.1.0.md).

## Documentation

* [Feature Documentation](./)
* [Compliance Tool Kit User Guide](user-guide.md)
* [Android CTK App user Guide](android-user-guide.md)
* [QA Report](https://docs.mosip.io/compliance-tool-kit/versions/version-1.1.0/test-report-1.1.0)
* [Videos](https://www.youtube.com/playlist?list=PLJH-POb\_55z8YYS\_qAk\_QNBQeiQ2VrtZD)



