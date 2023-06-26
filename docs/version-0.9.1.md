# Version 0.9.1

**Release Name**: Inji 0.9.1 (Patch)

**Upgrade From**: Inji 0.9.0 (Beta)

**Release Date**: 14th April, 2023

**Support**: Developer Release

**Release Date**: XXth June, 2023

## Overview

The 0.9.1 version of Inji is the first patch release on top of Inji 0.9.0. This release has bug fixes for features like Downloading and sharing the VC, Wallet binding, face authentication on resident’s phone, etc.

## Summary

Below is a summary of some of the bugs that are fixed in this version.

* VC transfer to more number of devices (fix issues due to stock android 13, and increase device compatibility)

* Error codes if the transfer of the VC fails

* Clean up Google Nearby api and its state machines

* Reduce/ ask for required bluetooth permissions only based on the android devices

* Migrate to MMKV storage from Async storage. The device can store more number of received vc's.

* Mimoto - renew auth token after expiry

* Environment agnostic app - Treat environment as one MOSIP Credential registry

* Support for Philippines language

* Support for languages whose semantics are Right-to-Left

* Restrict downloading the ID card when the downloading the card via UIN is blocked

* Integrate faceauth using iris scan sdk from Ukraine team

* Update VC thumbprints when the same VC is downloaded multiple times on the same device and activated


###  Improvement areas

The 0.9.1 version of Inji mainly focuses on bug fixes along with some internal improvements like:

* Ability to build on Windows

* Build and push iOS builds to TestFlight without any human intervention

### Repository Released



**Change in implementation**

The older Inji app will not be compatible with the newer version of inji, due to two reasons:

* The storage has been changed from _Async Storage_ to _mmkv_ storage, which are two different storage mechanisms.

* The VC sharing might break as Tuvali has updated the type of data shared across devices, hence it can cause *array index out of bounds exception*.

### Bug fixes

* Bug fix: In the Testing Environment (qatriple ), some of the properties were missed in the deployment, so we have handled this to make the vc download work. #INJI-88

* Bug fix: Tuvali API Interface is highly motivated by old Google Nearby API. To make Tuvali easy to integerate, We have updated AP under this stoyr. #INJI-82

* Bug fix: Previously, the old binded vc of same UIN/VID cannot be used for online login, Here after we will show all the binded vc's and every binded vc can be used for online login #INJI-80

* Bug fix: Previously whenever any error is thrown by tuvali, default error message was shown. Witht his story, Tuvali started sending error code as well in error and it is shown on Inji dailog #INJI-71

* Bug fix: This Fix helped us solve the issue of building the inji application on windows. #INJI-53

* Bug fix: we were showing all the binded vc in the share screen. which is not the expected behaviour, hence we will be showing only the most recently binded vc for single UIN/VID. #INJI-51

* Bug fix: when we try to go back from the OTP screen while generating VID from AID the IOS app is getting crashed, as we were showing one model on top of another model, which caused this error. which is fixed in this bug. #INJI-46

* Bug fix: we were not showing the residents demographic information in their requested language, which is fixed now. #INJI-44

* Bug fix: we were not showing any popup to notify whether the storage is full or not, which cause the user to download continuosly until after vc is  downloaded, and will show loading vc continuosly, Hereafter, We will show app storage full error popup, when the storage is exhausted. and also clear the loading vc when we are not able to download more vc. #INJI-42

* Bug fix: During wallet binding, when the auth token is expired , the first call made for wallet binding will be used for refreshing the auth token, which makes the current call to fail and subsequent calls will succeed. this fix help us to solve that failure scenario as well. #INJI-41

* Bug fix: Previouly, we had a restriction of the overall storage size, so we were not able to download more than 29 vc's. so introduction of mmkv solved this as mmkv does not have any upper limit on the storage size. #INJI-38

* Bug fix: In the Home Screen, the tab indicators are not properly working in RTL, we have fixed this issue. #INJI-36

* Bug fix: Previouly, all the vc, that are added are getting accumulated to app size rather than user data, so introduction of mmkv solved this by moving the vc data to user data #INJI-35

* Bug fix: The arabic translations are missed, which was added as a part of this story. #INJI-34

* Bug fix: Inji application was not consistant in different locales , and some literals were not properly translated in the native languages, as a part of this issue we fixed this. #INJI-33

* Bug fix: Inji application was not consistant in different locales , and some literals were not properly translated in the native languages, as a part of this issue we fixed this. #INJI-32

* Bug fix: This Fix helped us solve the issue of building the inji application on windows. #INJI-30

* Bug fix: This Fix helps to upload the Inji build to testflight for internal testing through github runner, so that internal testers can use the artifact to do internal testing. #INJI-29

* Bug fix: This fix was made update the error popup shown during the BLE transfer, the popup will contain few error codes which depicts different stage where the failure has happened in the BLE layer. #INJI-28

* Bug fix: There was a delay in reading and writing the vc from the device, so we changed the storage mechanism from Async Storage to MMKV Storage, which helps to read and write very quickly. #INJI-7
