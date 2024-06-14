# Test Report

### Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of the following:&#x20;

●     Functionality&#x20;

●     Deployability&#x20;

●     Configurability&#x20;

●     Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software are also assessed. This ensures the readiness of software for use in multiple countries.

The ARC (Android Reg-Cline) testing scope revolves around the following flows:

●     Login into ARC

●     Adding machine details

●     Consent page

●     Demographic details

●     Document upload

●     Biometric data

●     Preview screen

●     Authentication screen

●     Acknowledgement screen

●     Multilanguage support

●     Sync/upload/Auto upload packet

●     Operator Onboarding

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software, and thereby determines use cases/scenarios that the customers will execute. The persona's needs may be addressed through any of the following.

●     Functionality&#x20;

●     Deployability&#x20;

●     Configurability&#x20;

●     Customizability

The verification methods may differ based on how the need was addressed.

## Verified configuration

Verification is performed on various configurations as mentioned below

●     Default configuration - with 3 Lang (Eng, Fra and Ara)

## Feature Health

<figure><img src="../../.gitbook/assets/Picture1 (1).png" alt=""><figcaption></figcaption></figure>

## Test execution statistics

### Functional test results by modules

Below are the test metrics by performing functional testing using mock SBI and mock ABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. The functional test was performed in combination with individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included the simulation of multiple identity schema and respective UI schema configurations.

<table><thead><tr><th width="332">Total</th><th>Passed</th><th>Failed</th><th>Skipped (N/A)</th></tr></thead><tbody><tr><td>453</td><td>322</td><td>67</td><td>64</td></tr><tr><td>Test Rate: 85% With Pass Rate: 82%</td><td></td><td></td><td></td></tr></tbody></table>

**UI Automation Reports:**

| Total | Passed | Failed | Skipped (N/A) |
| ----- | ------ | ------ | ------------- |
| 8     | 7      | 1      | 0             |

**Hash Tag:** ca4c66bce6767ce995c78893a61a34fd154f7de1

### Detailed Test metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking, and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

●   Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100

●    Failed Test Case Coverage: It measures the percentage of all failed test cases. (Number of failed tests / Total number of test cases executed) x 100

Github link for the xls file [here](https://github.com/mosip/test-management/tree/master/ARC).
