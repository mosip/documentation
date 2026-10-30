# ID Repository v1.3.2

**Release Version:** ID Repository v1.3.2

**Release Type:** Patch Release

**Release Date:** <mark style="color:red;">**Coming Soon!**</mark>

### Overview

This release addresses an issue in the ID Repository where anonymous profile data was stored as null in the database. The fix ensures that anonymous profile data is correctly populated in IDRepo, improving the reliability and consistency of data storage.

The release also includes fixes for configuration issues in the Config Server, including missing private repository configuration and empty environment ConfigMaps when the multiple repository option is disabled. Additionally, deployment failures and documentation inconsistencies in k8s-infra for versions 1.2.1.0 and 1.2.1.1 have been addressed.&#x20;

### Major Highlights/ Features

* **Anonymous Profile Data Fix:** Ensures that anonymous profile data is correctly stored in IDRepo.
* **Config Server Configuration Fixes:** Resolves issues related to missing private repository configuration and empty environment ConfigMaps during installation.
* **Infrastructure Deployment Fixes:** Addresses deployment failures and documentation mismatches in k8s-infrafor versions 1.2.1.0 and 1.2.1.1..

#### Note

For countries and community users with affected anonymous profile records, will be sharing the approach in the upcoming release to follow

### Bug Fixes

| **JIRA**                                                                                                                                                    | **Description**                                                                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| [MOSIP-45189](https://mosip.atlassian.net/browse/MOSIP-45189?xpis=eyJicmlkZ2UiOiJzbWFydExpbmtzIiwiaWQiOiIxNzkxODcxMTU1MDE1Iiwic291cmNlIjoiY29uZmx1ZW5jZSJ9) | Anonymous profile data is null in IDRepo database                                                 |
| [MOSIP-44535](https://mosip.atlassian.net/browse/MOSIP-44535?xpis=eyJicmlkZ2UiOiJzbWFydExpbmtzIiwiaWQiOiIxNzkzMjUxOTE4ODgzIiwic291cmNlIjoiY29uZmx1ZW5jZSJ9) | Missing private repository configuration in config-server values.yaml for 1.2.1.0 mosip-infra     |
| [MOSIP-44536](https://mosip.atlassian.net/browse/MOSIP-44536?xpis=eyJicmlkZ2UiOiJzbWFydExpbmtzIiwiaWQiOiIxNzkzMjUxOTE4ODgzIiwic291cmNlIjoiY29uZmx1ZW5jZSJ9) | Config-server Env ConfigMap is empty when multiple repo option is disabled during install-1.2.1.0 |
| [MOSIP-44794](https://mosip.atlassian.net/browse/MOSIP-44794)                                                                                               | Deployment Failures and Documentation Mismatch in k8s-infra v1.2.1.1 & v1.2.1.0                   |

### Repositories Released

| **Repository** | **Tags** |
| -------------- | -------- |
| ID Repository  | v1.3.2   |
| Commons        | v1.3.2   |
| k8s-infra      | v1.2.1.4 |

### Compatible Platform/Module

The following table outlines the tested and certified compatibility of Android Registration Client v1.1.0 with other modules.

| **Platform/ Module** | **Version**                                                                         |
| -------------------- | ----------------------------------------------------------------------------------- |
| MOSIP                | [v1.2.1.1](https://docs.mosip.io/1.2.0/roadmap-and-releases/releases/v1.2.1.1)      |
| eSignet              | [v1.4.1](https://docs.esignet.io/home/esignet/roadmap-and-releases/versions/v1.4.1) |

### Documentation

* [Feature Documentation - Anonymous Profiling Support](https://docs.mosip.io/1.2.0/id-lifecycle-management/support-systems/reporting/anonymous-profiling-support)
* [Feature Documentation - ID Repository](https://docs.mosip.io/1.2.0/id-lifecycle-management/identity-issuance/id-repository)
* QA Report
