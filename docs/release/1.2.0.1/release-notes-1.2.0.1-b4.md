# 1.2.0.1-B4 (Beta)

## Overview

**Release Name**: 1.2.0.1 Beta4

**Release Version**: 1.2.0.1-B4

**Support**: Developer Release

**Release Date**: 12th January, 2024

The MOSIP **1.2.0.1 Beta4** release marks an upgrade from version 1.1.5.x to 1.2.0.1. This release primarily focuses on the **migration of all services/modules** to V3 architecture along with important bug fixes, enhancements to security, and improvements in performance.

Additionally, this release incorporates enhancements to the existing features in [Mock Services](../../mock-services.md), aiming to enhance the user experience. For a comprehensive summary of the modifications, refer [here](https://mosip.atlassian.net/issues/?jql=labels%20%3D%20%22mock-V1.2.0.1-B4%22).

To know more about the upgrades, refer [Upgrade Runbook](../../upgrade-runbook.md).

## Repository Released

| **Repositories**            | **Tags Released**                                                                    |
| --------------------------- | ------------------------------------------------------------------------------------ |
| bio-utils                   | [v1.2.0.1-B3](https://github.com/mosip/bio-utils/tree/v1.2.0.1-B3)                   |
| commons                     | [v1.2.0.1-B2](https://github.com/mosip/commons/tree/v1.2.0.1-B2)                     |
| mosip-openid-bridge         | [v.1.2.0.1-B3](https://github.com/mosip/mosip-openid-bridge/tree/v1.2.0.1-B3)        |
| biosdk-client               | [v.1.2.0.1-B3](https://github.com/mosip/biosdk-client/tree/v1.2.0.1-B3)              |
| biosdk-services             | [v1.2.0.1-B3](https://github.com/mosip/biosdk-services/tree/v1.2.0.1-B3)             |
| audit-manager               | [v1.2.0.1-B2](https://github.com/mosip/audit-manager/tree/v1.2.0.1-B2)               |
| keymanager                  | [v1.2.0.1-B3](https://github.com/mosip/keymanager/tree/v1.2.0.1-B3)                  |
| khazana                     | [v1.2.0.1-B2](https://github.com/mosip/khazana/tree/v1.2.0.1-B2)                     |
| packet-manager              | [v1.2.0.1-B2](https://github.com/mosip/packet-manager/tree/v1.2.0.1-B2)              |
| admin-services              | [v1.2.0.1-B2](https://github.com/mosip/admin-services/tree/v1.2.0.1-B2)              |
| id-repository               | [v1.2.0.1-B2](https://github.com/mosip/id-repository/tree/v1.2.0.1-B2)               |
| pre-registration            | [v1.2.0.1-B2](https://github.com/mosip/pre-registration/tree/v1.2.0.1-B2)            |
| id-authentication           | [v1.2.0.1-B5](https://github.com/mosip/id-authentication/tree/v1.2.0.1-B5)           |
| registration                | [v1.2.0.1-B3](https://github.com/mosip/registration/tree/v1.2.0.1-B3)                |
| resident-services           | [v1.2.0.1-B3](https://github.com/mosip/resident-services/tree/v1.2.0.1-B3)           |
| registration-client         | [v1.2.0.1-B2](https://github.com/mosip/registration-client/tree/v1.2.0.1-B2)         |
| partner-management-services | [v1.2.0.1-B4](https://github.com/mosip/partner-management-services/tree/v1.2.0.1-B4) |
| print                       | [v1.2.0.1-B2](https://github.com/mosip/print/tree/v1.2.0.1-B2)                       |
| websub                      | [1.2.0.1-B2](https://github.com/mosip/websub/tree/v1.2.0.1-B2)                       |
| durian                      | [v1.2.0.1-B2](https://github.com/mosip/durian/tree/v1.2.0.1-B2)                      |
| mosip-config                | [v1.2.0.1-B4](https://github.com/mosip/mosip-config/tree/v1.2.0.1-B4)                |
| mosip-mock-services         | [v1.2.0.1-B4](https://github.com/mosip/mosip-mock-services/tree/v1.2.0.1-B4)         |
| migration-utility           | [v1.2.0.1-B2](https://github.com/mosip/migration-utility/tree/v1.2.0.1-B2)           |
| mosip-functional-tests      | [v1.2.0.1-B3](https://github.com/mosip/mosip-functional-tests/tree/v1.2.0.1-B3)      |
| converters                  | [v1.2.0.1-B2](https://github.com/mosip/converters/tree/v1.2.0.1-B2)                  |
| keycloak                    | [v1.2.0.1-B3](https://github.com/mosip/keycloak/tree/v1.2.0.1-B3)                    |
| reporting                   | [v1.2.0.1-B2](https://github.com/mosip/reporting/tree/v1.2.0.1-B2)                   |
| mosip-ref-impl              | [v1.2.0.1-B3](https://github.com/mosip/mosip-ref-impl/tree/v1.2.0.1-B3)              |
| artifactory-ref-impl        | [v1.2.0.1-B7](https://github.com/mosip/artifactory-ref-impl/tree/v1.2.0.1-B7)        |
| mosip/mock-smtp-sms         | [v0.0.2](https://github.com/mosip/mock-smtp-sms/tree/v0.0.2)                         |
| mosip-helm                  | [v1.2.0.1-B4](https://github.com/mosip/mosip-helm/tree/v1.2.0.1-B4)                  |
| mosip-infra                 | [v1.2.0.1-B4](https://github.com/mosip/mosip-infra/tree/v1.2.0.1-B4)                 |
| K8s-infra                   | [v1.2.0.1-B4](https://github.com/mosip/k8s-infra/tree/v1.2.0.1-B4)                   |

## Documentation

* For complete documentation, refer to [1.2.0 LTS documentation](https://docs.mosip.io/1.2.0/).
* To read though the Test Reports, refer [here](https://docs.mosip.io/1.2.0/releases/release-notes-1.2.0.1-b3/test-report-1.2.0.1-b3).
* Deployment documentation and scripts have been enhanced and are compliant with V3 architecture.
* Developer documentation has been included for all repositories to facilitate the setup process on developers' local systems.
