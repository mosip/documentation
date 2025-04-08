# Version 0.12.0

**Release Name:** Inji Web 0.12.0

**Release Type:** Developer

**Release Date:** 8th April, 2025

### **Overview**

This release delivers significant enhancements to the Inji Web Wallet experience, focusing on dynamic authorization configuration, improved credential PDF generation, support for multi-lingual templates, and a basic revamped homepage UI. These updates aim to streamline user interactions and offer a more visually enriched and localized interface.

### **Major Highlights/Features**

#### **Authorization Endpoint Discovery through Auth Server Well-Known**

**Feature**: Dynamic Authorization Endpoint Retrieval\
Inji Web now dynamically retrieves the authorization\_endpoint from the authorization server’s .well-known configuration, aligning with OAuth standards.

#### **Key Enhancements**:

* **Dynamic Retrieval**: Automatically fetches authorization\_endpoint during issuer selection.
* **Backend Caching**: Calls handled via backend (mimoto) to avoid CORS issues and cache responses with configurable expiry using Spring Cache.
* **New Endpoint Introduced**: /issuers/{issuer-id}/configuration for fetching issuer and authorization config.
* **Deprecated**: /issuers/{issuer-id}/well-known-proxy (scheduled for removal in next release).
* **Code Optimization**: Clean-up of issuer controller and service files for better maintainability.

#### **New PDF Template Implementation for Existing Use-Cases**

**Overview**:\
A revamped PDF template is now used for National ID & TAN ID credential downloads use-cases, improving aesthetics, branding, and usability.

**Key Features**:

* **Professional Layout**: Modern design with clean visuals and prominent placement of credential details.
* **Prominent QR Code**: Displayed clearly on a single page for ease of scanning and offline validation.
* **Backward Compatible**: Compatible with v1.1 Verifiable Credential (VC) format.
* **Reusable Template**: Modular design allows easy adaptation for future use-cases like driver’s license, education credentials, etc.

**Implementation Highlights**:

* Built with HTML for rendering consistency.
* Validated across platforms and devices.
* Use-case specific tailoring (e.g., National ID, TAN ID).
* QR readability verified via Inji Verify.

#### **Multi-Lingual Support for Credential PDF Generation**

**Feature Overview**:\
Credential PDFs can now be generated in multiple languages using locale-specific templates and resources.

**Key Enhancements**:

* **API Update**: Added locale parameter in credential generation APIs.
* **Localized Templates**:
  * **Template Loading**: We load templates based on the combination of `issuerId` and `credentialType`, not based on language or locale.
  * **Label Localization in PDF**: In the generated PDF, the labels for `displayProperties` will appear in the selected locale **if it is supported by the issuer**. If not, the system will default to using the **first available locale** defined in the `displayProperties`.\

* **Code Updates**:
  * Enhanced CredentialController, CredentialService, and CredentialServiceImpl for locale handling.
  * Utility methods updated for template resolution.
* **Testing**:
  * Unit tests for locale logic.
  * End-to-end multilingual credential generation verified.

