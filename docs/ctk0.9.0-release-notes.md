# Version 0.9.0

**Release Name**: CTK 0.9.0

**Upgrade From**: NA (First Release)

**Release Date**: 1st December 2022


## Overview

The 0.9.0 version of MOSIP’s compliance tool kit is the first beta release which covers the essential features to test an SBI and biometric SDK which follows MOSIP’s biometric specifications. The subsequent releases will have more aggressive test scenarios and integration components (like ABIS, Manual Adjudication & Manual Verification systems).


## Features Covered

The basic features such as,

* Create a Project
* Create a Collection
* Run a Collection
* View Details of a Test Run
* Add Biometric Data

are available as part of the releases.

The current version can be used by the device and biometric SDK vendors to test their SBIs and SDKs.

As part of the SBI test suite, we would support verification schema and signature verification of,
* Interfaces
    * Device discovery,
    * Device info,
    * Capture, and
    * RCapture
    
* Certification Level
    * L0, and
    * L1
    
* Biometric Modalities
    * Fingerprints
    * Iris
    * Face

As part of the SDK test suite in the current version would support verification of schema and interface level verification for,

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
    
The detailed list of the test cases for SBI and SDK in the 0.9.0 version of the Compliance Tool Kit  is available here:

* SBI (https://mosip.atlassian.net/l/cp/jfX6EkG2)
* SDK (https://mosip.atlassian.net/l/cp/zvwTk03B)

## Dependency

* For Authentication and Authorization:
    * artifactory-ref-impl: 1.2.0.1-B2
    * kernel-auth-service: 1.2.0.1-B1
* For Virus Scanning:
    * clamAV: 1.2.0.1-B2
* For encryption, decryption and trust validation
    * kernel-keymanager-service: 1.2.0.1-B1
* For adding partner certificates using partner management
    * partner-management-service: 1.2.0.1-B1
    * kernel-auditmanager-service: 1.2.0.1-B1

## Documentation

* [Feature Documentation](https://docs.mosip.io/1.2.0/modules/compliance-tool-kit)
* [Compliance Tool Kit User Guide](https://docs.mosip.io/1.2.0/modules/compliance-tool-kit/ctk-user-guide)
* QA Report
* Sonar Report
