# v1.4.1

**Release Number:** v.1.4.1&#x20;

**Release Date**: 15th July, 2024

### Overview

This release focuses on incorporating features related to VC issuance plug-in pertaining to Sunbird RC, enhancing configuration capabilities for Knowledge-Based Identification (KBI), and addressing critical known issues from our previous releases.

**1. Features included**

a. [VC Issuance plugin implementation for Sunbird RC.](../../overview/features/#vc-issuance-plugin-implementation-for-sunbird-rc)

b. [Authenticator plugin implementation for KBI with Sunbird RC.](../../overview/features/#authenticator-plugin-implementation-for-kbi-sunbird-rc)

c. [Changes in eSignet UI to support KBI.](../../overview/features/#changes-in-esignet-ui-to-support-kbi)

**2. Fixes for known issues from v1.4.0**

a. Enhanced input field validations with regex implementation.

b. Enhanced and user friendly error messages.

**3. Fixes for known issues from v1.3.0**

a. Critical & major bug fixes related to eSignet service.

b. Critical & major bug fixes related to the eSignet Signup service.

Please refer to [this link](https://mosip.atlassian.net/jira/software/c/projects/ES/issues/?jql=%22Release%20Number%5BLabels%5D%22%20in%20\(esignet\_v1.4.1\)%20and%20issuetype%3DBug) for the list of all bugs addressed as part of this release.

**Known Issues**

* Key Known Issue:&#x20;

| Jira Issue                                          | Issue Description                                                                                      |
| --------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| [ES-903](https://mosip.atlassian.net/browse/ES-903) | Intermittent issue faced in Biometric Login when used in certain organization/domain specific laptops. |

Please refer to [this link](https://mosip.atlassian.net/jira/software/c/projects/ES/issues/?jql=labels%20%3D%20known-issue-eSignet-v1.4.1) for the list of all known issues.

**Repositories Released**

| Repository Released   | Tags                                                                             |
| --------------------- | -------------------------------------------------------------------------------- |
| eSignet               | [v1.4.1](https://github.com/mosip/esignet/tree/release-1.4.x)                    |
| mosip-config          | [v1.4.1-ES](https://github.com/mosip/mosip-config/tree/release-1.4.1-ES)         |
| esignet-mock-services | [v0.9.3](https://github.com/mosip/esignet-mock-services/tree/release-0.9.x)      |
| mosip-ref-impl/kernel | [v1.2.0.2](https://github.com/mosip/mosip-ref-impl/tree/release-1.2.0.x/kernel)  |
| artifactory-ref-impl  | [v1.4.1-ES](https://github.com/mosip/artifactory-ref-impl/tree/release-1.4.1-ES) |
| eSignet Signup        | [v1.0.2](https://github.com/mosip/esignet-signup/tree/release-1.0.x)             |

For details on deployment, refer to the [helm charts](https://github.com/mosip/esignet/tree/v1.4.1/helm) in the eSignet repository.

### Documentation

* [Feature Documentation](https://docs.esignet.io/overview/features#knowledge-based-authentication)
* [Integration Guides](https://docs.esignet.io/integration)
* [End User Guide](https://docs.esignet.io/end-user-guide)
* [API Documentation](https://github.com/mosip/esignet/blob/v1.4.0/docs/esignet-openapi.yaml)
* [QA Report ](https://docs.esignet.io/versions/v1.4.1/test-report)
