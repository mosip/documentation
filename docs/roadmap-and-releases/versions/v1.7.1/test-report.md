# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of&#x20;

●      Functionality&#x20;

●      Deployability&#x20;

●      Configurability&#x20;

●      Customizability



Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence, the Configurability and Extensibility of the software is also assessed. This ensures the readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, Verification scope required comprehensive automation testing for all the MOSIP APIs. An automation Test Rig is created for the same.

&#x20;

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

&#x20;

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.

&#x20;

●      Functionality&#x20;

●      Deployability&#x20;

●      Configurability&#x20;

●      Customizability

&#x20;

The verification methods may differ based on how the need was addressed.

&#x20;

For regression check, “MOSIP Test Rig” - an automation testing suite - which is indigenously designed and developed for supporting persona-based testing. MOSIP Test Rig covers the end-to-end test execution and reporting. The end-to-end functional test scenarios are written starting from pre-registration to creation of packet in registration center, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutation and combinations of cases being covered. MOSIP Test Rig will be an open-source artifact which can also be enhanced and used by countries to validate the SI deliveries before going live. Persona classes include both negative and positive personas. Negative persona classes include users like Bribed Registration Office, Malicious Insider etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

## Verified configuration

Verification is performed on various configurations as mentioned below

Default configuration -

&#x20;    ●         eSignet with 6 languages (English/Khmer/Hindi/Kannada/arabic/tamil)

&#x20;    ●         Signup with 2 languages (Khmer/English)

&#x20;

Main feature tested:

Signup Portal with mock ID

Login with Password with mock ID

Forgot Password with mock ID

Login with OTP and biometrics with mock ID

Login with KBI with mock ID

Identity verification process (L2 flow) with mock ID and MOSIP ID

Identity verification process (L1 flow) with Cre

Wallet login performed cre for release environment

Signup Portal with MOSIP IDA

Login with Password with MOSIP IDA

Forgot Password with MOSIP IDA

Login with OTP and biometrics MOSIP IDA

Sunbird Plugin with KBI login

DPoP and PAR in all plugins

Deployment testing on eSignet & signup-mosipid-qabase plugin

FAPI 2.0 compliance

&#x20;

Features not in scope:

UI Automation for Signup/eSignet

&#x20;

## Feature Health

<p align="center"><img src="../../../.gitbook/assets/unknown.png" alt="" data-size="original"></p>

## Test execution statistics

## Functional test results

&#x20;

Below are the test metrics by performing functional testing using mock MDS, mock Auth and mock ABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. The functional tests were performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

&#x20;

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Skipped</td></tr><tr><td valign="top">3443</td><td valign="top">3372</td><td valign="top">36</td><td valign="top">35</td></tr><tr><td valign="top">Test Rate: 98% with Pass rate: 98%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

Note: In API-based testing, 35 test cases were marked as skipped because they were not automated and cannot be executed using Postman.<br>

Here is the detailed breakdown:

&#x20;

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th></th></tr></thead><tbody><tr><td valign="top"> </td><td valign="top">Test cases</td><td></td></tr><tr><td valign="top"><p> </p><p> </p><p>API Based Testing - eSignet</p></td><td valign="top">Total</td><td>2192</td></tr><tr><td valign="top">Passed</td><td valign="top">2139</td><td></td></tr><tr><td valign="top">Failed</td><td valign="top">18</td><td></td></tr><tr><td valign="top">Skipped</td><td valign="top">35</td><td></td></tr><tr><td valign="top"><p> </p><p> </p><p>UI Based Testing</p><p> </p></td><td valign="top">Total</td><td>1251</td></tr><tr><td valign="top">Passed</td><td valign="top">1233</td><td></td></tr><tr><td valign="top">Failed</td><td valign="top">18</td><td></td></tr><tr><td valign="top">Skipped</td><td valign="top">0</td><td></td></tr></tbody></table>

&#x20;

&#x20;

API Testrig results for eSignet and Signup with Mock ID:

&#x20;

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th></th></tr></thead><tbody><tr><td valign="top"> </td><td valign="top">Test cases</td><td></td></tr><tr><td valign="top"><p> </p><p> </p><p>API Based Testrig - eSignet</p></td><td valign="top">Total</td><td>1273</td></tr><tr><td valign="top">Passed</td><td valign="top">729</td><td></td></tr><tr><td valign="top">Failed</td><td valign="top">0</td><td></td></tr><tr><td valign="top">Skipped</td><td valign="top">0</td><td></td></tr><tr><td valign="top">Ignored</td><td valign="top">544</td><td></td></tr><tr><td valign="top">Known issues</td><td valign="top">0</td><td></td></tr><tr><td valign="top"><p> </p><p> </p><p> </p><p>API Based Testrig - eSignet-signup</p></td><td valign="top">Total</td><td>             665</td></tr><tr><td valign="top">Passed</td><td valign="top">635</td><td></td></tr><tr><td valign="top">Failed</td><td valign="top">0</td><td></td></tr><tr><td valign="top">Skipped</td><td valign="top">0</td><td></td></tr><tr><td valign="top">Ignored</td><td valign="top">30</td><td></td></tr><tr><td valign="top">Known issues</td><td valign="top">0</td><td></td></tr></tbody></table>

&#x20;

Note: 544 test cases in esignet and 30 test cases in signup related to the MOSIP ID plug-in are currently being ignored.

&#x20;

&#x20;

&#x20;

&#x20;

&#x20;

&#x20;

&#x20;

&#x20;

&#x20;

