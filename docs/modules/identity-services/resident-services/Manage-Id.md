# Manage Identity

## Download UIN PDF
* This feature will allow an individual to download his/her electronic UIN. The individual needs to provide the UIN/VID, full name, postal code, and security code as input. The system will validate the provided data, trigger an OTP to individual's registered mobile number and/or email ID, validate the OTP and then authenticate the individual. On successful authentication, system will send a link to the individual's registered mobile number and/or email ID to download his/her password-protected e-UIN in PDF format. The system will also trigger a notification message to the individual's registered mobile number and/or email id after the transaction or appropriate error message if the transaction was not successful

## Re-print Request of UIN
* This feature will allow an individual to raise reprint request of his/her UIN. The individual needs to provide the UIN/VID as input. The system will first validate the individual's UIN/VID, trigger an OTP to individual's registered mobile number and/or email ID, validate the OTP and then authenticate the individual. On successful authentication, the system will take the UIN reprint request and acknowledge the request with a Request ID (RID) to the individual. The system will also trigger a notification message to the registered mobile number and/or email ID after a successful transaction or appropriate error message if the transaction was not successful.

## Find Lost UIN
* This feature will allow an individual to retrieve his/her lost UIN. The individual needs to provide the Full Name, Mobile Number and/or E-Mail ID, Postal Code as input. The system will first validate the individual's provided data, trigger an OTP, and perform OTP validation on the given mobile number and/or email ID. On successful validation, the system will send a link to the individual's registered mobile number and/or email ID to download his/her password-protected UIN in pdf format. The system will also trigger a notification message to the registered mobile number and/or email ID after a successful transaction or appropriate error message if the transaction was not successful.

## Lock/Unlock Authentication
## Lock Authentication Factors
* This feature will allow an individual to lock the requested Authentication Type (Demographic, Biometrics (FP/Iris/Face/All)) associated with his/her UIN/VID. The individual needs to provide the UIN/VID as input. The system will first validate the individual's UIN/VID, trigger an OTP to individual's registered mobile number and/or email ID, validate the OTP and then authenticate the individual. On successful authentication, the system will first send the details of all Authentication Types to the individual. The individual will then select which Authentication Type(s) will need to be locked. The system takes the request, locks the specified Authentication Type(s) and then notifies the individual. The system will also send a notification message to individual’s mobile number and/or email ID after a successful transaction or appropriate error message if the transaction was not successful.

## Unlock Authentication Factors
* This feature will allow an individual to unlock requested Authentication Types (Demographic, Biometrics (FP/Iris/Face/All)) which is/are in locked status associated with his/her UIN/VID. Once unlocked, the individual can again use these Authentication Type(s) for any future authentication purpose. The individual needs to provide the UIN/VID as input. The system will first validate the individual's UIN/VID, trigger an OTP to individual's registered mobile number and/or email ID, validate the OTP and then authenticate the individual. On successful authentication, the system will first send the details of all Authentication Type(s) to the individual which is/are in locked status. The individual will then select which Authentication Type(s) need to be unlocked. The system takes the request and accordingly unlocks the Authentication Type(s) and notifies the individual. The system will also send a notification message to individual’s mobile number and/or email ID after a successful transaction or appropriate error message if the transaction was not successful.

## To Do
## API Details
* [API Documentation](https://nayakrounak.gitbook.io/mosip-docs/v/1.2.0/modules/identity-services/resident-services/Resident-Service-API-Documentation.md)

* Configuration Parameters
    * List of parameters and how they alter the behaviour of the API

## Links to related content
* Link to design documentation,
* Links to How To articles
