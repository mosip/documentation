# Application Status Tracking

## Application Status 
### New UIN
* This feature will allow an individual to track status of his/her UIN generation. The individual needs to provide the RID (Request ID received during UIN registration) as input. The system will validate this RID. On successful validation, the system will send the status of UIN generation to the individual's registered mobile number and/or email ID. The system will also send a notification message to individual’s mobile number and/or email ID after a successful transaction or appropriate error message if the transaction was not successful.

### UIN Update 
* This feature will allow an individual to track status of his/her UIN update. The individual needs to provide the RID ( Request ID for UIN Update) as input. The system will first validate the RID, trigger an OTP to individual's registered mobile number and/or email ID, validate the OTP and then authenticate the individual. On successful authentication, the system will send the status of UIN Update to individual's registered mobile number and/or email ID. The system will also send a notification message to individual’s mobile number and/or email ID after a successful transaction or appropriate error message if the transaction was not successful.

## Lost RID
* After the UIN application is submitted by an individual providing the required demographic, biometrics and supporting documents and filling up the enrollment form by visiting a registration center, the system generates a unique RID (Request ID) as an acknowledgement number. If the individual misplaces this RID, this feature will allow an individual to retrieve his/her lost RID to subsequently trace the associated UIN. The individual needs to provide his/her Full Name, Mobile Number and/or E-Mail ID, Postal Code that was provided during registration as input. The system will first validate the individual's provided data, trigger an OTP, and perform OTP validation on the given mobile number and/or email ID. On successful validation, the system will send a link to password protected pdf containing the RID to individual's registered mobile number and/or email ID. The system will also trigger a notification message to the registered mobile number/email ID after a successful transaction or appropriate error message if the transaction was not successful.

## Lost UIN
* This feature will allow an individual to retrieve his/her lost UIN. The individual needs to provide the Full Name, Mobile Number and/or E-Mail ID, Postal Code as input. The system will first validate the individual's provided data, trigger an OTP, and perform OTP validation on the given mobile number and/or email ID. On successful validation, the system will send a link to the individual's registered mobile number and/or email ID to download his/her password-protected UIN in pdf format. The system will also trigger a notification message to the registered mobile number and/or email ID after a successful transaction or appropriate error message if the transaction was not successful.

## To Do
## API Details
* [API Documentation](https://nayakrounak.gitbook.io/mosip-docs/v/1.2.0/modules/identity-services/resident-services/Resident-Service-API-Documentation.md)

* Configuration Parameters
    * List of parameters and how they alter the behaviour of the API

## Links to related content
* Link to design documentation,
* Links to How To articles
