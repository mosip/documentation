This section contains detail about the service APIs in the Document Masterdata module


* [Documents Categories API](#documents-category-master-api)

These APIs include Create, Update, Fetch, Search and Filter API which are used by the Administrator Portal. Create and Update API is used for the Create and Update Document Category functionality. Search API is used by the portal to fetch the list of Document Categories based on a filter criterion to display the list of Document Categories on the UI and Filter API is used to populate Document Category Filter Dropdowns on the Portal UI. Fetch APIs of Document Category are used by Pre-Registration UI to display the list of Document Categories for the Applicant to view and by the ID Object Validator to validate the Document Category received in the packet in Registration processor.

* [Documents Types API](#documents-types-api)

These APIs include Create, Update, Fetch, Search and Filter API which are used by the Administrator Portal. Create and Update API is used for the Create and Update Document Type functionality. Search API is used by the portal to fetch the list of Document Types based on a filter criterion to display the list of Document Types on the UI and Filter API is used to populate Document Types Filter Dropdowns on the Portal UI. Fetch APIs of Document Type are used by Pre-Registration UI to display the list of Document Types for the Applicant to view and select and by the ID Object Validator to validate the Document Type received in the packet in Registration processor.

* [Valid Documents API](#valid-documents-api)

These APIs includes the Map, Unmap, Search and Filter API which are used by the Administrator Portal. Map and Unmap API is used by the portal to create and remove mapping of Document Category and Document Type. Search API is used by the portal to fetch the mappings of Document Categories and Document Types based on a filter criterion to display the list of mappings on the UI. Filter API is used to populate Document Mappings Filter Dropdowns on the Portal UI.

# Documents Category Master API

* [POST /documentcategories](#post-documentcategories)
* [PUT /documentcategories](#put-documentcategories)
* [GET /documentcategories](#get-documentcategories)
* [GET /documentcategories/{code}/{langcode}](#get-documentcategoriescodelangcode)
* [GET /documentcategories/{languagecode}](#get-documentcategorieslangcode)
* [DELETE /documentcategories/{code}](#delete-documentcategoriescode)
* [POST /documentcategories/search](#post-documentcategoriessearch)
* [POST /documentcategories/filtervalues](#post-documentcategoriesfiltervalues)

# POST /documentcategories

This service will create the list of Documents Category which are used in the MOSIP platform. 

### Resource URL
### `POST /documentcategories`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|Document category code| |
description|optional|document description||
isActive|Yes|is active or not||
langCode|Yes|language code||
name|Yes|Document category name|| 

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
201

Description: Created

400

Description: Bad request

401

Description: Unauthorized

403

Description: Forbidden
-----
This service will create the list of Documents Category which are used in the MOSIP platform. 

### Resource URL
### `PUT /documentcategories`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|Document category code| |
description|optional|document description||
isActive|Yes|is active or not||
langCode|Yes|language code||
name|Yes|Document category name|| 

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
201

Description: Created

400

Description: Bad request

401

Description: Unauthorized

403

Description: Forbidden

404 

Description: Not Found


-----
# GET /documentcategories

This service will provides the service for the List of documents categories. 

### Resource URL
### `GET /documentcategories`

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
             "documentcategories": [
                                      {
		                      "code": "string",
                                      "description": "string",
                                      "isActive": true,
                                      "langCode": "string",
                                      "name": "string"
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

# GET /documentcategories/{code}/{langcode}

This service will provides the service for the List of documents categories. 


### Resource URL
### `GET /documentcategories/{code}/{langcode}`

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
               "documentcategories": [
		                        { 
                                          "code": "string",
                                          "description": "string",
                                          "isActive": true,
                                          "langCode": "string",
                                          "name": "string"
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


# GET /documentcategories/{langcode} 

This service will provides the service for the List of documents categories based on the passed langcode. 


### Resource URL
### `GET /documentcategories/{langcode}`

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
	"documentcategories": [{
		                 "code": "string",
                                 "description": "string",
                                 "isActive": true,
                                 "langCode": "string",
                                 "name": "string"
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
------
# DELETE /documentcategories/{code} 

This service will provides the service to delete documents categories based on the passed given code. 


### Resource URL
### `DELETE /documentcategories/{code}`

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
		 "code": "string"
              }
}
```
204

Description: No Content

401

Description: Unauthorized

404 

Description: Not Found

----

# Documents Category search APIs

* [POST /documentcategories/search](#post-documentcategoriessearch)

# POST /documentcategories/search

This service is for the registration centers search functionality. All the filter parameters are passed and the Documents Category are searched and the matching results are returned. 

### Resource URL
### `POST /documentcategories/search`

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
fromValue|No|If the type is "between", this field is the value of the startRange| -NA- |
toValue|No|If the type is "between", this field is the value of the endRange| -NA- |
languagecode|Yes|Language code in Language code in ISO 639-2 format| | 
sort|No|This is an array of the sort field and type| | 
sortfield| The field on which the sort is applied | | modifiedDate
sorttype| This should be either of ['ASC','DESC']| | ASC
pagination|The pagination parameter object| |
pageStart|This is the start index | 0 | 10
pageFetch| This is the amount of records to be fetched | 10 | 10

### Filter Values
Filter Name| Search Values
-----|----------

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
  "data": [
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
# Documents Category filter values

* [POST /documentcategories/filtervalues](#post-documentcategoriesfiltervalues)

# POST /documentcategories/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
### `POST /documentcategories/filtervalues`

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

##### Failure Response:
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
KER-MSD-013 | Error occurred while fetching Document Category details | Fetch Issue
KER-MSD-051 | Error occurred while inserting Document Category details | Insertion Issue
KER-MSD-014 | Document Category not found | Data Not Found
KER-MSD-089 | Error occurred while updating Document Category details | Update Issue
KER-MSD-090 | Error occurred while deleting Document Category details | Deletion Issue
KER-MSD-123 | Cannot delete dependency found | Deletion Issue because of dependency


# Documents Types API

* [POST /documenttype](#post-documenttype)
* [PUT /documenttype](#put-documenttype)
* [GET /documenttypes/{documentcategorycode}/{langcode}](#get-documenttypesdocumentcategorycodelangcode)
* [GET /documentcategorytypes](#get-documentcategorytypes)
* [GET /doccattypes](#get-doccattypes)
* [GET /checkapptypedoccattypedoctype](#get-checkapptypedoccattypedoctype)
* [POST /documenttypes/search](#post-documenttypessearch)
* [POST /documenttypes/filtervalues](#post-documenttypesfiltervalues)



# POST /documenttype

This service will create the list of Documents types which are used in the MOSIP platform. There is another service to map the document category and document type.

Please find the steps to create primary/secondary languages 

https://github.com/mosip/mosip-docs/wiki/Registration-Center-APIs#createupdate-api

### Resource URL
### `POST /documenttype`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|Code of document type| | 
name|Yes|Name of the document type| | 
description|Yes|Description of the document type| | 
langCode|Yes|Language code of the document type| | 
isActive|Yes|Active field of the document type| | 

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "code": "",
    "description": "test desc",
    "isActive": true,
    "langCode": "eng",
    "name": "test1"
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
  "responsetime": "2019-12-26T11:41:18.276Z",
  "metadata": null,
  "response": {
    "code": "c05d4d28-f00d-414c-b23a-e29a6c93f108",
    "langCode": "eng",
    "name": "test1",
    "description": "test desc",
    "isActive": true,
    "createdBy": "110006",
    "createdDateTime": "2019-12-26T11:41:18.297Z",
    "updatedBy": null,
    "updatedDateTime": null,
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

#### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-MSD-500 |Internal Server Error|If system error occurs
KER-ATH-403 |Forbidden|If unauthorized role detected
KER-ATH-401 |Authentication Failed|If no role/invalid token is detected
KER-MSD-101 |Error occurred while inserting application details

# PUT /documenttype

This service will update the list of Documents types which are used in the MOSIP platform. 

### Resource URL
### `PUT /documenttype`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
code|Yes|Code of document type| | 
name|Yes|Name of the document type| | 
description|Yes|Description of the document type| | 
langCode|Yes|Language code of the document type| | 
isActive|Yes|Active field of the document type| | 

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "code": "c05d4d28-f00d-414c-b23a-e29a6c93f108",
    "description": "test desc",
    "isActive": true,
    "langCode": "eng",
    "name": "test"
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
  "responsetime": "2019-12-26T11:41:18.276Z",
  "metadata": null,
  "response": {
    "code": "c05d4d28-f00d-414c-b23a-e29a6c93f108",
    "langCode": "eng",
    "name": "test1",
    "description": "test desc",
    "isActive": true,
    "createdBy": "110006",
    "createdDateTime": "2019-12-26T11:41:18.297Z",
    "updatedBy": "110006",
    "updatedDateTime": "2019-12-26T11:41:18.297Z",
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
#### Failure details
Error Code  | Error Message | Error Description
-----|----------|-------------
KER-MSD-500 |Internal Server Error|If system error occurs
KER-ATH-403 |Forbidden|If unauthorized role detected
KER-ATH-401 |Authentication Failed|If no role/invalid token is detected
KER-MSD-091 |Error occurred while updating application details
KER-MSD-118 |Document Type not found

# GET /documenttypes/{documentcategorycode}/{langcode}

This service will provides the service for the valid doucment type avialbale for specific Document Category code


### Resource URL
### `GET /documenttypes/{documentcategorycode}/{langcode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------

documentcategorycode |Yes| Code of document category | |
langcode | Yes | language code | |

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
  "response":   {
                "code": "string",
                "description": "string",
                "isActive": true,
                "langCode": "string",
                "name": "string"
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


# GET /documentcategorytypes

This service will provides the service for the List of documents types. 

### Resource URL
### `GET /documentcategorytypes`

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
  "errors": [{
      "errorCode": "string",
      "message": "string"
    }],
  "response":{
  "documenttypes": [
		{"code": "code", "name": "name", "descr":"descr", "lang_code":"lang_code", "is_active":"is_active"},
		{"code": "code", "name": "name", "descr":"descr", "lang_code":"lang_code", "is_active":"is_active"},
		{"code": "code", "name": "name", "descr":"descr", "lang_code":"lang_code", "is_active":"is_active"},
		{"code": "code", "name": "name", "descr":"descr", "lang_code":"lang_code", "is_active":"is_active"},
	          ]
             }
  }
```


# GET /doccattypes

This service will give back the document category and it's corresponding category types based on Individual type code, Age group type code and Gender type code. 

### Resource URL
### `GET /doccattypes`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
individualtypecode |Yes| Code of Individual type | |
agegrouptypecode |Yes| Code of Age group type | |
gendertypecode |Yes| Code of Gender type | |

### Example Request
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
  "response":{
    "individualtypecode": "string",
    "agegrouptypecode": "string",
    "gendertypecode": "string"
  }
}
```
### Example Response
```JSON
{
	"documentcategories": [
		{
			"code": "string",
			"description": "string",
			"isActive": true,
			"langCode": "string",
			"name": "string",
			"documenttype": [
				{
					"code": "code",
					"name": "name",
					"descr": "descr",
					"lang_code": "lang_code",
					"is_active": "is_active"
				}
			]
		}
	]
}
```



# GET /checkapptypedoccattypedoctype

This service checks the mapping between the Applicant type code, Document category and the Document type mapping. Result message will be success, if the mapping exists. 

### Resource URL
### `GET /checkapptypedoccattypedoctype`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
applicanttypecode |Yes| Code of Individual type | |
documentcategorycode |Yes| Code of Age group type| |
documenttypecode |Yes| Code of Document type | |

### Example Request
```JSON
{
  "id": "mosip.master.doccattypesonindtypagegndr",
  "ver": "1.0",
  "timestamp": "2018-12-24T05:27:49.183Z",
  "request": {
    "applicanttypecode": "string",
    "documentcategorycode": "string",
    "documenttypecode": "string"
  }
}
```
### Example Response
```JSON
{
	"resultMessage":"Success"
}
```

# Document type search APIs

* [POST /documenttypes/search](#post-documenttypessearch)

# POST /documenttypes/search

This service is for the document type search functionality. All the filter parameters are passed and the document type are searched and the matching results are returned. 

### Resource URL
### `POST /documenttypes/search`

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
type|No|The value have to be in  ["contains","equals","startsWith","between"]| -NA- |
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
Filter Name| Search Values
-----|----------
code|["contains","equals","startsWith"]
status|["contains","equals","startsWith"]


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
        "createdDateTime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
        "updatedBy": null,
        "updatedDateTime": null,
        "isDeleted": null,
        "deletedDateTime": null,
        "code": "string",
        "name": "string",
        "description": "string",
        "langCode": "string"
      }
   ],
	"fromRecord" : "number",
	"toRecord":"number",
	"totalRecord":"number"
 }
}
```
# Document Type filter values

* [POST /documenttypes/filtervalues](#post-documenttypesfiltervalues)

# POST /documenttypes/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
### `POST /documenttypes/filtervalues`

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

#### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-MSD-015 | Error occurred while fetching Document Types
KER-MSD-052 | Error occurred while inserting Document Type details
KER-MSD-118 | Document Type not found
KER-MSD-091 | Error occur while updating Document Type details
KER-MSD-124 | Cannot delete dependency found
KER-MSD-092 | Error occurred while deleting Document Type details


# Valid documents API

* [GET /validdocuments/{languagecode}](#get-validdocumentslanguagecode)
* [POST /validdocuments/search](#post-validdocumentssearch)
* [POST /validdocuments/filtervalues](#post-validdocumentsfiltervalues)
* [POST /validdocuments/map/{doccategorycode}/{doctypecode}](#post-validdocumentsmapdoccategorycodedoctypecode)
* [PUT /validdocuments/unmap/{doccategorycode}/{doctypecode}](#put-validdocumentsunmapdoccategorycodedoctypecode)

### Resource URL
### `GET /validdocuments/{languagecode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
languagecode|Yes|Language code in ISO 639-2|-NA-|fra

### Example Request
```JSON
-NA-
```

### Example Success Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response":   {
	  "documentcategories": [
		{
			"code": "string",
			"description": "string",
			"isActive": true,
			"langCode": "string",
			"name": "string", 
			"documenttypes": [
					{
						"code": "string",
						"description": "string",
						"isActive": true,
						"langCode": "string",
						"name": "string"
					}
			]
		}
	  ]
	}
}
```


### Example Failure Response
```JSON
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
	{
		"errorCode": "KER-VLDDOC-001",
		"message": "Mandatory fields are missing"
	}  
  ],
  "response": null
}
```
## Valid Documents search APIs

* [POST /validdocuments/search](#post-validdocumentssearch)

## POST /validdocuments/search

This service is for the valid document search functionality. All the filter parameters are passed and the valid document are searched and the matching results are returned. 

### Resource URL
### `POST /validdocuments/search`

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
type|No|The value have to be in  ["contains","equals","startsWith","between"]| -NA- |
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
        "description": "string",
        "documentType": {
          "code": "string",
          "createdBy": "string",
          "createdDateTime": "date",
          "description": "string",
          "isActive": true,
          "isDeleted": true,
          "deletedDateTime": "date",
          "langCode": "string",
          "name": "string",
          "updatedBy": "string",
          "updatedDateTime": "date",
        },
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
## Valid Documents filter values

* [POST /validdocuments/filtervalues](#post-validdocumentsfiltervalues)

### POST /validdocuments/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.  

### Resource URL
### `POST /validdocuments/filtervalues`

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
### Response codes
200

Description: Success

#### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-MSD-071 | Exception during inserting data into db | Insertion Issue
KER-MSD-016 | Valid document not found | Data Not Found
KER-MSD-113 | Error occurred while deleting a mapping of Document Category and Document Type details | Deletion Issue
KER-MSD-XXX | Error occurred while fetching Document Categories and Document Types | Fetching Issue

### POST /validdocuments/map/{doccategorycode}/{doctypecode}

This service is for the valid document mapping category with document category with document type code.

### Resource URL
### `POST /validdocuments/map/{doccategorycode}/{doctypecode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
doccategorycode|Yes|document category code| |-NA-|
doctypecode|Yes|document type code| |-NA-|

### Example Request
```
https://mosip.io/v1/masterdata/validdocuments/map/POE/POC
```

### Response 
```JSON
{
  "id": null,
  "version": null,
  "responsetime": "2020-02-27T10:20:25.968Z",
  "metadata": null,
  "response": {
    "status": "mapped",
    "message": "Document Category POB - Document Type Mapping CIN is added successfully"
  },
  "errors": null
}
```

#### Error Response:
``` JSON
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
KER-MSD-071 |Exception during inserting data into DB|If any error occur from database
KER-MSD-360 |Document Type is already mapped to the received Document Category|If document type is already mapped to document category
KER-MSD-361 |Document Category Code %s - Document Type %s Mapping does not exist|If the mapping document doesn't exist

### PUT /validdocuments/unmap/{doccategorycode}/{doctypecode}

This service is used for the un-mapping document category with document type code.

### Resource URL
### `PUT /validdocuments/unmap/{doccategorycode}/{doctypecode}`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
doccategorycode|Yes|document category code| |-NA-|
doctypecode|Yes|document type code| |-NA-|

### Example Request
```
https://mosip.io/v1/masterdata/validdocuments/unmap/CIN/POB
```

### Response 
```JSON
{
  "id": null,
  "version": null,
  "responsetime": "2020-02-27T10:20:25.968Z",
  "metadata": null,
  "response": {
    "status": "mapped",
    "message": "Document Category POB - Document Type Mapping CIN is un-mapped successfully"
  },
  "errors": null
}
```

#### Error Response:
``` JSON
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
KER-MSD-071 |Exception during inserting data into DB|If any error occur from database
KER-MSD-363 |Document Type is already unmapped from the received Document Category|If document type is already un-mapped to document category
KER-MSD-361 |Document Category Code %s - Document Type %s Mapping does not exist|If the mapping document doesn't exist