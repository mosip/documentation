# Test Report

## Introduction <a href="#toc231915711" id="toc231915711"></a>

The scope of testing is to verify fitment to the specification from the perspective of

* Functionality
* Configurability
* Customizability

### Overview and Scope <a href="#toc231915712" id="toc231915712"></a>

The ARC (Android Registration Client) v1.1.1 verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries.

## Main Features Verified <a href="#toc231915713" id="toc231915713"></a>

The ARC (Android Registration Client) testing scope covers the following flows and features:

* Logging and Logout into ARC
* Adding machine details
* Consent page verification
* Demographic data input
* Document upload
* Biometric data verification
* Preview screen evaluation
* Authentication and Acknowledgement Screens
* Syncing and uploading
* Audit logging & Notification
* Dashboard
* Operator Onboarding and Update Operator biometrics
* Export Packet
* Pending approvals
* ARC packets processing in Registration process
* Handles Email Id/Phone Number
* New, Update, Biometric Correction flow and Lost flows
* Forgot and Reset Password
* Settings (Global, Scheduled Jobs, and Device)
* GPS and Auto logout
* ARC on Mobile with landscape support
* Configuration scenarios

## Test Approach <a href="#toc231915714" id="toc231915714"></a>

The Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.

&#x20;Functionality

&#x20;Combination

&#x20;UI Automation

## Verified configuration <a href="#toc205568701" id="toc205568701"></a>

Verification is performed on various configurations as mentioned below

* Configuration with 3 Language (Eng, Ara, and Fra)

## Limitations/Out of Scope <a href="#toc205568702" id="toc205568702"></a>

* Handles feature with Update UIN
* Real biometric device, ABIS and BioSDK
* Deployment and docker compose testing

## Feature Health <a href="#toc17829893" id="toc17829893"></a>

<figure><img src="../../../.gitbook/assets/arc-111-tr-feature-health.png" alt=""><figcaption></figcaption></figure>

ARC APK Git Commit ID: 4e4886a83a5a92b2278ae6b0b4861a559c8bdd98

Client Version: 1.3.1

## Test Organization <a href="#toc231915718" id="toc231915718"></a>

This part lists the team members involved in the testing process and their responsibilities. It clarifies who is accountable for which roles.

**Table**: Test Organization

<table><thead><tr><th width="165.48046875">Name</th><th width="156.3671875">Functional Role</th><th>Responsibilities</th></tr></thead><tbody><tr><td>Ragini Krishna</td><td>Manager</td><td>Defining test strategy, managing QA activities, and ensuring overall product quality.</td></tr><tr><td>Chandra Sekhar</td><td>Lead</td><td>Leading the test team, planning and executing tests, and ensuring timely delivery of quality results.</td></tr><tr><td>G Famuda Mubashira</td><td>Test engineer</td><td>Developing and executing test cases, logging defects, and verifying software quality.</td></tr><tr><td>Damodar Guru</td><td>Automation Test engineer</td><td>Developing and executing test cases, logging defects, and verifying software quality.</td></tr></tbody></table>

### Test Planning <a href="#toc17829895" id="toc17829895"></a>

### Functional test results <a href="#toc231915720" id="toc231915720"></a>

Below are the test metrics by performing functional testing using mock MDS, mock Auth and mock ABIS. The process followed was black box testing which based on its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

The Test Planning section outlines the strategy and activities planned for executing the testing process to ensure comprehensive coverage.

<table><thead><tr><th width="294.35546875">Total</th><th>Passed</th><th>Failed</th><th>Skipped (N/A)</th></tr></thead><tbody><tr><td>1039</td><td>914</td><td>122</td><td>3</td></tr><tr><td>Test Rate: 99% With Pass Rate: 88%</td><td></td><td></td><td></td></tr></tbody></table>

### UI Automation Reports (Locally Run): <a href="#toc231915721" id="toc231915721"></a>

<table><thead><tr><th width="298.44140625">Total</th><th>Passed</th><th>Failed</th><th>Skipped (N/A)</th></tr></thead><tbody><tr><td>24</td><td>24</td><td>0</td><td>0</td></tr><tr><td>Test Rate: 100% With Pass Rate: 100%</td><td></td><td></td><td></td></tr></tbody></table>

