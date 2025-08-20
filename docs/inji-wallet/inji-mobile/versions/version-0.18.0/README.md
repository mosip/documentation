# Version 0.18.0

**Release Name:** Inji Mobile Wallet 0.18.0

**Release Type:** Developer

**Release Date:** 19th Aug, 2025

### Overview

This release of **Inji Mobile Wallet v0.18.0** introduces the **Credential Offer feature with Pre-Authorized Code flow**, along with enhancements to the VCI client libraries, UI/UX refinements, and major bug fixes across Android and iOS.

The release strengthens support for **OpenID4VCI and OpenID4VP specifications**, improves interoperability, and enhances stability and accessibility.

### Key Highlights

* **Credential Offer with Pre-Authorized Code Flow**
  * Scan and redeem credential offers for pre-authorized VC downloads directly into the wallet.
  * Supported both **with and without a transaction code**.
  * Backend & frontend implementation for **Android (Kotlin)** and **iOS (Swift)**.
* **Library Enhancements & Upgrades**
  * Upgraded **VCI Client Libraries** (Kotlin & Swift) with Credential Offer + VC Data Model 1.1 extensions.
  * Error handling aligned with **OpenID4VP specification**.
  * Singleton pattern for **VCI Client & OVP Library** instances.
* **UI/UX Improvements**
  * Error response handling and fallback logic for JSON-LD VC & mDoc when `well-known` metadata is missing.
  * Enhanced audit logs, transaction code display, and photo rendering in VCs.
  * Reference UI flows for credential offer with/without transaction code.

### Technical Improvements

* Backend support for **Credential Offer (Swift & Kotlin)**.
* **VC rendering fallback logic** for mDoc & JSON-LD when issuer metadata is unavailable.
* **Wallet nonce generation** per transaction for stronger security.
* **Trusted issuer list** maintained within the wallet.
* Multiple crash/stability fixes in **iOS same-device flow, OVP scans, VC sharing**.
* **Interoperability improvements** for OpenID4VCI & OpenID4VP compliance.

### Features

