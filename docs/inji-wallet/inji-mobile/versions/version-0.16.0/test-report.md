# Test Report

## Testing Scope <a href="#toc195780513" id="toc195780513"></a>

The scope of testing is to verify fitment to the specification from the perspective of&#x20;

* Functionality
* Deployability
* Configurability
* Customizability

&#x20;Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures the readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, Verification scope required comprehensive automation testing for all the MOSIP APIs. An automation Test Rig is created for the same.

The Inji testing scope revolves around the following flows:&#x20;

* Biometric unlock
* Passcodes unlock
* VC download via MOSIP
* VC download via e-signet
* VC downloads via Sunbird
* Pinning a VC
* Normal VC sharing with VID
* Deleting VC
* Face Auth on Resident's phone with VID
* Multi language support
* Credential registry
* Backup and restore
* Wallet binding
* Deep link navigation
* OpenID4VP
* QR code Login
* Key Management
* Logout

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.

* Functionality&#x20;
* Deployability&#x20;
* Configurability&#x20;
* Customizability

The verification methods may differ based on how the need was addressed.

For regression check, “MOSIP Test Rig” - an automation testing suite - which is indigenously designed and developed for supporting persona-based testing. MOSIP Test Rig covers the end-to-end test execution and reporting. The end-to-end functional test scenarios are written starting from pre-registration to creation of packet in registration center, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutation and combinations of cases being covered. MOSIP Test Rig will be an open-source artifact which can also be enhanced and used by countries to validate the SI deliveries before going live. Persona classes include both negative and positive personas. Negative persona classes include users like Bribed Registration Office, Malicious Insider etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

## Verified configuration

Verification is performed on various configurations as mentioned below

* Default configuration - with 1 Lang

## Feature Health

On Android Device:

\<Image>

On iOS Device:

\<image>

## Test execution statistics

### Functional test results by modules

Below are the test metrics by performing functional testing using mock MDS and mock ABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. The functional test was performed in combination with individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Skipped (N/A)</td></tr><tr><td valign="top">3163</td><td valign="top">2819</td><td valign="top">344</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100% With Pass Rate: 89%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>



Here is the detailed breakdown of metrics for each module:

<table><thead><tr><th width="179.53265380859375" valign="top"></th><th valign="top"></th><th>Test cases</th></tr></thead><tbody><tr><td valign="top"><p> </p><p> </p><p> </p><p>On Android Device</p></td><td valign="top">Total</td><td>1675</td></tr><tr><td valign="top"></td><td valign="top">Passed</td><td>1502</td></tr><tr><td valign="top"></td><td valign="top">Failed</td><td>173</td></tr><tr><td valign="top"></td><td valign="top">Skipped (N/A)</td><td>0</td></tr><tr><td valign="top"><p> </p><p> </p><p> </p><p>On iOS Device</p><p> </p><p> </p></td><td valign="top">Total</td><td>1488</td></tr><tr><td valign="top"></td><td valign="top">Passed</td><td>1317</td></tr><tr><td valign="top"></td><td valign="top">Failed</td><td>171</td></tr><tr><td valign="top"></td><td valign="top">Skipped (N/A)</td><td>0</td></tr></tbody></table>

&#x20;

### API verification results by modules

The below section provides details on API test metrics by executing MOSIP functional automation Framework. All external API test executions were performed at module level isolation. Each end point is tested with the test data and expectations of each test data are mapped to assert the test case.

&#x20;

<table data-header-hidden><thead><tr><th width="149.17474365234375" valign="top"></th><th width="158.32391357421875" valign="top"></th><th width="160.78125" valign="top"></th><th width="165.4027099609375" valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Ignored</td><td valign="top">Skipped</td></tr><tr><td valign="top">176</td><td valign="top">143</td><td valign="top">0</td><td valign="top">33</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100% With Pass Rate: 100%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

### UI Automation results

The below section provides details on Ui Automation by executing MOSIP functional automation Framework.

<table data-header-hidden><thead><tr><th width="258.0653076171875" valign="top"></th><th width="177.75286865234375" valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Skipped</td></tr><tr><td valign="top">122</td><td valign="top">122</td><td valign="top">0</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100% With Pass Rate: 100%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

&#x20;

Here is the detailed breakdown of metrics

