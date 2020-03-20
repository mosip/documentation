
## Scope
This release is with **proxy biometrics**. This means that the implementation of Print system, SDK, MDM (MOSIP  Device Manager), ABIS (Automated Biometrics Identification System) and Biometric devices has been stubbed. Also, this version is tested for functionality. Non-functional requirements (Performance, Scale and Security) will be taken up in subsequent releases.

* Features included – Pre-Registration, Registration Client, Registration Processor, ID Authentication, Reference GUI implementation of Pre-Registration and Registration Client. 
* Features not included – Administration, Partner Management, Resident Services
## Documentation 

### Platform Documentation 
Includes Functional requirements, Process flows, Architecture and High level design, Getting started and Deployment guide, Developer documentation etc.  
   [**Link to Platform Documentation**](https://mosipdocs.gitbook.io/platform/)

### Detailed Documentation
#### Low Level design
* [Admin](https://github.com/mosip/admin-services/tree/master/design)
* [Pre Registration](https://github.com/mosip/pre-registration/tree/master/design)
* [Registration](https://github.com/mosip/registration/tree/master/design)
* [ID Authentication](https://github.com/mosip/id-authentication/tree/master/design)
* [Commons](https://github.com/mosip/commons/tree/master/design)

#### Test cases
* [Functional Test Case](https://github.com/mosip/mosip-functional-tests)

## Key Points 
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

## Code 
The [code](https://github.com/mosip/) and [automation tests](https://github.com/mosip/mosip-functional-tests) are available on GitHub. The code needs to be built and deployed as per the procedure documented in [**Building And Deploying MOSIP**](Build-and-Deploy.md). We will actively support System Integrators during their first deployment.

## Tests 
**Testing Scope**

### In Scope 

|Title	|Description|
|------|------|
|Modules Tested|<li> Pre-registration (UI & Server) <li> Registration Client (UI & APIs) <li> Kernel (APIs) <li> Registration Processor (Server) <li> ID Authentication (APIs) <li> ID Repo (APIs)|
| Version Tag Tested|	0.9.0|
|Test Methodology| <li>  Manual <li>  Test Automation|
|Types of testing|<li>	 Smoke <li> Functional <li>  Integration <li> 	Regression|
|Testing Levels|![Image](_images/test_rig_automation/image1.jpg) |
|Configuration Parameters tested for| Refer to QA env properties file with suffix ‘qa’ in the filename, at [**Link**](https://github.com/mosip/mosip-config)|
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
![Image](_images/test_rig_automation/Capture.JPG)  

## Known Issues 
![Image](_images/test_rig_automation/image4.jpg) 

## Support Process (To Be Determined) 
Process to be followed for support required, escalation matrix, etc.
