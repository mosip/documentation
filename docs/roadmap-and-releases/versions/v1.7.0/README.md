# v1.7.0

**Release Number:** v1.7.0

**Release Date:** 2nd December, 2025

## **Overview**

We’re excited to announce the release of [**eSignet v1.7.0**](https://github.com/mosip/esignet/tree/release-1.7.x), a feature-rich upgrade over v1.6.1 that introduces major advancements in security, enhanced user interaction flexibility, and improved deployment efficiency. This release includes full support for the [**FAPI 2.0 Security Profile**](https://docs.esignet.io/esignet-authentication/features#fapi-2.0-security-profile), implemented through multiple industry-standard RFCs, and brings dynamic, schema-driven UI enhancements for both Sign-Up and KBI authentication—while ensuring complete backward compatibility with existing authentication flows.

## **Major Highlights**

### **New Features**

#### **Support for FAPI 2.0 Security Profile**

eSignet now [implements key RFCs required for FAPI 2.0 compliance](https://docs.esignet.io/esignet-authentication/features#fapi-2.0-security-profile), strengthening security and interoperability:

* **Pushed Authorization Request (PAR)** – A new PAR endpoint is introduced to support secure, tamper-resistant authorization requests.
* **Demonstration of Proof of Possession (DPoP)** – Adds cryptographic proof-of-possession for access tokens, preventing token replay attacks.
* **Authorization Server Issuer Identification** – Enhances security by enabling the ‘Authorization Server’ to uniquely identify itself during authorization flows; includes updates to .well-known/oauth-authorization-server configuration.

{% hint style="success" %}
**Tips**:

**FAPI 2.0 support is now fully enabled in eSignet.** However, enforcement of the FAPI 2.0 security profile is **client-configurable**. Each client can choose whether or not to enable FAPI 2.0 for their integrations.\
If a client does **not** enforce the FAPI 2.0 profile, their authentication flows will continue to work **seamlessly without any change**.
{% endhint %}

### **Enhancements**

#### **Dynamic Schema-Driven Sign-Up UI**

The Sign-Up experience has been improved with the [UI that can now be generated dynamically based on a backend-driven UI schema](https://docs.esignet.io/esignet-signup/features#dynamic-signup-form-schema-driven-ui).\
This leverages a JSON form-builder library for improved flexibility and faster configuration changes.

#### **Dynamic Schema-Driven KBI Authentication UI**

[The KBI authentication UI](https://docs.esignet.io/esignet-authentication/features#supported-authentication-methods) is now also fully dynamic and powered by the same schema-based JSON form builder, enhancing consistency and maintainability.

#### **Improved Deployment Scripts**

Deployment scripts for the eSignet service have been refined to simplify setup, reduce configuration overhead, and ensure smoother deployments across environments.

### **Bug Fixes**

Several known issues from the previous release have been addressed to improve platform stability and performance. Please refer to the link [here](https://mosip.atlassian.net/issues/?jql=issuetype%20%3D%20Bug%20and%20%22Release%20Number%5BLabels%5D%22%20%3D%20eSignet_v1.7.0) for the complete list of resolved issues.

<table><thead><tr><th width="192.99609375">Jira ID</th><th>Summary</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/ES-2702">ES-2702</a></td><td>Deployment : Not able to complete the sanity, after registration getting the error "Unable to process. Please try again".</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2691">ES-2691</a></td><td>Deployment : signup captcha is not working, throwing an error "The captcha you entered is incorrect. Please try again".</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2683">ES-2683</a></td><td>Deployment : esignet image is not getting updated to mosipqa/esignet-with-plugins:1.7.x its taking develop branch image.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2678">ES-2678</a></td><td>Deployment : In init_values.yaml branch is pointing to develop branch instead of release-1.7.x.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2677">ES-2677</a></td><td>Deployment : Still keyclock postgres image is pointing to bitnami.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2665">ES-2665</a></td><td>Docker-compose : In mock-relying-party-portal-fapi2-docker-compose.yml volumes: are not given.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2665">ES-2659</a></td><td>Linux : Docker Compose fails to start containers — “failed to extract layer” error.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2632">ES-2632</a></td><td>eSignet-MOSIP: User is unable to complete eKYC verification in MOSIP-ID plugin.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2629">ES-2629</a></td><td>esignet mock: Captcha is enabled but its not displayed in UI, but checking for captcha in UI and we are getting this error while signing up.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2588">ES-2588</a></td><td>In mock : KBI Login is not working.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2577">ES-2577</a></td><td>eSignet-MOCK: fetchUserInfo fails with error "Failed to get the User Info." when DPoP and PAR are disabled.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2574">ES-2574</a></td><td>eSignet-MOSIP-ID: User is unable to register in signup-mosipid-qabase.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2556">ES-2556</a></td><td>JWKS.json returning incorrect userinfo signing certificate.</td></tr></tbody></table>

### Known Issues

Please refer [here](https://mosip.atlassian.net/issues/?jql=issuetype%20%3D%20Bug%20and%20labels%20%3D%20known_issue_eSignet_1.7.0) for full list of known issues.

<table><thead><tr><th width="189.52734375">Jira ID</th><th>Summary</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/ES-2716">ES-2716</a></td><td>esignet mosip id SendBindingOtp and WalletBinding test cases are failing with "errorCode": "IDA-MLC-018".</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2709">ES-2709</a></td><td>In mock when we are providing "trust_framework": null we are getting the user info response for first claim.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-43956">MOSIP-43956</a></td><td>Update documentation for partner-onboarding/esignet.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-43957">MOSIP-43957</a></td><td>Update keycloak init scripts in esignet-signup.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-43958">MOSIP-43958</a></td><td>Issue in partner on boarder script for eSignet.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/MOSIP-43960">MOSIP-43960</a></td><td>Partner on boarder script issue in esignet-signup.</td></tr></tbody></table>



### Story Development

<table><thead><tr><th width="192.0234375">Story ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/ES-2589">ES-2589</a></td><td>eSignet - Signup - Add a new endpoint to support the multi-part data.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2429">ES-2429</a></td><td>Signup Module - Signup UI registration Form - Add support to capture the face photo for the user.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2379">ES-2379</a></td><td>Authorization Server Issuer Identification for FAPI 2.0 Compliance.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2346">ES-2346</a></td><td>Add Support for additional Config in client management endpoint.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2333">ES-2333</a></td><td>Push Authorization request (PAR) - FAPI 2.0 Compliance - Add a new authorize url to process request with clientid and request uri.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2296">ES-2296</a></td><td>Push Authorization request (PAR) - FAPI 2.0 Compliance - New endpoint development to initiate PAR flow.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2297">ES-2297</a></td><td>Sender constrained tokens using DPOP for FAPI 2.0 security profile compliance.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-2058">ES-2058</a></td><td>Enhance KBI form in eSignet UI.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/ES-1644">ES-1644</a></td><td>Registration form on the eSignet sign-up page should dynamically adjust its fields and layout based on a predefined UI schema.</td></tr></tbody></table>

### Repositories Released

| Repository            | Tag                                                                    |
| --------------------- | ---------------------------------------------------------------------- |
| esignet               | [v1.7.0](https://github.com/mosip/esignet/tree/v1.7.0)                 |
| esignet-signup        | [v1.3.0](https://github.com/mosip/esignet-signup/tree/v1.3.0)          |
| esignet-mock-services | [v0.12.0](https://github.com/mosip/esignet-mock-services/tree/v0.12.0) |
| esignet-plugins       | [v1.3.4](https://github.com/mosip/esignet-plugins/tree/v1.3.4)         |

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

* **eSignet Mock Identity System**:
  * Please refer the [link here](https://github.com/mosip/esignet-mock-services/blob/master/db_upgrade_script/mosip_mockidentitysystem/sql/0.11.2_to_0.12.0_upgrade.sql) for the DB upgrade script
  * Please refer the [link here](https://github.com/mosip/esignet-mock-services/blob/master/db_upgrade_script/mosip_mockidentitysystem/sql/0.11.2_to_0.12.0_rollback.sql) for the DB rollback script

### Config Changes

* **eSignet**: The properties listed below are newly added to the eSignet default configuration. For a comprehensive view of all configuration properties in eSignet, please [refer here](https://github.com/mosip/esignet/blob/master/esignet-service/src/main/resources/application-default.properties).
  * mosip.esignet.par.expire-seconds=60
  * mosip.esignet.par.request-uri.prefix=urn:ietf:params:oauth:request\_uri:
  * mosip.esignet.dpop.clock-skew=10
  * mosip.esignet.dpop.nonce.expire.seconds=15
  * mosip.esignet.kbispec.ttl.seconds=18000
  * mosip.esignet.client-assertion.unique.jti.required=true
* **Signup**: The properties listed below are newly added to the Signup default configuration. For a comprehensive view of all configuration properties in eSignet, please [refer here](https://github.com/mosip/esignet-signup/blob/master/signup-service/src/main/resources/application-default.properties).
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

[**QA Report**](test-report.md)
