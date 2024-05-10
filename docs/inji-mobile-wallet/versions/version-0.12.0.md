# Version 0.12.0

Release Name: Inji 0.12.0

Support: Developer Release

Release Date: 13th May, 2024

### Overview

We are delighted to announce the release of Inji Mobile Version 0.12.0 . This release is compatible with v0.12.0 Mimoto release. As part of 0.12.0, Inji mobile introduces below mentioned key features:

1. Credential Type Selection
2. QR code generation for VC
3. Data backup enhancements
4. VC Verification
5. UI/UX enhancements
6.
   * Card view UI changes
   * VC share optimization
   * GenderMag P2 items

Inji mobile app addresses gender / inclusivity bias in software through GenderMag analysis. In this release, we have incorporated GenderMag fixes for UI / UX in inclusivity space.

To know more about the GenderMag UI/UI changes in the Inji mobile application, please refer[ here](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features/gendermag).

### Summary

Please find below the details for the Inji Version 0.12.0 release:

Credential Type Selection:

Inji mobile wallet now allows users to select the type of credential they need, giving them the option to choose from a list of Credential Types issued by the ID provider. This enables users to download Verifiable Credentials that match their selection.&#x20;

QR code generation for VC:

\


PixelPass, part of the Inji Credentialing stack, generates QR codes for Verifiable Credentials within the Inji mobile wallet. It's specifically designed for smaller data sets when the ID provider doesn't send a QR code along with the Verifiable Credential. Users can view and use this QR code for verification purposes by the relying party or service provider.

To read more about PixelPass library refer here.

To know more about QR code verification, read about Inji Verify here.

Data backup enhancements:

As part of the 0.12.0 release, the following enhancements have been made to the Data Backup feature:

1. Cloud as the Primary Source:
2.
   * The backup file stored in the cloud will be the primary source of truth.
   * Once the backup file is downloaded and restored, it is automatically removed from the local app storage to ensure that the latest backup file is always restored.
3. iCloud Section Visibility:
4.
   * The iCloud Section is now visible in the Backup & Restore settings screen, allowing users to easily manage their backups.
5. User Notification:
6.
   * When the user initiates a Backup or Restore process, a banner will be displayed to inform users about the ongoing process.

VC Verification:

Inji mobile wallet provides the functionality to verify Verifiable Credentials using the Digital Bazaar library. The issuer's signature is verified based on the proof type provided by the issuer. Currently, we support the RSA signature type, and we will soon add support for the Ed25519 proof type.

To prevent failures during download caused by verification of Verifiable Credentials with any other signature type, this step needs to be bypassed. Learn more about the steps here.

UI/UX enhancements:

Inji Mobile version 0.12.0 introduces enhanced UI to deliver a seamless user experience with an intuitive design. The UI modifications included in this release are:

Card View UI Changes:

* Users can now view the card in two ways:
*
  * A mini view on the Home Page with a quick access menu.
  * A detailed view.
* Additionally, the Settings menu has been moved to the NavBar for easier access.

VC Share Optimization:

* With the quick access menu in the mini view of the card:
*
  * Users can quickly initiate a Share or Share with Selfie action from the card to be shared.

GenderMag P2 items: \<List comes here>

\
\
Repository Released

| Repositories | Tags Released |
| ------------ | ------------- |
| Inji         | <p><br></p>   |
| mimoto       | <p><br></p>   |
| mosip-config | <p><br></p>   |



### Known Issues