**Stoplight API** - [https://mosip.stoplight.io/docs/mimoto/wb8oczgyliz0y-mimoto](https://mosip.stoplight.io/docs/mimoto/wb8oczgyliz0y-mimoto)

### **Enhancements**

**UI Enhancements on the Inji Web Home Page**

* Improved homepage experience with a cleaner layout and branding refresh.
* Optimized for responsiveness across devices.

### **Bugs Fixes**

As part of the **0.12.0 release**, the following issue has been addressed:

| **Jira issue**                                                       | **Issue description**                                                                                  |
| -------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| [**Inji Web-760**](https://mosip.atlassian.net/browse/INJIWEB-760)   | Inji Web - There is no background image for downloading the VC PDF in Inji Web                         |
| [**Inji Web-964**](https://mosip.atlassian.net/browse/INJIWEB-964)   | Inji Web:Some places number and "full stop"/period are missing in FAQ section                          |
| [**Inji Web-1149**](https://mosip.atlassian.net/browse/INJIWEB-1149) | Inji Web: Borders for share visibility page are missing in tablet portrait mode                        |
| [**Inji Web-1189**](https://mosip.atlassian.net/browse/INJIWEB-1189) | Inji Web: toast message "coming soon" coming multiple times, if the user clicks on "Click Here" button |
| [**Inji Web-1191**](https://mosip.atlassian.net/browse/INJIWEB-1191) | Inji Web: there is a typo at "Download with Confidence Save your important documents instantly"        |
| [**Inji Web-1192**](https://mosip.atlassian.net/browse/INJIWEB-1192) | Inji Web -The language has not been translated into the selected language for some page                |
| [**Inji Web-1433**](https://mosip.atlassian.net/browse/INJIWEB-1433) | Fix the issues noticed in the inji web and mimoto during the download flow                             |

### **Known Open Bugs**

The list of known issues can be found [**here**](https://mosip.atlassian.net/issues/?jql=project%3D%22Inji%20Web%22%20and%20type%20in%20%28bug%29%20and%20status%20not%20in%20%28closed%2C%20canceled%29%20order%20by%20created%20DESC)**.**

| **Jira issue**                                                       | **Issue description**                                                                       |
| -------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| [**Inji Web-1508**](https://mosip.atlassian.net/browse/INJIWEB-1508) | Inji Web: "Restricted Use Area" displayed in QR code page,better to adjust it in first page |
| [**Inji Web-1503**](https://mosip.atlassian.net/browse/INJIWEB-1503) | Inji Web: "cut here" appeared inside the "terms and conditions" section                     |
| [**Inji Web-1500**](https://mosip.atlassian.net/browse/INJIWEB-1500) | Inji Web: no.of field values in VC document and scanned document are not the same           |
| [**Inji Web-1499**](https://mosip.atlassian.net/browse/INJIWEB-1499) | Inji Web: getting "did" details in the scan document                                        |
| [**Inji Web-1498**](https://mosip.atlassian.net/browse/INJIWEB-1498) | Inji Web: The QR code size on the VC PDF is too small to scan                               |
| [**Inji Web-1496**](https://mosip.atlassian.net/browse/INJIWEB-1496) | Inji Web: while verifying VC from injiverify, data is not rendered in the VC lang           |

### **Repositories Released**

| **Repositories** | **Tags Released**                                              |
| ---------------- | -------------------------------------------------------------- |
| **Inji Web**     |  [**v0.12.0**](https://github.com/mosip/inji-web/tree/v0.12.0) |
| **Inji Config**  | [**v0.7.0**](https://github.com/mosip/inji-config/tree/v0.7.0) |
| **Mimoto**       | [**v0.17.0**](https://github.com/mosip/mimoto/tree/v0.17.0)    |

### **Compatible Modules**

The following table outlines the tested and certified compatibility of **Inji Web 0.12.0** with other modules.

| **Module**             | **Version**                                                                    |
| ---------------------- | ------------------------------------------------------------------------------ |
| **eSignet**            | [**1.4.1**](https://github.com/mosip/esignet/tree/v1.4.1)                      |
| **Inji Verify**        | [**0.11.0**](https://github.com/mosip/inji-verify/tree/v0.11.0)                |
| **Inji Certify**       | [**0.10.2**](https://github.com/mosip/inji-certify/tree/v0.10.2)               |
| **durian(data share)** | [**v1.3.0-beta.2**](https://github.com/mosip/durian/releases/tag/1.3.0-beta.2) |

### Documentation

* [**Build and Deployment**](../../build-and-deploy/)
* [**Feature Documentation**](https://docs.mosip.io/inji/inji-web/functional-overview/features)
* [**User Guide**](https://docs.mosip.io/inji/inji-web/functional-overview/end-user-guide)
* [**QA Report**](https://docs.inji.io/inji-wallet/inji-web/inji-web/version-0.12.0/test-report)
* [**API Documentation**](https://docs.mosip.io/inji/inji-web/technical-overview/backend-services/mimoto-bff)
