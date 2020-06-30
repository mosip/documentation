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
Version **1.1.0** of MOSIP Platform is a feature and stability release.

MOSIP 1.0 was a functional release of mosip with the core modules tested with biometrics. The 1.1 release of mosip builds upon the 1.0 version and adds more features, some new modules, engineering enhancements, performance and security tuning.MOSIP 1.0 was a functional release of mosip with the core modules tested with biometrics. The 1.1 release of mosip builds upon the 1.0 version and adds more features, some new modules, engineering enhancements, performance and security tuning.

**Release Date:** June 30, 2020

**Highlights of the 1.1.0 release includes:**

* New Module added – Partner Management and Master Data Administration, 
* [Features added - New features added to MOSIP platform](Release-Notes-1.1.0-Features.md)
* [Bug Fixes across all modules](Release-Notes-1.1.0-Bug-Fixes.md)
* Engineering Changes
  * Automated deployment scripts for development, testing environments on Kubernetes
  * Open build process using Travis
  * GitHub actions, git commit id in builds
  * Shift from private repository to public maven and  docker repositories
  * Decoupling version of components from release version
  * Gitbook based documentation
* Technology Changes
  * Keycloak for IAM
  * ApacheDS ldap as user store deprecated
  * Prometheus end points in all spring boot services
  * Network HSM support added

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
Pre Registration - Browser support | Chrome 74.0.3729
Deployment Script Environment |	Microsoft Azure
Registration Client – OS version | Windows 10 (English version) with TPM 2.0
Scanner | Canon lide 120
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
The code and [automation tests](https://github.com/mosip/mosip-functional-tests) are tagged to 1.1.0 and are available on GitHub. The code needs to be built and deployed as per the [Sandbox Installer](https://github.com/mosip/mosip-infra/blob/master/deployment/sandbox-v2/README.md). We will actively support System Integrators during their first deployment.
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

![](_images/release/1.1.0/Testing_Metrics.png)

### 4. Test Execution Report

![Image](_images/release/1.1.0/Test_Execution_Report.png) 

## List of Known Issues
|JIRA ID|Module|Description|
|----------|:-------------:|------:|
|MOSIP-7999|Pre-registration|No notification sent back when an booked appointment is cancelled| 
|MOSIP-7676|Pre-registration|User is allowed to discard the application with in 24 hours / configured time|
|MOSIP-7704|Pre-registration|On the pre-reg UI, a page reload results in session time-out discarding the data entered|
|MOSIP-7704|Pre-registration|Unable to copy the documents for user of choice|
|MOSIP-7942|ID Authentication|Device details not validated against the bio type/subtype| 
|MOSIP-7842|Registration Client|Registration Client is not sending device details in the Packet|
|MOSIP-7915|Registration Client|Navigation issues in registration client UI|
|MOSIP-31341 |Registration Client|Keeps on streaming even though registration process is cancelled|

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
MDS | Mosip Device Service