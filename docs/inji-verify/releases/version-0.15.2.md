# Version 0.15.2

**Release Name**: Inji Verify v0.15.2

**Support**: Patch Release

**Release Date**: 4th December, 2025

### Overview

The Inji Verify 0.15.2 patch release includes critical fixes to ensure reliable testing and smooth deployment. This update resolves the expiry issue with non-dynamic QR codes in the UI test rig and addresses gaps in the API Automation smoke tests such that all test cases execute and pass as expected.

### Key Updates

* **Expiry of Non-Dynamic QR Codes in INJI-Verify UI Test Rig**:
  * An issue was identified in the INJI-Verify UI test rig, where non-dynamic QR codes intended to remain static for testing purposes were expiring after a certain duration. This behaviour caused interruptions in automated test flows and inconsistencies during repeated verification scenarios.
  * **Fix made:** In this release, the expiry logic for non-dynamic QR codes has been corrected to ensure they remain valid for the entire testing lifecycle, enabling stable, repeatable, and reliable UI test executions.
* **API Automation v0.15.1 | Smoke Test Results and Fix:**
  * During the execution of the 0.15.1 API Automation smoke test suite, no failures were observed. The expected outcome is for all test cases to execute and pass without any skips. The skipped tests indicate underlying issues that require attention. The results showed: T-12, P-8, S-4, F-0.
    * T (Total): 12 test cases executed
    * P (Passed): 8 test cases completed successfully
    * S (Skipped): 4 test cases skipped due to configuration or dependency gaps
    * F (Failed): 0 failures recorded
  * **Fix made:** As part of this release, we have now fixed these gaps to ensure that all smoke tests run as intended and achieve a 100% pass rate in subsequent executions.

### Repositories: Released/Dependent

| Repositories | Tags: Released/Dependent                                             |
| ------------ | -------------------------------------------------------------------- |
| Inji Verify  | [v0.15.2](https://github.com/mosip/inji-verify/releases/tag/v0.15.2) |

### Projects: Released

Inji Verify Repositories Released:

1. API-Test - [https://github.com/mosip/inji-verify/tree/release-0.15.x/api-test](https://github.com/mosip/inji-verify/tree/release-0.15.x/api-test)

### Compatible modules

The following table outlines the tested and certified compatibility of Inji Verify 0.15.2 with other modules.

| Module              | Version                                                             |
| ------------------- | ------------------------------------------------------------------- |
| Inji Wallet         | [0.20.0](https://github.com/mosip/inji-wallet/releases/tag/v0.20.0) |
| Inji Web            | [0.14.1](https://github.com/mosip/inji-web/releases/tag/v0.14.1)    |
| Pixel-Pass library  | [0.6.0](https://github.com/mosip/pixelpass/releases/tag/v0.6.0)     |
| vc-verifier library | [1.5.0](https://github.com/mosip/vc-verifier/releases/tag/v1.5.0)   |

#### Learn More

Please refer to the list of items covered as part of [0.15.0](https://docs.inji.io/inji-verify/releases/version-0.15.0) and [0.15.1](https://docs.inji.io/inji-verify/releases/version-0.15.1) release.

* [Feature documentation](../overview/features/)
* [API Documentation](https://mosip.stoplight.io/docs/inji-verify/63da8fc2ca609-open-id-4-vp-verifier-api-inji-verify)
* [Collab Guide](../functional-overview/releases-1/inji-verify-collab-guide.md)
