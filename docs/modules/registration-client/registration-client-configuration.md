# Registration Client Configuration

## Overview

The guide here lists down some of the important properties that may be customised for a given installation. Note that the listing here is not exhaustive, but a checklist to review properties that are likely to be different from default. If you would like to see all the properites, then refer to the files listed below.

**IMPORTANT : From the LTS version, All the properties are synced to the registration-client only from `registration-default.properties` file.**

## Configuration files

```
application-default.properties
registration-default.properties
```

See [Module Configuration](https://docs.mosip.io/1.2.0/modules/module-configuration) for location of these files.

## SBI related configurations

Registration Client reaches SBI on 127.0.0.1 within the below configured port range. As per SBI spec, allowed port range is from 4501 to 4600.

```
mosip.registration.mdm.portRangeFrom=4501
mosip.registration.mdm.portRangeTo=4600
```

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
mosip.registration.num_of_fingerprint_retries=3
mosip.registration.num_of_iris_retries=3
mosip.registration.num_of_face_retries=3
```

Quality score threshold based on modality for operator authentication, Possible values 1 to 100

```
mosip.fingerprint_authentication.quality_score=30
mosip.iris_authentication.quality_score=30
mosip.face_authentication.quality_score=30
```

## SDK

Registration client can be integrated with more than one bio-sdks. Possible values for "modality-name" are "finger", "iris" or "face".

* SDK implementation class full name

`mosip.biometric.sdk.providers.<modality-name>.<vendor-name>.classname`

* SDK API version

`mosip.biometric.sdk.providers.<modality-name>.<vendor-name>.version`

* SDK implementation class consturctor args - comma separated

`mosip.biometric.sdk.providers.<modality-name>.<vendor-name>.args`

* SDK initialization args, this will be passed as initparams

`mosip.biometric.sdk.provider.<modality-name>.<vendor-name>.<key1>=<value1>`

* Quality threshold used by SDK to match modality

`mosip.biometric.sdk.providers.<modality-name>.<vendor-name>.threshold`

Example configurations shown below for MOCK SDK named as mockvendor:

```
mosip.biometric.sdk.providers.finger.mockvendor.classname=io.mosip.mock.sdk.impl.SampleSDK
mosip.biometric.sdk.providers.finger.mockvendor.version=0.9
mosip.biometric.sdk.providers.finger.mockvendor.args=
mosip.biometric.sdk.providers.finger.mockvendor.threshold=60
mosip.biometric.sdk.providers.iris.mockvendor.classname=io.mosip.mock.sdk.impl.SampleSDK
mosip.biometric.sdk.providers.iris.mockvendor.version=0.9
mosip.biometric.sdk.providers.iris.mockvendor.args=
mosip.biometric.sdk.providers.iris.mockvendor.threshold=60
mosip.biometric.sdk.providers.face.mockvendor.classname=io.mosip.mock.sdk.impl.SampleSDK
mosip.biometric.sdk.providers.face.mockvendor.version=0.9
mosip.biometric.sdk.providers.face.mockvendor.args=
mosip.biometric.sdk.providers.face.mockvendor.threshold=60
```

On every successful biometric capture during registration, Quality of the biometrics is computed by bio-sdk if below config is enabled. Possible values are Y/N.

`mosip.registration.quality_check_with_sdk=Y`

## Batch size

Jobs like RID sync, packet upload, status sync is carried out in batches, number of registration records to be executed in a batch on every trigger.

```
mosip.registration.rid_sync_batch_size=5
mosip.registration.packet_upload_batch_size=5
mosip.registration.status_sync_batch_size=5
```

## Operator onboarding bio-attributes

Only the modalities configured will be collected during operator onboarding.

```
mosip.registration.operator.onboarding.bioattributes=leftLittle,leftRing,leftMiddle,leftIndex,leftThumb,rightLittle,rightRing,rightMiddle,rightIndex,rightThumb,leftEye,rightEye,face
```

## Pre-Registration sync

On every Pre-Registration application fetch in registration page, clears all the captured data prior to Pre-Registration application fetch. Set the field id's which should not be cleared after Pre-Registration application fetch. It is comma separated list of field ids as per UI-SPEC.

```
mosip.registration.fields.to.retain.post.prid.fetch=consent,consentText,preferredLang
```

Storage Location to store the downloaded Pre-Registration Packets in local system

```
mosip.registration.registration_pre_reg_packet_location=PreRegPacketStore
```

Pre-registration applications fetch time span, No. of days before appointment date.

```
mosip.registration.pre_reg_no_of_days_limit=7
```

## Scheduled Jobs

Comma separated list of offline job ids. Offline jobs are the jobs which are not part of manual sync.

```
mosip.registration.jobs.offline=DEL_J00013,RDJ_J00010,ADJ_J00012,PVS_J00015
```

Comma separated list of untagged job ids. Untagged jobs, which will be not part of manual sync but only from scheduler.

```
mosip.registration.jobs.unTagged=PDS_J00003
```

Comma separated list of job ids which needs Registration Client restart.

```
mosip.registration.jobs.restart=RCS_J00005
```

Registration batch jobs scheduler.

```
mosip.registration.jobs.scheduler.enable=Y
```

Default CRON expression for scheduling the Jobs.

```
mosip.registration.sync_jobs_restart_freq=0 0 */11 ? * *
```

## Document scan

All the identified scanner implementations will be used to list the identified devices. For each device dpi, width and height can be configured. If it is not configured, it defaults to 0.

Values in the this config `mosip.registration.docscanner.id` map supports regex.

```
mosip.registration.docscanner.id={ "id1" : "STUB-SCANNER", "id2" : "S600" }
mosip.registration.docscanner.dpi={ "id1" : 200, "id2" : 300 }
mosip.registration.docscanner.width={ "id1" : 200, "id2" : 350 }
mosip.registration.docscanner.height={ "id1" : 200, "id2" : 400 }
```

## GPS Device Connection

* Enable GPS device for capturing the geo-location. If y, GPS device will be enabled. If n, GPS device will be disabled.

`mosip.registration.gps_device_enable_flag=N`

* Model of the GPS Device

`mosip.registration.gps_device_model=GPSBU343Connector`

* Timeout for connecting to GPS device

`mosip.registration.gps_port_timeout=1000`

* GPS Serial Port in Linux machine

`mosip.registration.gps_serial_port_linux=/dev/ttyusb0`

* GPS Serial Port in Windows machine

`mosip.registration.gps_serial_port_windows=`

* The Distance Parameter for GPS Verification

`mosip.registration.distance.from.machine.to.center=900000`

## Other configurations

To Reset Password in Registration Client

On clicking _Reset password_ from the Actions menu present in the top right corner of Home page, it redirects the operator to the URL below which is configurable.

```
mosip.registration.reset_password_url=${mosip.api.internal.url}/keycloak/auth/realms/mosip/account/
Note: The place holder “mosip.api.internal.url” should be defined in application-default.properties.
```

Enables / disables reviewer authentication on any biometric exception during registration

```
mosip.registration.reviewer_authentication_configuration=Y
```

If enabled cross-checks of residents biometrics with locally stored operator biometric templates.

```
mosip.registration.mds.deduplication.enable.flag=N
```

Minimum disk space required to create a packet - in MB

```
mosip.registration.disk_space_size=5
```

Registration packet store location

```
  object.store.base.location=packets
```

Number of days allowed to start Registration Client without upgrade when software upgrade is available.

`mosip.registration.softwareUpdateCheck_configured_frequency=60`

Time in Seconds for forced log-out of operator, if operator is idle for the specified duration

`mosip.registration.idle_time=900`

Time in Seconds to diplay the warning message pop-up to operator, if operator is idle for the specified duration

`mosip.registration.refreshed_login_time=600`

Maximum no. of days for approved packet pending to be synced to server beyond which Registration Client is frozen for registration

`mosip.registration.last_export_registration_config_time=100`

Maximum no. of packets pending EOD approval beyond which Registration Client is frozen for registration

`mosip.registration.reg_pak_max_cnt_apprv_limit=100`

Enable supervisor authentication feature. If y, supervisor approval will be enabled, else, will be disbaled

`mosip.registration.supervisor_approval_config_flag=Y`

No. of days beyond audit creation date to delete audits

`mosip.registration.audit_log_deletion_configured_days=10`

No. of days beyond registration date to delete synced and uploaded registration packet

`mosip.registration.reg_deletion_configured_days=1`

No. of days beyond appointment date to delete unconsumed pre-registration application data

`mosip.registration.pre_reg_deletion_configured_days=1`

Maximum duration to which registration is permitted without sync of master data

`mosip.registration.sync_transaction_no_of_days_limit=5`

Allowed number of invalid login attempts

`mosip.registration.invalid_login_count=50`

Used to configure the time (in minutes) for locking account after crossing configured invalid login count

`mosip.registration.invalid_login_time=2`

Configuration used to check if any sync job is missed / failed beyond expected days, this configuration is checked everytime operator clicks on any registration process. We follow below convention to create this config key.

`mosip.registration.job api name as in sync_job_def table.frequency=value in days`

\#Maximum no. of days without running the Master Sync Job beyond which Registration Client is frozen for registration

`mosip.registration.masterSyncJob.frequency=190`

\#Maximum no. of days without running the Pre-Registration Sync Job beyond which Registration Client is frozen for registration

`mosip.registration.preRegistrationDataSyncJob.frequency=190`

\#Maximum no. of days without running the Packet Sync Status Job beyond which Registration Client is frozen for registration

`mosip.registration.packetSyncStatusJob.frequency=190`

\#Maximum no. of days without running the Key Policy Sync Job beyond which Registration Client is frozen for registration

`mosip.registration.keyPolicySyncJob.frequency=190`

\#Maximum no. of days without running the Registration Deletion Job beyond which Registration Client is frozen for registration

`mosip.registration.registrationDeletionJob.frequency=190`

\#Maximum no. of days without running the Configuration Sync Job beyond which Registration Client is frozen for registration

`mosip.registration.synchConfigDataJob.frequency=190`

\#Maximum no. of days without running the Audit Logs Deletion Job beyond which Registration Client is frozen for registration

`mosip.registration.deleteAuditLogsJob.frequency=190`

## Date formats

Date format to be displayed on acknowledgement slip, default value - dd/MM/yyyy hh:mm a

```
  mosip.registration.application_date_format
```

Date format to be displayed on Registration Client dashboard, default format - dd MMM hh:mm a

```
 mosip.registration.dashboard_date_format
```
