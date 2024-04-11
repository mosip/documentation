## compliance toolkit Configurations
| Configuration   |      Description      |  Default Value |
|-----------------|-------------------|---------------|
| `mosip.toolkit.sbi.ports`| Default range of SBI (Secure Biometric Interface) ports scanned to connect to the devices. | 4501,4502,4503,4504,4505,4506,4507,4508,4509,4510 |
| `mosip.toolkit.sbi.timeout`|  This specifies the default timeout value for all SBI testcases which do not include 'timeout' in 'otherAttributes'. | 10000 |
| `mosip.toolkit.sbi.keyrotation.iterations`| This specifies the number of times the device key has to be rotated for execution of SBI testcases : SBI1022, SBI1023, SBI1024, SBI1025, SBI1060, SBI1061 | 2 |
| `mosip.toolkit.sbi.timestamp-interval`| Specifies the time interval, in minutes, in which SBI device should send back the response, verified through testing with the following SBI test cases : SBI1083, SBI1084, SBI1085, SBI1086, SBI1087, SBI1088, SBI1089, SBI1090 | 3 |
| `mosip.toolkit.languages.rtl`| Specifies the languages that follow a right-to-left (RTL) script direction. | ara |
| `mosip.toolkit.rcapture.encryption.enabled`| Enables encryption of 'bioValue' field of the SBI rcapture response before saving data into the database for RCapture SBI testcases. | true |
| `mosip.toolkit.sdk.finger.qualitycheck.threshold.value`| Specifies the minimum quality acceptance threshold value, used for quality checking when processing finger biometric data using SDK. | 60 |
| `mosip.toolkit.sdk.face.qualitycheck.threshold.value`| Specifies the minimum quality acceptance threshold value, used for quality checking when processing face biometric data using SDK. | 30 |
| `mosip.toolkit.sdk.iris.qualitycheck.threshold.value`| Specifies the minimum quality acceptance threshold value, used for quality checking when processing iris biometric data using SDK. | 30 |
| `mosip.toolkit.sbi.quality.assessment.failsafe`| When enabled, it ensures that all Quality Assessment test cases will pass, even if the biometric score falls below the predefined threshold. | true |
| `mosip.toolkit.document.scan`| Enables or disables the virus scanner for files upload in compliance toolkit. | false |
| `mosip.toolkit.compliance.collection.name`| Defines the name assigned to the 'Compliance Collection' for a new project, applicable across all project types (SBI, SDK, ABIS). | Compliance Collection - All TestCases |
| `mosip.toolkit.quality.assessment.collection.name`| Defines the name assigned to the 'Quality Assessment Collection' for a new project, applicable exclusively to the SBI project type.| Quality Assessment Collection - All TestCases |
| `mosip.toolkit.compliance.collection.ignore.testcases`| Specifies the test cases to be excluded during the creation of the 'Compliance Collection', these ignored test cases will not be included in the compliance collection. | |
| `mosip.toolkit.quality.assessment.collection.ignore.testcase`| Specifies the test cases to be excluded during the creation of the 'Quality Assessment Collection', these ignored test cases will not be included in the quality assessment collection. |  |
| `mosip.toolkit.documentupload.allowed.file.type`| Specifies the supported file formats for uploading biometric test data files in the compliance toolkit. | application/zip |
| `mosip.toolkit.documentupload.allowed.file.nameLength`| Specifies the maximum length allowed for file names during document uploads. | 50 |
| `mosip.toolkit.documentupload.allowed.file.size`| Sets the maximum allowed size, in bytes, for files uploaded within compliance toolkit. | 20000000 |
| `mosip.toolkit.report.expiryperiod.in.months`| Specifies the expiry period, in months, for reports generated within compliance toolkit. | 6 |
| `mosip.toolkit.sbi.qualitycheck.finger.sdk.urls`| Specifies the SDK URLs used for quality check of finger biometric data in compliance toolkit | [{"name": "BQAT SDK","url": "https://api-internal.net/bqatsdk-service","healthUrl": "https://api-internal.net/bqatsdk-service/actuator/health", "includeInResults":false}] |
| `mosip.toolkit.sbi.qualitycheck.face.sdk.urls`| Specifies the SDK URLs used for quality check of face biometric data in compliance toolkit | [{"name": "BQAT SDK","url": "https://api-internal.net/bqatsdk-service","healthUrl": "https://api-internal.net/bqatsdk-service/actuator/health", "includeInResults":false}] |
| `mosip.toolkit.sbi.qualitycheck.iris.sdk.urls`| Specifies the SDK URLs used for quality check of iris biometric data in compliance toolkit | [{"name": "BQAT SDK","url": "https://api-internal.net/bqatsdk-service","healthUrl": "https://api-internal.net/bqatsdk-service/actuator/health", "includeInResults":false}] |
| `mosip.toolkit.quality.assessment.age.groups`| Specifies the age groups used in Quality Assessment (QA) reports, categorized by age ranges. | child(5-12), adult(12-40), mature(40-59), senior(60+) |
| `mosip.toolkit.quality.assessment.occupations`| Defines occupations categories used in Quality Assessment (QA) reports to assess variations in biometric quality due to occupational factors for Finger modality. | labourer, non-labourer |
| `mosip.toolkit.quality.assessment.races`| Specifies racial demographic categories used in Quality Assessment (QA) reports for Face modality. | asian, african, european |
| `mosip.toolkit.batchjob.enable.testrun.archival`| Activates the test run archival process when set to 'true' and reverses the archiving, restoring previously archived test runs, when set to 'false'. | true |
| `mosip.toolkit.batchjob.testrun.archive.offset`| Specifies the number of recent test runs to keep, after which the older test runs will be moved to the archives and saved in the Compliance Toolkit. | 10 |
| `mosip.toolkit.batchjob.archival.revert.collectionids`| Specifies the collection IDs of a project for which the test run archival should be reverted for a specific partner.|  |
| `mosip.toolkit.batchjob.schedule.cron.testRunArchivalJob`| Specifies the CRON job schedule for triggering the test run archival process. In this configuration by default, the test run archival job is scheduled to run daily at midnight (00:00:00) UTC time.| 0 0 0 * * ? |


