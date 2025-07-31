# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of

* Functionality
* Deployability
* Configurability
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence, the Configurability and Extensibility of the software is also assessed. This ensures the readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, Verification scope required comprehensive automation testing for all the MOSIP APIs. An automation Test Rig is created for the same.

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.

* Functionality
* Deployability
* Configurability
* Customizability

The verification methods may differ based on how the need was addressed.

For regression check, “MOSIP Test Rig” - an automation testing suite - which is indigenously designed and developed for supporting persona based testing. MOSIP Test Rig covers the end to end test execution and reporting. The end to end functional test scenarios are written starting from pre-registration, to creation of packet in registration center, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutation and combinations of cases being covered. MOSIP Test Rig will be an open source artifact which can also be enhanced and used by countries to validate the SI deliveries before going live. Persona classes include both negative and positive personas. Negative persona classes include users like Bribed Registration Office, Malicious Insider etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

## Verified configuration

Verification is performed on various configurations as mentioned below

Default configuration -

* eSignet with 7 languages (English/Khmer/Hindi/Kannada/Tamil/Arabic/French)
* Signup with 2 languages (Khmer/English)

#### Main feature tested:

* Signup Portal with mock ID
* Login with Password with mock ID
* Forgot Password with mock ID
* Login with OTP with mock ID
* Login with biometrics with mock ID
* Login with KBI with mock ID
* Identity verification process (L2 flow) with mock ID
* Signup Portal with MOSIP IDA
* Login with Password with MOSIP IDA
* Forgot Password with MOSIP IDA
* Login with OTP with MOSIP IDA
* Login with biometrics MOSIP IDA
* Sunbird Plugin with MOSIP IDA
* Critical and Blocker Bugs verification
* Docker Compose testing for eSignet and signup (windows, Linux and Mac)

## Feature Health



<figure><img src="../../../.gitbook/assets/es-1.6.0-feature-health.png" alt=""><figcaption></figcaption></figure>

## Test execution statistics

## Functional test results

Below are the test metrics by performing functional testing using mock MDS, mock Auth and mock ABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. The functional tests were performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

<table><thead><tr><th width="381.8203125" valign="top">Total</th><th valign="top">Passed</th><th valign="top">Failed</th><th valign="top">Skipped</th></tr></thead><tbody><tr><td valign="top">3183</td><td valign="top">3110</td><td valign="top">38</td><td valign="top">35</td></tr></tbody></table>

Test Rate: 98% with Pass rate: 98%

Here is the detailed breakdown:

<table><thead><tr><th valign="top"></th><th valign="top">Test cases</th><th>Total</th></tr></thead><tbody><tr><td valign="top">API Based Testing - eSignet</td><td valign="top"></td><td>2017</td></tr><tr><td valign="top"></td><td valign="top">Passed</td><td>1962</td></tr><tr><td valign="top"></td><td valign="top">Failed</td><td>20</td></tr><tr><td valign="top"></td><td valign="top">Skipped</td><td>35</td></tr><tr><td valign="top">UI Based Testing</td><td valign="top"></td><td>1166</td></tr><tr><td valign="top"></td><td valign="top">Passed</td><td>1148</td></tr><tr><td valign="top"></td><td valign="top">Failed</td><td>18</td></tr><tr><td valign="top"></td><td valign="top">Skipped</td><td>0</td></tr></tbody></table>

API Testrig results for eSignet and Signup with Mock ID:

<table><thead><tr><th valign="top"></th><th valign="top">Test cases</th><th>Total</th></tr></thead><tbody><tr><td valign="top">API Based Testrig - eSignet</td><td valign="top">Total</td><td>1011</td></tr><tr><td valign="top"></td><td valign="top">Passed</td><td>93</td></tr><tr><td valign="top"></td><td valign="top">Failed</td><td>0</td></tr><tr><td valign="top"></td><td valign="top">Skipped</td><td>0</td></tr><tr><td valign="top"></td><td valign="top">Ignored</td><td>918</td></tr><tr><td valign="top">API Based Testrig - eSignet-signup</td><td valign="top"></td><td>585</td></tr><tr><td valign="top"></td><td valign="top">Passed</td><td>559</td></tr><tr><td valign="top"></td><td valign="top">Failed</td><td>0</td></tr><tr><td valign="top"></td><td valign="top">Skipped</td><td>0</td></tr><tr><td valign="top"></td><td valign="top">Ignored</td><td>26</td></tr></tbody></table>

