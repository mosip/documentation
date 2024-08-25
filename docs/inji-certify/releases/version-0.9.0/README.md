# Version 0.9.0

**Release Name:** Inji Certify 0.9.0

**Support:** Developer Release

**Release Date:** 22nd August, 2024

### **Overview**

Inji Certify continues to innovate in the realm of verifiable credentials (VCs) with the release of **version 0.9.0.** This update introduces significant enhancements, improving the platform's flexibility, scalability, and ease of use. Designed to empower organizations to issue and manage VCs securely, Inji Certify 0.9.0 further strengthens its integration capabilities. With these new features, users can expect a more streamlined experience in credential issuance and management, ensuring compliance with industry standards while offering robust data control. Support for various plugins and microservices, allowing organizations to tailor the platform to their specific needs and existing systems.

#### **New Features in Version 0.9.0:**

1. **Enhanced Verifiable Credential Issuance:**
   * **National Identity Plugin:** Integration with MOSIP for identity verification, enabling secure and reliable credential issuance.
   * **Insurance Plugin:** Seamless integration with Sunbird services to facilitate the issuance and management of VCs.
   * **Mock IDA Plugin:** Introduced for testing and development purposes, providing a controlled environment to simulate credential issuance.
2. **Segregation of eSignet VCI Component:**
   * The eSignet VCI component is now separated from eSignet services and migrated to the core Inji Certify system, optimizing functionality and scalability, and allowing for more modular deployments.
3. **Support for VC Formats:**
   * **JSON-LD Compliance:** Ensures adherence to W3C VC v1.1 standards promoting interoperability and industry compliance.
   * **Credential Schema Configuration:** Issuers can now configure custom credential schemas for various types of certificates, enhancing flexibility in credential design and issuance.
