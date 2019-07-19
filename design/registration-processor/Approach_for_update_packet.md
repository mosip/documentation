# Approach for Update packets

**Background**

The applicant can update demographic and/or biometric information after they received UIN card. Registration-processor will received update requests from reg-client or resident portal and will process update packets.

The target users are -
The registration client.
External system integrator.
Residence service portal to integrate with registration-processor.

The key requirements are -
1. Process update packets from reg-client.
2. Process update packets from resident portal.
3. Update demographic information.
4. Update biometric information.
5. Send notification to resident.
6. Send new UIN card to resident address with updated information.


The key non-functional requirements are
1.	Auditing of the all the transactions including success and failed scenario:
2.	Logging of the all the requests
3.	Exception handling


**Solution**

The update request will come from reg-client and resident portal. The update packet will go through below stages. The stages will be different in case of reg-client and resident portal request. The reg-client update flow will be called "UPDATE" and resident portal update flow will be called "RES_UPDATE" in the document. The changes in each stage has been explained later.
```
	Reg-Client "UPDATE" packets will go through below stages -
		1. registration-processor-packet-receiver-stage
		2. registration-processor-packet-uploader-stage
		3. registration-processor-packet-validator-stage
		4. registration-processor-osi-validator-stage
		5. registration-processor-biometric-authentication-stage
		6. registration-processor-demo-dedupe-stage
		7. registration-processor-bio-dedupe-stage
		8. registration-processor-uin-update-stage
		9. registration-processor-extractor-stage
		10. registration-processor-message-sender-stage
		11. registration-processor-printing-stage
```
```
	Resident portal "RES_UPDATE" packets will go through below stages -
		1. registration-processor-packet-receiver-stage
		2. registration-processor-packet-uploader-stage
		3. registration-processor-packet-validator-stage
		4. registration-processor-biometric-authentication-stage
		5. registration-processor-demo-dedupe-stage
		6. registration-processor-uin-update-stage
		7. registration-processor-extractor-stage
		8. registration-processor-message-sender-stage
		9. registration-processor-printing-stage
```

#### registration-processor-packet-receiver-stage
Before uploading packets the data will be synced by calling [SYNC](https://github.com/mosip/mosip/wiki/Registration-Processor-APIs#2-registration-status-service) api. The RID along with RegistrationType "UPDATE" or "RES_UPDATE" will be present in sync table. When packet-receiver accepts the packet then it will check the registrationType in sync table. There are two different camel routes present for "UPDATE" and "RES_UPDATE". The packet-receiver will send message to below address -
1. Camel address "packet-receiver-update-bus-out" : the packet receiver will send message in this address for packets received from reg-client.
2. Camel address "packet-receiver-res-update-bus-out" : the packet receiver will send message in this address for packets received from resident portal.

#### registration-processor-packet-uploader-stage
There will be no change in this stage for update flow.

#### registration-processor-packet-validator-stage
Below validations will be done in this stage -
1. ID Schema Validation for the ID JSON : No additional change for update.
2. File Validation on the Packet : No additional change for update.
3. CheckSum Validation on the Packet : No additional change for update.
4. Master Data Validation on the data received in ID JSON : No additional change for update.
5. UIN check : If registrationType is UPDATE or RES_UPDATE then Check if UIN of the Resident received in ID JSON is available in ID Repository. Fail the validation if UIN is not found.
#### registration-processor-osi-validator-stage
This stage is applicable only for packets received from reg-client. For "RES_UPDATE" camel route this stage will not be present. There is an utility which will fetch date of birth of applicant to identify child or adult. It will check in id json and if dob is not present then it will try to fetch dob from idrepo. The introducer validation will happen for update packet as well. No additional changes required.
#### registration-processor-biometric-authentication-stage
This stage will check if the authentication cbeff file is present in packet meta info json. If present then authenticate the applicant and if not present then skip the validation. This is because for biometric update there would be no authentication required. bio-dedupe-stage will handle it.

#### registration-processor-demo-dedupe-stage
1. Fetch the ID Object from the Packet
2. Render the ID Object and find the fields to be updated.
3. Check if the fields to be updated has any of the fields used for Demo Deduplication (i.e. Name, Date of Birth or Gender).
4. If Yes : Only one or two fields are getting updated, fetch the rest of the fields from ID Repository. Example: If Name is getting updated then get Date of Birth and Gender from ID Repository.
5. If all the fields are getting updated then fetch all the fields from ID Object.
6. If No : then move to the next stage as configured in Camel.
#### registration-processor-bio-dedupe-stage
This stage is applicable only for "UPDATE" packets coming from reg-client.
1. If Applicant Biometric CBEFF is present in Packet, perform Biometric Deduplication
2. After Biometric Deduplication, if we find the below information,
	1. No match is found, Bio-Deduplication Passes.
	2. One or more Ref IDs matches are found, fetch the UINs for the RIDs against which match is found (using ID Repository API).
5. Pass the validation : If the UINs are same as the UIN captured in the ID JSON received in Packet.
6. Fail the validation : If the UINs are not the same as the UIN captured in the ID JSON received in Packet.
7. Send event to camel for further processing.

#### registration-processor-uin-updator-stage
Call idrepo update api and update the uin. After successful response from idrepo send event to camel for further processing.

#### registration-processor-extractor-stage
No additional changes for update flow. Please refer to extractor-stage design for more info.

#### registration-processor-message-sender-stage
Retrieve the correct template for update packet and send email/sms to applicant as configured.

#### registration-processor-printing-stage
No additional changes for update flow.

**Class Diagram**

------------

![update flow class diagram]()

**Sequence Diagram**

------------

![update flow seq diagram]()
