# Version 1.4.0

**Release Name**: CTK 1.4.0

**Support**: Stable Release

**Release Date**: 15th April, 2024

## Overview

The 1.4.0 version of CTK includes the following new features:

**New Features in CTK 1.4.0 release**

1. Quality Assessment Report is now available for Quality Assessment Collections. This report is eligible for review, similar to the Compliance Collection report.
2. Added a new CTK Landing page
3. Added Terms & Conditions consent popup for partners during login. If a partner does not provide consent, they will be automatically logged out.

**SBI Testcases Enhancements**

1. Added a negative SBI testcase SBI1196 where Discover request attributes are in UPPER CASE
2. Added testcases(SBI1197, SBI1198 and SBI1199) where bioSubTypes is optional in RCapture request
3. Enhanced all SBI schemas by adding "Additional Properties" as "false" in all nested objects as well. This will disallow any extra attributes at nested levels.
4. Community reported issue in the CTK UI GitHub repository is fixed - Android SBI CTK Check Device Status failed: SBI1028, SBI1029
5. In the trust validation process, we’ve now incorporated an additional check for the Organization Name. This check involves verifying both the logged-in user’s organization and the Subject Organization specified in the certificate. By doing so, we enhance the security and reliability of our validation procedures.
6. Responses from SBI RCapture will now be encrypted and stored in the CTK database.
7. In response to a community-reported issue, CTK now sends the ‘previousHash’ as the SHA256 hash of an empty UTF-8 string, rather than simply an empty string.
8. The attributes, "requestedScore" and "qualityScore" currently support floating point numbers in CTK schemas and testcases.

**ABIS Testcases Enhancements**

1. Added new ABIS DataShare related testcases ABIS3030, ABIS3031. ABIS3031 is inactive in this release since it needs some changes in kernel-auth-adapter.
2. Enhanced all ABIS schemas by adding "Additional Properties" as "false" in all nested objects as well. This will disallow any extra attributes at nested levels.

**SDK Testcases Enhancements**

1. Enhanced all SDK schemas by adding "Additional Properties" as "false" in all nested objects as well. This will disallow any extra attributes at nested levels.

**Technical Enhancements**

1. Added a Batch Job for Archival of oldest X test runs per collection to an archive table. This X is configurable.
2. API documentation
3. Create separate repository for CTK test cases.
4. CTK 1.4.0 test with latest released code of Mock MDS, Mock SDK and Mock ABIS
5. Capture BQAT version and other details in Quality Assessment Report
6. Fixed bugs identified in Security Testing of CTK

### Repository Released

| Repositories                 | Tags Released                                                               |
| ---------------------------- | --------------------------------------------------------------------------- |
| mosip-compliance-toolkit     | [v1.4.0](https://github.com/mosip/mosip-compliance-toolkit/tree/v1.4.0)     |
| mosip-compliance-toolkit-ui  | [v1.4.0](https://github.com/mosip/mosip-compliance-toolkit-ui/tree/v1.4.0)  |
| compliance-toolkit-batch-job | [v1.4.0](https://github.com/mosip/compliance-toolkit-batch-job/tree/v1.4.0) |
| compliance-toolkit-testcases | [v1.4.0](https://github.com/mosip/compliance-toolkit-testcases/tree/v1.4.0) |
| mosip-config                 | [v1.4.0](https://github.com/mosip/mosip-config/tree/v1.4.0-CTK)             |

### Dependency

* Artifactory: mosipid/artifactory-ref-impl: 1.2.0.1
* Audit manager: mosipid/kernel-auditmanager-service: 1.2.0.1-B1
* Auth Manager: mosipid/kernel-authmanager: 1.2.0.1-B1
* Key Manager: modipid/kernel-keymanager-service: 1.2.0.1-B1
* Partner Management: mosipid/partner-management-service: 1.2.0.1-B1
* KeyCloak: mosipid/keycloak-init: 1.2.0.1-B1
* Postgres: mosipid/postgres-init: 1.2.0.1-B1
* Config Server: config-server: mosipid/config-server: 1.1.2
* Notification Service: mosipid/kernel-notification-service: 1.2.0.1-B1
* ClamAV: clamav/clamav: latest
* MinIO

Post installation, follow the setup steps available [here](https://docs.mosip.io/compliance-tool-kit/how-to-guides/how-to-set-up-ctk/setup-steps-1.4.0).

### Documentation

* [Feature Documentation](../../)
* [Compliance Tool Kit User Guide](../../user-guide.md)
* [Android CTK App user Guide](../../android-user-guide.md)
* [QA Report](https://docs.mosip.io/compliance-tool-kit/versions/version-1.4.0/test-report)
* [Videos](https://www.youtube.com/playlist?list=PLJH-POb\_55z8YYS\_qAk\_QNBQeiQ2VrtZD)
