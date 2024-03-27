# Holiday APIs

This section details about the service APIs for the Holidays.

## Holidays

* [GET /holidays](Holiday-APIs.md#get-holidays)
* [POST /holidays](Holiday-APIs.md#post-holidays)
* [PUT /holidays](Holiday-APIs.md#put-holidays)
* [DELETE /holidays](Holiday-APIs.md#delete-holidays)
* [GET /holidays/{holidayid}](Holiday-APIs.md#get-holidays-holidayid)
* [GET /holidays/{holidayid}/{langcode}](Holiday-APIs.md#get-holidays-holidayid-langcode)
* [GET /holidays/all](Holiday-APIs.md#get-holidays-all)
* [POST /holidays/filtervalues](Holiday-APIs.md#post-holidays-filtervalues)
* [POST /holidays/search](Holiday-APIs.md#post-holidays-search)

### GET /holidays

This service will get all the holidays.

#### Resource URL

`GET /holidays`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name   | Required | Description | Default Value | Example |
| ------ | -------- | ----------- | ------------- | ------- |
| --NA-- |          |             |               |         |

#### Example Response

```
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

**Response Code : 200 (OK)**

### POST /holidays

This service will create a new holiday.

#### Resource URL

`POST /holidays`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required | Description   | Default Value | Example |
| ------------ | -------- | ------------- | ------------- | ------- |
| locationCode | Yes      | location code |               |         |
| holidayDate  | Yes      | date          |               |         |
| holidayMonth | Yes      | month         |               |         |
| holidayYear  | Yes      | year          |               |         |
| holidayName  | Yes      | name          |               |         |
| holidayDesc  | Yes      | description   |               |         |
| langCode     | Yes      | language code |               |         |
| isActive     | Yes      | is active?    |               |         |

#### Example Request

```
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

#### Example Response

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

**Response Code : 200 (OK)**

### PUT /holidays

This service will update a holiday.

#### Resource URL

`PUT /holidays`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name           | Required | Description     | Default Value | Example |
| -------------- | -------- | --------------- | ------------- | ------- |
| locationCode   | Yes      | location code   |               |         |
| holidayDate    | Yes      | date            |               |         |
| newHolidayDate | Yes      | new date        |               |         |
| newHolidayName | Yes      | new name        |               |         |
| holidayName    | Yes      | name            |               |         |
| holidayDesc    | Yes      | description     |               |         |
| langCode       | Yes      | language code   |               |         |
| isActive       | Yes      | is active?      |               |         |
| newHolidayDesc | Yes      | new description |               |         |

#### Example Request

```
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

#### Example Response

```
{
  "holidayDate": "string",
  "holidayName": "string",
  "langCode": "string",
  "locationCode": "string"
}
```

**Response Code : 200 (OK)**

### DELETE /holidays

This service will provides the service to delete a holiday.

#### Resource URL

`DELETE /holidays`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name         | Required | Description                       | Default Value | Example |
| ------------ | -------- | --------------------------------- | ------------- | ------- |
| holidayDate  | Yes      | date to be deleted                |               |         |
| holidayName  | Yes      | name of the holiday to be deleted |               |         |
| locationCode | Yes      | location code                     |               |         |

#### Example Request

```
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

#### Example Response

```
{
  "holidayDate": "string",
  "holidayName": "string",
  "locationCode": "string"
}
```

**Response Code : 200 (OK)**

### GET /holidays/{holidayid}

This service will provides the service to get all holidays by Id.

#### Resource URL

`GET /holidays/{holidayid}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name      | Required | Description | Default Value | Example |
| --------- | -------- | ----------- | ------------- | ------- |
| holidayid | yes      | holiday Id  |               |         |

#### Example Response

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

**Response Code : 200 (OK)**

### GET /holidays/{holidayid}/{langcode}

This service will get all the holidays by holidayid and language code.

#### Resource URL

`GET /holidays/{holidayid}/{langcode}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name      | Required | Description   | Default Value | Example |
| --------- | -------- | ------------- | ------------- | ------- |
| holidayid | yes      | holiday Id    |               |         |
| langCode  | Yes      | language code |               |         |

#### Example Response

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

**Response Code : 200 (OK)**

### GET /holidays/all

This service will retrieve all the holidays with additional metadata.

#### Resource URL

`GET /holidays/all`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name       | Required | Description                                  | Default Value   | Example |
| ---------- | -------- | -------------------------------------------- | --------------- | ------- |
| orderBy    | optional | response order                               | desc            |         |
| pageNumber | optional | page no for the requested data               | 0               |         |
| pageSize   | optional | page size for the requested data             | 10              |         |
| sortBy     | optional | sort the requested data based on param value | createdDateTime |         |

#### Example Response

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

#### Response codes

| Response Code | Description  |
| ------------- | ------------ |
| 200           | Success      |
| 400           | Bad request  |
| 401           | Unauthorized |
| 403           | Forbidden    |

#### Failure details

| Error Code  | Error Message                                   | Error Description |
| ----------- | ----------------------------------------------- | ----------------- |
| KER-MSD-019 | Error occured while fetching Holidays           | Fetch Issue       |
| KER-MSD-020 | Holiday not found                               | Data Not Found    |
| KER-MSD-065 | Error occurred while inserting holiday          | Insertion Issue   |
| KER-MSD-099 | Error occurred while updating holiday           | Update Issue      |
| KER-MSD-100 | Error occurred while deleting holiday           | Deletion Issue    |
| KER-MSD-025 | Error occured while fetching Location Hierarchy | fetch issue       |
| KER-MSD-026 | Location not found                              | Data Not Found    |

### POST /holidays/filtervalues

This API is used by the Administrator Portal UI to populate filter dropdowns on the Holiday List View UI Screen.

#### Resource URL

`POST /holidays/filtervalues`

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

#### Example Response

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

**Response Code : 200 (OK)**

### POST /holidays/search

This API is used by the Administrator Portal to fetch list of Holidays based on a given filter criteria to display the list of Holidays on the Portal UI.

#### Resource URL

`POST /holidays/search`

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
| fromValue    | No                                          | If the type is "between", this field is the value of the fromName               | -NA-          |         |
| toValue      | No                                          | If the type is "between", this field is the value of the toName                 | -NA-          |         |
| languagecode | Yes                                         | Language code in Language code in ISO 639-2 format                              |               |         |
| sort         | No                                          | This is an array of the sort field and type                                     |               |         |
| sortfield    | The field on which the sort is applied      |                                                                                 | modifiedDate  |         |
| sorttype     | This should be either of \['ASC','DESC']    |                                                                                 | ASC           |         |
| pagination   | The pagination parameter object             |                                                                                 |               |         |
| pageStart    | This is the start index                     | 0                                                                               | 0             |         |
| pageFetch    | This is the amount of records to be fetched | 10                                                                              | 10            |         |

#### Filter Values

Please find the filter columns used in search

1. holidayName
2. holidayDate|\["between"]
3. isActive

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

**Response Code : 200 (OK)**

***
