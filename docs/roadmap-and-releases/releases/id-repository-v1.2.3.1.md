# ID Repository v1.2.3.1

**Release Version:** ID Repository v1.2.3.1

**Release Type:** Patch Release

**Release Date:** <mark style="color:red;">**Coming Soon!**</mark>

### Overview

This release addresses an issue in the ID Repository where anonymous profile data was stored as null in the database. The fix ensures that anonymous profile data is correctly populated in IDRepo, improving the reliability and consistency of anonymous profile data storage.

### Major Highlights/ Features

* **Anonymous Profile Data Fix:** Ensures anonymous profile data is correctly stored in IDRepo.

#### Note

For countries and community users with affected anonymous profile records, will be sharing the approach in the upcoming release to follow

### Bug Fixes

| **JIRA**                                                                                                                                                    | **Description**                                   |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------- |
| [MOSIP-45189](https://mosip.atlassian.net/browse/MOSIP-45189?xpis=eyJicmlkZ2UiOiJzbWFydExpbmtzIiwiaWQiOiIxNzkxODcxMTU1MDE1Iiwic291cmNlIjoiY29uZmx1ZW5jZSJ9) | Anonymous profile data is null in IDRepo database |

### Repositories Released

| **Repository** | **Tags** |
| -------------- | -------- |
| ID Repository  | v1.2.3.1 |

### Compatible Platform/Module

The following table outlines the tested and certified compatibility of Android Registration Client v1.1.0 with other modules.

| **Platform/ Module** | **Version**                                                                         |
| -------------------- | ----------------------------------------------------------------------------------- |
| MOSIP                | [v1.2.0.2](https://docs.mosip.io/1.2.0/roadmap-and-releases/releases/1.2.0.2)       |
| eSignet              | [v1.4.1](https://docs.esignet.io/home/esignet/roadmap-and-releases/versions/v1.4.1) |

### Documentation

* [Feature Documentation - Anonymous Profiling Support](https://docs.mosip.io/1.2.0/id-lifecycle-management/support-systems/reporting/anonymous-profiling-support)
* [Feature Documentation - ID Repository](https://docs.mosip.io/1.2.0/id-lifecycle-management/identity-issuance/id-repository)
* QA Report
