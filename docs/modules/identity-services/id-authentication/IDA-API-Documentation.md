# ID Authentication API's

## API Details
### API 1 (repeated per API)
TODO
* Links to API swagger documentation
    * API Signature (links)
    * Success Response Sample  (links)
    * Failure Response Samples (links)

## List of error codes

|Error Codes|Error Message|Error Description|
|------|-----|-----|
|IDA_MLC_002|Invalid UIN| The UIN provided to IDA was Invalid |
|IDA-MLC-003|UIN has been deactivated|UIN has been deactivated|
|IDA-MLC-004|Invalid VID| The VID provided to IDA was Invalid |
|IDA-MLC-005|“%s VID”|Expired,Used,Revoked VID|“%s VID”|
|IDA-MLC-014|Notification Channel not registered. Individual has to register and try again|Notification Channel not Registered (Phone/e-mail/both)|
|IDA-OTA-001|Innumerous OTP requests received|OTP Flooding error|
|IDA-OTA-002|Could not generate/send OTP|
|IDA-OTA-003|OTP Expired|The OTP provided to IDA was expired|
|IDA-OTA-004|OTP Invalid|The OTP provided to IDA was Invalid|
|IDA-OTA-005|Input transactionID does not match transactionID of OTP Request|Invalid Transaction ID|
|IDA-MLC-006|Missing Input parameter|Example: "Missing Input parameter"- version|
|IDA-MLC-007|Request could not be processed. Please try again|Could not process request/Unknown error; Invalid Auth Request; Unable to encrypt eKYC response|
|IDA-DEA-001|Demographic data did not match|Name, Full Address, Address line Items, Gender, Phone,e-mail,DOB,DOB Type, and age Mismatch in any language|
|IDA-MLC-001|Request to be received at MOSIP within<x> hrs/min|Invalid Time stamp|
|IDA-DEA-002|Unsupported Language Code <XX>|Unsupported language Code used in the Lang attribute|
|IDA-MLC-013|Missing auth attribute|Missing authtype parameter – when authtype = ‘True’ and corresponding auth attribute missing (OTP,Demo and Bio)|
|IDA-BIA-001|Biometric data did not match|FMR,IIR,FID Mismatch|
|IDA-BIA-002|Duplicate fingers in request|
|IDA-BIA-003|Number of FMR should not exceed 2.|Fingers exceeding 2|
|IDA-BIA-004|Device not registered with MOSIP|Invalid deviceCode|
|IDA-BIA-005|Device provider not registered with MOSIP|Invalid device Provider ID|
|IDA-BIA-006|Biometric data not available in database.|Missing biometric data in MOSIP database|
|IDA-BIA-007|Duplicate Irises in request.|Duplicate Irises used|
|IDA-BIA-008|Number of IIR should not exceed 2.|Irises exceeding 2|
|IDA-DEA-003|Demographic data not available in database.|Individual’s data not available|
|IDA-EKA-002|Invalid value in print format request|
|IDA-MPA-013|Partner is unauthorised for eKYC|Partner has no permission for e-KYC|
|IDA-MPA-001|Digital signature verification failed.|
|IDA-MPA-002|Invalid certificate in digital signature.|
|IDA-MPA-003|Unable to decrypt Request.|Invalid encryption of session key/request|
|IDA-MLC-009|Invalid Input parameter|
|IDA-OTA-006|UIN is locked for OTP generation. Please try again later|Try to generate OTP for a frozen Account|
|IDA-OTA-007|UIN is locked for OTP validation due to exceeding no of invalid OTP trials|Validate wrong OTP for exceeding no of retries|
|IDA-BIA-009|Number of FID records should not exceed 1.|Face exceeding 1|
|IDA-MLC-008|No authentication type selected|No authentication type selected in the request|
|IDA-MLC-010|VID has been deactivated|VID corresponding to a deactivated UIN|
|IDA-MLC-011|Unsupported Authentication Type|Auth Type not supported for a country|
|IDA-MPA-004|MOSIP Public key expired.|
|IDA-MPA-005|OTP Request Usage not allowed as per policy|OTP Trigger Usage not allowed as per policy|
|IDA-MPA-006|Authentication Usage not allowed as per policy|All Authentication Usages not allowed as per policy(Eg: OTP/Demo/Bio - FMR)|
|IDA-MPA-007|License key does not belong to a registered MISP|License key does not belong to a registered MISP/ License key invalid|
|IDA-MPA-008|License key of MISP has expired|License key expired|
|IDA-MPA-009|Partner is not registered|Partner ID is Invalid|
|IDA-MPA-010|MISP and Partner not mapped|
|IDA-MPA-011|License key of MISP is suspended|License key status of MISP is suspended|
|IDA-MPA-012|Partner is deactivated|PartnerID is not active|
|IDA-MLC-012|Individual's Consent is not available|Invalid resident consent for eKYC/Auth|
|IDA-MPA-014|Partner is not assigned with any policy|Partner ID is not mapped to a policy|
|IDA-MPA-015| Authentiation Usage is mandatory as per policy|Mandatory Auth Type as per policy of the partner is not available in the auth request (Eg: OTP/Demo/Bio - FMR)|
|IDA-MPA-016|HMAC Validation failed|HMAC value does not match|
|IDA-OTA-008|OTP Notification Channel not provided.|No OTP Channel is provided in the input|
|IDA-MPA-017|License key of MISP is blocked|License key status of MISP is blocked|
|IDA-MLC-015|Identity Type not configured for the country|ID Type (UIN/VID) not supported for a country|
|IDA-OTA-009|Notification Channel not configured for the country|Notification Channel not configured (Phone/e-mail/both)|
|IDA-MLC-016|Transaction ID parameters in the request does not match|TransactionID inside the biometric data does not match with other transactionID in auth request|
|IDA-BIA-013|Number of FMR should not exceed 10.|Fingers exceeding 10 for Internal Auth|
|IDA-EKA-001|Unable to encrypt eKYC response|Invalid encryption of eKYC response|
|IDA-OTA-010|Input Identity Type does not match Identity Type of OTP Request|Invalid Identity Type|
|IDA-MLC-017|Invalid UserID|
|IDA-MLC-018|%s Data not available in database|UIN,VID, User ID not available in database|
|IDA-MLC-019|%s Auth Type is Locked for the UIN|Auth Type is Locked|
|IDA-MLC-020|Unable to encrypt data|Encryption Failure|
|IDA-BIA-014|Hash Validation Failed|
|IDA-DPM-001|Device is not registered with MOSIP|Device Issues from Device Validation API|
|IDA-DPM-002|MDS is not registered with MOSIP|MDS Issues from Device Validation API|
|IDA-DPM-003|Device Provider is not registered with MOSIP|Provider ID Issues from Device Validation API|
|IDA-MPA-018|Policy ID does not belong to a registered Partner|Policy ID does not belong to a registered Partner/ Policy ID invalid|
|IDA-BIA-016|Unable to Perform Quality Check due to a Technical Issue|Policy ID does not belong to a registered Partner/ Policy ID invalid|
|IDA-BIA-017|Unable to Perform Biometric Match due to a Technical Issue|Thrown when data provided is valid but matching cannot be performed|
|IDA-BIA-018|Unable to Process the Request due to a Technical Issue|Thrown when some other error occurred (eg. licensing issue)|
|IDA-BIA-015|Signature Validation Failed|
|IDA-MLC-021|Failed to fetch key from HSM|Thrown when keys cannot be fetched from keystore/softhsm|
|IDA-MLC-022|UIN is deactivated/blocked|Generic error for UIN deactivated/blocked status|
|IDA-MLC-023|VID is expired/deactivated|Generic error for VID expired/deactivated/revoked status|
|IDA-DPM-004|Device Type and Biometric Type do not match|
|IDA-MLC-024|Domain /Env of request is not matching with Domain/ Env of biometrics|
|IDA-MLC-025|Partner Certificate is not available|
|IDA-OTA-011|Input Partner-ID does not match Partner-ID of OTP Request|Invalid Partner ID|
|IDA-MPA-019|Partner policy is not active|
|IDA-IDV-001|Input Data Validation Failed|
|IDA-RST-001|URI should not be empty|Rest API Errors|
|IDA-RST-002|httpMethod is empty or invalid|
|IDA-RST-003|returnType is empty|
|IDA-RST-004|Rest service name is empty or invalid|
|IDA-RST-005|Timeout is invalid|
|IDA-RST-006|4XX - Client Error occurred|
|IDA-RST-007|5XX - Server Error occurred|
|IDA-RST-008|Connection timed out|












































































  




















  











