# Test Report

The scope of testing revolved around verifying the compliance of the product as per the specifications published by MOSIP using the below devices:

* Registration devices for Iris, Face and Fingerprint
* Authentication devices for Iris, Face and Fingerprint

The Android Compliance tool kit App v1.1.0 was tested with the below specifications:

* Secure Biometric Interface (SBI)

The Windows Compliance Tool kit was tested with the below specifications:

Secure Biometric Interface (SBI)
 > SDK
   * Quality Check
   * Match
   * Extraction
   * Conversion 

## Test Execution Statistics

### SBI Testing

The Secure Biometric Interface (SBI) is used to interface with the biometric devices. The Compliance Tool kit was tested to ensure that the interface built by the device provider is following the specs and security rules defined in the SBI spec. The device hardware security features are not tested as part of Compliance Tool kit.

#### For Android Authentication Devices using MOSIP's Android mock SBI

* The `Android CTK app v1.1.0` with `MOSIP Android Mock SBI` has been tested for compliance with the specifications across 55 test cases.
* Test cases specific to the quality and user interactions have been tested with MOSIP Android mock SBI.

| **Scenarios**     | **Finger** | **Iris** | **Face** |
| ----------------- | ---------- | -------- | -------- |
| Total             | 19         | 21       | 15       |
| Passed            | 19         | 21       | 15       |
| Pending           | 0          | 0        | 0        |
| Failed            | 0          | 0        | 0        |
| **Test Rate (%)** | 100%       | 100%     | 100%     |
| **Pass Rate (%)** | 100%       | 100%     | 100%     |

#### For Android Registration Devices using MOSIP's Android mock SBI

* The `Android CTK app v1.1.0` with `MOSIP Android Mock SBI` has been tested for compliance with the specifications across 64 test cases.
* Test cases specific to quality and user interactions have been tested with MOSIP Android mock SBI and real registration face SBI.

| **Scenarios**     | **Finger** | **Iris** | **Face** |
| ----------------- | ---------- | -------- | -------- |
| Total             | 29         | 18       | 17       |
| Passed            | 29         | 18       | 17       |
| Pending           | 0          | 0        | 0        |
| Failed            | 0          | 0        | 0        |
| **Test Rate (%)** | 100%       | 100%     | 100%     |
| **Pass Rate (%)** | 100%       | 100%     | 100%     |

#### For Android Registration Devices using MOSIP's Android mock SBI

The `Android CTK app v1.1.0` with real `Android registration face SBI` has been tested for compliance with the specification only for registration face device.

| **Scenarios**     | **Finger** | **Iris** | **Face** |
| ----------------- | ---------- | -------- | -------- |
| Total             | 29         | 18       | 17       |
| Passed            | 0          | 0        | 3        |
| Pending           | 0          | 0        | 0        |
| Failed            | 0          | 0        | 14       |
| **Test Rate (%)** | 0%         | 0%       | 100%     |
| **Pass Rate (%)** | 0%         | 0%       | 18%      |

#### For Windows Authentication Devices using MOSIP's Windows mock SBI

The Windows CTK v1.1.0 with `MOSIP Windows Mock SBI` has been tested for compliance with the specifications across 55 authentication spec test cases.

| **Scenarios**     | **Finger** | **Iris** | **Face** |
| ----------------- | ---------- | -------- | -------- |
| Total             | 19         | 21       | 15       |
| Passed            | 19         | 21       | 15       |
| Pending           | 0          | 0        | 0        |
| Failed            | 0          | 0        | 14       |
| **Test Rate (%)** | 100%       | 100%     | 100%     |
| **Pass Rate (%)** | 100%       | 100%     | 100%     |

#### For Windows Registration Devices using MOSIP's Windows mock SBI

The Windows CTK v1.1.0 with `MOSIP windows Mock SBI` has been tested for compliance with the specifications across 76 registration spec test cases.

| **Scenarios**     | **Finger** | **Iris** | **Face** |
| ----------------- | ---------- | -------- | -------- |
| Total             | 35         | 21       | 20       |
| Passed            | 35         | 21       | 20       |
| Pending           | 0          | 0        | 0        |
| Failed            | 0          | 0        | 14       |
| **Test Rate (%)** | 100%       | 100%     | 100%     |
| **Pass Rate (%)** | 100%       | 100%     | 100%     |

**Out of scope**: Real devices testing in windows CTK.

#### SDK Testing

The SDK implementation has been tested to support quality check, match, extraction, and conversion of biometrics. Test cases have been tested with MOSIP mock SDK.

| **Scenarios**     | **With Mock SDK** | 
| ----------------- | ----------- | 
| Total             |  76           | 
| Passed            |   65          | 
| Pending           |    0        | 
| Failed            |  0           | 
| N/A          |  11           | 
| **Test Rate (%)** | 86%        | 
| **Pass Rate (%)** | 86%        |

**Out of scope**: Segmentation testing and Real SDK testing

### Known Issues 


| **Issue**         | **Description** | 
| ----------------- | ----------- | 
| MOSIP-26898      |	After login to CTK android app, the previous browser tab is not killed.|
| MOSIP-26762      |	Newly registered user not landing into CTK android home page (intermittent issue)|
| MOSIP-27044      |	In CTK Android app, UI elements are overlapping with each other.|
| MOSIP-27257      |	While initial launch, Android mock SBI is not landing into home page.|
| MOSIP-27304      |	In Android CTK -'Encryption Key' button is not appearing for Auth projects (Workaround: Partners can download 'Encryption Key' from web application)|
| MOSIP-27391      |	CTK - UI and Buttons not aligned properly|
| MOSIP-27440      |CTK UI Reliability bugs reported in SonarCloud|

### Docker version (required for Compliance Test Kit)

mosipqa/compliance-toolkit-service: 1.1.0

mosipqa/compliance-toolkit-ui: 1.1.0

mosipqa/postgres-init: 1.2.0.1

mosipid/postgres-init :1.2.0.1-B2

mosipid/config-server: 1.1.2

mosipid/kernel-auditmanager-service: 1.2.0.1-B1

mosipid/kernel-auth-service:1.2.0.1-B2

mosipqa/authentication-service: 1.2.0.1

mosipid/kernel-keymanager-service: 1.2.0.1-B2

mosipid/keycloak-init: 1.2.0.1-B2

mosipqa/partner-management-service: 1.2.0.1

mosipqa/partner-onboarder: develop

mosipid/kernel-notification-service: 1.2.0.1-B1

mosipid/keycloak-init: 1.2.0.1-B2

mosipid/mosip-keycloak: 16.1.1-debian-10-r85

mosipqa/keycloak-init: develop

## Sonar Report

#### MOSIP CTK Service

![](\_images/sonar-ctk-service.png)

#### MOSIP CTK UI Repository

![](\_images/sonar-ctk-ui.png)












