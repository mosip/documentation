# Version 0.13.1

**Release Name**: Inji Wallet 0.13.1 Patch release

**Release Version**: 0.13.1

**Release Type**: Developer

**Release Date**: 10th Sep, 2024

### **Overview of the Release:**

We are excited to announce the release of **Inji Wallet Version 0.13.1**! This patch release aims on critical fixes and improvements to ensure smoother integration of libraries and enhanced performance. Key updates include the bundling of dependencies with Android Archive (AAR) and JAR files, which simplifies the integration process and resolves issues related to library dependencies for the below mentioned libraries:

* tuvali
* inji-vci-client
* pixelpass
* secure-keystore

#### **Features Covered:**

* **Library Updates:**
  * Updated libraries to bundle dependencies with Android Archive (AAR) and JAR formats. This ensures that all required dependencies are included within the package, reducing the need for external dependency management and minimizing conflicts during app integration.
  * These changes enhance compatibility with various Android development environments and improve the overall stability of the wallet.

### Repository Released

<table data-header-hidden><thead><tr><th width="499"></th><th></th></tr></thead><tbody><tr><td><strong>Repositories</strong></td><td><strong>Tags Released</strong></td></tr><tr><td>tuvali</td><td><a href="https://github.com/mosip/tuvali/tree/v0.5.1"> v0.5.1</a></td></tr><tr><td>secure-keystore</td><td><a href="https://github.com/mosip/secure-keystore/tree/v0.2.1"> v0.2.1</a></td></tr><tr><td>pixelpass</td><td><a href="https://github.com/mosip/pixelpass/tree/v0.2.1">v0.2.1</a></td></tr><tr><td>inji-vci-client</td><td><a href="https://github.com/mosip/inji-vci-client/tree/v0.1.1">v0.1.1</a></td></tr><tr><td>Inji Wallet</td><td><a href="https://github.com/mosip/inji-wallet/tree/v0.13.1">v0.13.1</a></td></tr></tbody></table>

### Compatible Modules:

The following table outlines the tested and certified compatibility of Inji Wallet 0.13.1 with other modules.

<table data-header-hidden><thead><tr><th width="499"></th><th></th></tr></thead><tbody><tr><td><strong>Module</strong></td><td><strong>Version</strong></td></tr><tr><td>Mimoto</td><td><a href="https://github.com/mosip/mimoto/releases/tag/v0.13.1">0.13.1</a></td></tr><tr><td>inji-config</td><td><a href="https://github.com/mosip/inji-config/releases/tag/v0.1.2">0.1.2</a></td></tr></tbody></table>

### Bugs/Security Fixes

None

### Known Open Bugs

Redmi devices are not supported in this release. To know more, refer[ here](https://mosip.atlassian.net/issues/?filter=-4\&jql=labels%20%3D%20redmi%20order%20by%20created%20DESC).

Mentioned below is the list of other known issues.

| **Jira issue**                                                  | **Issue description**                                                                                                                                          |
| --------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [INJIMOB-1910](https://mosip.atlassian.net/browse/INJIMOB-1910) | In the INJI 0.12x version, issues with downloading their UIN cards.                                                                                            |
| [INJIMOB-1896](https://mosip.atlassian.net/browse/INJIMOB-1896) | INJIMOBILE- After clicking the + icon, the screen flickers before landing on the 'Add New Card' screen                                                         |
| [INJIMOB-1837](https://mosip.atlassian.net/browse/INJIMOB-1837) | Search box close button is not working unless invoked on a specific point                                                                                      |
| [INJIMOB-1748](https://mosip.atlassian.net/browse/INJIMOB-1748) | INJIMOB- Android - History timings could be more precise                                                                                                       |
| [INJIMOB-1745](https://mosip.atlassian.net/browse/INJIMOB-1745) | IOS- Mobile app session should get expired, if the app is opened for a longer time and user tries to login again with the PIN to generate VC by using UIN/VID. |
| [INJIMOB-1744](https://mosip.atlassian.net/browse/INJIMOB-1744) | INJI - error message of QR code login without internet attempt should be revised                                                                               |
| [INJIMOB-1604](https://mosip.atlassian.net/browse/INJIMOB-1604) | INJIMOB- In the face verification page the capture button overlaps with text                                                                                   |
| [INJIMOB-1603](https://mosip.atlassian.net/browse/INJIMOB-1603) | INJIMOB- During face authentication, the camera view is not opening in all IOS device                                                                          |
| [INJIMOB-1530](https://mosip.atlassian.net/browse/INJIMOB-1530) | INJIMOB - IOS - "Share QR Code" is not working on iPhone 8.                                                                                                    |
| [INJIMOB-1490](https://mosip.atlassian.net/browse/INJIMOB-1490) | INJIMOB - Backup is not triggering automatically when VC is removed.                                                                                           |
| [INJIMOB-1481](https://mosip.atlassian.net/browse/INJIMOB-1481) | INJI - logo of inji mobile stretched while booting the app                                                                                                     |
| [INJIMOB-1265](https://mosip.atlassian.net/browse/INJIMOB-1265) | IOS -Specific devices the User not able to see the iCloud ID in iCloud setting section of backup and restore page.                                             |
| [INJIMOB-1261](https://mosip.atlassian.net/browse/INJIMOB-1261) | INJI- Error message is not proper when invalid QR is scanned after changing language to other than English.                                                    |
| [INJIMOB-1259](https://mosip.atlassian.net/browse/INJIMOB-1259) | INJI - Backup & restore Name Is Different In Settings And in Backup & restore Page                                                                             |
| [INJIMOB-1258](https://mosip.atlassian.net/browse/INJIMOB-1258) | INJI - Help Icon Language not Changing when we select other language that english                                                                              |
| [INJIMOB-1256](https://mosip.atlassian.net/browse/INJIMOB-1256) | Backup and Restore heading Alignment is not proper in Backup& restore page                                                                                     |
| [INJIMOB-1255](https://mosip.atlassian.net/browse/INJIMOB-1255) | IOS - Associated app ID is missing in the Backup and restore page.                                                                                             |
| [INJIMOB-1252](https://mosip.atlassian.net/browse/INJIMOB-1252) | INJI- Sometimes VC activate the button and back button responses is very slow                                                                                  |
| [INJIMOB-1248](https://mosip.atlassian.net/browse/INJIMOB-1248) | INJI - Iderpo UINs are failing in VC verification                                                                                                              |
| [INJIMOB-868](https://mosip.atlassian.net/browse/INJIMOB-868)   | **INJI** - Backup doesn't append the new data, but replaces the data                                                                                           |
| [INJIMOB-689](https://mosip.atlassian.net/browse/INJIMOB-689)   | Upon changing the finger authentication in the device, application does not display the error pop up for biometrics change                                     |

### Documentation Details

* [Feature Documentation](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features)
* [Integration Guides](https://docs.mosip.io/inji/inji-mobile-wallet/integration-guide)
* [User Guide](https://docs.mosip.io/inji/inji-mobile-wallet/end-user-guide)
* [QA Report](https://docs.mosip.io/inji/inji-wallet/versions/version-0.13.1/test-report)
* [API Documentation](https://github.com/mosip/mimoto/tree/release-0.10.0/docs/postman-collections)
