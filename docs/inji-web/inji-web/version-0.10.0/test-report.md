# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of

* Functionality
* Deployability
* Configurability
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures the readiness of software for use in multiple countries. MOSIP is an “API First” product platform.

Testing scope has been focused on the below features:

* Authenticate user credentials
* Credential type
* Download VC
* Durian data storage integration
* Error Handling
* Inji Home page
* Issuer selection in the “Home Page”
* Issuers support
* Latest draft changes support for OpenID4VCI
* Multi languages support
* OpenID4VP Implementation
* PDF and CBOR
* PDF Generation and auto download
* PDF View
* QR Code
* Responsive view of the web
* Retrieve credential types
* Retrieve issuers list
* Search bar functionality
* Success/Failure notifier after downloading the VC PDF
* Theme update
* UI Automation
* Access violations

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.

* Functionality
* Deploy ability
* Configurability
* Customizability

The verification methods may differ based on how the need was addressed.

## Verified configuration

Verification is performed on various configurations as mentioned below

* Default configuration - with 6 Lang
  * English
  * French
  * Arabic
  * Hindi
  * Tamil
  * Kannada

## Feature Health

<figure><img src="../../../.gitbook/assets/inji_web_0.10.0_test_report_feature_health_1.png" alt=""><figcaption></figcaption></figure>

## Test execution statistics

### Functional test results

Below are the test metrics by performing functional testing. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

<table data-header-hidden><thead><tr><th width="252"></th><th></th><th></th><th></th></tr></thead><tbody><tr><td><strong>Total</strong></td><td><strong>Passed</strong></td><td><strong>Failed</strong></td><td><strong>Skipped</strong></td></tr><tr><td>251</td><td>215</td><td>36</td><td>0</td></tr><tr><td>Test Rate: 100%, With Pass Rate: 85%</td><td></td><td></td><td></td></tr></tbody></table>

Here is the detailed breakdown of metrics for each module:

|                          |         | **Test cases** |
| ------------------------ | ------- | -------------- |
| INJI Web UI Verification | Total   | 277            |
|                          | Passed  | 215            |
|                          | Failed  | 36             |
|                          | Skipped | 0              |

### UI Automation and API Test Rig test results

Below are the test metrics by performing UI Automation and API Test rig.

<table data-header-hidden><thead><tr><th width="231"></th><th width="208"></th><th></th><th></th></tr></thead><tbody><tr><td><strong>Total</strong></td><td><strong>Passed</strong></td><td><strong>Failed</strong></td><td><strong>Skipped</strong></td></tr><tr><td>161</td><td>140</td><td>13</td><td>8</td></tr><tr><td>Test Rate: 95%, With Pass Rate: 91%</td><td></td><td></td><td></td></tr></tbody></table>

Here is the detailed breakdown of metrics for each module:

|                        |         | **Test cases** |
| ---------------------- | ------- | -------------- |
| INJI Web UI Automation | Total   | 18             |
|                        | Passed  | 18             |
|                        | Failed  | 0              |
|                        | Skipped | 0              |
| INJI Web API Test Rig  | Total   | 143            |
|                        | Passed  | 122            |
|                        | Failed  | 13             |
|                        | Skipped | 8              |

Functional and test rig code base branch which is used for the above metrics is:

Hash Tag: fb520bf4f80eeca4e624bd434c4d05c65b84439f

### Detailed Test metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

Git hub link for the xls file:

\<TBD>
