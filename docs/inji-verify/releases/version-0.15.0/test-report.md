# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of&#x20;

* Functionality
* Deployability
* Configurability
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform.

Testing scope has been focused on the below features:

* Inji Verify Home page
* Verify Scan Feature
* Verify Upload Feature
* OVP Flow
* Same device flow

Below are the combinations that QA verified and Certified INJI Verify:

Upload feature Verification:

1. Windows using Edge, Firefox and Chrome browsers.
2. Android using Firefox and Chrome browsers.
3. iPhone using Safari, Edge, Firefox and Chrome browsers.
4. MAC using Safari Edge, Firefox and Chrome browsers.



Scan functionality Verification:

1. MAC (Laptop) with a front camera of 2 megapixel using Chrome, edge, Firefox and Safari browsers.
2. Windows laptop with a front camera of 2 megapixel using Chrome, edge, and Firefox browsers.
3. Mobile Android phone Tablet with back camera 16 megapixel using browsers Chrome, Edge and Firefox browsers.
4. iPhone and iPad with 12 megapixels back camera Chrome, edge, Firefox and Safari browsers.
5. Verified in low light to scan the QR code
6. Verified scan with blur, cracked, low quality QR codes was verified



OVP functionality Verification with current INJI Verify version:

1. Windows using Edge, Firefox and Chrome browsers.
2. Android using Firefox and Chrome browsers.
3. iPhone using Safari, Edge, Firefox and Chrome browsers.
4. MAC using Safari Edge, Firefox and Chrome browsers.

&#x20;

Same device flow Verification with current INJI Verify version:

1. Android using Edge, Firefox and Chrome browsers.
2. iPhone using Safari, Edge, Firefox and Chrome browsers.

&#x20;

Same Device flow and OVP was verified with INJI Mobile v 0.20.0

&#x20;











### Testing results:

Below are the results for Upload, Scan and OVP flow functionality with Windows, Android phone, MAC, Android Tablet, iPad and iPhone with different browsers:

&#x20;&#x20;

{% hint style="warning" %}
Note : OVP flow was verified in 0.20.0 inji-mobile build.
{% endhint %}

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

&#x20;

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.

&#x20;

* Functionality&#x20;
* Deployability&#x20;
* Configurability&#x20;
* Customizability

&#x20;

The verification methods may differ based on how the need was addressed.

&#x20;

## Verified configuration

Verification is performed on various configurations as mentioned below

* Default configuration - with 1 Lang
  * English

## Feature Health&#x20;

&#x20;

&#x20;

&#x20;

&#x20;

## Test execution statistics

### Functional test results

Below are the test metrics by performing functional testing. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

&#x20;

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Skipped</td></tr><tr><td valign="top">842</td><td valign="top">749</td><td valign="top">93</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100%, With Pass Rate: 88%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

&#x20;

### UI Automation results

Below section provides details on UI Automation by executing MOSIP functional automation Framework.

&#x20;

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Skipped</td></tr><tr><td valign="top">21</td><td valign="top">21</td><td valign="top">0</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100% With Pass Rate: 100%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

&#x20;

&#x20;

Functional and test rig code base branch which is used for the above metrics is:

Hash Tag: sha256:3501df0f116ca40faa947e354dbbab6486ca0058a6a77a406fdfb3d2c9b86197

&#x20;

&#x20;

&#x20;

### Verify API Test Rig Automation results

Below section provides details on UI Automation by executing MOSIP functional automation Framework.

&#x20;

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Skipped</td></tr><tr><td valign="top">33</td><td valign="top">33</td><td valign="top">0</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100% With Pass Rate: 100%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

&#x20;

&#x20;

Functional and test rig code base branch which is used for the above metrics is:

Hash Tag: sha256:4cdc020be40d6c237f490995d26d1ba7410d93a9e47ee1db4aa42c1bd4f44bd2\
\
\
\
\


### Detailed Test metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

&#x20;

The various metrics that assist in test tracking and efficiency are as follows:

&#x20;

●     Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100

●     Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

&#x20;

Git hub link for the xls file:

\<TBD>



