# Version 0.16.0

**Release Name:** Inji Web Wallet 0.16.0

**Release Type:** Developer

**Release Date:** 13th March, 2026

## Overview

Inji Web **0.16.0** introduces enhancements to verifiable credential rendering, improved OpenID4VP credential sharing capabilities, security improvements, and several stability fixes across the web wallet.

This release focuses on support for SVG-based credential rendering, Claim 169 QR code handling, improvements to credential download and verification flows, security hardening, and platform reliability improvements.

## Key Highlights

#### SVG-Based Verifiable Credential Rendering

This release introduces support for [**SVG-based Verifiable Credential rendering**](https://www.w3.org/TR/vc-render-method/#the-rendermethod-property) **using the inji-vc-renderer library**, enabling credentials to be visually rendered using templates and exported as PDF.

Key capabilities include:

* SVG-based credential rendering
* Improved visual display of credentials
* SVG to PDF conversion for credential expo

#### Claim 169 QR Code Support

Inji Web Wallet now supports [**Claim 169**](https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification-1) **QR codes,** enabling better compatibility with verifier-driven credential presentation flows.

This allows the wallet to:

* Interpret Claim 169 QR encoded requests
* Initiate credential sharing workflows
* Improve interoperability with verifier platforms

#### Optional DataShare Service

The DataShare service has been made optional, allowing more flexible deployments where credential sharing services are not required.

## Additional Enhancements

Several improvements have been introduced to improve platform stability and maintainability.

These include:

* Updated libraries and dependencies to latest versions
* Improved unit test coverage for refactored components
* Refactoring of key generation utilities using a factory pattern
* Improvements to UI automation scripts using stable element locators
* Configuration updates for the MOSIP ID template and QR code configuration
* Syncing of development and release branches for stability

## Features Released

<table><thead><tr><th width="85.4765625">Type</th><th>Feature / Enhancement</th><th>Jira Link</th></tr></thead><tbody><tr><td>Story</td><td>Web Wallet Support – Claim 169 QR Code Support</td><td><a href="https://mosip.atlassian.net/browse/INJIWEB-1819">INJIWEB-1819</a></td></tr><tr><td>Story</td><td>Support SVG-based Verifiable Credential Rendering using inji-vc-renderer</td><td><a href="https://mosip.atlassian.net/browse/INJIWEB-1580">INJIWEB-1580</a></td></tr><tr><td>Story</td><td>Make DataShare service optional in Inji Web</td><td><a href="https://mosip.atlassian.net/browse/INJIWEB-1721">INJIWEB-1721</a></td></tr><tr><td>Story</td><td>Refactor Key Generation Utilities using Factory Pattern</td><td><a href="https://mosip.atlassian.net/browse/INJIWEB-1621">INJIWEB-1621</a></td></tr></tbody></table>

## Repositories Released

| Module                     | Version                                                                 |
| -------------------------- | ----------------------------------------------------------------------- |
| inji-web                   | [0.16.0](https://github.com/inji/inji-web/tree/v0.16.0)                 |
| inji-config                | [0.14.0](https://github.com/inji/inji-config/tree/v0.14.0)              |
| mimoto                     | [0.21.0](https://github.com/inji/mimoto/tree/v0.21.0)                   |
| inji-vc-renderer           | [0.2.0](https://github.com/inji/inji-vc-renderer/tree/v0.2.0)           |
| inji-vc-renderer-ios-swift | [0.2.0](https://github.com/inji/inji-vc-renderer-ios-swift/tree/v0.2.0) |

## Compatible Modules

| Module       | Version                                                                    |
| ------------ | -------------------------------------------------------------------------- |
| Durian       | [v1.3.0-beta.2](https://github.com/mosip/durian/releases/tag/1.3.0-beta.2) |
| Inji Certify | [0.13.1](https://github.com/inji/inji-certify/tree/v0.13.1)                |
| Inji Verify  | [0.17.0](https://github.com/inji/inji-verify/tree/v0.17.0)                 |
| eSignet      | [1.6.2](https://github.com/mosip/esignet/tree/v1.6.2)                      |

## Known Issues

Below is the list of key known issues specific to this release. For all the known issues, click [here](https://mosip.atlassian.net/issues/?jql=project%3D%22Inji%20Web%22%20and%20type%20in%20%28bug%29%20and%20status%20not%20in%20%28closed%2C%20canceled%29%20order%20by%20created%20DESC).

| Jira Issue                                                                                          | Description                                                                                                                                        |
| --------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| [INJIWEB-1866](https://mosip.atlassian.net/browse/INJIWEB-1866)                                     | Injiweb: After downloading the farmer VC and verifying it in Inji Verify, the verification behaviour changed based on the local network condition. |
| <p></p><p><a href="https://mosip.atlassian.net/browse/INJIWEB-1834">INJIWEB-1834</a></p><p><br></p> | Injiweb: Double scrollbars are displayed on the VC after clicking the View Card option.                                                            |

## Bug Fixes

Below is the complete list of bug fixes included in the [**0.16.0** ](https://mosip.atlassian.net/issues?jql=fixversion%20%3D%200.16.0%0AAND%20status%20%3D%20Closed%0AAND%20type%20%3D%20Bug%0AAND%20labels%20NOT%20IN%20\(Security%2C%20security_related%2C%20Security_Audit%2C%20security\)\&selectedIssue=INJIMOB-2907)release.

| Jira Issue                                                      | Description                                                                         |
| --------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| [INJIWEB-1828](https://mosip.atlassian.net/browse/INJIWEB-1828) | QR code placeholder remained blank in VC preview after verification in Inji Verify. |
| [INJIWEB-1762](https://mosip.atlassian.net/browse/INJIWEB-1762) | Only checkbox click allowed VC selection during OpenID4VP flow.                     |
| [INJIWEB-1746](https://mosip.atlassian.net/browse/INJIWEB-1746) | Internal server error occurred with DataShare VC during OpenID4VP flow.             |
| [INJIWEB-1742](https://mosip.atlassian.net/browse/INJIWEB-1742) | Incorrect error code and message returned when downloading credentials.             |
| [INJIWEB-1719](https://mosip.atlassian.net/browse/INJIWEB-1719) | QR code page design alignment issue fixed.                                          |
| [INJIWEB-1671](https://mosip.atlassian.net/browse/INJIWEB-1671) | Error occurred when downloading VC without credentialSubject field.                 |
| [INJIWEB-1417](https://mosip.atlassian.net/browse/INJIWEB-1417) | Unable to download VC signed with RsaSignature2018 & Ed25519Signature2018.          |
| [INJIWEB-1196](https://mosip.atlassian.net/browse/INJIWEB-1196) | Background color mismatch in downloaded PDF across environments.                    |
| [INJIWEB-823](https://mosip.atlassian.net/browse/INJIWEB-823)   | Improved error handling when Inji Web is unavailable during VC verification.        |
| [INJIWEB-568](https://mosip.atlassian.net/browse/INJIWEB-568)   | Accessibility violations identified by IBM Equal Access checker fixed.              |

## Release Documentation

* [Claim 169 QR Code Support](../../overview/features/claim-169-qr-code-support.md)
* [QA Report](test-report.md)

## Additional Resources

* [Feature Documentation](https://docs.inji.io/inji-wallet/inji-web/overview/features) - Contains detailed explanations of all available features of Inji Web Waller and its usage.
* [Backend Services ](https://docs.inji.io/inji-wallet/inji-web/technical-overview/backend-services)- Provides detailed instructions to set up the backend for the Inji Web Wallet.
* [End User Guide](https://docs.inji.io/inji-wallet/inji-web/functional-overview/end-user-guide) - Offers end-to-end guidance for end users on setup and daily usage.
* [API Documentation](https://docs.mosip.io/inji/inji-web/technical-overview/backend-services/mimoto-bff) - Includes comprehensive details of all APIs, endpoints, request/response formats, and examples.
