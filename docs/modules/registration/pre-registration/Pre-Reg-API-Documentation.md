# Partner Management API's

## API Details
### API 1 (repeated per API)
TODO
* Links to API swagger documentation
    * API Signature (links)
    * Success Response Sample  (links)
    * Failure Response Samples (links)

## List of error codes
## Login Service
Error Codes|Error Message|Error Description
------|-----|-----
PRG_PAM_LGN_001 | OTP failed to send through a specified channel | 
PRG_PAM_LGN_002 | Authentication failed | 
PRG_PAM_LGN_003 | Failed to invalidate the auth token | 
PRG_PAM_LGN_004 | Invalid Request Id received | 
PRG_PAM_LGN_005 | Invalid Request version received | 
PRG_PAM_LGN_006 | Invalid Request timestamp received | 
PRG_PAM_LGN_007 | Invalid Request received | 
PRG_PAM_LGN_008 | Invalid Request userId received | 
PRG_PAM_LGN_009 | Invalid Request langcode received
PRG_PAM_LGN_010 | Invalid otp received | 
PRG_PAM_LGN_011 | Error while Parsing the kernel response | 
PRG_PAM_LGN_012 | Config file not found in the config server | 
PRG_PAM_LGN_013 | Token is not present in the header | 
PRG_PAM_LGN_014 | Mosip language properties not defined | 
PRG_PAM_LGN_015 | Mosip language properties not defined | 
PRE-REG-OTP-101 | Innumerous OTP requests received | 
PRE-REG-OTP-401 | Could not generate/send OTP | 
PRE-REG-OTP-402 | Please regenerate OTP and try again after sometime | 
PRE-REG-OTP-403 | OTP is invalid - Please provide correct OTP value | 
PRE-REG-OTP-404 | Invalid Input Parameter - %s | 
PRE-REG-OTP-405 | Missing Input Parameter - %s | 
PRE-REG-OTP-406 | Input Data Validation Failed | 
PRE-REG-OTP-407 | Token generation failed | 

## Demographic Service
Error Codes|Error Message|Error Description
------|-----|-----
PRG_PAM_APP_001|Failed to create the pre-registration with demographic data provided| TO DO
PRG_PAM_APP_002|Unable to access the pre-registration table|
PRG_PAM_APP_003|Delete operation is not allowed|
PRG_PAM_APP_004|Failed to delete the pre-registration data|
PRG_PAM_APP_005|No data found for the requested pre-registration id , no record found for the requested date range|
PRG_PAM_APP_006|Status code is invalid | 
PRG_PAM_APP_007|Json parsing is failed , json validation is failed , json Http request exception , json validation processing exception , json IO exception , json schema IO exception|
PRG_PAM_APP_008|Failed to update the requested pre registration data |
PRG_PAM_APP_009|File IO exception ,unsupported encoding charset 
PRG_PAM_APP_011|Date format is not supported |
PRG_PAM_APP_012|Request parameter is missing |
PRG_PAM_APP_013|No record found |
PRG_PAM_APP_014|Document service rest call failed|
PRG_PAM_APP_015|Page size must be greater than zero|
PRG_PAM_APP_016|No record found for the requested page index|
PRG_PAM_APP_017|Requested preregistration id does not belong to the user|
PRG_PAM_APP_018|Failed to read the identity json from the server|
PRG_PAM_APP_019|Invalid page index value|
PRG_PAM_APP_020|Rest call to get prid failed,Id schema fetch failed|
PRG_PAM_APP_021|Duplicate key for prid |
PRG_PAM_APP_022 |Application can not be updated |

## Document Service
Error Codes|Error Message
------|-----|-----
PRG_PAM_DOC_001|Document failed in quality check|
PRG_PAM_DOC_002|Document failed to encrypt|
PRG_PAM_DOC_003|Document failed to decrypt|
PRG_PAM_DOC_004|Invalid document format supported|
PRG_PAM_DOC_005|Document not found for the source pre-registration Id,Failed to fetch from File System server|
PRG_PAM_DOC_006|Documents failed to delete|
PRG_PAM_DOC_007|Document exceeding permitted size|
PRG_PAM_DOC_008|Document type not supported|
PRG_PAM_DOC_009|Document upload failed|
PRG_PAM_DOC_010|Document virus scan failed|
PRG_PAM_DOC_011|Document copy failed from source to destination|
PRG_PAM_DOC_012|Document table not accessible|
PRG_PAM_DOC_013|Document I/O exception|
PRG_PAM_DOC_014|Mandatory field not found|
PRG_PAM_DOC_015|Json exception|
PRG_PAM_DOC_016|CEPH connection is invalid|
PRG_PAM_DOC_017|Connection is not available|
PRG_PAM_DOC_018|Invalid request parameter,PreRegistrationId is invalid,Status code is invalid,Uploaded by is invalid,Updated date and time is invalid|
PRG_PAM_DOC_019|Demographic data not found for the preRegistrationId,Demographic record failed to fetch|
PRG_PAM_DOC_021|Document is alredy present|
PRG_PAM_DOC_022|DocumentId is not belongs to the pre-registration Id|
PRG_PAM_DOC_024|Document table not able to update by this status|

