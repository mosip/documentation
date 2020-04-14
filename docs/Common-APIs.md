This section contains detail about the service APIs in the Common Masterdata module
* [Titles API](#titles-master-api)
These APIs includes create, update and fetch APIs. Create and Update API is used by the Administrator Portal for the Create and Update Title functionality. Fetch APIs are used by IDA to separate out Name from the title.
* [Titles - Search API](#post-titlessearch)
This API is used by the Administrator Portal to fetch list of Titles based on a given filter criteria to display the list of Titles on the Portal UI.
* [Titles - Filter values](#post-titlesfiltervalues)
This API is used by the Administrator Portal UI to populate filter dropdowns on the Title List View UI Screen.
* [Gender API](#gender-master-api)
These APIs includes create, update and fetch APIs. Create and Update API is used by the Administrator Portal for the Create and Update Gender functionality. Fetch API is used by Pre-Registration to display the Genders on the demographic form page for the applicant to select one gender while filling out the form.
* [Genders - Search API](#post-genderssearch)
This API is used by the Administrator Portal to fetch list of Genders based on a given filter criteria to display the list of Genders on the Portal UI.
* [Genders - Filter values](#post-gendersfiltervalues)
This API is used by the Administrator Portal UI to populate filter dropdowns on the Gender List View UI Screen.
* [Age Groups API](#age-group-types-api)
This service will provide the age group based on the passed age.
* [ID Types API](#id-types-master-api)
These API contains the Create and Fetch ID types API.
* [Holidays API](#holiday-master-api) 
These APIs includes create, update and fetch APIs. Create and Update API is used by the Administrator Portal for the Create and Update Holiday functionality. Fetch API is used by Pre-Registration to refer the list of Holiday for a Registration Center while generating booking appointments.
* [Holiday filtervalues APIs](#post-holidaysfiltervalues)
This API is used by the Administrator Portal UI to populate filter dropdowns on the Holiday List View UI Screen.
* [Holiday Search API](#post-holidayssearch)
This API is used by the Administrator Portal to fetch list of Holidays based on a given filter criteria to display the list of Holidays on the Portal UI.
* [Locations API](#locations-master-api)
These APIs includes create, update and fetch APIs. Create and Update API is used by the Administrator Portal for the Create and Update Location functionality. Fetch API is used by Pre-Registration and ID objected validator. Pre-Registration uses this API to display locations in the demographic form page for applicant to select locations from the dropdown while filling in the address. ID object validator uses the fetch API to validate the value of location received in the packet against the Masterdata.
* [Locations - Search API](#post-locationssearch)
This API is used by the Administrator Portal to fetch list of Locations based on a given filter criteria to display the list of Locations on the Portal UI.
* [Locations - Filter values](#post-locationsfiltervalues)
This API is used by the Administrator Portal UI to populate filter dropdowns on the Location List View UI Screen.
* [Languages API](#languages-master-api)
These include APIs to create, update and fetch MOSIP supported languages.
* [Individual Types API](#individual-types-api)
These includes the APIs to fetch list of Individual Types. This API is used by Pre-Registration to display the list of Individual type for an applicant to select on the Demographic page.
* [Application Types API](#application-types-master-api)
These include APIs to create, update and fetch name of MOSIP Applications.
* [Blacklisted Words API](#blacklisted-words-master-api)
These APIs includes create, update and fetch APIs. Create and Update API is used by the Administrator Portal for the Create and Update Blacklisted Word functionality. Fetch API is used by Pre-Registration to verify if a Blacklisted word in entered by the Applicant in the Demographic form.
* [BlackListed Words - Search API](#post-blacklistedwordssearch)
This API is used by the Administrator Portal to fetch list of Locations based on a given filter criteria to display the list of Blacklisted Words on the Portal UI.
* [BlackListed Words - Filter values](#post-blacklistedwordsfiltervalues)
This API is used by the Administrator Portal UI to populate filter dropdowns on the Blacklisted Word List View UI Screen.
* [Working days](#working-days)
This API is fetches the defined working days of a week for a Registration Center. It is used by Pre-Registration to consider working days while generating booking appointments for a Registration Center.
* [Exceptional holidays](#exceptional-holidays)
This API is fetches the list of exceptional holidays if any defined for a Registration Center. It is used by Pre-Registration to consider exceptional holidays while generating booking appointments for a Registration Center.

# Titles Master API
These APIs includes create, update and fetch APIs. Create and Update API is used by the Administrator Portal for the Create and Update Title functionality. Fetch APIs are used by IDA to separate out Name from the title.

* [POST /title](#post-title)
* [GET /title](#get-title)
* [GET /title/{langcode}](#get-titlelangcode)
* [PUT /title](#put-title)
* [DELETE /title/{code}](#delete-titlecode)
* [GET /title/all](#get-titleall)

## POST /title
This service will create the list of Title which are used in the MOSIP platform. 

### Resource URL
`POST /title`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
titletype|Yes|Name of the title| | 

### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request":  {
    "code": "cvf",
    "isActive": true,
    "langCode": "ghf",
    "titleDescription": "string",
    "titleName": "string"
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
  "errors": [ {
      "errorCode": "string",
      "message": "string"
    } 
  ],
  "response": {
    "code": "cvf",
    "langCode": "ghf"
  }
}
```

### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
403 | Forbidden

## GET /title
This service will provides the service for  list of all titles.

### Resource URL
`GET /title`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
NA | NA | NA | NA | NA


### Example Response
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
  "response": {
    "titleList": [ {
      "code": "43",
      "titleName": "string",
      "titleDescription": "string",
      "isActive": true,
      "langCode": "ENG"
      }
	]
  }
}
```

### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
403 | Forbidden


## GET /title/{langcode}
This service will provides the service for the List of Titles. 

### Resource URL
`GET /title/{langcode}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
langcode|Yes|Code of the language| | 


### Example Response
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
  "response": {
    "titleList": [{
      "code": "xcv",
      "titleName": "string",
      "titleDescription": "string",
      "isActive": true,
      "langCode": "qwe"
      }
	]
  }
}
```

### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
403 | Forbidden

## PUT /title
This service will provides the service for updating a particular title. 

### Resource URL
`PUT /title`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|Code of the title| | 
titleName|Yes|Name of the title| | 
isActive|Yes|Name of the title| |
langCode|Yes|Name of the title| |
titleDescription|Yes|Name of the title| |

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "code": "string",
    "langCode": "string"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
403 | Forbidden


## DELETE /title/{code}
This service will provides the service for deleting a particular title. 

### Resource URL
`DELETE /title/{code}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|Code of the title| | 

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "code": "string"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
403 | Forbidden


### Failure Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [ {
      "errorCode": "string",
      "message": "string"
    } ],
  "response": null
}
```

## GET /title/all
This service will provides the service for  list of all titles.

### Resource URL
`GET /title/all`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
orderBy | optional |order the requested data based on param ||
pageNumber | optional | page no for the requested data ||
pageSize | optional |page size for the requested data ||
sortBy | optional | sort the requested data based on param value ||

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "data": [
      {
        "code": "string",
        "createdBy": "string",
        "isActive": true,
        "isDeleted": true,
        "langCode": "string",
        "titleDescription": "string",
        "titleName": "string",
        "updatedBy": "string"
      }
    ],
    "pageNo": 0,
    "totalItems": 0,
    "totalPages": 0
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
403 | Forbidden

### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-047 | Error occured while fetching Titles | Fetch Issue
KER-MSD-XXX | Error occurred while inserting Title details | Insertion Issue
KER-MSD-048 | Title not found | Data Not Found
KER-MSD-103 | Error occurred while updating Title details | Update Issue
KER-MSD-104 | Error occurred while deleting Title details | Deletion Issue


## POST /titles/search


### Resource URL
`POST /titles/search`

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
type|No|The value have to be in ["in","equals","startsWith","between"]| -NA- |
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
Filter Name| Search Values
-----|----------
name|["contains","equals","startsWith"]
status|["equals"]

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
    "titleList": [
      {
        "code": "string",
        "isActive": true,
        "langCode": "string",
        "titleDescription": "string",
        "titleName": "string"
      }
    ],
    "fromRecord" : "number",
    "toRecord":"number",
    "totalRecord":"number"
  }
}
```

# Titles filter values
* [POST /titles/filtervalues](#post-titlesfiltervalues)

## POST /titles/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
`POST /titles/filtervalues`

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

# Gender Master API

* [POST /gendertypes](#post-gendertypes)
* [PUT/gendertypes](#putgendertypes)
* [DELETE/gendertypes/{code}](#deletegendertypescode)
* [GET /gendertypes](#get-gendertypes)
* [GET /gendertypes/{langcode}](#get-gendertypeslangcode)
* [GET /gendertypes/{gendername}](#get-gendertypesgendername)
* [GET /gendertypes/all](#get-gendertypesall)

## POST /gendertypes

This service will create the list of Gender which are used in the MOSIP platform. 

### Resource URL
`POST /gendertypes`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
gendertype|Yes|Name of the gender| | 

### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
    "code": "GC002",
    "genderName": "Male",
    "isActive": true,
    "langCode": "ENG"
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
    "code": "GC002",
    "langCode": "ENG"
  }
}
```

### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
403 | Forbidden

## PUT/gendertypes
This service will update Gender which are used in the MOSIP platform. 

### Resource URL
`PUT/gendertypes`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|Code of gender type| | 
genderName|Yes|Name of gender type| | 
isActive|Yes|is active or not| | 
code|Yes|language code of gender| | 

### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request":  {
    "code": "GC001",
    "genderName": "Male",
    "isActive": true,
    "langCode": "ENG"
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
    "code": "GC001",
    "langCode": "ENG"
  }
}
```

### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
403 | Forbidden

## DELETE /gendertypes/{code}
This service will delete Gender which are used in the MOSIP platform. 

### Resource URL
`DELETE/gendertypes/{code}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|Code of gender type| |  

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "code": "GC001",
  }
}
```

### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
403 | Forbidden

## GET /gendertypes
This service will provides the service for the List of Genders. 

### Resource URL
`GET /gendertypes`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
NA | NA | NA | NA | NA

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {  
    "genderType": [
	  {
        "code": "GC001",
        "genderName": "Female",
        "langCode": "eu",
        "isActive": true
      }
    ]
  }
}
```

### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
403 | Forbidden

## GET /gendertypes/{langcode}
This service will provides the service for the List of Genders. 

### Resource URL
`GET /gendertypes/{langcode}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
langcode|Yes|Code of the language| | 

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "genderType": [
	  {
        "code": "GC002",
        "genderName": "Male",
        "langCode": "eng",
        "isActive": true
      }
	]
  }
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden

## GET /gendertypes/{gendername}
This service will provides the gender based on the gender name. 

### Resource URL
`GET /gendertypes/{gendername}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
gendername|Yes|Name of the gender| | 


### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
	"code": "GC001",
	"genderName": "Female",
	"langCode": "eu",
	"isActive": true
  }
}
```

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

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden

## GET gendertypes/all
This service will provides all gendertypes details. 

### Resource URL
`GET gendertypes/all`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
orderBy | optional |order the requested data based on param ||
pageNumber | optional | page no for the requested data ||
pageSize | optional |page size for the requested data ||
sortBy | optional | sort the requested data based on param value ||

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "data": [
      {
        "code": "GC001",
        "createdBy": "string",
        "genderName": "Male",
        "isActive": true,
        "isDeleted": true,
        "langCode": "ENG",
        "updatedBy": "string"
      }
    ],
    "pageNo": 0,
    "totalItems": 0,
    "totalPages": 0
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-017 | Error occured while fetching gender types | Fetch Issue
KER-MSD-018 | Gender Type not found | Not Found
KER-MSD-068 | Could not insert Gender Data | Insert Issue
KER-MSD-101 | Error occurred while updating Gender Type details | Update Issue
KER-MSD-102 | Error occurred while deleting Gender Type details | Delete Issue

## POST /genders/search

### Resource URL
`POST /genders/search`

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
    "genderType": [
      {
        "code": "GC001",
        "genderName": "Male",
        "isActive": true,
        "langCode": "eng"
      }
    ],
    "fromRecord" : "number",
    "toRecord":"number",
    "totalRecord":"number"
  }
}
```

# Genders filter values
* [POST /genders/filtervalues](#post-gendersfiltervalues)

## POST /genders/filtervalues
This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
`POST /genders/filtervalues`

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

# Age group types API
* [GET /agegrouptype/{age}](#get-agegrouptypeage)

## GET /agegrouptype/{age}
This service will provides the age group based on the passed age. 

### Resource URL
`GET /agegrouptype/{age}`

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
  "errors": [{
      "errorCode": "string",
      "message": "string"
    }
  ],
  "response":  {
	"agegrouptypecode": "string",
	"name": "string",
	"description": "string",
	"minimumage": "number",
	"maximumage": "number",
	"langCode": "string",
	"isactive": boolean
  }
}
```

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

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden

# ID Types Master API
* [POST /idtypes](#post-idtypes)
* [GET /idtypes/{languagecode}](#get-idtypeslanguagecode)

## POST /idtypes
This service will create the list of Id types which are used in the MOSIP platform. 

### Resource URL
`POST /idtypes`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
idtype|Yes|Name of the id type| | 
languagecode|Yes|Language of the id type| | 

### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
               "code": "string",
               "descr": "string",
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
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden

# GET /idtypes/{langcode}
This service will provides the service for the List of id types based on language. 

### Resource URL
`GET /idtypes/{langcode}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
langcode|Yes|Code of the language| | 

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "idtypes": [
      {
        "code": "string",
        "descr": "string",
        "isActive": true,
        "langCode": "string",
        "name": "string"
      }
    ]
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

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

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden


### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-022 | ID Type not found. | Not Found
KER-MSD-021 | Error occurred while fetching ID Types |Fetch Issue
KER-MSD-059 | Error occurred while inserting ID Type details. | Insert Issue


# Holiday Master API
* [GET /holidays](#get-holidays)
* [POST /holidays](#post-holidays)
* [PUT /holidays](#put-holidays)
* [DELETE /holidays](#delete-holidays)
* [GET /holidays/{holidayid}](#get-holidaysholidayid)
* [GET /holidays/{holidayid}/{langcode}](#get-holidaysholidayidlangcode)
* [GET /holidays/all](#get-holidaysall)
* [POST /holidays/filtervalues](#post-holidaysfiltervalues)
* [POST /holidays/search](#post-holidayssearch)

## GET /holidays
This service will get all the holidays. 

### Resource URL
`GET /holidays`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
--NA-- 

### Example Response
```JSON
{
  "id": null,
  "version": null,
  "responsetime": "2019-11-15T09:41:14.274Z",
  "metadata": null,
  "response": {
    "holidays": [
      {
        "id": 2000001,
        "locationCode": "KTA",
        "holidayDate": "2019-01-01",
        "holidayDay": "2",
        "holidayMonth": "1",
        "holidayYear": "2019",
        "holidayName": "New Year's Day",
        "holidayDesc": "National Holiday",
        "langCode": "eng",
        "isActive": true
      }
	]
  },
  "errors": null
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden

## POST /holidays
This service will create a new holiday. 

### Resource URL
`POST /holidays`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
locationCode | Yes | location code ||
holidayDate | Yes| date ||
holidayMonth | Yes | month || 
holidayYear |Yes | year ||
holidayName |Yes | name ||
holidayDesc |Yes | description ||
langCode |Yes | language code ||
isActive |Yes | is active? ||

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "holidayDate": "string",
    "holidayDay": "string",
    "holidayDesc": "string",
    "holidayMonth": "string",
    "holidayName": "string",
    "holidayYear": "string",
    "id": 0,
    "isActive": true,
    "langCode": "string",
    "locationCode": "string"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "holidayDate": "string",
    "holidayName": "string",
    "langCode": "string",
    "locationCode": "string"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
403 | Forbidden


## PUT /holidays
This service will update a holiday. 

### Resource URL
`PUT /holidays`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
locationCode | Yes | location code ||
holidayDate | Yes| date ||
newHolidayDate | Yes | new date || 
newHolidayName | Yes | new name ||
holidayName | Yes | name ||
holidayDesc | Yes | description ||
langCode | Yes | language code ||
isActive | Yes | is active? ||
newHolidayDesc | Yes | new description ||

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "id": 0,
    "locationCode": "string",
    "holidayDate": "string",
    "holidayName": "string",
    "holidayDesc": "string",
    "langCode": "string",
    "isActive": true,
    "newHolidayName": "string",
    "newHolidayDate": "string",
    "newHolidayDesc": "string"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

### Example Response
```JSON
{
  "holidayDate": "string",
  "holidayName": "string",
  "langCode": "string",
  "locationCode": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden


## DELETE /holidays
This service will provides the service to delete a holiday. 


### Resource URL
`DELETE /holidays`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
holidayDate | Yes | date to be deleted ||
holidayName | Yes | name of the holiday to be deleted ||
locationCode | Yes | location code ||

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "holidayDate": "string",
    "holidayName": "string",
    "locationCode": "string"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

### Example Response
```JSON
{
  "holidayDate": "string",
  "holidayName": "string",
  "locationCode": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden


## GET /holidays/{holidayid}
This service will provides the service to get all holidays by Id. 

### Resource URL
`GET /holidays/{holidayid}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
holidayid | yes | holiday Id ||

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "holidays": [
      {
        "holidayDate": "string",
        "holidayDay": "string",
        "holidayDesc": "string",
        "holidayMonth": "string",
        "holidayName": "string",
        "holidayYear": "string",
        "id": 0,
        "isActive": true,
        "langCode": "string",
        "locationCode": "string"
      }
    ]
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden


## GET /holidays/{holidayid}/{langcode}
This service will get all the holidays by holidayid and language code. 

### Resource URL
`GET /holidays/{holidayid}/{langcode}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
holidayid | yes | holiday Id ||||
langCode | Yes | language code ||

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "holidays": [
      {
        "holidayDate": "string",
        "holidayDay": "string",
        "holidayDesc": "string",
        "holidayMonth": "string",
        "holidayName": "string",
        "holidayYear": "string",
        "id": 0,
        "isActive": true,
        "langCode": "string",
        "locationCode": "string"
      }
    ]
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden


## GET /holidays/all
This service will retrieve all the holidays with additional metadata. 

### Resource URL
`GET /holidays/all`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
orderBy | optional | response order	| desc	||
pageNumber |optional | page no for the requested data | 0 ||	
pageSize | optional	| page size for the requested data	| 10 ||
sortBy | optional | sort the requested data based on param value | createdDateTime ||

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "data": [
      {
        "createdBy": "string",
        "holidayDate": 0,
        "holidayDay": "string",
        "holidayDesc": "string",
        "holidayId": 0,
        "holidayMonth": "string",
        "holidayName": "string",
        "holidayYear": "string",
        "isActive": true,
        "isDeleted": true,
        "langCode": "string",
        "locationCode": "string",
        "name": "string",
        "updatedBy": "string"
      }
    ],
    "pageNo": 0,
    "totalItems": 0,
    "totalPages": 0
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden

## Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-019 | Error occured while fetching Holidays | Fetch Issue
KER-MSD-020 | Holiday not found | Data Not Found
KER-MSD-065 | Error occurred while inserting holiday | Insertion Issue
KER-MSD-099 | Error occurred while updating holiday | Update Issue
KER-MSD-100 | Error occurred while deleting holiday | Deletion Issue
KER-MSD-025 | Error occured while fetching Location Hierarchy | fetch issue
KER-MSD-026 | Location not found | Data Not Found


# Holiday filtervalues APIs
* [POST /holidays/filtervalues](#post-holidaysfiltervalues)

## POST /holidays/filtervalues
This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
`POST /holidays/filtervalues`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
filters | No| Array of the filter applied. In case of "list" screen, this array will be empty | -NA- |
columnName |No | The column name in the JSON response | -NA- |
type | No | The value have to be in ["unique","all"] | unique | unique
languagecode | Yes | Language code in Language code in ISO 639-2 format | | 

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "filters": [
      {
        "columnName": "string",
        "type": "string",
        "text": "string"
      }
    ],
    "languageCode": "string",
    "optionalFilters": [
      {
        "value": "string",
        "fromValue": "string",
        "toValue": "string",
        "columnName": "string",
        "type": "string"
      }
    ]
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "filters": [
      {
        "fieldID": "string",
        "fieldValue": "string"
      }
    ]
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden

# Holiday search APIs
* [POST /holidays/search](#post-holidayssearch)

## POST /holidays/search
This service is for the holidays search functionality. All the filter parameters are passed and the holidays are searched and the matching results are returned.

### Resource URL
`POST /holidays/search`

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
1) holidayName
2) holidayDate|["between"]
3) isActive

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
    "holidays": [
      {
        "holidayDate": "string",
        "holidayDay": "string",
        "holidayDesc": "string",
        "holidayMonth": "string",
        "holidayName": "string",
        "holidayYear": "string",
        "id": 0,
        "isActive": true,
        "langCode": "string",
        "locationCode": "string"
      }
    ],
	"fromRecord" : "number",
	"toRecord":"number",
	"totalRecord":"number"
  }
}
```

# Locations Master API
* [POST /locations](#post-locations)
* [PUT /locations](#put-locations)
* [DELETE /locations/{locationcode}](#delete-locationslocationcode)
* [GET /locations/{langcode}](#get-locationslangcode)
* [GET /locations/{locationcode}/{languagecode}](#get-locationslocationcodelanguagecode)
* [GET /locations/immediatechildren/{locationcode}/{languagecode}](#get-locationsimmediatechildrenlocationcodelanguagecode)
* [GET /locations/locationhierarchy/{hierarchyname}](#get-locationslocationhierarchyhierarchyname)
* [GET /locations/validate/{locationname}](#get-locations-validate-locationname)
* [GET /locations/all](#get-locations-all)

## `POST /locations`
This masterdata service creates the location.
Please find the steps to create primary/secondary languages in the [link](Registration-Center-APIs.md#createupdate-api).

### Resource URL
`POST /locations`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|Code of the location| | 
name|Yes|Name of the location| | 
hierarchyLevel|Yes|Heirarchy level of the location| | 
hierarchyName|Yes|Hierarchy level name of the location| | 
parentLocCode|Yes|Parent location code of the location| | 
langCode|Yes|Language Code of the location| | 
isActive|Yes|Is this location active| | 


### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "code": "",
    "hierarchyLevel": 4,
    "hierarchyName": "Zone",
    "isActive": false,
    "langCode": "eng",
    "name": "Souissi1",
    "parentLocCode": ""
  },
  "requesttime": "2019-11-18T00:37:08.886Z",
  "version": "string"
}
```

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "responsetime": "2019-11-19T12:34:43.989Z",
  "metadata": null,
  "response": {
    "code": "d2382b5a-6f7b-44c0-98b7-85e289b3f6e0",
    "name": "Souissi1",
    "hierarchyLevel": 4,
    "hierarchyName": "Zone",
    "parentLocCode": "",
    "langCode": "eng",
    "registrationCenters": null,
    "isActive": false,
    "createdBy": "110005",
    "createdDateTime": "2019-11-19T12:34:43.944Z",
    "updatedBy": null,
    "updatedDateTime": null,
    "isDeleted": null,
    "deletedDateTime": null
  },
  "errors": null
}
```

### Error Response:
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

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden

#### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-MSD-500 |Internal Server Error|If system error occurs
KER-ATH-403 |Forbidden|If unauthorized role detected
KER-ATH-401 |Authentication Failed|If no role/invalid token is detected
KER-MSD-389 |Parent location not found
KER-MSD-385 |Location already exist under the hierarchy
KER-MSD-064 |Error occured while inserting location hierarchy details


## PUT /locations

### Resource URL
`PUT /locations`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|Code of the location| | 
name|Yes|Name of the location| | 
hierarchyLevel|Yes|Heirarchy level of the location| | 
hierarchyName|Yes|Hierarchy level name of the location| | 
parentLocCode|Yes|Parent location code of the location| | 
langCode|Yes|Language Code of the location| | 
isActive|Yes|Is this location active| | 

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "code": "d2382b5a-6f7b-44c0-98b7-85e289b3f6e0",
    "hierarchyLevel": 4,
    "hierarchyName": "Zone",
    "isActive": false,
    "langCode": "eng",
    "name": "Souissi1",
    "parentLocCode": ""
  },
  "requesttime": "2019-11-18T00:37:08.886Z",
  "version": "string"
}
```

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "responsetime": "2019-11-19T12:34:43.989Z",
  "metadata": null,
  "response": {
    "code": "d2382b5a-6f7b-44c0-98b7-85e289b3f6e0",
    "name": "Souissi1",
    "hierarchyLevel": 4,
    "hierarchyName": "Zone",
    "parentLocCode": "",
    "langCode": "eng",
    "registrationCenters": null,
    "isActive": false,
    "createdBy": "110005",
    "createdDateTime": "2019-11-19T12:34:43.944Z",
    "updatedBy": "110005",
    "updatedDateTime": "2019-11-19T12:34:43.944Z",
    "isDeleted": null,
    "deletedDateTime": null
  },
  "errors": null
}
```

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

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden

### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-MSD-500 |Internal Server Error|If system error occurs
KER-ATH-403 |Forbidden|If unauthorized role detected
KER-ATH-401 |Authentication Failed|If no role/invalid token is detected
KER-MSD-097 |Error occured while updating location hierarchy details


## DELETE /locations/{locationcode}

### Resource URL
`DELETE /locations/{locationcode}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
locationcode | Yes | location code ||

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":  {
    "code": "string"
  }
}
```

### Response codes
Response Code | Description
--------------|------------
202 | Accepted
400 | Bad request
401 | Unauthorized
403 | Forbidden

## GET /locations/{langcode}
This service will provides the service for the List of Locations. 

### Resource URL
`GET /locations/{langcode}`

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
    "locations": [
      {
        "locationHierarchylevel": number,
        "locationHierarchyName": "string",
        "isActive":true
      },
      {
        "locationHierarchylevel": number,
        "locationHierarchyName": "string",
        "isActive":true
      }
    ]
  }
}
```
### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden
500 | Internal Server Error


## GET /locations/{locationcode}/{languagecode}
This service will provides the service for the List of Locations. 

### Resource URL
`GET /locations/{locationcode}/{languagecode}`

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
    "locations": [
	  {
		"code":"string",
		"name":"string",
		"hierarchyLevel":"number",
		"hierarchyLevelName":"string",
		"parentLocCode":"",
		"langCode":"string",
		"isActive":"boolean",
	  },
	  {
		"code":"string",
		"name":"string",
		"hierarchyLevel":"number",
		"hierarchyLevelName":"string",
		"parentLocCode":"",
		"langCode":"string",
		"isActive":"boolean"		
	  }
	] 
  }
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
404 | Not Found


## GET /locations/immediatechildren/{locationcode}/{langcode}
This service will provides the service for the List of Locations. 

### Resource URL
`GET /locations/immediatechildren/{locationcode}/{langcode}`

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
    "locations": [ 
      {
		"code":"string",
		"name":"string",
		"hierarchyLevel":"number",
		"hierarchyLevelName":"string",
		"parentLocCode":"",
		"langCode":"string",
		"isActive":"boolean"	
	  },
	  {
		"code":"string",
		"name":"string",
		"hierarchyLevel":"number",
		"hierarchyLevelName":"string",
		"parentLocCode":"",
		"langCode":"string",
		"isActive":"boolean"
	  }
	]
  }
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
404 | Not Found

## GET /locations/locationhierarchy/{hierarchyname}
This service will provides the service for the List of Locations based on the location hierarchy name. 

### Resource URL
`GET /locations/locationhierarchy/{hierarchyname}`

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
    "locations": [
	  {
		"code":"string",
		"name":"string",
		"hierarchyLevel":"number",
		"hierarchyLevelName":"string",
		"parentLocCode":"",
		"langCode":"string",
		"isActive":"boolean"	
	  },
	  {
		"code":"string",
		"name":"string",
		"hierarchyLevel":"number",
		"hierarchyLevelName":"string",
		"parentLocCode":"",
		"langCode":"string",
		"isActive":"boolean"
	  }
	]
  }
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden

## GET /locations/validate/{locationname}
This service whether the given location name is valid or not. 

### Resource URL
`GET /locations/validate/{locationname}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
locationname|yes|This is the location name. | -NA- | 

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "status": "string"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
403 | Forbidden

## GET /locations/all
This service will provide all locations

### Resource URL
`GET /locations/all`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
pageNumber | optional | page no for the requested data | -NA- | 
pageSize | optional | page size for the requested data | -NA- | 
sortBy | optional | sort the requested data based on param value | -NA- | 
orderBy | optional | order the requested data based on param | -NA- | 

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "pageNo":"number",
	"totalPages":"number",
	"totalItems":"number",
	"data": [{
		"code":"string",
		"name":"string",
		"hierarchyLevel":"number",
		"hierarchyName":"string",
		"parentLocCode":"string",
		"langCode":"string"
	}]
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
404 | Not Found

### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-025 | Error occured while fetching Location Hierarchy | Fetch Issue
KER-MSD-026 | Location not found | Data Not Found
KER-MSD-064 | Error occured while inserting location hierarchy details | Insertion Issue
KER-MSD-097 | Error occured wihile updating location hierarchy details | Update Issue
KER-MSD-098 | Error occured wihile deleting location hierarchy details | Deletion Issue
KER-MSD-028 | Location Hierarchy Level not found | Data Not Found
KER-MSD-027 | Error occured while fetching Location Hierarchy Levels | Fetch Issue
KER-MSD-389 | Parent location not found | Data Not Found
KER-MSD-385 | Location already exist under the hierarchy | insertion issue


# Locations Search APIs
* [POST /locations/search](#post-locationssearch)

## POST /locations/search
This service is for the locations search functionality. All the filter parameters are passed and the locations  are searched and the matching results are returned. 

### Resource URL
`POST /locations/search`

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
type|No|The value have to be in ["in","equals",,"startsWith""between"]| -NA- |
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
* isActive
* region
* province
* city
* Zone
* postalCode

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
        "code": "string",
        "hierarchyLevel": 0,
        "hierarchyName": "string",
        "isActive": true,
        "langCode": "string",
        "name": "string",
        "parentLocCode": "string"
      }
    ],
    "fromRecord" : "number",
    "toRecord":"number",
    "totalRecord":"number"
  }
}
```

# Locations filter values
* [POST /locations/filtervalues](#post-locationsfiltervalues)

## POST /locations/filtervalues
This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
`POST /locations/filtervalues`

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
	  "fieldCode": "string"
	  "fieldID": "string",
	  "fieldValue": "string"
	}
   ]
 }
}
```

# Languages Master API
* [POST /languages](#post-languages)
* [GET /languages](#get-languages)
* [PUT /languages](#put-languages)
* [DELETE /languages/{code}](#delete-languagescode)

## POST /languages
This service will create a Language which is used in the MOSIP platform. 

### Resource URL
`POST /languages`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|Code of the language| | 
name|Yes|Name of the language| | 

### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request":  {
	"code": "string",
	"name": "string"
	"family": "string",
	"native_name": "string",
	"is_active": boolean
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
	"code": "string"
  }
}
```

### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
403 | Forbidden


## GET /languages
This service will provides the service for the List of languages. 

### Resource URL
`GET /languages`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
NA ||


### Example Request
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
	"languages": [{
	  "code": "string",
	  "name": "string",
	  "family": "string",
	  "native_name": "string",
	  "is_active": "boolean"
	  }
	]
  }
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
404 | Not Found

## PUT /languages
This service will update a Language which is used in the MOSIP platform. 

### Resource URL
`PUT /languages`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|Code of the language| | 
name|Yes|Name of the language| | 

### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request":  {
	"code": "string",
	"name": "string"
	"family": "string",
	"native_name": "string",
	"is_active": boolean
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
	"code": "string"
  }
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Ok
400 | Bad request
401 | Unauthorized
404 | Not Found

# DELETE /languages/{code}
This service will delete a Language which is used in the MOSIP platform. 

### Resource URL
`DELETE /languages/{code}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|Code of the language| | 

### Example Request
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
	"code": "string"
  }
}
```

### Failure Response:
```JSON
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
  "response" : null
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Ok
400 | Bad request
401 | Unauthorized
404 | Not Found

### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-24 | Language not found | no language found exception
KER-MSD-23 | Error occured while fetching Languages | language fetch exception
KER-MSD-049 | Error occurred while inserting Language details | language create exception
KER-MSD-XXX | Error occured while updating Language | language update exception
KER-MSD-XXX | Error occured while deleting Language | language delete exception


# Individual Types API
* [POST /individualtypes](#post-individualtypes)
* [PUT /individualtypes](#post-individualtypes)
* [GET /individualtypes](#get-individualtypes)
* [GET /individualtypes/all](#get-individualtypes-all)

## POST /individualtypes
This service will create the list of individualtypes which are used in the MOSIP platform. 

### Resource URL
`POST /individualtypes`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|code of individualtype| |
name|Yes | name of individualtype| |

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "code": "string",
    "isActive": true,
    "langCode": "eng",
    "name": "string"
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
  "responsetime": "2020-04-10T03:15:33.555Z",
  "metadata": null,
  "response": {
    "isActive": true,
    "createdBy": "string",
    "createdDateTime": "2020-04-10T03:15:33.565Z",
    "updatedBy": null,
    "updatedDateTime": null,
    "isDeleted": null,
    "deletedDateTime": null,
    "code": "string",
    "langCode": "eng",
    "name": "string"
  },
  "errors": null
}
```

### Response codes
Response Code | Description
--------------|------------
201 | created
400 | Bad request
401 | Unauthorized
404 | Not Found

## PUT /individualtypes
This service will update the list of individualtypes which are used in the MOSIP platform. 

### Resource URL
`PUT /individualtypes`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|code of individualtype| |
name|Yes | name of individualtype| |

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "code": "string",
    "isActive": false,
    "langCode": "eng",
    "name": "string"
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
  "responsetime": "2020-04-10T03:21:09.959Z",
  "metadata": null,
  "response": {
    "isActive": false,
    "createdBy": "string",
    "createdDateTime": "2020-04-10T03:15:33.565Z",
    "updatedBy": "string",
    "updatedDateTime": "2020-04-10T03:21:09.996Z",
    "isDeleted": null,
    "deletedDateTime": null,
    "code": "string",
    "langCode": "eng",
    "name": "string"
  },
  "errors": null
} 
```
### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
404 | Not Found


## GET /individualtypes
This service will provides the complete list of all individual types in the MOSIP platform

### Resource URL
`GET /individualtypes`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
-NA-

### Example Request
-NA-

### Example Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":   {
  "individualTypes": [
    {
      "individualtypecode": "string",
      "name": "string",
      "description": "string",
      "langCode": "string",
      "isactive": boolean
    }
  ]
 }
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
404 | Not Found

### Failure Response:
```JSON
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
  "response" : null
}
```

## GET /individualtypes/all
This service will get all the individualtypes. 

### Resource URL
`GET /individualtypes/all`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
orderBy|optional|order the requested data based on param| | 
pageNumber|optional|page no for the requested data| | 
pageSize|optional|page size for the requested data| | 
sortBy|optional|sort the requested data based on param value| | 

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "data": [
      {
        "code": "string",
        "createdBy": "string",
        "isActive": true,
        "isDeleted": true,
        "langCode": "string",
        "name": "string",
        "updatedBy": "string"
      }
    ],
    "pageNo": 0,
    "totalItems": 0,
    "totalPages": 0
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
404 | Not Found
500 | Internal Server Error

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-151 | Individual Type not found | no individual type found exception
KER-MSD-152 | Error occurred while fetching Individual Type | individual type fetch exception
	
## POST /individualtypes/search

This service is for the individual types search functionality. All the filter parameters are passed and the individual types are searched and the matching results are returned. 

### Resource URL
`POST /individualtypes/search`

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
type|No|The value have to be in ["in","equals",”startsWith”,"between"]| -NA- |
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
    "individualTypes": [
      {
        "code": "string",
        "isActive": true,
        "langCode": "string",
        "name": "string",
        "createdBy": "string",
        "createdDateTime": "string",
        "updatedBy": "string",
        "updatedDateTime": "string",
        "isDeleted": "boolean",
        "deletedDateTime": "string",
      }
    ],
	"fromRecord" : "number",
	"toRecord":"number",
	"totalRecord":"number"
  }
}
```

# Individual Types filter values
* [POST /individualtypes/filtervalues](#post-individualtypesfiltervalues)

## POST /individualtypes/filtervalues
This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
`POST /individualtypes/filtervalues`

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

# Application Types Master API
* [POST /applicationtypes](#post-applicationtypes)
* [GET /applicationtypes](#get-applicationtypes)
* [GET /applicationtypes/{code}/{langcode}](#get-applicationtypes-code-languagecode)
* [GET /applicationtypes/{langcode}](#get-applicationtypes-languagecode)

## POST /applicationtypes
This service will create the list of ApplicationTypes which are used in the MOSIP platform. 

### Resource URL
`POST /applicationtypes`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|code of applicationtype| |
description|Yes | description of applicationtype| |

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "code": "string",
    "description": "string",
    "isActive": true,
    "langCode": "string",
    "name": "string"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "code": "string",
    "langCode": "string"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
404 | Not Found
500 | Internal Server Error

## GET /applicationtypes
This service will provides the service for the List of ApplicationTypes. 

### Resource URL
`GET /applicationtypes`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
-NA-

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "applicationtypes": [
      {
        "code": "string",
        "description": "string",
        "isActive": true,
        "langCode": "string",
        "name": "string"
      }
    ]
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
404 | Not Found
500 | Internal Server Error

## GET /applicationtypes/{code}/{langcode}
This service will provides the service for the List of ApplicationTypes. 

### Resource URL
`GET /applicationtypes/{code}/{languagecode}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code |Yes|Code of the applicationtype| | 
langcode|Yes|Name of the language| | 

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "applicationtypes": [
      {
        "code": "string",
        "description": "string",
        "isActive": true,
        "langCode": "string",
        "name": "string"
      }
    ]
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
404 | Not Found
500 | Internal Server Error

## GET /applicationtypes/{langcode}
This service is used to fetch all Application details by language code

### Resource URL
`GET /applicationtypes/{languagecode}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
langcode|Yes|Name of the language| | 

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "applicationtypes": [
      {
        "code": "string",
        "description": "string",
        "isActive": true,
        "langCode": "string",
        "name": "string"
      }
    ]
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
404 | Not Found
500 | Internal Server Error

### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-001 | Error occurred while fetching Applications | application fetch exception 
KER-MSD-101 | Error occurred while inserting application details | application insert exception
KER-MSD-002 | Application not found | application not found exception
KER-MSD-201 | Bad Request Found | application request exception


# Blacklisted words Master API
* [POST /blacklistedwords](#post-blacklistedwords)
* [PUT /blacklistedwords](#put-blacklistedwords)
* [GET /blacklistedwords/{langcode}](#get-blacklistedwordslangcode)
* [DELETE /blacklistedwords/{word}](#delete-blacklistedwordsword)
* [GET /blacklistedwords/all](#get-blacklistedwordsall)
* [PUT /blacklistedwords/details](#put-blacklistedwordsdetails)
* [POST /blacklistedwords/words](#post-blacklistedwordswords)
* [POST /blacklistedwords/filtervalues](#post-blacklistedwordsfiltervalues)
* [POST /blacklistedwords/search](#post-blacklistedwordssearch)

## POST /blacklistedwords
This service will create a blacklistedword which will be used in the MOSIP platform. 

### Resource URL
`POST /blacklistedwords`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
description | optional | blacklisted word description ||
isActive | Yes | is active or not ||
langCode | Yes | language code ||
word | Yes | blacklisted word name || 

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "description": "string",
    "isActive": true,
    "langCode": "string",
    "word": "string"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "langCode": "string",
    "word": "string"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
404 | Not Found
500 | Internal Server Error

## PUT /blacklistedwords
This service will update the blacklisted word which is used in the MOSIP platform. 

### Resource URL
`PUT /blacklistedwords`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
description | optional | blacklisted word description ||
isActive | Yes| is active or not ||
langCode | Yes | language code ||
oldWord | Yes | old blacklisted word || 
word |Yes |blacklisted word ||

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "description": "string",
    "isActive": true,
    "langCode": "string",
    "oldWord": "string",
    "word": "string"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "langCode": "string",
    "word": "string"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
201 | Created
400 | Bad request
401 | Unauthorized
404 | Not Found
500 | Internal Server Error


## GET /blacklistedwords/{langcode}
This service will provides the service for the List of blacklisted words based on the passed language code. 

### Resource URL
`GET /blacklistedwords/{langcode}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
langcode|Yes| language code ||

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "blacklistedwords": [
      {
        "description": "string",
        "isActive": true,
        "langCode": "string",
        "word": "string"
      }
    ]
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
404 | Not Found
500 | Internal Server Error

## DELETE /blacklistedwords/{word}
This service will provides the service to delete the blacklisted word. 

### Resource URL
`DELETE /blacklistedwords/{word}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
word | Yes | blacklisted word to be deleted ||

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "code": "string"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
404 | Not Found
500 | Internal Server Error

## GET /blacklistedwords/all 
This service will provides the service for the List of blacklistedwords. 

### Resource URL
`GET /blacklistedwords/all`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
orderBy | optional | response order | desc ||
pageNumber | optional | page no for the requested data | 0 ||
pageSize | optional | page size for the requested data | 10 ||
sortBy | optional | sort the requested data based on param value | createdDateTime || 

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "data": [
      {
        "createdBy": "string",
        "description": "string",
        "isActive": true,
        "isDeleted": true,
        "langCode": "string",
        "updatedBy": "string",
        "word": "string"
      }
    ],
    "pageNo": 0,
    "totalItems": 0,
    "totalPages": 0
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
404 | Not Found
500 | Internal Server Error

## PUT /blacklistedwords/details
This service will update the blacklisted word details except the word itself. 

### Resource URL
`PUT /blacklistedwords/details`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
description | optional | blacklisted word description ||
isActive | Yes | is active or not ||
langCode | Yes | language code ||
word | Yes | blacklisted word name || 

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "description": "string",
    "isActive": true,
    "langCode": "string",
    "word": "string"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

### Example Response
```JSON
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": {
    "langCode": "string",
    "word": "string"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
404 | Not Found
500 | Internal Server Error

## POST /blacklistedwords/words

This service will validate list of words if they are blacklisted or not. 

### Resource URL
`POST /blacklistedwords/words`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
blacklisted words | Yes | blacklisted words to be validated  ||

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "blacklistedwords": [
      "string"
    ]
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
  "responsetime": "2019-11-15T08:04:42.310Z",
  "metadata": null,
  "response": {
    "code": "Valid"
  },
  "errors": null
}
```

### Response codes
Response Code | Description
--------------|------------
200 | Success
400 | Bad request
401 | Unauthorized
404 | Not Found
500 | Internal Server Error

### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-008 | Blacklisted word not found | no blacklisted words found
KER-MSD-007 | Error occurred while fetching Blacklisted words | blacklisted words fetch exception
KER-MSD-070 | Error occurred while inserting Blacklisted words | blacklisted words insert exception
KER-MSD-105 | Error occurred while updating Blacklisted Word | blacklisted words update exception
KER-MSD-106 | Error occurred while deleting Blacklisted Word | blacklisted words delete exception
	
# BlackListed Words Search APIs
* [POST /blacklistedwords/search](#post-blacklistedwordssearch)

## POST /blacklistedwords/search
This service is for the blacklisted words search functionality. All the filter parameters are passed and the blacklisted words are searched and the matching results are returned. 

### Resource URL
`POST /blacklistedwords/search`

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
* word
* langCode
* isActive

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
      "isActive": boolean,
      "createdBy": "string",
      "createdDateTime": "string",
      "updatedBy": boolean,
      "updatedDateTime": "string",
      "isDeleted": boolean,
      "deletedDateTime": "string",
      "word": "string",
      "langCode": "string",
      "description": "string"
	}
   ],
  "fromRecord" : "number",
  "toRecord":"number",
  "totalRecord":"number"
 }
}
```

# BlackListed Words filter values
* [POST /blacklistedwords/filtervalues](#post-blacklistedwordsfiltervalues)

## POST /blacklistedwords/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
`POST /blacklistedwords/filtervalues`

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

# Working days
* [GET /weekdays](#get-weekdays)
* [GET /workingdays](#get-workingdays)

## GET /weekdays

This service returns all the week days.

### Resource URL
https://mosip.io/v1/masterdata/weekdays/{registrationCenterId}/{languagecode}

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description |  Example
-----|----------|-------------|--------
registrationCenterID |Yes|Id of the registration center| 
languagecode|Yes|Language code in ISO 639-2 standard| -NA- |eng

### Response Part Parameters
Name | Required | Description |  Example
-----|----------|-------------|--------
name |Yes|Id of the registration center| 
order |Yes|This is the order of the weekdays. If the weekdays are in the order of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday and Sunday. The order will be 1-Sunday, 2-Monday, 3-Tuesday, 4-Wednesday, 5-Thursday, 6-Friday, 7-Saturday and 8-Sunday.| 
languagecode|Yes|Language code in ISO 639-2 standard| -NA- |eng

### Responses

#### Success Response
```
{
	"id": "mosip.kernel.weekdays",
	"version": "1.0",
	"metadata": {},
	"responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
	"errors": null,
	"response": {
        "weekdays": [
            {
                "name": "MON",
                "order": 2,
                "languageCode": "eng"
            },
            {
                "name": "TUE",
                "order": 3,
                "languageCode": "eng"
            },
            {
                "name": "WED",
                "order": 4,
                "languageCode": "eng"
            },
            {
                "name": "THU",
                "order": 5,
                "languageCode": "eng"
            },
            {
                "name": "FRI",
                "order": 6,
                "languageCode": "eng"
            }
        ]
    }
}

```

#### Error Response:
```
{
  "id": "mosip.kernel.weekdays",
  "version": "1.0",
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

### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-WKDS-001 |	reg_working_nonworking table not accessible | Table not accessible
KER-WKDS-002 |	No week day found | No data present in week day table 


## GET /workingdays/{registrationCenterID}
This service returns the working days of a particular registration center. 

### Resource URL
`https://mosip.io/v1/masterdata/workingdays/{registrationCenterId}/{languagecode}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description |  Example
-----|----------|-------------|--------
registrationCenterID |Yes|Id of the registration center| 
languagecode|Yes|Language code in ISO 639-2 standard| -NA- |eng

### Responses:
#### Success Response:
```
{
	"id": "mosip.kernel.workingdays",
	"version": "1.0",
	"metadata": {},
	"responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
	"errors": null,
	"response": {
        "workingdays": [
            {
                "name": "SUN",
                "dayCode": "101",
                "languagecode": "eng",
                "working": false,
                "globalWorking": false
            },
            {
                "name": "MON",
                "dayCode": "102",
                "languagecode": "eng",
                "working": true,
                "globalWorking": true
            },
            {
                "name": "TUE",
                "dayCode": "103",
                "languagecode": "eng",
                "working": true,
                "globalWorking": true
            },
            {
                "name": "WED",
                "dayCode": "104",
                "languagecode": "eng",
                "working": true,
                "globalWorking": true
            },
            {
                "name": "THU",
                "dayCode": "105",
                "languagecode": "eng",
                "working": true,
                "globalWorking": true
            },
            {
                "name": "FRI",
                "dayCode": "106",
                "languagecode": "eng",
                "working": true,
                "globalWorking": true
            },
            {
                "name": "SAT",
                "dayCode": "107",
                "languagecode": "eng",
                "working": false,
                "globalWorking": false
            }
        ]
    }
}
```

#### Error Response:
```
{
  "id": "mosip.kernel.workingdays",
  "version": "1.0",
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

### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-WKDS-001 |	reg_working_nonworking table not accessible | Table not accessible
KER-WKDS-003 |	No working/non working day data found | No Data present in Working days table.

# Exceptional holidays
* [GET /exceptionholidays](#get-exceptionholidays)

### GET /exceptionholidays
This service returns the exceptional holidays of a particular registration center. 

### Resource URL
`https://mosip.io/v1/masterdata/exceptionholidays/{registrationCenterId}/{languagecode}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description |  Example
-----|----------|-------------|--------
registrationCenterID |Yes|Id of the registration center| 
languagecode|Yes|Language code in ISO 639-2 standard| -NA- |eng

### Responses

#### Success Response
```
{
  "id": "mosip.kernel.weekdays",
  "version": "1.0",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
        "exceptionalHolidayList": [
            {
                "holidayDate": "2019-09-24",
                "holidayDay": "2",
                "holidayMonth": "9",
                "holidayYear": "2019",
                "holidayName": "Emergency Holiday",
                "holidayReason": "Emergency Holiday",
                "registrationCenterID": null,
                "isDeleted": null,
                "langCode": "eng",
                "isActive": true
            },
            {
                "holidayDate": "2019-09-25",
                "holidayDay": "3",
                "holidayMonth": "9",
                "holidayYear": "2019",
                "holidayName": "Emergency Holiday",
                "holidayReason": "Emergency Holiday",
                "registrationCenterID": null,
                "isDeleted": null,
                "langCode": "eng",
                "isActive": true
            }
        ]
    }
}
```

#### Error Response:
```
{
  "id": "mosip.kernel.weekdays",
  "version": "1.0",
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

### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-EHD-001 |	Error occured while fetching Exceptional Holidays | Database exception
KER-EHD-002 |	Exceptional Holiday not founds | Exceptional holidays data not present for registration center id and language code
