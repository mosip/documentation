# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of&#x20;

●     Functionality&#x20;

●     Deploy ability&#x20;

●     Configurability&#x20;

●     Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence, the Configurability and Extensibility of the software is also assessed. This ensures the readiness of software for use in multiple countries. MOSIP is an “API First” product platform.

The testing scope has been focused on the following features:

●     Inji Verify Home page

●     Verify Scan Feature

●     Verify Upload Feature

Below are the combinations that QA verified and Certified INJI Verify:

**Upload feature Verification:**

1. Windows using Edge, Firefox, and Chrome browsers.
2. Mac using Safari browser.

**Scan functionality Verification:**

1. MAC (Laptop) with a front camera of 2 megapixels and Safari browser.
2. Mobile phone Android with camera 16 megapixel using browsers Chrome.
3. iPhone with 24-megapixel camera using Safari browser.

{% hint style="info" %}
Note: Unable to verify Scan functionality in Windows.
{% endhint %}

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or service similarly. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software, and thereby determines use cases/scenarios that the customers will execute. The persona's needs may be addressed through any of the following.

●     Functionality&#x20;

●     deploy ability&#x20;

●     Configurability&#x20;

●     Customizability

The verification methods may differ based on how the need was addressed.

## Verified configuration

Verification is performed on various configurations as mentioned below.

●  Default configuration - with 1 Language.

1. English

## Feature Health

<figure><img src="../../../.gitbook/assets/Inji verify Feature Health.png" alt="" width="563"><figcaption><p>Inji Verify Feature Health</p></figcaption></figure>

## Test execution statistics

### Functional test results

Below are the test metrics by performing functional testing. The process followed was black box testing which based its test cases on the specifications of the software component under test. The functional test was performed in combination with individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple configurations. The testing cycle included the simulation of multiple identity schema and respective UI schema configurations.           &#x20;

| Total | Passed | Failed | Skipped |
| ----- | ------ | ------ | ------- |
| 253   | 198    | 39     | 16      |

**Test Rate:** 93%, With **Pass Rate:** 83%

Here is the detailed breakdown of metrics for each module:

<table><thead><tr><th width="206">Module</th><th width="156">Total Test Cases</th><th>Passed</th><th>Failed</th><th>Skipped</th></tr></thead><tbody><tr><td>Inji Verify UI Verification</td><td>253</td><td>198</td><td>39</td><td>16</td></tr></tbody></table>

### Test results for Upload and Scan

#### Windows

<table><thead><tr><th width="116">Windows</th><th width="141">Upload button</th><th width="146">Upload feature</th><th>Scan Button</th><th width="157">Scan Feature</th><th>Overall layout</th></tr></thead><tbody><tr><td>Firefox</td><td>Pass</td><td>Pass</td><td>Pass</td><td>In-consistent (Camera resolutions)</td><td>Pass</td></tr><tr><td>Edge</td><td>Pass</td><td>Pass</td><td>Pass</td><td>In-consistent (Camera resolutions)</td><td>Pass</td></tr><tr><td>Safari</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr><tr><td>Chrome</td><td>Pass</td><td>Pass</td><td>Pass</td><td>In-consistent (Camera resolutions)</td><td>Pass</td></tr></tbody></table>

#### MAC

<table><thead><tr><th width="107">MAC</th><th width="147">Upload button</th><th>Upload feature</th><th>Scan Button</th><th>Scan Feature</th><th>Overall layout</th></tr></thead><tbody><tr><td>Firefox</td><td>Pass</td><td>Pass</td><td>Pass</td><td>Pass</td><td>Pass</td></tr><tr><td>Edge</td><td>Pass</td><td>Pass</td><td>Pass</td><td>Pass</td><td>Pass</td></tr><tr><td>Safari</td><td>Pass</td><td>Pass</td><td>Pass</td><td>Pass</td><td>Pass</td></tr><tr><td>Chrome</td><td>Pass</td><td>Pass</td><td>Pass</td><td>Pass</td><td>Pass</td></tr></tbody></table>

#### iPhone

| IPhone  | Upload button | Upload feature | Scan Button | Scan Feature | Overall layout |
| ------- | ------------- | -------------- | ----------- | ------------ | -------------- |
| Firefox | Pass          | Pass           | Pass        | Pass         | Pass           |
| Edge    | Pass          | Pass           | Pass        | Pass         | Pass           |
| Safari  | Pass          | Pass           | Pass        | Pass         | Pass           |
| Chrome  | Pass          | Pass           | Pass        | Pass         | Pass           |

#### Android

| Android | Upload button | Upload feature | Scan Button | Scan Feature | Overall layout |
| ------- | ------------- | -------------- | ----------- | ------------ | -------------- |
| Firefox | Pass          | Pass           | Pass        | Pass         | Pass           |
| Edge    | Pass          | Pass           | Pass        | Pass         | Pass           |
| Safari  | NA            | NA             | NA          | NA           | NA             |
| Chrome  | Pass          | Pass           | Pass        | Pass         | Pass           |

### Detailed Test metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking, and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

●  Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100.

●   Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100.

Git hub link for the [xls file](https://github.com/mosip/test-management/tree/master/inji%20verify/0.9.0)
