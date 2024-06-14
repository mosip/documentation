# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of&#x20;

* Functionality&#x20;
* Deployability&#x20;
* Configurability&#x20;
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, Verification scope required comprehensive automation testing for all the MOSIP APIs. An automation Test Rig is created for the same.&#x20;

The Resident Revamp testing scope revolves around the following flows:

* Update My Data
* Multilingual (English/Arabic/French)
* Resident UI End to End testing
* Regression Testing

## Test Approach <a href="#id-2et92p0" id="id-2et92p0"></a>

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.&#x20;

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.&#x20;

* Functionality
* Deployability
* Configurability
* Customizability

The verification methods may differ based on how the need was addressed.&#x20;

For regression check, “MOSIP Test Rig” - an automation testing suite - which is indigenously designed and developed for supporting persona based testing. MOSIP Test Rig covers the end to end test execution and reporting. The end to end functional test scenarios are written starting from pre-registration, to creation of packet in registration center, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutation and combinations of cases being covered. MOSIP Test Rig will be an open source artifact which can also be enhanced and used by countries to validate the SI deliveries before going live. Persona classes include both negative and positive personas. Negative persona classes include users like Bribed Registration Office, Malicious Insider etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

## Verified configuration  <a href="#tyjcwt" id="tyjcwt"></a>

Verification is performed on various configurations as mentioned below

* Default configuration - with 3 Lang (English/Arabic/French)



## Test execution statistics  <a href="#id-4d34og8" id="id-4d34og8"></a>

### Functional test results by modules <a href="#id-2s8eyo1" id="id-2s8eyo1"></a>

Below are the test metrics by performing functional testing using mock MDS and mock ABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

&#x20;

\*\*\*\*\*MANUAL VERIFICATION(UI+API)\*\*\*\*\*\*\*

&#x20;

| Total                                | Passed | Failed | Skipped (N/A) |
| ------------------------------------ | ------ | ------ | ------------- |
| 2255                                 | 2196   | 42     | 17            |
| Test Rate: 99%  With Pass Rate : 98% |        |        |               |



Note: NA - 17 Test Cases which are descoped scenarios/not developed feature

### External API verification results by modules <a href="#id-17dp8vu" id="id-17dp8vu"></a>

Below section provides details on API test metrics by executing MOSIP functional automation Framework. All external API test executions were performed at module level isolation. Each end point is tested with the test data and expectations of each test data are mapped to assert the test case.

&#x20;

| Total                                   | Passed | Failed | Skipped |
| --------------------------------------- | ------ | ------ | ------- |
| 1138                                    | 1123   | 10     | 5       |
| Test Rate: 99.5% With Pass Rate: 98.68% |        |        |         |



### UI Automation results  <a href="#id-3rdcrjn" id="id-3rdcrjn"></a>

Below section provides details on UI Automation by executing MOSIP functional automation Framework.



| Total                                | Passed | Failed | Skipped |
| ------------------------------------ | ------ | ------ | ------- |
| 33                                   | 33     | 0      | 0       |
| Test Rate: 100% With Pass Rate: 100% |        |        |         |

&#x20;

Functional and test rig code base branch which is used for the above metrics is:

Hash Tag:&#x20;

&#x20;

\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

mosipqa/automationtests@sha256:b4545fbd7647eacd4bc3040d9f89d7638bb385cdd9372cc90382534e0fb85c99

&#x20;

### Detailed Test metrics <a href="#lnxbz9" id="lnxbz9"></a>

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.&#x20;

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100



## Sonar Report&#x20;

&#x20;

<figure><img src="../../.gitbook/assets/rp-0.9.0-sonar-report.png" alt=""><figcaption></figcaption></figure>

Github link for the xls file [here](https://github.com/mosip/test-management/tree/master/Resident%20Revamp%201.2.0.1/0.9.0).
