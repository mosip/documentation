# Version 0.16.0

**Release Name:** Inji Wallet 0.16.0

**Release Type:** Developer

**Release Date:** Coming Soon

### **Overview**

We are excited to announce the release of **Inji Wallet Version 0.16.0!** This update introduces major enhancements to security, metadata management, standards compliance, and credential handling. Here's a detailed overview of the latest improvements and features:

### **Key Highlights**

#### **1. ED25519-2020 Key Support**

* **Feature:** VP signing with ED25519Signature2020.
* Inji Mobile now uses the **ED25519-2020** algorithm to sign vp\_token in the OpenID4VP flow, aligning with modern cryptographic standards for improved security and reliability.&#x20;

#### **2. Authorization Request URI Support**

* **Feature:** Streamlined Authorization Flow with request\_uri.
* Supports client\_id, request\_uri, and request\_uri\_method in QR codes.
* Introduced a new **Request URI Endpoint** for generating signed JWT authorization requests.
* Improved error handling and updated OpenID4VP library for seamless integration.

#### **3. Verifier Metadata Management (Kotlin)**

* **Feature:** Support for Multiple Client ID Schemes in OpenID4VP.
* Supports verifier validation using:
  * **Pre-registered schemes**
  * **Redirect URI schemes**
  * **DID schemes**
* Includes improved error handling and JOSE header compatibility.

#### **4. Unique UID Generation for VCs**

* **Feature:** Remove id field and generate internal UID.
* Generates a **UUID (v4)** as a unique identifier during VC download.
* UID is used for file naming and remains consistent across backup/restore.
* Independent of id field presence in VC response.

#### **5. Dynamic Well-Known Endpoint Discovery**

* **Feature:** Standards-compliant endpoint resolution.
* Constructs well-known URL dynamically using credential\_issuer\_host.
* Removed fallback JSONs from config.
* Issuers are now responsible for redirection handling.
* Ensures compliance with **OpenID4VCI** spec and simplifies config management.

#### **6. Verifier Metadata Management (Swift)**

* **Feature:** Support for Metadata Validation in iOS.
* Adds support for pre-registered, redirect URI, and DID schemes.
* Custom **DID Resolver** implemented for public key extraction.
* Integrated with beatt83/jose-swift for JWT verification.
* Ensures compatibility and secure Authorization Request handling in Swift SDK.

### **Technical Improvements**

