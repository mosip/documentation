# Version 0.14.0

**Release Name:** Inji Web Wallet 0.14.0

**Release Type**: Developer

**Release Date**: 17th Sept, 2025

### **Overview**

This release of **Inji Web v0.14.0** delivers support for [**IETF SD-JWT** ](../../overview/features/#multiple-credential-format-support)Verifiable Credential (VC) downloads, improvements in login UI, and enhancements to key handling for credential flows. It also includes multiple usability fixes, technical debt cleanups, and improvements in error handling and code coverage.

Key highlights include [**IETF** **SD-JWT**](https://docs.inji.io/inji-wallet/inji-web/overview#capabilities-snapshot) **VC parsing & storage**, **UI/UX refinements**, and **security fixes** that align Inji Web with the broader Verifiable Credential ecosystem.

### **Key Highlights**

#### **New Feature Additions**

* **IETF SD-JWT VC Support**
  * Added parsing of SD-JWT VC responses and storage in DB once issued via Mimoto.
  * Updated SD-JWT VC PDF template design for improved readability.
  * Refer to the [**feature description**](../../overview/features/#verifying-credential-authenticity) to know more about this feature

#### **Improvements to Existing Features**

* **Login & Authentication Enhancements**
  * Fixed login UI issues and improved redirect behaviour post authentication.
  * Removed access to the passcode page via direct URL entry to ensure flow integrity.
* **Credential Handling Improvements**
  * Proper field labels for key VC attributes replacing camel\_casing.
  * Support for key binding in **without login flows** (ES256, ES256K, Ed25519).
  * API updates to handle reset passcode and lockout flow with automation coverage.
  * Set a passcode limit to enforce security consistency.
* **Developer Enhancements**
  * Compared & aligned Mimoto Docker and Local properties for consistency.
  * Improved code coverage and addressed Sonar security hotspots.

### **Features Released**

| Type                  | Feature / Enhancement                                           | Jira Link                                                       |
| --------------------- | --------------------------------------------------------------- | --------------------------------------------------------------- |
| Feature               | **SD-JWT VC PDF Template Design**                               | [INJIWEB-1699](https://mosip.atlassian.net/browse/INJIWEB-1699) |
| Feature               | **Parse & Store SD-JWT VC Response**                            | [INJIWEB-1642](https://mosip.atlassian.net/browse/INJIWEB-1642) |
| Feature               | **Key Support for Without Login Flow (ES256, ES256K, Ed25519)** | [INJIWEB-1647](https://mosip.atlassian.net/browse/INJIWEB-1647) |
| Technical Enhancement | **Proper Field Labels for Key VC Attributes**                   | [INJIWEB-1684](https://mosip.atlassian.net/browse/INJIWEB-1684) |

### **Repositories Released**

| Module      | Version                                                     |
| ----------- | ----------------------------------------------------------- |
| inji-web    | [0.14.0](https://github.com/mosip/inji-web/tree/v0.14.0)    |
| inji-config | [0.11.0](https://github.com/mosip/inji-config/tree/v0.11.0) |
| mimoto      | [0.19.0](https://github.com/mosip/mimoto/tree/v0.19.0)      |

### **Compatible Modules**

| Module             | Version                                                                   |
| ------------------ | ------------------------------------------------------------------------- |
| inji-certify       | [0.12.1](https://github.com/mosip/inji-certify/releases/tag/v0.12.1)      |
| inji-verify        | [v0.13.1](https://github.com/mosip/inji-verify/releases/tag/v0.13.1)      |
| eSignet            | [1.6.2](https://github.com/mosip/esignet/releases/tag/v1.6.2)             |
| Durian(data share) | [1.3.0-beta.2](https://github.com/mosip/durian/releases/tag/1.3.0-beta.2) |
| vc verifier        | [1.4.0](https://github.com/mosip/vc-verifier/tree/v1.4.0)                 |

### **Known Issues**

Below is the list of key known issues specific to this release. For all known issues, click [here](https://mosip.atlassian.net/issues/?jql=project%3D%22Inji%20Web%22%20and%20type%20in%20%28bug%29%20and%20status%20not%20in%20%28closed%2C%20canceled%29%20order%20by%20created%20DESC).

| **Jira Issue**                                                  | **Description**                                                                                                                   |
| --------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| [INJIWEB-1629](https://mosip.atlassian.net/browse/INJIWEB-1629) | Injiweb-API: Download credentials and fetch credentials fails on the server side.                                                 |
| [INJIWEB-1624](https://mosip.atlassian.net/browse/INJIWEB-1624) | Injiweb-API: Fetch credentials with empty wallet ID and empty `accept-language` header returns improper error codes and messages. |
| [INJIWEB-1619](https://mosip.atlassian.net/browse/INJIWEB-1619) | Injiweb-API: Downloading wallet credentials with a null/empty wallet ID returns improper error codes and messages.                |
|                                                                 |                                                                                                                                   |

### Bug Fixes

Below is the list of bug fixes as part of the [**0.14.0**](https://app.gitbook.com/u/J3VZVcoSqjX2LqmZbSg5nHJZEPI2) release:

| **Jira Issue**                                                  | **Description**                                                                                                      |
| --------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| [INJIWEB-1685](https://mosip.atlassian.net/browse/INJIWEB-1685) | `/logout` API of Mimoto giving 401 in the released environment.                                                      |
| [INJIWEB-1675](https://mosip.atlassian.net/browse/INJIWEB-1675) | On the home screen, welcome message and search option missing.                                                       |
| [INJIWEB-1662](https://mosip.atlassian.net/browse/INJIWEB-1662) | Fix the wallet metadata properties compatibility issue happening between develop and release branches.               |
| [INJIWEB-1652](https://mosip.atlassian.net/browse/INJIWEB-1652) | QR code missing for MOSIP VC when downloading with Gmail login.                                                      |
| [INJIWEB-1644](https://mosip.atlassian.net/browse/INJIWEB-1644) | Search bar accepts invalid input and displays misaligned UI without error message on Issuers page (logged-in state). |
| [INJIWEB-1610](https://mosip.atlassian.net/browse/INJIWEB-1610) | Passcode page accessible via direct URL entry after login – violates flow integrity.                                 |
| [INJIWEB-876](https://mosip.atlassian.net/browse/INJIWEB-876)   | Intermittently unable to download Sunbird VC in Inji Web.                                                            |
| [INJIWEB-761](https://mosip.atlassian.net/browse/INJIWEB-761)   | Client ID is different, and the redirect URI is from different domains.                                              |

### Release Documentation

* [Feature Documentation](../../overview/features/#verifying-credential-authenticity)
* [QA Report](test-report.md)

### Additional Resources

* [Feature Documentation](../../overview/features/) - Contains detailed explanations of all available features of Inji Web Waller and its usage.
* [Backend Services ](../../technical-overview/backend-services/)- Provides detailed instructions to set up the backend for the Inji Web Wallet.
* [End User Guide](../../functional-overview/end-user-guide.md) - Offers end-to-end guidance for end users on setup and daily usage.
* [API Documentation](https://docs.mosip.io/inji/inji-web/technical-overview/backend-services/mimoto-bff) - Includes comprehensive details of all APIs, endpoints, request/response formats, and examples.
