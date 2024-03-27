# Dynamic Fields APIs

This section details about the REST services for Dynamic fields.

MOSIP consists of various types of master data like, gender, location, individual type as part of its pre-defined schema. Now if a MOSIP adopter wants to add more master data for its UI screens, they can choose to use our dynamic fields APIs which are designed to support master data in JSON format in a single table.

Our implementation for dynamic field allows MOSIP adopters to store ina key value pair in single/multiple languages. Below is an example of Blood Group in english.

```
[
  {
    "code": "101",
    "value": "A",
    "langCode": "eng",
    "active": true
  },
  {
    "code": "102",
    "value": "A+",
    "langCode": "eng",
    "active": true
  },
  {
    "code": "103",
    "value": "A-",
    "langCode": "eng",
    "active": true
  },
  {
    "code": "104",
    "value": "B",
    "langCode": "eng",
    "active": true
  },
  {
    "code": "105",
    "value": "B+",
    "langCode": "eng",
    "active": true
  },
  {
    "code": "106",
    "value": "B-",
    "langCode": "eng",
    "active": true
  },
  {
    "code": "107",
    "value": "AB",
    "langCode": "eng",
    "active": true
  },
  {
    "code": "108",
    "value": "AB+",
    "langCode": "eng",
    "active": true
  },
  {
    "code": "109",
    "value": "AB-",
    "langCode": "eng",
    "active": true
  },
  {
    "code": "110",
    "value": "O",
    "langCode": "eng",
    "active": true
  },
  {
    "code": "111",
    "value": "O+",
    "langCode": "eng",
    "active": true
  },
  {
    "code": "112",
    "value": "O-",
    "langCode": "eng",
    "active": true
  },
  {
    "code": "113",
    "value": "Don't Know",
    "langCode": "eng",
    "active": true
  },
  {
    "code": "114",
    "value": "Not Applicable",
    "langCode": "eng",
    "active": true
  }
]
```

### Create Dynamic Field

This API is used to create a dynamic field.

#### Resource URL

`POST https://{base_url}/v1/masterdata/dynamicfields`

#### Resource Details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                    | Required | Description                          | Default Value             | Example                  |
| ----------------------- | -------- | ------------------------------------ | ------------------------- | ------------------------ |
| id                      | yes      | ID of the API                        | mosip.dynamicfield.create |                          |
| version                 | yes      | version of the API                   |                           | v1                       |
| metadata                | no       | any meta information for the API     |                           |                          |
| requesttime             | yes      | timestamp of the request             |                           | 2019-12-11T06:12:25.288Z |
| request                 | yes      | request body attributes              |                           |                          |
| request.active          | yes      | enable or disable the field          |                           | true or false            |
| request.dataType        | yes      | data type of the field value         |                           | string or integer        |
| request.description     | yes      | description of the field             |                           |                          |
| request.fieldVal        | yes      | list of field values                 |                           |                          |
| request.fieldVal.active | yes      | the field is active or not           |                           | true or false            |
| request.fieldVal.code   | yes      | the language code for the value      |                           | eng or ara or fra        |
| request.fieldVal.value  | yes      | the value to be stored               |                           |                          |
| request.langCode        | yes      | the language code for the field name |                           |                          |
| request.name            | yes      | the name of the field                |                           |                          |

#### Request

