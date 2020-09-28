The Resident Service module will provide a host of services to an individual which can be availed after the creation of their Unique Identity Number (UIN). The list of services are as follows:
 * Update of Demographic Data (UIN update)
 * Track Request Status
 * Lock/Unlock AUTH types
 * Download e-UIN
 * Retrieve Lost Request ID(RID)/UIN
 * Reprint UIN
 * View Authentication Transaction History
 * Generate/revoke Virtual ID (VID).

All these features are detailed in the following features section.
  
# Features

## Track status of UIN Generation
This feature will allow an individual to track status of his/her UIN generation. The individual needs to provide the RID (Request ID received during UIN registration) as input. The system will validate this RID. On successful validation, the system will send the status of UIN generation to the individual's registered mobile number and/or email ID. The system will also send a notification message to individual’s mobile number and/or email ID after a successful transaction or appropriate error message if the transaction was not successful.

## Download e-UIN
This feature will allow an individual to download his/her electronic UIN. The individual needs to provide the UIN/VID, full name, postal code, and security code as input. The system will validate the provided data, trigger an OTP to individual's registered mobile number and/or email ID, validate the OTP and then authenticate the individual. On successful authentication, system will send a link to the individual's registered mobile number and/or email ID to download his/her password-protected e-UIN in pdf format. The system will also trigger a notification message  to the individual's registered mobile number and/or email id after the transaction or appropriate error message if the transaction was not successful.

## Retrieve Lost RID
After the UIN application is submitted by an individual providing the required demographic, biometrics and supporting documents and filling up the enrollment form by visiting a registration center, the system generates a unique RID (Request ID) as an acknowledgement number. If the individual misplaces this RID, this feature will allow an individual to retrieve his/her lost RID to subsequently trace the associated UIN. The individual needs to provide his/her Full Name, Mobile Number and/or E-Mail ID, Postal Code that was provided during registration as input. The system will first validate the individual's provided data, trigger an OTP, and perform OTP validation on the given mobile number and/or email ID. On successful validation, the system will send a link to password protected pdf containing the RID to individual's registered mobile number and/or email ID. The system will also trigger a notification message to the registered mobile number/email ID after a successful transaction or appropriate error message if the transaction was not successful.

This feature is not yet developed in MOSIP.

## Retrieve Lost UIN
This feature will allow an individual to retrieve his/her lost UIN. The individual needs to provide the Full Name, Mobile Number and/or E-Mail ID, Postal Code as input. The system will first validate the individual's provided data, trigger an OTP, and perform OTP validation on the given mobile number and/or email ID. On successful validation, the system will send a link to the individual's registered mobile number and/or email ID to download his/her password-protected UIN in pdf format. The system will also trigger a notification message to the registered mobile number and/or email ID after a successful transaction or  appropriate error message if the transaction was not successful.

This feature is not yet developed in MOSIP.

## Re-print Request of UIN
This feature will allow an individual to raise reprint request of his/her UIN. The individual needs to provide the UIN/VID as input. The system will first validate the individual's UIN/VID, trigger an OTP to individual's registered mobile number and/or email ID, validate the OTP and then authenticate the individual. On successful authentication, the system will take the UIN reprint request and acknowledge the request with a Request ID (RID) to the individual. The system will also trigger a notification message to the registered mobile number and/or email ID after a successful transaction or appropriate error message if the transaction was not successful.

## Initiate UIN Update
This feature will allow an individual to initiate update of his/her demographic details. Currently, an individual can initiate an update of the address associated to the provided UIN/VID. However, this service can be extended to further update any other aspect of the demographic data (EG: Mobile, Email, etc). The individual needs to provide the UIN/VID as input. The system will first validate the individual's UIN/VID, trigger an OTP to individual's registered mobile number and/or email ID, validate the OTP and then authenticate the individual. On successful authentication, the system will generate and send a Request ID (RID) for UIN update to individual's registered mobile number and/or email ID. The system will also trigger a notification message to the registered mobile number and/or email ID after a successful transaction or appropriate error message if the transaction was not successful.

## Track Status of UIN Update
This feature will allow an individual to track status of his/her UIN update. The individual needs to provide the RID ( Request ID for UIN Update) as input. The system will first validate the RID, trigger an OTP to individual's registered mobile number and/or email ID, validate the OTP and then authenticate the individual. On successful authentication, the system will send the status of UIN Update to individual's registered mobile number and/or email ID. The system will also send a notification message to individual’s mobile number and/or email ID after a successful transaction or appropriate error message if the transaction was not successful.

