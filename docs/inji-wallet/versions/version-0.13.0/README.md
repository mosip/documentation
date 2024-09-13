# Version 0.13.0

**Release Name:** Inji 0.13.0

**Support:** Developer Release

**Release Date:** 2nd Aug, 2024

## **Overview**

We are delighted to announce the release of Inji Wallet Version 0.13.0. This update includes a significant change: The Inji repository has been renamed to **inji-wallet** and is now compatible with Mimoto v0.13.1. In this latest version, Inji Wallet introduces the following key features:

**Libraries:**

1. Native artefacts (Kotlin & Swift) available for:
   * Secure Keystore
   * Pixelpass
   * VCI client
   * Tuvali
2. UUID changes for verifier services in tuvali
3. Secure-keystore changes (credential request keypair change from RSA-4096 to RSA-2048 bits)

**Enhancements:**

* Issuer’s Well-known as a source of truth
* OTP flow disabled for MOSIP VC

**Deployment:**

* Docker compose for mimoto

## **Summary**

Please find below the details for the Inji Version 0.13.0 release:

**Libraries:**

* Inji Wallet utilizes the **Secure Keystore SDK** to store keypairs, ensuring enhanced security. The SDK now includes native artifacts and is fully integrated with Inji Wallet. Additionally, the keypair generation for credential requests has been updated from RSA-4096 to RSA-2048 bits to reduce the size of the VCs.
* **Tuvali**: UUID for all the verifier services is modified to reflect the UUID service definition as per the spec. In addition, Tuvali SDK which enables offline sharing based on BLE, has native artifacts (Kotlin and Swift) now and is integrated with Inji Wallet.
* With this release, Java, Kotlin, and Swift artifacts are available for the **PixelPass** library, and native artifacts are integrated into the Inji Wallet app. Additionally, the Java library facilitates QR code generation on the server side.
* The **VCI client** library handles credential requests from issuance, provided it has the accessToken, proof, and issuer metadata.

**Enhancements:**

* The issuer's well-known URL will serve as the source of truth, providing details on locale settings for fields, credential types, display properties, and order. This URL will be accessible in the \[specific location].
* With this release, the OTP flow for downloading MOSIP VC, which connects to MOSIP ID Repo, credential service and websub has been disabled. Instead, MOSIP VC can now be downloaded using the OpenID4VCI flow.

**Deployment:**

