# Version 1.4.3

**Release Name:** CTK 1.4.3  

**Support:** Patch Release

**Release Date:** 22nd July, 2025

### Overview

The 1.4.3 version of CTK includes critical **bug fixes** and **new SDK test cases** for enhanced exception handling and schema validation, ensuring better partner alignment with MOSIP specifications and ABIS expectations.

#### Technical enhacements

- The reference ID generation logic is now updated to generate proper UUIDs conforming to the standard MOSIP format for all CTK-ABIS integration flows. 
- Updated CTK logic to differentiate between schema validation errors and invalid version values.

#### Feature Enhancements

#### New SDK Test Cases for Exception Handling in BDB Scenarios (SDK2076–SDK2096)

A total of **21 new SDK test cases** were introduced across **all 3 modalities (Face, Finger, Iris)** under the *Extract* method to validate behaviour when `<BDB>` is missing, null, or empty, and `<EXCEPTION>` is true/false.

**Scenarios Covered:**

1. `<BDB>` is empty + `<EXCEPTION>true>` → valid BIR response  
2. `<BDB>` is empty + `<EXCEPTION>false>` → SDK returns 402/404  
3. `<BDB>null>` + `<EXCEPTION>true>` → valid BIR response  
4. `<BDB>null>` + `<EXCEPTION>false>` → SDK returns 402/404  
5. `<BDB>` missing + `<EXCEPTION>true>` → valid BIR response  
6. `<BDB>` missing + `<EXCEPTION>false>` → SDK returns 402/404  
7. Valid `<BDB>` + `<EXCEPTION>true>` → SDK returns 401 error   

### Dependency

This release is compatible with the following components:

| Component               | Version                                |
|------------------------|----------------------------------------|
| Artifactory            | mosipid/artifactory-ref-impl: 1.2.0.1  |
| Audit Manager          | mosipid/kernel-auditmanager-service: 1.2.0.1-B1 |
| Auth Manager           | mosipid/kernel-authmanager: 1.2.0.1-B1 |
| Key Manager            | mosipid/kernel-keymanager-service: 1.2.0.1-B1 |
| Partner Management     | mosipid/partner-management-service: 1.2.0.1-B1 |
| KeyCloak               | mosipid/keycloak-init: 1.2.0.1-B1      |
| Postgres               | mosipid/postgres-init: 1.2.0.1-B1      |
| Config Server          | mosipid/config-server: 1.1.2           |
| Notification Service   | mosipid/kernel-notification-service: 1.2.0.1-B1 |
| ClamAV                 | clamav/clamav: latest                  |
| MinIO                  | latest                                 |


**Post-installation**, follow the setup steps [here](https://docs.mosip.io/compliance-tool-kit/how-to-guides/how-to-set-up-ctk/setup-steps-1.4.0)

### Repositories Released

| Modules                      | Version |
|-----------------------------|---------|
| compliance-toolkit-testcases| [v1.4.1](https://github.com/mosip/compliance-toolkit-testcases/tree/v1.4.1) |
| mosip-compliance-toolkit    | [v1.4.2](https://github.com/mosip/mosip-compliance-toolkit/tree/v1.4.2)|
| mosip-compliance-toolkit-ui | [v1.4.3](https://github.com/mosip/mosip-compliance-toolkit-ui/tree/v1.4.3) |



### Compatible Modules

| Module                         | Version |
|--------------------------------|---------|
| compliance-toolkit-batch-job   | [v1.4.0](https://github.com/mosip/compliance-toolkit-batch-job/tree/v1.4.0)  |
| mosip-config                   | [v1.4.0](https://github.com/mosip/mosip-config/tree/v1.4.0-CTK) |

### Known Issue
N/A

### Bug Fix 

| Jira Issue     | Description                                                             |
|----------------|-------------------------------------------------------------------------|
| [MOSIP-39381](https://mosip.atlassian.net/browse/MOSIP-39381)   | ABIS Reference ID Format in CTK Does Not Match MOSIP Specification.     |
| [MOSIP-39389](https://mosip.atlassian.net/browse/MOSIP-41892)    | CTK Incorrectly Expects Failure Reason 13 for Structurally Invalid ABIS Requests |

### Deprecated
N/A

## Documentation

- [Feature Documentation](https://docs.mosip.io/compliance-tool-kit)
- [Compliance Tool Kit User Guide](https://docs.mosip.io/compliance-tool-kit/user-guide)
- [Android CTK App User Guide](https://docs.mosip.io/compliance-tool-kit/android-user-guide)
- [Video Walkthroughs](https://www.youtube.com/playlist?list=PLJH-POb_55z8YYS_qAk_QNBQeiQ2VrtZD)

