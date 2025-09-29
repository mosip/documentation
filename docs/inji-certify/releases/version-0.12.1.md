# Version 0.12.1

**Release Version:** 0.12.1

**Release Type:** Developer Release

**Release Date:** 11th September, 2025

## Overview

**Inji Certify v0.12.1**, brings enhancements in automation of testing to support latest eSignet release v1.6.2

## Major Highlights/ Features <a href="#major-highlights-features" id="major-highlights-features"></a>

Support for eSignet v1.6.2 – Test automation has been updated to accommodate the blocker change requiring `jti` in the authentication request. With this fix, the automation now fully supports [eSignet v1.6.2](https://docs.esignet.io/roadmap-and-releases/versions/v1.6.2).

## Bug Fixes <a href="#feature" id="feature"></a>

| **JIRA**                                                          | **Description**                                                            |
| ----------------------------------------------------------------- | -------------------------------------------------------------------------- |
| [INJICERT-1200](https://mosip.atlassian.net/browse/INJICERT-1200) | Update Automation Script - Support jti attribute during eSignet api access |

## Known Issue <a href="#known-issue" id="known-issue"></a>

Below is the list of known issues related to the release v0.12.0. To access all known issues related to Inji Certify please click [**here**](https://mosip.atlassian.net/issues/INJICERT-852?filter=11419\&jql=project%20%3D%20%22Inji%20Certify%22%20AND%20issuetype%20%3D%20Bug%20%20AND%20labels%20not%20in%20%28API_Automation%2C%20AWSdevicefarm%2C%20device_specific%2C%20qa-inji-UI-auto%29%20%20and%20status%20NOT%20IN%20%28Closed%2C%20Fixed%2C%20Canceled%2CCancelled%29%20%20ORDER%20BY%20created%20DESC%2C%20updated%20DESC)

| **JIRA**                                                          | **Description**                                        |
| ----------------------------------------------------------------- | ------------------------------------------------------ |
| [INJICERT-1218](https://mosip.atlassian.net/browse/INJICERT-1218) | Automation scripts are using ClientID as the jti value |

## Repository Released <a href="#repository-released" id="repository-released"></a>

| **Repositories** | **Tags Released**                                             |
| ---------------- | ------------------------------------------------------------- |
| inji-certify     | [v0.12.1](https://github.com/mosip/inji-certify/tree/v0.12.1) |

## Compatible Modules <a href="#compatible-modules" id="compatible-modules"></a>

The following table outlines the tested and certified compatibility of \<release version> with other modules.

| **Module**            | **Version (with tag links)**                                                    |
| --------------------- | ------------------------------------------------------------------------------- |
| eSignet               | [v1.6.2](https://github.com/mosip/esignet/tree/v1.6.2)                          |
| IDA                   | [v1.2.1.0](https://github.com/mosip/id-authentication/tree/v1.2.1.0)            |
| Sunbird C             | [v2.0.0](https://github.com/Sunbird-RC/sunbird-rc-core/releases/tag/v2.0.0-rc3) |
| esignet-mock-services | [v0.11.2](https://github.com/mosip/esignet-mock-services/tree/v0.11.2)          |
| commons               | [v1.3.0-beta](https://github.com/mosip/commons/tree/v1.3.0-beta.3).3            |
| key-manager           | [v1.3.0-beta.4](https://github.com/mosip/keymanager/tree/v1.3.0-beta.4)         |
| mimoto                | [0.15.0](https://github.com/mosip/mimoto/tree/v0.15.0) (for docker compose)     |
| Inji-web              | [0.11.0](https://github.com/mosip/inji-web/tree/v0.11.0) (for docker compose)   |
| Inji-web              | [0.13.1](https://github.com/mosip/inji-web/tree/v0.13.1)                        |
| mimoto                | [0.18.1](https://github.com/mosip/mimoto/tree/v0.18.1)                          |

## Documentation <a href="#documentation" id="documentation"></a>

* [Feature Documentation](https://docs.mosip.io/inji/inji-certify/functional-overview/features)
* [Local Setup](https://docs.mosip.io/inji/inji-certify/build-and-deploy/local-setup)
* [API Documentation](https://mosip.stoplight.io/docs/inji-certify/25f435617408e-inji-certify)
