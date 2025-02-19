# Test Report

### Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of&#x20;

●     Functionality&#x20;

●     Deployability&#x20;

●     Configurability&#x20;

●     Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software are also assessed. This ensures the readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, the Verification scope required comprehensive automation testing for all the MOSIP APIs. An automation Test Rig is created for the same.

### Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software, and thereby determines use cases/scenarios that the customers will execute. The persona's needs may be addressed through any of the following.

●     Functionality&#x20;

●     Deployability&#x20;

●     Configurability&#x20;

●     Customizability

The verification methods may differ based on how the need was addressed.

For regression check, “MOSIP Test Rig” - an automation testing suite - is indigenously designed and developed for supporting persona based testing. MOSIP Test Rig covers the end to end test execution and reporting. The end to end functional test scenarios are written starting from pre-registration, to the creation of the packet in the registration center, processing the packet through the registration processor, generating UIN, and authenticating identity using IDA through various permutations and combinations of cases being covered. MOSIP Test Rig will be an open source artifact that can also be enhanced and used by countries to validate the SI deliveries before going live. Persona classes include both negative and positive personas. Negative persona classes include users like Bribed Registration Office, Malicious Insider, etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

### Verified configuration <a href="#heading-h.tyjcwt" id="heading-h.tyjcwt"></a>

Verification is performed on various configurations as mentioned below

#### Default configuration:

&#x20;    ●   eSignet with 7 Languages (English/Khmer/Hindi/Kannada/Tamil/Arabic/French)

&#x20;    ●    Signup in 2 languages (Khmer/English)

#### Main features tested:

* **Signup Portal** with mock ID
* **Login with Password** with mock ID
* **Forgot Password** with mock ID
* **Login with OTP** with mock ID
* **Login with Biometrics** with mock ID
* **Login with KBI** with mock ID
* **Identity Verification Process (L2 flow)** with mock ID
* **Signup Portal** with MOSIP IDA
* **Login with Password** with MOSIP IDA
* **Forgot Password** with MOSIP IDA
* **Login with OTP** with MOSIP IDA
* **Login with Biometrics** with MOSIP IDA
* **Login with KBI** with MOSIP IDA
* **Sunbird Plugin** with MOSIP IDA
* **Critical and Blocker Bugs Verification**
* **Docker Compose Testing** for eSignet and signup (Windows and Linux)

### Feature Health <a href="#heading-h.mxjdc7cxya9w" id="heading-h.mxjdc7cxya9w"></a>

<figure><img src="../../../.gitbook/assets/eSignet_1.5.1.png" alt=""><figcaption><p>Feature Health</p></figcaption></figure>

### Test execution statistics

#### Functional test results <a href="#heading-h.x3l4xp1n67g2" id="heading-h.x3l4xp1n67g2"></a>

Below are the test metrics by performing functional testing using mock MDS, mock Auth, and mock ABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. The functional test was performed in combination with individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included the simulation of multiple identity schema and respective UI schema configurations.

<table><thead><tr><th valign="top">Total Test Cases</th><th valign="top">Passed</th><th valign="top">Failed</th><th valign="top">Skipped</th></tr></thead><tbody><tr><td valign="top">2928</td><td valign="top">2815</td><td valign="top">67</td><td valign="top">46</td></tr></tbody></table>

**Test Rate:** 98% with **Pass rate:** 97%

Here is the detailed breakdown:

#### API Based Testing - eSignet

<table><thead><tr><th valign="top">Total Test Cases</th><th valign="top">Passed</th><th valign="top">Failed</th><th valign="top">Skipped</th></tr></thead><tbody><tr><td valign="top">1934</td><td valign="top">1857</td><td valign="top">51</td><td valign="top">26</td></tr></tbody></table>

#### UI Based Testing

<table><thead><tr><th valign="top">Total Test Cases</th><th valign="top">Passed</th><th valign="top">Failed</th><th valign="top">Skipped</th></tr></thead><tbody><tr><td valign="top">994</td><td valign="top">958</td><td valign="top">16</td><td valign="top">20</td></tr></tbody></table>

### API Testrig results for eSignet and Signup with Mock ID:

#### API Based Testrig - eSignet

<table><thead><tr><th width="157" valign="top">Total Test Cases</th><th valign="top">Passed</th><th valign="top">Failed</th><th>Skipped</th><th valign="top">Ignored</th></tr></thead><tbody><tr><td valign="top">962</td><td valign="top">465</td><td valign="top">0</td><td>0</td><td valign="top">497</td></tr></tbody></table>

#### API Based Testrig - eSignet-signup

<table><thead><tr><th width="157" valign="top">Total Test Cases</th><th valign="top">Passed</th><th valign="top">Failed</th><th>Skipped</th><th valign="top">Ignored</th></tr></thead><tbody><tr><td valign="top">579</td><td valign="top">552</td><td valign="top">0</td><td>0</td><td valign="top">26</td></tr></tbody></table>

{% hint style="info" %}
**Note:** In API Based testing, 26 test cases are marked as skipped as they were not automated and cannot be tested using Postman.

In UI Based testing, 20 test cases are marked as skipped as they were out of scope for the release.
{% endhint %}

### Detailed Test metrics:

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking, and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

●       Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100

●       Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

### Sonar Report:

<table data-full-width="true"><thead><tr><th width="111" valign="top">Repo Name</th><th width="135" valign="top">Branch Name</th><th valign="top">Release Version (POM)</th><th valign="top">Coverage (>80%)</th><th valign="top">Reliability (0)</th><th valign="top">Security (0)</th><th valign="top">Hotspots (0)</th><th valign="top">Duplications  (Less than 3%)</th></tr></thead><tbody><tr><td valign="top">eSigent</td><td valign="top">release-1.5.x</td><td valign="top">v1.5.1</td><td valign="top">86.2%</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0%</td></tr><tr><td valign="top"><p> </p><p>eSignet Signup</p></td><td valign="top">release-1.1.x</td><td valign="top">v1.1.1</td><td valign="top">81.2%</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0%</td></tr></tbody></table>
