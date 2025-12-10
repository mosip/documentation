# Version 0.20.0

**Release Name:** Inji Mobile Wallet 0.20.0

**Release Type:** Developer

**Release Date:** 22nd October, 2025

#### Overview

This release of **Inji Mobile Wallet v0.20.0** brings major advancements in **OpenID4VP and SD-JWT interoperability**, expanded **SVG-based credential rendering**, and numerous stability and compliance improvements across both **Android (Kotlin)** and **iOS (Swift)** platforms.

With the inclusion of **SD-JWT OpenID4VP support**, **trusted verifier enhancements**, and **SVG template integration using the inji-vc-renderer library**, the wallet now provides greater flexibility and standards compliance for verifiable credential issuance, storage, and sharing.

This release also includes critical **bug fixes** addressing verification issues, alignment inconsistencies, and multi-language display errors, ensuring a more seamless and reliable user experience.

#### Key Highlights

**New Feature Additions**

* **SD-JWT OpenID4VP Implementation**
  * Added complete SD-JWT VP sharing for both Android (Kotlin) and iOS (Swift) platforms, which allows selective sharing of claims with the verifier.
  * Refer to the library [**docs**](https://github.com/mosip/inji-wallet/blob/master/docs/sdjwt-vp-support.md) folder to know more about this update.
  * Refer to the [**feature description**](../../overview/features/#id-3.-sharing-verifiable-credentials) to know more about this feature
* **SVG Template Rendering Support**
  * Introduced **SVG-based VC rendering** through integration of the `inji-vc-renderer` library in Kotlin and Swift.
  * Refer to the library [**docs** ](https://github.com/mosip/inji-vc-renderer/blob/v0.1.0/kotlin/docs/inji-vc-renderer-flow.md)folder to know more about this update.
  * Refer to the [**feature description**](../../overview/features/#id-4.-svg-based-credential-rendering) to know more about this feature

#### Technical Enhancements

**OpenIDVP and Verifier Enhancements**

* Implemented OpenIDVP compliance with support for signed JWT–based authorization requests.
* Introduced support for `jwks_uri` trusted verifier configurations for dynamic key resolution.
* Added configuration to allow unsigned requests for pre-registered verifiers, useful for local or mock setups.
* Enhanced verifier trust flow by enabling public key resolution using the `did:client-id-scheme` method.
* Improved public key resolution in iOS wallets using the verification method for better interoperability.

#### Features Released

| Type    | Feature / Enhancement / Technical Upgrade  | Jira Link                                                       |
| ------- | ------------------------------------------ | --------------------------------------------------------------- |
| Feature | SD-JWT Support – OpenIDVP Library (Kotlin) | [INJIMOB-3513](https://mosip.atlassian.net/browse/INJIMOB-3513) |
| Feature | SD-JWT Support – OpenIDVP Library (Swift)  | [INJIMOB-3514](https://mosip.atlassian.net/browse/INJIMOB-3514) |
| Feature | UI Implementation – SD-JWT OpenIDVP        | [INJIMOB-3532](https://mosip.atlassian.net/browse/INJIMOB-3532) |
| Feature | SVG Template Rendering Support (Kotlin)    | [INJIMOB-3497](https://mosip.atlassian.net/browse/INJIMOB-3497) |
| Feature | SVG Template Rendering Support (Swift)     | [INJIMOB-3499](https://mosip.atlassian.net/browse/INJIMOB-3499) |

#### Repositories Released

| Module                     | Version                                                                  |
| -------------------------- | ------------------------------------------------------------------------ |
| inji-wallet                | [0.20.0](https://github.com/mosip/inji-wallet/tree/v0.20.0)              |
| inji-vc-renderer           | [0.1.0](https://github.com/mosip/inji-vc-renderer/tree/v0.1.0)           |
| inji-vc-renderer-ios-swift | [0.1.0](https://github.com/mosip/inji-vc-renderer-ios-swift/tree/v0.1.0) |
| inji-vci-client            | [0.6.0](https://github.com/mosip/inji-vci-client/tree/v0.6.0)            |
| inji-vci-client-ios-swift  | [0.6.0](https://github.com/mosip/inji-vci-client-ios-swift/tree/v0.6.0)  |
| inji-openid4vp             | [0.5.0](https://github.com/mosip/inji-openid4vp/tree/v0.5.0)             |
| inji-openid4vp-ios-swift   | [0.5.0](https://github.com/mosip/inji-openid4vp-ios-swift/tree/v0.5.0)   |
| vc-verifier                | [1.5.0](https://github.com/mosip/vc-verifier/tree/v1.5.0)                |
| mimoto                     | [0.19.2](https://github.com/mosip/mimoto/tree/v0.19.2)                   |
| inji-config                | [0.11.1](https://github.com/mosip/inji-config/tree/v0.11.1)              |

#### Compatible Modules

| Module       | Version                                                      |
| ------------ | ------------------------------------------------------------ |
| Inji Certify | [0.12.1](https://github.com/mosip/inji-certify/tree/v0.12.1) |
| Inji Verify  | [0.14.0](https://github.com/mosip/inji-verify/tree/v0.14.0)  |
| eSignet      | [1.6.2](https://github.com/mosip/esignet/tree/v1.6.2)        |

#### Known Issues

Below is the list of key known issues specific to this release. For all known issues, [click here](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?jql=project%20%3D%20%22INJIMOB%22%20AND%20type%20%3D%20Bug%20AND%20status%20IN%20%28New%2C%20Assigned%29%20ORDER%20BY%20created%20DESC).

| Jira Issue                                                     | Description                                                                                  |
| -------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| [INJIMOB-3530](https://your-jira-instance/browse/INJIMOB-3530) | VCVerifer - SD JWT - without leaf cert and public key from x5c, not receiving the errorCode. |
| [INJIMOB-3526](https://your-jira-instance/browse/INJIMOB-3526) | VCVerifer - SD JWT - without signature, not receiving the errorCode.                         |
| [INJIMOB-1530](https://your-jira-instance/browse/INJIMOB-1530) | iOS - "Share QR Code" is not working on iPhone 8.                                            |

#### Bug Fixes

Below is the list of bug fixes as part of the [**0.20.0** ](https://mosip.atlassian.net/issues/?jql=labels%20IN%20%28qa-inji_mob_release020%2C%20qa-inji_mob_release020_closed%29%20AND%20status%20IN%20%28Closed%2C%20Testing%29\&selectedIssue=MOSIP-41315)**release**:

| Jira Issue                                                       | Description                                                                                                                                          |
| ---------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| [MOSIP-41315](https://your-jira-instance/browse/MOSIP-41315)     | INJIMOB UI - While running the UI automation, even after entering a valid OTP, it shows as invalid, causing a few test cases to fail.                |
| [MOSIP-28935](https://your-jira-instance/browse/MOSIP-28935)     | Inji Android - Samsung Galaxy A03 Core is not connecting with Vivo Y73. Resolved issue: MOSIP-28935                                                  |
| [INJIMOB-3591](https://your-jira-instance/browse/INJIMOB-3591)   | Unable to render VC if outer display is missing in well-known. Resolved issue: INJIMOB-3591                                                          |
| [INJIMOB-3590](https://your-jira-instance/browse/INJIMOB-3590)   | INJIMOBIL - After clicking the "+" icon, a "Something went wrong" error screen appears. Resolved issue: INJIMOB-3590                                 |
| [INJIMOB-3584](https://your-jira-instance/browse/INJIMOB-3584)   | INJI-mobile - Unable to scan VP verification QR code with new Inji-mobile LSH build. Resolved issue: INJIMOB-3584                                    |
| [INJIMOB-3567](https://your-jira-instance/browse/INJIMOB-3567)   | SVG - VC with face - not getting 'Share with Selfie' option. Resolved issue: INJIMOB-3567                                                            |
| [INJIMOB-3554](https://your-jira-instance/browse/INJIMOB-3554)   | The same device flow is not working for the preregistered reference QR code; displays 'Request could not be processed'. Resolved issue: INJIMOB-3554 |
| [INJIMOB-3543](https://your-jira-instance/browse/INJIMOB-3543)   | \[Kotlin] Input Descriptor ID from presentation definition is not mapped properly with the presentation submission. Resolved issue: INJIMOB-3543     |
| [INJIMOB-3535](https://your-jira-instance/browse/INJIMOB-3535)   | VCVerifer - SD JWT - errorCode is not proper when invalid iss is shared. Resolved issue: INJIMOB-3535                                                |
| [INJIMOB-3530](https://your-jira-instance/browse/INJIMOB-3530)   | VCVerifer - SD JWT - without leaf cert and public key from x5c not receiving the errorCode. Resolved issue: INJIMOB-3530                             |
| [INJIMOB-3492](https://your-jira-instance/browse/INJIMOB-3492)   | Enhancement: In the mock UI, layout does not fit properly in mobile view; alignment is incorrect. Resolved issue: INJIMOB-3492                       |
| [INJIMOB-3491](https://your-jira-instance/browse/INJIMOB-3491)   | Enhancement: In the mock UI, the copy buttons are displayed inside the response. Resolved issue: INJIMOB-3491                                        |
| [INJIMOB-3490](https://your-jira-instance/browse/INJIMOB-3490)   | Enhancement: Include draft 21 QR code in mock UI along with draft 23 QR code. Resolved issue: INJIMOB-3490                                           |
| [INJIMOB-3453](https://your-jira-instance/browse/INJIMOB-3453)   | When VC activated - log from the history is not proper. Resolved issue: INJIMOB-3453                                                                 |
| [INJIMOB-3385](https://your-jira-instance/browse/INJIMOB-3385)   | Enhancement: OVP sharing payload fails to parse JSON when credentialSubject contains Arabic language VC. Resolved issue: INJIMOB-3385                |
| [INJIMOB-3205](https://your-jira-instance/browse/INJIMOB-3205)   | VC is not getting rendered when shared over BLE without internet. Resolved issue: INJIMOB-3205                                                       |
| [INJIMOB-3143](https://your-jira-instance/browse/INJIMOB-3143)   | INJIMOB - After successfully downloading the MOSIP VC, closing and reopening the app shows a download error. Resolved issue: INJIMOB-3143            |
| [INJIMOB-2998](https://your-jira-instance/browse/INJIMOB-2998)   | INJIMOB - App crashes after sharing collab mock VC when VC receiver clicks out of successful popup. Resolved issue: INJIMOB-2998                     |
| [INJIMOB-2147](https://your-jira-instance/browse/INJIMOB-2147)   | INJIMOB - iOS: After providing correct fingerprint for authentication, access to keys is not granted. Resolved issue: INJIMOB-2147                   |
| [INJIMOB-384](https://your-jira-instance/browse/INJIMOB-384)     | INJI - Downloaded VC is stuck in loading state. Resolved issue: INJIMOB-384                                                                          |
| [INJIMOB-273](https://your-jira-instance/browse/INJIMOB-273)     | Inji - Alignment issue occurring in the APK. Resolved issue: INJIMOB-273                                                                             |
| [INJICERT-1131](https://your-jira-instance/browse/INJICERT-1131) | Unable to download the Mock VC and land. Error message: 'Something went wrong. Please try again.' Resolved issue: INJICERT-1131                      |

#### Release Documentation <a href="#release-documentation" id="release-documentation"></a>

* [Feature Documentation](../../overview/features/#id-3.-sharing-verifiable-credentials)
* [QA Report](test-report.md)

#### Additional Resources <a href="#additional-resources" id="additional-resources"></a>

* [Feature Documentation](https://docs.inji.io/inji-wallet/inji-mobile/overview/features) - Contains detailed explanations of all available features of Inji Mobile Waller and its usage.
* [Integration Guides](https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide) - Provides step-by-step instructions to integrate Inji Mobile Wallet with an external system.
* [End User Guide ](https://docs.inji.io/inji-wallet/inji-mobile/functional-overview/end-user-guide)- Offers end-to-end guidance for end users on setup and daily usage.
* [API Documentation](https://mosip.stoplight.io/docs/mimoto/k6907m3dzc1gi-mimoto) - Includes comprehensive details of all APIs, endpoints, request/response formats, and examples.
