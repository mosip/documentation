# v1.7.0

<mark style="color:red;">**Coming Soon!**</mark>

**Release Number:** v1.7.0

**Release Date:&#x20;**<mark style="color:red;">**Coming Soon!**</mark>

## **Overview**

We’re excited to announce the release of [**eSignet v1.7.0**](https://github.com/mosip/esignet/tree/release-1.7.x), a feature-rich upgrade over v1.6.1 that introduces major advancements in security, enhanced user interaction flexibility, and improved deployment efficiency. This release includes full support for the [**FAPI 2.0 Security Profile**](https://docs.esignet.io/esignet-authentication/features#fapi-2.0-security-profile), implemented through multiple industry-standard RFCs, and brings dynamic, schema-driven UI enhancements for both Sign-Up and KBI authentication—while ensuring complete backward compatibility with existing authentication flows.

## **Major Highlights**

### **New Features**

#### **Support for FAPI 2.0 Security Profile**

eSignet now implements key RFCs required for FAPI 2.0 compliance, strengthening security and interoperability:

* [**Pushed Authorization Request (PAR)**](https://docs.esignet.io/esignet-authentication/features#what-is-par-sub-section-of-the-fapi-2.0-security-profile-section-above) – [_RFC 9126_](https://datatracker.ietf.org/doc/html/rfc9126) _-_ A new PAR endpoint is introduced to support secure, tamper-resistant authorization requests.
* [**Demonstration of Proof of Possession (DPoP)**](https://docs.esignet.io/esignet-authentication/features#what-is-dpop) – [_RFC 9449_](https://datatracker.ietf.org/doc/html/rfc9449) Adds cryptographic proof-of-possession for access tokens, preventing token replay attacks.
* [**Authorization Server Issuer Identification**](https://docs.esignet.io/esignet-authentication/features#what-is-authorization-server-issuer-identification) – [_RFC 9207_ ](https://www.rfc-editor.org/rfc/rfc9207)_-_ Enhances security by enabling the ‘Authorization Server’ to uniquely identify itself during authorization flows; includes updates to .well-known/oauth-authorization-server configuration.

{% hint style="success" %}
**Tips**:

**FAPI 2.0 support is now fully enabled in eSignet.**\
However, enforcement of the FAPI 2.0 security profile is **client-configurable**. Each client can choose whether or not to enable FAPI 2.0 for their integrations.\
If a client does **not** enforce the FAPI 2.0 profile, their authentication flows will continue to work **seamlessly without any change**.
{% endhint %}

### **Enhancements**

#### **Dynamic Schema-Driven Sign-Up UI**

The Sign-Up experience has been improved with the [UI that can now be generated dynamically based on a backend-driven UI schema](https://docs.esignet.io/esignet-signup/features#dynamic-signup-form-schema-driven-ui).\
This leverages a JSON form-builder library for improved flexibility and faster configuration changes.

#### **Dynamic Schema-Driven KBI Authentication UI**

[The KBI authentication UI](https://docs.esignet.io/esignet-signup/features#id-2.-signup-with-video-ekyc) is now also fully dynamic and powered by the same schema-based JSON form builder, enhancing consistency and maintainability.

#### **Improved Deployment Scripts**

Deployment scripts for the eSignet service have been refined to simplify setup, reduce configuration overhead, and ensure smoother deployments across environments.

### **Bug Fixes**

Several known issues from the previous release have been addressed to improve platform stability and performance. Please refer to the [link here](https://mosip.atlassian.net/issues/?jql=issuetype%20%3D%20Bug%20and%20project%20%3D%20eSignet%20and%20%22Release%20Number%5BLabels%5D%22%20%3D%20eSignet_v1.7.0\&selectedIssue=ES-2730) for the complete list of resolved issues.

<mark style="color:red;">\<Add some bugs in tabular format></mark>

### Known Issues

Please [refer here](https://mosip.atlassian.net/issues/?jql=issuetype%20%3D%20Bug%20and%20project%20%3D%20eSignet%20and%20labels%20%3D%20known_issue_eSignet_1.7.0\&selectedIssue=ES-2738) for full list of known issues.

<table><thead><tr><th width="197.44140625">Jira ID</th><th>Summary</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/ES-2716">ES-2716</a></td><td>esignet mosip id SendBindingOtp and WalletBinding test cases are failing with "errorCode": "IDA-MLC-018".</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2709">ES-2709</a></td><td>In mock when we are providing "trust_framework": null we are getting the user info response for first claim.</td></tr></tbody></table>

### Story Development

<table><thead><tr><th width="192.0234375">Story ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/ES-2589">ES-2589</a></td><td>eSignet - Signup - Add a new endpoint to support the multi-part data.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2429">ES-2429</a></td><td>Signup Module - Signup UI registration Form - Add support to capture the face photo for the user.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2379">ES-2379</a></td><td>Authorization Server Issuer Identification for FAPI 2.0 Compliance.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2346">ES-2346</a></td><td>Add Support for additional Config in client management endpoint.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2333">ES-2333</a></td><td>Push Authorization request (PAR) - FAPI 2.0 Compliance - Add a new authorize url to process request with clientid and request uri.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2296">ES-2296</a></td><td>Push Authorization request (PAR) - FAPI 2.0 Compliance - New endpoint development to initiate PAR flow.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2297">ES-2297</a></td><td>Sender constrained tokens using DPOP for FAPI 2.0 security profile compliance.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2058">ES-2058</a></td><td>Enhance KBI form in eSignet UI.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-1644">ES-1644</a></td><td>Registration form on the eSignet sign-up page should dynamically adjust its fields and layout based on a predefined UI schema.</td></tr></tbody></table>

### Repositories Released

| Repository            | Tag     |
| --------------------- | ------- |
| esignet               | v1.7.0  |
| esignet-signup        | v1.3.0  |
| esignet-mock-services | v0.12.0 |
| esignet-plugins       | v1.3.4  |

### Compatible Modules

#### eSignet compatibility with MOSIP

| Module/Repo | Compatible Version                                                                                                                  |
| ----------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| PMS         | [1.2.2.1](https://github.com/mosip/partner-management-services/tree/v1.2.2.1)                                                       |
| IDA         | <p><a href="https://github.com/mosip/id-authentication/tree/v1.2.1.0">1.2.1.0</a><br>1.3.x (for identity assurance 1.0 support)</p> |

#### eSignet compatibility with Sunbird

| Module/Repo | Compatible Version                                                          |
| ----------- | --------------------------------------------------------------------------- |
| Sunbird     | [v2.0.0-rc3](https://github.com/Sunbird-RC/sunbird-rc-core/tree/v2.0.0-rc3) |

#### eSignet Signup compatibility with MOSIP

| Module/Repo                 | Compatible Version                                                                                                                  |
| --------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| ID Repository               | <p><a href="https://github.com/mosip/id-authentication/tree/v1.2.1.0">1.2.1.0</a><br>1.3.x (for identity assurance 1.0 support)</p> |
| otpmanager                  | [1.2.0.1](https://github.com/mosip/otp-manager/tree/v1.2.0.1)                                                                       |
| kernel-notification-service | [1.2.0.1](https://github.com/mosip/commons/tree/v1.2.0.1/kernel/kernel-notification-service)                                        |
| auditmanager                | [1.2.0.1](https://github.com/mosip/audit-manager/tree/v1.2.0.1)                                                                     |

### DB Changes

* **eSignet**: N/A
* **Signup**: N/A
* **eSignet Mock Identity System**:
  * [https://github.com/mosip/esignet-mock-services/blob/master/db\_upgrade\_script/mosip\_mockidentitysystem/sql/0.11.2\_to\_0.12.0\_upgrade.sql](https://github.com/mosip/esignet-mock-services/blob/master/db_upgrade_script/mosip_mockidentitysystem/sql/0.11.2_to_0.12.0_upgrade.sql)
  * [https://github.com/mosip/esignet-mock-services/blob/master/db\_upgrade\_script/mosip\_mockidentitysystem/sql/0.11.2\_to\_0.12.0\_rollback.sql](https://github.com/mosip/esignet-mock-services/blob/master/db_upgrade_script/mosip_mockidentitysystem/sql/0.11.2_to_0.12.0_rollback.sql)

### Config Changes

* **eSignet**:
  * mosip.esignet.par.expire-seconds=60
  * mosip.esignet.par.request-uri.prefix=urn:ietf:params:oauth:request\_uri:
  * mosip.esignet.dpop.clock-skew=10
  * mosip.esignet.dpop.nonce.expire.seconds=15
  * mosip.esignet.kbispec.ttl.seconds=18000
  * mosip.esignet.client-assertion.unique.jti.required=true
* **Signup**:
  * mosip.signup.uispec.ttl.seconds=18000

### Documentation

**API Documentation**

* [**eSignet API (v1.7.0)**](https://github.com/mosip/esignet/blob/master/docs/esignet-openapi.yaml)
* [**Signup API (v1.3.0)**](https://github.com/mosip/esignet-signup/blob/master/docs/esignet-signup-openapi.yaml)

**Integration Guides**

* [**eSignet Integration Guide**](https://docs.esignet.io/esignet-authentication/develop/integration)
* [**Signup Integration Guide**](https://docs.esignet.io/esignet-signup/develop/integration-guide-signup-portal)

**End User Guides**

* [**eSignet End User Guide**](https://docs.esignet.io/esignet-authentication/test/end-user-guide)
* [**Signup End User Guide**](https://docs.esignet.io/esignet-signup/test/end-user-guide)

**QA Report**
