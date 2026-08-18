# Version 1.4.4

**Release Name:** CTK 1.4.4

**Support:** Patch Release

**Release Date:** Coming Soon

#### Overview <a href="#overview" id="overview"></a>

The 1.4.4 version of CTK includes **bug fixes** addressing issues identified in the CTK compliance, validation, SDK, and integration workflows. These fixes improve the reliability, correctness, and alignment of CTK with MOSIP specifications and expected partner behaviour.

**Technical Enhancements**

* Resolved the technical issues identified as part of the CTKV1.4.4 release scope.
* Improved CTK behaviour across the affected compliance and validation workflows.
* Addressed issues impacting expected request/response validation and error handling.

#### Dependency <a href="#dependency" id="dependency"></a>

This release is compatible with the following components:

<table><thead><tr><th width="235.23046875">Component</th><th>Version</th></tr></thead><tbody><tr><td>Artifactory</td><td>mosipid/artifactory-server:1.3.1</td></tr><tr><td>Audit Manager</td><td>mosipid/kernel-auditmanager-service:1.3.1</td></tr><tr><td>Key Manager</td><td>mosipid/kernel-keymanager-service:1.4.0</td></tr><tr><td>Partner Management</td><td>mosipid/partner-management-service:1.2.2.2</td></tr><tr><td>KeyCloak</td><td>mosipid/keycloak-init:1.2.0.1</td></tr><tr><td>Postgres</td><td>mosipid/postgres-init:1.2.0.1</td></tr><tr><td>Config Server</td><td>mosipid/kernel-config-server:1.3.0</td></tr><tr><td>Notification Service</td><td>mosipid/kernel-notification-service:1.3.0</td></tr><tr><td>ClamAV</td><td>mosipid/clamav:latest</td></tr><tr><td>MinIO</td><td>latest</td></tr></tbody></table>

**Post-installation**, follow the setup steps [here](https://docs.mosip.io/compliance-tool-kit/how-to-guides/how-to-set-up-ctk/setup-steps-1.4.0).

#### Repositories Released <a href="#repositories-released" id="repositories-released"></a>

| Module                       | Version                                                                     |
| ---------------------------- | --------------------------------------------------------------------------- |
| compliance-toolkit-testcases | [v1.4.2](https://github.com/mosip/compliance-toolkit-testcases/tree/v1.4.2) |
| mosip-compliance-toolkit     | [v1.4.3](https://github.com/mosip/mosip-compliance-toolkit/tree/v1.4.3)     |
| mosip-compliance-toolkit-ui  | [v1.4.4](https://github.com/mosip/mosip-compliance-toolkit-ui/tree/v1.4.4)  |

#### Compatible Modules <a href="#compatible-modules" id="compatible-modules"></a>

| Module                       | Version                                                                             |
| ---------------------------- | ----------------------------------------------------------------------------------- |
| compliance-toolkit-batch-job | [v1.4.0](https://github.com/mosip/compliance-toolkit-batch-job/releases/tag/v1.4.0) |
| mosip-config                 | [v1.3.0](https://github.com/mosip/mosip-config/releases/tag/v1.3.0)                 |

#### Known Issue <a href="#known-issue" id="known-issue"></a>

Please refer this [link](https://mosip.atlassian.net/issues?jql=%22cf%5B10069%5D%22%20%3D%20CTKv1.4.5) to know more about known issues

#### Bug Fix <a href="#bug-fix" id="bug-fix"></a>

| Jira Issue                                                    | Description                                                                    |
| ------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| [MOSIP-45009](https://mosip.atlassian.net/browse/MOSIP-45009) | Remove SBI1058 – Auth Capture (10 Fingers) Test Case                           |
| [MOSIP-45008](https://mosip.atlassian.net/browse/MOSIP-45008) | Add Test Cases for Extract Template Collection with Empty BDB Value            |
| [MOSIP-45007](https://mosip.atlassian.net/browse/MOSIP-45007) | Add Error Code Validation for SBI1001 – Device Info Test Case                  |
| [MOSIP-45006](https://mosip.atlassian.net/browse/MOSIP-45006) | Fix Error Code Validation for SBI1028 – Device Not Ready Test Case             |
| [MOSIP-45005](https://mosip.atlassian.net/browse/MOSIP-45005) | Fix Error Code Validation for SBI1030-SBI1039– Bio Count Mismatch Test Cases   |
| [MOSIP-45004](https://mosip.atlassian.net/browse/MOSIP-45004) | Add Error Code Validation for Invalid Transaction ID Test Cases                |
| [MOSIP-42898](https://mosip.atlassian.net/browse/MOSIP-42898) | Issue with the CTK testcase 3026                                               |
| [MOSIP-42521](https://mosip.atlassian.net/browse/MOSIP-42521) | Token Validation Failure in ABIS3030 due to Authorization Cookie Case Mismatch |
| [MOSIP-42453](https://mosip.atlassian.net/browse/MOSIP-42453) | Reject Face Image if Not in 24-bit RGB Format                                  |
| [MOSIP-38185](https://mosip.atlassian.net/browse/MOSIP-38185) | Please make the changes in the initial prompts at the ABIS test data upload    |

### Documentation <a href="#documentation" id="documentation"></a>

* [Feature Documentation](https://docs.mosip.io/compliance-tool-kit)
* [Compliance Tool Kit User Guide](https://docs.mosip.io/compliance-tool-kit/user-guide)
* [Android CTK App User Guide](https://docs.mosip.io/compliance-tool-kit/android-user-guide)
* [Video Walkthroughs](https://www.youtube.com/playlist?list=PLJH-POb_55z8YYS_qAk_QNBQeiQ2VrtZD)
