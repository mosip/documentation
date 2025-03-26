# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the\
perspective of

* Functionality Sanity
* Automation UI

Verification is performed not only from the end user perspective but\
also from the System Integrator (SI) point of view. Hence\
Configurability and Extensibility of the software is also assessed. This\
ensures the readiness of software for use in multiple countries. Since\
MOSIP is an An automation Test Rig is created for the same.

The Inji testing scope revolves around sanity and covers the following\
flows:

* Biometric unlock
* Passcode unlock
* Mosip download, activation and QR login
* Sunbird download is working fine
* Mock download is not working in qa-inji1 and working in collab & CRE
* MDL download
* Land registry
* Sharing and share with selfie
* Backup and restore
* Key Management
* Logout
* INJI Wallet new logo
* Remove VC is working.
* Pinning VC is working

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by\
simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a\
user type that might use a product/or a service in a similar way.\
Persona based testing is a software testing technique that puts software\
testers in the customer's shoes, assesses their needs from the software\
and thereby determines use cases/scenarios that the customers will\
execute. The persona needs may be addressed through any of the\
following.

* Functionality Sanity
* Automation UI

The verification methods may differ based on how the need was addressed.

For regression check, "MOSIP Test Rig" - an automation testing suite -\
which is indigenously designed and developed for supporting\
persona-based testing. MOSIP Test Rig covers the end-to-end test\
execution and reporting. The end-to-end functional test scenarios are\
written starting from pre-registration to creation of packet in\
registration center, processing the packet through the registration\
processor, generating UIN and authenticating identity using IDA through\
various permutation and combinations of cases being covered. MOSIP Test\
Rig will be an open-source artifact which can also be enhanced and used\
by countries to validate the SI deliveries before going live. Persona\
classes include both negative and positive personas. Negative persona\
classes include users like Bribed Registration Office, Malicious Insider\
etc. The needs of positive persona classes must be met, whereas the\
needs of negative persona classes must be effectively restricted by the\
software.

### UI Automation results

The below section provides details on Ui Automation by executing MOSIP\
functional automation Framework.

| **Total** | **Passed** | **Failed** | **Skipped** |
| --------- | ---------- | ---------- | ----------- |
| 110       | 110        | 0          | 0           |

Test Rate: 100%, With Pass Rate: 100%

Here is the detailed breakdown of metrics

| **Platform** | **Category** | **Total** | **Passed** | **Failed** | **Skipped** |
| ------------ | ------------ | --------- | ---------- | ---------- | ----------- |
| iOS          | Test cases   | 52        | 52         | 0          | 0           |

Test Rate: 100%, Pass Rate: 100%

| **Platform** | **Category** | **Total** | **Passed** | **Failed** | **Skipped** |
| ------------ | ------------ | --------- | ---------- | ---------- | ----------- |
| Android      | Test cases   | 58        | 58         | 0          | 0           |

Test Rate: 100%, Pass Rate: 100%

### Known issue

1. The Home page help icon link is not working for activation and\
   remove VC, for these two links it is showing page not found.

### Device and Component Details

#### Evaluated with INJI components

mosipqa/artifactory-server:0.10.x-INJI

mosipid/inji-certify:0.10.0

mosipid/inji-certify:0.10.0

mosipqa/inji-verify-service:develop

mosipqa/inji-verify-ui:develop

mosipid/data-share-service:1.3.0-beta.2

mosipqa/inji-web:0.11.0

mosipqa/mimoto:0.15.x

mosipqa/artifactory-server:0.10.x-INJI

mosipqa/inji-certify-with-plugins:develop

mosipqa/inji-certify-with-plugins:develop

mosipqa/inji-certify-with-plugins:develop

mosipqa/inji-certify-with-plugins:develop

mosipqa/inji-certify-with-plugins:develop

mosipqa/inji-certify-with-plugins:develop

mosipqa/dsl-packetcreator:develop

mosipdev/dsl-packetcreator:develop

mosipqa/inji-certify-with-plugins:develop



#### Evaluated with MOSIP Components

mosipid/mock-abis:1.2.0.2

mosipid/mock-mv:1.2.0.2

mosipid/hotlist-service:1.2.1.0

nginxinc/nginx-unprivileged:1.21.6-alpine

mosipid/admin-service:1.2.1.0

mosipid/admin-ui:1.2.0.1

mosipid/artifactory-server:1.4.1-ES

mosipid/authentication-demo-service:1.2.0.1

mosipid/authentication-demo-service:1.2.0.1

mosipdev/authentication-demo-service:develop

mosipdev/authentication-demo-service:develop

mosipid/biosdk-server:1.2.0.1

mosipqa/biosdk-server:develop

mosipdev/captcha-validation-service:develop

rancher/fleet-agent:v0.7.0

mosipid/data-share-service:1.2.0.1

mosipid/digital-card-service:1.2.0.1

mosipid/authentication-service:1.2.1.0

mosipid/authentication-internal-service:1.2.1.0

mosipid/authentication-otp-service:1.2.1.0