## View History of Authentication Requests
This feature will allow an individual to view history of the authentication request(s) associated to his/her UIN. The individual needs to provide the UIN/VID as input. The system will first validate the UIN/VID, trigger an OTP to individual's registered mobile number and/or email ID, validate the OTP and then authenticate the individual. On successful authentication, the system will send unarchived Authentication History data of the individual associated to the provided UIN and all its associated VIDs. The system will also send a notification message to individual’s mobile number and/or email ID after a successful transaction or appropriate error message if the transaction was not successful.

## Lock/Unlock Authentication
An individual can decide to lock specific Authentication Types (Demographic/Biometrics) of his/her UIN/VID for security reasons. It can be for one or more Authentication types. The locked Authentication Type(s) cannot be used for any future authentication request. Similarly at any point he/she may also request to unlock one or more locked Authentication types which was locked earlier.

### Lock the UIN
This feature will allow an individual to lock the requested Authentication Type (Demographic, Biometrics (FP/Iris/Face/All)) associated with his/her UIN/VID. The individual needs to provide the UIN/VID as input. The system will first validate the individual's UIN/VID, trigger an OTP to individual's registered mobile number and/or email ID, validate the OTP and then authenticate the individual. On successful authentication, the system will first send the details of all Authentication Types to the individual. The individual will then select which Authentication Type(s) will need to be locked. The system takes the request, locks the specified Authentication Type(s) and then notifies the individual. The system will also send a notification message to individual’s mobile number and/or email ID after a successful transaction or appropriate error message if the transaction was not successful.

### Unlock the UIN
This feature will allow an individual to unlock requested Authentication Types (Demographic, Biometrics (FP/Iris/Face/All)) which is/are in locked status associated with his/her UIN/VID. Once unlocked, the individual can again use these Authentication Type(s) for any future authentication purpose. The individual needs to provide the UIN/VID as input. The system will first validate the individual's UIN/VID, trigger an OTP to individual's registered mobile number and/or email ID, validate the OTP and then authenticate the individual. On successful authentication, the system will first send the details of all Authentication Type(s) to the individual which is/are in locked status. The individual will then select which Authentication Type(s) need to be unlocked. The system takes the request and accordingly unlocks the Authentication Type(s) and notifies the individual. The system will also send a notification message to individual’s mobile number and/or email ID after a successful transaction or appropriate error message if the transaction was not successful.

## VID Service
To safeguard the confidentiality of a UIN and for its security, Virtual ID (VID) service is provided. Based on the VID policy (defined by Country), an individual will be provided a VID during UIN registration and also he/she can create this using 'Resident Services'. The VID policy attributes defines the type of the VID, Country can name the VID as desired.
VID policy constitutes time validity, no of instances, no of transactions, regeneration mode.

VID services comprise of the below.

### Generate a VID
An individual can request to generate a Virtual ID via Resident Service by providing his/her UIN. The system will first validate the individual's UIN, trigger an OTP to individual's registered mobile number and/or email ID, validate the OTP and then authenticate the individual. On successful authentication the VID is generated based on the VID policy of the respective Country. The system will also send a notification message to individual’s mobile number and/or email ID after a successful transaction or appropriate error message if the transaction was not successful.

### Maintain the status of a VID
This feature allows the system to maintain the status of all VIDs from the perspective of Time Validity, Transactions, and VID Revocation. The feature will be used by system's authentication module (called IDA - ID Authentication) whenever a VID is used for an authentication transaction (VID status will change to ‘USED’). Also when Resident Services is used for VID Revoke feature the status of VID changes to ‘REVOKED'. 

### Revoke a VID
To prevent misuse of VID, an individual can request to revoke his/her VID using Resident Service if the individual feels his/her VID has been compromised. The individual provides the VID as input. The system will then validate the individual's VID, trigger an OTP to individual's registered mobile number and/or email ID, validate the OTP and then authenticate the individual. On successful authentication, the system revokes the provided VID. Based on the VID policy of the Country a new VID will be generated during revocation and provided to the individual on the registered mobile number and/or email ID. If validation fails, the system triggers the appropriate error message.

### Auto-restore a VID on Revocation and with Auto-restore Policy
This feature allows for a VID to be auto regenerated and given to an individual after he/she requests for an existing VID to be revoked. The VID regeneration happens based on the VID policy defined by Country (the regeneration policy for the revoked VID should be ‘Auto-restore’).

[Refer to VID Services API Specificarion for more details](ID-Repository-APIs.md#vid-services-private).

# List of Configurable Parameters and Processes
All the configurations related to resident services are available [here](https://github.com/mosip/mosip-config/blob/master/config-templates/resident-env.properties)

# Resident Services API
[Link to Resident Services API](Resident-Service-APIs.md)

# Process View
[Link to Resident Services Process Flow](Resident-Services.md#process-flow)
