# Version 0.16.0

**Release Name:** Inji Wallet 0.16.0

**Release Type:** Developer

**Release Date:** 28th April, 2025

### **Overview**

We are excited to announce the release of **Inji Wallet Version 0.16.0!** This update introduces major enhancements to security, metadata management, standards compliance, and credential handling. Here's a detailed overview of the latest improvements and features:

### **Key Highlights**

#### **1. ED25519-2020 Key Support**

* **Feature:** VP signing with ED25519Signature2020.
* Inji Mobile now uses a newer, more secure algorithm (ED25519-2020) to sign tokens for better security.
* Inji Mobile now uses the **ED25519-2020** algorithm to sign vp\_token in the OpenID4VP flow, aligning with modern cryptographic standards for improved security and reliability.

#### **2. Authorization Request URI Support**

* **Feature:** Streamlined Authorization Flow with `request_uri`.
* QR codes now include additional information for smoother, error-free authorization requests.
* Supports client\_id, request\_uri, and request\_uri\_method in QR codes.
* Introduced a new **Request URI Endpoint** for generating signed JWT authorization requests.
* Improved error handling and updated OpenID4VP library for seamless integration.

#### **3. Verifier Metadata Management (Kotlin)**

* **Feature:** Support for Multiple Client ID Schemes in OpenID4VP.
* Inji supports different types of verification methods, improving flexibility and error handling in Kotlin.
* Supports verifier validation using:
  * **Pre-registered schemes**
  * **Redirect URI schemes**
  * **DID schemes**
* Includes improved error handling and JOSE header compatibility.

#### **4. Unique UID Generation for VCs**

* **Feature:** Remove id field and generate internal UID.
* Each Verifiable Credential (VC) now gets a unique ID that remains the same across backup and restore.
* Generates a **UUID (v4)** as a unique identifier during VC download.
* UID is used for file naming and remains consistent across backup/restore.
* Independent of id field presence in VC response.

#### **5. Dynamic Well-Known Endpoint Discovery**

* **Feature:** Standards-compliant endpoint resolution.
* Inji automatically finds the right URLs for issuers, reducing configuration complexity.
* Constructs well-known URL dynamically using credential\_issuer\_host.
* Removed fallback JSONs from config.
* Issuers are now responsible for redirection handling.
* Ensures compliance with **OpenID4VCI** spec and simplifies config management.

#### **6. Verifier Metadata Management (Swift)**

* **Feature:** Support for Metadata Validation in iOS.
* Inji on iOS now supports various verification methods and ensures secure token handling.
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

### Features Released

