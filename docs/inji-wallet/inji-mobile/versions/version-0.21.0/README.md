# Version 0.21.0

**Release Name:** Inji Mobile Wallet 0.21.0

**Release Type:** Developer

**Release Date:** _Coming Soon!_

## **Overview**

This release of Inji Mobile Wallet v0.21.0 focuses on the revocation feature using [**W3C Bitstring Status List**](https://www.w3.org/TR/vc-bitstring-status-list/), minor UI/UX refinements, OpenID4VP interoperability fixes, and a large set of stability and security improvements across both Android (Kotlin) and iOS (Swift).

The update strengthens wallet reliability across verifiable credential flows, improves visual consistency and addresses critical functional defects. This version ensures better alignment with the latest verifier flows, making the app more compliant, accessible, and robust for large-scale deployments.

## **Key Highlights**

#### &#x20;**1. Revocation Feature**

* **Automatic & Manual Revocation Checks:**\
  The wallet now automatically verifies the revocation status of every credential during download and allows users to manually re-check status anytime, ensuring real-time accuracy of credential validity.
* **Clear Status Updates Across UI:**\
  Credentials now display **Valid**, **Revoked**, or **Pending** states based on the issuer’s status list, with enhanced UI indicators and activity logs to help users understand and track credential status easily.

#### **2. UI Consistency Enhancements**

* Fixes for alignment, spacing, icon visibility, and UI rendering on both iOS and Android.
* Updated About Page with new disclaimer text and styling improvements.

#### **3. Functional Fixes & Stability Improvements**

* The history page now refreshes correctly after VC sharing events.
* Multiple UI crashes and rendering issues resolved, especially around mDL downloads, BLE flows.
* Corrections to pin icon overlap, status icon visibility, and text alignment.

#### **4. Technical Feature Support**

* Transaction data not supported error is to be introduced in the OpenIDVP Flow.
* Enhance VC Verifier to handle credentialStatus as both an Object and an Array.
* OpenIDVP request by value as a signed request.
* Handle Verifier's Response for response\_uri from library.
* Support RSA256 and ES256K public key with JWK.

### **Features Released**

<table><thead><tr><th width="137.1640625">Type</th><th>Feature / Enhancement</th><th>Jira Link</th></tr></thead><tbody><tr><td>Story</td><td>UI – Revocation Feature for Inji Mobile Wallet</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3207">INJIMOB-3207</a></td></tr><tr><td>Story</td><td>Revocation logic for iOS Wallet</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3600">INJIMOB-3600</a></td></tr><tr><td>Story</td><td>Kotlin: Enhance VC Verifier to Handle credentialStatus as Both Object and Array</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3593">INJIMOB-3593</a></td></tr><tr><td>Story</td><td>Kotlin/Swift: OpenIDVP request by value as signed request</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3576">INJIMOB-3576</a></td></tr><tr><td>Story</td><td>VC Verifier Library – Support RSA256 and ES256K public key with JWK</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3557">INJIMOB-3557</a></td></tr><tr><td>Story</td><td>Swift: Handle Verifier's Response for response_uri</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3551">INJIMOB-3551</a></td></tr><tr><td>Story</td><td>Kotlin: Handle Verifier's Response for response_uri</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3550">INJIMOB-3550</a></td></tr><tr><td>Story</td><td>Transaction data not supported error – OVP Flow (Swift)</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3534">INJIMOB-3534</a></td></tr><tr><td>Story</td><td>Transaction data not supported error – OVP Flow (Kotlin)</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3533">INJIMOB-3533</a></td></tr><tr><td>Story</td><td>Inji Mobile – Branding Alignment with Gradient Color Scheme &#x26; Montserrat Font</td><td><a href="https://mosip.atlassian.net/browse/INJIMOB-3651">INJIMOB-3651</a></td></tr></tbody></table>

### **Repositories Released**

| inji-wallet | 0.21.0 |
| ----------- | ------ |
| vc-verifier | 1.6.0  |

### **Compatible Modules**

| Module       | Version                                                             |
| ------------ | ------------------------------------------------------------------- |
| Inji Certify | [0.12.2](https://github.com/mosip/inji-certify/tree/v0.12.2)        |
| Inji Verify  | [0.15.2](https://github.com/mosip/inji-verify/releases/tag/v0.15.2) |
| eSignet      | [1.6.2](https://github.com/mosip/esignet/tree/v1.6.2)               |
| inji-config  | [0.11.1](https://github.com/mosip/inji-config/tree/v0.11.1)         |

### **Known Issues**

Below is the list of key known issues specific to this release. For all known issues, [click here](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?jql=project%20%3D%20%22INJIMOB%22%20AND%20type%20%3D%20Bug%20AND%20status%20IN%20%28New%2C%20Assigned%29%20ORDER%20BY%20created%20DESC).

| Jira Issue                                                      | Description                                                                                                                                                                        |
| --------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [INJIMOB-3639](https://mosip.atlassian.net/browse/INJIMOB-3639) | Face ID permission consent screen displays the app name as **“Resident app”** instead of the correct Inji app branding.                                                            |
| [INJIMOB-3636](https://mosip.atlassian.net/browse/INJIMOB-3636) | The back button’s orange background color is missing on both the **Receive Card** and **Incoming Card** pages.                                                                     |
| [INJIMOB-3628](https://mosip.atlassian.net/browse/INJIMOB-3628) | Status info icons are **cut off**, and scrolling is not possible on the status information section.                                                                                |
| [INJIMOB-3625](https://mosip.atlassian.net/browse/INJIMOB-3625) | Revocation status **date and time format** are not aligned with the approved Figma design.                                                                                         |
| [INJIMOB-3609](https://mosip.atlassian.net/browse/INJIMOB-3609) | In the **OVP same-device flow**, the wallet sends an `invalid_transaction_data` error, but the UI incorrectly displays **“No matching credentials found to fulfill the request.”** |
| [INJIMOB-3469](https://mosip.atlassian.net/browse/INJIMOB-3469) | The **info icon** does not appear for languages other than English on the ID Details view page.                                                                                    |

## **Bug Fixes**

Below is the complete list of bug fixes included in the [**0.21.0**](https://mosip.atlassian.net/issues/?jql=labels%20%3D%20%22qa-inji_mob_release0210%22%20AND%20status%20%3D%20Closed%20AND%20type%20%3D%20Bug\&selectedIssue=INJIMOB-3644) release:

| Jira Issue                                                      | Description                                                                                                          |
| --------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| [INJIMOB-3644](https://mosip.atlassian.net/browse/INJIMOB-3644) | Revocation flow: Success toaster was shown even when the last action was **Check Status**.                           |
| [INJIMOB-3607](https://mosip.atlassian.net/browse/INJIMOB-3607) | OVP mock-services were failing on **Windows** due to `'PORT' is not recognized` error.                               |
| [INJIMOB-3602](https://mosip.atlassian.net/browse/INJIMOB-3602) | Tuvali version label needed to be removed from Android and heading updated to **Title Case**.                        |
| [INJIMOB-3379](https://mosip.atlassian.net/browse/INJIMOB-3379) | API Automation: Daily run observed test failures after deploying **0.18.x** image on `qa-inji1` environment.         |
| [INJIMOB-3270](https://mosip.atlassian.net/browse/INJIMOB-3270) | Four negative test cases for **wallet\_binding** failed with `IDA-MLC-009 → Invalid Input Parameter - individualId`. |
| [INJIMOB-3053](https://mosip.atlassian.net/browse/INJIMOB-3053) | UI Android test case failed because **Logout did not execute** and Settings icon was not clickable.                  |
| [INJIMOB-1403](https://mosip.atlassian.net/browse/INJIMOB-1403) | VC download failed when **eSignet pod was down**, and no proper error message was displayed.                         |

**Release Documentation**

* [Feature Documentation](../../overview/features/revocation-of-verifiable-credentials.md)
* QA Report

**Additional Resources**

* [Feature Documentation](https://docs.inji.io/inji-wallet/inji-mobile/overview/features) - Contains detailed explanations of all available features of Inji Mobile Waller and its usage.
* [Integration Guides](https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide) - Provides step-by-step instructions to integrate Inji Mobile Wallet with an external system.
* [End User Guide ](https://docs.inji.io/inji-wallet/inji-mobile/functional-overview/end-user-guide)- Offers end-to-end guidance for end users on setup and daily usage.
* [API Documentation](https://mosip.stoplight.io/docs/mimoto/k6907m3dzc1gi-mimoto) - Includes comprehensive details of all APIs, endpoints, request/response formats, and examples.