* Enhanced QR Code logic to support complex OpenID4VP flows.
* JWT construction and signing updated using secure algorithms.
* Added support for mock server testing and validation.
* Improved UI rendering for long client IDs (bug fix).
* API updates and better error handling for missing or invalid metadata.
* client\_id\_scheme supported and for more details link with Readme of 0.2.x branch [inji-openid4vp/README.md at release-0.2.x · mosip/inji-openid4vp](https://github.com/mosip/inji-openid4vp/blob/release-0.2.x/README.md).

### **Repository Released**

| **Module**                | **Version** |
| ------------------------- | ----------- |
| Inji Mobile Wallet        | [0.16.0](https://github.com/mosip/inji-wallet/tree/v0.16.0)      |
| inji-openid4vp-ios-swift  | [v1.2.0](https://github.com/mosip/inji-openid4vp-ios-swift/tree/v0.2.0)       |
| inji-openid4vp            | [v1.2.0](https://github.com/mosip/inji-openid4vp/tree/v0.2.0)       |
| tuvali                    | [v0.5.2](https://github.com/mosip/tuvali/tree/v0.5.2) |



### **Compatible Modules**

| **Module**       | **Version**                                                             |
| ---------------- | ----------------------------------------------------------------------- |
| Inji-config      | 0.5.0                                                                   |
| eSignet          | 1.5.0                                                                   |
| mimoto           | 0.17.0                                                                  |
| Inji Certify     | 0.10.1                                                                  |
| Inji Verify      | [v0.10.0](https://github.com/mosip/inji-verify/tree/v0.10.0)            |
| tuvali           | [v0.5.1](https://github.com/mosip/tuvali/tree/v0.5.1)                   |
| tuvali-ios-swift | [v0.5.0](https://github.com/mosip/tuvali-ios-swift/releases/tag/v0.5.0) |



<!-- 

| vc-verifier               | 1.1.0       |


| inji-vci-client-ios-swift | 0.2.0       |
| inji-vci-client           | 0.2.0       |
| secure-keystore-ios-swift | 0.3.0       |
| secure-keystore           | 0.3.0       |
| pixelpass-ios-swift       | 0.6.0       |
| pixelpass                 | 0.6.0       |


-->


### **Known Issues**



Below is the list of [**known**](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?jql=project%20%3D%20%22INJIMOB%22%20AND%20type%20%3D%20Bug%20AND%20status%20IN%20%28New%2C%20Assigned%29%20ORDER%20BY%20created%20DESC) issues. To read in detail click [**here**](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?jql=project%20%3D%20%22INJIMOB%22%20AND%20type%20%3D%20Bug%20AND%20status%20IN%20%28New%2C%20Assigned%29%20ORDER%20BY%20created%20DESC)**.**

| **Jira Issue**                                                      | **Issue Description**                                                                                                                          |
| ------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| [**INJIMOB-2901**](https://mosip.atlassian.net/browse/INJIMOB-2901) | \[OpenId4VP] QR data is base64 encoded                                                                                                         |
| [**INJIMOB-2907**](https://mosip.atlassian.net/browse/INJIMOB-2907) | Invalid URL Format for OPENID4VP on Android 14 and above version                                                                               |
| [**INJIMOB-2521**](https://mosip.atlassian.net/browse/INJIMOB-2521) | Search is not working for the VCs from home page                                                                                               |
| [**INJIMOB-2241**](https://mosip.atlassian.net/browse/INJIMOB-2241) | INJI- In the Credential Registry popup, when entering an invalid URL in the 'Edit Credential Registry' field, the error message is overlapping |
| [**INJIMOB-2159**](https://mosip.atlassian.net/browse/INJIMOB-2159) | The activation VC is not working for a second time on the same device; the same VC displays a technical error message.                         |
| [**INJIMOB-1852**](https://mosip.atlassian.net/browse/INJIMOB-1852) | After we removed the mandatory configuration for the Mock issuer is not showing the error message in UI                                        |
| [**INJIMOB-1603**](https://mosip.atlassian.net/browse/INJIMOB-1603) | During face authentication, the camera view is not opening in all IOS device                                                                   |
| [**INJIMOB-1336**](https://mosip.atlassian.net/browse/INJIMOB-1336) | Automation run for sanity is failing few scenarios                                                                                             |

### **Bug Fixes**

Below is the [**list**](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?filter=allissues\&jql=project%20%3D%20%22INJIMOB%22%20AND%20type%20%3D%20Bug%20AND%20labels%20%3D%20qa-inji_mob_release0150_closed%20ORDER%20BY%20created%20DESC) of fixes as part of the **0.15.0** release:

| **Jira Issue**                                                      | **Issue Description**                                                                                                                              |
| ------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| [**INJIMOB-2880**](https://mosip.atlassian.net/browse/INJIMOB-2880) | Sunbird insurance VC download is failing with Ed25519 key                                                                                          |
| [**INJIMOB-2778**](https://mosip.atlassian.net/browse/INJIMOB-2778) | Automation(VC Verifier) - Verification of the mDL (mso\_mdoc) against VC Verifier library is failing with no classFoundException                   |
| [**INJIMOB-2576**](https://mosip.atlassian.net/browse/INJIMOB-2576) | Disable the toggle for the biometric, but do not provide a passcode. Close and reopen the application; it still asks for a passcode to log in.     |
| [**INJIMOB-2572**](https://mosip.atlassian.net/browse/INJIMOB-2572) | qa-inji1 - Issuer page is not loading                                                                                                              |
| [**INJIMOB-2549**](https://mosip.atlassian.net/browse/INJIMOB-2549) | DL VC download is failing in qa-inji1                                                                                                              |
| [**INJIMOB-2548**](https://mosip.atlassian.net/browse/INJIMOB-2548) | INJIMOB- We are unable to download the MOSIP VC using the RegClient UIN, as it shows an 'Invalid UIN' error                                        |
| [**INJIMOB-2525**](https://mosip.atlassian.net/browse/INJIMOB-2525) | The Help icon should be consistent across all pages.                                                                                               |
| [**INJIMOB-2524**](https://mosip.atlassian.net/browse/INJIMOB-2524) | Intermittent download errors occur, causing the application to become unusable.                                                                    |
| [**INJIMOB-2522**](https://mosip.atlassian.net/browse/INJIMOB-2522) | After performing backup and restore, and then removing a VC, the actual count of VCs and the VCs present in the wallet are mismatched.             |
| [**INJIMOB-2462**](https://mosip.atlassian.net/browse/INJIMOB-2462) | Error screen CTAs not working in VC download flow                                                                                                  |
| [**INJIMOB-2450**](https://mosip.atlassian.net/browse/INJIMOB-2450) | Injimobile- The download VC is stuck in a loading state                                                                                            |
| [**INJIMOB-2324**](https://mosip.atlassian.net/browse/INJIMOB-2324) | Intermediately We are unable to download the mock mdl VC; an error message appears.                                                                |
| [**INJIMOB-2311**](https://mosip.atlassian.net/browse/INJIMOB-2311) | We are unable to download the mosip VC; an error message appears.                                                                                  |
| [**INJIMOB-2310**](https://mosip.atlassian.net/browse/INJIMOB-2310) | IOS - when biometric is cancelled multiple times during app launch the app data is deleted.                                                        |
| [**NJIMOB-2264**](https://mosip.atlassian.net/browse/INJIMOB-2264)  | Online login is failing with inji app crash from device                                                                                            |
| [**INJIMOB-2252**](https://mosip.atlassian.net/browse/INJIMOB-2252) | INJI - After providing biometric authentication, if the user clicks the cancel button, they should not be allowed to successfully download the VC. |
| [**INJIMOB-2228**](https://mosip.atlassian.net/browse/INJIMOB-2228) | Inji- We are unable to download the VC via MOSIP ID due to an error message stating 'Failed to send OTP.                                           |
| [**INJIMOB-2227**](https://mosip.atlassian.net/browse/INJIMOB-2227) | Inji- The link from the help page leads to a 'Page Not Found' error when clicked                                                                   |
| [**INJIMOB-2214**](https://mosip.atlassian.net/browse/INJIMOB-2214) | INJI- Intermittently, we are unable to download Sunbird as a 'Something went wrong' screen is being displayed.                                     |
| [**INJIMOB-2146**](https://mosip.atlassian.net/browse/INJIMOB-2146) | In INJI Mobile app, the issue type fails to load after selecting an issuer on Android and iOS devices.                                             |
| [**INJIMOB-2122**](https://mosip.atlassian.net/browse/INJIMOB-2122) | INJIMOB - Along with Insurance certify VC, an extra mock VC is getting downloaded                                                                  |
| [**INJIMOB-2120**](https://mosip.atlassian.net/browse/INJIMOB-2120) | INJIMOB - Mock certify and mock fallback VC downloaded background color not reflecting, Only after close and reopen app it is reflecting           |
| [**INJIMOB-2098**](https://mosip.atlassian.net/browse/INJIMOB-2098) | INJIMOB - About inji detail is different from IOS to android                                                                                       |
| [**INJIMOB-2048**](https://mosip.atlassian.net/browse/INJIMOB-2048) | Biometrics Toggle stop working after Inji tour guide is dismissed                                                                                  |
| [**INJIMOB-2042**](https://mosip.atlassian.net/browse/INJIMOB-2042) | INJIMOB- QR login is not working, we 're sorry! due to technical error we are unable to serve your request now .please try again later             |
| [**INJIMOB-1956**](https://mosip.atlassian.net/browse/INJIMOB-1956) | INJIMOB- intermediately , the QR login is not working. We are encountering an error message.                                                       |
| [**INJIMOB-1910**](https://mosip.atlassian.net/browse/INJIMOB-1910) | In the INJI 0.12x version, issues with downloading their UIN cards.                                                                                |
| [**INJIMOB-1894**](https://mosip.atlassian.net/browse/INJIMOB-1894) | User is getting a 'Technical error' message on the first attempt to download the VC after restarting the certify pod                               |
| [**INJIMOB-1856**](https://mosip.atlassian.net/browse/INJIMOB-1856) | Injimobile- After we removed the mandatory configuration for the Mock issuer is not showing the error message in UI                                |
| [**INJIMOB-1837**](https://mosip.atlassian.net/browse/INJIMOB-1837) | Search box close button is not working unless invoked on a specific point                                                                          |

### **Documentation Details**

* [Feature Documentation](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features)
* [Integration Guides](https://docs.mosip.io/inji/inji-mobile-wallet/integration-guide)
* [User Guide](https://docs.mosip.io/inji/inji-mobile-wallet/end-user-guide)
* [QA Report](test-report.md)
* [API Documentation](https://github.com/mosip/mimoto/tree/release-0.15.x/docs/postman-collections)





