# Version 0.18.0

**Release Name**: Inji Verify v0.18.0

**Release Type**: Developer&#x20;

**Release Date**: 5th May, 2026

### **Overview**

We are excited to announce the release of **Inji Verify** [**v0.18.0**](https://github.com/inji/inji-verify/tree/v0.18.0)**.** This version introduces **the following features:**

1. **Support Server Side VP Verification: ECC - R1:** This feature introduces server-side verification of Verifiable Presentations (VPs) using Elliptic Curve Cryptography (ECC) based on the R1 curve. It enables a more robust and centralized verification mechanism, reduces client-side complexity, and aligns with modern decentralized identity standards, enhancing trust in the verification ecosystem.
2. **Open ID for Verifiable Presentation via Inji Web Wallet:** This feature enables OpenID for Verifiable Presentations (OpenID4VP) integration between Inji Verify and the Inji Web Wallet, allowing seamless and standardized credential sharing and verification. It establishes a secure, interoperable flow where the verifier (Inji Verify) can request specific credentials, and the holder (via Inji Web Wallet) can present them in a compliant and privacy-preserving manner.

{% hint style="info" %}
**Note:** The Inji Verify UI is a _reference implementation_ to demonstrate orchestration. Developers can selectively embed SDK components in the verifier applications as per their needs.
{% endhint %}

### **Features Released**

<table><thead><tr><th width="175.890625">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1586">INJIVER-1586</a></td><td>Ability to perform holder binding check for a JSON LD VC for holder value in did:jwk and did:key format</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-486">INJIVER-486</a></td><td>Support server side VC verification - ECC - R1</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1583">INJIVER-1583</a></td><td>Add new attribute "summariseResults" in OpenID4VPVerification component in Inji Verify SDK to support backward compatibility of SDK Response</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1580">INJIVER-1580</a></td><td>Added new POST endpoints /vp-session-request &#x26; /vp-session-results</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1579">INJIVER-1579</a></td><td>Add new attribute "summariseResults" in QRCodeVerification component in Inji Verify SDK to support backward compatibility of SDK Response</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1567">INJIVER-1567</a></td><td>Data Share VC (Online Sharing Mode) remove "redirect_uri" in "/authorize" request</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1550">INJIVER-1550</a></td><td>Ensure that a VP is created specifically for one request, and one interaction so it cannot be replayed, redirected, reused or misused in a different context.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1495">INJIVER-1495</a></td><td>Verify UI and SDK integration with new endpoint /v2/vc-verification</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1437">INJIVER-1437</a></td><td>Open ID for Verifiable Presentation via Inji Web Wallet</td></tr></tbody></table>

### **Repositories Released**

| Repositories | Tags: Released/Dependent                                        |
| ------------ | --------------------------------------------------------------- |
| Inji Verify  | [**v0.18.0**](https://github.com/inji/inji-verify/tree/v0.18.0) |
| vc-verifer   | [**v1.8.0**](https://github.com/inji/vc-verifier/tree/v1.8.0)   |

### **Compatible Modules**

| Module             | Version                                                     |
| ------------------ | ----------------------------------------------------------- |
| Inji Wallet        | 0.22.1(Yet to be realeased)                                 |
| Inji Web           | [**0.17.0**](https://github.com/inji/inji-web/tree/v0.17.0) |
| Pixel-Pass library | [**0.8.0**](https://github.com/inji/pixelpass/tree/v0.8.0)  |

### **Known Issues**

Below is a list of some key known issues. For a detailed overview and the complete list of issues related to Inji Verify, please click [**here.**](https://mosip.atlassian.net/issues/?jql=project%20%3D%20%22INJIVER%22%20AND%20status%20not%20in%20%28Closed%2C%20Canceled%29%20AND%20type%20%3D%20Bug%20ORDER%20BY%20created%20DESC)

<table><thead><tr><th width="165.12109375">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1131">INJIVER-1131</a></td><td>The OpenID4VP (Cross device) component in Inji Verify currently validates a presentation as successful even when a wrong Verifiable Credential (VC) is submitted. As a temporary workaround, implement credential type validation on the Relaying Party (RP) side, by verifying that the received VC matches the expected type defined in the original presentation_definition.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1062">INJIVER-1062</a></td><td>We are uploading an invalid QR code, and while it displays an error message stating that the QR code is invalid, the credential details are still visible.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1063">INJIVER-1063</a></td><td>On iPhone 8 and iPhone 7, uploading the Injiweb QR code PDF shows an error message.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-625">INJIVER-625</a></td><td>Inji Verify - Upload not functioning on Mac Safari Browser Versions 16 and below.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1194">INJIVER-1194</a></td><td>INJI Verify SDK should be able to support integration with applications built on platforms beyond <em>React (Typescript) applications</em>, such as Angular, PHP, and others.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-979">INJIVER-979</a></td><td>Long-polling listeners are implemented within the service layer, preventing the backend from scaling effectively in a multi-pod (distributed) environment.</td></tr></tbody></table>

### **Bug Fixes**

Below is the list of fixes as part of the **0.18.0** release:

<table><thead><tr><th width="192.46875" valign="top">JIRA</th><th valign="top">Summary</th></tr></thead><tbody><tr><td valign="top"><a href="https://mosip.atlassian.net/browse/INJIVER-1618">INJIVER-1618</a></td><td valign="top">Veridonia National ID in collab env (0.17.0) in VP flow is showing no matching credential found</td></tr><tr><td valign="top"><a href="https://mosip.atlassian.net/browse/INJIVER-1617">INJIVER-1617</a></td><td valign="top">VCT match is failing for Age Credential VC in SD-JWT format</td></tr><tr><td valign="top"><a href="https://mosip.atlassian.net/browse/INJIVER-1616">INJIVER-1616</a></td><td valign="top">INJI-VERIFY - Get VP Request Status V2 API failing for all scenarios including valid requests</td></tr><tr><td valign="top"><a href="https://mosip.atlassian.net/browse/INJIVER-1615">INJIVER-1615</a></td><td valign="top">INJI-VERIFY - Get VP Token API fails for valid transactionId and inconsistent response handling</td></tr><tr><td valign="top"><a href="https://mosip.atlassian.net/browse/INJIVER-1614">INJIVER-1614</a></td><td valign="top">INJI-Verify - VP Submission API accepts invalid VP token and fails for valid submission with proof</td></tr><tr><td valign="top"><a href="https://mosip.atlassian.net/browse/INJIVER-1609">INJIVER-1609</a></td><td valign="top">INJI-VERIFY - 10 KB QR code uploads return "No QR Code" error</td></tr><tr><td valign="top"><a href="https://mosip.atlassian.net/browse/INJIVER-1600">INJIVER-1600</a></td><td valign="top">Valid ECC R1 Verifiable Credential is incorrectly returned as INVALID after verification</td></tr><tr><td valign="top"><a href="https://mosip.atlassian.net/browse/INJIVER-1596">INJIVER-1596</a></td><td valign="top">Verify UI tests are failing which is causing Sonar Build Failure in GitHub actions</td></tr><tr><td valign="top"><a href="https://mosip.atlassian.net/browse/INJIVER-1595">INJIVER-1595</a></td><td valign="top">INJI-VERIFY - Verification is intermittently failing with an invalid error</td></tr><tr><td valign="top"><a href="https://mosip.atlassian.net/browse/INJIVER-1582">INJIVER-1582</a></td><td valign="top">INJI-VERIFY - Web Wallet Selection Panel is empty</td></tr><tr><td valign="top"><a href="https://mosip.atlassian.net/browse/INJIVER-1578">INJIVER-1578</a></td><td valign="top">Inji Verify SDK: QRCodeVerification component issues with Trigger Element</td></tr><tr><td valign="top"><a href="https://mosip.atlassian.net/browse/INJIVER-1563">INJIVER-1563</a></td><td valign="top">INJI-VERIFY - Verifying other env VC makes the application break</td></tr></tbody></table>

### **Documentation**

* [Feature documentation](https://docs.inji.io/inji-verify/overview/features)
* [Integration Guide](https://docs.inji.io/inji-verify/technical-overview/integration-guides)
* [API Documentation](https://mosip.stoplight.io/studio/inji-verify)
* [Collab Guide](https://mosip.atlassian.net/wiki/spaces/PROD/pages/1306984580)
* [QA Report](test-report.md)
