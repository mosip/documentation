# Version 0.21.0

**Release Name:** Inji Mobile Wallet 0.21.0

**Release Type:** Developer

**Release Date:** 19th December, 2026

## Overview

This release of Inji Mobile Wallet v0.21.0 focuses on the [revocation feature](../../overview/features/revocation-of-verifiable-credentials.md) using [**W3C Bitstring Status List**](https://www.w3.org/TR/vc-bitstring-status-list/), minor UI/UX refinements, OpenID4VP interoperability fixes, and a large set of stability and security improvements across both Android (Kotlin) and iOS (Swift).

The update strengthens wallet reliability across verifiable credential flows, improves visual consistency and addresses critical functional defects. This version ensures better alignment with the latest verifier flows, making the app more compliant, accessible, and robust for large-scale deployments.

## Key Highlights

### 1. Revocation Feature

* [**Automatic & Manual Revocation Checks:**](https://docs.inji.io/inji-wallet/inji-mobile/overview/features#id-5.-revocation-support) The wallet now automatically verifies the revocation status of every credential during download and allows users to manually re-check status anytime, ensuring real-time accuracy of credential validity.
* [**Clear Status Updates Across UI:**](https://docs.inji.io/inji-wallet/inji-mobile/overview/features#id-5.-revocation-support) Credentials now display **Valid**, **Revoked**, or **Pending** states based on the issuer’s status list, with enhanced UI indicators and activity logs to help users understand and track credential status easily.

### 2. UI Consistency Enhancements

* Fixes for alignment, spacing, icon visibility, and UI rendering on both iOS and Android.
* Updated About Page with new disclaimer text and styling improvements.

### 3. Functional Fixes & Stability Improvements

* The history page now refreshes correctly after VC sharing events.
* Multiple UI crashes and rendering issues resolved, especially around mDL downloads, BLE flows.
* Corrections to pin icon overlap, status icon visibility, and text alignment.

### 4. Technical Feature Support

* Transaction data not supported error is to be introduced in the OpenIDVP Flow.
* Enhance VC Verifier to handle credentialStatus as both an Object and an Array.
* OpenIDVP request by value as a signed request.
* Handle Verifier's Response for response\_uri from library.
* Support RSA256 and ES256K public key with JWK.

## Features Released

<table><thead><tr><th width="566.66796875">Feature / Enhancement</th><th>Jira Link</th></tr></thead><tbody><tr><td>UI – Revocation Feature for Inji Mobile Wallet</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3207">INJIMOB-3207</a></td></tr><tr><td>Revocation logic for iOS Wallet</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3600">INJIMOB-3600</a></td></tr><tr><td>Kotlin: Enhance VC Verifier to Handle credentialStatus as Both Object and Array</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3593">INJIMOB-3593</a></td></tr><tr><td>Kotlin/Swift: OpenIDVP request by value as signed request</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3576">INJIMOB-3576</a></td></tr><tr><td>VC Verifier Library – Support RSA256 and ES256K public key with JWK</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3557">INJIMOB-3557</a></td></tr><tr><td>Swift: Handle Verifier's Response for response_uri</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3551">INJIMOB-3551</a></td></tr><tr><td>Kotlin: Handle Verifier's Response for response_uri</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3550">INJIMOB-3550</a></td></tr><tr><td>Transaction data not supported error – OVP Flow (Swift)</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3534">INJIMOB-3534</a></td></tr><tr><td>Transaction data not supported error – OVP Flow (Kotlin)</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3533">INJIMOB-3533</a></td></tr><tr><td>Inji Mobile – Branding Alignment with Gradient Color Scheme &#x26; Montserrat Font</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3651">INJIMOB-3651</a></td></tr></tbody></table>

## Repositories Released

| Module      | Version                                                     |
| ----------- | ----------------------------------------------------------- |
| inji-wallet | [0.21.0](https://github.com/mosip/inji-wallet/tree/v0.21.0) |
| vc-verifier | [1.6.0](https://github.com/mosip/vc-verifier/tree/v1.6.0)   |

## Compatible Modules

| Module       | Version                                                             |
| ------------ | ------------------------------------------------------------------- |
| Inji Certify | [0.12.2](https://github.com/mosip/inji-certify/tree/v0.12.2)        |
| Inji Verify  | [0.15.2](https://github.com/mosip/inji-verify/releases/tag/v0.15.2) |
| eSignet      | [1.6.2](https://github.com/mosip/esignet/tree/v1.6.2)               |
| inji-config  | [0.11.1](https://github.com/mosip/inji-config/tree/v0.11.1)         |

## Known Issues

Below is the list of key known issues specific to this release. For all known issues, [click here](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?jql=project%20%3D%20%22INJIMOB%22%20AND%20type%20%3D%20Bug%20AND%20status%20IN%20%28New%2C%20Assigned%29%20ORDER%20BY%20created%20DESC).

<table><thead><tr><th width="200.87109375">Jira Issue</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3639">INJIMOB-3639</a></td><td>Face ID permission consent screen displays the app name as <strong>“Resident app”</strong> instead of the correct Inji app branding.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3636">INJIMOB-3636</a></td><td>The back button’s orange background color is missing on both the <strong>Receive Card</strong> and <strong>Incoming Card</strong> pages.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3628">INJIMOB-3628</a></td><td>Status info icons are <strong>cut off</strong>, and scrolling is not possible on the status information section.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3625">INJIMOB-3625</a></td><td>Revocation status <strong>date and time format</strong> are not aligned with the approved Figma design.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3609">INJIMOB-3609</a></td><td>In the <strong>OVP same-device flow</strong>, the wallet sends an <code>invalid_transaction_data</code> error, but the UI incorrectly displays <strong>“No matching credentials found to fulfill the request.”</strong></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3469">INJIMOB-3469</a></td><td>The <strong>info icon</strong> does not appear for languages other than English on the ID Details view page.</td></tr></tbody></table>

## Bug Fixes

Here below is the complete list of bug fixes included in the [**0.21.0**](https://mosip.atlassian.net/issues/?jql=labels%20%3D%20%22qa-inji_mob_release0210%22%20AND%20status%20%3D%20Closed%20AND%20type%20%3D%20Bug\&selectedIssue=INJIMOB-3644) release.

<table><thead><tr><th width="204.09765625">Jira Issue</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3644">INJIMOB-3644</a></td><td>Revocation flow: Success toaster was shown even when the last action was <strong>Check Status</strong>.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3607">INJIMOB-3607</a></td><td>OVP mock-services were failing on <strong>Windows</strong> due to <code>'PORT' is not recognized</code> error.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3602">INJIMOB-3602</a></td><td>Tuvali version label needed to be removed from Android and heading updated to <strong>Title Case</strong>.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3379">INJIMOB-3379</a></td><td>API Automation: Daily run observed test failures after deploying <strong>0.18.x</strong> image on <code>qa-inji1</code> environment.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3270">INJIMOB-3270</a></td><td>Four negative test cases for <strong>wallet_binding</strong> failed with <code>IDA-MLC-009 → Invalid Input Parameter - individualId</code>.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3053">INJIMOB-3053</a></td><td>UI Android test case failed because <strong>Logout did not execute</strong> and Settings icon was not clickable.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-1403">INJIMOB-1403</a></td><td>VC download failed when <strong>eSignet pod was down</strong>, and no proper error message was displayed.</td></tr></tbody></table>

***

**Release Documentation**

* [Revocation Of Verifiable-credentials](../../overview/features/revocation-of-verifiable-credentials.md)
* [QA Report](test-report.md)

**Additional Resources**

* [Features](https://docs.inji.io/inji-wallet/inji-mobile/overview/features)
* [Integration Guides](https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide)
* [End User Guide](https://docs.inji.io/inji-wallet/inji-mobile/functional-overview/end-user-guide)
* [API Documentation](https://mosip.stoplight.io/docs/mimoto/5bf5a1n68g4tq-mimoto)
