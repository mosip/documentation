# ID Schema APIs

This section details about the REST services for ID Schema.

* [Create ID Schema](ID-Schema-APIs.md#create-id-schema)
* [Update ID Schema](ID-Schema-APIs.md#update-id-schema)
* [Delete ID Schema](ID-Schema-APIs.md#delete-id-schema)
* [Get all ID Schema](ID-Schema-APIs.md#get-all-id-schema)
* [Get ID Schema](ID-Schema-APIs.md#get-id-schema)
* [Publish ID Schema](ID-Schema-APIs.md#publish-id-schema)

### Create ID Schema

This API is used to create an ID Schema.

#### Resource URL

`POST https://{base_url}/v1/masterdata/idschema`

#### Resource Details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                  | Required | Description                                        | Default Value         | Example                   |
| --------------------- | -------- | -------------------------------------------------- | --------------------- | ------------------------- |
| id                    | yes      | ID of the API                                      | mosip.idschema.create |                           |
| version               | yes      | version of the API                                 |                       | v1                        |
| metadata              | no       | any meta information for the API                   |                       |                           |
| requesttime           | yes      | timestamp of the request                           |                       | 2019-12-11T06:12:25.288Z  |
| request               | yes      | request body attributes                            |                       |                           |
| request.description   | yes      | description for the ID schema                      |                       | MOSIP Sample identity     |
| request.effectiveFrom | yes      | timestamp from when this will be effective from    |                       | 2020-06-11T06:12:25.288Z  |
| request.schema        | yes      | UI specification attributes to generate the schema |                       |                           |
| request.schemaVersion | yes      | schema version for the UI specification            |                       |                           |
| request.title         | yes      | title or name of the schema                        |                       | MOSIP Identity Schema 1.1 |

#### Request

```
{
  "id": "string",
  "metadata": {},
  "request": {
    "description": "string",
    "effectiveFrom": "2020-08-10T06:37:18.002Z",
    "schema": [
      {
        "bioAttributes": [
          "string"
        ],
        "contactType": "string",
        "controlType": "string",
        "description": "string",
        "fieldCategory": "string",
        "fieldType": "string",
        "format": "string",
        "group": "string",
        "id": "string",
        "inputRequired": true,
        "label": {
          "additionalProp1": "string",
          "additionalProp2": "string",
          "additionalProp3": "string"
        },
        "maximum": 0,
        "minimum": 0,
        "required": true,
        "requiredOn": [
          {
            "engine": "string",
            "expr": "string"
          }
        ],
        "subType": "string",
        "type": "string",
        "validators": [
          {
            "arguments": [
              "string"
            ],
            "type": "string",
            "validator": "string"
          }
        ]
      }
    ],
    "schemaVersion": 0,
    "title": "string"
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
    "createdBy": "string",
    "createdOn": "2020-08-10T09:17:29.963Z",
    "description": "string",
    "effectiveFrom": "2020-08-10T09:17:29.963Z",
    "id": "string",
    "idVersion": 0,
    "schema": [
      {
        "bioAttributes": [
          "string"
        ],
        "contactType": "string",
        "controlType": "string",
        "description": "string",
        "fieldCategory": "string",
        "fieldType": "string",
        "format": "string",
        "group": "string",
        "id": "string",
        "inputRequired": true,
        "label": {
          "additionalProp1": "string",
          "additionalProp2": "string",
          "additionalProp3": "string"
        },
        "maximum": 0,
        "minimum": 0,
        "required": true,
        "requiredOn": [
          {
            "engine": "string",
            "expr": "string"
          }
        ],
        "subType": "string",
        "type": "string",
        "validators": [
          {
            "arguments": [
              "string"
            ],
            "type": "string",
            "validator": "string"
          }
        ]
      }
    ],
    "schemaJson": "string",
    "status": "string",
    "title": "string",
    "updatedBy": "string",
    "updatedOn": "2020-08-10T09:17:29.963Z"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Update ID Schema

This API is used to update an ID Schema which is in draft status.

#### Resource URL

`PUT https://{base_url}/v1/masterdata/idschema?id={id_value}`

#### Resource Details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                  | Required | Description                                        | Default Value         | Example                   |
| --------------------- | -------- | -------------------------------------------------- | --------------------- | ------------------------- |
| id                    | yes      | ID of the API                                      | mosip.idschema.create |                           |
| version               | yes      | version of the API                                 |                       | v1                        |
| metadata              | no       | any meta information for the API                   |                       |                           |
| requesttime           | yes      | timestamp of the request                           |                       | 2019-12-11T06:12:25.288Z  |
| request               | yes      | request body attributes                            |                       |                           |
| request.description   | yes      | description for the ID schema                      |                       | MOSIP Sample identity     |
| request.effectiveFrom | yes      | timestamp from when this will be effective from    |                       | 2020-06-11T06:12:25.288Z  |
| request.schema        | yes      | UI specification attributes to generate the schema |                       |                           |
| request.schemaVersion | yes      | schema version for the UI specification            |                       |                           |
| request.title         | yes      | title or name of the schema                        |                       | MOSIP Identity Schema 1.1 |

#### Request

```
{
  "id": "string",
  "metadata": {},
  "request": {
    "description": "string",
    "effectiveFrom": "2020-08-10T09:20:37.651Z",
    "schema": [
      {
        "bioAttributes": [
          "string"
        ],
        "contactType": "string",
        "controlType": "string",
        "description": "string",
        "fieldCategory": "string",
        "fieldType": "string",
        "format": "string",
        "group": "string",
        "id": "string",
        "inputRequired": true,
        "label": {
          "additionalProp1": "string",
          "additionalProp2": "string",
          "additionalProp3": "string"
        },
        "maximum": 0,
        "minimum": 0,
        "required": true,
        "requiredOn": [
          {
            "engine": "string",
            "expr": "string"
          }
        ],
        "subType": "string",
        "type": "string",
        "validators": [
          {
            "arguments": [
              "string"
            ],
            "type": "string",
            "validator": "string"
          }
        ]
      }
    ],
    "schemaVersion": 0,
    "title": "string"
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
    "createdBy": "string",
    "createdOn": "2020-08-10T09:23:12.340Z",
    "description": "string",
    "effectiveFrom": "2020-08-10T09:23:12.340Z",
    "id": "string",
    "idVersion": 0,
    "schema": [
      {
        "bioAttributes": [
          "string"
        ],
        "contactType": "string",
        "controlType": "string",
        "description": "string",
        "fieldCategory": "string",
        "fieldType": "string",
        "format": "string",
        "group": "string",
        "id": "string",
        "inputRequired": true,
        "label": {
          "additionalProp1": "string",
          "additionalProp2": "string",
          "additionalProp3": "string"
        },
        "maximum": 0,
        "minimum": 0,
        "required": true,
        "requiredOn": [
          {
            "engine": "string",
            "expr": "string"
          }
        ],
        "subType": "string",
        "type": "string",
        "validators": [
          {
            "arguments": [
              "string"
            ],
            "type": "string",
            "validator": "string"
          }
        ]
      }
    ],
    "schemaJson": "string",
    "status": "string",
    "title": "string",
    "updatedBy": "string",
    "updatedOn": "2020-08-10T09:23:12.340Z"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Delete ID Schema

This API is used to delete an ID Schema which is in draft status.

#### Resource URL

`DELETE https://{base_url}/v1/masterdata/idschema?id={id_value}`

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
  "response": "string",
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Get all ID Schema

This API is used to fetch all the available ID Schema.

#### Resource URL

`GET https://{base_url}/v1/masterdata/idschema/all?orderBy={desc or asc}&pageNumber={page number}&pageSize={page size}&sortBy={field to sort}`

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
        "createdBy": "string",
        "createdOn": "2020-08-10T09:34:27.082Z",
        "description": "string",
        "effectiveFrom": "2020-08-10T09:34:27.082Z",
        "id": "string",
        "idVersion": 0,
        "schema": [
          {
            "bioAttributes": [
              "string"
            ],
            "contactType": "string",
            "controlType": "string",
            "description": "string",
            "fieldCategory": "string",
            "fieldType": "string",
            "format": "string",
            "group": "string",
            "id": "string",
            "inputRequired": true,
            "label": {
              "additionalProp1": "string",
              "additionalProp2": "string",
              "additionalProp3": "string"
            },
            "maximum": 0,
            "minimum": 0,
            "required": true,
            "requiredOn": [
              {
                "engine": "string",
                "expr": "string"
              }
            ],
            "subType": "string",
            "type": "string",
            "validators": [
              {
                "arguments": [
                  "string"
                ],
                "type": "string",
                "validator": "string"
              }
            ]
          }
        ],
        "schemaJson": "string",
        "status": "string",
        "title": "string",
        "updatedBy": "string",
        "updatedOn": "2020-08-10T09:34:27.082Z"
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

### Get ID Schema

This API is used to fetch the latest published ID Schema if version is not passed in request url or less it an be used to fetch a specific id schema by passing the schema version.

#### Resource URL

`GET https://dev.mosip.net/v1/masterdata/idschema/latest?schemaVersion={version_number}`

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
    "createdBy": "string",
    "createdOn": "2020-08-10T09:38:28.806Z",
    "description": "string",
    "effectiveFrom": "2020-08-10T09:38:28.806Z",
    "id": "string",
    "idVersion": 0,
    "schema": [
      {
        "bioAttributes": [
          "string"
        ],
        "contactType": "string",
        "controlType": "string",
        "description": "string",
        "fieldCategory": "string",
        "fieldType": "string",
        "format": "string",
        "group": "string",
        "id": "string",
        "inputRequired": true,
        "label": {
          "additionalProp1": "string",
          "additionalProp2": "string",
          "additionalProp3": "string"
        },
        "maximum": 0,
        "minimum": 0,
        "required": true,
        "requiredOn": [
          {
            "engine": "string",
            "expr": "string"
          }
        ],
        "subType": "string",
        "type": "string",
        "validators": [
          {
            "arguments": [
              "string"
            ],
            "type": "string",
            "validator": "string"
          }
        ]
      }
    ],
    "schemaJson": "string",
    "status": "string",
    "title": "string",
    "updatedBy": "string",
    "updatedOn": "2020-08-10T09:38:28.807Z"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Publish ID Schema

This API is used to publish a draft ID Schema.

#### Resource URL

`PUT https://{base_url}/v1/masterdata/idschema/publish`

#### Resource Details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                  | Required | Description                                        | Default Value         | Example                   |
| --------------------- | -------- | -------------------------------------------------- | --------------------- | ------------------------- |
| id                    | yes      | ID of the API                                      | mosip.idschema.create |                           |
| version               | yes      | version of the API                                 |                       | v1                        |
| metadata              | no       | any meta information for the API                   |                       |                           |
| requesttime           | yes      | timestamp of the request                           |                       | 2019-12-11T06:12:25.288Z  |
| request               | yes      | request body attributes                            |                       |                           |
| request.description   | yes      | description for the ID schema                      |                       | MOSIP Sample identity     |
| request.effectiveFrom | yes      | timestamp from when this will be effective from    |                       | 2020-06-11T06:12:25.288Z  |
| request.schema        | yes      | UI specification attributes to generate the schema |                       |                           |
| request.schemaVersion | yes      | schema version for the UI specification            |                       |                           |
| request.title         | yes      | title or name of the schema                        |                       | MOSIP Identity Schema 1.1 |

#### Request

```
{
  "id": "string",
  "metadata": {},
  "request": {
    "effectiveFrom": "2020-08-10T09:42:21.662Z",
    "id": "string"
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
