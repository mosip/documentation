# Test Report

## Scope

The scope of testing is to verify fitment to the specification from the perspective of:

* Functionality  
* Deployability  
* Configurability  
* Customizability

Verification is performed not only from the end-user perspective but also from the System Integrator (SI) point of view. Hence, the configurability and extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, verification scope required comprehensive automation testing for all the MOSIP APIs. An automation Test Rig is created for the same. 

The `Inji` testing scope revolves around the following flows:

* Biometric Unlock
* Passcode Unlock
* VC download with VID
* Renaming VC / Edit tag for VID
* Normal VC sharing with VID
* Online and Offine mode sharing
* Face Auth on Resident's phone with VID
* Multi language support
* Wallet binding
* QR code Login

## Feature health

![](\_images/inji-test-report1.png)  ![](\_images/inji-test-report2.png)


## Test execution statistics 

### Functional test results

Below are the test metrics for Inji by performing functional testing using `mockMDS` and `mockABIS`. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared inline with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.


| **Total**     | **Passed**   |  **Failed**    | **Skipped**   |
|---------------|--------------|----------------|---------------|
|     359       |   319        |        40      |    0         |

**Test Rate: 100%**  with **Pass Rate : 88%**

Here is the detailed breakdown of metrics:

#### On Android Device

* Total Test cases: 185
  * Passed: 177
  * Failed: 8
  * Skipped: 0

#### On iOS Device

* Total Test cases: 174
  * Passed: 142
  * Failed: 32
  * Skipped: 0


### External API verification results for Inji

Below section provides details on API test metrics by executing MOSIP functional automation Framework. The external API test executions were performed at module level isolation. Each end point is tested with the test data and expectations of each test data are mapped to assert the test case.

| **Total**  | **Passed** |  **Failed** | **Skipped** |
|------------|------------|-------------|-------------|
|     37     |    36      |     1       |    0        |

**Test Rate: 100%**  with **Pass Rate : 97%**

### Testing End-to-end flow(s) 

End-to-end flows are a set of stateful test cases that expects the results across multiple modules. The test does not cover the intermediary stages, rather concentrates on the end result for a given data. The test covers both negative scenarios and positive scenarios with real world scenarios. Below are the end-to-end scenarios test metrics by executing MOSIP Automation Framework.

| **Total**  | **Passed** |  **Failed** | **Skipped** |
|------------|------------|-------------|-------------|
|     84    |    63   |     21      |    0        |

**Test Rate:** 100% with **Pass Rate:** 75%

### Testing with various device combinations 

Below are the test metrics by performing VC Sharing functionality on various device combinations.

![](\_images/inji-device-metrics.png)


| **Total**  | **Passed** |  **Failed** | **Skipped** |
|------------|------------|-------------|-------------|
|     192    |    160     |     32      |    0        |

**Test Rate: 100%**  with **Pass Rate : 83%**


### Detailed Test metrics

Below are the detailed test metrics by performing manual/ automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency. 

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100

* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

 Link for the xls file:

