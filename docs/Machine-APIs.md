This section contains detail about the service APIs in the Machine Masterdata module


* [Machines API](#machines-master-api)

These APIs includes create, update and fetch APIs. Create and Update API is used by the Administrator Portal for the Create and Update Machine functionality. Fetch APIs are used by Registration Processor to validate the Machine data received in packet to make sure the packet is generated in an authorized Machine.

* [Machine Types Master API](#machine-types-master-api)

These APIs includes Create, Update, Search and Filter API which are used by the Administrator Portal. Create and Update API is used for the Create and Update Machine Type functionality. Search API is used by the portal to fetch the list of Machine Types based on a filter criterion to display the list of Machine Types on the UI and Filter API is used by the portal to populate Machine Type Filter Dropdowns on the Portal UI.

* [Machine Specifications API](#machine-specifications)

These APIs include Create, Update, Search and Filter API which are used by the Administrator Portal. Create and Update API is used for the Create and Update Machine Specification functionality. Search API is used by the portal to fetch the list of Machine Specification based on a filter criterion to display the list of Machine Specification on the UI and Filter API is used to populate Machine Specification Filter Dropdowns on the Portal UI.

* [Machine - Search API](#post-machinessearch)

This API is used by the Administrator Portal to fetch list of Machines based on a given filter criteria to display the list of Machines on the Portal UI.

* [Machine - Filter values](#post-machinesfiltervalues)

This API is used by the Administrator Portal UI to populate filter dropdowns on the Machine List View UI Screen.


# Machines Master API

* [POST /machines](#post-machines)
* [GET /machines](#get-machines)
* [GET /machines/{languagecode}](#get-machineslanguagecode)
* [GET /machineshistory/{id}/{languagecode}/{eff_dtimes}](#get-machineshistoryidlanguagecodeeff_dtimes)
* [DELETE /machines/{id}](#delete-machinesid)
* [PUT /machines](#put-machines)


# POST /machines
z
This service will create the list of Machines which are used in the MOSIP platform. 

Please find the steps to create primary/secondary languages 

https://github.com/mosip/mosip-docs/wiki/Registration-Center-APIs#createupdate-api

### Resource URL
### `POST /machines`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id|Yes|Id of the machine| | 
name|Yes|Name of the machine| | 
machineSpecId|Yes|Machine specification Id of the machine| | 
serialNum|Yes|Serial number of the machine| | 
langCode|Yes|Language code of the machine| | 
ipAddress|No|Ip Address of the machine| | 
isActive|Yes|Is the machine active?| | 
validityDateTime|Yes|Validity date of machine| | 
zoneCode|Yes|Zone code of machine| | 

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
  	"id":"10091",
    "ipAddress": "192.168.0.150",
    "isActive": true,
    "langCode": "eng",
    "macAddress": "8C-16-45-5A-5D-0D",
    "machineSpecId": "1001",
    "name": "test machine1",
    "serialNum": "NM5328114630",
    "validityDateTime": "2018-12-10T06:12:52.994Z",
    "zoneCode": "NTH"
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
    "responsetime": "2019-11-26T04:26:01.049Z",
    "metadata": null,
    "response": {
        "isActive": false,
        "createdBy": "110006",
        "createdDateTime": "2019-11-26T04:26:01.179Z",
        "updatedBy": null,
        "updatedDateTime": null,
        "isDeleted": null,
        "deletedDateTime": null,
        "id": "10100",
        "name": "test machine1",
        "serialNum": "NM5328114630",
        "macAddress": "8C-16-45-5A-5D-0D",
        "ipAddress": "192.168.0.150",
        "machineSpecId": "1001",
        "langCode": "eng",
        "validityDateTime": "2018-12-10T06:12:52.994Z"
    },
    "errors": null
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

# GET /machines

This service will provides the service to fetch the complete List of machines with the machine details. 

### Resource URL
### `GET /machines`

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
               "machines": [{
                            "id": "string",
                            "ipAddress": "string",
                            "isActive": true,
                            "langCode": "string",
                            "macAddress": "string",
                            "machineSpecId": "string",
                            "name": "string",
                            "serialNum": "string",
                            "validityDateTime": "2018-12-24T05:54:42.097Z"
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


# GET /machines/{languagecode}
Master data is required across the platform. 

This service will provides the service to fetch the List of machines with the machine details based on the language.

### Resource URL
### `GET /machines/{languagecode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
languagecode| Yes | Machine Languge Code|


### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
              "machines": [{
                           "id": "string",
                           "ipAddress": "string",
                           "isActive": true,
                           "langCode": "string",
                           "macAddress": "string",
                           "machineSpecId": "string",
                           "name": "string",
                           "serialNum": "string",
                           "validityDateTime": "2018-12-24T05:58:03.286Z"
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


# GET /machineshistory/{id}/{languagecode}/{eff_dtimes}

This service will provides the service for the List of machines with their history. 


### Resource URL
### `GET /machineshistory/{id}/{languagecode}/{eff_dtimes}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
ID|Yes|Machine History Id|
languagecode|Yes|Language code for the Machine|
eff_dtimes|Yes |Effective Date and Time of the Machine|

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
 "response": {
            "machineHistoryDetails": [
                                      {
                                      "effectDateTime": "2018-12-24T06:05:26.304Z",
                                      "id": "string",
                                      "ipAddress": "string",
                                      "isActive": true,
                                      "langCode": "string",
                                      "macAddress": "string",
                                      "machineSpecId": "string",
                                      "name": "string",
                                      "serialNum": "string",
                                      "validityDateTime": "2018-12-24T06:05:26.304Z"
                                   }
                                 ]
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

# DELETE /machines/{id}

This service will delete the machines. 

### Resource URL
### `DELETE /machines/{id}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
machineId|Yes|The machineId| | 

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
 "response": {
              "id": "string"
             }
}
```
200

Description: When Machine deleted successfully

204

Description: No Content

401

Description: Unauthorized

403
	
Description: Forbidden

404

Description: When machine not found

500

Description: Error occurred while deleting Machine

# PUT /machines

This service will update existing machines. 


### Resource URL
### `PUT /machines`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id|Yes|Id of the machine| | 
name|Yes|Name of the machine| | 
machineSpecId|Yes|Machine specification Id of the machine| | 
serialNum|Yes|Serial number of the machine| | 
langCode|Yes|Language code of the machine| | 
ipAddress|No|Ip Address of the machine| | 
isActive|Yes|Is the machine active?| | 
validityDateTime|Yes|Validity date of machine| | 
zoneCode|Yes|Zone code of machine| | 


### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
  	"id":"10100",
    "ipAddress": "192.168.0.150",
    "isActive": true,
    "langCode": "eng",
    "macAddress": "8C-16-45-5A-5D-0D",
    "machineSpecId": "1001",
    "name": "test machine1",
    "serialNum": "NM5328114630",
    "validityDateTime": "2018-12-10T06:12:52.994Z",
    "zoneCode": "NTH"
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
    "responsetime": "2019-11-26T04:31:08.982Z",
    "metadata": null,
    "response": {
        "isActive": true,
        "createdBy": "110006",
        "createdDateTime": "2019-11-26T04:31:15.344Z",
        "updatedBy": "110006",
        "updatedDateTime": "2019-11-26T04:31:15.344Z",
        "isDeleted": null,
        "deletedDateTime": null,
        "id": "10100",
        "name": "test machine1",
        "serialNum": "NM5328114630",
        "macAddress": "8C-16-45-5A-5D-0D",
        "ipAddress": "192.168.0.150",
        "machineSpecId": "1001",
        "langCode": "eng",
        "validityDateTime": "2018-12-10T06:12:52.994Z"
    },
    "errors": null
}
```
### Response codes
200 Ok

### Failure Response
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
"response": null
}
```

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-029 | Error occured while fetching Machines | Fetch Issue
KER-MSD-063 | Error occurred while inserting Machine details | Insertion Issue
KER-MSD-030 | Machine not Found | Data Not Found
KER-MSD-087 | Error occurred while updating Machine details | Update Issue
KER-MSD-088 | Error occurred while deleting Machine details | Deletion Issue
KER-MSD-148 | Cannot delete as dependency found | Deletion Issue because of dependency


# Machine Types Master API

* [POST /machinetypes](#post-machinetypes)
* [GET /machinetypes](#get-machinetypes)
* [GET /machinetypes/{languagecode}](#get-machinetypeslanguagecodee)
* [POST /machinetypes/search](#post-machinetypessearch)
* [POST /machinetypes/filtervalues](#post-machinetypesfiltervalues)

# POST /machinetypes

This service will create the list of Machine types which are used in the MOSIP platform. 

### Resource URL
### `POST /machinetypes`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
machinetypecode|Yes|Code of the machine type| | 
machinename|Yes|Name of the machine type| | 
description|Yes|Description of the machine type| | 
languagecode|Yes|Language code of the machine type| | 
isactive|Yes|Is the machine type active?| | 

### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
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
  "response": {
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

# GET /machinetypes

This service will provides the service to fetch the complete List of machine types with the machine details. 

### Resource URL
### `GET /machinetypes`

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
  "response":{
  "machinetypes": [
				{ 
					"machinetypecode":"string",
					"machinename":"string",	
					"description":"string",
					"languagecode":"boolean",
					"isactive":"string" 
				}, 
				{ 
					"machinetypecode":"string",
					"machinename":"string",	
					"description":"string",
					"languagecode":"boolean",
					"isactive":"string" 
				}
			]
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


# GET /machinetypes/{languagecode}

This service will provides the service to fetch the List of machines with the machine details based on the language code.

### Resource URL
### `GET /machinetypes/{languagecode}`

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
  "response":  {
           "machines": [
				{ 
					"machinetypecode":"string",
					"machinename":"string",	
					"description":"string",
					"languagecode":"boolean",
					"isactive":"string" 
				}, 
				{ 
					"machinetypecode":"string",
					"machinename":"string",	
					"description":"string",
					"languagecode":"boolean",
					"isactive":"string" 
				}
			]
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

### Failure Response
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
  "response":  null
 }
```

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-061 | Error occurred while inserting Machine Type details | Insertion Issue
KER-MSD-062 | Error occurred while fetching Machine Type details | Fetch Issue
KER-MSD-063 | Machine Type Not Found | Data Not Found

# Machine Type search APIs

* [POST /machinetypes/search](#post-machinetypessearch)

# POST /machinetypes/search

This service is for the machine type search functionality. All the filter parameters are passed and the machines types are searched and the matching results are returned. 

### Resource URL
### `POST /machinetypes/search`

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
type|No|The value have to be in ["contains","equals",”startsWith”,"between"]| -NA- |
value|No|Value or id selected in the filter by the end user| -NA- |
fromValue|No|If the type is "between", this field is the value of the start range| -NA- |
toValue|No|If the type is "between", this field is the value of the end range| -NA- |
languagecode|Yes|Language code in Language code in ISO 639-2 format| | 
sort|No|This is an array of the sort field and type| | 
sortfield| The field on which the sort is applied | | modifiedDate
sorttype| This should be either of ['ASC','DESC']| | ASC
pagination|The pagination parameter object| |
pageStart|This is the start index | 0 | 10
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
     "machineTypes": [
      {
     "code": "string",
    "description": "string",
    "isActive": true,
    "langCode": "string",
    "name": "string"  
 }
    ],
	"fromRecord" : "number",
	"toRecord":"number",
	"totalRecord":"number"
 }
}
```
# Machine Types filter values

* [POST /machinetypes/filtervalues](#post-machinetypesfiltervalues)

# POST /machinetypes/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
### `POST /machinetypes/filtervalues`

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

# Machine Specifications

* [POST /machinespecifications](#post-machinespecifications)
* [PUT /machinespecifications](#put-machinespecifications)
* [DELETE /machinespecifications/{id}](#delete-machinespecificationsid)
* [GET /machinespecifications](#get-machinespecifications)
* [GET /machinespecifications/{lang_code}](#get-machinespecificationslang_code)
* [POST /machinespecifications/search](#post-machinespecificationssearch)
* [POST /machinespecifications/filtervalues](#post-machinespecificationsfiltervalues)


# POST /machinespecifications

This service will create a Machine Specification which are used in the MOSIP platform. 

### Resource URL
### `POST /machinespecifications`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id|Yes|ID of the Machine Specification| | 
name|Yes|Name of the machine Specification| | 
brand|Yes|Brand of the machine specification| | 
model|Yes|Model of the machine specification| | 
mtyp_code|Yes|Machine type code of the machine specification| | 
min_driver_ver|Yes|Minimum driver version required for the machine specification| | 
descr|Yes|Description of the machine specification| | 
lang_code|Yes|Language of the machine specification| | 
is_active|Yes|Is the Machine Specification active| | 

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
    "machineTypeCode": "string",
    "minDriverversion": "string",
    "model": "string",
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
  "response":  {
              "id": "string"
               }
}
```

# PUT /machinespecifications

This service will update a Machine Specification which are used in the MOSIP platform. 


### Resource URL
### `PUT /machinespecifications`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id|Yes|ID of the Machine Specification| | 
lang_code|Yes|Language code of the Machine Specification| | 

### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request":  {
    "brand": "string",
    "description": "string",
    "id": "string",
    "isActive": true,
    "langCode": "string",
    "machineTypeCode": "string",
    "minDriverversion": "string",
    "model": "string",
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
  "response":  {
             "id": "string"
             }
}
```


# DELETE /machinespecifications/{id}

This service deletes a Machine Specification from the Machine Specifications master module. 

### Resource URL
### `DELETE /machinespecifications/{id}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id|Yes|ID of the Machine Specification| | 


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

# GET /machinespecifications

This service will provides the list of all Machine Specifications in all languages. 


### Resource URL
### `GET /machinespecifications`

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
  "response":  {
	"id":"KJDS9",
	"name":"Laptop",
	"brand":"Hewlett Packard",
	"model":"L34-324",
	"mtyp_code":"GEW8",
	"min_driver_ver":"1.4",
	"descr":"This is a medium configuration",
	"lang_code":"eng",
	"is_active":true
    }
}
```


# GET /machinespecifications/{lang_code}

This service will provides the list of all Machine Specifications in a specific language. 


### Resource URL
### `GET /machinespecifications/{lang_code}`

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
	"id":"KJDS9",
	"name":"Laptop",
	"brand":"Hewlett Packard",
	"model":"L34-324",
	"mtyp_code":"GEW8",
	"min_driver_ver":"1.4",
	"descr":"This is a medium configuration",
	"lang_code":"eng",
	"is_active":true
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
  "response":   null
}
```

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-062 | Error occurred while inserting Machine Specification details | Insertion Issue
KER-MSD-117 | Machine Specification not Found | Data Not Found
KER-MSD-085 | Error occurred while updating Machine Specification details | Update Issue
KER-MSD-086 | Error occurred while deleting Machine Specification details | Deletion Issue
KER-MSD-122 | Cannot delete dependency found | Deletion Issue because of dependency
KER-MSD-087 | Error occurred while fetching Machine Specification details | Fetch Issue


# Machine Specifications Search APIs

* [POST /machinespecifications/search](#post-machinespecificationssearch)

# POST /machinespecifications/search

This service is for the machine specifications search functionality. All the filter parameters are passed and the machines specifications are searched and the matching results are returned. 

### Resource URL
### `POST /machinespecifications/search`

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
type|No|The value have to be in ["contains","equals",”startsWith”,"between"]| -NA- |
value|No|Value or id selected in the filter by the end user| -NA- |
fromValue|No|If the type is "between", this field is the value of the start range| -NA- |
toValue|No|If the type is "between", this field is the value of the end range| -NA- |
languagecode|Yes|Language code in Language code in ISO 639-2 format| | 
sort|No|This is an array of the sort field and type| | 
sortfield| The field on which the sort is applied | | modifiedDate
sorttype| This should be either of ['ASC','DESC']| | ASC
pagination|The pagination parameter object| |
pageStart|This is the start index | 0 | 10
pageFetch| This is the amount of records to be fetched | 10 | 10

### Filter Values
Please find the filter columns used in search
1) name
2) isActive
3) brand
4) model
5) machineTypeName

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
     "machineSpecifications": [
      {
       "brand": "string",
    "description": "string",
    "id": "string",
    "isActive": true,
    "langCode": "string",
    "machineTypeCode": "string",
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
# Machine Specifications filter values

* [POST /machinespecifications/filtervalues](#post-machinespecificationsfiltervalues)

# POST /machinespecifications/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
### `POST /machinespecifications/filtervalues`

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


# Machine search APIs

* [POST /machines/search](#post-machinessearch)

# POST /machines/search

This service is for the machine search functionality. All the filter parameters are passed and the machines are searched and the matching results are returned. 

### Resource URL
### `POST /machines/search`

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
type|No|The value have to be in ["contains","equals",”startsWith”,"between"]| -NA- |
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
3) macAddress
4) serialNum
5) mapStatus
6) machineTypeName

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
     "data": [
      {
        "id": "string",
        "ipAddress": "string",
        "isActive": true,
        "langCode": "string",
        "macAddress": "string",
        "machineSpecId": "string",
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
# Machine filter values

* [POST /machines/filtervalues](#post-machinesfiltervalues)

# POST /machines/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
### `POST /machines/filtervalues`

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