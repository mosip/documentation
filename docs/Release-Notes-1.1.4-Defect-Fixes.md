This document contains the bugs that were fixed as part of MOSIP 1.1.4 release.

Bug ID | Summary | Module
-------|---------|-------
[MOSIP-10594](https://mosip.atlassian.net/browse/MOSIP-10594) | On entering uploading the .csv which is already uploaded user is getting error as "plz enter valid input' | Admin Services
[MOSIP-10588](https://mosip.atlassian.net/browse/MOSIP-10588) | The page is not getting refreshed when the non existing RID is entered | Admin Services
[MOSIP-10561](https://mosip.atlassian.net/browse/MOSIP-10561) | Role to be defined for accessing KeyManager | Admin Services
[MOSIP-10509](https://mosip.atlassian.net/browse/MOSIP-10509) | The API response for packet upload should not contain table name as packet | Admin Services
[MOSIP-10489](https://mosip.atlassian.net/browse/MOSIP-10489) | The menu should collapse and expand  | Admin Services
[MOSIP-10483](https://mosip.atlassian.net/browse/MOSIP-10483) | The user is not navigated to list view page | Admin Services
[MOSIP-10469](https://mosip.atlassian.net/browse/MOSIP-10469) | Unable to create machine from Admin console  | Admin Services
[MOSIP-10397](https://mosip.atlassian.net/browse/MOSIP-10397) | API for Machine Master Create/Update doesn't handle the TPM Key updates. | Admin Services
[MOSIP-10386](https://mosip.atlassian.net/browse/MOSIP-10386) | The  centerType should not be removed from the already created center if it deactivated  | Admin Services
[MOSIP-10294](https://mosip.atlassian.net/browse/MOSIP-10294) | Unable to Activate or Deactivate the Holiday Master Data | Admin Services
[MOSIP-9425](https://mosip.atlassian.net/browse/MOSIP-9425) | On removal of one first date  from the  Exceptional Holiday another gets removed  in both Create and Update Center UI | Admin Services
[MOSIP-9994](https://mosip.atlassian.net/browse/MOSIP-9994) | MockSDK logs are not getting generated. | Mocks
[MOSIP-11116](https://mosip.atlassian.net/browse/MOSIP-11116) | Getting error as Partner-ID does not match Partner-ID of OTP Request | IDA / ID Repository
[MOSIP-11013](https://mosip.atlassian.net/browse/MOSIP-11013) | Unable to do kyc with VID | IDA / ID Repository
[MOSIP-10732](https://mosip.atlassian.net/browse/MOSIP-10732) | Able to insert values as string in id repository when they are defined as simpleType in the ID schema | IDA / ID Repository
[MOSIP-10601](https://mosip.atlassian.net/browse/MOSIP-10601) | Demo Auth UI needs to be fixed for 1.1.3 | IDA / ID Repository
[MOSIP-10518](https://mosip.atlassian.net/browse/MOSIP-10518) | Auth history does not list the biometric authentications done | IDA / ID Repository
[MOSIP-10408](https://mosip.atlassian.net/browse/MOSIP-10408) | Able to do OTP authentication with a different partner | IDA / ID Repository
[MOSIP-10396](https://mosip.atlassian.net/browse/MOSIP-10396) | Additional fields are returned in eKYC response | IDA / ID Repository
[MOSIP-10035](https://mosip.atlassian.net/browse/MOSIP-10035) | Partner Id and policy id not to be mapped in properties file | IDA / ID Repository
[MOSIP-10659](https://mosip.atlassian.net/browse/MOSIP-10659) | while defining the policy policy id should take from input | Partner Management
[MOSIP-10252](https://mosip.atlassian.net/browse/MOSIP-10252) | Change in policy/partner is not notified to IDA | Partner Management
[MOSIP-11302](https://mosip.atlassian.net/browse/MOSIP-11302) | Unable to login in Pre-registration under 1.1.4  as getting error while sending OTP | Pre-registration
[MOSIP-10834](https://mosip.atlassian.net/browse/MOSIP-10834) | The pre-registration.identity.name property should be present under UI PARAM | Pre-registration
[MOSIP-10833](https://mosip.atlassian.net/browse/MOSIP-10833) | When the resident status is not filled the document page gives Technical error occured | Pre-registration
[MOSIP-10492](https://mosip.atlassian.net/browse/MOSIP-10492) | The Age field is populated as NaN | Pre-registration
[MOSIP-9852](https://mosip.atlassian.net/browse/MOSIP-9852) | No email is received after booking appointment | Pre-registration
[MOSIP-11019](https://mosip.atlassian.net/browse/MOSIP-11019) | Registration acknowledgment slip prints on 2 pages in Guinea | Registration Client
[MOSIP-10895](https://mosip.atlassian.net/browse/MOSIP-10895) | Reg Client gets slow for more than 20 seconds after clicking on Center remap sync  | Registration Client
[MOSIP-10894](https://mosip.atlassian.net/browse/MOSIP-10894) | Exceptions are not shown in the Registration Preview Screen (Template) | Registration Client
[MOSIP-10890](https://mosip.atlassian.net/browse/MOSIP-10890) | Able to complete registration without scanning a document, when document is modified from preview screen. | Registration Client
[MOSIP-10881](https://mosip.atlassian.net/browse/MOSIP-10881) | The issue with child update packet creation when dob and guardians are selected for update. | Registration Client
[MOSIP-10718](https://mosip.atlassian.net/browse/MOSIP-10718) | Incorrect error message while on-boarding for "expired token" | Registration Client
[MOSIP-10716](https://mosip.atlassian.net/browse/MOSIP-10716) | UIN Update process should not make the DOB as mandatory field | Registration Client
[MOSIP-10705](https://mosip.atlassian.net/browse/MOSIP-10705) | Registration Client gets hanged on Supervisor Approval Screen For Exception Packet.  | Registration Client
[MOSIP-10673](https://mosip.atlassian.net/browse/MOSIP-10673) | Packet auth /EOD auth is failed when login is set to bio and other auth are set to Password. | Registration Client
[MOSIP-10605](https://mosip.atlassian.net/browse/MOSIP-10605) | DoB is not handled like the age for displaying Parent/Guardian details in an adult packet. | Registration Client
[MOSIP-10568](https://mosip.atlassian.net/browse/MOSIP-10568) | Registration client Preview and acknowledgeable pages have issues due to templates | Registration Client
[MOSIP-10480](https://mosip.atlassian.net/browse/MOSIP-10480) | The DOB validations are not happening correctly. | Registration Client
[MOSIP-9783](https://mosip.atlassian.net/browse/MOSIP-9783) | Sometimes images are displayed in inappropriate areas leading to restart of the registration client | Registration Client
[MOSIP-9660](https://mosip.atlassian.net/browse/MOSIP-9660) | 1.1.2 restrict the click anywhere in the application if the file explorer is open from the client app. | Registration Client
[MOSIP-7741](https://mosip.atlassian.net/browse/MOSIP-7741) | Supervisor approval is not asked for bio exception packets though mosip.registration.supervisor_authentication_configuration=Y | Registration Client
[MOSIP-11119](https://mosip.atlassian.net/browse/MOSIP-11119) | Packets are getting stuck in the biographic verification stage | Registration Processor
[MOSIP-10923](https://mosip.atlassian.net/browse/MOSIP-10923) | With no scanned document - packet is getting processed successfully while it should not | Registration Processor
[MOSIP-10851](https://mosip.atlassian.net/browse/MOSIP-10851) | Reg-Proc sending email notification using SMS template and vice~versa | Registration Processor
[MOSIP-10849](https://mosip.atlassian.net/browse/MOSIP-10849) | Notification not working when a packet is reprocessed. | Registration Processor
[MOSIP-10726](https://mosip.atlassian.net/browse/MOSIP-10726) | Audit Logs are missing the "UUID" data entry | Registration Processor
[MOSIP-10717](https://mosip.atlassian.net/browse/MOSIP-10717) | LOST UIN not working | Registration Processor
[MOSIP-10688](https://mosip.atlassian.net/browse/MOSIP-10688) | Packet re-processing did not work if abis insertion fails. | Registration Processor
[MOSIP-10662](https://mosip.atlassian.net/browse/MOSIP-10662) | Mock ABIS- Error in abis middleware logs ( null - java.lang.ClassCastException: class org.apache.activemq.command.ActiveMQMessage cannot be cast to class javax.jms.TextMessage) | Registration Processor
[MOSIP-10590](https://mosip.atlassian.net/browse/MOSIP-10590) | Double entries happening for Registration track in Audit log with different log-ID | Registration Processor
[MOSIP-9821](https://mosip.atlassian.net/browse/MOSIP-9821) | Lost UIN packets are failing in biographic verification stage. | Registration Processor
[MOSIP-10573](https://mosip.atlassian.net/browse/MOSIP-10573) | Unable to download/PRINT the eUIN after the Post credential Issuance  | Resident Services
[MOSIP-10511](https://mosip.atlassian.net/browse/MOSIP-10511) | Id repo  retrieveIdentity get Api is not giving response with type demo,all,bio for old uins | IDA / ID Repository
