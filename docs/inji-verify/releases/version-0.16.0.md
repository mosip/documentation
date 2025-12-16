# Version 0.16.0

**Release Name**: Inji Verify v0.16.0

**Support**: Developer Release

**Release Date**: <mark style="color:red;">**Coming Soon**</mark>

### **Overview** <a href="#overview" id="overview"></a>

We are excited to announce the release of **Inji Verify v0.16.0.** This version introduces the **revocation feature, multi-lingual support, SVG Rendering,** and **MOSIP UIN VC Verification.**

#### **New Features:** <a href="#new-features" id="new-features"></a>

1. **Revocation:** Inji Verify now supports real-time revocation checks using the W3C Status List 2021 mechanism. During verification, the system reads the credentialStatus field, fetches the issuer’s Status List Credential, validates its proof, and determines whether the credential is valid, revoked, suspended, or invalid. The verification result is displayed clearly while preserving the VC’s original layout. This enhancement ensures secure, privacy-preserving, standards-compliant verification without exposing user data.
2. **Multi-Lingual Support:** Inji Verify now supports viewing credential data and verification results in multiple languages. The system auto-detects the browser language (defaulting to English) and displays all VC claims, metadata, and validation outcomes accordingly. Users can switch languages without affecting verification results or credential layout, ensuring clarity and consistency across regions.
3. **SVG Rendering:** Inji Verify now supports rendering Verifiable Credentials using SVG templates, ensuring the credential’s original design, layout, fonts, and branding remain intact. Verification results (Valid/Invalid/Expired) are overlaid seamlessly without altering the visual integrity. The system also supports uploading QR codes in SVG and other compatible formats, with improved error handling, consistent UI, and accessibility compliance.
4. **MOSIP UIN VC Verification**: Inji Verify now fully supports the verification of MOSIP-issued UIN Verifiable Credentials, enabling seamless, secure, and standards-based validation of identity information. The system automatically decodes the UIN VC, validates its cryptographic proof, checks its revocation status, and displays a clear verification outcome—while preserving the credential’s original visual design. This enhancement ensures verifiers can confidently authenticate MOSIP UIN credentials across services, improving interoperability, trust, and user experience within the MOSIP ecosystem.

**Note:** The Inji Verify UI is a _reference implementation_ to demonstrate orchestration. Developers can selectively embed SDK components in the verifier applications as per their needs.

### **Repositories: Released/Dependent** <a href="#repositories-released-dependent" id="repositories-released-dependent"></a>

| **Repositories** | **Tags: Released/Dependent** |
| ---------------- | ---------------------------- |
| Inji Verify      | **v0.16.0**                  |

&#x20;

### **Projects: Released** <a href="#projects-released" id="projects-released"></a>

**Inji Verify Repo** → 4 projects (all these projects are of same version) as below:

i) inji-verify-service - `<Insert Link Here>`

ii) inji-verify-ui (ref implementation) - `<Insert Link Here>`

iii) SDK - `<Insert Link Here>`

iv) API-Test - `<Insert Link Here>`

&#x20;

### **Compatible modules:** <a href="#compatible-modules" id="compatible-modules"></a>

The following table outlines the tested and certified compatibility of Inji Verify 0.10.0 with other modules.

