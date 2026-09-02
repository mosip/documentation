# Partner Management System 1.2.2.4 (Patch)

**Release Name**: Partner Management System Revamp

**Release Number**: 1.2.2.4

**Release Date**: 2nd Sep 2026

## Overview

Partner Management System (PMS) Revamp 1.2.2.4 is a patch release focused on stability and reliability improvements. This release strengthens the PMS automation test framework, streamlines database upgrade and rollback scripts, and resolves outstanding SonarCloud findings across the PMS UI and Service, resulting in a more robust and maintainable codebase.

## Key Features & Enhancements

This release focuses on bug fixes to improve overall system stability and performance; refer to the table below for details.

## Bugs Fixed

| Issue key                                                                 | Summary                                                                                                       |
| ------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| [#1941](https://github.com/mosip/partner-management-services/issues/1941) | Getting error while saving partner consent after running `1.2.1.0_to_1.2.2.0_upgrade.sql`                     |
| [#1938](https://github.com/mosip/partner-management-services/issues/1938) | PMS Automation API Test Rig Using Hardcoded Expired Certificate — Update Required                             |
| [#1937](https://github.com/mosip/partner-management-services/issues/1937) | Update "attribute\_name" for Face Modality in `pms.partner_policy_bioextract`                                 |
| [#1869](https://github.com/mosip/partner-management-services/issues/1869) | Legacy PMS issue: `1.2.0.1_to_1.2.1.0` upgrade & rollback scripts should not include `logo_url` & `addl_info` |
| [#1764](https://github.com/mosip/partner-management-services/issues/1764) | Sonar issues in `release-1.2.2.x` branch for PMS UI and Service                                               |

## Repositories Released

| **Repository**              | **Branch Name** | **Version**                                                                   |
| --------------------------- | --------------- | ----------------------------------------------------------------------------- |
| partner-management-services | release-1.2.2.x | [1.2.2.4](https://github.com/mosip/partner-management-services/tree/v1.2.2.4) |
| partner-management-portal   | release-1.2.2.x | [1.2.2.4](https://github.com/mosip/partner-management-portal/tree/v1.2.2.4)   |

## Compatible Modules

| **Module/ Repo**    | **Tags**                                                                         |
| ------------------- | -------------------------------------------------------------------------------- |
| Key Manager         | [v1.3.0-beta.2](https://github.com/mosip/keymanager/tree/v1.3.0-beta.2)          |
| mosip-openid-bridge | [v1.3.0-beta.2](https://github.com/mosip/mosip-openid-bridge/tree/v1.3.0-beta.2) |
| artifactory         | [v1.2.0.2](https://github.com/mosip/artifactory-ref-impl/tree/v1.2.0.2)          |
| IDA                 | [v1.2.1.0](https://github.com/mosip/id-authentication/tree/v1.2.1.0)             |
| eSignet             | [v1.4.1](https://github.com/mosip/esignet/tree/v1.4.1)                           |
| Reg Proc            | [v1.2.0.1](https://github.com/mosip/registration/tree/v1.2.0.1)                  |
| Notifier (Kernel)   | [v1.2.0.1](https://github.com/mosip/commons/tree/v1.2.0.1/kernel)                |
| Audit manager       | [v1.2.0.1](https://github.com/mosip/audit-manager/tree/v1.2.0.1)                 |
| ID Repo             | [v1.2.1.0](https://github.com/mosip/id-repository/tree/v1.2.1.0)                 |
| datashare           | [v1.2.0.1](https://github.com/mosip/durian/tree/v1.2.0.1)                        |
| Keycloak            | [v1.2.0.1](https://github.com/mosip/keycloak/tree/v1.2.0.1)                      |
| config-server       | [v1.1.2](https://github.com/mosip/mosip-config/tree/v1.1.2)                      |
| Websub              | [v1.2.0.1](https://github.com/mosip/websub/tree/v1.2.0.1)                        |

## Learn More

* [Services](https://github.com/mosip/partner-management-services/tree/master)
* [Partner Management Portal](https://github.com/mosip/partner-management-portal/tree/master): For code and implementation of Partner Management Portal (revamp)
* [Features](https://docs.mosip.io/1.2.0/id-lifecycle-management/support-systems/partner-management-services/overview/features)
* [End User Guides](https://docs.mosip.io/1.2.0/id-lifecycle-management/support-systems/partner-management-services/functional-overview)
* [Technical Guide](https://docs.mosip.io/1.2.0/id-lifecycle-management/support-systems/partner-management-services/develop)
* [QA Report](test-report.md)
