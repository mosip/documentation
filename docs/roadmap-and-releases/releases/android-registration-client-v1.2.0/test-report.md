# Test Report

## Introduction <a href="#toc244096960" id="toc244096960"></a>

The scope of testing is to verify fitment to the specification from the perspective of

* Functionality
* Configurability
* Customizability

### Overview and Scope <a href="#toc244096961" id="toc244096961"></a>

The ARC (Android Registration Client) v1.2.0 verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries.

### Main Features Verified <a href="#toc244096962" id="toc244096962"></a>

ARC (Android Registration Client) testing covers the following flows and features. _Feature testing for ARC 1.2.0 has been completed using Mock MDS._

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
* Center Remapping
* Download pre-registration data

## Test Approach <a href="#toc244096963" id="toc244096963"></a>

The Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.

&#x20;Functionality

&#x20;Combination

&#x20;UI Automation

### Verified configuration <a href="#toc205568701" id="toc205568701"></a>

Verification is performed on various configurations as mentioned below

* Configuration with 6 Language (Eng, Ara, Fra, Hin, Tam, Kan)

### Limitations/Out of Scope <a href="#toc205568702" id="toc205568702"></a>

* Handles feature with Update UIN
* Real biometric device, ABIS and BioSDK
* Deployment and docker compose testing

## Test Organization <a href="#toc17829893" id="toc17829893"></a>

This part lists the team members involved in the testing process and their responsibilities. It clarifies who is accountable for which roles.

**Table 1**: Test Organization

| Name               | Functional Role          | Responsibilities                                                                                      |
| ------------------ | ------------------------ | ----------------------------------------------------------------------------------------------------- |
| Ragini Krishna     | Manager                  | Defining test strategy, managing QA activities, and ensuring overall product quality.                 |
| Prathmesh Jadhav   | Lead                     | Leading the test team, planning and executing tests, and ensuring timely delivery of quality results. |
| G Famuda Mubashira | Test engineer            | Developing and executing test cases, logging defects, and verifying software quality.                 |
| Damodar Guru       | Automation Test engineer | Developing and executing test cases, logging defects, and verifying software quality.                 |

### Test Planning <a href="#toc17829895" id="toc17829895"></a>

* Review the Android Registration Client (ARC) requirements, features, and supported Android devices.
* Prepare test scenarios for installation, operator authentication, resident registration, and demographic data validation.
* Validate biometric capture, document upload, and registration packet generation.
* Test offline registration, data synchronization, and configuration updates.
* Verify backend integration, packet submission, error handling, and security validations.
* Execute functional, regression, and compatibility testing, and report defects with detailed evidence.

### Test Environment <a href="#toc511955799" id="toc511955799"></a>

