# Test Report

## Introduction

The scope of testing is to verify fitment to the specification from the perspective of Functionality, Configurability and Customizability. Verification is performed not only from the end-user perspective but also from the System Integrator (SI) point of view. Hence, the Configurability and Extensibility of the software are also assessed. This ensures the readiness of the software for use in multiple countries and diverse identity ecosystems.

### Overview and Scope <a href="#atxbttigmv1r" id="atxbttigmv1r"></a>

* Home Page
* Upload Feature
* Scan Feature
* VP Verification
* OVP Flow
* SVG Support
* Multi Language
* Same Device and Cross Device flow

## Test Approach <a href="#id-4zxynuew5ter" id="id-4zxynuew5ter"></a>

The Functional verification of the Inji verify application is performed on Android and iOS platforms to ensure alignment with product specifications and business requirements. Analyzed with respect to functional stability, data integrity, and UI consistency. The validation adopts a persona-based testing strategy, simulating real-world user scenarios across diverse device matrices and multi-language configurations to ensure robustness in both online and offline environments.

☐ Functionality

☐ Combination

☐ Configurability &#x20;

☐ Customizability

☐ Library verification (vc-verifier)

## Test Organization <a href="#yy2hvty9khcf" id="yy2hvty9khcf"></a>

Table 1: Test Organization

<table><thead><tr><th width="164.19921875" valign="top">Name</th><th width="220.4609375" valign="top">Functional Role</th><th valign="top">Responsibilities</th></tr></thead><tbody><tr><td valign="top"><p>Santosh</p><p> </p></td><td valign="top">QA Engineer</td><td valign="top">Verifying the functionality, stability of the application,and report preparation. and performing combination testing.</td></tr><tr><td valign="top">Chaitanya K</td><td valign="top">QA Manager</td><td valign="top">Overviewing the test execution and review of the report.</td></tr><tr><td valign="top">Ragini Krishna</td><td valign="top">Senior QA Manager</td><td valign="top">High-level governance and executive reviews of reports and execution.</td></tr></tbody></table>

### Test Planning <a href="#emzastw6he1" id="emzastw6he1"></a>

* Data Readiness: Validate the availability of all services along with configured identity schemas (UIN/VID) to support biometric and authentication flows.
* Data Strategy: Refresh test data for every cycle by generating new QR codes.
* Coverage Distribution: Execute test scenarios across a broad matrix of browsers on Windows, Android, and iOS devices, spanning multiple user personas to ensure end-to-end compatibility coverage.

### Test Devices <a href="#vpx2sf8k0ohy" id="vpx2sf8k0ohy"></a>

&#x20;Table 2: Test Devices

<table><thead><tr><th width="275.72265625" valign="top">Device Model</th><th valign="top">OS and BLE version</th></tr></thead><tbody><tr><td valign="top">iPhone 7</td><td valign="top">iOS 15.8 BLE 4.2</td></tr><tr><td valign="top">iPhone 11</td><td valign="top">iOS 26.1 BLE 5.0</td></tr><tr><td valign="top">iPhone 13</td><td valign="top">iOS 18.6.2 BLE 5.0</td></tr><tr><td valign="top">iPhone 14</td><td valign="top">iOS 26.2 BLE 5.3</td></tr><tr><td valign="top">SS Galaxy A03 core</td><td valign="top">Android 11 BLE 4.2</td></tr><tr><td valign="top">Vivo Y73</td><td valign="top">Android 13 BLE 5.0</td></tr><tr><td valign="top">Redmi 6A</td><td valign="top">Android 9 BLE 4.2</td></tr><tr><td valign="top">Techno POVA 6 NEO</td><td valign="top">Android 14 BLE 5.0</td></tr><tr><td valign="top">OPPO A59 5G</td><td valign="top">Android 13 BLE 5.3</td></tr><tr><td valign="top">ONE PLUS 12R</td><td valign="top">Android 15 BLE 5.3</td></tr><tr><td valign="top">Infinix NOTE 50X 5G</td><td valign="top">Android 15 BLE 5.4</td></tr><tr><td valign="top">Redmi 7A</td><td valign="top">Android 10 BLE 4.2</td></tr><tr><td valign="top">iTel</td><td valign="top">Android 14 BLE 5.0</td></tr><tr><td valign="top">Xiaomi Redmi NOTE 13 Pro</td><td valign="top">Android 15 BLE 5.2</td></tr></tbody></table>

