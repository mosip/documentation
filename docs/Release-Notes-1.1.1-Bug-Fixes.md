This document contains the bugs that were fixed as part of MOSIP 1.1.1 release.


JIRA ID | Summary | Module
--------|---------|-------
[MOSIP-9488](https://mosip.atlassian.net/browse/MOSIP-9488) | Able to create a policy without providing policy name | Partner Management
[MOSIP-9481](https://mosip.atlassian.net/browse/MOSIP-9481) | Unable to continue after the document Upload page | Pre-registration
[MOSIP-9449](https://mosip.atlassian.net/browse/MOSIP-9449) | Unable to create secure biometric interface | Partner Management
[MOSIP-9427](https://mosip.atlassian.net/browse/MOSIP-9427) | On sending incorrect value under the timestamp as past date or future getting 500 error | Pre-registration
[MOSIP-9334](https://mosip.atlassian.net/browse/MOSIP-9334) | Transliterate service is throwing error JSON parse error: Unrecognized field \"to_field_value\" | Pre-registration
[MOSIP-9302](https://mosip.atlassian.net/browse/MOSIP-9302) | Getting "No register device found" while trying to de-register , registered Device | Admin
[MOSIP-9257](https://mosip.atlassian.net/browse/MOSIP-9257) | Unable to execute the  De-registration of Devices as getting error as Unrecognized field \"ID\" | Admin
[MOSIP-9256](https://mosip.atlassian.net/browse/MOSIP-9256) | The back button is missing under the view transaction details screen | Admin
[MOSIP-9042](https://mosip.atlassian.net/browse/MOSIP-9042) | The Document does not have all category | Pre-registration
[MOSIP-9032](https://mosip.atlassian.net/browse/MOSIP-9032) | QA ENV - Original name is not displayed in UIN Generation Email Notification. | Registration Processor
[MOSIP-8968](https://mosip.atlassian.net/browse/MOSIP-8968) | ID field from request body to be removed as it duplicate and has no validation | Admin
[MOSIP-8816](https://mosip.atlassian.net/browse/MOSIP-8816) | Unable to update the Dynamic Field  | Admin
[MOSIP-8814](https://mosip.atlassian.net/browse/MOSIP-8814) | Unable to proceed further from demographic page getting error popup | Pre-registration
[MOSIP-8769](https://mosip.atlassian.net/browse/MOSIP-8769) | Unable to scan document using document scanner | Registration Client
[MOSIP-8739](https://mosip.atlassian.net/browse/MOSIP-8739) | The check status for RID gives response as UNDER PROCESSING even the RID is processed | Resident Services
[MOSIP-8697](https://mosip.atlassian.net/browse/MOSIP-8697) | ENVIssue- Packet is not moving post-SECUREZONE_NOTIFICATION stage. | Registration Processor
[MOSIP-8559](https://mosip.atlassian.net/browse/MOSIP-8559) | Admin UI should have routing based on language | Admin
[MOSIP-8546](https://mosip.atlassian.net/browse/MOSIP-8546) | Extint Environment is not up due to Softhsm connection issue. | Kernel
[MOSIP-8543](https://mosip.atlassian.net/browse/MOSIP-8543) | Adding additional attributes throws an error in dynamic field create and update API | Admin
[MOSIP-8464](https://mosip.atlassian.net/browse/MOSIP-8464) | Admin UI keeps on loading and user is not able to login | Admin
[MOSIP-8453](https://mosip.atlassian.net/browse/MOSIP-8453) | Biometric capture doesn't work (nothing happens while clicking on the scan button) | Registration Client
[MOSIP-8449](https://mosip.atlassian.net/browse/MOSIP-8449) | UIN Number  is missing only in Preview Screen. | Registration Client
[MOSIP-8439](https://mosip.atlassian.net/browse/MOSIP-8439) | Biometric auth is not working due to  timestamp field in device validation request. | Authentication
[MOSIP-8424](https://mosip.atlassian.net/browse/MOSIP-8424) | The copyright sign to be removed from pre-reg UI | Pre-registration
[MOSIP-8414](https://mosip.atlassian.net/browse/MOSIP-8414) | Unable to continue to create update UIN packet. | Registration Client
[MOSIP-8413](https://mosip.atlassian.net/browse/MOSIP-8413) | User is able to fetch the detail of discarded Pre-reg ID  | Pre-registration
[MOSIP-8328](https://mosip.atlassian.net/browse/MOSIP-8328) | Packet is getting failed at OSI stage if UMC is true though the packet has device details (DEVICEVALIDATE service ended with error data: request.digitalId.dp: must not be null). | Registration Processor
[MOSIP-8327](https://mosip.atlassian.net/browse/MOSIP-8327) | ENV ISSUE- Error at PRINT_SERVICE stage. | Registration Processor
[MOSIP-8315](https://mosip.atlassian.net/browse/MOSIP-8315) | ENV Issue- Packet is not moving post Biographic Verification Stage (Real ABIS is unable to connect to Active-MQ). | Registration Processor
[MOSIP-8306](https://mosip.atlassian.net/browse/MOSIP-8306) | Admin_GetLeafZones_forNoZoneMap  Error to be corrected under response  | Admin
[MOSIP-8304](https://mosip.atlassian.net/browse/MOSIP-8304) | Env Issue - Packet Upload Sync Failure. | DevOps
[MOSIP-8300](https://mosip.atlassian.net/browse/MOSIP-8300) | On booking appointment for the pending booking for  the application is giving error  | Pre-registration
[MOSIP-8290](https://mosip.atlassian.net/browse/MOSIP-8290) | Exception while capturing biometrics : java.lang.NullPointerException(unable to capture biometric error during onboarding). | Registration Client
[MOSIP-8288](https://mosip.atlassian.net/browse/MOSIP-8288) | Unable to create the packet (Error- Unable to load Registration Preview Screen). | Registration Client
[MOSIP-8287](https://mosip.atlassian.net/browse/MOSIP-8287) | Registration Client is not reading the local dedupe config from the registration config file. | Registration Client
[MOSIP-8277](https://mosip.atlassian.net/browse/MOSIP-8277) | Under booking appointment page only applicant name is appearing to book appointment when add applicant is performed with user | Pre-registration
[MOSIP-8266](https://mosip.atlassian.net/browse/MOSIP-8266) | User is not getting logged out if the consent is not clicked | Pre-registration
[MOSIP-8261](https://mosip.atlassian.net/browse/MOSIP-8261) | Getting Failed to either encrypt/decrypt message using Kernel Crypto Manager while generating UIN under qa.mosip.net proxy environment  | Registration Client
[MOSIP-8182](https://mosip.atlassian.net/browse/MOSIP-8182) | Extint Env Issue- FS Adapter Exception OccurredKER-FSA-001 in the upload stage. | Registration Processor
[MOSIP-8181](https://mosip.atlassian.net/browse/MOSIP-8181) | Reg-Client is getting Crashed | Registration Client
[MOSIP-8177](https://mosip.atlassian.net/browse/MOSIP-8177) | The packet is not moving ahead from status Packet is Uploaded to Landing Zone in Database when update packet  is executed under resident service | Resident Services
[MOSIP-8147](https://mosip.atlassian.net/browse/MOSIP-8147) | Getting blank Demographic page when navigated back  using back button from Preview page | Pre-registration
[MOSIP-8143](https://mosip.atlassian.net/browse/MOSIP-8143) | User gets logged out when consent is not selected and user already have application created  | Pre-registration
[MOSIP-8142](https://mosip.atlassian.net/browse/MOSIP-8142) | Admin_MapDeviceToRegCenter_UnAuthorisedRole invalid errorMessage and errorCode | Admin
[MOSIP-8140](https://mosip.atlassian.net/browse/MOSIP-8140) | Admin_MapZoneUserToRegCenter_UnAuthorisedRole invalid errorMessage and errorCode | Admin
[MOSIP-8138](https://mosip.atlassian.net/browse/MOSIP-8138) | Admin_UnMapZoneUserToRegCenter_UnAuthorisedRole invalid errorMessage and errorcode | Admin
[MOSIP-8137](https://mosip.atlassian.net/browse/MOSIP-8137) | Unable to click on Cancel radio button | Pre-registration
[MOSIP-8136](https://mosip.atlassian.net/browse/MOSIP-8136) | The appointment is getting cancel and discarded even after discarding the action | Pre-registration
[MOSIP-8133](https://mosip.atlassian.net/browse/MOSIP-8133) | Page remains on blank page when no center is attached with the postalcode | Pre-registration
[MOSIP-8132](https://mosip.atlassian.net/browse/MOSIP-8132) | Admin_MapDeviceToRegCenter_UnAuthorisedRole error to be corrected | Admin
[MOSIP-8127](https://mosip.atlassian.net/browse/MOSIP-8127) | The user remains on demographic page on not accepting the consent | Pre-registration
[MOSIP-8126](https://mosip.atlassian.net/browse/MOSIP-8126) | On click of add applicant button user is navigated to your application page | Pre-registration
[MOSIP-8115](https://mosip.atlassian.net/browse/MOSIP-8115) | Single finger scan  login does not work in Registration Client. | Registration Client
[MOSIP-8086](https://mosip.atlassian.net/browse/MOSIP-8086) | Regclient audit does not save in audit db (401 Unauthorized Error in .packet.validator stage logs. | Registration Processor
[MOSIP-8084](https://mosip.atlassian.net/browse/MOSIP-8084) | Invalid Email and invalid Phone validation is not working in Add Identity and Update Identity API | Authentication
[MOSIP-8083](https://mosip.atlassian.net/browse/MOSIP-8083) | The code is amandatory field under Doctype API the error message is coming incorrect | Admin
[MOSIP-8079](https://mosip.atlassian.net/browse/MOSIP-8079) | The user should be able to create the blacklisted word without entering any value in desc | Admin
[MOSIP-8078](https://mosip.atlassian.net/browse/MOSIP-8078) | Error message should be corrected under Blacklisted word desc field having  character more than 256 | Admin
[MOSIP-8077](https://mosip.atlassian.net/browse/MOSIP-8077) | Create RegCenter and Create Machine API is not allowing to create with blank id | Admin
[MOSIP-8073](https://mosip.atlassian.net/browse/MOSIP-8073) | The Kiosk Number is not decreasing while deleting the mapping using the delelet Mapping API from center and machine mapping | Admin
[MOSIP-8070](https://mosip.atlassian.net/browse/MOSIP-8070) | Unable to complete the registration though all the biometrics are scanned. | Registration Client
[MOSIP-8068](https://mosip.atlassian.net/browse/MOSIP-8068) | Error message keeps on swapping when multiple error is found in gender create and update API | Admin
[MOSIP-8062](https://mosip.atlassian.net/browse/MOSIP-8062) | Device Validate and Device Validate History is not working | Admin
[MOSIP-8054](https://mosip.atlassian.net/browse/MOSIP-8054) | Unable to update the blacklisted word from old word to new word | Admin
[MOSIP-8030](https://mosip.atlassian.net/browse/MOSIP-8030) | RC2 Registration Client is not detecting the devices, says device is not available (No device is running at port number 0). | Registration Client
[MOSIP-8027](https://mosip.atlassian.net/browse/MOSIP-8027) | DEVICEVALIDATE is returning an error that is not handled properly in REG PROC. | Registration Processor
[MOSIP-8002](https://mosip.atlassian.net/browse/MOSIP-8002) | Brokenlinks found under Git documentation | Documentation
[MOSIP-8000](https://mosip.atlassian.net/browse/MOSIP-8000) | PreReg shows incorrect time of booking in SMS and Email  | Pre-registration
[MOSIP-7993](https://mosip.atlassian.net/browse/MOSIP-7993) | Arabic data displayed as junk characters in ekyc response | Authentication
[MOSIP-7970](https://mosip.atlassian.net/browse/MOSIP-7970) | Able to authenticate with devices registered for 'REGISTRATION' | Authentication
[MOSIP-7960](https://mosip.atlassian.net/browse/MOSIP-7960) | Able to authenticate with a revoked VID | Authentication
[MOSIP-7949](https://mosip.atlassian.net/browse/MOSIP-7949) | Biometric capture - Vendor Issues --- BLOCKING COUNTRY PILOTS  | Registration Client
[MOSIP-7947](https://mosip.atlassian.net/browse/MOSIP-7947) | Update Packet- Status_code is Failed for UIN generation transaction. | Registration Processor
[MOSIP-7946](https://mosip.atlassian.net/browse/MOSIP-7946) | UIN is missing in all the place like Registration Preview , Ack and Pending Approval etc. | Registration Client
[MOSIP-7942](https://mosip.atlassian.net/browse/MOSIP-7942) | Device details not validated against the biotype/type | Authentication
[MOSIP-7908](https://mosip.atlassian.net/browse/MOSIP-7908) | The user  is moving to your application after discarding the action to navigate to other screen | Pre-registration
[MOSIP-7905](https://mosip.atlassian.net/browse/MOSIP-7905) | Device serial number is NULL in packet_meta_info.json. | Registration Client
"[MOSIP-7898](https://mosip.atlassian.net/browse/MOSIP-7898) | Packet Sync request  decryption is failed
 | Kernel"
[MOSIP-7856](https://mosip.atlassian.net/browse/MOSIP-7856) | Exception proof is taking Exception photo as a document | Registration Client
[MOSIP-7845](https://mosip.atlassian.net/browse/MOSIP-7845) | Real Biometric login (login auth, packet_auth, eod_auth, exception_auth etc) does not work in registration client | Registration Client
[MOSIP-7843](https://mosip.atlassian.net/browse/MOSIP-7843) | Registration Client is not performing device validation | Registration Client
[MOSIP-7842](https://mosip.atlassian.net/browse/MOSIP-7842) | Registration Client is not sending device details in the Packet | Registration Client
[MOSIP-7838](https://mosip.atlassian.net/browse/MOSIP-7838) | The UI under Tiles are disturb when Name is too long | Pre-registration
[MOSIP-7816](https://mosip.atlassian.net/browse/MOSIP-7816) | The message is shown in fra or ara when the user try to access the pre-reg and  services are restarted  | Pre-registration
[MOSIP-7815](https://mosip.atlassian.net/browse/MOSIP-7815) | Not getting proper response in BIO Auth with UIN which don't have BIO data in DB | Authentication
[MOSIP-7814](https://mosip.atlassian.net/browse/MOSIP-7814) | Multiple issues in the contents displayed in the registration  acknowledgement preview page | Registration Client
[MOSIP-7806](https://mosip.atlassian.net/browse/MOSIP-7806) | Incorrect error message in response when value of  "deviceServiceVersion" is sent as string | Admin
[MOSIP-7732](https://mosip.atlassian.net/browse/MOSIP-7732) | Update FTP api is not working | Admin
[MOSIP-7719](https://mosip.atlassian.net/browse/MOSIP-7719) | DOB field is taking string in reg client. | Registration Client
[MOSIP-7704](https://mosip.atlassian.net/browse/MOSIP-7704) | On the pre-reg UI, a page reload results in session time-out resulting in loss of time and data upload | Pre-registration
[MOSIP-7702](https://mosip.atlassian.net/browse/MOSIP-7702) | Update  Individual Type API issue | Admin
[MOSIP-7701](https://mosip.atlassian.net/browse/MOSIP-7701) | Device Specification API issue under create and update api | Admin
[MOSIP-7693](https://mosip.atlassian.net/browse/MOSIP-7693) | Device Type API issue  under create and update api | Admin
[MOSIP-7692](https://mosip.atlassian.net/browse/MOSIP-7692) | create a Individual Type API issue | Admin
[MOSIP-7691](https://mosip.atlassian.net/browse/MOSIP-7691) | Machine Specification API issue under create and update api | Admin
[MOSIP-7690](https://mosip.atlassian.net/browse/MOSIP-7690) |  Machine Type API issue under create and update api | Admin
[MOSIP-7689](https://mosip.atlassian.net/browse/MOSIP-7689) | Regcenter Type API issue under create and update api | Admin
[MOSIP-7688](https://mosip.atlassian.net/browse/MOSIP-7688) | Template API issue under create and update api | Admin
[MOSIP-7406](https://mosip.atlassian.net/browse/MOSIP-7406) | Kernel UIN generation API fails due to UNUSED UINs count reaching zero in kernel uin table | Kernel
[MOSIP-7352](https://mosip.atlassian.net/browse/MOSIP-7352) | Getting technical error while loading the document | Pre-registration
[MOSIP-7345](https://mosip.atlassian.net/browse/MOSIP-7345) | Create and Update Location API need to handle scenarios based on new location table change | Admin
[MOSIP-7188](https://mosip.atlassian.net/browse/MOSIP-7188) | Inconsistent Error thrown in Admin UI  | Admin
[MOSIP-7186](https://mosip.atlassian.net/browse/MOSIP-7186) | Update Title Api issue | Admin
[MOSIP-7183](https://mosip.atlassian.net/browse/MOSIP-7183) | Create Title Api issue | Admin
[MOSIP-7179](https://mosip.atlassian.net/browse/MOSIP-7179) | No option to add the age under demographic details | Pre-registration
[MOSIP-7027](https://mosip.atlassian.net/browse/MOSIP-7027) | Search Location API is not working for all the values present in hierarchy level name | Admin
[MOSIP-7026](https://mosip.atlassian.net/browse/MOSIP-7026) | Machine Filter API is giving machines belong to outside the admin's zone | Admin
[MOSIP-7024](https://mosip.atlassian.net/browse/MOSIP-7024) | Update Document Category API Issue | Admin
[MOSIP-7022](https://mosip.atlassian.net/browse/MOSIP-7022) | Document category is active when created in one language | Admin
[MOSIP-7015](https://mosip.atlassian.net/browse/MOSIP-7015) | Create Document Category API Issue | Admin
[MOSIP-6999](https://mosip.atlassian.net/browse/MOSIP-6999) | Update Gender API issue | Admin
[MOSIP-6992](https://mosip.atlassian.net/browse/MOSIP-6992) | Create Gender API Issue | Admin
[MOSIP-3623](https://mosip.atlassian.net/browse/MOSIP-3623) | Issue while Mapping Machine with reg- center | Admin
[MOSIP-1203](https://mosip.atlassian.net/browse/MOSIP-1203) | Register Device Api is not working as expected | Admin
[MOSIP-1192](https://mosip.atlassian.net/browse/MOSIP-1192) | No entries found for Master API's Under audit log table | Admin
[MOSIP-1186](https://mosip.atlassian.net/browse/MOSIP-1186) | Error under multi-language validations on the API's listed  | Admin
[MOSIP-1156](https://mosip.atlassian.net/browse/MOSIP-1156) | Issue under create individual type | Admin
[MOSIP-1152](https://mosip.atlassian.net/browse/MOSIP-1152) | Create Holiday APi Issue | Admin
[MOSIP-1150](https://mosip.atlassian.net/browse/MOSIP-1150) | Update Holiday Api  issues | Admin
[MOSIP-1148](https://mosip.atlassian.net/browse/MOSIP-1148) | AuditDetails()::error in packet validator stage logs. | Registration Processor
[MOSIP-1137](https://mosip.atlassian.net/browse/MOSIP-1137) | Filter Machine and and Filter Machine Spec API is not accepting few column in INT env | Admin
[MOSIP-1025](https://mosip.atlassian.net/browse/MOSIP-1025) | After deleting the mapping for document the status for is_active field is still true | Admin
[MOSIP-977](https://mosip.atlassian.net/browse/MOSIP-977) | Unable to create the registration center as throwing "ERROR: duplicate key value violates unique constraint \" | Admin
[MOSIP-898](https://mosip.atlassian.net/browse/MOSIP-898) | Generate VID : Discrepancy found between error codes received while running APIs and git document  | Documentation
[MOSIP-816](https://mosip.atlassian.net/browse/MOSIP-816) | Discrepancy found between git document and swagger for Zone APIs | Admin
[MOSIP-802](https://mosip.atlassian.net/browse/MOSIP-802) | Getting invalid as code in response for the valid blacklisted word | Admin
[MOSIP-800](https://mosip.atlassian.net/browse/MOSIP-800) | Behavior of Create and Update API in Blacklisted word is inconsistance | Admin
[MOSIP-683](https://mosip.atlassian.net/browse/MOSIP-683) | Reg client gets closed abruptly when login mode is set to IRIS | Registration Client
[MOSIP-599](https://mosip.atlassian.net/browse/MOSIP-599) | Unable to filter the center when all the combination is applied  | Admin
[MOSIP-596](https://mosip.atlassian.net/browse/MOSIP-596) | Getting Whitelabel Error Page after the Admin Screen is kept idle  | Admin
[MOSIP-531](https://mosip.atlassian.net/browse/MOSIP-531) | User is navigated to blank page for center with no slots and date available for center selected | Pre-registration
[MOSIP-490](https://mosip.atlassian.net/browse/MOSIP-490) | Update Registration Center API is not working | Admin
[MOSIP-485](https://mosip.atlassian.net/browse/MOSIP-485) | Throws exception when kernel-salt-generator fails  | Authentication
[MOSIP-424](https://mosip.atlassian.net/browse/MOSIP-424) | Device History Validate api is allowing to validate a device history with inactive device and MDS | Admin
[MOS-31336](https://mosip.atlassian.net/browse/MOS-31336) | Template File Format API issue under create and update api | Admin
[MOS-31328](https://mosip.atlassian.net/browse/MOS-31328) | Fix issue in Auth Transaction and Auth Type Status services - returning empty results | Authentication
[MOS-31310](https://mosip.atlassian.net/browse/MOS-31310) | Unable to Update the inactive document category | Admin
[MOS-31264](https://mosip.atlassian.net/browse/MOS-31264) | Fingerprint auth is not working with real biometrics | Registration Client
[MOS-31208](https://mosip.atlassian.net/browse/MOS-31208) | submit demographic service is not working for preregistration module in preprod environment | Pre-registration
[MOS-28633](https://mosip.atlassian.net/browse/MOS-28633) | Admin API: Location filter/search is not working | Admin
[MOS-27791](https://mosip.atlassian.net/browse/MOS-27791) | KeyCloak details need to be documented in the kernel property file for deployment  | DevOps
