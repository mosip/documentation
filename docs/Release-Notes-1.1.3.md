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
MOSIP **1.1.3** succeeds **1.1.2** with enhancements and important defect fixes which were identified in [Release 1.1.2](Release-Notes-1.1.2.md#list-of-known-issues).

**Release Date:** December 14, 2020

**Key Highlights**

* [Enhancements](Release-Notes-1.1.3-Features.md)
* [Defect fixes](Release-Notes-1.1.3-Bug-Fixes.md)

## Documentation

### 1. Platform 
Includes functional requirements, process flows, architecture and high level design. 

[Link to documentation](https://docs.mosip.io/platform/modules).

### 2. APIs
All APIs are documented [here](https://docs.mosip.io/platform/apis).

### 3. Design 
Low level design documents for each module are available in the respective GitHub repositories.

## Code

* [Commons](https://github.com/mosip/commons/tree/v1.1.3)
* [Pre-registration](https://github.com/mosip/pre-registration/tree/v1.1.3)
* [Registration](https://github.com/mosip/registration/tree/v1.1.3)
* [ID Repository](https://github.com/mosip/id-repository/tree/v1.1.3)
* [ID Authentication](https://github.com/mosip/id-authentication/tree/v1.1.3)
* [Partner Management Services](https://github.com/mosip/partner-management-services/tree/v1.1.3)
* [Resident Services](https://github.com/mosip/resident-services/tree/v1.1.3)
* [Admin Services](https://github.com/mosip/admin-services/tree/v1.1.3)
* [Print Services](https://github.com/mosip/print/tree/v1.1.3)
* [Config Respository](https://github.com/mosip/mosip-config/tree/v1.1.3)
* [Reference Implementation](https://github.com/mosip/mosip-ref-impl/tree/v1.1.3)

{% hint style="info" %}

Code needs to be deployed as per the procedure depicted in [Sandbox Installer](https://github.com/mosip/mosip-infra/tree/1.1.3/deployment/sandbox-v2).

{% endhint %}

## Tests 

### a. In scope 

Basic integration testing was done covering the below modules.

|Title	|Description|
|------|------|
|Functional Testing|<ul><li>Pre-registration (Dynamic UI & APIs)</li><li>Registration Client (Dynamic UI, functionality and upgrade)</li><li>Kernel (APIs)</li>	<li>Registration Processor (All flows have been covered)</li><li>ID Authentication (APIs)</li><li>Partner Management (APIs)</li><li>ID Repository (APIs)</li><li>Resident Services (APIs)</li>	<li>Admin (UI & APIs)</li></ul>|
|Configuration Testing| Testing was done for default configuration (two languages) and single language with changed ui specification for pre-registration and registration client (Further more we have changed the seed data to single language).|
|Version Tested|v1.1.3|
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
|Non-Functional Testing| <ul><li>Performance Testing</li><li>Reliability and Disaster recovery Testing</li></ul>|
|HSM | Testing was done using SoftHSM |
|Browser Support | Testing for Pre-registration and Admin UI was done using Chrome (latest version) |

### c. Test Execution Metrics

Test Execution | Test Cases | Executed Tests | Pass | Fail | Pending Execution | Pass% | Fail% |
---------------|:----------:|:--------------:|:----:|:----:|:-----------------:|:-----:|:-----:|
Pre-registration | 111 | 107 | 103 | 4 | 4 | 96% | 4%
Resident Services | 47 | 37 | 34 | 3 | 10 | 92% | 8%
Admin Services | 165 | 160 | 153 | 7 | 5 | 96% | 4%
Authentication | 47 | 44 | 39 | 5 | 3 | 89% | 11%
Partner Management | 71 | 61 | 61 | 0 | 10 | 100% | 0%
Registration | 100 | 96 | 94 | 2 | 4 | 98% | 2%
Integration Scenarios | 27 | 20 | 17 | 3 | 7 | 85% | 15%
**Total** | 568 | 522 | 501 | 21 | 46 | 96% | 4%

## Known Issues

The top issues identified in MOSIP 1.1.3 are listed below.

Bug ID | Summary | Module
-------|---------|-------
[MOSIP-10604](https://mosip.atlassian.net/browse/MOSIP-10604) | Wrong location data getting populated for demographic details in Reg-Client | Registration Client
[MOSIP-10729](https://mosip.atlassian.net/browse/MOSIP-10729) | Document upload page showing the Documents Categories even though they are inactive | Registration Client
[MOSIP-10719](https://mosip.atlassian.net/browse/MOSIP-10719) | In Update-UIN flow, if the Name fields are not filled and continued then "Mandatory Fields should be highlighted" | Registration Client
[MOSIP-10718](https://mosip.atlassian.net/browse/MOSIP-10718) | Incorrect error message while onboarding for "expired token" | Registration Client
[MOSIP-10716](https://mosip.atlassian.net/browse/MOSIP-10716) | UIN Update process should not make the DOB as mandatory field | Registration Client
[MOSIP-10715](https://mosip.atlassian.net/browse/MOSIP-10715) | Incorrect error message thrown for "Onboarding process" when RID is not assigned to user | Registration Client
[MOSIP-10605](https://mosip.atlassian.net/browse/MOSIP-10605) | DoB is not handled like the age for displaying Parent/Guardian details in an adult packet. | Registration Client
[MOSIP-10568](https://mosip.atlassian.net/browse/MOSIP-10568) | Template Bugs for Preview, Acknowledgement pages of Reg-Client | Registration Client
[MOSIP-10503](https://mosip.atlassian.net/browse/MOSIP-10503) | In registration client packet upload page, packets uploaded from admin portal are not getting cleared leading to confusion | Registration Client
[MOSIP-9783](https://mosip.atlassian.net/browse/MOSIP-9783) | Visible images during registration process and a part of created packet is hidden in the UI. | Registration Client
[MOSIP-10849](https://mosip.atlassian.net/browse/MOSIP-10849) | Notification not working when a packet is reprocessed. | Registration Processor
[MOSIP-10590](https://mosip.atlassian.net/browse/MOSIP-10590) | Double entries in Audit log | Registration Processor
[MOSIP-10587](https://mosip.atlassian.net/browse/MOSIP-10587) | Unable to upload more than 200 packets | Admin Services
[MOSIP-10469](https://mosip.atlassian.net/browse/MOSIP-10469) | Unable to create machine from admin console | Admin Services
[MOSIP-10241](https://mosip.atlassian.net/browse/MOSIP-10241) | While performing Bulk Upload for a table using Admin master Bulk Upload history table associated with it should also be updated | Admin Services
[MOSIP-10854](https://mosip.atlassian.net/browse/MOSIP-10854) | Unable to upload the data using bulk upload from zoneUserHistory Table | Admin Services
[MOSIP-10720](https://mosip.atlassian.net/browse/MOSIP-10720) | Unable to create the Reg center as Region is not loading | Admin Services
[MOSIP-10561](https://mosip.atlassian.net/browse/MOSIP-10561) | Admin Role to be defined for KeyManager | Admin Services
[MOSIP-10515](https://mosip.atlassian.net/browse/MOSIP-10515) | Unable to upload data in History Tables via bulk Upload | Admin Services
[MOSIP-10509](https://mosip.atlassian.net/browse/MOSIP-10509) | The response for packet upload should not contain table name as packet | Admin Services
[MOSIP-10484](https://mosip.atlassian.net/browse/MOSIP-10484) | The role displayed in Admin UI should be specific to Admin only | Admin Services
[MOSIP-10397](https://mosip.atlassian.net/browse/MOSIP-10397) | API doesn't handle Insertion of TPM keys in Machine Master | Admin Services
[MOSIP-10386](https://mosip.atlassian.net/browse/MOSIP-10386) | The centerType should not be removed from the already created center if it is deactivated | Admin Services
[MOSIP-10294](https://mosip.atlassian.net/browse/MOSIP-10294) | Unable to Activate or Deactivate the Holiday Master Data | Admin Services
[MOSIP-9255](https://mosip.atlassian.net/browse/MOSIP-9255) | The transaction is logged when only the table is selected with no csv and operation mentioned | Admin Services
[MOSIP-600](https://mosip.atlassian.net/browse/MOSIP-600) | Lunch Start time and Lunch End time is not visible in UI | Admin Services
[MOSIP-10621](https://mosip.atlassian.net/browse/MOSIP-10621) | Websub Subscription fails with error for one or more topics when 4 topics are subscribed in a row. | Commons
[MOSIP-534](https://mosip.atlassian.net/browse/MOSIP-534) | Updated keys are not present (updated keys) in the Key_Store table in derby DB| Commons
[MOSIP-10408](https://mosip.atlassian.net/browse/MOSIP-10408) | Able to do OTP authentication with a different partner | Authentication
[MOSIP-10732](https://mosip.atlassian.net/browse/MOSIP-10732) | Able to insert values as string in id repo when they are defined as simpleType in the ID schema | Authentication
[MOSIP-10658](https://mosip.atlassian.net/browse/MOSIP-10658) | Changes in IDA templates are not reflected until service restart | Authentication
[MOSIP-10252](https://mosip.atlassian.net/browse/MOSIP-10252) | Change in policy/partner is not notified to IDA | Partner Management
[MOSIP-10843](https://mosip.atlassian.net/browse/MOSIP-10843) | Booking are getting created for Non-working days but not Working days | Pre-registration
[MOSIP-10586](https://mosip.atlassian.net/browse/MOSIP-10586) | SEND OTP remains disabled even after entering Captcha if Captcha is enabled | Pre-registration
[MOSIP-9852](https://mosip.atlassian.net/browse/MOSIP-9852) | No email is received after booking appointment | Pre-registration
[MOSIP-10834](https://mosip.atlassian.net/browse/MOSIP-10834) | The preregistartion.identity.name property should be present under UI  | Pre-registration
[MOSIP-10492](https://mosip.atlassian.net/browse/MOSIP-10492) | The Age field is populated as NaN when navigated using keyboard| Pre-registration

{% hint style="info" %}

All our open defects are available in [JIRA](https://mosip.atlassian.net/). Please [click on this link](https://mosip.atlassian.net/issues/?filter=10709) to view all the open defects.

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
