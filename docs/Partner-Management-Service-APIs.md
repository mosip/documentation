This section details about the service API in the Partner Management module.

#### Note:
For securely accessing any API in MOSIP, you must gain auth token from kernel authmanager
1. Authenticate through client-id/Secret or User Id/Password having respective roles assigned in IAM.
2. After successful authentication access token will set as Authorization cookies.
3. Access API through postman by passing the access token in cookies.

MOSIP common authentication and authorization APIs would be used for authentication and generation of secured auth token 
 url- https://github.com/mosip/mosip-docs/wiki/AuthN-&-AuthZ-APIs#post-v1authenticateuseridpwd

```
{
  "id": "string",
  "version": "string",
  "requesttime": "2018-12-10T06:12:52.994Z",
  "metadata": {},
  "request": {
     "appId": "partnermanagement",
     "userName": "pmadmin",
     "password": "pmadmin"     
  }
}
```
After hitting api, you will get the Authorization token in the cookie. 

#### Prerequisite for Partner Management Module:
1. Digital certificate sharing between MOSIP and Partners
2. MISP (MOSIP Infrastructure Service Provider) Creation
3. Master data related to Partner Management - like Policy Groups, Partner Manager mappings to Policy Groups, Policy Manager mappings to Policy Groups, Master policy for the country

## Partner Management APIs are categorized into following services

