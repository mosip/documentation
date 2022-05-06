ID Authentication (ID Auth) provides an API based authentication mechanism for entities to validate individuals. ID Authentication is the primary mode for entities to validate an individual before providing any service.

# ID Authentication Service
ID Auth allows only partners to make authentication requests. The requests are cryptographically secured and verified. A partner that captures data from a biometric device must conform to standards to ensure interoperability.

## User Event Type
The following events are triggered as part of User Event Type in ID Authentication Service module

Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
---------|------------|------------|-------------|--------------|-------------------
IDA_001 | User | Authentication Request | This event triggers an API call to Authenticate applicant request.The status is either true or false | UIN/VID | UIN/VID
IDA_002 | User | OTP Request | This event triggers an API call to Authenticate OTP request.The status is either true or false | UIN/VID | UIN/VID
IDA_003 | User | eKYC Request | This event triggers an API call to Authenticate eKYC request.The status is either true or false | UIN/VID | UIN/VID	

## System Event Type
The following events are triggered as part of System Event Type in ID Authentication Service module

Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
---------|------------|------------|-------------|--------------|-------------------
IDA_004 | System | Internal Authentication Request | This event triggers an API call to Authenticate internal applicant request.The status is either true or false. | UIN/VID | UIN/VID
IDA_005 | System | Internal OTP Request | This event triggers an API call to Authenticate internal OTP request.The status is either true or false.. | UIN/VID | UIN/VID
IDA_006 | System | Retrieve Authentication Type Status Request | This event triggers a request to retrieve authentication type status. | UIN/VID | UIN/VID
IDA_007 | System | Update Authentication Type Status Request | This event triggers a request to update authentication type status to true or false. | UIN/VID | UIN/VID
IDA_008 | System | Retrieve Authentication Transaction  History Request | This event triggers a request to retrieve authentication transaction history.The authentication transaction history status is either true or false. | UIN/VID | UIN/VID
IDA_009 | System | Credential Issued | This event describes that the credential issuance for mosip partner is successful. | UIN/VID | UIN/VID
IDA_010 | System | Remove ID | This event describes that the removal of mosip partner is successful. | UIN/VID | UIN/VID
IDA_011 | System | Deactivate ID | This event describes that the deactivation of mosip partner is successful. | UIN/VID | UIN/VID
IDA_012 | System | Activate ID | This event describes that the activation of mosip partner is successful. | UIN/VID | UIN/VID
