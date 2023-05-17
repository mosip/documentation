# TEST REPORT

The scope of testing revolved around verifying the compliance of the product as per the specifications published by MOSIP using the below devices:

* Registration devices for Iris, Face and Fingerprint
* Authentication devices for Iris, Face and Fingerprint

The Android Compliance tool kit App v1.1.0 was tested with the below specifications:

* Secure Biometric Interface (SBI)

The windows compliance tool kit was tested with the below specifications:

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
| ----------------- | ---------- | 
| Total             |        | 
| Passed            |          | 
| Pending           |           | 
| Failed            |           | 
| **Test Rate (%)** | 100%       | 
| **Pass Rate (%)** | 100%       |

