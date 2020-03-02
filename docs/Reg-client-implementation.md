# Registration Client Developer Documentation

*** 
This document guide the developer to find the traceability between functionality and the respective technical component.  The provided technical classes are available in the package of 'registration-service' module. In this module the required functions are exposed as public method and that can be used to obtain the required features.  

It doesn't detail about each methods level information since that are covered in Javadoc of each component.   


## Functionality Vs Technical Component mapping: 

|**Functionality:**| Login with UserName and Password/ OTP/ BIO  |  
|:------:|-----|  
|**Technical Detail:**| Post successful login, session context would be created. That will be used throughout the application at the required places. The user detail and the respective roles are encapsulated inside the context. Without creation of this context object, the packet can't be created. |  
|**Main Service class and method:**| SessionContext.create(UserDTO userDTO, String loginMethod, boolean isInitialSetUp, boolean isUserNewToMachine, AuthenticationValidatorDTO authenticationValidatorDTO) |  
|**Input parameter:**| UserDTO – It should contain info of id, name, roles, center-id. loginMethod – possible values are PWD, OTP, FINGERPRINT, FACE, IRIS. isInitialSetUp – true/false, isUserNewToMachine – true/false,  AuthenticationValidatorDTO – should contain id, password, otp|  
|**Auth:**| Not required. |  
|**External Connectivity:**| Service and DB |  


|**Functionality:**| Packet Creation - New Registration / Update UIN/ Lost UIN |   
|:------:|-----|  
|**Technical Detail:**| Based on the business need [New Registration / Update UIN/ Lost UIN] this 'RegistrationDTO' object should be populated with the relevant  data and also pass the 'RegistrationMetaDataDTO.RegistrationCategory' as [New/ Update/ Lost].  |
|**Main Service class and methods**| PacketHandlerService.handle(RegistrationDTO registrationDTO)|  
|**Input Parameter:**|  The RegistrationDTO object contains the RID, PRID, registration details of the individual and also contains the officer and supervisor details. This object has the following sub-classes: a. DemographicDTO - Details of the Demographic and Documents, b. BiometricDTO - Biometrics (Fingerprints, Irises, Face and Exception Face) of the individual, parent (or guardian), officer and supervisor, c.  RegistrationMetaDataDTO - Metadata related to registration and d. OSIDataDTO - Details of the officer and supervisor who had authenticated the registration.  |  
|**Auth:**| SessionContext is required for creating the packet |  
|**External Connectivity**| DB, File system |  
|**New Registration - Adult**| As part of New registration, individual's Demographic, documents[POI and POA] and bio-metric [fingerprint, iris and face] will be captured. If an exception of the bio-metrics is marked, then exception photo will be captured.| 
|**New Registration - Child**| As part of New registration, individual's Demographic, documents [POI, POA and POR] and anyone of parent's bio-metric [fingerprint/iris/face(if all fingerprint and iris are marked as exception)] along with that Parent's/Guardian's RID/UIN will be captured. If an exception is marked for the parent bio-metrics, an exception photo will be captured for the parent| 
|**UIN Update - Adult**| As part of UIN Update, individual's will have the option to select the field that would like to update. For Demographic update --> UIN number, Name, Document[only if Name/Address is selected then POI for name and POA for address is mandate], and anyone of the bio-metric will be captured as a mandatory values. For Bio-metric update --> UIN number, Name and Bio-metrics [fingerprint, iris and face] will be captured, if an exception marked then exception photo will be captured|
|**UIN Update-Child**| As part of UIN Update, individual's will have the option to select which one they are going to be update. For Demographic update --> UIN Number, Name,POR document along with that Parent/Guardian Name and UIN along with anyone parent bio-metric should be captured; if any exception marked then the exception photo of the Parent/Guardian will be captured.|
|**Lost UIN-Adult**| As part of Lost UIN, an individual's all Bio-metrics[fingerprints, iris, and face] will be mandatory to find the lost UIN.| 
|**Lost UIN-Child**| As part of Lost UIN, Parent/Guardian  Bio-metric will be mandatory to find the lost UIN of the child. if an exception marked then the exception photo of the parent/Guardian will be captured.| 

