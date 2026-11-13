# Test Report

## Introduction <a href="#toc241076018" id="toc241076018"></a>

The scope of this validation is limited to MOSIP-45189 and covers the verification of the fix related to anonymous profile handling in the ID Repository.

### Overview and Scope

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, Verification scope required comprehensive automation testing for all the MOSIP APIs. An automation Test Rig is created for the same.

The reported failure is a row in idrepo.anonymous\_profile whose newProfile is null. AnonymousProfileHelper keeps the request data on a shared object, and buildAndsaveProfile runs asynchronously. Another request can clear that data before the profile is built. The saved JSON then looks like this:

{"processName":"New","oldProfile":null,"newProfile":null}

## Test Approach <a href="#toc241076020" id="toc241076020"></a>

The verification methods may differ based on how the need was addressed.

MOSIP Test Rig covers the end to end test execution and reporting. The end to end functional test scenarios are written starting from pre-registration, to creation of packet in registration center, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutation and combinations of cases being covered. MOSIP Test Rig will be an open source artifact which can also be enhanced and used by countries to validate the SI deliveries before going live.

The check follows IdentityIssuanceProfileBuilder, AnonymousProfileHelper, and ChannelInfoHelper on the anonymous\_profile branch.

The branch properties file points at a remote host and has no database password, so that host was not used. PostgreSQL 16 was installed locally. db\_scripts/mosip\_idrepo/deploy.sh created database mosip\_idrepo, schema idrepo, and the empty tables idrepo.anonymous\_profile and idrepo.channel\_info. DML\_FLAG was 0, so that script inserted no profile data.

## Test Organization <a href="#toc17829893" id="toc17829893"></a>

This part lists the team members involved in the testing process and their responsibilities. It clarifies who is accountable for which roles.

**Table 1**: Test Organization

<table><thead><tr><th width="186.66796875">Name</th><th width="143.53515625">Functional Role</th><th>Responsibilities</th></tr></thead><tbody><tr><td>Ragini Krishna</td><td>Manager</td><td>Defining test strategy, managing QA activities, and ensuring overall product quality.</td></tr><tr><td>Swetha N</td><td>Test engineer</td><td>Developing and executing test cases, logging defects, and verifying deployment, functional and automation testing.</td></tr></tbody></table>

## Test Planning <a href="#toc17829895" id="toc17829895"></a>

### Functional test results <a href="#toc241076023" id="toc241076023"></a>

Functional testing for this story is a database check of the anonymous profile. The source identity is the IdentityIssuanceProfileBuilderTest fixture: date of birth 1972/05/07, gender Male, location BNMR, 14022, RSK, KTA, phone 9395910872, and email test@mosip.net. The plan is to save a profile for each case, read idrepo.anonymous\_profile and idrepo.channel\_info, and compare the stored JSON with the profile rules..

The Test Planning section outlines the strategy and activities planned for executing the testing process to ensure comprehensive coverage.

## Test Environment <a href="#toc241076024" id="toc241076024"></a>

This section details the specific environments used for testing. It lists the different platforms, and the versions of the images used.

Table 2: Test Environments

| Environment       | Details            |
| ----------------- | ------------------ |
| qa11new.mosip.net | Java11 environment |

## Docker versions in qa11new environment: <a href="#toc241076025" id="toc241076025"></a>

