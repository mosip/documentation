# Partner Management API's

## API Details
### API 1 (repeated per API)
TODO
* Links to API swagger documentation
    * API Signature (links)
    * Success Response Sample  (links)
    * Failure Response Samples (links)


## List of error codes
## PMS Core Service
Error Codes | Error Message | Error Description
------ | ----- | -----
PMS_COR_001 | Missing Input Parameter |  TO DO 
PMS_COR_002 | Invalid Input Parameter - for all attributes not as per defined data  | 
PMS_PRT_010 | Partner Type does not exist | 
PMS-PRT-310 | Invalid column received : %s | 
PMS-PRT-313 | Invalid pagination value received | 
PMS-PRT-312 | Filter type is missing | 
PMS-PRT-311 | Column is missing in request | 
PMS-PRT-314 | Missing sort field or sort type values | 
PMS-PRT-315 | Invalid from Value or to Value | 
PMS-PRT-356 | Pagination cannot be null | 
PMS-PRT-358 | Sort type %s is not supported | 
PMS-PRT-359 | Error occured while sorting | 
PMS-PRT-357 | Invalid sort field %s | 
KER-PRT-390 | Invalid filter value | 
PMS_PRT_001 | A Partner is already registered with the same Name | 
PMS_PRT_051 | A Partner is already registered with the same Id | 
PMS_PRT_108 | Certficate is not uploaded for the selected partner. | 
PMS_PRT_052 | PartnerId max length should be | 
PMS_ATH_053 | IO Exception occured while passing paging request | 
PMS_ATH_054 | User not found | 
PMS_ATH_500 | Server error occured,Please check the logs | 
PMS_PRT_061 | Partner policy mapping not exists. | 
PMS_PRT_062 | Partner api key request is approved already. Cannot add extractors now. | 
PMS_PRT_063 | Biometric extractors can be added only for | 
PMS_PRT_064 | No details found | 
PMS_PRT_070 | Credential mapping allowed only for | 
PMS_PRT_071 | Error occured while parsing policy string to json object | 
PMS_PRT_072 | Given credential type is not allowed. Allowed credential types | 
PMS_PRT_073 | Policy does not exists | 
PMS_PRT_074 | User exists with same email(keycloak) | 
PMS_PRT_005 | Partner does not exist | 
PMS_PRT_005 | No api key request exist | 
PMS_PRT_105 | Partner API KEY is not created | 
PMS_PRT_001 | Partner is already registered with Same policy Group | 
PMS_PRT_011 | Email is already exists | 
PMS_PRT_012 | Invalid email Id. | 
PMS-ATH-401 | Authentication Failed | 
PMS_PRT_106 | APIKeyReqID status is In-progress | 
PMS_KKS_001 | API not accessible | 
PMS_PRT_107 | Responese from the api is null | 
PMS_PRT_500 | Unable to process the request | 
PMS_PMP_016 | Partner is not active. | 
PMS_PRT_098 | Given policy under partner's policy group not exists | 
PMS_PMP_019 | Policy is not active. | 
PMS_PMP_023 | Policy group is not active. | 
PMS_PMP_018 | Policy expired. | 
PMP-AUT-020 | Parse Error exception | 
PMP-AUT-021 | Audit Exception from client | 
ADM-DPM-001 | Device is marked Inactive or not found | 
ADM-DPM-002 | Device is revoked/retired | 
ADM-DPM-009 | Error occurred while checking the Device Details | 
ADM-DPM-003 | Device Provider does not exist | 
ADM-DPM-004 | Device Provider is marked Inactive or not found | 
ADM-DPM-005 | DeviceServiceVersion not found | 
ADM-DPM-006 | MDS in inactive state | 
ADM-DPM-007 | Software version does not match against the Device Details | 
ADM-DPM-008 | Device code does not match against - %s | 
ADM-DPM-008 | Device code does not match against - type | 
ADM-DPM-008 | Device code does not match against - subType | 
ADM-DPM-012 | Error occurred while registering Device Provider | 
ADM-DPM-011 |  "%s Device Provider already exist | 
ADM-DPM-014 | Error occurred while updating a Device Provider | 
ADM-DPM-015 | Device code not mapped against device provider | 
ADM-DPM-016 | No such field present | 
PMP_AUT-030 | ftp provider does not exists. | 
PMP_AUT_031 | ftp chip id does not exists. | 
PMP_AUT_032 | Given provider,make and model already exists. | 
PMP_AUT_033 | Certificate is not uploaded. | 
PMP_AUT_034 | Ftp chip detail id and ftp provider id not mappped. | 
PMP_AUT-037 | Given ftp chip details already registered | 
PMS_AUT_008 | Error occured while validating Foundational | 
PMS_AUT_009 | Error occured while validating Foundational | 
PMS_AUT_010 | Error occured while validating Certification Level | 
PMS_AUT_011 | Device data can't be null | 
PMS_AUT_012 | Time Stamp input is %s min after the current timestamp | 
PMS_AUT_013 | Time Stamp input is %s min before the current timestamp | 
PMS_AUT_014 | Device Detail  does not exist in the list of Registered Device Details | 
PMS_AUT_015 | Serial no and Device detail already exist | 
PMS_AUT_016 | error occured while saving data | 
PMS_AUT_016 | Registered device not found | 
PMS_AUT_024 | Device already deregistered | 
PMS_AUT_025 | Device code greater than the accepted length | 
PMS_AUT_024 | Invalid environment | 
PMS_AUT_017 | Error occured while de registering device | 
PMS_AUT_018 | Device details not found | 
PMS_AUT_019 | FTP not found | 
PMS_AUT_021 | error occured while doing signature validation | 
PMS_AUT_022 | Signature validation failed | 
PMS_AUT_020 | Serial number does not exist | 
PMS_AUT_023 | error occured while fetching api resource | 
PMS_AUT_030 | If certification level received is L1 then foundational Trust Provider Id should not be null or empty | 
PMS_AUT_031 | Device info timestamp cannot be null. | 
PMS_AUT_032 | Error while signing the response | 
PMS_AUT_006 | Invalid device detail | 
PMS_AUT_007 | Secure Biometric Interface not found for the id %s | 
PMS_AUT_026 | Approval Status should be Activate / De-activate | 
PMS_POL_001 | Policy Manager does not exist | 
PMS_POL_002 | Mismatch of Policy Manager Credentials | 
PMS_POL_004 | Policy Name already exists in the policy Group.Name | 
PMS_POL_005 | Unsupported KYC attribute in the Policy File | 
PMS_POL_006 | Unsupported Authentication Type in the Policy File | 
PMS_POL_007 | eKYC attribute missing in the policy file | 
PMS_POL_008 | Policy ID does not exist | 
PMS_POL_009 | Auth policy exists with name | 
PMS_COR_003 | Could not process the request | 
PMS_POL_009 | Auth Policies are not defined against the policy | 
PMS_POL_013 | No policy available for given PartnerAPIKey | 
PMS_POL_014 | Policy group exists with name | 
PMS_POL_015 | Policy group and policy not mapped | 
PMS_POL_016 | Policy Group ID does not exist | 
PMS_POL_017 | No policy available for given partner | 
PMS_POL_018 | Given partner and policy are not mapped. | 
PMS_POL_019 | Policy group name does not exist | 
PMS_POL_020 | Can not publish the published policy | 
PMS_POL_021 | allowed auth types are not required for policyType | 
PMS_POL_022 | Given auth token type is not allowed | 
PMS_POL_023 | Given policy type is not allowed | 
PMS_POL_045 | Policy Status either Active or De-active. | 
PMS_POL_046 | Datashare attributes are not required for given policyType | 
PMS_POL_047 | Shareable attributes are not required for given policy Type | 
PMS_POL_048 | Allowed KYC attributes are not required for given policyType | 
PMS_POL_050 | The given version is not available.Allowed versions are | 
PMS_POL_051 | Policy Schema and policy are not matching | 
PMS_POL_052 | Error occured while parsing policy string to json object | 