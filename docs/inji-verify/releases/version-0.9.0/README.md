# Version 0.9.0

**Release Name**: Inji Verify 0.9.0

**Support**: Developer Release

**Release Date**: 5th July 2024

### **Overview**

Release 0.9.0 of Inji Verify enhances usability with a mobile-responsive portal, adds support for CBOR QR code decoding, and includes critical bug fixes. It introduces UI improvements using Tailwind CSS, enables PDF scanning with QR codes, and enhances credential display, including expired credentials. These updates aim to improve overall user experience and system functionality.

#### **New Features:**

**1. UI Enhancements**

* The user interface of Inji Verify has been optimized for mobile devices, offering responsive views that adapt seamlessly to different screen sizes. Users can conveniently access and utilize the scan and upload feature across devices.
* Inji Verify has undergone user interface and user experience enhancements based on GenderMag principles, ensuring improved accessibility and usability.

**2. CBOR QR Code Support**

* Support for CBOR-encoded QR codes has been added, expanding compatibility and enabling broader usage scenarios. Inji Verify can now decode the CBOR QR code using the pixel pass library.

**3. Tech Upgrades**

* Inji Verify has transitioned from MaterialUI to the Tailwind CSS library, offering enhanced flexibility and customization options.

**4. Critical Bug Fixes**

* Several critical bugs related to the scan and upload functionalities have been identified and fixed, ensuring smoother user experiences.

**5. Support for PDFs Containing QR Codes**

* Inji Verify now supports various formats, including PDFs that contain QR codes, broadening the range of documents that can be scanned and verified.

**6. Credential Display Enhancements**

* Credential details retrieved from the issuer's well-known configuration include display properties, ensuring a consistent and accurate representation of credential information.
* Users can now view expired credentials within the Inji Verify portal.

**7. Browser Support**

* **Chrome, Edge, Safari, and Firefox**: Full support for both scan and upload features, ensuring a seamless user experience across these popular browsers.

**Assumptions or Limitations:**

