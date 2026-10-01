# Test Report

### Introduction <a href="#toc241076018" id="toc241076018"></a>

The scope of testing is to verify fitment to the specification from the perspective of

* Enhancing the performance of MOSIP Platform v1.2.1.x -
* [https://github.com/mosip/registration/issues/2384](https://github.com/mosip/registration/issues/2384)
* [https://github.com/mosip/registration/issues/2382](https://github.com/mosip/registration/issues/2382)

### Overview and Scope <a href="#toc241076019" id="toc241076019"></a>

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, Verification scope required comprehensive automation testing for all the MOSIP APIs. An automation Test Rig is created for the same.

### Test Approach <a href="#toc241076020" id="toc241076020"></a>

The verification methods may differ based on how the need was addressed.

MOSIP Test Rig covers the end to end test execution and reporting. The end to end functional test scenarios are written starting from pre-registration, to creation of packet in registration center, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutation and combinations of cases being covered. MOSIP Test Rig will be an open source artifact which can also be enhanced and used by countries to validate the SI deliveries before going live.

### Test Organization <a href="#toc17829893" id="toc17829893"></a>

This part lists the team members involved in the testing process and their responsibilities. It clarifies who is accountable for which roles.

**Table 1**: Test Organization

<table><thead><tr><th width="167.47265625">Name</th><th width="186.4375">Functional Role</th><th>Responsibilities</th></tr></thead><tbody><tr><td></td><td></td><td></td></tr><tr><td>Ragini Krishna</td><td>Manager</td><td>Defining test strategy, managing QA activities, and ensuring overall product quality.</td></tr><tr><td>Prathmesh Jadhav</td><td>Lead/ Test engineer</td><td>Developing and executing test cases, logging defects, and verifying deployment, functional and automation testing.</td></tr></tbody></table>

### Test Planning <a href="#toc17829895" id="toc17829895"></a>

### Functional test results <a href="#toc241076023" id="toc241076023"></a>

Below are the test metrics by performing functional testing using mock MDS, mock Auth and mock ABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

The Test Planning section outlines the strategy and activities planned for executing the testing process to ensure comprehensive coverage.

### Test Environment <a href="#toc241076024" id="toc241076024"></a>

This section details the specific environments used for testing. It lists the different platforms, and the versions of the images used.

**Table 2**: Test Environments

| Environment     | Details            |
| --------------- | ------------------ |
| 131ga.mosip.net | Java21 environment |

### Docker versions in 131ga environment: <a href="#toc241076025" id="toc241076025"></a>

<table data-header-hidden><thead><tr><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">docker.io/mosipdev/activemq-artemis:2.39.0</td></tr><tr><td valign="bottom">docker.io/mosipdev/alpine:latest</td></tr><tr><td valign="bottom">docker.io/mosipdev/artifactory-server:release-1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipdev/keys-generator:release-1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipdev/keys-generator:release-1.4.x</td></tr><tr><td valign="bottom">docker.io/mosipdev2/apitest-resident:release-1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipid/admin-service:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/admin-ui:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/apitest-auth:1.3.1-rc.1</td></tr><tr><td valign="bottom">docker.io/mosipid/apitest-idrepo:1.3.1-rc.1</td></tr><tr><td valign="bottom">docker.io/mosipid/apitest-masterdata:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/apitest-pms:1.2.2.4</td></tr><tr><td valign="bottom">docker.io/mosipid/apitest-prereg:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/artifactory-server:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/captcha-validation-service:0.1.1</td></tr><tr><td valign="bottom">docker.io/mosipid/clamav:1.3.0_base</td></tr><tr><td valign="bottom">docker.io/mosipid/digital-card-service:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/dsl-orchestrator:1.5.0</td></tr><tr><td valign="bottom">docker.io/mosipid/dsl-packetcreator:1.5.0</td></tr><tr><td valign="bottom">docker.io/mosipid/esignet:1.4.1</td></tr><tr><td valign="bottom">docker.io/mosipid/hotlist-service:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/kafka:3.2.1-debian-11-r9</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-auth-service:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-masterdata-service:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-otpmanager-service:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-syncdata-service:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/keycloak-init:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/keycloak-init:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/masterdata-loader:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/minio:2025.2.28-debian-12-r1</td></tr><tr><td valign="bottom">docker.io/mosipid/mock-relying-party-service:0.9.3</td></tr><tr><td valign="bottom">docker.io/mosipid/mock-relying-party-ui:0.9.3</td></tr><tr><td valign="bottom">docker.io/mosipid/mock-smtp:1.0.0</td></tr><tr><td valign="bottom">docker.io/mosipid/mosip-artemis-keycloak:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/mosip-file-server:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/oidc-ui:1.4.1</td></tr><tr><td valign="bottom">docker.io/mosipid/partner-management-service:1.2.2.3</td></tr><tr><td valign="bottom">docker.io/mosipid/partner-onboarder:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/partner-onboarder:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/pmp-revamp-ui:1.2.2.3</td></tr><tr><td valign="bottom">docker.io/mosipid/policy-management-service:1.2.2.3</td></tr><tr><td valign="bottom">docker.io/mosipid/postgres-init:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/postgres-init:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/postgresql:14.2.0-debian-10-r70</td></tr><tr><td valign="bottom">docker.io/mosipid/pre-registration-application-service:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/pre-registration-batchjob:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/pre-registration-datasync-service:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/pre-registration-ui:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/print:1.3.1</td></tr><tr><td valign="bottom">docker.io/mosipid/redis:7.0.5-debian-11-r25</td></tr><tr><td valign="bottom">docker.io/mosipid/regclient-keystore:1.0.0</td></tr><tr><td valign="bottom">docker.io/mosipid/registration-client:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/resident-service:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/resident-ui:0.9.1</td></tr><tr><td valign="bottom">docker.io/mosipid/softhsm:v2</td></tr><tr><td valign="bottom">docker.io/mosipid/uitest-admin:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/zookeeper:3.8.0-debian-11-r30</td></tr><tr><td valign="bottom">docker.io/mosipqa/authentication-internal-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/authentication-otp-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/authentication-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/biosdk-server:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/commons-packet-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/consolidator-websub-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/credential-request-generator:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/credential-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/data-share-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/id-repository-identity-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/id-repository-salt-generator:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/id-repository-vid-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-auditmanager-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-config-server:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-idgenerator-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-keymanager-service:1.4.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-notification-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-pridgenerator-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-ridgenerator-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-salt-generator:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/mock-abis:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/mock-mv:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/pre-registration-booking-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-common-camel-bridge:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-dmz-packet-server:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-landing-zone:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-notification-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-registration-status-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-registration-transaction-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-reprocessor:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-1:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-2:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-3:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-4:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-5:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-6:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-7:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-workflow-manager-service:1.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/uitest-resident:develop</td></tr><tr><td valign="bottom">docker.io/mosipqa/websub-service:1.3.x</td></tr><tr><td valign="bottom">mosipdev2/apitest-resident:release-1.3.x</td></tr><tr><td valign="bottom">mosipid/apitest-auth:1.3.1-rc.1</td></tr><tr><td valign="bottom">mosipid/apitest-idrepo:1.3.1-rc.1</td></tr><tr><td valign="bottom">mosipid/apitest-masterdata:1.3.1</td></tr><tr><td valign="bottom">mosipid/apitest-pms:1.2.2.4</td></tr><tr><td valign="bottom">mosipid/apitest-prereg:1.3.0</td></tr><tr><td valign="bottom">mosipid/clamav:1.3.0_base</td></tr><tr><td valign="bottom">mosipid/keycloak-init:1.2.0.2</td></tr><tr><td valign="bottom">mosipid/keycloak-init:1.3.0</td></tr><tr><td valign="bottom">mosipid/masterdata-loader:1.3.0</td></tr><tr><td valign="bottom">mosipid/postgres-init:1.2.0.1</td></tr><tr><td valign="bottom">mosipid/postgres-init:1.3.0</td></tr><tr><td valign="bottom">mosipid/regclient-keystore:1.0.0</td></tr><tr><td valign="bottom">mosipid/softhsm:v2</td></tr><tr><td valign="bottom">mosipqa/kernel-config-server:1.3.x</td></tr></tbody></table>

### In-Scope testing: <a href="#toc241076026" id="toc241076026"></a>

* Enhancing the performance of MOSIP Platform v1.2.1.x -
* [https://github.com/mosip/registration/issues/2384](https://github.com/mosip/registration/issues/2384)
* [https://github.com/mosip/registration/issues/2382](https://github.com/mosip/registration/issues/2382)
* The performance release was verified using API Test Rigs for all the below modules, along with a full DSL Automation run.
* IDA
* IDRepo
* Masterdata
* Partner
* Pre-Registration
* Resident
* Important: The PMS 1.2.2.3 DB and server and PMS 1.2.2.4 test automation were used for certifying this release.
* An intermittent issue was observed with IDRepo, where the test rig fails on test case during the Update Identity operation. The IDRepo logs show the following error: “Unable to perform DB operation.” The issue is intermittent and occurs during the identity update flow.
* UI Test rigs were out of scope for the v1.2.1.1 release.

### Out-of-Scope Testing: <a href="#toc241076027" id="toc241076027"></a>

* UI test automation
* Docker compose testing
* Deployment testing
* Real device testing
* Upgrade testing

### Functional test results Below <a href="#toc184990131" id="toc184990131"></a>

Below are the test metrics by performing functional testing using mock MDS, mock Auth and mock ABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

### API Based Testing <a href="#toc241076029" id="toc241076029"></a>

**Table 3**: API & DSL Test results

<table data-header-hidden><thead><tr><th width="226.8046875"></th><th width="80.8984375"></th><th width="100.17578125"></th><th width="85.01953125"></th><th width="83.7890625"></th><th width="85.1640625"></th><th></th></tr></thead><tbody><tr><td colspan="7"><strong>Env Name: 131ga.mosip.net</strong></td></tr><tr><td>Module</td><td>Total</td><td>Pass</td><td>Skip</td><td>Fail</td><td>Ignored</td><td>Known Issues</td></tr><tr><td>IDRepo - API Testrig</td><td>414</td><td>336</td><td>0</td><td>0</td><td>78</td><td>0</td></tr><tr><td>IDA - API Testrig</td><td>612</td><td>598</td><td>0</td><td>0</td><td>5</td><td>9</td></tr><tr><td>Masterdata - API Testrig</td><td>945</td><td>945</td><td>0</td><td>0</td><td>0</td><td><br></td></tr><tr><td>Partner - API Testrig</td><td>511</td><td>499</td><td>0</td><td>0</td><td>0</td><td>12</td></tr><tr><td>Resident - API Testrig</td><td>1186</td><td>1179</td><td>0</td><td>0</td><td>0</td><td>7</td></tr><tr><td>DSL</td><td>240</td><td>208</td><td>0</td><td>0</td><td>0</td><td>32</td></tr></tbody></table>

### Detailed Test metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

### Conclusion <a href="#toc241076031" id="toc241076031"></a>

* Functional testing was completed in accordance with the approach of enhancing the performance of MOSIP Platform document. The basic functionality of all modules is working as expected in the 131ga.mosip.net environment.
* QA Approved build release.

### QA Approval <a href="#toc241076032" id="toc241076032"></a>

Build has met the defined exit criteria and is recommended for release.

* Functional testing of RegProc, Reg Proc, ID Repo & IDA modules.
* Automation reports -API and DSL
* Documentation Sign-off
* Test Environment Stability

**Table 4**: Report is signed off details

<table><thead><tr><th width="183.84765625">Name</th><th width="204.63671875">Functional Role</th><th>Responsibilities</th></tr></thead><tbody><tr><td>Ragini Krishna</td><td>Manager</td><td>Defining test strategy, managing QA activities, and ensuring overall product quality.</td></tr><tr><td>Prathmesh Jadhav</td><td>Lead/ Test Engineer</td><td>Leading the test team, planning and executing tests, and ensuring timely delivery of quality results.</td></tr></tbody></table>

### Appendix <a href="#toc241076033" id="toc241076033"></a>

This includes additional reference information for the report. It contains a history of document versions and a list of acronyms and their meanings.

### Appendix A: Versions <a href="#toc241076034" id="toc241076034"></a>

<table><thead><tr><th>Version</th><th>Date</th><th>Author</th><th valign="top">Reviewers</th></tr></thead><tbody><tr><td>v1.0</td><td>17/09/2026</td><td>Prathmesh Jadhav</td><td valign="top">Ragini Krishna</td></tr></tbody></table>

### Appendix B: Acronyms <a href="#toc241076035" id="toc241076035"></a>

| Acronym                                            | Literal Translation                                                                                                         |
| -------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| <p>Reg.Client</p><p>PreReg</p><p>ABIS</p><p>MV</p> | <p>Registration Client</p><p>Pre-Registration</p><p>Automated Biometric Identification System</p><p>Manual Verification</p> |

### Document History

It outlines the strategy used to ensure a comprehensive evaluation.

<table><thead><tr><th>Version</th><th>Author</th><th>Date</th><th valign="top">Review</th><th valign="top">Affected Sections</th></tr></thead><tbody><tr><td>v1.0</td><td>Prathmesh Jadhav</td><td>17/09/2026</td><td valign="top">Ragini Krishna</td><td valign="top"><br></td></tr></tbody></table>

<br>

