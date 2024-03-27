# Version 0.11.0-Inji

**Release Name**: Inji 0.11.0-Inji

**Upgrade From**: Inji 0.10.0

**Support**: Developer Release

**Release Date**: 28th March, 2024

## Overview

We are excited to announce the release of **Inji Version 0.11.0**. This release is built upon Inji 0.10.0 and is compatible with 0.11.0 Mimoto release. As part of 0.11.0, Inji introduces below key features:

* Sunbird C Integration
* Data backup & Restore

In the recent past, Inji mobile app had undergone GenderMag analysis which addresses gender / inclusivity bias in software. In this release, we have incorporated GenderMag comments on UI / UX in inclusivity space.

## Summary

Please find below the details for the **Inji 0.11.0-Inji** release:

### Sunbird C Integration

Sunbird Credentials is now onboarded as an issuer with Inji Mobile. This demonstrates that Inji Mobile wallet can integrate with any credential issuer supporting **OpenID** protocol and issues Verifiable Credentials (VCs) according to OpenID4VCI standards. Sunbird C currently offers Insurance Credentials which can be downloaded into Inji mobile wallet when integrated with eSignet 1.4.0 using Knowledge Based Authentication (KBA) method.

### Data backup & Restore

Inji mobile wallet currently offers data backup and restore functionality using Google Drive for Android and iCloud for iOS to safely store your verifiable credentials on your preferred cloud platform, ensuring security and accessibility. Resident can also easily restore backed up information as required, and therby enabling seamless user experience whether the resident uses Android or iOS.

### GenderMag

The GenderMag Method is a process and set of materials helpful in investigating gender biases during resident's problem-solving experiences with software. Gendermag adheres to Human Computer Interaction (HCI) principles and thereby factor in gender differences interaction with software. As part of GenderMag walkthrough, we have identified inclusivity bugs with respect to UI / UX in Inji mobile. 0.11.0 will contain UI / UX changes for P1 items.

## Repository Released

| **Repositories** | **Tags Released**                                                               |
| ---------------- | ------------------------------------------------------------------------------- |
| mimoto           | [v0.11.0]()                                                                     |
| mosip-config     | [v0.11.0-INJI]()                                                                |

## Known Issues

Redmi devices are not supported for this release. To know more, refer to [known issues in Redmi device](https://mosip.atlassian.net/issues/?filter=-4&jql=labels%20%3D%20redmi%20order%20by%20created%20DESC).

Mentioned below is the list of other known issues.


## Bug Fixes



## Documentation

* [Feature documentation](architecture/features.md)
* [Integration Guides](integration-guide/)
* [User guide](end-user-guide.md)
* [API Documentation](https://github.com/mosip/mimoto/tree/release-0.10.0/docs/postman-collections)
