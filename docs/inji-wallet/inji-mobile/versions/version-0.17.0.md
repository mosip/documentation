# Version 0.17.0

**Release Name:** Inji Mobile Wallet 0.17.0  

**Release Type:** Developer  

**Release Date:** 25th July, 2025 

### Overview

This release of Inji Mobile Wallet v0.17.0 introduces multiple improvements, feature completions, and critical bug fixes across iOS and Android platforms. The release focuses on enhancing OpenID4VP cross-device flow and new feature addition for OpenIDVP same-device flow, credential verification, offline sharing stability, UI accessibility, and backwards compatibility.

### Key Highlights

These highlight the most important new features and user-facing improvements introduced in this release:

- Cross-device OpenID4VP support (mDL / mDoc)
- Same-device OpenID4VP support (mDL / mDoc) and W3C JSON-LD VC
- Improved error handling in VC sharing and verification flows
- Crash and UI fixes in credential download and sharing features
- iOS and Kotlin implementations now aligned with OpenIDVP Draft 21 and Draft 23 support
- Secure and user-consent-backed VC sharing with improved selfie validation
- **VC Verifier SDK (ECC K1 – Kotlin):** Kotlin artefact introduced for VC verification using ECC K1 keys, improving compatibility with OpenID ecosystems.
- **[Enhancement - PixelPass] Kotlin Multi-Platform (KMP) Support:** Enables QR code generation using PixelPass across Android and iOS with a shared Kotlin module.
- **WLA Login via Deep Link on iOS:** Allows users on the same mobile device to tap on a QR code and launch Inji Wallet directly, supporting seamless same-device login via deep linking.
- **Display Profile Image Only if Face is Present:** Enhances user experience by showing the profile image only when the VC includes a valid biometric (face/photo), avoiding empty or placeholder images.

### Technical Improvements

These represent backend, SDK, library-level, and protocol support enhancements to improve system performance, compatibility, and interoperability.

- **Wallet Metadata Support [Kotlin]:** Wallet now responds with metadata during request_uri POST call, including supported algorithms, endpoints, and response types, improving OpenID4VP interoperability.
- **Enhancement for OpenIDVP Proof Verification**  
  Addressed issues in vp_token creation, including:
  - Empty holder field
  - Improper UUID usage in ID
  - Addition of canonicalization
- **Support for direct_post.jwt (Kotlin & Swift):** Both Android and iOS wallets now support JWT-based direct post in line with the OpenID VP spec.
- **Enhance VCI Client Library for W3C VC Data Model 1.1:** Added support for broader claims structure in line with VC Data Model 1.1, enabling more diverse credential types.
- **Increased Test Coverage for PixelPass Module (>80%):** Improves quality and stability of the QR generation logic, with extensive test coverage across supported scenarios.

### Features Released