* To simplify the deployment process for Mimoto in local environment, a Docker Compose file is now available. Click [here](https://docs.mosip.io/inji/inji-mobile-wallet/build-and-deployment/local-setup) to know more.

#### Inji repo name change:

The Inji repo is renamed to [inji-wallet](https://github.com/mosip/inji-wallet)

**Steps to update local github configuration:**

* ```
    Navigate to the location where your forked repository is cloned.
  ```
* ```
    Execute git remote -v to view the current remote configurations (origin and upstream). Update these configurations to align with the new repository name.
  ```

## **Repository Released**

| **Repositories**          | **Tags Released**                                                                                      |
| ------------------------- | ------------------------------------------------------------------------------------------------------ |
| inji-wallet               | <p><a href="https://github.com/mosip/inji-wallet/releases/tag/v0.13.0">v0.13.0</a><br></p>             |
| mimoto                    | <p><a href="https://github.com/mosip/mimoto/releases/tag/v0.13.1">v0.13.1</a><br></p>                  |
| inji-config               | <p><a href="https://github.com/mosip/inji-config/releases/tag/v0.1.2">v0.1.2</a><br></p>               |
| tuvali                    | <p><a href="https://github.com/mosip/tuvali/releases/tag/v0.5.0">v0.5.0</a><br></p>                    |
| tuvali-ios-swift          | <p><a href="https://github.com/mosip/tuvali-ios-swift/releases/tag/v0.5.0">v0.5.0</a><br></p>          |
| secure-keystore           | <p><a href="https://github.com/mosip/secure-keystore/releases/tag/v0.2.0">v0.2.0</a><br></p>           |
| pixelpass                 | <p><a href="https://github.com/mosip/pixelpass/releases/tag/v0.2.0">v0.2.0</a><br></p>                 |
| pixelpass-ios-swift       | <p><a href="https://github.com/mosip/pixelpass-ios-swift/releases/tag/v0.2.0">v0.2.0</a><br></p>       |
| inji-vci-client           | <p><a href="https://github.com/mosip/inji-vci-client/releases/tag/v0.1.0">v0.1.0</a><br></p>           |
| inji-vci-client-ios-swift | <p><a href="https://github.com/mosip/inji-vci-client-ios-swift/releases/tag/v0.1.0">v0.1.0</a><br></p> |

## Compatible Modules:

The following table outlines the tested and certified compatibility of Inji Wallet 0.13.0 with other modules.

| Module      | Version                                                        |
| ----------- | -------------------------------------------------------------- |
| Mimoto      | [0.13.1](https://github.com/mosip/mimoto/releases/tag/v0.13.1) |
| eSignet     | [1.4.0](https://github.com/mosip/esignet)                      |
| Inji Verify | [0.9.0](https://github.com/mosip/inji-verify/tree/v0.9.0)      |

## **Known Issues**

Redmi devices are not supported in this release. To know more, refer [here](https://mosip.atlassian.net/issues/?filter=-4\&jql=labels%20%3D%20redmi%20order%20by%20created%20DESC).

Mentioned below is the list of other known issues.

| **Jira Issue**                                                  | **Description**                                                                                                            |
| --------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- |
| [INJIMOB-1603](https://mosip.atlassian.net/browse/INJIMOB-1603) | INJIMOB- During face authentication, the camera view is not opening in all IOS device                                      |
| [INJIMOB-1600](https://mosip.atlassian.net/browse/INJIMOB-1600) | INJIMOB- In Android when the user clicks + icon from home page issuer page is not getting loaded                           |
| [INJIMOB-1591](https://mosip.atlassian.net/browse/INJIMOB-1591) | INJIMOB- Users are unable to upload the VC QR code shared via email and WhatsApp, or stored locally                        |
| [INJIMOB-1574](https://mosip.atlassian.net/browse/INJIMOB-1574) | INJI - unable to scroll the page add new card page                                                                         |
| [INJIMOB-1530](https://mosip.atlassian.net/browse/INJIMOB-1530) | INJIMOB - IOS - "Share QR Code" is not working on iPhone 8.                                                                |
| [INJIMOB-1503](https://mosip.atlassian.net/browse/INJIMOB-1503) | INJIMOB - IOS - The buttons in the INJI tour guide are not properly aligned.                                               |
| [INJIMOB-1499](https://mosip.atlassian.net/browse/INJIMOB-1499) | INJIMOB - Android - The backup and restore process is failing on Android devices when the size of the backup exceeds 10MB. |
| [INJIMOB-1490](https://mosip.atlassian.net/browse/INJIMOB-1490) | INJIMOB - Backup is not triggering automatically when VC is removed.                                                       |
| [INJIMOB-1481](https://mosip.atlassian.net/browse/INJIMOB-1481) | INJI - logo of Inji Wallet stretched while booting the app                                                                 |
| [INJIMOB-1422](https://mosip.atlassian.net/browse/INJIMOB-1422) | Inji mob- During face authentication, the camera view is wider than the face.                                              |
| [INJIMOB-1403](https://mosip.atlassian.net/browse/INJIMOB-1403) | INJI - VC download failed because of eSignet pod being down doesn't have a proper error message                            |
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
| [INJIMOB-1002](https://mosip.atlassian.net/browse/INJIMOB-1002) | Inji- In specific devices, the Pin and Unpin feature is not working.                                                       |
| [INJIMOB-968](https://mosip.atlassian.net/browse/INJIMOB-968)   | Android- Occasionally, unable to activate the restored VC                                                                  |
| [INJIMOB-875](https://mosip.atlassian.net/browse/INJIMOB-875)   | IOS - Upon sharing sunbird VC twice and then upon sharing Mosip VC, app crashes                                            |
| [INJIMOB-872](https://mosip.atlassian.net/browse/INJIMOB-872)   | Android - During face authentication, app crashes on a specific device                                                     |
| [INJIMOB-868](https://mosip.atlassian.net/browse/INJIMOB-868)   | INJI - Backup doesn't append the new data, but replaces the data                                                           |
| [INJIMOB-689](https://mosip.atlassian.net/browse/INJIMOB-689)   | Upon changing the finger authentication in the device, application does not display the error pop up for biometrics change |

## Bug Fixes:

The 0.13.0 release includes the following bug fixes:

| Jira Issue                                                      | Issue Description                                                                                                             | Severity |
| --------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | -------- |
| [INJIMOB-1552](https://mosip.atlassian.net/browse/INJIMOB-1552) | INJIVER- The user is unable to upload the VC QR code shared via email and WhatsApp                                            | Critical |
| [INJIMOB-1551](https://mosip.atlassian.net/browse/INJIMOB-1551) | INJIVER-The user is unable to scan the QR code when it is stored locally                                                      | Critical |
| [INJIMOB-1550](https://mosip.atlassian.net/browse/INJIMOB-1550) | INJIVER-The user is unable to scan the VC QR code shared via email and WhatsApp                                               | Critical |
| [INJIMOB-1537](https://mosip.atlassian.net/browse/INJIMOB-1537) | INJIMOB - IOS - The "Share with Selfie" is causing the app to crash after face verification.                                  | Critical |
| [INJIMOB-1418](https://mosip.atlassian.net/browse/INJIMOB-1418) | INJI - VC verification is passing for missing atribute VC                                                                     | Critical |
| [INJIMOB-1403](https://mosip.atlassian.net/browse/INJIMOB-1403) | INJI - VC download failed because of eSignet pod being down doesn't have a proper error message                               | Major    |
| [INJIMOB-1240](https://mosip.atlassian.net/browse/INJIMOB-1240) | Share with selfie flow from card mini view in home page is not showing the Share with Selfie pop-up before face verification. | Major    |
| [INJIMOB-1192](https://mosip.atlassian.net/browse/INJIMOB-1192) | INJI - onboarding of new issuer is affecting the existing issuers                                                             | Blocker  |
| [INJIMOB-323](https://mosip.atlassian.net/browse/INJIMOB-323)   | Inji- E-Mail OTP channel is not mentioned on the OTP verification page.                                                       | Minor    |

### Documentation

* [Feature Documentation](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features)
* [Integration Guides](https://docs.mosip.io/inji/inji-mobile-wallet/integration-guide)
* [User Guide](https://docs.mosip.io/inji/inji-mobile-wallet/end-user-guide)
* [QA Report](test-report.md)
* [API Documentation](https://github.com/mosip/mimoto/tree/release-0.10.0/docs/postman-collections)
