# Test Report

Persona-based testing has been adopted to perform IV\&V by simulating real-world scenarios.

A persona is a fictional user profile representing a type of user. Persona-based testing puts testers in the customer's shoes to assess needs and derive the use cases customers will execute. These needs may be addressed through any of the following:

* Functionality
* Deployability
* Configurability
* Customizability

Default configuration:

* eSignet with 6 languages (English/Khmer/Hindi/Kannada/Arabic/Tamil)
* Signup with 2 languages (Khmer/English)

Main features tested:

* Signup Portal with mock ID
* Login with Password with mock ID
* Forgot Password with mock ID
* Login with OTP and biometrics with mock ID
* Login with KBI with mock ID
* Identity verification process (L2 flow) with mock ID and MOSIP ID
* Identity verification process (L1 flow) with CRE
* Wallet login performed (CRE) for release environment
* Signup Portal with MOSIP IDA
* Login with Password with MOSIP IDA
* Forgot Password with MOSIP IDA
* Login with OTP and biometrics with MOSIP IDA
* Sunbird Plugin with KBI login
* DPoP and PAR in all plugins
* Deployment testing on eSignet & signup-mosipid-qabase plugin
* FAPI 2.0 compliance

Features not in scope:

* UI Automation for Signup/eSignet

## Feature Health

![Feature Health](../../../.gitbook/assets/unknown.png)

## Test execution statistics

## Functional test results

Below are functional testing metrics using mock MDS, mock Auth, and mock ABIS. Black-box testing based on specifications was performed across individual modules and integrations. Test data aligned to user stories; results were verified via UI. Coverage includes GUI, system, end-to-end flows across multiple languages and configurations. Testing simulated multiple identity schema and corresponding UI schema configurations.

| Total | Passed | Failed | Skipped |
| :---: | :----: | :----: | :-----: |
|  3443 |  3372  |   36   |    35   |

Test Run Rate: 98% • Pass Rate: 98%

**Note**: In API-based testing, 35 test cases were marked as skipped because they were not automated and cannot be executed using Postman.

Here is the detailed breakdown:

### API Based Testing — eSignet

| Total | Passed | Failed | Skipped |
| :---: | :----: | :----: | :-----: |
|  2192 |  2139  |   18   |    35   |

### UI Based Testing

| Total | Passed | Failed | Skipped |
| :---: | :----: | :----: | :-----: |
|  1251 |  1233  |   18   |    0    |

### API TestRig — eSignet and Signup (Mock ID)

API Based TestRig — eSignet

| Total | Passed | Failed | Skipped | Ignored | Known Issues |
| ----: | -----: | -----: | ------: | ------: | -----------: |
|  1273 |    729 |      0 |       0 |     544 |            0 |

API Based TestRig — eSignet Signup

<table><thead><tr><th width="251.421875" align="center">Total</th><th align="center">Passed</th><th align="center">Failed</th><th align="center">Skipped</th><th align="center">Ignored</th><th align="center">Known Issues</th></tr></thead><tbody><tr><td align="center">665</td><td align="center">635</td><td align="center">0</td><td align="center">0</td><td align="center">30</td><td align="center">0</td></tr><tr><td align="center"></td><td align="center"></td><td align="center"></td><td align="center"></td><td align="center"></td><td align="center"></td></tr></tbody></table>

**Note**: 544 test cases in eSignet and 30 test cases in signup related to the MOSIP ID plug-in are currently being ignored.

### API TestRig — eSignet and Signup (MOSIP — CRE)

API Based TestRig — eSignet

| Total | Passed | Failed | Skipped | Ignored | Known Issues |
| :---: | :----: | :----: | :-----: | :-----: | :----------: |
|  1273 |  1091  |    8   |    8    |   166   |       0      |

API Based TestRig — eSignet Signup

| Total | Passed | Failed | Skipped | Ignored | Known Issues |
| :---: | :----: | :----: | :-----: | :-----: | :----------: |
|  665  |   405  |   53   |   190   |    17   |       0      |

**Note**:

* 61 Failures in eSignet; in signup, 198 are skipped due to L2 flow not being supported in eSignet and signup.

API TestRig results for eSignet and Signup with MOSIP — qa-base:

API Based TestRig — eSignet

| Total | Passed | Failed | Skipped | Ignored | Known Issues |
| :---: | :----: | :----: | :-----: | :-----: | :----------: |
|  1273 |  1107  |    0   |    0    |   166   |       0      |

API Based TestRig — eSignet Signup

| Total | Passed | Failed | Skipped | Ignored | Known Issues |
| :---: | :----: | :----: | :-----: | :-----: | :----------: |
|  665  |   648  |    0   |    0    |    17   |       0      |

**Note**: 166 test cases in eSignet and 17 test cases in signup related to the mock plug-in are currently being ignored.

API TestRig results for eSignet and Signup with Sunbird:

API Based TestRig — Sunbird

| Total | Passed | Failed | Skipped | Ignored | Known Issues |
| :---: | :----: | :----: | :-----: | :-----: | :----------: |
|  1273 |   93   |    0   |    0    |   1180  |       0      |

**Note**: mock and mosipid plugin test cases are being ignored.

### Detailed Test Metrics:

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from defect density, test coverage, test execution coverage, test tracking, and efficiency.

Key tracking metrics:

* Passed Test Case Coverage: (Number of passed tests / Total executed) × 100
* Failed Test Case Coverage: (Number of failed tests / Total executed) × 100

### Sonar Report

|                   Repo                  |     Branch     |  Release (POM) | Coverage (≥80%) | Reliability | Security | Hotspots | Duplications (<3%) |
| :-------------------------------------: | :------------: | :------------: | :-------------: | :---------: | :------: | :------: | :----------------: |
|                 eSignet                 |  release-1.7.x |  release-1.7.1 |       84.8      |      0      |     0    |     0    |         0%         |
|              eSignet Signup             |  release-1.3.x |  release-1.3.1 |       81.9      |      0      |     0    |     0    |         0%         |
|          esignet-mock-services          | release-0.12.x | release-0.12.1 |       85.2      |      0      |     0    |     0    |         0%         |
|      esignet-plugins (mock-plugin)      |  release-1.3.x |  release-1.3.4 |       83.0      |      0      |     0    |     0    |        2.9%        |
| esignet-plugins (mosip-identity-plugin) |  release-1.3.x |  release-1.3.4 |       69.1      |      0      |     0    |     0    |         0%         |
|   esignet-plugins (sunbird-rc-plugin)   |  release-1.3.x |  release-1.3.4 |       83.0      |      0      |     0    |     0    |         0%         |
