# Test Report

### Introduction

The scope of testing is to verify fitment to the specification from the perspective of Functionality, Configurability and Customizability. Verification is performed not only from the end-user perspective but also from the System Integrator (SI) point of view. Hence, the Configurability and Extensibility of the software are also assessed. This ensures the readiness of the software for use in multiple countries and diverse identity ecosystems.

### Overview and Scope

* Home Page
* Upload Feature
* Scan Feature
* VP Verification
* OVP Flow
* SVG Support
* Multi Language
* Same Device and Cross Device flow
* V2 end point for "statusCheckFilters" and “Claims”

### Test Approach

The Functional verification of the Inji verify application is performed on Android and iOS platforms to ensure alignment with product specifications and business requirements. Analyzed with respect to functional stability, data integrity, and UI consistency. The validation adopts a persona-based testing strategy, simulating real-world user scenarios across diverse device matrices and multi-language configurations to ensure robustness in both online and offline environments.

* Functionality
* Combination
* Configurability
* Customizability
* Library verification (vc-verifier)

### Test Organization

Table 1: Test Organization

<table><thead><tr><th valign="top">Name</th><th valign="top">Functional Role</th><th valign="top">Responsibilities</th></tr></thead><tbody><tr><td valign="top"><p>Santosh</p><p><br></p></td><td valign="top">QA Engineer</td><td valign="top">Verifying the functionality, stability of the application,and report preparation. and performing combination testing.</td></tr><tr><td valign="top">Chaitanya K</td><td valign="top">QA Manager</td><td valign="top">Overviewing the test execution and review of the report.</td></tr><tr><td valign="top">Ragini Krishna</td><td valign="top">Senior QA Manager</td><td valign="top">High-level governance and executive reviews of reports and execution.</td></tr></tbody></table>



### Test Planning

* Data Readiness: Validate the availability of all services along with configured identity schemas (UIN/VID) to support biometric and authentication flows.
* Data Strategy: Refresh test data for every cycle by generating new QR codes.
* Coverage Distribution: Execute test scenarios across a broad matrix of browsers on Windows, Android, and iOS devices, spanning multiple user personas to ensure end-to-end compatibility coverage.

### Test Devices

&#x20;Table 2: Test Devices

<table data-header-hidden><thead><tr><th valign="top">Device Model</th><th valign="top">OS and BLE version</th></tr></thead><tbody><tr><td valign="top">iPhone 7</td><td valign="top">iOS 15.8 BLE 4.2</td></tr><tr><td valign="top">iPhone 11</td><td valign="top">iOS 26.1 BLE 5.0</td></tr><tr><td valign="top">iPhone 13</td><td valign="top">iOS 18.6.2 BLE 5.0</td></tr><tr><td valign="top">iPhone 14</td><td valign="top">iOS 26.2 BLE 5.3</td></tr><tr><td valign="top">SS Galaxy A03 core</td><td valign="top">Android 11 BLE 4.2</td></tr><tr><td valign="top">Vivo Y73</td><td valign="top">Android 13 BLE 5.0</td></tr><tr><td valign="top">Redmi 6A</td><td valign="top">Android 9 BLE 4.2</td></tr><tr><td valign="top">Techno POVA 6 NEO</td><td valign="top">Android 14 BLE 5.0</td></tr><tr><td valign="top">OPPO A59 5G</td><td valign="top">Android 13 BLE 5.3</td></tr><tr><td valign="top">ONE PLUS 12R</td><td valign="top">Android 15 BLE 5.3</td></tr><tr><td valign="top">Infinix NOTE 50X 5G</td><td valign="top">Android 15 BLE 5.4</td></tr><tr><td valign="top">Redmi 7A</td><td valign="top">Android 10 BLE 4.2</td></tr><tr><td valign="top">iTel</td><td valign="top">Android 14 BLE 5.0</td></tr><tr><td valign="top">Xiaomi Redmi NOTE 13 Pro</td><td valign="top">Android 15 BLE 5.2</td></tr></tbody></table>

### Browser Versions

Used the below browser versions in testing INJI Verify

* Chrome: Version 123.0.6312.124
* Firefox: Version 125.0.1
* Edge: Version 124.0.2478.51
* Safari : Version 17



### Test Environment

Table 3: Test Environment

<table data-header-hidden><thead><tr><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Images (qa-inji1 env)</td></tr><tr><td valign="top">injistackqa/inji-verify-service:0.18.x</td></tr><tr><td valign="top">injistackqa/inji-verify-ui:0.18.x</td></tr><tr><td valign="top">injistackqa/inji-certify-with-plugins:0.14.x</td></tr><tr><td valign="top">injistackqa/inji-web:develop</td></tr></tbody></table>



<table data-header-hidden><thead><tr><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Images (released env)</td></tr><tr><td valign="top">injistack/apitest-mimoto:0.22.0</td></tr><tr><td valign="top">injistack /inji-verify-service:0.17.0</td></tr><tr><td valign="top">injistack /inji-verify-ui:0.17.0</td></tr><tr><td valign="top">injistackqa/inji-certify-with-plugins:0.14.0</td></tr><tr><td valign="top">mosipid/authentication-demo-service:1.2.0.1</td></tr><tr><td valign="top">mosipid/authentication-internal-service:1.3.0</td></tr><tr><td valign="top">mosipid /authentication-otp-service:1.3.0</td></tr></tbody></table>



