# v1.5.0

**Release Name**: v.1.5.0

**Release Date**: 23rd Jan, 2025

### **Overview**

We are excited to announce the release of eSignet v1.5.0, featuring the key implementation of Identity Assurance 1.0 (Draft). This open standard enhances eSignet’s ability to verify and authenticate identities more assuredly, laying the foundation for the newly supported video-based eKYC verification plugin. In addition to this core feature, the release includes security fixes and several architectural updates to streamline workflows and enhance the overall user and developer experience.

### **Features**&#x20;

1. [**Identity Assurance Implementation**](broken-reference)
   * Implemented Identity Assurance 1.0 (Draft), aligning with open standards for higher identity verification assurance, laying the foundation for video eKYC support.&#x20;
2. [**Signup and Login with OTP for Verified Claims**](broken-reference)
   * Added video eKYC via WebSocket in the signup portal, enabling secure, real-time video verification during registration.
3. [**Well-Informed Claim Details**](broken-reference)
   * Users now receive clear consent requests before starting eKYC, ensuring transparency on data usage.
4. **Clickable QR Code for INJI Wallet Login**
   * A clickable QR code now appears for INJI Wallet login, with an embedded deeplink for seamless access within the same device.

### Major Highlights

1. [**Local Deployment with Docker-Compose**](../../../build-and-deploy/local-deployment/)
   * Removed artifactory and config Server dependencies, enabling local eSignet deployment via docker-compose for easier setup and environment management.&#x20;
2. [**eSignet-Plugins Repository Updates**](https://github.com/mosip/esignet-plugins/tree/develop)
   * eSignet-plugins repository for better compatibility and functionality.
3. [**Captcha Validation Improvements**](https://github.com/mosip/captcha)
   * Enhanced captcha validation for improved security and fewer vulnerabilities.
4. [**VC Issuance migration to Inji Certify**](https://docs.mosip.io/inji/inji-certify/overview)
   * eSignet no longer supports VC issuance. This functionality was supported up to eSignet v1.4.2. INJI Certify now handles VC issuance. The documentation has been updated to reflect this change.

{% hint style="info" %}
**Note:** The Identity Assurance feature has been added in the eSignet 1.5.0 release, and is currently supported only with the mock identity system.
{% endhint %}

### **Security Enhancements**

* Security issues have been addressed to enhance platform security and speed. For a complete list of fixed bugs, please refer to this [link](https://mosip.atlassian.net/issues/MOSIP-35595?filter=-4\&jql=labels%20IN%20%28Security%2Csecurity_related%29%20and%20status%20IN%20%28Fixed%2CClosed%2CDocumentation%29%20AND%20%22Release%20Number%5BLabels%5D%22%20%3D%20esignet_v1.5.0).

### **Bug Fixes**

* Several known issues from v1.4.1 have been resolved to improve platform stability. A detailed list of fixes is available [here](https://mosip.atlassian.net/issues/ES-1216?filter=11684\&jql=labels%20%3D%20known-issue\[%E2%80%A6]0IN%20%28Closed%29%20and%20project%20NOT%20IN%20%28MOSIP%29).

We believe this release will greatly improve eSignet's security, efficiency, and user experience. Thank you for your continued support!

### **Key Known Issues**

| Jira Issue                                            | Issue Description                                                                                                                  |
| ----------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| [ES-1992](https://mosip.atlassian.net/browse/ES-1992) | OAuth Details API is initiating the transaction despite a mismatch between the aud claim in the provided ID token and the clientId |
| [ES-1986](https://mosip.atlassian.net/browse/ES-1986) | IDT based authentication is successful on using reused challenge.                                                                  |
| [ES-1981](https://mosip.atlassian.net/browse/ES-1981) | The system is not checking for an available slot every “6” seconds, for a max of “10” time while the loading screen is displaying  |
| [ES-1977](https://mosip.atlassian.net/browse/ES-1977) | Individual ID is not validated with IDT auth factor                                                                                |

Please refer to [this link](https://mosip.atlassian.net/issues/?filter=11689) for the list of all known issues.

### **Repositories Released**

| Repository Released   | Tags                                                                           |
| --------------------- | ------------------------------------------------------------------------------ |
| esignet               | [ v1.5.0](https://github.com/mosip/esignet/tree/v1.5.0)                        |
| esignet-signup        | [ v1.1.0](https://github.com/mosip/esignet-signup/tree/v1.1.0)                 |
| esignet-mock-services |  [v0.10.0](https://github.com/mosip/esignet-mock-services/tree/v0.10.0)        |
| esignet-plugins       |  [v1.3.0](https://github.com/mosip/esignet-plugins/tree/v1.3.0)                |
| mosip-onboarding      | [ v1.3.0-beta.1](https://github.com/mosip/mosip-onboarding/tree/v1.3.0-beta.1) |

### **Compatible Modules**

| Module/Repository | Compatible Version |
| ----------------- | ------------------ |
| IDA               | 1.2.1.0            |
| ID Repository     | 1.2.1.0            |
| Kernel            | 1.2.0.1            |
| Sunbird           | v2.0.0-rc3         |

### **Documentation**

1. [API Documentation](https://mosip.stoplight.io/docs/identity-provider/branches/1.5.0/7oz4lmhu3pf6b-e-signet)
2. [Integration Guides](../../../esignet-authentication/develop/integration/relying-party/development-and-integration-with-esignet.md)
3. [End User Guide](../../../esignet-authentication/test/end-user-guide/README.md)
4. [QA Report](test-report.md)
