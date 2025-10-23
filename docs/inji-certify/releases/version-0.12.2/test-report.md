# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of &#x20;

* Functionality
* Deployability &#x20;
* Configurability &#x20;
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform.&#x20;

&#x20;Testing scope has been focused on the following features:

* Inji certify Docker compose testing (Data provider CSV plugin, Data provider Postgres plugin)
* Insurance, MosipId and Mock (Issuance and Data provider (Postgres plugin)), which covered Land registry use case
* Integration with Inji Web and Inji verify
* CSR generation for appid and refid to enable external CA signing and certificate upload to certify (except ES256K signature)
* Postman readme changes in Docs (Docker compose)
* Enabling of shedlock table

&#x20;

## Test Approach <a href="#heading-h.4g8u1xthz49c" id="heading-h.4g8u1xthz49c"></a>

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble real-time implementation.&#x20;

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following:

* &#x20;Functionality &#x20;
* Deployability &#x20;
* Configurability &#x20;
* Customizability

The verification methods may differ based on how the need was addressed.&#x20;

## Verified Configuration  <a href="#heading-h.2d5gtphrcovh" id="heading-h.2d5gtphrcovh"></a>

Verification is performed on configurations as mentioned below&#x20;

* &#x20;Default configuration:
  * English

{% include "../../../.gitbook/includes/note-most-deployment-scrip....md" %}

### Functional Test Results <a href="#heading-h.xvtnjotfvch5" id="heading-h.xvtnjotfvch5"></a>

Below are the test metrics by performing functional testing. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, and End-To-End flows across multiple configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">NA</td></tr><tr><td valign="top">769</td><td valign="top">744</td><td valign="top">22</td><td valign="top">0</td></tr></tbody></table>

Test Rate: 100%, With Pass Rate: 97% and Fail Rate: 3%&#x20;

#### &#x20;Automation Statistics&#x20;

* Sunbird use case

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Ignored</td><td valign="top">Known issues</td></tr><tr><td valign="top">442</td><td valign="top">72</td><td valign="top">0</td><td valign="top">336</td><td valign="top">34</td></tr></tbody></table>

&#x20;Test Rate: 100%, With Pass Rate: 90% and Fail Rate: 10%



* Mock Use case

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Ignored</td><td valign="top">Known issues</td></tr><tr><td valign="top">442</td><td valign="top">50</td><td valign="top">0</td><td valign="top">358</td><td valign="top">34</td></tr></tbody></table>

&#x20;Test Rate: 100%, With Pass Rate: 94.4% and Fail Rate: 5.6%

&#x20;

* Mock (Data provider) Landregistry Use case

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Ignored</td><td valign="top">Known Issues</td></tr><tr><td valign="top">442</td><td valign="top">209</td><td valign="top">0</td><td valign="top">199</td><td valign="top">34</td></tr></tbody></table>

&#x20;Test Rate: 100%, With Pass Rate: 94.6% and Fail Rate: 5.4%

* MosipId Use case

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Ignored</td><td valign="top">Known Issues</td></tr><tr><td valign="top">442</td><td valign="top">64</td><td valign="top">0</td><td valign="top">344</td><td valign="top">34</td></tr></tbody></table>

Test Rate: 100%, With Pass Rate: 85.3% and Fail Rate: 14.7%&#x20;

{% include "../../../.gitbook/includes/note-most-deployment-scrip....md" %}

&#x20;

### Detailed Test Metrics <a href="#heading-h.taocy2ewwvz9" id="heading-h.taocy2ewwvz9"></a>

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.&#x20;

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of tests passed / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

## Tested with Components <a href="#heading-h.a2n0wcl6po9x" id="heading-h.a2n0wcl6po9x"></a>

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Module/Repo</td><td valign="top">Image</td><td valign="top">POM version</td><td valign="top">Dependent artifactID</td><td valign="top">Comments</td></tr><tr><td valign="top">Inji-certify-mosipid</td><td valign="top">mosipqa/inji-certify-with-plugins:0.12.x</td><td valign="top"> </td><td valign="top">Digital-credential-plugin - 0.5.0</td><td valign="top"> </td></tr><tr><td valign="top">Inji-certify-mock</td><td valign="top">mosipqa/inji-certify-with-plugins:0.12.x</td><td valign="top"> </td><td valign="top">Digital-credential-plugin - 0.5.0</td><td valign="top"> </td></tr><tr><td valign="top">Inji-certify-Insurance</td><td valign="top">mosipqa/inji-certify-with-plugins:0.12.x</td><td valign="top"> </td><td valign="top">Digital-credential-plugin - 0.5.0</td><td valign="top"><p> </p><p> </p></td></tr><tr><td valign="top">Inji-certify- landregistry</td><td valign="top">mosipqa/inji-certify-with-plugins:0.12.x</td><td valign="top"> </td><td valign="top">Digital-credential-plugin - 0.5.0</td><td valign="top"> </td></tr><tr><td valign="top">Mdoc-mdl</td><td valign="top">mosipqa/inji-certify-with-plugins:0.12.x</td><td valign="top"> </td><td valign="top">Digital-credential-plugin - 0.5.0</td><td valign="top"> </td></tr><tr><td valign="top">Inji-config</td><td valign="top">Releasing from release-0.10.x branch</td><td valign="top"> </td><td valign="top">Digital-credential-plugin - 0.5.0</td><td valign="top"><a href="https://github.com/mosip/inji-config/tree/release-0.8.x">https://github.com/mosip/inji-config/tree/release-0.10.x</a></td></tr><tr><td valign="top">eSignet</td><td valign="top">eSignet-1.6.1</td><td valign="top"> </td><td valign="top"> </td><td valign="top"> </td></tr><tr><td valign="top">Keymanager</td><td valign="top">As a library</td><td valign="top"><p>1.3.0-beta.4(1.3.0-SNAPSHOT)</p><p> </p></td><td valign="top"> </td><td valign="top"> </td></tr></tbody></table>

&#x20;Click [here](https://github.com/mosip/test-management/tree/master/inji-certify/0.12.2) to view the detailed test report.
