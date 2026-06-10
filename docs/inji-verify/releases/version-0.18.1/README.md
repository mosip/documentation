# Version 0.18.1

**Release Name**: Inji Verify v0.18.1

**Support**: Developer Release

**Release Date**: 5th June, 2026

### **Overview**

**Inji Verify v0.18.1** release is a **patch update** focused on addressing a small set of critical bugs identified in the previous release (**v0.18.0**).

This release improves stability, correctness, and reliability of existing functionality in the Inji Verify module.

#### **Key Highlights and Enhancements**

1. Improved 'Holder Binding Validation' handling.
2. Enhanced error handling for 'VP Holder Mismatch' scenarios.
3. Correct display of credential status and credential count in the 'Verify UI' when one of the credentials has expired.

{% hint style="info" %}
**Note:** The Inji Verify UI is a _reference implementation_ to demonstrate orchestration. Developers can selectively embed SDK components in the verifier applications as per their needs.
{% endhint %}

### **Repositories: Released/Dependent**

| Repositories         | Tags Released/Dependency                                                                         |
| -------------------- | ------------------------------------------------------------------------------------------------ |
| inji-verify-service  | [0.18.1](https://github.com/inji/inji-verify/tree/release-0.18.x)                                |
| vc-verifier library  | [1.8.1](https://github.com/inji/vc-verifier/tree/release-1.8.x#from-version-release-18x-onwards) |

### **Compatible modules**

The following table outlines the tested and certified compatibility of Inji Verify 0.18.1 with other modules.

| Module             | Version                                                            |
| ------------------ | ------------------------------------------------------------------ |
| Inji Wallet        | [0.22.1](https://github.com/inji/inji-wallet/releases/tag/v0.22.1) |
| Inji Web           | [0.17.0](https://github.com/inji/inji-verify/tree/v0.17.0)         |
| Pixel-Pass library | [0.8.0](https://github.com/inji/pixelpass/tree/v0.8.0)             |

### **Bug Fixes**

Below is the list of fixes as part of the **0.18.1** release, For the complete list you can refer [here](https://github.com/orgs/inji/projects/3/views/7?filterQuery=milestone%3A0.18.1).

<table><thead><tr><th width="167.1796875">Issue ID</th><th>Summary</th></tr></thead><tbody><tr><td><i class="fa-github">:github:</i> <a href="https://github.com/inji/inji-verify/issues/1972">1972</a></td><td>Incorrect Status and Number of Credentials in Verify UI when one credential is Expired</td></tr><tr><td><i class="fa-github">:github:</i> <a href="https://github.com/inji/inji-verify/issues/1976">1976</a></td><td>Incorrect Error Handling for VP Holder Mismatch in 0.18.0</td></tr><tr><td><i class="fa-github">:github:</i> <a href="https://github.com/inji/inji-verify/issues/1977">1977</a></td><td>InjiVerify API Automation - 8 failures in API testreport in released env for 0.18.0</td></tr><tr><td><i class="fa-github">:github:</i> <a href="https://github.com/inji/inji-verify/issues/1984">1984</a></td><td>Fix Holder Binding Validation Handling in vc-verifier 1.8.0</td></tr></tbody></table>

### **Known Issues**

Below is a list of some key known issues. For a detailed overview and the complete list of issues related to Inji Verify, please click [here](https://github.com/orgs/inji/projects/3/views/5)

<table><thead><tr><th width="166.68359375">Issue ID</th><th>Description</th></tr></thead><tbody><tr><td><i class="fa-github">:github:</i> <a href="https://github.com/inji/inji-verify/issues/1790">1790</a></td><td>The OpenID4VP (Cross device) component in Inji Verify currently validates a presentation as successful even when a wrong Verifiable Credential (VC) is submitted. As a temporary workaround, implement credential type validation on the Relaying Party (RP) side, by verifying that the received VC matches the expected type defined in the original presentation_definition.</td></tr><tr><td><i class="fa-github">:github:</i> <a href="https://github.com/inji/inji-verify/issues/1845">1845</a></td><td>We are uploading an invalid QR code, and while it displays an error message stating that the QR code is invalid, the credential details are still visible.</td></tr><tr><td><i class="fa-github">:github:</i> <a href="https://github.com/inji/inji-verify/issues/1844">1844</a></td><td>On iPhone 8 and iPhone 7, uploading the Injiweb QR code PDF shows an error message.</td></tr><tr><td><i class="fa-github">:github:</i> <a href="https://github.com/inji/inji-verify/issues/1852">1852</a></td><td>Inji Verify - Upload not functioning on Mac Safari Browser Versions 16 and below.</td></tr><tr><td><i class="fa-github">:github:</i> <a href="https://github.com/inji/inji-verify/issues/1789">1789</a></td><td>INJI Verify SDK should be able to support integration with applications built on platforms beyond <em>React (Typescript) applications</em>, such as Angular, PHP, and others.</td></tr><tr><td><i class="fa-github">:github:</i> <a href="https://github.com/inji/inji-verify/issues/1805">1805</a></td><td>Long-polling listeners are implemented within the service layer, preventing the backend from scaling effectively in a multi-pod (distributed) environment.</td></tr></tbody></table>

### **Documentation**

* [Feature documentation](https://docs.inji.io/inji-verify/overview/features)
* [Integration Guide](https://docs.inji.io/inji-verify/technical-overview/integration-guides)
* [API Documentation](https://mosip.stoplight.io/studio/inji-verify)
* [Collab Guide](https://mosip.atlassian.net/wiki/spaces/PROD/pages/1306984580)
* [QA Report](test-report.md)
