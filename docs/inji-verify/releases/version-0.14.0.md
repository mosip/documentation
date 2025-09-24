# Version 0.14.0

**Release Name**: Inji Verify v0.14.0

**Support**: Developer Release

**Release Date**: Coming Soon

### Overview

We are excited to announce the release of **Inji Verify v0.14.0**, which brings significant enhancements to OpenID4VP - Same Device flow support, SDK modularization, deployment automation and improvements in verification result handling.

### New Features

**1. OpenID4VP Same-Device flow via deeplink:** Inji Verify now supports the OpenID4VP Same Device Flow, allowing verifier and wallet to operate on the same mobile device.

* Verifier sends an Authorization Request with `presentation_definition` via deep link.

* Wallet authenticates the user, collects consent, and returns a `vp_token` via redirect (`response_mode=direct_post`).

* Inji Verify parses the vp_token, validates credentials, and displays results with statuses: Valid, Valid but Expired, Invalid.

* Multiple VCs displayed in card format, expandable details, color-coded statuses, and JSON download option.

* This feature provides a seamless, app-like experience on same mobile device without requiring a second device.

**2. Inji Verify SDK- OpenID4VP- VP verification component** where same device flow (point 1) functionality is incorporated

* **Modular NPM Package:** : Released as a standalone TypeScript component for seamless integration into verifier/relying party apps.
  
