# Version 0.14.0

Release Version: v0.14.0

**Release Type:** Developer Release

**Release Date:** _<mark style="color:$danger;">**Coming Soon**</mark>!_

#### Overview

Inji Certify v0.14.0 introduces key enhancements to credential issuance workflows, interoperability, and user experience. This release focuses on strengthening OpenID4VCI flows, expanding support for emerging credential formats, and improving system usability and integration capabilities.

Major updates include support for presentation during issuance, mDoc/mDL credentials, Pre-Authorized Code flow, enhanced error handling, QR code embedding in credentials, and seamless integration with MOSIP for data-driven credential generation.

#### Major Highlights / Features

* **Presentation during Issuance**
  Introduced a new issuance mode enabling residents to present an existing Verifiable Credential to obtain another credential.
* **Pre-Authorized Code Flow**
  Enabled a simplified issuance flow where users can securely download credentials using a pre-authorized and transaction code.
* **Support for Issuance in mDoc/mDL Format**
  Added support for issuing Verifiable Credentials in standardized mDoc/mDL formats.
* **Error Message Revamp**
  Improved the error handling framework with clearer, more structured, and developer-friendly messages.
* **MOSIP Identity Plugin Integration**
  Integrated with MOSIP APIs to fetch identity data and generate Verifiable Credentials within Certify.
* **Embedding Data in QR Code for VC Issuance**
  Enabled Claim 169 compliant data embedding within QR codes for secure credential download and verification.

<!-- Instead of this line we can add separate link.
    **Learn more about all features:** _Click here to explore the detailed feature documentation._

-->

#### User Stories Released

| **Feature**                                     | **Description**                                                                                           | **JIRA**                                                          |
| ----------------------------------------------- | --------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| Pre Authorized Code Flow                        | Enables credential issuance without login using a pre-authorized code.                                    | [INJICERT-976](https://mosip.atlassian.net/browse/INJICERT-976)   |
| Support for mDoc VC Format                      | Issuing VC in mDoc/mDL format                                                                             | [INJICERT-981](https://mosip.atlassian.net/browse/INJICERT-981)   |
| Presentation During Issuance                    | Enables credential issuance by requiring the user to present an existing Verifiable Credential as proofs. | [INJICERT-990](https://mosip.atlassian.net/browse/INJICERT-990)   |
| Issuance of Verifiable Credentials with QR code | Issuing VC with QR code in compliant of claim 169 specification                                           | [INJICERT-1223](https://mosip.atlassian.net/browse/INJICERT-1223) |
| Enhance Error Message                           | Improve Error Message Handling for System Integration and Automation                                      | [INJICERT-1257](https://mosip.atlassian.net/browse/INJICERT-1257) |
| Enable certify to Issue MOSIP UIN as VC         | Enable certify to convert and issue MOSIP UIN as verifiable credentials                                   | [INJICERT-1295](https://mosip.atlassian.net/browse/INJICERT-1295) |

#### Bug Fixes

| **JIRA**                                                          | **Description**                                                                                                   |
| ----------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| [INJICERT-1275](https://mosip.atlassian.net/browse/INJICERT-1275) | Getting 401 error when /issuance/credential API is hit pointing to esignet-1.7.0V                                 |
| [INJICERT-1282](https://mosip.atlassian.net/browse/INJICERT-1282) | Remove claims validation for mDoc request as claims are optional                                                  |
| [INJICERT-1297](https://mosip.atlassian.net/browse/INJICERT-1297) | Issuer and verification method value is pointing to mosip repo instead of inji in status list credential response |
| [INJICERT-1110](https://mosip.atlassian.net/browse/INJICERT-1110) | Error message should be user friendly when invalid request is passed - add credential config API                  |
| [INJICERT-1098](https://mosip.atlassian.net/browse/INJICERT-1098) | Error code and error messages to be different                                                                     |
| [INJICERT-1075](https://mosip.atlassian.net/browse/INJICERT-1075) | VC fetch with VID is failing in Mosipid Usecase                                                                   |
| [INJICERT-852](https://mosip.atlassian.net/browse/INJICERT-852)   | Error message is not proper when render template id is mismatch in DB and config                                  |
| [INJICERT-840](https://mosip.atlassian.net/browse/INJICERT-840)   | Error messages are not user friendly when \{{url\}}/issuance/credential API is executed without context value     |
| [INJICERT-819](https://mosip.atlassian.net/browse/INJICERT-819)   | Error message is not proper for sunbird and Mosipid use case with 2.0 model context                               |
| [INJICERT-681](https://mosip.atlassian.net/browse/INJICERT-681)   | Error messages difference in few scenarios in Sunbird and MOCK Use cases                                          |
|                                                                   |                                                                                                                   |

### Known Issues

Below is the list of known issues related to the release v0.13.0. To access all known issues related to Inji Certify please click [**here**](https://mosip.atlassian.net/issues/INJICERT-852?filter=11419\&jql=project%20%3D%20%22Inji%20Certify%22%20AND%20issuetype%20%3D%20Bug%20%20AND%20labels%20not%20in%20%28API_Automation%2C%20AWSdevicefarm%2C%20device_specific%2C%20qa-inji-UI-auto%29%20%20and%20status%20NOT%20IN%20%28Closed%2C%20Fixed%2C%20Canceled%2CCancelled%29%20%20ORDER%20BY%20created%20DESC%2C%20updated%20DESC)

| **JIRA**                                                          | **Description**                                                                            |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| [INJICERT-1319](https://mosip.atlassian.net/browse/INJICERT-1319) | Error messages mismatch in mdoc-mdl usecase(PDI)                                           |
| [INJICERT-1290](https://mosip.atlassian.net/browse/INJICERT-1290) | CSR Certificate Upload via Automation Causes DID kid Mismatch and VC Verification Failures |
| [INJICERT-1265](https://mosip.atlassian.net/browse/INJICERT-1265) | Upload ca cert for ecck1 signalgo is failing                                               |
| [INJICERT-1260](https://mosip.atlassian.net/browse/INJICERT-1260) | Improper Validation in Status Update Endpoints                                             |
| [INJICERT-1324](https://mosip.atlassian.net/browse/INJICERT-1324) | Generate token API is failing with unkown\_error                                           |

### Repository Released

| **Repositories**          | **Tags** |
| ------------------------- | -------- |
| inji-certify              | v0.14.0  |
| inji-config               | v0.14.0  |
| keymanager                | v1.4.0   |
| digital-credential-plugin | v0.6.0   |
| mosip-functional-tests    |          |

### Compatible Modules

| **Modules**           | **Version**                                                                     |
| --------------------- | ------------------------------------------------------------------------------- |
| eSignet               | 1.6.2                                                                           |
| IDA                   | 1.3.0                                                                           |
| pixelpass             | 0.8.0                                                                           |
| Sunbird C             | [v2.0.0](https://github.com/Sunbird-RC/sunbird-rc-core/releases/tag/v2.0.0-rc3) |
| esignet-mock-services | [v0.11.2](https://github.com/mosip/esignet-mock-services/tree/v0.11.2)          |
| commons               | [1.3.0](https://github.com/mosip/commons/tree/v1.3.0)                           |
| mimoto                | [0.20.0](https://github.com/inji/mimoto/releases)                               |
| inji-web              | [0.15.0](https://github.com/inji/inji-web/releases/tag/v0.15.0)                 |

### Documentation

* [Feature Documentation]
* [Local Setup]
* [API Documentation]
* [Test Report]