## Table Of Contents

- [Scope](#scope)
- [Documentation](#documentation)
- [Code](#code)
- [Tests](#tests)
	* [a. In scope](#a-in-scope)
	* [b. Not in scope or in progress](#b-not-in-scope-or-in-progress)
	* [c. Test Execution Metrics](#c-test-execution-metrics)
- [Known Issues](#known-issues)
- [Acronyms](#acronyms)

## Scope
MOSIP **1.1.4** succeeds **1.1.3** with enhancements and important defect fixes which were identified in [Release 1.1.3](Release-Notes-1.1.3.md#list-of-known-issues).

**Release Date:** February 10, 2021

**Key Highlights**

* [Enhancements](Release-Notes-1.1.4-Enhancements.md)
* [Defect fixes](Release-Notes-1.1.4-Defect-Fixes.md)

## Documentation

### 1. Platform 
Includes functional requirements, process flows, architecture and high level design. 

[Link to documentation](https://docs.mosip.io/platform/modules).

### 2. APIs
All APIs are documented [here](https://docs.mosip.io/platform/apis).

### 3. Design 
Low level design documents for each module are available in the respective github repos.

## Code

* [Commons](https://github.com/mosip/commons/tree/v1.1.4)
* [Pre-registration](https://github.com/mosip/pre-registration/tree/v1.1.3)
* [Registration](https://github.com/mosip/registration/tree/v1.1.4)
* [ID Repository](https://github.com/mosip/id-repository/tree/v1.1.4)
* [ID Authentication](https://github.com/mosip/id-authentication/tree/v1.1.4)
* [Partner Management Services](https://github.com/mosip/partner-management-services/tree/v1.1.4)
* [Resident Services](https://github.com/mosip/resident-services/tree/v1.1.4)
* [Admin Services](https://github.com/mosip/admin-services/tree/v1.1.4)
* [Print Services](https://github.com/mosip/print/tree/v1.1.4)
* [Config Respository](https://github.com/mosip/mosip-config/tree/v1.1.4)
* [Reference Implementation](https://github.com/mosip/mosip-ref-impl/tree/v1.1.4)

{% hint style="info" %}

Code needs to be deployed as per the procedure depicted in [Sandbox Installer](https://github.com/mosip/mosip-infra/tree/1.1.4/deployment/sandbox-v2).

{% endhint %}

## Tests 

### a. In scope 

Basic integration testing was done covering the below modules.

|Title	|Description|
|------|------|
|Functional Testing|<ul><li>Pre-registration 1.1.3 (Dynamic UI & APIs)</li><li>Registration Client (Dynamic UI, functionality and upgrade from 1.1.3 to 1.1.4)</li><li>Kernel (APIs)</li><li>Registration Processor</li><li>ID Authentication (APIs)</li><li>Partner Management (APIs)</li><li>ID Repository (APIs)</li><li>Resident Services (APIs)</li><li>Admin (UI & APIs)</li></ul>|
|Configuration Testing| Testing was done both with single language and 2 languages.|
|Version Tested|Pre-registration v1.1.3 and Other Modules v1.1.4|
|Types of testing|<ul><li>Smoke</li><li>Functional</li><li>Integration</li><li>Regression</li><li>Security</li></ul>|
|Browser|Pre-Registration and Admin UI (Tested with the latest version of Chrome browser)|
|OS Support|Registration Client on Windows 10, MOSIP server components run as micro-services encapsulated as docker images|

|Areas |Technology Used|
----|----
Deployment Script Environment | CentOS on AWS
Registration Client with TPM 2.0 | Windows 10
Biometrics Standard | CBEFF format (Version - 2.0)
MDS | MDS v0.9.5
ABIS | ABIS Spec Version v0.9
SDK  | SDK Spec Version v0.9
Key-store | HSM
Anti-virus | ClamAV
Maps | OpenstreetMap
Transliteration | ICU4J (Library with French, Arabic languages)

### b. Not in scope or in progress
|Title|	Description|
|-----|------------|
|Fucntional Testing| <ul><li>Real Biometric Testing</li><li>All possible notifications to be tested</li></ul>|
|Non-Functional Testing| <ul><li>Performance Testing</li><li>Reliability and Disaster recovery Testing</li></ul>|
|HSM | Testing was done using SoftHSM |
|Browser Support | Testing for Pre-registration and Admin UI was done using Chrome (latest version) |

### c. Test Execution Metrics

Test Execution | Test Cases | Executed Tests | Pass | Fail | Pending Execution | Pass% | Fail% |
---------------|:----------:|:--------------:|:----:|:----:|:-----------------:|:-----:|:-----:|
Pre-registration | 44 | 44 | 44 | 0 | 0 | 100% | 0%
Resident Services | 46 | 46 | 44 | 2 | 0 | 96% | 4%
Admin Services | 182 | 182 | 172 | 10 | 0 | 94% | 6%
Authentication | 55 | 55 | 53 | 2 | 0 | 96% | 4%
Partner Management | 52 | 52 | 50 | 2 | 0 | 96% | 4%
Registration | 29 | 29 | 27 | 2 | 0 | 93% | 7%
**Total** | 408 | 408 | 390 | 18 | 0 | 96% | 4%

## Known Issues

The top issues identified in MOSIP 1.1.4 are listed below.

Bug ID | Summary | Module
-------|---------|-------
[MOSIP-11872](https://mosip.atlassian.net/browse/MOSIP-11872) | UIN generation notification email has $name_eng | Registration
[MOSIP-11842](https://mosip.atlassian.net/browse/MOSIP-11842) | User role is not getting downgraded in registration client | Registration
[MOSIP-11709](https://mosip.atlassian.net/browse/MOSIP-11709) |  Credential issuance status is not moving from issued to printing - Restart WebSub pod | Credential Issuance

{% hint style="info" %}

To see all open defects, see https://mosip.atlassian.net/issues/?filter=10709

{% endhint %}

## Acronyms

Acronyms | Full Form
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
MDS | MOSIP Device Specification
