# Version 0.10.0

**Release Name**: Inji Verify v0.10.0

**Support**: Developer

**Release Date**: 10th Oct, 2024

### **Overview**

We are excited to announce the release of Inji Verify version 0.10.0, which brings significant improvements to the platform, including the implementation of OpenID for Verifiable Presentations ([**OpenID4VP**](https://openid.net/specs/openid-4-verifiable-presentations-1\_0.html)) specifications, enhanced error handling scenarios, and support for new QR code sharing mechanisms. This release also includes crucial bug fixes, Docker Compose enhancements, and scanner library upgrades.

#### **New Features**

* **QR Code Handling Enhancements**
  * Previously, JSON-LD VCs embedded in QR codes were dense and difficult to scan. To address this, the QR codes now embed the URL of the VC storage instead of the entire VC. This allows for easier scanning and sharing of credentials. Additionally, a configuration-based approach has been introduced to manage QR code content per issuer and credential type.
  * The sharing of credentials via QR codes has been streamlined. Users can now scan the QR code from either a physical copy or a smartphone, which redirects to Inji Web to authorize and present the VP to Inji Verify.
    * **User Flow for Sharing:**
      * The user downloads a VC as a PDF or has a physical copy from Inji Web.
      * The user scans the QR code using Inji Verify.
      * Inji Verify redirects to Inji Web for authorization, retrieves the VC in VP format, and completes the verification.
* **Error Handling Scenarios - OpenID4VP**
  * Introduced comprehensive error handling scenarios as per the [**OpenID4VP** ](https://openid.net/specs/openid-4-verifiable-presentations-1\_0.html)specification to ensure robustness during Verifiable Presentation transactions. This ensures that issues such as invalid credentials or expired tokens are handled gracefully with informative error messages.
* **Docker Compose**
  * This release simplifies deployment with Docker Compose, allowing users to easily set up and configure the Inji Verify environment.
* **React-scanner-lib Upgrade**\
  The React scanner library has been upgraded for improved performance and reliability in scanning QR codes.
  * ZXing-cpp library
  * PDF.js Integration
* **Updation of Pixel Pass library for Sunbird QR Code**
  * To properly manage binary data by unzipping it before sending it back, the Pixel pass library has been updated to ensure backward compatibility of Sunbird QR codes.
* **Critical Bug Fixes**
  * Several critical bugs have been resolved, including issues with QR code generation and scanning, ensuring a smoother verification experience.

**Additional Improvements:**

* **Client & Redirect URI Support:**
  * Inji Verify now includes extra fields (client\_id & redirect\_uri) to handle OpenID4VP requests, redirecting users for authorization through Inji Web.
* **VC Validation Improvements:**
  * Enhanced validation logic for Verifiable Credentials (VCs) in the VP token format, ensuring that credentials are properly authenticated and validated before presenting results to users.

### **Repositories: Released/Dependent**

| **Repositories**   | **Tags: Released/Dependent**                                     |
| ------------------ | ---------------------------------------------------------------- |
| Inji Verify        | [**v0.10.0**](https://github.com/mosip/inji-verify/tree/v0.10.0) |
| Pixel-Pass Library | [**v0.5.0**](https://github.com/mosip/pixelpass/tree/v0.5.0)     |

### **Compatible modules:** <a href="#compatible-modules" id="compatible-modules"></a>

The following table outlines the tested and certified compatibility of Inji Verify 0.10.0 with other modules.

| Module          | Version                                                         |
| --------------- | --------------------------------------------------------------- |
| **Inji Wallet** | [**0.13.1**](https://github.com/mosip/inji-wallet/tree/v0.13.1) |
| **Inji Web**    | [**0.10.0**](https://github.com/mosip/inji-web/tree/v0.10.0)    |

### **Known Issues**

Below is the list of known issues. To read in detail and view all the issues related to Inji Verify please click [**here.**](https://mosip.atlassian.net/issues/?jql=project%20%3D%20%22INJIVER%22%20AND%20status%20%21%3D%20Closed%20AND%20type%20%3D%20Bug%20ORDER%20BY%20created%20DESC)

| **Jira ID**                                                       | **Description**                                                                                        |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| [**INJIVER-639**](https://mosip.atlassian.net/browse/INJIVER-639) | Upload feature not functioning on Lower-End iPhones in Chrome Browser                                  |
| [**INJIVER-638**](https://mosip.atlassian.net/browse/INJIVER-638) | Inji Verify - Page Fails to Load on Lower-End iPhones in Safari Browser                                |
| [**INJIVER-625**](https://mosip.atlassian.net/browse/INJIVER-625) | Inji Verify - Upload not functioning on Mac Safari Browser Versions 16 and Below                       |
| [**INJIVER-610**](https://mosip.atlassian.net/browse/INJIVER-610) | QR Code scan fails on Windows devices.                                                                 |
| [**INJIVER-237**](https://mosip.atlassian.net/browse/INJIVER-237) | Unable to scan sunbird QR code through Mobile/Windows/Mac                                              |
| [**INJIVER-387**](https://mosip.atlassian.net/browse/INJIVER-387) | INJIVER- When the user turns on the internet connection, they encounter a 'no internet' error screen." |
| [**INJIVER-422**](https://mosip.atlassian.net/browse/INJIVER-422) | Inji Verify- The alignment on the no internet error screen is not correct on mobile                    |



### **Bug Fixes**

Below is the list of fixes as part of the **0.10.0** release:

| **Jira ID**                                                       | **Description**                                                                                                                            |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| [**INJIVER-150**](https://mosip.atlassian.net/browse/INJIVER-150) | Able to upload and validate QR Code when internet connection is off.                                                                       |
| [**INJIVER-159**](https://mosip.atlassian.net/browse/INJIVER-159) | Enhancement: Upload QR Code is accepting images with two same working QR Codes added in one image.                                         |
| [**INJIVER-301**](https://mosip.atlassian.net/browse/INJIVER-301) | Inji Verify-In Browser Stack, after clicking the 'Scan QR Code' button, the default image does not appear.                                 |
| [**INJIVER-302**](https://mosip.atlassian.net/browse/INJIVER-302) | Inji Verify- In Browser Stack, after clicking the 'Scan QR Code' button,the user is not directed to the camera access 'Allow' popup screen |
| [**INJIVER-303**](https://mosip.atlassian.net/browse/INJIVER-303) | Inji Verify-In Browser Stack, after clicking the 'Scan QR Code' button, the default image does not appear.                                 |
| [**INJIVER-305**](https://mosip.atlassian.net/browse/INJIVER-305) | Inji Verify-In Browser Stack, after clicking the 'Scan QR Code' button, the default image does not appear                                  |
| [**INJIVER-312**](https://mosip.atlassian.net/browse/INJIVER-312) | Inji Verify : Sometimes the error message is not displayed when we try to upload a file of min size.                                       |
| [**INJIVER-328**](https://mosip.atlassian.net/browse/INJIVER-328) | Inji Verify- The user scan or upload the Expired QR code is getting the success screen                                                     |
| [**INJIVER-329**](https://mosip.atlassian.net/browse/INJIVER-329) | Inji Verify- In android The deactivated flashlight feature is appearing on the scan screen page                                            |
| [**INJIVER-333**](https://mosip.atlassian.net/browse/INJIVER-333) | Inji Verify- The alignment of the page for uploading and scanning QR codes in the Safari browser is incorrect.                             |
| [**INJIVER-334**](https://mosip.atlassian.net/browse/INJIVER-334) | Inji Verify- The scan screen view is not rendering correctly in the Firefox browser                                                        |
| [**INJIVER-390**](https://mosip.atlassian.net/browse/INJIVER-390) | Injiverify- If the attribute values are lengthy, text wrapping does not occur when verifying credentials                                   |
| [**INJIVER-444**](https://mosip.atlassian.net/browse/INJIVER-444) | Inji Verify- Update the Readme file required for docker-compose                                                                            |
| [**INJIVER-600**](https://mosip.atlassian.net/browse/INJIVER-600) | Inji Verify- No error message when camera being disabled and if the camera is not present.                                                 |
| [**INJIVER-601**](https://mosip.atlassian.net/browse/INJIVER-601) | Inji Verify- Back button from scan page is bringing the last event from upload to scan screen.                                             |
| [**INJIVER-602**](https://mosip.atlassian.net/browse/INJIVER-602) | Inji Verify- Intermittently, the scan pages alignment is not proper.                                                                       |
| [**INJIVER-607**](https://mosip.atlassian.net/browse/INJIVER-607) | Inji Verify- The page alignment during scanning on iOS devices is not accurate                                                             |
| [**INJIVER-611**](https://mosip.atlassian.net/browse/INJIVER-611) | Inji Verify- Unable to upload .PNG extension QR codes                                                                                      |
| [**INJIVER-612**](https://mosip.atlassian.net/browse/INJIVER-612) | Inji Verify- Mobile Homepage Button Redirects to Connection Failure Page in Desktop View                                                   |

### **Documentation**

* [Feature Documentation](../../functional-overview/features.md)
* [User guide](../../functional-overview/end-user-guide.md)
* [QA Report](test-report.md)
