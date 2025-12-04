# Version 0.13.0

**Release Name**: Inji Web Wallet 0.13.0

**Release Type**: Developer

**Release Date**: 29th July, 2025

### Overview

This release of **Inji Web Wallet v0.13.0** marks a significant milestone with the introduction of **Identity Provider (IDP) based login**, enabling users to seamlessly log in using their **Google account**. This enhancement makes credential access and management more intuitive and accessible, especially for users new to the ecosystem.

Once logged in via Google, users can **securely download and store their credentials** in the **Stored Cards** section of the web wallet. This introduces a more user-friendly and federated authentication model aligned with modern identity standards. Together, these updates strengthen the Inji Web Wallet's position as a secure, standards-compliant, and user-friendly platform for managing verifiable credentials.

### Key Highlights

* **Multiple new API integrations** to support login, token validation, and credential retrieval workflows
* **New database structures** for securely managing user sessions and credential metadata
* **Enhanced OpenID4VCI compliance**, including proper handling of `c_nonce` and token types
* **UI responsiveness improvements** across devices
* **Security updates**, addressing cryptographic best practices and container hardening
* **Expanded test automation** for login, credential management, and passcode flows
* Enhanced error handling for OAuth2 login and download APIs

### UI Upgrades

* **Landing Screen**:
  * Clear call-to-action for users to log in via Google or existing credentials.
  * Visual improvements and responsive layout for desktop and mobile.
* **Google Login Integration**:
  * One-click login with Google using OAuth 2.0.
  * Automatic redirection to the wallet homepage on successful authentication.
* **Passcode Setup / Login**:
  * For first-time users, a guided flow to create a secure 6-digit passcode.
  * Returning users can log in quickly using their passcode.
* **Session Management**:
  * Improved handling of session expiry with user-friendly messages.
  * Re-authentication prompts without losing current context.
* **Error Handling**:
  * User-friendly error messages for all the negative flows.
  * Clear navigation paths for retrying or resetting login.
* **Visual Identity**:
  * Enhanced UI branding with visual cues and localized messages.
  * Support for dark/light modes and accessibility improvements.

### Features Released

> **Note:** Detailed information about this feature, including all related user stories and tasks, is available in the linked JIRA ticket above. Please refer to it for comprehensive insights.

