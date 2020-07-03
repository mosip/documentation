## Table Of Contents

- [Scope](#scope-)
- [Documentation](#documentation-)
- [Key Points](#key-points-)
- [Code](#code-)
- [Test Reports](#test-reports-)
  * [1. In scope](#1-in-scope-)
  * [2. Not in scope](#2-Not-in-scope-)
  * [3. Executive Summary – Consolidated Quality Status](#3-executive-summary--consolidated-quality-status-)
  * [4. Types of Testing](#4-types-of-testing-)
  * [5. Test Execution Summary](#5-test-execution-summary-)
- [Known Issues](#known-issues-)
- [List Of Acronyms](#list-of-acronyms-)

## Scope [**[↑]**](#table-of-contents)
This release is with **proxy biometrics**. This means that the implementation of Print system, SDK, MDM (MOSIP  Device Manager), ABIS (Automated Biometrics Identification System) and Biometric devices has been stubbed. Also, this version is tested for functionality. Non-functional requirements (Performance, Scale and Security) will be taken up in subsequent releases.

* Features included – Pre-Registration, Registration Client, Registration Processor, ID Authentication, Reference GUI implementation of Pre-Registration and Registration Client. 
* Features not included – Administration, Partner Management, Resident Services

## Documentation [**[↑]**](#table-of-contents)

### Platform Documentation 
Includes Functional requirements, Process flows, Architecture and High level design, Getting started and Deployment guide, Developer documentation etc.  
[**Link to Platform Documentation**](https://docs.mosip.io/platform)

### Detailed Documentation

#### Low Level design
* [Admin](https://github.com/mosip/admin-services/tree/master/design)
* [Pre Registration](https://github.com/mosip/pre-registration/tree/master/design)
* [Registration](https://github.com/mosip/registration/tree/master/design)
* [ID Authentication](https://github.com/mosip/id-authentication/tree/master/design)
* [Commons](https://github.com/mosip/commons/tree/master/design)

### Test cases
* [Functional Test Case](https://github.com/mosip/mosip-functional-tests/tree/0.9.0)

## Key Points [**[↑]**](#table-of-contents)
|Key Points|	Details|
|----|----|
|Pre Registration - Browser support |	Chrome 74.0.3729)|
|Deployment Script Environment|	Microsoft Azure|
|Registration Client – OS version|	Windows 10 (English version)  with TPM 2.0|
|Camera|	Logitech / Default windows camera|
|Scanner|	Canon lide 120|
|GPS|	GlobalSat BU-353-S4|
|Biometrics standard|	CBEFF format (Version - 0.9.0)|
|SMS gateway|	MSG91, Infobip|
|Registration Client – face capture |	OpenImaj - This is licensed for demo purpose only|
|Keystore|	SoftHSM|
|Antivirus|	ClamAV|
|Maps	|OpenstreetMap|
|Supporting key based digital signatures, not using digital certificates||	
|Transliteration|	ICU4J (Library with French, Arabic languages)|

## Code [**[↑]**](#table-of-contents)
The [code](https://github.com/mosip/mosip-platform-mt/tree/0.9.0) and [automation tests](https://github.com/mosip/mosip-functional-tests/tree/0.9.0) are available on GitHub. The code needs to be built and deployed as per the procedure documented in [**Building And Deploying MOSIP**](Build-and-Deploy.md). We will actively support System Integrators during their first deployment.

## Tests [**[↑]**](#table-of-contents)
**Testing Scope**

### In Scope 

|Title	|Description|
|------|------|
|Modules Tested|<li> Pre-registration (UI & Server) <li> Registration Client (UI & APIs) <li> Kernel (APIs) <li> Registration Processor (Server) <li> ID Authentication (APIs) <li> ID Repo (APIs)|
| Version Tag Tested|	0.9.0|
|Test Methodology| <li>  Manual <li>  Test Automation|
|Types of testing|<li>	 Smoke <li> Functional <li>  Integration <li> 	Regression|
|Testing Levels|![Image](_images/test_rig_automation/image1.jpg) |
|Configuration Parameters tested for| Refer to QA env properties file with suffix ‘qa’ in the filename, at [**Link**](https://github.com/mosip/mosip-config/tree/0.9.1_23092019)|
|Browser Support|**Pre-Registration**    <li> Chrome – 74.0.3729.169|
|OS Support|**Registration Client**    <li> Windows 10|
|Language Support|French, Arabic, English|

### Not in Scope 

|Title|	Description|
|------|------|
|NFR Testing| <li> Scalability Testing <li> Performance Testing <li> Security Testing|
|Configuration Testing|<li> Testing is done for one set of approved production configuration <li> Changing the configuration parameters for various values (boundary values) and testing the impact of each such value on the platform code will be taken up in subsequent releases.|

### Executive Summary – Consolidated Quality Status 

|Sl. No.|	Module / Activity|Test Methodology|	Test Status|
|------|------|------|------|
|1|	Kernel	|<li> Test Automation	|PASS|	
|2|	Pre-Registration|<li> Tested Manually <li> Test Automation|PASS |
|3|	Registration Client|<li> Tested Manually <li> Test Automation|PASS|
|4| Registration Processor|<li> Tested Manually <li> Test Automation	|PASS |
|5|	ID Authentication	|	<li>  Test Automation	|PASS|
|6|	ID Repo	|	<li> Test Automation	|PASS|	
|7| Pre-Registration to Registration Client integration testing|	<li> Tested Manually|PASS	|	
|8|	Registration Client to Registration Processor integration testing|	<li> Tested Manually|PASS|	
|9|	Registration Processor to Pre-Registration integration testing|<li>  Tested Manually|PASS	|	
|10| Registration Processor to Registration Client integration testing|<li> 	Tested Manually|PASS|
|11| Registration Client to IDA integration testing|<li> 	Tested Manually|PASS		|
|12| Registration Processor to IDA integration testing|<li> 	Tested Manually|PASS|
|13| IDA to ID Repo|<li> 	Tested Manually|PASS	|
|14| Kernel API integration|	<li> Tested Manually <li> Test Automation|	PASS|
|15| End to end functional testing|	<li> Tested Manually|PASS|	

### Types of Testing 

|Testing Type| Description|
|------|------|
|Smoke Testing|Tests to ensure basic workflows work fine|
|Functional Testing|Tests to ensure functionality of each module and overall system work fine in accordance with the given requirements|
|Integration Testing|Tests to ensure the inter module functionality works fine and in accordance with the integration requirements|
|Regression Testing|Tests to ensure that any change doesn't break existing functionality|
	
### Test Execution Summary 
![Image](_images/release/0.9.0/ExecutionSummary_0.9.0.jpg)  

## Known Issues [**[↑]**](#table-of-contents)
![Image](_images/release/0.9.0/KnownIssues_0.9.0.jpg) 

## List Of Acronyms [**[↑]**](#table-of-contents)
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
