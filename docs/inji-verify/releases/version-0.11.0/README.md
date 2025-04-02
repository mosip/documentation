# Version 0.11.0

**Release Name**: Inji Verify v0.11.0

**Support**: Developer

**Release Date**: 2nd April, 2025

## Overview

We’re excited to announce the release of **Inji Verify 0.11.0**, packed with new capabilities and enhancements to improve verifiable credential authentication.

## New Features

* **OpenIDVP Cross-Device Flow** – ​The OpenID for Verifiable Presentations (OpenID4VP) Cross-Device Flow facilitates secure sharing of Verifiable Presentations (VPs) across different devices, allowing verifiers to request specific credentials and users to share the requested VCs from their digital wallets on one device while interacting with the verifier on another, with verification result displayed in Inji Verify.
* **Language Selection** – Users can now choose their preferred language from multiple international (Portuguese, Spanish, French, English, Arabic, Khmer) and Indian vernacular (Tamil, Hindi, Kannada), enhancing accessibility and usability.
* **UI Theme Customization** – Integrators and countries can now personalize the UI theme to match their branding and preferences.
* **Server-Side VC Verification** – Integration of the vc-verifier library to support Ed25519 and RSA key verification, strengthening security of server-side verifications.

## Additional Enhancements

**Zoom Slider for Mobile Scanning** – A zoom slider is introduced to adjust magnification for better scanning and verification on mobile devices.

**Support for W3C VC Data Model 1.1 & 2.0** – Ensuring compatibility with the latest verifiable credential standards.

**Upgrading of vc-verifier library (v1.2.0)**

* VCs with ED25519 Signature 2018 are verifiable.
* Usage of universal DID resolver library.

**Theme Upgrade** - Introducing a sleek gradient-based design as the new default theme for Inji Verify UI. This theme offers a modern and visually appealing user experience, enhancing usability and aesthetic appeal. This theme can nevertheless be customized based on integrators/countries' preferences.

With these updates, **Inji Verify** continues to evolve, making credential verification more secure, adaptable, and user-friendly!

{% hint style="info" %}
**Note:** Currently the scope of VCs that can be verified are:

* VCs adhering to **W3C VC Data Model** 1.1 and 2.0 standards, promoting interoperability and adherence to industry specifications.
* **Algorithms** supported: Ed25519 Verification Key 2018, Ed25519 Verification Key 2020, RSA Verification Key 2018
* **VC format** support: JSON-LD
* **Verification methods** supported:
  * verificationMethod is did:web and in combination with proofValue or jws
  * verificationMethod is https:// and in combination with proofValue or jws
{% endhint %}

### Repositories Released

