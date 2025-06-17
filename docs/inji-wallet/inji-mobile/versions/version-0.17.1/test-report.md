# Test Report

## Testing Scope

The scope of testing is to validate Mimoto error code compatibility with eSignet 1.5.1 and 1.4.1 through comprehensive API automation, ensuring consistent error handling and response validation.

Transaction ID

* **Update**: Modified nonce value to be unique for each run.

Sunbird Authentication

* **eSignet 1.5.1**: Changed authentication factor type to KBI.
* **eSignet 1.4.1**: Configuration - Set sunbirdInsuranceAuthFactorType=KBA in config maps.

Binding OTP Negative Test Cases

* **Condition**: Test case passes if either of the following error codes is present:
  * IDA-MLC-009
  * binding\_auth\_failed

MOSIP is an “API First” product platform, Verification scope requires comprehensive automation testing for all the MOSIP APIs. An automation Test Rig is created for the same. MOSIP, being an API-first platform, mandates thorough and scalable automated testing across all its APIs.

The Inji testing scope revolves around the following flows:

* API Automation

## Test Approach

For regression check, “MOSIP Test Rig” - an automation testing suite - which is indigenously designed and developed for supporting persona-based testing. MOSIP Test Rig covers end-to-end test execution and reporting. The end-to-end functional test scenarios are written starting from pre-registration to creation of packet in registration center, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutation and combinations of cases being covered. MOSIP Test Rig will be an open-source artifact which can also be enhanced and used by countries to validate SI deliveries before going live. Persona classes include both positive and negative aspects. Negative persona classes include users like Bribed Registration Office, Malicious Insider etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

## Test execution statistics

### API verification results by modules

The below section provides details on API test metrics by executing MOSIP functional automation Framework. All external API test executions were performed at module level in isolation. Each end point is tested with the test data, and expectations of each test data are mapped to assert the test case.

<table><thead><tr><th width="356.88995361328125" valign="top">Total</th><th width="86.863525390625" valign="top">Passed</th><th width="92.20306396484375" valign="top">Failed</th><th width="96.20941162109375" valign="top">Ignored</th><th valign="top">Skipped</th></tr></thead><tbody><tr><td valign="top">176</td><td valign="top">143</td><td valign="top">0</td><td valign="top">33</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100% With Pass Rate: 100%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

&#x20;

The 33 Ignored test cases are AID OTP related test cases.

Functional and test rig code base branch which is used for the above metrics is:

**Hash Tag**: sha256: bc5ed1fda337784340216f5fcd3c38b85ff5a227c662331a817092076a69f5ef

### Device and Component Details:

#### Tested with Inji components qa-inji1

* Image: docker.io/mosipid/data-share-service:1.3.0-beta.2
* Image: mosipqa/postgres-init:develop
* Image: docker.io/mosipqa/inji-web:develop
* Image: docker.io/mosipqa/mimoto:develop
* Image: docker.io/mosipid/keys-generator:1.3.0-beta.2
* Image: mosipqa/kernel-config-server:develop
* Image: docker.io/mosipqa/apitest-mimoto:0.17.x
* Image: docker.io/mosipqa/artifactory-server:0.10.x-INJI

#### Tested with components - Released env

