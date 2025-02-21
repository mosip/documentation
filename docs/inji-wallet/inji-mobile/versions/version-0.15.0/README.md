# Version 0.15.0

**Release Name:** Inji Wallet 0.15.0

**Release Type:** Developer

**Release Date:** 18th Feb, 2025

### **Overview:**

We are excited to announce the release of Inji Wallet Version 0.15.0! This update brings significant improvements in credential handling, security enhancements, and expanded format support. Here are the key highlights of this release:

### **Key Highlights:**

* **PixelPass - CWT Decode:** Enhanced PixelPass capabilities with support for CWT decoding, increasing versatility in credential handling.
* **Support for Different VC Formats:** Inji Wallet now supports various verifiable credential formats, including mDoc, mDL, and CBOR, broadening interoperability.
* **W3C-Based Wallet Rendering:** Improved rendering for W3C-based verifiable credentials, ensuring seamless display and user experience.
* **Key Generation Enhancements:** Added support for ECC (R1 & K1) and Ed25519 key generation, enhancing cryptographic flexibility.
* **OpenID4VP (Online Sharing):** Implemented support for OpenID4VP, enabling secure online credential sharing.
* **VC Verification SDK Updates:**
  * Added RSA support for Kotlin and Java SDKs.
  * Added EdDSA support for Kotlin and Java SDKs.

### **Features Covered:**

* **PixelPass Enhancements:**
  * Added CWT decoding capabilities to enhance credential handling.
* **Expanded VC Format Support:**
  * Support for mDoc, mDL, and CBOR formats to improve compatibility across different ecosystems.
* **W3C Rendering:**
  * Improved rendering logic for better user interface consistency and compliance with W3C standards.
* **Cryptographic Key Generation:**
  * ECC (R1 & K1) key generation.
  * Ed25519 key generation for improved security.
* **OpenID4VP Implementation:**
  * Enabled online sharing of credentials via OpenID4VP protocol.
* **VC Verification SDK Enhancements:**
  * RSA support added for Kotlin and Java SDKs.
  * EdDSA support added for Kotlin and Java SDKs.
  * Swift SDK support removed.

### **Repository Released**

| **Module**                | **Version**                                                                  |
| ------------------------- | ---------------------------------------------------------------------------- |
| Inji Mobile Wallet        | [**v0.15.0**](https://github.com/mosip/inji-wallet/tree/v0.15.0)             |
| mimoto                    | [**v0.15.2**](https://github.com/mosip/mimoto/tree/v0.15.2)                  |
| vc-verifier               | [**v1.1.0**](https://github.com/mosip/vc-verifier/tree/v1.1.0)               |
| inji-openid4vp-ios-swift  | [**v0.1.0**](https://github.com/mosip/inji-openid4vp-ios-swift/tree/v0.1.0)  |
| inji-openid4vp            | [**v0.1.0**](https://github.com/mosip/inji-openid4vp/tree/v0.1.0)            |
| inji-vci-client-ios-swift | [**v0.2.0**](https://github.com/mosip/inji-vci-client-ios-swift/tree/v0.2.0) |
| inji-vci-client           | [**v0.2.0**](https://github.com/mosip/inji-vci-client/tree/v0.2.0)           |
| secure-keystore-ios-swift | [**v0.3.0**](https://github.com/mosip/secure-keystore-ios-swift/tree/v0.3.0) |
| secure-keystore           | [**v0.3.0**](https://github.com/mosip/secure-keystore/tree/v0.3.0)           |
| pixelpass-ios-swift       | [**v0.6.0**](https://github.com/mosip/pixelpass-ios-swift/tree/v0.6.0)       |
| pixelpass                 | [**v0.6.0**](https://github.com/mosip/pixelpass/tree/v0.6.0)                 |

### **Compatible Modules**

| **Module**       | **Version**                                                                 |
| ---------------- | --------------------------------------------------------------------------- |
| Inji-config      | [**0.5.0**](https://github.com/mosip/inji-config/tree/v0.5.0)               |
| eSignet          | [**1.5.0**](https://github.com/mosip/esignet/tree/v1.5.0)                   |
| Inji Certify     | [**0.10.1**](https://github.com/mosip/inji-certify/tree/v0.10.1)            |
| Inji Verify      | [**v0.10.0**](https://github.com/mosip/inji-verify/tree/v0.10.0)            |
| tuvali           | [**v0.5.1**](https://github.com/mosip/tuvali/tree/v0.5.1)                   |
| tuvali-ios-swift | [**v0.5.0**](https://github.com/mosip/tuvali-ios-swift/releases/tag/v0.5.0) |

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

| **Jira Issue**                                                      | **Issue Description**                                                                                                                             |
| ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| [**INJIMOB-2880**](https://mosip.atlassian.net/browse/INJIMOB-2880) | Sunbird insurance VC download is failing with Ed25519 key                                                                                         |
| [**INJIMOB-2778**](https://mosip.atlassian.net/browse/INJIMOB-2778) | Automation(VC Verifier) - Verification of the mDL (mso\_mdoc) against VC Verifier library is failing with no classFoundException                  |
| [**INJIMOB-2576**](https://mosip.atlassian.net/browse/INJIMOB-2576) | Disable the toggle for the biometric, but do not provide a passcode. Close and reopen the application; it still asks for a passcode to log in     |
| [**INJIMOB-2572**](https://mosip.atlassian.net/browse/INJIMOB-2572) | qa-inji1 - Issuer page is not loading                                                                                                             |
| [**INJIMOB-2549**](https://mosip.atlassian.net/browse/INJIMOB-2549) | DL VC download is failing in qa-inji1                                                                                                             |
| [**INJIMOB-2548**](https://mosip.atlassian.net/browse/INJIMOB-2548) | INJIMOB- We are unable to download the MOSIP VC using the RegClient UIN, as it shows an 'Invalid UIN' error                                       |
| [**INJIMOB-2525**](https://mosip.atlassian.net/browse/INJIMOB-2525) | The Help icon should be consistent across all pages                                                                                               |
| [**INJIMOB-2524**](https://mosip.atlassian.net/browse/INJIMOB-2524) | Intermittent download errors occur, causing the application to become unusable                                                                    |
| [**INJIMOB-2522**](https://mosip.atlassian.net/browse/INJIMOB-2522) | After performing backup and restore, and then removing a VC, the actual count of VCs and the VCs present in the wallet are mismatched             |
| [**INJIMOB-2462**](https://mosip.atlassian.net/browse/INJIMOB-2462) | Error screen CTAs not working in VC download flow                                                                                                 |
| [**INJIMOB-2450**](https://mosip.atlassian.net/browse/INJIMOB-2450) | Injimobile- The download VC is stuck in a loading state                                                                                           |
| [**INJIMOB-2324**](https://mosip.atlassian.net/browse/INJIMOB-2324) | Intermediately We are unable to download the mock mdl VC; an error message appears.                                                               |
| [**INJIMOB-2311**](https://mosip.atlassian.net/browse/INJIMOB-2311) | We are unable to download the mosip VC; an error message appears                                                                                  |
| [**INJIMOB-2310**](https://mosip.atlassian.net/browse/INJIMOB-2310) | IOS - when biometric is cancelled multiple times during app launch the app data is deleted                                                        |
| [**NJIMOB-2264**](https://mosip.atlassian.net/browse/INJIMOB-2264)  | Online login is failing with inji app crash from device                                                                                           |
| [**INJIMOB-2252**](https://mosip.atlassian.net/browse/INJIMOB-2252) | INJI - After providing biometric authentication, if the user clicks the cancel button, they should not be allowed to successfully download the VC |
| [**INJIMOB-2228**](https://mosip.atlassian.net/browse/INJIMOB-2228) | Inji- We are unable to download the VC via MOSIP ID due to an error message stating 'Failed to send OTP                                           |
| [**INJIMOB-2227**](https://mosip.atlassian.net/browse/INJIMOB-2227) | Inji- The link from the help page leads to a 'Page Not Found' error when clicked                                                                  |
| [**INJIMOB-2214**](https://mosip.atlassian.net/browse/INJIMOB-2214) | INJI- Intermittently, we are unable to download Sunbird as a 'Something went wrong' screen is being displayed                                     |
| [**INJIMOB-2146**](https://mosip.atlassian.net/browse/INJIMOB-2146) | In INJI Mobile app, the issue type fails to load after selecting an issuer on Android and iOS devices                                             |
| [**INJIMOB-2122**](https://mosip.atlassian.net/browse/INJIMOB-2122) | INJIMOB - Along with Insurance certify VC, an extra mock VC is getting downloaded                                                                 |
| [**INJIMOB-2120**](https://mosip.atlassian.net/browse/INJIMOB-2120) | INJIMOB - Mock certify and mock fallback VC downloaded background color not reflecting, Only after close and reopen app it is reflecting          |
| [**INJIMOB-2098**](https://mosip.atlassian.net/browse/INJIMOB-2098) | INJIMOB - About inji detail is different from IOS to android                                                                                      |
| [**INJIMOB-2048**](https://mosip.atlassian.net/browse/INJIMOB-2048) | Biometrics Toggle stop working after Inji tour guide is dismissed                                                                                 |
| [**INJIMOB-2042**](https://mosip.atlassian.net/browse/INJIMOB-2042) | INJIMOB- QR login is not working, we 're sorry! due to technical error we are unable to serve your request now, please try again later            |
| [**INJIMOB-1956**](https://mosip.atlassian.net/browse/INJIMOB-1956) | INJIMOB- intermediately , the QR login is not working. We are encountering an error message                                                       |
| [**INJIMOB-1910**](https://mosip.atlassian.net/browse/INJIMOB-1910) | In the INJI 0.12x version, issues with downloading their UIN cards                                                                                |
| [**INJIMOB-1894**](https://mosip.atlassian.net/browse/INJIMOB-1894) | User is getting a 'Technical error' message on the first attempt to download the VC after restarting the certify pod                              |
| [**INJIMOB-1856**](https://mosip.atlassian.net/browse/INJIMOB-1856) | Injimobile- After we removed the mandatory configuration for the Mock issuer is not showing the error message in UI                               |
| [**INJIMOB-1837**](https://mosip.atlassian.net/browse/INJIMOB-1837) | Search box close button is not working unless invoked on a specific point                                                                         |

* [Feature Documentation](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features)
* [Integration Guides](https://docs.mosip.io/inji/inji-mobile-wallet/integration-guide)
* [User Guide](https://docs.mosip.io/inji/inji-mobile-wallet/end-user-guide)
* [QA Report](https://docs.inji.io/inji-wallet/inji-mobile/versions/version-0.15.0/test-report)
* [API Documentation](https://github.com/mosip/mimoto/tree/release-0.15.x/docs/postman-collections)
