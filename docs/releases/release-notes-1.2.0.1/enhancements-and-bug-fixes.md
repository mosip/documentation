# Enhancements and Bug Fixes

## ID Authentication

### Enhancements:

1. Handled the decryption failures occuring in ID Reposotory. In `credential_transaction`, if decryption fails for request column, then unencrypted format should be retrieved. #MOSIP-23190
2. There is no dependency on Credential Request Status table. UIN table is connected with service to retrieve data related to UIN and its associated VID. #MOSIP-23189

### Bug Fixes:

1. Enabled logging query parameter for biosdk service. Logging process helps in tracking the extraction process carried out by biosdk services. #MOSIP-29421
2. During authentication, number of attempts to enter OTP was not restricted. This could result in many number of attempts. During this fix, number of attempts to enter OTP has been restricted. #MOSIP-31314

## ID Repository

### Bug Fixes:

1. In credential service, when idvid API is called to retrieve demographic and biometric data, proof documents is also shared as response and thus affecting the performance time of the service. As a part of improving the performance, `mosip.credential.service.fetch-identity.type`, property is included in the config file with the default value **all**. Through this parameter, the data shared by idvid API response is restricted. #MOSIP-29458
2. As a part of performance improvement, null value is not cached in `uin_hash_salt` and `uin_encrypt_salt` tables. #MOSIP-30221
3. During updating of packet processing, even if data was not updated in ID Repo, UIN was generated. After the fix, packet update is processing as expected and the modified data is correctly updated in ID Repository. #MOSIP-28436
4. Valid response was not sent for APIs, `AuthInternalLock` and `AuthInternalUnlock`. After the fix, upon provoking APIs, `AuthInternalLock` and `AuthInternalUnlock`, valid responses are sent. #MOSIP-28075
5. APIs were processing request with previously requested date instead of notifying such request as error. After the fix, APIs are behaving as expected for the past, present and future requested dates. #MOSIP-28074

## Registration Processor

### Enhancements:

1. Reprocess can now accommodate reprocessing the packets from desired stage. Based on the configuration, when a packet is marked as `reprocess`, registration processor will re-process the packet instead of re-processing from the current stage. #MOSIP-29935
2. Included the name of the resident / recipient in all email notifications of Pre-Registration module. #MOSIP-30200
3. Upgraded the system and streamlined the credential issuance process to ensure smooth communication between the Credential Requestor Stage and the Credential Issuance module while adhering to specific policies for data sharing and notification updates. In this implementation, the printing stage is renamed to credential issuance stage. #MOSIP-28121

### Bug Fixes:

1. In **Update UIN**, data was not updated with the blank value for non mandatory field. After the fix, to update the non-mandatory field, user can provide a space so that data entered previously gets updated with null value. #MOSIP-29862
2. Unable to generate report based on the registration date as value,`pkt_cr_dtimes` in the table, `registration` is null. After the fix, enabled the system to update `pkt_cr_dtimes`. User can now generate report based on the registration date. #MOSIP-29895
3. In certain scenarios, when the admin processes the second packet manually due to some failures in first packet and when the first also gets reprocessed, two UINs were generated for the same individual. After this fix, upon re-processing the packets, they are marked with specific status and one UIN is generated. #MOSIP-26697
4. Although kernel salt generator job status displays as completed, due to the exception occured during the job execution, related table displayed empty value. After the fix, user is notified if there is an exception occuring while the job is executed. #MOSIP-28212
5. Application displayed error while utilizing the DataShare Policy due to the naming convention of the partner. After the fix, the naming convention is modified to accommodate both uppercase and lower case characters. #MOSIP-28155
6. Mismatch in Kibana dashboard due to the infrastructure setup of Debezium connector. After the fix, the parameter, `slot.drop.on.stop`is set to **false**. #MOSIP-27172
7. While processing the packet, in bio-deduplication stage, the new packet was compared against the failed lost packets which may cause the new packet to be rejected. With resolution, the status of the failed lost packets is updated to **Rejected** instead of **Failed**. #MOSIP-27069
8. Packet moves to manual verification before getting response from manual verification system, after some time re-processor picks up the same record and moves to UIN generator stage because latest transaction status code displayed as **success**. #MOSIP-27066
9. This issue occurred due to stage-group-3 and activemq connectivity. After the fix, added retry mechanism. #MOSIP-23025

## Credential Issuance

### Enhancements:

1. Enabling VID can be shared as one of the printable credentials in the digital card service. #MOSIP-23420

## Registration Client

### Bug Fixes:

1. User could not define Scanner device type. After the fix, upon including new configuration parameter, `mosip.registration.imagingDeviceType`, user can configure scanner device type. #MOSIP-22171
2. Error occured due to invalid BIR images not sent during local de-duplication. After the fix, modified BIR structure to store operator biometrics in registration client. #MOSIP-25687
3. Application currently displays both MDS and SDK quality scores in the Biometrics screen in registration client UI. #MOSIP-26665
4. Even if Operator is de-activated in the system, Operator credentials were not disabled. After this fix, upon deletion or de-activation of operator credentials, the biometrics of operator is deleted in the system. #MOSIP-29676
5. When a module subscribes to websub, the hub secret was logged in plain text. After the fix, upon logging, hub secret is encrypted. #MOSIP-24522

## Websub

### Bug Fix:

1. When a module subscribes to websub, the hub secret was logged in plain text. After the fix, upon logging, hub secret is encrypted. #MOSIP-24522

## Administration Portal

### Bug Fixes:

1. Protocol is now included in the DataShare policy to be used while creating the DataShare URL. Default protocol is as http. #MOSIP-29662
2. Error occurred when user attempts to change the language in the single sign in. After this fix, user should be able to switch to other language in the single sign in. #MOSIP-23552

## Partner Management System (PMS)

### Bug Fixes:

1. When MISP partner registers through Partner Management Portal, the partner is not required to be mapped a policy. After this fix, MISP partner will not be mapped to a policy. #MOSIP-23552

## Pre-Registration

### Bug Fixes:

1. In module, **Pre-Registration**, when user attempts to register, for some cases, user has to mandatorily furnish exception proof documents. After this fix, user is not required to submit documents as mandatory. #MOSIP-24358
2. Once the registration client fetches the data of the application from pre-registration, the application status was updated to **cancelled** instead of **pre fetched**. After this fix, the application status is updated to **pre fetched** as expected. #MOSIP-24650
