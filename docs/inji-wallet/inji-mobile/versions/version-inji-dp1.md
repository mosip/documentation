# Version DP1

**Release Name**: Inji vDP1

**Upgrade From**: Inji 0.9.1 (Patch)

**Support**: Developer Preview Release1

**Release Date**: 28th September, 2023

## Overview

The developer preview version of Inji Wallet is the release on top of Inji 0.9.1. Key highlights of the release are:

* Enhanced UI
* Additional functional flows in Inji
* Internal enhancements
* Bug fixes

## Summary

Below is the detailed summary of the release.

### Change in UI implementation

* New UI for Inji Wallet:
  * This redesign promises an enriched user experience.
  * Introduction sliders have been introduced.
  * Helpful FAQ screens are provided.
  * VC pinning is now available.
    * Currently, the pinning feature supports a single VC.
  * Easy VC removal from Inji Wallet.
  * Improved audit log filtering based on VC.

### Change in functional implementation

* Branding the App as `Inji Wallet`:
  * We've rebranded the application, transitioning from `Resident App` to the more streamlined and recognisable `Inji Wallet`.
* Ability to Choose Language During App Setup:
  * Inji Wallet app users can configure the application in six distinct languages:
    * English
    * Filipino
    * Arabic
    * Hindi
    * Kannada
    * Tamil
* Warning When Device Storage is Beyond the Threshold:
  * Inji Wallet now offers customisable storage limits:
    * For VC downloads, the threshold is set to 5MB. When the device's remaining storage space falls below this limit, Inji Wallet displays a warning message. However, users can still continue to verify and share VCs.
    * For Inji Wallet audit logs, the threshold is set to 1MB. Once the device reaches this limit, Inji users will be restricted to viewing VCs, unable to perform additional actions.
* Traceability with Unique ID for Customer Support:
  * We've implemented a unique identification called as an Application ID for customer support interactions. Each support request is now assigned a traceable and distinct ID, allowing our support teams to efficiently track, manage, and resolve customer issues.

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

* [Feature Documentation](../../../)
* [User Guide](https://docs.mosip.io/1.2.0/modules/inji-user-guide)
* [QA Report](https://github.com/mosip/test-management/tree/master/inji/Inji%20VDP1)
* To know more about Inji Wallet, watch the [video](https://www.youtube.com/watch?v=9Z1WuTd8q0M)!
