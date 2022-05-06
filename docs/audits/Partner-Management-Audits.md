Partner Management provides services for various types of partners associated with the MOSIP system. Currently, in MOSIP we have identified some types of partners, but the adopters can choose to add many more partners.

# Partner Management Service
Partners in MOSIP are created in a self-service mode. The partner visit the MOSIP partner management portal and requests for collaborating with MOSIP by providing basic details such as organization name & email id, purpose of registration (how they want to collaborate with MOSIP as a device provider, authentication partner, print partner, etc), basic credentials and performing an OTP based verification.

## User Event Type
The following events are triggered as part of User Event Type in Partner Management Service module

### Request Information for User Event Type

Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
---------|------------|------------|-------------|--------------|-------------------
PMS_PRT_101 | User | Register Partner | This event triggers an API call to create Partner in mosip database | No ID | No ID Type
PMS_PRT_112 | User | Register Partner | This event triggers an API call to create Partner Key in mosip database | Partner ID | Partner ID

### Success Response for User Event Type

Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
---------|------------|------------|-------------|--------------|-------------------
PMS_PRT_200 | User | Register Partner | This event describes that the API call to create Partner in Mosip DB is successful | No ID | No ID Type
PMS_PRT_212 | User | Create Partner Key | This event describes that the creation of Partner Key for - (Partner ID) in Mosip DB is Successful | Partner ID | Partner ID

## System Event Type
The following events are triggered as part of System Event Type in Partner Management Service module.

### Request Information for System Event Type

Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
---------|------------|------------|-------------|--------------|-------------------
PMS_PRT_122 | System | Create Partner | This event triggers an API call to create Partner API key in mosip database. | No ID | No ID Type
PMS_PRT_111 | System | Create Partner |	This event triggers an API call to create Partner Biometrics in mosip database. | No ID | No ID Type
PMS_PRT_121 | System | Create Partner Policy Map | This event triggers an API call to create Partner Policy mapping in mosip database. | No ID | No ID Type
PMS_PRT_144 | System | Create Partner Policy Map | This event triggers an API call to create or update Partner contact details in mosip database. |	No ID |	No ID Type
PMS_PRT_149 | System | Get Partner | This event triggers an API call to fetch the Partner details. | No ID | No ID Type
PMS_PRT_159 | System | Get Partner | This event triggers an API call to fetch the Partner API key details. | No ID | No ID Type
PMS_PRT_169 | System | Get Partner | This event triggers an API call to fetch the Partner certificate. | No ID | No ID Type

### Success Response for System Event Type

Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
---------|------------|------------|-------------|--------------|-------------------
PMS_PRT_222 | System | Create Partner | This event describes that the Partner API key with id - (Partner ID) is approved successfully. | No ID | No ID Type
PMS_PRT_211 | System | Create Partner | This event describes that the Partner Biometrics are created successfully. | No ID | No ID Type
PMS_PRT_221 | System | Create Partner Policy Mapping | This event describes that the Partner Policy mapping is created successfully. | No ID | No ID Type
PMS_PRT_244 | System | Create Partner Policy Mapping | This event describes that the API call to Create or update partner contact details is successful. | No ID | No ID Type
PMS_PRT_249 | System | Get Partner | This event describes that the API call to fetch partner details is successful. | No ID | No ID Type
PMS_PRT_259 | System | Get Partner | This event describes that the API call to fetch partner API keys is successful. | No ID | No ID Type
PMS_PRT_269 | System | Get Partner | This event describes that the API call to fetch partner Certificate is successful. | No ID | No ID Type

### Failure Response for System Event Type

Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
---------|------------|------------|-------------|--------------|-------------------
PMS_PRT_401 | System | Create Partner Request | This event validates for Invalid email id while creating the partner. | No ID |	No ID Type
PMS_PRT_416 | System | Update Partner Request | This event validates the email ID for a (partner ID). | Partner ID | Partner ID
PMS_PRT_402 | System | Update Partner Request | This event validates if the Partner is already registered for a (partner ID). | Partner ID | Partner ID
PMS_PRT_417 | System | Create Partner Request | This event validates the create partner request for already registered partner with organization name. | No ID | No ID Type
PMS_PRT_419 | System | Create Partner Request | This event describes that the policy group does not exist. | No ID | No ID Type
PMS_PRT_421 | System | Create Partner API Key request |	This event specifies that the partner does not exist. |	No ID |	No ID Type
PMS_PRT_423 | System | Add Biometric Extractors Request | This event specifies that the partner policy mapping does not exist. | No ID | No ID Type
PMS_PRT_425 | System | Partner not allowed | This event specifies that the partner is not allowed to register. | No ID | No ID Type
PMS_PRT_429 | System | Email not allowed | This event specifies that the partner email ID is not allowed. | No ID |	No ID Type
PMS_PRT_431 | System |	Create Partner | This event specifies that the API call to upload the partner certificate failed. | No ID |	No ID Type
PMS_PRT_452 | System |	Create Partner | This event specifies that the API call to upload the partner certificate failed. | No ID |	No ID Type

