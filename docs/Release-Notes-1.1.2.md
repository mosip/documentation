## Table Of Contents

- [Scope](#scope)
- [Documentation](#documentation)
- [Key Points](#key-points)
- [Code](#code)
- [Tests](#tests)
	* [a. In scope](#a-in-scope)
	* [b. Not in scope](#b-not-in-scope)
	* [c. Test Metrics](#c-test-metrics)
	* [d. Test Execution Report](#d-test-execution-report)
- [Acronyms](#acronyms)

## Scope
MOSIP Version **1.1.2** is a patch release on top of **1.1.1** release. It has new features related which were planned for release **1.2** and some critical bug fixes which were identified in [Release 1.1.1](Release-Notes-1.1.1.md#list-of-known-issues) have been fixed and retested.

**Release Date:** October 20, 2020

**Key Highlights**

* [New features added to MOSIP platform](Release-Notes-1.1.1-Features.md)
* [Bug Fixes across all modules](Release-Notes-1.1.1-Bug-Fixes.md)
* Engineering Changes
  * TBA
* Technology Changes
  * TBA

## Documentation

### 1. Platform 
Includes functional requirements, process flows, architecture and high level design. 

[Link to documentation](https://docs.mosip.io/platform/modules).

### 2. APIs
All APIs are documented [here](https://docs.mosip.io/platform/apis).

### 3. Design 
Low level design documents for each module are available in the respective github repos.

### 4. Code and Automated Tests

* [Commons](https://github.com/mosip/commons/tree/v1.1.2)
* [Pre-registration](https://github.com/mosip/pre-registration/tree/v1.1.2)
* [Registration](https://github.com/mosip/registration/tree/v1.1.2)
* [Authentication](https://github.com/mosip/id-authentication/tree/v1.1.2)
* [Partner Management Services](https://github.com/mosip/partner-management-services/tree/v1.1.2)
* [Resident Services](https://github.com/mosip/resident-services/tree/v1.1.2)
* [Reference Implementation](https://github.com/mosip/mosip-ref-impl/tree/v1.1.2)

The details related to artifactory versions is available [here](Release-Notes-1.1.2-Artifact-Version.md).

{% hint style="info" %}
Code needs to be deployed as per the procedure depicted in [Sandbox Installer](https://github.com/mosip/mosip-infra/tree/v1.1.2/deployment/sandbox-v2).
{% endhint %}

## Tests 
TBD

## Acronyms

Achronyms | Full Form
----------|-----------
MOSIP | Modular Open Source Identity Platform
ABIS | Automated Biometric Identification System
API | Application Programming Interface
ID | Identity
IDA | Identity Authentication
NFR | Non-Functional Requirements
OTP | One Time Password
SDK	| Software Development Kit
JWT | Java Web Token
K8 | Kubernetes
UIN | Unique Identification Number
VID | Virtual ID
CBEFF | Common Biometric Exchange Formats Framework
CORS | Cross Origin Resource Sharing
HSM | Hardware Security Module
TPM | Trusted Platform Module
SDK | Software Development Kit
MDS | MOSIP Device Service
ICU4J | International Components for Unicode for Java
WIP | Work In Progress
TBD | To Be Determined/Done