* Image: docker.io/mosipqa/artifactory-server:0.10.x-INJI
* Image: mosipqa/kernel-config-server:develop&#x20;
* Image: docker.io/mosipid/data-share-service:1.3.0-beta.2
* Image: docker.io/mosipid/keys-generator:1.3.0-beta.2
* Image: docker.io/mosipid/minio-client-util:latest
* Image: docker.io/mosipid/artifactory-server:1.4.1-ES
* Image: docker.io/mosipid/authentication-demo-service:1.2.0.1
* Image: docker.io/mosipid/captcha-validation-service:0.1.0-beta.1
* Image: docker.io/mosipid/data-share-service:1.2.0.1
* Image: docker.io/mosipid/authentication-service:1.2.1.0
* Image: docker.io/mosipid/authentication-internal-service:1.2.1.0
* Image: docker.io/mosipid/authentication-otp-service:1.2.1.0
* Image: docker.io/mosipid/credential-service:1.2.2.1
* Image: docker.io/mosipid/credential-request-generator:1.2.2.1
* Image: docker.io/mosipid/id-repository-identity-service:1.2.2.1
* Image: docker.io/mosipid/id-repository-vid-service:1.2.2.1
* Image: mosipid/apitest-inji-verify:0.12.3
* Image: docker.io/mosipid/data-share-service:1.3.0-beta.2
* Image: docker.io/mosipid/inji-web:0.12.0
* Image: docker.io/mosipid/mimoto:0.17.0
* Image: docker.io/mosipid/mosip-artemis-keycloak:1.2.0.1
* Image: docker.io/mosipid/kernel-keymanager-service:1.2.1.0
* Image: docker.io/mosipid/partner-onboarder:1.2.0.1
* Image: docker.io/mosipid/artifactory-server:0.10.0-INJI
* Image: docker.io/mosipid/apitest-inji-certify:0.11.0
* Image: docker.io/mosipid/esignet-with-plugins:1.5.1
* Image: docker.io/mosipid/inji-certify-with-plugins:0.11.0
* Image: docker.io/mosipid/oidc-ui:1.5.1
* Image: docker.io/mosipid/mock-identity-system:0.10.1
* Image: mosipid/apitest-esignet:1.5.1
* Image: mosipid/apitest-inji-certify:0.11.0
* Image: docker.io/mosipid/inji-certify-with-plugins:0.11.0
* Image: docker.io/mosipid/mock-smtp:1.0.0
* Image: docker.io/mosipid/mosip-file-server:1.2.0.1
* Image: docker.io/mosipid/artifactory-server:0.10.0-INJI
* Image: docker.io/mosipid/apitest-inji-certify:0.11.0
* Image: docker.io/mosipid/esignet-with-plugins:1.5.1
* Image: docker.io/mosipid/inji-certify-with-plugins:0.11.0
* Image: docker.io/mosipid/oidc-ui:1.5.1
* Image: docker.io/mosipid/kernel-keymanager-service:1.2.1.0
* Image: docker.io/mosipid/partner-onboarder:1.2.0.1
* Image: docker.io/mosipid/artifactory-server:0.10.0-INJI
* Image: docker.io/mosipid/apitest-inji-certify:0.11.0
* Image: docker.io/mosipid/esignet-with-plugins:1.5.1
* Image: docker.io/mosipid/inji-certify-with-plugins:0.11.0
* Image: docker.io/mosipid/oidc-ui:1.5.1
* Image: docker.io/mosipid/mock-identity-system:0.10.1
* Image: docker.io/mosipid/mock-relying-party-service:0.10.1
* Image: docker.io/mosipid/mock-relying-party-ui:0.10.1
* Image: mosipid/apitest-esignet:1.5.1
* Image: docker.io/mosipid/inji-certify-with-plugins:0.11.0
* Image: docker.io/mosipid/mock-smtp:1.0.0
* Image: docker.io/mosipid/mosip-file-server:1.2.0.1
* Image: docker.io/mosipid/artifactory-server:0.10.0-INJI
* Image: docker.io/mosipid/apitest-inji-certify:0.11.0
* Image: docker.io/mosipid/mock-relying-party-service:0.10.1
* Image: docker.io/mosipid/mock-relying-party-ui:0.10.1
* Image: docker.io/mosipid/esignet-with-plugins:1.5.1
* Image: docker.io/mosipid/inji-certify-with-plugins:0.11.0
* Image: docker.io/mosipid/oidc-ui:1.5.1

### Execution Test Summary

* Fixed error code scenarios in Mimoto 0.17.1 API automation as part of this release, tested against **ESignet 1.5.1** and made them compatible with **Esignet 1.4.1**.



Github link for the xls file is [**here**](https://github.com/mosip/test-management/tree/master/inji/0.17.1).

