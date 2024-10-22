# Version DP2

**Release Name**: Inji vDP2

**Upgrade From**: Inji 0.10.0

**Support**: Developer Preview Release2

**Release Date**: 22nd January, 2024

## Overview

The Developer Preview Version 2 release is an additional release on top of Inji 0.10.0. This release primarily emphasizes:

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
* Additionally, all image assets have been converted from `png` to `svg` format. This transition ensures the presence of a single asset set, and the color of the icons will now be dynamically rendered based on the application's theme.

### Security Fixes

The critical vulnerabilities identified by OWASP dependency check have been addressed:

* The expo-app-loading package has been replaced with expo-splash-screen for the purpose of app loading.
* In order to enhance security for devices without hardware backed keystore, the `crypto-js` package has been substituted with node-forge for encryption, decryption, and HMAC generation.
* Efforts have been made to improve the security of data in the default file located in the `mmkv` folder under the [INJI-467](https://mosip.atlassian.net/browse/INJI-467?atlOrigin=eyJpIjoiMjBhNWIzMmFjMjdiNGE1YzhhZTE4YmM0ZjA0MDM4ZWYiLCJwIjoiZXhjZWwtamlyYSJ9) task.

### Bug fixes

#### Functional Fixes

<table data-header-hidden><thead><tr><th width="202.5"></th><th></th></tr></thead><tbody><tr><td><strong>Issue ID</strong></td><td><strong>Description</strong></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-556">INJI-556</a></td><td>Unable to get error message when download retry count is updated to 10.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-555">INJI-555</a></td><td>iOS - app data erased when we logout in offline.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-474">INJI-474</a></td><td>We are not able to scan the e-signet QR code In iOS device.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-590">INJI-590</a></td><td>App resets on re-launch after VC activation in iOS.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-363">INJI-363</a></td><td>Logout not working in iOS version of Inji.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-362">INJI-362</a></td><td>iOS - language preference is again asked when we logged out of the app.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-332">INJI-332</a></td><td>UIN of previously downloaded VC is wrongly pre-filled in AID screen.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-295">INJI-295</a></td><td>VC sharing is failing intermittently on Android.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-262">INJI-262</a></td><td>Pinned VC's audit logs are missing.</td></tr></tbody></table>

#### App Crash

<table data-header-hidden><thead><tr><th width="204.5"></th><th></th></tr></thead><tbody><tr><td><strong>Issue ID</strong></td><td><strong>Description</strong></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-552">INJI-552</a></td><td>Android - app crashing while saving VC from eSignet, if the hardware keystore is rejected by user.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-533">INJI-533</a></td><td>Android- The Inji app is crashing intermediately.</td></tr></tbody></table>

#### BLE issues

<table data-header-hidden><thead><tr><th width="201.5"></th><th></th></tr></thead><tbody><tr><td><strong>Issue ID</strong></td><td><strong>Description</strong></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-521">INJI-521</a></td><td>Android - specific verifier is not connecting with wallet.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-156">INJI-156</a></td><td>Cross-platform - App couldn't recognize if the Bluetooth is turned off while in connection state.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-154">INJI-154</a></td><td>Android - We are able to receive VC even if we turned off Bluetooth in specific devices.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-625">INJI-625</a></td><td>Handle timeout during VC share via BLE.</td></tr></tbody></table>

#### Face Authentication

<table data-header-hidden><thead><tr><th width="202.5"></th><th></th></tr></thead><tbody><tr><td><strong>Issue ID</strong></td><td><strong>Description</strong></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-516">INJI-516</a></td><td>The app couldn't recognize resident face when there are changes.</td></tr></tbody></table>

#### UX issues

<table data-header-hidden><thead><tr><th width="205.5"></th><th></th></tr></thead><tbody><tr><td><strong>Issue ID</strong></td><td><strong>Description</strong></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-549">INJI-549</a></td><td>iOS- once we share VC through share with selfie, we are not getting successful screen in the wallet.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-558">INJI-558</a></td><td>iOS - Loading Screen is missing after Face Auth.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-546">INJI-546</a></td><td>Button name in "Status" page is not matching as per the requirement provided.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-512">INJI-512</a></td><td>The navigation button to go back from the ID details page is missing, not matching the wireframe provided.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-480">INJI-480</a></td><td>While logging out for the first time the language selection and tour guide show up.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-299">INJI-299</a></td><td>There is no popup to cancel the download card.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-259">INJI-259</a></td><td>The back button is not working on few places of the app.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-223">INJI-223</a></td><td>While sharing the VC, if we click on scan icon, application displays the camera.</td></tr></tbody></table>

#### UI issues

<table data-header-hidden><thead><tr><th width="208.5"></th><th></th></tr></thead><tbody><tr><td><strong>Issue ID</strong></td><td><strong>Description</strong></td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-593">INJI-593</a></td><td>UI - text search field in Add new card screen does not match wireframe.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-494">INJI-494</a></td><td>Not getting "setting up" message under loading screen       (intermittent screen).</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-478">INJI-478</a></td><td>'+' icon used for downloading VC is occupying three dots ellipses of last VC.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-440">INJI-440</a></td><td>The face authentication button is not as per the theme color.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-427">INJI-427</a></td><td>A page from wireframe is missing in the application.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-329">INJI-329</a></td><td>On 'Received Card' screen expanded view of VC is not working.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-300">INJI-300</a></td><td>The successful QR code login audit is not matching the wireframe.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-261">INJI-261</a></td><td>There are few elements still in color, orange in the purple theme.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-260">INJI-260</a></td><td>The app is not aligned properly with the smaller display phone.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-618">INJI-618</a></td><td>Share button is not aligned properly in iOS and Android.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-545">INJI-545</a></td><td>"It is necessary" text in consent screen is getting overlapped with page slider in smaller devices.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-492">INJI-492</a></td><td>Try again button is not aligned properly upon change language to Tamil (when no internet connection).</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-479">INJI-479</a></td><td>Intermittent: Getting double toaster message on home screen.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-446">INJI-446</a></td><td>Capture button text is not getting displayed completely.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-445">INJI-445</a></td><td>In the connecting page user is getting some orange color box.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-388">INJI-388</a></td><td>The error pop-up is not user friendly and not matching the UI.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-324">INJI-324</a></td><td>The Download pop-up should stay longer.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJI-322">INJI-322</a></td><td>Time stamp should be removed in OTP screen once it is expired.</td></tr></tbody></table>

## Repository Released

| **Repositories** | **Tags Released**                                                                             |
| ---------------- | --------------------------------------------------------------------------------------------- |
| Inji             | [Inji Developer Preview Release2- vDP2](https://github.com/mosip/inji/releases/tag/vDP2-INJI) |
| config           | [Release vDP2](https://github.com/mosip/mosip-config/releases/tag/vDP2-INJI)                  |

## Documentation

* [Feature Documentation](../../../../)
* [User Guide](https://docs.mosip.io/1.2.0/modules/inji-user-guide)
* [QA Report](test-report-dp2.md)
* To know more about Inji, watch the [video](https://www.youtube.com/watch?v=9Z1WuTd8q0M)!
