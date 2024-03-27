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

| **Repositories** | **Tags Released**                      |
| ---------------- | -------------------------------------- |
| mimoto           | [v0.11.0](version-0.11.0-inji.md)      |
| mosip-config     | [v0.11.0-INJI](version-0.11.0-inji.md) |

## Known Issues

Redmi devices are not supported for this release. To know more, refer to [known issues in Redmi device](https://mosip.atlassian.net/issues/?filter=-4\&jql=labels%20%3D%20redmi%20order%20by%20created%20DESC).

Mentioned below is the list of other known issues.



<table><thead><tr><th width="149">Jira number</th><th>Issue description</th></tr></thead><tbody><tr><td>INJIMOB-968</td><td><strong>Android</strong>- Intermediately Unable to activate the restored VC</td></tr><tr><td>INJIMOB-946</td><td><strong>Inji</strong>-Downloading error is observed when we were trying to restore VCs in a new device</td></tr><tr><td>INJIMOB-937</td><td><strong>INJI</strong>- We are not able to download the card with a new UIN</td></tr><tr><td>INJIMOB-875</td><td><strong>IOS</strong> - After sharing sunbird VC twice once we share Mosip VC app is crashing</td></tr><tr><td>INJIMOB-872</td><td><strong>Android</strong> - While doing face authentication the app is getting crashed on a specific device</td></tr><tr><td>INJIMOB-868</td><td><strong>INJI</strong> - Backup is not appending the new data, it is replacing the data</td></tr><tr><td>INJIMOB-836</td><td><strong>Android</strong>- Specific device Redmi 7A While doing face authentication app is getting crashed</td></tr><tr><td>INJIMOB-705</td><td>Redmi 6A not compatible with current INJI's Tuwali version</td></tr><tr><td>INJIMOB-689</td><td>After changing the finger authentication in the device, the user is not getting the error pop up for biometrics change</td></tr><tr><td>INJIMOB-548</td><td><strong>Android</strong> - all downloaded VC's are deleted in specific device</td></tr><tr><td>INJIMOB-529</td><td><strong>Inji</strong>-Wallet is failed, but the verifier is getting success on the specific devices</td></tr><tr><td>INJIMOB-523</td><td><strong>Android</strong> - couldn't share vc in between Two specific android devices</td></tr><tr><td>INJIMOB-522</td><td><strong>Android</strong> - VC sharing is not working in specific combination</td></tr><tr><td>INJIMOB-520</td><td><strong>Android</strong> - VC transfer is failing intermittently in specific device</td></tr><tr><td>INJIMOB-491</td><td><strong>Inji</strong>- The Inji application is not stable sometimes we are not able to activate the VC</td></tr><tr><td>INJIMOB-447</td><td>Verifier app is getting crashed on performing face authentication</td></tr><tr><td>INJIMOB-406</td><td><strong>Inji</strong> - Unable to save received VC error showing as Identity proofs are tampered</td></tr><tr><td>INJIMOB-320</td><td>We are not able to retrieve VID / UIN from the AID which is raised through pre-registration process</td></tr></tbody></table>

## Bug Fixes

## Documentation

* [Feature documentation](architecture/features.md)
* [Integration Guides](integration-guide/)
* [User guide](end-user-guide.md)
* [API Documentation](https://github.com/mosip/mimoto/tree/release-0.10.0/docs/postman-collections)
