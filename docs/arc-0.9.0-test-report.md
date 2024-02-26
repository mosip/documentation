# Test Report

## Scope of Testing

The scope of testing encompasses the verification of adherence to specifications in terms of:

* Functionality
* Deployability
* Configurability
* Customizability

Verification is conducted not only from the perspective of end users, but also taking into consideration the needs of System Integrators (SI). This includes assessing the Configurability and Extensibility of the software to ensure its suitability for use in various countries.

The testing focus of Android Registration Client includes the following processes:

* Logging into ARC
* Adding machine details
* Consent page verification
* Demographic data input
* Document upload assessment
* Biometric data verification
* Preview screen evaluation
* Authentication screen testing
* Acknowledgement screen review
* Multi-language support analysis
* Syncing/ uploading/ Auto-uploading packets testing.

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.

* Functionality
* Deployability
* Configurability
* Customizability

The verification methods may differ based on how the need was addressed.

## Verified configuration

Verification is performed on various configurations as mentioned below:

* Default configuration - with 2 Languages (Eng, Fra)

## Feature Health

<figure><img src=".gitbook/assets/ARC Feature Health.png" alt=""><figcaption></figcaption></figure>

## Test execution statistics

#### Functional test results by modules

Below are the test metrics by performing functional testing using mockSBI and mockABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

| **Total** | **Passed** | **Failed** | **Skipped** |
| --------- | ---------- | ---------- | ----------- |
| 386     | 206       | 138      | 42          |

**Test Rate: 89%** with **Pass Rate: 59%**

Hash Tag: 19ae6cff54715a2a82011134c6678424620217fa

#### Detailed Test metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

Github link for the xls file [here](https://github.com/mosip/test-management/tree/master/ARC).