| **List of New Features**                                                                                                                     | **Jira Links**                                                  |
| -------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| <p><strong>Multiple client IDs (Swift)</strong></p><p><em>Support for Multiple Client ID Schemes in OpenID4VP Flow for Swif</em></p>         | [INJIMOB-2325](https://mosip.atlassian.net/browse/INJIMOB-2325) |
| <p><strong>Multiple client IDs (Kotlin)</strong></p><p><em>Support for Multiple Client ID Schemes in OpenID4VP Flow for Kotlin</em></p>      | [INJIMOB-2491](https://mosip.atlassian.net/browse/INJIMOB-2491) |
| <p><strong>Localized Intro Sliders on First Launch</strong></p><p><em>Intro Sliders Enhancement Language to Change as per Selection</em></p> | [INJIMOB-2337](https://mosip.atlassian.net/browse/INJIMOB-2337) |
| <p><strong>Link-Based Presentation Request</strong></p><p><em>Support Request URI for authorization request in OpenIDVP</em></p>             | [INJIMOB-2761](https://mosip.atlassian.net/browse/INJIMOB-2761) |
| **Technical Enhancement to Features**                                                                                                        | **Jira Links**                                                  |
| <p><strong>Unique VC Identifier</strong></p><p><em>Remove "id" from Verifiable Credentials (VC) and Generate a Unique UID</em></p>           | [INJIMOB-2471](https://mosip.atlassian.net/browse/INJIMOB-2471) |
| <p><strong>Added signature format</strong></p><p><em>Use ED25519-2020 key to generate VP proof</em></p>                                      | [INJIMOB-2550](https://mosip.atlassian.net/browse/INJIMOB-2550) |
| <p><strong>Auto-fetch wallet config</strong></p><p><em>Well-known discovery at Inji Mobile to fetch well-known response</em></p>             | [INJIMOB-2452](https://mosip.atlassian.net/browse/INJIMOB-2452) |



### **Repository Released**

| Module                   | Version                                                                 |
| ------------------------ | ----------------------------------------------------------------------- |
| Inji Mobile Wallet       | [0.16.0](https://github.com/mosip/inji-wallet/tree/v0.16.0)             |
| inji-openid4vp-ios-swift | [v0.2.0](https://github.com/mosip/inji-openid4vp-ios-swift/tree/v0.2.0) |
| inji-openid4vp           | [v0.2.0](https://github.com/mosip/inji-openid4vp/tree/v0.2.0)           |
| Tuvali                   | [v0.5.2](https://github.com/mosip/tuvali/tree/v0.5.2)                   |

### **Compatible Modules**

<table><thead><tr><th width="373.78338623046875">Module</th><th>Version</th></tr></thead><tbody><tr><td>mimoto</td><td><a href="https://github.com/mosip/mimoto/tree/v0.17.0">0.17.0</a></td></tr><tr><td>inji-config</td><td><a href="https://github.com/mosip/inji-config/tree/v0.7.0">0.7.0</a></td></tr><tr><td>esignet</td><td><a href="https://github.com/mosip/esignet/tree/v1.4.1">1.4.1</a></td></tr><tr><td>inji-certify</td><td><a href="https://github.com/mosip/inji-certify/tree/v0.10.1">0.10.1</a></td></tr><tr><td>pixelpass</td><td><a href="https://github.com/mosip/pixelpass/tree/v0.6.0">0.6.0</a></td></tr><tr><td>secure-keystore</td><td><a href="https://github.com/mosip/secure-keystore/tree/v0.3.0">0.3.0</a></td></tr><tr><td>secure-keystore-ios-swift</td><td><a href="https://github.com/mosip/secure-keystore-ios-swift/tree/v0.3.0">0.3.0</a></td></tr><tr><td>inji-vci-client</td><td><a href="https://github.com/mosip/inji-vci-client/tree/v0.2.0">0.2.0</a></td></tr><tr><td>tuvali-ios-swift</td><td><a href="https://github.com/mosip/tuvali-ios-swift/releases/tag/v0.5.0">0.5.0</a></td></tr><tr><td>inji-vci-client-ios-swift</td><td><a href="https://github.com/mosip/inji-vci-client-ios-swift/tree/v0.2.1">0.2.1</a></td></tr><tr><td>pixelpass-ios-swift</td><td><a href="https://github.com/mosip/pixelpass-ios-swift/tree/v0.6.1">0.6.1</a></td></tr><tr><td>vc-verifier</td><td><a href="https://github.com/mosip/vc-verifier/tree/v1.2.0">1.2.0</a></td></tr></tbody></table>

### **Known Issues**

Below is the list of [**known**](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?jql=project%20%3D%20%22INJIMOB%22%20AND%20type%20%3D%20Bug%20AND%20status%20IN%20%28New%2C%20Assigned%29%20ORDER%20BY%20created%20DESC) issues. To read in detail click [**here**](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?jql=project%20%3D%20%22INJIMOB%22%20AND%20type%20%3D%20Bug%20AND%20status%20IN%20%28New%2C%20Assigned%29%20ORDER%20BY%20created%20DESC)**..**

<table data-header-hidden><thead><tr><th width="256.00994873046875"></th><th></th></tr></thead><tbody><tr><td><strong>Jira Issue</strong></td><td><strong>Issue Description</strong></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2901"><strong>INJIMOB-2901</strong></a></td><td>[OpenId4VP] QR data is base64 encoded.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2907"><strong>INJIMOB-2907</strong></a></td><td>Invalid URL Format for OPENID4VP on Android 14 and above version.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2521"><strong>INJIMOB-2521</strong></a></td><td>Search is not working for the VCs from home page.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2241"><strong>INJIMOB-2241</strong></a></td><td>INJI- In the Credential Registry popup, when entering an invalid URL in the 'Edit Credential Registry' field, the error message is overlapping.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2159"><strong>INJIMOB-2159</strong></a></td><td>The activation VC is not working for a second time on the same device; the same VC displays a technical error message.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-1852"><strong>INJIMOB-1852</strong></a></td><td>After we removed the mandatory configuration for the Mock issuer is not showing the error message in UI.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-1603"><strong>INJIMOB-1603</strong></a></td><td>During face authentication, the camera view is not opening in all IOS device.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-1336"><strong>INJIMOB-1336</strong></a></td><td>Automation run for sanity is failing few scenarios.</td></tr></tbody></table>

### **Bug Fixes**

Below is the [**list**](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?filter=allissues\&jql=project%20%3D%20%22INJIMOB%22%20AND%20type%20%3D%20Bug%20AND%20labels%20%3D%20qa-inji_mob_release0150_closed%20ORDER%20BY%20created%20DESC) of fixes as part of the **0.16.0** release:

<table data-header-hidden><thead><tr><th width="263.98223876953125"></th><th></th></tr></thead><tbody><tr><td><strong>Jira Issue</strong></td><td><strong>Issue Description</strong></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2880"><strong>INJIMOB-2880</strong></a></td><td>Sunbird insurance VC download is failing with Ed25519 key.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2778"><strong>INJIMOB-2778</strong></a></td><td>Automation(VC Verifier) - Verification of the mDL (mso_mdoc) against VC Verifier library is failing with no classFoundException.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2576"><strong>INJIMOB-2576</strong></a></td><td>Disable the toggle for the biometric, but do not provide a passcode. Close and reopen the application; it still asks for a passcode to log in.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2572"><strong>INJIMOB-2572</strong></a></td><td>qa-inji1 - Issuer page is not loading.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2549"><strong>INJIMOB-2549</strong></a></td><td>DL VC download is failing in qa-inji1.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2548"><strong>INJIMOB-2548</strong></a></td><td>INJIMOB- We are unable to download the MOSIP VC using the RegClient UIN, as it shows an 'Invalid UIN' error.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2525"><strong>INJIMOB-2525</strong></a></td><td>The Help icon should be consistent across all pages.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2524"><strong>INJIMOB-2524</strong></a></td><td>Intermittent download errors occur, causing the application to become unusable.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2522"><strong>INJIMOB-2522</strong></a></td><td>After performing backup and restore, and then removing a VC, the actual count of VCs and the VCs present in the wallet are mismatched.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2462"><strong>INJIMOB-2462</strong></a></td><td>Error screen CTAs not working in VC download flow.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2450"><strong>INJIMOB-2450</strong></a></td><td>Injimobile - The download VC is stuck in a loading state.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2324"><strong>INJIMOB-2324</strong></a></td><td>Intermediately We are unable to download the mock mdl VC; an error message appears.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2311"><strong>INJIMOB-2311</strong></a></td><td>We are unable to download the mosip VC; an error message appears.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2310"><strong>INJIMOB-2310</strong></a></td><td>IOS - when biometric is cancelled multiple times during app launch the app data is deleted.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2264"><strong>NJIMOB-2264</strong></a></td><td>Online login is failing with inji app crash from device.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2252"><strong>INJIMOB-2252</strong></a></td><td>INJI - After providing biometric authentication, if the user clicks the cancel button, they should not be allowed to successfully download the VC.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2228"><strong>INJIMOB-2228</strong></a></td><td>Inji- We are unable to download the VC via MOSIP ID due to an error message stating 'Failed to send OTP.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2227"><strong>INJIMOB-2227</strong></a></td><td>Inji- The link from the help page leads to a 'Page Not Found' error when clicked.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2214"><strong>INJIMOB-2214</strong></a></td><td>INJI- Intermittently, we are unable to download Sunbird as a 'Something went wrong' screen is being displayed.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2146"><strong>INJIMOB-2146</strong></a></td><td>In INJI Mobile app, the issue type fails to load after selecting an issuer on Android and iOS devices.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2122"><strong>INJIMOB-2122</strong></a></td><td>INJIMOB - Along with Insurance certify VC, an extra mock VC is getting downloaded.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2120"><strong>INJIMOB-2120</strong></a></td><td>INJIMOB - Mock certify and mock fallback VC downloaded background color not reflecting, Only after close and reopen app it is reflecting.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2098"><strong>INJIMOB-2098</strong></a></td><td>INJIMOB - About inji detail is different from IOS to android.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2048"><strong>INJIMOB-2048</strong></a></td><td>Biometrics Toggle stop working after Inji tour guide is dismissed.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-2042"><strong>INJIMOB-2042</strong></a></td><td>INJIMOB- QR login is not working, we 're sorry! due to technical error we are unable to serve your request now .please try again later.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-1956"><strong>INJIMOB-1956</strong></a></td><td>INJIMOB- intermediately , the QR login is not working. We are encountering an error message.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-1910"><strong>INJIMOB-1910</strong></a></td><td>In the INJI 0.12x version, issues with downloading their UIN cards.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-1894"><strong>INJIMOB-1894</strong></a></td><td>User is getting a 'Technical error' message on the first attempt to download the VC after restarting the certify pod.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-1856"><strong>INJIMOB-1856</strong></a></td><td>Injimobile- After we removed the mandatory configuration for the Mock, issuer is not showing the error message in UI.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-1837"><strong>INJIMOB-1837</strong></a></td><td>Search box close button is not working unless invoked on a specific point.</td></tr></tbody></table>

### **Deprecated**

N/A

### **Documentation**

* [Feature Documentation](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features)
* [Integration Guides](https://docs.mosip.io/inji/inji-mobile-wallet/integration-guide)
* [User Guide](https://docs.mosip.io/inji/inji-mobile-wallet/end-user-guide)
* [QA Report](test-report.md)
* [API Documentation](https://github.com/mosip/mimoto/tree/release-0.15.x/docs/postman-collections)
