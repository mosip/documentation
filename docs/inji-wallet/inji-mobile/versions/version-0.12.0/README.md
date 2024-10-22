# Version 0.12.0

**Release Nam**e: Inji 0.12.0

**Support**: Developer Release

**Release Date**: 31st May, 2024

### Overview

We are delighted to announce the release of Inji Wallet Version 0.12.0 . This release is compatible with v0.12.0 Mimoto release. As part of 0.12.0, Inji Wallet introduces below mentioned key features:

**1. Features added to the Download Functionality:**

* Credential Type Selection
* VC Verification
* QR Code Generation for VC

**2. Library:**

* QR Code Generation: PixelPass

**3. UI/UX Enhancements:**

* Card View UI Changes
* VC Share Optimization
* Activity Log Enhancements
* GenderMag Fixes

**4. Data Backup Enhancements**

Inji Wallet app addresses gender / inclusivity bias in software through GenderMag analysis. In this release, we have incorporated GenderMag fixes for UI / UX in inclusivity space.

To know more about the GenderMag UI/UI changes in the Inji Wallet application, please refer[ here](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features/gendermag).

### Summary

Please find below the details for the **Inji Version 0.12.0** release:

### Features added to the Download Functionality:

#### Credential Type Selection:

Inji Wallet now allows users to select the type of credential they need, giving them the option to choose from a list of Credential Types issued by the ID provider. This enables users to download Verifiable Credentials that match their selection.

#### VC Verification:

Inji Wallet provides the functionality to verify Verifiable Credentials using the Digital Bazaar library. The issuer's signature is verified based on the proof type provided by the issuer. Currently, we support the RSA signature type, and we will soon add support for the Ed25519 proof type.

To prevent failures during download caused by verification of Verifiable Credentials with any other signature type, this step needs to be bypassed. Learn more about the steps [**here**](../../customization-overview/credential\_providers.md).

#### QR code generation for VC:

PixelPass, part of the Inji Credentialing stack, generates QR codes for Verifiable Credentials within the Inji Wallet. It's specifically designed for smaller data sets when the ID provider doesn't send a QR code along with the Verifiable Credential. Users can view and use this QR code for verification purposes by the relying party or service provider.

