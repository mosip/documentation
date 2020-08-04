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
MOSIP Version **1.1.1** is a patch release on top of **1.1.0** release. It is more stable and most of the critical issues identified in [Release 1.1.0](Release-Notes-1.1.0.md#list-of-known-issues) have been fixed and retested.

**Release Date:** July 22, 2020

**Key Highlights**

* [Bug Fixes across all modules](Release-Notes-1.1.0-Bug-Fixes.md)


## Documentation

### 1. Platform 
Includes functional requirements, process flows, architecture and high level design. 

[Link to documentation](https://docs.mosip.io/platform/modules).

### 2. APIs
All APIs are documented [here](https://docs.mosip.io/platform/apis).

### 3. Design 
Low level design documents for each module are available in the respective github repos.

### 4. Code and Automated Tests

* [Commons](https://github.com/mosip/commons/tree/v1.1.1)
* [Pre-registration](https://github.com/mosip/pre-registration/tree/v1.1.1)
* [Registration](https://github.com/mosip/registration/tree/v1.1.1)
* [Authentication](https://github.com/mosip/id-authentication/tree/v1.1.1)
* [Partner Management Services](https://github.com/mosip/partner-management-services/tree/v1.1.1)
* [Resident Services](https://github.com/mosip/resident-services/tree/v1.1.1)
* [Reference Implementation](https://github.com/mosip/mosip-ref-impl/tree/v1.1.1)
* [Automation tests](https://github.com/mosip/mosip-functional-tests/tree/v1.1.1)

The details related to artifactory versions is available [here](Release-Notes-1.1.1-Artifact-Version.md).

{% hint style="info" %}
Code needs to be deployed as per the procedure depicted in [Sandbox Installer](https://github.com/mosip/mosip-infra/tree/v1.1.1/deployment/sandbox-v2).
{% endhint %}

## Tests 

### a. In scope 

|Title	|Description|
|------|------|
|Functional Testing|<ul><li>Pre-registration (UI & APIs)</li><li>Registration Client</li><li>Kernel (APIs)</li><li>Registration Processor (Server)</li><li>ID Authentication (APIs)</li><li>Partner Management (APIs)</li><li>ID Repo (APIs)</li><li>Resident Services (APIs)</li></ul>|
|Non-Functional Testing|<ul><li>Early Performance Testing</li><li>Security Testing</li></ul>|
|Configuration Testing| Testing is done for default configuration. Changing the configuration parameters with various values will be taken up in subsequent releases.|
|Version Tag Tested|v1.1.1|
|Types of testing|<ul><li>Smoke</li><li>Functional</li><li>Integration</li><li>Regression</li></ul>|
|Browser Support|**Pre-Registration** (Latest Versions of Chrome, Edge & Firefox)|
|OS Support|**Registration Client** (Windows 10)|

|Areas |Technology used|
----|----
Deployment Script Environment |	Microsoft Azure and VMs deployed in on-premise hardware
Registration Client with TPM 2.0 | Windows 10
Document Scanner | Canon lide 120
GPS | GlobalSat BU-353-S4
Biometrics Standard | CBEFF format (Version - 2.0)
MOSIP Device Service (MDS) | MDS v0.9.5
ABIS | ABIS Spec Version v0.9
SDK | SDK Spec Version v0.9
SMS gateway |	MSG91, Infobip
Registration Client – face capture | OpenImaj - This is licensed for demo purpose only
Keystore | SoftHSM
Antivirus | ClamAV
Maps | OpenstreetMap
Supporting key based digital signatures, not using digital certificates | 
Transliteration | ICU4J (Library with French, Arabic languages)

### b. Not in scope 
|Title|	Description|
|------|------|
|Non-Functional Testing| <ul><li>Detailed Performance Testing</li><li>Reliability and Disaster recovery Testing</li></ul>|
|Admin|<ul><li>Admin UI</li><li>Admin APIs</li></ul>|
|UI|<ul><li>Dynamic UI</li></ul>|

### c. Test Metrics

|Key|Value|
|------|--------|
|Test Coverage|Pre-Registration (100%), Registration Client (95%), Registration Processor (100%), Authentication (100%), Partner Management (100%), Resident Services (100%)|
|Code Coverage|70% to 80%|
|Automation Coverage|80%|
|Number of Test Cases|Total Run (2262), Pass (2260), Pass Rate (96.5%)|
|Number of Open Blocker or Critical Defects|0|

### d. Test Execution Report

|Test Execution    |Version|Test Cases|Executed Tests|Pass|Fail|Pending Execution|Pass%|Fail%|
|------------------|-------|----------|--------------|----|----|-----------------|-----|-----|
|Kernel            |1.1.1 |372       |372           |354 |18  |0                |95.2%|4.8% |
|Pre-Registration  |1.1.1 |350       |348           |342 |6   |2                |97.7%|2.3% |
|Registration      |1.1.1 |194       |194           |165 |29  |0                |85.1%|14.9% |
|Authnetication    |1.1.1 |1055      |1055          |1037|18  |0                |98.3%|1.7% |
|ID Repository     |1.1.1 |147       |147           |147 |0   |0                |100%|0.0% |
|Resident Services |1.1.1 |33        |33            |32  |1   |0                |97.0% |3.0% |
|Partner Management|1.1.1 |111       |111           |106 |5   |0                |95.5% |4.5% |
|**Total**         |1.1.1 |2262      |2260          |2183|77  |2                |96.5%|3.4% |


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
