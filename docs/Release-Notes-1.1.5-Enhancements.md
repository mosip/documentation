This document contains the features that were developed or enhanced as part of MOSIP 1.1.5 release.

# Commons
* Web Sub Upgrade 
    * WebSub messages are now being persisted in database.
    * Web sub notifications are handled after the restarts, so that, the subscriber should continue to receive the messages even after restarts.
* New script are created to handle the deployment of master dml data that convert the excel file to CSV format on the fly and upload the data.
* JCE (Java Cryptography Extension) integration in keymanager service is done in order for HSM to work with the FIPS 140-2 mode and also implement standard encryption algorithm and key generation.
* Track of all the audit trails for events executed in various modules in MOSIP.

# ID Authentication
* We are now sending certificate thumbprint in e-kyc response for handling key rotation.
* We are now handled the failed request in credential modules with a new API to retrigger a failed record.
* The biometric extractor service is now removed, and the logic for bio-extraction for different formats and different SDK HTTP URLs is merged into ID repository identity service.
* We have now implemented retry mechanism for credential store with batch job when there is an error occurring in retrieving/storing credential data.
* We have now included retry logic in REST API calls and keymanager encryption/decryption in IDA and ID Repository.
* We are now capturing authentication transaction history for authentication transactions with validation failures (example - invalid UIN or VID).

# Partner Management
* We have now introduced a new search API in partner management system for fields such as policy, policy group, partner, partner type etc.
* We have now merged all partner services by having separate grouping of poilcy related and partner related micro service.
* We have updated the policy approval flow to enabale auto approval mechanism for subsequent API key request from same partner.
* We have depricated the device register and deregister APIs as from now onwards we would be performing trust validation.

# Resident Service
* We are now able to identify and send the best two fingers to print partner.
* We have added certificate thumbprint in resident service as part of authentication API request and send it to ID Authentication.
* The Resident services now has a new generate OTP API instead of generating OTP via ID Authentication OTP request API.

# Registration Processor
* We have now included expiry in vertx and kafka event bus messages.
* We have now included Packet tagging based on specific criteria such as age group, gender, resident type, biometrics exception scenarios and also route the packets to various workflows based on tags.
* We have moved away from one minio bucket for each packet to single bucket for all packets in minio and have one folder and corresponding files for each RID (this is a  performance fix for Registration Processor).
* We have now replaced the spring cache type with the hazelcast in-memory caching mechanism provided by the spring boot.
* We now have expiry time configured for any message sent in for ABIS queue and manual adjudication queue. Once the message has exceeded the expiry time then the packet is marked for reprocessing.
* Packet manager in registration processor is now able to retrieve the data based on the priority set in a policy defined by the stage.
* Upgraded manual verification stage in MOSIP to take a decision based on the results from manual verification system (reject or process the packet).

# Registration Client
* We have now enabled forgot password and reset password functionality in registration client through integrated IAM.
* We now store only operator's biometrics templates or extracts in registration client (not the images) for local authentication after onboarding of the operators.
* We now support regex validations for primary and secondary languages for simple type attributes.
* We now perform JWT verification of header and signature before accepting the payload data from MDS.
* Registration client now performs the trust validation of the devices by verifying whether the digital id block and the data block are actually signed by a MOSIP verified device provider. Hence, storing device details in master database or device registration is not requiered for device validation.
* Tracing of requests and event messages in registration processor stages with all logs in place.
* We now handle deactivation or activation scenarios in registration client for user, machine and center.

# Pre Registration
* We have added a proxy layer between the pre-registration UI and master data API. All the calls are happening via. the pre-registration service.
* We have removed keycloak integration for storing pre-registration user sessions. Pre-registration sessions are now created in pre-registration database.
* Pre-registration now has its own OTP transaction table & service to perform OTP authentication.
* Encryption of pre-registration data before storing in database was done using the root key for registaration (ApplicationID=REGISTRATION, ReferenceID=""), now the encryption is performed using the keys generated from pre-registration root key (ApplicationID=PRE_REGISTRATION, ReferenceID=INDIVIDUAL).
* Support for encryption using preprend thumbprint has been added.
* Gender and resident status attributes are now treated as dynamic fields in pre-registration.
* We have added pagination option in the UI and API for list of registration centers.
* We have now added new control types such as buttons to the UI specification.
* We are now able to make the field required or not by giving required condition in UI spec.
* Support for document number has been added during document capture.
* Pre-registration UI specification now supports multiple location hierarchy for present address, temporary address or place of birth.
* We are now handling applicant type field dynamically using mvel expression.
* We have now added visibility condition in pre reg UI spec for showing or hiding the UI fields.
 
# Biometrics
* Reporting mechanism has been incorporated into SDK test kit