* **Verification Method**: We are assuming the verification method currently only works with DID (Decentralized Identifier). However, it can also be a direct URL key reference. This distinction is crucial for correct implementation and usage. You can look at the specific code handling this verification method [here](https://github.com/mosip/inji-verify/blob/c32f37b1df3c99fc9ecda12af573e73083e02111/inji-verify/src/utils/verification-utils.js#L7).

This release represents a significant step forward in improving functionality, usability, and compatibility within Inji Verify.

**Repository Released**

| Repositories       | Tags Released                                                        |
| ------------------ | -------------------------------------------------------------------- |
| Inji Verify        | [**v0.9.0**](https://github.com/mosip/inji-verify/tree/v0.9.0)       |
| Pixel-Pass Library | [**v0.1.6**](https://www.npmjs.com/package/@mosip/pixelpass/v/0.1.6) |

### **Known Issues**

Below is the list of known issues. To read in detail and view all the topics related to Inji Verify please click [**here.**](https://mosip.atlassian.net/issues/?filter=-1\&jql=project%20%3D%20INJIVER%20AND%20type%20%3D%20Bug%20AND%20status%20%21%3D%20Closed%20ORDER%20BY%20created%20DESC)

<table><thead><tr><th width="302">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-329"><strong>INJIVER-329</strong></a></td><td>Inji Verify - In Android the deactivated flashlight feature appears on the scan screen page.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-334"><strong>INJIVER-334</strong></a></td><td>Inji Verify- The scan screen view is not rendering correctly in the Firefox browser.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-282"><strong>INJIVER-282</strong></a></td><td>Inji Verify - When the user uploads a file in an unsupported format, they do not receive the proper error message.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-302"><strong>INJIVER-302</strong></a></td><td>Inji Verify - In Browser Stack, after clicking the 'Scan QR Code' button, the user is not directed to the camera access 'Allow' popup screen.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-390"><strong>INJIVER-390</strong></a></td><td>Inji Verify - If the attribute values are lengthy, text wrapping does not occur when verifying credentials</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-389"><strong>INJIVER-389</strong></a></td><td>Inji Verify - After updating the registry value of a sunbird VC, the old QR code is getting validated.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-388"><strong>INJIVER-388</strong></a></td><td>Inji Verify - Getting "No MultiFormat Readers were able to detect the QR code." error when the VC PDF from the inji web application is uploaded.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-329"><strong>INJIVER-329</strong></a></td><td>Inji Verify - In Android The deactivated flashlight feature appears on the scan screen page</td></tr></tbody></table>

### **Bug Fixes**

Below is the list of fixes as part of the **0.9.0** release:

| Jira ID                                                           | Description                                                                                                                                                                                     |
| ----------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [**INJIVER-418**](https://mosip.atlassian.net/browse/INJIVER-418) | Inji Verify - The upload feature is not working on IOS mobile devices.                                                                                                                          |
| [**INJIVER-405**](https://mosip.atlassian.net/browse/INJIVER-405) | Inji Verify -The upload feature is not working in the Safari browser.                                                                                                                           |
| [**INJIVER-296**](https://mosip.atlassian.net/browse/INJIVER-296) | Inji Verify - Enhancement The user can use the expired QR code; it does not display any error messages.                                                                                         |
| [**INJIVER-275**](https://mosip.atlassian.net/browse/INJIVER-275) | Inji Verify - Allowed file formats list should be updated with PDF.                                                                                                                             |
| [**INJIVER-274**](https://mosip.atlassian.net/browse/INJIVER-274) | Inji Verify - "QR Code uploaded successfully" message is popping up a late compared to the UI.                                                                                                  |
| [**INJIVER-249**](https://mosip.atlassian.net/browse/INJIVER-249) | "Upload Another QR Code" button is displayed instead of "Upload QR Code" button.                                                                                                                |
| [**INJIVER-248**](https://mosip.atlassian.net/browse/INJIVER-248) | Allowed file format and Min size displayed at the right bottom of the inji verify screen is missing on uploading QR code whose size is not supported.                                           |
| [**INJIVER-246**](https://mosip.atlassian.net/browse/INJIVER-246) | Notification pop up asking for camera access should display on the browser itself once user deny the camera access and try to scan the qr code.                                                 |
| [**INJIVER-244**](https://mosip.atlassian.net/browse/INJIVER-244) | Inji Verify - Able to scan a scratched QR code via mobile.                                                                                                                                      |
| [**INJIVER-240**](https://mosip.atlassian.net/browse/INJIVER-240) | Instruction message displayed on the header of the scanner when camera gets open to scan qr code , is not appropriate.                                                                          |
| [**INJIVER-239**](https://mosip.atlassian.net/browse/INJIVER-239) | Instruction message displayed in the inji verify home page on the header of the scanner is not appropriate.                                                                                     |
| [**INJIVER-238**](https://mosip.atlassian.net/browse/INJIVER-238) | Scan feature is not working with mobile camera less than 8MP.                                                                                                                                   |
| [**INJIVER-235**](https://mosip.atlassian.net/browse/INJIVER-235) | No option to select back camera in mobile browser while scanning qr code.                                                                                                                       |
| [**INJIVER-234**](https://mosip.atlassian.net/browse/INJIVER-234) | Scan feature is not working in windows (web based) for 1 mp camera.                                                                                                                             |
| [**INJIVER-233**](https://mosip.atlassian.net/browse/INJIVER-233) | Inji Verify - Sometimes, we are seeing internet not available in the middle of verification.                                                                                                    |
| [**INJIVER-232**](https://mosip.atlassian.net/browse/INJIVER-232) | Inji Verify - The steps while verifying the QR code is not displayed in mobile view.                                                                                                            |
| [**INJIVER-228**](https://mosip.atlassian.net/browse/INJIVER-228) | Mobile view alignment is not properly aligned.                                                                                                                                                  |
| [**INJIVER-202**](https://mosip.atlassian.net/browse/INJIVER-202) | When I am uploading a working QR code i am able to view the data but it successful error message displaying is wrong i.e "Unfortunately, the given credential is invalid!" and is in red color. |
| [**INJIVER-151**](https://mosip.atlassian.net/browse/INJIVER-151) | Enhancement: The scan QR code button is not highlighted. The messages (error/successful upload) are not properly aligned.                                                                       |
| [**INJIVER-149**](https://mosip.atlassian.net/browse/INJIVER-149) | Time and date displayed on card are not proper (localization of time and date are not done).                                                                                                    |
| [**INJIVER-146**](https://mosip.atlassian.net/browse/INJIVER-146) | Getting "QR code uploaded successfully" pop up on result screen.                                                                                                                                |
| [**INJIVER-145**](https://mosip.atlassian.net/browse/INJIVER-145) | QR Code or card with QR code generated via Sunbird is not getting uploaded.                                                                                                                     |
| [**INJIVER-143**](https://mosip.atlassian.net/browse/INJIVER-143) | Not getting appropriate error message on uploading blurry QR code.                                                                                                                              |
| [**INJIVER-141**](https://mosip.atlassian.net/browse/INJIVER-141) | Activate your device camera step is getting selected even while uploading the QR code.                                                                                                          |

### **Documentation**

* [Feature documentation](https://docs.mosip.io/inji/inji-verify/functional-overview/features)
* [User guide](https://docs.mosip.io/inji/inji-verify/functional-overview/end-user-guide)
* [QA Report](https://docs.mosip.io/inji/inji-verify/releases/version-0.9.0/test-report)
