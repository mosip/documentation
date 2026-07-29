# Android Registration Client v1.1.1

**Release Version:** v1.1.1

**Release Type:** Patch Release

**Release Date:** 28th July, 2026

### Overview

Android Registration Client v1.1.1 is a patch release focused on improving code quality, security, and maintainability. This release addresses code review feedback, resolves security-related configuration issues, and improves the overall reliability of the Android Registration Client codebase.

The release also addresses static code analysis findings to improve long-term maintainability and platform readiness.

#### 1. Code Quality Improvements

This release addresses reliability issues and code hotspots identified during static code analysis.

The identified reliability findings have been resolved to improve application stability, while hotspot recommendations have been reviewed and addressed to strengthen code quality and maintainability. These improvements reduce technical debt and help ensure the codebase adheres to MOSIP development standards.

#### 2. Build Configuration Improvements

Build configuration has been refined by replacing developer machine-specific absolute paths with relative paths.

Previously, certain build configurations depended on local machine paths, making builds less portable across development environments. This enhancement enables consistent project setup and improves build reproducibility across developer workstations and CI/CD environments.

#### 3. Match SDK Integration

This release introduces Match SDK support into the Android Registration Client, enabling biometric matching capabilities as part of the registration workflow.

The Match SDK has been fully integrated into the Android Registration Client, providing the foundation for performing biometric matching operations in compliance with MOSIP standards. This integration improves interoperability with biometric devices and establishes support for future biometric matching enhancements within the platform.

By incorporating the Match SDK into the Android Registration Client, the release enhances the platform's biometric processing capabilities while ensuring compatibility with the latest application architecture and deployment model.

### Bugs Fixed

Below is the list of bug fixes included as part of the Android Registration Client v1.1.0 release.

| Bug ID                                                                          | Description                                                                                                        |
| ------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| [issues-1101](https://github.com/mosip/android-registration-client/issues/1101) | Android Registration Client was sending null Transaction ID and Capture Time values in biometric capture requests. |

### Known Issues

To view the list of known issues, refer [**here**](https://github.com/mosip/android-registration-client/issues?q=is%3Aissue%20state%3Aopen%20label%3Abug).

### Repository Released

| Repositories                | Tags Released                                                              |
| --------------------------- | -------------------------------------------------------------------------- |
| android-registration-client | [v1.1.1](https://github.com/mosip/android-registration-client/tree/v1.1.1) |
| mock-android-match-sdk      | [v0.1.0](https://github.com/mosip/mock-android-match-sdk/tree/v0.1.0)      |

### Compatible Platform/Module

The following table outlines the tested and certified compatibility of Android Registration Client v1.1.0 with other modules.

| Platform/Module | Version                  |
| --------------- | ------------------------ |
| MOSIP           | [v1.2.1.0](../v1.2.1.0/) |

### Documentation

* Build and Develop - [Developer Guide](https://docs.mosip.io/1.2.0/modules/android-registration-client/android-registration-client-developer-guide) (To access the build and deployment instructions, refer to the).
* Configurations - [Configuration Guide](https://docs.mosip.io/1.2.0/modules/android-registration-client/android-registration-client-configuration) (For details related to Android Registration Client configurations).
* User Guide - [Android Registration Client User Guide](https://docs.mosip.io/1.2.0/modules/android-registration-client/android-registration-client-user-guide) (To learn more about the available features, workflows, and user interface).
