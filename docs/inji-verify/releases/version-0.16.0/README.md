# Version 0.16.0

**Release Name**: Inji Verify v0.16.0

**Support**: Developer Release

**Release Date**: 19th December, 2026

## Overview

We are excited to announce the release of **Inji Verify v0.16.0.** This version introduces the **revocation feature, multi-lingual support, SVG Rendering,** and **MOSIP UIN VC Verification.**

## New Features

1. **Revocation:** Inji Verify now supports [real-time revocation checks](https://docs.inji.io/inji-verify/functional-overview/end-user-guide#revoked-credentials) using the [**W3C BitString Status List 2021**](https://www.w3.org/TR/vc-bitstring-status-list/) mechanism. During verification, the system reads the credentialStatus field, fetches the issuer’s Status List Credential, validates its proof, and determines whether the credential is valid, revoked, suspended, or invalid. The verification result is displayed clearly while preserving the VC’s original layout. This enhancement ensures secure, privacy-preserving, standards-compliant verification without exposing user data.
2. **Multi-Lingual Support:** Inji Verify now [supports viewing credential data and verification results in multiple languages](../../functional-overview/end-user-guide/#multilingual-credentials). The system auto-detects the browser language (defaulting to English) and displays all VC claims, metadata, and validation outcomes accordingly. Users can switch languages without affecting verification results or credential layout, ensuring clarity and consistency across regions.
3. **SVG Rendering:** Inji Verify now [supports rendering Verifiable Credentials using SVG templates](../../functional-overview/end-user-guide/#svg-credential-rendering), ensuring the credential’s original design, layout, fonts, and branding remain intact. Verification results (Valid/Invalid/Expired) are overlaid seamlessly without altering the visual integrity. The system also supports uploading QR codes in SVG and other compatible formats, with improved error handling, consistent UI, and accessibility compliance.
4. **MOSIP UIN VC Verification**: Inji Verify now fully supports the verification of MOSIP-issued UIN Verifiable Credentials, enabling seamless, secure, and standards-based validation of identity information. The system automatically decodes the UIN VC, validates its cryptographic proof, checks its revocation status, and displays a clear verification outcome—while preserving the credential’s original visual design. This enhancement ensures verifiers can confidently authenticate MOSIP UIN credentials across services, improving interoperability, trust, and user experience within the MOSIP ecosystem.

{% hint style="success" %}
**Tips:**

* The Inji Verify UI is a _reference implementation_ to demonstrate orchestration. Developers can selectively embed SDK components in the verifier applications as per their needs.
{% endhint %}

## **Repositories: Released/Dependent**

| Repositories | Tags: Released/Dependent                                         |
| ------------ | ---------------------------------------------------------------- |
| Inji Verify  | [**v0.16.0**](https://github.com/mosip/inji-verify/tree/v0.16.0) |

## **Projects: Released**

**Inji Verify Repo** → 4 projects (all these projects are of same version) as below:

i) [inji-verify-service](https://github.com/mosip/inji-verify/tree/release-0.16.x/verify-service)

ii) [inji-verify-ui (ref implementation)](https://github.com/mosip/inji-verify/tree/release-0.16.x/verify-ui)

iii) [SDK](https://github.com/mosip/inji-verify/tree/release-0.16.x/inji-verify-sdk)

iv) [API-Test](https://github.com/mosip/inji-verify/tree/release-0.16.x/api-test)

v) [UI-Test](https://github.com/mosip/inji-verify/tree/release-0.16.x/ui-test)

## Compatible modules

The following table outlines the tested and certified compatibility of Inji Verify 0.16.0 with other modules.

| Module              | Version                                                             |
| ------------------- | ------------------------------------------------------------------- |
| Inji Wallet         | [0.20.0](https://github.com/mosip/inji-wallet/releases/tag/v0.20.0) |
| Inji Web            | [0.14.0](https://github.com/mosip/inji-web/releases/tag/v0.14.1)    |
| Pixel-Pass library  | [0.7.0](https://github.com/mosip/pixelpass/releases/tag/v0.7.0)     |
| vc-verifier library | [1.5.0](https://github.com/mosip/vc-verifier/releases/tag/v1.5.0)   |

## Bug Fixes

Below is the list of fixes as part of the **0.16.0** release, For the list of the total bugs which got fixed, refer [here](https://mosip.atlassian.net/issues/?jql=project%3Dinjiver%20and%20fixVersion%3D0.16.0%20and%20issuetype%3DBug).

<table><thead><tr><th width="196.5703125">JIRA</th><th>Summary</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1461">INJIVER-1461</a><br></td><td>Request verifiable credential button is not aligned in arabic language RTL<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1442">INJIVER-1442</a><br></td><td>Premature Expiry and Page Reload When Verifying VCs Sequentially<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1441">INJIVER-1441</a><br></td><td>Incorrect Error Message Displayed on VC Verification<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1440">INJIVER-1440</a><br></td><td>Mis-alignment in "download" and "open in flow" button<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1436">INJIVER-1436</a><br></td><td>Secuirty testing: inji-verify(0.16.0) - docker vulnerabilities as per Snyk report<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1424">INJIVER-1424</a><br></td><td>Language dropdown values are missing locators to locate them<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1406">INJIVER-1406</a><br></td><td>Unable to verify a newly created vc in qa-inji1 environment<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1399">INJIVER-1399</a><br></td><td>For farmer VC we are seeing N/A in Inji Verify UI<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1395">INJIVER-1395</a><br></td><td>Getting error when we try to upload a TAN VC<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1393">INJIVER-1393</a><br></td><td>Cross device flow is failing in specific set of device<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1392">INJIVER-1392</a><br></td><td>Same device flow is failing in specific set of device<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1391">INJIVER-1391</a><br></td><td>Old MOSIP data share VC verification is failing<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1328">INJIVER-1328</a><br></td><td>Fix the "reliability bugs" in sonar for "verify-ui" in "develop" branch<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1326">INJIVER-1326</a><br></td><td>Security testing: Inji-verify :Using user-controlled data in methods such as innerHTML, outerHTML<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1323">INJIVER-1323</a><br></td><td>Security testing: Inji-verify: Using setAccessible(true) issue<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1322">INJIVER-1322</a><br></td><td>Security testing: inji-verify :Using dynamic expressions to access object properties<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1321">INJIVER-1321</a><br></td><td>Security testing: update vulnerable libraries in api-test/pom.xml &#x26; ui-test/pom.xml as per Snyk report<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1310">INJIVER-1310</a><br></td><td>Security Testing (0.14.0 / 0.16.0): License Compliance Issue<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1308">INJIVER-1308</a><br></td><td>Support SD-JWT verification submitted via "/vc-submission" in the "/vp-result/{transactionId}"<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1226">INJIVER-1226</a><br></td><td>In mobile view we dont have copyrights-content present in upload screen<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1220">INJIVER-1220</a><br></td><td>Error message for expired scan scenario is not proper<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1218">INJIVER-1218</a><br></td><td>Scan and Upload component's loading bar is not aligned in middle<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1103">INJIVER-1103</a><br></td><td>injiweb: no.of field values in VC document and scanned documnet are not the same<br></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1069">INJIVER-1069</a><br></td><td>The MOSIP UIN VC's created from reg-client are not verifiable from INJI-verify<br></td></tr></tbody></table>

## User Stories

<table data-header-hidden><thead><tr><th width="189.90234375"></th><th></th></tr></thead><tbody><tr><td><strong>Jira ID</strong></td><td><strong>Description</strong></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1404">INJIVER-1404</a></td><td>For same-device verification, some devices may experience browser background throttling after the wallet POST, leading to long-polling <code>/status</code> timeouts and resulting Verifier UI errors. To address this, the <code>/vp-submission/direct-post</code> endpoint now includes a <code>redirect_uri</code> in its response body, enabling OpenID4VP Web Online Sharing to provide a more reliable fallback flow.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1370">INJIVER-1370</a></td><td>Inji Verify supports full verification of MOSIP UIN VCs, including proof validation and revocation checks, for trusted identity authentication.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1362">INJIVER-1362</a></td><td>Inji Verify now displays VC data and verification results in multiple languages with automatic detection and seamless language switching.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1361">INJIVER-1361</a></td><td>Inji Verify now renders VCs using SVG templates to preserve original design while overlaying verification results without altering visual integrity.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1358">INJIVER-1358</a></td><td>Inji Verify now performs real-time revocation checks using W3C Status List 2021, ensuring secure and privacy-preserving validation of credential status.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1308">INJIVER-1308</a></td><td>Inji Verify now supports SD-JWT credential submissions via <code>/vc-submission</code>, automatically generating a <code>transactionId</code> when one is not provided and storing the credential for processing. Verifiers can then retrieve the full VC and its verification status through <code>/vp-result/{transactionId}</code>, enabling seamless end-to-end SD-JWT verification.</td></tr></tbody></table>

## Known Issues

Below is a list of some key known issues. For a detailed overview and the complete list of issues related to Inji Verify, please click [**here.**](https://mosip.atlassian.net/issues/?jql=project%20%3D%20%22INJIVER%22%20AND%20status%20not%20in%20%28Closed%2C%20Canceled%29%20AND%20type%20%3D%20Bug%20ORDER%20BY%20created%20DESC)

<table data-header-hidden><thead><tr><th width="180.21484375">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1061">INJIVER-1061</a></td><td>In OpenID4VP (Cross device)component, after scanning the health insurance QR code in the injiwallet app, it is displaying the life insurance VC.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1131">INJIVER-1131</a></td><td>The OpenID4VP (Cross device) component in Inji Verify currently validates a presentation as successful even when a wrong Verifiable Credential (VC) is submitted. As a temporary workaround, implement credential type validation on the Relaying Party (RP) side, by verifying that the received VC matches the expected type defined in the original <code>presentation_definition</code>.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1062">INJIVER-1062</a></td><td>We are uploading an invalid QR code, and while it displays an error message stating that the QR code is invalid, the credential details are still visible.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1063">INJIVER-1063</a></td><td>On iPhone 8 and iPhone 7, uploading the Injiweb QR code PDF shows an error message.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-625">INJIVER-625</a></td><td>Inji Verify - Upload not functioning on Mac Safari Browser Versions 16 and below.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1220">INJIVER-1220</a></td><td>User friendly error message is not displayed for expired session scenario</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1194">INJIVER-1194</a></td><td>INJI Verify SDK should be able to support integration with applications built on platforms beyond <em>React (Typescript) applications</em>, such as Angular, PHP, and others.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1069">INJIVER-1069</a></td><td>The MOSIP UIN VCs generated via reg-client are currently not verifiable through INJI Verify.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-979">INJIVER-979</a></td><td>Long-polling listeners are implemented within the service layer, preventing the backend from scaling effectively in a multi-pod (distributed) environment.</td></tr></tbody></table>

## Documentation

* [Feature documentation](https://docs.inji.io/inji-verify/overview/features)
* [Integration Guide](https://docs.inji.io/inji-verify/technical-overview/integration-guides)
* [API Documentation](https://mosip.stoplight.io/studio/inji-verify)
* [Collab Guide](https://mosip.atlassian.net/wiki/spaces/PROD/pages/1306984580)
* [QA Report](test-report.md)
