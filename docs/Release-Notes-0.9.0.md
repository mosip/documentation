# Release Notes 0.9.0

### Table Of Contents

* [Scope](Release-Notes-0.9.0.md#scope-)
* [Documentation](Release-Notes-0.9.0.md#documentation-)
* [Key Points](Release-Notes-0.9.0.md#key-points-)
* [Code](Release-Notes-0.9.0.md#code-)
* [Test Reports](Release-Notes-0.9.0.md#test-reports-)
  * [1. In scope](Release-Notes-0.9.0.md#1-in-scope-)
  * [2. Not in scope](Release-Notes-0.9.0.md#2-Not-in-scope-)
  * [3. Executive Summary – Consolidated Quality Status](Release-Notes-0.9.0.md#3-executive-summary--consolidated-quality-status-)
  * [4. Types of Testing](Release-Notes-0.9.0.md#4-types-of-testing-)
  * [5. Test Execution Summary](Release-Notes-0.9.0.md#5-test-execution-summary-)
* [Known Issues](Release-Notes-0.9.0.md#known-issues-)
* [List Of Acronyms](Release-Notes-0.9.0.md#list-of-acronyms-)

### Scope [**\[↑\]**](Release-Notes-0.9.0.md#table-of-contents)

This release is with **proxy biometrics**. This means that the implementation of Print system, SDK, MDM (MOSIP Device Manager), ABIS (Automated Biometrics Identification System) and Biometric devices has been stubbed. Also, this version is tested for functionality. Non-functional requirements (Performance, Scale and Security) will be taken up in subsequent releases.

* Features included – Pre-Registration, Registration Client, Registration Processor, ID Authentication, Reference GUI implementation of Pre-Registration and Registration Client.
* Features not included – Administration, Partner Management, Resident Services

### Documentation [**\[↑\]**](Release-Notes-0.9.0.md#table-of-contents)

#### Platform Documentation

Includes Functional requirements, Process flows, Architecture and High level design, Getting started and Deployment guide, Developer documentation etc.\
[**Link to Platform Documentation**](https://docs.mosip.io/platform)

#### Detailed Documentation

**Low Level design**

* [Admin](https://github.com/mosip/admin-services/tree/master/design)
* [Pre Registration](https://github.com/mosip/pre-registration/tree/master/design)
* [Registration](https://github.com/mosip/registration/tree/master/design)
* [ID Authentication](https://github.com/mosip/id-authentication/tree/master/design)
* [Commons](https://github.com/mosip/commons/tree/master/design)

#### Test cases

* [Functional Test Case](https://github.com/mosip/mosip-functional-tests/tree/0.9.0)

### Key Points [**\[↑\]**](Release-Notes-0.9.0.md#table-of-contents)

| Key Points                                                              | Details                                           |
| ----------------------------------------------------------------------- | ------------------------------------------------- |
| Pre Registration - Browser support                                      | Chrome 74.0.3729)                                 |
| Deployment Script Environment                                           | Microsoft Azure                                   |
| Registration Client – OS version                                        | Windows 10 (English version) with TPM 2.0         |
| Camera                                                                  | Logitech / Default windows camera                 |
| Scanner                                                                 | Canon lide 120                                    |
| GPS                                                                     | GlobalSat BU-353-S4                               |
| Biometrics standard                                                     | CBEFF format (Version - 0.9.0)                    |
| SMS gateway                                                             | MSG91, Infobip                                    |
| Registration Client – face capture                                      | OpenImaj - This is licensed for demo purpose only |
| Keystore                                                                | SoftHSM                                           |
| Antivirus                                                               | ClamAV                                            |
| Maps                                                                    | OpenstreetMap                                     |
| Supporting key based digital signatures, not using digital certificates |                                                   |
| Transliteration                                                         | ICU4J (Library with French, Arabic languages)     |

### Code [**\[↑\]**](Release-Notes-0.9.0.md#table-of-contents)

The code and [automation tests](https://github.com/mosip/mosip-functional-tests/tree/0.9.0) are available on [GitHub](https://github.com/mosip). The code needs to be built and deployed as per the procedure documented in [**Building And Deploying MOSIP**](Build-and-Deploy.md). We will actively support System Integrators during their first deployment.

### Tests [**\[↑\]**](Release-Notes-0.9.0.md#table-of-contents)

**Testing Scope**

#### In Scope

| Title                               | Description                                                                                                                                                                                                                                                           |
| ----------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Modules Tested                      | <ul><li>Pre-registration (UI &#x26; Server)</li></ul><ul><li>Registration Client (UI &#x26; APIs)</li></ul><ul><li>Kernel (APIs)</li></ul><ul><li>Registration Processor (Server)</li></ul><ul><li>ID Authentication (APIs)</li></ul><ul><li>ID Repo (APIs)</li></ul> |
| Version Tag Tested                  | 0.9.0                                                                                                                                                                                                                                                                 |
| Test Methodology                    | <ul><li>Manual</li></ul><ul><li>Test Automation</li></ul>                                                                                                                                                                                                             |
| Types of testing                    | <ul><li>Smoke</li></ul><ul><li>Functional</li></ul><ul><li>Integration</li></ul><ul><li>Regression</li></ul>                                                                                                                                                          |
| Testing Levels                      | ![Image](<\_images/test\_rig\_automation/image1 (2) (1).jpg>)                                                                                                                                                                                                         |
| Configuration Parameters tested for | Refer to QA env properties file with suffix ‘qa’ in the filename, at [**Link**](https://github.com/mosip/mosip-config/tree/0.9.1\_23092019)                                                                                                                           |
| Browser Support                     | <p><strong>Pre-Registration</strong></p><ul><li>Chrome – 74.0.3729.169</li></ul>                                                                                                                                                                                      |
| OS Support                          | <p><strong>Registration Client</strong></p><ul><li>Windows 10</li></ul>                                                                                                                                                                                               |
| Language Support                    | French, Arabic, English                                                                                                                                                                                                                                               |

#### Not in Scope

| Title                 | Description                                                                                                                                                                                                                                                                            |
| --------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| NFR Testing           | <ul><li>Scalability Testing</li></ul><ul><li>Performance Testing</li></ul><ul><li>Security Testing</li></ul>                                                                                                                                                                           |
| Configuration Testing | <ul><li>Testing is done for one set of approved production configuration</li></ul><ul><li>Changing the configuration parameters for various values (boundary values) and testing the impact of each such value on the platform code will be taken up in subsequent releases.</li></ul> |

#### Executive Summary – Consolidated Quality Status

| Sl. No. | Module / Activity                                                 | Test Methodology                                                   | Test Status |
| ------- | ----------------------------------------------------------------- | ------------------------------------------------------------------ | ----------- |
| 1       | Kernel                                                            | <ul><li>Test Automation</li></ul>                                  | PASS        |
| 2       | Pre-Registration                                                  | <ul><li>Tested Manually</li></ul><ul><li>Test Automation</li></ul> | PASS        |
| 3       | Registration Client                                               | <ul><li>Tested Manually</li></ul><ul><li>Test Automation</li></ul> | PASS        |
| 4       | Registration Processor                                            | <ul><li>Tested Manually</li></ul><ul><li>Test Automation</li></ul> | PASS        |
| 5       | ID Authentication                                                 | <ul><li>Test Automation</li></ul>                                  | PASS        |
| 6       | ID Repo                                                           | <ul><li>Test Automation</li></ul>                                  | PASS        |
| 7       | Pre-Registration to Registration Client integration testing       | <ul><li>Tested Manually</li></ul>                                  | PASS        |
| 8       | Registration Client to Registration Processor integration testing | <ul><li>Tested Manually</li></ul>                                  | PASS        |
| 9       | Registration Processor to Pre-Registration integration testing    | <ul><li>Tested Manually</li></ul>                                  | PASS        |
| 10      | Registration Processor to Registration Client integration testing | <ul><li>Tested Manually</li></ul>                                  | PASS        |
| 11      | Registration Client to IDA integration testing                    | <ul><li>Tested Manually</li></ul>                                  | PASS        |
| 12      | Registration Processor to IDA integration testing                 | <ul><li>Tested Manually</li></ul>                                  | PASS        |
| 13      | IDA to ID Repo                                                    | <ul><li>Tested Manually</li></ul>                                  | PASS        |
| 14      | Kernel API integration                                            | <ul><li>Tested Manually</li></ul><ul><li>Test Automation</li></ul> | PASS        |
| 15      | End to end functional testing                                     | <ul><li>Tested Manually</li></ul>                                  | PASS        |

#### Types of Testing

| Testing Type        | Description                                                                                                         |
| ------------------- | ------------------------------------------------------------------------------------------------------------------- |
| Smoke Testing       | Tests to ensure basic workflows work fine                                                                           |
| Functional Testing  | Tests to ensure functionality of each module and overall system work fine in accordance with the given requirements |
| Integration Testing | Tests to ensure the inter module functionality works fine and in accordance with the integration requirements       |
| Regression Testing  | Tests to ensure that any change doesn't break existing functionality                                                |

#### Test Execution Summary

![Image](<\_images/release/0.9.0/ExecutionSummary\_0.9.0 (1).jpg>)

### Known Issues [**\[↑\]**](Release-Notes-0.9.0.md#table-of-contents)

![Image](<\_images/release/0.9.0/KnownIssues\_0.9.0 (1).jpg>)

### List Of Acronyms [**\[↑\]**](Release-Notes-0.9.0.md#table-of-contents)

| Acronym | Expanded Form                               |
| ------- | ------------------------------------------- |
| ABIS    | Automated Biometric Identification System   |
| API     | Application Programming Interface           |
| ID      | Identity                                    |
| IDA     | Identity Authentication                     |
| MOSIP   | Modular Open Source Identity Platform       |
| NFR     | Non-Functional Requirements                 |
| OTP     | One Time Password                           |
| SDK     | Software Development Kit                    |
| TBD     | To Be Determined                            |
| TOTP    | Temporary One Time Password                 |
| UIN     | Unique Identification Number                |
| WIP     | Work In Progress                            |
| CBEFF   | Common Biometric Exchange Formats Framework |
| HSM     | Hardware Security Module                    |
| TPM     | Trusted Platform Module                     |