mosipid/credential-service:1.2.1.0

mosipdev/credential-request-generator:MOSIP-34070-v1210

mosipdev/id-repository-identity-service:MOSIP-34070-v1210

mosipid/id-repository-vid-service:1.2.1.0

mosipid/inji-verify:0.10.0

mosipid/data-share-service:1.3.0-beta.2

mosipid/inji-web:0.11.0

mosipid/mimoto:0.15.0

mosipid/kernel-auditmanager-service:1.2.0.1

mosipid/kernel-auth-service:1.2.0.1

mosipid/kernel-idgenerator-service:1.2.0.1

mosipid/kernel-masterdata-service:1.2.1.0

mosipid/kernel-notification-service:1.2.0.1

mosipid/kernel-otpmanager-service:1.2.0.1

mosipid/kernel-pridgenerator-service:1.2.0.1

mosipid/kernel-ridgenerator-service:1.2.0.1

mosipid/kernel-syncdata-service:1.2.1.0

mosipid/kernel-keymanager-service:1.2.0.1

mosipid/artifactory-server:0.10.0-INJI

mosipid/esignet:1.4.1

mosipid/inji-certify:0.10.0

mosipid/oidc-ui:1.4.1

mosipid/mock-identity-system:0.9.3

mosipid/mock-relying-party-service:0.9.3

mosipid/mock-relying-party-ui:0.9.3

mosipid/mock-smtp:1.0.0

mosipid/mosip-file-server:1.2.0.1

mosipid/artifactory-server:0.10.0-INJI

mosipid/mock-relying-party-service:0.9.3

mosipid/mock-relying-party-ui:0.9.3

mosipid/esignet:1.4.1

mosipid/inji-certify:0.10.0

mosipid/oidc-ui:1.4.1

mosipid/dsl-packetcreator:1.2.0.1

mosipid/dsl-packetcreator:1.2.0.1

mosipdev/dsl-packetcreator:develop

mosipdev/dsl-packetcreator:develop

mosipid/commons-packet-service:1.2.0.1

mosipid/pmp-ui:1.2.0.2

mosipid/partner-management-service:1.2.1.0

mosipid/policy-management-service:1.2.1.0

mosipid/pre-registration-application-service:1.2.0.1

mosipid/pre-registration-batchjob:1.2.0.1

mosipid/pre-registration-booking-service:1.2.0.1

mosipid/pre-registration-captcha-service:1.2.0.1

mosipid/pre-registration-datasync-service:1.2.0.1

mosipid/pre-registration-ui:1.2.0.1

mosipid/print:1.2.0.1

mosipid/registration-client:1.2.0.2

mosipid/registration-processor-common-camel-bridge:1.2.0.1

mosipid/registration-processor-stage-group-1:1.2.0.1

mosipid/registration-processor-stage-group-2:1.2.0.1

mosipid/registration-processor-stage-group-3:1.2.0.1

mosipid/registration-processor-stage-group-4:1.2.0.1

mosipid/registration-processor-stage-group-5:1.2.0.1

mosipid/registration-processor-stage-group-6:1.2.0.1

mosipid/registration-processor-stage-group-7:1.2.0.1

mosipid/registration-processor-notification-service:1.2.0.1

mosipid/registration-processor-dmz-packet-server:1.2.0.1

mosipid/registration-processor-reprocessor:1.2.0.1

mosipid/registration-processor-registration-status-service:1.2.0.1

mosipid/registration-processor-registration-transaction-service:1.2.0.1

mosipid/registration-processor-workflow-manager-service:1.2.0.1

mosipid/resident-service:1.2.1.0

mosipid/resident-ui:0.9.0

mosipid/artifactory-server:0.10.0-INJI

sunbird-rc-credential-schema:v2.0.0-rc3

sunbird-rc-credentials-service:v2.0.0-rc3

sunbird-rc-identity-service:v2.0.0-rc3

sunbird-rc-core:v1.0.0

mosipid/esignet:1.4.1

mosipid/inji-certify:0.10.0

mosipid/oidc-ui:1.4.1

mosipid/websub-service:1.2.0.1

mosipid/consolidator-websub-service:1.2.0.1



#### Devices used for Testing

_Vivo Y73 with Android 12 BLE 5.0_

_SS Galaxy A03 core with Android 11 BLE 4.2_

_iPhone 11 with i-OS 15 BLE 5.0_

_iPhone 8 with i-OS 16 BLE 5.0_

_iPhone 7 with i-OS 15.6 BLE 4.2_

_Redmi k20 pro with Android 13 BLE 5.0_

### Detailed Test Metrics

Below are the detailed test metrics by performing manual/automation\
testing. The project metrics are derived from Defect density, Test\
coverage, Test execution coverage, test tracking and efficiency.

\[The various metrics that assist in test tracking and efficiency are as\
follows:

* Passed Test Cases Coverage: It measures the percentage of passed\
  test cases. (Number of tests passed / Total number of tests\
  executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the\
  failed test cases. (Number of failed tests / Total number of test\
  cases executed) x 100
