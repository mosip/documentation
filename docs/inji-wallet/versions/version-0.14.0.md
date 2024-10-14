# Version 0.14.0

**Release Name**: Inji Wallet 0.14.0

**Release Type**: Developer

**Release Date**: Coming Soon

### **Overview of the Release:**

We are excited to announce the release of **Inji Wallet Version 0.14.0!** This update introduces major enhancements and new features, particularly in credential issuance. Here are the key highlights of this release:

* **PixelPass Enhancements**: Support for CBOR encoding/decoding is available, making PixelPass more versatile and efficient in handling data.
* **Integration with Inji Certify**: We've integrated eSignet for authentication and Certify for streamlined credential issuance, providing a seamless experience.
* **Compliance with Draft 13 of the OpenID4VCI Spec**: Inji Wallet now fully supports the latest Draft 13 changes of the OpenID4VCI specification, ensuring compatibility with the evolving standards in the industry.
* **Java upgrade in mimoto:** A significant tech upgrade for mimoto to move from java11 to java21.

### **Features Covered**

1. PixelPass enhancements - Support CBOR encoding/decoding
   1. Given JSON data, it does the CBOR encode/decode.
   2. Given a JSON and a Mapper(similar to [claim 169](https://github.com/mosip/id-claim-169/blob/main/draft-id-claim-169.md)) are given, it maps the JSON with Mapper and then does the CBOR encode/decode.
2. Integrate eSignet for Auth and Certify for credential issuance
   1. **Authorisation partner:** eSignet
   2. **KBI plugin:** eSignet
   3. **Credential Issuance:** Certify
3. Draft 13 changes of OpenID4VCI spec -  Compatibility of the credential issuance as per the latest draft of OpenID4VCI specification.

### **Repository Released**

| **Repositories** | **Tags Released** |
| ---------------- | ----------------- |
| Inji-wallet      |  v0.14.0          |

### **Compatible Modules:**

The following table outlines the tested and certified compatibility of Inji Wallet 0.14.0 with other modules.

| **Module**                | **Version**                                                                      |
| ------------------------- | -------------------------------------------------------------------------------- |
| Mimoto                    | 0.14.0                                                                           |
| Inji-config               |  v0.3.0                                                                          |
| eSignet                   | 1.4.1                                                                            |
| Inji Verify               | 0.10.0                                                                           |
| tuvali                    | [v0.5.0](https://github.com/mosip/tuvali/releases/tag/v0.5.0)                    |
| tuvali-ios-swift          | [v0.5.0](https://github.com/mosip/tuvali-ios-swift/releases/tag/v0.5.0)          |
| secure-Keystore           | [v0.2.0](https://github.com/mosip/secure-keystore/releases/tag/v0.2.0)           |
| pixelpass                 | [v0.2.0](https://github.com/mosip/pixelpass/releases/tag/v0.2.0)                 |
| pixelpass-ios-swift       | [v0.2.0](https://github.com/mosip/pixelpass-ios-swift/releases/tag/v0.2.0)       |
| Inji-vci-client           | [v0.1.0](https://github.com/mosip/inji-vci-client/releases/tag/v0.1.0)           |
| Inji-vci-client-ios-swift | [v0.1.0](https://github.com/mosip/inji-vci-client-ios-swift/releases/tag/v0.1.0) |

### **Known Issues**

Below is the list of known issues. To read in detail and view all the issues related to Inji Verify please click [**here**](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?filter=11622)**.**

**Note**: Redmi devices are not supported in this release.

| Jira issue                                                              | Issue description                                                                                                                                                 |
| ----------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [**Inji Wallet-1896**](https://mosip.atlassian.net/browse/INJIMOB-1896) | Inji Wallet- After clicking the + icon, the screen flickers before landing on the 'Add New Card' screen                                                           |
| [**Inji Wallet-1837**](https://mosip.atlassian.net/browse/INJIMOB-1837) | The search box close button is not working unless invoked on a specific point                                                                                     |
| [**Inji Wallet-1748**](https://mosip.atlassian.net/browse/INJIMOB-1748) | Inji Wallet- Android - History timings could be more precise                                                                                                      |
| [**Inji Wallet-1745**](https://mosip.atlassian.net/browse/INJIMOB-1745) | IOS- The Wallet app session should expire if the app is opened for a longer time and the user tries to log in again with the PIN to generate VC by using UIN/VID. |
| [**Inji Wallet-1744**](https://mosip.atlassian.net/browse/INJIMOB-1744) | Inji Wallet- The error message of QR code login without an internet attempt should be revised                                                                     |
| [**Inji Wallet-1604**](https://mosip.atlassian.net/browse/INJIMOB-1604) | Inji Wallet- On the face verification page the capture button overlaps with the text                                                                              |
| [**Inji Wallet-1603**](https://mosip.atlassian.net/browse/INJIMOB-1603) | Inji Wallet- During face authentication, the camera view is not opening in all IOS device                                                                         |
| [**Inji Wallet-1530**](https://mosip.atlassian.net/browse/INJIMOB-1530) | Inji Wallet - IOS - "Share QR Code" is not working on iPhone 8.                                                                                                   |
| [**Inji Wallet-1490**](https://mosip.atlassian.net/browse/INJIMOB-1490) | Inji Wallet - Backup is not triggering automatically when VC is removed.                                                                                          |
| [**Inji Wallet-1481**](https://mosip.atlassian.net/browse/INJIMOB-1481) | Inji Wallet- the logo of Inji Wallet stretched while booting the app                                                                                              |
| [**Inji Wallet-1265**](https://mosip.atlassian.net/browse/INJIMOB-1265) | IOS -For specific devices, the User cannot see the iCloud ID in the iCloud setting section of the backup and restore page.                                        |
| [**Inji Wallet-1261**](https://mosip.atlassian.net/browse/INJIMOB-1261) | Inji Wallet - An error message is not proper when an invalid QR is scanned after changing the language to something other than English.                           |
| [**Inji Wallet-1259**](https://mosip.atlassian.net/browse/INJIMOB-1259) | Inji Wallet- Backup & restore Name Is Different In Settings And Backup & restore Page                                                                             |
| [**Inji Wallet-1256**](https://mosip.atlassian.net/browse/INJIMOB-1256) | Backup and Restore heading Alignment is not proper on the Backup& restore page                                                                                    |
| [**Inji Wallet-1252**](https://mosip.atlassian.net/browse/INJIMOB-1252) | Inji Wallet- Sometimes VC activate the button and the back button responses are very slow                                                                         |
| [**Inji Wallet-1248**](https://mosip.atlassian.net/browse/INJIMOB-1248) | Inji Wallet- ID Repo UINs are failing in VC verification                                                                                                          |
| [**Inji Wallet-868**](https://mosip.atlassian.net/browse/INJIMOB-868)   | Inji Wallet- Backup doesn't append the new data but replaces the data                                                                                             |
| [**Inji Wallet-689**](https://mosip.atlassian.net/browse/INJIMOB-689)   | Upon changing the finger authentication in the device, the application does not display the error pop-up for biometrics change                                    |

### **Bugs Fixes**

Below is the [**list**](https://mosip.atlassian.net/issues/?filter=11580) of fixes as part of the **0.14.0** release:

| **Jira issue**                                                          | **Issue description**                                                                                                                                                    |
| ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [**Inji Wallet-886**](https://mosip.atlassian.net/browse/INJIMOB-886)   | Inji Wallet: When the camera access is disabled, the user clicks on the close icon error screen it redirects to the sharing screen                                       |
| [**Inji Wallet-1410**](https://mosip.atlassian.net/browse/INJIMOB-1410) | Inji Wallet - Unable to go back from the detailed view page                                                                                                              |
| [**Inji Wallet-1418**](https://mosip.atlassian.net/browse/INJIMOB-1418) | Inji Wallet- VC verification is passing for missing attribute VC                                                                                                         |
| [**Inji Wallet-1422**](https://mosip.atlassian.net/browse/INJIMOB-1422) | Inji Wallet- During face authentication, the camera view is wider than the face.                                                                                         |
| [**Inji Wallet-1531**](https://mosip.atlassian.net/browse/INJIMOB-1531) | Inji Wallet - IOS - The "Share QR Code" feature saves both the QR Code and a text file to files.                                                                         |
| [**Inji Wallet-1591**](https://mosip.atlassian.net/browse/INJIMOB-1591) | Inji Wallet- Users are unable to upload the VC QR code shared via email and WhatsApp, or stored locally                                                                  |
| [**Inji Wallet-1600**](https://mosip.atlassian.net/browse/INJIMOB-1600) | Inji Wallet- In Android when the user clicks the + icon from the home page issuer page is not loaded                                                                     |
| [**Inji Wallet-1814**](https://mosip.atlassian.net/browse/INJIMOB-1814) | Inji Wallet - Unable to see the issuer of the credentials                                                                                                                |
| [**Inji Wallet-1816**](https://mosip.atlassian.net/browse/INJIMOB-1816) | Inji Wallet- Sunbird issuer is not loading and is redirecting to the 'Add New Card' screen. Trying to click any other issuer is also not working                         |
| [**Inji Wallet-1820**](https://mosip.atlassian.net/browse/INJIMOB-1820) | Inji Wallet- The Intermittent share with selfie option is not getting for the National Identity department                                                               |
| [**Inji Wallet-1836**](https://mosip.atlassian.net/browse/INJIMOB-1836) | Activation successful banner is not showing up                                                                                                                           |
| [**Inji Wallet-1849**](https://mosip.atlassian.net/browse/INJIMOB-1849) | Inji Wallet- We are unable to download the VC Stay Protected insurance credential                                                                                        |
| [**Inji Wallet-1850**](https://mosip.atlassian.net/browse/INJIMOB-1850) | Inji Wallet- When the Certify well-known is replaced with fall back well-known url in the Inji configuration The user is not redirected to the default well-known issuer |
| [**Inji Wallet-1854**](https://mosip.atlassian.net/browse/INJIMOB-1854) | Inji Wallet- The user is not getting any error if the fallback is not working                                                                                            |
| [**Inji Wallet-1855**](https://mosip.atlassian.net/browse/INJIMOB-1855) | Inji Wallet-Mock identity is not loading and is redirecting to the 'Add New Card' screen. Trying to click any other issuer is also not working                           |
| [**Inji Wallet-1858**](https://mosip.atlassian.net/browse/INJIMOB-1858) | Activated option in quick access menu for VCs which doesn't have biometrics                                                                                              |
| [**Inji Wallet-1897**](https://mosip.atlassian.net/browse/INJIMOB-1897) | Inji Wallet- In the mock VC, there is no profile photo, but the share option is still visible                                                                            |
| [**Inji Wallet-1898**](https://mosip.atlassian.net/browse/INJIMOB-1898) | When display properties are removed at mosip certify the user is blocked with a white screen and not able to use the app.                                                |
| [**Inji Wallet-2050**](https://mosip.atlassian.net/browse/INJIMOB-2050) | Update mimoto local properties file to run mimoto locally without docker-compose                                                                                         |
| [**Inji Wallet-2051**](https://mosip.atlassian.net/browse/INJIMOB-2051) | Background colour not showing up in VC as per configuration in well-known                                                                                                |

### Documentation Details

* [Feature Documentation](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features)
* [Integration Guides](https://docs.mosip.io/inji/inji-mobile-wallet/integration-guide)
* [User Guide](https://docs.mosip.io/inji/inji-mobile-wallet/end-user-guide)
* QA Report
* [API Documentation](https://github.com/mosip/mimoto/tree/release-0.10.0/docs/postman-collections)
