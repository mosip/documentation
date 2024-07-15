# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of&#x20;

●     Functionality&#x20;

●     Deployability&#x20;

●     Configurability&#x20;

●     Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence, the Configurability and Extensibility of the software is also assessed. This ensures the readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, the Verification scope required comprehensive automation testing for all the MOSIP APIs. An automated Test Rig is created for the same.

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software, and thereby determines use cases/scenarios that the customers will execute. The persona's needs may be addressed through any of the following.

●     Functionality&#x20;

●     Deployability&#x20;

●     Configurability&#x20;

●     Customizability

The verification methods may differ based on how the need was addressed.

For regression check, “MOSIP Test Rig” - an automation testing suite - is indigenously designed and developed for supporting persona based testing. MOSIP Test Rig covers the end to end test execution and reporting. The end to end functional test scenarios are written starting from pre-registration, to the creation of the packet in the registration center, processing the packet through the registration process, generating UIN, and authenticating identity using IDA through various permutations and combinations of cases being covered. MOSIP Test Rig will be an open source artifact that can also be enhanced and used by countries to validate the SI deliveries before going live. Persona classes include both negative and positive personas. Negative persona classes include users like Bribed Registration Office, Malicious Insider, etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

## Verified Configuration <a href="#heading-h.tyjcwt" id="heading-h.tyjcwt"></a>

Verification is performed on various configurations as mentioned below

&#x20;    ●  Default configuration - with 7 Lang (English/Khmer/Hindi/Kannada/Tamil/Arabic/French).

## Main Features Tested:

* Signup Portal
* Login with Password
* Forgot Password
* Login with OTP
* SubirdRC Integration (Using Inji App)
* SubirdRC Integration (Using InjiWeb)

## Feature Health

<figure><img src="../../.gitbook/assets/Feature Health - eSignet.png" alt=""><figcaption><p>Feature Health</p></figcaption></figure>

## Test Execution Statistics

### Functional Test Results <a href="#heading-h.x3l4xp1n67g2" id="heading-h.x3l4xp1n67g2"></a>

Below are the test metrics by performing functional testing using mock MDS, mock Auth, and mock ABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. The functional test was performed in combination with individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included the simulation of multiple identity schema and respective UI schema configurations.

| Total | Passed        | Failed | Skipped |
| ----- | ------------- | ------ | ------- |
| 2265  | 2191          | 59     | 15      |

**Test Rate:** 99% with **Pass rate:** 97%

Here is the detailed breakdown:

1. **API Based Testing - eSignet**

**Total Test Cases:** 1601

* Passed - 1555
* Failed - 44
* Skipped - 2

2. **UI Based Testing**

**Total Test Cases:** 664

* Passed - 636
* Failed - 15
* Skipped - 13

### API Testrig Results for eSignet and Mimoto:

#### **API Based Testrig - eSignet**

**Total Test Cases:** 1116

* Passed - 1111
* Failed - 3
* Skipped - 2

{% hint style="info" %}
**Note:** In API Based testing, 2 test cases are marked as skipped as they were not automated.

In UI Based testing, 13 test cases are marked as skipped as they were enhancement test cases.
{% endhint %}

### Detailed Test Metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking, and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

● Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100.

● Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100.

### Sonar Report:

#### eSignet:

<figure><img src="../../.gitbook/assets/eSignet sonar.png" alt=""><figcaption><p>eSignet Sonar Report</p></figcaption></figure>

#### &#x20;eSignet Signup Repo:

<figure><img src="../../.gitbook/assets/eSignet signup repo.png" alt=""><figcaption><p>eSignet Signup Repo</p></figcaption></figure>

&#x20;
