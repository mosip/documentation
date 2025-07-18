# v1.4.1

**Release Number:** v.1.4.1&#x20;

**Release Date**: 15th July, 2024

### Overview

This release introduces new features centered on Verifiable Credentials (VC) issuance plugins related to Sunbird RC, enhances configuration capabilities for Knowledge-Based Identification (KBI), and addresses critical known issues from previous versions.

### Features

**1. Features included**

We have developed two new plugins to support the issuance of verifiable credentials (VC) by authenticating users through Knowledge-Based Identification (KBI) using the Authenticator plugin. These enhancements are detailed below:

a. [Authenticator plugin implementation for KBI with Sunbird RC.](broken-reference)

* Implementation of the Authenticator plugin to enable Knowledge-Based Identification (KBI) within Sunbird RC.

b. [VC Issuance plugin implementation for Sunbird RC.](broken-reference)

* Implementation of the VC Issuance plugin to facilitate the issuance of verifiable credentials within Sunbird RC.

c. [eSignet UI to support KBI form configuration](broken-reference).

* eSignet UI now supports KBI form configuration, making it easier to set up and manage KBI-based identification.

For more information on KBI, please refer to the [KBI documentation](../../../esignet-authentication/test/end-user-guide/health-portal/knowledge-based-authentication.md)

{% hint style="info" %}
**Note:** The newly developed plugins are independent and can be adapted to various use cases that utilize Knowledge-Based Identification. An example use case like Insurance Card VC Issuance demonstrates how a user can be issued a verifiable credential using the [Sunbird RC](https://github.com/mosip/digital-credential-plugins/blob/master/sunbird-rc-esignet-integration-impl/README.md) registry configured with KBI.
{% endhint %}

### Bug Fixes <a href="#bug-fixes" id="bug-fixes"></a>

#### Fixes from v1.4.0: <a href="#fixes-from-v1.4.0" id="fixes-from-v1.4.0"></a>

* **Improved Input Field Validations**: Enhanced input field validations using regex implementation.
* **User-Friendly Error Messages**: Improved error messages for better user experience.

#### Fixes from v1.3.0: <a href="#fixes-from-v1.3.0" id="fixes-from-v1.3.0"></a>

* **eSignet Service Fixes**: Critical and major bug fixes related to the eSignet service.
* **eSignet Signup Service Fixes**: Critical and major bug fixes related to the eSignet Signup service.

For a complete list of all bugs addressed in this release, please refer to the [bug fixes list](https://mosip.atlassian.net/jira/software/c/projects/ES/issues/?jql=%22Release%20Number%5BLabels%5D%22%20in%20\(esignet_v1.4.1\)%20and%20issuetype%3DBug).

### **Known Issues**

* Key Known Issue:&#x20;

| Jira Issue                                          | Issue Description                                                                                      |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| [ES-903](https://mosip.atlassian.net/browse/ES-903) | Intermittent issue faced in Biometric Login when used in certain organization/domain specific laptops. |

Please refer to [this link](https://mosip.atlassian.net/jira/software/c/projects/ES/issues/?jql=labels%20%3D%20known-issue-eSignet-v1.4.1) for the list of all known issues.

### **Repositories Released**

| Repository Released        | Tags                                                                             |
| -------------------------- | -------------------------------------------------------------------------------- |
| eSignet                    | [v1.4.1](https://github.com/mosip/esignet/tree/v1.4.1)                           |
| mosip-config               | [v1.4.1-ES](https://github.com/mosip/mosip-config/tree/release-1.4.1-ES)         |
| esignet-mock-services      | [v0.9.3](https://github.com/mosip/esignet-mock-services/tree/release-0.9.x)      |
| mosip-ref-impl/kernel      | [v1.2.0.2](https://github.com/mosip/mosip-ref-impl/tree/release-1.2.0.x/kernel)  |
| artifactory-ref-impl       | [v1.4.1-ES](https://github.com/mosip/artifactory-ref-impl/tree/release-1.4.1-ES) |
| eSignet Signup             | [v1.0.2](https://github.com/mosip/esignet-signup/tree/release-1.0.x)             |
| digital-credential-plugins | [v0.1.0](https://github.com/mosip/digital-credential-plugins)                    |

{% hint style="info" %}
**Note:** digital-credential-plugins was released as part of v1.4.0, and is compliant with v1.4.1.
{% endhint %}

For details on deployment, refer to the [helm charts](https://github.com/mosip/esignet/tree/v1.4.1/helm) in the eSignet repository.

### Documentation

* [Feature Documentation](../../../esignet-authentication/features.md)
* [Integration Guides](../../../esignet-authentication/develop/integration/relying-party/development-and-integration-with-esignet.md)
* [End User Guide](../../../esignet-authentication/test/end-user-guide/README.md)
* [API Documentation](https://github.com/mosip/esignet/blob/v1.4.0/docs/esignet-openapi.yaml)
* [QA Report ](../v1.4.1/test-report.md)