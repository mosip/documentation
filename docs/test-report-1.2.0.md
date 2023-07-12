# Test Report

## Scope

The scope of testing revolved around verifying the compliance of the product as per the specifications published by MOSIP using the below devices:

The Windows Compliance tool kit was tested with the below specifications:

  i.	**ABIS (Automated Biometric Identification System)** Specifications was tested with Fingerprint, Iris and Face modalities as per MOSIP- ABIS API specifications.

  ii.	**Secure Biometric Interface (SBI)**
        * Registration devices for Iris, Face and Fingerprint
        * Authentication devices for Iris, Face and Fingerprint
      
  iii. **Biometric SDK**
        *	Quality Check
        *	Match
        * Extraction
        * Conversion 

The Android Compliance tool kit app v1.1.0 was tested with the below specifications:

  i.	**Secure Biometric Interface (SBI)**
        *	Registration devices for Iris, Face and Fingerprint
        *	Authentication devices for Iris, Face and Fingerprint

## Test Execution Statistics

### ABIS Testing

MOSIP interfaces with an Automated Biometric Identification System (ABIS) to perform de-duplication of a resident's biometric data. A country may use multiple ABISs for the same biometric data and evaluate the best ABIS based on de-duplication quality. ABIS is used for 1:N de-duplication. For 1:1 authentication, Biometric SDK is used. MOSIP does not recommend using an ABIS for 1:1 authentication.

Test cases have been tested with MOSIP mock ABIS for compliance with the MOSIP specifications across 29 test cases.

| **Scenarios**     | **Finger** | **Iris** | **Face** |
| ----------------- | ---------- | -------- | -------- |
| Total             | 19         | 21       | 15       |
| Passed            | 19         | 21       | 15       |
| Pending           | 0          | 0        | 0        |
| Failed            | 0          | 0        | 0        |
| **Test Rate (%)** | 100%       | 100%     | 100%     |
| **Pass Rate (%)** | 100%       | 100%     | 100%     |

_Out of scope_: Real ABIS testing in CTK v1.2.0
