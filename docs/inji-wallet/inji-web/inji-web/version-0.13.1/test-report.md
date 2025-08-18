# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of&#x20;

* Functionality
* Deployability
* Configurability
* Customizability

Verification is performed with a UI test rig.

Testing scope has been focused on the below features:

* Automation Functional UI.
* Automation API Test rig.

## Test Approach

A personal based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.

* Functionality
* Deployability
* Configurability
* Customizability

The verification methods may differ based on how the need was addressed.

## Verified configuration

Verification is performed on various configurations as mentioned below

* Default configuration – 1 Language
  * English

The UI will render in all the above languages but the PDF file after download will only be in English language as certify is currently only supporting English. When any language is selected in UI, as a fall back the pdf will be in Eng.

## Test execution statistics

### Functional test results

Below are the test metrics by performing functional testing. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, and End-To-End flows across multiple configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

### UI Automation and API Test Rig test results

Below are the test metrics by performing UI Automation and API Test rig.

<table><thead><tr><th valign="top">INJI Web and API</th><th valign="top">Test cases</th><th>Total</th></tr></thead><tbody><tr><td valign="top"><p> </p><p> </p><p> </p><p>INJI Web UI Automation</p></td><td valign="top"></td><td>24</td></tr><tr><td valign="top"></td><td valign="top">Passed</td><td>24</td></tr><tr><td valign="top"></td><td valign="top">Failed</td><td>0</td></tr><tr><td valign="top"></td><td valign="top">Skipped</td><td>0</td></tr><tr><td valign="top"><p> </p><p> </p><p> </p><p></p></td><td valign="top">INJI Web API Test Rig</td><td>315</td></tr><tr><td valign="top"></td><td valign="top">Passed</td><td>264</td></tr><tr><td valign="top"></td><td valign="top">Failed</td><td>0</td></tr><tr><td valign="top"></td><td valign="top">Skipped/Ignored</td><td>33</td></tr><tr><td valign="top"></td><td valign="top">Known Issues</td><td>18</td></tr></tbody></table>

&#x20;

Note: Ignored 33 OTP related test cases which are descoped and not applicable

Functional and test rig code base branch which is used for the above metrics is:

* UI Automation: 70d13a051881167584d4b0efb263082e3aff2f87
* API automation: 87a0b77246ef23c0be429f8159719c3c779d784a

### Detailed Test Metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of tests passed / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

Git hub link for the xls file (TBU):
