# Version 0.15.0

**Release Name**: Inji Verify v0.15.0

**Support**: Developer Release

**Release Date**: Coming Soon

 

## **Overview**

We are excited to announce the release of **Inji Verify v0.15.0.** This
version introduces **support for the SD-JWT format** across all existing
features including **QR code scanning, QR code upload, and Verifiable
Presentation (VP) verification** on both **same-device** and
**cross-device** modes.

### **New Features:**

1.  **Ability to verify SD-JWT VC using QR Code Scan feature:** Inji
    Verify now supports SD-JWT based Verifiable Credentials (VCs) which
    is an additional credential format built on the OpenID4VP and
    OpenID4VCI specifications.

2.  **Ability to verify SD-JWT VC using QR Code Upload feature:** Beyond
    live scanning, Inji Verify allows users to upload QR code images
    containing SD-JWT VCs directly to the portal.

3.  **Ability to create request and verify SD-JWT VC using VP
    Verification feature - Cross Device flow:** Inji Verify enables
    cross-device verification for SD-JWT--based VCs, allowing
    credentials to be securely shared between devices for instance, from
    a mobile wallet to a desktop verifier.

4.  **Ability to create request and verify SD-JWT VC using VP
    Verification feature - Same Device flow:** With support for the
    SD-JWT Same-Device Flow, Inji Verify allows both the verifier and
    the wallet to operate seamlessly on the same mobile device.

5.  **Ability to view the claims that were disclosed/ not disclosed for
    SD-JWT VC verification:** When verifying SD-JWT--based Verifiable
    Credentials (VCs), Inji Verify clearly indicates which claims were
    disclosed and which were withheld by the holder during the
    verification process.

6.  **Error Handling:** The portal provides robust error handling to
    guide users in case of VP Submission issues, with appropriate HTTP
    status codes indicating the type of error.

**Note:** The Inji Verify UI is a *reference implementation* to
demonstrate orchestration. Developers can selectively embed SDK
components in the verifier applications as per their needs.

## **Repositories: Released/Dependent**
| **Repository**   | **Tag (Released/Dependent)** |
|------------------|-----------------------------|
| Inji Verify      | **v0.15.0**                 |

 

## **Projects: Released**

**Inji Verify Repo** → 4 projects (all these projects are of same
version) as below:

i\) inji-verify-service - \<Insert Link Here\>

ii\) inji-verify-ui (ref implementation) - \<Insert Link Here\>

iii\) SDK - \<Insert Link Here\>

iv\) API-Test - \<Insert Link Here\>

 

## **Compatible modules:**

The following table outlines the tested and certified compatibility of
Inji Verify 0.10.0 with other modules.

  | **Module**              | **Version**                                                                                 |
  |-------------------------|--------------------------------------------------------------------------------------------|
  | Inji Wallet             | [0.20.0](https://github.com/mosip/inji-wallet/releases/tag/v0.20.0)                        |
  | Inji Web                | [0.14.0](https://github.com/mosip/inji-web/releases/tag/v0.14.1)                           |
  | Pixel-Pass library      | [0.7.0](https://github.com/mosip/pixelpass/releases/tag/v0.7.0)                            |
  | vc-verifier library     | [1.5.0](https://github.com/mosip/vc-verifier/releases/tag/v1.5.0)                          |

 

## **Bug Fixes**

Below is the list of fixes as part of the **0.15.0** release:

<https://mosip.atlassian.net/issues/?jql=project%3D%22Inji%20Verify%22%20and%20fixVersion%3D0.15.0%20and%20issuetype%3Dbug%20and%20status%3Dclosed>

## **User Stories**:

  | **Jira ID**                                                                 | **Description**                                                                                       |
  |-----------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
  | [INJIVER-1276](https://mosip.atlassian.net/browse/INJIVER-1276)             | Create test QR codes with SD-JWT format for testing, removing dependency on other modules.            |
  | [INJIVER-1243](https://mosip.atlassian.net/browse/INJIVER-1243)             | OpenID4VP - Same-Device Flow: Receive and display results of SD-JWT VP verification (testing).        |
  | [INJIVER-1241](https://mosip.atlassian.net/browse/INJIVER-1241)             | OpenID4VP - Cross Device Flow: Receive and display results of SD-JWT VP verification (testing).       |
  | [INJIVER-1239](https://mosip.atlassian.net/browse/INJIVER-1239)             | Upload and verify SD-JWT VC via QR code (testing).                                                    |
  | [INJIVER-1237](https://mosip.atlassian.net/browse/INJIVER-1237)             | Scan and verify SD-JWT VC QR code (testing).                                                          |
  | [INJIVER-1222](https://mosip.atlassian.net/browse/INJIVER-1222)             | OpenID4VP - Error Handling Scenarios (testing VP verification errors).                                |
  | [INJIVER-1311](https://mosip.atlassian.net/browse/INJIVER-1311)             | Error handling in /vp-result/{transactionId} API by sending non-200 status codes in response.         |

## **Known Issues**

Below is a list of some key known issues. For a detailed overview and
the complete list of issues related to Inji Verify, please click
[**[here.]{.underline}**](https://mosip.atlassian.net/issues/?jql=project%20%3D%20%22INJIVER%22%20AND%20status%20not%20in%20%28Closed%2C%20Canceled%29%20AND%20type%20%3D%20Bug%20ORDER%20BY%20created%20DESC)

  | **Jira ID**                                                                 | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
  |-----------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | [INJIVER-1061](https://mosip.atlassian.net/browse/INJIVER-1061)             | In OpenID4VP (Cross device) component, after scanning the health insurance QR code in the injiwallet app, it is displaying the life insurance VC.                                                                                                                                                                                                                                                                                                                                                                                                                        |
  | [INJIVER-1131](https://mosip.atlassian.net/browse/INJIVER-1131)             | The OpenID4VP (Cross device) component in Inji Verify currently validates a presentation as successful even when a wrong Verifiable Credential (VC) is submitted. As a temporary workaround, implement credential type validation on the Relaying Party (RP) side, by verifying that the received VC matches the expected type defined in the original presentation_definition.                                                                                                                                                |
  | [INJIVER-1062](https://mosip.atlassian.net/browse/INJIVER-1062)             | We are uploading an invalid QR code, and while it displays an error message stating that the QR code is invalid, the credential details are still visible.                                                                                                                                                                                                                                                                                                                                                                                                                |
  | [INJIVER-1063](https://mosip.atlassian.net/browse/INJIVER-1063)             | On iPhone 8 and iPhone 7, uploading the Injiweb QR code PDF shows an error message.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
  | [INJIVER-625](https://mosip.atlassian.net/browse/INJIVER-625)               | Inji Verify - Upload not functioning on Mac Safari Browser Versions 16 and below.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
  | [INJIVER-1220](https://mosip.atlassian.net/browse/INJIVER-1220)             | User friendly error message is not displayed for expired session scenario.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
  | [INJIVER-1194](https://mosip.atlassian.net/browse/INJIVER-1194)             | INJI Verify SDK should be able to support integration with applications built on platforms beyond *React (Typescript) applications*, such as Angular, PHP, and others.                                                                                                                                                                                                                                                                                                                                                            |
  | [INJIVER-1069](https://mosip.atlassian.net/browse/INJIVER-1069)             | The MOSIP UIN VCs generated via reg-client are currently not verifiable through INJI Verify.                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
  | [INJIVER-979](https://mosip.atlassian.net/browse/INJIVER-979)               | Long-polling listeners are implemented within the service layer, preventing the backend from scaling effectively in a multi-pod (distributed) environment.                                                                                                                                                                                                                                                                                                                                                                       |

## **Documentation**

- [Feature
  documentation](https://docs.inji.io/inji-verify/overview/features)

- [Integration
  Guide](https://docs.inji.io/inji-verify/technical-overview/integration-guides)

- [API Documentation](https://mosip.stoplight.io/studio/inji-verify)

- [Collab
  Guide](https://mosip.atlassian.net/wiki/spaces/PROD/pages/1306984580/Inji+Verify+Collab+Guide)

- QA Report