This document contains the bugs that were fixed as part of MOSIP 1.1.2 release.

Bug ID | Summary | Module
-------|---------|-------
[MOSIP-10712](https://mosip.atlassian.net/browse/MOSIP-10712) | Password and Iris login screen overlay if auth token expires, and unbale to do password login to get fresh auth token  | Registration Client
[MOSIP-10702](https://mosip.atlassian.net/browse/MOSIP-10702) | Sync request Decryption Failure in Packet Validator Stage  | Registration Processor
[MOSIP-10691](https://mosip.atlassian.net/browse/MOSIP-10691) | Packet is getting failed at OSI (ida internal service time out  error a OSI stage) | Registration Processor
[MOSIP-10570](https://mosip.atlassian.net/browse/MOSIP-10570) | "Internal System Error" while trying to log in to the reg-client | Registration Client
[MOSIP-10567](https://mosip.atlassian.net/browse/MOSIP-10567) | Packets are failing at validator stage(Unknownexception occured RPR-RCT-001 --> Unknown resource provided; nested exception is org.springframework.web.client.HttpServerErrorException: 500 ) | Registration Processor
[MOSIP-10519](https://mosip.atlassian.net/browse/MOSIP-10519) | Packet approved using bio auth is failing at OSI stage | Registration Processor
[MOSIP-10516](https://mosip.atlassian.net/browse/MOSIP-10516) | Acknowledgement page has alignment issues for the bio data | Registration Client
[MOSIP-10512](https://mosip.atlassian.net/browse/MOSIP-10512) | Unable to add Userdetails from Admin console via BulkUpload data | Admin Services
[MOSIP-10506](https://mosip.atlassian.net/browse/MOSIP-10506) | The email notification is not coming under pre-reg application  | Pre-registration
[MOSIP-10502](https://mosip.atlassian.net/browse/MOSIP-10502) | Unable to login to reg-client in offline mode. | Registration Client
[MOSIP-10498](https://mosip.atlassian.net/browse/MOSIP-10498) | Getting technical error while uploading the Data | Admin Services
[MOSIP-10495](https://mosip.atlassian.net/browse/MOSIP-10495) | 1.1.3-On-boarding authentication is not working in Registration Client | Registration Client
[MOSIP-10487](https://mosip.atlassian.net/browse/MOSIP-10487) | Unable to upload the machinemaster Bulk data as getting error | Admin Services
[MOSIP-10485](https://mosip.atlassian.net/browse/MOSIP-10485) | Notification is not working and throwing exception under Regproc | Registration Processor
[MOSIP-10482](https://mosip.atlassian.net/browse/MOSIP-10482) | Update packet is failing under VALIDATE_PACKET stage | Registration Processor
[MOSIP-10481](https://mosip.atlassian.net/browse/MOSIP-10481) | User should have option to upload multiple packets | Admin Services
[MOSIP-10479](https://mosip.atlassian.net/browse/MOSIP-10479) | 1.1.3- A packet is getting failed at OSI stage stating that  Unable to access API resourceRPR-RCT-001 --> Unknown resource provided;  nested exception is org.springframework.web.client.HttpServerErrorException: 500  | Registration Processor
[MOSIP-10475](https://mosip.atlassian.net/browse/MOSIP-10475) | Temporary VID gets consumed after OTP request | IDA / ID Repository
[MOSIP-10472](https://mosip.atlassian.net/browse/MOSIP-10472) | Device Type column doesnot have value as API is not returning value | Admin Services
[MOSIP-10471](https://mosip.atlassian.net/browse/MOSIP-10471) | center-id is not displayed in reg client | Registration Client
[MOSIP-10461](https://mosip.atlassian.net/browse/MOSIP-10461) | Unable to Bulk upload the data for reg center | Admin Services
[MOSIP-10457](https://mosip.atlassian.net/browse/MOSIP-10457) | Unable to book appointment as getting technical error on slot selection page  | Pre-registration
[MOSIP-10412](https://mosip.atlassian.net/browse/MOSIP-10412) | Unable to fetch packet status using the Admin  | Admin Services
[MOSIP-10410](https://mosip.atlassian.net/browse/MOSIP-10410) | Bio update packet is getting failed stating that UIN Updation failed - Invalid Input Parameter - documents - individualBiometrics | IDA / ID Repository
[MOSIP-10405](https://mosip.atlassian.net/browse/MOSIP-10405) | EKYC encryption is not happening with the partner's key | IDA / ID Repository
[MOSIP-10398](https://mosip.atlassian.net/browse/MOSIP-10398) | Reg-Client getting hanged when consent proof is selected for scan in Document upload page | Registration Client
[MOSIP-10395](https://mosip.atlassian.net/browse/MOSIP-10395) | Photo not returned in eKYC response | IDA / ID Repository
[MOSIP-10394](https://mosip.atlassian.net/browse/MOSIP-10394) | Unable to do auth/kyc after disabling cache | IDA / ID Repository
[MOSIP-10393](https://mosip.atlassian.net/browse/MOSIP-10393) | Getting error "RES-SER-009" while trying to lock the Auth using Perpetual VID | Resident Services
[MOSIP-10392](https://mosip.atlassian.net/browse/MOSIP-10392) | Unable to test update and child packet flow-Unable to access API resourceRPR-RCT-001 --> RPR-RCT-001;  nested exception is org.springframework.web.client.HttpClientErrorException: 404  | Registration Processor
[MOSIP-10390](https://mosip.atlassian.net/browse/MOSIP-10390) | Sync failure, refresh token API is failing | Registration Client
[MOSIP-10388](https://mosip.atlassian.net/browse/MOSIP-10388) | Unable to do eKYC | IDA / ID Repository
[MOSIP-10387](https://mosip.atlassian.net/browse/MOSIP-10387) | Unable to do biometric auth | IDA / ID Repository
[MOSIP-10385](https://mosip.atlassian.net/browse/MOSIP-10385) | 1.1.3:: Two instances of Reg Client are running, one is reg-client and another one is the launcher. | Registration Client
[MOSIP-10384](https://mosip.atlassian.net/browse/MOSIP-10384) | Getting error RES-SER-020 while updating the resident demographic details from resident service | Resident Services
[MOSIP-10295](https://mosip.atlassian.net/browse/MOSIP-10295) | While updating the Holiday the location field is coming as "undefined" | Admin Services
[MOSIP-10293](https://mosip.atlassian.net/browse/MOSIP-10293) | Unable to deactivate/ Activate the machine while edit Machine page | Admin Services
[MOSIP-10270](https://mosip.atlassian.net/browse/MOSIP-10270) | 1.2 Reg Client with Mock MDS:: Biometric login, packet auth, and EOD auth are not working for the thumb. | Registration Client
[MOSIP-10269](https://mosip.atlassian.net/browse/MOSIP-10269) | 1.2 Reg Client with Mock MDS::  Biometric login, packet auth, and EOD auth are not working for Right Hand Fingerprint. | Registration Client
[MOSIP-10266](https://mosip.atlassian.net/browse/MOSIP-10266) | Unable to do KYC auth with demographic Details , however Demo_Auth is working | IDA / ID Repository
[MOSIP-10260](https://mosip.atlassian.net/browse/MOSIP-10260) | 1.2 Reg Cli with Mock MDS :: Continue button is disabled if  low threshold biometrics are captured with Mock MDS | Registration Client
[MOSIP-10251](https://mosip.atlassian.net/browse/MOSIP-10251) | Packet created in Reg-Client is missing evidence.Json file | Registration Client
[MOSIP-10249](https://mosip.atlassian.net/browse/MOSIP-10249) | Reg Client1.1.2 with Mock MDS:: Packet with Officer auth says Biometric file validation failed for officer in Reg Proc. | Registration Client
[MOSIP-10247](https://mosip.atlassian.net/browse/MOSIP-10247) | 1.1.2Reg Cli with Mock: only a little finger is captured for officer/supervisor packet auth. | Registration Client
[MOSIP-10232](https://mosip.atlassian.net/browse/MOSIP-10232) | Child Packet failing in OSI stage with message "Biometric data - Iris did not match" | Registration Processor
[MOSIP-10226](https://mosip.atlassian.net/browse/MOSIP-10226) | The none text does not appear under document upload page | Pre-registration
[MOSIP-10222](https://mosip.atlassian.net/browse/MOSIP-10222) | Unable to sentOTP when user is performing send OTP with different transactionID | Resident Services
[MOSIP-10207](https://mosip.atlassian.net/browse/MOSIP-10207) | The application still present on the Your application page even after discard | Pre-registration
[MOSIP-10158](https://mosip.atlassian.net/browse/MOSIP-10158) | Admin page reloads if proper role is not provided | Admin Services
[MOSIP-10146](https://mosip.atlassian.net/browse/MOSIP-10146) |  Error during send a notification to resident after packet validation stage. | Registration Processor
[MOSIP-10132](https://mosip.atlassian.net/browse/MOSIP-10132) | ObjectStore should return boolean instead of throwing exception when exists method is invoked | Commons
[MOSIP-10045](https://mosip.atlassian.net/browse/MOSIP-10045) | 1.1.2(MOCK MDS ): Packets are still displayed in the Pending approval list though EOD auth is successful (it mean EOD auth with a bio is not working as expected). | Registration Client
[MOSIP-10033](https://mosip.atlassian.net/browse/MOSIP-10033) | Default list of Partners/Policies required | Partner Management
[MOSIP-9974](https://mosip.atlassian.net/browse/MOSIP-9974) | On loading the Admin Page we get you are not authorized  | Admin Services
[MOSIP-9972](https://mosip.atlassian.net/browse/MOSIP-9972) | Operator is unable to create exception packet | Registration Client
[MOSIP-9970](https://mosip.atlassian.net/browse/MOSIP-9970) | Actual face was not visible in bio section of acknowledgement screen | Registration Client
[MOSIP-9880](https://mosip.atlassian.net/browse/MOSIP-9880) | Hide document screen if the entire document section is removed from UI spec. | Registration Client
[MOSIP-9877](https://mosip.atlassian.net/browse/MOSIP-9877) | WebSub subscrtiption secret should be accepted from property in intent verification annotation | Commons
[MOSIP-9876](https://mosip.atlassian.net/browse/MOSIP-9876) | Packet Status does not show all the stages under view more section | Admin Services
[MOSIP-9856](https://mosip.atlassian.net/browse/MOSIP-9856) | Unable to continue to biometric screen after scanning the document ( workaround works) | Registration Client
[MOSIP-9854](https://mosip.atlassian.net/browse/MOSIP-9854) | On click of logout the popup does not appear properly | Pre-registration
[MOSIP-9853](https://mosip.atlassian.net/browse/MOSIP-9853) | The document upload page is not rendered properly for Applicant added | Pre-registration
[MOSIP-9829](https://mosip.atlassian.net/browse/MOSIP-9829) | 1.1.2 - Packet is failing at BIOGRAPHIC_VERIFICATION stage stating that Unknown exception occured null. | Registration Processor
[MOSIP-9822](https://mosip.atlassian.net/browse/MOSIP-9822) | Not receiving failure notifications for OTP auth | IDA / ID Repository
[MOSIP-9820](https://mosip.atlassian.net/browse/MOSIP-9820) | The id sent in the .csv file is getting save for the tables where unique id is generated when data is sent | Admin Services
[MOSIP-9795](https://mosip.atlassian.net/browse/MOSIP-9795) | 1.1.2 -Unable to Create New/Update Packet when Document Scanner is Enabled. | Registration Client
[MOSIP-9781](https://mosip.atlassian.net/browse/MOSIP-9781) | 1.1.2: Very frequently minio returns object as null ( during  search and packet processing ) | Registration Processor
[MOSIP-9777](https://mosip.atlassian.net/browse/MOSIP-9777) | Admin is  picking lang value from configmaps  | Admin Services
[MOSIP-9774](https://mosip.atlassian.net/browse/MOSIP-9774) | The user is not redirected to list view page under center, device and machine | Admin Services
[MOSIP-9770](https://mosip.atlassian.net/browse/MOSIP-9770) | The demo details filled during registration in Reg-client is not shown on the preview, acknowledgement and approval page. | Registration Client
[MOSIP-9755](https://mosip.atlassian.net/browse/MOSIP-9755) | Post Holiday should return  id field | Admin Services
[MOSIP-9752](https://mosip.atlassian.net/browse/MOSIP-9752) | [Intermittent] Files are not stored in Object Store | IDA / ID Repository
[MOSIP-9739](https://mosip.atlassian.net/browse/MOSIP-9739) | The search API is not giving the machineType name under response | Admin Services
[MOSIP-9735](https://mosip.atlassian.net/browse/MOSIP-9735) | Getting error while trying to Lock and Unlock UIN | Resident Services
[MOSIP-9734](https://mosip.atlassian.net/browse/MOSIP-9734) | Unable to Filter the location with the fields getting column not supported | Admin Services
[MOSIP-9733](https://mosip.atlassian.net/browse/MOSIP-9733) | Getting error errorCode": "KER-MSD-311",while trying to search Location data | Admin Services
[MOSIP-9661](https://mosip.atlassian.net/browse/MOSIP-9661) | Search API for Gender does not support name column as value  | Admin Services
[MOSIP-9657](https://mosip.atlassian.net/browse/MOSIP-9657) | 1.2 DEV Real MDS- Face Capture Issue in Reg Client  | Registration Client
[MOSIP-9647](https://mosip.atlassian.net/browse/MOSIP-9647) | Getting error while trying to Download EUIN | Resident Services
[MOSIP-9479](https://mosip.atlassian.net/browse/MOSIP-9479) | Unable to discard the application | Pre-registration
[MOSIP-9459](https://mosip.atlassian.net/browse/MOSIP-9459) | Unable to update the Blacklisted word from UI | Admin Services
[MOSIP-9372](https://mosip.atlassian.net/browse/MOSIP-9372) | We are able to change the status of the device which is in Revoked state to Registered | Admin Services
[MOSIP-9357](https://mosip.atlassian.net/browse/MOSIP-9357) | Working Non Working Days API is giving incorrect response | Admin Services
[MOSIP-9354](https://mosip.atlassian.net/browse/MOSIP-9354) | 1.1.2:  Sync failure as client id/secret key authentication is failed because the secret key is plaintext {Cipher}. | Registration Client
[MOSIP-9133](https://mosip.atlassian.net/browse/MOSIP-9133) | 1.1.2 -In All Env - All the reg proc pods need to be restarted multiple times to bring up reg proc completely (Packet stuck at any stage at any time). | Registration Processor
[MOSIP-9072](https://mosip.atlassian.net/browse/MOSIP-9072) | Default name is missing in UIN update template when any demo filed is updated excluding name. | Registration Client
[MOSIP-8448](https://mosip.atlassian.net/browse/MOSIP-8448) | Officer / Supervisor biometric data is not sent in the meta_info.json (Packet is getting failed in the OSI stage). | Registration Client
[MOSIP-8447](https://mosip.atlassian.net/browse/MOSIP-8447) | Popup is retained though the application is logged out.  | Registration Client
[MOSIP-8442](https://mosip.atlassian.net/browse/MOSIP-8442) | MDS issue during biometric login using fingerprint. | Registration Client
[MOSIP-8003](https://mosip.atlassian.net/browse/MOSIP-8003) | On every launch Reg Client asks for the update though no update is there. | Registration Client
[MOSIP-7448](https://mosip.atlassian.net/browse/MOSIP-7448) | Unable to authenticate after a deactivated UIN is activated | IDA / ID Repository
[MOSIP-7002](https://mosip.atlassian.net/browse/MOSIP-7002) | The inactive Center type is shown in the drop down Registration center type in  center creation and Update form  | Admin Services