* ARC version 1.2.0 testing was conclude in [https://131ga.mosip.net/](https://131ga.mosip.net/)

**Table 2**: Test Environment -images

<table data-header-hidden><thead><tr><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">docker.io/mosipdev/activemq-artemis:2.39.0</td></tr><tr><td valign="bottom">docker.io/mosipdev/alpine:latest</td></tr><tr><td valign="bottom">docker.io/mosipdev/apitest-idrepo:release-1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipdev/apitest-prereg:release-1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipdev/apitest-resident:release-1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipdev/artifactory-server:release-1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipdev/dsl-orchestrator:release-1.6.x</td></tr><tr><td valign="bottom">docker.io/mosipdev/dsl-packetcreator:release-1.6.x</td></tr><tr><td valign="bottom">docker.io/mosipdev/uitest-pmp-v2:develop</td></tr><tr><td valign="bottom">docker.io/mosipid/admin-service:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/admin-ui:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/apitest-auth:1.3.1-rc.1</td></tr><tr><td valign="bottom">docker.io/mosipid/apitest-esignet:1.6.2</td></tr><tr><td valign="bottom">docker.io/mosipid/apitest-masterdata:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/artifactory-server:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/captcha-validation-service:0.1.1</td></tr><tr><td valign="bottom">docker.io/mosipid/clamav:1.3.0_base</td></tr><tr><td valign="bottom">docker.io/mosipid/digital-card-service:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/dsl-orchestrator:1.5.0</td></tr><tr><td valign="bottom">docker.io/mosipid/dsl-packetcreator:1.5.0</td></tr><tr><td valign="bottom">docker.io/mosipid/esignet-with-plugins:1.6.2</td></tr><tr><td valign="bottom">docker.io/mosipid/esignet-with-plugins:1.8.0</td></tr><tr><td valign="bottom">docker.io/mosipid/esignet:1.4.1</td></tr><tr><td valign="bottom">docker.io/mosipid/hotlist-service:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/kafka:3.2.1-debian-11-r9</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-auth-service:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-masterdata-service:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-otpmanager-service:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-syncdata-service:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/keycloak-init:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/keycloak-init:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/masterdata-loader:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/minio-client-util</td></tr><tr><td valign="bottom">docker.io/mosipid/minio-client-util:latest</td></tr><tr><td valign="bottom">docker.io/mosipid/minio:2025.2.28-debian-12-r1</td></tr><tr><td valign="bottom">docker.io/mosipid/mock-relying-party-service:0.11.2</td></tr><tr><td valign="bottom">docker.io/mosipid/mock-relying-party-service:0.13.0</td></tr><tr><td valign="bottom">docker.io/mosipid/mock-relying-party-service:0.9.3</td></tr><tr><td valign="bottom">docker.io/mosipid/mock-relying-party-ui:0.11.2</td></tr><tr><td valign="bottom">docker.io/mosipid/mock-relying-party-ui:0.13.0</td></tr><tr><td valign="bottom">docker.io/mosipid/mock-relying-party-ui:0.9.3</td></tr><tr><td valign="bottom">docker.io/mosipid/mock-smtp:1.0.0</td></tr><tr><td valign="bottom">docker.io/mosipid/mosip-artemis-keycloak:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/mosip-file-server:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/oidc-ui:1.4.1</td></tr><tr><td valign="bottom">docker.io/mosipid/oidc-ui:1.6.2</td></tr><tr><td valign="bottom">docker.io/mosipid/oidc-ui:1.8.0</td></tr><tr><td valign="bottom">docker.io/mosipid/partner-onboarder:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/partner-onboarder:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/postgres-init:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/postgres-init:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/postgresql:14.2.0-debian-10-r70</td></tr><tr><td valign="bottom">docker.io/mosipid/pre-registration-ui:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/print:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/redis:7.0.5-debian-11-r25</td></tr><tr><td valign="bottom">docker.io/mosipid/regclient-keystore:1.0.0</td></tr><tr><td valign="bottom">docker.io/mosipid/registration-client:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/resident-ui:0.9.1</td></tr><tr><td valign="bottom">docker.io/mosipid/softhsm:v2</td></tr><tr><td valign="bottom">docker.io/mosipid/uitest-admin:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/zookeeper:3.8.0-debian-11-r30</td></tr><tr><td valign="bottom">docker.io/mosipqa/apitest-pms:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/authentication-internal-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/authentication-otp-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/authentication-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/biosdk-server:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/commons-packet-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/consolidator-websub-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/credential-request-generator:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/credential-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/data-share-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/id-repository-identity-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/id-repository-salt-generator:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/id-repository-vid-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-auditmanager-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-config-server:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-idgenerator-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-keymanager-service:1.4.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-notification-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-pridgenerator-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-ridgenerator-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-salt-generator:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/mock-abis:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/mock-mv:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/partner-management-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/pmp-ui-v2:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/policy-management-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/pre-registration-application-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/pre-registration-batchjob:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/pre-registration-booking-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/pre-registration-datasync-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-common-camel-bridge:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-dmz-packet-server:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-landing-zone:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-notification-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-registration-status-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-registration-transaction-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-reprocessor:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-1:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-2:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-3:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-4:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-5:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-6:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-7:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-workflow-manager-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/resident-service:develop</td></tr><tr><td valign="bottom">docker.io/mosipqa/uitest-resident:develop</td></tr><tr><td valign="bottom">docker.io/mosipqa/websub-service:1.3.x</td></tr><tr><td valign="bottom">mosipdev/apitest-idrepo:release-1.3.x</td></tr><tr><td valign="bottom">mosipdev/apitest-prereg:release-1.3.x</td></tr><tr><td valign="bottom">mosipdev/apitest-resident:release-1.3.x</td></tr><tr><td valign="bottom">mosipid/apitest-auth:1.3.1-rc.1</td></tr><tr><td valign="bottom">mosipid/apitest-esignet:1.6.2</td></tr><tr><td valign="bottom">mosipid/apitest-masterdata:1.3.1</td></tr><tr><td valign="bottom">mosipid/clamav:1.3.0_base</td></tr><tr><td valign="bottom">mosipid/keycloak-init:1.2.0.2</td></tr><tr><td valign="bottom">mosipid/keycloak-init:1.3.0</td></tr><tr><td valign="bottom">mosipid/masterdata-loader:1.3.0</td></tr><tr><td valign="bottom">mosipid/postgres-init:1.2.0.1</td></tr><tr><td valign="bottom">mosipid/postgres-init:1.3.0</td></tr><tr><td valign="bottom">mosipid/regclient-keystore:1.0.0</td></tr><tr><td valign="bottom">mosipid/softhsm:v2</td></tr><tr><td valign="bottom">mosipqa/apitest-pms:1.3.x</td></tr><tr><td valign="bottom">mosipqa/kernel-config-server:1.3.x</td></tr></tbody></table>

## Functional test results <a href="#toc244096969" id="toc244096969"></a>

Below are the test metrics by performing functional testing using mock MDS, mock Auth and mock ABIS. The process followed was black box testing which based on its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations. The Test Planning section outlines the strategy and activities planned for executing the testing process to ensure comprehensive coverage.

**Table 3**: Test Case - Manual Verification (UI):

<table data-header-hidden><thead><tr><th></th><th></th><th></th><th></th></tr></thead><tbody><tr><td>Total</td><td>Passed</td><td>Failed</td><td>Skipped (N/A)</td></tr><tr><td>1220</td><td>1014</td><td>177</td><td>29</td></tr><tr><td colspan="4">Test Rate: 99% With Pass Rate: 88%</td></tr></tbody></table>

**Table 4**: UI Automation Reports (Locally Run):

<table data-header-hidden><thead><tr><th></th><th></th><th></th><th></th></tr></thead><tbody><tr><td>Total</td><td>Passed</td><td>Failed</td><td>Skipped (N/A)</td></tr><tr><td>25</td><td>25</td><td>0</td><td>0</td></tr><tr><td colspan="4">Test Rate: 100% With Pass Rate: 100%</td></tr></tbody></table>

### Detailed Test metrics <a href="#toc205568706" id="toc205568706"></a>

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all failed test cases. (Number of failed tests / Total number of test cases executed) x 100

## Feature Health <a href="#toc244096971" id="toc244096971"></a>

ARC APK Git Commit ID: edc066f6ce111f68b4c95adc23988071be840172

Client Version: 1.3.1

## Known Issues <a href="#toc244096972" id="toc244096972"></a>

[Issues · mosip/android-registration-client](https://github.com/mosip/android-registration-client/issues?q=is%3Aissue+state%3Aopen\&page=2)

### Observations <a href="#toc244096973" id="toc244096973"></a>

* ARC (Android Registration Client) was tested with mock MDS and ABIS across all supported languages - English, French, and Arabic.
* The application behavior was consistent and functioned as expected in all three languages, with no functional deviations observed.
* Multilingual support, including UI rendering and flow execution, worked seamlessly during testing.

## Sonar Report

## Conclusion <a href="#toc244096974" id="toc244096974"></a>

The ARC (Android Registration Client) testing was successfully executed using mock MDS and ABIS across all supported languages (English, French, and Arabic). All critical functionalities and flows were validated, and the application performed as expected without any critical/blocker functional issues.

* Test execution has been completed for the planned scope, and all key flows have been verified successfully
* No critical or high-severity defects impacting the core functionality were identified
* Multilingual support is working as expected across all tested languages
* Compatible with MOSIP version 1.2.1.0
* Testing was conducted using mock integrations; hence, end-to-end validation with actual MDS, BioSDK and ABIS is recommended.

### QA Recommendation

* Based on the current test results, the build is QA approved for release, with a note to perform validation with real MDS and ABIS in subsequent phases.

#### QA Approval <a href="#toc244096975" id="toc244096975"></a>

* The build has met the defined exit criteria and is recommended for release based on the following:
* Test Case Execution Completion: All planned test cases have been executed successfully within the defined scope
* Defect Status Closure: All critical and high-severity defects have been resolved or addressed appropriately
* Automation Reports – UI: UI automation execution has been completed, and results are within acceptable limits
* Documentation Sign-off: All relevant QA documents, including test cases and reports, have been reviewed and signed off
* Test Environment Stability: The test environment remained stable throughout the execution, with no major environment-related blockers

#### Final Status:

* The build is QA approved and recommended for release.

\
**Table 5**: Report is signed off details

| Name             | Functional Role | Responsibilities                                                                                      |
| ---------------- | --------------- | ----------------------------------------------------------------------------------------------------- |
| Ragini Krishna   | Manager         | Defining test strategy, managing QA activities, and ensuring overall product quality.                 |
| Prathmesh Jadhav | Lead            | Leading the test team, planning and executing tests, and ensuring timely delivery of quality results. |

## Appendix <a href="#toc244096976" id="toc244096976"></a>

This includes additional reference information for the report. It contains a history of document versions and a list of acronyms and their meanings.

### Appendix A: Versions <a href="#toc244096977" id="toc244096977"></a>

<table data-header-hidden><thead><tr><th></th><th></th><th></th><th valign="top"></th></tr></thead><tbody><tr><td>Version</td><td>Date</td><td>Author</td><td valign="top">Reviewers</td></tr><tr><td>V1.2</td><td>15/10/2026</td><td>G Famuda Mubashira</td><td valign="top">Ragini Krishna Murthy</td></tr></tbody></table>

### Appendix B: Acronyms <a href="#toc244096978" id="toc244096978"></a>

| Acronym               | Literal Translation                                                                |
| --------------------- | ---------------------------------------------------------------------------------- |
| <p>ARC</p><p>ABIS</p> | <p>Android Registration Client</p><p>Automated Biometric Identification System</p> |

### Document History

It outlines the strategy used to ensure a comprehensive evaluation.

<table data-header-hidden><thead><tr><th></th><th></th><th></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td>Version</td><td>Author</td><td>Date</td><td valign="top">Review</td><td valign="top">Affected Sections</td></tr><tr><td>V1</td><td>G Famuda Mubashira</td><td>15/10/2026</td><td valign="top">Ragini Krishna Murthy</td><td valign="top"><br></td></tr></tbody></table>

