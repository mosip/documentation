# Resident Services v1.3.2



**Release Version:** Resident Services v1.3.2

**Release Type:** Patch Release

**Release Date:** 28th September, 2026

### Overview

Patch release of Resident Services v1.3.2 focuses on improving automation reliability and expanding API test coverage. This release resolves an issue with OTP handling in the automation scripts when SMTP is used for OTP delivery, ensuring more reliable execution of automated test flows.

As part of the release, **43 additional test cases have been automated and added to the Resident Services API test suite**, strengthening automated validation and improving overall test coverage for the service.

### Major Highlights/ Features

* **Fixed OTP Handling in API Test Rig:** Resolved an issue where the test rig was retrieving an incorrect OTP from SMTP, causing OTP-based test cases to fail with an "OTP is invalid" error.
* **Expanded API Test Automation:** Added **43 new automated test scenarios** to the Resident Services API test suite, improving test coverage and reducing manual testing effort.
* **Enhanced PDF Download Testing:** Improved the PDF download flow with password-aware handling, content extraction, and request-key support for identity-related test cases.
* **Expanded SendOTP Negative Test Coverage:** Added **five new negative test scenarios** for the SendOTP API, covering invalid UINs, invalid VIDs, and valid identifiers that are not found in the database.
* **Added Single Test Case Execution:** Enhanced test execution flexibility by enabling users to run an individual test case without executing the entire test suite.

### Bugs Fixed

Below is the list of bug fixes included as part of the Resident Services v1.3.2 release:

| Bug ID                                                        | Description                                                     |
| ------------------------------------------------------------- | --------------------------------------------------------------- |
| [MOSIP-43061](https://mosip.atlassian.net/browse/MOSIP-43061) | API Test Rig multiple failure due to invalid OTP read from SMTP |

### Stories Released

| Story/Task ID                                                 | Description                                                          |
| ------------------------------------------------------------- | -------------------------------------------------------------------- |
| [MOSIP-45065](https://mosip.atlassian.net/browse/MOSIP-45065) | Resident - Automate the not automated testcase from the master sheet |

### Known Issues

To view the list of known issues, refer [here](https://github.com/mosip/resident-services/issues?q=is%3Aissue+state%3Aopen+label%3Abug+OR+type%3A+bug)

| Issue                                                                | Description                                                                                                              |
| -------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------ |
| [issue-1657](https://github.com/mosip/resident-services/issues/1657) | Credential download fails with RES-SER-509 once status moves past STORED, even though datashare URL is already available |
| [issue-1661](https://github.com/mosip/resident-services/issues/1661) | Unable to diagnose OTP failures — /req/otp returns HTTP 200 with raw IDA error codes and records a false success audit   |

#### **Repository Released**

| Repository        | Tag                                                                      |
| ----------------- | ------------------------------------------------------------------------ |
| resident-services | [v1.3.2](https://github.com/mosip/resident-services/releases/tag/v1.3.2) |

#### Compatible Platform/Module

The following table outlines the tested and certified compatibility of Android Registration Client v1.1.0 with other modules.

| Platform/Module | Version                                                |
| --------------- | ------------------------------------------------------ |
| MOSIP           | 1.2.1.1                                                |
| eSignet         | [v1.4.1](https://github.com/mosip/esignet/tree/v1.4.1) |

### **Documentation**

* [Documentation for Resident Service API Test Rig](https://github.com/mosip/resident-services/tree/release-1.2.1.x/api-test#readme)



