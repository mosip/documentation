This section contains detail about the service APIs in the Device Masterdata module


* [Devices API](#devices-master-api)

These APIs includes create and update APIs. These are used by the Administrator Portal for the Create and Update Device functionality.

* [Device Types API](#device-types-master-api)

These APIs includes create and update APIs. These are used by the Administrator Portal for the Create and Update Device Type functionality.

* [Device Specifications API](#device-specifications)

These APIs includes create and update APIs. These are used by the Administrator Portal for the Create and Update Device Specification functionality.

* [Device Search API](#post-devicessearch)

This API is used by the Administrator Portal to fetch list of Devices based on a given filter criteria to display the list of Devices on the Portal UI.

* [Device Types Search API](#post-devicetypessearch)

This API is used by the Administrator Portal to fetch list of Device Types based on a given filter criteria to display the list of Device Types on the Portal UI.

* [Device Spec Search API](#post-devicespecificationssearch)

This API is used by the Administrator Portal to fetch list of Device Specifications based on a given filter criteria to display the list of Device Specifications on the Portal UI.

* [Device - Filter values API](#post-devicesfiltervalues)

This API is used by the Administrator Portal UI to populate filter dropdowns on the Device List View UI Screen.

* [Device Types - Filter values API](#post-devicetypesfiltervalues)

This API is used by the Administrator Portal UI to populate filter dropdowns on the Device Types List View UI Screen.

* [Device Spec - Filter values API](#post-devicespecificationsfiltervalues)

This API is used by the Administrator Portal UI to populate filter dropdowns on the Device Specifications List View UI Screen.

# Devices Master API

* [POST /devices](#post-devices)
* [GET /devices/{languagecode}](#get-deviceslanguagecode)
* [GET /devices/{languagecode}/{deviceType}](#get-deviceslanguagecodedevicetype)
* [PUT /devices](#put-devices-1)
* [DELETE /devices/{id}](#delete-devicesid)

# POST /devices

This service will create the list of Devices which are used in the MOSIP platform. 

Please find the steps to create primary/secondary languages 

https://github.com/mosip/mosip-docs/wiki/Registration-Center-APIs#createupdate-api

### Resource URL
### `https://mosip.io/v1/masterdata/devices`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id|Yes|Id of the device| | 
macAddress|Yes|Mac Address of the device| | 
name|Yes|Name of the device| | 
deviceSpecId|Yes|Device specification Id of the device| | 
serialNum|Yes|Serial number of the device| | 
langCode|Yes|Language code of the device| | 
ipAddress|No|Ip Address of the device| | 
isActive|Yes|Is the device active?| | 
validityDateTime|Yes|Validity date of device| | 
zoneCode|Yes|Zone code of device| | 

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
         "id": "",
        "name": "Test device1",
        "serialNum": "BS563Q2230898",
        "deviceSpecId": "165",
        "macAddress": "85-BB-97-4B-14-05",
        "ipAddress": "10.4.6.8",
        "langCode": "eng",
        "validityDateTime": "2019-08-07T09:13:22.221Z",
        "zoneCode": "NTH",
        "isActive": true
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```
### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "responsetime": "2019-11-25T06:22:33.367Z",
  "metadata": null,
  "response": {
    "id": "7b40b97c-2db6-4e2c-b11f-dd5d5fd0ca79",
    "langCode": "eng",
    "name": "Test device1",
    "serialNum": "BS563Q2230898",
    "ipAddress": "10.4.6.8",
    "macAddress": "85-BB-97-4B-14-05",
    "deviceSpecId": "165",
    "validityDateTime": "2019-08-07T09:13:22.221Z",
    "zoneCode": "NTH",
    "deviceSpecification": null,
    "mapStatus": "unassigned",
    "isActive": false,
    "createdBy": "110005",
    "createdDateTime": "2019-11-25T06:22:33.382Z",
    "updatedBy": null,
    "updatedDateTime": null,
    "isDeleted": null,
    "deletedDateTime": null
  },
  "errors": null
}
```
### Response codes

200 Ok

##### Error Response:
```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
 "response": null
}

```

#### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-MSD-500 |Internal Server Error|If system error occurs
KER-ATH-403 |Forbidden|If unauthorized role detected
KER-ATH-401 |Authentication Failed|If no role/invalid token is detected
KER-MSD-069 |Error occurred while inserting Device details

# GET /devices/{languagecode}

This service will provides the service for the List of devices. 


### Resource URL
### `GET /devices`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-


### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
	"devices": [{
			"deviceSpecId": "string",
                        "id": "string",
                        "ipAddress": "string",
                        "isActive": true,
                        "langCode": "string",
                        "macAddress": "string",
                        "name": "string",
                        "serialNum": "string",
                        "validityDateTime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
	          }] 
             }
}
```
200

Description: Success

400

Description: Bad request

401

Description: Unauthorized

404

Description: Not Found


# GET /devices/{languagecode}/{deviceType}

This service will provides the service for the List of devices. 


### Resource URL
### `GET /devices/{languagecode}/{deviceType}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-


### Example Response
```JSON
 {
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
	"devices": [{
			 "deviceSpecId": "string",
                         "deviceTypeCode": "string",
                         "id": "string",
                         "ipAddress": "string",
                         "isActive": true,
                         "langCode": "string",
                         "macAddress": "string",
                         "name": "string",
                         "serialNum": "string",
                         "validityEndDateTime": "2019-04-05T09:30:13.608Z"
	         }]
    }
}
```
200

Description: Success

400

Description: Bad request

401

Description: Unauthorized

404

Description: Not Found

# PUT /devices

This service will update existing device. 


### Resource URL
### `PUT /devices`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-


### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
         "id": "7b40b97c-2db6-4e2c-b11f-dd5d5fd0ca79",
        "name": "Test device2",
        "serialNum": "BS563Q2230898",
        "deviceSpecId": "165",
        "macAddress": "85-BB-97-4B-14-05",
        "ipAddress": "10.4.6.8",
        "langCode": "eng",
        "validityDateTime": "2019-08-07T09:13:22.221Z",
        "zoneCode": "NTH",
        "isActive": true
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```
### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "responsetime": "2019-11-25T06:22:33.367Z",
  "metadata": null,
  "response": {
    "id": "7b40b97c-2db6-4e2c-b11f-dd5d5fd0ca79",
    "langCode": "eng",
    "name": "Test device1",
    "serialNum": "BS563Q2230898",
    "ipAddress": "10.4.6.8",
    "macAddress": "85-BB-97-4B-14-05",
    "deviceSpecId": "165",
    "validityDateTime": "2019-08-07T09:13:22.221Z",
    "zoneCode": "NTH",
    "isActive": false,
    "createdBy": "110005",
    "createdDateTime": "2019-11-25T06:22:33.382Z",
    "updatedBy": "110005",
    "updatedDateTime": "2019-11-25T06:22:33.382Z",
    "isDeleted": null,
    "deletedDateTime": null
  },
  "errors": null
}
```
### Response codes

200 Ok

##### Error Response:
```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
 "response": null
}

```

#### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-MSD-500 |Internal Server Error|If system error occurs
KER-ATH-403 |Forbidden|If unauthorized role detected
KER-ATH-401 |Authentication Failed|If no role/invalid token is detected
KER-MSD-083 |Error occurred while updating Device details

# DELETE /devices/{id}

This service will delete the devices. 

### Resource URL
### `DELETE /devices/{id}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
deviceId|Yes|The device Id| | 

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":{
               "id": "string"
            }
}
```
### Response codes
200 OK

### Failure Response:
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [{
      "errorCode": "string",
      "message": "string"
    }],
  "response":null
}
```

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-009 | Error occurred while fetching Devices | Fetch Issue
KER-MSD-069 | Error occurred while inserting Device details | Insertion Issue
KER-MSD-010 | Device not Found | Data Not Found
KER-MSD-083 | Error while updating | Update Issue
KER-MSD-084 | Error while deleting | Deletion Issue
KER-MSD-147 | Cannot delete as dependency found | Deletion Issue because of dependency


# Device Types Master API

* [POST /devicetypes](#post-devicetypes)

## POST /devicetypes

This service will create the list of Device types which are used in the MOSIP platform. 

### Resource URL
### `POST /devicetypes`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
devicetypecode|Yes|Code of the device type| | 
devicename|Yes|Name of the device type| | 
description|Yes|Description of the device type| | 
languagecode|Yes|Language code of the device type| | 
isactive|Yes|Is the device type active?| | 

### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request":  {
    "code": "string",
    "description": "string",
    "isActive": true,
    "langCode": "string",
    "name": "string"
  }
}
```
### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":{
      "code": "string",
      "langCode": "string"
  }
}
```
### Response codes
202

Description: Accepted

400

Description: Bad request

401

Description: Unauthorized

403

Description: Forbidden

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-053 |  Error occurred while inserting Device Type details | Insertion Issue
KER-MSD-003 |  Required Device Type detail Not Found | Data Not Found
KER-MSD-002 |  Error occurred while mapping Device Type details | Mapping Issue
KER-MSD-054 |  Error occurred while fetching Device Type details | Fetch Issue


# Device Specifications

* [POST /devicespecifications](#post-devicespecifications)
* [PUT /devicespecifications](#put-devicespecifications)
* [DELETE /devicespecifications/{id}](#delete-devicespecificationsid)
* [GET /devicespecifications/{langcode}/{devicetypecode}](#get-devicespecificationslangcodedevicetypecode)
* [GET /devicespecifications/{lang_code}](#get-devicespecificationslang_code)

# POST /devicespecifications

This service will create a Device Specification which are used in the MOSIP platform. 

### Resource URL
### `https://mosip.io/v1/masterdata/devicespecifications`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id|Yes|ID of the Device Specification| | 
name|Yes|Name of the Device Specification| | 
brand|Yes|Brand of the Device specification| | 
model|Yes|Model of the Device specification| | 
deviceTypeCode|Yes|device type code of the Device specification| | 
minDriverversion|Yes|Minimum driver version required for the Device specification| | 
description|Yes|Description of the Device specification| | 
langCode|Yes|Language of the Device specification| | 
isActive|Yes|Is the Device Specification active| | 

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "brand": "string",
    "description": "string",
    "deviceTypeCode": "string",
    "id": "added",
    "isActive": true,
    "langCode": "string",
    "minDriverversion": "string",
    "model": "string",
    "name": "string"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```
### Example Response
```JSON
{
  "id": "string"
}
```

# PUT /devicespecifications

This service will update a Device Specification which are used in the MOSIP platform. 


### Resource URL
### `PUT /devicespecifications`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id|Yes|ID of the Device Specification| | 
lang_code|Yes|Language code of the Device Specification| | 

### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
    "brand": "string",
    "description": "string",
    "id": "string",
    "isActive": true,
    "langCode": "string",
    "deviceTypeCode": "string",
    "minDriverversion": "string",
    "model": "string",
    "name": "string"
  }
}
```
### Example Response
```JSON
{
  "id": "string"
}
```

# DELETE /devicespecifications/{id}

This service deletes a Device Specification from the Device Specifications master module. 

### Resource URL
### `DELETE /devicespecifications/{id}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id|Yes|ID of the Device Specification| | 


### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":  {
          "id": "string"
   }
}
```

# GET /devicespecifications/{langcode}/{devicetypecode}

This service will provides the list of all Device Specifications for specified language code and device type code . 


### Resource URL
### `GET /devicespecifications/{langcode}/{devicetypecode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
lang_code|Yes|Language code of the Device Specification| |
dtyp_code|Yes|device type code of the Device specification| | 

### Example Request
```JSON
-NA-
```

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":   {
  "devicespecifications": [
    {
      "brand": "string",
      "description": "string",
      "deviceTypeCode": "string",
      "id": "string",
      "isActive": true,
      "langCode": "string",
      "minDriverversion": "string",
      "model": "string",
      "name": "string"
    }
  ]
}
}

```


# GET /devicespecifications/{lang_code}

This service will provides the list of all Device Specifications in a specific language. 


### Resource URL
### `GET /devicespecifications/{lang_code}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
lang_code|Yes|Language code of the Device Specification| |

### Example Request
```JSON
-NA-
```

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response" : {
  "devicespecifications": [
    {
      "brand": "string",
      "description": "string",
      "deviceTypeCode": "string",
      "id": "string",
      "isActive": true,
      "langCode": "string",
      "minDriverversion": "string",
      "model": "string",
      "name": "string"
    }
  ]
 }
}
```

### Response codes
202

Description: Accepted

400

Description: Bad request

401

Description: Unauthorized

403

Description: Forbidden

### Failure Response:
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [{
      "errorCode": "string",
      "message": "string"
    }],
  "response" : null
}
```

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-011 | Error occurred while fetching Device Specifications | Fetch Issue
KER-MSD-054 | Error occurred while inserting Device Specification details | Insertion Issue
KER-MSD-012 | Device Specification not found | Data Not Found
KER-MSD-081 | Error occurred while updating Device Specification | Update Issue
KER-MSD-082 | Error occurred while deleting Device Specification | Deletion Issue
KER-MSD-121 | Cannot delete dependency found | Deletion Issue because of dependency


# Device search APIs

* [POST /devices/search](#post-devicessearch)

# POST /devices/search

This service is for the devices search functionality. All the filter parameters are passed and the devices are searched and the matching results are returned.

### Resource URL
### `POST /devices/search`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
filters|No|Array of the filter applied. In case of "list" screen, this array will be empty| -NA- |
columnName|No|The column name in the JSON response| -NA- |
type|No|The value have to be in ["contains","equals","startsWith","between"]| -NA- |
value|No|Value or id selected in the filter by the end user| -NA- |
fromValue|No|If the type is "between", this field is the value of the fromName| -NA- |
toValue|No|If the type is "between", this field is the value of the toName| -NA- |
languagecode|Yes|Language code in Language code in ISO 639-2 format| | 
sort|No|This is an array of the sort field and type| | 
sortfield| The field on which the sort is applied | | modifiedDate
sorttype| This should be either of ['ASC','DESC']| | ASC
pagination|The pagination parameter object| |
pageStart|This is the start index | 0 | 0
pageFetch| This is the amount of records to be fetched | 10 | 10


### Filter Values
Please find the filter columns used in search
1) name
2) isActive
3) macAddress
4) serialNum
5) mapStatus
6) deviceTypeName

### Filter Values
Filter Name| Search Values
-----|----------
Device Name|["contains","equals","startsWith"]
Status|["contains","equals","startsWith"]
MAC Address|["contains","equals","startsWith"]
Serial Number|["contains","equals","startsWith"]
Map Status|["contains","equals","startsWith"]
Device Type|["contains","equals","startsWith"]
Device Specification ID|["contains","equals","startsWith"]

### Example Request
```JSON
{
	"id": "string",
	"metadata": {},
	"requesttime": "2018-12-10T06:12:52.994Z",
	"version": "string",
	"request": {
		"filters" : [
			{
				"columnName": "",
				"type": "in",
				"value": "",
				"fromValue": "",
				"toValue": ""
			}
		],
		"sort":[
			{
				"sortfield":"string",
				"sorttype":"ASC"
			}
		],
		"pagination":{
			"pageStart":"number",
			"pageFetch":"number"
		},
		"languageCode":""
	}
}
```

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "devices": [
      {
        "deviceSpecId": "string",
        "id": "string",
        "ipAddress": "string",
        "isActive": true,
        "langCode": "string",
        "macAddress": "string",
        "name": "string",
        "serialNum": "string",
        "validityDateTime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
      }
    ],
	"fromRecord" : "number",
	"toRecord":"number",
	"totalRecord":"number"
  }
}
```


# Device Types search APIs

* [POST /devicetypes/search](#post-devicetypessearch)

# POST /devicetypes/search

This service is for the devices types search functionality. All the filter parameters are passed and the devices types are searched and the matching results are returned.

### Resource URL
### `POST /devicetypes/search`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
filters|No|Array of the filter applied. In case of "list" screen, this array will be empty| -NA- |
columnName|No|The column name in the JSON response| -NA- |
type|No|The value have to be in ["contains","equals","startsWith","between"]| -NA- |
value|No|Value or id selected in the filter by the end user| -NA- |
fromValue|No|If the type is "between", this field is the value of the fromName| -NA- |
toValue|No|If the type is "between", this field is the value of the toName| -NA- |
languagecode|Yes|Language code in Language code in ISO 639-2 format| | 
sort|No|This is an array of the sort field and type| | 
sortfield| The field on which the sort is applied | | modifiedDate
sorttype| This should be either of ['ASC','DESC']| | ASC
pagination|The pagination parameter object| |
pageStart|This is the start index | 0 | 0
pageFetch| This is the amount of records to be fetched | 10 | 10

### Filter Values
Please find the filter columns used in search
1) name
2) status

### Example Request
```JSON
{
	"id": "string",
	"metadata": {},
	"requesttime": "2018-12-10T06:12:52.994Z",
	"version": "string",
	"request": {
		"filters" : [
			{
				"columnName": "",
				"type": "in",
				"value": "",
				"fromValue": "",
				"toValue": ""
			}
		],
		"sort":[
			{
				"sortfield":"string",
				"sorttype":"ASC"
			}
		],
		"pagination":{
			"pageStart":"number",
			"pageFetch":"number"
		},
		"languageCode":""
	}
}
```

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "deviceTypes": [
      {
        "code": "string",
	"langCode": "string",
	"name": "string",
        "description": "string",
        "isActive": true
      }
    ],
	"fromRecord" : "number",
	"toRecord":"number",
	"totalRecord":"number"
  }
}
```


# Device Spec Search APIs

* [POST /devicespecifications/search](#post-devicespecificationssearch)

# POST /devicespecifications/search

This service is for the devices specifications search functionality. All the filter parameters are passed and the device specifications are searched and the matching results are returned.

### Resource URL
### `POST /devicespecifications/search`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
filters|No|Array of the filter applied. In case of "list" screen, this array will be empty| -NA- |
columnName|No|The column name in the JSON response| -NA- |
type|No|The value have to be in ["contains","equals","startsWith","between"]| -NA- |
value|No|Value or id selected in the filter by the end user| -NA- |
fromValue|No|If the type is "between", this field is the value of the start range| -NA- |
toValue|No|If the type is "between", this field is the value of the end range| -NA- |
languagecode|Yes|Language code in Language code in ISO 639-2 format| | 
sort|No|This is an array of the sort field and type| | 
sortfield| The field on which the sort is applied | | modifiedDate
sorttype| This should be either of ['ASC','DESC']| | ASC
pagination|The pagination parameter object| |
pageStart|This is the start index | 0 | 0
pageFetch| This is the amount of records to be fetched | 10 | 10

### Filter Values
Please find the filter columns used in search
1) name
2) isActive
3) deviceTypeName