* [MISP Management Service](#misp-management-service) - This service would be used by MOSIP Admin for management of MISP(MOSIP Infrastructure Service Provider), management of MISP license keys issued to MISP, activation and deactivation of MISP and MISP license keys, getting details about MISP and MISP license keys

* [Policy Management Service](#policy-management-service) - This service would be used by Policy Manager for management of Policies. Policy manager would be able to create, update and get policy details. 

* [Partner Management Service](#partner-management-service) - This service would be used by Partner Manager for management of partner requests. Partners belonging to specific policy group would be able to raise request for issuance of Partner API Keys. Partner Manager would be able to approve OR reject such partner requests. Before approving the partner request for API keys, partner manager would review the request, generate partner API key and map the API key with the policy(ies). By using this service, partner manager would be able to view partner details for given partner API Key, along with the policy mapping for the API key, and its status (active/deactive)

* [Partner Service](#partner-service) - This service enables partners to do self registration, submit request for respective authentication policies available for the policy group, sharing of digital certificate for secure communication helping individual authentication through partners.

## MISP Management Service
This service would be used by MOSIP admin for MISP(MOSIP Infrastructure Service Provider) management.

* [POST /misps](#post-misps)
* [POST /misps/{mispId}](#post-mispsmispid)
* [POST /misps/{mispId}/licenseKey](#post-mispsmispidlicensekey)
* [PUT /misps/{mispId}](#put-mispsmispid)
* [PUT /misps/{mispId}/licenseKey](#put-mispsmispidlicensekey)
* [GET /misps](#get-misps)
* [GET /misps/{mispId}](#get-mispsmispId)
* [GET /misps/{mispOrgName}](#get-mispsmispOrgName)
* [GET /misps/{mispId}/licenseKey](#get-mispsmispidlicensekey)


### POST /misps
MOSIP Admin would be able to create MISP using this API. At the time of creation of MISP, MISP ID and MISP License Key are generated,mapped and shared back in response. Post successful MISP creation, by default MISP is set to active status,  MISP License key is to active status. MISP License key is configurable and set to expire in 3 months, 6 months OR any configurable period.  Kernel ID generator API would be used to generate unique id as mentioned in [Kernel ID Generator](https://github.com/mosip/mosip-platform/tree/master/kernel/kernel-idgenerator-vid)

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/misps</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.misp.create
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-07-02T05:23:08.019Z
request |Yes|Request for the application|
request.organizationName|Yes|MISP organization name|telecom
request.contactNumber|Optional|MISP contact number|9876998888
request.emailId|Yes|MISP emailId|prm@telecom.com
request.address|Yes|MISP address|India

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Request:
```JSON
{
  "id": "mosip.partnermanagement.misp.create",
  "version": "1.0",
  "requesttime": "2019-05-20T09:48:43.394Z",
  "metadata": {},
  "request": {
      "organizationName": "telecom",
      "contactNumber": "9876998888",
      "emailId": "prm@telecom.com",
      "address": "India"
  }
}

```
#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: MISP successfully created
```JSON
{
  "id": "mosip.partnermanagement.misp.create",
  "version": "1.0",
  "responsetime": "2019-05-20T09:48:43.394Z",
  "response": {
    "mispId": "64269837502851",
    "mispStatus": "Active",
    "mispLicenseKey": "fa604-affcd-33201-04770",
    "mispLicenseKeyExpiry": "2022-12-31",
    "mispLicenseKeyStatus": "Active"
  },
  "errors": null
}

```

##### Failure Response:
###### Status code: '200'
###### Description: MISP already registered

```JSON
{
  "id": "mosip.partnermanagement.misp.create",
  "version": "1.0",
  "responsetime": "2019-05-14T16:46:39.582Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_MSP_003",
      "message": "A MISP is already registered with name - organizationName"
    }
  ]
}
```
#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_MSP_001|MOSIP Admin does not exist|Unauthorized MOSIP Admin- UserName not available in database
PMS_MSP_002|Mismatch of the MOSIP Admin Credentials|User Name and Password of the Admin does not match
PMS_MSP_003|A MISP is already registered with name - organizationName|If MISP is already registered with organizationName
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### POST /misps/{mispId}
This API would be used to update MISP for given mispID.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/misps/{mispId}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
mispId |Yes| id of the misp|64269837502851

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.misp.update
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-07-02T05:23:08.019Z
request |Yes|Request for the application|
request.organizationName|Optional|MISP organization name|telecom
request.contactNumber|Optional|MISP contact number|9876998888
request.emailId|Optional|MISP emailId|prm@telecom.com
request.address|Optional|MISP address|India

#### Request:
```JSON
{
  "id": "mosip.partnermanagement.misp.update",
  "version": "1.0",
  "requesttime": "2019-05-20T09:48:43.394Z",
  "metadata": {},
  "request": {
      "organizationName": "telecom",
      "contactNumber": "9876998888",
      "emailID": "prm@telecom.com",
      "address": "India"
  }
}
```
#### Responses:
##### Success Response:
###### Status code: '200'
```JSON
{
  "id": "mosip.partnermanagement.misp.update",
  "version": "1.0",
  "responsetime": "2019-06-03T06:47:10.838Z",
  "response": {
      "id": "64269837502851",
      "organizationName": "telecom",
      "contactNumber": "9876998888",
      "emailID": "prm@telecom.com",
      "address": "India"
  },
  "errors": null
}
```
##### Failure Response:
###### Status code: '200'
###### Description: MISP Organization Name, MISP Contact Number, MISP Email ID, MISP Address - None available in request
```JSON
{
  "id": "mosip.partnermanagement.misp.update",
  "version": "1.0",
  "responsetime": "2019-06-03T18:03:12.305Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_MSP_004",
      "message": "No information provided for update"
    }
  ]
}
```
#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_MSP_001|MOSIP Admin does not exist|Unauthorized MOSIP Admin- UserName not available in database
PMS_MSP_002|Mismatch of the MOSIP Admin Credentials|User Name and Password of the Admin does not match
PMS_MSP_004|No information provided for update|No information provided for update
PMS_MSP_005|MISP ID does not exist|MISP ID not available in database
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### POST /misps/{mispId}/licenseKey
This API would be used for validating MISPs license key- 
   1. Validate license key pattern.
   2. Validate license key is associated with the requested MISP id.
   3. Validate license key is Active or not.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/misps/{mispId}/licenseKey</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
mispId |Yes| id of the misp|64269837502851


#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.misp.license.validate
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-05-20T09:48:43.394Z
request |Yes|Request for the application|
request.mispLicenseKey|Yes|MISP license key|fa604-affcd-33201-04234


#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Request:
```JSON
{
  "id": "mosip.partnermanagement.misp.license.validate",
  "version": "1.0",
  "requesttime": "2019-05-20T09:48:43.394Z",
  "metadata": {},
  "request": {
      "mispLicenseKey": "fa604-affcd-33201-04234"
  }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: MISP License validated successfully
```JSON
{
  "id": "mosip.partnermanagement.misp.license.validate",
  "version": "1.0",
  "responsetime": "2019-05-20T09:48:43.395Z",
  "response": {
    "message": "MISP License key is valid",
  },
  "errors": null
}
```
##### Failure Response:
###### Status code: '200'
###### Description: MISP ID/MISP License Key not available in database
```JSON
{
  "id": "mosip.partnermanagement.misp.license.validate",
  "version": "1.0",
  "responsetime": "2019-05-20T09:48:43.395Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_MSP_008",
      "message": "MISP License key not valid"
    }
  ]
}
```
#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_MSP_001|MOSIP Admin does not exist|Unauthorized MOSIP Admin- UserName not available in database
PMS_MSP_002|Mismatch of the MOSIP Admin Credentials|User Name and Password of the Admin does not match
PMS_MSP_006|MISP ID/MISP License Key does not exist|MISP ID/MISP License Key not available in database
PMS_MSP_007|MISP License key not associated to MISP ID|MISP License key not associated to MISP in the input
PMS_MSP_008|MISP License key not valid|MISP License key not valid
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error


### PUT /misps/{mispId}
This API would be used to update MISP status for given MISP ID.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/misps/{mispId}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
mispId |Yes| id of the misp|64269837502851

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.misp.status.update
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-07-02T05:23:08.019Z
request |Yes|Request for the application|
request.mispStatus|Yes|MISP status|De-Active

#### Request:
```JSON
{
  "id": "mosip.partnermanagement.misp.status.update",
  "version": "1.0",
  "requesttime": "2019-05-20T09:48:43.394Z",
  "metadata": {},
  "request": {
      "mispStatus": "De-Active"
  }
}
```
#### Responses:
##### Success Response:
###### Status code: '200'
```JSON
{
  "id": "mosip.partnermanagement.misp.status.update",
  "version": "1.0",
  "responsetime": "2019-06-03T06:47:10.838Z",
  "response": {
      "message": "MISP deactivated successfully"
  },
  "errors": null
}
```
##### Failure Response:
###### Status code: '200'
###### Description: MISP Organization Name, MISP Contact Number, MISP Email ID, MISP Address - None available in request
```JSON
{
  "id": "mosip.partnermanagement.misp.status.update",
  "version": "1.0",
  "responsetime": "2019-06-03T18:03:12.305Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_MSP_009",
      "message": "Failed to update MISP status"
    }
  ]
}
```
#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_MSP_001|MOSIP Admin does not exist|Unauthorized MOSIP Admin- UserName not available in database
PMS_MSP_002|Mismatch of the MOSIP Admin Credentials|User Name and Password of the Admin does not match
PMS_MSP_004|No information provided for update|No information provided for update
PMS_MSP_005|MISP ID does not exist|MISP ID not available in database
PMS_MSP_009|Failed to update MISP status|Failed to update the MISP status
PMS_MSP_010|MISP status already in the requested status|MISP status already in the requested status
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### PUT /misps/{mispId}/licenseKey
This API would be used to activate/deactivate MISPs License Key for the MSIP ID.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/misps/{mispId}/licenseKey</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
mispId |Yes| id of the misp|64269837502851


#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.misp.license.update
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-01-16T05:23:08.019Z
request |Yes|Request for the application|
request.mispStatus|Optional|MISP status|Active
request.mispLicenseKey|Optional|MISP license Key|fa604-affcd-33201-04770
request.mispLicenseKeyStatus|Optional|MISP license Key Status|Active


#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Request:
```JSON
{
  "id": "mosip.partnermanagement.misp.license.update",
  "version": "1.0",
  "requesttime": "2019-05-20T09:48:43.394Z",
  "metadata": {},
  "request": {
      "mispStatus": "Active",
      "mispLicenseKey": "fa604-affcd-33201-04770",
      "mispLicenseKeyStatus": "De-Active"
  }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: MISP License updated successfully
```JSON
{
  "id": "mosip.partnermanagement.misp.license.update",
  "version": "1.0",
  "responsetime": "2019-05-16T09:37:04.941Z",
  "response": {
    "status": "De-Active"
  },
  "errors": null
}
```
##### Failure Response:
###### Status code: '200'
###### Description: MISP status,  MISP License key status - None available in request
```JSON
{
  "id": "mosip.partnermanagement.misp.license.update",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_MSP_004",
      "message": "No information provided for update"
    }
  ]
}
```
#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_MSP_001|MOSIP Admin does not exist|Unauthorized MOSIP Admin- UserName not available in database
PMS_MSP_002|Mismatch of the MOSIP Admin Credentials|User Name and Password of the Admin does not match
PMS_MSP_004|No information provided for update|No information provided for update
PMS_MSP_006|MISP ID/MISP License Key does not exist|MISP ID/MISP License Key not available in database
PMS_MSP_007|MISP License key not associated to MISP ID|MISP License key not associated to MISP in the input
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### GET /misps
This API would be used to retrieve all MISPs details.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/misps</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes


#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Responses:
##### Success Response:
###### Status code: '200'

```JSON
{
  "id": "mosip.partnermanagement.misp.retrieve",
  "version": "1.0",
  "responsetime": "2019-06-03T06:47:10.838Z",
  "response": {
    "mispDetails":[
        {
	  "id": "64269837502851",
          "organizationName": "telecom",
          "contactNumber": "9876998888",
          "emailID": "prm@telecom.com",
          "address": "India"
        },
        {
	  "id": "98869837502654",
          "organizationName": "airtelInd",
          "contactNumber": "9488998800",
          "emailID": "agm@airtelInd.com",
          "address": "India"
	}	
      ]	  
  },
  "errors": null
}
```
##### Failure Response:
###### Status code: '200'
###### Description: No MISP details found
```JSON
{
  "id": "mosip.partnermanagement.misp.status.update",
  "version": "1.0",
  "responsetime": "2019-06-03T18:03:12.305Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_MSP_012",
      "message": "No MISP details found"
    }
  ]
}
```
#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_MSP_001|MOSIP Admin does not exist|Unauthorized MOSIP Admin- UserName not available in database
PMS_MSP_002|Mismatch of the MOSIP Admin Credentials|User Name and Password of the Admin does not match
PMS_MSP_012|No MISP details found|No MISP details found
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error


### GET /misps/{mispId}
This API would be used to retrieve the MISPs details based on given misp id.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/misps/{mispId}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
mispId |Yes| id of the misp|64269837502851

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Responses:
##### Success Response:
###### Status code: '200'

```JSON
{
  "id": "mosip.partnermanagement.misp.retrieve",
  "version": "1.0",
  "responsetime": "2019-06-03T06:47:10.838Z",
  "response": {
      "id": "64269837502851",
      "organizationName": "telecom",
      "contactNumber": "9876998888",
      "emailID": "prm@telecom.com",
      "address": "India"
  },
  "errors": null
}
```
##### Failure Response:
###### Status code: '200'
###### Description: MISP ID does not exist
```JSON
{
  "id": "mosip.partnermanagement.misp.status.update",
  "version": "1.0",
  "responsetime": "2019-06-03T18:03:12.305Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_MSP_005",
      "message": "MISP ID does not exist"
    }
  ]
}
```
#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_MSP_001|MOSIP Admin does not exist|Unauthorized MOSIP Admin- UserName not available in database
PMS_MSP_002|Mismatch of the MOSIP Admin Credentials|User Name and Password of the Admin does not match
PMS_MSP_005|MISP ID does not exist|MISP ID not available in database
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### GET /misps/{mispOrgName}
This API would be used to retrieve MISPs details based on given name
1. If MISP organization name present, then retrieve all misp details for matching organization name.
2. If MISP organization name not present, then retrieve all misp details. 

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/misps/{mispOrgName}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
mispOrgName|Yes|MISP organization name|telecome

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: Config parameter retrieved successfully 
```JSON
{
  "id": "mosip.partnermanagement.misp.retrieve",
  "version": "1.0",
  "responsetime": "2019-05-14T16:01:20.534Z",
  "response": {
     "telecom": {
        "id": "64269837502851",
        "organizationName": "telecom",
        "contactNumber": "9876998888",
        "emailID": "prm@telecom.com",
        "address": "India",
        "status": "Active",
        "licenseKey": "fa604-affcd-33201-04770",
        "licenseKeyExpiry": "2022-12-31",
        "licenseKeyStatus": "Active"
     },
     "telecomIndia": {
        "id": "93469837502851",
        "organizationName": "telecomIndia",
        "contactNumber": "9876995433",
        "emailID": "srs@telecomInd.com",
        "address": "India",
        "status": "Active",
        "licenseKey": "ty604-affcd-33201-04770",
        "licenseKeyExpiry": "2022-12-31",
        "licenseKeyStatus": "Active"
      }
   },
  "errors": null
}
```
##### Failure Response:
###### Status code: '200'
###### Description: No MISP found for the organization
```JSON
{
  "id": "mosip.partnermanagement.misp.retrieve",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_MSP_009",
      "message": "No MISP found for the organization"
    }
  ]
}
```
#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_MSP_001|MOSIP Admin does not exist|Unauthorized MOSIP Admin- UserName not available in database
PMS_MSP_002|Mismatch of the MOSIP Admin Credentials|User Name and Password of the Admin does not match
PMS_MSP_011|No MISP found for the organization|No MISP found for the organization
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### GET /misps/{mispId}/licenseKey
This API would be used by MISP Admin / MOSIP Admin for download MISPs license key. In case where license key got expired then user would be able to get a new license key. New license key thus generated would be mapped with given MISP ID . Older license keys would be updated with inactive status. 

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/misps/{mispId}/licenseKey</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
mispId |Yes| id of the misp|64269837502851


#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: MISP License retrieved successfully
```JSON
{
  "id": "mosip.partnermanagement.misp.license.retrieve",
  "version": "1.0",
  "responsetime": "2019-05-16T09:37:04.941Z",
  "response": {
    "mispLicenseKey": "fa604-affcd-33201-04770",
    "mispLicenseKeyExpiry": "2022-12-31",
    "mispLicenseKeyStatus": "Active"
  },
  "errors": null
}
```
##### Failure Response:
###### Status code: '200'
###### Description: MISP status,  MISP License key status - None available in request
```JSON
{
  "id": "mosip.partnermanagement.misp.license.retrieve",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_MSP_006",
      "message": "MISP ID/MISP License Key does not exist"
    }
  ]
}
```
#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_MSP_001|MOSIP Admin does not exist|Unauthorized MOSIP Admin- UserName not available in database
PMS_MSP_002|Mismatch of the MOSIP Admin Credentials|User Name and Password of the Admin does not match
PMS_MSP_006|MISP ID/MISP License Key does not exist|MISP ID/MISP License Key not available in database
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error


## Policy Management Service
This service would be used by Policy Manager to manage policies for his Policy Group.

* [POST /policies](#post-policies)
* [POST /policies/{policyID}](#post-policiespolicyid)
* [PUT /policies/{policyID}](#put-policiespolicyid)
* [GET /policies](#get-policies)
* [GET /policies/{policyID}](#get-policiespolicyid)
* [GET /policies/{PartnerAPIKey}](#get-policiespartnerapikey)

### POST /policies
This API would be used to create new Policy for policy group

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/policies</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.policy.create
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-01-16T05:23:08.019Z
request |Yes|Request for the application|
request.name|Yes|name of the policy|Insurance Policy
request.desc|Yes|description of the policy|Desc about policy
request.policies|Yes|policy file|JSON
request.policies.authPolicies|Yes|auth details|Array of JSON
request.policies.allowedKycAttributes|Yes|eKYC details|Array of JSON


#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Request:
```JSON
{
  "id": "mosip.partnermanagement.policy.create",
  "version": "1.0",
  "requesttime": "2019-05-20T09:48:43.394Z",
  "metadata": {},
  "request": {
       "name": "Insurance Policy",
       "desc": "Desc about policy",
       "policies": {
            "authPolicies": [ 	
				{"authType": "otp","mandatory": true},
				{"authType": "demo","mandatory": false},
				{"authType": "bio","authSubType": "FINGER","mandatory": true},
				{"authType": "bio","authSubType": "IRIS","mandatory": false},
				{"authType": "bio","authSubType": "FACE","mandatory": false},
				{"authType": "kyc","mandatory": false}
		    ],
            "allowedKycAttributes": [  
				{"attributeName": "fullName","required": true},
				{"attributeName": "dateOfBirth","required": true},
				{"attributeName": "gender","required": true},
				{"attributeName": "phone","required": true},
				{"attributeName": "email","required": true},
				{"attributeName": "addressLine1","required": true},
				{"attributeName": "addressLine2","required": true},
				{"attributeName": "addressLine3","required": true},
				{"attributeName": "location1","required": true},
				{"attributeName": "location2","required": true},
				{"attributeName": "location3","required": true},
				{"attributeName": "postalCode","required": false},
				{"attributeName": "photo","required": true}
			]
        }
    }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: create new Policy for policy group is successful
```JSON
{
  "id": "mosip.partnermanagement.policy.create",
  "version": "1.0",
  "responsetime": "2019-05-14T16:01:20.534Z",
  "response": {
       "policies": [
          {
            "id": "32058251034176",
            "name": "Insurance Policy",
            "desc": "Desc about policy",
            "is_Active": true,
            "cr_by": "MOSIP",
            "cr_dtimes": "2019-05-14T16:01:20.534Z",
            "up_by": null,
            "upd_dtimes": null
          }
        ]
   },
  "errors": null
}
```


##### Failure Response:
###### Status code: '200'
###### Description: If policy name already exists in the policy group
```JSON
{
  "id": "mosip.partnermanagement.policy.create",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_POL_004",
      "message": "Policy Name already exists in the policy Group"
    }
  ]
}
```
#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_POL_001|Policy Manager does not exist|If Policy Manager does not exist
PMS_POL_002|Mismatch of Policy Manager Credentials|If any mismatch of Policy Manager Credentials
PMS_POL_004|Policy Name already exists in the policy Group|If Policy Name already exists in the policy Group
PMS_POL_005|Unsupported KYC attribute in the Policy File|If any unsupported KYC attribute in the Policy File
PMS_POL_006|Unsupported Authentication Type in the Policy File|If any unsupported Authentication Type in the Policy File
PMS_POL_007|eKYC attribute missing in the policy file|If any eKYC attribute missing in the policy file
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### POST /policies/{policyID}
This API would be used to update existing policy for a policy group

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/policies/{policyID}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
policyID |Yes| policyID |45678451034176

#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.policy.update
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-01-16T05:23:08.019Z
request |Yes|Request for the application|
request.name|Yes|name of the policy|Insurance Policy
request.desc|Yes|description of the policy|Desc about policy
request.policies|Yes|policy file|JSON
request.policies.authPolicies|Yes|auth details|Array of JSON
request.policies.allowedKycAttributes|Yes|eKYC details|Array of JSON

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Request:
```JSON
{
  "id": "mosip.partnermanagement.policy.update",
  "version": "1.0",
  "requesttime": "2019-05-15T16:01:20.534Z",
  "metadata": {},
  "request": {
      "name": "Loan Policy",
      "desc": "Desc about policy",
      "policies": {
            "authPolicies": [ 	
					{"authType": "otp","mandatory": true},
					{"authType": "demo","mandatory": false},
					{"authType": "bio","authSubType": "FINGER","mandatory": true},
					{"authType": "bio","authSubType": "IRIS","mandatory": true},
					{"authType": "bio","authSubType": "FACE","mandatory": false},
					{"authType": "kyc","mandatory": false}
			],
            "allowedKycAttributes": [  
					{"attributeName": "fullName","required": true},
					{"attributeName": "dateOfBirth","required": true},
					{"attributeName": "gender","required": true},
					{"attributeName": "phone","required": true},
					{"attributeName": "email","required": true},
					{"attributeName": "addressLine1","required": true},
					{"attributeName": "addressLine2","required": true},
					{"attributeName": "addressLine3","required": true},
					{"attributeName": "location1","required": true},
					{"attributeName": "location2","required": true},
					{"attributeName": "location3","required": true},
					{"attributeName": "postalCode","required": false},
					{"attributeName": "photo","required": true}
			]
        }
    }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: update existing policy for policy group is successful
```JSON
{
  "id": "mosip.partnermanagement.policy.update",
  "version": "1.0",
  "responsetime": "2019-05-15T16:01:20.534Z",
  "response":{
        "id": "45678451034176",
        "name": "Loan Policy",
		"desc": "Desc about policy",
		"is_Active": true,
		"cr_by": "MOSIP",
		"cr_dtimes": "2019-05-14T16:01:20.534Z",
		"up_by": "MOSIP",
		"upd_dtimes": "2019-05-15T16:01:20.534Z"
	},
  "errors": null
}
```


##### Failure Response:
###### Status code: '200'
###### Description: If policy ID does not exist
```JSON
{
  "id": "mosip.partnermanagement.policy.update",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_POL_008",
      "message": "Policy ID does not exist"
    }
  ]
}
```
#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_POL_001|Policy Manager does not exist|If Policy Manager does not exist
PMS_POL_002|Mismatch of Policy Manager Credentials|If any mismatch of Policy Manager Credentials
PMS_POL_004|Policy Name already exists in the policy Group|If Policy Name already exists in the policy Group
PMS_POL_005|Unsupported KYC attribute in the Policy File|If any unsupported KYC attribute in the Policy File
PMS_POL_006|Unsupported Authentication Type in the Policy File|If any unsupported Authentication Type in the Policy File
PMS_POL_007|eKYC attribute missing in the policy file|If any eKYC attribute missing in the policy file
PMS_POL_008|Policy ID does not exist|If Policy ID does not exist
PMS_POL_009|No information provided for update|if no information provided for update
PMS_POL_010|Policy Manager is denied permission to update the policy|if the policy manager is denied permission to update the policy
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### PUT /policies/{policyID}
This API would be used to update the status (activate/deactivate) for the given policy id.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/policies/{policyID}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
policyID |Yes| policyID |45678451034176

#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.policy.update.status
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-01-16T05:23:08.019Z
request |Yes|Request for the application|
request.status|Yes|status of the policy that needs to update|De-Active

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Request:
```JSON
{
  "id": "mosip.partnermanagement.policy.update.status",
  "version": "1.0",
  "requesttime": "2019-05-15T16:01:20.534Z",
  "metadata": {},
  "request": {
		"status":"De-Active"
   }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: update the existing policy status successful
```JSON
{
  "id": "mosip.partnermanagement.policy.update.status",
  "version": "1.0",
  "responsetime": "2019-05-15T16:01:20.534Z",
  "response":{
        "message" : "status updated successfully"
   },
  "errors": null
}
```


##### Failure Response:
###### Status code: '200'
###### Description: If policy ID does not exist
```JSON
{
  "id": "mosip.partnermanagement.policy.update.status",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_POL_008",
      "message": "Policy ID does not exist"
    }
  ]
}
```
#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_POL_001|Policy Manager does not exist|If Policy Manager does not exist
PMS_POL_002|Mismatch of Policy Manager Credentials|If any mismatch of Policy Manager Credentials
PMS_POL_004|Policy Name already exists in the policy Group|If Policy Name already exists in the policy Group
PMS_POL_008|Policy ID does not exist|If Policy ID does not exist
PMS_POL_012|Policy Manager is denied permission to update the policy status|if the policy manager is denied permission to update the policy status
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### GET /policies
Policy manager would require this service to get details for the policies in the policy group he belongs to. All the policy groups are required to be back filled in the partner management database through an offline process based on country specific requirements. Partner Manager and Policy Manager assigned for the Policy group are also required to be back filled along with creation of the policy group. Partner management would depend on Kernel IAM module services for all user management related activities. User ID and Password are shared using off-line process.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/policies</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: retrieve the policies available for my policy group successful
```JSON
{
  "id": "mosip.partnermanagement.partner.policies",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response": {
     "policies": [
	   {
		"id": "32058251034176",
		"name": "Insurance Policy",
		"desc": "Desc about policy",
		"is_Active": true,
		"policyManagerId": "898778899",
		"cr_by": "MOSIP",
		"cr_dtimes": "2019-05-14T16:01:20.534Z",
		"up_by": null,
		"upd_dtimes": null,
		"policies": {
            "authPolicies": [ 	
					{"authType": "otp","mandatory": true},
					{"authType": "demo","mandatory": false},
					{"authType": "bio","authSubType": "FINGER","mandatory": true},
					{"authType": "bio","authSubType": "IRIS","mandatory": false},
					{"authType": "bio","authSubType": "FACE","mandatory": false},
					{"authType": "kyc","mandatory": false}
			],
            "allowedKycAttributes": [  
					{"attributeName": "fullName","required": true},
					{"attributeName": "dateOfBirth","required": true},
					{"attributeName": "gender","required": true},
					{"attributeName": "phone","required": true},
					{"attributeName": "email","required": true},
					{"attributeName": "addressLine1","required": true},
					{"attributeName": "addressLine2","required": true},
					{"attributeName": "addressLine3","required": true},
					{"attributeName": "location1","required": true},
					{"attributeName": "location2","required": true},
					{"attributeName": "location3","required": true},
					{"attributeName": "postalCode","required": false},
					{"attributeName": "photo","required": true}
			 ]
          }
       },
       {
		"id": "45678451034176",
		"name": "Loan Policy",
		"desc": "Desc about policy",
		"is_Active": true,
		"policyManagerId": "898778899",
		"cr_by": "MOSIP",
		"cr_dtimes": "2019-05-14T16:01:20.534Z",
		"up_by": "MOSIP",
		"upd_dtimes": "2019-05-15T16:01:20.534Z",
		"policies": {
            "authPolicies": [ 	
					{"authType": "otp","mandatory": true},
					{"authType": "demo","mandatory": false},
					{"authType": "bio","authSubType": "FINGER","mandatory": true},
					{"authType": "bio","authSubType": "IRIS","mandatory": true},
					{"authType": "bio","authSubType": "FACE","mandatory": false},
					{"authType": "kyc","mandatory": false}
			],
            "allowedKycAttributes": [  
					{"attributeName": "fullName","required": true},
					{"attributeName": "dateOfBirth","required": true},
					{"attributeName": "gender","required": true},
					{"attributeName": "phone","required": true},
					{"attributeName": "email","required": true},
					{"attributeName": "addressLine1","required": true},
					{"attributeName": "addressLine2","required": true},
					{"attributeName": "addressLine3","required": true},
					{"attributeName": "location1","required": true},
					{"attributeName": "location2","required": true},
					{"attributeName": "location3","required": true},
					{"attributeName": "postalCode","required": false},
					{"attributeName": "photo","required": true}
			]
        }
       }
     ]
	},
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: No Active policy available in the Policy Group
```JSON
{
  "id": "mosip.partnermanagement.partner.policies",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_POL_003",
      "message": "No Active policy available in the Policy Group"
    }
  ]
}
```
#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_POL_001|Policy Manager does not exist|If Policy Manager does not exist
PMS_POL_002|Mismatch of Policy Manager Credentials|If any mismatch of Policy Manager Credentials
PMS_POL_003|No Active policy available in the Policy Group|No Active policies exist in the policy Group
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### GET /policies/{policyID}
This API would be used to retrieve existing policy for a policy group based on the policy id.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/policies/{policyID}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
policyID |Yes| policyID |45678451034176

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: policy retrieved successfully
```JSON
{
  "id": "mosip.partnermanagement.policy.retrieve",
  "version": "1.0",
  "responsetime": "2019-05-15T16:01:20.534Z",
  "response":{
		"id": "45678451034176",
		"name": "Loan Policy",
		"desc": "Desc about policy",
		"is_Active": true,
		"cr_by": "MOSIP",
		"cr_dtimes": "2019-05-14T16:01:20.534Z",
		"up_by": "MOSIP",
		"upd_dtimes": "2019-05-15T16:01:20.534Z",
		"policies": {
            "authPolicies": [ 	
					{"authType": "otp","mandatory": true},
					{"authType": "demo","mandatory": false},
					{"authType": "bio","authSubType": "FINGER","mandatory": true},
					{"authType": "bio","authSubType": "IRIS","mandatory": false},
					{"authType": "bio","authSubType": "FACE","mandatory": false},
					{"authType": "kyc","mandatory": false}
			],
            "allowedKycAttributes": [  
					{"attributeName": "fullName","required": true},
					{"attributeName": "dateOfBirth","required": true},
					{"attributeName": "gender","required": true},
					{"attributeName": "phone","required": true},
					{"attributeName": "email","required": true},
					{"attributeName": "addressLine1","required": true},
					{"attributeName": "addressLine2","required": true},
					{"attributeName": "addressLine3","required": true},
					{"attributeName": "location1","required": true},
					{"attributeName": "location2","required": true},
					{"attributeName": "location3","required": true},
					{"attributeName": "postalCode","required": false},
					{"attributeName": "photo","required": true}
			]
        }
	},
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: If policy ID does not exist
```JSON
{
  "id": "mosip.partnermanagement.policy.retrieve",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_POL_008",
      "message": "Policy ID does not exist"
    }
  ]
}
```
#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_POL_001|Policy Manager does not exist|If Policy Manager does not exist
PMS_POL_002|Mismatch of Policy Manager Credentials|If any mismatch of Policy Manager Credentials
PMS_POL_004|Policy Name already exists in the policy Group|If Policy Name already exists in the policy Group
PMS_POL_008|Policy ID does not exist|If Policy ID does not exist
PMS_POL_011|Policy Manager is denied permission to retrieve the policy|if the policy manager is denied permission to retrieve the policy
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### GET /policies/{PartnerAPIKey}
This API would be used to retrieve the partner policy details for given PartnerAPIKey. 

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/policies/fa604-affcd-33201-04770</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
PartnerAPIKey|Yes| PartnerAPIKey | fa604-affcd-33201-04770

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: retrieve the partner policy details for given PartnerAPIKey successful
```JSON
{
  "id": "mosip.partnermanagement.policies.retrieve.partnerAPIKey",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
		"id": "32058251034176",
		"name": "Insurance Policy",
		"desc": "Desc about policy",
		"is_Active": true,
		"cr_by": "MOSIP",
		"cr_dtimes": "2019-05-14T16:01:20.534Z",
		"up_by": null,
		"upd_dtimes": null,
		"policies": {
            "authPolicies": [ 	
					{"authType": "otp","mandatory": true},
					{"authType": "demo","mandatory": false},
					{"authType": "bio","authSubType": "FINGER","mandatory": true},
					{"authType": "bio","authSubType": "IRIS","mandatory": false},
					{"authType": "bio","authSubType": "FACE","mandatory": false},
					{"authType": "kyc","mandatory": false}
			],
            "allowedKycAttributes": [  
					{"attributeName": "fullName","required": true},
					{"attributeName": "dateOfBirth","required": true},
					{"attributeName": "gender","required": true},
					{"attributeName": "phone","required": true},
					{"attributeName": "email","required": true},
					{"attributeName": "addressLine1","required": true},
					{"attributeName": "addressLine2","required": true},
					{"attributeName": "addressLine3","required": true},
					{"attributeName": "location1","required": true},
					{"attributeName": "location2","required": true},
					{"attributeName": "location3","required": true},
					{"attributeName": "postalCode","required": false},
					{"attributeName": "photo","required": true}
			]
        }
	},
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: No policy available for given PartnerAPIKey
```JSON
{
  "id": "mosip.partnermanagement.policies.retrieve.partnerAPIKey",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_POL_013",
      "message": "No policy available for given PartnerAPIKey"
    }
  ]
}
```
#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_POL_001|Policy Manager does not exist|If Policy Manager does not exist
PMS_POL_002|Mismatch of Policy Manager Credentials|If any mismatch of Policy Manager Credentials
PMS_POL_013|No policy available for given PartnerAPIKey|No policy available for given PartnerAPIKey
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

## Partner Management Service
This service enables partner managers to manage respective partners, manage partner API Key requests, manage PartnerAPIKeys to Policies mappings.

* [POST /pmpartners/{partnerID}/{PartnerAPIKey}](#post-pmpartnerspartneridpartnerapikey)
* [PUT /pmpartners/{partnerID}](#put-pmpartnerspartnerid)
* [PUT /pmpartners/{partnerID}/{PartnerAPIKey}](#put-pmpartnerspartneridpartnerapikey)
* [PUT /pmpartners/PartnerAPIKeyRequests/{APIKeyReqID}](#put-pmpartnerspartnerapikeyrequestsapikeyreqid)
* [GET /pmpartners](#get-pmpartners)
* [GET /pmpartners/{partnerID}](#get-pmpartnerspartnerid)
* [GET /pmpartners/{partnerID}/{PartnerAPIKey}](#get-pmpartnerspartneridpartnerapikey)
* [GET /pmpartners/PartnerAPIKeyRequests](#get-pmpartnerspartnerapikeyrequests)
* [GET /pmpartners/PartnerAPIKeyRequests/{APIKeyReqID}](#get-pmpartnerspartnerapikeyrequestsapikeyreqid)


### POST /pmpartners/{partnerID}/{PartnerAPIKey}
This API would be used by partner Manager, to update Partner api key to Policy Mappings.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/pmpartners/{partnerID}/{PartnerAPIKey}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
partnerID |Yes| partnerID |65432345634232
PartnerAPIKey|Yes| PartnerAPIKey | fa604-affcd-33201-04770

#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.partners.policy.mapping
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-01-16T05:23:08.019Z
request |Yes|Request for the application|
request.oldPolicyID|Yes|old Policy ID|54662345634232
request.newPolicyID|Yes|new Policy ID|45662345639999

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Request:
```JSON
{
  "id": "mosip.partnermanagement.partners.policy.mapping",
  "version": "1.0",
  "requesttime": "2019-05-20T09:48:43.394Z",
  "metadata": {},
  "request": {
     "oldPolicyID":"54662345634232", 
	 "newPolicyID":"45662345639999"
  }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: Partner api key to Policy Mappings updated successfully.
```JSON
{
  "id": "mosip.partnermanagement.partners.policy.mapping",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
       "message": "Partner api key to Policy Mappings updated successfully"
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: old/new Policy %d does not exist
```JSON
{
  "id": "mosip.partnermanagement.partners.policy.mapping",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_PMP_014",
      "message": "Policy %d does not exist"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PMP_001|Partner Manager does not exist|Not a authorized Partner Manager- UserName not available in database
PMS_PMP_002|Mismatch of the Partner Manager Credentials|User Name and Password of the Partner Manager does not match
PMS_PMP_003|Your password has expired. Please reset your password|Password expired
PMS_PMP_008|Partner api key is not assigned to” + old policy ID+ “ hence cannot be updated with new policy|Partner api key is not assigned to old policy ID hence cannot be updated with new policy
PMS_PMP_009|Partner api key does not belong to the Policy Group of the Partner Manger|Partner api key does not belong to the Policy Group of the Partner Manger
PMS_PMP_010|Policy does not belong to the Policy Group of the Partner Manger|Policy does not belong to the Policy Group of the Partner Manger
PMS_PMP_011|Partner api key Request ID does not exist|Partner api key Request ID does not exist
PMS_PMP_014|Policy %d does not exist|Policy does not exist
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### PUT /pmpartners/{partnerID}
This API would be used to activate/deactivate Auth/E-KYC Partners

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/pmpartners/{partnerID}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
partnerID |Yes| partnerID |65432345634232

#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.partners.status.update
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-01-16T05:23:08.019Z
request |Yes|Request for the application|
request.status|Yes|status of the partner that needs to update|DeActive

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Request:
```JSON
{
  "id": "mosip.partnermanagement.partners.status.update",
  "version": "1.0",
  "requesttime": "2019-05-20T09:48:43.394Z",
  "metadata": {},
  "request": {
      "status": "De-Active"
  }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: Partner status updated successfully.
```JSON
{
  "id": "mosip.partnermanagement.partners.status.update",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
       "message": "Partner status updated successfully"
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: Requested partner ID does not exist
```JSON
{
  "id": "mosip.partnermanagement.partners.status.update",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_PMP_005",
      "message": "Partner ID %d does not exist"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PMP_001|Partner Manager does not exist|Not a authorized Partner Manager- UserName not available in database
PMS_PMP_002|Mismatch of the Partner Manager Credentials|User Name and Password of the Partner Manager does not match
PMS_PMP_003|Your password has expired. Please reset your password|Password expired
PMS_PMP_005|Partner ID %d does not exist|Requested Partner ID does not exist
PMS_PMP_006|Partner Manager is denied permission to activate/deactivate Partner|Partner Manager is denied permission to activate/deactivate Partner
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### PUT /pmpartners/{partnerID}/{PartnerAPIKey}
Partner Manager would be using this API to activate OR de-activate PartnerAPIKey for given partner.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/pmpartners/{partnerID}/{PartnerAPIKey}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
partnerID |Yes| partnerID |65432345634232
PartnerAPIKey|Yes| PartnerAPIKey | fa604-affcd-33201-04770

#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.partners.apikeystatus.update
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-01-16T05:23:08.019Z
request |Yes|Request for the application|
request.status|Yes|status of the partnerAPI that needs to update|Active

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Request:
```JSON
{
  "id": "mosip.partnermanagement.partners.apikeystatus.update",
  "version": "1.0",
  "requesttime": "2019-05-20T09:48:43.394Z",
  "metadata": {},
  "request": {
      "status": "Active"
  }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: PartnerAPIKey status updated successfully.
```JSON
{
  "id": "mosip.partnermanagement.partners.apikeystatus.update",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
       "message": "Partner API Key status updated successfully"
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: Requested Partner API Key does not exist
```JSON
{
  "id": "mosip.partnermanagement.partners.apikeystatus.update",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_PMP_007",
      "message": "Partner API Key does not exist"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PMP_001|Partner Manager does not exist|Not a authorized Partner Manager- UserName not available in database
PMS_PMP_002|Mismatch of the Partner Manager Credentials|User Name and Password of the Partner Manager does not match
PMS_PMP_003|Your password has expired. Please reset your password|Password expired
PMS_PMP_005|Partner ID %d does not exist|Requested Partner ID does not exist
PMS_PMP_006|Partner Manager is denied permission to activate/deactivate Partner|Partner Manager is denied permission to activate/deactivate Partner
PMS_PMP_007|Partner API Key does not exist|Requested Partner API Key does not exist
PMS_PMP_008|Partner api key is not assigned to” + old policy ID+ “ hence cannot be updated with new policy|Partner api key is not assigned to old policy ID hence cannot be updated with new policy
PMS_PMP_009|Partner api key does not belong to the Policy Group of the Partner Manger|Partner api key does not belong to the Policy Group of the Partner Manger
PMS_PMP_010|Policy does not belong to the Policy Group of the Partner Manger|Policy does not belong to the Policy Group of the Partner Manger
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### PUT /pmpartners/PartnerAPIKeyRequests/{APIKeyReqID}
Partner Manager would be using this API to approve OR reject partner API key requests based on API key request id. During approval process of the request unique PartnerAPI Key is generated in Partner Management module, which is mapped to requested policies. Partner API Key would be having default active status, expiry of which would configurable.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/pmpartners/PartnerAPIKeyRequests/{APIKeyReqID}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
APIKeyReqID |Yes| APIKey Request ID |65432345634232

#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.partners.apikey.approval
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-01-16T05:23:08.019Z
request |Yes|Request for the application|
request.status|Yes|status of the partner API Key that needs to update|Approved

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Request:
```JSON
{
  "id": "mosip.partnermanagement.partners.apikey.approval",
  "version": "1.0",
  "requesttime": "2019-05-20T09:48:43.394Z",
  "metadata": {},
  "request": {
      "status": "Approved"
  }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: PartnerAPIKey approved successfully.
```JSON
{
  "id": "mosip.partnermanagement.partners.apikeystatus.update",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
       "message": "PartnerAPIKey approved successfully"
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: Requested Partner API Key Request ID does not exist
```JSON
{
  "id": "mosip.partnermanagement.partners.apikeystatus.update",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_PMP_007",
      "message": "Partner api key Request ID does not exist"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PMP_001|Partner Manager does not exist|Not a authorized Partner Manager- UserName not available in database
PMS_PMP_002|Mismatch of the Partner Manager Credentials|User Name and Password of the Partner Manager does not match
PMS_PMP_003|Your password has expired. Please reset your password|Password expired
PMS_PMP_011|Partner api key Request ID does not exist|Partner api key Request ID does not exist
PMS_PMP_012|Partner Manager is denied permission to approve or reject the request|Partner Manager is denied permission to approve or reject the request
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### GET /pmpartners
This API would be used to retrieve all Auth/E-KYC Partners for the policy group.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/pmpartners</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: retrieve the partner details for the particular policy group.
```JSON
{
  "id": "mosip.partnermanagement.partners.retrieve",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
         "partners" : [
		    {
			   "partnerID":"65432345634232", 
		       "status":"Active", 
		       "organizationName":"telecomAirtel",
		       "contactNumber":"9876545654", 
		       "emailID":"telecomAirtel@gmail.com", 
		       "address":"India"
			},
			{
			   "partnerID":"87652345634232", 
		       "status":"Active", 
		       "organizationName":"telecomJio",
		       "contactNumber":"9988774654", 
		       "emailID":"telecomJio@gmail.com", 
		       "address":"India"
			}
		]	
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: No partner Registered in the policy Group
```JSON
{
  "id": "mosip.partnermanagement.partners.retrieve",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_PMP_004",
      "message": "No partner Registered in the policy Group"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PMP_001|Partner Manager does not exist|Not a authorized Partner Manager- UserName not available in database
PMS_PMP_002|Mismatch of the Partner Manager Credentials|User Name and Password of the Partner Manager does not match
PMS_PMP_003|Your password has expired. Please reset your password|Password expired
PMS_PMP_004|No Partners are registered in the Policy Group|No partner Registered in the policy Group
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### GET /pmpartners/{partnerID}
This API would be used to retrieve the particular Auth/E-KYC Partner details for given partner id. 

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/pmpartners/{partnerID}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
partnerID |Yes| Partner ID|87652345634232

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: retrieve the partner details for the particular policy group.
```JSON
{
  "id": "mosip.partnermanagement.partners.retrieve",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
        "partnerID":"87652345634232", 
		"status":"Active", 
		"organizationName":"telecomJio",
		"contactNumber":"9988774654", 
		"emailID":"telecomJio@gmail.com", 
		"address":"India"	
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: Requested partner does not exist
```JSON
{
  "id": "mosip.partnermanagement.partners.retrieve",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_PMP_013",
      "message": "Partner does not exist"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PMP_001|Partner Manager does not exist|Not a authorized Partner Manager- UserName not available in database
PMS_PMP_002|Mismatch of the Partner Manager Credentials|User Name and Password of the Partner Manager does not match
PMS_PMP_003|Your password has expired. Please reset your password|Password expired
PMS_PMP_013|Partner does not exist|Requested partner does not exist
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### GET /pmpartners/{partnerID}/{PartnerAPIKey}
Partner managers would be using this request to retrieve the Partner API key to Policy Mappings. Partner management system would be able to validate Partner API Key pattern, validate expiry for Partner API Key and status details in background, while fetching Policy to Partner API mappings.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/pmpartners/{partnerID}/{PartnerAPIKey}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
partnerID |Yes| partnerID |87652345634232
PartnerAPIKey|Yes|PartnerAPIKey|fa604-affcd-33201-04770


#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: successfully retrieved the Partner API key to Policy Mappings.
```JSON
{
  "id": "mosip.partnermanagement.partners.retrieve.policy",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
        "partnerID":"87652345634232",
        "policyId":"77862345634232"
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: Requested partner does not exist
```JSON
{
  "id": "mosip.partnermanagement.partners.retrieve.policy",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_PMP_009",
      "message": "Partner api key does not belong to the Policy Group of the Partner Manger"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PMP_001|Partner Manager does not exist|Not a authorized Partner Manager- UserName not available in database
PMS_PMP_002|Mismatch of the Partner Manager Credentials|User Name and Password of the Partner Manager does not match
PMS_PMP_003|Your password has expired. Please reset your password|Password expired
PMS_PMP_007|Partner API Key does not exist|Requested Partner API Key does not exist
PMS_PMP_009|Partner api key does not belong to the Policy Group of the Partner Manger|Partner api key does not belong to the Policy Group of the Partner Manger
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### GET /pmpartners/PartnerAPIKeyRequests
This API would be used to retrieve all Partner API Key requests as received by partner manager

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/pmpartners/PartnerAPIKeyRequests</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: successfully retrieved the Partner API key to Policy Mappings.
```JSON
{
  "id": "mosip.partnermanagement.partners.apikey.request.retrieve",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
       "apikeyRequests" : [
	     {
			"partnerID":"87652345634232", 
			"status":"Active", 
			"organizationName":"telecomJio",
			"policyName": "Insurance Policy",
			"policyDesc": "Desc about policy",
			"apiKeyReqNo":"873276828663"
		 },
		 {
			"partnerID":"67678856342329", 
			"status":"Active", 
			"organizationName":"airtelInd",
			"policyName": "Banking Policy",
			"policyDesc": "Desc about policy",
			"apiKeyReqNo":"903276828609"
		 }
       ]	  
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: No Partner api key requests for the Policy Group
```JSON
{
  "id": "mosip.partnermanagement.partners.apikey.request.retrieve",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_PMP_015",
      "message": "No Partner api key requests for the Policy Group"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PMP_001|Partner Manager does not exist|Not a authorized Partner Manager- UserName not available in database
PMS_PMP_002|Mismatch of the Partner Manager Credentials|User Name and Password of the Partner Manager does not match
PMS_PMP_003|Your password has expired. Please reset your password|Password expired
PMS_PMP_015|No Partner api key requests for the Policy Group|No Partner api key requests for the Policy Group
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### GET /pmpartners/PartnerAPIKeyRequests/{APIKeyReqID}
This API would be used to retrieve the request for Partner API key to Policy Mappings for given request id

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/pmpartners/PartnerAPIKeyRequests/{APIKeyReqID}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
APIKeyReqID |Yes| APIKey Request ID|873276828663

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: successfully retrieved the Partner API key requests for the partner manager.
```JSON
{
  "id": "mosip.partnermanagement.partners.apikey.requests.retrieve",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
			"partnerID":"87652345634232", 
			"status":"Active", 
			"organizationName":"telecomJio",
			"policyName": "Insurance Policy",
			"policyDesc": "Desc about policy"
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: No Partner api key requests for the Policy Group
```JSON
{
  "id": "mosip.partnermanagement.partners.apikey.request.retrieve",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PMS_PMP_015",
      "message": "No Partner api key requests for the Policy Group"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PMP_001|Partner Manager does not exist|Not a authorized Partner Manager- UserName not available in database
PMS_PMP_002|Mismatch of the Partner Manager Credentials|User Name and Password of the Partner Manager does not match
PMS_PMP_003|Your password has expired. Please reset your password|Password expired
PMS_PMP_015|No Partner api key requests for the Policy Group|No Partner api key requests for the Policy Group
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

## Partner Service
This service enables partners to do self registration, submit request for respective authentication policies, sharing of digital certificate for secure communication: 

* [POST /partners](#post-partners)
* [POST /partners/{partnerID}/partnerAPIKeyRequests}](#post-partnerspartneridpartnerapikeyrequests)
* [POST /partners/{partnerID}/partnerAPIKeyRequests/{APIKeyReqID}](#post-partnerspartneridpartnerapikeyrequestsapikeyreqid)
* [POST /partners/digitalcertificate](#post-partnersdigitalcertificate)
* [PUT /partners/{partnerID}](#put-partnerspartnerid)
* [PUT /partners/digitalcertificate](#put-partnersdigitalcertificate)
* [GET /partners/{partnerID}](#get-partnerspartnerid)
* [GET /partners/{partnerID}/partnerAPIKeyRequests}](#get-partnerspartneridpartnerapikeyrequests)
* [GET /partners/{partnerID}/partnerAPIKeyRequests/{APIKeyReqID}](#get-partnerspartneridpartnerapikeyrequestsapikeyreqid)
* [GET /partners/digitalcertificate](#get-partnersdigitalcertificate)


### POST /partners
This API would be used for self registration by partner to create Auth/E-KYC Partners. Partner Management module would be integrating with Kernel IAM module for generation of userid and password for partners. 
* User id, as received in response from Kernel IAM module, are stored in partner management database as reference and shared back to partners in response for further communication with MOSIP systems.
* Password for any userid would be shared via an off-line process.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/partners</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.partners.create
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-01-16T05:23:08.019Z
request |Yes|Request for the application|
request.organizationName|Yes|name of the organization|airtelInd
request.contactNumber|Yes|contact number for the partner|9886779980
request.emailID|Yes|email id of the partner|airtelInd@gmail.com
request.address.authPolicies|Yes|address of the partner|INDIA
request.policyGroup|Yes|policy group|Banking

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Request:
```JSON
{
  "id": "mosip.partnermanagement.partners.create",
  "version": "1.0",
  "requesttime": "2019-05-20T09:48:43.394Z",
  "metadata": {},
  "request": {
		"organizationName":"airtelInd", 
		"contactNumber":"9886779980", 
		"emailID":"airtelInd@gmail.com", 
		"address":"INDIA",
		"policyGroup":"Banking"
  }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: Partner successfully created.
```JSON
{
  "id": "mosip.partnermanagement.partners.create",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
		"partnerID":"6565655443544", 
		"status":"Active"
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: A Partner is already registered with name ”+ Partner Organization Name+ “ in the policy Group +Policy Group
```JSON
{
  "id": "mosip.partnermanagement.partners.create",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
		"errorCode": "PMS_PRT_001",
		"message": "A Partner is already registered with name 'airtelInd' in the policy Group 'Banking'.
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PRT_001|A Partner is already registered with name %d in the policy Group %d|A Partner is already registered with name ”+ Partner Organization Name+ “ in the policy Group +Policy Group
PMS_PRT_002|Policy Group does not exist|Policy Group does not exist
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### POST /partners/{partnerID}/partnerAPIKeyRequests
This API would be used to submit Partner api key request.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/partners/{partnerID}/partnerAPIKeyRequests</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
partnerID |Yes| partner ID|6565655443544

#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.partnerAPIKeyRequest.create
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-01-16T05:23:08.019Z
request |Yes|Request for the application|
request.policyName|Yes|name of the policy|airtelIndPolicy
request.useCaseDescription|Yes|useCase Description|Need to submit the payment

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Request:
```JSON
{
  "id": "mosip.partnermanagement.partnerAPIKeyRequest.create",
  "version": "1.0",
  "requesttime": "2019-05-20T09:48:43.394Z",
  "metadata": {},
  "request": {
		"policyName":"airtelIndPolicy", 
		"useCaseDescription":"Need to submit the payment"
  }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: partnerAPIKeyRequest successfully created.
```JSON
{
  "id": "mosip.partnermanagement.partnerAPIKeyRequest.create",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
		"apiRequestId":"873276828663",
		"message":"partnerAPIKeyRequest successfully created"
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: A Partner is already registered with name ”+ Partner Organization Name+ “ in the policy Group +Policy Group
```JSON
{
  "id": "mosip.partnermanagement.partnerAPIKeyRequest.create",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
		"errorCode": "PMS_PRT_001",
		"message": "A Partner is already registered with name 'airtelInd' in the policy Group 'Banking'.
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PRT_001|A Partner is already registered with name %d in the policy Group %d|A Partner is already registered with name ”+ Partner Organization Name+ “ in the policy Group +Policy Group
PMS_PRT_002|Policy Group does not exist|Policy Group does not exist
PMS_PRT_003|Mismatch of the Partner Credentials|User Name and Password of the Partner does not match
PMS_PRT_004|Your password has expired. Please reset your password|Password expired
PMS_PRT_005|Partner does not exist|Partner does not exist
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### POST /partners/{partnerID}/partnerAPIKeyRequests/{APIKeyReqID}
This API would be used to download Partner API key for the given APIKeyReqID

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/partners/{partnerID}/partnerAPIKeyRequests/{APIKeyReqID}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
partnerID |Yes| partner ID|6565655443544
APIKeyReqID |Yes| API Key RequestID|873276828663

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: successfully retrieved the partnerAPIKey.
```JSON
{
  "id": "mosip.partnermanagement.partnerAPIKey.download",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
		"partnerAPIKey":"fa604-affcd-33201-04770"
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: APIKeyReqID does not exist
```JSON
{
  "id": "mosip.partnermanagement.partnerAPIKey.download",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
		"errorCode": "PMS_PRT_005",
		"message": "APIKeyReqID does not exist"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PRT_003|Mismatch of the Partner Credentials|User Name and Password of the Partner does not match
PMS_PRT_004|Your password has expired. Please reset your password|Password expired
PMS_PRT_005|Partner does not exist|Partner does not exist
PMS_PRT_006|APIKeyReqID does not exist|APIKeyReqID does not exist
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### POST /partners/digitalcertificate
Partners would be procuring digital certificates from Certification Authority (CA), and upload the same to Partner Management using this API. 
* Partner Management would depend on Kernel to manage partner certificates, validation of partner certificates. Appropriate error messages would be sent back to Partners, in cases where digital certificates expires, certificate validation error happens. 
* Partners would require to re-issue and upload new digital certificates, in case of expiry of digital certificates. References to Partner digital certificate IDs are stored in partner management DBs, actual storage and validation of partner digital certificate would be in Kernel.
* IDA would be using partner provided public keys for encryption of e-kyc response. Partner management module would be using Kernel services for partner key management, encryption/decryption and sharing of keys.

Following Kernel services would be utilized for certificate and key management activities:
* [Kernel Key Manager](https://github.com/mosip/mosip-docs/wiki/Kernel-APIs#key-manager-private)
* [Kernel Crypto Manager](https://github.com/mosip/mosip-docs/wiki/Kernel-APIs#crypto-manager-private)
* [Crypto Signature Service](https://github.com/mosip/mosip-docs/wiki/Kernel-APIs#crypto-signature-service-private)

   
#### Resource URL
<div>https://mosip.io/partnermanagement/v1/partners/digitalcertificate</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.partners.certificate.upload
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-01-16T05:23:08.019Z
request |Yes|Request for the application|
request.partnerCertificate|Yes|partner digital certificate|digital certificate

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Request:
```JSON
{
  "id": "mosip.partnermanagement.partners.certificate.upload",
  "version": "1.0",
  "requesttime": "2019-05-20T09:48:43.394Z",
  "metadata": {},
  "request": {
		"partnerCertificate":"MIIFtjCCA56gAwIBAgIJAP1p0BePP1CFMA0GCSqGSIb3DQEBCwUAMHAxCzAJBgNV
                            UUTHNkNaMRcwFQYDVQQIDA5DemVjaCBSZXB1YmxpYzELMAkGA1UEBwwCQ0IxITAf
                            BgNVBAoMGEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDEYMBYGA1UEAwwPUkVTVCBB
                            UEkgU0VSVkVSMB4XDTE4MTAwNjIxMTQyMVoXDTI4MTAwMzIxMTQyMVowcDELMAkG
                            A1UEBhMCQ1oxFzAVBgNVBAgMDkN6ZWNoIFJlcHVibGljMQswCQYDVQQHDAJDQjEh
                            MB8GA1UECgwYSW50ZXJuZXQgV2lkZ2l0cyBQdHkgTHRkMRgwFgYDVQQDDA9SRVNU
                            IEFQSSBTRVJWRVIwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDF0BqJ
                            htgl5JJZM3zwDNN5l7rWcnN0Gp0A0fKY/rfyuSR/mQJ2W2DkX2ISvvRHaNsVwpVb
                            9Z1T0Dqa3RxgaGbgdc1AtTAAMzHWiPzCNtU="
  }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: successfully uploaded partner's digital certificate
```JSON
{
  "id": "mosip.partnermanagement.partners.certificate.upload",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
		"message":"successfully uploaded partner's digital certificate"
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: Partner digital certificate is not valid
```JSON
{
  "id": "mosip.partnermanagement.partners.retrieve",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
		"errorCode": "PMS_PRT_007",
		"message": "Partner digital certificate is not valid"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PRT_003|Mismatch of the Partner Credentials|User Name and Password of the Partner does not match
PMS_PRT_004|Your password has expired. Please reset your password|Password expired
PMS_PRT_005|Partner does not exist|Partner does not exist
PMS_PRT_007|Partner digital certificate is not valid|Partner digital certificate is not valid
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition

### PUT /partners/{partnerID}
This API would be used to update Auth/E-KYC Partner's details.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/partners/{partnerID}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
partnerID |Yes| partner ID|6565655443544

#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.partners.update
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-01-16T05:23:08.019Z
request |Yes|Request for the application|
request.organizationName|Yes|name of the organization|airtelInd
request.contactNumber|Yes|contact number for the partner|9886779980
request.emailID|Yes|email id of the partner|airtelInd@gmail.com
request.address|Yes|address of the partner|Bangalore,INDIA

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Request:
```JSON
{
  "id": "mosip.partnermanagement.partners.update",
  "version": "1.0",
  "requesttime": "2019-05-20T09:48:43.394Z",
  "metadata": {},
  "request": {
		"organizationName":"airtelInd", 
		"contactNumber":"9886779980", 
		"emailID":"airtelInd@gmail.com", 
		"address":"Bangalore,INDIA",
  }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: Partner successfully updated.
```JSON
{
  "id": "mosip.partnermanagement.partners.update",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
		"partnerID":"6565655443544", 
		"status":"Active"
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: A Partner is already registered with name ”+ Partner Organization Name+ “ in the policy Group +Policy Group
```JSON
{
  "id": "mosip.partnermanagement.partners.update",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
		"errorCode": "PMS_PRT_001",
		"message": "A Partner is already registered with name 'airtelInd' in the policy Group 'Banking'.
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PRT_001|A Partner is already registered with name %d in the policy Group %d|A Partner is already registered with name ”+ Partner Organization Name+ “ in the policy Group +Policy Group
PMS_PRT_003|Mismatch of the Partner Credentials|User Name and Password of the Partner does not match
PMS_PRT_004|Your password has expired. Please reset your password|Password expired
PMS_PRT_005|Partner does not exist|Partner does not exist
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### PUT /partners/digitalcertificate
As the MOSIP system Partner Management module would integrate with Kernel for validation of partner's digital certificate.
In case where MOSIP would act as certification authority for partners, MOSIP would be able to sign and resign partner digital certificates. Partner management module would depend on Kernel services for signing and re-signing of partner digital certificates.
Kernel Signature service would be utilized to validate signature : [Kernel Signature Service](https://github.com/mosip/mosip-platform/tree/master/kernel/kernel-signature-service)
#### Resource URL
<div>https://mosip.io/partnermanagement/v1/partners/digitalcertificate</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
id |Yes|id |mosip.partnermanagement.partners.certificate.validate
version |Yes|version of the application|1.0
requesttime |Yes|Time of the request|2019-01-16T05:23:08.019Z
request |Yes|Request for the application|
request.partnerCertificate|Yes|partner digital certificate|digital certificate

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Request:
```JSON
{
  "id": "mosip.partnermanagement.partners.certificate.validate",
  "version": "1.0",
  "requesttime": "2019-05-20T09:48:43.394Z",
  "metadata": {},
  "request": {
		"partnerCertificate":"MIIFtjCCA56gAwIBAgIJAP1p0BePP1CFMA0GCSqGSIb3DQEBCwUAMHAxCzAJBgNV
                            UUTHNkNaMRcwFQYDVQQIDA5DemVjaCBSZXB1YmxpYzELMAkGA1UEBwwCQ0IxITAf
                            BgNVBAoMGEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDEYMBYGA1UEAwwPUkVTVCBB
                            UEkgU0VSVkVSMB4XDTE4MTAwNjIxMTQyMVoXDTI4MTAwMzIxMTQyMVowcDELMAkG
                            A1UEBhMCQ1oxFzAVBgNVBAgMDkN6ZWNoIFJlcHVibGljMQswCQYDVQQHDAJDQjEh
                            MB8GA1UECgwYSW50ZXJuZXQgV2lkZ2l0cyBQdHkgTHRkMRgwFgYDVQQDDA9SRVNU
                            IEFQSSBTRVJWRVIwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDF0BqJ
                            htgl5JJZM3zwDNN5l7rWcnN0Gp0A0fKY/rfyuSR/mQJ2W2DkX2ISvvRHaNsVwpVb
                            9Z1T0Dqa3RxgaGbgdc1AtTAAMzHWiPzCNtU="
  }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: successfully validated partner's digital certificate
```JSON
{
  "id": "mosip.partnermanagement.partners.certificate.upload",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
		"message":"successfully validated partner's digital certificate"
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: Partner digital certificate is not valid
```JSON
{
  "id": "mosip.partnermanagement.partners.retrieve",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
		"errorCode": "PMS_PRT_007",
		"message": "Partner digital certificate is not valid"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PRT_003|Mismatch of the Partner Credentials|User Name and Password of the Partner does not match
PMS_PRT_004|Your password has expired. Please reset your password|Password expired
PMS_PRT_005|Partner does not exist|Partner does not exist
PMS_PRT_007|Partner digital certificate is not valid|Partner digital certificate is not valid
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### GET /partners/{partnerID}
This API would be used to retrieve Auth/E-KYC Partner details.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/partners/{partnerID}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
partnerID |Yes| partner ID|6565655443544

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: successfully retrieved the Partner details.
```JSON
{
  "id": "mosip.partnermanagement.partners.retrieve",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
		"partnerID":"6565655443544", 
		"status":"Active", 
		"organizationName":"airtelInd", 
	    "contactNumber":"9886779980", 
	    "emailID":"airtelInd@gmail.com", 
	    "address":"INDIA",
	    "policyGroup":"Banking"
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: Partner does not exist
```JSON
{
  "id": "mosip.partnermanagement.partners.retrieve",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
		"errorCode": "PMS_PRT_005",
		"message": "Partner does not exist"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PRT_003|Mismatch of the Partner Credentials|User Name and Password of the Partner does not match
PMS_PRT_004|Your password has expired. Please reset your password|Password expired
PMS_PRT_005|Partner does not exist|Partner does not exist
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### GET /partners/{partnerID}/partnerAPIKeyRequests
This API would be used to retrieve all API key requests submitted by partner till date.

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/partners/{partnerID}/partnerAPIKeyRequests</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
partnerID |Yes| partner ID|6565655443544

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: successfully retrieved all Active policies available for my policy group.
```JSON
{
  "id": "mosip.partnermanagement.partners.retrieve.apiKeyRequests",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
       "APIkeyRequests":[
			{
				"apiKeyReqID":"873276828663",
				"apiKeyRequestStatus":"approved", 
				"partnerApiKey":"fa604-affcd-33201-04770",
				"validityTill":"2019-11-01"
			},
			{
				"apiKeyReqID":"900876828663",
				"apiKeyRequestStatus":"in-progress"
			}
		]
	},
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: No API Key Request found for the partner
```JSON
{
  "id": "mosip.partnermanagement.partners.retrieve.apiKeyRequests",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
		"errorCode": "PMS_PRT_008",
		"message": "No API Key Request found"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PRT_003|Mismatch of the Partner Credentials|User Name and Password of the Partner does not match
PMS_PRT_004|Your password has expired. Please reset your password|Password expired
PMS_PRT_005|Partner does not exist|Partner does not exist
PMS_PRT_008|No API Key Request found|No API Key Request found for the partner
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### GET /partners/{partnerID}/partnerAPIKeyRequests/{APIKeyReqID}
This API would be used to view API key request status and API key (in case request is approved).

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/partners/{partnerID}/partnerAPIKeyRequests/{APIKeyReqID}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Comment
-----|----------|-------------|--------
APIKeyReqID |Yes| API Key RequestID|873276828663

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: successfully retrieved Partner api key/partner api key request status
```JSON
{
  "id": "mosip.partnermanagement.partners.apikey.status",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
		"apiKeyRequestStatus":"approved", 
		"partnerApiKey":"fa604-affcd-33201-04770",
		"validityTill":"2019-11-01"
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: APIKeyReqID does not exist
```JSON
{
  "id": "mosip.partnermanagement.partners.apikey.status",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
		"errorCode": "PMS_PRT_006",
		"message": "APIKeyReqID does not exist"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PRT_003|Mismatch of the Partner Credentials|User Name and Password of the Partner does not match
PMS_PRT_004|Your password has expired. Please reset your password|Password expired
PMS_PRT_005|Partner does not exist|Partner does not exist
PMS_PRT_006|APIKeyReqID does not exist|APIKeyReqID does not exist
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error

### GET /partners/digitalcertificate
Partners would be required to download MOSIP digital certificates. Partner would be using MOSIP public key (part of MOSIP digital certificate) and MOSIP digital certificate, for establishing secure communication with MOSIP. Partner management module would depend on Kernel services to manage MOSIP digital certificate, sharing and re-issue of digital certificate post expiry, validation, encryption/decryption activities. 

#### Resource URL
<div>https://mosip.io/partnermanagement/v1/partners/digitalcertificate</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Header 
Name | Required | Description | Comment
-----|----------|-------------|--------
Authorization | Yes | authentication token | Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJyYXZpLmJhbGFqaUBtaW5kdHJlZS5jb20iLCJtb2JpbGUiOiIiLCJtYWlsIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwicm9sZSI6IklORElWSURVQUwiLCJuYW1lIjoicmF2aS5iYWxhamlAbWluZHRyZWUuY29tIiwiaXNPdHBSZXF1aXJlZCI6dHJ1ZSwiaXNPdHBWZXJpZmllZCI6dHJ1ZSwiaWF0IjoxNTYyNTgwMzg0LCJleHAiOjE1NjI1ODYzODR9.eycrDnzPFBnx57wp6v-iXHtFnRxPgOysG3QETnElSswBUH5ojUUCLsn6SeYukIy-rEZ0SOdr9jkLE6A8tNkj4w


#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: successfully retrieved mosip digital certificate
```JSON
{
  "id": "mosip.partnermanagement.partners.mosip.certificate.download",
  "version": "1.0",
  "responsetime": "2019-05-16T16:01:20.534Z",
  "response":{
        "moispCertificate":"MIIFtjCCA56gAwIBAgIJAP1p0BePP1CFMA0GCSqGSIb3DQEBCwUAMHAxCzAJBgNV
                            UUTHNkNaMRcwFQYDVQQIDA5DemVjaCBSZXB1YmxpYzELMAkGA1UEBwwCQ0IxITAf
                            BgNVBAoMGEludGVybmV0IFdpZGdpdHMgUHR5IEx0ZDEYMBYGA1UEAwwPUkVTVCBB
                            UEkgU0VSVkVSMB4XDTE4MTAwNjIxMTQyMVoXDTI4MTAwMzIxMTQyMVowcDELMAkG
                            A1UEBhMCQ1oxFzAVBgNVBAgMDkN6ZWNoIFJlcHVibGljMQswCQYDVQQHDAJDQjEh
                            MB8GA1UECgwYSW50ZXJuZXQgV2lkZ2l0cyBQdHkgTHRkMRgwFgYDVQQDDA9SRVNU
                            IEFQSSBTRVJWRVIwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDF0BqJ
                            htgl5JJZM3zwDNN5l7rWcnN0Gp0A0fKY/rfyuSR/mQJ2W2DkX2ISvvRHaNsVwpVb
                            9Z1T0Dqa3RxgaGbgdc1AtTAAMzHWiPzCNtU="
  },
  "errors": null
}
```

##### Failure Response:
###### Status code: '200'
###### Description: Partner does not exist
```JSON
{
  "id": "mosip.partnermanagement.partners.mosip.certificate.download",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
		"errorCode": "PMS_PRT_005",
		"message": "Partner does not exist"
    }
  ]
}
```

#### Other Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
PMS_PRT_003|Mismatch of the Partner Credentials|User Name and Password of the Partner does not match
PMS_PRT_004|Your password has expired. Please reset your password|Password expired
PMS_PRT_005|Partner does not exist|Partner does not exist
PMS_COR_001|Missing Input Parameter - %d|Missing Input Parameter - for all mandatory attributes
PMS_COR_002|Invalid Input Parameter - %d |Invalid Input Parameter - for all attributes not as per defined data definition
PMS_COR_003|Could not process the request|Any Internal Error
