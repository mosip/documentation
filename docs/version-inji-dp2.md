# Version vDP1

**Release Name**: Inji vDP2

**Upgrade From**: Inji 0.10.0 

**Support**: Developer Preview Release2

**Release Date**: 22nd January, 2024

## Overview

The Developer Preview Version2 release is an additional release on top of Inji 0.10.0. This release primarily emphasizes:

* UI enhancements
* Internal enhancements
* Security fixes
* Bug fixes

## Summary

Below is the detailed summary of the release.

### UI enhancements

* As a part of the VC sharing feature or listing of VCs for QR login, the Pinned VC will now appear on top of the VC list.
* User can now provide one time consent for a selected VC  while sharing the claims during QR code login.
* Additionally, a search bar has been added to the `Add new card` screen to improve user experience by allowing users to search for issuers based on the title. 
* Furthermore, any rendering issues in the user interface have been resolved.

### Internal enhancements

* Secure KeyStore and Tuvali have been integrated as independent NPM modules within the INJI framework. For further information, please refer to the provided documentation.
* Additionally, all image assets have been converted from png to svg format. This transition ensures the presence of a single asset set, and the color of the icons will now be dynamically rendered based on the application's theme.
  
### Internal improvements

* Improved Bluetooth State and Permission Handling:
  * We have refined the management of Bluetooth states and permissions.
* Removed `Google Nearby` Implementation:
  * We've transitioned to using [Tuvali](https://docs.mosip.io/inji/tuvali) for Bluetooth Low Energy (BLE) communication, enhancing the connectivity experience.
* Encrypted VC’s Metadata:
  * We now calculate and securely store an encrypted HASH (HMAC SHA256) of the VC's metadata key in the database, bolstering data security.

### Bug fixes

* **Bug fix**: Reduced the app size for Android #[INJI-103](https://mosip.atlassian.net/browse/INJI-103)
* **Bug fix**: Resolved connectivity issue when sharing VC #[INJI-207](https://mosip.atlassian.net/browse/INJI-207)
* **Bug fix**: Fixed QR/ Esignet login using INJI app #[INJI-209](https://mosip.atlassian.net/browse/INJI-209), [INJI-49](https://mosip.atlassian.net/browse/INJI-209)
* **Bug fix**: Resolved BLE issues #[INJI-146](https://mosip.atlassian.net/browse/INJI-146), [INJI-70](https://mosip.atlassian.net/browse/INJI-70)

## Repository Released

| **Repositories** | **Tags Released**                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------- |
| Inji             | [Inji Developer Preview Release1- vDP1](https://github.com/mosip/inji/releases/tag/vDP1) |
| Mimoto           | [Mimoto vDP1](https://github.com/mosip/mimoto/releases/tag/vDP1)                         |

## Documentation

* [Feature Documentation](./)
* [User Guide](https://docs.mosip.io/1.2.0/modules/inji-user-guide)
* [QA Report](https://github.com/mosip/test-management/tree/master/inji/Inji%20VDP1)
* To know more about Inji, watch the [video](https://www.youtube.com/watch?v=9Z1WuTd8q0M)!
