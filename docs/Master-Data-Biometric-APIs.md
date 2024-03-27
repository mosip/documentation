# Master Data Biometric APIs

## Introduction

This section details about the service APIs in the biometric types and biometric attributes modules

* [Biometric Types API](Master-Data-Biometric-APIs.md#biometric-types)
* [Biometrics Attributes API](Master-Data-Biometric-APIs.md#biometric-attributes)

## Biometric types

* [POST /biometrictypes](Master-Data-Biometric-APIs.md#post-biometrictypes)
* [GET /biometrictypes](Master-Data-Biometric-APIs.md#get-biometrictypes)
* [GET /biometrictypes/{id}/{languagecode}](Master-Data-Biometric-APIs.md#get-biometrictypes-id-languagecode)
* [GET /biometrictypes/{languagecode}](Master-Data-Biometric-APIs.md#get-biometrictypes-id-languagecode)

### POST /biometrictypes

This service will create a biometric types which would be used in MOSIP platform.

#### Resource URL

`POST /biometrictypes`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name          | Required | Description                  | Default Value | Example |
| ------------- | -------- | ---------------------------- | ------------- | ------- |
| biometrictype | Yes      | Array of the biometric types |               |         |

#### Example Request

```
{
  "id": "io.mosip.masterdata.biometrictypes.create",
  "metadata": {},
  "request": {
    "code": "FNR",
    "description": "Finger prints of the applicant",
    "isActive": true,
    "langCode": "eng",
    "name": "Fingerprint"
  },
  "requesttime": "2020-05-02T07:37:35.618Z",
  "version": "1.0"
}
```

#### Example Response

```
{
  "id": "io.mosip.masterdata.biometrictypes.create",
  "version": "1.0",
  "responsetime": "2020-05-02T07:37:35.618Z",
  "metadata": null,
  "response": {
    "code": "FNR",
    "langCode": "eng"
  },
  "errors": null
}
```

**Response code: 200 Ok**

#### Failure details

| Error Code  | Error Message                                         | Error Description   |
| ----------- | ----------------------------------------------------- | ------------------- |
| KER-MSD-105 | Error occurred while inserting biometric type details | Insertion Exception |

### GET /biometrictypes

This service will fetch all the biometric types in MOSIP platform.

#### Resource URL

`GET /biometrictypes`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name            | Required | Description          | Default Value | Example |
| --------------- | -------- | -------------------- | ------------- | ------- |
| biometrictypeid | Yes      | Code of the language |               |         |
| biometrictype   | Yes      | Name of the language |               |         |

#### Example Response

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-05-02T07:41:40.882Z",
  "metadata": null,
  "response": {
    "biometrictypes": [
      {
        "code": "FNR",
        "name": "Fingerprint",
        "description": "Finger prints of the applicant",
        "langCode": "eng",
        "isActive": true
      }
    ]
  },
  "errors": null
}
```

**Response code: 200 Ok**

### GET /biometrictypes/{id}/{languagecode}

This service will fetch all the biometric types based on id and language code.

#### Resource URL

`GET /biometrictypes/{id}/{languagecode}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name            | Required | Description          | Default Value | Example |
| --------------- | -------- | -------------------- | ------------- | ------- |
| biometrictypeid | Yes      | Code of the language |               |         |
| biometrictype   | Yes      | Name of the language |               |         |

#### Example Request

```
https://{base_url}/v1/masterdata/biometrictypes/FNR/eng
```

#### Success Response

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-05-02T07:46:57.974Z",
  "metadata": null,
  "response": {
    "biometrictypes": [
      {
        "code": "FNR",
        "name": "Fingerprint",
        "description": "Finger prints of the applicant",
        "langCode": "eng",
        "isActive": true
      }
    ]
  },
  "errors": null
}
```

**Response code: 200 Ok**

#### Error Response

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-05-02T07:48:34.076Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-MSD-006",
      "message": "Biometric Type not found"
    }
  ]
}
```

**Response code: 200 Ok**

#### Failure details

| Error Code  | Error Message                                 | Error Description |
| ----------- | --------------------------------------------- | ----------------- |
| KER-MSD-005 | Error occurred while fetching Biometric Types | Fetch Exception   |
| KER-MSD-006 | Biometric Type not found                      | Data not found    |

### GET /biometrictypes/{languagecode}

This service will fetch all the biometric types based on language code.

#### Resource URL

`GET /biometrictypes/{languagecode}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name            | Required | Description          | Default Value | Example |
| --------------- | -------- | -------------------- | ------------- | ------- |
| biometrictypeid | Yes      | Code of the language |               |         |
| biometrictype   | Yes      | Name of the language |               |         |

#### Example Request

```
https://{base_url}/v1/masterdata/biometrictypes/eng
```

#### Success Response

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-05-02T07:46:57.974Z",
  "metadata": null,
  "response": {
    "biometrictypes": [
      {
        "code": "FNR",
        "name": "Fingerprint",
        "description": "Finger prints of the applicant",
        "langCode": "eng",
        "isActive": true
      }
    ]
  },
  "errors": null
}
```

**Response code: 200 Ok**

#### Error Response

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-05-02T07:48:34.076Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-MSD-006",
      "message": "Biometric Type not found"
    }
  ]
}
```

**Response code: 200 Ok**

#### Failure details

| Error Code  | Error Message                                 | Error Description |
| ----------- | --------------------------------------------- | ----------------- |
| KER-MSD-005 | Error occurred while fetching Biometric Types | Fetch Exception   |
| KER-MSD-006 | Biometric Type not found                      | Data not found    |

***

## Biometric Attributes

* [POST /biometricattributes](Master-Data-Biometric-APIs.md#post-biometricattributes)
* [GET /biometricattributes/{biometricatributeid}/{languagecode}](Master-Data-Biometric-APIs.md#get-biometricattributes-biometricatributeid-languagecode)
* [GET /getbiometricattributesbyauthtype/{languagecode}/{biometrictypeid}](Master-Data-Biometric-APIs.md#get-getbiometricattributesbyauthtype-languagecode-biometrictypeid)

### POST /biometricattributes

This service will create a biometric attribute which will be used in the MOSIP platform.

#### Resource URL

`POST /biometricattributes`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name               | Required | Description                       | Default Value | Example |
| ------------------ | -------- | --------------------------------- | ------------- | ------- |
| biometricattribute | Yes      | Array of the biometric attributes |               |         |

#### Example Request

```
{
  "id": "io.mosip.masterdata.biometricattribute.create",
  "metadata": {},
  "request": {
    "biometricTypeCode": "FNR",
    "code": "TM",
    "description": "Print of Left and Right Thumbs",
    "isActive": true,
    "langCode": "eng",
    "name": "Thumbs"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "1.0"
}
```

#### Example Response

```
{
  "id": "io.mosip.masterdata.biometricattribute.create",
  "version": "1.0",
  "responsetime": "2020-05-02T07:59:37.634Z",
  "metadata": null,
  "response": {
    "code": "TM",
    "langCode": "eng"
  },
  "errors": null
}
```

**Response code: 200 Ok**

### GET /biometricattributes/{biometricatributeid}/{languagecode}

This service will fetch the list of biometric attributes using biometric attribute code and language code.

#### Resource URL

`GET /biometricattributes/{biometricatributeid}/{languagecode}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name                | Required | Description          | Default Value | Example |
| ------------------- | -------- | -------------------- | ------------- | ------- |
| biometricatributeid | Yes      | Code of the language |               |         |
| biometricattribute  | Yes      | Name of the language |               |         |

#### Example Request

```
https://{base_ur}/v1/masterdata/biometricattributes/TM/eng
```

#### Example Response

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-05-02T07:59:14.845Z",
  "metadata": null,
  "response": {
    "biometricattributes": [
      {
        "code": "TM",
        "name": "Thumbs",
        "description": "Print of Left and Right Thumbs",
        "biometricTypeCode": "FNR",
        "langCode": "eng",
        "isActive": true
      }
    ]
  },
  "errors": null
}
```

**Response code: 200 Ok**

### GET /getbiometricattributesbyauthtype/{languagecode}/{biometrictypeid}

This service will provides fetch a list of Biometrics based on the biometric type and language code.

#### Resource URL

`GET /getbiometricattributesbyauthtype/{languagecode}/{biometrictypeid}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name            | Required | Description                   | Default Value | Example |
| --------------- | -------- | ----------------------------- | ------------- | ------- |
| biometrictypeid | Yes      | Id of the biometric auth type |               |         |

#### Example Request

```
https://{base_url}/v1/masterdata/getbiometricattributesbyauthtype/eng/FNR
```

#### Success Response

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-05-02T07:59:14.845Z",
  "metadata": null,
  "response": {
    "biometricattributes": [
      {
        "code": "TM",
        "name": "Thumbs",
        "description": "Print of Left and Right Thumbs",
        "biometricTypeCode": "FNR",
        "langCode": "eng",
        "isActive": true
      }
    ]
  },
  "errors": null
}
```

**Response code: 200 Ok**

#### Failure Response

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-05-02T08:07:35.413Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-MSD-004",
      "message": "BiometricAttribute not found"
    }
  ]
}
```

**Response code: 200 Ok**

**Failure details**

| Error Code  | Error Message                                      | Error Description |
| ----------- | -------------------------------------------------- | ----------------- |
| KER-MSD-004 | BiometricAttribute not found                       | Data Not Found    |
| KER-MSD-003 | Error occurred while fetching BiometricAttributes  | Fetch Issue       |
| KER-APP-103 | Error occurred while inserting BiometricAttributes | Insertion Issues  |