| Repositories        | Tags: Released                                                   |
| ------------------- | ---------------------------------------------------------------- |
| Inji Verify         | [**v0.11.0**](https://github.com/mosip/inji-verify/tree/v0.11.0) |
| vc-verifier library | [**v1.2.0**](https://github.com/mosip/vc-verifier/tree/v1.2.0)   |

### Compatible modules

The following table outlines the tested and certified compatibility of Inji Verify 0.10.0 with other modules.

| Module          | Version                                                         |
| --------------- | --------------------------------------------------------------- |
| **Inji Wallet** | [**0.15.0**](https://github.com/mosip/inji-wallet/tree/v0.15.0) |
| **Inji Web**    | [**0.10.0**](https://github.com/mosip/inji-web/tree/v0.10.0)    |
| **Pixel Pass**  | [**0.5.0**](https://github.com/mosip/pixelpass/tree/v0.5.0)     |

### Known Issues

Below is the list of known issues. To read in detail and view all the issues related to Inji Verify please click [**here.**](https://mosip.atlassian.net/issues/?jql=project%20%3D%20%22INJIVER%22%20AND%20status%20not%20in%20%28Closed%2C%20Canceled%29%20AND%20type%20%3D%20Bug%20ORDER%20BY%20created%20DESC)

| **Jira ID**                                                         | **Description**                                                                                                                                            |
| ------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [**INJIVER-1061**](https://mosip.atlassian.net/browse/INJIVER-1061) | In OVP, after scanning the health insurance QR code in the injiwallet app, it is displaying the life insurance VC.                                         |
| [**INJIVER-1062**](https://mosip.atlassian.net/browse/INJIVER-1062) | We are uploading an invalid QR code, and while it displays an error message stating that the QR code is invalid, the credential details are still visible. |
| [**INJIVER-1063**](https://mosip.atlassian.net/browse/INJIVER-1063) | On iPhone 8 and iPhone 7, uploading the Injiweb QR code PDF shows an error message.                                                                        |
| [**INJIVER-625**](https://mosip.atlassian.net/browse/INJIVER-625)   | Inji Verify - Upload not functioning on Mac Safari Browser Versions 16 and below.                                                                          |
| [**INJIVER-237**](https://mosip.atlassian.net/browse/INJIVER-237)   | Unable to scan sunbird QR code through Mobile/Windows/Mac.                                                                                                 |
| [**INJIVER-955**](https://mosip.atlassian.net/browse/INJIVER-955)   | VP Verification APIs are validating invalid entries.                                                                                                       |
| [**INJIVER-1011**](https://mosip.atlassian.net/browse/INJIVER-1011) | Unable to scan VP Verification QR Code from Inji mobile.                                                                                                   |
| [**INJIVER-859**](https://mosip.atlassian.net/browse/INJIVER-859)   | When a MOSIP VC is downloaded from Inji Web, the verification fails upon uploading the VC.                                                                 |
| [**INJIVER-283**](https://mosip.atlassian.net/browse/INJIVER-283)   | Unable to scan QR codes under low light.                                                                                                                   |

### Bug Fixes

Below is the list of fixes as part of the **0.11.0** release:

| **Jira ID**                                                   | **Description**                                                                                                         |
| ------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| [INJIVER-912](https://mosip.atlassian.net/browse/INJIVER-912) | OpenID4VP Cross Device Verification failing for multiple scenarios                                                      |
| [INJIVER-908](https://mosip.atlassian.net/browse/INJIVER-908) | A suitable error message is not displayed for non - supported QR codes (mock mDL).                                      |
| [INJIVER-807](https://mosip.atlassian.net/browse/INJIVER-807) | There is no success toaster message for successful scan.                                                                |
| [INJIVER-749](https://mosip.atlassian.net/browse/INJIVER-749) | Success/ Warning/ Error messages is not placed on the top-right of the screen in mobile view.                           |
| [INJIVER-748](https://mosip.atlassian.net/browse/INJIVER-748) | Arrows to navigate across tabs are not aligned in mobile view.                                                          |
| [INJIVER-745](https://mosip.atlassian.net/browse/INJIVER-745) | The FAQ section is either hidden or not visible on Android and iOS devices                                              |
| [INJIVER-744](https://mosip.atlassian.net/browse/INJIVER-744) | While scanning the QR code, the copyright text overlaps with the zoom slider.                                           |
| [INJIVER-743](https://mosip.atlassian.net/browse/INJIVER-743) | When the user clicks on the ellipse, it is not highlighted in grey color.                                               |
| [INJIVER-741](https://mosip.atlassian.net/browse/INJIVER-741) | The Upload and Scan buttons have a white layout at both beginning and the end.                                          |
| [INJIVER-740](https://mosip.atlassian.net/browse/INJIVER-740) | In iOS and Android devices, the 1-2-3 circles in Inji Verify have vertical lines on the edges.                          |
| [INJIVER-739](https://mosip.atlassian.net/browse/INJIVER-739) | In all browsers of iPhone, verify credentials is not displayed in gradient color.                                       |
| [INJIVER-738](https://mosip.atlassian.net/browse/INJIVER-738) | On all devices, the loading indicator is not displayed as a circle; instead is rotating as an oval or appearing skewed. |
| [INJIVER-737](https://mosip.atlassian.net/browse/INJIVER-737) | In Firefox, the bullet points on the left side of upload page are not displaying correctly.                             |
| [INJIVER-726](https://mosip.atlassian.net/browse/INJIVER-726) | Scan screen view is reduced (width and height) within the scan area.                                                    |

### Documentation

* [Feature documentation](https://docs.mosip.io/inji/inji-verify/functional-overview/features)
* [User guide](https://docs.mosip.io/inji/inji-verify/functional-overview/end-user-guide)
* [API Documentation](https://mosip.stoplight.io/docs/inji-verify/exiu5fepecoj7-open-id-4-vp-verifier-api-inji-verify)
* [Local Setup](https://github.com/mosip/inji-verify/tree/release-0.11.x?tab=readme-ov-file#developer-setup)
* [Collab Guide](https://docs.inji.io/inji-verify/releases-1/inji-verify-collab-guide)
* [QA Report](https://docs.inji.io/inji-verify/releases/version-0.11.0/test-report)
