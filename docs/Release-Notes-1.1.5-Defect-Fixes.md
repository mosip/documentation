This document contains the bugs that were fixed as part of MOSIP 1.1.5 release.

Bug ID | Summary | Module
-------|---------|-------
[MOSIP-13027](https://mosip.atlassian.net/browse/MOSIP-13027) | Manual verification stage should be updated with Status Rejected when MV rejects it | Registration Processor
[MOSIP-12960](https://mosip.atlassian.net/browse/MOSIP-12960) | Reg Client: Forgot password link is missing | Registration Client 	
[MOSIP-12939](https://mosip.atlassian.net/browse/MOSIP-12939) | Manual verification service not receiving the event request | Registration Processor 	
[MOSIP-12933](https://mosip.atlassian.net/browse/MOSIP-12939) |	Reg-client fails to stream biometrics if MDS is launched post Reg-client (just before streaming) | Registration Client 	
[MOSIP-12919](https://mosip.atlassian.net/browse/MOSIP-12919) | Tagging failing for update flow in the classification stage | Registration Processor 	
[MOSIP-12896](https://mosip.atlassian.net/browse/MOSIP-12896) | User onboarding not happening in the Reg-Client | Registration Client 	
[MOSIP-12861](https://mosip.atlassian.net/browse/MOSIP-12861) |	Environment change is not happening from System.setProperty("mosip.hostname",hostName) | Test Automation 	
[MOSIP-12823](https://mosip.atlassian.net/browse/MOSIP-12823) | Reg Client: Different resident UIN and RID both are processed to update Guardian | Registration Client		
[MOSIP-12810](https://mosip.atlassian.net/browse/MOSIP-12810) | Reg Client: No response on clicking 'Forgot username' link | Registration Client 	
[MOSIP-12802](https://mosip.atlassian.net/browse/MOSIP-12802) | Packets are getting stuck in the OSI validation stage | Registration Processor 	
[MOSIP-12751](https://mosip.atlassian.net/browse/MOSIP-12751) | The list of table under masterdata bulkupload has History Table | Admin 	
[MOSIP-12748](https://mosip.atlassian.net/browse/MOSIP-12748) | Devices are not getting detected in Reg-Client | Registration Client 	
[MOSIP-12706](https://mosip.atlassian.net/browse/MOSIP-12706) | Book Appointment screen: Blank screen displayed. | Pre-Registration 		
[MOSIP-12704](https://mosip.atlassian.net/browse/MOSIP-12704) | Gender and Resident field is displayed empty in Preview screen	| Pre-Registration 	
[MOSIP-12701](https://mosip.atlassian.net/browse/MOSIP-12701) | The Packet Utility is failing in the Validation Stage | Registration Processor 		
[MOSIP-12617](https://mosip.atlassian.net/browse/MOSIP-12617) | The Document page and other pages are coming blank | Pre-Registration 	
[MOSIP-12612](https://mosip.atlassian.net/browse/MOSIP-12612) | Modification of the Location data in Ref-Impl | Registration Client 	
[MOSIP-12598](https://mosip.atlassian.net/browse/MOSIP-12598) | RegClient unable to handle the dynamic field added and throws null pointer exception | Registration Client 	
[MOSIP-12595](https://mosip.atlassian.net/browse/MOSIP-12595) | Invalid text displayed in demographic fields, on navigating back from upload document screen | Pre-Registration 	
[MOSIP-12592](https://mosip.atlassian.net/browse/MOSIP-12592) | The Reg-client is failing with master sync failure, since the Dynamic field has same name as the entity declared in the class | Registration Client 	
[MOSIP-12575](https://mosip.atlassian.net/browse/MOSIP-12575) | Masterdata_sync failure in the reg-client | Registration Client 	
[MOSIP-12507](https://mosip.atlassian.net/browse/MOSIP-12507) | Blocked in qa.mosip.net pre registration due to error in IDobjectValidation. | Pre-Registration 		
[MOSIP-12506](https://mosip.atlassian.net/browse/MOSIP-12506) | The expiry time limit keys are wrong in the reg-proc.mz properties	| Registration Processor 	
[MOSIP-12478](https://mosip.atlassian.net/browse/MOSIP-12478) | ERROR: null value in column \"is_deleted\" violates not-null constraint when ID schema is being published | Admin
[MOSIP-12287](https://mosip.atlassian.net/browse/MOSIP-12287) | Reg client JAR Executable client sync failure | Registration Client 	
[MOSIP-12272](https://mosip.atlassian.net/browse/MOSIP-12272) | 1.1.5 fresh deployment -PMS | Partner Management		
[MOSIP-12120](https://mosip.atlassian.net/browse/MOSIP-12120) | Packet is going in In-progress in Bio_Verification stage | Registration Processor 	
[MOSIP-12100](https://mosip.atlassian.net/browse/MOSIP-12100) | Getting error in pre registration- not able to proceed to next step. | Pre-Registration 		
[MOSIP-12099](https://mosip.atlassian.net/browse/MOSIP-12099) | packet-validator-stage : if audit api is down then validator should reprocess packet | Registration Processor 	
[MOSIP-12098](https://mosip.atlassian.net/browse/MOSIP-12098) | When user switches back from search option to the default page in book appointment it should display the registration center as per location hierarchy selected. | Pre-Registration	
[MOSIP-12068](https://mosip.atlassian.net/browse/MOSIP-12068) | In pre registration preview page Location names should be displayed instead of location codes. | Pre-Registration		
[MOSIP-12058](https://mosip.atlassian.net/browse/MOSIP-12058) | Registrationstatus/sync service giving 503| Registration Processor 	
[MOSIP-12004](https://mosip.atlassian.net/browse/MOSIP-12004) | Incorrect Biometrics captured in reg client when a new device is plugging | Registration Client 	
[MOSIP-11983](https://mosip.atlassian.net/browse/MOSIP-11983) | Getting an error message "UIN & RID not available in the database" | ID-Authentication 	
[MOSIP-11982](https://mosip.atlassian.net/browse/MOSIP-11982) | [Impacts Automation] Credential issuance service failing in OTP validation | ID-Authentication 	
[MOSIP-11873](https://mosip.atlassian.net/browse/MOSIP-11873) | [Impacts Automation] Getting 'UIN not available in Database' in Internal OTP generation request | ID-Authentication 	
[MOSIP-11843](https://mosip.atlassian.net/browse/MOSIP-11843) | The pre-reg version should be fetched from API applicationconfig as done in Admin | Pre-Registration 	
[MOSIP-11841](https://mosip.atlassian.net/browse/MOSIP-11841) |Mock abis key is not working "abis.return.duplicate=false" | Registration Processor 	
[MOSIP-11734](https://mosip.atlassian.net/browse/MOSIP-11734) | Sync Data in pre reg API -Getting "Authentication Failed" even After assigning roles in Keycloak and done Authentication | Pre-Registration 	
[MOSIP-11718](https://mosip.atlassian.net/browse/MOSIP-11718) | Missing auth transaction entry for validation failure cases	| Registration Processor	
[MOSIP-11548](https://mosip.atlassian.net/browse/MOSIP-11548) | Unable to create UIN , in add record api in qa env 1.1.4 | Pre-Registration		
[MOSIP-11545](https://mosip.atlassian.net/browse/MOSIP-11545) | Pre Reg - OTP email has has $variable names instead of values | Pre-Registration 	
[MOSIP-11497](https://mosip.atlassian.net/browse/MOSIP-11497) | Credential issuance status is not moving from issued to printing | ID-Authentication		
[MOSIP-11410](https://mosip.atlassian.net/browse/MOSIP-11410) | Internal auth entries are not available in auth transaction table | ID-Authentication 	
[MOSIP-11400](https://mosip.atlassian.net/browse/MOSIP-11400) | Logging failed request in credential service | Registration Processor 	
[MOSIP-11305](https://mosip.atlassian.net/browse/MOSIP-11305) | Need element IDs to access fx elements for UI Automation | Registration Client 	
[MOSIP-11294](https://mosip.atlassian.net/browse/MOSIP-11294) | Preview Template issues- junk values and missing attributes | Registration Client 	
[MOSIP-11278](https://mosip.atlassian.net/browse/MOSIP-11278) | Search API Of Partner Management | Partner Management		
[MOSIP-11074](https://mosip.atlassian.net/browse/MOSIP-11074) | Alignment issue for Arabic language in demographic page | Registration Client 	
[MOSIP-11008](https://mosip.atlassian.net/browse/MOSIP-11008) | Packet Status API is not working for user 110123 though it has Zone and Global Admin Roles | Admin	
[MOSIP-10844](https://mosip.atlassian.net/browse/MOSIP-10844) | Packet Status API is not working for user 110123 though it has Zone and Global Admin Roles | Registration Processor	
[MOSIP-10713](https://mosip.atlassian.net/browse/MOSIP-10713) | Packet Status API is not working for user 110123 though it has Zone and Global Admin Roles | Pre-Registration	
[MOSIP-10604](https://mosip.atlassian.net/browse/MOSIP-10604) | Packet Status API is not working for user 110123 though it has Zone and Global Admin Roles | Registration Client	
[MOSIP-10011](https://mosip.atlassian.net/browse/MOSIP-10011) | Both Iris visible on the left and right box correctly on the preview pages | Registration Client		
