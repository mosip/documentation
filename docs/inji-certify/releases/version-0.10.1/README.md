# Version 0.10.1

**Release Version**: v0.10.1

**Release Type**: Developer Release

**Release** **Date**: 3rd February, 2025

### **Overview**

Inji Certify continues to innovate by integrating new features that enhance the product's interoperability and adaptability, addressing the growing demand for verifiable credential (VC) issuance on digital platforms. This release introduces support for Data Model 2.0 and enables SVG rendering. Additionally, we've improved the deployment process, making it easier for users to configure and deploy Certify with various data sources

### **Major Highlights**

1. **Local deployment using docker compose**
   * Enabling local inji certify deployment via docker compose for easier setup and environment management with an externally deployed authentication setup like MOSIP's eSignet
2. **Support for VC 2.0 Data Model:**
   * Enabled Inji to generate credentials in the VC 2.0 format.
   * Introduced SVG templates for visually representing VC 2.0 credentials.
   * Implemented a VC Formatter to support formatting credentials in VC 1.1.
3. **Implementation of Data Provider Plugin**
   * Enabling inji certify to retreive data from different data sources using the data provider plugin. In this release the product support to interact with below 2 different data sources:
     1. Postgres
     2. CSV
4. **ED25519 (2018 & 2020) VC Signing**
   * Enhanced security with ED25519 Signature (2018 & 2020) signing.

### **Bug Fixes**

Below is the list of bug fixes as part of the **0.10.1** release:

| **Jira ID**                                                     | **Description**                                         |
| --------------------------------------------------------------- | ------------------------------------------------------- |
| [INJICERT-316](https://mosip.atlassian.net/browse/INJICERT-316) | Mock VC containing additional attribute with null value |

### **Known Issues**

Below is the list of known issues. To read in detail and view all the topics related to Inji Certify please click [**here**](https://mosip.atlassian.net/issues/INJICERT-852?filter=11419\&jql=project%20%3D%20%22Inji%20Certify%22%20AND%20issuetype%20%3D%20Bug%20%20AND%20labels%20not%20in%20%28API_Automation%2C%20AWSdevicefarm%2C%20device_specific%2C%20qa-inji-UI-auto%29%20%20and%20status%20NOT%20IN%20%28Closed%2C%20Fixed%2C%20Canceled%2CCancelled%29%20%20ORDER%20BY%20created%20DESC%2C%20updated%20DESC)

| **Jira ID**                                                     | **Description**                                                                        |
| --------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| [INJICERT-681](https://mosip.atlassian.net/browse/INJICERT-681) | Error messages are different in few scenarios                                          |
| [INJIWEB-1417](https://mosip.atlassian.net/browse/INJIWEB-1417) | Unable to download VC which is signed with RSA Signature 2018 or ED25519Signature 2018 |

### **Repository Released**

| Repositories               | Tags Released                                                                       |
| -------------------------- | ----------------------------------------------------------------------------------- |
|  inji-certify              | [ **v0.10.1**](https://github.com/mosip/inji-certify/tree/v0.10.1)                  |
| digital-credential-plugins | [**v0.10.0**](https://github.com/mosip/esignet-mock-services/tree/v0.10.0)          |
| artifactory                | [**v0.10.0-INJI**](https://github.com/mosip/digital-credential-plugins/tree/v0.3.0) |
| inji-config                | [**v0.5.0**](https://github.com/mosip/inji-config/tree/v0.5.0)                      |
| keymanager                 | [**v1.3.0-beta.2**](https://github.com/mosip/keymanager/tree/v1.3.0-beta.2)         |



### **Compatible Modules**

The following table outlines the tested and certified compatibility of \<release version> with other modules.

| Module               | Version(With tag links)                                                             |
| -------------------- | ----------------------------------------------------------------------------------- |
|  eSignet             |  [**v1.4.1**](https://github.com/mosip/esignet/tree/v1.4.1)                         |
| Sunbird C            | [**v2.0.0**](https://github.com/Sunbird-RC/sunbird-rc-core/releases/tag/v2.0.0-rc3) |
| Key Manager          | [**v1.3.0-beta.2**](https://github.com/mosip/keymanager/tree/v1.3.0-beta.2)         |
| commons              | [**v1.3.0-beta.1**](https://github.com/mosip/commons/tree/v1.3.0-beta.1)            |
| mock-identity-system | [**v0.10.0**](https://github.com/mosip/esignet-mock-services/tree/v0.10.0)          |



### Documentation:

* [Feature Documentation](https://docs.inji.io/inji-certify/functional-overview/features)
* [Integration Guide](https://docs.inji.io/inji-certify/build-and-deploy/local-setup)
* [QA Report](https://docs.inji.io/inji-verify/releases/version-0.10.1/test-report)