|**Functionality:**|  PACKET SYNC– Sync all the Approved/ Rejected/ Re-Register Approved packets before Uploading to server |   
|:------:|-----|  
|**Main Service class and method:**| PacketSyncServiceImpl.java - packetSync(List<PacketStatusDTO> packetsToBeSynced)|
|**Input Parameter:**|    packetsToBeSynced – The packet details which needs to be Synced. |  
|**Auth:**| Authentication token required. |  
|**External Connectivity:**| Packet Sync service REST call |  

     
|**Functionality:**| Packet Upload |   
|:------:|-----|  
|**Main Service class and method:**| PacketUploadService.pushPacket(File packet)|  
|**Input Parameter:**|	File object, which contains the packet to be uploaded.  |  
|**Auth:**| Authentication token required while doing file upload. Based on the SessionContext object the advice would attach the token and invoke the required service call. |  
|**External Connectivity:**| Service, DB, File system |  


|**Functionality:**| Packet Export |  
|:------:|-----|  
|**Main Service class and method:**| PacketExportService.getSyncedRecords() - to fetch the packet to be exported. updateRegistrationStatus(List<PacketStatusDTO> exportedPackets) - update the status once exported. |  
|**Input Parameter:**|	List of packet object. |  
|**Auth:**| No. |  
|**External Connectivity:**| DB, File system |  

|**Functionality:**|  Download Pre-Registration data during New Registration |   
|:------:|-----|  
|**Technical Detail:**|  The user provided pre-registration packet id related [demo/ doc] detail would be downloaded from Pre-registration DB using the respective REST service. After downloading the packet, the data would be mapped to the UI object and render the same to UI to display in the screen. |
|**Main Service class and method:**| PreRegistrationDataSyncServiceImpl.java - getPreRegistration(String preRegistrationId)|  
|**Input Parameter:**|    preRegistrationId- The pre reg id |  
|**Auth:**| Authentication token required while downloading the packets. Based on the SessionContext object the advice would attach the token and invoke the required service call. |  
|**External Connectivity:**| Pre Reg service REST call |  

|**Functionality:**|  EOD APPROVAL – Approve/Reject all the created packets |   
|:------:|-----|  
|**Main Service class and method:**| RegistrationApprovalServiceImpl.java - updateRegistration(String registrationID, String statusComments, String clientStatusCode)|
|**Input Parameter:**|    registrationID – The registration id of the packet that needs to be updated, statusComments - The comment status that needs to be updated for the given registration id of the packet, clientStatusCode - The status code that needs to be updated for the given registration id of the packet.|
|**Auth:**| NA |  
|**External Connectivity:**| DB |


