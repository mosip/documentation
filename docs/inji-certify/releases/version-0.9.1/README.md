# Version 0.9.1

**Release Name:** Inji Certify 0.9.1 (Patch)

**Support:** Developer Release

**Release Date:** 3rd October, 2024

### **Overview**

This patch release 0.9.1 for Inji Certify focuses on upgrading critical components to ensure compatibility and enhanced performance across various plugins. The primary updates include upgrading the eSignet version to 1.4.1, the OIDC-UI pod version to 1.4.1, and now certify plugins are available as **0.2.1-SNAPSHOT**. Additionally, the release introduces changes to the Artifactory configuration, ensuring seamless integration of Certify plugins for continued reliability.

#### **Changes and Upgrades:**

1. **eSignet Version Upgrade:**
   * The eSignet version has been upgraded to **1.4.1** for compatibility with different Certify plugins.
2. **OIDC-UI Pod Version Bump:**
   * The OIDC-UI pod version has been upgraded to **1.4.1**.
3. **Artifactory Changes:**
   * The Artifactory being pointed to by the config map now comes from the **Artifactory-ref-impl** branch.
   * This will ensure the correct dependency versions of the Artifactory.
   * The updated Certify plugins are now available as **0.2.1-SNAPSHOT** versions.

### **Testing and Integration Note:**

For detailed steps click here to view the [**ReadMe**](https://github.com/mosip/inji-certify/tree/v0.9.1?tab=readme-ov-file) file.

1. **Setup:** Configure InjiWeb and Mimoto in your local environment.
2. **Issuer Configuration:** Add an issuer in Mimoto with the authorization\_endpoint, credential\_endpoint, and .well-known properties pointing to the installed eSignet and Certify services.
3. **Private Key Addition:** Insert the private key from the OIDC client created in eSignet into the .p12 file in Mimoto.
4. **Verification:** The configured issuer should now appear on the InjiWeb homepage, allowing you to download the credential.
5. **Plugin Compatibility:** For this release, ensure that the eSignet image version in Docker Compose (currently 1.4.1) is consistent with the Mock plugin dependencies in Artifactory. This alignment is crucial due to shared Redis cache dependencies resolving serialization issues.

### **Repositories: Released/Dependent**

| Repositories                  | Tags: Released/Dependent                                                          |
| ----------------------------- | --------------------------------------------------------------------------------- |
| **Inji Certify**              | [**v0.9.1**](https://github.com/mosip/inji-certify/tree/v0.9.1)                   |
| **inji-config**               | [**v0.2.0**](https://github.com/mosip/inji-config/tree/v0.2.0)                    |
| **Digital Credential Plugin** | [**v0.2.1**](https://github.com/mosip/digital-credential-plugins/tree/v0.2.1)     |
| **Artifactory Server**        | [**v0.9.1-INJI**](https://github.com/mosip/artifactory-ref-impl/tree/v0.9.1-INJI) |

### **Compatible modules:**

The following table outlines the tested and certified compatibility of Inji Certify 0.9.0 with other modules.

| Module          | Version                                                                             |
| --------------- | ----------------------------------------------------------------------------------- |
| **eSignet**     | [**v1.4.1**](https://github.com/mosip/esignet/tree/v1.4.1)                          |
| **Sunbird C**   | [**v2.0.0**](https://github.com/Sunbird-RC/sunbird-rc-core/releases/tag/v2.0.0-rc3) |
| **Key Manager** | [**v1.3.0-B1**](https://github.com/mosip/keymanager/tree/v1.3.0-beta.1)             |
| **Commons**     | [**v1.3.0-B1**](https://github.com/mosip/commons/tree/v1.3.0-beta.1)                |

### **Known Issues**

Below is the list of known issues. To read in detail and view all the topics related to Inji Certify please click [here](https://mosip.atlassian.net/issues/?filter=11419\&jql=project%20%3D%20%22Inji%20Certify%22%20AND%20issuetype%20%3D%20Bug%20%20AND%20labels%20not%20in%20\(API\_Automation%2C%20AWSdevicefarm%2C%20device\_specific%2C%20qa-inji-UI-auto\)%20%20%20%20ORDER%20BY%20created%20DESC%2C%20updated%20DESC%2C%20cf%5B10039%5D%20)**.**

| Jira ID                                                             | Description                                                                                                                                  |
| ------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| [**INJICERT-468**](https://mosip.atlassian.net/browse/INJICERT-468) | Inji Certify: Mosipid VC download from injiweb is missing a few attributes, though VC JSON has the same                                      |
| [**INJICERT-467**](https://mosip.atlassian.net/browse/INJICERT-467) | Inji Certify : API /authorization/authenticate is throwing an error as HV000028: Unexpected exception during isValid call in the local setup |
| [**INJICERT-236**](https://mosip.atlassian.net/browse/INJICERT-236) | Inji Certify : Getting response for well known endpoint when random value is specified in version query param                                |
| [**INJICERT-298**](https://mosip.atlassian.net/browse/INJICERT-298) | Inji Certify : VC download is failing with signature alg (ES256) supported values mentioned in well-known response                           |
| [**INJICERT-316**](https://mosip.atlassian.net/browse/INJICERT-316) | Inji Certify : Response of Mock VC is having extra attribute with null value                                                                 |
| [**INJICERT-324**](https://mosip.atlassian.net/browse/INJICERT-324) | Inji Certify : VC download is failing with credential type "LifeInsuranceCredential"                                                         |
| [**INJICERT-327**](https://mosip.atlassian.net/browse/INJICERT-327) | Inji Certify :Extra credential type is coming in VC response for insurance usecase                                                           |
| [**INJICERT-328**](https://mosip.atlassian.net/browse/INJICERT-328) | Inji Certify : Not able to download VC with few of the registries from InjiWeb, certify issuer                                               |

### **Documentation**

* [Feature Documentation](https://docs.mosip.io/inji/inji-certify/functional-overview/features)
* [QA Report](test-report.md)
* [Local Setup](https://docs.mosip.io/inji/inji-certify/build-and-deploy/local-setup)
* [API Documentation](https://mosip.stoplight.io/docs/inji-certify/25f435617408e-inji-certify)
