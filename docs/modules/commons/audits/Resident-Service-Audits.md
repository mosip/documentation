Resident services are the self-services which is used by the resident themselves via a portal. Functionalities such as lock/unlock authentication types, reprint UIN, view authentication history etc. are available. The services use OTP method of authentication.

# System Events

The following events are triggered as part of System Event Type in Residence Service module

## Request Info for System Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RES_SER_101 | System | Checking RID Status | This event specifies that a request is raised to check the RID status. | No ID | No ID Type
2 | RES-SER-111 | System | Checking RID status | This event returns the RID status | No ID | No ID Type
3 | RES-SER-102 | System | Request EUIN | This event sends a request for EUIN for the specified transaction ID | <transaction_id> | Transaction ID 
4 | RES-SER-103 | System | Request to print UIN | This event sends a request for print UIN for the specified transaction ID | <transaction_id> | Transaction ID 
5 | RES-SER-104 | System | Request to lock auth | This event sends a request for locking the auth for the specified transaction ID | <transaction_id> | Transaction ID 
6 | RES-SER-105 | System | Request to unlock auth | This event sends a request for unlocking the auth for the specified transaction ID | <transaction_id> | Transaction ID 
7 | RES-SER-106 | System | Request for auth history | This event sends a request for retrieving the auth history for the specified transaction ID | <transaction_id> | Transaction ID 
8 | RES-SER-107 | System | Request to update the uin | This event calls an API to update the UIN of the resident for the specified transaction ID | <transaction_id> | Transaction ID 
9 | RES-SER-108 | System | Request for generating VID | This event Calls and API to generate a VID for the specified transaction ID	| <transaction_id> | Transaction ID 
10 | RES-SER-109 | System | Request for revoking VID | This event Calls and API to revoke a VID for the specified transaction ID | <transaction_id> | Transaction ID 
11 | RES-SER-110 | System | Validating the input request | This event validates the type of input request | No ID | No ID Type
12 | RES-SER-113 | System | <Type of request> | This event validates the OTP for the specified transaction ID | <transaction_id> | Transaction ID 
13 | RES-SER-116 | System | Checking RID status | This event calls an API to get the RID status based on the individual ID | No ID | No ID Type
14 | RES-SER-114 | System | Request for print UIN | This event specifies that the RID is Obtained for specified transaction id while requesting for printing UIN | <transaction_id> | Transaction ID 
15 | RES-SER-115 | System | Request for UIN Update | This event specifies that the RID is obtained for specified transaction id while requesting for update UIN | <transaction_id> | Transaction ID 
16 | RES-SER-116 | System | Request to generate VID	This event specifies that the VID is generated successfully for the specified transaction ID | <transaction_id> | Transaction ID 

## Success response for System Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RES-SER-200 | System | Checking RID status | This event specifies that the API call to check the RID status is successful | No ID | No ID Type
2 | RES-SER-210 | System | Request for EUIN | This event specifies that the request for EUIN for the specified transaction ID is successful	| <transaction_id> | Transaction ID 
3 | RES-SER-201 | System | Request to print the UIN | This event specifies that the API call to print UIN for the specified transaction ID is successful | <transaction_id> | Transaction ID 
4 | RES-SER-202 | System | Request to lock the auth | This event specifies that the API call to lock the auth for the specified transaction ID is successful | <transaction_id> | Transaction ID 
5 | RES-SER-203 | System | Request to unlock the auth | This event specifies that the API call to unlock the auth for the specified transaction ID is successful | <transaction_id> | Transaction ID 
6 | RES-SER-204 | System | Request for auth history | This event specifies that the API call to retrieve the auth history for the specified transaction ID is successful | <transaction_id> | Transaction ID 
7 | RES-SER-205 | System | Request updating the UIN | This event specifies that the API call to update the UIN for the specified transaction ID is successful | <transaction_id> | Transaction ID 
8 | RES-SER-206 | System | Request for generating VID | This event specifies that the API call to generate a VID for the specified transaction ID is successful | <transaction_id> | Transaction ID 
9 | RES-SER-207 | System | Request for revoking VID | This event specifies that the API call to revoke the VID for the specified transaction ID is successful | <transaction_id> | Transaction ID 
10 | RES-SER-208 | System | <Type of request> | This event specifies that the sending of notification for transaction ID is successful | <transaction_id> | Transaction ID 
11 | RES-SER-209 | System | <Type of request> | This event specifies that the validation of otp for the specified transaction ID is successful | <transaction_id> | Transaction ID 
12 | RES-SER-210 | System | Request to revoke the VID | This event specifies that the VID is deactivated for the specified transaction ID | <transaction_id> | Transaction ID 

## Failure response for System Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RES-SER-403 | System | <Type of request> | This event specifies that a failure notification has been sent for the specified transaction ID | <transaction_id> | Transaction ID 
2 | RES-SER-405 | System | Request to generate VID | This event specifies that the VID already exists for the specified transaction ID | <transaction_id> | Transaction ID 
3 | RES-SER-406 | System | Request to generate VID | This event specifies that the VID generation failed for the specified transaction ID | <transaction_id> | Transaction ID 
4 | RES-SER-404 | System | <Type of request> | This event specifies that there was a json parsing exception while generating VID for the specified transaction ID | <transaction_id> | Transaction ID 
5 | RES-SER-407 | System | Request to revoke VID | This event specifies that the VID revocation failed for the specified transaction ID	| <transaction_id> | Transaction ID 
6 | RES-SER-408 | System | Checking RID status | This event specifies that the RID was not found while verifying the RID status	| No ID	| No ID Type
7 | RES-SER-409 | System | Generating token | This event specifies that the token generation has failed	| No ID	| No ID Type
8 | RES-SER-410 | System | <Type of request> | This event specifies that the input parameter was invalid	No ID	No ID Type
9 | RES-SER-411 | System | <Type of request> | This event specifies that the API was not available for the specified transaction ID | <transaction_id> | Transaction ID 
10 | RES-SER-412 | System | <Type of request> | This event specifies that it was unable to access API resource for the transaction id | <transaction_id> | Transaction ID 
11 | RES-SER-413 | System | Check RID | This event specifies that the RID is invalid | No ID | No ID Type
12 | RES-SER-414 | System | Validating request | This event specifies that the request does not exist | No ID | No ID Type
13 | RES-SER-415 | System | Get template | This event specifies that there was a template exception	| No ID | No ID Type
14 | RES-SER-416 | System | Get template | This event specifies that there was a template subject exception	| No ID	| No ID Type
15 | RES-SER-417 | System | <Type of request> | This event specifies that the notification was failed for the transaction ID | <transaction_id> | Transaction ID 
16 | RES-SER-418 | System | <Type of request> | This event specifies that it was a bad request | No ID | No ID Type
17 | RES-SER-419 | System | Checking RID status | This event specifies that there was a invalid API response while checking the RID status | No ID | No ID Type
18 | RES-SER-420 | System | <Type of request> | This event specifies that there was a IO exception for the transaction ID | <transaction_id> | Transaction ID 
19 | RES-SER-421 | System | Request for UIN update | This event specifies that there was a json parsing exception for the transaction ID | <transaction_id> | Transaction ID
20 | RES-SER-422 | System | <Type of request> | This event specifies that the OTP validation failed for the transaction ID | <transaction_id> |  Transaction ID 
21 | RES-SER-401 | System | <Type of request> | This event specifies that there was a base exception for the transaction ID specified | <transaction_id> | Transaction ID 
22 | RES-SER-402 | System | <Type of request> | This event specifies that the request failed for the transaction ID | <transaction_id> | Transaction ID 

 
