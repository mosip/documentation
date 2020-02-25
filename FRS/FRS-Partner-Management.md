## Table Of Contents
- [1. Users and Roles](#1-users-and-roles-)
  * [1.1 User Creation](#11-user-creation-) _(PM FR 1.1)_
  * [1.2 Role Mapping](#12-role-mapping-)
    * [1.2.1 MISP](#121-misp-) _(PM_FR_1.2)_
    * [1.2.2 Partner](#122-partner-) _(PM_FR_1.3)_
    * [1.2.3 Policy Manager](#123-policy-manager-) _(PM_FR_1.4)_
    * [1.2.4 Partner Manager](#124-partner-manager-) _(PM_FR_1.5)_
  * [1.3 Policy Group Assignment (Regulator)](#13-policy-group-assignment-regulator-) _(PM FR 1.6)_
- [2. MISP Activities](#2-misp-activities-)
  * [2.1 License Key Management ](#21-license-key-management-) _(PM FR 2.1)_
- [3. Partner Activities](#3-partner-activities-)
  * [3.1 Registration](#31-registration-) _(PM FR 3.1)_
  * [3.2 API Key Management](#32-api-key-management-) _(PM FR 3.2)_
  * [3.3 Certificate Management](#33-certificate-management-) _(PM FR 3.3)_
- [4. Policy Manager Activities](#4-policy-manager-activities-)
  * [4.1 Policy Management](#41-policy-management-)
    * [4.1.1 Creation and Publication of Authentication Policies](#411-creation-and-publication-of-authentication-policies-) _(PM_FR_4.1)_
    * [4.1.2 List, View, Add, Edit, Activate, Deactivate Policies](#412-list-view-add-edit-activate-deactivate-policies-) _(PM_FR_4.2)_
    * [4.1.3 Filtered by Policy Group (Regulator)](#413-filtered-by-policy-group-regulator-) _(PM_FR_4.3)_
- [5. Partner Manager Activities](#5-partner-manager-activities-)
  * [5.1 Partner Management](#51-partner-management-) _(PM_FR_5.1 & 5.2)_
    * [5.1.1 Filtered by Policy Group (Regulator)](#511-filtered-by-policy-group-regulator-) _(PM_FR_5.3)_
  * [5.2 Partner Policy Assignment](#52-partner-policy-assignment-) _(PM_FR_5.4)_ 
- [6. Impact on Authentication](#6-impact-on-authentication)
* [List of Configurable Parameters and Processes](#list-of-configurable-parameters-and-processes-)
* [Partner Management API](#partner-management-api-)
* [Process View](#process-view-)

## [Introduction of Partner Management](Partner-Management)

# 1. Users and Roles [**[↑]**](#table-of-contents)	 
## 1.1 User Creation [**[↑]**](#table-of-contents)
MOSIP allows the creation of the following roles: MISP, Partners, Partner Manager, and Policy Manager.

MOSIP Admin will create and manage the roles MISP, Policy Manager and Partner Manager. Partners are created in a 
self-service mode.

The system also allows Updation, Retrieval, Activation and Deactivation of the user.
 
## 1.2 Role Mapping [**[↑]**](#table-of-contents) 
### 1.2.1 MISP [**[↑]**](#table-of-contents)
#### A. MISP Creation
Upon receiving a request to create MISP with the parameters, the system performs the following steps:
1. Validates the credentials of the MOSIP Admin.
1. The system then validates if the MISP is not registered earlier using the same MISP Organization Name.
1. The system then  generate MISP ID as per the logic defined below:
   * The MISP ID is a numeric 3 digit number. The length can be configurable
   * Each new MISP ID should be incremented by 1 for each new request
   * MISP ID generation should start from 100
   * Each generated ID should be unique
1. In case of Exceptions, system triggers relevant error messages.
1. The system then generates MISP License key and sets the default expiry of the key as  6 months. The License Key expiry is configurable.
1. The default status of MISP and MISP License Key is active.
1. The actor responds with the parameters: MISP ID, MISP status, MISP License Key, MISP License Key expiry, MISP License Key status, err (as applicable).
#### B. Retrieve MISPs 

An Admin user can retrieve a MISP ID

Upon receiving a request from the admin user to retrieve MISP ID, the system performs the following steps:
1. Validates the credentials of the MOSIP Admin 
1. A standard MISP retrieval request must have the following parameters based on which the system will retrieve the MISP-MOSIP Admin Username, MOSIP Admin Password, MISP Organization Name
1. The system fetches the data based on complete or partial match. Partial Match is defined as ‘when the input string is available in any part of a MISP Organization Name’ 
1. The system then fetches all the MISPs available in the system if the input parameter is not provided
1. The system responds with the following parameters: MISP ID, MISP status, MISP Organization Name,MISP Contact Number, MISP Email ID, MISP Address,MISP License Key, MISP License Key expiry, MISP License key status for all the MISPs retrieved, err (as applicable).
#### C. Update MISPs 

An Admin user can update MISPs
	
Upon receiving a request from the admin user to update an  MISP, the system performs the following steps:
1. Validates the credentials of the MOSIP Admin
1. Ideally an update MISP request should have the following parameters: MOSIP Admin Username, MOSIP Admin Password, MISP ID, MISP Organization Name, MISP Contact Number, MISP Email ID, MISP Address
1. The system updates the record based on the MISP ID and based on the requested parameters and responds with a status, err (as applicable)

#### D. Deactivate/Suspend MISP and MISP License

An Admin user can update MISP License key status

Ideally an update MISP License key status request should have the following parameters: MOSIP Admin Username, MOSIP Admin Password, MISP ID, MISP status, MISP License Key and MISP License key status

Upon receiving a request from the admin user to update an MISP License key status the system performs the following steps:
1. Validates the following:
   * The credentials of the MOSIP Admin
   * Validates if MISP ID is valid
   * Validates if MISP License Key is associated to the MISP ID
1. The system updates the ‘MISP License Key Status’ for the MISP ID and MISP License key in the request
1. The system updates the ‘MISP Status’ for the MISP ID
1. The system validates if the status to be updated is ‘‘Deactive' then the MISP/MISP Admin should not be allowed to access any services of PM.
1. The system validates if the status to be updated is ‘Active’ from ‘Deactivated’ for the MISP License Key, then the expiry time period tracking for License key time validity as per configuration should be re-initiated
1. The system then responds with a status, err (as applicable).


### 1.2.2 Partner [**[↑]**](#table-of-contents)

#### A. Partner Creation 
Upon receiving a request to generate partner ID, the system performs the following steps:
1. Partner ID will be created based on default logic. 
1. The number of digits for Partner ID generation will be configurable
1. The system then responds with the Partner ID, err (as applicable) to the source 
1. Raises an alert in case of exceptions 

#### B. Create Auth/E-KYC Partners
For creation of Auth/E-KYC Partners its necessary that Partners Role exists in the system. The partner must download digital certificates signed by MOSIP and upload digital certificate (either MOSIP provided/third party provided).
1. Upon receiving a request to create Partner with the parameters: Partner Organization Name, Partner Contact Number, Partner Email ID, Partner Address Policy Group the system validates if the a partner is not registered earlier using the same Partner Organization Name in the policy group 
1. The system then generates Partner ID (PM to integrate with IAM to obtain the Partner ID (user-id)
1. The default status of Partner is set as active.
1. The system responds with the parameters: Partner ID, Partner status, err (as applicable). partner ID generated will be the partner User Name

### 1.2.3 Policy Manager [**[↑]**](#table-of-contents)
#### A. Generate Policy Manager ID
Upon receiving a request to generate Policy Manager ID, the system performs the following steps:
1. MOSIP Admin will create Policy Manager.
1. The system then responds with the Policy Manager ID, err (as applicable) to the source 
1. Raises an alert in case of exceptions 

### 1.2.4 Partner Manager [**[↑]**](#table-of-contents)

#### A. Generate Partner Manager ID
Upon receiving a request to generate Partner Manager ID, the system performs the following steps:
1. MOSIP Admin will create Partner Manager
1. The system then responds with the Partner Manager ID to the source 
1. Raises an alert in case of exceptions

## 1.3 Policy Group Assignment (Regulator) [**[↑]**](#table-of-contents)
* A Country should define all the policy groups in the Country
* One Partner Manager should be created in IAM for each of these policy groups
* In general Partner Manager and Policy Manger should be mapped to any of the policy groups created above
 
# 2. MISP Activities [**[↑]**](#table-of-contents)	 
## 2.1 License Key Management [**[↑]**](#table-of-contents)
#### A. Generate MISP License Key
Upon receiving a request to generate License Key, the system performs the following steps:
1. MISP License key will be issued during creation of MISP.
1. Generates License Key as per default License Key generation logic defined below:
   * License Key Generation should follow a random generation pattern
   * License Key should be alphanumeric
   * License Key generated should be of length of 8 digits 
   * Each generated key should be unique
1. The system then responds with the License Key, err (as applicable) to the source 
1. The system raises an alert in case of exceptions 
#### B. Regenerate MISP License Key
Upon receiving a request to regenerate License Key with the input parameter, such as MISP Admin Username, MISP Admin Password/Security token, and MISP License Key, the system performs the following steps:

1. Validates if the MISP License Key is active.
1. Validates if the status of the MISP License key is expired.
1. Generates a new license key and associates expiry (configurable) to the License key. The default period is 6 months
1. Sets the default status of MISP License Key as active.
1. Responds with the parameter, such as MISP License Key, MISP License key Status, MISP License Key expiry, err (as applicable).
# 3. Partner Activities [**[↑]**](#table-of-contents)	
## 3.1 Registration [**[↑]**](#table-of-contents) 
#### A. Create Auth/E-KYC Partners
Upon receiving a request to create Partner with the input parameters, such as Partner Organization Name, Partner Contact Number, Partner Email ID, and Partner Address Policy Group, the system performs the following steps:
1. Validates if a partner is not registered earlier using the same Partner Organization Name in the policy group.
1. Generates Partner ID.
1. Sets the default status of Partner as active.
1. Responds with the parameters, such as Partner ID, Partner status, err (as applicable).
   * Partner ID generated will be the partner User Name.

#### B. Retrieve Auth/E-KYC Partners
Upon receiving a request to retrieve Partner with the input parameters, such as Partner Username and Partner Password/Security token, the system performs the following steps:
1. Validates the credentials of the partner, such as Partner Username and Partner Password/security token.
1. Fetches the data based on exact match of Partner Username/Partner ID.
1. Responds with the parameters, such as PartnerID, Partner status, Partner Organization Name, Partner Contact Number, Partner Email ID, Partner Address, and err (as applicable).
#### C. Update Auth/E-KYC Partners
Upon receiving a request to update Partner with the input parameters, such as Partner Username, Partner Password/security token, Partner Organization Name, Partner Contact Number, Partner Email ID, and Partner Address, the system performs the following steps:
1. Validates the credentials of the partner, such as Partner Username and Partner Password/security token.
1. If Partner Organization Name is provided for update, the system validates if the provided Partner Organization Name is not registered earlier for an entity in the policy group.
1. Updates the input data provided based on the located Partner ID (Partner Username).
1. Responds with the parameters, such as status message, and err (as applicable).

## 3.2 API Key Management [**[↑]**](#table-of-contents) 
#### A. View policies available for policy group to place a request for a partner API key
Upon receiving a request to fetch a Policy with input parameters, such as Partner Username, Partner Password/security token, the system performs the following steps:
1. Validates the credentials of the partner, such as Partner Username and Partner Password/security token.
1. Retrieves all the active policies defined for the Policy Group.
1. Responds to the source with the attributes, such as Policy ID, Policy Name, Policy Description, and Policy file for all the policies retrieved.
#### B. Submit Partner API key request
Upon receiving a request to submit Partner API key request with input parameters, such as Partner Username, Partner Password/security token, Policy Name, and Use Case Description, the system performs the following steps:
1. Validates the credentials of the partner, such as Partner Username and Partner Password/security token.
1. Generates Partner API key Request Number and sets the default status to ‘In Progress’. 
1. Responds to the source with the attributes, such as Partner API key Request Number, and err (as applicable).
#### C. View Partner API key status
Upon receiving a request to view Partner API key status with the input parameters, such as Partner Username, Partner Password/security token, Partner API key Request Number, the system performs the following steps:
1. Validates the credentials of the partner, such as Partner Username and Partner Password/security token.
1. Retrieves the status of the Partner API key Request Number. The status can be ‘In Progress', ‘Approved’, ‘Rejected’, 'Issued’
1. Validates if the status is ‘Issued’ then retrieves the Partner API key corresponding to the Partner API key Request Number.
1. Responds to the source with the attributes, such as Partner API key Request Status, Partner API key and Partner API key Time Validity (as applicable), and err (as applicable).

## 3.3 Certificate Management [**[↑]**](#table-of-contents)
#### A. Upload Partner digital certificate
Upon receiving a request to upload digital certificate with the input parameters, such as Partner Username, Partner Password/security token, and Partner Digital Certificate, the system performs the following steps:
1. Validates the credentials of the partner, such as Partner Username and Partner Password/security token.
1. Sends the reference of the digital certificate to be stored in kernel.
1. Sends the response with status and err (as applicable).

#### B. Download MOSIP digital certificate
Upon receiving a request to download digital certificate with the input parameters, such as Partner Username and Partner Password/security token, the system performs the following steps:
1. Validates the credentials of the partner, such as Partner Username and Partner Password/security token.
1. Integrates with kernel component to retrieve MOSIP digital certificate.
1. Sends the response with MOSIP Digital Certificate and err(as applicable).

# 4. Policy Manager Activities [**[↑]**](#table-of-contents)
## 4.1 Policy Management [**[↑]**](#table-of-contents)
### 4.1.1 Creation and Publication of Authentication Policies [**[↑]**](#table-of-contents)
Upon receiving a request to create a Policy with input parameters (Policy Manager Username, Policy Manager Password, Policy Name, Policy Description, and Policy File), the system performs the following steps:
1. Validates the credentials of the Policy Manager.
1. Validates if the policy file contains only the authentication types supported in MOSIP.
1. Validates if the policy file contains only the eKYC attributes supported in MOSIP.
1. Creates a policy and store the policy attributes and associate the policy created to the Policy Group of the Policy Manager.
1. The status of the policy will be set as ‘Active’ by default.
1. Sends the response with ‘Policy ID’, ‘Policy Status’
 
### 4.1.2 List, View, Add, Edit, Activate, Deactivate Policies [**[↑]**](#table-of-contents)
#### A. Retrieve Auth/E-KYC Policy
Upon receiving a request to fetch a Policy with input parameters (Policy Manager Username, Policy Manager Password, and Policy Name), the system performs the following steps:
1. Validates the credentials of the Policy Manager
1. Fetches the data based on a complete/partial match of Policy Name and the Policy Group of the Policy Manager
1. If the input parameter received is null or empty, then fetches all the data of the Policies of the Policy Group of the Policy Manager. 
1. Responds to the source with the attributes, such as Policy ID, Policy Name, Policy Description, Policy Status, and Policy file.
#### B. Update Auth/E-KYC Policy 

Upon receiving a request to update a Policy with input parameters (Policy Manager Username, Policy Manager Password, Policy ID, Policy Name, Policy Description, and Policy File), the system performs the following steps:
1. Validates the credentials of the Policy Manager
1. Validates if the policy file contains only the authentication types supported in MOSIP.
1. Validates if the policy file contains only the eKYC attributes supported in MOSIP.
1. Validates if the Policy ID and the Policy Manager belong to the same Policy Group.
1. Updates the policy details based on the Policy ID and the other request parameters
1. Responds to the source with the required success message.

#### C. Deactivate Auth/E-KYC Policy
Upon receiving a request to update a Policy with input parameters (Policy Manager Username, Policy Manager Password, Policy ID, and Policy Status), the system performs the following steps:
1. Validates the credentials of the Policy Manager.
1. Validates if the Policy ID and the Policy Manager are associated to the same Policy Group.
1. Responds to the source with the required success message.
### 4.1.3 Filtered by Policy Group (Regulator) [**[↑]**](#table-of-contents)
# 5. Partner Manager Activities [**[↑]**](#table-of-contents)	 
## 5.1 Partner Management [**[↑]**](#table-of-contents) 
#### A. Activate/Deactivate Auth/E-KYC Partners
Upon receiving a request to update the partner status with the input parameters, such as Partner Manager Username, Partner Manager Password/security token, Partner ID, and Partner Status, the system performs the following steps:
1. Validates the credentials of the partner, such as Partner Manager Username and Partner Manager Password/security token.
1. Validates if Partner ID is valid.
1. Validates if Partner ID belong to the policy group of the Partner Manager.
1. After all the validations are performed, the system updates the ‘Partner Status’ for the requested Partner ID and responds with the status message.
  
#### B. View Auth/E-KYC Partners
Upon receiving a request to retrieve the Partner with the input parameters, such as Partner Manager Username and Partner Manager Password/Security token, the system performs the following steps:
1. Validates the credentials of the partner, such as Partner Manager Username and Partner Manager Password/security token.
1. Retrieves the policy group of the Partner Manager.
1. Fetches all the partner details of the partners registered in the policy group.
1. Then the system responds with the parameters, such as PartnerID, Partner status, Partner Organization Name, Partner Contact Number, Partner Email ID, Partner Address, and err (as applicable).

### 5.1.1 Filtered by Policy Group (Regulator) [**[↑]**](#table-of-contents)
#### A. View  Partner API key requests based on 'policy group'
Upon receiving a request to retrieve the Partner API key with the input parameters, such as Partner Manager Username and Partner Manager Password/Security token, the system performs the following steps:
1. Validates the credentials of the partner, such as Partner Manager Username and Partner Manager Password/security token.
1. Retrieves the policy group of the Partner Manager.
1. Fetches all the partner API key requests of the partners registered in the policy group.
1. Then the system responds with the parameters, such as PartnerID, Partner status, Partner Organization Name, Policy Name, Use Case Description, Partner API key Request Number, err (as applicable).
#### B. Approve/Reject Partner API key requests based on 'policy group'
Upon receiving a request to retrieve the Partner API key with the input parameters, such as Partner Manager Username, Partner Manager Password/Security token, Partner API key Request Number, and Partner API key Request Status, the system performs the following steps:
1. Validates the credentials of the partner, such as Partner Manager Username and Partner Manager Password/security token.
1. Validates if the Partner API key Request Number is available in the database.
1. Retrieves the policy group of the Partner Manager.
1. Validates if the Partner API key Request Number is from the partner of the same policy group.
1. Updates the Partner API key Request Status in the request for the Partner API key Request Number.
1. Validates if the status to be updated is ‘Approved’ and generates a Partner API key.
1. Then the system responds with the parameters, such as status, Partner API key (as applicable), Partner API key status (as applicable), and err (as applicable).

## 5.2 Partner Policy Assignment [**[↑]**](#table-of-contents)
#### A. Generate Partner API key 

Upon receiving a request to generate Partner API key, the system performs the following steps:
1. Generates Partner API key as per the defined logic mentioned below:
   * Partner API key Generation must follow a random generation pattern
   * Partner API key must be alphanumeric
   * Partner API key generated must be of length of 6 digits 
1. Responds with the Partner API key, err (as applicable) to the source.
1. In case of exceptions, system triggers the relevant error messages.

#### B. Retrieve Auth/E-KYC Policy for policy group to assign relevant policy to partner API key 
Upon receiving a request to fetch a Policy with the input parameters, such as Partner Manager Username, Partner Manager Password, and Policy Name, the system performs the following steps:
1. Validates the credentials of the Policy Manager.
1. Validates if the policy name is available in the database.
1. Fetches the data based on a complete/partial match of Policy Name and the Policy Group of the Partner Manager
1. If the input parameter received is null or empty, then the system fetches all the data of the Policies of the Policy Group of the Partner Manager. 
1. Responds to the source with the attributes, such as Policy ID, Policy Name, Policy Description, Policy Status, and Policy file.

#### C. Create “Partner API key to Policy” Mappings

Upon receiving a request to retrieve Partner API key requests with the input parameters, such as Partner Manager Username, Partner Manager Password/Security token, Partner API key, and policy ID, the system performs the following steps:
1. Validates the credentials of the partner, such as Partner Manager Username and Partner Manager Password/security token.
1. Validates if the policy ID and partner API key are available in the database.
1. Retrieves the partner ID, who has placed the request for the partner API key.
1. Validates if the policy ID and the partner ID belong to the policy group of the Partner Manager.
1. Assigns the policy ID to the Partner API key.
1. Retrieves the status of the Partner API key request number.
1. Updates the status of the Partner API key request number to ‘Issued’
1. Sets the status of the Partner API key to ‘active’. 
1. Then the system responds with the parameters, such as status, err (as applicable).
#### D. Retrieve “Partner API key to Policy” Mappings

Upon receiving a request to retrieve Partner API key requests with the input parameters, such as Partner Manager Username, Partner Manager Password/Security token, and Partner API key, the system performs the following steps:
1. Validates the credentials of the partner, such as Partner Manager Username and Partner Manager Password/security token.
1. Validates if the Partner API key is available in the database.
1. Validates if the Partner API key was issued by the Partner Manager (belongs to the same policy group of the Partner Manager).
1. Fetches the data based on a complete match of Partner API key of the Partner Manager.
1. If the input parameter received is null or empty, the system fetches the policy of all the Partner API keys of the Policy Group of the Partner Manager. 
1. Then the system responds with the parameters, such as policy ID, err (as applicable) for the partner API keys retrieved.

#### E. Activate/deactivate Partner API key based on 'policy group'
Upon receiving a request to retrieve Partner API key requests with the input parameters, such as Partner Manager Username, Partner Manager Password/Security token, Partner API key, and Partner API key status, the system performs the following steps:
1. Validates the credentials of the partner, such as Partner Manager Username and Partner Manager Password/security token.
1. Validates if the Partner API key is available in the database.
1. Retrieves the policy group of the partner who is issued the Partner API key.
1. Validates if the policy group of the Partner Manager is same as that of the Partner
1. Updates the status of the Partner API key and then responds with the parameters, such as status, err (as applicable).
#### F. Update Partner API key to Policy Mappings 
Upon receiving a request to retrieve Partner API key requests with the input parameters, such as Partner Manager Username, Partner Manager Password/Security token, Partner API key, old policy ID, and new policy ID, the system performs the following steps:
1. Validates the credentials of the partner, such as Partner Manager Username and Partner Manager Password/security token.
1. Validates if the Partner API key is available in the database.
1. Validates if old policy ID is available in the database.
1. Validates if new policy ID is available in the database.
1. Validates if the Partner API key is assigned the old policy ID.
1. Retrieves the partner ID who has placed the request for the partner API key.
1. Validates if the new policy ID and the partner ID belong to the policy group of the Partner Manager.
1. Unassigns the old policy ID from the Partner API key.
1. Assigns the new policy ID to the Partner API key.
1. Retrieves the status of the Partner API key request number.
1. Updates/retains the status of the Partner API key request number to ‘Issued’ if the policy is successfully assigned.
1. Updates/retains the status of the Partner API key to ‘active’ if the policy is successfully assigned.
1. Responds with the parameters, such as status, err (as applicable).

# 6. Impact on Authentication
#### A. ID Authentication Validates MISP License key
Upon receiving a request from ID Authentication to check the status of MISP License Key with input parameter (MISP License Key), the system performs the following steps:
1. Validates if the status of the MISP License Key is active.
1. Retrieves the MISP status corresponding to the MISP License key in the request.
1. Validates if the status of MISP is active.
1. Responds with the parameters, such as status, err (as applicable).
#### B. ID Authentication retrieves policy of a partner with partner-ID and partner API key
Upon receiving a request from ID Authentication to retrieve the policy with input parameters (Partner ID and Partner API key), the system performs the following steps:
1. Validates if the status of the Partner ID is active.
1. Validates the length and pattern of the Partner API Key.
1. Validates if the status of Partner API Key is active.
1. Validates if the Partner API key belong to the partner.
1. Retrieves the policy ID mapped to the Partner API key.
1. Responds with the parameters, such as policy ID, Policy Name, Policy Description, Policy Status, Policy file, and err (as applicable).

### List of Configurable Parameters and Processes [**[↑]**](#table-of-contents)

1. Configurable Parameters
* (Work in Progress) 
2. Configurable Processes 
* (Work in Progress) 

### Partner Management API [**[↑]**](#table-of-contents)
* (Work in Progress) 


### Process View [**[↑]**](#table-of-contents)
* (Work in Progress)
