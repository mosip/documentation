# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of

* Functionality &#x20;
* Deployability&#x20;
* Configurability
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, Verification scope required comprehensive automation testing for all the MOSIP APIs. An automation Test Rig is created for the same.&#x20;

The Inji testing scope revolves around the following flows:

* Biometric unlock&#x20;
* Passcode unlock
* VC download via MOSIP
* VC download via esignet
* VC download via Sunbird
* Retriving UIN/ via AID
* Pinning  a VC
* Normal VC sharing with VID
* Deleting VC
* Face Auth on Resident's phone with VID
* Multi language support
* Credential registry
* Backup and restore
* Wallet binding
* QR code Login
* Logout&#x20;

## Test Approach <a href="#id-2et92p0" id="id-2et92p0"></a>

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.&#x20;

&#x20;

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.

* Functionality
* Deployability
* Configurability
* Customizability

The verification methods may differ based on how the need was addressed.&#x20;

For regression check, “MOSIP Test Rig” - an automation testing suite - which is indigenously designed and developed for supporting persona based testing. MOSIP Test Rig covers the end to end test execution and reporting. The end to end functional test scenarios are written starting from pre-registration, to creation of packet in registration center, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutation and combinations of cases being covered. MOSIP Test Rig will be an open source artifact which can also be enhanced and used by countries to validate the SI deliveries before going live. Persona classes include both negative and positive personas. Negative persona classes include users like Bribed Registration Office, Malicious Insider etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

## Verified configuration  <a href="#tyjcwt" id="tyjcwt"></a>

Verification is performed on various configurations as mentioned below

* Default configuration - with 3 Lang
* Virtual countries
  * 1 Lang configuration
  * 2 Lang configuration
  * Lang configuration

## Feature Health   <a href="#id-1t3h5sf" id="id-1t3h5sf"></a>

On Android Device:

<figure><img src="../../../../.gitbook/assets/Inji_Mobile_Releases_0.12.0_Test_Report_Feature_Health_On_Android.png" alt=""><figcaption></figcaption></figure>

On iOS Device:

<figure><img src="../../../../.gitbook/assets/Inji_Mobile_Releases_0.12.0_Test_Report_Feature_Health_On_IOS.png" alt=""><figcaption></figcaption></figure>

## Test execution statistics  <a href="#id-4d34og8" id="id-4d34og8"></a>

### Functional test results by modules <a href="#id-2s8eyo1" id="id-2s8eyo1"></a>

Below are the test metrics by performing functional testing using mock MDS and mock ABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

&#x20;

| Total                                | Passed | Failed | Skipped (N/A) |
| ------------------------------------ | ------ | ------ | ------------- |
| 2118                                 | 1975   | 103    | 40            |
| Test Rate: 98%  With Pass Rate : 95% |        |        |               |



Here is the detailed breakdown of metrics for each module:

&#x20;

|                                                              | Test cases |      |
| ------------------------------------------------------------ | ---------- | ---- |
| <p> </p><p> </p><p> </p><p>On Android Device</p>             | Total      | 1112 |
| Passed                                                       | 1005       |      |
| Failed                                                       | 81         |      |
| Skipped (N/A)                                                | 26         |      |
| <p> </p><p> </p><p> </p><p>On iOS Device</p><p> </p><p> </p> | Total      | 1006 |
| Passed                                                       | 970        |      |
| Failed                                                       | 22         |      |
| Skipped (N/A)                                                | 14         |      |



### External API verification results by modules <a href="#id-17dp8vu" id="id-17dp8vu"></a>

Below section provides details on API test metrics by executing MOSIP functional automation Framework. All external API test executions were performed at module level isolation. Each end point is tested with the test data and expectations of each test data are mapped to assert the test case.

&#x20;

| Total                                    | Passed | Failed | Skipped |
| ---------------------------------------- | ------ | ------ | ------- |
| 1436                                     | 1426   | 6      | 4       |
| Test Rate: 99.72% With Pass Rate: 99.30% |        |        |         |



&#x20;

Here is the detailed breakdown of metrics

&#x20;

|                                                  | Test cases |      |
| ------------------------------------------------ | ---------- | ---- |
| <p> </p><p> </p><p> </p><p>Mobile ID</p><p> </p> | Total      | 157  |
| Passed                                           | 157        |      |
| Failed                                           | 0          |      |
| Skipped                                          | 0          |      |
| <p> </p><p> </p><p>eSignet</p><p> </p>           | Total      | 1279 |
| Passed                                           | 1269       |      |
| Failed                                           | 6          |      |
| Skipped                                          | 4          |      |

&#x20;

### UI Automation results  <a href="#id-3rdcrjn" id="id-3rdcrjn"></a>

Below section provides details on Ui Automation by executing MOSIP functional automation Framework.

&#x20;

&#x20;

| Total                                  | Passed | Failed | Skipped |
| -------------------------------------- | ------ | ------ | ------- |
| 162                                    | 146    | 16     | 0       |
| Test Rate: 100% With Pass Rate: 90.12% |        |        |         |

&#x20;

Here is the detailed breakdown of metrics

&#x20;

|                                                | Test cases |    |
| ---------------------------------------------- | ---------- | -- |
| <p> </p><p> </p><p> </p><p>Android</p><p> </p> | Total      | 82 |
| Passed                                         | 75         |    |
| Failed                                         | 7          |    |
| Skipped                                        | 0          |    |
| <p> </p><p> </p><p>iOS</p><p> </p>             | Total      | 80 |
| Passed                                         | 71         |    |
| Failed                                         | 9          |    |
| Skipped                                        | 0          |    |

&#x20;

Functional and test rig code base branch which is used for the above metrics is:

Hash Tag:&#x20;

SHA: sha256:c2a71c11f19a6585e6cfd3ae8ab70130babb2077e27714f5fc225b986e7c14d0

### Testing with various device combinations  <a href="#id-26in1rg" id="id-26in1rg"></a>

Below are the test metrics by performing VC Sharing functionality on various device combinations&#x20;

<figure><img src="../../../../.gitbook/assets/Inji_Mobile_Releases_0.12.0_Test_Report_Feature_Health_Various_Device.png" alt=""><figcaption></figcaption></figure>

&#x20;

| Total                                 | Passed | Failed | Skipped |
| ------------------------------------- | ------ | ------ | ------- |
| 213                                   | 155    | 61     | 0       |
| Test Rate: 100% With Pass Rate: 72.8% |        |        |         |

&#x20;

### Detailed Test metrics <a href="#lnxbz9" id="lnxbz9"></a>

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

* The various metrics that assist in test tracking and efficiency are as follows:
* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

Github link for the xls file is [here](https://github.com/mosip/test-management/tree/master/inji/0.12.0).