## Pre-Registration Core Service
Error Codes|Error Message
------|-----|-----
PRG_PAM_CORE_001|Request parameter is missing,Request id is invalid
PRG_PAM_CORE_002|Request version is invalid 
PRG_PAM_CORE_003|Invalid request time
PRG_PAM_CORE_004|Request body is invalid
PRG_PAM_CORE_010|Hashing failed
PRG_CORE_REQ_013|Request date should be current date
PRG_CORE_REQ_014|Lang code is invalid
PRG_CORE_REQ_015|Invalid request input
PRG_CORE_REQ_016|Internal server error
PRG_CORE_REQ_017|Document Category code is invalid
PRG_CORE_REQ_018|Document Category code is invalid + validDoc + langCode
PRG_CORE_REQ_019|Invalid date time format
PRG_CORE_REQ_020|From date is greater than To date
PRG_CORE_REQ_021|Error while Parsing the kernel response
PRG_CORE_REQ_022|Error while calling masterdata

## Booking Service
Error Codes|Error Message
------|-----|-----
PRG_BOOK_RCI_002|Appointment booking/re-booking cannot be done as | 
PRG_BOOK_RCI_003|User has not selected time slot
PRG_BOOK_RCI_006|Preregistration id not entered 
PRG_BOOK_RCI_007|Registration center id not entered 
PRG_BOOK_RCI_008|Registration center id not entered
PRG_BOOK_RCI_015|No available slots found for specified registration center
PRG_BOOK_RCI_013|Booking data not found
PRG_BOOK_RCI_017|Availablity table not accessible
PRG_BOOK_RCI_018|Appointment cannot be canceled
PRG_BOOK_RCI_020|Master data not found
PRG_BOOK_RCI_021|Appointment rebooking failed
PRG_BOOK_RCI_024|Availablity update failed
PRG_BOOK_RCI_026|Appointment cancelling cannot be done within
PRG_BOOK_RCI_028|Failed to delete the pre registration record
PRG_BOOK_RCI_031|Invalid Booking Date Time
PRG_BOOK_RCI_032|Record not found for date range and reg center id
PRG_BOOK_RCI_033|Notification service call failed
PRG_BOOK_RCI_034|Json processing exception
PRG_BOOK_RCI_035|Registration center id not found
PRG_BOOK_RCI_036|Appointment cannot be booked for incomplete application

## Data Sync Service
Error Codes|Error Message|Error Description
------|-----|-----
PRG_DATA_SYNC_001|No data found for the requested date range|
PRG_DATA_SYNC_005|Unable to create zip file|
PRG_DATA_SYNC_006|Unable to fetch the document|
PRG_DATA_SYNC_007|Demographic record failed to fetch|
PRG_DATA_SYNC_009|Registration center id is invalid|	
PRG_DATA_SYNC_011|Requested pre-registration ids are not valid
PRG_DATA_SYNC_012|Failed to store prereg id 
PRG_DATA_SYNC_014|File IO exception
PRG_DATA_SYNC_016|Booking data not found
PRG_DATA_SYNC_017|Error occured while parsing data
PRG_DATA_SYNC_018|Failed to fetch the info the preregistration Id
PRG_DATA_SYNC_019|Failed to fetch machines encryption publickey

## UI Specification
Error Codes|Error Message|Error Description
------|-----|-----
PRG_APP_001|Failed to save the ui spec|TO DO
PRG_APP_002|Failed to update the ui spec|
PRG_APP_003|Failed to fetch the ui spec|
PRG_APP_004|Failed to delete the ui spec|
PRG_APP_005|Failed to publish the ui spec|
PRG_APP_006|Error while parsing json|
PRG_APP_007|Audit Failed|

## Transliteration Service
Error Codes|Error Message|Error Description
------|-----|-----
PRG_TRL_APP_001|Failed to transliterate|
PRG_TRL_APP_002|Incorrect mandatory Fields,Unsupported language|
PRG_TRL_APP_004|Invalid Json request|
PRG_TRL_APP_005|PreReg transliteration table is not accessible|
PRG_TRL_APP_006|Json parsing failed	|

## Notification Service
Error Codes|Error Message|Error Description
------|-----|-----
PRG_PAM_ACK_001|Mobile number or Email Id is missing|
PRG_PAM_ACK_002|Mandatory fields are missing|
PRG_PAM_ACK_003|Json http request exception|
PRG_PAM_ACK_004|Json is not able to parse|
PRG_PAM_ACK_005|INPUT_OUTPUT_EXCEPTION|
PRG_PAM_ACK_006|Email is not valid|
PRG_PAM_ACK_007|Phone number is not valid|
PRG_PAM_ACK_008|Full name is not valid|
PRG_PAM_ACK_009|Appointment date is not valid| 
PRG_PAM_ACK_010|Appointment time is not valid|
PRG_PAM_ACK_011|Demographic rest call failed| 
PRG_PAM_ACK_012|Booking rest call failed|
