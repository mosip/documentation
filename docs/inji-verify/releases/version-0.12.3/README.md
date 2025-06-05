# Version 0.12.3

**Release Name**: Inji Verify v0.12.3

**Support**: Developer Release

**Release Date**: 28th May, 2025

### Overview

We are thrilled to announce the release of Inji Verify 0.12.3 that enhances Verifiable Credential (VC) verification capabilities and streamlines ease of integration with relying party applications.

### New Features

1. Inji Verify SDK - OpenID4VP-VP verification component introduces a modular TypeScript component designed to facilitate easy integration of OpenID4VP-VP verification into verifier/relying party applications.

* Modular NPM Package: The OpenID4VP-VP verification component is available as a standalone NPM module, promoting modularity and simplifying integration. Developers can incorporate it into their projects without depending on the full Inji Verify repository.​
* Comprehensive Integration Guide: A detailed [integration guide](https://docs.inji.io/inji-verify/technical-overview/integration-guides/openid4vp-vp-verification-integration-guide) is provided, explaining the setup and usage to ensure a smooth integration process. The steps are also available in the [SDK's README](https://github.com/mosip/inji-verify/blob/release-0.12.x/inji-verify-sdk/Readme.md).​
* Framework Compatibility: Currently, this component is compatible exclusively with verifier applications built using React and TypeScript. Support for additional frameworks and languages is planned for upcoming releases.

These flexibilities empowers developers to accelerate their VC verification implementation with minimal setup, enabling faster time-to-market for digital identity-enabled services.​

Note: Inji Verify SDK's OpenID4VP-VP verification component supports React version - 18.2.0

Not&#x65;_:_ The Inji Verify SDK's Scan/Upload component, enabling developers to embed VC verification capabilities into their applications, will be introduced in future releases. Stay tuned!

1. Inji Verify Backend enhancement - Transition to PostgreSQL

The backend has transitioned from an in-memory H2 database to a PostgreSQL database, ensuring persistent and reliable data storage. This enhancement improves data durability and supports more robust backend operations.

With these updates, Inji Verify continues to evolve, offering more secure, adaptable, and user-friendly credential verification solutions.

{% hint style="warning" %}
Note:

To test OpenID4VP Cross-Device Flow both on Android and iOS devices, we recommend users to upgrade to Inji Verify v0.12.3 instead of using v0.11.1 (as this feature works only on Android phones).
{% endhint %}

{% hint style="success" %}
Note:&#x20;

Additionally, please note that the OpenID4VP Cross-Device Flow is compatible only with Inji Mobile Wallet v0.16.0. It is not supported with v0.15.0 as the two key updates (QR Data Encoding and Mandatory vp\_formats), required for compatibility, have been incorporated starting v0.16.0 of Inji Mobile Wallet
{% endhint %}

### Repositories: Released/Dependent

| Repositories | Tags: Released/Dependent                                     |
| ------------ | ------------------------------------------------------------ |
| Inji Verify  | [v0.12.3](https://github.com/mosip/inji-verify/tree/v0.12.3) |

### Projects: Released

Inji Verify Repositories: 4 projects (all these projects are of same version) as below:

1. inji-verify-service - [https://github.com/mosip/inji-verify/tree/release-0.12.x/verify-service](https://github.com/mosip/inji-verify/tree/release-0.12.x/verify-service)
2. inji-verify-ui (ref implementation) - [https://github.com/mosip/inji-verify/tree/release-0.12.x/verify-ui](https://github.com/mosip/inji-verify/tree/release-0.12.x/verify-ui)
3. SDK - [https://github.com/mosip/inji-verify/tree/release-0.12.x/inji-verify-sdk](https://github.com/mosip/inji-verify/tree/release-0.12.x/inji-verify-sdk)
4. API-Test - [https://github.com/mosip/inji-verify/tree/release-0.12.x/api-test](https://github.com/mosip/inji-verify/tree/release-0.12.x/api-test)

### Compatible modules

The following table outlines the tested and certified compatibility of Inji Verify 0.12.3 with other modules.

<table><thead><tr><th width="228.04827880859375">Module</th><th>Version</th></tr></thead><tbody><tr><td>Inji Wallet</td><td><a href="https://github.com/mosip/inji-wallet/tree/v0.16.0">0.16.0</a></td></tr><tr><td>Inji Web</td><td><a href="https://github.com/mosip/inji-web/tree/v0.12.0">0.12.0</a></td></tr><tr><td>Pixel-Pass library</td><td><a href="https://github.com/mosip/pixelpass/tree/v0.5.0">v0.5.0</a></td></tr><tr><td>vc-verifier library</td><td><a href="https://github.com/mosip/vc-verifier/tree/v1.2.0">v1.2.0</a></td></tr></tbody></table>

### Known Issues

Below is the list of known issues. To read in detail and view all the issues related to Inji Verify please click [here.](https://mosip.atlassian.net/issues/?jql=project%20%3D%20%22INJIVER%22%20AND%20status%20not%20in%20%28Closed%2C%20Canceled%29%20AND%20type%20%3D%20Bug%20ORDER%20BY%20created%20DESC)

<table><thead><tr><th width="223.069580078125">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1061">INJIVER-1061</a></td><td>In OpenID4VP (Cross device)component, after scanning the health insurance QR code in the injiwallet app, it is displaying the life insurance VC.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1131">INJIVER-1131</a></td><td><p></p><p>The OpenID4VP (Cross device) component in Inji Verify currently validates a presentation as successful even when a wrong Verifiable Credential (VC) is submitted. As a temporary workaround, implement credential type validation on the Relaying Party (RP) side, by verifying that the received VC matches the expected type defined in the original presentation_definition.</p></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-940">INJIVER-940</a></td><td>Implementation of Docker Compose for verify-service is yet to be picked up. <em>(This will be taken up as part of 0.13.0 release)</em></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1062">INJIVER-1062</a></td><td>We are uploading an invalid QR code, and while it displays an error message stating that the QR code is invalid, the credential details are still visible.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1063">INJIVER-1063</a></td><td>On iPhone 8 and iPhone 7, uploading the Injiweb QR code PDF shows an error message.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-625">INJIVER-625</a></td><td>Inji Verify - Upload not functioning on Mac Safari Browser Versions 16 and below.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-237">INJIVER-237</a></td><td><p></p><p>Unable to scan sunbird QR code through Mobile/Windows/Mac.</p></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-955">INJIVER-955</a></td><td><p></p><p>VP Verification APIs are validating invalid entries.</p></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1011">INJIVER-1011</a></td><td>Unable to scan VP Verification QR Code from Inji mobile.</td></tr><tr><td><p></p><p><a href="https://mosip.atlassian.net/browse/INJIVER-859">INJIVER-859</a></p></td><td><p></p><p>When a MOSIP VC is downloaded from Inji Web, the verification fails upon uploading the VC.</p></td></tr></tbody></table>

### User Stories

<table><thead><tr><th width="222.37713623046875">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-627">INJIVER-627</a></td><td>Inji Verify SDK - OpenID4VP-VP Verification (Cross-device flow) component.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1094">INJIVER-1094</a></td><td>Publish ‘OpenID4VP-VP Verification’ component as a separate NPM module.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1092">INJIVER-1092</a></td><td><p></p><p>Integrate Postgres DB with Inji Verify.</p></td></tr></tbody></table>

### Bug Fixes

Below is the list of fixes as part of the 0.12.3 release:

<table><thead><tr><th width="222.41973876953125">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1109">INJIVER-1109</a></td><td>Datashare VC verification was failing due to a configuration issue in mimoto which had to be thereby reverted.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1126">INJIVER-1126</a></td><td>When clicking the 'Verify Another QR Code' button in the Upload tab, if the user cancels the file selection window, the application is not redirecting to the previously viewed Uploaded VC result screen.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1101">INJIVER-1101</a></td><td>Inji Verify API test suite consumed expired VCs which lead to failure in certain test scenarios.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1099">INJIVER-1099</a></td><td><p></p><p>VC verification is failing due to data encoding.</p></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1098">INJIVER-1098</a></td><td><p></p><p>Testcase on GetVpTokenForRequest is failing in dev2 env of inji verify API test rig.</p></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1116">INJIVER-1116</a></td><td><p></p><p></p><p>UI and API automation test suite is failing after syncing develop branch.</p></td></tr></tbody></table>

### Documentation

* [Feature documentation](https://docs.inji.io/inji-verify/overview/features)
* [Integration Guide](https://docs.inji.io/inji-verify/technical-overview/integration-guides/openid4vp-vp-verification-integration-guide)
* [API Documentation](https://mosip.stoplight.io/studio/inji-verify)
* [Collab Guide](https://docs.inji.io/inji-verify/functional-overview/releases-1/inji-verify-collab-guide)
* [QA Report](https://docs.inji.io/inji-verify/releases/version-0.12.3/test-report)