```
{
  "id": "string",
  "metadata": {},
  "request": {
    "active": true,
    "dataType": "string",
    "description": "string",
    "fieldVal": [
      {
        "active": true,
        "code": "string",
        "langCode": "string",
        "value": "string"
      }
    ],
    "langCode": "eng",
    "name": "any name"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

#### Response

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
    "active": true,
    "createdBy": "string",
    "createdOn": "2020-08-10T18:43:46.767Z",
    "dataType": "string",
    "description": "string",
    "fieldVal": [
      {
        "active": true,
        "code": "string",
        "langCode": "string",
        "value": "string"
      }
    ],
    "id": "string",
    "langCode": "string",
    "name": "string",
    "updatedBy": "string",
    "updatedOn": "2020-08-10T18:43:46.767Z"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Update Dynamic Field

This API is used to update a dynamic field schema completely.

#### Resource Details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                    | Required | Description                          | Default Value             | Example                  |
| ----------------------- | -------- | ------------------------------------ | ------------------------- | ------------------------ |
| id                      | yes      | ID of the API                        | mosip.dynamicfield.create |                          |
| version                 | yes      | version of the API                   |                           | v1                       |
| metadata                | no       | any meta information for the API     |                           |                          |
| requesttime             | yes      | timestamp of the request             |                           | 2019-12-11T06:12:25.288Z |
| request                 | yes      | request body attributes              |                           |                          |
| request.active          | yes      | enable or disable the field          |                           | true or false            |
| request.dataType        | yes      | data type of the field value         |                           | string or integer        |
| request.description     | yes      | description of the field             |                           |                          |
| request.fieldVal        | yes      | list of field values                 |                           |                          |
| request.fieldVal.active | yes      | the field is active or not           |                           | true or false            |
| request.fieldVal.code   | yes      | the language code for the value      |                           | eng or ara or fra        |
| request.fieldVal.value  | yes      | the value to be stored               |                           |                          |
| request.langCode        | yes      | the language code for the field name |                           |                          |
| request.name            | yes      | the name of the field                |                           |                          |

#### Resource URL

`PUT https://{base_url}/v1/masterdata/dynamicfields?id={id value}`

#### Request

```
{
  "id": "string",
  "metadata": {},
  "request": {
    "active": true,
    "dataType": "string",
    "description": "string",
    "fieldVal": [
      {
        "active": true,
        "code": "string",
        "langCode": "string",
        "value": "string"
      }
    ],
    "langCode": "eng",
    "name": "any name"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

#### Response

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
    "active": true,
    "createdBy": "string",
    "createdOn": "2020-08-10T18:54:17.240Z",
    "dataType": "string",
    "description": "string",
    "fieldVal": [
      {
        "active": true,
        "code": "string",
        "langCode": "string",
        "value": "string"
      }
    ],
    "id": "string",
    "langCode": "string",
    "name": "string",
    "updatedBy": "string",
    "updatedOn": "2020-08-10T18:54:17.240Z"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Update Dynamic Field value

This API is used to update a dynamic field value.

#### Resource URL

`PUT https://dev.mosip.net/v1/masterdata/dynamicfields/values?id={id value}`

#### Resource Details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name             | Required | Description                          | Default Value             | Example                  |
| ---------------- | -------- | ------------------------------------ | ------------------------- | ------------------------ |
| id               | yes      | ID of the API                        | mosip.dynamicfield.create |                          |
| version          | yes      | version of the API                   |                           | v1                       |
| metadata         | no       | any meta information for the API     |                           |                          |
| requesttime      | yes      | timestamp of the request             |                           | 2019-12-11T06:12:25.288Z |
| request          | yes      | request body attributes              |                           |                          |
| request.active   | yes      | the field is active or not           |                           | true or false            |
| request.code     | yes      | the language code for the value      |                           | eng or ara or fra        |
| request.value    | yes      | the value to be stored               |                           |                          |
| request.langCode | yes      | the language code for the field name |                           |                          |

#### Request

```
{
  "id": "string",
  "metadata": {},
  "request": {
    "active": true,
    "code": "string",
    "langCode": "string",
    "value": "string"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

#### Response

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
  "response": "string",
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Get Dynamic Field

This API is used to fetch dynamic fields using pagination.

#### Request URL

`GET https://dev.mosip.net/v1/masterdata/dynamicfields?orderBy={desc or asc}&pageNumber={page number}&pageSize={page size}&sortBy={field name to sort}`

#### Resource Details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

NA

#### Request

NA

#### Response

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
        "active": true,
        "createdBy": "string",
        "createdOn": "2020-08-10T19:05:52.427Z",
        "dataType": "string",
        "description": "string",
        "fieldVal": [
          {
            "active": true,
            "code": "string",
            "langCode": "string",
            "value": "string"
          }
        ],
        "id": "string",
        "langCode": "string",
        "name": "string",
        "updatedBy": "string",
        "updatedOn": "2020-08-10T19:05:52.427Z"
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
