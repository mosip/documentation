# Test Report

### Scope

The scope of testing revolved around verifying the compliance of the product as per the specifications published by MOSIP using the below devices:

&#x20;The windows compliance tool kit was tested with the below specifications:

* **ABIS (Automated Biometric Identification System)** Specifications was tested with Fingerprint, Iris and Face modalities as per MOSIP - ABIS API specifications.
*   **Secure Biometric Interface (SBI)** with Compliance testcases collection and Quality Assessment test cases collection on below modalities&#x20;

    * Registration devices for Iris, Face and Fingerprint
    * Authentication devices for Iris, Face and Fingerprint

    **Biometric SDK**

    * Quality Check
    * Match
    * Extraction
    * Conversion

&#x20;The Android compliance tool kit app v1.4.4 was tested with the below specifications:

* **Secure Biometric Interface (SBI)** with Compliance testcases collection and Quality Assessment testcases collection on below modalities
  * Registration devices for Iris, Face and Fingerprint
  * Authentication devices for Iris, Face and Fingerprint

### &#x20;Testing Scope (Bug Fixes Release)

Testing focused on validating the fixes delivered in CTK v1.4.4 and ensuring there was no impact on existing Compliance Toolkit functionality. The scope included functional validation of fixes and regression testing of affected modules and workflows across supported platforms and specifications.

Jira Issues in Scope:

* MOSIP-45009
* MOSIP-45007
* MOSIP-45006
* MOSIP-45005
* MOSIP-45004
* MOSIP-42898
* MOSIP-42453
* MOSIP-3818&#x20;

### _Test Execution Statistics_

#### ABIS Testing

MOSIP interfaces with an Automated Biometric Identification System (ABIS) to perform de-duplication of a resident's biometric data. A country may use multiple ABISs for the same biometric data and evaluate the best ABIS based on de-duplication quality. ABIS is used for 1:N de-duplication. For 1:1 authentication Biometric SDK is used. MOSIP does not recommend using an ABIS for 1:1 authentication.

Test cases have been tested with MOSIP mock ABIS for compliance with the MOSIP specifications across 29 test cases.

<table><thead><tr><th valign="bottom">Scenarios</th><th valign="bottom">Mock ABIS</th></tr></thead><tbody><tr><td valign="bottom"><em>Total</em></td><td valign="bottom">29</td></tr><tr><td valign="bottom"><em>Passed</em></td><td valign="bottom">28</td></tr><tr><td valign="bottom"><em>Pending</em></td><td valign="bottom">0</td></tr><tr><td valign="bottom"><em>Failed</em></td><td valign="bottom">0</td></tr><tr><td valign="bottom"><em>NA</em></td><td valign="bottom">1</td></tr><tr><td valign="bottom"><em>Test Rate (%)</em></td><td valign="bottom">100%</td></tr><tr><td valign="bottom"><em>Pass Rate (%)</em></td><td valign="bottom">100%</td></tr></tbody></table>

**Out of scope: Real ABIS testing in CTK v1.4.4**

#### SBI Testing

The Secure Biometric Interface (SBI) is used to interface with biometric devices. The compliance tool kit was tested to ensure that the interface built by the device provider is following the specs and security rules defined in the SBI spec. The device hardware security features are not tested as part of compliance tool kit.

For Android Authentication Devices using MOSIP's Android mock SBI

&#x20;The ‘Android CTK app v1.4.4’ with ‘MOSIP Android Mock SBI’ has been tested for compliance with the specifications. Test cases specific to quality and user interactions have been tested with MOSIP Android mock SBI.

&#x20;

