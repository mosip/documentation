# Version 1.3.0

**Release Name**: CTK 1.3.0

**Upgrade From**: CTK 1.2.0

**Support**: Stable Release

**Release Date**: 5th January, 2024

**Note**:
 1. On January 25th, 2024, the `mosip-compliance-toolkit` tag has been updated from **v1.3.0** to **v1.3.1** in order to resolve a bug in the `BiometricsQualityCheckValidator` during the conversion of `bioScore` into `bioScoreRange`.
 2. Furthermore, on February 12th, 2024, an update was made to the `mosip-compliance-toolkit` tag from **v1.3.1** to **v1.3.2**. This update aims to address the issue of missing table names in the `ddl.sql` located within the `db_scripts` folder.

## Overview

The 1.3.0 version of CTK includes the following new features:

* Enhanced **Report Generation** and submission capabilities for CTK (Report for Review).
* Added Admin login functionality to enable viewing Partner Reports, conducting Test Runs, and approving or rejecting submitted Reports.
* Incorporated Quality Assessment testcases using BQAT quality check on biometrics captured by SBI devices.
* Additional Hash Validation testcases for SBI to ensure data integrity.
* Included support for [Kibana Dashboards](ctk-dashboards-kibana.md) in CTK.

To know more about the Hash generation logic, read [Hash Generation](hash-generation.md).

### Repository Released

| Repositories                | Tags Released                                                              |
| --------------------------- | -------------------------------------------------------------------------- |
| mosip-compliance-toolkit    | [v1.3.2]()    |
| mosip-compliance-toolkit-ui | [v1.3.0](https://github.com/mosip/mosip-compliance-toolkit-ui/tree/v1.3.0) |
| bio-utils                   | [v1.2.0.1-B4](https://github.com/mosip/bio-utils/tree/v1.2.0.1-B4)         |
| Imagedecoder                | [v0.9.0](https://github.com/mosip/imagedecoder/tree/v0.9.0)                |

### Dependency

* Artifactory: mosipid/artifactory-ref-impl: 1.2.0.1-B2
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

Post installation, follow the setup steps available [here](setup-steps-1.3.0.md).

### Documentation

* [Feature Documentation](./)
* [Compliance Tool Kit User Guide](user-guide.md)
* [Android CTK App user Guide](android-user-guide.md)
* [QA Report](test-report-1.3.0.md)
* [Videos](https://www.youtube.com/playlist?list=PLJH-POb\_55z8YYS\_qAk\_QNBQeiQ2VrtZD)
