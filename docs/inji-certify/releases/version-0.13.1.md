# Version 0.13.1

**Release Version**: v0.13.1

**Release Type:** Developer Release

**Release Date:** 05th December, 2025

### **Overview** <a href="#overview" id="overview"></a>

Inji Certify v0.13.1 release includes an automation bug fix required to support the new features introduced in version 0.13.0.

### **Major Highlights / Features**

* Corrected the certificate path in the automation scripts to ensure the appropriate certificates are used for generating biometric data during prerequisite creation for MOSIP ID use cases.

### Bug Fixes <a href="#bug-fixes" id="bug-fixes"></a>

| JIRA                                                              | Description                                        |
| ----------------------------------------------------------------- | -------------------------------------------------- |
| [INJICERT-1279](https://mosip.atlassian.net/browse/INJICERT-1279) | Authenticate user API failing with test automation |

### Repository Released <a href="#repository-released" id="repository-released"></a>

| Repository   | Version |
| ------------ | ------- |
| inji-certify | v0.13.1 |

### Known Issues <a href="#known-issues" id="known-issues"></a>

Below is the list of known issue(s) related to the release v0.13.1.&#x20;

|  [INJICERT-43526](https://mosip.atlassian.net/browse/MOSIP-43526) |  Hardcoded domain in IDA automation script |
| ----------------------------------------------------------------- | ------------------------------------------ |

### Compatible Modules <a href="#compatible-modules" id="compatible-modules"></a>

| Repositories          | Version                                                                         |
| --------------------- | ------------------------------------------------------------------------------- |
| eSignet               | [v1.6.2](https://github.com/mosip/esignet/tree/v1.6.2)                          |
| IDA                   | [1.2.1.0](https://github.com/mosip/id-authentication/tree/v1.2.1.0)             |
| Sunbird C             | [v2.0.0](https://github.com/Sunbird-RC/sunbird-rc-core/releases/tag/v2.0.0-rc3) |
| esigent-mock-services | [v0.11.2](https://github.com/mosip/esignet-mock-services/tree/v0.11.2)          |
| commons               | [v1.3.0-beta.3](https://github.com/mosip/commons/tree/v1.3.0-beta.3)            |
| key manager           | [v1.3.0-beta.5](https://github.com/mosip/keymanager/tree/v1.3.0-beta.5)         |
| mimoto                | [v0.18.1](https://github.com/mosip/mimoto/tree/v0.18.1)                         |
| inji-web              | [v0.13.1](https://github.com/mosip/inji-web/tree/v0.13.1)                       |

### Documentation <a href="#documentation" id="documentation"></a>

* [Feature Documentation](https://docs.mosip.io/inji/inji-certify/functional-overview/features)
* [Local Setup](https://docs.mosip.io/inji/inji-certify/build-and-deploy/local-setup)
* [API Documentation](https://mosip.stoplight.io/docs/inji-certify/25f435617408e-inji-certify)
* [Test Report](https://github.com/mosip/test-management/tree/master/inji-certify/0.13.1)
