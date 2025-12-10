# Version 0.19.0

**Release Name:** Inji Mobile Wallet 0.19.0

**Release Type:** Developer

**Release Date:** 8th Sept, 2025

### Overview

This release of **Inji Mobile Wallet v0.19.0** strengthens support for **IETF** **SD-JWT Verifiable Credentials (VCs)** and enhances the VC verification experience across Android and iOS with updates in our vc-verifier library.

Key highlights include **IETF** **SD-JWT issuance and download flow**, updates to the **VC Verifier Library**, support for **x509 certificates in SD-JWT**, and improvements in handling credential formats such as **mDoc VCs, JSON-LD VCs, and mDL VCs**.

This release also delivers important **bug fixes** and updates to improve **stability, error handling, and multi-language support**.

{% hint style="info" %}
**⚠️ Warning: Signature verification support is limited on iOS. Since the vc-verifier library is not available for iOS, signature verification is currently not performed for mso\_mdoc and SD-JWT credential formats. For LDP-VC(JSON-LD), signature verification is supported only for RSA key suites; verification for EC and Ed25519 is not yet available.**

Refer to the library [**ReadMe**](https://github.com/mosip/inji-wallet?tab=readme-ov-file#ios-1) to know more about this update.
{% endhint %}

### Key Highlights

#### **New Feature Addition**

#### SD-JWT VC Format Support

* Constructed **IETF** **SD-JWT VC Issuance Payloads** in VCI Client Library (Kotlin & Swift).
* Added **IETF** **SD-JWT Validation and Disclosure Display** after verification.
* Integrated **IETF** **SD-JWT VC Verification** into the VC Verifier Library.
* Refer to the [**feature description**](../overview/features/#verifying-credential-authenticity) to know more about this feature

#### **Technical Enhancements**

#### VC Verifier Library Enhancements

* **SD-JWT VC**: Support added for **x509 certificate chains** as per [IETF draft section 3.5-3.2.1](https://www.ietf.org/archive/id/draft-ietf-oauth-sd-jwt-vc-10.html?utm_source=chatgpt.com#section-3.5-3.2.1).
* Improved parsing of JSON payloads in **OVP sharing flows** with multi-language support (including Arabic).
* Refer to the library [**ReadMe**](https://github.com/mosip/vc-verifier?tab=readme-ov-file#vc-verifier) to know more about these enhancements.

#### **Minor Updates to the existing feature**

#### Credential Handling

* Updates to the **LDP VC(JSON-LD) display property** to ensure metadata is refreshed from the database.
* Improved error handling for **VC activation and downloads** (MOSIP VCs, Mock VCs, MDL VCs).
* Fixed the BLE rendering issue for VCs shared without internet connectivity.

### Features Released

<table><thead><tr><th>Type</th><th width="363.62890625">Feature / Enhancements/Technical Upgrades</th><th>Jira Link</th></tr></thead><tbody><tr><td>Technical addtion in Library for new feature support</td><td>SD-JWT VC Validation</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3412?utm_source=chatgpt.com">INJIMOB-3412</a></td></tr><tr><td>Functional addtion in Wallet UI</td><td>Display SD-JWT Disclosures After Verification</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3366?utm_source=chatgpt.com">INJIMOB-3366</a></td></tr><tr><td>Technical addtion in Library for new feature support</td><td>SD-JWT VC Verification in VC Verifier Library</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3365?utm_source=chatgpt.com">INJIMOB-3365</a></td></tr><tr><td>Technical addtion in Library for new feature support</td><td>Construct SD-JWT VC Issuance Payload — Kotlin</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3205?utm_source=chatgpt.com">INJIMOB-3205</a></td></tr><tr><td>Technical addtion in Library for new feature support</td><td>Construct SD-JWT VC Issuance Payload — Swift</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3394?utm_source=chatgpt.com">INJIMOB-3394</a></td></tr><tr><td>Technical addtion in Library for new feature support</td><td>OVP sharing payload parsing for Arabic language VCs</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3367?utm_source=chatgpt.com">INJIMOB-3367</a></td></tr></tbody></table>

### Repositories Released

| Module                    | Version                                                                 |
| ------------------------- | ----------------------------------------------------------------------- |
| inji-wallet               | [0.19.0](https://github.com/mosip/inji-wallet/tree/v0.19.0)             |
| inji-vci-client           | [0.5.0](https://github.com/mosip/inji-vci-client/tree/v0.5.0)           |
| inji-vci-client-ios-swift | [0.5.0](https://github.com/mosip/inji-vci-client-ios-swift/tree/v0.5.0) |
| vc-verifer                | [1.4.0](https://github.com/mosip/vc-verifier/tree/v1.4.0)               |

### Compatible Modules

| Module       | Version                                                      |
| ------------ | ------------------------------------------------------------ |
| mimoto       | [0.18.1](https://github.com/mosip/mimoto/tree/v0.18.1)       |
| inji-config  | [0.10.0](https://github.com/mosip/inji-config/tree/v0.10.0)  |
| Inji Certify | [0.12.0](https://github.com/mosip/inji-certify/tree/v0.12.0) |
| Inji Verify  | [0.13.1](https://github.com/mosip/inji-verify/tree/v0.13.1)  |
| eSignet      | [1.6.1](https://github.com/mosip/esignet/tree/v1.6.1)        |

### Known Issues

Below is the list of key known issues specific to this release. For all known issues, [click here](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?jql=project%20%3D%20%22INJIMOB%22%20AND%20type%20%3D%20Bug%20AND%20status%20IN%20%28New%2C%20Assigned%29%20ORDER%20BY%20created%20DESC).

| Jira Issue                                                      | Description                                                       |
| --------------------------------------------------------------- | ----------------------------------------------------------------- |
| [INJIMOB-3526](https://mosip.atlassian.net/browse/INJIMOB-3526) | VC Verifier – SD-JWT without signature does not return errorCode. |
| [INJIMOB-3525](https://mosip.atlassian.net/browse/INJIMOB-3525) | Enhancement to download nested VCs – nested symbol not proper.    |
| [INJIMOB-3515](https://mosip.atlassian.net/browse/INJIMOB-3515) | Information popup page is lengthy and needs UI improvement.       |

### Bug Fixes

Below is the list of bug fixes as part of the [**0.19.0** ](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?filter=allissues\&jql=project%20%3D%20%22INJIMOB%22%0AAND%20type%20%3D%20Bug%0AAND%20status%20%3D%20Closed%0AAND%20affectedversion%20%3D%200.19.0%0AAND%20labels%20%3D%20qa-inji_mob_release0190_closed%0AORDER%20BY%20created%20DESC\&selectedIssue=INJIMOB-3512)**release**:

| Jira Issue                                                                             | Description                                                       |
| -------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| [INJIMOB-3512](https://mosip.atlassian.net/browse/INJIMOB-3512)                        | Unable to download MOSIP VC; error screen “Something went wrong”. |
| [INJIMOB-3504](https://mosip.atlassian.net/browse/INJIMOB-3504?utm_source=chatgpt.com) | LDP VC display property not updated until storage cleared.        |
| [INJIMOB-3394](https://mosip.atlassian.net/browse/INJIMOB-3394?utm_source=chatgpt.com) | Unable to download Mock VC; error “Something went wrong”.         |
| [INJIMOB-3179](https://mosip.atlassian.net/browse/INJIMOB-3179)                        | Unable to activate VC due to technical error message.             |
| [INJIMOB-2944](https://mosip.atlassian.net/browse/INJIMOB-2944?utm_source=chatgpt.com) | VC not rendered when shared over BLE without internet.            |
| [INJIMOB-2771](https://mosip.atlassian.net/browse/INJIMOB-2771?utm_source=chatgpt.com) | Intermittent failures in MDL VC download.                         |

### Release Documentation

* [Feature Documentation](../overview/features/#verifying-credential-authenticity)
* [QA Report](version-0.19.0/test-report.md)

### Additional Resources

* [Feature Documentation](https://docs.inji.io/inji-wallet/inji-mobile/overview/features) - Contains detailed explanations of all available features of Inji Mobile Waller and its usage.
* [Integration Guides](https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide) - Provides step-by-step instructions to integrate Inji Mobile Wallet with an external system.
* [End User Guide ](../functional-overview/end-user-guide.md)- Offers end-to-end guidance for end users on setup and daily usage.
* [API Documentation](https://mosip.stoplight.io/docs/mimoto/k6907m3dzc1gi-mimoto) - Includes comprehensive details of all APIs, endpoints, request/response formats, and examples.