<table><thead><tr><th valign="bottom">Scenarios</th><th valign="bottom">FP</th><th valign="bottom">Iris</th><th valign="bottom">Face</th></tr></thead><tbody><tr><td valign="bottom"><em>Total</em></td><td valign="bottom">35</td><td valign="bottom">27</td><td valign="bottom">41</td></tr><tr><td valign="bottom"><em>Passed</em></td><td valign="bottom">35</td><td valign="bottom">27</td><td valign="bottom">41</td></tr><tr><td valign="bottom"><em>Pending</em></td><td valign="bottom">0</td><td valign="bottom">0</td><td valign="bottom">0</td></tr><tr><td valign="bottom"><em>Failed</em></td><td valign="bottom">0</td><td valign="bottom">0</td><td valign="bottom">0</td></tr><tr><td valign="bottom"><em>Test Rate (%)</em></td><td valign="bottom">100%</td><td valign="bottom">100%</td><td valign="bottom">100%</td></tr><tr><td valign="bottom"><em>Pass Rate (%)</em></td><td valign="bottom">100%</td><td valign="bottom">100%</td><td valign="bottom">100%</td></tr></tbody></table>

For Android Registration Devices using MOSIP's Android mock SBI

The ‘Android CTK app v1.4.4’ with ‘MOSIP Android Mock SBI’ has been tested for compliance with the specifications. Test cases specific to quality and user interactions have been tested with MOSIP Android mock SBI and real registration face SBI.

<table><thead><tr><th valign="bottom">Scenarios</th><th valign="bottom">FP</th><th valign="bottom">Iris</th><th valign="bottom">Face</th></tr></thead><tbody><tr><td valign="bottom"><em>Total</em></td><td valign="bottom">49</td><td valign="bottom">26</td><td valign="bottom">45</td></tr><tr><td valign="bottom"><em>Passed</em></td><td valign="bottom">49</td><td valign="bottom">26</td><td valign="bottom">45</td></tr><tr><td valign="bottom"><em>Pending</em></td><td valign="bottom">0</td><td valign="bottom">0</td><td valign="bottom">0</td></tr><tr><td valign="bottom"><em>Failed</em></td><td valign="bottom">0</td><td valign="bottom">0</td><td valign="bottom">0</td></tr><tr><td valign="bottom"><em>Test Rate (%)</em></td><td valign="bottom">100%</td><td valign="bottom">100%</td><td valign="bottom">100%</td></tr><tr><td valign="bottom"><em>Pass Rate (%)</em></td><td valign="bottom">100%</td><td valign="bottom">100%</td><td valign="bottom">100%</td></tr></tbody></table>

For Windows Authentication Devices using MOSIP's windows mock SBI

The windows CTK v1.4.4 with ‘MOSIP windows Mock SBI’ has been tested for compliance with the specificatio

For Windows Registration Devices using MOSIP's windows mock SBI

The windows CTK v1.4.4 with ‘MOSIP windows Mock SBI’ has been tested for compliance with the specifications.

<table><thead><tr><th valign="bottom">Scenarios</th><th valign="bottom">FP</th><th valign="bottom">Iris</th><th valign="bottom">Face</th></tr></thead><tbody><tr><td valign="bottom"><em>Total</em></td><td valign="bottom">55</td><td valign="bottom">29</td><td valign="bottom">48</td></tr><tr><td valign="bottom"><em>Passed</em></td><td valign="bottom">55</td><td valign="bottom">29</td><td valign="bottom">48</td></tr><tr><td valign="bottom"><em>Pending</em></td><td valign="bottom">0</td><td valign="bottom">0</td><td valign="bottom">0</td></tr><tr><td valign="bottom"><em>Failed</em></td><td valign="bottom">0</td><td valign="bottom">0</td><td valign="bottom">0</td></tr><tr><td valign="bottom"><em>Test Rate (%)</em></td><td valign="bottom">100%</td><td valign="bottom">100%</td><td valign="bottom">100%</td></tr><tr><td valign="bottom"><em>Pass Rate (%)</em></td><td valign="bottom">100%</td><td valign="bottom">100%</td><td valign="bottom">100%</td></tr></tbody></table>

Out of scope: Real devices testing on windows and android CTK v1.4.4.

#### SDK Testing&#x20;

The SDK implementation has been tested to support quality check, match, extraction, and conversion of biometrics. Test cases have been tested with MOSIP mock SDK.