To know more about QR code verification, read about Inji Verify [**here**](https://docs.mosip.io/inji/inji-mobile-wallet/components#id-5.-pixelpass).

### Library

QR Code Generation: PixelPass

To read more about PixelPass library refer [**here**](../../technical-overview/integration-guide/pixelpass.md).

### UI/UX enhancements:

Inji Wallet version 0.12.0 introduces enhanced UI to deliver a seamless user experience with an intuitive design. The UI modifications included in this release are:

**Card View UI Changes**:

* Users can now view the card in two ways:
  * A mini view on the Home Page with a quick access menu.
  * A detailed view.
* Additionally, the Settings menu has been moved to the NavBar for easier access.

**VC Share Optimization**:

* With the quick access menu in the mini view of the card:
  * Users can quickly initiate a Share or Share with Selfie action from the card to be shared.

**Activity Log enhancements:**

The audit logs have been enhanced to elevate the user experience. Now, they include the card type, along with the card number and the action performed, for better readability.

**GenderMag P2 items:**

* Enhanced text to clarify the next steps and reasons for permission requests.
* Improved user experience by providing clear notifications for success or failure, including a success screen or error banner with the reason for failure during VC sharing and face verification.

### Data backup enhancements:

As part of the 0.12.0 release, the following enhancements have been made to the Data Backup feature:

1. **Cloud as the Primary Source**:

* The backup file stored in the cloud will be the primary source of truth.
* Once the backup file is downloaded and restored, it is automatically removed from the local app storage to ensure that the latest backup file is always restored.

2. **iCloud Section Visibility**:

* The iCloud Section is now visible in the Backup & Restore settings screen, allowing users to easily manage their backup.

3. **User Notification**:

* When the user initiates a Backup or Restore process, a banner will be displayed to inform users about the ongoing process.

### Repository Released

| **Repositories** | **Tags Released**                                                                                |
| ---------------- | ------------------------------------------------------------------------------------------------ |
| Inji             | <p><a href="https://github.com/mosip/inji/releases/tag/v0.12.0">v0.12.0</a><br></p>              |
| mimoto           | <p><a href="https://github.com/mosip/mimoto/releases/tag/v0.12.0">v0.12.0</a><br></p>            |
| mosip-config     | <p><a href="https://github.com/mosip/mosip-config/releases/tag/v0.12.0-INJI">v0.12.0</a><br></p> |

### Known Issues

Redmi devices are not supported in this release. To know more, refer[ here](https://mosip.atlassian.net/issues/?filter=-4\&jql=labels%20%3D%20redmi%20order%20by%20created%20DESC).

Mentioned below is the list of other known issues.

| Jira issue                                                      | Issue description                                                                                                          |
| --------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| [INJIMOB-1265](https://mosip.atlassian.net/browse/INJIMOB-1265) | IOS -Specific devices the User not able to see the iCloud ID in iCloud setting section of backup and restore page.         |
| [INJIMOB-1261](https://mosip.atlassian.net/browse/INJIMOB-1261) | INJI- Error message is not proper when invalid QR is scanned after changing language to other than English.                |
| [INJIMOB-1259](https://mosip.atlassian.net/browse/INJIMOB-1259) | INJI - Backup & restore Name Is Different In Settings And in Backup & restore Page                                         |
| [INJIMOB-1258](https://mosip.atlassian.net/browse/INJIMOB-1258) | INJI - Help Icon Language not Changing when we select other language that english                                          |
| [INJIMOB-1256](https://mosip.atlassian.net/browse/INJIMOB-1256) | Backup and Restore heading Alignment is not proper in Backup& restore page                                                 |
| [INJIMOB-1255](https://mosip.atlassian.net/browse/INJIMOB-1255) | IOS - Associated app ID is missing in the Backup and restore page.                                                         |
| [INJIMOB-1253](https://mosip.atlassian.net/browse/INJIMOB-1253) | Inji- Date format is not proper in the e-signet Vc                                                                         |
| [INJIMOB-1252](https://mosip.atlassian.net/browse/INJIMOB-1252) | INJI- Sometimes VC activate the button and back button responses is very slow                                              |
| [INJIMOB-1251](https://mosip.atlassian.net/browse/INJIMOB-1251) | INJI - VC getting created without image while generating the UIN with lower and higher iso files.                          |
| [INJIMOB-1250](https://mosip.atlassian.net/browse/INJIMOB-1250) | Android - Intermediately while doing the face authentication the app is getting crashed                                    |
| [INJIMOB-1248](https://mosip.atlassian.net/browse/INJIMOB-1248) | INJI - Iderpo UINs are failing in VC verification                                                                          |
| [INJIMOB-1239](https://mosip.atlassian.net/browse/INJIMOB-1239) | Inji - Screen header and back button are overlapping                                                                       |
| [INJIMOB-1192](https://mosip.atlassian.net/browse/INJIMOB-1192) | INJI - onboarding of new issuer is affecting the existing issuers                                                          |
| [INJIMOB-1002](https://mosip.atlassian.net/browse/INJIMOB-1002) | Inji- In specific devices, the Pin and Unpin feature is not working.                                                       |
| [INJIMOB-968](https://mosip.atlassian.net/browse/INJIMOB-968)   | **Android**- Occasionally, unable to activate the restored VC                                                              |
| [INJIMOB-875](https://mosip.atlassian.net/browse/INJIMOB-875)   | **IOS** - Upon sharing sunbird VC twice and then upon sharing Mosip VC, app crashes                                        |
| [INJIMOB-872](https://mosip.atlassian.net/browse/INJIMOB-872)   | **Android** - During face authentication, app crashes on a specific device                                                 |
| [INJIMOB-868](https://mosip.atlassian.net/browse/INJIMOB-868)   | **INJI** - Backup doesn't append the new data, but replaces the data                                                       |
| [INJIMOB-689](https://mosip.atlassian.net/browse/INJIMOB-689)   | Upon changing the finger authentication in the device, application does not display the error pop up for biometrics change |

### Bug Fixes

Below are the list of fixes as part of 0.12.0 release:

| Jira issue                                                      | Severity | Issue description                                                                                                                                   |
| --------------------------------------------------------------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| [INJIMOB-685](https://mosip.atlassian.net/browse/INJIMOB-685)   | Blocker  | inji - we are observing a download error message                                                                                                    |
| [INJIMOB-946](https://mosip.atlassian.net/browse/INJIMOB-946)   | Critical | Inji-Downloading error is observed when we were trying to restore VCs in a new device.                                                              |
| [INJIMOB-909](https://mosip.atlassian.net/browse/INJIMOB-909)   | Critical | INJI- after deleting the backed up data it is not reflecting in the app                                                                             |
| [INJIMOB-908](https://mosip.atlassian.net/browse/INJIMOB-908)   | Critical | INJI - we are able to restore when there is no data to restore                                                                                      |
| [INJIMOB-885](https://mosip.atlassian.net/browse/INJIMOB-885)   | Critical | IOS - app is not responsive in few senarios                                                                                                         |
| [INJIMOB-869](https://mosip.atlassian.net/browse/INJIMOB-869)   | Critical | INJI - once we delete a restored VC, we are not able to delete or pin other restore VC                                                              |
| [INJIMOB-867](https://mosip.atlassian.net/browse/INJIMOB-867)   | Critical | IOS - device specific data is backuped if the Icloud is shared in multiple device                                                                   |
| [INJIMOB-866](https://mosip.atlassian.net/browse/INJIMOB-866)   | Critical | IOS - in specific device we are not able to restore VC                                                                                              |
| [INJIMOB-865](https://mosip.atlassian.net/browse/INJIMOB-865)   | Critical | IOS- While deleting a single VC all downloaded VCs are getting deleted                                                                              |
| [INJIMOB-864](https://mosip.atlassian.net/browse/INJIMOB-864)   | Critical | INJI- The Backup button and restore button both are clickable at the same time                                                                      |
| [INJIMOB-763](https://mosip.atlassian.net/browse/INJIMOB-763)   | Critical | INJI - face auth is not working in room brightness on all devices                                                                                   |
| [INJIMOB-531](https://mosip.atlassian.net/browse/INJIMOB-531)   | Critical | Getting tampered error pop up without tampering any vc in Vivo Y73.-- update: all devices                                                           |
| [INJIMOB-491](https://mosip.atlassian.net/browse/INJIMOB-491)   | Critical | Inji- The Inji application is not stable sometimes we are not able to activate the VC                                                               |
| [INJIMOB-1279](https://mosip.atlassian.net/browse/INJIMOB-1279) | Major    | INJIUI :- share button text is not translating to another language for ios                                                                          |
| [INJIMOB-901](https://mosip.atlassian.net/browse/INJIMOB-901)   | Major    | Backup and restore screen the back button's response is slow.                                                                                       |
| [INJIMOB-895](https://mosip.atlassian.net/browse/INJIMOB-895)   | Major    | INJI- sunbird Vc is not rendering properly for a few second in sharing card page and received card page                                             |
| [INJIMOB-746](https://mosip.atlassian.net/browse/INJIMOB-746)   | Major    | VC Select screen appears in a flash when the user clicks on Share from NavBar after navigating to Home page from the ID Transfer successful screen. |
| [INJIMOB-741](https://mosip.atlassian.net/browse/INJIMOB-741)   | Major    | android - receive card header is fully in caps                                                                                                      |
| [INJIMOB-737](https://mosip.atlassian.net/browse/INJIMOB-737)   | Major    | INJI - few elements are not changing when the app converted to rtl                                                                                  |
| [INJIMOB-704](https://mosip.atlassian.net/browse/INJIMOB-704)   | Major    | Inji- We are missing the face validating popup and the Face match successfully popup.                                                               |
| [INJIMOB-511](https://mosip.atlassian.net/browse/INJIMOB-511)   | Major    | "Id details" section of downloaded card through e-signet don't have green tick mark in status.                                                      |
| [INJIMOB-948](https://mosip.atlassian.net/browse/INJIMOB-948)   | Minor    | Inji-In the intro sliders, the heading on the backup data page mentions "Data Backup."                                                              |
| [INJIMOB-947](https://mosip.atlassian.net/browse/INJIMOB-947)   | Minor    | INJI - The date format for downloaded and received are different for the same VC.                                                                   |
| [INJIMOB-925](https://mosip.atlassian.net/browse/INJIMOB-925)   | Minor    | Inji- In download id screen enter the random 10 digits number it was showing UIN/VID/AID is invalid.                                                |
| [INJIMOB-894](https://mosip.atlassian.net/browse/INJIMOB-894)   | Minor    | IOS- After downloading the sunbird Vc Unwanted space in between tick icon and valid                                                                 |
| [INJIMOB-822](https://mosip.atlassian.net/browse/INJIMOB-822)   | Minor    | INJI-There was a glitch on previous connected screen for a second.                                                                                  |

### Documentation

* [Feature Documentation](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features)
* [Integration Guides](https://docs.mosip.io/inji/inji-mobile-wallet/integration-guide)
* [User Guide](https://docs.mosip.io/inji/inji-mobile-wallet/end-user-guide)
* [QA Report](test-report.md)
* [API Documentation](https://github.com/mosip/mimoto/tree/release-0.10.0/docs/postman-collections)
