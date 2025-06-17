# Version 0.17.1

**Release Name:** Mimoto 0.17.1(Patch)

**Release Type:** Developer

**Release Date:** 16th June, 2025

### **Overview**

We are pleased to announce the patch release of **Mimoto Version 0.17.1**. This release brings targeted fixes to enhance the reliability and correctness of the Mimoto API test automation suite. These changes ensure smooth compatibility by stabilizing test rig behaviour, ensuring proper handling of transaction identifiers, and validating negative test scenarios more intelligently.

### **Key Highlights**

#### 1. Unique Transaction ID Handling

**Feature:** Dynamic nonce and transaction ID generation

* Test rig updated to generate **unique transaction ID and nonce values** per test run.
* Prevents failures due to repeated values in sequential or parallel executions.
* Ensures that test results reflect functional correctness rather than stale or reused state.

#### 2. Auth Factor Update for Sunbird Authentication

**Feature:** Configurable authFactorType for Sunbird

* In esignet environment v1.4.1, the auth factor type for **Sunbird Insurance** was updated to KBI.
* Introduced config support via sunbirdInsuranceAuthFactorType=KBA in config maps for flexible override.
* Fix ensures authentication flows work correctly across all test environments using the correct factor types.

#### 3. Flexible Error Code Assertion for Negative OTP Binding

**Feature:** Enhanced negative scenario validation

* For binding OTP negative test cases, the **allowed error codes** are now:
  * IDA-MLC-009
  * binding\_auth\_failed
* If either code is returned in response, the test will **now be marked as passed**.
* Prevents false negatives and aligns validation logic with expected backend behaviour.

### **Technical Improvements**

* POM Version update.
* Improved assertion logic for OTP binding negative flows.
* Configurable authentication flows for issuer-specific authFactorTypes.
* Nonce and transaction ID generation are randomized at runtime.
* Ensures stability and accuracy of automated tests in CI/CD pipelines.

### **Features Released**

N/A

### **Repository Released**

| **Module** | **Version**                                            |
| ---------- | ------------------------------------------------------ |
| **mimoto** | [0.17.1](https://github.com/mosip/mimoto/tree/v0.17.1) |

### **Compatible Modules**

| Module                 | Version                                                                    |
| ---------------------- | -------------------------------------------------------------------------- |
| **Inji Mobile Wallet** | [v0.16.0](https://github.com/mosip/inji-wallet/tree/v0.16.0)               |
| **Inji Web Wallet**    | [v0.12.0](https://github.com/mosip/inji-web/tree/v0.12.0)                  |
| **Inji Verify**        | [v0.12.3](https://github.com/mosip/inji-verify/tree/v0.12.3)               |
| **esignet**            | [1.5.1](https://github.com/mosip/esignet/tree/v1.5.1)                      |
| **inji-config**        | [0.8.0](https://github.com/mosip/inji-config/tree/v0.8.0)                  |
| **Inji Certify**       | [0.11.0](https://github.com/mosip/inji-certify/tree/v0.11.0)               |
| **durian(data share)** | [v1.3.0-beta.2](https://github.com/mosip/durian/releases/tag/1.3.0-beta.2) |

### **Known Issues**

N/A

### **Bug Fixes**

N/A

#### **Deprecated**

N/A

#### **Documentation**

* [Feature Documentation](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features)
* [Integration Guides](https://docs.mosip.io/inji/inji-mobile-wallet/integration-guide)
* [User Guide](https://docs.mosip.io/inji/inji-mobile-wallet/end-user-guide)
* [QA Report](test-report.md)
* [API Documentation](https://github.com/mosip/mimoto/tree/release-0.15.x/docs/postman-collections)
