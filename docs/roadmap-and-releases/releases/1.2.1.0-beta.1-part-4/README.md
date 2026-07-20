# 1.2.1.0-beta.1 (Part-4)

**Release Version:** 1.2.1.0

**Release Type:** Beta Release

**Release Date:** 10th July,2025

### **Overview**

This patch release introduces a schema-level compatibility update across multiple modules to support the latest release of the Partner Management System. This release ensures that the updates are made in the Key Manager, IDA, Master Data, and Registration Client modules. Specifically, the `ca_cert_type` column is added to the certificate storage tables to support enhanced CA certificate handling in upcoming workflows.

### **Major Highlights/Features**

* Schema alignment across modules for Partner Management integration.
* Ensures cross-module compatibility for upcoming enhancements in certificate lifecycle management.

### **Enhancements**

* Extended database schema in IDA, Master Data, and Registration Client modules for consistency with the updated Key Manager.

### **Bug Fixes**

| Issue ID                                                      | Description                                                                                                                                                                              |
| ------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [MOSIP-40959](https://mosip.atlassian.net/browse/MOSIP-40959) | Fixed: Missing `ca_cert_type` column in the `ca_cert_store` tables of IDA, Master Data, and Registration Client databases, which was required for Partner Management System integration. |

### **Known Issues**

| JIRA                                                          | Description                                                                                                                                                                        |
| ------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [MOSIP-41856](https://mosip.atlassian.net/browse/MOSIP-41856) | Several authentication-related test cases are failing in the release-1.2.2.x branch automation, mainly involving deactivated UIN scenarios and invalid or edge-case input handling |

### **Repository Released**

| Repository          | Tag Released                                                                     |
| ------------------- | -------------------------------------------------------------------------------- |
| id-authentication   | [v1.3.0-beta.2](https://github.com/mosip/id-authentication/tree/v1.3.0-beta.2)   |
| admin-services      | [v1.3.0-beta.2](https://github.com/mosip/admin-services/tree/v1.3.0-beta.2)      |
| registration-client | [v1.3.0-beta.2](https://github.com/mosip/registration-client/tree/v1.3.0-beta.2) |
| keymanager          | [v1.3.0-beta.3](https://github.com/mosip/keymanager/tree/v1.3.0-beta.3)          |

### **DB Changes**

| Database             | Table           | Change Description          |
| -------------------- | --------------- | --------------------------- |
| mosip\_ida           | ca\_cert\_store | Added column `ca_cert_type` |
| mosip\_master        | ca\_cert\_store | Added column `ca_cert_type` |
| regclient (Derby DB) | ca\_cert\_store | Added column `ca_cert_type` |
| mosip\_keymgr        | ca\_cert\_store | Added column `ca_cert_type` |

### **Documentation**

* [Functional Test Report](https://github.com/mosip/documentation/blob/1.2.0/docs/roadmap-and-releases/releases/1.2.1.0-beta.1-part-4/docs/roadmap-and-releases/releases/1.2.1.0-beta.1-part-4/test-report.md)
