# Test Report

## Introduction <a href="#toc231479570" id="toc231479570"></a>

The scope of testing for INJI Verify 0.18.1 is to validate the holder binding enhancements introduced in this patch release and ensure compliance with the relevant OpenID4VP and Verifiable Credential verification specifications. Testing includes positive and negative holder binding scenarios, VP result validation, regression testing of existing verification workflows, and assessment of backward compatibility. The objective is to ensure secure, reliable, and interoperable verification across diverse deployment environments and identity ecosystems.

### Overview and Scope <a href="#toc231479571" id="toc231479571"></a>

* Home Page
* Upload Feature
* Scan Feature
* VP Verification
* OVP Flow
* SVG Support
* Multi Language
* Same Device and Cross Device flow
* V2 end point for "statusCheckFilters" and “Claims”

## Test Approach <a href="#toc231479572" id="toc231479572"></a>

The Functional verification of the Inji verify application is performed on Android and iOS platforms to ensure alignment with product specifications and business requirements. Analyzed with respect to functional stability, data integrity, and UI consistency. The validation adopts a persona-based testing strategy, simulating real-world user scenarios across diverse device matrices and multi-language configurations to ensure robustness in both online and offline environments.

* Functionality
* Combination
* Configurability&#x20;
* Customizability
* Library verification (vc-verifier)

## Test Organization <a href="#toc231479573" id="toc231479573"></a>

**Table 1**: Test Organization

<table><thead><tr><th width="169.23828125">Name</th><th width="192.2734375">Functional Role</th><th>Responsibilities</th></tr></thead><tbody><tr><td><p>Nitin Hegde</p><p><br></p></td><td>Lead QA Engineer</td><td>Verifying the functionality, stability of the application, and report preparation. and performing combination testing.</td></tr><tr><td>Chaitanya K</td><td>QA Manager</td><td>Overviewing the test execution and review of the report.</td></tr></tbody></table>

### Test Planning <a href="#toc231479574" id="toc231479574"></a>

* Data Readiness: Validate the availability of all services along with configured identity schemas (UIN/VID) to support biometric and authentication flows.
* Data Strategy: Refresh test data for every cycle by generating new QR codes.
* Coverage Distribution: Execute test scenarios across a broad matrix of browsers on Windows, Android, and iOS devices, spanning multiple user personas to ensure end-to-end compatibility coverage.

### Browser Versions <a href="#toc231479575" id="toc231479575"></a>

Used the below browser versions in testing INJI Verify

* Chrome: Version 123.0.6312.124
* Firefox: Version 125.0.1
* Edge: Version 124.0.2478.51
* Safari : Version 17

### Test Environment <a href="#toc231479576" id="toc231479576"></a>

**Table 2**: Test Environment

<table data-header-hidden><thead><tr><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Images (qa-inji1 env)</td></tr><tr><td valign="top">injistackqa/inji-verify-service:0.18.x</td></tr><tr><td valign="top">injistackqa/inji-verify-ui:0.18.x</td></tr><tr><td valign="top">injistackqa/inji-certify-with-plugins:0.14.x</td></tr><tr><td valign="top">injistackqa/inji-web:develop</td></tr></tbody></table>



<table data-header-hidden><thead><tr><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Images (released env)</td></tr><tr><td valign="top">injistack/apitest-mimoto:0.22.0</td></tr><tr><td valign="top">injistack /inji-verify-service:0.17.0</td></tr><tr><td valign="top">injistack /inji-verify-ui:0.17.0</td></tr><tr><td valign="top">injistackqa/inji-certify-with-plugins:0.14.0</td></tr><tr><td valign="top">mosipid/authentication-demo-service:1.2.0.1</td></tr><tr><td valign="top">mosipid/authentication-internal-service:1.3.0</td></tr><tr><td valign="top">mosipid /authentication-otp-service:1.3.0</td></tr></tbody></table>

### Test Execution Report

### Automation INJI Verify UI <a href="#toc231479578" id="toc231479578"></a>

**Table 3**: UI Automation

<table><thead><tr><th width="224.3828125">Total</th><th>Pass</th><th>Fail</th><th>Known Issues</th><th>Ignored</th></tr></thead><tbody><tr><td>48</td><td>45</td><td>0</td><td>3</td><td>0</td></tr><tr><td>Test Rate: 100% With Pass Rate: 100%</td><td></td><td></td><td></td><td></td></tr></tbody></table>

### Automation INJI Verify API <a href="#toc231479579" id="toc231479579"></a>

**Table 4**: API Automation Result

<table><thead><tr><th width="232.19140625">Total</th><th>Pass</th><th>Fail</th><th>Known Issues</th><th>Ignored</th></tr></thead><tbody><tr><td>123</td><td>123</td><td>0</td><td>0</td><td>0</td></tr><tr><td>Test Rate: 100% With Pass Rate: 100%</td><td></td><td></td><td></td><td></td></tr></tbody></table>

## Conclusion <a href="#toc231479580" id="toc231479580"></a>

This section summarizes the key findings of test execution. It also provides a final QA recommendation on the build's readiness for release. The functional verification for Inji-verify version 0.18.1 has been successfully completed. The testing cycle achieved a 100% execution rate with a 93% pass rate, API automation achieved a 100% pass rate.

While there are 55 known issues in total, there are zero blocker defects identified. The application has demonstrated functional stability and data integrity consistent with product specifications.

### QA Approval <a href="#toc231479581" id="toc231479581"></a>

The build has successfully met the defined exit criteria and is recommended for release. The approval is based on the following satisfied conditions:

* Test Case Execution Completion: 100% of planned scenarios executed.
* Defect Status: No Blocker defects remain open.
* Documentation Sign-off: All test artifacts and reports are finalized.
* Test Environment Stability: The test environment remained stable throughout the execution cycle.<br>

**Table 5**: Report is signed off details

<table><thead><tr><th width="189.66796875">Name</th><th width="204.36328125">Functional Role</th><th>Responsibilities</th></tr></thead><tbody><tr><td>Chaitanya K</td><td>QA Manager</td><td><br></td></tr></tbody></table>

### Appendix

This includes additional reference information for the report. It contains a history of document versions and a list of acronyms and their meanings.

### Appendix A: Versions <a href="#toc231479583" id="toc231479583"></a>

<table><thead><tr><th></th><th>Date</th><th>Author</th><th valign="top">Reviewers</th></tr></thead><tbody><tr><td>V1.0</td><td>3/6/2026</td><td>Nitin Hegde</td><td valign="top">Chaitanya K</td></tr></tbody></table>

For further details on the QA Reports you can refer [here](https://github.com/inji/test-management/tree/master/inji-verify/0.18.1).<br>
