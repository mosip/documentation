# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of &#x20;

* Functionality&#x20;
* Deploy ability
* Configurability
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures the readiness of software for use in multiple countries. MOSIP is an “API First” product platform.

Testing scope has been focused on the below features:

* Inji Web Home page
* Issuer selection in the “Home Page”
* Issuers support
* Localization support
* Login fail error message
* Motor Insurance credential
* Multi languages support
* PDF Generation and auto download
* PDF View
* Responsive view of the web
* Retrieve credential types
* Retrieve issuers list
* Search bar functionality
* Success/Failure notifier after downloading the VC PDF
* Theme update
* Authenticate user credentials&#x20;
* Data in VC(PDF) Alignment
* Download Credential
* Download VC as PDF
* Error message when the website is down

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.

* Functionality
* Deploy ability
* Configurability
* Customizability

The verification methods may differ based on how the need was addressed.

## Verified configuration

Verification is performed on various configurations as mentioned below&#x20;

&#x20;Default configuration - with 6 Lang&#x20;

* English
* French
* Arabic
* Hindi
* Tamil
* Kannada

## Feature Health

<figure><img src="../../../../.gitbook/assets/inji_web_0.9.0_test_report_feature_health.png" alt=""><figcaption></figcaption></figure>

## Test execution statistics

## Functional test results

Below are the test metrics by performing functional testing. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

|                                     |        |        |         |
| ----------------------------------- | ------ | ------ | ------- |
| Total                               | Passed | Failed | Skipped |
| 165                                 | 145    | 7      | 13      |
| Test Rate: 92%, With Pass Rate: 95% |        |        |         |

Here is the detailed breakdown of metrics for each module:

|                                                         |            |     |
| ------------------------------------------------------- | ---------- | --- |
|                                                         | Test cases |     |
| <p> </p><p> </p><p> </p><p>INJI Web Ui Verification</p> | Total      | 165 |
| Passed                                                  | 7          |     |
| Failed                                                  | 7          |     |
| Skipped                                                 | 13         |     |



## Detailed Test metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.&#x20;

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

Git hub link for the xls file:

\<TBD>



&#x20;
