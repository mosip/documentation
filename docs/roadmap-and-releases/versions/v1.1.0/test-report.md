# Test Report

## Scope

The scope of testing is to verify fitment to the specification from the perspective of:

* Functionality
* Deployability
* Configurability
* Customizability

Verification is performed not only from the end-user perspective but also from the System Integrator (SI) point of view. Hence, the configureability and extensibility of the software are also assessed. This ensures the readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, the verification scope required comprehensive automation testing for all the MOSIP APIs. An automated Test Rig is created for the same.

The key feature tested as a part of this release is the **Consent Registry** (without signature).

## Test approach

The persona-based approach has been adopted to perform the IV\&V(Independent Verification and Validation) by simulating the test scenarios that resemble a real-time implementation.

A Persona is a fictional character/ user profile created to represent a user type that might use a product/ or a service in a similar way. Persona-based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/ scenarios that the customers will execute. The persona's needs may be addressed through any of the following:

* Functionality
* Deployability
* Configure-ability
* Customize-ability

The verification methods may differ based on how the need was addressed.

For regression check, "MOSIP Test Rig", an automation testing suite is indigenously designed and developed for supporting persona-based testing. MOSIP Test Rig covers end-to-end test execution and reporting. The end-to-end functional test scenarios are written starting from pre-registration, to the creation of the packet in the registration centre, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutations and combinations of cases being covered.

MOSIP Test Rig will be an open-source artifact which can also be enhanced and used by countries to validate the SI deliveries before going live. Persona classes include both negative and positive personas. Negative persona classes include users like Bribed Registration Office, Malicious Insider etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

## Verified configuration

Verification is performed on various configurations as mentioned below:

* Default configuration - with 3 Lang (English/ Arabic /French)

## Feature health

![](../../../versions/v1.1.0/test-report/_images/feature-health.png)

## Functional test results for eSignet

Below are the test metrics obtained by performing functional testing for eSignet using mockMDS, mockAuth and mockABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test.

The functional test was performed in combination with individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, and end-to-end flows across multiple languages and configurations. The testing cycle included the simulation of multiple identity schema and respective UI schema configurations.

| **Total** | **Passed** | **Failed** | **Skipped** |
| --------- | ---------- | ---------- | ----------- |
| 952       | 879        | 55         | 18          |

**Test Rate: 98%** with **Pass Rate: 94%**

Here is the detailed breakdown of metrics for eSignet:

#### API based testing

* Total Test cases: 707
  * Passed: 651
  * Failed: 41
  * Skipped: 15

In API-based testing, 15 test cases are marked as skipped as they were not automated.

#### UI based testing

* Total Test cases: 245
  * Passed: 228
  * Failed: 14
  * Skipped: 3

## External API verification results for eSignet

The below section provides details on API test metrics for eSignet by executing the MOSIP functional automation Framework. The external API test executions were performed at module-level isolation. Each endpoint is tested with the test data and expectations of each test data are mapped to assert the test case.

| **Total** | **Passed** | **Failed** | **Skipped** |
| --------- | ---------- | ---------- | ----------- |
| 823       | 809        | 14         | 0           |

**Test Rate: 100%** with **Pass Rate: 98%**

### Detailed test metrics

Below are the detailed test metrics by performing manual/ automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

Link for the [detailed test report](https://github.com/mosip/test-management/tree/master/e-signet).

### Sonar Report

![](../../../versions/v1.1.0/test-report/_images/sonar.png)