# Policy Management Service
The Partner Management service also involves policy management for Partners. Each partner can access various services only based on a defined policy.In order to create a policy we must have a policy group first. The policy admin needs to first create a policy group using the partner management portal.

## System Event Type
The following events are triggered as part of System Event Type in Policy Management Service.

### Request Information for System Event Type

Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
---------|------------|------------|-------------|--------------|-------------------
PMS_PRT_115 | System | Create Policy Group | This event triggers an API call to create a policy group in MOSIP database. | No ID | No ID Type
PMS_PRT_116 | System | Create Policy Group | This event triggers an API call to fetch the policy group details. | No ID | No ID Type
PMS_PRT_156 | System | Update Policy Group | This event triggers an API call to update a policy group in MOSIP database | No ID | No ID Type
PMS_PRT_137 | System | Create Policy | This event triggers an API call to create the policy for a policy group in MOSIP database. | No ID | No ID Type
PMS_PRT_187 | System | Create Policy | This event triggers an API call to fetch the policy details. | No ID | No ID Type
PMS_PRT_183 | System | Update Policy | This event triggers an API call to update a particular policy inside a policy group in MOSIP database. | No ID | No ID Type

### Success Response for System Event Type

Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
---------|------------|------------|-------------|--------------|-------------------
PMS_PRT_215 | System | Create Policy Group | This event describes that the API call to create policy group is successful. | No ID | No ID Type
PMS_PRT_216 | System | Create Policy Group | This event specifies that the API call to fetch the policy group details is successful. | Policy Group ID | Policy Group ID 
PMS_PRT_256 | System | Update Policy Group | This event describes that the API call to update policy group is successful. | Policy Group ID | Policy Group ID
PMS_PRT_237 | System | Create Policy | This event describes that the API call to create a policy for a policy group is successful. | No ID | No ID Type
PMS_PRT_287 | System | Create Policy | This event specifies that the API call to fetch the policy details is successful. | Policy ID | Policy ID
PMS_PRT_283 | System | Update Policy | This event describes that the API call to update a policy for a policy group is successful. | Policy ID | Policy ID

### Failure Response for System Event Type

Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
PMS_PRT_475 | System | Create Policy Group | This event describes that the API call to create policy group has failed. | No ID | No ID Type
PMS_PRT_416 | System | Create Policy Group | This event specifies that the API call to fetch the policy group details has failed. | Policy Group ID | Policy Group ID 
PMS_PRT_456 | System | Update Policy Group | This event describes that the API call to update policy group has failed. | Policy Group ID | Policy Group ID
PMS_PRT_437 | System | Create Policy | This event describes that the API call to create a policy for a policy group has failed. | No ID | No ID Type
PMS_PRT_487 | System | Create Policy | This event specifies that the API call to fetch the policy details has failed. | Policy ID | Policy ID
PMS_PRT_483 | System | Update Policy | This event describes that the API call to update a policy for a policy group has failed. | Policy ID | Policy ID


# MISP Management Service
MISP (MOSIP Infrastructure Service Provider) who provides infrastructure to send authentication request through a secure channel.

## User Event Type
The following events are triggered as part of User Event Type in MISP management module

### Request Information for User Event Type

Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
---------|------------|------------|-------------|--------------|-------------------
PMS_MSP_101 | User | Register MISP | This event triggers an API call to create MISP in MOSIP database | No ID | No ID Type
	
### Success response for User Event Type

Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
---------|------------|------------|-------------|--------------|-------------------
PMS_MSP_200 | User | Register MISP | This event describes that the API call to create MISP in MOSIP database is successful | No ID | No ID Type
PMS_MSP_212 | User | Register MISP | This event describes that the creation of MISP id - <misp_id> in MOSIP database is Successful | <misp_id> | MISP ID

