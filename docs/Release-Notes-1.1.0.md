## Table Of Contents

- [Scope](#scope-)
- [Documentation](#documentation-)
- [Key Points](#key-points-)
- [Code](#code-)
- [Test Reports](#test-reports-)
- [Known Issues](#known-issues-)
- [List Of Acronyms](#list-of-acronyms-)

## Scope [**[↑]**](#table-of-contents)
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
  * Github actions, git commit id in builds
  * Shift from private repository to public maven and  docker repositories
  * Decoupling version of components from release version
  * Gitbook based documentation
* Technology Changes
  * Keycloak for IAM
  * ApacheDS ldap as user store deprecated
  * Prometheus end points in all spring boot services
  * Network HSM support added

## Documentation [**[↑]**](#table-of-contents)

### 1. Platform Documentation
Includes functional requirements, process flows, architecture and high level design.  

[**Link to documentation for MOSIP modules**](https://docs.mosip.io/platform/modules).

### 2. API Specifications
API specifications for the MOSIP APIs is available [here](https://docs.mosip.io/platform/apis)

### 3. Design Documentation
Low level design documents for each modules are available in respective repositories.

## Key Points [**[↑]**](#table-of-contents)

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

## Code [**[↑]**](#table-of-contents)
The code and [automation tests](https://github.com/mosip/mosip-functional-tests) are tagged to 1.1.0 and are available on GitHub. The code needs to be built and deployed as per the [Sandbox Installer](https://github.com/mosip/mosip-infra/blob/master/deployment/sandbox-v2/README.md). We will actively support System Integrators during their first deployment.
* [Commons](https://github.com/mosip/commons/releases)
* [Pre-registration](https://github.com/mosip/pre-registration/releases)
* [Registration](https://github.com/mosip/registration/releases)
* [Authentication](https://github.com/mosip/id-authentication/releases)
* [Partner Management Services](https://github.com/mosip/partner-management-services/releases)
* [Admin Services](https://github.com/mosip/admin-services/releases)
* [Resident Services](https://github.com/mosip/resident-services/releases)
* [Reference Implementation](https://github.com/mosip/mosip-ref-impl/releases)

## Test Reports [**[↑]**](#table-of-contents)
**TBD**
 
## Known Issues [**[↑]**](#table-of-contents)
**TBD**

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
SDK | Software Development Kit
MDS | Mosip Device Service