# Release 1.2.0.1 - Enhancements and Bug Fixes 

## ID Authentication

### Enhancements: ###

1. Handled the decryption failures occuring in ID Repo. In ``credential_transaction``, if decryption fails for      request column, then unencrypted format should be retrieved.
  
   Refer [Credential Request Service](https://mosip.atlassian.net/browse/MOSIP-23190).

2.  There is no dependency on Credential Request Status table. UIN table is connected with service to retrieve data related to UIN and its associated VID.
  
     Refer [Credential Feeder](https://mosip.atlassian.net/browse/MOSIP-23189).

 ### Bug Fixes: ###

1. Enabled logging query parameter for biosdk service. Logging process helps in tracking the extraction process carried 
     out by biosdk services.
   
    Refer [Enable query params in the access logs of biosdk service](https://mosip.atlassian.net/browse/MOSIP-29421).

## ID Repository ##

### Bug Fixes: ###

1. In credential service, when idvid API is called to retrieve demographic and biometric data, proof documents is also shared as response and thus affecting the performance time of the service.

   As a part of improving the performance, ``mosip.credential.service.fetch-identity.type``, property is included in the config file with the default value **all**. Through this parameter, the data shared by idvid API response is restricted.

   Refer [Avoid receiving of proof documents from idvid response to improve credential processing response time](https://mosip.atlassian.net/browse/MOSIP-29458).

2. As a part pf performance improvement, null value is not cached in ``uin_hash_salt`` and ``uin_encrypt_salt`` tables.

   Refer [Cache the salt tables in vid service to improve performance](https://mosip.atlassian.net/browse/MOSIP-30221).

3. During updating of packet processing, even if data was not updated in ID Repo, UIN was generated. After the fix,  packet  update is processing as expected and the modified data is correctly updated in ID Repo.

   Refer [Data Mismatch issue with updating the invalid idrepo data](https://mosip.atlassian.net/browse/MOSIP-28436).

4. Valid response was not sent for  APIs, ``AuthInternalLock`` and ``AuthInternalUnlock``. After the fix, upon provoking APIs, ``AuthInternalLock`` and ``AuthInternalUnlock``, valid responses are sent.

   Refer [Not getting valid response for AuthInternalLock and AuthInternalUnlock apis in idrepo and IDA](https://mosip.atlassian.net/browse/MOSIP-28075).

5. APIs were processing request with previously requested date instead of notifying such request as error. After the fix, APIs are behaving as expected for the past, present and future requested dates.

   Refer [Getting successful response on providing past timestamp in request body for few apis in idrepo](https://mosip.atlassian.net/browse/MOSIP-28074).

## Registration Processor ##

### Enhancements: ###

1. Reprocess can now accommodate reprocessing the packets from desired stage. Based on the configuration, when a packet is marked as 're-process', registration processor will re-process the packet instead of re-processing from the current stage.

   Refer [Enabling the configuration of the reprocessing process to restart the process from the desired stage](https://mosip.atlassian.net/browse/MOSIP-29935).

2. Included the name of the resident / recipient in all email notifications.

   Refer ["Name" is not coming in the email notification's.](https://mosip.atlassian.net/browse/MOSIP-28185).

3. Upgraded the system and streamlined the credential issuance process to ensure smooth communication between the Credential Requestor Stage and the credential issuance module while adhering to specific policies for data sharing and notification updates.

   In this implementation, the printing stage is renamed to credential issuance stage.

   Refer [Removal of CRVS stage & Rename - Print Stage to Credential Requestor Stage](https://mosip.atlassian.net/browse/MOSIP-28121).

### Bug Fixes: ###

1. With **Update UIN**, data was not getting updated with the blank value. After the fix, to update the non-mandatory value, user can provide a space in the non-mandatory field so that data entered previously  gets updated with null value.

   Refer [Update UIN flow with blank value in non mandatory field value not getting updated to blank in IDRepo](https://mosip.atlassian.net/browse/MOSIP-29862).

2. Unable to generate report based on the registration date as ``pkt_cr_dtimes`` is null. After the fix, enabled the system to update ``pkt_cr_dtimes``. User can now generate report based on the registration date.

   Refer [Unable to generate report based on registration date - pkt_cr_dtimes is not getting populated](https://mosip.atlassian.net/browse/MOSIP-29895).

3. In certain scenarios, when the admin processes the second packet manually due to some failures in first packet and when the first also gets reprocessed, two UINs were generated for the same individual. After this fix, after re-processing the packets, packets are marked with specific status and one UIN is generated.

   Refer [Two UINs were created for one person when one of the records was manually reprocessed](https://mosip.atlassian.net/browse/MOSIP-26697).

4. Although kernel salt generator job status displays as completed, due to the exception occured during the job, executes related table displayed empty value. After the fix, user can now know if there is an exception occuring while the job is executed.

   Refer [Kernel salt generator job status shows as completed with success even though job is internally failed](https://mosip.atlassian.net/browse/MOSIP-28212).

5. Application displayed error while utilizing the DataShare Policy due to the naming convention of the partner. After the fix,  the naming convention is modified to accommodate both uppercase and lower case characters.

   Refer [DataShare: Getting error when TypeOfShare is Data Share for policy id: mpolicy-default-PDFCard](https://mosip.atlassian.net/browse/MOSIP-28155).

6. Mismatch in Kibana dashboard due to the infrastructure setup of Debezium connector. After the fix,  the parameter, ``slot.drop.on.stop``is set to **false**.

   Refer [Reporting: Registration count mismatch in Kibana dashboard compare to database](https://mosip.atlassian.net/browse/MOSIP-27172)

7. During processing the packet, in bio-deduplication stage, the new packet was compared against the failed lost packets which may cause the new packet to be rejected. After this fix, the status of the failed lost packets is updated to **Rejected** instead of **Failed**.

   Refer [Bio deduplication stage is always comparing against FAILED Lost Packets](https://mosip.atlassian.net/browse/MOSIP-27069).

8. When packet moves to manual verification before even getting response from manual verification system, after some time re-processor picks up the same record and moves to UIN generator stage because latest transaction status code was success.

   Refer [Manual Verification record pick by re-processor](https://mosip.atlassian.net/browse/MOSIP-27066).

9. This issue occured due to stage-group-3 and activemq connectivity. After the fix, added retry mechanism.

   Refer [Packets are stuck at BIOGRAPHIC_VERIFICATION stage with status comment ‘Biometric Deduplication In-Progress'](https://mosip.atlassian.net/browse/MOSIP-23025).

## Credential Issuance ##

### Enhancements: ###

   1. Sharing VID is shared as one of the printable credentials in the digital card service.
  
      Refer [Verify feature 'Add support to share VID in credential-service' in 1.2.0.1 version](https://mosip.atlassian.net/browse/MOSIP-23420).

## Registration Client ##

### Bug Fixes: ###

 1. Enabled to configure scanner device type. Included new configuration parameter, ``mosip.registration.imagingDeviceType``.
  
    Refer [RegClient - No properties available to define Scanner DeviceType](https://mosip.atlassian.net/browse/MOSIP-22171).

  2. Error occurs due to invalid BIR images not sent during local de-duplication. After the fix, modified BIR structure to store operator biometrics in registration client.

     Refer [Invalid BIR images sent to Thales SDK during local deduplication in reg-client](https://mosip.atlassian.net/browse/MOSIP-25687).

3. Application currently displays both MDS and SDK quality scores in the Biometrics screen in registration client UI.

   Refer [Reg client - With the Bio SDK overriding the MDS quality score, what is displayed on the biometric capture screen is the MDS score instead of the SDK score](https://mosip.atlassian.net/browse/MOSIP-26665).

4. After this fix, the biometrics of operator is deleted if the operator is deleted or de-activated in the system.

   Refer [Transparency of Local Biometrics Storage](https://mosip.atlassian.net/browse/MOSIP-29676).

5. When a module  subscribes to websub, the hub secret was logged in plain text. After this fix,  When a module  subscribes to websub, the hub secret is correctly logged.

   Refer [Hub secret is getting logged in plain text in websub logs during the subscription](https://mosip.atlassian.net/browse/MOSIP-24522).

  ## Administration Portal ##

  ### Bug Fixes: ###

  1. Protocol is now included in the DataShare policy to be used while creating the DataShare URL. Default protocol is as http.

     Refer [protocol change logic is not proper in datashare code](https://mosip.atlassian.net/browse/MOSIP-29662).

2. Error occurred when user attempts to change the language in the single sign in. After this fix, user should be able to switch to other language in the single sign in.

   Refer [when uploading location table with langcode as "ara" in english login screen displayed exception](https://mosip.atlassian.net/browse/MOSIP-23552).

 ## Partner Management System (PMS) ##

  ### Bug Fixes: ### 

  1. When MISP partner registers through Partner Management Portal the partner is not required to be mapped a policy. After this fix, MISP partner will not be mapped to a policy.

     Refer [MISP partner expecting policy group while registering](https://mosip.atlassian.net/browse/MOSIP-30402).

  ## Pre-Registration ##

  ### Bug Fixes: ### 

  1. While user utilizes pre-registration to register, occasionally, exception proof documents is requested as mandatory . 
     After this proof documents are not mandatory.

     Refer [Exeception proof documents are asked mandatory for specific demographic details](https://mosip.atlassian.net/browse/MOSIP-24358).

2. Once the registration client fetches the data of the application from pre-registration, the application status was updated to **cancelled** instead of **pre fetched**. After this fix, the application status is updated to **pre fetched** as expected.

## Common ##

### Bug Fixes: ### 

1. [XLS files with , in the text gets corrupt when converted to csv](https://mosip.atlassian.net/browse/MOSIP-24393).

2. [Commons is refering to auth-adapter and keymanager from properties and profiles](https://mosip.atlassian.net/browse/MOSIP-30716).