| New Feature                                         | Jira Link                                                       |
| --------------------------------------------------- | --------------------------------------------------------------- |
| Credential Offer Support – Pre-Authorized Code Flow | [INJIMOB-3419](https://mosip.atlassian.net/browse/INJIMOB-3419) |

### Technical Enhancements

| Enhancement                                 | Jira Link                                                       |
| ------------------------------------------- | --------------------------------------------------------------- |
| Enhance VCI Client Library (Kotlin)         | [INJIMOB-3187](https://mosip.atlassian.net/browse/INJIMOB-3187) |
| Enhance VCI Client Library (Swift)          | [INJIMOB-3206](https://mosip.atlassian.net/browse/INJIMOB-3206) |
| Error Response Handling – OpenIDVP (Kotlin) | [INJIMOB-3191](https://mosip.atlassian.net/browse/INJIMOB-3191) |
| Error Response Handling – OpenIDVP (Swift)  | [INJIMOB-3192](https://mosip.atlassian.net/browse/INJIMOB-3192) |
| VC Display Fallback for JSON-LD VC          | [INJIMOB-3349](https://mosip.atlassian.net/browse/INJIMOB-3349) |
| VC Display Fallback for mDoc                | [INJIMOB-3352](https://mosip.atlassian.net/browse/INJIMOB-3352) |
| Trusted Issuer List Management in Wallet    | [INJIMOB-3346](https://mosip.atlassian.net/browse/INJIMOB-3346) |

### Repositories Released

| Module                    | Version                                                                 |
| ------------------------- | ----------------------------------------------------------------------- |
| inji-wallet               | [0.18.0](https://github.com/mosip/inji-wallet/tree/v0.18.0)             |
| inji-openid4vp-ios-swift  | [0.4.0](https://github.com/mosip/inji-openid4vp-ios-swift/tree/v0.4.0)  |
| inji-openid4vp            | [0.4.0](https://github.com/mosip/inji-openid4vp/tree/v0.4.0)            |
| inji-vci-client           | [0.4.0](https://github.com/mosip/inji-vci-client/tree/v0.4.0)           |
| inji-vci-client-ios-swift | [0.4.0](https://github.com/mosip/inji-vci-client-ios-swift/tree/v0.4.0) |
| pixelpass-ios-swift       | [0.6.3](https://github.com/mosip/pixelpass-ios-swift/tree/v0.6.3)       |

### Compatible Modules

| Module       | Version                                                                     |
| ------------ | --------------------------------------------------------------------------- |
| mimoto       | [0.18.1](https://github.com/mosip/mimoto/tree/v0.18.1)                      |
| inji-config  | [0.9.1](https://github.com/mosip/inji-config/tree/v0.9.1)                   |
| Inji Certify | [0.11.0](https://github.com/mosip/inji-certify/tree/v0.11.0)                |
| Inji Verify  | [0.13.1](https://docs.inji.io/inji-wallet/inji-web/inji-web/version-0.13.1) |
| eSignet      | [1.5.1](https://github.com/mosip/esignet/tree/v1.5.1)                       |
| vc-verifier  | [1.3.0](https://github.com/mosip/vc-verifier/tree/v1.3.0)                   |

### Known Issues <a href="#known-issues" id="known-issues"></a>

Below is the list of known issues. To read in detail, [click here](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?jql=project%20%3D%20%22INJIMOB%22%20AND%20type%20%3D%20Bug%20AND%20status%20IN%20%28New%2C%20Assigned%29%20ORDER%20BY%20created%20DESC)

| Jira Issue                                                      | Description                                                                                                                                                                           |
| --------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [INJIMOB-3498](https://mosip.atlassian.net/browse/INJIMOB-3498) | In the search bar, search for “mock” and select the mock identity issue. The first attempt is not clickable; it becomes clickable only on the second attempt.                         |
| [INJIMOB-3491](https://mosip.atlassian.net/browse/INJIMOB-3491) | In the mock UI, the copy buttons are displayed inside the response.                                                                                                                   |
| [INJIMOB-3490](https://mosip.atlassian.net/browse/INJIMOB-3490) | In the mock UI, we currently have only the draft 23 QR code. It would be better to also include the draft 21 QR code, as it would help the user.                                      |
| [INJIMOB-3489](https://mosip.atlassian.net/browse/INJIMOB-3489) | In the mock UI, only the download button is highlighted, while the other buttons are not.                                                                                             |
| [INJIMOB-3488](https://mosip.atlassian.net/browse/INJIMOB-3488) | Add the decoded payload for all schemas, as it is difficult for users to read.                                                                                                        |
| [INJIMOB-3487](https://mosip.atlassian.net/browse/INJIMOB-3487) | Add a description for each API schema on the home screen.                                                                                                                             |
| [INJIMOB-3486](https://mosip.atlassian.net/browse/INJIMOB-3486) | In the OVP flow, if the user sets `limit_disclosure` to an invalid value and then scans the QR code for 'By Reference', the DID does not display the message 'Problem with response'. |
| [INJIMOB-3483](https://mosip.atlassian.net/browse/INJIMOB-3483) | Android – Mock VC download is failing in v1 issuer. It shows an "An error occurred" screen.                                                                                           |
| [INJIMOB-3480](https://mosip.atlassian.net/browse/INJIMOB-3480) | iOS – The application crashes after scanning the QR code when the optional field `client_metadata` is removed from the authorization request.                                         |
| [INJIMOB-3479](https://mosip.atlassian.net/browse/INJIMOB-3479) | App idle 1 minute share VC and BLE transfer time in share with selfie in verifier end showing Bluetooth connection lost issue.                                                        |
| [INJIMOB-3477](https://mosip.atlassian.net/browse/INJIMOB-3477) | MOSIP VC not getting loaded on home page when downloaded from release issuer.                                                                                                         |
| [INJIMOB-3476](https://mosip.atlassian.net/browse/INJIMOB-3476) | Credential Offer – Error message is not proper for invalid transaction code scenario.                                                                                                 |
| [INJIMOB-3475](https://mosip.atlassian.net/browse/INJIMOB-3475) | Credential Offer – iOS alignment is not proper from scan and download option when language changed to Kannada on iPhone 13.                                                           |
| [INJIMOB-3470](https://mosip.atlassian.net/browse/INJIMOB-3470) | History is not getting logged properly when a single quote is added in the name from display.                                                                                         |
| [INJIMOB-3469](https://mosip.atlassian.net/browse/INJIMOB-3469) | Info icon is not coming for other languages than English on ID details view page.                                                                                                     |
| [INJIMOB-3468](https://mosip.atlassian.net/browse/INJIMOB-3468) | iOS – 'National Identity Department' issuer name and description is not showing properly for other languages when internet is off.                                                    |
| [INJIMOB-3467](https://mosip.atlassian.net/browse/INJIMOB-3467) | App idle 1 minute share VC and BLE transfer time in share with selfie in verifier end showing Bluetooth connection lost issue.                                                        |
| [INJIMOB-3466](https://mosip.atlassian.net/browse/INJIMOB-3466) | Credential Offer – Android VC is not getting verified post backup and restore.                                                                                                        |
| [INJIMOB-3464](https://mosip.atlassian.net/browse/INJIMOB-3464) | iOS – After pinning the VC (MOSIP ID) and attempting to share with 'Share with Selfie' with an invalid face, the error screen buttons ("Retry" and "Home") are unresponsive.          |
| [INJIMOB-3458](https://mosip.atlassian.net/browse/INJIMOB-3458) | After successfully sharing the VC, the address field in ID de                                                                                                                         |

### Bug Fixes

Below is the list of bug fixes as part of the [**0.18.0**](https://mosip.atlassian.net/jira/software/c/projects/INJIMOB/issues/?filter=allissues\&jql=project%20%3D%20%22INJIMOB%22%0AAND%20type%20%3D%20Bug%0AAND%20status%20%3D%20Closed%0AAND%20labels%20NOT%20IN%20%28API_Automation%2C%20UI_Automation%2C%20brazil_prepilot%2C%20FaceLivenessVerification%29%0AAND%20affectedversion%20%3D%200.18.0%0AORDER%20BY%20created%20DESC\&selectedIssue=INJIMOB-3478) **release**:

| Jira Issue                                                      | Description                                                                                                  |
| --------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------ |
| [INJIMOB-3465](https://mosip.atlassian.net/browse/INJIMOB-3465) | When internet is turned off, the back button gets stuck in the loading state.                                |
| [INJIMOB-3452](https://mosip.atlassian.net/browse/INJIMOB-3452) | Same device flow for both Pre-Registered and By Reference shows: “Request can't be processed.”               |
| [INJIMOB-3440](https://mosip.atlassian.net/browse/INJIMOB-3440) | Android – After activating VC via Health Portal QR code, error “There is no bound card available to verify.” |
| [INJIMOB-3439](https://mosip.atlassian.net/browse/INJIMOB-3439) | iOS – Initial screen does not appear after fresh install.                                                    |
| [INJIMOB-3438](https://mosip.atlassian.net/browse/INJIMOB-3438) | Unable to take a backup despite VC being downloaded.                                                         |
| [INJIMOB-3437](https://mosip.atlassian.net/browse/INJIMOB-3437) | iOS – App crashes after tapping OVP QR → declining consent → selecting “Yes, proceed.”                       |
| [INJIMOB-3435](https://mosip.atlassian.net/browse/INJIMOB-3435) | iOS – App crashes after tapping OVP QR and unlocking, showing “Oops, an error occurred.”                     |
| [INJIMOB-3434](https://mosip.atlassian.net/browse/INJIMOB-3434) | iOS – App crashes after tapping OVP QR and unlocking with error “Oops, an error occurred.”                   |
| [INJIMOB-3432](https://mosip.atlassian.net/browse/INJIMOB-3432) | iOS – App crashes after tapping OVP QR and clicking the “close” icon.                                        |
| [INJIMOB-3430](https://mosip.atlassian.net/browse/INJIMOB-3430) | iOS – App crashes after scanning OVP QR and clicking “Reject.”                                               |
| [INJIMOB-3429](https://mosip.atlassian.net/browse/INJIMOB-3429) | Exposed ngRok API URL not providing QR codes with latest mock-services.                                      |
| [INJIMOB-3428](https://mosip.atlassian.net/browse/INJIMOB-3428) | Unable to install applications from TestFlight.                                                              |
| [INJIMOB-3427](https://mosip.atlassian.net/browse/INJIMOB-3427) | Issuer list cached but not shown offline on second attempt.                                                  |
| [INJIMOB-3423](https://mosip.atlassian.net/browse/INJIMOB-3423) | During OVP Health VC sharing, response time has increased compared to earlier.                               |
| [INJIMOB-3422](https://mosip.atlassian.net/browse/INJIMOB-3422) | Inji Verify – Unable to download Sunbird VC; error screen shown.                                             |
| [INJIMOB-3414](https://mosip.atlassian.net/browse/INJIMOB-3414) | OpenIDVP – Error for unsupported key types.                                                                  |
| [INJIMOB-3413](https://mosip.atlassian.net/browse/INJIMOB-3413) | c\_nonce expected outside access token as per OpenIDVCI specification.                                       |
| [INJIMOB-3410](https://mosip.atlassian.net/browse/INJIMOB-3410) | After sharing MOSIP IDA VC, receiver device shows duplicate photos.                                          |
| [INJIMOB-3405](https://mosip.atlassian.net/browse/INJIMOB-3405) | Credential Offer – Missing space after full stop in message text.                                            |
| [INJIMOB-3403](https://mosip.atlassian.net/browse/INJIMOB-3403) | Credential Offer – iOS crash after initial VC download fails then retry with valid auth.                     |
| [INJIMOB-3402](https://mosip.atlassian.net/browse/INJIMOB-3402) | Credential Offer – Wrong redirect when retrying VC download after invalid OTP.                               |
| [INJIMOB-3401](https://mosip.atlassian.net/browse/INJIMOB-3401) | Credential Offer – Audit log not updated when app is reopened.                                               |
| [INJIMOB-3400](https://mosip.atlassian.net/browse/INJIMOB-3400) | Credential Offer – “Try Again” button not working on No Internet page.                                       |
| [INJIMOB-3398](https://mosip.atlassian.net/browse/INJIMOB-3398) | Credential Offer – Transaction Code UI misaligned; “Show More” option unnecessary.                           |
| [INJIMOB-3391](https://mosip.atlassian.net/browse/INJIMOB-3391) | New wallet nonce not created for each transaction.                                                           |
| [INJIMOB-3389](https://mosip.atlassian.net/browse/INJIMOB-3389) | VCI Client & OVP Library should be singleton in Wallet.                                                      |
| [INJIMOB-3370](https://mosip.atlassian.net/browse/INJIMOB-3370) | iOS – App crashes when consent is declined and user clicks “Yes, Proceed.”                                   |
| [INJIMOB-3316](https://mosip.atlassian.net/browse/INJIMOB-3316) | Unable to download Sunbird VC – “Something went wrong” screen.                                               |
| [INJIMOB-3314](https://mosip.atlassian.net/browse/INJIMOB-3314) | OVP – Only pre-registered scheme configured, but all schemes still working.                                  |
| [INJIMOB-3141](https://mosip.atlassian.net/browse/INJIMOB-3141) | OVP – Inconsistent error messages for invalid client\_id between Android and iOS.                            |
| [INJIMOB-3137](https://mosip.atlassian.net/browse/INJIMOB-3137) | OVP – Inconsistent error messages for invalid didDocumentUrl between Android and iOS.                        |
| [INJIMOB-3122](https://mosip.atlassian.net/browse/INJIMOB-3122) | OVP iOS – Requester name not displayed properly.                                                             |
| [INJIMOB-2900](https://mosip.atlassian.net/browse/INJIMOB-2900) | VP sharing not working even with valid response URI.                                                         |
| [INJIMOB-2018](https://mosip.atlassian.net/browse/INJIMOB-2018) | After VC download, green toaster confirmation not displayed on home screen.                                  |

### Documentation

* [Feature Documentation](https://docs.inji.io/inji-wallet/inji-mobile/overview/features)
* [Integration Guides](https://docs.inji.io/inji-wallet/inji-mobile/technical-overview/integration-guide)
* [User Guide](https://docs.inji.io/inji-wallet/inji-mobile/functional-overview/end-user-guide)
* [QA Report](test-report.md)
* [API Documentation](https://mosip.stoplight.io/docs/mimoto/k6907m3dzc1gi-mimoto)
