# Version 0.19.0

**Release Name:** Inji Mobile Wallet 0.19.0

**Release Type:** Developer

**Release Date:** 8th Sept, 2025

### Overview

This release of **Inji Mobile Wallet v0.19.0** strengthens support for **SD-JWT Verifiable Credentials (VCs)** and enhances the VC issuance and verification experience across Android and iOS.

Key highlights include **SD-JWT issuance and disclosure flows**, updates to the **VC Verifier Library**, support for **x509 certificates in SD-JWT**, and improvements in handling credential formats such as **mso\_mdoc, LDP VC, and MDL VCs**.

This release also delivers important **bug fixes** and updates to improve **stability, error handling, and multi-language support**.

### Key Highlights

#### **New Feature Addition**

#### SD-JWT VC Format Support

* Constructed **SD-JWT VC Issuance Payloads** in VCI Client Library (Kotlin & Swift).
* Added **SD-JWT Validation and Disclosure Display** after verification.
* Integrated **SD-JWT VC Verification** into the VC Verifier Library.
* **Note (⚠️ Warning):** On iOS, signature verification is not yet supported for **mso\_mdoc** and **SD-JWT** formats. For **LDP VC**, only the **RSA key suite** is supported (ECC and ED25519 are not yet supported).
* Refer to the feature description to know more about this feature

#### **Technical Enhancements**

#### VC Verifier Library Enhancements

* **SD-JWT VC**: Support added for **x509 certificate chains** as per [IETF draft section 3.5-3.2.1](https://www.ietf.org/archive/id/draft-ietf-oauth-sd-jwt-vc-10.html?utm_source=chatgpt.com#section-3.5-3.2.1).
* Improved parsing of JSON payloads in **OVP sharing flows** with multi-language support (including Arabic).
* Refer to the library **ReadMe** to know more about these enhancements.

#### **Minor Updates to the existing feature**

#### Credential Handling

* Updates to the **LDP VC(JSON-LD) display property** to ensure metadata is refreshed from the database.
* Improved error handling for **VC activation and downloads** (MOSIP VCs, Mock VCs, MDL VCs).
* Fixed the BLE rendering issue for VCs shared without internet connectivity.

### Features

| Type                                                  | Feature / Enhancement                               | Jira Link                                                                              |
| ----------------------------------------------------- | --------------------------------------------------- | -------------------------------------------------------------------------------------- |
| Technical addtion  in Library for new feature support | SD-JWT VC Validation                                | [INJIMOB-3412](https://mosip.atlassian.net/browse/INJIMOB-3412?utm_source=chatgpt.com) |
| Functional addtion in Wallet UI                       | Display SD-JWT Disclosures After Verification       | [INJIMOB-3366](https://mosip.atlassian.net/browse/INJIMOB-3366?utm_source=chatgpt.com) |
| Technical addtion  in Library for new feature support | SD-JWT VC Verification in VC Verifier Library       | [INJIMOB-3365](https://mosip.atlassian.net/browse/INJIMOB-3365?utm_source=chatgpt.com) |
| Technical addtion  in Library for new feature support | Construct SD-JWT VC Issuance Payload — Kotlin       | [INJIMOB-3205](https://mosip.atlassian.net/browse/INJIMOB-3205?utm_source=chatgpt.com) |
| Technical addtion  in Library for new feature support | Construct SD-JWT VC Issuance Payload — Swift        | [INJIMOB-3394](https://mosip.atlassian.net/browse/INJIMOB-3394?utm_source=chatgpt.com) |
| Technical addtion  in Library for new feature support | OVP sharing payload parsing for Arabic language VCs | [INJIMOB-3367](https://mosip.atlassian.net/browse/INJIMOB-3367?utm_source=chatgpt.com) |

### Repositories Released

| Module                    | Version |
| ------------------------- | ------- |
| inji-wallet               | 0.19.0  |
| inji-openid4vp-ios-swift  | 0.5.0   |
| inji-openid4vp            | 0.5.0   |
| inji-vci-client           | 0.5.0   |
| inji-vci-client-ios-swift | 0.5.0   |
| pixelpass-ios-swift       | 0.6.X   |

### Compatible Modules

| Module       | Version |
| ------------ | ------- |
| mimoto       | 0.19.X  |
| inji-config  | 0.10.X  |
| Inji Certify | 0.12.X  |
| Inji Verify  | 0.14.X  |
| eSignet      | 1.6.X   |
| vc-verifier  | 1.4.X   |

### Known Issues

| Jira Issue                                                      | Description                                                       |
| --------------------------------------------------------------- | ----------------------------------------------------------------- |
| I[NJIMOB-3526](https://mosip.atlassian.net/browse/INJIMOB-3526) | VC Verifier – SD-JWT without signature does not return errorCode. |
| [INJIMOB-3525](https://mosip.atlassian.net/browse/INJIMOB-3525) | Enhancement to download nested VCs – nested symbol not proper.    |
| [INJIMOB-3515](https://mosip.atlassian.net/browse/INJIMOB-3515) | Information popup page is lengthy and needs UI improvement.       |

### Bug Fixes

| Jira Issue                                                                             | Description                                                       |
| -------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| [INJIMOB-3512](https://mosip.atlassian.net/browse/INJIMOB-3512)                        | Unable to download MOSIP VC; error screen “Something went wrong”. |
| [INJIMOB-3504](https://mosip.atlassian.net/browse/INJIMOB-3504?utm_source=chatgpt.com) | LDP VC display property not updated until storage cleared.        |
| [INJIMOB-3394](https://mosip.atlassian.net/browse/INJIMOB-3394?utm_source=chatgpt.com) | Unable to download Mock VC; error “Something went wrong”.         |
| [INJIMOB-3179](https://mosip.atlassian.net/browse/INJIMOB-3179)                        | Unable to activate VC due to technical error message.             |
| [INJIMOB-2944](https://mosip.atlassian.net/browse/INJIMOB-2944?utm_source=chatgpt.com) | VC not rendered when shared over BLE without internet.            |
| [INJIMOB-2771](https://mosip.atlassian.net/browse/INJIMOB-2771?utm_source=chatgpt.com) | Intermittent failures in MDL VC download.                         |

### Documentation

* [Feature Documentation](https://docs.inji.io/inji-wallet/inji-mobile/overview/features)
* [Integration Guides](https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide)
* [User Guide](https://docs.inji.io/inji-wallet/inji-mobile/functional-overview/end-user-guide)
* QA Report
* [API Documentation](https://mosip.stoplight.io/docs/mimoto/k6907m3dzc1gi-mimoto)
