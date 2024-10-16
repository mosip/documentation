# Version 0.10.0

**Release Name:** Inji Web 0.10.0

**Support:** Developer

**Release Date:** 16th October, 2024

### Overview

We are pleased to announce the release of Inji Web Version 0.10.0! This release introduces exciting new features, including the effortless sharing of Verifiable Credentials via a QR code embedded directly within the credential PDF, making sharing smoother than ever! This feature empowers users to quickly share their credentials with service providers, ensuring a seamless and secure verification process in online mode.

#### **Key highlights include:**

* **Online Sharing Feature**: Introducing seamless online sharing of Verifiable Credentials through integration with Data Share and Inji Verify modules, ensuring quick and secure sharing between users and verifiers.
* **Compliance with OpenID4VCI Draft 13**: Full support for the Draft 13 changes of the OpenID4VCI specification, aligning Inji Web with the latest standards for Verifiable Credentials.
* **Integration with Certify & eSignet**: Streamlined credential issuance through Inji Certify and eSignet authentication, enabling smoother, secure interactions with trusted credential issuers.

#### **Features Covered:**

Below are the key features as part of this release:

* **Online Sharing**:\
  Verifiable Credentials can now be easily shared online using the QR Code on the credential PDF. This feature is dependent on integrations with the Data Share and Inji Verify modules, ensuring a secure and convenient mechanism for sharing credentials.
* **Draft 13 Changes for OpenID4VCI**:\
  Inji Web now adheres to the latest Draft 13 of the OpenID4VCI spec, making it fully compatible with the most recent standards in credential issuance and verification.
* **Integration with Certify and eSignet**:
  * **Authentication**: eSignet is integrated for user authentication, providing a robust and secure method to authenticate and authorize users in compliance with OpenID4VCI.
  * **Credential Issuance**: Inji Certify is responsible for issuing credentials by the new standards, ensuring a smooth issuance process after successful authentication.

### **Repositories Released:**

| **Repositories**    | **Tags Released**                                                                    |
| ------------------- | ------------------------------------------------------------------------------------ |
| inji-web            | [**v0.10.0**](https://github.com/mosip/inji-web/tree/v0.10.0)                        |
| mimoto              | [**v0.14.0**](https://github.com/mosip/mimoto/tree/v0.14.0)                          |
| inji-config         | [**v0.3.0**](https://github.com/mosip/inji-config/tree/v0.3.0)                       |
| durian(data share)  | [**v1.3.0-beta.1**](https://github.com/mosip/durian/tree/v1.3.0-beta.1)              |
| mosip-openid-bridge | [**v1.3.0-beta.1**](https://github.com/mosip/mosip-openid-bridge/tree/v1.3.0-beta.1) |
| khazana             | [**v1.3.0-beta.1**](https://github.com/mosip/khazana/tree/v1.3.0-beta.1)             |
| bio-utils           | [**v1.3.0-beta.1**](https://github.com/mosip/bio-utils/tree/v1.3.0-beta.1)           |

### **Compatible Modules:**

The following table outlines the tested and certified compatibility of Inji Web 0.10.0 with other modules.

| **Module**   | **Version**                                                     |
| ------------ | --------------------------------------------------------------- |
| eSignet      | [**1.4.1**](https://github.com/mosip/esignet/tree/v1.4.1)       |
| Inji Verify  | [**0.10.0**](https://github.com/mosip/inji-verify/tree/v0.10.0) |
| Inji Certify | [**0.9.1**](https://github.com/mosip/inji-certify/tree/v0.9.1)  |



### **Bugs/Security Fixes**

#### **Known Open Bugs**

Below is the list of **known** issues. To read in detail click [**here**](https://mosip.atlassian.net/issues/?jql=project%3D%22Inji%20Web%22%20and%20type%20in%20%28bug%29%20and%20status%20not%20in%20%28closed%2C%20canceled%29%20order%20by%20created%20DESC)**.**

| **Jira ID**                                                       | **Description**                                                                                                                                 |
| ----------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| [**INJIWEB-627**](https://mosip.atlassian.net/issues/INJIWEB-627) | Inji Verify: Getting "No MultiFormat Readers were able to detect the QR code." error when the VC PDF from the inji web application is uploaded. |
| [**INJIWEB-599**](https://mosip.atlassian.net/browse/INJIWEB-599) | Inji-web: Getting invalid credentials error message for valid data, when we leave the authentication page idle for sometime                     |
| [**INJIWEB-594**](https://mosip.atlassian.net/browse/INJIWEB-594) | Injiweb: If the browser zoom-in increases then the some of options are not visible                                                              |
| [**INJIWEB-593**](https://mosip.atlassian.net/browse/INJIWEB-593) | INJIWEB: After navigating to the Issuer type page, the close/back button is missing in the eSignet page                                         |
| [**INJIWEB-590**](https://mosip.atlassian.net/browse/INJIWEB-590) | Injiweb: credential strings are not properly displayed for different dimensions under mosip issuer                                              |
| [**INJIWEB-570**](https://mosip.atlassian.net/browse/INJIWEB-570) | Inji-web: If the filed values are not provided during policy creation, in downloaded VC getting expressions directly                            |
| [**INJIWEB-568**](https://mosip.atlassian.net/browse/INJIWEB-568) | Inji-web: Observed access violation when "IBM Equal Access Accessibility Checker" executed on inji-web portal                                   |
| [**INJIWEB-290**](https://mosip.atlassian.net/browse/INJIWEB-290) | Inji-web: The QR code is not working on the VC card                                                                                             |
| [**INJIWEB-180**](https://mosip.atlassian.net/browse/INJIWEB-180) | Inji-web: Not getting proper error message when the website is down                                                                             |

### Documentation

* [Feature documentation](../../functional-overview/features.md)
* [User guide](../../functional-overview/end-user-guide.md)
* [QA Report](test-report.md)
* [API Documentation](https://docs.mosip.io/inji/inji-web/technical-overview/backend-services/mimoto-bff)