API Testrig results for eSignet and Signup with MOSIP ID:

<table><thead><tr><th valign="top"></th><th valign="top">Test cases</th><th>Total</th></tr></thead><tbody><tr><td valign="top">API Based Testrig - eSignet</td><td valign="top"></td><td>1011</td></tr><tr><td valign="top"></td><td valign="top">Passed</td><td>842</td></tr><tr><td valign="top"></td><td valign="top">Failed</td><td>0</td></tr><tr><td valign="top"></td><td valign="top">Skipped</td><td>0</td></tr><tr><td valign="top"></td><td valign="top">Ignored</td><td>169</td></tr><tr><td valign="top">API Based Testrig - eSignet-signup</td><td valign="top"></td><td>585</td></tr><tr><td valign="top"></td><td valign="top">Passed</td><td>301</td></tr><tr><td valign="top"></td><td valign="top">Failed</td><td>1</td></tr><tr><td valign="top"></td><td valign="top">Skipped</td><td>0</td></tr><tr><td valign="top"></td><td valign="top">Ignored</td><td>283</td></tr></tbody></table>

API Testrig results for eSignet and Signup with Sunbird:

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top">Test cases</th><th>Total</th></tr></thead><tbody><tr><td valign="top">API Based Testrig - Sunbird</td><td valign="top"></td><td>1011</td></tr><tr><td valign="top"></td><td valign="top">Passed</td><td>93</td></tr><tr><td valign="top"></td><td valign="top">Failed</td><td>0</td></tr><tr><td valign="top"></td><td valign="top">Skipped</td><td>0</td></tr><tr><td valign="top"></td><td valign="top">Ignored</td><td>918</td></tr></tbody></table>



{% hint style="warning" %}
**Note**: In API Based testing, 35 test cases are marked as skipped as they were not automated and cannot be tested using postman.
{% endhint %}

#### Detailed Test metrics:

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking, and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all failed test cases. (Number of failed tests / Total number of test cases executed) x 100

#### Sonar Report:

<table><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Repo Name</td><td valign="top">Branch Name</td><td valign="top">Release Version (POM)</td><td valign="top">Coverage (>80%)</td><td valign="top">Reliability (0)</td><td valign="top">Security (0)</td><td valign="top">Hotspots (0)</td><td valign="top">Duplications<br>(Less than 3%)</td></tr><tr><td valign="top">eSigent</td><td valign="top">release-1.6.x</td><td valign="top">release-1.6.1</td><td valign="top">86.2</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0%</td></tr><tr><td valign="top">eSignet Signup</td><td valign="top">release-1.2.x</td><td valign="top">release-1.2.1</td><td valign="top">79.3</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0%</td></tr><tr><td valign="top">esignet-mock-services</td><td valign="top">release-0.11.x</td><td valign="top">release-0.11.1</td><td valign="top">83.3</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0%</td></tr><tr><td valign="top">esignet-plugins(mock-plugin)</td><td valign="top">release-1.3.x</td><td valign="top">release-1.3.2</td><td valign="top">83.0</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td><td valign="top">2.9%</td></tr><tr><td valign="top">esignet-plugins(mosip-identity-plugin)</td><td valign="top">release-1.3.2</td><td valign="top">release-1.3.2</td><td valign="top">83.6</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0%</td></tr><tr><td valign="top">esignet-plugins(sunbird-rc-plugin)</td><td valign="top">release-1.3.2</td><td valign="top">release-1.3.2</td><td valign="top">83</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0%</td></tr></tbody></table>

***









