# Android Registration Client v1.2.0

**Release Version:** Android Registration Client v1.2.0

**Release Type:** Developer Release

**Release Date:** 11th November, 2026

### Overview

The Android Registration Client v1.2.0 release adds support for registration centre remapping and separates master data sync from pre-registration data download.

When an administrator remaps a registration machine to a different centre, the client now detects the change during master sync. It blocks registration operations that would create data under the old centre, shows the operator what is pending, and runs a guided cleanup. The cleanup uploads all pending data before removing old-centre data from the device.

This release also gives operators two separate sync buttons, **Synchronise Data** and **Download Pre-Registration Data**. Each has its own progress, error messages and last-sync time, so operators can refresh rarely changing master data and daily pre-registration data independently.

### Major Highlights/ Features

* **Centre Remapping Detection:** The client reads the centre remapping indicator returned by master sync, alerts the operator, and stores the remap state so it persists across restarts. Background auto-sync is paused, a _Centre Remap Sync_ menu option is shown, and each detection is recorded in the audit log.
* **Registration Blocking During Remapping:** New Registration, UIN Update, Lost UIN, Operator Onboarding, Biometric Update and Pre-registration Download are blocked until the remap sync completes. Operators see a clear message for each blocked action, and every blocked attempt is logged.
* **Centre Remapping Status Screen:** A status screen shows packets awaiting upload, pending approval and in processing, along with blocked and allowed operations and the device's online status. The **Sync Centre** button is enabled only when the device is online and no packets are pending approval.
* **Centre Remapping Cleanup:** A guided cleanup uploads pending packets and operator data, then removes old-centre pre-registration data, packets, master data and operators. It pauses when offline, resumes from the last completed step after a network loss or app crash, and re-enables auto-sync on success.
* **Backend API Support for Centre Remapping:** The master sync response now includes the centre remapping status. Operator data upload and remapping status APIs support the cleanup flow.
* **Segregated Master Data and Pre-Registration Sync:** The dashboard now has separate **Synchronise Data** and **Download Pre-Registration Data** buttons, each calling its own existing backend API. Errors name the sync type and failed step, retry resumes from that point, and a network loss pauses the sync instead of failing it.

### Stories Released

| Story/Task ID                                                                  | Description                                                                                                                                        |
| ------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| [issue-1045](https://github.com/mosip/android-registration-client/issues/1045) | Centre Remap Sync: Detect Centre Remapping During Master Sync                                                                                      |
| [issue-1046](https://github.com/mosip/android-registration-client/issues/1046) | Centre Remap Sync: Block Registration Operations When Centre Remapping is In Progress                                                              |
| [issue-1053](https://github.com/mosip/android-registration-client/issues/1053) | Centre Remap Sync: Display Centre Remapping Status                                                                                                 |
| [issue-1054](https://github.com/mosip/android-registration-client/issues/1054) | Centre Remap Sync: Execute Centre Remapping Cleanup                                                                                                |
| [issue-1055](https://github.com/mosip/android-registration-client/issues/1055) | Centre Remap Sync: Backend API Integration for Centre Remapping                                                                                    |
| [issue-1064](https://github.com/mosip/android-registration-client/issues/1064) | Segregate Master Data and Pre-Registration Sync: Implement Segregated Sync UI with "Synchronise Data" and "Download Pre-Registration Data" Buttons |
| [issue-1065](https://github.com/mosip/android-registration-client/issues/1065) | Segregate Master Data and Pre-Registration Sync: Integrate Segregated Sync Using Existing Backend APIs                                             |

### Known Issues

To view the list of known issues, refer [here](https://github.com/mosip/android-registration-client/issues?q=is%3Aissue%20state%3Aopen%20label%3Abug).

### Repository Released

| Repository                  | Tag                                                                        |
| --------------------------- | -------------------------------------------------------------------------- |
| android-registration-client | [v1.2.0](https://github.com/mosip/android-registration-client/tree/v1.2.0) |

### Compatible Platform/Module

The following table outlines the tested and certified compatibility of Android Registration Client v1.2.0 with other modules.

| Platform/Module | Version                  |
| --------------- | ------------------------ |
| MOSIP           | [v1.2.1.1](../v1.2.1.1/) |

### Documentation

* [Feature documentation](https://docs.mosip.io/1.2.0/id-lifecycle-management/identity-issuance/android-registration-client/overview)
* [End User Guide](../../../id-lifecycle-management/identity-issuance/android-registration-client/test/android-registration-client-user-guide.md)
* [Test report](test-report.md)

