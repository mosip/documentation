# Resident Service APIs

## Overview

This section details out all Resident Service REST APIs

* [Service Request Status Check API](Resident-Service-APIs.md#post-resident-v-1-rid-check-status)
* [e-UIN API](Resident-Service-APIs.md#post-resident-v-1-req-euin)
* [Re-print UIN API](Resident-Service-APIs.md#post-resident-v-1-req-print-uin)
* [Retrieve Lost UIN API - yet to be developed](Resident-Service-APIs.md#post-resident-v-1-req-uin)
* [Retrieve Lost RID API - yet to be developed](Resident-Service-APIs.md#post-resident-v-1-req-rid)
* [UIN Update API](Resident-Service-APIs.md#post-resident-v-1-req-update-uin)
* [VID Generate API](Resident-Service-APIs.md#post-resident-v-1-vid)
* [VID Revoke API](Resident-Service-APIs.md#patch-resident-v-1-vid-vid)
* [Lock Authentication Type API](Resident-Service-APIs.md#post-resident-v-1-req-auth-lock)
* [Unlock Authentication Type API](Resident-Service-APIs.md#post-resident-v-1-req-auth-unlock)
* [Authentication History API](Resident-Service-APIs.md#post-resident-v-1-req-auth-history)

## Resident Services APIs

### POST /resident/v1/rid/check-status

#### Resource URL

`https://mosip.io/resident/v1/rid/check-status`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                      | Required | Description                         | Default Value | Example                              |
| ------------------------- | -------- | ----------------------------------- | ------------- | ------------------------------------ |
| id                        | Y        | API Id                              |               | mosip.resident.uinstatus             |
| version                   | Y        | API version                         |               | v1                                   |
| requestTime               | Y        | Time when Request was captured      |               | 2018-12-09T06:39:04.683Z             |
| request: transactionID    | N        | Transaction ID of request           |               | dabed834-974f-11e9-bc42-526af7764f64 |
| request: individualId     | Y        | RID                                 |               | 9830872690593682                     |
| request: individualIdType | Y        | Allowed Type of Individual ID - RID | RID           |                                      |

#### Request Body

```
{
  "id": "mosip.resident.checkstatus",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "individualId": "9830872690593682",
  "individualIdType": "RID"
  }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.resident.checkstatus",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {
    "ridStatus": "PROCESSING"
  },
  "errors": null
}
```

**Status Code : 200 (OK)**

**Failed Response:**

```
{
  "id": "mosip.resident.checkstatus",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "Invalid RID"
    }
  ]
}
```

**Status Code : 200 (OK)**

**Failure details**

| Error Code      | Error Message                                            | Error Description |
| --------------- | -------------------------------------------------------- | ----------------- |
| RES-SER-001     | RID not found                                            |                   |
| RES-SER-002     | One or more input parameter is invalid or does not exist |                   |
| RES-SER-003     | Token generation failed                                  |                   |
| RES-SER-005     | API resource is not available                            |                   |
| RES-SER-006     | Unable to access API resource                            |                   |
| RES-SER-009     | Invalid Input Parameter                                  |                   |
| RES-SER-012     | Invalid RID                                              |                   |
| RES-SER-015     | Template exception                                       |                   |
| RES-SER-016     | Template subject exception                               |                   |
| RES-SER-017     | Sending notification(Email and SMS) to resident failed.  |                   |
| RES-SER-020     | Bad Request                                              |                   |
| RES-SER-021     | Invalid APi response                                     |                   |
| RES-SER-SYS-001 | System exception occured                                 |                   |
| RES-SER-SYS-002 | IO Exception occured                                     |                   |
| RES-SER-SYS-003 | JSON Processing Exception occured                        |                   |

### POST /resident/v1/req/euin

This request will authenticate an Individual based on provided OTP and respond with e-UIN. Notification will be sent to phone/email.

#### Resource URL

`https://mosip.io/resident/v1/req/euin`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                      | Required | Description                                 | Default Value | Example                              |
| ------------------------- | -------- | ------------------------------------------- | ------------- | ------------------------------------ |
| id                        | Y        | API Id                                      |               | mosip.resident.euin                  |
| version                   | Y        | API version                                 |               | v1                                   |
| requestTime               | Y        | Time when Request was captured              |               | 2018-12-09T06:39:04.683Z             |
| request: transactionID    | Y        | Transaction ID of request                   |               | dabed834-974f-11e9-bc42-526af7764f64 |
| request: individualId     | Y        | VID                                         |               | 9830872690593682                     |
| request: individualIdType | Y        | Allowed Type of Individual ID - VID, UIN    | VID           |                                      |
| request: cardType         | Y        | Allowed Type of cardType - MASKED\_UIN, UIN |               |                                      |
| request: otp              | Y        | OTP                                         |               |                                      |

#### Request Body

```
{
  "id": "mosip.resident.euin",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "cardType": "MASKED_UIN",
  "otp": "123456"
  }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.resident.euin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {
    "euin": "<uin-pdf byte string>",
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

**Status Code : 200 (OK)**

**Failed Response**

```
{
  "id": "mosip.resident.euin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

**Status Code : 200 (OK)**

#### Failure details

| Error Code      | Error Message                                            | Error Description |
| --------------- | -------------------------------------------------------- | ----------------- |
| RES-SER-002     | One or more input parameter is invalid or does not exist |                   |
| RES-SER-003     | Token generation failed                                  |                   |
| RES-SER-004     | Invalid OTP                                              |                   |
| RES-SER-005     | API resource is not available                            |                   |
| RES-SER-006     | Unable to access API resource                            |                   |
| RES-SER-009     | Invalid Input Parameter                                  |                   |
| RES-SER-010     | Invalid VID                                              |                   |
| RES-SER-011     | Invalid UIN                                              |                   |
| RES-SER-013     | Invalid UIN for given VID                                |                   |
| RES-SER-014     | Your request is not successful, please try again later.  |                   |
| RES-SER-015     | Template exception                                       |                   |
| RES-SER-016     | Template subject exception                               |                   |
| RES-SER-017     | Sending notification(Email and SMS) to resident failed.  |                   |
| RES-SER-018     | Invalid individualId                                     |                   |
| RES-SER-020     | Bad Request                                              |                   |
| RES-SER-021     | Invalid APi response                                     |                   |
| RES-SER-023     | Could not find the submitted document                    |                   |
| RES-SER-SYS-001 | System exception occured                                 |                   |
| RES-SER-SYS-002 | IO Exception occured                                     |                   |
| RES-SER-SYS-003 | JSON Processing Exception occured                        |                   |

### POST /resident/v1/req/print-uin

This request will authenticate an Individual based on provided OTP and post a request for UIN re-print to Postal Service. Notification will be sent to phone/email.

#### Resource URL

`https://mosip.io/resident/v1/req/print-uin`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                      | Required | Description                                 | Default Value | Example                              |
| ------------------------- | -------- | ------------------------------------------- | ------------- | ------------------------------------ |
| id                        | Y        | API Id                                      |               | mosip.resident.reprintuin            |
| version                   | Y        | API version                                 |               | v1                                   |
| requestTime               | Y        | Time when Request was captured              |               | 2018-12-09T06:39:04.683Z             |
| request: transactionID    | Y        | Transaction ID of request                   |               | dabed834-974f-11e9-bc42-526af7764f64 |
| request: individualId     | Y        | VID                                         |               | 9830872690593682                     |
| request: individualIdType | Y        | Allowed Type of Individual ID - VID, UIN    | VID           |                                      |
| request: cardType         | Y        | Allowed Type of cardType - MASKED\_UIN, UIN |               |                                      |
| request: otp              | Y        | OTP                                         |               |                                      |

#### Request Body

```
{
  "id": "mosip.resident.reprintuin",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "cardType": "MASKED_UIN",
  "otp": "123456"
  }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.resident.reprintuin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {
	"rid": "770872690593682",
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

**Status Code : 200 (OK)**

**Failed Response**

```
{
  "id": "mosip.resident.reprintuin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

**Status Code : 200 (OK)**

#### Failure details

| Error Code      | Error Message                                            | Error Description |
| --------------- | -------------------------------------------------------- | ----------------- |
| RES-SER-002     | One or more input parameter is invalid or does not exist |                   |
| RES-SER-003     | Token generation failed                                  |                   |
| RES-SER-004     | OTP validation failed                                    |                   |
| RES-SER-005     | API resource is not available                            |                   |
| RES-SER-006     | Unable to access API resource                            |                   |
| RES-SER-009     | Invalid Input Parameter                                  |                   |
| RES-SER-010     | Invalid VID                                              |                   |
| RES-SER-011     | Invalid UIN                                              |                   |
| RES-SER-013     | Invalid UIN for given VID                                |                   |
| RES-SER-014     | Your request is not successful, please try again later.  |                   |
| RES-SER-015     | Template exception                                       |                   |
| RES-SER-016     | Template subject exception                               |                   |
| RES-SER-017     | Sending notification(Email and SMS) to resident failed.  |                   |
| RES-SER-018     | Invalid individualId                                     |                   |
| RES-SER-019     | Re print UIN request failed                              |                   |
| RES-SER-020     | Bad Request                                              |                   |
| RES-SER-021     | Invalid APi response                                     |                   |
| RES-SER-SYS-001 | System exception occured                                 |                   |
| RES-SER-SYS-002 | IO Exception occured                                     |                   |
| RES-SER-SYS-003 | JSON Processing Exception occured                        |                   |

### POST /resident/v1/req/uin

This request will authenticate an Individual based on provided OTP and respond with UIN. Notification will be sent to phone/email.

{% hint style="warning" %}
This API is yet to be developed.
{% endhint %}

#### Resource URL

`https://mosip.io/resident/v1/req/uin`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                      | Required | Description                          | Default Value | Example                              |
| ------------------------- | -------- | ------------------------------------ | ------------- | ------------------------------------ |
| id                        | Y        | API Id                               |               | mosip.resident.lostuin               |
| version                   | Y        | API version                          |               | v1                                   |
| requestTime               | Y        | Time when Request was captured       |               | 2018-12-09T06:39:04.683Z             |
| request: transactionID    | Y        | Transaction ID of request            |               | dabed834-974f-11e9-bc42-526af7764f64 |
| request: individualIdType | Y        | Allowed Type of Individual ID - demo | demo          |                                      |
| request: otp              | Y        | OTP                                  |               |                                      |
| request: demographics     | N        | Demographic data of an Individual    |               |                                      |

#### Request Body

```
{
  "id": "mosip.resident.lostuin",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualIdType": "demo",
  "otp": "123456",
  "demographics": {
      "name": [
        {
          "language": "ara",
          "value": "ابراهيم بن علي"
        },
        {
          "language": "fra",
          "value": "Ibrahim Ibn Ali"
        }
      ],
      "gender": [
        {
          "language": "ara",
          "value": "الذكر"
        },
        {
          "language": "fra",
          "value": "mâle"
        }
      ],
      "postalCode": {
          "type": "10004"
        },
      "phone": {
          "type": "998989989809"
        },
      "email": {
          "type": "abcdefgh@xyz.com"
        }
    }
  }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.resident.lostuin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {
	"uin": "989768897876565",
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

**Status Code : 200 (OK)**

**Failed Response**

```
{
  "id": "mosip.resident.lostuin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

**Status Code : 200 (OK)**

#### Failure details

| Error Code      | Error Message                                            | Error Description |
| --------------- | -------------------------------------------------------- | ----------------- |
| RES-SER-002     | One or more input parameter is invalid or does not exist |                   |
| RES-SER-003     | Token generation failed                                  |                   |
| RES-SER-004     | OTP validation failed                                    |                   |
| RES-SER-005     | API resource is not available                            |                   |
| RES-SER-006     | Unable to access API resource                            |                   |
| RES-SER-009     | Invalid Input Parameter                                  |                   |
| RES-SER-014     | Your request is not successful, please try again later.  |                   |
| RES-SER-015     | Template exception                                       |                   |
| RES-SER-016     | Template subject exception                               |                   |
| RES-SER-017     | Sending notification(Email and SMS) to resident failed.  |                   |
| RES-SER-020     | Bad Request                                              |                   |
| RES-SER-021     | Invalid APi response                                     |                   |
| RES-SER-SYS-001 | System exception occured                                 |                   |
| RES-SER-SYS-002 | IO Exception occured                                     |                   |
| RES-SER-SYS-003 | JSON Processing Exception occured                        |                   |

### POST /resident/v1/req/rid

This request will authenticate an Individual based on provided OTP and respond with RID. Notification will be sent to phone/email.

{% hint style="warning" %}
This API is yet to be developed.
{% endhint %}

#### Resource URL

`https://mosip.io/resident/v1/req/rid`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                      | Required | Description                          | Default Value | Example                              |
| ------------------------- | -------- | ------------------------------------ | ------------- | ------------------------------------ |
| id                        | Y        | API Id                               |               | mosip.resident.lostrid               |
| version                   | Y        | API version                          |               | v1                                   |
| requestTime               | Y        | Time when Request was captured       |               | 2018-12-09T06:39:04.683Z             |
| request: transactionID    | Y        | Transaction ID of request            |               | dabed834-974f-11e9-bc42-526af7764f64 |
| request: individualIdType | Y        | Allowed Type of Individual ID - demo | demo          |                                      |
| request: otp              | Y        | OTP                                  |               |                                      |
| request: demographics     | N        | Demographic data of an Individual    |               |                                      |

#### Request Body

```
{
  "id": "mosip.resident.lostrid",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualIdType": "demo",
  "otp": "123456",
  "demographics": {
      "name": [
        {
          "language": "ara",
          "value": "ابراهيم بن علي"
        },
        {
          "language": "fra",
          "value": "Ibrahim Ibn Ali"
        }
      ],
      "gender": [
        {
          "language": "ara",
          "value": "الذكر"
        },
        {
          "language": "fra",
          "value": "mâle"
        }
      ],
      "postalCode": {
          "type": "10004"
        },
      "phone": {
          "type": "998989989809"
        },
      "email": {
          "type": "abcdefgh@xyz.com"
        }
    }
  }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.resident.lostrid",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {
    "rid": "989768897876565",
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

**Status Code : 200 (OK)**

**Failed Response:**

```
{
  "id": "mosip.resident.lostrid",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

**Status Code : 200 (OK)**

#### Failure details

| Error Code      | Error Message                                            | Error Description |
| --------------- | -------------------------------------------------------- | ----------------- |
| RES-SER-001     | RID not found                                            |                   |
| RES-SER-002     | One or more input parameter is invalid or does not exist |                   |
| RES-SER-003     | Token generation failed                                  |                   |
| RES-SER-004     | OTP validation failed                                    |                   |
| RES-SER-005     | API resource is not available                            |                   |
| RES-SER-006     | Unable to access API resource                            |                   |
| RES-SER-009     | Invalid Input Parameter                                  |                   |
| RES-SER-014     | Your request is not successful, please try again later.  |                   |
| RES-SER-015     | Template exception                                       |                   |
| RES-SER-016     | Template subject exception                               |                   |
| RES-SER-017     | Sending notification(Email and SMS) to resident failed.  |                   |
| RES-SER-020     | Bad Request                                              |                   |
| RES-SER-021     | Invalid APi response                                     |                   |
| RES-SER-SYS-001 | System exception occured                                 |                   |
| RES-SER-SYS-002 | IO Exception occured                                     |                   |
| RES-SER-SYS-003 | JSON Processing Exception occured                        |                   |

### POST /resident/v1/req/update-uin

This request will authenticate an Individual based on provided OTP and respond with RID after successfully placing update request to Registration Processor. Notification will be sent to phone/email.

#### Resource URL

`https://mosip.io/resident/v1/req/update-uin`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                      | Required | Description                              | Default Value | Example                              |
| ------------------------- | -------- | ---------------------------------------- | ------------- | ------------------------------------ |
| id                        | Y        | API Id                                   |               | mosip.resident.uin                   |
| version                   | Y        | API version                              |               | v1                                   |
| requestTime               | Y        | Time when Request was captured           |               | 2018-12-09T06:39:04.683Z             |
| request: transactionID    | Y        | Transaction ID of request                |               | dabed834-974f-11e9-bc42-526af7764f64 |
| request: individualId     | Y        | UIN                                      |               | 9830872690593682                     |
| request: individualIdType | Y        | Allowed Type of Individual ID - VID, UIN | UIN           |                                      |
| request: otp              | Y        | OTP                                      |               |                                      |
| request: demographics     | Y        | Demographic data of an Individual        |               |                                      |

#### Request Body

```
{ 
   "id":"mosip.resident.updateuin",
   "version":"v1",
   "requestTime":"2018-12-09T06:39:04.683Z",
   "request":{ 
      "transactionID":"dabed834-974f-11e9-bc42-526af7764f64",
      "individualId":"9830872690593682",
      "individualIdType":"UIN",
      "otp":"123456",
      "identityJson":"<base64 encoded identity json byte array>",
      "documents":[ 
         { 
            "name":"<document name same as present inside id json>",
            "value":"<base64 encoded document byte array>"
         },
         { 
            "name":"<document name same as present inside id json>",
            "value":"<base64 encoded document byte array>"
         }
      ]
   }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.resident.updateuin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {
    "rid": "989768897876565",
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

**Status Code : 200 (OK)**

**Failed Response**

```
{
  "id": "mosip.resident.uin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

**Status Code : 200 (OK)**

#### Failure details

| Error Code      | Error Message                                            | Error Description |
| --------------- | -------------------------------------------------------- | ----------------- |
| RES-SER-002     | One or more input parameter is invalid or does not exist |                   |
| RES-SER-003     | Token generation failed                                  |                   |
| RES-SER-004     | OTP validation failed                                    |                   |
| RES-SER-005     | API resource is not available                            |                   |
| RES-SER-006     | Unable to access API resource                            |                   |
| RES-SER-009     | Invalid Input Parameter                                  |                   |
| RES-SER-010     | Invalid VID                                              |                   |
| RES-SER-011     | Invalid UIN                                              |                   |
| RES-SER-013     | Invalid UIN for given VID                                |                   |
| RES-SER-014     | Your request is not successful, please try again later.  |                   |
| RES-SER-015     | Template exception                                       |                   |
| RES-SER-016     | Template subject exception                               |                   |
| RES-SER-017     | Sending notification(Email and SMS) to resident failed.  |                   |
| RES-SER-018     | Invalid individualId                                     |                   |
| RES-SER-020     | Bad Request                                              |                   |
| RES-SER-021     | Invalid APi response                                     |                   |
| RES-SER-022     | Resident UIN update failed                               |                   |
| RES-SER-023     | Could not find the submitted document                    |                   |
| RES-SER-SYS-001 | System exception occured                                 |                   |
| RES-SER-SYS-002 | IO Exception occured                                     |                   |
| RES-SER-SYS-003 | JSON Processing Exception occured                        |                   |

### POST /resident/v1/vid

This request will authenticate an Individual based on provided OTP and will generate VID for the respective UIN.

#### Resource URL

`https://mosip.io/resident/v1/vid`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                      | Required | Description                         | Default Value | Example                              |
| ------------------------- | -------- | ----------------------------------- | ------------- | ------------------------------------ |
| id                        | Y        | API Id                              |               | mosip.resident.vid                   |
| version                   | Y        | API version                         |               | v1                                   |
| requestTime               | Y        | Time when Request was captured      |               | 2018-12-09T06:39:04.683Z             |
| request: transactionID    | Y        | Transaction ID of request           |               | dabed834-974f-11e9-bc42-526af7764f64 |
| request: vidType          | Y        | VID Type - PERPETUAL or TEMPORARY   |               |                                      |
| request: individualId     | Y        | UIN                                 |               | 9830872690593682                     |
| request: individualIdType | Y        | Allowed Type of Individual ID - UIN | UIN           |                                      |
| request: otp              | Y        | OTP                                 |               |                                      |

#### Request Body

```
{
  "id": "mosip.resident.vid",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": "9830872690593682",
  "individualIdType": "UIN",
  "otp": "123456",
  "vidType": "PERPETUAL" 
  }
}
```

**Status Code : 200 (OK)**

#### Responses

**Success Response**

```
{
  "id": "mosip.resident.vid",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
   "response": {
    "vid": "989768897876565",
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

**Status Code : 200 (OK)**

**Failed Response**

```
{
  "id": "mosip.resident.vid",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

**Status Code : 200 (OK)**

#### Failure details

| Error Code      | Error Message                                            | Error Description |
| --------------- | -------------------------------------------------------- | ----------------- |
| RES-SER-002     | One or more input parameter is invalid or does not exist |                   |
| RES-SER-003     | Token generation failed                                  |                   |
| RES-SER-004     | OTP validation failed                                    |                   |
| RES-SER-005     | API resource is not available                            |                   |
| RES-SER-006     | Unable to access API resource                            |                   |
| RES-SER-007     | Exception while creating VID                             |                   |
| RES-SER-009     | Invalid Input Parameter                                  |                   |
| RES-SER-011     | Invalid UIN                                              |                   |
| RES-SER-014     | Your request is not successful, please try again later.  |                   |
| RES-SER-015     | Template exception                                       |                   |
| RES-SER-016     | Template subject exception                               |                   |
| RES-SER-017     | Sending notification(Email and SMS) to resident failed.  |                   |
| RES-SER-018     | Invalid individualId                                     |                   |
| RES-SER-020     | Bad Request                                              |                   |
| RES-SER-021     | Invalid APi response                                     |                   |
| RES-SER-022     | Resident UIN update failed                               |                   |
| RES-SER-SYS-001 | System exception occured                                 |                   |
| RES-SER-SYS-002 | IO Exception occured                                     |                   |
| RES-SER-SYS-003 | JSON Processing Exception occured                        |                   |

### PATCH /resident/v1/vid/{vid}

This request will authenticate an Individual based on provided OTP and will revoke respective VID.

#### Resource URL

`https://mosip.io/resident/v1/vid/9830872690593682`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                      | Required | Description                         | Default Value | Example                              |
| ------------------------- | -------- | ----------------------------------- | ------------- | ------------------------------------ |
| id                        | Y        | API Id                              |               | mosip.resident.vidstatus             |
| version                   | Y        | API version                         |               | v1                                   |
| requestTime               | Y        | Time when Request was captured      |               | 2018-12-09T06:39:04.683Z             |
| request: transactionID    | Y        | Transaction ID of request           |               | dabed834-974f-11e9-bc42-526af7764f64 |
| request: vidStatus        | Y        | Status of VID - REVOKED             |               |                                      |
| request: individualId     | Y        | VID                                 |               | 9830872690593682                     |
| request: individualIdType | Y        | Allowed Type of Individual ID - VID | VID           |                                      |
| request: otp              | Y        | OTP                                 |               |                                      |

#### Request Body

```
{
  "id": "mosip.resident.vidstatus",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "otp": "123456",
  "vidStatus": "REVOKED"
  }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.resident.vidstatus",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
   "response": {
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

**Failed Response**

```
{
  "id": "mosip.resident.vidstatus",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

**Status Code : 200 (OK)**

#### Failure details

| Error Code      | Error Message                                            | Error Description |
| --------------- | -------------------------------------------------------- | ----------------- |
| RES-SER-002     | One or more input parameter is invalid or does not exist |                   |
| RES-SER-003     | Token generation failed                                  |                   |
| RES-SER-004     | OTP validation failed                                    |                   |
| RES-SER-005     | API resource is not available                            |                   |
| RES-SER-006     | Unable to access API resource                            |                   |
| RES-SER-009     | Invalid Input Parameter                                  |                   |
| RES-SER-010     | Invalid VID                                              |                   |
| RES-SER-013     | Invalid UIN for given VID                                |                   |
| RES-SER-014     | Your request is not successful, please try again later.  |                   |
| RES-SER-015     | Template exception                                       |                   |
| RES-SER-016     | Template subject exception                               |                   |
| RES-SER-017     | Sending notification(Email and SMS) to resident failed.  |                   |
| RES-SER-018     | Invalid individualId                                     |                   |
| RES-SER-020     | Bad Request                                              |                   |
| RES-SER-021     | Invalid APi response                                     |                   |
| RES-SER-SYS-001 | System exception occured                                 |                   |
| RES-SER-SYS-002 | IO Exception occured                                     |                   |
| RES-SER-SYS-003 | JSON Processing Exception occured                        |                   |

### POST /resident/v1/req/auth-lock

This request will authenticate an Individual based on provided OTP and will lock provided authentication types.

#### Resource URL

`https://mosip.io/resident/v1/req/auth-lock`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                      | Required | Description                                     | Default Value | Example                              |
| ------------------------- | -------- | ----------------------------------------------- | ------------- | ------------------------------------ |
| id                        | Y        | API Id                                          |               | mosip.resident.authlock              |
| version                   | Y        | API version                                     |               | v1                                   |
| requestTime               | Y        | Time when Request was captured                  |               | 2018-12-09T06:39:04.683Z             |
| request: transactionID    | Y        | Transaction ID of request                       |               | dabed834-974f-11e9-bc42-526af7764f64 |
| request: authType         | Y        | Allowed Type - demo,bio,bio-FMR,bio-IIR,bio-FID |               |                                      |
| request: individualId     | Y        | UIN                                             |               | 9830872690593682                     |
| request: individualIdType | Y        | Allowed Type of Individual ID - UIN,VID         | UIN           |                                      |
| request: otp              | Y        | OTP                                             |               |                                      |

#### Request Body

```
{
  "id": "mosip.resident.authlock",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": "9830872690593682",
  "individualIdType": "UIN",
  "otp": "123456",
  "authType": ["bio-FMR","bio-FACE"]
  }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.resident.authlock",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
   "response": {
    "status": "success",
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

**Status Code : 200 (OK)**

**Failed Response**

```
{
  "id": "mosip.resident.authlock",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

**Status Code : 200 (OK)**

#### Failure details

| Error Code      | Error Message                                            | Error Description |
| --------------- | -------------------------------------------------------- | ----------------- |
| RES-SER-002     | One or more input parameter is invalid or does not exist |                   |
| RES-SER-003     | Token generation failed                                  |                   |
| RES-SER-004     | OTP validation failed                                    |                   |
| RES-SER-005     | API resource is not available                            |                   |
| RES-SER-006     | Unable to access API resource                            |                   |
| RES-SER-009     | Invalid Input Parameter                                  |                   |
| RES-SER-010     | Invalid VID                                              |                   |
| RES-SER-011     | Invalid UIN                                              |                   |
| RES-SER-013     | Invalid UIN for given VID                                |                   |
| RES-SER-014     | Your request is not successful, please try again later.  |                   |
| RES-SER-015     | Template exception                                       |                   |
| RES-SER-016     | Template subject exception                               |                   |
| RES-SER-017     | Sending notification(Email and SMS) to resident failed.  |                   |
| RES-SER-018     | Invalid individualId                                     |                   |
| RES-SER-020     | Bad Request                                              |                   |
| RES-SER-021     | Invalid APi response                                     |                   |
| RES-SER-SYS-001 | System exception occured                                 |                   |
| RES-SER-SYS-002 | IO Exception occured                                     |                   |
| RES-SER-SYS-003 | JSON Processing Exception occured                        |                   |

### POST /resident/v1/req/auth-unlock

This request will authenticate an Individual based on provided OTP and will unlock provided locked authentication types.

#### Resource URL

`https://mosip.io/resident/v1/req/auth-unlock`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                      | Required | Description                                    | Default Value | Example                              |
| ------------------------- | -------- | ---------------------------------------------- | ------------- | ------------------------------------ |
| id                        | Y        | API Id                                         |               | mosip.resident.authunlock            |
| version                   | Y        | API version                                    |               | v1                                   |
| requestTime               | Y        | Time when Request was captured                 |               | 2018-12-09T06:39:04.683Z             |
| request: transactionID    | Y        | Transaction ID of request                      |               | dabed834-974f-11e9-bc42-526af7764f64 |
| request: authType         | Y        | Allowed Type -demo,bio,bio-FMR,bio-IIR,bio-FID |               |                                      |
| request: individualId     | Y        | UIN                                            |               | 9830872690593682                     |
| request: individualIdType | Y        | Allowed Type of Individual ID - UIN,VID        | UIN           |                                      |
| request: otp              | Y        | OTP                                            |               |                                      |

#### Request Body

```
{
  "id": "mosip.resident.authunlock",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": "9830872690593682",
  "individualIdType": "UIN",
  "otp": "123456",
  "authType": ["bio-FIR"]
  }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.resident.authunlock",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
   "response": {
    "status": "success",
   "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

**Status Code : 200 (OK)**

**Failed Response**

```
{
  "id": "mosip.resident.authunlock",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

**Status Code : 200 (OK)**

#### Failure details

| Error Code      | Error Message                                            | Error Description |
| --------------- | -------------------------------------------------------- | ----------------- |
| RES-SER-002     | One or more input parameter is invalid or does not exist |                   |
| RES-SER-003     | Token generation failed                                  |                   |
| RES-SER-004     | OTP validation failed                                    |                   |
| RES-SER-005     | API resource is not available                            |                   |
| RES-SER-006     | Unable to access API resource                            |                   |
| RES-SER-009     | Invalid Input Parameter                                  |                   |
| RES-SER-010     | Invalid VID                                              |                   |
| RES-SER-011     | Invalid UIN                                              |                   |
| RES-SER-013     | Invalid UIN for given VID                                |                   |
| RES-SER-014     | Your request is not successful, please try again later.  |                   |
| RES-SER-015     | Template exception                                       |                   |
| RES-SER-016     | Template subject exception                               |                   |
| RES-SER-017     | Sending notification(Email and SMS) to resident failed.  |                   |
| RES-SER-018     | Invalid individualId                                     |                   |
| RES-SER-020     | Bad Request                                              |                   |
| RES-SER-021     | Invalid APi response                                     |                   |
| RES-SER-SYS-001 | System exception occured                                 |                   |
| RES-SER-SYS-002 | IO Exception occured                                     |                   |
| RES-SER-SYS-003 | JSON Processing Exception occured                        |                   |

### POST /resident/v1/req/auth-history

This request will authenticate an Individual based on provided OTP and respond with auth history. Notification will be sent to phone/email.

#### Resource URL

`https://mosip.io/resident/v1/req/auth-history`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                      | Required | Description                             | Default Value | Example                              |
| ------------------------- | -------- | --------------------------------------- | ------------- | ------------------------------------ |
| id                        | Y        | API Id                                  |               | mosip.resident.authhistory           |
| version                   | Y        | API version                             |               | v1                                   |
| requestTime               | Y        | Time when Request was captured          |               | 2018-12-09T06:39:04.683Z             |
| request: transactionID    | Y        | Transaction ID of request               |               | dabed834-974f-11e9-bc42-526af7764f64 |
| request: individualId     | Y        | UIN                                     |               | 9830872690593682                     |
| request: individualIdType | Y        | Allowed Type of Individual ID - UIN,VID | UIN           |                                      |
| request: otp              | Y        | OTP                                     |               |                                      |
| pageStart                 | N        | Optional query param for paging         | 1             |                                      |
| pageFetch                 | N        | Optional query param for paging         | 1             |                                      |

#### Request Body

```
{
  "id": "mosip.resident.authhistory",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": "9830872690593682",
  "individualIdType": "UIN",
  "otp": "123456",
  "pageStart": "1",
   "pageFetch": "1"
  }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.resident.authhistory",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
   "response": {
	"authHistory": [{authDetails1},{authDetails2}],   
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

**Status Code : 200 (OK)**

**Failed Response**

```
{
  "id": "mosip.resident.authhistory",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

**Status Code : 200 (OK)**

#### Failure details

| Error Code      | Error Message                                            | Error Description |
| --------------- | -------------------------------------------------------- | ----------------- |
| RES-SER-002     | One or more input parameter is invalid or does not exist |                   |
| RES-SER-003     | Token generation failed                                  |                   |
| RES-SER-004     | OTP validation failed                                    |                   |
| RES-SER-005     | API resource is not available                            |                   |
| RES-SER-006     | Unable to access API resource                            |                   |
| RES-SER-009     | Invalid Input Parameter                                  |                   |
| RES-SER-010     | Invalid VID                                              |                   |
| RES-SER-011     | Invalid UIN                                              |                   |
| RES-SER-013     | Invalid UIN for given VID                                |                   |
| RES-SER-014     | Your request is not successful, please try again later.  |                   |
| RES-SER-015     | Template exception                                       |                   |
| RES-SER-016     | Template subject exception                               |                   |
| RES-SER-017     | Sending notification(Email and SMS) to resident failed.  |                   |
| RES-SER-018     | Invalid individualId                                     |                   |
| RES-SER-020     | Bad Request                                              |                   |
| RES-SER-021     | Invalid APi response                                     |                   |
| RES-SER-SYS-001 | System exception occured                                 |                   |
| RES-SER-SYS-002 | IO Exception occured                                     |                   |
| RES-SER-SYS-003 | JSON Processing Exception occured                        |                   |