<table data-header-hidden><thead><tr><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">docker.io/mosipdev/alpine:latest</td></tr><tr><td valign="bottom">docker.io/mosipid/admin-service:1.2.1.4</td></tr><tr><td valign="bottom">docker.io/mosipid/admin-ui:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/admintest:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/apitest-auth:1.2.1.3</td></tr><tr><td valign="bottom">docker.io/mosipid/apitest-idrepo:1.2.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/apitest-masterdata:1.2.1.3</td></tr><tr><td valign="bottom">docker.io/mosipid/apitest-prereg:1.2.0.3</td></tr><tr><td valign="bottom">docker.io/mosipid/apitest-resident:1.2.1.3</td></tr><tr><td valign="bottom">docker.io/mosipid/artifactory-server:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/artifactory-server:1.2.0.4</td></tr><tr><td valign="bottom">docker.io/mosipid/artifactory-server:1.4.1-ES</td></tr><tr><td valign="bottom">docker.io/mosipid/authentication-internal-service:1.2.1.3</td></tr><tr><td valign="bottom">docker.io/mosipid/authentication-otp-service:1.2.1.3</td></tr><tr><td valign="bottom">docker.io/mosipid/authentication-service:1.2.1.3</td></tr><tr><td valign="bottom">docker.io/mosipid/biosdk-server:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/captcha-validation-service:0.1.0</td></tr><tr><td valign="bottom">docker.io/mosipid/clamav:1.3.0_base</td></tr><tr><td valign="bottom">docker.io/mosipid/commons-packet-service:1.2.0.4</td></tr><tr><td valign="bottom">docker.io/mosipid/config-server:1.1.2</td></tr><tr><td valign="bottom">docker.io/mosipid/consolidator-websub-service:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/data-share-service:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/data-share-service:1.3.0-beta.2</td></tr><tr><td valign="bottom">docker.io/mosipid/digital-card-service:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/dsl-orchestrator:1.2.2.0</td></tr><tr><td valign="bottom">docker.io/mosipid/dsl-orchestrator:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/dsl-packetcreator:1.2.2.0</td></tr><tr><td valign="bottom">docker.io/mosipid/dsl-packetcreator:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/esignet:1.4.1</td></tr><tr><td valign="bottom">docker.io/mosipid/hotlist-service:1.2.1.4</td></tr><tr><td valign="bottom">docker.io/mosipid/id-repository-salt-generator:1.2.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/kafka:3.2.1-debian-11-r9</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-auditmanager-service:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-auth-service:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-idgenerator-service:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-keymanager-service:1.2.1.0</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-masterdata-service:1.2.1.4</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-notification-service:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-otpmanager-service:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-pridgenerator-service:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-ridgenerator-service:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/kernel-syncdata-service:1.2.1.4</td></tr><tr><td valign="bottom">docker.io/mosipid/keycloak-init:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/keys-generator:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/keys-generator:1.3.0-beta.2</td></tr><tr><td valign="bottom">docker.io/mosipid/masterdata-loader:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/minio-client-util</td></tr><tr><td valign="bottom">docker.io/mosipid/minio-client-util:latest</td></tr><tr><td valign="bottom">docker.io/mosipid/minio:2022.2.7-debian-10-r0</td></tr><tr><td valign="bottom">docker.io/mosipid/mock-abis:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/mock-mv:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/mock-relying-party-service:0.9.3</td></tr><tr><td valign="bottom">docker.io/mosipid/mock-relying-party-ui:0.9.3</td></tr><tr><td valign="bottom">docker.io/mosipid/mock-smtp:1.0.0</td></tr><tr><td valign="bottom">docker.io/mosipid/mosip-artemis-keycloak:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/mosip-file-server:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/oidc-ui:1.4.1</td></tr><tr><td valign="bottom">docker.io/mosipid/os-shell:12-debian-12-r46</td></tr><tr><td valign="bottom">docker.io/mosipid/partner-onboarder:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/partner-onboarder:1.3.0</td></tr><tr><td valign="bottom">docker.io/mosipid/pmptest:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/postgres-init:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/postgres-init:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/postgresql:14.2.0-debian-10-r70</td></tr><tr><td valign="bottom">docker.io/mosipid/pre-registration-application-service:1.2.0.3</td></tr><tr><td valign="bottom">docker.io/mosipid/pre-registration-batchjob:1.2.0.3</td></tr><tr><td valign="bottom">docker.io/mosipid/pre-registration-booking-service:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/pre-registration-captcha-service:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/pre-registration-datasync-service:1.2.0.3</td></tr><tr><td valign="bottom">docker.io/mosipid/pre-registration-ui:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/print:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/redis:7.0.5-debian-11-r25</td></tr><tr><td valign="bottom">docker.io/mosipid/registration-client:1.2.0.2</td></tr><tr><td valign="bottom">docker.io/mosipid/resident-service:1.2.1.3</td></tr><tr><td valign="bottom">docker.io/mosipid/resident-ui:0.9.1</td></tr><tr><td valign="bottom">docker.io/mosipid/softhsm:v2</td></tr><tr><td valign="bottom">docker.io/mosipid/websub-service:1.2.0.1</td></tr><tr><td valign="bottom">docker.io/mosipid/zookeeper:3.8.0-debian-11-r30</td></tr><tr><td valign="bottom">docker.io/mosipqa/activemq-artemis:1.1.5</td></tr><tr><td valign="bottom">docker.io/mosipqa/apitest-idrepo:1.2.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/apitest-pms:1.2.2.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/credential-request-generator:1.2.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/credential-service:1.2.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/id-repository-identity-service:1.2.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/id-repository-vid-service:1.2.3.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/kernel-config-server:develop</td></tr><tr><td valign="bottom">docker.io/mosipqa/partner-management-service:1.2.2.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/pmp-revamp-ui:1.2.2.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/policy-management-service:1.2.2.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/postgres-init:develop</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-common-camel-bridge:1.2.1.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-dmz-packet-server:1.2.1.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-landing-zone:1.2.1.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-notification-service:1.2.1.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-registration-status-service:1.2.1.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-registration-transaction-service:1.2.1.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-reprocessor:1.2.1.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-1:1.2.1.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-2:1.2.1.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-3:1.2.1.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-4:1.2.1.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-5:1.2.1.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-6:1.2.1.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-stage-group-7:1.2.1.x</td></tr><tr><td valign="bottom">docker.io/mosipqa/registration-processor-workflow-manager-service:1.2.1.x</td></tr><tr><td valign="bottom">mosipid/apitest-auth:1.2.1.3</td></tr><tr><td valign="bottom">mosipid/apitest-idrepo:1.2.3.0</td></tr><tr><td valign="bottom">mosipid/apitest-masterdata:1.2.1.3</td></tr><tr><td valign="bottom">mosipid/apitest-prereg:1.2.0.3</td></tr><tr><td valign="bottom">mosipid/apitest-resident:1.2.1.3</td></tr><tr><td valign="bottom">mosipid/clamav:1.3.0_base</td></tr><tr><td valign="bottom">mosipid/config-server:1.1.2</td></tr><tr><td valign="bottom">mosipid/keycloak-init:1.2.0.2</td></tr><tr><td valign="bottom">mosipid/masterdata-loader:1.2.0.1</td></tr><tr><td valign="bottom">mosipid/postgres-init:1.2.0.1</td></tr><tr><td valign="bottom">mosipid/postgres-init:1.2.0.2</td></tr><tr><td valign="bottom">mosipid/softhsm:v2</td></tr><tr><td valign="bottom">mosipqa/apitest-idrepo:1.2.3.x</td></tr><tr><td valign="bottom">mosipqa/apitest-pms:1.2.2.x</td></tr><tr><td valign="bottom">mosipqa/kernel-config-server:develop</td></tr><tr><td valign="bottom">mosipqa/postgres-init:develop</td></tr></tbody></table>