<table><thead><tr><th valign="bottom">Scenarios</th><th valign="bottom">With Mock SD</th></tr></thead><tbody><tr><td valign="bottom"><em>Total</em></td><td valign="bottom">65</td></tr><tr><td valign="bottom"><em>Passed</em></td><td valign="bottom">65</td></tr><tr><td valign="bottom"><em>Pending</em></td><td valign="bottom">0</td></tr><tr><td valign="bottom"><em>Failed</em></td><td valign="bottom">0</td></tr><tr><td valign="bottom"><em>N/A</em></td><td valign="bottom">0</td></tr><tr><td valign="bottom"><em>Test Rate (%)</em></td><td valign="bottom">100%</td></tr><tr><td valign="bottom"><em>Pass Rate (%)</em></td><td valign="bottom">100%</td></tr></tbody></table>

**Out of scope: Segmentation testing and Real SDK testing**Docker version (required for Compliance Test Kit):&#x20;



<table><thead><tr><th valign="top">Docker Image</th><th valign="top">Version / Tag</th></tr></thead><tbody><tr><td valign="top">docker.io/mosipdev/activemq-artemis</td><td valign="top">2.39.0</td></tr><tr><td valign="top">docker.io/mosipdev/alpine</td><td valign="top">latest</td></tr><tr><td valign="top">docker.io/mosipid/admin-service</td><td valign="top">1.3.1</td></tr><tr><td valign="top">docker.io/mosipid/admin-ui</td><td valign="top">1.3.0</td></tr><tr><td valign="top">docker.io/mosipid/apitest-auth</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/apitest-idrepo</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/apitest-masterdata</td><td valign="top">1.3.1</td></tr><tr><td valign="top">docker.io/mosipid/apitest-prereg</td><td valign="top">1.3.0</td></tr><tr><td valign="top">docker.io/mosipid/apitest-resident</td><td valign="top">1.3.0</td></tr><tr><td valign="top">docker.io/mosipid/artifactory-server</td><td valign="top">1.2.0.2</td></tr><tr><td valign="top">docker.io/mosipid/artifactory-server</td><td valign="top">1.3.2-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/authentication-internal-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/authentication-otp-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/authentication-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/biosdk-server</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/captcha-validation-service</td><td valign="top">0.1.1</td></tr><tr><td valign="top">docker.io/mosipid/clamav</td><td valign="top">1.3.0_base</td></tr><tr><td valign="top">docker.io/mosipid/commons-packet-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/compliance-toolkit-batch-job</td><td valign="top">1.4.0</td></tr><tr><td valign="top">docker.io/mosipid/consolidator-websub-service</td><td valign="top">1.3.2-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/credential-request-generator</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/credential-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/data-share-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/digital-card-service</td><td valign="top">1.3.0</td></tr><tr><td valign="top">docker.io/mosipid/dsl-orchestrator</td><td valign="top">1.2.1.0</td></tr><tr><td valign="top">docker.io/mosipid/dsl-orchestrator</td><td valign="top">1.4.0</td></tr><tr><td valign="top">docker.io/mosipid/dsl-orchestrator</td><td valign="top">1.5.0</td></tr><tr><td valign="top">docker.io/mosipid/dsl-packetcreator</td><td valign="top">1.4.0</td></tr><tr><td valign="top">docker.io/mosipid/dsl-packetcreator</td><td valign="top">1.5.0</td></tr><tr><td valign="top">docker.io/mosipid/esignet-with-plugins</td><td valign="top">1.6.2</td></tr><tr><td valign="top">docker.io/mosipid/esignet</td><td valign="top">1.4.1</td></tr><tr><td valign="top">docker.io/mosipid/hotlist-service</td><td valign="top">1.3.1</td></tr><tr><td valign="top">docker.io/mosipid/id-repository-identity-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/id-repository-vid-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/kafka</td><td valign="top">3.2.1-debian-11-r9</td></tr><tr><td valign="top">docker.io/mosipid/kernel-auditmanager-service</td><td valign="top">1.3.2-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/kernel-auth-service</td><td valign="top">1.3.1</td></tr><tr><td valign="top">docker.io/mosipid/kernel-config-server</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/kernel-idgenerator-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/kernel-keymanager-service</td><td valign="top">1.4.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/kernel-masterdata-service</td><td valign="top">1.3.1</td></tr><tr><td valign="top">docker.io/mosipid/kernel-notification-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/kernel-otpmanager-service</td><td valign="top">1.3.0</td></tr><tr><td valign="top">docker.io/mosipid/kernel-pridgenerator-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/kernel-ridgenerator-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/kernel-salt-generator</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/kernel-syncdata-service</td><td valign="top">1.3.1</td></tr><tr><td valign="top">docker.io/mosipid/keycloak-init</td><td valign="top">1.2.0.1</td></tr><tr><td valign="top">docker.io/mosipid/keycloak-init</td><td valign="top">1.2.0.2</td></tr><tr><td valign="top">docker.io/mosipid/keys-generator</td><td valign="top">1.4.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/minio-client-util</td><td valign="top">Not specified</td></tr><tr><td valign="top">docker.io/mosipid/minio-client-util</td><td valign="top">latest</td></tr><tr><td valign="top">docker.io/mosipid/minio</td><td valign="top">2025.2.28-debian-12-r1</td></tr><tr><td valign="top">docker.io/mosipid/mock-abis</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/mock-mv</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/mock-relying-party-service</td><td valign="top">0.11.2</td></tr><tr><td valign="top">docker.io/mosipid/mock-relying-party-service</td><td valign="top">0.9.3</td></tr><tr><td valign="top">docker.io/mosipid/mock-relying-party-ui</td><td valign="top">0.11.2</td></tr><tr><td valign="top">docker.io/mosipid/mock-relying-party-ui</td><td valign="top">0.9.3</td></tr><tr><td valign="top">docker.io/mosipid/mosip-artemis-keycloak</td><td valign="top">1.3.0</td></tr><tr><td valign="top">docker.io/mosipid/mosip-file-server</td><td valign="top">1.3.0</td></tr><tr><td valign="top">docker.io/mosipid/oidc-ui</td><td valign="top">1.4.1</td></tr><tr><td valign="top">docker.io/mosipid/oidc-ui</td><td valign="top">1.6.2</td></tr><tr><td valign="top">docker.io/mosipid/partner-management-service</td><td valign="top">1.2.2.2</td></tr><tr><td valign="top">docker.io/mosipid/partner-onboarder</td><td valign="top">1.2.0.1</td></tr><tr><td valign="top">docker.io/mosipid/partner-onboarder</td><td valign="top">1.3.1</td></tr><tr><td valign="top">docker.io/mosipid/pmp-revamp-ui</td><td valign="top">1.2.2.2</td></tr><tr><td valign="top">docker.io/mosipid/policy-management-service</td><td valign="top">1.2.2.2</td></tr><tr><td valign="top">docker.io/mosipid/postgres-init</td><td valign="top">1.2.0.1</td></tr><tr><td valign="top">docker.io/mosipid/postgres-init</td><td valign="top">1.3.0</td></tr><tr><td valign="top">docker.io/mosipid/postgresql</td><td valign="top">14.2.0-debian-10-r70</td></tr><tr><td valign="top">docker.io/mosipid/pre-registration-application-service</td><td valign="top">1.3.0</td></tr><tr><td valign="top">docker.io/mosipid/pre-registration-batchjob</td><td valign="top">1.3.0</td></tr><tr><td valign="top">docker.io/mosipid/pre-registration-booking-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/pre-registration-datasync-service</td><td valign="top">1.3.0</td></tr><tr><td valign="top">docker.io/mosipid/pre-registration-ui</td><td valign="top">1.3.0</td></tr><tr><td valign="top">docker.io/mosipid/print</td><td valign="top">1.3.1</td></tr><tr><td valign="top">docker.io/mosipid/redis</td><td valign="top">7.0.5-debian-11-r25</td></tr><tr><td valign="top">docker.io/mosipid/regclient-keystore</td><td valign="top">1.0.0</td></tr><tr><td valign="top">docker.io/mosipid/registration-client</td><td valign="top">1.2.0.2</td></tr><tr><td valign="top">docker.io/mosipid/registration-processor-common-camel-bridge</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/registration-processor-dmz-packet-server</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/registration-processor-landing-zone</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/registration-processor-notification-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/registration-processor-registration-status-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/registration-processor-registration-transaction-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/registration-processor-reprocessor</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/registration-processor-stage-group-1</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/registration-processor-stage-group-2</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/registration-processor-stage-group-3</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/registration-processor-stage-group-4</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/registration-processor-stage-group-5</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/registration-processor-stage-group-6</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/registration-processor-stage-group-7</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/registration-processor-workflow-manager-service</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/resident-service</td><td valign="top">1.3.0</td></tr><tr><td valign="top">docker.io/mosipid/resident-ui</td><td valign="top">0.9.1</td></tr><tr><td valign="top">docker.io/mosipid/softhsm</td><td valign="top">v2</td></tr><tr><td valign="top">docker.io/mosipid/uitest-admin</td><td valign="top">1.3.0</td></tr><tr><td valign="top">docker.io/mosipid/uitest-pmp-v2</td><td valign="top">1.3.0-beta.4</td></tr><tr><td valign="top">docker.io/mosipid/websub-service</td><td valign="top">1.3.2-rc.1</td></tr><tr><td valign="top">docker.io/mosipid/zookeeper</td><td valign="top">3.8.0-debian-11-r30</td></tr><tr><td valign="top">docker.io/mosipqa/apitest-pms</td><td valign="top">1.3.x</td></tr><tr><td valign="top">docker.io/mosipqa/compliance-toolkit-service</td><td valign="top">1.4.x</td></tr><tr><td valign="top">docker.io/mosipqa/compliance-toolkit-ui</td><td valign="top">1.4.x</td></tr><tr><td valign="top">docker.io/mosipqa/dsl-orchestrator</td><td valign="top">1.5.x</td></tr><tr><td valign="top">docker.io/mosipqa/dsl-packetcreator</td><td valign="top">1.5.x</td></tr><tr><td valign="top">docker.io/mosipqa/mock-smtp</td><td valign="top">develop</td></tr><tr><td valign="top">docker.io/mosipqa/partner-management-service</td><td valign="top">1.3.x</td></tr><tr><td valign="top">docker.io/mosipqa/pmp-ui-v2</td><td valign="top">1.3.x</td></tr><tr><td valign="top">docker.io/mosipqa/policy-management-service</td><td valign="top">1.3.x</td></tr><tr><td valign="top">docker.io/mosipqa/uitest-pmp-v2</td><td valign="top">1.3.x</td></tr><tr><td valign="top">docker.io/mosipqa/uitest-resident</td><td valign="top">develop</td></tr><tr><td valign="top">mosipid/apitest-auth</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">mosipid/apitest-idrepo</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">mosipid/apitest-masterdata</td><td valign="top">1.3.1</td></tr><tr><td valign="top">mosipid/apitest-prereg</td><td valign="top">1.3.0</td></tr><tr><td valign="top">mosipid/apitest-resident</td><td valign="top">1.3.0</td></tr><tr><td valign="top">mosipid/clamav</td><td valign="top">1.3.0_base</td></tr><tr><td valign="top">mosipid/kernel-config-server</td><td valign="top">1.3.1-rc.1</td></tr><tr><td valign="top">mosipid/keycloak-init</td><td valign="top">1.2.0.1</td></tr><tr><td valign="top">mosipid/keycloak-init</td><td valign="top">1.2.0.2</td></tr><tr><td valign="top">mosipid/postgres-init</td><td valign="top">1.2.0.1</td></tr><tr><td valign="top">mosipid/postgres-init</td><td valign="top">1.3.0</td></tr><tr><td valign="top">mosipid/regclient-keystore</td><td valign="top">1.0.0</td></tr><tr><td valign="top">mosipid/softhsm</td><td valign="top">v2</td></tr><tr><td valign="top">mosipqa/apitest-pms</td><td valign="top">1.3.x</td></tr></tbody></table>

&#x20;

Sonar Report

MOSIP - Compliance-toolkit-service:

<figure><img src="../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

MOSIP - compliance-toolkit-ui:

<figure><img src="../../.gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>
