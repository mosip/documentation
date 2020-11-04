This section contains detail about the service APIs in the Template Masterdata module

* [Templates API](#template-api)

These APIs includes create, update and fetch APIs. Create and Update API is used by the Administrator Portal for the Create and Update Template functionality. Fetch API is used by all the modules across MOSIP (Pre-Registration, Registration Processor, IDA, Resident Services) to fetch a Template based on a given Language Code and a Template type. This template is then used by the different modules to either generate an Acknowledgement page or send a notification.

* [Template Types API](#template-types-api)

This API is used to create a Template Type.

* [Template- Search API](#post-templatesearch)

This API is used by the Administrator Portal to fetch the list of Templates based on a given filter criteria to display the list of Templates on the Portal UI.

* [Template- Filter values](#post-templatefiltervalues)

This API is used by the Administrator Portal UI to populate filter dropdowns on the Template List View UI Screen.

# Template API

* [POST /templates](#post-templates)
* [PUT /templates](#put-templates)
* [DELETE /templates/{id}](#delete-templatesid)
* [GET /templates](#get-templates)
* [GET /templates/{langcode}](#get-templateslangcode)
* [GET /templates/{langcode}/{templatetypecode}](#get-templateslangcodetemplatetypecode)
* [GET /templates/all](#get-templatesall)
* [GET /templates/templatetypecode/{code}](#get-templatestemplatetypecodecode)

# POST /templates

This service will create the list of Template  which are used in the MOSIP platform. 

### Resource URL
### `POST /templates`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id|Yes|id of template | | 
descr|Yes|Description of the template | | 
lang_code|Yes|Language code of the template | | 
isActive |Yes|is active or not| |
moduleId |Yes| Id of module | |
templateTypeCode |Yes| Id of template type | |
fileFormatCode | Yes | Code of file format| |

### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request":  {
    "description": "string",
    "fileFormatCode": "string",
    "fileText": "string",
    "id": "string",
    "isActive": true,
    "langCode": "string",
    "model": "string",
    "moduleId": "string",
    "moduleName": "string",
    "name": "string",
    "templateTypeCode": "string"
  }
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
# PUT /templates

This service will update the list of Template  which are used in the MOSIP platform. 

### Resource URL
### `PUT /templates`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id|Yes|id of template | | 
lang_code|Yes|Language code of the template | | 
isActive |Yes|is active or not| |
moduleId |Yes| Id of module | |
templateTypeCode |Yes| Id of template type | |
fileFormatCode | Yes | Code of file format| |

### Example Request
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request":  {
    "description": "string",
    "fileFormatCode": "string",
    "fileText": "string",
    "id": "string",
    "isActive": true,
    "langCode": "string",
    "model": "string",
    "moduleId": "string",
    "moduleName": "string",
    "name": "string",
    "templateTypeCode": "string"
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

# DELETE /templates/{id}
Master data is required across the platform. 

This service will deletes a list of Template from the Template master module. 

### Resource URL
### `DELETE /templates/{id}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id|Yes|id of the Template| 



### Success Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response"  : {
      "id": "string"
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
  "errors": [{
      "errorCode": "string",
      "message": "string"
    }],
  "response":  null
}
```

# GET /templates

Master data is required across the platform. 

This service will fetch a list of Template from the Template master module. 

### Resource URL
### `GET /templates`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
NA ||


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
    "templates": [
      {
        "createdBy": "string",
        "description": "string",
        "fileFormatCode": "string",
        "fileText": "string",
        "id": "string",
        "isActive": true,
        "isDeleted": true,
        "langCode": "string",
        "model": "string",
        "moduleId": "string",
        "moduleName": "string",
        "name": "string",
        "templateTypeCode": "string",
        "updatedBy": "string"
      }
    ]
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

# GET /templates/{langcode}

Master data is required across the platform. 

This service will fetch a list of Templates as per the language code from the Template master module. 

### Resource URL
### `GET /templates/{langcode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
langcode | Yes | language code||


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
    "templates": [
      {
        "createdBy": "string",
        "description": "string",
        "fileFormatCode": "string",
        "fileText": "string",
        "id": "string",
        "isActive": true,
        "isDeleted": true,
        "langCode": "string",
        "model": "string",
        "moduleId": "string",
        "moduleName": "string",
        "name": "string",
        "templateTypeCode": "string",
        "updatedBy": "string"
      }
    ]
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

# GET /templates/{langcode}/{templatetypecode}

Master data is required across the platform. 

This service will fetch a list of Templates as per the language code and template type code from the Template master module. 

### Resource URL
### `GET /templates/{langcode}/{templatetypecode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
langcode | Yes | language code||
templatetypecode | Yes | template type code ||


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
    "templates": [
      {
        "createdBy": "string",
        "description": "string",
        "fileFormatCode": "string",
        "fileText": "string",
        "id": "string",
        "isActive": true,
        "isDeleted": true,
        "langCode": "string",
        "model": "string",
        "moduleId": "string",
        "moduleName": "string",
        "name": "string",
        "templateTypeCode": "string",
        "updatedBy": "string"
      }
    ]
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

# GET /templates/all

Master data is required across the platform. 

This service will fetch all Templates from the Template master module. 

### Resource URL
### `GET /templates/all`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
orderBy | optional | order the requested data based on param||
pageNumber | optional | page no for the requested data ||
pageSize | optional | page size for the requested data||
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
        "createdBy": "string",
        "description": "string",
        "fileFormatCode": "string",
        "fileText": "string",
        "id": "string",
        "isActive": true,
        "isDeleted": true,
        "langCode": "string",
        "model": "string",
        "moduleId": "string",
        "moduleName": "string",
        "name": "string",
        "templateTypeCode": "string",
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

# GET /templates/templatetypecode/{code}
Master data is required across the platform. 

This service will fetch all Templates as per the template type code from the Template master module. 

### Resource URL
### `GET /templates/templatetypecode/{code}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code | Yes | template type code||


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
    "templates": [
      {
        "createdBy": "string",
        "description": "string",
        "fileFormatCode": "string",
        "fileText": "string",
        "id": "string",
        "isActive": true,
        "isDeleted": true,
        "langCode": "string",
        "model": "string",
        "moduleId": "string",
        "moduleName": "string",
        "name": "string",
        "templateTypeCode": "string",
        "updatedBy": "string"
      }
    ]
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-045 | Error occurred while fetching templates | Fetch Issue
KER-MSD-145 | Exception during inserting data into db | Insertion Issue
KER-MSD-046 | Template not found. | Data Not Found
KER-MSD-095 | Error occurred while updating template | Update Issue
KER-MSD-096 | Error occurred while deleting template | Delete Issue

# Template Types API

* [POST /templatetypes](#post-templatetypes)

# POST /templatetypes

This service creates template type based on provided. 


### Resource URL
### `POST /templatetypes`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|This is the template code field||
description|Yes| Description of the template type ||
isActive|Yes| is active? ||
langCode|Yes| language code ||

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "code": "string",
    "description": "string",
    "isActive": true,
    "langCode": "string"
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
201

Description: Successfully created

400	

Description: Request body passed is null or invalid

401	

Description: Unauthorized

403	

Description: Forbidden

404	

Description: Not Found

500	

Description:  any error occured while creating

## Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
KER-MSD-072 | Error occurred while inserting Template Type details into db | Insertion Issue




### Resource URL
### `POST /template/search`

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
pageStart|This is the start index | 0 | 10
pageFetch| This is the amount of records to be fetched | 10 | 10

### Filter Values
Please find the filter columns used in search
1) name
2) moduleId
3) moduleName
4) isActive

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
  "templates": [
      {
        "description": "string",
        "fileFormatCode": "string",
        "fileText": "string",
        "id": "string",
        "isActive": true,
        "langCode": "string",
        "model": "string",
        "moduleId": "string",
        "moduleName": "string",
        "name": "string",
        "templateTypeCode": "string"
      }
    ],
	"fromRecord" : "number",
	"toRecord":"number",
	"totalRecord":"number"
 }
}
```
# Templatefilter values

* [POST /template/filtervalues](#post-templatefiltervalues)

# POST /template/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
### `POST /template/filtervalues`

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