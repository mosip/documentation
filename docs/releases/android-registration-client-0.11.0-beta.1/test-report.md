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

●     Default configuration - with 1 Language (English)

## Feature Health

<figure><img src="../../.gitbook/assets/feature_health.png" alt=""><figcaption><p>Feature Health</p></figcaption></figure>

## Test execution statistics

### Functional test results by modules

Below are the test metrics by performing functional testing using mock SBI and mock ABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. The functional test was performed using individual modules and integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included the simulation of numerous identity schema and respective UI schema configurations.

<table><thead><tr><th width="332">Total</th><th>Passed</th><th>Failed</th><th>Skipped (N/A)</th></tr></thead><tbody><tr><td>511</td><td>373</td><td>138</td><td>0</td></tr></tbody></table>

**Test Rate:** 100% With **Pass Rate:** 72%

**UI Automation Reports:**

<table><thead><tr><th width="342">Total</th><th>Passed</th><th>Failed</th><th>Skipped (N/A)</th></tr></thead><tbody><tr><td>6</td><td>6</td><td>0</td><td>0</td></tr></tbody></table>

**Test Rate:** 100% With **Pass Rate:** 100%

**Git Commit ID:** 8eac450ed9e0ba479199cd50f7c21d97c602b508

**Client Version:** 1.2.0.1-B1

### Detailed Test metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, execution coverage, test tracking, and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

●  Passed Test Cases Coverage: This measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100

●  Failed Test Case Coverage: This measures the percentage of all failed test cases. (Number of failed tests / Total number of test cases executed) x 100

The Github link for the xls file can be found [here.](https://github.com/mosip/test-management/tree/master/ARC/ARC%200.11.0-beta.1)
