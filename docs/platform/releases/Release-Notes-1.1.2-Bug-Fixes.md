This document contains the bugs that were fixed as part of MOSIP 1.1.2 release.

JIRA ID | Summary | Module
--------|---------|-------
[MOSIP-9830](https://mosip.atlassian.net/browse/MOSIP-9830) | Getting full name is displayed in dollar as $fullName_eng, under email received | Resident Services
[MOSIP-9829](https://mosip.atlassian.net/browse/MOSIP-9829) | 1.1.2 - Packet is failing at BIOGRAPHIC_VERIFICATION stage stating that Unknown exception occured null. | Registration Processor
[MOSIP-9828](https://mosip.atlassian.net/browse/MOSIP-9828) | 1.1.2 Build- Lost UIN Packet is getting failed at UIN G stage | Registration Processor
[MOSIP-9827](https://mosip.atlassian.net/browse/MOSIP-9827) | Able to authenticate after locking VID | Authentication/ID Repository
[MOSIP-9826](https://mosip.atlassian.net/browse/MOSIP-9826) | 1.1.2- Unable to fetch PRID in reg client (REG - PCC-ZCM-001 --> JSONObject["bloodType"] not a string) | Pre-registration
[MOSIP-9825](https://mosip.atlassian.net/browse/MOSIP-9825) | Getting Technical error under your application page | Pre-registration
[MOSIP-9823](https://mosip.atlassian.net/browse/MOSIP-9823) | IDA template issues | Authentication/ID Repository
[MOSIP-9795](https://mosip.atlassian.net/browse/MOSIP-9795) | 1.1.2 -Unable to Create New/Update Packet when Document Scanner is Enabled. | Registration Processor
[MOSIP-9789](https://mosip.atlassian.net/browse/MOSIP-9789) | Search APi for Machinetype does not support name field | Admin Services
[MOSIP-9776](https://mosip.atlassian.net/browse/MOSIP-9776) | While doing print UIN we are getting exception error under DB | Resident Services
[MOSIP-9775](https://mosip.atlassian.net/browse/MOSIP-9775) | Unable to get the packet status | Admin Services
[MOSIP-9765](https://mosip.atlassian.net/browse/MOSIP-9765) | Get RID by Userid and appid api is not working | Authentication/ID Repository
[MOSIP-9764](https://mosip.atlassian.net/browse/MOSIP-9764) | 1.1.2: Packet is failing in ID Repo for postal code though postal code not mandatory (the null values are converted as string). | Registration Processor
[MOSIP-9762](https://mosip.atlassian.net/browse/MOSIP-9762) | Unable to proceed after preview page as getting blank page | Pre-registration
[MOSIP-9761](https://mosip.atlassian.net/browse/MOSIP-9761) | 1.1.2 Child packet with parent RID is failed stating that UIN not available in the database | Registration Processor
[MOSIP-9760](https://mosip.atlassian.net/browse/MOSIP-9760) | Unable to create the Device Specification and Machine Specification as Id is taking value as 0 while creation and says already exists with 500 error | Admin Services
[MOSIP-9757](https://mosip.atlassian.net/browse/MOSIP-9757) | Getting RID Not Found when trying fetch the status of RID | Resident Services
[MOSIP-9756](https://mosip.atlassian.net/browse/MOSIP-9756) | Unable to print UIN using the perpetual VID | Resident Services
[MOSIP-9753](https://mosip.atlassian.net/browse/MOSIP-9753) | 1.1.2: Packet creation failed due to online encryption in application-mz.properties (Reg Cli needs to handle this). | Registration Processor
[MOSIP-9746](https://mosip.atlassian.net/browse/MOSIP-9746) | 1.1.2: Unable to create the packet (KER-PUT-015 --> Unable to store packet in object store). | Registration Processor
[MOSIP-9737](https://mosip.atlassian.net/browse/MOSIP-9737) | 1.1.2 Packet is failed at packet validator stage. | Registration Processor
[MOSIP-9736](https://mosip.atlassian.net/browse/MOSIP-9736) | 1.1.2 :Unable to launch reg client(classpath issue). | Registration Processor
[MOSIP-9731](https://mosip.atlassian.net/browse/MOSIP-9731) | The Master Data Upload data keeps on fluctuating as no data is present | Admin Services
[MOSIP-9728](https://mosip.atlassian.net/browse/MOSIP-9728) | Created Application is not visible under Your Application page | Pre-registration
[MOSIP-9715](https://mosip.atlassian.net/browse/MOSIP-9715) | Getting Technical error after login into the pre-reg. | Pre-registration
[MOSIP-9704](https://mosip.atlassian.net/browse/MOSIP-9704) | 1.1.2 unable to get the policy key though sync is completed(REG - KER-KMS-016 --> not allowed to generate new key pair for other ) | Registration Processor
[MOSIP-9703](https://mosip.atlassian.net/browse/MOSIP-9703) | 1.1.2:  Registration Client Initial Sync Failure (ERROR - RESPONSE_SIGNATURE_VALIDATION ) | Registration Processor
[MOSIP-9701](https://mosip.atlassian.net/browse/MOSIP-9701) | 1.1.2 Reg Client Initialization Issue | Registration Processor
[MOSIP-9699](https://mosip.atlassian.net/browse/MOSIP-9699) | 1.1.2  Unable to capture face with Real MDS (RCapture Failed-->java.lang.NullPointerException) | Registration Processor
[MOSIP-9687](https://mosip.atlassian.net/browse/MOSIP-9687) | Unable to move ahead in pre-reg as cannot click on Consent Check box | Pre-registration
[MOSIP-9683](https://mosip.atlassian.net/browse/MOSIP-9683) | Map Status field needs to be removed from the filter option of device as getting technical error | Admin Services
[MOSIP-9680](https://mosip.atlassian.net/browse/MOSIP-9680) | While creating the duplicate Blacklisted word we are getting 500 error | Admin Services
[MOSIP-9679](https://mosip.atlassian.net/browse/MOSIP-9679) | On creating and updating  the master data values are not getting updated in ara language | Admin Services
[MOSIP-9672](https://mosip.atlassian.net/browse/MOSIP-9672) | The Gender and Resident field is populating at one side when English is configured as both primary and secondary lang | Pre-registration
[MOSIP-9671](https://mosip.atlassian.net/browse/MOSIP-9671) | Unable to sendOTP with the temporary VID as getting error "VID not available in database" as it takes long time then usual | Resident Services
[MOSIP-9669](https://mosip.atlassian.net/browse/MOSIP-9669) | Filter API for Machine Type does not support name column as filter value  | Admin Services
[MOSIP-9663](https://mosip.atlassian.net/browse/MOSIP-9663) |  Unable to create the Template as ID field is not there and we cannot generate randomly in UI | Admin Services
[MOSIP-9662](https://mosip.atlassian.net/browse/MOSIP-9662) | Unable to create and update holiday Under admin UI | Admin Services
[MOSIP-9658](https://mosip.atlassian.net/browse/MOSIP-9658) | Unable to activate the deactivated machinetype | Admin Services
[MOSIP-9656](https://mosip.atlassian.net/browse/MOSIP-9656) | Unable to deactivate using the edit option for masterdata | Admin Services
[MOSIP-9655](https://mosip.atlassian.net/browse/MOSIP-9655) | Getting field requestname error while trying to create the masterdata in one langcode | Admin Services
[MOSIP-9654](https://mosip.atlassian.net/browse/MOSIP-9654) | Unable to update UIN using resident service as getting base exception | Resident Services
[MOSIP-9651](https://mosip.atlassian.net/browse/MOSIP-9651) | Document Type-Document Categories Mapping doesnot open | Admin Services
[MOSIP-9650](https://mosip.atlassian.net/browse/MOSIP-9650) | Message to be corrected while deactivating the blacklisted word | Admin Services
[MOSIP-9637](https://mosip.atlassian.net/browse/MOSIP-9637) | Partner Registration for SyncByte with real-biometrics failed | Partner Management
[MOSIP-9635](https://mosip.atlassian.net/browse/MOSIP-9635) | Getting error as errorCode=RPR-RHM-FAILED-001 while trying to Reprint the using resident service  | Resident Services
[MOSIP-9634](https://mosip.atlassian.net/browse/MOSIP-9634) | 1.2 Reg Cli with MockMDS-- Exception while getting the scanned biometrics for user registration | Registration Processor
[MOSIP-9631](https://mosip.atlassian.net/browse/MOSIP-9631) | Print is not working in pre-reg UI under acknowledgement page | Pre-registration
[MOSIP-9605](https://mosip.atlassian.net/browse/MOSIP-9605) | Pre-reg on Dev doesn't get past document upload page | Pre-registration
[MOSIP-9602](https://mosip.atlassian.net/browse/MOSIP-9602) | Unable to register the device stating that failed to evaluate expression 'hashrole' error. | Partner Management
[MOSIP-9575](https://mosip.atlassian.net/browse/MOSIP-9575) | eKYC response is empty on decrypting it | Authentication/ID Repository
[MOSIP-9570](https://mosip.atlassian.net/browse/MOSIP-9570) | Unable to authenticate using VID | Authentication/ID Repository
[MOSIP-9569](https://mosip.atlassian.net/browse/MOSIP-9569) | 1.1.2 Multiple location hierarchy does not support in the platform. | Registration Processor
[MOSIP-9568](https://mosip.atlassian.net/browse/MOSIP-9568) | Issues in Dynamic UI implementation  for Registration Client. | Registration Processor
[MOSIP-9565](https://mosip.atlassian.net/browse/MOSIP-9565) | Device validations in IDA is not happening via the PM API's | Authentication/ID Repository
[MOSIP-9564](https://mosip.atlassian.net/browse/MOSIP-9564) | Unable to load mocksdk in registration client. | Registration Processor
[MOSIP-9563](https://mosip.atlassian.net/browse/MOSIP-9563) | 1.1.2 : Registration Client is not able to sync the device's data (No APIs to fetch registered device master data in reg client local DB). | Registration Processor
[MOSIP-9562](https://mosip.atlassian.net/browse/MOSIP-9562) | 1.1.2 Child packet is getting failed at packet validator stage stating missing  Applicant biometric fileName/file. | Registration Processor
[MOSIP-9561](https://mosip.atlassian.net/browse/MOSIP-9561) | Getting Internel server error while ruuning API TriggerNotification_preRegistrationId_withInvalidValueAsNonExisting | Pre-registration
[MOSIP-9559](https://mosip.atlassian.net/browse/MOSIP-9559) | Getting error code under message of error section under response | Pre-registration
[MOSIP-9526](https://mosip.atlassian.net/browse/MOSIP-9526) | Unable to create the Document Type | Admin Services
[MOSIP-9524](https://mosip.atlassian.net/browse/MOSIP-9524) | 1.1.2 : Child packet is getting failed at OSI stating the Invalid UIN though valid Parent RID is given during the registration. | Registration Processor
[MOSIP-9496](https://mosip.atlassian.net/browse/MOSIP-9496) | IDA repo is not notifying IDA on UIN creation | Authentication/ID Repository
[MOSIP-9486](https://mosip.atlassian.net/browse/MOSIP-9486) | Unable to change the policy of a partner | Partner Management
[MOSIP-9485](https://mosip.atlassian.net/browse/MOSIP-9485) | The is_Active field under devicemaster table remains false as device is created in one langguage | Admin Services
[MOSIP-9484](https://mosip.atlassian.net/browse/MOSIP-9484) | Ekyc as 'null' is not handled in IDA | Authentication/ID Repository
[MOSIP-9483](https://mosip.atlassian.net/browse/MOSIP-9483) | Auth Policy/ekyc attributes returned as null when validating the partner and misp license key | Partner Management
[MOSIP-9481](https://mosip.atlassian.net/browse/MOSIP-9481) | Unable to continue after the document Upload page | Pre-registration
[MOSIP-9474](https://mosip.atlassian.net/browse/MOSIP-9474) | Getting error while trying to fetch the packet status | Admin Services
[MOSIP-9473](https://mosip.atlassian.net/browse/MOSIP-9473) | 1.2 DEV- Unable to view document in registration client. | Registration Processor
[MOSIP-9472](https://mosip.atlassian.net/browse/MOSIP-9472) | 1.1.2: Timeout waiting for connection from pool issue in packet manager. | Registration Processor
[MOSIP-9470](https://mosip.atlassian.net/browse/MOSIP-9470) | DEV ENV(1.2)- Update Packet is failed at BIO AUTH Stage (IDA-MLC-007","errorMessage":"Request could not be processed. Please try again). | Registration Processor
[MOSIP-9463](https://mosip.atlassian.net/browse/MOSIP-9463) | No filter option is present under Gender Master Data in AdminUI | Admin Services
[MOSIP-9460](https://mosip.atlassian.net/browse/MOSIP-9460) | The Blacklisted word page keeps on loading | Admin Services
[MOSIP-9458](https://mosip.atlassian.net/browse/MOSIP-9458) | When the data is deleted using the bulk upload UI/API the updated by Field remains empty | Admin Services
[MOSIP-9457](https://mosip.atlassian.net/browse/MOSIP-9457) | On updating the code under Center Type user should get youcannot change the CenterCode | Admin Services
[MOSIP-9455](https://mosip.atlassian.net/browse/MOSIP-9455) | Unable to register devices | Partner Management
[MOSIP-9454](https://mosip.atlassian.net/browse/MOSIP-9454) | 1.1.2: Packets which has been exported can not be uploaded. | Registration Processor
[MOSIP-9451](https://mosip.atlassian.net/browse/MOSIP-9451) | Language change made in the Config is not getting reflected. | Deployment
[MOSIP-9450](https://mosip.atlassian.net/browse/MOSIP-9450) | The centertype get created when the CenterName field is not given in secondary lang | Admin Services
[MOSIP-9446](https://mosip.atlassian.net/browse/MOSIP-9446) | 1.1.2: Error in Notification stage logs (unable to send the notification) | Registration Processor
[MOSIP-9442](https://mosip.atlassian.net/browse/MOSIP-9442) | While sending working day in request as Saturday it coming one incremented day in response | Admin Services
[MOSIP-9427](https://mosip.atlassian.net/browse/MOSIP-9427) | On sending incorrect value under the timestamp as past date or future getting 500 error | Pre-registration
[MOSIP-9426](https://mosip.atlassian.net/browse/MOSIP-9426) | Exceptional Holiday Calendar is missing from UI under secondary language selection | Admin Services
[MOSIP-9423](https://mosip.atlassian.net/browse/MOSIP-9423) | 1.1.2- DEV/QA ENV- Packet validation failed in the packet manager. | Registration Processor
[MOSIP-9371](https://mosip.atlassian.net/browse/MOSIP-9371) | 1.1.2 : Outer packets and subpackets are not encrypted under main packet container. | Registration Processor
[MOSIP-9370](https://mosip.atlassian.net/browse/MOSIP-9370) | 1.1.2-  id packet and json file is not created, also packet is created under packet management through packet approval did not happen. | Registration Processor
[MOSIP-9368](https://mosip.atlassian.net/browse/MOSIP-9368) | Getting error while trying to map a device using POST device API , where center is on zone KTA and device is of NTH  | Admin Services
[MOSIP-9366](https://mosip.atlassian.net/browse/MOSIP-9366) | Old doc is also present even after uploading the new document. | Pre-registration
[MOSIP-9363](https://mosip.atlassian.net/browse/MOSIP-9363) | 1.2 - Reg Client - Unable to approve the packet. | Registration Processor
[MOSIP-9356](https://mosip.atlassian.net/browse/MOSIP-9356) | Menu icon is not clickable on Biometric Screen. | Registration Processor
[MOSIP-9355](https://mosip.atlassian.net/browse/MOSIP-9355) | 1.1.2 : Registration Client icon (during launch)  needs to be changed on the taskbar. | Registration Processor
[MOSIP-9352](https://mosip.atlassian.net/browse/MOSIP-9352) | 1.1.2:  Unable to log in into the registration client as the appid is REGISTRATIONCLIENT in the auth request using user-id/password. | Registration Processor
[MOSIP-9343](https://mosip.atlassian.net/browse/MOSIP-9343) | The user is not able to select POA and browse doc when none option is selected after selecting any doc to copy | Pre-registration
[MOSIP-9341](https://mosip.atlassian.net/browse/MOSIP-9341) | User is not able to logout from Admin Portal | Admin Services
[MOSIP-9334](https://mosip.atlassian.net/browse/MOSIP-9334) | Transliterate service is throwing error JSON parse error: Unrecognized field \"to_field_value\" | Pre-registration
[MOSIP-9325](https://mosip.atlassian.net/browse/MOSIP-9325) | TriggerNotification APi is failing as  response body  has both error code & response as Null when an invalid value is sent under requesttime | Pre-registration
[MOSIP-9302](https://mosip.atlassian.net/browse/MOSIP-9302) | Getting "No register device found" while trying to de-register , registered Device | Admin Services
[MOSIP-9269](https://mosip.atlassian.net/browse/MOSIP-9269) | Registration Client takes 15-20 seconds to logged out.  | Registration Processor
[MOSIP-9268](https://mosip.atlassian.net/browse/MOSIP-9268) | Remove Mock SDK dependency from POM File | Authentication/ID Repository
[MOSIP-9257](https://mosip.atlassian.net/browse/MOSIP-9257) | Unable to execute the  De-registration of Devices as getting error as Unrecognized field \"ID\" | Admin Services
[MOSIP-9253](https://mosip.atlassian.net/browse/MOSIP-9253) | Technical error is received under wrong template case when user upload the template of one table to another | Admin Services
[MOSIP-9250](https://mosip.atlassian.net/browse/MOSIP-9250) | The Master Data Upload data keeps on loading sometime however the data is present in the table | Admin Services
[MOSIP-9249](https://mosip.atlassian.net/browse/MOSIP-9249) | The table name is not appearing under master data bulk upload UI after performing any action | Admin Services
[MOSIP-9224](https://mosip.atlassian.net/browse/MOSIP-9224) | The search registration center API should support the zoneCode Field to search the centers | Admin Services
[MOSIP-9182](https://mosip.atlassian.net/browse/MOSIP-9182) | Getting No internet connection issue while launching the registration client when hostname is not set under environmental variable | Registration Processor
[MOSIP-9179](https://mosip.atlassian.net/browse/MOSIP-9179) | Comment to Pre-registration Captcha Code for now and make it configurable later | Pre-registration
[MOSIP-9071](https://mosip.atlassian.net/browse/MOSIP-9071) | Print Service stage is missing for one packet when multiple packet upload at a time. | Registration Processor
[MOSIP-9042](https://mosip.atlassian.net/browse/MOSIP-9042) | The Document does not have all category | Pre-registration
[MOSIP-9041](https://mosip.atlassian.net/browse/MOSIP-9041) | Your application and preview page keeps on loading while testing the dynamic field | Pre-registration
[MOSIP-9033](https://mosip.atlassian.net/browse/MOSIP-9033) | first name, last name is not displayed in pre-reg booking email notification if we change name in the pre-reg UI spec. | Pre-registration
[MOSIP-9032](https://mosip.atlassian.net/browse/MOSIP-9032) | QA ENV - Original name is not displayed in UIN Generation Email Notification. | Registration Processor
[MOSIP-8973](https://mosip.atlassian.net/browse/MOSIP-8973) | regprocessor registrationtransaction is failing with internal server error | Registration Processor
[MOSIP-8969](https://mosip.atlassian.net/browse/MOSIP-8969) | Registration Client should pass the "biosubtype" for Face as empty   | Registration Processor
[MOSIP-8814](https://mosip.atlassian.net/browse/MOSIP-8814) | Unable to proceed further from demographic page getting error popup | Pre-registration
[MOSIP-8804](https://mosip.atlassian.net/browse/MOSIP-8804) | Dynamic UI Test (RegClient) - Master data is not getting loaded for dynamic field. | Registration Processor
[MOSIP-8776](https://mosip.atlassian.net/browse/MOSIP-8776) | Dynamic UI Test (PreReg) - Master data is not getting loaded for dynamic field. | Commons
[MOSIP-8769](https://mosip.atlassian.net/browse/MOSIP-8769) | Unable to scan document using document scanner | Registration Processor
[MOSIP-8544](https://mosip.atlassian.net/browse/MOSIP-8544) | JSON Response need to be modify | Partner Management
[MOSIP-8543](https://mosip.atlassian.net/browse/MOSIP-8543) | Adding additional attributes throws an error in dynamic field create and update API | Admin Services
[MOSIP-8464](https://mosip.atlassian.net/browse/MOSIP-8464) | Admin UI keeps on loading and user is not able to login | Admin Services
[MOSIP-8452](https://mosip.atlassian.net/browse/MOSIP-8452) | Issues in Audit for app_name=REGISTRATION. | Registration Processor
[MOSIP-8450](https://mosip.atlassian.net/browse/MOSIP-8450) |  Scenario (Only Biometric Update): UIN Update template issue only when Demographic details and Documents are not given. | Registration Processor
[MOSIP-8448](https://mosip.atlassian.net/browse/MOSIP-8448) | Officer / Supervisor biometric data is not sent in the meta_info.json (Packet is getting failed in the OSI stage). | Registration Processor
[MOSIP-8447](https://mosip.atlassian.net/browse/MOSIP-8447) | Popup is retained though the application is logged out.  | Registration Processor
[MOSIP-8445](https://mosip.atlassian.net/browse/MOSIP-8445) | count in RCapture request not validated | Registration Processor
[MOSIP-8443](https://mosip.atlassian.net/browse/MOSIP-8443) | LOST UIN template issue only when Demographic details and Documents are not given. | Registration Processor
[MOSIP-8442](https://mosip.atlassian.net/browse/MOSIP-8442) | MDS issue during biometric login using fingerprint. | Registration Processor
[MOSIP-8441](https://mosip.atlassian.net/browse/MOSIP-8441) | Scan button is not present during packet auth. | Registration Processor
[MOSIP-8440](https://mosip.atlassian.net/browse/MOSIP-8440) | Registration client gets hanged and does not respond during packet auth , eod auth and login auth. | Registration Processor
[MOSIP-8438](https://mosip.atlassian.net/browse/MOSIP-8438) | Registration Client throws ERROR text in UI and exception in the logs after Launch and also if biometric auth login fails. | Registration Processor
[MOSIP-8316](https://mosip.atlassian.net/browse/MOSIP-8316) | while capturing biometrics stream image getting paused | Registration Processor
[MOSIP-8306](https://mosip.atlassian.net/browse/MOSIP-8306) | Admin_GetLeafZones_forNoZoneMap  Error to be corrected under response  | Admin Services
[MOSIP-8305](https://mosip.atlassian.net/browse/MOSIP-8305) | Expecting error when passing invalid parameter when Activate or Deactivate the MISP Licence | Partner Management
[MOSIP-8302](https://mosip.atlassian.net/browse/MOSIP-8302) | Streaming is on though device is not connected. | Registration Processor
[MOSIP-8264](https://mosip.atlassian.net/browse/MOSIP-8264) | expecting missing input parameter exception when missing contactnumber, email and address form request body but getting success with null value. | Partner Management
[MOSIP-8263](https://mosip.atlassian.net/browse/MOSIP-8263) | Getting emailId as a null when updating the Misp. | Partner Management
[MOSIP-8189](https://mosip.atlassian.net/browse/MOSIP-8189) | Expecting error while passing Invalid input Parameter | Partner Management
[MOSIP-8177](https://mosip.atlassian.net/browse/MOSIP-8177) | The packet is not moving ahead from status Packet is Uploaded to Landing Zone in Database when update packet  is executed under resident service | Resident Services
[MOSIP-8176](https://mosip.atlassian.net/browse/MOSIP-8176) | Admin_UpdateRegCenter_Invalid_zoneCode_blank | Admin Services
[MOSIP-8173](https://mosip.atlassian.net/browse/MOSIP-8173) | Admin_UpdateRegCenter_Invalid_with_scndry_Lang_without_regCentWithPrmryLang | Admin Services
[MOSIP-8172](https://mosip.atlassian.net/browse/MOSIP-8172) | Admin_UpdateRegCenter_Invalid_locationCode_blank | Admin Services
[MOSIP-8165](https://mosip.atlassian.net/browse/MOSIP-8165) | Issue in Manual Adjudication Flow. | Registration Processor
[MOSIP-8150](https://mosip.atlassian.net/browse/MOSIP-8150) | Admin_CreateLocationDataz_Invalid_name_dupliCate invalid errorMessage and errorCode | Admin Services
[MOSIP-8149](https://mosip.atlassian.net/browse/MOSIP-8149) | Getting KER-DAH-002 when code field is missing  in CreateLocationData API | Admin Services
[MOSIP-8148](https://mosip.atlassian.net/browse/MOSIP-8148) | Getting KER-DAH-002 when code is sent as code="" under CreateLocationData API | Admin Services
[MOSIP-8146](https://mosip.atlassian.net/browse/MOSIP-8146) | Admin_CreateLocationData_inValid_HierarchyName65 invalid errorMessage | Admin Services
[MOSIP-8145](https://mosip.atlassian.net/browse/MOSIP-8145) | Admin_CreateLocationData_Invalid_EmptyHierarchyName invalid errorMessage | Admin Services
[MOSIP-8144](https://mosip.atlassian.net/browse/MOSIP-8144) | Admin_FetchRegCenterExceptionalHolidays_Kernel_Langcode_invalid   invalid errorMessage | Admin Services
[MOSIP-8139](https://mosip.atlassian.net/browse/MOSIP-8139) | Admin_UnmapDeviceRegCenterz_inactive_mapping invalid errorMessage and errorCode | Admin Services
[MOSIP-8135](https://mosip.atlassian.net/browse/MOSIP-8135) | Admin_UpdateHoliday_Invalid_language_code  invalid error message | Admin Services
[MOSIP-8134](https://mosip.atlassian.net/browse/MOSIP-8134) | Admin_UpdateMachine_Invalid_SerialNumber_AboveMaxLen64    invalid errorMessage | Admin Services
[MOSIP-8129](https://mosip.atlassian.net/browse/MOSIP-8129) | Kernel-bio-sdk-provider: Remove Redundant instantiation of SDK with same class and properties for different modalities. | Commons
[MOSIP-8125](https://mosip.atlassian.net/browse/MOSIP-8125) | Error message to be corrected under createHoliday API | Admin Services
[MOSIP-8117](https://mosip.atlassian.net/browse/MOSIP-8117) | Unable to update the blacklisted word when desc is provided with Space  getting error code "KER-MSD-105 | Admin Services
[MOSIP-8003](https://mosip.atlassian.net/browse/MOSIP-8003) | RC2- On every launch Reg Client asks for the update though no update is there. | Registration Processor
[MOSIP-7995](https://mosip.atlassian.net/browse/MOSIP-7995) | Registration data is not displayed when supervisor selects the option informed/can't informed. | Registration Processor
[MOSIP-7915](https://mosip.atlassian.net/browse/MOSIP-7915) | Navigation issues in registration client. | Registration Processor
[MOSIP-7913](https://mosip.atlassian.net/browse/MOSIP-7913) | PreRegistrationIdentitiyMapping.json name as firstName, lastName shows gives null value | Pre-registration
[MOSIP-7907](https://mosip.atlassian.net/browse/MOSIP-7907) | Able to do OTP authentication with invalid transaction id | Authentication/ID Repository
[MOSIP-7904](https://mosip.atlassian.net/browse/MOSIP-7904) | sdkDependency setup query needs to be run in local DB to bring up the registration client. | Registration Processor
[MOSIP-7800](https://mosip.atlassian.net/browse/MOSIP-7800) | MOSIP copyright version info to be removed | Registration Processor
[MOSIP-7705](https://mosip.atlassian.net/browse/MOSIP-7705) | AuthPartner validation with un-mapped partnerId and apikey is not giving proper message | Authentication/ID Repository
[MOSIP-7435](https://mosip.atlassian.net/browse/MOSIP-7435) | Unable to copy the document for user of choice | Pre-registration
[MOSIP-7423](https://mosip.atlassian.net/browse/MOSIP-7423) | Sync does not works till Reg Client needs to logged out- relogin and synced again. | Registration Processor
[MOSIP-7387](https://mosip.atlassian.net/browse/MOSIP-7387) | Proxy OTP is not performing many validations | Commons
[MOSIP-1770](https://mosip.atlassian.net/browse/MOSIP-1770) | UI Issues under update Machine Module | Admin Services
[MOSIP-823](https://mosip.atlassian.net/browse/MOSIP-823) | Discrepancy in the Error Code found while booking appointment. | Pre-registration
[MOSIP-179](https://mosip.atlassian.net/browse/MOSIP-179) | Fetch Packet Status API is giving  wrong validation messages | Admin Services
