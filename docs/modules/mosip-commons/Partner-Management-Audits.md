Partner Management provides services for various types of partners associated with the MOSIP system. Currently, in MOSIP we have identified some types of partners, but the adopters can choose to add many more partners.

# MISP Management Service
MISP (MOSIP Infrastructure Service Provider) who provides infrastructure to send authentication request through a secure channel.

## User Event Type
The following events are triggered as part of User Event Type in MISP management module

### Request Information for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PMS_MSP_101 | User | Register MISP | This event triggers an API call to create MISP in MOSIP database | No ID | No ID Type
	
### Success response for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PMS_MSP_200 | User | Register MISP | This event describes that the API call to create MISP in MOSIP database is successful | No ID | No ID Type
2 | PMS_MSP_212 | User | Register MISP | This event describes that the creation of MISP id - <misp_id> in MOSIP database is Successful | <misp_id> | MISP ID

## System Event Type
The following events are triggered as part of System Event Type in MISP management module

### Request Info for System Event Type
	
Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------	
1 | PMS_MSP_102 | System | Register MISP | This event specifies that the kernel MISP ID generator is called to Generate the MISP ID. | No ID | No ID Type
2 | PMS_MSP_103 | System | Register MISP | This event specifies that the MISP details created successfully | No ID | No ID Type
3 | PMS_MSP_104 | System | Processing of MISP status request | This event calls the API to update MISP status with ID - <misp_id> | <misp_id> | MISP ID
4 |PMS_MSP_104 | System	| Processing of MISP status request | This event validates the MISP ID - <misp_id> | <misp_id> | MISP ID
5 | PMS_MSP_105 | System | Processing of MISP status request | This event specifies that the MISP license key is not generated for rejected misp with id - <misp_id> | <misp_id> | MISP ID
6 | PMS_MSP_106	| System | Processing of MISP status request | This event updates the MISP license status for ID - <misp_id> | <misp_id> | MISP ID
7 | PMS_MSP_107	| System | Update MISP request | This event calls the API to update MISP request | No ID | No ID Type
8 | PMS_MSP_108 | System | Update MISP request | This event returns the updated MISP status | No ID	| No ID Type
9 | PMS_MSP_109 | System | Validate license key | This event calls the API to validate MISP license key | No ID	| No ID Type
10 | PMS_MSP_110 | System | Validate license key | This event fetches the license key details for MISP ID - <misp_id> | <misp_id> | MISP ID
11 | PMS_MSP_111 | System | Validate license key | This event specifies the license key for MISP is <misp_id> | <misp_id> | MISP ID
12 | PMS_MSP_112 | System | Update MISP status request | This event calls the API to update MISP status  | No ID | No ID Type
13 | PMS_MSP_113 | System | Update MISP status request | This event specifies the MISP status is <misp_id> | <misp_id> | MISP ID
14 | PMS_MSP_114 | System | Update MISP license key request | | No ID	| No ID Type
		
### Success response for System Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PMS_MSP_201 | System | Processing MISP status request | This event describes that the API  call to update MISP status with id - <misp_id> is successful | <misp_id> | MISP ID
2 | PMS_MSP_202 | System | Processing MISP status request | This event specifies that the MISP status is updated for id - <misp_id> | <misp_id> | MISP ID
3 | PMS_MSP_211 | System | Update MISP status | This event specifies that the MISP status is updated for id - <misp_id> | <misp_id> | MISP ID
4 | PMS_MSP_203 | System | Update MISP request | This event describes that the API call to update MISP request is successful | No ID | No ID Type
5 | PMS_MSP_204 | System | Validate MISP license key | This event describes that the API call to validate MISP license key is successful | No ID | No ID Type
6 | PMS_MSP_205 | System | Update MISP status request | This event describes that the API call to update MISP status is successful | No ID | No ID Type

### Failure response for System Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PMS_MSP_401 | System | Create MISP request | This event validates for invalid email id while creating MISP request | No ID	| No ID Type
2 | PMS_MSP_416	| System | Update MISP request | This event validates for invalid email id while updating MISP request | <misp_id> | MISP ID
3 | PMS_MSP_402 | System | Update MISP request | This event validates the MISP update request for already registered MISP with organization name | No ID | No ID Type
4 | PMS_MSP_417	| System | Create MISP request | This event validates the MISP create request for already registered MISP with organization name | No ID | No ID Type
5 | PMS_MSP_403 | System | Processing MISP status request | This event validates that the MISP status must either be approved or rejected for id - <misp_id> | <misp_id> | MISP ID
6 | PMS_MSP_404	| System | Processing MISP status request | This event specifies an MISP exception while processing an MISP status request | No ID | No ID Type
7 | PMS_MSP_405	| System | Processing MISP status request | This event specifies that the MISP is de-activated and hence cannot approve the de-activated MISP with id - <misp_id> | <misp_id> | MISP ID
8 | PMS_MSP_406	| System | Validate license key | This event specifies that no details were found while performing license key validations | No ID | No ID Type
9 | PMS_MSP_418	| System | Update MISP license key request | This event specifies that the MISP status must either be active or de-active for id - <misp_id> to update the MISP license key | <misp_id> | MISP ID
10 | PMS_MSP_407 | System | Update MISP status request | This event specifies that the MISP status must either be active or de-active for id - <misp_id> for updating MISP status request | <misp_id> | MISP ID

 
 
