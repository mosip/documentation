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

<table><thead><tr><th width="211.30859375">Jira ID</th><th>Summary</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-43960">MOSIP-43960</a></td><td>Partner onboarder issue in esignet-signup</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-43958">MOSIP-43958</a></td><td>Issue in partner onboarder esignet .</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-43957">MOSIP-43957</a></td><td>Update keycloak init scripts in esignet-signup</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-43956">MOSIP-43956</a></td><td>Update readme for partner-onboarding/esignet</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2738">ES-2738</a></td><td>Deployment : esignet readme does not contain delete steps Please Mention delete steps in readme</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2737">ES-2737</a></td><td>Deployment : softhsm for esignet is getting deployed in esignet ns but in the delete-all.sh its searching for softhsm which needs to be updated</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2725">ES-2725</a></td><td>eSignet- mosipid: “Unsupported language” error displayed on Forgot Password page when using Khmer language</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2719">ES-2719</a></td><td>Fix content for wallet_header on WLA login page</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2716">ES-2716</a></td><td>In Ui schema when email is marked as optional field by default its taking as mandatory field</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2710">ES-2710</a></td><td>Inji logo is not updated in esqa2</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2709">ES-2709</a></td><td>KBI login in mock is not working when captcha is enabled</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2707">ES-2707</a></td><td>eSignet - aud_claim in client-assertion is not accepting any three of par endpoint, token endpoint and issuer identifier.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2578">ES-2578</a></td><td>FAPI 2.0 Compliance - Server accepted a cipher that is not on the list of permitted ciphers</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2375">ES-2375</a></td><td>Unable to create OIDC client from PMS endpoint from postman</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2373">ES-2373</a></td><td>In Android web browser, user can enter as many character as they want, it is not restricted by max length</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2310">ES-2310</a></td><td>Datatype mismatch in SBI Auth capture request</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2237">ES-2237</a></td><td>For the first capture the previousHash should be the SHA256 hash of an empty UTF-8 string</td></tr></tbody></table>

### **Known Issues** <a href="#known-issues" id="known-issues"></a>

Please [refer here](https://mosip.atlassian.net/issues?jql=issuetype%20%3D%20Bug%20and%20labels%20%3D%20known_issue_eSignet_1.7.1\&selectedIssue=ES-2761) for full list of known issues.

<table><thead><tr><th width="212.8046875">Jira ID</th><th>Summary</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-44103">MOSIP-44103</a></td><td>Partner onboarding fails due to existing records with no automated cleanup</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2761">ES-2761</a></td><td>eSignet-MOSIP &#x26; MOCK: When the user lands on the Network Error page, the browser Back and Forward buttons do not navigate to the previous or next pages.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2757">ES-2757</a></td><td>eSignet-deployment: Missing Deployment Instructions for /mock-relying-party-ui, mock-relying-party-service in Documentation</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2756">ES-2756</a></td><td>eSignet-deployment: eSignet-with-Plugins Installation Script Missing OIDC Setup Steps</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2755">ES-2755</a></td><td>eSignet-deployment: End-User URL Not Clearly Defined for Cross-Cluster Module Dependencies</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2754">ES-2754</a></td><td>eSignet-Signup MOCK : Privacy Policy link navigates away from signup page instead of opening in new tab</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2734">ES-2734</a></td><td>Support both object and array for verified_claims request parameter</td></tr></tbody></table>

### **Repositories Released** <a href="#repositories-released" id="repositories-released"></a>

| Repository     | Tag                                                           |
| -------------- | ------------------------------------------------------------- |
| esignet        | [v1.7.1](https://github.com/mosip/esignet/tree/v1.7.1)        |
| esignet-signup | [v1.3.1](https://github.com/mosip/esignet-signup/tree/v1.3.1) |
| mosip-sdk      | [v0.10.1](https://github.com/mosip/mosip-sdk/tree/v0.10.1)    |

### **Compatible Modules** <a href="#compatible-modules" id="compatible-modules"></a>

#### eSignet with MOSIP compatibility matrix <a href="#esignet-with-mosip-compatibility-matrix" id="esignet-with-mosip-compatibility-matrix"></a>

<table><thead><tr><th width="256.76171875">Module/Repo</th><th>Compatible Version</th></tr></thead><tbody><tr><td>PMS</td><td><a href="https://github.com/mosip/partner-management-services/tree/v1.2.2.1">1.2.2.1</a></td></tr><tr><td>IDA</td><td><a href="https://github.com/mosip/id-authentication/tree/v1.2.1.0">1.2.1.0</a><br>1.3.x - Future release (For identity assurance 1.0 support)</td></tr></tbody></table>

#### eSignet with Sunbird compatibility matrix <a href="#esignet-with-sunbird-compatibility-matrix" id="esignet-with-sunbird-compatibility-matrix"></a>

| Module/Repo | Compatible Version                                                          |
| ----------- | --------------------------------------------------------------------------- |
| Sunbird     | [v2.0.0-rc3](https://github.com/Sunbird-RC/sunbird-rc-core/tree/v2.0.0-rc3) |

#### Signup with MOSIP compatibility matrix <a href="#signup-with-mosip-compatibility-matrix" id="signup-with-mosip-compatibility-matrix"></a>

<table><thead><tr><th width="252.70703125">Module/Repo</th><th>Compatible Version</th></tr></thead><tbody><tr><td>ID Repository</td><td><a href="https://github.com/mosip/id-authentication/tree/v1.2.1.0">1.2.1.0</a><br>1.3.x Future release (for identity assurance 1.0 support)</td></tr><tr><td>otpmanager</td><td><a href="https://github.com/mosip/otp-manager/tree/v1.2.0.1">1.2.0.1</a></td></tr><tr><td>kernel-notification-service</td><td><a href="https://github.com/mosip/commons/tree/v1.2.0.1/kernel/kernel-notification-service">1.2.0.1</a></td></tr><tr><td>auditmanager</td><td><a href="https://github.com/mosip/audit-manager/tree/v1.2.0.1">1.2.0.1</a></td></tr></tbody></table>

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
