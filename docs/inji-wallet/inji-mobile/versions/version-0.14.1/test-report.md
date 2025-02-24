# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of:

* Functionality Sanity for iOS
* Automation for iOS
* Automation Mimoto API

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures the readiness of software for use in multiple countries. Since MOSIP is an "API First" product platform, Verification scope required comprehensive automation testing for all the MOSIP APIs. An automation Test Rig is created for the same.

The Inji testing scope revolves around the following flows:

* Biometric unlock
* Passcode unlock
* VC download via MOSIP
* VC download via Sunbird
* Pinning a VC
* Normal VC sharing
* Deleting VC
* Face Auth on Resident's phone
* Multi language support
* Backup and restore
* Wallet binding
* QR code Login
* Logout

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.

* Functionality Sanity for iOS
* Automation for iOS UI
* Automation Mimoto API

The verification methods may differ based on how the need was addressed.

For regression check, "MOSIP Test Rig" - an automation testing suite - which is indigenously designed and developed for supporting persona-based testing. MOSIP Test Rig covers the end-to-end test execution and reporting. The end-to-end functional test scenarios are written starting from pre-registration to creation of packet in registration center, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutation and combinations of cases being covered. MOSIP Test Rig will be an open-source artifact which can also be enhanced and used by countries to validate the SI deliveries before going live. Persona classes include both negative and positive personas. Negative persona classes include users like Bribed Registration Office, Malicious Insider etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

### API verification results by modules

The below section provides details on API test metrics by executing MOSIP functional automation Framework. All external API test executions were performed at module level isolation. Each end point is tested with the test data and expectations of each test data are mapped to assert the test case.

| **Total** | **Passed** | **Failed** | **Skipped** |
| --------- | ---------- | ---------- | ----------- |
| 141       | 134        | 4          | 3           |

Test Rate: 97.97% , With Pass Rate: 97.10%

### UI Automation results

The below section provides details on Ui Automation by executing MOSIP functional automation Framework.

Here is the detailed breakdown of metrics

#### IOS

| **Platform** | **Category** | **Test cases** |
| ------------ | ------------ | -------------- |
| **iOS**      | Total        | 48             |
|              | Passed       | 48             |
|              | Failed       | 0              |
|              | Skipped      | 0              |

Test Rate: 100% With Pass Rate: 100%

#### Android

| **Platform** | **Category** | **Test cases** |
| ------------ | ------------ | -------------- |
| **Android**  | Total        | 60             |
|              | Passed       | 60             |
|              | Failed       | 0              |
|              | Skipped      | 0              |

Test Rate: 100% With Pass Rate: 100%

Also Performed Manual Sanity with the Android APK, below is the updated result of the same:



1. Mosip VC download is working
2. Health insurance VC is working
3. Life insurance VC is working
4. Remove VC is working
5. Pinning VC is working
6. Share and share with selfie is working
7. QR code login is working
8. Backup and restore are working.
9. Logout is working
10. Unlock with biometric

Known issue:

1. The Home page help icon link is not working for activation and remove VC, for these two links it is showing page not found.

Functional and test rig code base branch which is used for the above metrics is:

Hash Tag:

&#x20;     SHA: sha256: 58e77d26fc1b98884c11638bba70c128d27994e3

### Device and Component Details

#### Tested with Components

mosipid/esignet:1.4.1

mosipqa/mimoto:develop

Tuvali Version - 0.5.1

#### Tested with MOSIP Components

mosipid/admin-service:1.2.0.1-B1

mosipid/admin-ui:1.2.0.1-B1

mosipid/artifactory-server:1.4.1-ES

mosipid/authentication-internal-service:1.2.0.1

mosipid/authentication-otp-service:1.2.0.1

mosipid/authentication-service:1.2.0.1

mosipid/biosdk-server:1.2.0.1

mosipid/commons-packet-service:1.2.0.1-B1

mosipid/config-server:1.1.2

mosipid/consolidator-websub-service:1.2.0.1-B1

mosipid/credential-request-generator:1.2.0.1

mosipid/credential-service:1.2.0.1

mosipid/data-share-service:1.2.0.1-B2

mosipid/hotlist-service:1.2.0.1-B1

mosipid/id-repository-identity-service:1.2.0.1

mosipid/id-repository-salt-generator:1.2.0.1

mosipid/id-repository-vid-service:1.2.0.1

mosipid/kernel-auth-service:1.2.0.1-B2

mosipid/kernel-idgenerator-service:1.2.0.1-B1

mosipid/kernel-keymanager-service:1.2.0.1

mosipid/kernel-notification-service:1.2.0.1-B1

