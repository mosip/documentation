# Release notes - Inji Certify - 0.12.0

**Release Name:** Inji Certify 0.12.0

**Support:** Developer Release

**Release Date:** TBD

### **Overview**

Inji Certify 0.12.0 represents a major advancement in verifiable credential technology, introducing groundbreaking support for Selective Disclosure JWT (SD-JWT) and comprehensive revocation mechanisms. This release significantly enhances the platform's security, interoperability, and scalability while maintaining backward compatibility. Key highlights include advanced cryptographic support, streamlined credential management workflows, and robust data integrity features designed to meet evolving industry standards.

#### **New Features in Version 0.12.0:**

1. **Selective Disclosure JWT (SD-JWT) Support:**
   * **Privacy-Preserving Credentials:** Full implementation of SD-JWT allowing selective disclosure of credential attributes, enhancing user privacy and compliance with data protection regulations.
   * **Enhanced Trust Framework:** Integration with did:web in issuer attributes for improved trust establishment and verification workflows.

2. **Advanced Revocation Capabilities:**
   * **Comprehensive Revocation System:** Complete implementation of verifiable credential revocation with search functionality for credentials pending revocation.
   * **Status List Management:** Enhanced status list mechanisms for efficient revocation tracking and verification.

3. **Enhanced Credential Type Management:**
   * **Dynamic VC Type Addition:** Improved APIs for adding new verifiable credential types with comprehensive validation and configuration support.
   * **Automated Configuration:** Streamlined processes for configuring well-known endpoints during VC type addition.

4. **Advanced Cryptographic Support:**
   * **ECC R1 Key Support:** Implementation of Elliptic Curve Cryptography R1 key signing and verification for enhanced security.
   * **did:key Integration:** Native support for did:key method in Inji Certify factory implementations.

5. **Data Integrity and Security:**
   * **Enhanced Data Integrity:** Comprehensive data integrity mechanisms for all issued verifiable credentials.
   * **W3C VC 2.0 Compliance:** Full support for W3C Verifiable Credentials Data Model 2.0 with data integrity proofs.

6. **Improved Developer Experience:**
   * **Codebase Refactoring:** Major codebase improvements for better maintainability and performance.
   * **Enhanced Testing:** Improved test coverage reaching 80% or above with comprehensive Sonar analysis.
   * **Migration Utilities:** Automated upgrade utilities with configuration migration support from version 0.11.0 to 0.12.0.

7. **Enhanced Deployment and Configuration:**
   * **Updated Docker Compose:** Latest versions of Mimoto and InjiWeb integrated in Docker compose setup.
   * **Pre-Authorized Code Flow:** Implementation of OAuth 2.0 pre-authorized code flow for streamlined authorization processes.

### **Story**

