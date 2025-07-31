# v1.6.1

**Release Number:** v1.6.1

**Release Date:** 29th Jul, 2025

## Overview

We’re excited to announce the upcoming release of [**eSignet v1.6.1**](https://github.com/mosip/esignet/tree/v1.6.1), a major update packed with new features, improved configurability, and enhanced security. This version brings greater flexibility for Relying Parties (RPs) to customize login experiences, a revamped UI, and significant improvements to deployment processes.

{% hint style="success" %}
**Version Note:**&#x20;

**eSignet v1.6.1** is a patch release over the originally planned **v1.6.0**, addressing critical deployment-related bug fixes. It is the latest official version following **eSignet v1.5.1**.
{% endhint %}

## Major Highlights

### New Features

* [**Prefix & Postfix support for Choice of Login ID**](https://docs.esignet.io/esignet-authentication/develop/configuration/login-id-configuration-in-esignet)\
  Configure login ID types (Email, Phone, VID, etc.) as per relying party (RP) needs. Comes with a revamped, more intuitive UI.
* [**Customizable Client Configuration**](https://github.com/mosip/esignet/blob/v1.6.1/docs/esignet-openapi.yaml#L36)\
  Enhanced client management endpoint with additional options for better customization and control of eSignet's behavior.
* [**Purpose-Based eSignet UI**](https://docs.esignet.io/esignet-authentication/develop/configuration/purpose-based-ui-rendering-in-esignet)\
  UI dynamically adapts titles and tile subtitles based on the context and purpose of the service, providing a more relevant user experience.

### Enhancements

* **JTI Mandatory in Client Assertion**\
    JTI is now a required parameter in the client assertion JWT in token endpoint for improved security.

    ⚠️ **Breaking Change**: Existing relying parties (RPs) must include the `jti` claim to share consented claims successfully.
* **Unique nonce for each transaction:** nonce query parameter in the [authorize url](https://docs.esignet.io/esignet-authentication/develop/integration/relying-party/development-and-integration-with-esignet#get-authorize) should be unique for each transaction.
   
    ⚠️ **Breaking Change**: If duplicate nonce is found “invalid\_request“ error is thrown.
* **Updated Vulnerable Libraries**\
  Security has been bolstered by updating dependencies and patching known vulnerabilities.
* [**Improved Deployment Scripts**](https://github.com/mosip/esignet/blob/v1.6.1/deploy/README.md)\
  Upgraded installation scripts provide a smoother experience for new deployments of eSignet.

## Features Released

| Feature                           | Jira                                                  |
| --------------------------------- | ----------------------------------------------------- |
| Prefix & Postfix support for Choice of Login ID                | [ES-1665](https://mosip.atlassian.net/browse/ES-1665) |
| Customizable Client Configuration | [ES-1655](https://mosip.atlassian.net/browse/ES-1655) |
| Purpose-Based eSignet UI          | [ES-216](https://mosip.atlassian.net/browse/ES-216)   |
| Deployment Script Update   | [MOSIP-40529](https://mosip.atlassian.net/browse/MOSIP-40529)|

## Security Enhancements

**Library Upgrades for Vulnerability Fixes:**

Dependencies in eSignet service have been upgraded to fix known vulnerabilities.

## Bug Fixes

Several known issues from the previous release have been addressed to improve platform stability and performance.

Please refer to the [link here](https://mosip.atlassian.net/issues/?filter=-4\&jql=%22Release%20Number%5BLabels%5D%22%20%3D%20eSignet_v1.6.1%20and%20issuetype%20%3D%20Bug%20and%20status%20IN%20%28Closed%29) for the complete list of resolved issues.

## Key Known Issues

| Jira Issue                                            | Summary                                                                        |
| ----------------------------------------------------- | ------------------------------------------------------------------------------ |
| [ES-2317](https://mosip.atlassian.net/browse/ES-2317) | Verified Consented claims are not returned in userinfo response in MOSIP IDA   |
| [ES-2359](https://mosip.atlassian.net/browse/ES-2359) | Getting `invalid_request` when the `additional_config` is added for the client |

Please refer to [link here](https://mosip.atlassian.net/issues/?filter=-4\&jql=labels%20%3D%20known_issue_eSignet_1.6.1) for the full list of known issues.

## Repositories Released

| Repository            | Tags                                                                   |
| --------------------- | ---------------------------------------------------------------------- |
| esignet               | [v1.6.1](https://github.com/mosip/esignet/tree/v1.6.1)                 |
| esignet-signup        | [v1.2.1](https://github.com/mosip/esignet-signup/tree/v1.2.1)          |
| esignet-mock-services | [v0.11.1](https://github.com/mosip/esignet-mock-services/tree/v0.11.1) |
| esignet-plugins       | [v1.3.2](https://github.com/mosip/esignet-plugins/tree/v1.3.2)         |

## Compatibility Matrix

**eSignet with MOSIP compatibility matrix**

| Module/Repo       | Compatible Version                                                            |
| ----------------- | ----------------------------------------------------------------------------- |
| ID Authentication | [1.2.1.0](https://github.com/mosip/id-authentication/tree/v1.2.1.0)           |
| PMS               | [1.2.2.1](https://github.com/mosip/partner-management-services/tree/v1.2.2.1) |

**eSignet with Sunbird compatibility matrix**

| Module/Repo | Compatible Version                                                          |
| ----------- | --------------------------------------------------------------------------- |
| Sunbird     | [v2.0.0-rc3](https://github.com/Sunbird-RC/sunbird-rc-core/tree/v2.0.0-rc3) |

**Signup with MOSIP compatibility matrix**

| Module/Repo   | Compatible Version                                                            |
| ------------- | ----------------------------------------------------------------------------- |
| ID Repository | [1.2.2.1](https://github.com/mosip/id-repository/tree/v1.2.2.1)               |
| Keymanager    | [1.2.1.0](https://github.com/mosip/keymanager/tree/v1.2.1.0)                  |
| PMS           | [1.2.2.1](https://github.com/mosip/partner-management-services/tree/v1.2.2.1) |

## Config Changes

### eSignet

1. Added the following configurations to provide a structured and flexible approach to supporting multiple login ID types:

`mosip.esignet.ui.config.login-id.options=`

`mosip.esignet.ui.config.login-id.options=`

Allows customization for each ID type, including options such as:

* **Prefixes** (e.g., country codes for mobile numbers)
* **Associated icons** for improved UI experience
* **Validation rules**, such as regular expressions or length constraints

2. Property to configure additional config schema

`mosip.esignet.additional-config.schema.url`

Please [refer here](https://github.com/mosip/esignet/blob/v1.6.1/esignet-service/src/main/resources/application-default.properties) for details.

## eSignet Mock Services

1. Property to configure the url to fetch the schema of additional config

`mosip.mock.ui-spec.schema.url`

Please [refer here](https://github.com/mosip/esignet-mock-services/blob/v0.11.1/mock-identity-system/src/main/resources/application-default.properties) for details.

## Database Changes

### eSignet

1. **New column:** `additional_config` of type `jsonb` added to the `client_detail` table for storing flexible JSON configuration data.
2. **Increased length of `name` column** in the `client_detail` table to **600 characters** to support longer client names.

Please [refer here](https://github.com/mosip/esignet/blob/release-1.6.x/db_upgrade_script/mosip_esignet/sql/1.5.1_to_1.6.0_upgrade.sql) for details.

### eSignet Mock Services

1. Modified the `identity_json` column in the `client_detail` table to use `VARCHAR` **without a length limit**, allowing for variable-length string data of unlimited size.

Please [refer here](https://github.com/mosip/esignet-mock-services/blob/release-0.11.x/db_upgrade_script/mosip_mockidentitysystem/sql/0.10.1_to_0.11.0_upgrade.sql) for details.

## Documentation

**API Documentation**

* [**eSignet API (v1.6.1)**](https://github.com/mosip/esignet/blob/v1.6.1/docs/esignet-openapi.yaml)
* [**Signup API (v1.2.1)**](https://github.com/mosip/esignet-signup/blob/v1.2.1/docs/esignet-signup-openapi.yaml)

**Integration Guides**

* [**eSignet Integration Guide**](https://docs.esignet.io/esignet-authentication/develop/integration)
* [**Signup Integration Guide**](https://docs.esignet.io/esignet-signup/develop/integration-guide-signup-portal)

**End User Guides**

* [**eSignet End User Guide**](https://docs.esignet.io/esignet-authentication/test/end-user-guide)
* [**Signup End User Guide**](https://docs.esignet.io/esignet-signup/test/end-user-guide)

[**QA Report**](test-report.md)
