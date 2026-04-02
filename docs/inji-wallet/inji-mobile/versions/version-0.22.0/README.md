# Version 0.22.0

**Release Name:** Inji Mobile Wallet 0.22.0

**Release Type:** Developer

**Release Date:** 6th March 2026

## Overview

This release of **Inji Mobile Wallet v0.22.0** introduces support for [**Presentation During Issuance**](https://github.com/openid/OpenID4VCI/blob/31636e9bb7f0eef6933175e1e41c78ce79a69783/1.1/openid-4-verifiable-credential-issuance-1_1.md) **(PDI)** and enhancements to credential issuance and verification workflows aligned with **OpenID4VCI and OpenID4VP standards**.

The release also adds support for [**Claim 169**](https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification) **QR Code–based credential rendering**, enabling the wallet to store and display credentials containing embedded QR blocks used for quick verification scenarios.

In addition, this version includes improvements to **DID resolution flows, credential offer trust UI, and credential status visibility**, along with several **stability fixes, UI corrections, and interoperability improvements across Android (Kotlin) and iOS (Swift)**.

These enhancements improve the wallet’s reliability and extend its ability to support advanced issuance scenarios required by countries and ecosystem partners.

## Key Highlights

### 1. Presentation During Issuance (PDI)

This release introduces support for **Presentation During Issuance**, allowing issuers to request verifiable presentations from the wallet during credential issuance.

This enables advanced workflows such as:

* Eligibility verification before credential issuance
* Conditional issuance flows

The wallet now supports:

* **Trusted issuer PDI flows**
* **Non-trusted issuer PDI flows**
* UI screens for credential trust and consent
* Library-level support in **OpenID4VP and VCI client libraries**

### 2. Claim 169 QR Code Credential Support

Support has been added for **Claim 169 QR code–formatted credentials**, allowing the wallet to download, store, and render credentials containing embedded QR verification blocks.

Enhancements include:

* Rendering of QR code data embedded within credentials
* Library updates for Claim 169 credential parsing
* Improvements to credential display for QR-based credentials

### 3. OpenID4VP & DID Interoperability Improvements

Several improvements have been made to improve compatibility with OpenID-based verification flows.

Enhancements include:

* Support for resolving **did:jwk with RSA key types**
* Improvements to **same-device and cross-device DID flows**
* Enhancements to **OpenID4VCI interaction metadata handling**

These improvements enhance interoperability with external issuers and verifiers.

### 4. UI and User Experience Improvements

This release includes improvements across multiple wallet screens to improve visual consistency and accessibility.

Enhancements include:

* Credential offer trust screen UI updates
* Improved credential status information display
* Language rendering improvements
* UI alignment fixes across credential details and settings screens

## Features Released

| Feature / Enhancement                                                   | Jira Link                                                       |
| ----------------------------------------------------------------------- | --------------------------------------------------------------- |
| Presentation During Issuance – Trusted Issuer Flow UI                   | [INJIMOB-3690](https://mosip.atlassian.net/browse/INJIMOB-3690) |
| UI Credential Offer Trust Screens                                       | [INJIMOB-3693](https://mosip.atlassian.net/browse/INJIMOB-3693) |
| Wallet Support – Claim 169 QR Code                                      | [INJIMOB-3712](https://mosip.atlassian.net/browse/INJIMOB-3712) |
| Swift Library Pixelpass Changes for Claim 169                           | [INJIMOB-3730](https://mosip.atlassian.net/browse/INJIMOB-3730) |
| Credential Status Detailed View                                         | [INJIMOB-3656](https://mosip.atlassian.net/browse/INJIMOB-3656) |
| OpenIDVP Library – Presentation During Issuance (Swift)                 | [INJIMOB-3619](https://mosip.atlassian.net/browse/INJIMOB-3619) |
| OpenIDVP Library – Presentation During Issuance (Kotlin)                | [INJIMOB-3599](https://mosip.atlassian.net/browse/INJIMOB-3599) |
| VCI Client – Presentation During Issuance Interaction Metadata (Swift)  | [INJIMOB-3598](https://mosip.atlassian.net/browse/INJIMOB-3598) |
| VCI Client – Presentation During Issuance Interaction Metadata (Kotlin) | [INJIMOB-3247](https://mosip.atlassian.net/browse/INJIMOB-3247) |
| OpenID4VP – DID JWK Resolution with RSA Key Type                        | [INJIMOB-3703](https://mosip.atlassian.net/browse/INJIMOB-3703) |
| Remove Claims from Request Body for mso\_mdoc                           | [INJIMOB-3574](https://mosip.atlassian.net/browse/INJIMOB-3574) |

## Repositories Released

| Module                        | Version                                                                |
| ----------------------------- | ---------------------------------------------------------------------- |
| **inji-wallet**               | [0.22.0](https://github.com/inji/inji-wallet/tree/v0.22.0)             |
| **inji-openid4vp**            | [0.7.0](https://github.com/inji/inji-openid4vp/tree/v0.7.0)            |
| **inji-openid4vp-ios-swift**  | [0.7.0](https://github.com/inji/inji-openid4vp-ios-swift/tree/v0.7.0)  |
| **inji-vci-client**           | [0.7.0](https://github.com/inji/inji-vci-client/tree/v0.7.0)           |
| **inji-vci-client-ios-swift** | [0.7.0](https://github.com/inji/inji-vci-client-ios-swift/tree/v0.7.0) |

## Compatible Modules

| Module       | Version                                                     |
| ------------ | ----------------------------------------------------------- |
| Mimoto       | [0.21.0](https://github.com/inji/mimoto/tree/v0.21.0)       |
| Inji Certify | [0.14.0](https://github.com/inji/inji-certify/tree/v0.14.0) |
| Inji Verify  | [0.17.0](https://github.com/inji/inji-verify/tree/v0.17.0)  |
| eSignet      | [1.6.2](https://github.com/mosip/esignet/tree/v1.6.2)       |
| inji-config  | [0.15.0](https://github.com/inji/inji-config/tree/v0.15.0)  |

## Known Issues

Below is the list of key known issues specific to this release. For all known issues, [click here](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues?filter=allissues\&jql=project%20%3D%20%22INJIMOB%22%0AAND%20type%20%3D%20Bug%0AAND%20status%20IN%20%28New%2C%20Assigned%2C%20%22In%20Progress%22%2C%20Re-opened%2C%20Testing%2C%20%22PR%20Raised%22%2C%20Fixed%2C%20%22On%20Hold%20-%20Dev%22%29%0AAND%20labels%20NOT%20IN%20%28UI_Automation%2C%20brazil_prepilot%2C%20FaceLivenessVerification%2C%20security%2C%20security_related%29%0AORDER%20BY%20created%20DESC\&selectedIssue=INJIMOB-3784)

<table><thead><tr><th width="244.71875">Jira Issue</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3784">INJIMOB-3784</a></td><td>In the <strong>PDI Trusted Flow</strong>, the <em>Cancel</em> button from the <strong>Select Card</strong> page does not redirect the user back to the <strong>Credential Type</strong> page.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3783">INJIMOB-3783</a></td><td>In the <strong>PDI Trusted Flow</strong>, the wallet should restrict the number of <strong>face authentication attempts to three</strong>, but this limitation is not enforced when verification fails.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3782">INJIMOB-3782</a></td><td>In the <strong>PDI Trusted Flow</strong>, when no matching credentials are found, the application does not display an appropriate error message.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3781">INJIMOB-3781</a></td><td>In the <strong>PDI Non-Trusted Flow</strong>, scanning an invalid QR code does not show a proper error message.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3773">INJIMOB-3773</a></td><td>After successfully sharing a <strong>Claim 169 VC</strong>, the credential appears with <strong>two images on the Incoming Card page</strong> on the receiver device.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3772">INJIMOB-3772</a></td><td>The <strong>PDI flow is not functioning correctly on Android and iOS</strong>, and a flickering issue occurs on the processing screen.</td></tr></tbody></table>

## Bug Fixes

Below is the complete list of bug fixes included in the [**0.22.0** ](https://mosip.atlassian.net/issues/?jql=labels%20%3D%20%22qa-inji_mob_release0220_closed%22)release.

<table><thead><tr><th width="243.828125">Jira Issue</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3770">INJIMOB-3770</a></td><td>DID flow crash during same-device by-reference flow.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3769">INJIMOB-3769</a></td><td>Pre-registered issuance flow failure with signed flow scenarios.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3767">INJIMOB-3767</a></td><td>Wallet crash when initiating PDI flow after deleting one credential.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3765">INJIMOB-3765</a></td><td>Network request failure during PDI trusted flow.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3758">INJIMOB-3758</a></td><td>History page audit logs not updating correctly after VC sharing.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3755">INJIMOB-3755</a></td><td>Issuer logo not displayed after VC download.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3743">INJIMOB-3743</a></td><td>Language switch causing UI icon rendering issues.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3731">INJIMOB-3731</a></td><td>iOS application crash when selecting “No, Take Me Back” in OVP flow.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3726">INJIMOB-3726</a></td><td>Unable to render details view for mso_mdoc credential.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3710">INJIMOB-3710</a></td><td>DID scheme not working in same-device and cross-device scenarios.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3707">INJIMOB-3707</a></td><td>Android unable to download Mock VC V2 credentials.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3705">INJIMOB-3705</a></td><td>Credential download failure for multiple credential types.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3663">INJIMOB-3663</a></td><td>VC sharing history not refreshing automatically.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3634">INJIMOB-3634</a></td><td>Help page documentation links outdated.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3633">INJIMOB-3633</a></td><td>Scrollbar overlapping search bar on home screen.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3617">INJIMOB-3617</a></td><td>Biometric icon updated to Face ID for newer devices.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3565">INJIMOB-3565</a></td><td>Backup &#x26; Restore screen showing incorrect bottom navigation.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3560">INJIMOB-3560</a></td><td>iOS ARC memory management issue resolved.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3536">INJIMOB-3536</a></td><td>Improved error messaging for invalid SD-JWT credential subject.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3529">INJIMOB-3529</a></td><td>Consent text improved for clarity.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3525">INJIMOB-3525</a></td><td>Nested credential rendering improvements.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3411">INJIMOB-3411</a></td><td>QR share options requiring double click on iOS fixed.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3404">INJIMOB-3404</a></td><td>Error message mismatch between Android and iOS fixed.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3399">INJIMOB-3399</a></td><td>Improved error messaging for invalid or duplicate QR scans.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3215">INJIMOB-3215</a></td><td>Intro sliders reversed for Arabic locale.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2574">INJIMOB-2574</a></td><td>Credential count not updating correctly after deletion.</td></tr></tbody></table>

## Release Documentation

* [Presentation During Issuance](../../overview/features/presentation-during-issuance-pdi.md)
* [Claim 169 QR Code Support](../../overview/features/claim-169-qr-code-support.md)
* [QA Report](test-report.md)

## Additional Resources

* [Features](https://docs.inji.io/inji-wallet/inji-mobile/overview/features)
* [Integration Guides](https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide)
* [End User Guide](https://docs.inji.io/inji-wallet/inji-mobile/functional-overview/end-user-guide)
* [API Documentation](https://mosip.stoplight.io/docs/mimoto/5bf5a1n68g4tq-mimoto)

<br>
