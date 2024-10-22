# Version 0.9.1

**Release Name**: Inji 0.9.1 (Patch)

**Upgrade From**: Inji 0.9.0 (Beta)

**Support**: Developer Release

**Release Date**: 25th July, 2023

## Overview

The 0.9.1 version of Inji Wallet is the first patch release on top of Inji 0.9.0. This release has bug fixes for features like Downloading and sharing the VC, Wallet binding, face authentication on resident’s phone, etc.

## Summary

Below is a summary of some of the important bug fixes made in this version.

* Added capabilitities to **transfer the VC to more number of devices** with an increase in device compatibility.
* **Introduction of error codes** in case the transfer of VC fails.
* Based on the android devices, Inji Wallet now asks for only the required Bluetooth permissions.
* Migrated to **MMKV storage from Async storage**. With this, the devices can now store more number of VCs.
* Renew auth token after expiry in Mimoto.
* Added support for Filipino language (Philippines language).
* Added support for languages whose semantics are Right-to-Left.
* Added feature to restrict the downloading of ID card when the download of the card via UIN is blocked.
* Updated VC thumbprints when the same VC is downloaded multiple times on the same device and is activated.

### Internal Improvements

The 0.9.1 version of Inji Wallet mainly focuses on bug fixes along with some internal improvements like:

* Ability to build on Windows
* Abilty to build and push iOS builds to TestFlight without any human intervention

### Change in implementation

The older version of Inji Wallet app (0.9.0) will not be compatible with the newer version of Inji, due to the following reasons:

* The storage has been changed from _Async Storage_ to _mmkv_ storage, which are two different storage mechanisms.
* The VC sharing might break as Tuvali has updated the type of data shared across devices, hence it can cause _array index out of bounds exception_.

### Bug fixes

* **Bug fix**: All the binded VCs will be shown and every binded VC can be used for online login irrespective of the timeframe of binding. #[INJI-80](https://mosip.atlassian.net/browse/INJI-80)
* **Bug fix**: Tuvali now has the capability to specify an error code to let Inji know where the error has occurred during VC sharing instead of displaying the default error message. #[INJI-71](https://mosip.atlassian.net/browse/INJI-71)
* **Bug fix**: Added capability to build APKs on Windows. #[INJI-53](https://mosip.atlassian.net/browse/INJI-53) #[INJI-30](https://mosip.atlassian.net/browse/INJI-30)
* **Bug fix**: In iOS, when the user tries to go back from the OTP screen while generating VID from AID, Inji was crashing. As a fix, it was made sure that the models (overlays) are not overlapping. #[INJI-46](https://mosip.atlassian.net/browse/INJI-46)
* **Bug fix**: Inji now has the capability to render the resident's demographic information in the language chosen by the Residents. #[INJI-44](https://mosip.atlassian.net/browse/INJI-44)
* **Bug fix**: Inji now has the capability to identify when the App is low on storage and notify the same to the Residents. #[INJI-42](https://mosip.atlassian.net/browse/INJI-42)
* **Bug fix**: During wallet binding when the auth token is expired, the first call made for wallet binding will be used for refreshing the auth token, which then makes the current call to fail and subsequent calls to succeed. As a fix, the wallet binding call will refresh the token and complete the binding process. #[INJI-41](https://mosip.atlassian.net/browse/INJI-41)
* **Bug fix**: Inji Wallet had a restriction to the overall storage size, in that, we were not able to download more than 29 VCs. As a fix, we migrated from Async storage to MMKV which does not have any upper limit on the storage size. #[INJI-38](https://mosip.atlassian.net/browse/INJI-38)
* **Bug fix**: In the Home Screen, the tab indicators were not properly working in RTL. After the fix, RTL is being rendered properly. #[INJI-36](https://mosip.atlassian.net/browse/INJI-36)
* **Bug fix**: The VCs that are added were getting stored in the app memory rather than user data. As a fix, MMKV storage was introduced (as opposed to async storage) to solve this by moving the VC data to user data instead of App memory. #[INJI-35](https://mosip.atlassian.net/browse/INJI-35)
* **Bug fix**: A few texts were not being rendered in Arabic. The Arabic translations were added to make sure when the resident has chosen Arabic language, all the data is being rendered in Arabic. #[INJI-34](https://mosip.atlassian.net/browse/INJI-34)
* **Bug fix**: Inji Wallet application was not consistent in different locales, and some literals were not properly translated in the native languages. As a fix, all the missed out translations were added. #[INJI-33](https://mosip.atlassian.net/browse/INJI-80) #[INJI-32](https://mosip.atlassian.net/browse/INJI-80)
* **Bug fix**: The error popup shown during the BLE transfer is updated, the popup will now contain few error codes which depicts different stages where the failure has happened in the BLE layer. #[INJI-28](https://mosip.atlassian.net/browse/INJI-28)
* **Bug fix**: There was a delay in reading and writing the VC from the device, so the storage mechanism has been changed from Async Storage to MMKV Storage, which ensures faster reading and writing. #[INJI-7](https://mosip.atlassian.net/browse/INJI-7)
* **Bug fix**: Few devices failed to establish the connection while sharing of VCs were initiated (Vivo Y73 & Redmi K20 Pro). To resolve this, setting preferred PHY was removed and missing BLE permissions for Android 12 and above were added. #[INJI-39](https://mosip.atlassian.net/browse/INJI-39)
* **Bug fix**: The VC transfers from iOS device always failed when Android 13 was the Verifier. As a fix, Bluetooth negotiation was updated to support Google Pixel (Android 13). #[INJI-68](https://mosip.atlassian.net/browse/INJI-68)

## Documentation

* [Feature Documentation](../../../../)
* [User Guide](https://docs.mosip.io/1.2.0/modules/mobile-application/inji-mobile-app-beta)
* [QA Report](https://docs.mosip.io/inji/versions/version-0.9.1/test-report-0.9.1)
* To know more about Inji Wallet, watch the [video](https://www.youtube.com/watch?v=JWxJfHMVMFI)!