|**Functionality:**| Sync Data from Server to Client and Vice Versa. |   
|:------:|-----|  
|**Technical Detail:**| This functionality will be executed as specified as sync-frequency in local DB. During start of the application, the scheduler would be loaded with the jobs configured in db and trigger the job. The scheduler would trigger the jobs at the configured frequency. While running the jobs, based on the functionality it would invoke the respective services and invoke the required external services to sync the data from server to client and vice versa. Post completion or every state of the job execution, the status would be updated in local db.|  
|**Main Service class and methods**|  JobConfigurationServiceImpl.executeAllJobs() - This would load all the active jobs [List of Jobs](#List-of-Jobs-) from the local db and trigger the jobs.|  
|**Input Parameter:**|  - |    
|**Auth:**| Auth token required for external services. This would be automatically taken care within this method. Nothing explicitly to be passed.|  
|**External Connectivity:**| REST API calls, DB|


|**Functionality:**|  MDM Integration – Register Device |   
|:------:|-----|  
|**Technical Detail:**| This method automatically scans all devices by connecting to the MDM service, which is running in a particular port and stores it in device registry. |
|**Main Service class and method:**| MosipBioDeviceManager - init()|  
|**Input Parameter:**|  No parameter needed.  |  
|**Auth:**| Not required |  
|**External Connectivity:**| deviceInfo - MDM service REST call |  


|**Functionality:**|  MDM Integration -Capture bio-metric |   
|:------:|-----|  
|**Main Service class and method:**| BioServiceImpl  - getFingerPrintImageAsDTOWithMdm(FingerprintDetailsDTO fpDetailsDTO, String fingerType) |  
|**Input Parameter:**|    FingerprintDetailsDTO – dto contains the finger print related details, fingerType – Type of the device like Fingerprint/ Iris/Face etc |  
|**Auth:**| Not required |  
|**External Connectivity:**| Capture - MDM service REST call |  


|**Functionality:**|  MDM Integration  - Validate bio-metric against the bio value already captured and stored in Database. |   
|:------:|-----|  
|**Main Service class and method:**| BioServiceImpl  - validateFingerPrint(String userId) - based on provided user Id the relevant bio information would be fetched from database and same would be validated against the bio data received from MDM service. |  
|**Input Parameter:**|   mosipBioDeviceManager – scan(String deviceType)|  
|**Auth:**| Not required |  
|**External Connectivity:**| DB, Capture - MDM service REST call |  


|**Functionality:**|  MDM Integration  - Display video stream |   
|:------:|-----|  
|**Main Service class and method:**| Yet to be implemented |  
|**Input Parameter:**|    |  
|**Auth:**| Not required |  
|**External Connectivity:**| |  


|**Functionality:**| TPM Public Key Sync |   
|:------:|-----|  
|**Technical Detail:**| This service will be executed during initial set-up of registration client application. This service gets the Public Part of the Key used for signing from the TPM. Uploads this public key along with the machine name to the server. This service returns the key index which will be used for Master Sync Service|  
|**Main Service class and method:**| TPMPublicKeySyncService.syncTPMPublicKey()|  
|**Input Parameter:**|  NA |  
|**Auth:**| TPM 2.0 is required for this service |  
|**External Connectivity:**| TPM, Web Service |


## Packet Structure :
   The packets are created during individual registration process are structured and secured. The detail of the same can be found in this link. 
   
   [Packet Structure](https://github.com/mosip/mosip-docs/wiki/Registration-Packet)   
   
## Packet Status :  

   List of packet status maintained in client db while moving the packet to the different state before and after pushing to the server.  


|**Packet Status Desc**|  **Status in Client** |   
|:------:|-----|  
|Once Packet Created| REGISTERED  |  
|Packet Approved|  APPROVED   |  
|'Re-Register' packet approved| RE_REGISTER_APPROVED  |
|Packet Rejected| REJECTED |  
|Packet IDs Synced with Server| SYNCED   |     
|Packet pushed to Server| PUSHED |     
|Packet exported to device| EXPORTED |     



|**Packet Status Desc**|  **Status from Server** |   
|:------:|-----|  
|Packet in processing state| PROCESSING   |  
|UIN generated for the packet|  PROCESSED    |  
|Unable to process the packet. | REREGISTER   |
|Failed while processing packet due to internal issue| RESEND  |  
|Packet is received but not uploaded in LANDING_ZONE| RECEIVED    |     
|Duplicate found in abis| REJECTED  |     
    

## List of Jobs :  

Below provided jobs are executed in batch mode through spring batch. The job execution frequencies are mentioned in the DB job related table. These jobs can also be triggered through manual process using 'Sync' option in the Menu, During initial login after successful online authentication and While starting the application if initial sync already completed.  

|**Sl.No:**|**Service Desc.**|**Dependent Module**|**Under 'Sync' Menu**| **Initial Login**| **Application Launch** | 
|------|-----|-----|-----|-----|-----|
| 1. | Pre-registration Data Sync			| Pre-reg | Y | N | N |
| 2. | Policy Sync							| Kernel  | Y | N | N |
| 3. | Registration Client Config Sync		| Kernel  | Y | Y | Y |
| 4. | Registration Packet Status Reader	| Reg-Proc| Y | N | N |
| 5. | User Detail/Role Setup Sync			| Kernel  | Y | Y | Y |
| 6. | Pre Registration Packet Deletion Job	| local job| N | N | N |
| 7. | Registration Packet Deletion Job		| Local Job| N | N | N |
| 8. | User Machine Mapping Sync  Job		| Kernel | Y | N | N |
| 9. | Audit Log Deletion Job				| Local Job| N |  N | N |
| 10. | Registration Packet Sync			| Reg-Proc| Y | N | N |
| 11. | Registration Packet Virus Scan		| Reg-Proc| N | N | N |
| 12. | Public key Sync service				| Kernel | Y | Y | Y |
| 13. | User Salt Sync service				| Kernel | Y | Y | Y | 
 

## Configuration Rule: 

As 'configurability' is the one of the major NFR being considered while designing the application, here listed out the required files where the configurations can be modified that will get reflected in application during runtime.  
  - 'registration-qa.properties' - Registration application specific configuration.  
  - 'application-qa.properties' - Overall application level common configuration.  
  
  These configuration would be downloaded to the client machine through the 'config' sync service.  If there is any change with respect to 'kernel' properties then after downloading the properties the application will ask for 'restart'. 
  
**Age configuration:**  
  - Age limit is configurable in the application. User should modify the max age limit in both 'application' and 'registration' properties file.      
  - {application property key : 'mosip.id.validation.identity.age'}    	
  - {registration property key : 'mosip.registration.max_age'}	


## Table Detail :

Below find the list of tables used in Registration client application. Based on use cases, the table data gets updated during either sync process or transaction in local machine.  
There are few jobs are configured to clean the transactions histories from local tables and also pushing the audit data to server.  

|**Sl. No**|**Table Name**| **Description** | **Source** |
|:------:|:------:|-----|-----|
|1.|biometric_attribute| It contains the list of biometric attribute description[left slap, right iris..] for each biometric type [Fingerprint, Iris, Photo] with respect to language code | sync from server master table | 
|2.|biometric_type | It contains the  list of biometric type[Fingerprint, Iris, Photo] while respect to language code | Sync from server master table | 
|3.|blacklisted_words| It contains the list of words which were not allowed during Registration process with respect to language code | Sync from server master table |
|4.|device_master| It contains master information related to device with respect to language code | Sync from server master table | 
|5.|device_spec|  It contains device specifications like brand, model with respect to language code | Sync from server master table | 
|6.|device_type| It contains types of devices[Fingerprint scanner, camera] and their description with respect to language code| Sync from server master table | 
|7.|doc_category| It contains list of document categories[Proof Of Address, Proof Of Identity...] which will be displayed in UI with respect to language code | Sync from server master table | 
|8.|doc_type| It contains list of document types that are allowed for uploading documents in Registration with respect to language code | Sync from server master table | 
|9.|gender| It contains list of gender types that are being used in Registration with respect to language code | Sync from server master table | 
|10.|id_type| It contains list of Id types [Registration Id, Pre Registration Id] that are being used in Registration with respect to language code | Sync from server master table | 
|11.|language| It contains list of languages that are being used in Registration | Sync from server master table |
|12.|location| It contains list of locations that are being used in Registration with respect to language code | Sync from server master table |
|13.|machine_master| It contains list of machine related data[mac address, serial number, machine name...] with respect to language code | Sync from server master table |
|14.|machine_spec| It contains list of machine specifications[brand, model...] with respect to language code | Sync from server master table |
|15.|machine_type|  It contains list of machine types[Desktop,Laptop...] with respect to language code | Sync from server master table |
|16.|reason_category| It contains list of reason categories[Client Rejection, Manual Adjudication...] with respect to language code | Sync from server master table |
|17.|reason_list| It contains list of reasons [Invalid Address, Gender-Photo Mismatch...] that are listed during Registration Approval/Rejection with respect to language code |  Sync from server master table |
|18.|registration_center| It contains list of Registration center ids with respect to language code | Sync from server master table |
|19.|reg_center_device| It contains list of Registration center ids with respect to language code | Sync from server master table |
|20.|reg_center_machine| It contains list of machine ids which are mapped to corresponding center id | Sync from server master table |
|21.|reg_center_machine_device| It is mapping table of center, machine and device | Sync from server master table.|
|22.|reg_center_type| It contains list of center types with respect to language code | Sync from server master table |
|23.|reg_center_user| It contains list of user ids that are mapped to corresponding center id | Sync from server master table |
|24.|reg_center_user_machine| It is a mapping table for center, user and machine |  During Onboarding process |
|25.|template| It contains list of Templates that will be displayed during Registration with respect to language code |Sync from server master table |
|26.|template_type| It contains list of template types[email template, sms template..] with respect to language code |Sync from server master table |
|27.|title| It contains list of Titles[Mr, Mrs..] with respect to language code | Sync from server master table |
|28.|valid_document| It contains list of valid documents allowed for Registration with respect to language code |Sync from server master table |
|29.|sync_job_def| It contains list of Job details[Master Sync, User Detail Sync..] that are required for sync | Sync from server master table |
|30.|screen_authorization| It contains list of Screen Ids which are required for accessing features[New Registration, EOD..] with respect to roles | Sync from server master table |
|31.|role_list| It contains list of roles[Registration Officer, Registration Supervisor..] referred in Registration | Sync from server master table |
|32.|process_list| It contains list of process[login, eod..] happen during registration | Sync from server master table | 
|33.|app_authentication_method| It contains list if authentication methods[PWD, OTP..] with respect to roles and process[login, eod..] | Sync from server master table |
|34.|app_detail| It contains list of application details[Pre-Registration, Registration Client] with respect to language code | Sync from server master table |
|35.|app_role_priority| It contains list of role priority details with respect to Process[login, eod..] and roles | Sync from server master table |
|36.|GLOBAL_PARAM| It contains list of Configuration related  details used in Registration application. | Sync from server configuration [registration.properties, application.properties] |
|37.|user_detail| It contains list of User details[id,name, email..] | Sync from server master table |
|38.|user_pwd| It contains User Password details | Sync from server master table |
|39.|user_role| It contains data of roles which were mapped to the user |Sync from server master table |
|40.|user_biometric| It contains User biometrics[Fingerprint, Iris..] details[minutia, biometric type..] | During Onboarding Process |
|41.|key_store| It contains Mosip Public key , Packet creation key | During Public key Sync and Policy sync |
|42.|sync_control| It contains information about the jobs which are executed successfully along with its last time stamp | During Manual Sync and Scheduled Jobs |
|43.|sync_transaction| It contains data about all sync transactions | During Manual Sync and Scheduled Jobs |  
|44.|registration| It contains data about Registration Packet[Registration Id, Status..] | During Registration process |
|45.|registration_transaction| It contains data of all transactions during registration process  | During Registration process | 
|46.|pre_registration_list| It contains list of Pre Registration details[Pre Registration Id, Status..] | During Pre Registration Sync |
|47.|audit_log_control| It contains data of Audit logging[From Time, To Time..] | During local transaction. | 

## UI - Labels and messages :  
   The UI specific labels and messages are maintained in the language specific property file. Based on the primary and secondary language the respective bundle would be loaded during runtime and displayed in the screen. 
   
   messages_en.properties	- Messages are in English language.   
   messages_ar.properties   - Messages are in Arabic language.  
   messages_fr.properties   - Messages are in French language.  
   labels_en.properties     - Labels are in English language.  
   labels_ar.properties     - Labels are in Arabic language.  
   labels_fn.properties     - Labels are in French language.

## Error code and Description :

Below find the list of error code and description which are thrown from application during the process.  

|**Class Name**| **Error Codes** | **Description**|
|:------:|-----|-----|
|GPSFacade						|REG-LGE-002	|GPS signal is weak please capture again												|
|SyncStatusValidatorService		|REG-ICS-006	|GPS signal is weak please capture again												|
|SyncStatusValidatorService		|REG-ICS-005		|GPS device not found. Please connect an on-boarded GPS device.|
|SyncStatusValidatorService		|REG-ICS-005		|Please connect the GPS Device														|
|SyncStatusValidatorService		|REG-ICS-004		|Please insert the GPS device in the Specified Port									|
|RegistrationApprovalController	|LGN-UI-SHE		|IO Exception																		|
|PacketSynchService				|REG-PSS		|Unable to Sync Packets to the server												|
|PacketUploadService			|REG-PUS		|Unable to Push Packets to the server												|
|BioService						|IRC-IFC		|Exception while scanning iris of the individual										|
|BioService						|FPC-FCS		|Exception while scanning fingerprints of the individual								|
|RestClientAuthAdvice			|REG-RCA		|Exception while adding authorization token to web-service request					|
|TPMUtil						|TPM-UTL-001	|Exception while signing the data using TPM											|
|TPMUtil						|TPM-UTL-002	|Exception while validating the signature provided by TPM							|
|TPMUtil						|TPM-UTL-003	|Exception while encrypting the data using asymmetric crypto-algorithm through TPM	|
|TPMUtil						|TPM-UTL-004	|Exception while encrypting the data using asymmetric crypto-algorithm through TPM	|
|TPMUtil						|TPM-UTL-005	|Exception while getting the public part of the TPM signing key						|
|TPMUtil						|TPM-UTL-006	|Exception while getting the TPM instance											|
|TPMUtil						|TPM-UTL-007	|Exception while closing the TPM instance											|	
|TPMUtil						|TPM-INT-001	|Exception while closing the TPM instance											|
|RegIdObjectValidator			|REG-IOS-001	|Invalid ID Object Schema															|
|RegIdObjectValidator			|REG-IOS-002	|Invalid ID Object Pattern															|
|RegIdObjectValidator			|REG-IOS-003	|Invalid Master Data Object Pattern													|
|RestClientAuthAdvice			|REG-RCA-001	|Generic Exception reported by server, while invoking web-service.    							|
|RestClientAuthAdvice			|REG-RCA-002	|Exception while generating the signature of request body							|
|RestClientAuthAdvice			|REG-SDU-004	|Response header received from the web-service is not as expected					|	
|DemographicDetailController            |KER-IDV-102    |PRID should not contain any sequential and repeated block of number for 2 or more than two digits 
|UpdateUINController                    |KER-IDV-203    |UIN length should be as per configured digit.
|RegistrationController                 |KER-TRL-002    |Language code not supported 
|DemographicDetailController            |KER-IDV-103    | PRID length should be as configured digit  
|RestClientUtil            |RPR-PKR-009    | Packet HashSequence did not match             