### Detailed Test metrics <a href="#toc205568706" id="toc205568706"></a>

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all failed test cases. (Number of failed tests / Total number of test cases executed) x 100

### Known Issues <a href="#toc231915723" id="toc231915723"></a>

[Issues · mosip/android-registration-client](https://github.com/mosip/android-registration-client/issues?q=is%3Aissue%20state%3Aopen%20label%3Abug)

### Test Environment <a href="#toc231915724" id="toc231915724"></a>

* ARC version 1.1.1 testing was conducted in the QA (qajava21.mosip.net) environment.

### Observations <a href="#toc231915725" id="toc231915725"></a>

* ARC (Android Registration Client) was tested with mock MDS and ABIS across all supported languages - English, French, and Arabic.
* The application behavior was consistent and functioned as expected in all three languages, with no functional deviations observed.
* Multilingual support, including UI rendering and flow execution, worked seamlessly during testing.

## Conclusion <a href="#toc231915726" id="toc231915726"></a>

The ARC (Android Registration Client) testing was successfully executed using mock MDS and ABIS across all supported languages (English, French, and Arabic). All critical functionalities and flows were validated, and the application performed as expected without any critical/blocker functional issues.

* Test execution has been completed for the planned scope, and all key flows have been verified successfully
* No critical or high-severity defects impacting the core functionality were identified
* Multilingual support is working as expected across all tested languages
* Compatible with MOSIP version 1.2.1.0
* Testing was conducted using mock integrations; hence, end-to-end validation with actual MDS, BioSDK and ABIS is recommended.

### QA Recommendation:

* Based on the current test results, the build is QA approved for release, with a note to perform validation with real MDS and ABIS in subsequent phases.

### QA Approval <a href="#toc231915727" id="toc231915727"></a>

* The build has met the defined exit criteria and is recommended for release based on the following:
* Test Case Execution Completion: All planned test cases have been executed successfully within the defined scope
* Defect Status Closure: All critical and high-severity defects have been resolved or addressed appropriately
* Automation Reports – UI: UI automation execution has been completed, and results are within acceptable limits
* Documentation Sign-off: All relevant QA documents, including test cases and reports, have been reviewed and signed off
* Test Environment Stability: The test environment remained stable throughout the execution, with no major environment-related blockers

Final Status:

* The build is QA approved and recommended for release.



**Table**: Report is signed off details

<table><thead><tr><th width="173.0390625">Name</th><th width="183.43359375">Functional Role</th><th>Responsibilities</th></tr></thead><tbody><tr><td>Ragini Krishna</td><td>Manager</td><td>Defining test strategy, managing QA activities, and ensuring overall product quality.</td></tr><tr><td>Chandra Sekhar</td><td>Lead</td><td>Leading the test team, planning and executing tests, and ensuring timely delivery of quality results.</td></tr></tbody></table>

## Appendix <a href="#toc231915728" id="toc231915728"></a>

This includes additional reference information for the report. It contains a history of document versions and a list of acronyms and their meanings.

### Appendix A: Versions <a href="#toc231915729" id="toc231915729"></a>

<table><thead><tr><th width="122.171875">Version</th><th width="164.109375">Date</th><th>Author</th><th valign="top">Reviewers</th></tr></thead><tbody><tr><td>V1.1</td><td>22/07/2026</td><td>G Famuda Mubashira</td><td valign="top">Ragini Krishna Murthy</td></tr></tbody></table>

### Appendix B: Acronyms <a href="#toc231915730" id="toc231915730"></a>

| Acronym               | Literal Translation                                                                |
| --------------------- | ---------------------------------------------------------------------------------- |
| <p>ARC</p><p>ABIS</p> | <p>Android Registration Client</p><p>Automated Biometric Identification System</p> |

### Document History

It outlines the strategy used to ensure a comprehensive evaluation.

<table><thead><tr><th>Version</th><th>Author</th><th>Date</th><th valign="top">Review</th><th valign="top">Affected Sections</th></tr></thead><tbody><tr><td>V1.1.1</td><td>G Famuda Mubashira</td><td>22/07/2026</td><td valign="top">Ragini Krishna Murthy</td><td valign="top"><br></td></tr></tbody></table>

