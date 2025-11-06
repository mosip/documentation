# Version 0.15.1

**Release Name**: Inji Verify v0.15.1

**Support**: Patch Release

**Release Date**: 4th Nov, 2025

### Overview

This patch release for Inji Verify 0.15.1 addresses critical version alignment issues identified in 0.15.0. By updating key dependencies and SDK versions, this release ensures greater stability, compatibility, and a smoother deployment experience.

### Key Updates

In 0.15.1, the POM dependency and SDK versions have been aligned and updated for improved stability and compatibility.

| Component                  | Description                                                                                                      | 0.15.1 (Current Release) | 0.15.0 (Previous Release) |
|----------------------------|------------------------------------------------------------------------------------------------------------------|--------------------------|--------------------------|
| vc-verifier POM Dependency | The POM dependency of vc-verifier was `1.5.0-SNAPSHOT`. In version 0.15.1, the POM dependency version is `1.5.0`. | 1.5.0                    | 1.5.0-SNAPSHOT           |
| Inji Verify SDK Version    | The Inji Verify SDK version was `0.15.0-beta.23`, which was also true for Inji Verify UI. Now published as `0.15.0` and consumed by Verify UI. | 0.15.0                   | 0.15.0-beta.23           |


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
| Inji Web            | [0.14.0](https://github.com/mosip/inji-web/releases/tag/v0.14.1)    |
| Pixel-Pass library  | [0.6.0](https://github.com/mosip/pixelpass/releases/tag/v0.6.0)     |
| vc-verifier library | [1.5.0](https://github.com/mosip/vc-verifier/releases/tag/v1.5.0)   |

#### Learn More

Please refer to the list of items covered as part of [0.15.0](../releases/version-0.15.0/README.md) release.

* [Feature documentation](../overview/features.md)
* [API Documentation](https://mosip.stoplight.io/studio/inji-verify)
* [Collab Guide](../../functional-overview/releases-1/inji-verify-collab-guide.md)