| **Module**          | **Version**                                                         |
| ------------------- | ------------------------------------------------------------------- |
| Inji Wallet         | [0.20.0](https://github.com/mosip/inji-wallet/releases/tag/v0.20.0) |
| Inji Web            | [0.14.0](https://github.com/mosip/inji-web/releases/tag/v0.14.1)    |
| Pixel-Pass library  | [0.7.0](https://github.com/mosip/pixelpass/releases/tag/v0.7.0)     |
| vc-verifier library | [1.5.0](https://github.com/mosip/vc-verifier/releases/tag/v1.5.0)   |

&#x20;

### **Bug Fixes** <a href="#bug-fixes" id="bug-fixes"></a>

Below is the list of fixes as part of the **0.16.0** release:

**Query**: project=injiver and fixVersion=0.16.0 and issuetype=bug

&#x20;

| Key                                                                                   | Summary                                                                                                                |
| ------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1461">INJIVER-1461</a><br></p> | <p>INJI-VERIFY - Request verifiable credential button is not aligned in arabic language RTL<br></p>                    |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1442">INJIVER-1442</a><br></p> | <p>INJI-VERIFY: Premature Expiry and Page Reload When Verifying VCs Sequentially<br></p>                               |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1441">INJIVER-1441</a><br></p> | <p>INJI-VERIFY: Incorrect Error Message Displayed on VC Verification<br></p>                                           |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1440">INJIVER-1440</a><br></p> | <p>INJI-VERIFY - Mis-alignment in "download" and "open in flow" button<br></p>                                         |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1436">INJIVER-1436</a><br></p> | <p>Secuirty testing: inji-verify(0.16.0) - docker vulnerabilities as per Snyk report<br></p>                           |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1424">INJIVER-1424</a><br></p> | <p>INJI-VERIFY - Language dropdown values are missing locators to locate them<br></p>                                  |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1406">INJIVER-1406</a><br></p> | <p>Unable to verify a newly created vc in qa-inji1 environment<br></p>                                                 |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1399">INJIVER-1399</a><br></p> | <p>For farmer VC we are seeing N/A in Inji Verify UI<br></p>                                                           |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1395">INJIVER-1395</a><br></p> | <p>Getting error when we try to upload a TAN VC<br></p>                                                                |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1393">INJIVER-1393</a><br></p> | <p>INJI-verify - cross device flow is failing in specific set of device<br></p>                                        |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1392">INJIVER-1392</a><br></p> | <p>INJI-verify - Same device flow is failing in specific set of device<br></p>                                         |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1391">INJIVER-1391</a><br></p> | <p>INJI-verify - Old MOSIP data share VC verification is failing<br></p>                                               |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1328">INJIVER-1328</a><br></p> | <p>Fix the "reliability bugs" in sonar for "verify-ui" in "develop" branch<br></p>                                     |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1326">INJIVER-1326</a><br></p> | <p>Security testing: Inji-verify :Using user-controlled data in methods such as innerHTML, outerHTML<br></p>           |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1323">INJIVER-1323</a><br></p> | <p>Security testing: Inji-verify: Using setAccessible(true) issue<br></p>                                              |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1322">INJIVER-1322</a><br></p> | <p>Security testing: inji-verify :Using dynamic expressions to access object properties<br></p>                        |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1321">INJIVER-1321</a><br></p> | <p>Security testing: update vulnerable libraries in api-test/pom.xml &#x26; ui-test/pom.xml as per Snyk report<br></p> |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1310">INJIVER-1310</a><br></p> | <p>Security Testing (0.14.0 / 0.16.0): License Compliance Issue<br></p>                                                |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1308">INJIVER-1308</a><br></p> | <p>Support SD-JWT verification submitted via "/vc-submission" in the "/vp-result/{transactionId}"<br></p>              |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1226">INJIVER-1226</a><br></p> | <p>INJI Verify - In mobile view we dont have copyrights-content present in upload screen<br></p>                       |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1220">INJIVER-1220</a><br></p> | <p>INJI-verify - error message for expired scan scenario is not proper<br></p>                                         |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1218">INJIVER-1218</a><br></p> | <p>INJI-verify - Scan and Upload component's loading bar is not aligned in middle<br></p>                              |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1103">INJIVER-1103</a><br></p> | <p>injiweb: no.of field values in VC document and scanned documnet are not the same<br></p>                            |
| <p><a href="https://mosip.atlassian.net/browse/INJIVER-1069">INJIVER-1069</a><br></p> | <p>INJI-verify - The MOSIP UIN VC's created from reg-client are not verifiable from INJI-verify<br></p>                |

Synced just now•[24 items](https://mosip.atlassian.net/issues/?jql=project%3Dinjiver%20and%20fixVersion%3D0.16.0%20and%20issuetype%3DBug)

&#x20;

### **User Stories**: <a href="#user-stories" id="user-stories"></a>

| **Jira ID**                                                                                                                                                                                                                                                                                     | **Description**                                                                                                                                                                                                                                                                                                                                                                            |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [INJIVER-1404: Add "redirect\_uri" (without response\_code) in the response body of "/vp-submission/direct-post" endpoint to support OpenID4VP Web Online Sharing Fixed](https://mosip.atlassian.net/browse/INJIVER-1404)                                                                       | For same-device verification, some devices may experience browser background throttling after the wallet POST, leading to long-polling `/status` timeouts and resulting Verifier UI errors. To address this, the `/vp-submission/direct-post` endpoint now includes a `redirect_uri` in its response body, enabling OpenID4VP Web Online Sharing to provide a more reliable fallback flow. |
| [INJIVER-1370: Ability to Verify MOSIP UIN VCs - Data Share VC with full OpenIDVP flowTesting](https://mosip.atlassian.net/browse/INJIVER-1370)                                                                                                                                                 | Inji Verify supports full verification of MOSIP UIN VCs, including proof validation and revocation checks, for trusted identity authentication.                                                                                                                                                                                                                                            |
| [INJIVER-1362: Multi Language: As a Verifier, I want to view the VC data in multiple languages, so that users across different regions can understand the credential information in their preferred language.Testing](https://mosip.atlassian.net/browse/INJIVER-1362)                          | Inji Verify now displays VC data and verification results in multiple languages with automatic detection and seamless language switching.                                                                                                                                                                                                                                                  |
| [INJIVER-1361: SVG Render: As a verifier, I should be able to render the VC Verification result while maintaining the original design/ layout of the VC, so that the original design and visual integrity of the credential is intact.Testing](https://mosip.atlassian.net/browse/INJIVER-1361) | Inji Verify now renders VCs using SVG templates to preserve original design while overlaying verification results without altering visual integrity.                                                                                                                                                                                                                                       |
| [INJIVER-1358: Revocation: As a Verifier, I should be able to read the flag status in the VC, so that I can know if the VC has been revoked or notTesting](https://mosip.atlassian.net/browse/INJIVER-1358)                                                                                     | Inji Verify now performs real-time revocation checks using W3C Status List 2021, ensuring secure and privacy-preserving validation of credential status.                                                                                                                                                                                                                                   |
| [INJIVER-1308: Support SD-JWT verification submitted via "/vc-submission" in the "/vp-result/{transactionId}" Fixed](https://mosip.atlassian.net/browse/INJIVER-1308)                                                                                                                           | Inji Verify now supports SD-JWT credential submissions via `/vc-submission`, automatically generating a `transactionId` when one is not provided and storing the credential for processing. Verifiers can then retrieve the full VC and its verification status through `/vp-result/{transactionId}`, enabling seamless end-to-end SD-JWT verification.                                    |

### **Known Issues** <a href="#known-issues" id="known-issues"></a>

Below is a list of some key known issues. For a detailed overview and the complete list of issues related to Inji Verify, please click [**here.**](https://mosip.atlassian.net/issues/?jql=project%20%3D%20%22INJIVER%22%20AND%20status%20not%20in%20%28Closed%2C%20Canceled%29%20AND%20type%20%3D%20Bug%20ORDER%20BY%20created%20DESC)

| **Jira ID**                                                                                                                                                                                                                             | **Description**                                                                                                                                                                                                                                                                                                                                                                   |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [INJIVER-1061: INJIVER- In OVP, after scanning the health insurance QR code in the injiwallet app, it is displaying the life insurance VC.New](https://mosip.atlassian.net/browse/INJIVER-1061)                                         | In OpenID4VP (Cross device)component, after scanning the health insurance QR code in the injiwallet app, it is displaying the life insurance VC.                                                                                                                                                                                                                                  |
| [INJIVER-1131: INJI-verify - OVP component is validating success even when a wrong VC is sent New](https://mosip.atlassian.net/browse/INJIVER-1131)                                                                                     | The OpenID4VP (Cross device) component in Inji Verify currently validates a presentation as successful even when a wrong Verifiable Credential (VC) is submitted. As a temporary workaround, implement credential type validation on the Relaying Party (RP) side, by verifying that the received VC matches the expected type defined in the original `presentation_definition`. |
| [INJIVER-1062: INJVER - We are uploading an invalid QR code, and while it displays an error message stating that the QR code is invalid, the credential details are still visible.New](https://mosip.atlassian.net/browse/INJIVER-1062) | We are uploading an invalid QR code, and while it displays an error message stating that the QR code is invalid, the credential details are still visible.                                                                                                                                                                                                                        |
| [INJIVER-1063: INJIVER- On iPhone 8 and iPhone 7, uploading the Injiweb QR code PDF shows an error message.New](https://mosip.atlassian.net/browse/INJIVER-1063)                                                                        | On iPhone 8 and iPhone 7, uploading the Injiweb QR code PDF shows an error message.                                                                                                                                                                                                                                                                                               |
| [INJIVER-625: INJI-Verify Upload Not Functioning on Mac Safari Browser Versions 16 and BelowAssigned](https://mosip.atlassian.net/browse/INJIVER-625)                                                                                   | Inji Verify - Upload not functioning on Mac Safari Browser Versions 16 and below.                                                                                                                                                                                                                                                                                                 |
| [INJIVER-1220: INJI-verify - error message for expired scan scenario is not proper Testing](https://mosip.atlassian.net/browse/INJIVER-1220)                                                                                            | User friendly error message is not displayed for expired session scenario                                                                                                                                                                                                                                                                                                         |
| [INJIVER-1194: INJI Verify SDK should support non-react components New](https://mosip.atlassian.net/browse/INJIVER-1194)                                                                                                                | INJI Verify SDK should be able to support integration with applications built on platforms beyond _React (Typescript) applications_, such as Angular, PHP, and others.                                                                                                                                                                                                            |
| [INJIVER-1069: INJI-verify - The MOSIP UIN VC's created from reg-client are not verifiable from INJI-verifyTesting](https://mosip.atlassian.net/browse/INJIVER-1069)                                                                    | The MOSIP UIN VCs generated via reg-client are currently not verifiable through INJI Verify.                                                                                                                                                                                                                                                                                      |
| [INJIVER-979: Inji verify backend scalability issueNew](https://mosip.atlassian.net/browse/INJIVER-979)                                                                                                                                 | Long-polling listeners are implemented within the service layer, preventing the backend from scaling effectively in a multi-pod (distributed) environment.                                                                                                                                                                                                                        |

### **Documentation** <a href="#documentation" id="documentation"></a>

* [Feature documentation](https://docs.inji.io/inji-verify/overview/features)
* [Integration Guide](https://docs.inji.io/inji-verify/technical-overview/integration-guides)
* [API Documentation](https://mosip.stoplight.io/studio/inji-verify)
* [Collab Guide](https://mosip.atlassian.net/wiki/spaces/PROD/pages/1306984580)
* QA Report
