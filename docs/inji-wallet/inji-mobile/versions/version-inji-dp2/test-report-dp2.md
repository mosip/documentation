# Test Report

## Scope

The scope of testing is to verify fitment to the specification from the perspective of:

* Functionality
* Deployability
* Configurability
* Customizability

Verification is performed not only from the end-user perspective but also from the System Integrator (SI) point of view. Hence, the configurability and extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, verification scope required comprehensive automation testing for all the MOSIP APIs. An automation Test Rig is created for the same.

The `Inji Wallet` testing scope revolves around the following flows:

* Biometric unlock
* Passcode unlock
* VC download via MOSIP
* VC download via eSignet
* Retrieving UIN/VID via AID
* Pinning a VC
* Normal VC sharing with VID
* Deleting VC
* Face Auth on Resident's phone with VID
* Multi language support
* Wallet binding
* QR code Login
* Logout

## Test approach

Persona based approach has been adopted to perform the IV\&V(Independent Verification and Validation) by simulating the test scenarios that resemble a real-time implementation.

A Persona is a fictional character/ user profile created to represent a user type that might use a product/ or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/ scenarios that the customers will execute. The persona needs may be addressed through any of the following:

* Functionality
* Deployability
* Configurability
* Customizability

The verification methods may differ based on how the need was addressed.

For regression check, `MOSIP Test Rig`, an automation testing suite is indigenously designed and developed for supporting persona based testing. MOSIP Test Rig covers the end-to-end test execution and reporting. The end-to-end functional test scenarios are written starting from pre-registration, to creation of packet in registration center, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutation and combinations of cases being covered. MOSIP Test Rig will be an open source artifact which can also be enhanced and used by countries to validate the SI deliveries before going live. Persona classes include both negative and positive personas. Negative persona classes include users like Bribed Registration Office, Malicious Insider etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

## Verified configuration

Verification is performed on various configurations as mentioned below:

* Default configuration - with 3 languages
* Virtual countries
  * 1 Lang configuration
  * 2 Lang configuration
  * 3 Lang configuration

## Feature health

<figure><img src="../../../../.gitbook/assets/image (72).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/image (73).png" alt=""><figcaption></figcaption></figure>

## Test execution statistics

### Functional test results

Below are the test metrics for Inji Wallet by performing functional testing using `mockMDS` and `mockABIS`. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared inline with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

| **Total** | **Passed** | **Failed** | **Skipped** |
| --------- | ---------- | ---------- | ----------- |
| 1394      | 1166       | 176        | 52          |

**Test Rate: 96%** with **Pass Rate: 86%**

Here is the detailed breakdown of metrics:

#### On Android Device

* Total Test cases: 733
  * Passed: 625
  * Failed: 76
  * Skipped: 32

#### On iOS Device

* Total Test cases: 661
  * Passed: 541
  * Failed: 100
  * Skipped: 20

### External API verification results by modules

Below section provides details on API test metrics by executing MOSIP functional automation Framework. All external API test executions were performed at module level isolation. Each endpoint is tested with the test data and expectations of each test data are mapped to assert the test case.

| **Total** | **Passed** | **Failed** | **Skipped** |
| --------- | ---------- | ---------- | ----------- |
| 1268      | 1247       | 17         | 4           |

**Test Rate:** 100% with **Pass Rate:** 98.34%

Here is the detailed breakdown of metrics:

#### Inji Wallet

| **Total** | **Passed** | **Failed** | **Skipped** |
| --------- | ---------- | ---------- | ----------- |
| 154       | 152        | 2          | 0           |

#### eSignet

| **Total** | **Passed** | **Failed** | **Skipped** |
| --------- | ---------- | ---------- | ----------- |
| 1114      | 1095       | 15         | 4           |

**Note**:

Functional and test rig code base branch which is used for the above metrics is:

**Commit Sha**: 6641489c9ea2129daaf6989c7e6d73bae528a4c0

### UI Verification results by modules

Below section provides details on UI test metrics by executing MOSIP UI Automation Framework. Test executions were performed at module level isolation. Each end point is tested with the test data and expectations of each test data are mapped to assert the test case.

| **Total** | **Passed** | **Failed** | **Skipped** |
| --------- | ---------- | ---------- | ----------- |
| 102       | 61         | 41         | 0           |

Here is the detailed breakdown of metrics:

#### Android

| **Total** | **Passed** | **Failed** | **Skipped** |
| --------- | ---------- | ---------- | ----------- |
| 52        | 36         | 16         | 0           |

#### iOS

| **Total** | **Passed** | **Failed** | **Skipped** |
| --------- | ---------- | ---------- | ----------- |
| 50        | 25         | 25         | 0           |

### Testing with various device combinations

Below are the test metrics by performing VC Sharing functionality on various device combinations.

<figure><img src="../../../../.gitbook/assets/image (71).png" alt=""><figcaption></figcaption></figure>

| **Total** | **Passed** | **Failed** | **Skipped** |
| --------- | ---------- | ---------- | ----------- |
| 152       | 152        | 0          | 0           |

**Test Rate: 100%** with **Pass Rate: 100%**

### Detailed Test Metrics

Below are the detailed test metrics by performing manual/ automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

Link for the [detailed test report](https://github.com/mosip/test-management/tree/master/inji/0.10.0).