&#x20;

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th></th></tr></thead><tbody><tr><td valign="top"> </td><td valign="top">Test cases</td><td></td></tr><tr><td valign="top"><p> </p><p> </p><p> </p><p>Android</p></td><td valign="top">Total</td><td>64</td></tr><tr><td valign="top">Passed</td><td valign="top">64</td><td></td></tr><tr><td valign="top">Failed</td><td valign="top">0</td><td></td></tr><tr><td valign="top">Skipped</td><td valign="top">0</td><td></td></tr><tr><td valign="top"><p> </p><p> </p><p>iOS</p></td><td valign="top">Total</td><td>58</td></tr><tr><td valign="top">Passed</td><td valign="top">58</td><td></td></tr><tr><td valign="top">Failed</td><td valign="top">0</td><td></td></tr><tr><td valign="top">Skipped</td><td valign="top">0</td><td></td></tr></tbody></table>

&#x20;

Functional and test rig code base branch which is used for the above metrics is:

Hash Tag: sha256:337140dd37a9203ae551742ef1a7ccabc7986698f5e7c8cb80266c9fedeffe15

### Testing with various device combinations

Below are the test metrics by performing VC Sharing functionality on various device combinations

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Skipped</td></tr><tr><td valign="top">192</td><td valign="top">192</td><td valign="top">0</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100% With Pass Rate: 100%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

&#x20;

### Device and Component Details:

<table data-header-hidden><thead><tr><th valign="bottom">Tested with Inji components qa-inji1</th></tr></thead><tbody><tr><td valign="bottom"><p> </p><p>mosipdev/dsl-orchestrator:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev/dsl-packetcreator:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/data-share-service:1.3.0-beta.2</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/dsl-orchestrator:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/dsl-packetcreator:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/inji-certify-with-plugins:0.11.x</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/inji-verify-service:0.11.x</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/inji-verify-service: MOSIP-CONNECT-2025</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/inji-verify-service:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/inji-verify-ui:0.11.x</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/inji-verify-ui: MOSIP-CONNECT-2025</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/inji-verify-ui:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/inji-web:0.12.x</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/kernel-config-server:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/keycloak-init:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/mimoto:0.17.x</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/postgres-init:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/kernel-config-server:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/keycloak-init:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/postgres-init:develop</p><p> </p></td></tr></tbody></table>

&#x20;

&#x20;&#x20;

