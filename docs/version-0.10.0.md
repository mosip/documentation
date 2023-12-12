# Version 0.10.0

**Release Name**: Inji 0.10.0

**Upgrade From**: Inji 0.9.0

**Support**: Developer Release

**Release Date**: December 12, 2023

## Overview

We are pleased to announce the release of Inji Version 0.10.0. This release builds upon Inji 0.9.1, introducing key features and improvements

* **OpenID Support for Verifiable Credentials**: Inji 0.10.0 introduces support for OpenID, facilitating the issuance of verifiable credentials.
* **Enhanced Security for Personally Identifiable Information (PII) Data**: A significant focus has been placed on reinforcing security measures related to Personally Identifiable Information (PII) data.
* **Facial Recognition for Transaction Authorization**: This version introduces advanced facial recognition capabilities to elevate the security of transaction authorization processes.
* **Improved UI/UX**: User Interface (UI) and User Experience (UX) have undergone refinement to provide users with an intuitive and aesthetically pleasing interaction.
* **Application ID (AID)**: Inji 0.10.0 now includes an Application ID, contributing to streamlined identification and tracking.

## Summary

Below is the detailed summary of the release.

#### Enhanced UI/UX

* A redesigned interface promises improved usability and a more intuitive experience.
* Navigation buttons have been updated to prominently display primary functionalities.
* Secondary functionalities, such as viewing received Verifiable Credentials (VC) and displaying QR codes, have been relocated under the settings menu for a streamlined experience.
* The introduction of new and detailed error messages, along with app warnings, aims to enhance transparency and overall usability.

#### Enhanced Security

* Securely stored encryption of private keys using the Android hardware keystore for heightened security.
* Implemented hash algorithms for verifying the integrity of downloaded and received Verifiable Credentials (VCs).
* Enhanced password security with the implementation of password hashing algorithms.
* App now proactively responds to security breaches by initiating a self-reset or eliminating tampered Verifiable Credentials (VCs).

#### OpenID Support

* Inji now seamlessly integrates with OpenID, expanding support for Verifiable Credentials (VC).
* The app is now equipped to onboard Identity Providers (IdP), offering users a choice when interacting with issuers.
* Introduces new screens allowing users to select issuers before downloading Verifiable Credentials (VC).
* eSignet and MOSIP have been successfully onboarded as Identity Providers within Inji.

#### Advanced Facial Recognition authorization

Inji now employs advanced facial recognition libraries for secure and seamless authorization of Verifiable Credential (VC) transfers.

#### Application ID for Customer Support

A unique application ID is now associated with each unique installation of Inji. It is made accessible to the users.

## Repository Released

| **Repositories** | **Tags Released** |
| ---------------- | ----------------- |
|                  |                   |
|                  |                   |
|                  |                   |
|                  |                   |

## Known Issues

Redmi devices are not supported for this release. To know more, refer to [known issues in Redmi device](https://mosip.atlassian.net/issues/?filter=-4\&jql=labels%20%3D%20redmi%20order%20by%20created%20DESC).

## Bug Fixes

1. The user will now be redirected to the MOSIP page successfully from the `About INJI` screen. Earlier the link was crashing the app. #[INJI 225](https://mosip.atlassian.net/browse/INJI-225)
2. The user will be able to login into eSignet’s portal via QR code, using the VC activated on Home screen via. ellipsis menu. #[INJI 253](https://mosip.atlassian.net/browse/INJI-253)
3. App will prompt and remove tampered VC. #[INJI 397](https://mosip.atlassian.net/browse/INJI-397)
4. The user will be asked for language preference only at new installation. #[INJI 362](https://mosip.atlassian.net/browse/INJI-362)
5. Previously used UIN/VID will not be suggested in the AID field for VC download. #[INJI 332](https://mosip.atlassian.net/browse/INJI-332)
6. The user will be able to see the detailed view of `Received` VC. #[INJI 329](https://mosip.atlassian.net/browse/INJI-329)
7. The user will be redirected to an intermittent downloading screen, when download is triggered from OpenID supported issuer. #[INJI 458](https://mosip.atlassian.net/browse/INJI-458)

## Documentation

* Feature documentation 
* User guide
* QA Report

