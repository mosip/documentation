## Table Of Contents

- [Scope](#scope)
- [Documentation](#documentation)
- [Code](#code)
- [Tests](#tests)
	* [a. In scope](#a-in-scope)
	* [b. Not in scope or in progress](#b-not-in-scope-or-in-progress)
	* [c. Test Execution Metrics](#c-test-execution-metrics)
- [Known Issues](#known-issues)
- [Critical Issues](#critical-issues)
- [Acronyms](#acronyms)

## Scope
MOSIP **1.1.5** succeeds **1.1.4** with enhancements and important defect fixes which were identified in [Release 1.1.4](Release-Notes-1.1.4.md#list-of-known-issues).

**Release Date:** March 10, 2021

**Key Highlights**

* [Enhancements](Release-Notes-1.1.5-Enhancements.md)
* [Defect fixes](Release-Notes-1.1.5-Defect-Fixes.md)

## Documentation

### 1. Platform 
Includes functional requirements, process flows, architecture and high level design. 

[Link to documentation](https://docs.mosip.io/platform/modules).

### 2. APIs
All APIs are documented [here](https://docs.mosip.io/platform/apis).

### 3. Design 
Low level design documents for each module are available in the respective github repos.

## Code

* [Commons](https://github.com/mosip/commons/tree/v1.1.5)
* [Pre-registration](https://github.com/mosip/pre-registration/tree/v1.1.5)
* [Registration](https://github.com/mosip/registration/tree/v1.1.5)
* [ID Repository](https://github.com/mosip/id-repository/tree/v1.1.5)
* [ID Authentication](https://github.com/mosip/id-authentication/tree/v1.1.5)
* [Partner Management Services](https://github.com/mosip/partner-management-services/tree/v1.1.5)
* [Resident Services](https://github.com/mosip/resident-services/tree/v1.1.5)
* [Admin Services](https://github.com/mosip/admin-services/tree/v1.1.5)
* [Print Services](https://github.com/mosip/print/tree/v1.1.5)
* [Config Respository](https://github.com/mosip/mosip-config/tree/v1.1.5)
* [Reference Implementation](https://github.com/mosip/mosip-ref-impl/tree/v1.1.5)

{% hint style="info" %}

Code needs to be deployed as per the procedure depicted in [Sandbox Installer](https://github.com/mosip/mosip-infra/tree/1.1.5/deployment/sandbox-v2).

{% endhint %}

## Tests 

### a. In scope 

Sanity of all modules, integration testing covering all modules, new stories , bug regression, upgrade from 1.1.4 to 1.1.5						

|Title	|Description|
|------|------|
| Functional Testing | <li> Pre-registration 1.1. (Dynamic UI & APIs)</li><li>Registration Client (Dynamic UI, functionality)</li><li>Kernel (APIs)</li><li>Registration Processor</li><li>ID Authentication (APIs)</li><li>Partner Management (APIs)</li><li>ID Repository (APIs)</li><li>Resident Services (APIs)</li><li>Admin (UI & APIs)</li></ul>|
| Configuration Testing| Testing was done in 2 language schema.|
| Version Tested | v1.1.5|
| Types of testing | <ul><li>Smoke</li><li>Functional</li><li>Integration</li><li>Regression</li><li>Security</li></ul>|
| Browser | Pre-Registration and Admin UI (Tested with the latest version of Chrome browser)|
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

### b. Not in scope
|Title|	Description|
|-----|------------|
|Fucntional Testing| <ul><li>Real Biometric Testing</li><li>All possible notifications to be tested</li></ul>|
|Non-Functional Testing| <ul><li>Performance Testing</li><li>Reliability and Disaster recovery Testing</li></ul>|
|HSM | Testing was done using SoftHSM |
|Browser Support | Testing for Pre-registration and Admin UI was done using Chrome (latest version) |

### c. Test Execution Metrics

Test Execution | Test Cases | Executed Tests | Pass | Fail | Pass% | Fail% |
---------------|:----------:|:--------------:|:----:|:----:|:-----:|:-----:|
Pre-registration | 177 | 175 | 168 | 7 | 96% | 4%
Resident Services | 177 | 177 | 167 | 10 | 94% | 6%
Admin Services | 1040 | 1040 | 861 | 179 | 83% | 17%
Authentication | 122 | 138 | 95 | 43 | 69% | 31%
Partner Management | 42 | 42 | 40 | 2 | 95% | 5%
Registration | 91 | 87 | 77 | 10 | 88% | 12%
ID Repo | 97 | 97 | 97 | 0 | 100% | 100%
**Total** | 1762 | 1756 | 1505 | 251 | 86% | 14%

## Known Issues

The top issues identified in MOSIP 1.1.5 are listed below.

Bug ID | Summary | Module
-------|---------|-------
[MOSIP-13222](https://mosip.atlassian.net/browse/MOSIP-13222) | Websub message store is not getting populated for IDA, Resident | Commons
[MOSIP-10497](https://mosip.atlassian.net/browse/MOSIP-10497) | After User and Machine re-map, Reg-client is not working | Registration
[MOSIP-13227](https://mosip.atlassian.net/browse/MOSIP-13227) | Post-Remap and completion of pending activities still not able to remap | Registration
[MOSIP-13160](https://mosip.atlassian.net/browse/MOSIP-13160) | The priority is not working when we donot add stage level priority it work | Registration
[MOSIP-12875](https://mosip.atlassian.net/browse/MOSIP-12875) | UIN generation notification not being received | Registration

## Upgrade Testing

Upgrade was done from 1.1.4 to 1.1.5 , below critical issues were identified and are still open.

Bug ID | Summary | Module
-------|---------|-------
[MOSIP-13334](https://mosip.atlassian.net/browse/MOSIP-13334) | In Reg-Client "Registration Tasks" is getting unresponsive post reg-client upgrade | Registration
[MOSIP-13337](https://mosip.atlassian.net/browse/MOSIP-13337) | RegClient: Unable to load Registration preview screen in all registration flow. | Registration
[MOSIP-13311](https://mosip.atlassian.net/browse/MOSIP-13311) | PreReg: Booked applications are not added into dashboard. | Pre-Registration
[MOSIP-31385](https://mosip.atlassian.net/browse/MOSIP-31385) | Reg client: Failed to fetch PRID in Registration client | Registration
[MOSIP-31383](https://mosip.atlassian.net/browse/MOSIP-31383) | PreReg: Post upgrade Pre-Reg applications are removed | Pre-Registration

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