Redmi devices are not supported in this release. To know more, refer[ here](https://mosip.atlassian.net/issues/?filter=-4\&jql=labels%20%3D%20redmi%20order%20by%20created%20DESC).

Mentioned below is the list of other known issues.

\


| Jira issue                                                      | Issue description                                                                                                                                                     |
| --------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [INJIMOB-1265](https://mosip.atlassian.net/browse/INJIMOB-1265) | [IOS -Specific devices the User not able to see the iCloud ID in iCloud setting section of backup and restore page.](https://mosip.atlassian.net/browse/INJIMOB-1265) |
| [INJIMOB-1261](https://mosip.atlassian.net/browse/INJIMOB-1261) | [INJI- Error message is not proper when invalid QR is scanned after changing language to other than English.](https://mosip.atlassian.net/browse/INJIMOB-1261)        |
| [INJIMOB-1259](https://mosip.atlassian.net/browse/INJIMOB-1259) | [INJI - Backup & restore Name Is Different In Settings And in Backup & restore Page](https://mosip.atlassian.net/browse/INJIMOB-1259)                                 |
| [INJIMOB-1258](https://mosip.atlassian.net/browse/INJIMOB-1258) | [INJI - Help Icon Language not Changing when we select other language that english](https://mosip.atlassian.net/browse/INJIMOB-1258)                                  |
| [INJIMOB-1256](https://mosip.atlassian.net/browse/INJIMOB-1256) | [Backup and Restore heading Alignment is not proper in Backup& restore page](https://mosip.atlassian.net/browse/INJIMOB-1256)                                         |
| [INJIMOB-1255](https://mosip.atlassian.net/browse/INJIMOB-1255) | [IOS - Associated app ID is missing in the Backup and restore page.](https://mosip.atlassian.net/browse/INJIMOB-1255)                                                 |
| [INJIMOB-1253](https://mosip.atlassian.net/browse/INJIMOB-1253) | [Inji- Date format is not proper in the e-signet Vc](https://mosip.atlassian.net/browse/INJIMOB-1253)                                                                 |
| [INJIMOB-1252](https://mosip.atlassian.net/browse/INJIMOB-1252) | [INJI- Sometimes VC activate the button and back button responses is very slow](https://mosip.atlassian.net/browse/INJIMOB-1252)                                      |
| [INJIMOB-1251](https://mosip.atlassian.net/browse/INJIMOB-1251) | [INJI - VC getting created without image while generating the UIN with lower and higher iso files.](https://mosip.atlassian.net/browse/INJIMOB-1251)                  |
| [INJIMOB-1250](https://mosip.atlassian.net/browse/INJIMOB-1250) | [Android - Intermediately while doing the face authentication the app is getting crashed](https://mosip.atlassian.net/browse/INJIMOB-1250)                            |
| [INJIMOB-1248](https://mosip.atlassian.net/browse/INJIMOB-1248) | [INJI - Iderpo UINs are failing in VC verification](https://mosip.atlassian.net/browse/INJIMOB-1248)                                                                  |
| [INJIMOB-1239](https://mosip.atlassian.net/browse/INJIMOB-1239) | [Inji - Screen header and back button are overlapping](https://mosip.atlassian.net/browse/INJIMOB-1239)                                                               |
| [INJIMOB-1192](https://mosip.atlassian.net/browse/INJIMOB-1192) | [INJI - onboarding of new issuer is affecting the existing issuers](https://mosip.atlassian.net/browse/INJIMOB-1192)                                                  |
| [INJIMOB-1002](https://mosip.atlassian.net/browse/INJIMOB-1002) | Inji- In specific devices, the Pin and Unpin feature is not working.                                                                                                  |
| [INJIMOB-968](https://mosip.atlassian.net/browse/INJIMOB-968)   | Android- Occasionally, unable to activate the restored VC                                                                                                             |
| [INJIMOB-875](https://mosip.atlassian.net/browse/INJIMOB-875)   | IOS - Upon sharing sunbird VC twice and then upon sharing Mosip VC, app crashes                                                                                       |
| [INJIMOB-872](https://mosip.atlassian.net/browse/INJIMOB-872)   | Android - During face authentication, app crashes on a specific device                                                                                                |
| [INJIMOB-868](https://mosip.atlassian.net/browse/INJIMOB-868)   | INJI - Backup doesn't append the new data, but replaces the data                                                                                                      |
| [INJIMOB-689](https://mosip.atlassian.net/browse/INJIMOB-689)   | Upon changing the finger authentication in the device, application does not display the error pop up for biometrics change                                            |

### Bug Fixes

\


| Jira issue                                                      | Severity | Issue description                                                                                                                                                                                     |
| --------------------------------------------------------------- | -------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [INJIMOB-685](https://mosip.atlassian.net/browse/INJIMOB-685)   | Blocker  | [inji - we are observing a download error message](https://mosip.atlassian.net/browse/INJIMOB-685)                                                                                                    |
| [INJIMOB-946](https://mosip.atlassian.net/browse/INJIMOB-946)   | Critical | [Inji-Downloading error is observed when we were trying to restore VCs in a new device.](https://mosip.atlassian.net/browse/INJIMOB-946)                                                              |
| [INJIMOB-909](https://mosip.atlassian.net/browse/INJIMOB-909)   | Critical | [INJI- after deleting the backed up data it is not reflecting in the app](https://mosip.atlassian.net/browse/INJIMOB-909)                                                                             |
| [INJIMOB-908](https://mosip.atlassian.net/browse/INJIMOB-908)   | Critical | [INJI - we are able to restore when there is no data to restore](https://mosip.atlassian.net/browse/INJIMOB-908)                                                                                      |
| [INJIMOB-885](https://mosip.atlassian.net/browse/INJIMOB-885)   | Critical | [IOS - app is not responsive in few senarios](https://mosip.atlassian.net/browse/INJIMOB-885)                                                                                                         |
| [INJIMOB-869](https://mosip.atlassian.net/browse/INJIMOB-869)   | Critical | [INJI - once we delete a restored VC, we are not able to delete or pin other restore VC](https://mosip.atlassian.net/browse/INJIMOB-869)                                                              |
| [INJIMOB-867](https://mosip.atlassian.net/browse/INJIMOB-867)   | Critical | [IOS - device specific data is backuped if the Icloud is shared in multiple device](https://mosip.atlassian.net/browse/INJIMOB-867)                                                                   |
| [INJIMOB-866](https://mosip.atlassian.net/browse/INJIMOB-866)   | Critical | [IOS - in specific device we are not able to restore VC](https://mosip.atlassian.net/browse/INJIMOB-866)                                                                                              |
| [INJIMOB-865](https://mosip.atlassian.net/browse/INJIMOB-865)   | Critical | [IOS- While deleting a single VC all downloaded VCs are getting deleted](https://mosip.atlassian.net/browse/INJIMOB-865)                                                                              |
| [INJIMOB-864](https://mosip.atlassian.net/browse/INJIMOB-864)   | Critical | [INJI- The Backup button and restore button both are clickable at the same time](https://mosip.atlassian.net/browse/INJIMOB-864)                                                                      |
| [INJIMOB-763](https://mosip.atlassian.net/browse/INJIMOB-763)   | Critical | [INJI - face auth is not working in room brightness on all devices](https://mosip.atlassian.net/browse/INJIMOB-763)                                                                                   |
| [INJIMOB-531](https://mosip.atlassian.net/browse/INJIMOB-531)   | Critical | [Getting tampered error pop up without tampering any vc in Vivo Y73.-- update: all devices](https://mosip.atlassian.net/browse/INJIMOB-531)                                                           |
| [INJIMOB-491](https://mosip.atlassian.net/browse/INJIMOB-491)   | Critical | Inji- The Inji application is not stable sometimes we are not able to activate the VC                                                                                                                 |
| [INJIMOB-1279](https://mosip.atlassian.net/browse/INJIMOB-1279) | Major    | [INJIUI :- share button text is not translating to another language for ios](https://mosip.atlassian.net/browse/INJIMOB-1279)                                                                         |
| [INJIMOB-901](https://mosip.atlassian.net/browse/INJIMOB-901)   | Major    | [Backup and restore screen the back button's response is slow.](https://mosip.atlassian.net/browse/INJIMOB-901)                                                                                       |
| [INJIMOB-895](https://mosip.atlassian.net/browse/INJIMOB-895)   | Major    | [INJI- sunbird Vc is not rendering properly for a few second in sharing card page and received card page](https://mosip.atlassian.net/browse/INJIMOB-895)                                             |
| [INJIMOB-746](https://mosip.atlassian.net/browse/INJIMOB-746)   | Major    | [VC Select screen appears in a flash when the user clicks on Share from NavBar after navigating to Home page from the ID Transfer successful screen.](https://mosip.atlassian.net/browse/INJIMOB-746) |
| [INJIMOB-741](https://mosip.atlassian.net/browse/INJIMOB-741)   | Major    | [android - receive card header is fully in caps](https://mosip.atlassian.net/browse/INJIMOB-741)                                                                                                      |
| [INJIMOB-737](https://mosip.atlassian.net/browse/INJIMOB-737)   | Major    | [INJI - few elements are not changing when the app converted to rtl](https://mosip.atlassian.net/browse/INJIMOB-737)                                                                                  |
| [INJIMOB-704](https://mosip.atlassian.net/browse/INJIMOB-704)   | Major    | [Inji- We are missing the face validating popup and the Face match successfully popup.](https://mosip.atlassian.net/browse/INJIMOB-704)                                                               |
| [INJIMOB-511](https://mosip.atlassian.net/browse/INJIMOB-511)   | Major    | ["Id details" section of downloaded card through e-signet don't have green tick mark in status.](https://mosip.atlassian.net/browse/INJIMOB-511)                                                      |
| [INJIMOB-948](https://mosip.atlassian.net/browse/INJIMOB-948)   | Minor    | [Inji-In the intro sliders, the heading on the backup data page mentions "Data Backup."](https://mosip.atlassian.net/browse/INJIMOB-948)                                                              |
| [INJIMOB-947](https://mosip.atlassian.net/browse/INJIMOB-947)   | Minor    | [INJI - The date format for downloaded and received are different for the same VC.](https://mosip.atlassian.net/browse/INJIMOB-947)                                                                   |
| [INJIMOB-925](https://mosip.atlassian.net/browse/INJIMOB-925)   | Minor    | [Inji- In download id screen enter the random 10 digits number it was showing UIN/VID/AID is invalid.](https://mosip.atlassian.net/browse/INJIMOB-925)                                                |
| [INJIMOB-894](https://mosip.atlassian.net/browse/INJIMOB-894)   | Minor    | [IOS- After downloading the sunbird Vc Unwanted space in between tick icon and valid](https://mosip.atlassian.net/browse/INJIMOB-894)                                                                 |
| [INJIMOB-822](https://mosip.atlassian.net/browse/INJIMOB-822)   | Minor    | [INJI-There was a glitch on previous connected screen for a second.](https://mosip.atlassian.net/browse/INJIMOB-822)                                                                                  |

### Documentation

* [Feature Documentation](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features)
* [Integration Guides](https://docs.mosip.io/inji/inji-mobile-wallet/integration-guide)
* [User Guide](https://docs.mosip.io/inji/inji-mobile-wallet/end-user-guide)
* QA Report
* [API Documentation](https://github.com/mosip/mimoto/tree/release-0.10.0/docs/postman-collections)