### Test Execution Report

Test case execution summary

Table 4: Test Execution Summary

<table><thead><tr><th width="280.65625" valign="top">Platform</th><th valign="top">Total</th><th valign="top">Pass</th><th valign="top">Fail</th><th valign="top">Skip</th></tr></thead><tbody><tr><td valign="top">INJI Verify</td><td valign="top">1426</td><td valign="top">1339</td><td valign="top">87</td><td valign="top">0</td></tr><tr><td valign="top">                              Test Rate: 100% With Pass Rate: 93%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

### Automation INJI Verify UI

Table 6: UI Automation

<table><thead><tr><th width="293.171875" valign="top">Total</th><th valign="top">Pass</th><th valign="top">Fail</th><th valign="top">Known Issues</th><th valign="top">Ignored</th></tr></thead><tbody><tr><td valign="top">48</td><td valign="top">45</td><td valign="top">0</td><td valign="top">3</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100% With Pass Rate: 100%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

### Automation INJI Verify API&#x20;

Table 7: API Automation Result

<table data-header-hidden><thead><tr><th width="295.9453125" valign="top">Total</th><th valign="top">Pass</th><th valign="top">Fail</th><th valign="top">Known Issues</th><th valign="top">Ignored</th></tr></thead><tbody><tr><td valign="top">118</td><td valign="top">118</td><td valign="top">0</td><td valign="top">0</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100% With Pass Rate: 100%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

### Defect Metrics

Defect Metrics for the Release 0.18.0

The following table depicts only the bugs which are found and not addressed in the current release.&#x20;

Table 8: Defect Metrics for the Release

<table><thead><tr><th width="289.38671875" valign="top">Blocker</th><th valign="top">Critical</th><th valign="top">Major</th><th valign="top">Minor</th><th valign="top">Total</th></tr></thead><tbody><tr><td valign="top">0</td><td valign="top">0</td><td valign="top">8</td><td valign="top">2</td><td valign="top">10</td></tr></tbody></table>

### Known Issues Metrics

This section focuses on a separate category of issues that are known but not addressed in the current release. It provides a count and severity distribution for these defects across releases.

Table 9: Defect Metrics for the known issues

<table><thead><tr><th valign="top">Blocker</th><th valign="top">Critical</th><th valign="top">Major</th><th valign="top">Minor</th><th valign="top">Total</th></tr></thead><tbody><tr><td valign="top">0</td><td valign="top">0</td><td valign="top">46</td><td valign="top">9</td><td valign="top">55</td></tr></tbody></table>

### Conclusion

This section summarizes the key findings of test execution. It also provides a final QA recommendation on the build's readiness for release. The functional verification for Inji-verify version 0.18.0 has been successfully completed. The testing cycle achieved a 100% execution rate with a 93% pass rate across a total of 1426 test cases. Additionally, API automation achieved a 100% pass rate.

While there are 10 open defects (0 Critical, 8 Major, 2 Minor) and 55 known issues in total, there are zero blocker defects identified. The application has demonstrated functional stability and data integrity consistent with product specifications.

### QA Approval

The build has successfully met the defined exit criteria and is recommended for release. The approval is based on the following satisfied conditions:

* Test Case Execution Completion: 100% of planned scenarios executed.
* Defect Status: No Blocker defects remain open.
* Documentation Sign-off: All test artifacts and reports are finalized.
* Test Environment Stability: The test environment remained stable throughout the execution cycle.



Table 10: Report is signed off details

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Name</td><td valign="top">Functional Role</td><td valign="top">Responsibilities</td></tr><tr><td valign="top">Chaitanya K</td><td valign="top">QA Manager</td><td valign="top"><br></td></tr><tr><td valign="top">Ragini Krishna</td><td valign="top">Senior QA Manager</td><td valign="top"><br></td></tr></tbody></table>

### Appendix

This includes additional reference information for the report. It contains a history of document versions and a list of acronyms and their meanings.

Appendix A: Versions

<table><thead><tr><th valign="middle"></th><th valign="middle">Date</th><th valign="middle">Author</th><th valign="top">Reviewers</th></tr></thead><tbody><tr><td valign="middle">V1.0</td><td valign="middle">29/4/2026</td><td valign="middle">Santosh</td><td valign="top"><p>Chaitanya K</p><p>Ragini Krishna</p></td></tr></tbody></table>

### Document History

It outlines the strategy used to ensure a comprehensive evaluation.

<table data-header-hidden><thead><tr><th valign="middle">Version</th><th valign="middle">Author</th><th valign="middle">Date</th><th valign="top">Review</th><th valign="top">Affected Sections</th></tr></thead><tbody><tr><td valign="middle">V1.0</td><td valign="middle">Santhosh</td><td valign="middle">29/4/2026</td><td valign="top"><ol><li>Chaitanya Kesiraju</li><li>Ragini Krishna</li></ol></td><td valign="top">New Document</td></tr></tbody></table>

Github link for more on reports is [here](https://github.com/mosip/test-management/tree/master/inji%20verify/0.18.0).&#x20;