<table><thead><tr><th valign="bottom">Tested with components - Released env</th></tr></thead><tbody><tr><td valign="bottom"><p> </p><p>mosipdev/authentication-demo-service:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev/captcha-validation-service:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev/credential-request-generator: MOSIP-34070-v1210</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev/dsl-orchestrator:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev/dsl-packetcreator:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev/id-repository-identity-service: MOSIP-34070-v1210</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev2/dsl-orchestrator:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev2/dsl-packetcreator:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/admin-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/admin-ui:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/artifactory-server:0.10.0-INJI</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/artifactory-server:1.4.1-ES</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/authentication-demo-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/authentication-internal-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/authentication-otp-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/authentication-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/biosdk-server:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/commons-packet-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/compliance-toolkit-batch-job:1.4.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/compliance-toolkit-service:1.4.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/compliance-toolkit-ui:1.4.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/consolidator-websub-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/credential-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/data-share-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/data-share-service:1.3.0-beta.2</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/digital-card-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/dsl-orchestrator:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/dsl-packetcreator:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/esignet:1.4.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/hotlist-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/id-repository-vid-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/inji-certify:0.10.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/inji-certify:0.10.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/inji-verify:0.10.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/inji-web:0.11.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-auditmanager-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-auth-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-idgenerator-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-keymanager-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-masterdata-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-notification-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-otpmanager-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-pridgenerator-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-ridgenerator-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-syncdata-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mimoto:0.15.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mock-abis:1.2.0.2</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mock-identity-system:0.10.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mock-mv:1.2.0.2</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mock-relying-party-service:0.10.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mock-relying-party-ui:0.10.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mock-smtp:1.0.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mosip-file-server:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/oidc-ui:1.4.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/partner-management-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/partner-onboarder:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/pmp-ui:1.2.0.2</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/policy-management-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/pre-registration-application-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/pre-registration-batchjob:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/pre-registration-booking-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/pre-registration-captcha-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/pre-registration-datasync-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/pre-registration-ui:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/print:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-client:1.2.0.2</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-common-camel-bridge:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-dmz-packet-server:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-notification-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-registration-status-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-registration-transaction-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-reprocessor:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-stage-group-1:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-stage-group-2:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-stage-group-3:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-stage-group-4:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-stage-group-5:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-stage-group-6:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-stage-group-7:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-workflow-manager-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/resident-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/resident-ui:0.9.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/websub-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/activemq-artemis:1.1.5</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/biosdk-server:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/mosip-artemis-keycloak:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev/authentication-demo-service:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev/captcha-validation-service:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev/credential-request-generator:MOSIP-34070-v1210</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev/dsl-orchestrator:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev/dsl-packetcreator:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev/id-repository-identity-service:MOSIP-34070-v1210</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev2/dsl-orchestrator:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipdev2/dsl-packetcreator:develop</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/admin-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/admin-ui:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/artifactory-server:0.10.0-INJI</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/artifactory-server:1.4.1-ES</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/authentication-demo-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/authentication-internal-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/authentication-otp-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/authentication-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/biosdk-server:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/commons-packet-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/compliance-toolkit-batch-job:1.4.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/compliance-toolkit-service:1.4.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/compliance-toolkit-ui:1.4.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/config-server:1.1.2</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/consolidator-websub-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/credential-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/data-share-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/data-share-service:1.3.0-beta.2</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/digital-card-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/dsl-orchestrator:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/dsl-packetcreator:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/esignet:1.4.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/hotlist-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/id-repository-vid-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/inji-certify:0.10.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/inji-certify:0.10.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/inji-verify:0.10.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/inji-web:0.11.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-auditmanager-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-auth-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-idgenerator-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-keymanager-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-masterdata-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-notification-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-otpmanager-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-pridgenerator-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-ridgenerator-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/kernel-syncdata-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/keycloak-init:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mimoto:0.15.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mock-abis:1.2.0.2</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mock-identity-system:0.10.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mock-mv:1.2.0.2</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mock-relying-party-service:0.10.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mock-relying-party-ui:0.10.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mock-smtp:1.0.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/mosip-file-server:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/oidc-ui:1.4.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/partner-management-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/partner-onboarder:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/pmp-ui:1.2.0.2</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/policy-management-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/postgres-init:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/pre-registration-application-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/pre-registration-batchjob:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/pre-registration-booking-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/pre-registration-captcha-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/pre-registration-datasync-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/pre-registration-ui:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/print:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-client:1.2.0.2</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-common-camel-bridge:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-dmz-packet-server:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-notification-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-registration-status-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-registration-transaction-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-reprocessor:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-stage-group-1:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-stage-group-2:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-stage-group-3:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-stage-group-4:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-stage-group-5:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-stage-group-6:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-stage-group-7:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/registration-processor-workflow-manager-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/resident-service:1.2.1.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/resident-ui:0.9.0</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipid/websub-service:1.2.0.1</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/activemq-artemis:1.1.5</p><p> </p></td></tr><tr><td valign="bottom"><p> </p><p>mosipqa/biosdk-server:develop</p><p> </p></td></tr></tbody></table>

&#x20;

<table><thead><tr><th valign="bottom">Devices Used For Testing</th></tr></thead><tbody><tr><td valign="bottom"><em>Vivo Y73 with Android 12 BLE 5.0</em></td></tr><tr><td valign="bottom"><em>SS Galaxy A03 core with Android 11 BLE 4.2</em></td></tr><tr><td valign="bottom"><em>iPhone 11 with i-OS 15 BLE 5.0</em></td></tr><tr><td valign="bottom"><em>iPhone 8 with i-OS 16 BLE 5.0</em></td></tr><tr><td valign="bottom"><em>iPhone 7 with i-OS 15.6 BLE 4.2</em></td></tr><tr><td valign="bottom"><em>Redmi 7A Android 10 BLE 4.2</em></td></tr><tr><td valign="bottom">Redmi note 10 lite Android 10 BLE 5.0</td></tr><tr><td valign="bottom">redmi K20 pro Android 11 BLE 5.0</td></tr></tbody></table>

&#x20;

### Detailed Test Metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of tests passed / Total number of tests executed) x 100

Failed Test Case Coverage: It measures the percentage of all failed test cases. (Number of failed tests / Total number of test cases executed) x 100

### Execution Test Summary

* Well known story verification was performed against the collab env.
* Other story verification performed against released env.