### Example Request
```JSON
{
	"id": "string",
	"metadata": {},
	"requesttime": "2018-12-10T06:12:52.994Z",
	"version": "string",
	"request": {
		"filters" : [
			{
				"columnName": "",
				"type": "in",
				"value": "", 
				"fromValue": "",  
				"toValue": ""
			}
		],
		"sort":[
			{
				"sortfield":"string",
				"sorttype":"ASC"
			}
		],
		"pagination":{
			"pageStart":"number",
			"pageFetch":"number"
		},
	       "languageCode":""
		
	}
}
```

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "devicespecifications": [
      {
        "brand": "string",
        "description": "string",
        "deviceTypeCode": "string",
        "id": "string",
        "isActive": true,
        "langCode": "string",
        "minDriverversion": "string",
        "model": "string",
        "name": "string"
      }
    ],
	"fromRecord" : "number",
	"toRecord":"number",
	"totalRecord":"number"
  }
}
```

# Device filter values

* [POST /devices/filtervalues](#post-devicesfiltervalues)

# POST /devices/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
### `POST /devices/filtervalues`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
filters|No|Array of the filter applied. In case of "list" screen, this array will be empty| -NA- |
columnName|No|The column name in the JSON response| -NA- |
type|No|The value have to be in ["unique","all"]| unique | unique
languagecode|Yes|Language code in Language code in ISO 639-2 format| | 


### Example Request
```JSON
{
	"id": "string",
	"metadata": {},
	"requesttime": "2018-12-10T06:12:52.994Z",
	"version": "string"
	"request": {
		"filters" : [
			{
				"columnName": ""
				"type": "unique"
			}
		],
		"languageCode": "string",
	}
}
```

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
  "filters": [
	{
		"fieldID": "string",
		"fieldValue": "string"
	}
   ]
 }
}
```