mosipid/kernel-otpmanager-service:1.2.0.1-B1

mosipid/kernel-pridgenerator-service:1.2.0.1-B1

mosipid/kernel-ridgenerator-service:1.2.0.1-B1

mosipid/kernel-salt-generator:1.2.0.1-B2

mosipid/kernel-syncdata-service:1.2.0.1-B1

mosipid/keycloak-init:1.2.0.1

mosipid/keycloak-init:1.2.0.1-B2

mosipid/keycloak-init:1.2.0.1-B3

mosipid/keys-generator:1.2.0.1-B3

mosipid/masterdata-loader:1.2.0.1-B4

mosipid/mock-abis:1.2.0.1-B2

mosipid/mock-mv:1.2.0.1-B2

mosipid/mock-relying-party-service:0.9.1

mosipid/mock-relying-party-service:0.9.2

mosipid/mock-relying-party-ui:0.9.1

mosipid/mock-relying-party-ui:0.9.2

mosipid/oidc-ui:1.4.1

mosipid/partner-management-service:1.2.0.1-B3

mosipid/partner-onboarder:1.2.0.1-B4

mosipid/pmp-ui:1.2.0.1-B1

mosipid/policy-management-service:1.2.0.1-B3

mosipid/postgres-init:1.2.0.1-B4

mosipid/pre-registration-application-service:1.2.0.1-B1

mosipid/pre-registration-batchjob:1.2.0.1-B1

mosipid/pre-registration-booking-service:1.2.0.1-B1

mosipid/pre-registration-captcha-service:1.2.0.1-B1

mosipid/pre-registration-datasync-service:1.2.0.1-B1

mosipid/pre-registration-ui:1.2.0.1-B1

mosipid/print:1.2.0.1-B1

mosipid/registration-client:1.2.0.1-B1

mosipid/registration-processor-common-camel-bridge:1.2.0.1-B1

mosipid/registration-processor-dmz-packet-server:1.2.0.1-B1

mosipid/registration-processor-notification-service:1.2.0.1-B1

mosipid/registration-processor-registration-status-service:1.2.0.1-B1

mosipid/registration-processor-registration-transaction-service:1.2.0.1-B1

mosipid/registration-processor-reprocessor:1.2.0.1-B1

mosipid/registration-processor-stage-group-1:1.2.0.1-B1

mosipid/registration-processor-stage-group-2:1.2.0.1-B1

mosipid/registration-processor-stage-group-3:1.2.0.1-B2

mosipid/registration-processor-stage-group-4:1.2.0.1-B1

mosipid/registration-processor-stage-group-5:1.2.0.1-B1

mosipid/registration-processor-stage-group-6:1.2.0.1-B1

mosipid/registration-processor-workflow-manager-service:1.2.0.1-B1

mosipid/signup-service:1.0.0

mosipid/signup-ui:1.0.0

mosipid/softhsm:v2

mosipid/websub-service:1.2.0.1-B1

mosipint/digital-card-service:release-1.2.0.1-DP

mosipint/kernel-masterdata-service:develop-DP

mosipint/registration-processor-stage-group-7:develop-DP

mosipint/resident-service:develop-DP

mosipint/resident-ui:develop-DP

mosipqa/artifactory-server:0.9.0-INJI

mosipqa/artifactory-server:1.4.1-ES

mosipqa/authentication-demo-service:develop

mosipqa/automationtests:develop

mosipqa/dsl-orchestrator:develop

mosipqa/dsl-packetcreator:develop

mosipqa/inji-certify:0.9.x

mosipqa/inji-web:develop

mosipqa/kernel-auditmanager-service:1.2.0.1

mosipqa/keycloak-init:develop

mosipqa/mock-identity-system:0.9.3

mosipqa/mock-relying-party-service:0.9.x

mosipqa/mock-relying-party-ui:0.9.x

mosipqa/mock-smtp:0.0.2

mosipqa/mosip-artemis-keycloak:develop

mosipqa/mosip-file-server:develop

mosipqa/postgres-init:develop

mosipqa/softhsm:v2

#### Devices Used For Testing

_Vivo Y73 with Android 12 BLE 5.0_

_SS Galaxy A03 core with Android 11 BLE 4.2_

_iPhone 11 with i-OS 15 BLE 5.0_

_iPhone 8 with i-OS 16 BLE 5.0_

_iPhone 7 with i-OS 15.6 BLE 4.2_

_Redmi 7A Android 10 BLE 4.2_

Redmi note 10 lite Android 10 BLE 5.0

redmi K20 pro Android 11 BLE 5.0



### Detailed Test Metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of tests passed / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100
