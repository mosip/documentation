# v1.7.1

**Release Number:** v1.7.1 (Patch)

**Release Date:** Coming Soon

### **Overview** <a href="#overview" id="overview"></a>

We are pleased to announce the release of [eSignet v1.7.1](https://github.com/mosip/esignet/tree/v1.7.1), a patch release focused exclusively on addressing critical functional issues identified in earlier versions.\
This release improves stability and correctness across UI schema handling, KBI authentication flows, and deployment-related assets, ensuring a smoother and more reliable experience for integrators and deployers.

### **Major Highlights** <a href="#major-highlights" id="major-highlights"></a>

#### **Critical Bug Fixes** <a href="#critical-bug-fixes" id="critical-bug-fixes"></a>

* Fixed an issue in the UI schema where the email field was treated as mandatory even when configured as optional.
* Resolved a problem where KBI login in mock services failed when CAPTCHA was enabled.
* Addressed multiple issues related to deployment documentation, improving accuracy and clarity.
* Fixed issues in partner onboarding scripts to ensure smoother setup and execution.

### **Bug Fixes** <a href="#bug-fixes" id="bug-fixes"></a>

Several known issues from the previous release have been addressed to improve platform stability and performance.

Please refer to the [link here](https://mosip.atlassian.net/issues?jql=%22Release%20Number%5BLabels%5D%22%20%3D%20eSignet_v1.7.1\&selectedIssue=MOSIP-43960) for the complete list of resolved issues.

| Jira ID                                                       | Summary                                                                                                                                         |
| ------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| [MOSIP-43960](https://mosip.atlassian.net/browse/MOSIP-43960) | Partner onboarder issue in esignet-signup                                                                                                       |
| [MOSIP-43958](https://mosip.atlassian.net/browse/MOSIP-43958) | Issue in partner onboarder esignet .                                                                                                            |
| [MOSIP-43957](https://mosip.atlassian.net/browse/MOSIP-43957) | Update keycloak init scripts in esignet-signup                                                                                                  |
| [MOSIP-43956](https://mosip.atlassian.net/browse/MOSIP-43956) | Update readme for partner-onboarding/esignet                                                                                                    |
| [ES-2738](https://mosip.atlassian.net/browse/ES-2738)         | Deployment : esignet readme does not contain delete steps Please Mention delete steps in readme                                                 |
| [ES-2737](https://mosip.atlassian.net/browse/ES-2737)         | Deployment : softhsm for esignet is getting deployed in esignet ns but in the delete-all.sh its searching for softhsm which needs to be updated |
| [ES-2725](https://mosip.atlassian.net/browse/ES-2725)         | eSignet- mosipid: “Unsupported language” error displayed on Forgot Password page when using Khmer language                                      |
| [ES-2719](https://mosip.atlassian.net/browse/ES-2719)         | Fix content for wallet\_header on WLA login page                                                                                                |
| [ES-2716](https://mosip.atlassian.net/browse/ES-2716)         | In Ui schema when email is marked as optional field by default its taking as mandatory field                                                    |
| [ES-2710](https://mosip.atlassian.net/browse/ES-2710)         | Inji logo is not updated in esqa2                                                                                                               |
| [ES-2709](https://mosip.atlassian.net/browse/ES-2709)         | KBI login in mock is not working when captcha is enabled                                                                                        |
| [ES-2707](https://mosip.atlassian.net/browse/ES-2707)         | eSignet - aud\_claim in client-assertion is not accepting any three of par endpoint, token endpoint and issuer identifier.                      |
| [ES-2578](https://mosip.atlassian.net/browse/ES-2578)         | FAPI 2.0 Compliance - Server accepted a cipher that is not on the list of permitted ciphers                                                     |
| [ES-2375](https://mosip.atlassian.net/browse/ES-2375)         | Unable to create OIDC client from PMS endpoint from postman                                                                                     |
| [ES-2373](https://mosip.atlassian.net/browse/ES-2373)         | In Android web browser, user can enter as many character as they want, it is not restricted by max length                                       |
| [ES-2310](https://mosip.atlassian.net/browse/ES-2310)         | Datatype mismatch in SBI Auth capture request                                                                                                   |
| [ES-2237](https://mosip.atlassian.net/browse/ES-2237)         | For the first capture the previousHash should be the SHA256 hash of an empty UTF-8 string                                                       |

### **Known Issues** <a href="#known-issues" id="known-issues"></a>

Please [refer here](https://mosip.atlassian.net/issues?jql=issuetype%20%3D%20Bug%20and%20labels%20%3D%20known_issue_eSignet_1.7.1\&selectedIssue=ES-2761) for full list of known issues.

| Jira ID                                                       | Summary                                                                                                                                                  |
| ------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [MOSIP-44103](https://mosip.atlassian.net/browse/MOSIP-44103) | Partner onboarding fails due to existing records with no automated cleanup                                                                               |
| [ES-2761](https://mosip.atlassian.net/browse/ES-2761)         | eSignet-MOSIP & MOCK: When the user lands on the Network Error page, the browser Back and Forward buttons do not navigate to the previous or next pages. |
| [ES-2757](https://mosip.atlassian.net/browse/ES-2757)         | eSignet-deployment: Missing Deployment Instructions for /mock-relying-party-ui, mock-relying-party-service in Documentation                              |
| [ES-2756](https://mosip.atlassian.net/browse/ES-2756)         | eSignet-deployment: eSignet-with-Plugins Installation Script Missing OIDC Setup Steps                                                                    |
| [ES-2755](https://mosip.atlassian.net/browse/ES-2755)         | eSignet-deployment: End-User URL Not Clearly Defined for Cross-Cluster Module Dependencies                                                               |
| [ES-2754](https://mosip.atlassian.net/browse/ES-2754)         | eSignet-Signup MOCK : Privacy Policy link navigates away from signup page instead of opening in new tab                                                  |
| [ES-2734](https://mosip.atlassian.net/browse/ES-2734)         | Support both object and array for verified\_claims request parameter                                                                                     |

### **Repositories Released** <a href="#repositories-released" id="repositories-released"></a>

| Repository     | Tag     |
| -------------- | ------- |
| esignet        | v1.7.1  |
| esignet-signup | v1.3.1  |
| mosip-sdk      | v0.10.1 |

### **Compatible Modules** <a href="#compatible-modules" id="compatible-modules"></a>

#### eSignet with MOSIP compatibility matrix <a href="#esignet-with-mosip-compatibility-matrix" id="esignet-with-mosip-compatibility-matrix"></a>

| Module/Repo | Compatible Version                                                                                                                                   |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| PMS         | [1.2.2.1](https://github.com/mosip/partner-management-services/tree/v1.2.2.1)                                                                        |
| IDA         | <p><a href="https://github.com/mosip/id-authentication/tree/v1.2.1.0">1.2.1.0</a><br>1.3.x - Future release (For identity assurance 1.0 support)</p> |

#### eSignet with Sunbird compatibility matrix <a href="#esignet-with-sunbird-compatibility-matrix" id="esignet-with-sunbird-compatibility-matrix"></a>

| Module/Repo | Compatible Version                                                          |
| ----------- | --------------------------------------------------------------------------- |
| Sunbird     | [v2.0.0-rc3](https://github.com/Sunbird-RC/sunbird-rc-core/tree/v2.0.0-rc3) |

#### Signup with MOSIP compatibility matrix <a href="#signup-with-mosip-compatibility-matrix" id="signup-with-mosip-compatibility-matrix"></a>

| Module/Repo                 | Compatible Version                                                                                                                                 |
| --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| ID Repository               | <p><a href="https://github.com/mosip/id-authentication/tree/v1.2.1.0">1.2.1.0</a><br>1.3.x Future release (for identity assurance 1.0 support)</p> |
| otpmanager                  | [1.2.0.1](https://github.com/mosip/otp-manager/tree/v1.2.0.1)                                                                                      |
| kernel-notification-service | [1.2.0.1](https://github.com/mosip/commons/tree/v1.2.0.1/kernel/kernel-notification-service)                                                       |
| auditmanager                | [1.2.0.1](https://github.com/mosip/audit-manager/tree/v1.2.0.1)                                                                                    |

### **Documentation** <a href="#documentation" id="documentation"></a>

**API Documentation**

* [**eSignet API (v1.7.1)**](https://github.com/mosip/esignet/blob/master/docs/esignet-openapi.yaml)
* [**Signup API (v1.3.1)**](https://github.com/mosip/esignet-signup/blob/master/docs/esignet-signup-openapi.yaml)

**Integration Guides**

* [**eSignet Integration Guide**](https://docs.esignet.io/esignet-authentication/develop/integration)
* [**Signup Integration Guide**](https://docs.esignet.io/esignet-signup/develop/integration-guide-signup-portal)

**End User Guides**

* [**eSignet End User Guide**](https://docs.esignet.io/esignet-authentication/test/end-user-guide)
* [**Signup End User Guide**](https://docs.esignet.io/esignet-signup/test/end-user-guide)

[**QA Report**](test-report.md)