* **Easy Integration:** Comes with a step-by-step [integration guide](../../technical-overview/integration-guides/openid4vp-vp-verification-integration-guide.md) and [README](https://github.com/mosip/inji-verify/blob/release-0.13.x/inji-verify-sdk/Readme.md).​
  
* **Compatibility:** Supported for React + TypeScript verifier apps (React 18.2.0); broader framework/language support planned in future releases.

**Note:** The Inji Verify UI is a *reference implementation* to demonstrate orchestration. Developers can selectively embed SDK components in the verifier applications as per their needs.

### Additional Enhancements:

**1. OpenID4VP – QR Codes via `request_uri`:** Inji Verify now supports QR codes that reference the Authorization Request via `request_uri` instead of embedding it directly.

* Wallets resolve the request by performing an HTTP GET to the hosted request object.
  
* This reduces QR code size, improves security (request hosted on trusted verifier servers), and alignment with OpenID4VP best practices.

**2. DID-based client_id:** Aligned with OpenID4VP Draft 23, Inji Verify now supports DID-based `client_id` values, replacing the deprecated `client_id_scheme`. This improves interoperability and trust through decentralized identifiers.

**3. Deployment Scripts:** 
* **Automated Deployment:** Added end-to-end deployment scripts to simplify setup, restart, and teardown of Inji Verify services. Scripts include pre-requisite setup (Infra, Wireguard, K8s, NGINX, Postgres), DB initialization, and service installation.

* **Reference:** Detailed steps and configuration instructions are provided in the updated Deployment [README](https://github.com/mosip/inji-verify/tree/develop/deploy).

**4. VP verification results display:** 
* Verification results now display **all originally requested credentials**, including any newly shared after a missing credential prompt.

* Status clearly shown (Valid, Invalid, Valid but Expired) with completion confirmation once all checks are done.

**5. Update Postgres Image Source:**
Inji Verify has been updated to stop using Bitnami-hosted Postgres images. The Helm charts, shell scripts, and configurations now point to MOSIP-INT repositories, ensuring greater security, reliability, and long-term availability. All deployments have been validated to work seamlessly with the updated image source.

### Repositories: Released/Dependent

| Repositories        | Tags: Released/Dependent                                     |
| ------------------- | ------------------------------------------------------------ |
| Inji Verify         | v0.14.0 |

### Projects: Released

Inji Verify Repositories: 4 projects (all these projects are of same version) as below:

1. Inji Verify Service - [0.14.0 Inji Verify service](https://github.com/mosip/inji-verify/tree/release-0.14.x/verify-service)
2. Inji Verify UI (ref implementation) - [https://github.com/mosip/inji-verify/tree/release-0.14.x/verify-ui](https://github.com/mosip/inji-verify/tree/release-0.14.x/verify-ui)
3. SDK - [https://github.com/mosip/inji-verify/tree/release-0.14.x/inji-verify-sdk](https://github.com/mosip/inji-verify/tree/release-0.14.x/inji-verify-sdk)
4. API-Test - [https://github.com/mosip/inji-verify/tree/release-0.14.x/api-test](https://github.com/mosip/inji-verify/tree/release-0.14.x/api-test)

### Compatible modules

The following table outlines the tested and certified compatibility of Inji Verify 0.14.0 with other modules.

<table><thead><tr><th width="228.04827880859375">Module</th><th>Version</th></tr></thead><tbody><tr><td>Inji Mobile Wallet</td><td><a href="https://github.com/mosip/inji-wallet/tree/v0.18.0">0.18.0</a></td></tr><tr><td>Inji Web Wallet</td><td><a href="https://github.com/mosip/inji-web/tree/v0.13.0">0.13.0</a></td></tr><tr><td>Pixel-Pass library</td><td><a href="https://github.com/mosip/pixelpass/tree/v0.6.0">v0.6.0</a></td></tr><tr><td>vc-verifier library</td><td><a href="https://github.com/mosip/vc-verifier/tree/v1.4.0">v1.4.0</a></td></tr></tbody></table>

### Known Issues

Below is a list of some key known issues. For a detailed overview and the complete list of issues related to Inji Verify, please click [here.](https://mosip.atlassian.net/issues/?jql=project%20%3D%20%22INJIVER%22%20AND%20status%20not%20in%20%28Closed%2C%20Canceled%29%20AND%20type%20%3D%20Bug%20ORDER%20BY%20created%20DESC)

<table><thead><tr><th width="223.069580078125">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1061">INJIVER-1061</a></td><td>In OpenID4VP (Cross device)component, after scanning the health insurance QR code in the injiwallet app, it is displaying the life insurance VC.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1131">INJIVER-1131</a></td><td>The OpenID4VP (Cross device) component in Inji Verify currently validates a presentation as successful even when a wrong Verifiable Credential (VC) is submitted. As a temporary workaround, implement credential type validation on the Relaying Party (RP) side, by verifying that the received VC matches the expected type defined in the original `presentation_definition`.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1062">INJIVER-1062</a></td><td>We are uploading an invalid QR code, and while it displays an error message stating that the QR code is invalid, the credential details are still visible.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1063">INJIVER-1063</a></td><td>On iPhone 8 and iPhone 7, uploading the Injiweb QR code PDF shows an error message.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-625">INJIVER-625</a></td><td>Inji Verify - Upload not functioning on Mac Safari Browser Versions 16 and below.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1194">INJIVER-1194</a></td><td>INJI Verify SDK should be able to support integration with applications built on platforms beyond React (Typescript) applications, such as Angular, PHP, and others.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1220">INJIVER-1220</a></td><td>NUser friendly error message is not displayed for expired session scenario./td></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1069">INJIVER-1069</a></td><td>The MOSIP UIN VCs generated via reg-client are currently not verifiable through INJI Verify.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-979">INJIVER-979</a></td><td>Long-polling listeners are implemented within the service layer, preventing the backend from scaling effectively in a multi-pod (distributed) environment.</td></tr></tbody></table>

### User Stories

<table><thead><tr><th width="222.37713623046875">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-526">INJIVER-526</a></td><td>OpenID4VP Same-Device flow via deeplink, allowing verifier and wallet to operate on the same mobile device.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1127">INJIVER-1127</a></td><td>Integrate OpenID4VP- VP verification component (same device flow) in Inji Verify SDK.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1132">INJIVER-1132</a></td><td>Deployment scripts to simplify setup of Inji Verify.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1140">INJIVER-1140</a></td><td>OpenID4VP Draft 23- Implement DID based client id scheme.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1213">INJIVER-1213</a></td><td>OpenID4VP: Authorisation Request via `request_uri` for did based client id.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1235">INJIVER-1235</a></td><td>Removal of wallet selection panel in OpenID4VP Same device flow (mobile).</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1100">INJIVER-1100</a></td><td>Display VC result of all credentials originally requested after missing credentials have been shared from mobile wallet successfully.</td></tr></tbody></table>

### Bug Fixes

Below is the list of fixes as part of the 0.14.0 release:

<table><thead><tr><th width="222.41973876953125">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1278">INJIVER-1278</a></td><td>Data share VC verification is failing.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1264">INJIVER-1264</a></td><td>Timeout error occurs in `/vp-request/{request_id}/status()` for Same Device Flow on Android after successful VP submission.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1262">INJIVER-1262</a></td><td>VP verification in Cross-Device Flow causes the iOS Inji Mobile app to crash.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1261">INJIVER-1261</a></td><td>VP verification in Same-Device Flow causes the iOS Inji Mobile app to crash.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1231">INJIVER-1231</a></td><td>ployment README is outdated.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1230">INJIVER-1230</a></td><td>SDK README on the NPM site is not updated.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1221">INJIVER-1221</a></td><td>Same Device Flow is not fully developed.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1217">INJIVER-1217</a></td><td>After scanning a QR code, clicking on *“Verify Another QR Code” sometimes causes the camera to freeze with a black screen.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1201">INJIVER-1201</a></td><td>The Verifiable Credential Selection Panel is not set as the default option.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1198">INJIVER-1198</a></td><td>UI Automation README is outdated and not aligned with recent changes.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1191">INJIVER-1191</a></td><td>Add provision to send transactionID for VC submission from the Relying Party.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1186">INJIVER-1186</a></td><td>The Verifiable Credential Panel contains duplicate element IDs.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1181">INJIVER-1181</a></td><td>NPM warning prevents Sonar analysis from being triggered.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1163">INJIVER-1163</a></td><td>Security testing identified a camera access issue in Inji Verify.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1139">INJIVER-1139</a></td><td>Overlapping text appears at the bottom of the screen during the ‘Initiate VP Request’ process.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1090">INJIVER-1090</a></td><td>Unable to verify two scenarios in the OVP flow.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1067">INJIVER-1067</a></td><td>Language selection is not applied consistently across the entire screen.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-939">INJIVER-939</a></td><td>Button label and layout are misaligned.</td></tr></tbody></table>

### Documentation

* [Feature documentation](../../overview/features.md)
* [Integration Guide](../../../inji-wallet/inji-mobile/technical-overview/integration-guide/openid4vp.md)
* [API Documentation](https://mosip.stoplight.io/studio/inji-verify)
* [Collab Guide](../../functional-overview/releases-1/inji-verify-collab-guide.md)
* QA Report

