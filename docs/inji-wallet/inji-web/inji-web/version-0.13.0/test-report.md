# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of&#x20;

* Functionality
* Configurability
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures the readiness of software for use in multiple countries. MOSIP is an “API First” product platform.

Testing scope has been focused on the following features:

* Inji Home page
* Issuer and Credential selection
* Authenticating with user credentials
* PDF Generation and Auto download
* Success/Failure notification after downloading the VC PDF
* Retrieve Issuers and Credential list
* Downloading VC
* Multi languages support
* Error Handling
* Theme update
* PDF View
* Issuers support
* Responsive view of the web
* Access violations
* QR Code
* Durian data storage integration
* PDF and CBOR
* Login with Google
* OpenID4VP Implementation
* Latest draft changes support for OpenID4VCI
* FAQ Support
* UI UX Design updates
* Swagger update
* Secure Time Bound Storage
* Locale Support
* PDF Template Support
* Authorization endpoint discovery through auth server well-known

## Test Approach

A personal based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.

* Functionality&#x20;
* Configurability&#x20;
* Customizability

The verification methods may differ based on how the need was addressed.

## Verified configuration

Verification is performed on various configurations as mentioned below

* Default configuration - with 7 Lang
  * English
  * French
  * Arabic
  * Hindi
  * Tamil
  * Kannada
  * Portuguese

&#x20;The UI will render in all the above languages but the PDF file after download will only be in English language as certify is currently only supporting English. When any language is selected in UI, as a fall back the pdf will be in Eng.

## Feature Health

[Feature Health](../../../../.gitbook/assets/iww-0.13.0-test-report-feature-report.png)

## Test execution statistics

### Functional test results

Below are the testing test metrics by performing functional. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, and End-To-End flows across multiple configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.&#x20;

<table data-header-hidden><thead><tr><th width="374.84375" valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">NA</td></tr><tr><td valign="top">686</td><td valign="top">608</td><td valign="top">78</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100%, With Pass Rate: 88%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>


### UI Automation and API Test Rig test results

Below are the test metrics by performing UI Automation and API Test rig.

<p align="center"> </p>

<table data-header-hidden><thead><tr><th width="355.23046875" valign="top">Total</th><th valign="top">Passed</th><th valign="top">Failed</th><th valign="top">Skipped/Known Issues</th></tr></thead><tbody><tr><td valign="top">339</td><td valign="top">288</td><td valign="top">0</td><td valign="top">51</td></tr><tr><td valign="top">Test Rate: 83%, With Pass Rate: 100%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

&#x20;Here is the detailed breakdown of metrics for each module:

<table><thead><tr><th width="366.1640625" valign="top"></th><th valign="top">Test cases</th><th>Total</th></tr></thead><tbody><tr><td valign="top"><p> </p><p> </p><p> </p><p>INJI Web UI Automation</p></td><td valign="top"></td><td>24</td></tr><tr><td valign="top"></td><td valign="top">Passed</td><td>24</td></tr><tr><td valign="top"></td><td valign="top">Failed</td><td>0</td></tr><tr><td valign="top"></td><td valign="top">Skipped</td><td>0</td></tr><tr><td valign="top"><p> </p><p> </p><p> </p><p>INJI Web API Test Rig</p></td><td valign="top">Total</td><td>315</td></tr><tr><td valign="top"></td><td valign="top">Passed</td><td>264</td></tr><tr><td valign="top"></td><td valign="top">Failed</td><td>0</td></tr><tr><td valign="top"></td><td valign="top">Skipped/Ignored</td><td>33</td></tr><tr><td valign="top"></td><td valign="top">Known Issues</td><td>18</td></tr></tbody></table>

&#x20;

Note: Ignored 33 OTP related test cases which are descoped and not applicable

Functional and test rig code base branch which is used for the above metrics is:

&#x20;

UI Automation: 70d13a051881167584d4b0efb263082e3aff2f87

API automation: 87a0b77246ef23c0be429f8159719c3c779d784a

### Detailed Test Metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of tests passed / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

Git hub link for the xls file is coming up:
