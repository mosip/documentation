# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of &#x20;

* Functionality &#x20;
* Deployability &#x20;
* Configurability &#x20;
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures the readiness of software for use in multiple countries. MOSIP is an “API First” product platform.&#x20;

The testing scope has been focused on the following features:

* Inji Home page
* Issuer and Credential selection&#x20;
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
* FAQ Support&#x20;
* UI UX Design updates
* Swagger update
* Secure Time Bound Storage
* Locale Support
* PDF Template Support
* Authorization endpoint discovery through auth server well-known
* Sd jwt support
* Passcode Reset

## Test Approach

A personal-based approach has been adopted to perform the IV\&V by simulating test scenarios that resemble a real-time implementation.&#x20;

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona-based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona's needs may be addressed through any of the following.&#x20;

* Functionality &#x20;
* Deployability &#x20;
* Configurability &#x20;
* Customizability

The verification methods may differ based on how the need was addressed.&#x20;

## Verified configuration&#x20;

Verification is performed on various configurations as mentioned below&#x20;

* Default configuration - with 7 Lang&#x20;
* English
* French
* Arabic
* Hindi
* Tamil
* Kannada
* Portuguese

The UI will render in all the above languages but the PDF file after download will only be in English language as certify is currently only supporting English. When any language is selected in UI, as a fall back the pdf will be in Eng.&#x20;

## Feature Health

&#x20;

<figure><img src="../../../../.gitbook/assets/image (4).png" alt=""><figcaption></figcaption></figure>

## Test execution statistics&#x20;

#### Functional test results

Below are the test metrics by performing functional testing. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, and End-To-End flows across multiple configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">NA</td></tr><tr><td valign="top">1022</td><td valign="top">919</td><td valign="top">103</td><td valign="top">0</td></tr></tbody></table>

Test Rate: 100%, With Pass Rate: 89%

## UI Automation and API Test Rig test results

Below are the test metrics by performing UI Automation and API Test rig.

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Skipped/Known Issues</td></tr><tr><td valign="top">377</td><td valign="top">340</td><td valign="top">0</td><td valign="top">37</td></tr></tbody></table>

Test Rate: 99%, With Pass Rate: 90.18%<br>

Here is the detailed breakdown of metrics for each module:

### Inji Web Test Summary

#### Inji Web UI Automation

| Metric      | Count |
| ----------- | ----- |
| **Total**   | 28    |
| **Passed**  | 28    |
| **Failed**  | 0     |
| **Skipped** | 0     |

#### Inji Web API Test Rig

| Metric              | Count |
| ------------------- | ----- |
| **Total**           | 349   |
| **Passed**          | 312   |
| **Failed**          | 0     |
| **Skipped/Ignored** | 33    |
| **Known Issues**    | 4     |

**Note: Ignored 33 OTP related test cases which are descoped and not applicable. For the known Issues, we have bugs added in the xls report.**

The functional and test rig code base branch, which is used for the above metric, is:

* UI Automation: sha256:4ab3578dc5e6ad4242fa21f60a7f7ebf999a12b0fe439e199bbcf2c328b63a8
* API Automation: sha256:63ca4db68de2643a159b1e9d57c043963e935eaef2d79e7f6523beb2ed093666&#x20;

## Detailed Test Metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.&#x20;

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of tests passed / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

Git hub link for the xls file is [here.](https://github.com/mosip/test-management/tree/master/inji-web/inji%20web%200.15.0)