### Browser Versions <a href="#kqeupn1mwhel" id="kqeupn1mwhel"></a>

Used the below browser versions in testing INJI Verify

* Chrome: Version 123.0.6312.124
* Firefox: Version 125.0.1
* Edge: Version 124.0.2478.51
* Safari : Version 17

### Test Environment <a href="#rcclvtbximd" id="rcclvtbximd"></a>

Table 3: Test Environment

<table><thead><tr><th valign="top">Images (qa-inji1 env)</th></tr></thead><tbody><tr><td valign="top">mosipqa/inji-verify-service:0.16.x</td></tr><tr><td valign="top">mosipqa/inji-verify-ui:0.16.x</td></tr><tr><td valign="top">mosipqa/inji-certify-with-plugins:0.13.x</td></tr><tr><td valign="top">mosipid/apitest-mimoto:0.20.0</td></tr><tr><td valign="top">mosipqa/mimoto:develop</td></tr><tr><td valign="top">mosipqa/inji-web:develop</td></tr></tbody></table>

&#x20;

<table><thead><tr><th valign="top">Images (released env)</th></tr></thead><tbody><tr><td valign="top">mosipid/mimoto:0.20.0</td></tr><tr><td valign="top">mosipid/apitest-mimoto:0.20.0</td></tr><tr><td valign="top">mosipid/inji-verify-service:0.15.2</td></tr><tr><td valign="top">mosipid/inji-verify-ui:0.15.2</td></tr><tr><td valign="top">mosipid/inji-certify-with-plugins:0.13.1</td></tr><tr><td valign="top">mosipid/inji-web:0.15.0</td></tr><tr><td valign="top">mosipid/esignet-with-plugins:1.6.2</td></tr><tr><td valign="top">mosipid/authentication-service:1.2.1.0</td></tr><tr><td valign="top">mosipid/authentication-internal-service:1.2.1.0</td></tr><tr><td valign="top">mosipid/authentication-otp-service:1.2.1.0</td></tr><tr><td valign="top">mosipid/kernel-notification-service:1.2.0.1</td></tr><tr><td valign="top">mosipid/registration-processor-stage-group-1:1.2.1.1</td></tr></tbody></table>



## Test Execution Report <a href="#jntklky0i18z" id="jntklky0i18z"></a>

### Test case execution summary <a href="#id-75ge18cptbkd" id="id-75ge18cptbkd"></a>

Table 4: Test Execution Summary

<table><thead><tr><th width="282.56640625" valign="top">Platform</th><th valign="top">Total</th><th valign="top">Pass</th><th valign="top">Fail</th><th valign="top">Skip</th></tr></thead><tbody><tr><td valign="top">INJI Verify</td><td valign="top">953</td><td valign="top">857</td><td valign="top">96</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100% With Pass Rate: 90%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

### Combination Testing with device components <a href="#ti9wmz43h1i4" id="ti9wmz43h1i4"></a>

This section details Combination Testing results for Inji-verify on Windows, Android and iOS, specifically validating workflows like sharing Verifiable Credentials (VCs) across devices. These tests confirm the application's stability when orchestrating multiple components such as Bluetooth, camera, and biometrics during these cross-platform interactions.

Table 5: Combination Result

<table><thead><tr><th width="358.2734375" valign="top">Total</th><th valign="top">Passed</th><th valign="top">Failed</th><th valign="top">Skip</th></tr></thead><tbody><tr><td valign="top">220     </td><td valign="top">197</td><td valign="top">23</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100% With Pass Rate: 89.54%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>



### Automation INJI Verify UI <a href="#id-7n89naae489u" id="id-7n89naae489u"></a>

Table 6: UI Automation

<table><thead><tr><th width="253.9375" valign="top">Total</th><th valign="top">Pass</th><th valign="top">Fail</th><th valign="top">Known Issues</th><th valign="top">Ignored</th></tr></thead><tbody><tr><td valign="top">23</td><td valign="top">23</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100% With Pass Rate: 100%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

