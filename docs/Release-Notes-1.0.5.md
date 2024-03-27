# Release Notes 1.0.5

### Table Of Contents

* [Scope](Release-Notes-1.0.5.md#scope-)
* [Documentation](Release-Notes-1.0.5.md#documentation-)
* [Key Points](Release-Notes-1.0.5.md#key-points-)
* [Code](Release-Notes-1.0.5.md#code-)
* [Test Reports](Release-Notes-1.0.5.md#test-reports-)
  * [1. In scope](Release-Notes-1.0.5.md#1-in-scope-)
  * [2. Not in scope](Release-Notes-1.0.5.md#2-Not-in-scope-)
  * [3. Executive Summary – Consolidated Quality Status](Release-Notes-1.0.5.md#3-executive-summary--consolidated-quality-status-)
  * [4. Types of Testing](Release-Notes-1.0.5.md#4-types-of-testing-)
  * [5. Test Execution Summary](Release-Notes-1.0.5.md#5-test-execution-summary-)
* [Known Issues](Release-Notes-1.0.5.md#known-issues-)
* [List Of Acronyms](Release-Notes-1.0.5.md#list-of-acronyms-)

### Scope [**\[↑\]**](Release-Notes-1.0.5.md#table-of-contents)

This release is with **real biometrics**. This means that MOSIP Platform is now integrated with SDK, MDS (MOSIP Device Service), ABIS (Automated Biometrics Identification System) and Biometric devices. Also, this version is tested for Biometric functionalities. Non-functional requirements (Performance, Scale and Security) will be taken up in subsequent releases.

* Modules included
  * Pre-Registration
  * Registration Client
  * Registration Processor
  * Authentication
  * Administration
  * Reference GUI implementation of Pre-Registration, Registration Client and Administration
* Modules not included
  * Partner Management
  * Resident Services
* IAM - The Identity and Access Management(IAM) had been changed from custom implementation to Keycloak.

Module-wise features released as part of this release can be found [here](\_files/release/1.0.5/MOSIP\_Feature\_Release\_v1.0.5.xlsx)

### Documentation [**\[↑\]**](Release-Notes-1.0.5.md#table-of-contents)

#### 1. Platform Documentation

Includes Functional requirements, Process flows, Architecture and High level design, Getting started and Deployment guide, Developer documentation etc. Please find the [link to Platform Documentation](https://docs.mosip.io/platform/).

#### 2. Detailed Documentation

Low level design documents for respective modules is found below: \* [Pre-Registration](https://github.com/mosip/pre-registration/tree/master/design/pre-registration) \* [Registration Client](https://github.com/mosip/registration/tree/master/design/registration) \* [Registration Processor](https://github.com/mosip/registration/tree/master/design/registration-processor) \* [Authentication](https://github.com/mosip/id-authentication/tree/master/design/authentication) \* [Administration](https://github.com/mosip/admin-services/tree/master/design/admin) \* [ID Repository](https://github.com/mosip/commons/tree/master/design/kernel) \* [Kernel](https://github.com/mosip/commons/tree/master/design/idrepository)

#### 3. Platform Configuration for RBR

MOSIP Platform can be configured to be used for Real Biometrics. Please find the [guide to configure MOSIP for biometrics](Guide-to-Configure-MOSIP-for-Biometrics.md).

### Key Points [**\[↑\]**](Release-Notes-1.0.5.md#table-of-contents)

| Key Points                                                              | Details                                           |
| ----------------------------------------------------------------------- | ------------------------------------------------- |
| Pre Registration - Browser support                                      | Chrome 74.0.3729                                  |
| Deployment Script Environment                                           | Microsoft Azure                                   |
| Registration Client – OS version                                        | Windows 10 (English version) with TPM 2.0         |
| Camera                                                                  | Logitech / Default windows camera                 |
| Scanner                                                                 | Canon lide 120                                    |
| GPS                                                                     | GlobalSat BU-353-S4                               |
| Biometrics standard                                                     | CBEFF format (Version - 0.9.0)                    |
| MOSIP Device Service (MDS)                                              | Version - 0.9.1                                   |
| SMS gateway                                                             | MSG91, Infobip                                    |
| Registration Client – face capture                                      | OpenImaj - This is licensed for demo purpose only |
| Keystore                                                                | SoftHSM                                           |
| Antivirus                                                               | ClamAV                                            |
| Maps                                                                    | OpenstreetMap                                     |
| Supporting key based digital signatures, not using digital certificates |                                                   |
| Transliteration                                                         | ICU4J (Library with French, Arabic languages)     |

### Code [**\[↑\]**](Release-Notes-1.0.5.md#table-of-contents)

The code and [automation tests](https://github.com/mosip/mosip-functional-tests/tree/1.0.5) are available on [GitHub](https://github.com/mosip/). The code needs to be built and deployed as per the procedure documented in [**Building And Deploying MOSIP**](Build-and-Deploy.md). We will actively support System Integrators during their first deployment.

### Test Reports [**\[↑\]**](Release-Notes-1.0.5.md#table-of-contents)

**1. In scope** [**\[↑\]**](Release-Notes-1.0.5.md#table-of-contents)

| Title                               | Description                                                                                                                                                                                                                                                      |
| ----------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Modules Tested                      | <ul><li>Pre-registration (UI &#x26; Server)</li><li>Registration Client (UI &#x26; APIs)</li><li>Kernel (APIs)</li><li>Registration Processor (Server)</li><li>ID Authentication (APIs)</li><li>ID Repo (APIs)</li><li>Administration (UI &#x26; APIs)</li></ul> |
| Version Tag Tested                  | 1.0.5                                                                                                                                                                                                                                                            |
| Test Methodology                    | <ul><li>Manual</li><li>Test Automation</li></ul>                                                                                                                                                                                                                 |
| Types of testing                    | <ul><li>Smoke</li><li>Functional</li><li>Integration</li><li>Regression</li></ul>                                                                                                                                                                                |
| Testing Levels                      | ![Image](<\_images/test\_rig\_automation/image1 (2) (1).jpg>)                                                                                                                                                                                                    |
| Configuration Parameters tested for | Refer to properties file at [**Link**](https://github.com/mosip/mosip-config/tree/1.0.5)                                                                                                                                                                         |
| Browser Support                     | <p><strong>Pre-Registration</strong></p><ul><li>Chrome – 78.0.3904.108</li></ul>                                                                                                                                                                                 |
| OS Support                          | <p><strong>Registration Client</strong></p><ul><li>Windows 10</li></ul>                                                                                                                                                                                          |
| Language Support                    | French, Arabic, English                                                                                                                                                                                                                                          |

**2. Not in scope** [**\[↑\]**](Release-Notes-1.0.5.md#table-of-contents)

| Title                 | Description                                                                                                                                                                                                                                                                                   |
| --------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| NFR Testing           | <ul><li>Scalability Testing</li><li>Performance Testing</li><li>Security Testing</li></ul>                                                                                                                                                                                                    |
| Configuration Testing | <ul><li><p>Testing is done for one set of approved production configuration</p><ul><li>Changing the configuration parameters for various values (boundary values) and testing the impact of each such value on the platform code will be taken up in subsequent releases.</li></ul></li></ul> |

**3. Executive Summary – Consolidated Quality Status** [**\[↑\]**](Release-Notes-1.0.5.md#table-of-contents)

| Sl. No. | Module / Activity                                                 | Test Methodology                                                   | Test Status |
| ------- | ----------------------------------------------------------------- | ------------------------------------------------------------------ | ----------- |
| 1       | Kernel                                                            | <ul><li>Test Automation</li></ul>                                  | PASS        |
| 2       | Pre-Registration                                                  | <ul><li>Test Automation</li></ul>                                  | PASS        |
| 3       | Registration Client                                               | \* Tested Manually \* Test Automation                              | PASS        |
| 4       | Registration Processor                                            | <ul><li>Tested Manually</li></ul><ul><li>Test Automation</li></ul> | PASS        |
| 5       | ID Authentication                                                 | <ul><li>Test Automation</li></ul>                                  | PASS        |
| 6       | ID Repo                                                           | <ul><li>Test Automation</li></ul>                                  | PASS        |
| 7       | Pre-Registration to Registration Client integration testing       | <ul><li>Tested Manually</li></ul>                                  | PASS        |
| 8       | Registration Client to Registration Processor integration testing | <ul><li>Tested Manually</li></ul>                                  | PASS        |
| 9       | Registration Processor to IDA integration testing                 | <ul><li>Tested Manually</li></ul>                                  | PASS        |
| 10      | IDA to ID Repo                                                    | <ul><li>Tested Manually</li></ul>                                  | PASS        |

**4. Types of Testing** [**\[↑\]**](Release-Notes-1.0.5.md#table-of-contents)

| Testing Type        | Description                                                                                                         |
| ------------------- | ------------------------------------------------------------------------------------------------------------------- |
| Smoke Testing       | Tests to ensure basic work flows work fine                                                                          |
| Functional Testing  | Tests to ensure functionality of each module and overall system work fine in accordance with the given requirements |
| Integration Testing | Tests to ensure the inter module functionality works fine and in accordance with the integration requirements       |
| Regression Testing  | Tests to ensure that any change doesn't break existing functionality                                                |

**5. Test Execution Summary** [**\[↑\]**](Release-Notes-1.0.5.md#table-of-contents)

![](<\_images/release/1.0.5/ExecutionSummary\_1.0.5 (1).jpg>)

### Known Issues [**\[↑\]**](Release-Notes-1.0.5.md#table-of-contents)

![](<\_images/release/1.0.5/KnownIssues\_1.0.5 (1).jpg>)

### List Of Acronyms [**\[↑\]**](Release-Notes-1.0.5.md#table-of-contents)

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