[INJICERT-61](https://mosip.atlassian.net/browse/INJICERT-61) Support Selective Disclosure JWT \(SD-JWT\) for Issuing Verifiable Credentials \(VCs\)

[INJICERT-522](https://mosip.atlassian.net/browse/INJICERT-522) add support for did:key for Inji Certify as a Factory

[INJICERT-768](https://mosip.atlassian.net/browse/INJICERT-768) Refactoring the codebase of Inji Certify

[INJICERT-769](https://mosip.atlassian.net/browse/INJICERT-769) Adding new verifiable credential \(VC\) type to the existing issuer

[INJICERT-792](https://mosip.atlassian.net/browse/INJICERT-792) <Feature>Implementation of a Revocation Feature in Inji Certify for Verifiable Credentials

[INJICERT-977](https://mosip.atlassian.net/browse/INJICERT-977) ECC R1 Key Signing and Verification

[INJICERT-978](https://mosip.atlassian.net/browse/INJICERT-978) Refactoring the codebase of Inji Certify

[INJICERT-1033](https://mosip.atlassian.net/browse/INJICERT-1033) Ensure data integrity for VC issued 

[INJICERT-1036](https://mosip.atlassian.net/browse/INJICERT-1036) <Feature> Enhance VC Type Addition API with Validations and Config Support

[INJICERT-1060](https://mosip.atlassian.net/browse/INJICERT-1060) Enable Trust Element in VC Format \(SD-JWT\) Using did:web in iss Attribute

[INJICERT-1116](https://mosip.atlassian.net/browse/INJICERT-1116) <Feature> Search for Verifiable Credential \(VC\) to be Revoked

[INJICERT-1145](https://mosip.atlassian.net/browse/INJICERT-1145) Critical Code review changes from the LSH

[INJICERT-1151](https://mosip.atlassian.net/browse/INJICERT-1151) Documentation - Upgrade from 0.11.0 to 0.12.0

[INJICERT-1152](https://mosip.atlassian.net/browse/INJICERT-1152) Create a utility to upgrade Inji Certify from version 0.11.0 to 0.12.0 with configuration migration support

[INJICERT-1164](https://mosip.atlassian.net/browse/INJICERT-1164) INJICERT- Docker compose to have latest version of mimoto and injiweb 

### Bug

[INJICERT-298](https://mosip.atlassian.net/browse/INJICERT-298) INJICERT- VC download is failing with signature alg \(ES256\) supported values mentioned in well-known response

[INJICERT-324](https://mosip.atlassian.net/browse/INJICERT-324) INJICERT- VC download is failing with credential type "LifeInsuranceCredential"

[INJICERT-327](https://mosip.atlassian.net/browse/INJICERT-327) INJICERT- Extra credential type is coming in VC response for insurance usecase

[INJICERT-544](https://mosip.atlassian.net/browse/INJICERT-544) Certify doesn't give the @context of the VC it's downloading

[INJICERT-903](https://mosip.atlassian.net/browse/INJICERT-903) aud in Access Token Uses containsAll Instead of contains

[INJICERT-1120](https://mosip.atlassian.net/browse/INJICERT-1120) INJICERT- When credential config APIs used to add new credential type, we need to still update signature in git properties

[INJICERT-1121](https://mosip.atlassian.net/browse/INJICERT-1121) INJICERT- 2.0 model VC is failing for data integrity proof, when context is added in template "https://w3id.org/security/data-integrity/v2"

[INJICERT-1124](https://mosip.atlassian.net/browse/INJICERT-1124) INJICERT- mosip.certify.statuslist.enabled value is taking true by default from code

[INJICERT-1128](https://mosip.atlassian.net/browse/INJICERT-1128) INJICERT- Landregistry pod is in crashloop in qa-inji1 env

[INJICERT-1133](https://mosip.atlassian.net/browse/INJICERT-1133) INJICERT- VC fetch is failing when mosip.certify.statuslist.enabled=true with error CREDENTIAL\_STATUS\_ASSIGNMENT\_FAILED

[INJICERT-1155](https://mosip.atlassian.net/browse/INJICERT-1155) INJICERT- Post DB scripts upgrade VC fetch is failing for existing credential types

[INJICERT-1156](https://mosip.atlassian.net/browse/INJICERT-1156) INJICERT- Blocker issue with docker setup from release branch

[INJICERT-1160](https://mosip.atlassian.net/browse/INJICERT-1160) INJICERT-VC download is failing for landregistry

[INJICERT-1178](https://mosip.atlassian.net/browse/INJICERT-1178) INJICERT- Testcases are failing with java.lang.NullPointerException error

### Task

[INJICERT-294](https://mosip.atlassian.net/browse/INJICERT-294) <Spike> Pre-Authorized Code Flow 

[INJICERT-484](https://mosip.atlassian.net/browse/INJICERT-484) <Spike> Revocation Mechanism

[INJICERT-643](https://mosip.atlassian.net/browse/INJICERT-643) Merge mock-ida-plugin into the certify-mock-plugin

[INJICERT-934](https://mosip.atlassian.net/browse/INJICERT-934) Add meta data to well-known

[INJICERT-995](https://mosip.atlassian.net/browse/INJICERT-995) <Spike> Enabling Validation while Adding new VC type for an issuer

[INJICERT-1007](https://mosip.atlassian.net/browse/INJICERT-1007) Improve Sonar Coverage to reach 80% or above

[INJICERT-1038](https://mosip.atlassian.net/browse/INJICERT-1038) <Spike> Support for Enabling SD-JWT W3C

[INJICERT-1095](https://mosip.atlassian.net/browse/INJICERT-1095) Making changes in the deployment process to configure well-known endpoint during the addition of VC type

### **Testing and Integration Note:**

For detailed setup instructions, refer to the [ReadMe](https://github.com/mosip/inji-certify/blob/v0.12.0/README.md) file.

1. **Setup:** Configure InjiWeb and Mimoto in your local environment with the latest Docker compose configurations.
2. **Issuer Configuration:** Add issuers in Mimoto with updated authorization_endpoint, credential_endpoint, and .well-known properties pointing to the upgraded eSignet and Certify services.
3. **SD-JWT Configuration:** Configure selective disclosure parameters for credentials that support privacy-preserving disclosure.
4. **Revocation Setup:** Enable and configure the revocation mechanism for credential lifecycle management.
5. **Migration:** Use the provided migration utility to upgrade from version 0.11.0 to 0.12.0 with automated configuration migration.
6. **Verification:** Test the configured issuers on InjiWeb homepage with support for both traditional and SD-JWT credential formats.

### **Repositories: Released/Dependent**

| **Repositories**              | **Tags: Released/Dependent**                                                      |
| ----------------------------- | --------------------------------------------------------------------------------- |
| **Inji Certify**              | [**v0.12.0**](https://github.com/mosip/inji-certify/tree/v0.12.0)                 |
| **inji-config**               | [**v0.3.0**](https://github.com/mosip/inji-config/tree/v0.3.0)                    |
| **Digital Credential Plugin** | [**v0.3.0**](https://github.com/mosip/digital-credential-plugins/tree/v0.3.0)     |
| **Artifactory Server**        | [**v0.12.0-INJI**](https://github.com/mosip/artifactory-ref-impl/tree/v0.12.0-INJI) |

### **Compatible Modules:**

The following table outlines the tested and certified compatibility of Inji Certify 0.12.0 with other modules.

| **Module**      | **Version**                                                                 |
| --------------- | --------------------------------------------------------------------------- |
| **eSignet**     | [**v1.5.0**](https://github.com/mosip/esignet/tree/v1.5.0)                  |
| **Sunbird RC**  | [**v2.1.0**](https://github.com/Sunbird-RC/sunbird-rc-core/tree/v2.1.0)     |
| **Key Manager** | [**v1.3.0**](https://github.com/mosip/keymanager/tree/v1.3.0)               |
| **Commons**     | [**v1.3.0**](https://github.com/mosip/commons/tree/v1.3.0)                  |

### **Known Issues**

Below is the list of known issues. To read in detail and view all topics related to Inji Certify, please click [**here**](https://mosip.atlassian.net/issues/?filter=11419&jql=project%20%3D%20%22Inji%20Certify%22%20AND%20issuetype%20%3D%20Bug%20%20AND%20labels%20not%20in%20\(API_Automation%2C%20AWSdevicefarm%2C%20device_specific%2C%20qa-inji-UI-auto\)%20%20%20%20ORDER%20BY%20created%20DESC%2C%20updated%20DESC%2C%20cf%5B10039%5D%20)**.**

| **Jira ID**                                                         | **Description**                                                                                                   |
| ------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| [**INJICERT-1180**](https://mosip.atlassian.net/browse/INJICERT-1180) | SD-JWT selective disclosure may require additional validation for complex credential structures                     |
| [**INJICERT-1181**](https://mosip.atlassian.net/browse/INJICERT-1181) | Revocation status list synchronization may experience delays in high-volume environments                         |
| [**INJICERT-1182**](https://mosip.atlassian.net/browse/INJICERT-1182) | Migration utility from 0.11.0 to 0.12.0 may require manual intervention for custom configurations               |

### **Bug Fixes**

Below is the list of fixes as part of the **0.12.0** release:

| **Jira ID**                                                         | **Description**                                                                                            |
| ------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| [**INJICERT-298**](https://mosip.atlassian.net/browse/INJICERT-298) | Fixed VC download failures with ES256 signature algorithm in well-known response                           |
| [**INJICERT-324**](https://mosip.atlassian.net/browse/INJICERT-324) | Resolved VC download issues with "LifeInsuranceCredential" credential type                                 |
| [**INJICERT-327**](https://mosip.atlassian.net/browse/INJICERT-327) | Fixed extra credential types appearing in VC response for insurance use cases                               |
| [**INJICERT-544**](https://mosip.atlassian.net/browse/INJICERT-544) | Added missing @context information in VC download responses                                                 |
| [**INJICERT-903**](https://mosip.atlassian.net/browse/INJICERT-903) | Corrected access token audience validation logic to use proper contains method                              |
| [**INJICERT-1120**](https://mosip.atlassian.net/browse/INJICERT-1120) | Fixed credential config API signature update requirements in git properties                                  |
| [**INJICERT-1121**](https://mosip.atlassian.net/browse/INJICERT-1121) | Resolved W3C VC 2.0 data integrity proof failures with security context                                   |
| [**INJICERT-1124**](https://mosip.atlassian.net/browse/INJICERT-1124) | Fixed default value handling for mosip.certify.statuslist.enabled configuration                            |
| [**INJICERT-1133**](https://mosip.atlassian.net/browse/INJICERT-1133) | Resolved CREDENTIAL_STATUS_ASSIGNMENT_FAILED errors when status list is enabled                            |
| [**INJICERT-1155**](https://mosip.atlassian.net/browse/INJICERT-1155) | Fixed VC fetch failures for existing credential types after database script upgrades                       |
| [**INJICERT-1156**](https://mosip.atlassian.net/browse/INJICERT-1156) | Resolved critical Docker setup issues from release branch                                                   |
| [**INJICERT-1178**](https://mosip.atlassian.net/browse/INJICERT-1178) | Fixed NullPointerException errors in test cases                                                             |

### **Conclusion:**

Inji Certify 0.12.0 marks a transformative milestone in verifiable credential technology, introducing industry-leading features such as Selective Disclosure JWT and comprehensive revocation mechanisms. This release demonstrates our commitment to privacy-preserving digital identity solutions while maintaining the highest standards of security and interoperability. With enhanced cryptographic support, streamlined credential management, and robust data integrity features, organizations can now leverage cutting-edge verifiable credential capabilities to meet evolving regulatory and business requirements.

The introduction of SD-JWT support positions Inji Certify at the forefront of privacy-preserving credential technology, enabling selective disclosure scenarios that are essential for modern digital identity use cases. Combined with the comprehensive revocation system and enhanced developer experience, this release empowers organizations to build scalable, secure, and user-centric digital identity solutions.

### **Documentation**

* [Feature Documentation](../../overview/features.md)
* [QA Report](test-report.md)
* [Local Setup](../../build-and-deploy/local-setup.md)
* [SD-JWT Implementation Guide](../../guides/sd-jwt-implementation.md)
* [Revocation System Guide](../../guides/revocation-system.md)
* [Migration Guide from 0.11.0 to 0.12.0](../../guides/migration-0-11-to-0-12.md)