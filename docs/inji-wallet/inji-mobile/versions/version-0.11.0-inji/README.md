# Version 0.11.0-Inji

**Release Name**: Inji 0.11.0-Inji

**Support**: Developer Release

**Release Date**: 29th March, 2024

## Overview

We are excited to announce the release of **Inji Version 0.11.0** . This release is compatible with v0.11.0 Mimoto release. As part of 0.11.0, Inji introduces below mentioned key features:

* VC download using KBI
* Data backup and restore
* Improved UI / UX

In the recent past, Inji Wallet app had undergone GenderMag analysis which addresses gender / inclusivity bias in software. In this release, we have incorporated GenderMag features for UI / UX in inclusivity space.

To know more about the GenderMag UI/UX changes in the application, please refer [here](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features/gendermag).

## Summary

Please find below the details for the **Inji Version 0.11.0** release:

### VC download using KBI method

  Inji Wallet has proven capability to integrate with any credential issuer supporting **OpenID** protocol and issues Verifiable Credentials (VCs) based on **OpenID4VCI** standards. To demonstrate the implementation of VC download using KBI (Knowledge Based Identification), Inji Wallet when integrated with [eSignet 1.4.0](https://docs.esignet.io/versions/v1.4.0), can connect with any issuer preferring KBI-based identification.

To know more about, KBI, refer [here](https://docs.esignet.io/end-user-guide/knowledge-based-authentication).

### Data backup and restore

Inji Wallet currently offers data backup and restore functionality using Google Drive for Android and iCloud for iOS to safely store residents' Verifiable Credentials(VCs) on resident's preferred cloud platform. This ensures security and accessibility. Resident can also easily restore backed up information as required, and thereby enabling seamless user experience whether the resident uses Android or iOS.

### GenderMag

The GenderMag Method is a process and also a set of materials helpful in investigating gender biases during resident's problem-solving experiences with software. Gendermag adheres to Human Computer Interaction (HCI) principles and thereby factor in gender differences interaction with software. As part of GenderMag walkthrough, we have identified inclusivity bugs with respect to UI / UX in Inji Wallet. Version 0.11.0 includes UI / UX changes for P1 items.

## Repository Released

| **Repositories** | **Tags Released**                                                       |
| ---------------- | ----------------------------------------------------------------------- |
| Inji             | [v0.11.0](https://github.com/mosip/inji/tree/v0.11.0)                   |
| mimoto           | [v0.11.0](https://github.com/mosip/mimoto/tree/v0.11.0)                 |
| tuvali           | [v0.4.7](https://github.com/mosip/tuvali/tree/v0.4.7)                   |
| mosip-config     | [v0.11.0-INJI](https://github.com/mosip/mosip-config/tree/v0.11.0-INJI) |
| Secure-Keystore  | [v0.1.7](https://github.com/mosip/secure-keystore/tree/v0.1.7\_npm)     |
| mosip-onboarder  | [v1.2.0.1](https://github.com/mosip/mosip-onboarding/tree/v1.2.0.1)     |

## Known Issues

Redmi devices are not supported in this release. To know more, refer [here](https://mosip.atlassian.net/issues/?filter=-4\&jql=labels%20%3D%20redmi%20order%20by%20created%20DESC).

Mentioned below is the list of other known issues.

<table><thead><tr><th width="149">Jira issue</th><th>Issue description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-968">INJIMOB-968</a></td><td><strong>Android</strong>- Occasionally, unable to activate the restored VC</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-946">INJIMOB-946</a></td><td><strong>Inji</strong>-Unable to download when user attempted to restore VCs in a new device</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-937">INJIMOB-937</a></td><td><strong>INJI</strong>- Unable to download the card with a new UIN</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-875">INJIMOB-875</a></td><td><strong>IOS</strong> - Upon sharing sunbird VC twice and then upon sharing Mosip VC, app crashes</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-872">INJIMOB-872</a></td><td><strong>Android</strong> - During face authentication, app crashes on a specific device</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-868">INJIMOB-868</a></td><td><strong>INJI</strong> - Backup doesn't append the new data, but replaces the data</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-836">INJIMOB-836</a></td><td><strong>Android</strong>- Specific device, Redmi 7A- During face authentication, app crashes</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-705">INJIMOB-705</a></td><td>Redmi 6A device is not compatible with Inji's Tuwali version</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-689">INJIMOB-689</a></td><td>Upon changing the finger authentication in the device, application does not display the error pop up for biometrics change</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-548">INJIMOB-548</a></td><td><strong>Android</strong> - All downloaded VC's are deleted in specific device</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-529">INJIMOB-529</a></td><td><strong>Inji</strong>- Even upon Wallet failure, the verifier receives success message on the specific devices</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-523">INJIMOB-523</a></td><td><strong>Android</strong> - Couldn't share VCs between Two specific android devices</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-522">INJIMOB-522</a></td><td><strong>Android</strong> - Unable to share VC for specific combination</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-520">INJIMOB-520</a></td><td><strong>Android</strong> - VC transfer fails intermittently for specific device</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-491">INJIMOB-491</a></td><td><strong>Inji</strong>- The Inji application is not stable. Occasionally, unable to activate the VC</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-447">INJIMOB-447</a></td><td>Verifier app crashes upon face authentication</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-406">INJIMOB-406</a></td><td><strong>Inji</strong> - Unable to save received VC error. Displays as Identity proofs are tampered</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-320">INJIMOB-320</a></td><td>Unable able to retrieve VID / UIN from the AID which is raised through pre-registration process</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-306">INJIMOB-306</a></td><td><strong>Android</strong> - Couldn't share VC between two specific android devices as device crashes</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-272">INJIMOB-272</a></td><td><strong>Ios</strong> - Redmi 6A doesn't connect with any IOS devices</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-269">INJIMOB-269</a></td><td><strong>Android</strong> - Redmi 6A idoesn't connect with any android devices</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIMOB-50">INJIMOB-50</a></td><td>Error message for Invalid OTP is not correctly displayed during VC activation</td></tr></tbody></table>

## Bug Fixes

| Jira issue                                                    | Severity | Issue description                                                                                         |
| ------------------------------------------------------------- | -------- | --------------------------------------------------------------------------------------------------------- |
| [INJIMOB-703](https://mosip.atlassian.net/browse/INJIMOB-703) | Critical | **Inji** - App crashes during click of OTP re-send button of download through AID                         |
| [INJIMOB-572](https://mosip.atlassian.net/browse/INJIMOB-572) | Critical | **Android** - Received VC's are deleted                                                                   |
| [INJIMOB-714](https://mosip.atlassian.net/browse/INJIMOB-714) | Critical | **Android** - App crashes during the first launch                                                         |
| [INJIMOB-713](https://mosip.atlassian.net/browse/INJIMOB-713) | Critical | **Inji**- Occasionally, user is unable to share immediately                                               |
| [INJIMOB-709](https://mosip.atlassian.net/browse/INJIMOB-709) | Major    | **Inji**-During activation, VC in ID details page displays the green color toaster message on home screen |
| [INJIMOB-760](https://mosip.atlassian.net/browse/INJIMOB-760) | Major    | **Inji**- MOSIP logo changes according to the issuer                                                      |
| [INJIMOB-699](https://mosip.atlassian.net/browse/INJIMOB-699) | Major    | **Inji** - Deleted VC's HMAC data is not deleted                                                          |
| [INJIMOB-694](https://mosip.atlassian.net/browse/INJIMOB-694) | Major    | **Inji**-Paragraph border is displayed in color, orange for purple theme selection                        |
| [INJIMOB-559](https://mosip.atlassian.net/browse/INJIMOB-559) | Major    | Loading time for VC is longer than expected time                                                          |
| [INJIMOB-377](https://mosip.atlassian.net/browse/INJIMOB-377) | Major    | **Inji**- VC sharing is failing intermittently using selfie with share feature                            |
| [INJIMOB-327](https://mosip.atlassian.net/browse/INJIMOB-327) | Major    | App closes upon re-send code during VC activation through kebab popup                                     |

## Documentation

* [Feature Documentation](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features)
* [Integration Guides](https://docs.mosip.io/inji/inji-mobile-wallet/integration-guide)
* [User Guide](https://docs.mosip.io/inji/inji-mobile-wallet/end-user-guide)
* [QA Report](https://docs.mosip.io/inji/inji-mobile-wallet/versions/version-0.11.0-inji/test-report)
* [API Documentation](https://github.com/mosip/mimoto/tree/release-0.10.0/docs/postman-collections)
