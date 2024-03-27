# BlacklistedWords APIs

This section details about the service APIs for the BlacklistedWords

## BlacklistedWords Master API

* [POST /blacklistedwords](BlacklistedWords-APIs.md#post-blacklistedwords)
* [PUT /blacklistedwords](BlacklistedWords-APIs.md#put-blacklistedwords)
* [GET /blacklistedwords/{langcode}](BlacklistedWords-APIs.md#get-blacklistedwords-langcode)
* [DELETE /blacklistedwords/{word}](BlacklistedWords-APIs.md#delete-blacklistedwords-word)
* [GET /blacklistedwords/all](BlacklistedWords-APIs.md#get-blacklistedwords-all)
* [PUT /blacklistedwords/details](BlacklistedWords-APIs.md#put-blacklistedwords-details)
* [POST /blacklistedwords/words](BlacklistedWords-APIs.md#post-blacklistedwords-words)
* [POST /blacklistedwords/filtervalues](BlacklistedWords-APIs.md#post-blacklistedwords-filtervalues)
* [POST /blacklistedwords/search](BlacklistedWords-APIs.md#post-blacklistedwords-search)

### POST /blacklistedwords

This service will create a blacklisted word which will be used in the MOSIP platform.

#### Resource URL

`POST /blacklistedwords`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name        | Required | Description                  | Default Value | Example |
| ----------- | -------- | ---------------------------- | ------------- | ------- |
| description | optional | blacklisted word description |               |         |
| isActive    | Yes      | is active or not             |               |         |
| langCode    | Yes      | language code                |               |         |
| word        | Yes      | blacklisted word name        |               |         |

#### Example Request

```
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
    "langCode": "string",
    "word": "string"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

**Response code: 200 Ok**

### PUT /blacklistedwords

This service will update the blacklisted word which is used in the MOSIP platform.

#### Resource URL

`PUT /blacklistedwords`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name        | Required | Description                  | Default Value | Example |
| ----------- | -------- | ---------------------------- | ------------- | ------- |
| description | optional | blacklisted word description |               |         |
| isActive    | Yes      | is active or not             |               |         |
| langCode    | Yes      | language code                |               |         |
| oldWord     | Yes      | old blacklisted word         |               |         |
| word        | Yes      | blacklisted word             |               |         |

#### Example Request

```
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
    "langCode": "string",
    "word": "string"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

**Response code: 200 Ok**

### GET /blacklistedwords/{langcode}

This service will provides the service for the List of blacklisted words based on the passed language code.

#### Resource URL

`GET /blacklistedwords/{langcode}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name     | Required | Description   | Default Value | Example |
| -------- | -------- | ------------- | ------------- | ------- |
| langcode | Yes      | language code |               |         |

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

**Response code: 200 Ok**

### DELETE /blacklistedwords/{word}

This service will provides the service to delete the blacklisted word.

#### Resource URL

`DELETE /blacklistedwords/{word}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name | Required | Description                    | Default Value | Example |
| ---- | -------- | ------------------------------ | ------------- | ------- |
| word | Yes      | blacklisted word to be deleted |               |         |

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
    "code": "string"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

**Response code: 200 Ok**

### GET /blacklistedwords/all

This service will provides the service for the List of blacklistedwords.

#### Resource URL

`GET /blacklistedwords/all`

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

**Response code: 200 Ok**

### PUT /blacklistedwords/details

This service will update the blacklisted word details except the word itself.

#### Resource URL

`PUT /blacklistedwords/details`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name        | Required | Description                  | Default Value | Example |
| ----------- | -------- | ---------------------------- | ------------- | ------- |
| description | optional | blacklisted word description |               |         |
| isActive    | Yes      | is active or not             |               |         |
| langCode    | Yes      | language code                |               |         |
| word        | Yes      | blacklisted word name        |               |         |

#### Example Request

```
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
    "langCode": "string",
    "word": "string"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

**Response code: 200 Ok**

### POST /blacklistedwords/words

This service will return "Invalid" when the word is a blacklisted word and retrun "valid" when the word is not a blacklist word.

#### Resource URL

`POST /blacklistedwords/words`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name              | Required | Description                       | Default Value | Example |
| ----------------- | -------- | --------------------------------- | ------------- | ------- |
| blacklisted words | Yes      | blacklisted words to be validated |               |         |

#### Example Request

```
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

#### Example Response

```
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

**Response code: 200 Ok**

#### Failure details

| Error Code  | Error Message                                    | Error Description |
| ----------- | ------------------------------------------------ | ----------------- |
| KER-MSD-007 | Error occurred while fetching Blacklisted words  | Fetch Issue       |
| KER-MSD-008 | Blacklisted word not found                       | Data Not Found    |
| KER-MSD-070 | Error occurred while inserting Blacklisted words | Insertion Issue   |
| KER-MSD-105 | Error occurred while updating Blacklisted Word   | Update Issue      |
| KER-MSD-106 | Error occurred while deleting Blacklisted Word   | Deletion Issue    |

### POST /blacklistedwords/filtervalues

This service returns the filter values which are required in the dropdown entries of the filter screen.

#### Resource URL

`POST /blacklistedwords/filtervalues`

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

**Response code: 200 Ok**

### POST /blacklistedwords/search

This service is for the blacklisted words search functionality. All the filter parameters are passed and the blacklisted words are searched and the matching results are returned.

#### Resource URL

`POST /blacklistedwords/search`

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
  "request": {
    "filters": [
      {
        "value": "string",
        "fromValue": "string",
        "toValue": "string",
        "columnName": "string",
        "type": "string"
      }
    ],
    "sort": [
      {
        "sortField": "string",
        "sortType": "string"
      }
    ],
    "pagination": {
      "pageStart": 0,
      "pageFetch": 0
    },
    "languageCode": "string"
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
    "fromRecord": 0,
    "toRecord": 0,
    "totalRecord": 0
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

**Response code: 200 Ok**
