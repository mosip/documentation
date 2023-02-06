# Test Report

## Testing Scope

The scope of testing revolved around verifying the compliance of the product as per the specifications published by MOSIP using the below devices: Registration devices for iris, face and fingerprint Authentication devices for the iris, face and fingerprint The compliance tool kit was tested with the below biometric specifications:

1. SBI \
   a. Registration \
   b. Authentication
2. SDK \
   a. Quality Check \
   b. 1: N Match \
   c. Extraction \
   d. Conversion

## Test Execution Statistics

### SBI Testing

The Secure Biometric Interface (SBI) is used to interface with biometric devices. The compliance tool kit was tested to ensure that the interface built by the device provider follows the specs and security rules defined in the SBI spec.

#### For Authentication Devices using MOSIP's mock SBI devices

The MOSIP’s Mock SBI has been tested for compliance with the specifications across 48 test cases. Test cases specific to quality and user interactions have been tested with real devices rather than mock.

| **Scenarios**     | **Finger** | **Iris** | **Face** |
| ----------------- | ---------- | -------- | -------- |
| Total             | 17         | 18       | 13       |
| Passed            | 17         | 18       | 13       |
| Pending           | 0          | 0        | 0        |
| Failed            | 0          | 0        | 0        |
| **Test Rate (%)** | 100%       | 100%     | 100%     |
| **Pass Rate (%)** | 100%       | 100%     | 100%     |

#### For Registration Devices using MOSIP's mock SBI devices

The MOSIP’s Mock SBI has been tested for compliance with the specifications across 65 test cases. Test cases specific to quality and user interactions have been tested with real devices rather than mock.

| **Scenarios**     | **Finger** | **Iris** | **Face** |
| ----------------- | ---------- | -------- | -------- |
| Total             | 30         | 18       | 17       |
| Passed            | 30         | 18       | 17       |
| Pending           | 0          | 0        | 0        |
| Failed            | 0          | 0        | 0        |
| **Test Rate (%)** | 100%       | 100%     | 100%     |
| **Pass Rate (%)** | 100%       | 100%     | 100%     |

#### For Authentication Devices using MOSIP's real devices (only finger)

The MOSIP’s real devices have been tested for compliance with the specification only for fingerprint and iris devices.

| **Scenarios**     | **Finger** | **Iris** | **Face** |
| ----------------- | ---------- | -------- | -------- |
| Total             | 17         | 18       | 13       |
| Passed            | 14         | 1        | 0        |
| Pending           | 0          | 0        | 13       |
| Failed            | 3          | 17       | 0        |
| **Test Rate (%)** | 100%       | 100%     | 0%       |
| **Pass Rate (%)** | 82%        | 6%       | 0%       |

#### For Registration Devices using MOSIP's real devices

The MOSIP’s real SBI has been tested for compliance with the specifications for iris, face and fingerprint devices.

| **Scenarios**     | **Finger** | **Iris** | **Face** |
| ----------------- | ---------- | -------- | -------- |
| Total             | 30         | 18       | 17       |
| Passed            | 30         | 18       | 17       |
| Pending           | 0          | 0        | 0        |
| Failed            | 0          | 0        | 0        |
| **Test Rate (%)** | 100%       | 100%     | 100%     |
| **Pass Rate (%)** | 100%       | 100%     | 100%     |

### SDK Testing

The SDK implementation has been tested to support quality checks, 1:N matches, extraction, and conversion of biometrics.

**Out of scope**: Segmentation testing

| **Scenarios**.    | **With Mock SDK** | **With Real SDK 1** | **With Real SDK 2** |
| ----------------- | ----------------- | ------------------- | ------------------- |
| Total             | 76                | 76                  | 76                  |
| Passed            | 66                | 27                  | 51                  |
| Pending           | 0                 | 0                   | 0                   |
| Failed            | 1                 | 11                  | 16                  |
| Not Applicable    | 9                 | 28                  | 9                   |
| **Test Rate (%)** | 88%               | 50%                 | 88%                 |
| **Pass Rate (%)** | 87%               | 36%                 | 67%                 |

## Sonar Report

<figure><img src=".gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>