## In-Scope testing <a href="#toc241076026" id="toc241076026"></a>

* [https://mosip.atlassian.net/browse/MOSIP-45189?xpis=eyJicmlkZ2UiOiJzbWFydExpbmtzIiwiaWQiOiIxNzkxNDY2Mjg5NzU4Iiwic291cmNlIjoiY29uZmx1ZW5jZSJ9](https://mosip.atlassian.net/browse/MOSIP-45189?xpis=eyJicmlkZ2UiOiJzbWFydExpbmtzIiwiaWQiOiIxNzkxNDY2Mjg5NzU4Iiwic291cmNlIjoiY29uZmx1ZW5jZSJ9)
* [https://github.com/mosip/id-repository/issues/1712](https://github.com/mosip/id-repository/issues/1712)

#### What was checked

* New issuance: processName is New, oldProfile is empty, and newProfile is filled.
* Update: processName is Update, and both oldProfile and newProfile are filled.
* The profile keeps a birth year only, gender, location, channel labels PHONE and EMAIL, verified attributes, and document type codes.
* Name, UIN, full date of birth, phone number, email address, and address are absent from the profile.
* Phone and email counts are only in idrepo.channel\_info, as a hash or as NO\_PHONE / NO\_EMAIL.
* What was reported before the fix:
* {"processName":"New","oldProfile":null,"newProfile":null}
* What was observed after the local script, case verifier:new, on 07/10/2026:
* {"processName":"New","date":"2026-10-07","oldProfile":null,"newProfile":{"yearOfBirth":"1972","gender":"Male","location":\["BNMR","14022","RSK","KTA"],"preferredLanguage":null,"channel":\["PHONE","EMAIL"],"exceptions":\[],"verified":\["x","y"],"biometricInfo":\[],"documents":\["DOC015","DOC006","DOC025","COE"]\}}
* The source phone 9395910872 and email test@mosip.net were not in the stored profile.

## Out-of-Scope Testing:

* UI test automation
* Docker compose testing
* Deployment testing
* Real device testing
* Upgrade testing

## Functional test results Below <a href="#toc184990131" id="toc184990131"></a>

Below are the test metrics by performing functional testing using mock MDS, mock Auth and mock ABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

## API Based Testing <a href="#toc241076029" id="toc241076029"></a>

Table 3: API Test results

<table data-header-hidden><thead><tr><th width="198.6796875">Env Name: qa11new.mosip.net</th><th></th><th></th><th></th><th></th><th></th><th></th></tr></thead><tbody><tr><td colspan="7"><strong>Env Name: qa11new.mosip.net</strong></td></tr><tr><td>Module</td><td>Total</td><td>Pass</td><td>Skip</td><td>Fail</td><td>Ignored</td><td>Known Issues</td></tr><tr><td>IDRepo - API Testrig</td><td>414</td><td>336</td><td>0</td><td>0</td><td>78</td><td>0</td></tr></tbody></table>

### Detailed Test metrics <a href="#toc241076030" id="toc241076030"></a>

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

## Conclusion <a href="#toc241076031" id="toc241076031"></a>

* Functional testing was completed in accordance with the approach of enhancing the performance of MOSIP Platform document. The basic functionality of all modules is working as expected in the 131ga.mosip.net environment.
* QA Approved build release.

## QA Approval <a href="#toc241076032" id="toc241076032"></a>

Build has met the defined exit criteria and is recommended for release.

* Functional testing of ID Repo.
* Automation reports -API
* Documentation Sign-off
* Test Environment Stability

Table 4: Report is signed off details

<table><thead><tr><th width="203.82421875">Name</th><th width="168.31640625">Functional Role</th><th>Responsibilities</th></tr></thead><tbody><tr><td>Ragini Krishna</td><td>Manager</td><td>Defining test strategy, managing QA activities, and ensuring overall product quality.</td></tr><tr><td>Swetha N</td><td>Test Engineer</td><td>Developing and executing test cases, logging defects, and verifying deployment, functional and automation testing</td></tr></tbody></table>

## Appendix <a href="#toc241076033" id="toc241076033"></a>

This includes additional reference information for the report. It contains a history of document versions and a list of acronyms and their meanings.

### Appendix A: Versions <a href="#toc241076034" id="toc241076034"></a>

<table><thead><tr><th>Version</th><th>Date</th><th>Author</th><th valign="top">Reviewers</th></tr></thead><tbody><tr><td>v1.0</td><td>06/11/2026</td><td>Swetha N</td><td valign="top">Ragini Krishna</td></tr></tbody></table>

### Document History

It outlines the strategy used to ensure a comprehensive evaluation.

<table><thead><tr><th>Version</th><th>Author</th><th>Date</th><th valign="top">Review</th><th valign="top">Affected Sections</th></tr></thead><tbody><tr><td>v1.0</td><td>Swetha N</td><td>06/11/2026</td><td valign="top">Ragini Krishna</td><td valign="top"><br></td></tr></tbody></table>

\
To get all the reports please refer here [here](https://github.com/mosip/test-management/blob/master/Platform%20release/1.2.3.1-ID%20Repo%20Anonymous%20Profile%20Release%20Testing/1.2.3.1-ID%20Repo%20Anonymous%20Profile%20Release%20Testing%20Report.docx).<br>
