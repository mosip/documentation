# Version 0.12.3

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

Additionally, please note that the OpenID4VP Cross-Device Flow is compatible only with Inji Mobile Wallet v0.16.0. It is not supported with v0.15.0 as the two key updates (QR Data Encoding and Mandatory vp\_formats), required for compatibility, have been incorporated starting v0.16.0 of Inji Mobile Wallet
{% endhint %}

### Repositories: Released/Dependent

Repositories

Tags: Released/Dependent

Inji Verify

[v0.12.3](https://github.com/mosip/inji-verify/tree/v0.12.3)

### Projects: Released

Inji Verify Repositories: 4 projects (all these projects are of same version) as below:

1. inji-verify-service - [https://github.com/mosip/inji-verify/tree/release-0.12.x/verify-service](https://github.com/mosip/inji-verify/tree/release-0.12.x/verify-service)
2. inji-verify-ui (ref implementation) - [https://github.com/mosip/inji-verify/tree/release-0.12.x/verify-ui](https://github.com/mosip/inji-verify/tree/release-0.12.x/verify-ui)
3. SDK - [https://github.com/mosip/inji-verify/tree/release-0.12.x/inji-verify-sdk](https://github.com/mosip/inji-verify/tree/release-0.12.x/inji-verify-sdk)
4. API-Test - [https://github.com/mosip/inji-verify/tree/release-0.12.x/api-test](https://github.com/mosip/inji-verify/tree/release-0.12.x/api-test)

### Compatible modules

The following table outlines the tested and certified compatibility of Inji Verify 0.12.3 with other modules.

Module

Version

Inji Wallet

[0.16.0](https://github.com/mosip/inji-wallet/tree/v0.16.0)

Inji Web

[0.12.0](https://github.com/mosip/inji-web/tree/v0.12.0)

Pixel-Pass library

[v0.5.0](https://github.com/mosip/pixelpass/tree/v0.5.0)

vc-verifier library

[v1.2.0](https://github.com/mosip/vc-verifier/tree/v1.2.0)

### Known Issues

Below is the list of known issues. To read in detail and view all the issues related to Inji Verify please click [here.](https://mosip.atlassian.net/issues/?jql=project%20%3D%20%22INJIVER%22%20AND%20status%20not%20in%20%28Closed%2C%20Canceled%29%20AND%20type%20%3D%20Bug%20ORDER%20BY%20created%20DESC)

Jira ID

Description

[INJIVER-1061](https://mosip.atlassian.net/browse/INJIVER-1061)

In OpenID4VP (Cross device)component, after scanning the health insurance QR code in the injiwallet app, it is displaying the life insurance VC.

[INJIVER-1131](https://mosip.atlassian.net/browse/INJIVER-1131)

The OpenID4VP (Cross device) component in Inji Verify currently validates a presentation as successful even when a wrong Verifiable Credential (VC) is submitted. As a temporary workaround, implement credential type validation on the Relaying Party (RP) side, by verifying that the received VC matches the expected type defined in the original presentation\_definition.

[INJIVER-940](https://mosip.atlassian.net/browse/INJIVER-940)

Implementation of Docker Compose for verify-service is yet to be picked up. _(This will be taken up as part of 0.13.0 release)_

[INJIVER-1062](https://mosip.atlassian.net/browse/INJIVER-1062)

We are uploading an invalid QR code, and while it displays an error message stating that the QR code is invalid, the credential details are still visible.

[INJIVER-1063](https://mosip.atlassian.net/browse/INJIVER-1063)

On iPhone 8 and iPhone 7, uploading the Injiweb QR code PDF shows an error message.

[INJIVER-625](https://mosip.atlassian.net/browse/INJIVER-625)

Inji Verify - Upload not functioning on Mac Safari Browser Versions 16 and below.

[INJIVER-237](https://mosip.atlassian.net/browse/INJIVER-237)

Unable to scan sunbird QR code through Mobile/Windows/Mac.

[INJIVER-955](https://mosip.atlassian.net/browse/INJIVER-955)

VP Verification APIs are validating invalid entries.

[INJIVER-1011](https://mosip.atlassian.net/browse/INJIVER-1011)

Unable to scan VP Verification QR Code from Inji mobile.

[INJIVER-859](https://mosip.atlassian.net/browse/INJIVER-859)

When a MOSIP VC is downloaded from Inji Web, the verification fails upon uploading the VC.

### User Stories

Jira ID

Description

[INJIVER-627](https://mosip.atlassian.net/browse/INJIVER-627)

Inji Verify SDK - OpenID4VP-VP Verification (Cross-device flow) component.

[INJIVER-1094](https://mosip.atlassian.net/browse/INJIVER-1094)

Publish ‘OpenID4VP-VP Verification’ component as a separate NPM module.

[INJIVER-1092](https://mosip.atlassian.net/browse/INJIVER-1092)

Integrate Postgres DB with Inji Verify.

### Bug Fixes

Below is the list of fixes as part of the 0.12.3 release:

Jira ID

Description

[INJIVER-1109](https://mosip.atlassian.net/browse/INJIVER-1109)

Datashare VC verification was failing due to a configuration issue in mimoto which had to be thereby reverted.

[INJIVER-1126](https://mosip.atlassian.net/browse/INJIVER-1126)

When clicking the 'Verify Another QR Code' button in the Upload tab, if the user cancels the file selection window, the application is not redirecting to the previously viewed Uploaded VC result screen.

[INJIVER-1101](https://mosip.atlassian.net/browse/INJIVER-1101)

Inji Verify API test suite consumed expired VCs which lead to failure in certain test scenarios.

[INJIVER-1099](https://mosip.atlassian.net/browse/INJIVER-1099)

VC verification is failing due to data encoding.

[INJIVER-1098](https://mosip.atlassian.net/browse/INJIVER-1098)

Testcase on GetVpTokenForRequest is failing in dev2 env of inji verify API test rig.

[INJIVER-1116](https://mosip.atlassian.net/browse/INJIVER-1116)

UI and API automation test suite is failing after syncing develop branch.

Documentation

* [Feature documentation](https://docs.inji.io/inji-verify/overview/features)
* [Integration Guide](https://docs.inji.io/inji-verify/technical-overview/integration-guides/openid4vp-vp-verification-integration-guide)
* [API Documentation](https://mosip.stoplight.io/studio/inji-verify)
* [Collab Guide](https://docs.inji.io/inji-verify/functional-overview/releases-1/inji-verify-collab-guide)

[QA Report](https://docs.inji.io/inji-verify/releases/version-0.12.3/test-report)
