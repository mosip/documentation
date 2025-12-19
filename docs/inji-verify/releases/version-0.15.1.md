# Version 0.15.1

**Release Name**: Inji Verify v0.15.1

**Support**: Patch Release

**Release Date**: 4th Nov, 2025

### Overview

This patch release for Inji Verify 0.15.1 addresses critical version alignment issues identified in 0.15.0. By updating key dependencies and SDK versions, this release ensures greater stability, compatibility, and a smoother deployment experience.

### Key Updates

In 0.15.1, the POM dependency and SDK versions have been aligned and updated for improved stability and compatibility.

<table><thead><tr><th width="157.6015625">Component</th><th width="250.62890625">Description</th><th>0.15.1 (Current Release)</th><th>0.15.0 (Previous Release)</th></tr></thead><tbody><tr><td>vc-verifier POM Dependency</td><td>The POM dependency of vc-verifier was <code>1.5.0-SNAPSHOT</code>. In version 0.15.1, the POM dependency version is <code>1.5.0</code>.</td><td>1.5.0</td><td>1.5.0-SNAPSHOT</td></tr><tr><td>Inji Verify SDK Version</td><td>The Inji Verify SDK version was <code>0.15.0-beta.23</code>, which was also true for Inji Verify UI. Now published as <code>0.15.0</code> and consumed by Verify UI.</td><td>0.15.0</td><td>0.15.0-beta.23</td></tr></tbody></table>

### Repositories: Released/Dependent

| Repositories | Tags: Released/Dependent                                             |
| ------------ | -------------------------------------------------------------------- |
| Inji Verify  | [v0.15.1](https://github.com/mosip/inji-verify/releases/tag/v0.15.1) |

### Projects: Released

Inji Verify Repositories Released:

1. inji-verify-service - [https://github.com/mosip/inji-verify/tree/release-0.15.x/verify-service](https://github.com/mosip/inji-verify/tree/release-0.15.x/verify-service)
2. inji-verify-ui (ref implementation) - [https://github.com/mosip/inji-verify/tree/release-0.15.x/verify-ui](https://github.com/mosip/inji-verify/tree/release-0.15.x/verify-ui)
3. SDK - [https://github.com/mosip/inji-verify/tree/release-0.15.x/inji-verify-sdk](https://github.com/mosip/inji-verify/tree/release-0.15.x/inji-verify-sdk)
4. API-Test - [https://github.com/mosip/inji-verify/tree/release-0.15.x/api-test](https://github.com/mosip/inji-verify/tree/release-0.15.x/api-test)

### Compatible modules

The following table outlines the tested and certified compatibility of Inji Verify 0.15.1 with other modules.

| Module              | Version                                                             |
| ------------------- | ------------------------------------------------------------------- |
| Inji Wallet         | [0.20.0](https://github.com/mosip/inji-wallet/releases/tag/v0.20.0) |
| Inji Web            | [0.14.1](https://github.com/mosip/inji-web/releases/tag/v0.14.1)    |
| Pixel-Pass library  | [0.6.0](https://github.com/mosip/pixelpass/releases/tag/v0.6.0)     |
| vc-verifier library | [1.5.0](https://github.com/mosip/vc-verifier/releases/tag/v1.5.0)   |

#### Learn More

Please refer to the list of items covered as part of [0.15.0](version-0.15.0) release.

* [Feature documentation](../overview/features/)
* [API Documentation](https://mosip.stoplight.io/docs/inji-verify/63da8fc2ca609-open-id-4-vp-verifier-api-inji-verify)
* [Collab Guide](../functional-overview/releases-1/inji-verify-collab-guide.md)