## System Event Type
The following events are triggered as part of System Event Type in MISP management module

### Request Info for System Event Type
	
Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
---------|------------|------------|-------------|--------------|-------------------	
PMS_MSP_102 | System | Register MISP | This event specifies that the kernel MISP ID generator is called to Generate the MISP ID. | No ID | No ID Type
PMS_MSP_103 | System | Register MISP | This event specifies that the MISP details created successfully | No ID | No ID Type
PMS_MSP_104 | System | Processing of MISP status request | This event calls the API to update MISP status with ID - <misp_id> | <misp_id> | MISP ID
PMS_MSP_104 | System	| Processing of MISP status request | This event validates the MISP ID - <misp_id> | <misp_id> | MISP ID
PMS_MSP_105 | System | Processing of MISP status request | This event specifies that the MISP license key is not generated for rejected misp with id - <misp_id> | <misp_id> | MISP ID
PMS_MSP_106	| System | Processing of MISP status request | This event updates the MISP license status for ID - <misp_id> | <misp_id> | MISP ID
PMS_MSP_107	| System | Update MISP request | This event calls the API to update MISP request | No ID | No ID Type
PMS_MSP_108 | System | Update MISP request | This event returns the updated MISP status | No ID	| No ID Type
PMS_MSP_109 | System | Validate license key | This event calls the API to validate MISP license key | No ID	| No ID Type
PMS_MSP_110 | System | Validate license key | This event fetches the license key details for MISP ID - <misp_id> | <misp_id> | MISP ID
PMS_MSP_111 | System | Validate license key | This event specifies the license key for MISP is <misp_id> | <misp_id> | MISP ID
PMS_MSP_112 | System | Update MISP status request | This event calls the API to update MISP status  | No ID | No ID Type
PMS_MSP_113 | System | Update MISP status request | This event specifies the MISP status is <misp_id> | <misp_id> | MISP ID
PMS_MSP_114 | System | Update MISP license key request | | No ID	| No ID Type
		
### Success response for System Event Type

Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
---------|------------|------------|-------------|--------------|-------------------
PMS_MSP_201 | System | Processing MISP status request | This event describes that the API  call to update MISP status with id - <misp_id> is successful | <misp_id> | MISP ID
PMS_MSP_202 | System | Processing MISP status request | This event specifies that the MISP status is updated for id - <misp_id> | <misp_id> | MISP ID
PMS_MSP_211 | System | Update MISP status | This event specifies that the MISP status is updated for id - <misp_id> | <misp_id> | MISP ID
PMS_MSP_203 | System | Update MISP request | This event describes that the API call to update MISP request is successful | No ID | No ID Type
PMS_MSP_204 | System | Validate MISP license key | This event describes that the API call to validate MISP license key is successful | No ID | No ID Type
PMS_MSP_205 | System | Update MISP status request | This event describes that the API call to update MISP status is successful | No ID | No ID Type

### Failure response for System Event Type

Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
---------|------------|------------|-------------|--------------|-------------------
PMS_MSP_401 | System | Create MISP request | This event validates for invalid email id while creating MISP request | No ID	| No ID Type
PMS_MSP_416	| System | Update MISP request | This event validates for invalid email id while updating MISP request | <misp_id> | MISP ID
PMS_MSP_402 | System | Update MISP request | This event validates the MISP update request for already registered MISP with organization name | No ID | No ID Type
PMS_MSP_417	| System | Create MISP request | This event validates the MISP create request for already registered MISP with organization name | No ID | No ID Type
PMS_MSP_403 | System | Processing MISP status request | This event validates that the MISP status must either be approved or rejected for id - <misp_id> | <misp_id> | MISP ID
PMS_MSP_404	| System | Processing MISP status request | This event specifies an MISP exception while processing an MISP status request | No ID | No ID Type
PMS_MSP_405	| System | Processing MISP status request | This event specifies that the MISP is de-activated and hence cannot approve the de-activated MISP with id - <misp_id> | <misp_id> | MISP ID
PMS_MSP_406	| System | Validate license key | This event specifies that no details were found while performing license key validations | No ID | No ID Type
PMS_MSP_418	| System | Update MISP license key request | This event specifies that the MISP status must either be active or de-active for id - <misp_id> to update the MISP license key | <misp_id> | MISP ID
PMS_MSP_407 | System | Update MISP status request | This event specifies that the MISP status must either be active or de-active for id - <misp_id> for updating MISP status request | <misp_id> | MISP ID
