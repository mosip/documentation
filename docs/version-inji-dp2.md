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
  
### Security Fixes

The critical vulnerabilities identified by OWASP dependency check have been addressed:

* The expo-app-loading package has been replaced with expo-splash-screen for the purpose of app loading.
* In order to enhance security for devices without hardware backed keystore, the crypto-js package has been substituted with node-forge for encryption, decryption, and HMAC generation.
* Efforts have been made to improve the security of data in the default file located in the `mmkv` folder under the [INJI-467](https://mosip.atlassian.net/browse/INJI-467?atlOrigin=eyJpIjoiMjBhNWIzMmFjMjdiNGE1YzhhZTE4YmM0ZjA0MDM4ZWYiLCJwIjoiZXhjZWwtamlyYSJ9) task.


### Bug fixes


#### Functional Fixes

| **Issue ID**     | **Description**                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------|
| [INJI-556](https://mosip.atlassian.net/browse/INJI-556):|  Unable to get error message when download retry count is updated to 10. |
| [INJI-555](https://mosip.atlassian.net/browse/INJI-555):| iOS - app data erased when we logout in offline.    |
| [INJI-474](https://mosip.atlassian.net/browse/INJI-474):|Inji- We are not able to scan the e-signet QR code In iOS device . |  
| [INJI-590](https://mosip.atlassian.net/browse/INJI-590):| App resets on re-launch after VC activation in iOS. |                                                    
| [INJI-363](https://mosip.atlassian.net/browse/INJI-363):| Logout not working in iOS version of Inji.|
|[INJI-362](https://mosip.atlassian.net/browse/INJI-362):| iOS - language preference is again asked when we logged out of the app.|
| [INJI-332](https://mosip.atlassian.net/browse/INJI-332): | UIN of previously downloaded VC is wrongly pre-filled in AID screen. |
| [INJI-295](https://mosip.atlassian.net/browse/INJI-295): | VC sharing is failing intermittently on Android. |
| [INJI-262](https://mosip.atlassian.net/browse/INJI-262): | Inji - pinned VC's audit logs are missing. |

#### App Crash

| **Issue ID**     | **Description**                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------|
| [INJI-552](https://mosip.atlassian.net/browse/INJI-552):|  Android - app crashing while saving VC from eSignet, if the hardware keystore is rejected by user. |
| [INJI-533](https://mosip.atlassian.net/browse/INJI-533): | Android- The INJI app is crashing intermediately. |

#### BLE issues

| **Issue ID**     | **Description**                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------|
| [INJI-521](https://mosip.atlassian.net/browse/INJI-521): |  Android - specific verifier is not connecting with wallet. |
| [INJI-156](https://mosip.atlassian.net/browse/INJI-156): |  Cross-platform - App couldn't recognise if the bluetooth is turned off while in connection state. |
| [INJI-154](https://mosip.atlassian.net/browse/INJI-154): |  Android - We are able to receive VC even if we turned off bluetooth in specific devices. |
| [INJI-625](https://mosip.atlassian.net/browse/INJI-625): |  Handle timeout during VC share via BLE. |

#### Face Authentication

| **Issue ID**     | **Description**                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------|
| [INJI-516](https://mosip.atlassian.net/browse/INJI-516): |  Inji - app couldn't recognise resident face when there are changes. |

#### UX issues

| **Issue ID**     | **Description**                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------|
| [INJI-549](https://mosip.atlassian.net/browse/INJI-549): |  iOS- once we share VC through share with selfie, we are not getting successful screen in the wallet. |
| [INJI-558](https://mosip.atlassian.net/browse/INJI-558): |  iOS - Loading Screen is missing after Face Auth. |
| [INJI-546](https://mosip.atlassian.net/browse/INJI-546): |  Button name in "Status" page is not matching as per the requirement provided. |
| [INJI-512](https://mosip.atlassian.net/browse/INJI-512): |  The navigation button to go back from the ID details page is missing, not matching the wireframe provided. |
| [INJI-480](https://mosip.atlassian.net/browse/INJI-480): |  Inji - while logging out for the first time the language selection and tour guide show up. |
| [INJI-299](https://mosip.atlassian.net/browse/INJI-299): |  Inji- There is no popup to cancel the download card. |
| [INJI-259](https://mosip.atlassian.net/browse/INJI-259): |  Inji - The back button is not working on few places of the app. |
| [INJI-223](https://mosip.atlassian.net/browse/INJI-223): |  While sharing the VC, if we click on scan icon, application displays the camera. |

#### UI issues

| **Issue ID**     | **Description**                                                                        |
| ---------------- | ---------------------------------------------------------------------------------------|
| [INJI-593](https://mosip.atlassian.net/browse/INJI-593): |  UI - text search field in Add new card screen does not match wireframe. |
| [INJI-494](https://mosip.atlassian.net/browse/INJI-494): |  Not getting "setting up" message under loading screen( intermittent screen). |
| [INJI-478](https://mosip.atlassian.net/browse/INJI-478): |  '+' icon used for downloading vc is occupying three dots ellipses of last vc. |
| [INJI-440](https://mosip.atlassian.net/browse/INJI-440): |  Inji- The face authentication button is not as per the theme color. |
| [INJI-427](https://mosip.atlassian.net/browse/INJI-427): |  Inji-A page from wireframe is missing in the application. |
| [INJI-329](https://mosip.atlassian.net/browse/INJI-329): |  On 'Received Card' screen expanded view of VC is not working. |
| [INJI-300](https://mosip.atlassian.net/browse/INJI-300): |  Inji- The successful QR code login audit is not matching the wireframe. |
| [INJI-261](https://mosip.atlassian.net/browse/INJI-261): |  Inji - There are few elements still in color, orange in the purple theme. |
| [INJI-260](https://mosip.atlassian.net/browse/INJI-260): |  Inji - The app is not aligned properly with the smaller display phone. |
| [INJI-618](https://mosip.atlassian.net/browse/INJI-618): |  Inji - Share button is not aligned properly in iOS and Android. |
| [INJI-545](https://mosip.atlassian.net/browse/INJI-545): |  "It is necessary" text in consent screen is getting overlapped with page slider in smaller devices. |
| [INJI-492](https://mosip.atlassian.net/browse/INJI-492): |  Try again button is not aligned properly upon change language to Tamil (when no internet connection). |
| [INJI-479](https://mosip.atlassian.net/browse/INJI-479): |  Intermittent: Getting double toaster message on home screen. |
| [INJI-446](https://mosip.atlassian.net/browse/INJI-446): |  Capture button text is not getting displayed completely. |
| [INJI-445](https://mosip.atlassian.net/browse/INJI-445): |  Inji- In the connecting page user is getting some orange color box. |
| [INJI-388](https://mosip.atlassian.net/browse/INJI-388): |  The error pop-up are not user friendly and not matching the UI. |
| [INJI-324](https://mosip.atlassian.net/browse/INJI-324): |  Inji- The Download pop-up should stay longer. |
| [INJI-322](https://mosip.atlassian.net/browse/INJI-322): |  Inji-Time stamp should be removed in OTP screen once it is expired. |

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
