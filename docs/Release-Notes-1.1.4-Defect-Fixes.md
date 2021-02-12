This document contains the bugs that were fixed as part of MOSIP 1.1.4 release.

Bug ID | Summary | Module
-------|---------|-------
[MOSIP-10594](https://mosip.atlassian.net/browse/MOSIP-10594) | On entering uploading the .csv which is already uploaded user is getting error as "plz enter valid input' | Admin Services
[MOSIP-10588](https://mosip.atlassian.net/browse/MOSIP-10588) | The page is not getting refreshed when the non existing RID is entered | Admin Services
[MOSIP-10509](https://mosip.atlassian.net/browse/MOSIP-10509) | The API response for packet upload should not contain table name as packet | Admin Services
[MOSIP-10489](https://mosip.atlassian.net/browse/MOSIP-10489) | The menu should collapse and expand  | Admin Services
[MOSIP-10483](https://mosip.atlassian.net/browse/MOSIP-10483) | The user is not navigated to list view page | Admin Services
[MOSIP-10469](https://mosip.atlassian.net/browse/MOSIP-10469) | Unable to create machine from Admin console  | Admin Services
[MOSIP-10397](https://mosip.atlassian.net/browse/MOSIP-10397) | API for Machine Master Create/Update doesn't handle the TPM Key updates. | Admin Services
[MOSIP-10386](https://mosip.atlassian.net/browse/MOSIP-10386) | The  centerType should not be removed from the already created center if it deactivated  | Admin Services
[MOSIP-10294](https://mosip.atlassian.net/browse/MOSIP-10294) | Unable to Activate or Deactivate the Holiday Master Data | Admin Services
[MOSIP-9425](https://mosip.atlassian.net/browse/MOSIP-9425) | On removal of one first date  from the  Exceptional Holiday another gets removed  in both Create and Update Center UI | Admin Services
[MOSIP-11116](https://mosip.atlassian.net/browse/MOSIP-11116) | Getting error as Partner-ID does not match Partner-ID of OTP Request | IDA / ID Repository
[MOSIP-11013](https://mosip.atlassian.net/browse/MOSIP-11013) | Unable to do kyc with VID | IDA / ID Repository
[MOSIP-10732](https://mosip.atlassian.net/browse/MOSIP-10732) | Able to insert values as string in id repository when they are defined as simpleType in the ID schema | IDA / ID Repository
[MOSIP-10518](https://mosip.atlassian.net/browse/MOSIP-10518) | Auth history does not list the biometric authentications done | IDA / ID Repository
[MOSIP-10396](https://mosip.atlassian.net/browse/MOSIP-10396) | Additional fields are returned in eKYC response | IDA / ID Repository
[MOSIP-10035](https://mosip.atlassian.net/browse/MOSIP-10035) | Partner Id and policy id not to be mapped in properties file | IDA / ID Repository
[MOSIP-10252](https://mosip.atlassian.net/browse/MOSIP-10252) | Change in policy/partner is not notified to IDA | Partner Management
[MOSIP-10834](https://mosip.atlassian.net/browse/MOSIP-10834) | The pre-registration.identity.name property should be present under UI PARAM | Pre-registration
[MOSIP-10492](https://mosip.atlassian.net/browse/MOSIP-10492) | The Age field is populated as NaN | Pre-registration
[MOSIP-10895](https://mosip.atlassian.net/browse/MOSIP-10895) | Reg Client gets slow for more than 20 seconds after clicking on Center remap sync  | Registration Client
[MOSIP-10894](https://mosip.atlassian.net/browse/MOSIP-10894) | Exceptions are not shown in the Registration Preview Screen (Template) | Registration Client
[MOSIP-10716](https://mosip.atlassian.net/browse/MOSIP-10716) | UIN Update process should not make the DOB as mandatory field | Registration Client
[MOSIP-10673](https://mosip.atlassian.net/browse/MOSIP-10673) | Packet auth /EOD auth is failed when login is set to bio and other auth are set to Password. | Registration Client
[MOSIP-10849](https://mosip.atlassian.net/browse/MOSIP-10849) | Notification not working when a packet is reprocessed. | Registration Processor
[MOSIP-10726](https://mosip.atlassian.net/browse/MOSIP-10726) | Audit Logs are missing the "UUID" data entry | Registration Processor
[MOSIP-10688](https://mosip.atlassian.net/browse/MOSIP-10688) | Packet re-processing did not work if abis insertion fails. | Registration Processor
[MOSIP-10590](https://mosip.atlassian.net/browse/MOSIP-10590) | Double entries happening for Registration track in Audit log with different log-ID | Registration Processor