| Jira                           | Summary                                                       |
| ------------------------------ | ------------------------------------------------------------- |
| Login Feature via IDP (Google) | [INJIWEB-879](https://mosip.atlassian.net/browse/INJIWEB-879) |

## Repositories Released

| Module      | Version                                                   |
| ----------- | --------------------------------------------------------- |
| inji-web    | [0.13.0](https://github.com/mosip/inji-web/tree/v0.13.0)  |
| inji-config | [0.9.0](https://github.com/mosip/inji-config/tree/v0.9.0) |
| mimoto      | [0.18.0](https://github.com/mosip/mimoto/tree/v0.18.0)    |

## Compatible Modules

| Module               | Version                                                      |
| -------------------- | ------------------------------------------------------------ |
| Inji Wallet (Mobile) | [0.17.0](https://github.com/mosip/inji-wallet/tree/v0.17.0)  |
| Inji Certify         | [0.11.0](https://github.com/mosip/inji-certify/tree/v0.11.0) |
| Inji Verify          | [0.12.3](https://github.com/mosip/inji-verify/tree/v0.12.3)  |
| eSignet              | [1.5.1](https://github.com/mosip/esignet/tree/v1.5.1)        |
| VC Verifier          | [1.3.0](https://github.com/mosip/vc-verifier/tree/v1.3.0)    |

## Bug Fixes

As part of the 0.13.0 release, the following issue has been addressed:

| Jira                                                            | Description                                                    |
| --------------------------------------------------------------- | -------------------------------------------------------------- |
| [INJIWEB-1656](https://mosip.atlassian.net/browse/INJIWEB-1656) | Download with Validity in Login Flow fails for large data      |
| [INJIWEB-1649](https://mosip.atlassian.net/browse/INJIWEB-1649) | `c_nonce` expected outside access token as per OpenID4VCI spec |
| [INJIWEB-1623](https://mosip.atlassian.net/browse/INJIWEB-1623) | Invalid error message for empty grant type with Google login   |
| [INJIWEB-1620](https://mosip.atlassian.net/browse/INJIWEB-1620) | Error code incorrect for missing code in OAuth flow            |
| [INJIWEB-1615](https://mosip.atlassian.net/browse/INJIWEB-1615) | User-unfriendly error messaging on profile page                |
| [INJIWEB-1603](https://mosip.atlassian.net/browse/INJIWEB-1603) | Biased random numbers created from crypto source               |
| [INJIWEB-1597](https://mosip.atlassian.net/browse/INJIWEB-1597) | Docker image vulnerabilities patched                           |
| [INJIWEB-1593](https://mosip.atlassian.net/browse/INJIWEB-1593) | Double scrollbars on View Card screen                          |
| [INJIWEB-1592](https://mosip.atlassian.net/browse/INJIWEB-1592) | Unnecessary scrollbars on stored card                          |
| [INJIWEB-1591](https://mosip.atlassian.net/browse/INJIWEB-1591) | Missing error message for invalid token type                   |
| [INJIWEB-1590](https://mosip.atlassian.net/browse/INJIWEB-1590) | Session expiry does not trigger re-authentication              |
| [INJIWEB-1588](https://mosip.atlassian.net/browse/INJIWEB-1588) | Redundant `/users/me` hit in guest mode                        |
| [INJIWEB-1587](https://mosip.atlassian.net/browse/INJIWEB-1587) | Expired token not showing expected error                       |
| [INJIWEB-1569](https://mosip.atlassian.net/browse/INJIWEB-1569) | Misalignment on share validity screen                          |
| [INJIWEB-1568](https://mosip.atlassian.net/browse/INJIWEB-1568) | Hamburger menu unresponsive in mobile view                     |
| [INJIWEB-1567](https://mosip.atlassian.net/browse/INJIWEB-1567) | Translations not showing on Authorize page                     |
| [INJIWEB-1501](https://mosip.atlassian.net/browse/INJIWEB-1501) | Extra spacing between Generation Date and value                |

## Known Issues

Below is the list of known issues for Inji Web Wallet as of version [0.13.0](https://mosip.atlassian.net/issues/?jql=project%3D%22Inji%20Web%22%20and%20type%20in%20%28bug%29%20and%20status%20not%20in%20%28closed%2C%20canceled%29%20order%20by%20created%20DESC):

| JIRA ID                                                         | Issue Summary                                                                                                                   |
| --------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| [INJIWEB-1661](https://mosip.atlassian.net/browse/INJIWEB-1661) | INJI Web - Unable to re-download the same VC again.                                                                             |
| [INJIWEB-1660](https://mosip.atlassian.net/browse/INJIWEB-1660) | INJI Web - Unable to download MOSIP VC after logging in with email address.                                                     |
| [INJIWEB-1655](https://mosip.atlassian.net/browse/INJIWEB-1655) | INJI Usability - After entering wrong passcode and clicking submit, the existing passcode is not cleared.                       |
| [INJIWEB-1646](https://mosip.atlassian.net/browse/INJIWEB-1646) | INJI Web - Unable to download MOSIP VC after logging in with email address.                                                     |
| [INJIWEB-1635](https://mosip.atlassian.net/browse/INJIWEB-1635) | INJI Usability - After taking backup in INJI Mobile, same VCs should appear in INJI Web when logged in with same email address. |
| [INJIWEB-1617](https://mosip.atlassian.net/browse/INJIWEB-1617) | No success message appears after matching passcodes.                                                                            |
| [INJIWEB-1594](https://mosip.atlassian.net/browse/INJIWEB-1594) | Download icon not aligned properly on view card screen.                                                                         |
| [INJIWEB-1589](https://mosip.atlassian.net/browse/INJIWEB-1589) | `updated_at` value is generated in the DB for an initial user account creation.                                                 |
| [INJIWEB-1585](https://mosip.atlassian.net/browse/INJIWEB-1585) | Better to show user approval dialogue box after clicking on forget passcode button.                                             |
| [INJIWEB-1584](https://mosip.atlassian.net/browse/INJIWEB-1584) | Better to update "Forgot passcode" to "Reset passcode" on the next screen.                                                      |
| [INJIWEB-1583](https://mosip.atlassian.net/browse/INJIWEB-1583) | While downloading the cards, user profile details are not displayed in the background.                                          |
| [INJIWEB-1582](https://mosip.atlassian.net/browse/INJIWEB-1582) | Clicking browser back button while resetting password leads to inappropriate error.                                             |
| [INJIWEB-1581](https://mosip.atlassian.net/browse/INJIWEB-1581) | Downloaded cards are not aligned in reverse chronological order.                                                                |
| [INJIWEB-1576](https://mosip.atlassian.net/browse/INJIWEB-1576) | After updating passcode configuration, user unable to login from the UI.                                                        |
| [INJIWEB-1575](https://mosip.atlassian.net/browse/INJIWEB-1575) | Passcode visible in plain text format in browser inspect mode.                                                                  |
| [INJIWEB-1574](https://mosip.atlassian.net/browse/INJIWEB-1574) | No proper error message on UI when Redis/DB is down.                                                                            |
| [INJIWEB-1562](https://mosip.atlassian.net/browse/INJIWEB-1562) | No retry prompt after 5 failed passcode attempts.                                                                               |
| [INJIWEB-1561](https://mosip.atlassian.net/browse/INJIWEB-1561) | No display of remaining attempts while retrying passcode.                                                                       |
| [INJIWEB-1560](https://mosip.atlassian.net/browse/INJIWEB-1560) | Gmail login: "Submit" button gets enabled even when passcode fields are not validated.                                          |

## Documentation Links

* [Feature Documentation](https://docs.inji.io/inji-wallet/inji-web/overview/features)
* [Integration Guides](https://docs.inji.io/inji-wallet/inji-web/technical-overview)
* [User Guide](https://docs.inji.io/inji-wallet/inji-web/functional-overview/end-user-guide)
* [API Documentation](https://docs.mosip.io/inji/inji-web/technical-overview/backend-services/mimoto-bff)
* [QA Report](test-report.md)
