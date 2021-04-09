This document contains the features that were developed or enhanced as part of MOSIP 1.1.5 release.

# Commons
* Web Sub Upgrade 
	* Persistence of web sub messages is handled in database whenever a subscriber is down or unavailable and is not able to receive the 	messages due to lack of persistence.
	* Web sub notifications are handled after the restarts so that the subscriber should continue to receive the messages
	
* New script are created to handle the deployment of master dml data that convert the excel file to CSV format on the fly and upload the data.
* JCE (Java Cryptography Extension) integration in keymanager service is done in order for HSM to work with the FIPS 140-2 mode and also implement standard encryption algorithm and key generation.
* Track of all the Audit Trails for events executed in various modules in MOSIP

# ID Authentication
* We have now added Certificate thumbprint has in ekyc response originating from ID Auth for encryption/decryption.
* We have now integrated Bio-SDK in ID Repo to store the bio metric extracts instead of image.
* We have now handled the failed Request in Credential modules with a new API to retrigger the failed record
* The Bio Extractor is now removed, and the logic for bio-extraction for different formats and different SDK HTTP urls are applied in ID Repo.
* Implemented retry mechanism for event handling when we fetch data from Authentication.
* We have now handled bulk credential issuance of UIN through parallel processing of records in batch job.

# Partner Management
* We have now introduced a new search API in partner management system for fields such as policy, policy group, partner, partner type etc
* We have now merged all partner services by having separate grouping of poilcy related and partner related micro service
* We have updated the policy approval flow to enabale auto approval mechanism for subsequent API key request from same partner

# Resident Service
* We are now able to identify and send the best two fingers to print partner
* We have added certificate thumbprint in resident service as part of authentication API request and send it to ID Auth.
* The Resident services now has a new generate OTP api instead of generating otp via IDA.

# Registration Processor
* We have now included expiry in kafka event bus messages.
* We have now included Packet tagging based on specific criteria such as age group,Gender,Resident type, biometrics exception scenarios and also route the packets to various workflows based on tags.
* We have moved away from one minio bucket for each packet to single bucket for all packets in minio and have one folder and corresponding files for each RID,the performance fix for this activity is also done.
* Documented the audit event list for each stage in Registration Processor
* We have now replaced the spring cache type with the Hazelcast in-memory caching mechanism provided by the spring boot.
* We now have expiry time configured for any message sent in for ABIS Queue and Manual Adjudication Queue.Once the message has exceeded the expiry time then the packet is marked for reprocessing.
* The registration processor is now able to retrieve the data based on the priority set in a policy defined by the stage. 
* Upgraded Manual Adjudication in MOSIP so now the MA stage is now able to take a decision based on the results from MA System (Reject or Process the packet)

# Registration Client
* We have now enabled Forgot Password and Reset Password functionality in Registration client through integrated IAM.
* We now store only operator's biometrics templates or extracts in registration client (not the images) for local authentication after onboarding of the operators.
* We now support Regex validations for primary and secondary languages for simple type attributes
* We now perform JWT verification of header and signature before accepting the payload data from MDS.
* Registration client now performs the trust validation of the devices by verifying whether the digital id block and the data block are actually signed by a MOSIP verified Device Provider.
* Tracing of requests and event messages in registration processor stages with all logs in place.
* We now handle Deactivation/Re-Activation Scenarios in Registration Client for User, Machine and Device

# Pre Registration
* We now support Gender and Resident Status as dynamic fields in Pre Reg Demographic data capture
* We have added pagination option in the UI and API for list of registration centers.
* We have now added new control types such as buttons to the UI spec.
* We are now able to make the field required or not by giving required condition in UI spec.
* Support for document number has been added during document capture.
* The Pre Reg ID schema and UI now supports multiple location hierarchy for present address,temporary address or place of birth.
* We are now handling applicant type field dynamically using mvel expression.
* We have now added visibility condition in pre reg UI spec for showing or hiding the UI fields.
 
# Biometrics
* Reporting mechanism has been incorporated into SDK test kit