### Automation INJI Verify API <a href="#vlcy6sv7sovh" id="vlcy6sv7sovh"></a>

Table 7: API Automation Result

<table><thead><tr><th width="260.296875" valign="top">Total</th><th valign="top">Pass</th><th valign="top">Fail</th><th valign="top">Known Issues</th><th valign="top">Ignored</th></tr></thead><tbody><tr><td valign="top">35</td><td valign="top">35</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100% With Pass Rate: 100%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

## Defect Metrics <a href="#id-60l1o5j1jbrg" id="id-60l1o5j1jbrg"></a>

### Defect Metrics for the Release 0.16.0 <a href="#id-4uwwn4deck9h" id="id-4uwwn4deck9h"></a>

The following table depicts only the bugs which are found and not addressed in the current release.

Table 8: Defect Metrics for the Release

<table><thead><tr><th valign="top">Blocker</th><th valign="top">Critical</th><th valign="top">Major</th><th valign="top">Minor</th><th valign="top">Total</th></tr></thead><tbody><tr><td valign="top">0</td><td valign="top">0</td><td valign="top">8</td><td valign="top">5</td><td valign="top">13</td></tr></tbody></table>

### &#x20;Known Issues Metrics

This section focuses on a separate category of issues that are known but not addressed in the current release. It provides a count and severity distribution for these defects across releases.

Table 9: Defect Metrics for the known issues

<table><thead><tr><th valign="top">Blocker</th><th valign="top">Critical</th><th valign="top">Major</th><th valign="top">Minor</th><th valign="top">Total</th></tr></thead><tbody><tr><td valign="top">0</td><td valign="top">0</td><td valign="top">47</td><td valign="top">13</td><td valign="top">60</td></tr></tbody></table>

### &#x20;Conclusion

This section summarizes the key findings of test execution. It also provides a final QA recommendation on the build's readiness for release. The functional verification for Inji-verify version 016.0 has been successfully completed. The testing cycle achieved a 100% execution rate with a 90% pass rate across a total of 953 test cases. Additionally, API automation achieved a 100% pass rate.

While there are 13 open defects (0 Critical, 8 Major, 5 Minor) and 60 known issues in total, there are zero blocker defects identified. The application has demonstrated functional stability and data integrity consistent with product specifications.

### QA Approval

The build has successfully met the defined exit criteria and is recommended for release. The approval is based on the following satisfied conditions:

* Test Case Execution Completion: 100% of planned scenarios executed.
* Defect Status: No Blocker defects remain open.
* Documentation Sign-off: All test artifacts and reports are finalized.
* Test Environment Stability: The test environment remained stable throughout the execution cycle.

&#x20;Table 10: Report is signed off details

<table><thead><tr><th valign="top">Name</th><th valign="top">Functional Role</th><th valign="top">Responsibilities</th></tr></thead><tbody><tr><td valign="top">Chaitanya K</td><td valign="top">QA Manager</td><td valign="top"> </td></tr><tr><td valign="top">Ragini Krishna</td><td valign="top">Senior QA Manager</td><td valign="top"> </td></tr></tbody></table>

### &#x20;Appendix

This includes additional reference information for the report. It contains a history of document versions and a list of acronyms and their meanings.

### Appendix A: Versions <a href="#rqfn9uc34iac" id="rqfn9uc34iac"></a>

<table><thead><tr><th width="139.03125">Version</th><th width="188.36328125">Date</th><th width="186.1328125">Author</th><th valign="top">Reviewers</th></tr></thead><tbody><tr><td>V1.0</td><td>10/12/2025</td><td>Santosh</td><td valign="top"><p>Chaitanya K</p><p>Ragini Krishna</p></td></tr></tbody></table>

### Document History

It outlines the strategy used to ensure a comprehensive evaluation.

<table><thead><tr><th width="125.40234375">Version</th><th width="135.578125">Author</th><th width="144.94140625">Date</th><th width="165.6171875" valign="top">Review</th><th valign="top">Affected Sections</th></tr></thead><tbody><tr><td>V1.0</td><td>Santhosh</td><td>17/12/2025</td><td valign="top"><ol start="1"><li>Chaitanya Kesiraju</li><li>Ragini Krishna</li></ol></td><td valign="top">New Document</td></tr></tbody></table>

