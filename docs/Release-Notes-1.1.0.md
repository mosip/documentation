## Table Of Contents

- [Scope](#scope)
- [Documentation](#documentation)
- [Key Points](#key-points)
- [Code](#code)
- [Test Reports](#test-reports)
	* [1. In scope](#1-in-scope)
	* [2. Not in scope](#2-not-in-scope)
	* [3. Test Metrics](#3-test-metrics)
	* [4. Test Execution Report](#4-test-execution-report)
- [Known Issues](#known-issues)
- [List Of Acronyms](#list-of-acronyms)

## Scope
MOSIP Version **1.1.0** has several enhancements. It has additional security features and is performance-tuned and feature-rich.

**Release Date:** July 01, 2020

**Key Highlights**

* Includes Partner Management and Master Data Administration
* [New features added to MOSIP platform](Release-Notes-1.1.0-Features.md)
* [Bug Fixes across all modules](Release-Notes-1.1.0-Bug-Fixes.md)
* Engineering Changes
  * Automated deployment scripts based on docker, ansible and kubernetes.
  * Open build process using Travis and Github Actions.
  * Git commit-ids in builds helps in traceability from binary to code.
  * Built docker images are published into Maven and docker hub.
  * Documentation now uses Gitbook (docs.mosip.io)
* Technology Changes
  * ApacheDS has been replaced with Keycloak for secure identity and access management.
  * Prometheus end points for all MOSIP services for health monitoring
  * Network HSM for strong security and data protection

## Documentation

### 1. Platform Documentation
Includes functional requirements, process flows, architecture and high level design.  

[**Link to documentation for MOSIP modules**](https://docs.mosip.io/platform/modules).

### 2. API Specifications
API specifications for the MOSIP APIs is available [here](https://docs.mosip.io/platform/apis)

### 3. Design Documentation
Low level design documents for each modules are available in respective repositories.

## Key Points

Key Points| Details
----|----
Pre Registration - Browser support | Latest versions of Chrome, Firefox and Edge
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

## Code

The code and [automation tests](https://github.com/mosip/mosip-functional-tests) are tagged to 1.1.0 and are available on [here](https://github.com/mosip/). The code needs to be built and deployed as per the [Sandbox Installer](https://github.com/mosip/mosip-infra/blob/master/deployment/sandbox-v2/README.md). We will actively support System Integrators during their first deployment.
* [Commons](https://github.com/mosip/commons/releases)
* [Pre-registration](https://github.com/mosip/pre-registration/releases)
* [Registration](https://github.com/mosip/registration/releases)
* [Authentication](https://github.com/mosip/id-authentication/releases)
* [Partner Management Services](https://github.com/mosip/partner-management-services/releases)
* [Admin Services](https://github.com/mosip/admin-services/releases)
* [Resident Services](https://github.com/mosip/resident-services/releases)
* [Reference Implementation](https://github.com/mosip/mosip-ref-impl/releases)

## Test Reports

### 1. In scope 

|Title	|Description|
|------|------|
|Functional Testing|<ul><li>Pre-registration (UI & APIs)</li><li>Registration Client</li><li>Kernel (APIs)</li><li>Registration Processor (Server)</li><li>ID Authentication (APIs)</li><li>Partner Management (APIs)</li><li>ID Repo (APIs)</li><li>Resident Services (APIs)</li></ul>|
|Non-Functional Testing|<li>Early Performance Testing</li><li>Security Testing</li></ul>|
|Configuration Testing| <ul><li>Testing is done for default configuration. Changing the configuration parameters with various values will be taken up in subsequent releases.</li></ul>|
|Version Tag Tested|1.1|
|Types of testing|<ul><li>Smoke</li><li>Functional</li><li>Integration</li><li>Regression</li></ul>|
|Browser Support|**Pre-Registration** <ul><li>Chrome – latest</li><li>Edge – latest</li><li>Firefox – latest</li></ul>|
|OS Support|**Registration Client** <ul><li>Windows 10</li></ul>|

### 2. Not in scope 
|Title|	Description|
|------|------|
|Non-Functional Testing| <ul><li>Detailed Performance Testing</li><li>Reliability and Disaster recovery Testing</li></ul>|
|Admin|<ul><li>Admin UI</li><li>Admin APIs</li></ul>|
|UI|<ul><li>Dynamic UI</li></ul>|

### 3. Test Metrics

|Key|Value|
|------|--------|
|Test Coverage|Pre-Registration (100%), Registration Client (95%), Registration Processor (100%), Authentication (100%), Partner Management (100%), Resident Services (100%)|
|Code Coverage|70% to 80%|
|Automation Coverage|80%|
|Number of Test Cases|Total Run (2818), Pass (2526), Pass Rate (90%)|
|Number of Bugs Found|797 (Since December 2019)|
|Number of Open Defects|Total (77), Blocker or Critical: 10 (7 fixed & 3 open for patch release)|
|Number of Immediate Fixes|10 to 15|

### 4. Test Execution Report

|Test Execution    |Version|Test Cases|Executed Tests|Pass|Fail|Pending Execution|Pass%|Fail%|
|------------------|-------|----------|--------------|----|----|-----------------|-----|-----|
|Kernel            |1.0.10 |372       |372           |341 |31  |0                |91.7%|8.3% |
|Pre-Registration  |1.0.10 |829       |802           |774 |28  |27               |96.5%|3.5% |
|Registration      |1.0.10 |316       |271           |263 |8   |45               |97.0%|3.0% |
|Authnetication    |1.0.10 |1081      |1081          |1033|48  |0                |95.6%|4.4% |
|ID Repository     |1.0.10 |152       |152           |142 |10  |0                |93.4%|6.6% |
|Resident Services |1.0.10 |38        |33            |33  |0   |5                |100% |0.0% |
|Partner Management|1.0.10 |84        |84            |84  |0   |0                |100% |0.0% |
|**Total**         |1.0.10 |2872      |2795          |2670|125 |77               |95.5%|4.5% |

## List of Known Issues
|JIRA ID|Module|Description|
|----------|-------------|------|
|MOSIP-7999|Pre-registration|Notification is not sent when an booked appointment is canceled| 
|MOSIP-7676|Pre-registration|User is allowed to discard the application with in 24 hours i.e. the configured time|
|MOSIP-7704|Pre-registration|On the Pre Registration UI, a page reload results in session time-out discarding the data entered|
|MOSIP-7704|Pre-registration|User is not able to copy the documents of his/her choice|
|MOSIP-7942|ID Authentication|Device details are not validated against the biomertic type| 
|MOSIP-7842|Registration Client|Device details are not stored in Packet|
|MOSIP-7915|Registration Client|Navigation issues in registration client UI|
|MOSIP-31341|Registration Client|Streaming of device stays turned on when registration flow is abruptly closed|

## List Of Acronyms

Acronym | Expanded Form
-----|-----------------
ABIS | Automated Biometric Identification System
API | Application Programming Interface
ID | Identity
IDA | Identity Authentication
MOSIP | Modular Open Source Identity Platform
NFR | Non-Functional Requirements
OTP | One Time Password
SDK | Software Development Kit
TBD | To Be Determined
TOTP| Temporary One Time Password
UIN | Unique Identification Number
WIP | Work In Progress
CBEFF | Common Biometric Exchange Formats Framework
HSM | Hardware Security Module
TPM | Trusted Platform Module
SDK | Software Development Kit
MDS | MOSIP Device Service
