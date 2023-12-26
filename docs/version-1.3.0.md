# Version 1.3.0

**Release Name**: CTK 1.3.0

**Upgrade From**: CTK 1.2.0

**Support**: Stable Release

**Release Date**: 26th December, 2023

## Overview

The 1.3.0 version of CTK includes the following new features:

* Enhanced **Report Generation** and submission capabilities for CTK (Report for Review).
* Added Admin login functionality to enable viewing Partner Reports, conducting Test Runs, and approving or rejecting submitted Reports.
* Incorporated Quality Assessment testcases using BQAT quality check on biometrics captured by SBI devices.
* Additional Hash Validation testcases for SBI to ensure data integrity.
* Introduced Data Share related testcases for ABIS.
* Included support for Kibana Dashboards in CTK.

## Dependency

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

## Documentation

* [Feature Documentation](./)
* [Compliance Tool Kit User Guide](user-guide.md)
* [Android CTK App user Guide](android-user-guide.md)
* [QA Report](https://docs.mosip.io/compliance-tool-kit/versions/version-1.3.0/test-report-1.3.0)
* [Videos](https://www.youtube.com/playlist?list=PLJH-POb\_55z8YYS\_qAk\_QNBQeiQ2VrtZD)
