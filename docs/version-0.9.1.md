# Version 0.9.1

**Release Name**: Inji 0.9.1 (Patch)

**Upgrade From**: Inji 0.9.0 (Beta)

**Release Date**: 14th April, 2023

**Support**: Developer Release

**Release Date**: XXth June, 2023

## Overview

The 0.9.1 version of Inji is the first patch release on top of Inji 0.9.0. This release has bug fixes for features like Downloading and sharing the VC, Wallet binding, face authentication on resident’s phone, etc.

## Summary

Below is a summary of some of the important bug fixes made in this version.

* Added capabilitities to transfer the VC to more number of devices with an increase in device compatibility.

* Introduction of error codes in case the transfer of VC fails.

* Clean-up of Google Nearby API and its state machines.

* Based on the android devices, Inji now asks for only the required Bluetooth permissions.

* Migrated to MMKV storage from Async storage. With this, the devices can now store more number of VCs.

* Renew auth token after expiry in Mimoto.

* Modified the app to be environment agnostic so as to treat environment as one MOSIP Credential registry.

* Added support for Filipino language (Philippines language).

* Added support for languages whose semantics are Right-to-Left.

* Added feature to restrict the downloading of ID card when the download of the card via UIN is blocked.

* Integrated Faceauth using Iris scan SDK.

* Updated VC thumbprints when the same VC is downloaded multiple times on the same device and is activated.


### Internal Improvements 

The 0.9.1 version of Inji mainly focuses on bug fixes along with some internal improvements like:

* Ability to build on Windows

* Abilty to build and push iOS builds to TestFlight without any human intervention

### Change in implementation

The older version of Inji app (0.9.0) will not be compatible with the newer version of inji, due to two reasons:

* The storage has been changed from _Async Storage_ to _mmkv_ storage, which are two different storage mechanisms.

* The VC sharing might break as Tuvali has updated the type of data shared across devices, hence it can cause *array index out of bounds exception*.

### Repository Released





### Bug fixes



