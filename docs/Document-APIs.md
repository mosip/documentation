# Document APIs

This section contains detail about the service APIs for Document Master data.

* [Documents Categories APIs](Document-APIs.md#documents-category) These APIs include create, update, fetch, search and filter which are used by the administrator portal. Create and update APIs are used for the create and updating document category functionality. Search API is used by the portal to fetch the list of document categories based on a filter criterion to display the list of document categories on the UI and filter API is used to populate document category filter drop-downs on the portal UI. Fetch API of document category are used by Pre-Registration UI to display the list of document categories for the applicant to view and by the ID Object validator to validate the document category received in the packet in Registration processor.
* [Documents Types APIs](Document-APIs.md#documents-types) These APIs include create, update, fetch, search and filter which are used by the administrator portal. Create and update APIs are used for the create and update document type functionality. Search API is used by the portal to fetch the list of document types based on a filter criterion to display the list of document types on the UI and filter API is used to populate document types filter drop-downs on the portal UI. Fetch API of document type is used by Pre-Registration UI to display the list of document types for the applicant to view and select and by the ID Object validator to validate the document type received in the packet in Registration processor.
* [Valid Documents API](Document-APIs.md#valid-documents) These APIs includes the map, unmap, search and filter which are used by the administrator portal. Map and un-map APIs are used by the portal to create and remove mapping of document category and document type. Search API is used by the portal to fetch the mappings of document categories and document types based on a filter criterion to display the list of mappings on the UI. Filter API is used to populate document mappings filter drop-downs on the portal UI.

## Documents Category

* [POST /documentcategories](Document-APIs.md#post-documentcategories)
* [PUT /documentcategories](Document-APIs.md#put-documentcategories)
* [GET /documentcategories](Document-APIs.md#get-documentcategories)
* [GET /documentcategories/{code}/{langcode}](Document-APIs.md#get-documentcategories-code-langcode)
* [GET /documentcategories/{langcode}](Document-APIs.md#get-documentcategories-langcode)
* [DELETE /documentcategories/{code}](Document-APIs.md#delete-documentcategories-code)
* [POST /documentcategories/search](Document-APIs.md#post-documentcategories-search)
* [POST /documentcategories/filtervalues](Document-APIs.md#post-documentcategories-filtervalues)

### POST /documentcategories

This service will create the list of Documents Category which are used in the MOSIP platform.

#### Resource URL

`POST /documentcategories`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name        | Required | Description            | Default Value | Example |
| ----------- | -------- | ---------------------- | ------------- | ------- |
| code        | Yes      | Document category code |               |         |
| description | optional | document description   |               |         |
| isActive    | Yes      | is active or not       |               |         |
| langCode    | Yes      | language code          |               |         |
| name        | Yes      | Document category name |               |         |

#### Example Request

```
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

#### Example Response

```
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

**Response code: 200 Ok**

### PUT/documentcategories

This service will create the list of Documents Category which are used in the MOSIP platform.

#### Resource URL

`PUT /documentcategories`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name        | Required | Description            | Default Value | Example |
| ----------- | -------- | ---------------------- | ------------- | ------- |
| code        | Yes      | Document category code |               |         |
| description | optional | document description   |               |         |
| isActive    | Yes      | is active or not       |               |         |
| langCode    | Yes      | language code          |               |         |
| name        | Yes      | Document category name |               |         |

#### Example Request

```
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

#### Example Response

```
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

**Response code: 200 Ok**

### GET /documentcategories

This service will provides the service for the List of documents categories.

#### Resource URL

`GET /documentcategories`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name | Required | Description | Default Value | Example |
| ---- | -------- | ----------- | ------------- | ------- |
| -NA- |          |             |               |         |

#### Example Response

```
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

**Response code: 200 Ok**

### GET /documentcategories/{code}/{langcode}

This service will provides the service for the List of documents categories.

#### Resource URL

`GET /documentcategories/{code}/{langcode}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name | Required | Description | Default Value | Example |
| ---- | -------- | ----------- | ------------- | ------- |
| -NA- |          |             |               |         |

#### Example Response

```
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

**Response code: 200 Ok**

### GET /documentcategories/{langcode}

This service will provides the service for the List of documents categories based on the passed langcode.

#### Resource URL

`GET /documentcategories/{langcode}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name | Required | Description | Default Value | Example |
| ---- | -------- | ----------- | ------------- | ------- |
| -NA- |          |             |               |         |

#### Example Response

```
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

**Response code: 200 Ok**

### DELETE /documentcategories/{code}

This service will provides the service to delete documents categories based on the passed given code.

#### Resource URL

`DELETE /documentcategories/{code}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name | Required | Description | Default Value | Example |
| ---- | -------- | ----------- | ------------- | ------- |
| -NA- |          |             |               |         |

#### Example Response

```
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

**Response code: 200 Ok**

### POST /documentcategories/search

This service is for the registration centers search functionality. All the filter parameters are passed and the Documents Category are searched and the matching results are returned.

#### Resource URL

`POST /documentcategories/search`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required                                    | Description                                                                     | Default Value | Example |
| ------------ | ------------------------------------------- | ------------------------------------------------------------------------------- | ------------- | ------- |
| filters      | No                                          | Array of the filter applied. In case of "list" screen, this array will be empty | -NA-          |         |
| columnName   | No                                          | The column name in the JSON response                                            | -NA-          |         |
| type         | No                                          | The value have to be in \["contains","equals","startsWith","between"]           | -NA-          |         |
| value        | No                                          | Value or id selected in the filter by the end user                              | -NA-          |         |
| fromValue    | No                                          | If the type is "between", this field is the value of the startRange             | -NA-          |         |
| toValue      | No                                          | If the type is "between", this field is the value of the endRange               | -NA-          |         |
| languagecode | Yes                                         | Language code in Language code in ISO 639-2 format                              |               |         |
| sort         | No                                          | This is an array of the sort field and type                                     |               |         |
| sortfield    | The field on which the sort is applied      |                                                                                 | modifiedDate  |         |
| sorttype     | This should be either of \['ASC','DESC']    |                                                                                 | ASC           |         |
| pagination   | The pagination parameter object             |                                                                                 |               |         |
| pageStart    | This is the start index                     | 0                                                                               | 10            |         |
| pageFetch    | This is the amount of records to be fetched | 10                                                                              | 10            |         |

#### Filter Values

Please find the filter columns used in search

1. Name
2. Status

#### Example Request

```
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

#### Example Response

```
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

**Response code: 200 Ok**

### POST /documentcategories/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.

#### Resource URL

`POST /documentcategories/filtervalues`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required | Description                                                                     | Default Value | Example |
| ------------ | -------- | ------------------------------------------------------------------------------- | ------------- | ------- |
| filters      | No       | Array of the filter applied. In case of "list" screen, this array will be empty | -NA-          |         |
| columnName   | No       | The column name in the JSON response                                            | -NA-          |         |
| type         | No       | The value have to be in \["unique","all"]                                       | unique        | unique  |
| languagecode | Yes      | Language code in Language code in ISO 639-2 format                              |               |         |

#### Example Request

```
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

#### Example Response

```
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

**Response code: 200 Ok**

#### Failure Response

```
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

**Response code: 200 Ok**

#### Failure details

| Error Code  | Error Message                                            | Error Description                    |
| ----------- | -------------------------------------------------------- | ------------------------------------ |
| KER-MSD-013 | Error occurred while fetching Document Category details  | Fetch Issue                          |
| KER-MSD-051 | Error occurred while inserting Document Category details | Insertion Issue                      |
| KER-MSD-014 | Document Category not found                              | Data Not Found                       |
| KER-MSD-089 | Error occurred while updating Document Category details  | Update Issue                         |
| KER-MSD-090 | Error occurred while deleting Document Category details  | Deletion Issue                       |
| KER-MSD-123 | Cannot delete dependency found                           | Deletion Issue because of dependency |

***

## Documents Types

* [POST /documenttype](Document-APIs.md#post-documenttype)
* [PUT /documenttype](Document-APIs.md#put-documenttype)
* [GET /documenttypes/{documentcategorycode}/{langcode}](Document-APIs.md#get-documenttypesdocumentcategorycodelangcode)
* [GET /documentcategorytypes](Document-APIs.md#get-documentcategorytypes)
* [GET /doccattypes](Document-APIs.md#get-doccattypes)
* [GET /checkapptypedoccattypedoctype](Document-APIs.md#get-checkapptypedoccattypedoctype)
* [POST /documenttypes/search](Document-APIs.md#post-documenttypessearch)
* [POST /documenttypes/filtervalues](Document-APIs.md#post-documenttypesfiltervalues)

### POST /documenttype

This service will create the list of Documents types which are used in the MOSIP platform. There is another service to map the document category and document type. Please find the steps to create primary/secondary languages in this [link](Registration-Center-APIs.md#create-update-api).

#### Resource URL

`POST /documenttype`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name        | Required | Description                        | Default Value | Example |
| ----------- | -------- | ---------------------------------- | ------------- | ------- |
| code        | Yes      | Code of document type              |               |         |
| name        | Yes      | Name of the document type          |               |         |
| description | Yes      | Description of the document type   |               |         |
| langCode    | Yes      | Language code of the document type |               |         |
| isActive    | Yes      | Active field of the document type  |               |         |

#### Example Request

```
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

#### Example Response

```
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

**Response code: 200 Ok**

#### Error Response

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

**Response code: 200 Ok**

#### Failure details

| Error Code  | Error Message                                      | Error Description                    |
| ----------- | -------------------------------------------------- | ------------------------------------ |
| KER-MSD-500 | Internal Server Error                              | If system error occurs               |
| KER-ATH-403 | Forbidden                                          | If unauthorized role detected        |
| KER-ATH-401 | Authentication Failed                              | If no role/invalid token is detected |
| KER-MSD-101 | Error occurred while inserting application details |                                      |

### PUT /documenttype

This service will update the list of Documents types which are used in the MOSIP platform.

#### Resource URL

`PUT /documenttype`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name        | Required | Description                        | Default Value | Example |
| ----------- | -------- | ---------------------------------- | ------------- | ------- |
| code        | Yes      | Code of document type              |               |         |
| name        | Yes      | Name of the document type          |               |         |
| description | Yes      | Description of the document type   |               |         |
| langCode    | Yes      | Language code of the document type |               |         |
| isActive    | Yes      | Active field of the document type  |               |         |

#### Example Request

```
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

#### Example Response

```
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

**Response code: 200 Ok**

#### Error Response

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

**Response code: 200 Ok**

#### Failure details

| Error Code  | Error Message                                     | Error Description                    |
| ----------- | ------------------------------------------------- | ------------------------------------ |
| KER-MSD-500 | Internal Server Error                             | If system error occurs               |
| KER-ATH-403 | Forbidden                                         | If unauthorized role detected        |
| KER-ATH-401 | Authentication Failed                             | If no role/invalid token is detected |
| KER-MSD-091 | Error occurred while updating application details |                                      |
| KER-MSD-118 | Document Type not found                           |                                      |

### GET /documenttypes/{documentcategorycode}/{langcode}

This service will provides the service for the valid doucment type avialbale for specific Document Category code

#### Resource URL

`GET /documenttypes/{documentcategorycode}/{langcode}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name                 | Required | Description               | Default Value | Example |
| -------------------- | -------- | ------------------------- | ------------- | ------- |
| documentcategorycode | Yes      | Code of document category |               |         |
| langcode             | Yes      | language code             |               |         |

#### Example Response

```
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

**Response code: 200 Ok**

### GET /documentcategorytypes

This service will provides the service for the List of documents types.

#### Resource URL

`GET /documentcategorytypes`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name | Required | Description | Default Value | Example |
| ---- | -------- | ----------- | ------------- | ------- |
| -NA- |          |             |               |         |

#### Example Request

\-NA-

#### Example Response

```
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

**Response code: 200 Ok**

### GET /doccattypes

This service will give back the document category and it's corresponding category types based on Individual type code, Age group type code and Gender type code.

#### Resource URL

`GET /doccattypes`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name               | Required | Description             | Default Value | Example |
| ------------------ | -------- | ----------------------- | ------------- | ------- |
| individualtypecode | Yes      | Code of Individual type |               |         |
| agegrouptypecode   | Yes      | Code of Age group type  |               |         |
| gendertypecode     | Yes      | Code of Gender type     |               |         |

#### Example Request

```
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

#### Example Response

```
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

**Response code: 200 Ok**

### GET /checkapptypedoccattypedoctype

This service checks the mapping between the Applicant type code, Document category and the Document type mapping. Result message will be success, if the mapping exists.

#### Resource URL

`GET /checkapptypedoccattypedoctype`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name                 | Required | Description             | Default Value | Example |
| -------------------- | -------- | ----------------------- | ------------- | ------- |
| applicanttypecode    | Yes      | Code of Individual type |               |         |
| documentcategorycode | Yes      | Code of Age group type  |               |         |
| documenttypecode     | Yes      | Code of Document type   |               |         |

#### Example Request

```
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

#### Example Response

```
{
  "resultMessage":"Success"
}
```

**Response code: 200 Ok**

### POST /documenttypes/search

This service is for the document type search functionality. All the filter parameters are passed and the document type are searched and the matching results are returned.

#### Resource URL

`POST /documenttypes/search`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required                                    | Description                                                                     | Default Value | Example |
| ------------ | ------------------------------------------- | ------------------------------------------------------------------------------- | ------------- | ------- |
| filters      | No                                          | Array of the filter applied. In case of "list" screen, this array will be empty | -NA-          |         |
| columnName   | No                                          | The column name in the JSON response                                            | -NA-          |         |
| type         | No                                          | The value have to be in \["contains","equals","startsWith","between"]           | -NA-          |         |
| value        | No                                          | Value or id selected in the filter by the end user                              | -NA-          |         |
| fromValue    | No                                          | If the type is "between", this field is the value of the start range            | -NA-          |         |
| toValue      | No                                          | If the type is "between", this field is the value of the end range              | -NA-          |         |
| languagecode | Yes                                         | Language code in Language code in ISO 639-2 format                              |               |         |
| sort         | No                                          | This is an array of the sort field and type                                     |               |         |
| sortfield    | The field on which the sort is applied      |                                                                                 | modifiedDate  |         |
| sorttype     | This should be either of \['ASC','DESC']    |                                                                                 | ASC           |         |
| pagination   | The pagination parameter object             |                                                                                 |               |         |
| pageStart    | This is the start index                     | 0                                                                               | 10            |         |
| pageFetch    | This is the amount of records to be fetched | 10                                                                              | 10            |         |

#### Filter Values

| Filter Name | Search Values                       |
| ----------- | ----------------------------------- |
| code        | \["contains","equals","startsWith"] |
| status      | \["contains","equals","startsWith"] |

#### Example Request

```
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

#### Example Response

```
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

**Response code: 200 Ok**

### POST /documenttypes/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.

#### Resource URL

`POST /documenttypes/filtervalues`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required | Description                                                                     | Default Value | Example |
| ------------ | -------- | ------------------------------------------------------------------------------- | ------------- | ------- |
| filters      | No       | Array of the filter applied. In case of "list" screen, this array will be empty | -NA-          |         |
| columnName   | No       | The column name in the JSON response                                            | -NA-          |         |
| type         | No       | The value have to be in \["unique","all"]                                       | unique        | unique  |
| languagecode | Yes      | Language code in Language code in ISO 639-2 format                              |               |         |

#### Example Request

```
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

#### Example Response

```
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

**Response code: 200 Ok**

#### Failure details

| Error Code  | Error Message                                        | Error Description |
| ----------- | ---------------------------------------------------- | ----------------- |
| KER-MSD-015 | Error occurred while fetching Document Types         |                   |
| KER-MSD-052 | Error occurred while inserting Document Type details |                   |
| KER-MSD-118 | Document Type not found                              |                   |
| KER-MSD-091 | Error occur while updating Document Type details     |                   |
| KER-MSD-124 | Cannot delete dependency found                       |                   |
| KER-MSD-092 | Error occurred while deleting Document Type details  |                   |

## Valid documents

* [GET /validdocuments/{languagecode}](Document-APIs.md#get-validdocumentslanguagecode)
* [GET /validdocuments/{doccategorycode}/{languagecode}](Document-APIs.md#get-validdocumentsdocCategorycode)
* [POST /validdocuments/search](Document-APIs.md#post-validdocumentssearch)
* [POST /validdocuments/filtervalues](Document-APIs.md#post-validdocumentsfiltervalues)
* [POST /validdocuments/map/{doccategorycode}/{doctypecode}](Document-APIs.md#post-validdocumentsmapdoccategorycodedoctypecode)
* [PUT /validdocuments/unmap/{doccategorycode}/{doctypecode}](Document-APIs.md#put-validdocumentsunmapdoccategorycodedoctypecode)

### GET /validdocuments/{languagecode}

This API fetches all the valid documents based on language code.

#### Resource URL

`GET /validdocuments/{languagecode}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required | Description                | Default Value | Example |
| ------------ | -------- | -------------------------- | ------------- | ------- |
| languagecode | Yes      | Language code in ISO 639-2 | -NA-          | fra     |

#### Example Request

```
-NA-
```

#### Example Success Response

```
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

**Response code: 200 Ok**

#### Example Failure Response

```
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

**Response code: 200 Ok**

### GET /validdocuments/{languagecode}

#### Resource URL

`GET /validdocuments/{docCategoryCode}/{languagecode}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required | Description                | Default Value | Example |
| ------------ | -------- | -------------------------- | ------------- | ------- |
| languagecode | Yes      | Language code in ISO 639-2 | -NA-          | fra     |

#### Example Request

```
-NA-
```

#### Example Success Response

```
{
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "id": "string",
  "metadata": {},
  "response": [
    {
      "docCategoryCode": "string",
      "docTypeCode": "string",
      "docTypeName": "string",
      "isActive": true,
      "langCode": "string"
    }
  ],
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

**Response code: 200 Ok**

#### Example Failure Response

```
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

**Response code: 200 Ok**

### POST /validdocuments/search

This service is for the valid document search functionality. All the filter parameters are passed and the valid document are searched and the matching results are returned.

#### Resource URL

`POST /validdocuments/search`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required                                    | Description                                                                     | Default Value | Example |
| ------------ | ------------------------------------------- | ------------------------------------------------------------------------------- | ------------- | ------- |
| filters      | No                                          | Array of the filter applied. In case of "list" screen, this array will be empty | -NA-          |         |
| columnName   | No                                          | The column name in the JSON response                                            | -NA-          |         |
| type         | No                                          | The value have to be in \["contains","equals","startsWith","between"]           | -NA-          |         |
| value        | No                                          | Value or id selected in the filter by the end user                              | -NA-          |         |
| fromValue    | No                                          | If the type is "between", this field is the value of the start range            | -NA-          |         |
| toValue      | No                                          | If the type is "between", this field is the value of the end range              | -NA-          |         |
| languagecode | Yes                                         | Language code in Language code in ISO 639-2 format                              |               |         |
| sort         | No                                          | This is an array of the sort field and type                                     |               |         |
| sortfield    | The field on which the sort is applied      |                                                                                 | modifiedDate  |         |
| sorttype     | This should be either of \['ASC','DESC']    |                                                                                 | ASC           |         |
| pagination   | The pagination parameter object             |                                                                                 |               |         |
| pageStart    | This is the start index                     | 0                                                                               | 10            |         |
| pageFetch    | This is the amount of records to be fetched | 10                                                                              | 10            |         |

#### Example Request

```
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

#### Example Response

```
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

**Response code: 200 Ok**

### POST /validdocuments/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.

#### Resource URL

`POST /validdocuments/filtervalues`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required | Description                                                                     | Default Value | Example |
| ------------ | -------- | ------------------------------------------------------------------------------- | ------------- | ------- |
| filters      | No       | Array of the filter applied. In case of "list" screen, this array will be empty | -NA-          |         |
| columnName   | No       | The column name in the JSON response                                            | -NA-          |         |
| type         | No       | The value have to be in \["unique","all"]                                       | unique        | unique  |
| languagecode | Yes      | Language code in Language code in ISO 639-2 format                              |               |         |

#### Example Request

```
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

#### Example Response

```
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

**Response code: 200 Ok**

#### Failure details

| Error Code  | Error Message                                                                          | Error Description |
| ----------- | -------------------------------------------------------------------------------------- | ----------------- |
| KER-MSD-071 | Exception during inserting data into db                                                | Insertion Issue   |
| KER-MSD-016 | Valid document not found                                                               | Data Not Found    |
| KER-MSD-113 | Error occurred while deleting a mapping of Document Category and Document Type details | Deletion Issue    |
| KER-MSD-XXX | Error occurred while fetching Document Categories and Document Types                   | Fetching Issue    |

### POST /validdocuments/map/{doccategorycode}/{doctypecode}

This service is for the valid document mapping category with document category with document type code.

#### Resource URL

`POST /validdocuments/map/{doccategorycode}/{doctypecode}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name            | Required | Description            | Default Value | Example |
| --------------- | -------- | ---------------------- | ------------- | ------- |
| doccategorycode | Yes      | document category code |               | -NA-    |
| doctypecode     | Yes      | document type code     |               | -NA-    |

#### Example Request

```
https://{base_url}/v1/masterdata/validdocuments/map/POE/POC
```

#### Success Response

```
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

**Response code: 200 Ok**

#### Error Response

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

**Response code: 200 Ok**

#### Failure details

| Error Code  | Error Message                                                       | Error Description                                       |
| ----------- | ------------------------------------------------------------------- | ------------------------------------------------------- |
| KER-MSD-500 | Internal Server Error                                               | If system error occurs                                  |
| KER-ATH-403 | Forbidden                                                           | If unauthorized role detected                           |
| KER-ATH-401 | Authentication Failed                                               | If no role/invalid token is detected                    |
| KER-MSD-071 | Exception during inserting data into DB                             | If any error occur from database                        |
| KER-MSD-360 | Document Type is already mapped to the received Document Category   | If document type is already mapped to document category |
| KER-MSD-361 | Document Category Code %s - Document Type %s Mapping does not exist | If the mapping document doesn't exist                   |

### PUT /validdocuments/unmap/{doccategorycode}/{doctypecode}

This service is used for the un-mapping document category with document type code.

#### Resource URL

`PUT /validdocuments/unmap/{doccategorycode}/{doctypecode}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name            | Required | Description            | Default Value | Example |
| --------------- | -------- | ---------------------- | ------------- | ------- |
| doccategorycode | Yes      | document category code |               | -NA-    |
| doctypecode     | Yes      | document type code     |               | -NA-    |

#### Example Request

```
https://{base_url}/v1/masterdata/validdocuments/unmap/CIN/POB
```

#### Success Response

```
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

**Response code: 200 Ok**

#### Error Response

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

**Response code: 200 Ok**

#### Failure details

| Error Code  | Error Message                                                         | Error Description                                          |
| ----------- | --------------------------------------------------------------------- | ---------------------------------------------------------- |
| KER-MSD-500 | Internal Server Error                                                 | If system error occurs                                     |
| KER-ATH-403 | Forbidden                                                             | If unauthorized role detected                              |
| KER-ATH-401 | Authentication Failed                                                 | If no role/invalid token is detected                       |
| KER-MSD-071 | Exception during inserting data into DB                               | If any error occur from database                           |
| KER-MSD-363 | Document Type is already unmapped from the received Document Category | If document type is already un-mapped to document category |
| KER-MSD-361 | Document Category Code %s - Document Type %s Mapping does not exist   | If the mapping document doesn't exist                      |
