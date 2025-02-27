# Version 1.4.2

**Release Name:** CTK 1.4.2

**Support:** Patch Release

**Release Date**: Coming Soon!

### **Overview**

The 1.4.2 version of CTK includes the following hotfixes:

**Bug Fixes**

* **ABIS Reference ID Format Compliance with MOSIP Specification**
  * **Issue**: The **Reference ID** generated in CTK did not follow the MOSIP specification. Instead of a 36-character UUID (e.g., 123e4567-e89b-12d3-a456-426655440000), the format observed was "abis\_ff6a008e57294c5f81f92a921bea1c1\_ABIS3000".
  * **Fix:** The **Reference ID** generation logic in CTK has been updated to strictly adhere to the MOSIP UUID format, ensuring compatibility with ABIS integration.

**Technical Enhancements**

* Ensured that all reference IDs generated within CTK now comply with the 36-character UUID format as per MOSIP standards.
* Improved validation mechanisms to prevent non-compliant **Reference ID** formats in future versions.

#### **Dependency**

This hotfix is compatible with the dependencies listed below; no additional updates are required.

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

Post installation, follow the setup steps available [**here**](https://docs.mosip.io/compliance-tool-kit/how-to-guides/how-to-set-up-ctk/setup-steps-1.4.0)**.**

#### **Repositories Released**

| Repositories                | Tags Released |
| --------------------------- | ------------- |
| mosip-compliance-toolkit    | v1.4.2        |
| mosip-compliance-toolkit-ui | v1.4.2        |

### **Bug Fixes**

| Jira Issue                                                        | Issue Description                                                   |
| ----------------------------------------------------------------- | ------------------------------------------------------------------- |
| [**MOSIP-39381**](https://mosip.atlassian.net/browse/MOSIP-39381) | ABIS Reference ID Format in CTK Does Not Match MOSIP Specification. |

#### **Documentation**

* [Feature Documentation](https://docs.mosip.io/compliance-tool-kit)
* [Compliance Tool Kit User Guide](https://docs.mosip.io/compliance-tool-kit/user-guide)
* [Android CTK App user Guide](https://docs.mosip.io/compliance-tool-kit/android-user-guide)
* [Videos](https://www.youtube.com/playlist?list=PLJH-POb_55z8YYS_qAk_QNBQeiQ2VrtZD)
