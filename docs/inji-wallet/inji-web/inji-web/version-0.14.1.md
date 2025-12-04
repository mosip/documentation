# Version 0.14.1

**Release Name:** Inji Web Wallet 0.14.1

**Release Type:** Patch

**Release Date:** 25th Sept, 2025

### Overview

This patch release of Inji Web v0.14.1 focuses on **infrastructure alignment and security hardening**. The primary update replaces all references to **Bitnami-hosted Postgres and Redis images** in both **Mimoto** and **Inji Web repositories** with equivalent images hosted in the **mosip-int image repository**.

The update ensures better control, consistency, and reliability of deployments by removing external dependencies. As part of this patch, Helm charts, Kubernetes manifests, shell/deployment scripts, and CI/CD workflows were updated to reference mosip-int hosted images. The deployment has been validated end-to-end in **Dev** and **QA environments**, and deployment documentation has been updated accordingly.

### Key Highlights

#### Technical Enhancements

* **Image Migration:** Replaced Bitnami-hosted Postgres and Redis images with mosip-int equivalents across both Mimoto and Inji Web repositories.
* **Deployment Consistency:** Updated Helm charts, Kubernetes manifests, shell/deployment scripts, and CI/CD pipelines to ensure all services now pull images from mosip-int.

### Features Released <a href="#features-released" id="features-released"></a>

This patch is focused solely on infrastructure image updates. No new features are included in this release.

### Repositories Released

| Module       | Version                                                  |
| ------------ | -------------------------------------------------------- |
| **inji-web** | [0.14.1](https://github.com/mosip/inji-web/tree/v0.14.1) |
| **mimoto**   | [0.19.1](https://github.com/mosip/mimoto/tree/v0.19.1)   |

### Compatible Modules

| Module       | Version                                                                   |
| ------------ | ------------------------------------------------------------------------- |
| inji-certify | [0.12.1](https://github.com/mosip/inji-certify/releases/tag/v0.12.1)      |
| inji-verify  | [v0.13.1](https://github.com/mosip/inji-verify/releases/tag/v0.13.1)      |
| eSignet      | [1.6.2](https://github.com/mosip/esignet/releases/tag/v1.6.2)             |
| Durian       | [1.3.0-beta.2](https://github.com/mosip/durian/releases/tag/1.3.0-beta.2) |
| vc verifier  | [1.4.0](https://github.com/mosip/vc-verifier/tree/v1.4.0)                 |
| inji-config  | [0.11.0](https://github.com/mosip/inji-config/tree/v0.11.0)               |

### Known Issues <a href="#known-open-bugs" id="known-open-bugs"></a>

The list of all known issues can be found [here](https://mosip.atlassian.net/issues/?jql=project%3D%22Inji%20Web%22%20and%20type%20in%20%28bug%29%20and%20status%20not%20in%20%28closed%2C%20canceled%29%20order%20by%20created%20DESC).

### Bug Fixes

This patch is focused solely on infrastructure image updates. No new bug fixes are included in this release.

### Release Documentation <a href="#release-documentation" id="release-documentation"></a>

This patch is focused solely on infrastructure image updates. No new documentation added for this release.

### Additional Resources <a href="#additional-resources" id="additional-resources"></a>

* [Feature Documentation](https://docs.inji.io/inji-wallet/inji-web/overview/features) - Contains detailed explanations of all available features of Inji Web Waller and its usage.
* [Backend Services ](https://docs.inji.io/inji-wallet/inji-web/technical-overview/backend-services)- Provides detailed instructions to set up the backend for the Inji Web Wallet.
* [End User Guide](https://docs.inji.io/inji-wallet/inji-web/functional-overview/end-user-guide) - Offers end-to-end guidance for end users on setup and daily usage.
* [API Documentation](https://docs.mosip.io/inji/inji-web/technical-overview/backend-services/mimoto-bff) - Includes comprehensive details of all APIs, endpoints, request/response formats, and examples.

\\