|List of New Features |Jira Link |
|--------|-----------|
| Same Device Flow - OpenIDVP [Swift] | [INJIMOB-3190](https://mosip.atlassian.net/browse/INJIMOB-3190) |
| Same Device Flow - OpenIDVP [Kotlin] | [INJIMOB-3154](https://mosip.atlassian.net/browse/INJIMOB-3154) |
| mDoc OpenIDVP Support - Cross Device Flow [Kotlin] | [INJIMOB-3153](https://mosip.atlassian.net/browse/INJIMOB-3153) |
| mDoc OpenIDVP Support - Cross Device Flow [Swift] | [INJIMOB-3015](https://mosip.atlassian.net/browse/INJIMOB-3015) |
| Implement Draft 23 Changes for Verifiable Presentations [Kotlin] | [INJIMOB-3083](https://mosip.atlassian.net/browse/INJIMOB-3083) |
| Implement Draft 23 Changes for Verifiable Presentations [Swift] | [INJIMOB-2810](https://mosip.atlassian.net/browse/INJIMOB-2810) |
| OpenIDVP Backward Compatibility with Draft 21 [Swift] | [INJIMOB-3234](https://mosip.atlassian.net/browse/INJIMOB-3234) |
| OpenIDVP Backward Compatibility with Draft 21 [Kotlin] | [INJIMOB-3233](https://mosip.atlassian.net/browse/INJIMOB-3233) |
| QR Code Generation via PixelPass using Kotlin Multi-Platform | [INJIMOB-2633](https://mosip.atlassian.net/browse/INJIMOB-2633) |
| Verification Support: VC Verifier SDK (ECC key - ECC K1)- Kotlin artefact | [INJIMOB-1699](https://mosip.atlassian.net/browse/INJIMOB-1699) |

### Repository Released

| Module | Version |
|--------|---------|
| inji-wallet | [0.17.0](https://github.com/mosip/inji-wallet/tree/v0.17.0) |
| inji-openid4vp-ios-swift | [0.3.0](https://github.com/mosip/inji-openid4vp-ios-swift/tree/v0.3.0) |
| inji-openid4vp | [0.3.0](https://github.com/mosip/inji-openid4vp/tree/v0.3.0) |
| pixelpass | [0.7.0](https://github.com/mosip/pixelpass/tree/v0.7.0) |
| pixelpass-ios-swift | [0.6.2](https://github.com/mosip/pixelpass-ios-swift/tree/v0.6.2) |
| inji-vci-client | [0.3.0](https://github.com/mosip/inji-vci-client/tree/v0.3.0) |
| inji-vci-client-ios-swift | [0.3.0](https://github.com/mosip/inji-vci-client-ios-swift/tree/v0.3.0) |

### Compatible Modules

| Module | Version |
|--------|---------|
| mimoto | [0.17.1](https://github.com/mosip/mimoto/tree/v0.17.1) |
| inji-config | [0.8.0](https://github.com/mosip/inji-config/tree/v0.8.0) |
| Inji Certify | [0.11.0](https://github.com/mosip/inji-certify/tree/v0.11.0) |
| esignet | [1.5.1](https://github.com/mosip/esignet/tree/v1.5.1) |
| Inji Verify | [v0.12.3](https://github.com/mosip/inji-verify/tree/v0.12.3) |
| vc-verifier | [1.3.0](https://github.com/mosip/vc-verifier/tree/v1.3.0) |

### Known Issues

Below is the list of known issues. To read in detail, [click here](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?jql=project%20%3D%20%22INJIMOB%22%20AND%20type%20%3D%20Bug%20AND%20status%20IN%20%28New%2C%20Assigned%29%20ORDER%20BY%20created%20DESC)

| Jira Issue | Issue Description |
|------------|-------------------|
| [INJIMOB-3391](https://mosip.atlassian.net/browse/INJIMOB-3391) | New Wallet Nonce has to be created for each transaction. |
| [INJIMOB-3288](https://mosip.atlassian.net/browse/INJIMOB-3288) | VCVerifier – `credentialStatus_Type` is empty; expected error is not valid. |
| [INJIMOB-3285](https://mosip.atlassian.net/browse/INJIMOB-3285) | VCVerifier – `credentialStatus_ID` is empty; expected error is not valid. |
| [INJIMOB-3276](https://mosip.atlassian.net/browse/INJIMOB-3276) | VCVerifier – Optional field `Evidence_ID` is empty; expected error is not valid. |
| [INJIMOB-3274](https://mosip.atlassian.net/browse/INJIMOB-3274) | Setup error screen does not display 'Proceed' CTA when setup is incomplete – only 'OK' is shown. |
| [INJIMOB-3273](https://mosip.atlassian.net/browse/INJIMOB-3273) | Redirect not working in Firefox browser on iOS. |
| [INJIMOB-3272](https://mosip.atlassian.net/browse/INJIMOB-3272) | After claim sharing, user is not redirected to health portal on iOS. |
| [INJIMOB-3270](https://mosip.atlassian.net/browse/INJIMOB-3270) | Four negative test cases of wallet_binding fail due to IDA-MLC-009 – Invalid Input Parameter. |
| [INJIMOB-3262](https://mosip.atlassian.net/browse/INJIMOB-3262) | App crashes intermittently when user flips the camera during QR scan. |
| [INJIMOB-3254](https://mosip.atlassian.net/browse/INJIMOB-3254) | IDA UIN (created via automation) VC download fails with IDA-BIA-006 error. |
| [INJIMOB-3213](https://mosip.atlassian.net/browse/INJIMOB-3213) | App crashes when flip camera button is pressed on scan screen. |
| [INJIMOB-3125](https://mosip.atlassian.net/browse/INJIMOB-3125) | Sharing the MOSIP VC takes longer than expected. |
| [INJIMOB-2976](https://mosip.atlassian.net/browse/INJIMOB-2976) | Intro slider overlaps with Backup & Restore page content. |
| [INJIMOB-2951](https://mosip.atlassian.net/browse/INJIMOB-2951) | Intro slider alignment is incorrect on low-end devices. |
| [INJIMOB-2944](https://mosip.atlassian.net/browse/INJIMOB-2944) | Unable to download mDL VC – 'Error Occurred' screen shown. |
| [INJIMOB-2771](https://mosip.atlassian.net/browse/INJIMOB-2771) | Intermittent failure in downloading mDL VC. |



### Bug Fixes

Below is the list of fixes as part of the [0.17.0](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?filter=allissues&jql=project%20%3D%20%22INJIMOB%22%20AND%20labels%20%3D%20qa-inji_mob_release0170_closed%20ORDER%20BY%20created%20DESC) release: 

| Jira Issue | Description |
|-----------|-------------|
| [INJIMOB-3370](https://mosip.atlassian.net/browse/INJIMOB-3370) | iOS - Application crashes when consent is declined and user clicks 'Yes, Proceed'. |
| [INJIMOB-3217](https://mosip.atlassian.net/browse/INJIMOB-3217) | App crashes during OVP QR code scan if only pre-registered client ID scheme is configured in wallet metadata. |
| [INJIMOB-3212](https://mosip.atlassian.net/browse/INJIMOB-3212) | In OVP flow, 'Share with Self' button disabled when photo is present in VC, while 'Share' is enabled. |
| [INJIMOB-3155](https://mosip.atlassian.net/browse/INJIMOB-3155) | Invalid VC gets downloaded if the well-known URL is incorrectly updated. |
| [INJIMOB-3139](https://mosip.atlassian.net/browse/INJIMOB-3139) | 'publicKeyId' empty for DID scheme still allows VC sharing in iOS, expected error missing. |
| [INJIMOB-3138](https://mosip.atlassian.net/browse/INJIMOB-3138) | Removing well-known endpoint causes issuer VCs to remain stuck in loading state. |
| [INJIMOB-3129](https://mosip.atlassian.net/browse/INJIMOB-3129) | Consent Required screen breaks when `client_id` is too long. |
| [INJIMOB-3126](https://mosip.atlassian.net/browse/INJIMOB-3126) | App crashes when sharing VC using 'Share with Selfie' option. |
| [INJIMOB-3124](https://mosip.atlassian.net/browse/INJIMOB-3124) | iOS: QR code shows invalid when `authorization_encrypted_response_alg` is empty (works in Android). |
| [INJIMOB-3102](https://mosip.atlassian.net/browse/INJIMOB-3102) | DID web URL parsing issue. |
| [INJIMOB-3080](https://mosip.atlassian.net/browse/INJIMOB-3080) | Help page link leads to 'Page Not Found' error. |
| [INJIMOB-3056](https://mosip.atlassian.net/browse/INJIMOB-3056) | Display property for claims is optional and not handled properly. |
| [INJIMOB-3055](https://mosip.atlassian.net/browse/INJIMOB-3055) | VC verification failing due to incorrect data encoding. |
| [INJIMOB-3054](https://mosip.atlassian.net/browse/INJIMOB-3054) | Downloaded VC files getting removed automatically intermittently. |
| [INJIMOB-3027](https://mosip.atlassian.net/browse/INJIMOB-3027) | Display property in credential type is optional and not rendered correctly. |
| [INJIMOB-2977](https://mosip.atlassian.net/browse/INJIMOB-2977) | Kannada/Tamil language: Intro slider heading gets cut off. |
| [INJIMOB-2974](https://mosip.atlassian.net/browse/INJIMOB-2974) | Kannada/Tamil language: Intro slider content is missing. |
| [INJIMOB-2877](https://mosip.atlassian.net/browse/INJIMOB-2877) | Invalid biometric input doesn't immediately show passcode fallback (appears after 3rd attempt). |
| [INJIMOB-2845](https://mosip.atlassian.net/browse/INJIMOB-2845) | iOS: QR still scannable even when invalid response URL exists in `mimoto-trusted-verifiers.json`. |
| [INJIMOB-2821](https://mosip.atlassian.net/browse/INJIMOB-2821) | QR scan succeeds even after removing ClientID from `app.json`. |
| [INJIMOB-2776](https://mosip.atlassian.net/browse/INJIMOB-2776) | Clicking 'Download StayProtected Insurance' intermittently redirects to issuer homepage. |
| [INJIMOB-2775](https://mosip.atlassian.net/browse/INJIMOB-2775) | StayProtected / Health Insurance downloads intermittently show 'An error occurred' screen. |
| [INJIMOB-2575](https://mosip.atlassian.net/browse/INJIMOB-2575) | VC activity logs not updating when viewed from 'View Activity Log'. |
| [INJIMOB-2404](https://mosip.atlassian.net/browse/INJIMOB-2404) | iOS: Online login failing with technical error. |


### Deprecated

N/A

### Documentation

- [Feature Documentation](https://docs.inji.io/inji-wallet/inji-mobile/overview/features)
- [Integration Guides](https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide)
- [User Guide](https://docs.inji.io/inji-wallet/inji-mobile/functional-overview/end-user-guide)
- QA Report
- [API Documentation](https://mosip.stoplight.io/docs/mimoto/k6907m3dzc1gi-mimoto)