# Device Types filter values

* [POST /devicetypes/filtervalues](#post-devicetypesfiltervalues)

# POST /devicetypes/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
### `POST /devicetypes/filtervalues`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
filters|No|Array of the filter applied. In case of "list" screen, this array will be empty| -NA- |
columnName|No|The column name in the JSON response| -NA- |
type|No|The value have to be in ["unique","all"]| unique | unique
languagecode|Yes|Language code in Language code in ISO 639-2 format| | 


### Example Request
```JSON
{
	"id": "string",
	"metadata": {},
	"requesttime": "2018-12-10T06:12:52.994Z",
	"version": "string"
	"request": {
		"filters" : [
			{
				"columnName": ""
				"type": "unique"
			}
		],
		"languageCode": "string",
	}
}
```

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
  "filters": [
	{
		"fieldID": "string",
		"fieldValue": "string"
	}
   ]
 }
}
```

# Device Spec Filter values

* [POST /devicespecifications/filtervalues](#post-devicespecificationsfiltervalues)

# POST /devicespecifications/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
### `POST /devicespecifications/filtervalues`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
filters|No|Array of the filter applied. In case of "list" screen, this array will be empty| -NA- |
columnName|No|The column name in the JSON response| -NA- |
type|No|The value have to be in ["unique","all"]| unique | unique
languagecode|Yes|Language code in Language code in ISO 639-2 format| | 


### Example Request
```JSON
{
	"id": "string",
	"metadata": {},
	"requesttime": "2018-12-10T06:12:52.994Z",
	"version": "string"
	"request": {
		"filters" : [
			{
				"columnName": ""
				"type": "unique"
			}
		],
		"languageCode": "string",
	}
}
```

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
  "filters": [
	{
		"fieldID": "string",
		"fieldValue": "string"
	}
   ]
 }
}
```