API Testrig results for eSignet and Signup with MOSIP - CRE:

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th></th></tr></thead><tbody><tr><td valign="top"> </td><td valign="top">Test cases</td><td></td></tr><tr><td valign="top"><p> </p><p> </p><p>API Based Testrig - eSignet</p></td><td valign="top">Total</td><td>1273</td></tr><tr><td valign="top">Passed</td><td valign="top">1091</td><td></td></tr><tr><td valign="top">Failed</td><td valign="top">8</td><td></td></tr><tr><td valign="top">Skipped</td><td valign="top">8</td><td></td></tr><tr><td valign="top">Ignored</td><td valign="top">166</td><td></td></tr><tr><td valign="top">Known issues</td><td valign="top">0</td><td></td></tr><tr><td valign="top"><p> </p><p> </p><p> </p><p>API Based Testrig - eSignet-signup</p></td><td valign="top">Total</td><td>665</td></tr><tr><td valign="top">Passed</td><td valign="top">405</td><td></td></tr><tr><td valign="top">Failed</td><td valign="top">53</td><td></td></tr><tr><td valign="top">Skipped</td><td valign="top">190</td><td></td></tr><tr><td valign="top">Ignored</td><td valign="top">17</td><td></td></tr><tr><td valign="top">Known issues</td><td valign="top">0</td><td></td></tr></tbody></table>

&#x20;

Note:

●      61 Failures in esignet and signup 198 are skipped due to L2 flow is not supported in esignet and signup

&#x20;

API Testrig results for eSignet and Signup with MOSIP – qa-base:   &#x20;

&#x20;

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th></th></tr></thead><tbody><tr><td valign="top"> </td><td valign="top">Test cases</td><td></td></tr><tr><td valign="top"><p> </p><p> </p><p>API Based Testrig - eSignet</p></td><td valign="top">Total</td><td>1273</td></tr><tr><td valign="top">Passed</td><td valign="top">1107</td><td></td></tr><tr><td valign="top">Failed</td><td valign="top">0</td><td></td></tr><tr><td valign="top">Skipped</td><td valign="top">0</td><td></td></tr><tr><td valign="top">Ignored</td><td valign="top">166</td><td></td></tr><tr><td valign="top">Known issues</td><td valign="top">0</td><td></td></tr><tr><td valign="top"><p> </p><p> </p><p> </p><p>API Based Testrig - eSignet-signup</p></td><td valign="top">Total</td><td>665</td></tr><tr><td valign="top">Passed</td><td valign="top">648</td><td></td></tr><tr><td valign="top">Failed</td><td valign="top">0</td><td></td></tr><tr><td valign="top">Skipped</td><td valign="top">0</td><td></td></tr><tr><td valign="top">Ignored</td><td valign="top">17</td><td></td></tr><tr><td valign="top">Known issues</td><td valign="top">0</td><td></td></tr></tbody></table>

Note: 166 test cases in esignet and 17 test cases in signup related to the mock plug-in are currently being ignored.

&#x20;

<br>

&#x20;

API Testrig results for eSignet and Signup with Sunbird:

&#x20;

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th></th></tr></thead><tbody><tr><td valign="top"> </td><td valign="top">Test cases</td><td></td></tr><tr><td valign="top"><p> </p><p> </p><p>API Based Testrig - Sunbird</p></td><td valign="top">Total</td><td>1273</td></tr><tr><td valign="top">Passed</td><td valign="top">93</td><td></td></tr><tr><td valign="top">Failed</td><td valign="top">0</td><td></td></tr><tr><td valign="top">Skipped</td><td valign="top">0</td><td></td></tr><tr><td valign="top">Ignored</td><td valign="top">1180</td><td></td></tr><tr><td valign="top"> </td><td valign="top">Known issues</td><td>0</td></tr></tbody></table>

&#x20;

Note: mock and mosipid plugin test cases are getting ignored

&#x20;

Detailed Test metrics:

&#x20;

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking, and efficiency.

&#x20;

The various metrics that assist in test tracking and efficiency are as follows:

&#x20;

●     Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100

●     Failed Test Case Coverage: It measures the percentage of all failed test cases. (Number of failed tests / Total number of test cases executed) x 100

&#x20;

&#x20;

&#x20;

&#x20;

<br>

&#x20;

Sonar Report:\
<br>

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Repo Name</td><td valign="top">Branch Name</td><td valign="top">Release Version (POM)</td><td valign="top">Coverage (>80%)</td><td valign="top">Reliability (0)</td><td valign="top">Security (0)</td><td valign="top">Hotspots (0)</td><td valign="top">Duplications<br> (Less than 3%)</td></tr><tr><td valign="top">eSigent</td><td valign="top">release-1.7.x</td><td valign="top">release-1.7.1</td><td valign="top">84.8</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0%</td></tr><tr><td valign="top"><p> </p><p>eSignet Signup</p></td><td valign="top">release-1.3.x</td><td valign="top">release-1.3.1</td><td valign="top">81.9</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0%</td></tr><tr><td valign="top">esignet-mock-services</td><td valign="top"><p> </p><p> release-0.12.x</p></td><td valign="top"><p> </p><p>release-0.12.1</p></td><td valign="top">85.2</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0%</td></tr><tr><td valign="top">esignet-plugins(mock-plugin)</td><td valign="top">release-1.3.x</td><td valign="top">release-1.3.4</td><td valign="top">83</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td><td valign="top">2.9%</td></tr><tr><td valign="top">esignet-plugins(mosip-identity-plugin)</td><td valign="top"><p> </p><p>release-1.3.x</p></td><td valign="top"><p> </p><p>release-1.3.4</p></td><td valign="top">69.1</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0%</td></tr><tr><td valign="top"><p> </p><p>esignet-plugins(sunbird-rc-plugin)</p></td><td valign="top"><p> </p><p>release-1.3.x</p></td><td valign="top"><p> </p><p>release-1.3.4</p></td><td valign="top">83</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0%</td></tr></tbody></table>

&#x20;
