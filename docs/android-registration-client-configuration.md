# Android Registration Client Configuration Guide

This guide provides a comprehensive list of configurable properties for the Android Registration Client. Please note that this list is not exhaustive but serves as a helpful checklist for reviewing commonly configured properties.

It is important to acknowledge that all properties listed in this guide are automatically synchronized with the Android Registration Client. These properties are sourced from the `registration-default.properties` file.


#### Configuration files

* `application-default.properties`

* `registration-default.properties`

#### SBI related configurations

Timeouts in milliseconds set during any http calls to SBI.

```
mosip.registration.mdm.connection.timeout=10000
mosip.registration.mdm.RCAPTURE.connection.timeout=40000
mosip.registration.mdm.MOSIPDINFO.connection.timeout=5000
mosip.registration.mdm.MOSIPDISC.connection.timeout=5000
```

Quality score threshold based on modality, Possible values 1 to 100

```
mosip.registration.leftslap_fingerprint_threshold=40
mosip.registration.rightslap_fingerprint_threshold=40
mosip.registration.thumbs_fingerprint_threshold=40
mosip.registration.iris_threshold=60
mosip.registration.face_threshold=9
```

Retry attemps, Possible values 1 to 10

```
mosip.fingerprint_authentication.quality_score=30
mosip.iris_authentication.quality_score=30
mosip.face_authentication.quality_score=30
```

Quality score threshold based on modality for operator authentication, Possible values 1 to 100`

```
mosip.fingerprint_authentication.quality_score=30
mosip.iris_authentication.quality_score=30
mosip.face_authentication.quality_score=30 
```
 
#### Batch Size

Jobs like RID sync, packet upload, status sync is carried out in batches, number of registration records to be executed in a batch on every trigger.

```
mosip.registration.rid_sync_batch_size=5
mosip.registration.packet_upload_batch_size=5
mosip.registration.status_sync_batch_size=5 
```

#### Scheduled Jobs

Default CRON expression for scheduling the Jobs.

`mosip.registration.sync_jobs_restart_freq=0 0 */11 ? * *`

#### Other Configurations
 

* Enables / disables reviewer authentication on any biometric exception during registration

  `mosip.registration.reviewer_authentication_configuration=Y`

* If enabled, cross-checks of residents biometrics with locally stored operator biometric templates.

  `mosip.registration.mds.deduplication.enable.flag=N`

* Minimum disk space required to create a packet - in MB

  `mosip.registration.disk_space_size=5`

* Maximum no. of days for approved packet pending to be synced to server beyond which Registration Client is frozen for registration

  `mosip.registration.last_export_registration_config_time=100`

* No. of days beyond audit creation date to delete audits

  `mosip.registration.audit_log_deletion_configured_days=10`

* Maximum duration to which registration is permitted without sync of master data

  `mosip.registration.sync_transaction_no_of_days_limit=5`

* Allowed number of invalid login attempts

  `mosip.registration.invalid_login_count=50`

* Configuration used to check if any sync job is missed/ failed beyond expected days, this configuration is checked everytime operator clicks on any registration process. We follow below convention to create this config key.

  `mosip.registration.job api name as in sync_job_def table.frequency=value in days`

#### Date formats

* Date format to be displayed on acknowledgement slip, default value - dd/MM/yyyy hh:mm a

  `mosip.registration.application_date_format`

* Date format to be displayed on Registration Client dashboard, default format - dd MMM hh:mm a

  `mosip.registration.dashboard_date_format`
