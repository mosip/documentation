# Version DP2

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
* User can now provide one time consent for a selected VC while sharing the claims during QR code login.
* Additionally, a search bar has been added to the `Add new card` screen to improve user experience by allowing users to search for issuers based on the title.
* Furthermore, any rendering issues in the user interface have been resolved.

### Internal enhancements

* Secure KeyStore and Tuvali have been integrated as independent NPM modules within the INJI framework. For further information, please refer to the provided documentation.
* Additionally, all image assets have been converted from png to svg format. This transition ensures the presence of a single asset set, and the color of the icons will now be dynamically rendered based on the application's theme.

### Security Fixes

The critical vulnerabilities identified by OWASP dependency check have been addressed:

* The expo-app-loading package has been replaced with expo-splash-screen for the purpose of app loading.
* In order to enhance security for devices without hardware backed keystore, the crypto-js package has been substituted with node-forge for encryption, decryption, and HMAC generation.
* Efforts have been made to improve the security of data in the default file located in the `mmkv` folder under the [INJI-467](https://mosip.atlassian.net/browse/INJI-467?atlOrigin=eyJpIjoiMjBhNWIzMmFjMjdiNGE1YzhhZTE4YmM0ZjA0MDM4ZWYiLCJwIjoiZXhjZWwtamlyYSJ9) task.

### Bug fixes

#### Functional fixes

| **Issue ID**                                            | **Description**                                                         |
| ------------------------------------------------------- | ----------------------------------------------------------------------- |
| [INJI-556](https://mosip.atlassian.net/browse/INJI-556) | Unable to get error message when download retry count is updated to 10. |
|                                                         |                                                                         |
|                                                         |                                                                         |

#### App crash

#### BLE issues

#### Face Authentication

#### UX issues

#### UI issues

## Repository Released

| **Repositories** | **Tags Released**                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------- |
| Inji             | [Inji Developer Preview Release1- vDP1](https://github.com/mosip/inji/releases/tag/vDP1) |
| Mimoto           | [Mimoto vDP1](https://github.com/mosip/mimoto/releases/tag/vDP1)                         |

## Documentation

* [Feature Documentation](./)
* [User Guide](https://docs.mosip.io/1.2.0/modules/inji-user-guide)
* [QA Report](test-report-dp2.md)
* To know more about Inji, watch the [video](https://www.youtube.com/watch?v=9Z1WuTd8q0M)!
