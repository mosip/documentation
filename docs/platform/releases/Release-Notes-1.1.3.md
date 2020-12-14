## Table Of Contents

- [Scope](#scope)
- [Documentation](#documentation)
- [Code](#code)
- [Tests](#tests)
	* [a. In scope](#a-in-scope)
	* [b. Not in scope](#b-not-in-scope)
	* [c. Test Execution Metrics](#c-test-execution-metrics)
- [Known Issues](#known-issues)
- [Acronyms](#acronyms)

## Scope
MOSIP Version **1.1.3** is an interim release on top of **1.1.2** release. It has some of the new features which were planned for release **1.2** and some critical bug fixes which were identified in [Release 1.1.2](Release-Notes-1.1.2.md#list-of-known-issues).

**Release Date:** December 10, 2020

**Key Highlights**

* [New features added to MOSIP are listed here](Release-Notes-1.1.3-Features.md)
* [All the bug fixes are listed here](Release-Notes-1.1.3-Bug-Fixes.md)

## Documentation

### 1. Platform 
Includes functional requirements, process flows, architecture and high level design. 

[Link to documentation](https://docs.mosip.io/platform/modules).

### 2. APIs
All APIs are documented [here](https://docs.mosip.io/platform/apis).

### 3. Design 
Low level design documents for each module are available in the respective github repos.

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
|Functional Testing|<ul><li>Pre-registration (Dynamic UI & APIs)</li><li>Registration Client (Dynamic UI)</li><li>Kernel (APIs)</li><li>Registration Processor (Server)</li><li>ID Authentication (APIs)</li><li>Partner Management (APIs)</li><li>ID Repository (APIs)</li><li>Resident Services (APIs)</li><li>Admin (UI & APIs)</li></ul>|
|Configuration Testing| Testing was done for default configuration (two languages) and single language with changed ui specification for pre-registration and registration client (Further more we have changed the seed data to single language).|
|Version Tested|v1.1.3|
|Types of testing|<ul><li>Smoke</li><li>Functional</li><li>Integration</li><li>Regression</li></ul>|
|Browser Support|Pre-Registration (Latest Versions of Chrome)|
|OS Support|Registration Client (Windows 10)|

|Areas |Technology Used|
----|----
Deployment Script Environment |	AWS
Registration Client with TPM 2.0 | Windows 10
Biometrics Standard | CBEFF format (Version - 2.0)
MDS (Proxy) | MDS v0.9.5
ABIS (Proxy) | ABIS Spec Version v0.9
SDK (Proxy) | SDK Spec Version v0.9
Key-store | SoftHSM
Anti-virus | ClamAV
Maps | OpenstreetMap
Transliteration | ICU4J (Library with French, Arabic languages)

### b. Not in scope 
|Title|	Description|
|-----|------------|
|Non-Functional Testing| <ul><li>Performance Testing</li><li>Reliability and Disaster recovery Testing</li></ul>|
|Non-Biometrics Device Testing | Testing was not done for GPS Device, Docuemnt Scanner and Docuemnt Printer |
|HSM | Testing was done only using SoftHSM |
|Biometric Devices | Testing was done only with Proxy components |
|ABIS & Biometric SDKs | Testing was done only with Proxy components |
|Automation Testing | Automation Testing is going through enhancement and is skipped for this version |
|Browser Support | Testing for Pre-registration and Admin UI was done only on Chrome (latest version) |

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
[MOSIP-10725](https://mosip.atlassian.net/browse/MOSIP-10725) | We should display an informative message when the upgrade process is running. | Registration Client
[MOSIP-10724](https://mosip.atlassian.net/browse/MOSIP-10724) | Able to close the application by clicking on 'X' button top right corner when the upgrade is running | Registration Client
[MOSIP-10719](https://mosip.atlassian.net/browse/MOSIP-10719) | In Update-UIN flow, if the Name fields are not filled and continued then "Mandatory Fields should be highlighted" | Registration Client
[MOSIP-10718](https://mosip.atlassian.net/browse/MOSIP-10718) | Incorrect error message while onboarding for "expired token" | Registration Client
[MOSIP-10716](https://mosip.atlassian.net/browse/MOSIP-10716) | UIN Update process should not make the DOB as mandatory field | Registration Client
[MOSIP-10715](https://mosip.atlassian.net/browse/MOSIP-10715) | Incorrect error message thrown for "Onboarding process" when RID is not assigned to user | Registration Client
[MOSIP-10689](https://mosip.atlassian.net/browse/MOSIP-10689) | Center-Machine-RefId=null_null in header for registrationprocessor/v1/registrationstatus/sync API call | Registration Client
[MOSIP-10605](https://mosip.atlassian.net/browse/MOSIP-10605) | DoB is not handled like the age for displaying Parent/Guardian details in an adult packet. | Registration Client
[MOSIP-10568](https://mosip.atlassian.net/browse/MOSIP-10568) | Template Bugs for Preview, Acknowledgement pages of Reg-Client | Registration Client
[MOSIP-10503](https://mosip.atlassian.net/browse/MOSIP-10503) | In registration client packet upload page, packets uploaded from admin portal are not getting cleared leading to confusion | Registration Client
[MOSIP-10496](https://mosip.atlassian.net/browse/MOSIP-10496) | mosip.registration.onboarduser_ida_auth=Y - is not required in registration client-mz file. | Registration Client
[MOSIP-10004](https://mosip.atlassian.net/browse/MOSIP-10004) | EOD table must include the operator ID who created the packet | Registration Client
[MOSIP-10520](https://mosip.atlassian.net/browse/MOSIP-10520) | Navigation using "tab" is skipping couple of attributes in Reg-Client | Registration Client
[MOSIP-10480](https://mosip.atlassian.net/browse/MOSIP-10480) | The DOB validations are not happening correctly. | Registration Client
[MOSIP-9783](https://mosip.atlassian.net/browse/MOSIP-9783) | Visible images during registration process and a part of created packet is hidden in the UI. | Registration Client
[MOSIP-10593](https://mosip.atlassian.net/browse/MOSIP-10593) | The URL is coming as null in manual adjudication assignment response. | Registration Processor
[MOSIP-10851](https://mosip.atlassian.net/browse/MOSIP-10851) | Reg-Proc sending email notification using SMS template and vice~versa | Registration Processor
[MOSIP-10849](https://mosip.atlassian.net/browse/MOSIP-10849) | Notification not working when a packet is reprocessed. | Registration Processor
[MOSIP-10590](https://mosip.atlassian.net/browse/MOSIP-10590) | Double entries happening for Registration track in Audit log with different log-ID | Registration Processor
[MOSIP-10587](https://mosip.atlassian.net/browse/MOSIP-10587) | Unable to upload more than 200 packets | Admin Services
[MOSIP-10469](https://mosip.atlassian.net/browse/MOSIP-10469) | Unable to create machine from admin console | Admin Services
[MOSIP-10241](https://mosip.atlassian.net/browse/MOSIP-10241) | While performing Bulk Upload for a table using Admin master Bulk Upload history table associated with it should also be updated | Admin Services
[MOSIP-10854](https://mosip.atlassian.net/browse/MOSIP-10854) | Unable to upload the data using bulk upload from zoneUserHistory Table | Admin Services
[MOSIP-10720](https://mosip.atlassian.net/browse/MOSIP-10720) | Unable to create the Reg center as Region is not loading | Admin Services
[MOSIP-10603](https://mosip.atlassian.net/browse/MOSIP-10603) | User is getting error while trying to upload the data with JSON text inside the cell and that is comma seperated | Admin Services
[MOSIP-10588](https://mosip.atlassian.net/browse/MOSIP-10588) | The page is not getting refreshed when the non existing RID is entered | Admin Services
[MOSIP-10565](https://mosip.atlassian.net/browse/MOSIP-10565) | Proper error message to be shown when the data violation happens from DB side | Admin Services
[MOSIP-10561](https://mosip.atlassian.net/browse/MOSIP-10561) | Admin Role to be defined for KeyManager | Admin Services
[MOSIP-10515](https://mosip.atlassian.net/browse/MOSIP-10515) | Unable to upload data in History Tables via bulk Upload | Admin Services
[MOSIP-10509](https://mosip.atlassian.net/browse/MOSIP-10509) | The response for packet upload should not contain table name as packet | Admin Services
[MOSIP-10484](https://mosip.atlassian.net/browse/MOSIP-10484) | The role displayed in Admin UI should be specific to Admin only | Admin Services
[MOSIP-10397](https://mosip.atlassian.net/browse/MOSIP-10397) | API doesn't handle Insertion of TPM keys in Machine Master | Admin Services
[MOSIP-10386](https://mosip.atlassian.net/browse/MOSIP-10386) | The centerType should not be removed from the already created center if it deactivated | Admin Services
[MOSIP-10331](https://mosip.atlassian.net/browse/MOSIP-10331) | Audit logs issues for Device and Machine | Admin Services
[MOSIP-10296](https://mosip.atlassian.net/browse/MOSIP-10296) | The Location field should be dropdown under create Holiday MasterData | Admin Services
[MOSIP-10294](https://mosip.atlassian.net/browse/MOSIP-10294) | Unable to Activate or Deactivate the Holiday Master Data | Admin Services
[MOSIP-10072](https://mosip.atlassian.net/browse/MOSIP-10072) | While Uploading the .csv file the response should throw proper row and mistake done under file uploaded | Admin Services
[MOSIP-9255](https://mosip.atlassian.net/browse/MOSIP-9255) | The transaction is logged when only the table is selected with no csv and operation mentioned | Admin Services
[MOSIP-600](https://mosip.atlassian.net/browse/MOSIP-600) | Lunch Start time and Lunch End time is not visible in UI | Admin Services
[MOSIP-10733](https://mosip.atlassian.net/browse/MOSIP-10733) | The masterdata service is breaking frequently on use of Pre-reg UI | Admin Services
[MOSIP-9034](https://mosip.atlassian.net/browse/MOSIP-9034) | Inconsistency in Templates across all the modules. | Commons
[MOSIP-10621](https://mosip.atlassian.net/browse/MOSIP-10621) | Websub Subscription fails with error for one or more topics when 4 topics are subscribed in a row. | Commons
[MOSIP-534](https://mosip.atlassian.net/browse/MOSIP-534) | Updated keys are not present in Key_Store table after Master SYNC(mastersync does not update the keys in local DB if keys expire or deleted or duplicate or not found). | Commons
[MOSIP-10408](https://mosip.atlassian.net/browse/MOSIP-10408) | Able to do OTP authentication with a different partner | Authentication
[MOSIP-9496](https://mosip.atlassian.net/browse/MOSIP-9496) | IDA repo is not notifying IDA on UIN creation | Authentication
[MOSIP-10732](https://mosip.atlassian.net/browse/MOSIP-10732) | Incorrect ID schema validations | Authentication
[MOSIP-10658](https://mosip.atlassian.net/browse/MOSIP-10658) | IDA notification templates are cached | Authentication
[MOSIP-10396](https://mosip.atlassian.net/browse/MOSIP-10396) | Issues in eKYC response | Authentication
[MOSIP-10244](https://mosip.atlassian.net/browse/MOSIP-10244) | Code change required to perform IDA with new fields added in the schema | Authentication
[MOSIP-10252](https://mosip.atlassian.net/browse/MOSIP-10252) | Change in policy/partner is not notified to IDA | Partner Management
[MOSIP-10843](https://mosip.atlassian.net/browse/MOSIP-10843) | Booking are getting created for Non-working days but not Working days | Pre-registration
[MOSIP-10586](https://mosip.atlassian.net/browse/MOSIP-10586) | SEND OTP remains disabled even after entering Captcha | Pre-registration
[MOSIP-10326](https://mosip.atlassian.net/browse/MOSIP-10326) | Audit logs are missing for multiple action performed in pre-reg under the Audit log table | Pre-registration
[MOSIP-9852](https://mosip.atlassian.net/browse/MOSIP-9852) | No email is received after booking appointment | Pre-registration
[MOSIP-10834](https://mosip.atlassian.net/browse/MOSIP-10834) | The preregistartion.identity.name property should be present under UI PARAM | Pre-registration
[MOSIP-10833](https://mosip.atlassian.net/browse/MOSIP-10833) | When the resident status is not filled the document page gives Technical error occured | Pre-registration
[MOSIP-10713](https://mosip.atlassian.net/browse/MOSIP-10713) | Unable to search for Center using Filter Country as Philippines | Pre-registration
[MOSIP-10492](https://mosip.atlassian.net/browse/MOSIP-10492) | The Age field is populated as NaN | Pre-registration

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
