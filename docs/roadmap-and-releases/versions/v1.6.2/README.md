# v1.6.2

**Release Number:** v1.6.2 (Patch)

**Release Date:** 28th August, 2025

### Overview

We are excited to announce [**eSignet v1.6.2**](https://github.com/mosip/esignet/tree/v1.6.2), a patch release that adds [**Identity Assurance 1.0** ](https://openid.net/specs/openid-connect-4-identity-assurance-1_0.html)**support in the MOSIP Identity plugin**. This enhancement enables the **identity verification feature of the Signup module, such as video eKYC**, to work seamlessly with **MOSIP ID**. Alongside this, the release delivers important **security improvements** and **bug fixes**, further strengthening stability and reliability.

### Major Highlights

1. **Identity Assurance 1.0 Support in MOSIP Identity Plugin**\
   Support in **MOSIP Identity plugin** to comply with [Identity Assurance 1.0](https://openid.net/specs/openid-connect-4-identity-assurance-1_0.html). This enables the **Signup video eKYC flow** to work with MOSIP ID Repo and IDA.

### Enhancements

1. **Bug Fixes**\
   Multiple known issues have been resolved to improve stability and reliability. Please [refer here](https://mosip.atlassian.net/issues/?filter=-4\&jql=project%20%3D%20eSignet%20and%20issuetype%20%3D%20Bug%20and%20%22Release%20Number%5BLabels%5D%22%20%3D%20eSignet_v1.6.2) for full list of bug fixes.
2. **Security Fixes**\
   Applied critical security patches to address vulnerabilities and strengthen system security.

### Compatibility Note

eSignet **v1.6.2** mainly introduces support for **Identity Assurance 1.0 in MOSIP Identity Plugin**, which enables the eSignet and Signup module to integrate seamless with MOSIP ID.

⚠️ **Important:**

1. The **Identity Assurance 1.0 support** added in the MOSIP ID plugin will be available starting with the **following future versions of MOSIP modules**:
   * **ID Repo:** v1.2.3.0 (Coming Soon)
   * **IDA:** v1.2.2.0 (Coming Soon)
2. eSignet and the Signup module have been **verified with these yet-to-be-released versions** of MOSIP modules.
3. The **identity verification feature** in Signup (such as **video eKYC**) will be **fully compatible with MOSIP ID only when** the above module versions are officially released.
4. Until then, **all existing features of eSignet and Signup** (other than the video eKYC flow) will continue to work as expected with the **currently released versions** of MOSIP ID modules.

| Jira ID                                               | Summary                                                                                                      |
| ----------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| [ES-2506](https://mosip.atlassian.net/browse/ES-2506) | esignet mosip id SendBindingOtp and WalletBinding test cases are failing with "errorCode": "IDA-MLC-018"     |
| [ES-2491](https://mosip.atlassian.net/browse/ES-2491) | In mock when we are providing "trust\_framework": null we are getting the user info response for first claim |

Please [refer here](https://mosip.atlassian.net/issues/?filter=-4\&jql=%20issuetype%20%3D%20Bug%20and%20labels%20%3D%20known_issue_eSignet_1.6.2) for full list of known issues.

### Repositories Released

| Repository            | Tag                                                                    |
| --------------------- | ---------------------------------------------------------------------- |
| esignet               | [v1.6.2](https://github.com/mosip/esignet/tree/v1.6.2)                 |
| esignet-signup        | [v1.2.2](https://github.com/mosip/esignet-signup/tree/v1.2.2)          |
| esignet-mock-services | [v0.11.2](https://github.com/mosip/esignet-mock-services/tree/v0.11.2) |
| esignet-plugins       | [v1.3.3](https://github.com/mosip/esignet-plugins/tree/v1.3.3)         |

### Compatible Modules

#### eSignet with MOSIP compatibility matrix

| Module/Repo | Compatible Version                                                                                                                    |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| PMS         | [1.2.2.1](https://github.com/mosip/partner-management-services/tree/v1.2.2.1)                                                         |
| IDA         | <p><a href="https://github.com/mosip/id-authentication/tree/v1.2.1.0">1.2.1.0</a><br>1.2.2.0 (for identity assurance 1.0 support)</p> |

#### eSignet with Sunbird compatibility matrix

| Module/Repo | Compatible Version                                                          |
| ----------- | --------------------------------------------------------------------------- |
| Sunbird     | [v2.0.0-rc3](https://github.com/Sunbird-RC/sunbird-rc-core/tree/v2.0.0-rc3) |

#### Signup with MOSIP compatibility matrix

| ID Repository | <p><a href="https://github.com/mosip/id-authentication/tree/v1.2.1.0">1.2.1.0</a><br>1.2.3.0 (for identity assurance 1.0 support)</p> |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| Keymanager    | [1.2.1.0](https://github.com/mosip/keymanager/tree/v1.2.1.0)                                                                          |

### DB Changes

* **eSignet**: N/A
* **Signup**: N/A

### Config Changes

* **eSignet**: N/A
* **Signup**: N/A

### Documentation

**API Documentation**

* [**eSignet API (v1.6.2)**](https://github.com/mosip/esignet/blob/v1.6.2/docs/esignet-openapi.yaml)
* [**Signup API (v1.2.2)**](https://github.com/mosip/esignet-signup/blob/v1.2.2/docs/esignet-signup-openapi.yaml)

**Integration Guides**

* [**eSignet Integration Guide**](https://docs.esignet.io/esignet-authentication/develop/integration)
* [**Signup Integration Guide**](https://docs.esignet.io/esignet-signup/develop/integration-guide-signup-portal)

**End User Guides**

* [**eSignet End User Guide**](https://docs.esignet.io/esignet-authentication/test/end-user-guide)
* [**Signup End User Guide**](https://docs.esignet.io/esignet-signup/test/end-user-guide)

**QA Report**

* [QA Report](test-report.md)
