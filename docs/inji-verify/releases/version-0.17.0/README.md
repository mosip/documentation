# Version 0.17.0

**Release Name**: Inji Verify v0.17.0

**Support**: Developer Release

**Release Date**: 4th March, 2026

### **Overview**

We are excited to announce the release of **Inji Verify v0.17.0.** This version introduces **enhancements in API design for /vc-verification** endpoint and the **/vp-result/{txnId}** endpoint and verification support for **Claim 169** QR code..

### **New Features**

#### [**API Redesign**](https://docs.inji.io/inji-verify/overview/features#api-v2-enhancements-for-seamless-integration-came-with-0.17.0-release)

* We have redesigned the Inji Verify **/vc-verification** endpoint to deliver structured, detailed verification responses with flexible request parameters. Instead of just the final status (SUCCESS / INVALID / EXPIRED / REVOKED), the response now includes comprehensive diagnostic information and configurable verification checks. This enables relying party applications to make informed decisions about next steps with reduced custom processing.
* Similarly, the **/vp-result/{txnId}** endpoint is enhanced to return richer, granular information for each credential, rather than only the final status. With these detailed insights, integrators can build faster, more reliable workflows with fewer API calls, significantly simplifying integration across diverse verifier applications.

#### [**Claim 169 QR Code Verification**](../../overview/features/#standards-specifications-and-compliance)

Compact Credential Encoding: Inji Verify now supports verification of Claim 169-encoded QR credentials—an [IANA-registered MOSIP standard (1.1.0)](https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification-1) for compact, cryptographically-signed identity QR codes. This standardized encoding enables efficient credential delivery and verification across diverse deployment scenarios. What This Enables:

* **QR Code Verification**: Scan or upload Claim 169 QR codes through camera scanning (versions 1–v27) or document upload (versions 1–v32).
* **CBOR Decoding & Signature Validation**: Automatically decode CBOR-encoded QR payloads and validate Ed25519 cryptographic signatures to authenticate credential authenticity.
* **Selective Attribute Verification**: Handle credentials containing multiple QR codes, each encoding different identity attributes (demographic data, biometrics) for granular verification workflows.
* **Flexible Deployment**: Support for scenarios where compact QR-based credential presentation is required.
* **Technical Implementation**: Integration with PixelPass library (v0.7.0) for CBOR decoding, enhanced /vc-verification endpoint for detailed validation diagnostics.

{% hint style="info" %}
**Note:** The Inji Verify UI is a _reference implementation_ to demonstrate orchestration. Developers can selectively embed SDK components in the verifier applications as per their needs.
{% endhint %}

### **Repositories: Released/Dependent**

| Repositories | Tags: Released/Dependent                                        |
| ------------ | --------------------------------------------------------------- |
| Inji Verify  | [**v0.17.0**](https://github.com/inji/inji-verify/tree/v0.17.0) |

### **Projects: Released**

**Inji Verify Repo** → 3 projects as below:

i) [inji-verify-service](https://github.com/inji/vc-verifier/tree/v1.7.0)

ii) [Pixelpass](https://github.com/inji/pixelpass/tree/v0.8.0)

iii) [API-Test](https://github.com/mosip/mosip-functional-tests/tree/v1.4.1)

### **Compatible modules**

The following table outlines the tested and certified compatibility of Inji Verify 0.10.0 with other modules.

| **Module**          | **Version**                                                        |
| ------------------- | ------------------------------------------------------------------ |
| Inji Wallet         | [0.21.0](https://github.com/inji/inji-wallet/releases/tag/v0.21.0) |
| Inji Web            | [0.15.0](https://github.com/inji/inji-web/releases/tag/v0.15.0)    |
| Pixel-Pass library  | [0.7.0](https://github.com/inji/pixelpass/releases/tag/v0.7.0)     |
| vc-verifier library | [1.6.0](https://github.com/inji/vc-verifier/releases/tag/v1.6.0)   |

### **Bug Fixes**

Below is the list of fixes as part of the **0.17.0** release, for the complete list refer [here](https://mosip.atlassian.net/issues/?jql=project%3Dinjiver%20and%20fixVersion%3D0.17.0%20and%20issuetype%3DBug).

### **User Stories**

<table><thead><tr><th width="175.33984375">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1366">INJIVER-1366</a></td><td>As a Verifier, I should be able to Upload and Scan to Verify the VCs with claims mapped to Claim 169 (for single QR code)</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1490">INJIVER-1490</a></td><td>The /vc-verification and /vp-result/{txnId} endpoints have been enhanced to return detailed verification information in addition to the final status. These richer responses enable relying party applications to understand verification outcomes better and make informed decisions on next steps.</td></tr></tbody></table>

### **Known Issues**

Below is a list of some key known issues. For a detailed overview and the complete list of issues related to Inji Verify, please click [**here.**](https://mosip.atlassian.net/issues/?jql=project%20%3D%20%22INJIVER%22%20AND%20status%20not%20in%20%28Closed%2C%20Canceled%29%20AND%20type%20%3D%20Bug%20ORDER%20BY%20created%20DESC)

<table><thead><tr><th width="164.03125">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1061">INJIVER-1061</a></td><td>In OpenID4VP (Cross device)component, after scanning the health insurance QR code in the injiwallet app, it is displaying the life insurance VC.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1131">INJIVER-1131</a></td><td>The OpenID4VP (Cross device) component in Inji Verify currently validates a presentation as successful even when a wrong Verifiable Credential (VC) is submitted. As a temporary workaround, implement credential type validation on the Relaying Party (RP) side, by verifying that the received VC matches the expected type defined in the original presentation_definition.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1062">INJIVER-1062</a></td><td>We are uploading an invalid QR code, and while it displays an error message stating that the QR code is invalid, the credential details are still visible.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1063">INJIVER-1063</a></td><td>On iPhone 8 and iPhone 7, uploading the Injiweb QR code PDF shows an error message.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-625">INJIVER-625</a></td><td>Inji Verify - Upload not functioning on Mac Safari Browser Versions 16 and below.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1194">INJIVER-1194</a></td><td>INJI Verify SDK should be able to support integration with applications built on platforms beyond <em>React (Typescript) applications</em>, such as Angular, PHP, and others.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-979">INJIVER-979</a></td><td>Long-polling listeners are implemented within the service layer, preventing the backend from scaling effectively in a multi-pod (distributed) environment.</td></tr></tbody></table>

### **Documentation**

* [Feature documentation](https://docs.inji.io/inji-verify/overview/features)
* [Integration Guide](https://docs.inji.io/inji-verify/technical-overview/integration-guides)
* [API Documentation](https://mosip.stoplight.io/studio/inji-verify)
* [Collab Guide](https://mosip.atlassian.net/wiki/spaces/PROD/pages/1306984580)
* [QA Report](https://docs.inji.io/inji-verify/releases/version-0.17.0/test-report)