4. **Ease of Installation and Deployment:**
   * **Docker-compose Support:** Quick and easy deployment using Docker-compose, allowing for rapid local setup and scaling. Click [**here**](https://github.com/mosip/inji-certify/tree/v0.9.0/docker-compose) to learn more**!**
5. **Inji-config Repository:**
   * **Configuration Management:** Introduction of the inji-config repository to maintain all configurations related to the Inji Certify, streamlining configuration management and consistency across deployments.
6. **Support for Mock and Insurance Credential Use Cases:**
   * **Mock Credential Use Case:** Provides a predefined setup for mock credentials, useful for testing and development.
   * **Insurance Credential Use Case:** A specialized setup for issuing insurance-related credentials, offering a targeted solution for the insurance sector.

### **Testing and Integration Note:**

For detailed steps click here to view the [**ReadMe**](https://github.com/mosip/inji-certify/blob/v0.9.0/README.md) file.

1. **Setup:** Configure InjiWeb and Mimoto in your local environment.
2. **Issuer Configuration:** Add an issuer in Mimoto with the authorization\_endpoint, credential\_endpoint and .well-known properties pointing to the installed eSignet and Certify services.
3. **Private Key Addition:** Insert the private key from the OIDC client created in eSignet into the .p12 file in Mimoto.
4. **Verification:** The configured issuer should now appear on the InjiWeb homepage, allowing you to download the credential.
5. **Plugin Compatibility:** For this release, ensure that the eSignet image version in Docker Compose (currently 1.4.0) is consistent with the Mock plugin dependencies in Artifactory. This alignment is crucial due to shared Redis cache dependencies resolving serialization issues.

### **Repositories: Released/Dependent**

| **Repositories**              | **Tags: Released/Dependent**                                                      |
| ----------------------------- | --------------------------------------------------------------------------------- |
| **Inji Certify**              | [**v0.9.0**](https://github.com/mosip/inji-certify/tree/v0.9.0)                   |
| **inji-config**               | [**v0.2.0**](https://github.com/mosip/inji-config/tree/v0.2.0)                    |
| **Digital Credential Plugin** | [**v0.2.0**](https://github.com/mosip/digital-credential-plugins/tree/v0.2.0)     |
| **Artifactory Server**        | [**v0.9.0-INJI**](https://github.com/mosip/artifactory-ref-impl/tree/v0.9.0-INJI) |

### **Compatible Modules:**

The following table outlines the tested and certified compatibility of Inji Certify 0.9.0 with other modules.

| **Module**      | **Version**                                                                 |
| --------------- | --------------------------------------------------------------------------- |
| **eSignet**     | [**v1.4.0**](https://github.com/mosip/esignet/tree/v1.4.0)                  |
| **Sunbird C**   | [**v2.0.0**](https://github.com/Sunbird-RC/sunbird-rc-core/tree/v2.0.0)     |
| **Key Manager** | [**v1.3.0-beta.1**](https://github.com/mosip/keymanager/tree/v1.3.0-beta.1) |
| **Commons**     | [**v1.3.0-beta.1**](https://github.com/mosip/commons/tree/v1.3.0-beta.1)    |

### **Known Issues**

Below is the list of known issues. To read in detail and view all the topics related to Inji Verify please click [**here**](https://mosip.atlassian.net/issues/?filter=11419\&jql=project%20%3D%20%22Inji%20Certify%22%20AND%20issuetype%20%3D%20Bug%20%20AND%20labels%20not%20in%20\(API\_Automation%2C%20AWSdevicefarm%2C%20device\_specific%2C%20qa-inji-UI-auto\)%20%20%20%20ORDER%20BY%20created%20DESC%2C%20updated%20DESC%2C%20cf%5B10039%5D%20)**.**

| **Jira ID**                                                         | **Description**                                                                                                   |
| ------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| [**INJICERT-236**](https://mosip.atlassian.net/browse/INJICERT-236) | Getting response for well known endpoint when random value is specified in version query param                    |
| [**INJICERT-298**](https://mosip.atlassian.net/browse/INJICERT-298) | Inji Certify: VC download is failing with signature alg (ES256) supported values mentioned in well-known response |
| [**INJICERT-316**](https://mosip.atlassian.net/browse/INJICERT-316) | Inji Certify: Response of Mock VC is having extra attribute with null value                                       |
| [**INJICERT-324**](https://mosip.atlassian.net/browse/INJICERT-324) | Inji Certify: VC download is failing with credential type "LifeInsuranceCredential"                               |
| [**INJICERT-327**](https://mosip.atlassian.net/browse/INJICERT-327) | Inji Certify: Extra credential type is coming in VC response for insurance usecase                                |
| [**INJICERT-328**](https://mosip.atlassian.net/browse/INJICERT-328) | Inji Certify : Not able to download VC with few of the registries from InjiWeb, certify issuer                    |

### **Bug Fixes**

Below is the list of fixes as part of the **0.9.0** release:

| **Jira ID**                                                         | **Description**                                                                                            |
| ------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| [**INJICERT-314**](https://mosip.atlassian.net/browse/INJICERT-314) | Inji Certify: /authorization/v2/oauth-details API is failing with error ""invalid\_client\_id"             |
| [**INJICERT-312**](https://mosip.atlassian.net/browse/INJICERT-312) | Inji Certify: VC verification is failing for insurance VC                                                  |
| [**INJICERT-274**](https://mosip.atlassian.net/browse/INJICERT-274) | Inji Certify: Fetching of credential list from issuer " National Identity Department (Certify)" is failing |
| [**INJICERT-277**](https://mosip.atlassian.net/browse/INJICERT-277) | Inji Certify: VC download is failing from certify with error "Unable to connect to Redis"                  |

### **Conclusion:**

Inji Certify 0.9.0 represents a significant milestone in the evolution of the module offering users enhanced capabilities for issuing, managing, and integrating verifiable credentials. With a focus on scalability, interoperability, and ease of use, this release empowers organizations to leverage the full potential of VCs securely and efficiently.

### **Documentation**

* [Feature Documentation](../../functional-overview/features.md)
* [QA Report](test-report.md)
* [Local Setup](../../build-and-deploy/local-setup.md)
