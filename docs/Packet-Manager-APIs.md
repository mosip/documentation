# Packet Manager APIs

This section details about the REST services in Commons Packet Manager.

## Packet Reader APIs

These APIs are used to read packet from object store:

1. [Get Audits](Packet-Manager-APIs.md#get-audits)
2. [Get Biometrics](Packet-Manager-APIs.md#get-biometrics)
3. [Get Documents](Packet-Manager-APIs.md#get-documents)
4. [Get Meta Info](Packet-Manager-APIs.md#get-meta-info)
5. [Search Field](Packet-Manager-APIs.md#search-field)
6. [Search Fields](Packet-Manager-APIs.md#search-fields)
7. [Validate Packet](Packet-Manager-APIs.md#validate-packet)

### Get Audits

API to fetch the audit details from a packet.

#### Resource URL

`POST https://{base_url}/commons/v1/packetmanager/audits`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                | Required | Description                                         |
| ------------------- | -------- | --------------------------------------------------- |
| id                  | Y        | ID for the API.                                     |
| metadata            | N        | Meta Data for the API.                              |
| requesttime         | Y        | Request time for the API.                           |
| version             | Y        | Version for the API.                                |
| request.bypassCache | Y        | Used to fetch data from cache or from object store. |
| request.id          | Y        | ID of the Packet.                                   |
| request.process     | Y        | Process of the Packet.                              |
| request.source      | Y        | Source of the Packet.                               |

#### Request

```
{
  "id": "mosip.registration.packet.reader",
  "metadata": {},
  "request": {
    "bypassCache": false,
    "id": "10001100773587120201001080850",
    "process": "NEW",
    "source": "REGISTRATION_CLIENT"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "v1"
}
```

#### Response

**Success Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.registration.packet.reader",
  "version": "v1",
  "responsetime": "2020-10-01T09:03:48.569Z",
  "metadata": null,
  "response": [
    {
      "fields": {
        "actionTimeStamp": "2020-07-23T06:47:28.845Z",
        "applicationId": "REGISTRATION1",
        "applicationName": "REGISTRATION",
        "createdAt": "2020-07-23T06:47:28.845Z",
        "createdBy": "REGISTRATION",
        "description": "REGISTRATION",
        "eventId": "REGISTRATION",
        "eventName": "REGISTRATION",
        "eventType": "REGISTRATION",
        "hostIp": "REGISTRATION",
        "hostName": "REGISTRATION",
        "id": "REGISTRATION",
        "idType": "REGISTRATION",
        "moduleId": "string",
        "moduleName": "string",
        "sessionUserId": "string",
        "sessionUserName": "string",
        "uuid": "string"
      }
    }
  ],
  "errors": []
}
```

**Failure Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.registration.packet.reader",
  "version": "v1",
  "responsetime": "2020-10-01T09:05:52.503Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-PUT-006",
      "message": "No available provider for given source and process"
    }
  ]
}
```

#### Failure Details

| Error Code  | Message                                            | Scenario               |
| ----------- | -------------------------------------------------- | ---------------------- |
| KER-ATH-401 | Authentication Failed                              | Authentication Failure |
| KER-PUT-002 | Unable to Find File in Destination Folder          |                        |
| KER-PUT-003 | Packet decryption failed                           |                        |
| KER-PUT-005 | API not accessible                                 |                        |
| KER-PUT-004 | System Exception occured                           |                        |
| KER-PUT-006 | No available provider for given source and process |                        |
| KER-PUT-013 | No Object store adapter found.                     |                        |
| KER-PUT-014 | Packet keeper exception occured.                   |                        |
| KER-PUT-019 | Packet Integrity check failed                      |                        |

### Get Biometrics

API to fetch the biometric details from a packet.

#### Resource URL

`POST https://{base_url}/commons/v1/packetmanager/biometrics`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                | Required                                            | Description                                                                                           |
| ------------------- | --------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| id                  | Y                                                   | ID of the API.                                                                                        |
| metadata            | N                                                   | Metadata of the API.                                                                                  |
| requesttime         | Y                                                   | Request time of the API.                                                                              |
| version             | Y                                                   | Version of the API.                                                                                   |
| request.bypassCache | Used to fetch data from cache or from object store. |                                                                                                       |
| request.id          | Y                                                   | ID of the Packet.                                                                                     |
| request.modalities  | Modalities of biometrics to be fetched.             |                                                                                                       |
| request.person      | Entity for whom the biometrics is to be fetched.    | values can be - individualBiometrics, individualAuthBiometrics, officerBiometric, supervisorBiometric |
| request.process     | Process of the Packet.                              |                                                                                                       |
| request.source      | Source of the Packet.                               |                                                                                                       |

#### Request

```
{
  "id": "mosip.registration.packet.reader",
  "metadata": {},
  "request": {
    "person": "individualBiometrics",
    "bypassCache": true,
    "id": "10001100770000320200720092256",
    "modalities": null,
    "process": "NEW",
    "source": "REGISTRATION_CLIENT"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

#### Response

**Success Response**

**Response Code : 200 (OK)**

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-07-22T15:17:01.481Z",
  "metadata": null,
  "response": {
    "version": null,
    "cbeffversion": null,
    "birInfo": null,
    "segments": [
      {
        "version": {
          "major": 1,
          "minor": 1
        },
        "cbeffversion": {
          "major": 1,
          "minor": 1
        },
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": "f310da6a-797b-45d8-b3a5-d1cfe8f0329e",
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.904",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "IRIS"
          ],
          "subtype": [
            "Left"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "9"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "others": null
      },
      {
        "version": {
          "major": 1,
          "minor": 1
        },
        "cbeffversion": {
          "major": 1,
          "minor": 1
        },
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": "94c78e40-1f5c-41a3-8423-08e6f86965f1",
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "IRIS"
          ],
          "subtype": [
            "Right"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "9"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "others": null
      },
      {
        "version": {
          "major": 1,
          "minor": 1
        },
        "cbeffversion": {
          "major": 1,
          "minor": 1
        },
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": "b2968543-ae0e-4036-8038-790fb11aebbd",
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Right",
            "IndexFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "others": null
      },
      {
        "version": {
          "major": 1,
          "minor": 1
        },
        "cbeffversion": {
          "major": 1,
          "minor": 1
        },
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": "4fa613de-6d09-4955-a554-885e918edc86",
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Right",
            "LittleFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "others": null
      },
      {
        "version": {
          "major": 1,
          "minor": 1
        },
        "cbeffversion": {
          "major": 1,
          "minor": 1
        },
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": "9187d8d7-64db-40b4-ba27-3640f9c715e0",
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Right",
            "RingFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "others": null
      },
      {
        "version": {
          "major": 1,
          "minor": 1
        },
        "cbeffversion": {
          "major": 1,
          "minor": 1
        },
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": "e6941ad4-d606-420e-9ac0-4544f2db590d",
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Right",
            "MiddleFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "others": null
      },
      {
        "version": {
          "major": 1,
          "minor": 1
        },
        "cbeffversion": {
          "major": 1,
          "minor": 1
        },
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": "b472b350-083f-412e-80d9-b9dae865ac74",
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Left",
            "IndexFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "others": null
      },
      {
        "version": {
          "major": 1,
          "minor": 1
        },
        "cbeffversion": {
          "major": 1,
          "minor": 1
        },
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": "dc8f4f8d-72db-4393-92b8-3bfd261d501f",
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Left",
            "LittleFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "others": null
      },
      {
        "version": {
          "major": 1,
          "minor": 1
        },
        "cbeffversion": {
          "major": 1,
          "minor": 1
        },
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": "1d180682-bda9-4fe8-bec9-adf45544c932",
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Left",
            "RingFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "others": null
      },
      {
        "version": {
          "major": 1,
          "minor": 1
        },
        "cbeffversion": {
          "major": 1,
          "minor": 1
        },
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": "7d43c3b1-0667-498a-8a24-81f985591bb4",
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Left",
            "MiddleFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "others": null
      },
      {
        "version": {
          "major": 1,
          "minor": 1
        },
        "cbeffversion": {
          "major": 1,
          "minor": 1
        },
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": "50d6e8ac-9393-43f2-b7bd-524480602812",
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Left",
            "Thumb"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "others": null
      },
      {
        "version": {
          "major": 1,
          "minor": 1
        },
        "cbeffversion": {
          "major": 1,
          "minor": 1
        },
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": "927c10eb-4a39-4250-97db-3b75f7c791d8",
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Right",
            "Thumb"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "others": null
      },
      {
        "version": {
          "major": 1,
          "minor": 1
        },
        "cbeffversion": {
          "major": 1,
          "minor": 1
        },
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": "542bea75-350d-4bd8-8067-b01f806d9d8d",
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FACE"
          ],
          "subtype": [],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "8"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "others": null
      }
    ]
  },
  "errors": []
}
```

**Failure Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.registration.packet.reader",
  "version": "v1",
  "responsetime": "2020-10-01T09:05:52.503Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-PUT-006",
      "message": "No available provider for given source and process"
    }
  ]
}
```

#### Failure Details

| Error Code  | Message                                               | Scenario               |
| ----------- | ----------------------------------------------------- | ---------------------- |
| KER-ATH-401 | Authentication Failed                                 | Authentication Failure |
| KER-PUT-002 | Unable to Find File in Destination Folder             |                        |
| KER-PUT-003 | Packet decryption failed                              |                        |
| KER-PUT-005 | API not accessible                                    |                        |
| KER-PUT-004 | System Exception occured                              |                        |
| KER-PUT-006 | No available provider for given source and process    |                        |
| KER-PUT-013 | No Object store adapter found.                        |                        |
| KER-PUT-014 | Packet keeper exception occured.                      |                        |
| KER-PUT-019 | Packet Integrity check failed                         |                        |
| KER-PUT-007 | Biometric fieldname is not present inside packet      |                        |
| KER-PUT-005 | Unable to fetch identity json from all sub packets    |                        |
| KER-PUT-008 | Unable to fetch meta information from all sub packets |                        |

### Get Documents

#### Resource URL

`POST https://{base_url}/commons/v1/packetmanager/document`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                 | Required | Description                                                  |
| -------------------- | -------- | ------------------------------------------------------------ |
| id                   | Y        | ID of the API.                                               |
| metadata             | N        | Metadata of the API.                                         |
| requesttime          | Y        | Request time of the API.                                     |
| version              | Y        | Version of the API.                                          |
| request.documentName | Y        | Name of the document to be fetched. Example - proofOfAddress |
| request.id           | Y        | ID of the Packet.                                            |
| request.process      | Y        | Process of the Packet.                                       |
| request.source       | Y        | Source of the Packet.                                        |

#### Request

```
{
  "id": "mosip.registration.packet.reader",
  "metadata": {},
  "request": {
    "documentName": "proofOfAddress",
    "id": "10001100770000320200720092256",
    "process": "NEW",
    "source": "REGISTRATION_CLIENT"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "v1"
}
```

#### Response

**Success Response**

**Response Code : 200 (OK)**

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-07-22T15:13:48.061Z",
  "metadata": null,
  "response": {
    "document": "<DOCUMENT BYTES>",
    "value": "proofOfAddress",
    "type": "DOC004",
    "format": "jpg"
  },
  "errors": []
}
```

**Failure Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.registration.packet.reader",
  "version": "v1",
  "responsetime": "2020-10-01T09:05:52.503Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-PUT-006",
      "message": "No available provider for given source and process"
    }
  ]
}
```

#### Failure Details

| Error Code  | Message                                               | Scenario               |
| ----------- | ----------------------------------------------------- | ---------------------- |
| KER-ATH-401 | Authentication Failed                                 | Authentication Failure |
| KER-PUT-002 | Unable to Find File in Destination Folder             |                        |
| KER-PUT-003 | Packet decryption failed                              |                        |
| KER-PUT-005 | API not accessible                                    |                        |
| KER-PUT-004 | System Exception occured                              |                        |
| KER-PUT-006 | No available provider for given source and process    |                        |
| KER-PUT-013 | No Object store adapter found.                        |                        |
| KER-PUT-014 | Packet keeper exception occured.                      |                        |
| KER-PUT-019 | Packet Integrity check failed                         |                        |
| KER-PUT-005 | Unable to fetch identity json from all sub packets    |                        |
| KER-PUT-008 | Unable to fetch meta information from all sub packets |                        |
| KER-PUT-011 | Failed to get document                                |                        |

### Get Meta Info

#### Resource URL

`POST https://{base_url}/commons/v1/packetmanager/metaInfo`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                | Required | Description                                         |
| ------------------- | -------- | --------------------------------------------------- |
| id                  | Y        | ID of the API.                                      |
| metadata            | N        | Metadata of the API.                                |
| requesttime         | Y        | Request time of the API.                            |
| version             | Y        | Version of the API.                                 |
| request.bypassCache | Y        | Used to fetch data from cache or from object store. |
| request.id          | Y        | ID of the Packet.                                   |
| request.process     | Y        | Process of the Packet.                              |
| request.source      | Y        | Source of the Packet.                               |

#### Request

```
{
  "id": "mosip.registration.packet.reader",
  "metadata": {},
  "request": {
    "bypassCache": false,
    "id": "10001100770000320200720092256",
    "process": "NEW",
    "source": "REGISTRATION_CLIENT"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "v1"
}
```

#### Response

**Success Response**

**Response Code : 200 (OK)**

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-07-22T15:15:27.791Z",
  "metadata": null,
  "response": {
    "fields": {
      "biometrics": "{\r\n  \"applicant\" : {\r\n    \"leftEye\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"f310da6a-797b-45d8-b3a5-d1cfe8f0329e\"\r\n    },\r\n    \"rightIndex\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"b2968543-ae0e-4036-8038-790fb11aebbd\"\r\n    },\r\n    \"rightLittle\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"4fa613de-6d09-4955-a554-885e918edc86\"\r\n    },\r\n    \"leftLittle\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"dc8f4f8d-72db-4393-92b8-3bfd261d501f\"\r\n    },\r\n    \"leftIndex\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"b472b350-083f-412e-80d9-b9dae865ac74\"\r\n    },\r\n    \"face\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"542bea75-350d-4bd8-8067-b01f806d9d8d\"\r\n    },\r\n    \"rightEye\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"94c78e40-1f5c-41a3-8423-08e6f86965f1\"\r\n    },\r\n    \"rightThumb\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"927c10eb-4a39-4250-97db-3b75f7c791d8\"\r\n    },\r\n    \"rightRing\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"9187d8d7-64db-40b4-ba27-3640f9c715e0\"\r\n    },\r\n    \"rightMiddle\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"e6941ad4-d606-420e-9ac0-4544f2db590d\"\r\n    },\r\n    \"leftRing\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"1d180682-bda9-4fe8-bec9-adf45544c932\"\r\n    },\r\n    \"leftThumb\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"50d6e8ac-9393-43f2-b7bd-524480602812\"\r\n    },\r\n    \"leftMiddle\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"7d43c3b1-0667-498a-8a24-81f985591bb4\"\r\n    }\r\n  }\r\n}",
      "exceptionBiometrics": "[ ]",
      "documents": "[ {\r\n  \"documentName\" : \"proofOfAddress\",\r\n  \"documentCategory\" : \"POA\",\r\n  \"documentOwner\" : \"Applicant\",\r\n  \"documentType\" : \"DOC004\"\r\n}, {\r\n  \"documentName\" : \"proofOfIdentity\",\r\n  \"documentCategory\" : \"POI\",\r\n  \"documentOwner\" : \"Applicant\",\r\n  \"documentType\" : \"DOC003\"\r\n} ]",
      "metaData": "[ {\r\n  \"label\" : \"registrationId\",\r\n  \"value\" : \"10001100770000320200720092256\"\r\n}, {\r\n  \"label\" : \"creationDate\",\r\n  \"value\" : \"2020-07-20T14:54:49.823Z\"\r\n}, {\r\n  \"label\" : \"Registration Client Version Number\",\r\n  \"value\" : \"1.0.10-rc2\"\r\n}, {\r\n  \"label\" : \"registrationType\",\r\n  \"value\" : \"New\"\r\n}, {\r\n  \"label\" : \"preRegistrationId\",\r\n  \"value\" : null\r\n}, {\r\n  \"label\" : \"machineId\",\r\n  \"value\" : \"10077\"\r\n}, {\r\n  \"label\" : \"centerId\",\r\n  \"value\" : \"10001\"\r\n}, {\r\n  \"label\" : \"dongleId\",\r\n  \"value\" : null\r\n}, {\r\n  \"label\" : \"keyIndex\",\r\n  \"value\" : \"4F:38:72:D9:F8:DB:94:E7:22:48:96:D0:91:01:6D:3C:64:90:2E:14:DC:D2:F8:14:1F:2A:A4:19:1A:BC:91:41\"\r\n}, {\r\n  \"label\" : \"consentOfApplicant\",\r\n  \"value\" : \"Yes\"\r\n} ]",
      "operationsData": "[ {\r\n  \"label\" : \"officerId\",\r\n  \"value\" : \"110122\"\r\n}, {\r\n  \"label\" : \"officerBiometricFileName\",\r\n  \"value\" : null\r\n}, {\r\n  \"label\" : \"supervisorId\",\r\n  \"value\" : null\r\n}, {\r\n  \"label\" : \"supervisorBiometricFileName\",\r\n  \"value\" : null\r\n}, {\r\n  \"label\" : \"supervisorPassword\",\r\n  \"value\" : \"false\"\r\n}, {\r\n  \"label\" : \"officerPassword\",\r\n  \"value\" : \"true\"\r\n}, {\r\n  \"label\" : \"supervisorPIN\",\r\n  \"value\" : null\r\n}, {\r\n  \"label\" : \"officerPIN\",\r\n  \"value\" : null\r\n}, {\r\n  \"label\" : \"supervisorOTPAuthentication\",\r\n  \"value\" : \"false\"\r\n}, {\r\n  \"label\" : \"officerOTPAuthentication\",\r\n  \"value\" : \"false\"\r\n} ]",
      "hashSequence1": "[ {\r\n  \"label\" : \"biometricSequence\",\r\n  \"value\" : [ \"individualBiometrics_bio_CBEFF\" ]\r\n}, {\r\n  \"label\" : \"demographicSequence\",\r\n  \"value\" : [ \"proofOfAddress\", \"proofOfIdentity\", \"ID\" ]\r\n} ]",
      "hashSequence2": "[ {\r\n  \"label\" : \"otherFiles\",\r\n  \"value\" : [ \"audit\" ]\r\n} ]",
      "capturedRegisteredDevices": "[ ]",
      "capturedNonRegisteredDevices": null,
      "checkSum": "[ {\r\n  \"label\" : \"mosip-client.jar\",\r\n  \"value\" : \"3BD4FDE4F7E6BFF03ED0E2E735825DF07C9C2C3FF91C0A344F7E72C5378126E4\"\r\n}, {\r\n  \"label\" : \"mosip-services.jar\",\r\n  \"value\" : \"02E72AA598FAE10C2097DBDA241A48245806F524735A12A26CC5D4986206A22C\"\r\n} ]",
      "printingName": "[ ]"
    }
  },
  "errors": []
}
```

**Failure Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.registration.packet.reader",
  "version": "v1",
  "responsetime": "2020-10-01T09:05:52.503Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-PUT-006",
      "message": "No available provider for given source and process"
    }
  ]
}
```

#### Failure Details

| Error Code  | Message                                               | Scenario               |
| ----------- | ----------------------------------------------------- | ---------------------- |
| KER-ATH-401 | Authentication Failed                                 | Authentication Failure |
| KER-PUT-002 | Unable to Find File in Destination Folder             |                        |
| KER-PUT-003 | Packet decryption failed                              |                        |
| KER-PUT-005 | API not accessible                                    |                        |
| KER-PUT-004 | System Exception occured                              |                        |
| KER-PUT-006 | No available provider for given source and process    |                        |
| KER-PUT-013 | No Object store adapter found.                        |                        |
| KER-PUT-014 | Packet keeper exception occured.                      |                        |
| KER-PUT-019 | Packet Integrity check failed                         |                        |
| KER-PUT-005 | Unable to fetch identity json from all sub packets    |                        |
| KER-PUT-008 | Unable to fetch meta information from all sub packets |                        |

### Search Field

#### Resource URL

`POST https://{base_url}/commons/v1/packetmanager/searchField`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                | Required | Description                                         |
| ------------------- | -------- | --------------------------------------------------- |
| id                  | Y        | ID of the API.                                      |
| metadata            | N        | Metadata of the API.                                |
| requesttime         | Y        | Request time of the API.                            |
| version             | Y        | Version of the API.                                 |
| request.bypassCache | Y        | Used to fetch data from cache or from object store. |
| request.field       | Y        | Field Name for which data needs to be fetched.      |
| request.id          | Y        | ID of the Packet.                                   |
| request.process     | Y        | Process of the Packet.                              |
| request.source      | Y        | Source of the Packet.                               |

#### Request

```
{
  "id": "mosip.registration.packet.reader",
  "metadata": {},
  "request": {
    "bypassCache": false,
    "field": "fullName",
    "id": "10001100770000320200720092256",
    "process": "NEW",
    "source": "REGISTRATION_CLIENT"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "v1"
}
```

#### Response

**Success Response**

**Response Code : 200 (OK)**

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-07-22T15:09:27.742Z",
  "metadata": null,
  "response": {
    "fields": {
      "fullName": "[ {\r\n  \"language\" : \"eng\",\r\n  \"value\" : \"Test after fix\"\r\n}, {\r\n  \"language\" : \"ara\",\r\n  \"value\" : \"Test after fix\"\r\n} ]"
    }
  },
  "errors": []
}
```

**Failure Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.registration.packet.reader",
  "version": "v1",
  "responsetime": "2020-10-01T09:05:52.503Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-PUT-006",
      "message": "No available provider for given source and process"
    }
  ]
}
```

#### Failure Details

| Error Code  | Message                                            | Scenario               |
| ----------- | -------------------------------------------------- | ---------------------- |
| KER-ATH-401 | Authentication Failed                              | Authentication Failure |
| KER-PUT-002 | Unable to Find File in Destination Folder          |                        |
| KER-PUT-003 | Packet decryption failed                           |                        |
| KER-PUT-005 | API not accessible                                 |                        |
| KER-PUT-004 | System Exception occured                           |                        |
| KER-PUT-006 | No available provider for given source and process |                        |
| KER-PUT-013 | No Object store adapter found.                     |                        |
| KER-PUT-014 | Packet keeper exception occured.                   |                        |
| KER-PUT-019 | Packet Integrity check failed                      |                        |
| KER-PUT-005 | Unable to fetch identity json from all sub packets |                        |

### Search Fields

#### Resource URL

`POST https://{base_url}/commons/v1/packetmanager/searchFields`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                | Required | Description                                         |
| ------------------- | -------- | --------------------------------------------------- |
| id                  | Y        | ID of the API.                                      |
| metadata            | Y        | Metadata of the API.                                |
| requesttime         | Y        | Request time of the API.                            |
| version             | Y        | Version of the API.                                 |
| request.bypassCache | Y        | Used to fetch data from cache or from object store. |
| request.fields      | Y        | List of fields to be fetched.                       |
| request.id          | Y        | ID of the Packet.                                   |
| request.process     | Y        | Process of the Packet.                              |
| request.source      | Y        | Source of the Packet.                               |

#### Request

```
{
  "id": "mosip.registration.packet.reader",
  "metadata": {},
  "request": {
    "bypassCache": false,
    "fields": [
      "fullName", "gender"
    ],
    "id": "10001100770000320200720092256",
    "process": "NEW",
    "source": "REGISTRATION_CLIENT"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "v1"
}
```

#### Response

**Success Response**

**Response Code : 200 (OK)**

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-07-22T15:11:46.435Z",
  "metadata": null,
  "response": {
    "fields": {
      "proofOfAddress": "{\r\n  \"value\" : \"proofOfAddress\",\r\n  \"type\" : \"DOC004\",\r\n  \"format\" : \"jpg\"\r\n}",
      "fullName": "[ {\r\n  \"language\" : \"eng\",\r\n  \"value\" : \"Test after fix\"\r\n}, {\r\n  \"language\" : \"ara\",\r\n  \"value\" : \"Test after fix\"\r\n} ]"
    }
  },
  "errors": []
}
```

**Failure Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.registration.packet.reader",
  "version": "v1",
  "responsetime": "2020-10-01T09:05:52.503Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-PUT-006",
      "message": "No available provider for given source and process"
    }
  ]
}
```

#### Failure Details

| Error Code  | Message                                            | Scenario               |
| ----------- | -------------------------------------------------- | ---------------------- |
| KER-ATH-401 | Authentication Failed                              | Authentication Failure |
| KER-PUT-002 | Unable to Find File in Destination Folder          |                        |
| KER-PUT-003 | Packet decryption failed                           |                        |
| KER-PUT-005 | API not accessible                                 |                        |
| KER-PUT-004 | System Exception occured                           |                        |
| KER-PUT-006 | No available provider for given source and process |                        |
| KER-PUT-013 | No Object store adapter found.                     |                        |
| KER-PUT-014 | Packet keeper exception occured.                   |                        |
| KER-PUT-019 | Packet Integrity check failed                      |                        |
| KER-PUT-005 | Unable to fetch identity json from all sub packets |                        |

### Validate Packet

#### Resource URL

`POST https://{base_url}/commons/v1/packetmanager/validatePacket`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                | Required | Description                                         |
| ------------------- | -------- | --------------------------------------------------- |
| id                  | Y        | ID of the API.                                      |
| metadata            | N        | Metadata of the API.                                |
| requesttime         | Y        | Request time of the API.                            |
| version             | Y        | Version of the API.                                 |
| request.bypassCache | Y        | Used to fetch data from cache or from object store. |
| request.id          | Y        | ID of the Packet.                                   |
| request.process     | Y        | Process of the Packet.                              |
| request.source      | Y        | Source of the Packet.                               |

#### Request

```
{
  "id": "mosip.registration.packet.reader",
  "metadata": {},
  "request": {
    "bypassCache": false,
    "id": "10001100773587120201001080850",
    "process": "NEW",
    "source": "REGISTRATION_CLIENT"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "v1"
}
```

#### Response

**Success Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.registration.packet.reader",
  "version": "v1",
  "responsetime": "2020-10-01T09:51:40.444Z",
  "metadata": null,
  "response": {
    "valid": true
  },
  "errors": []
}
```

**Failure Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.registration.packet.reader",
  "version": "v1",
  "responsetime": "2020-10-01T09:05:52.503Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-PUT-006",
      "message": "No available provider for given source and process"
    }
  ]
}
```

#### Failure Details

| Error Code  | Message                                               | Scenario               |
| ----------- | ----------------------------------------------------- | ---------------------- |
| KER-ATH-401 | Authentication Failed                                 | Authentication Failure |
| KER-PUT-002 | Unable to Find File in Destination Folder             |                        |
| KER-PUT-003 | Packet decryption failed                              |                        |
| KER-PUT-005 | API not accessible                                    |                        |
| KER-PUT-004 | System Exception occured                              |                        |
| KER-PUT-006 | No available provider for given source and process    |                        |
| KER-PUT-013 | No Object store adapter found.                        |                        |
| KER-PUT-014 | Packet keeper exception occured.                      |                        |
| KER-PUT-019 | Packet Integrity check failed                         |                        |
| KER-PUT-005 | Unable to fetch identity json from all sub packets    |                        |
| KER-PUT-008 | Unable to fetch meta information from all sub packets |                        |

## Packet Writer API

This service is used to create registration packet and store it in object-store.

### Create Packet

#### Resource URL

`PUT https://{base_url}/commons/v1/packetmanager/createPacket`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                  | Required | Description                                          |
| --------------------- | -------- | ---------------------------------------------------- |
| id                    | Y        | ID of the API.                                       |
| metadata              | N        | Metadata of the API.                                 |
| requesttime           | Y        | Request time of the API.                             |
| version               | Y        | Version of the API.                                  |
| request.audits        | Y        | Audit trail of the Packet in key-value pair.         |
| request.biometrics    | N        | Biometrics of the Packet.                            |
| request.documents     | N        | Documents of the Packet.                             |
| request.id            | Y        | ID of the packet.                                    |
| request.fields        | Y        | Fields of the Packet in key-value pair.              |
| request.metaInfo      | Y        | Metainfo of the Packet in key-value pair.            |
| request.schemaJson    | Y        | Schema JSON to use inorder to create the Packet.     |
| request.schemaVersion | Y        | Schema Version to use inorder to create the Packet.  |
| request.process       | Y        | Process of the Packet. Example - NEW/UPDATE/LOST     |
| request.source        | Y        | Source of the Packet. Example - REGISTRATION\_CLIENT |

#### Request

```
{
  "id": "mosip.registration.packet.writer",
  "metadata": {},
  "request": {
    "audits": [
      {
        "actionTimeStamp": "2020-07-23T06:47:28.845Z",
        "applicationId": "REGISTRATION",
        "applicationName": "REGISTRATION",
        "createdAt": "2020-07-23T06:47:28.845Z",
        "createdBy": "REGISTRATION",
        "description": "REGISTRATION",
        "eventId": "REGISTRATION",
        "eventName": "REGISTRATION",
        "eventType": "REGISTRATION",
        "hostIp": "REGISTRATION",
        "hostName": "REGISTRATION",
        "id": "REGISTRATION",
        "idType": "REGISTRATION",
        "moduleId": "string",
        "moduleName": "string",
        "sessionUserId": "string",
        "sessionUserName": "string",
        "uuid": "string"
      }
    ],
    "biometrics": {
      "individualBiometrics": {
    "version": null,
    "cbeffversion": null,
    "birInfo": null,
    "segments": [
      {
        "version": null,
        "cbeffversion": null,
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": null,
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.904",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "IRIS"
          ],
          "subtype": [
            "Left"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "9"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "element": null
      },
      {
        "version": null,
        "cbeffversion": null,
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": null,
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "IRIS"
          ],
          "subtype": [
            "Right"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "9"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "element": null
      },
      {
        "version": null,
        "cbeffversion": null,
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": null,
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Right",
            "IndexFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "element": null
      },
      {
        "version": null,
        "cbeffversion": null,
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": null,
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Right",
            "LittleFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "element": null
      },
      {
        "version": null,
        "cbeffversion": null,
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": null,
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Right",
            "RingFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "element": null
      },
      {
        "version": null,
        "cbeffversion": null,
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": null,
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Right",
            "MiddleFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "element": null
      },
      {
        "version": null,
        "cbeffversion": null,
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": null,
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Left",
            "IndexFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "element": null
      },
      {
        "version": null,
        "cbeffversion": null,
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": null,
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Left",
            "LittleFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "element": null
      },
      {
        "version": null,
        "cbeffversion": null,
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": null,
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Left",
            "RingFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "element": null
      },
      {
        "version": null,
        "cbeffversion": null,
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": null,
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Left",
            "MiddleFinger"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "element": null
      },
      {
        "version": null,
        "cbeffversion": null,
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": null,
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Left",
            "Thumb"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "element": null
      },
      {
        "version": null,
        "cbeffversion": null,
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": null,
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FINGER"
          ],
          "subtype": [
            "Right",
            "Thumb"
          ],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "7"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "element": null
      },
      {
        "version": null,
        "cbeffversion": null,
        "birInfo": {
          "creator": null,
          "index": null,
          "payload": null,
          "integrity": false,
          "creationDate": null,
          "notValidBefore": null,
          "notValidAfter": null
        },
        "bdbInfo": {
          "challengeResponse": null,
          "index": null,
          "encryption": null,
          "creationDate": "2020-07-20T09:24:49.905",
          "notValidBefore": null,
          "notValidAfter": null,
          "type": [
            "FACE"
          ],
          "subtype": [],
          "level": "RAW",
          "product": null,
          "purpose": "ENROLL",
          "quality": {
            "algorithm": {
              "organization": "HMAC",
              "type": "SHA-256"
            },
            "score": 90,
            "qualityCalculationFailed": null
          },
          "format": {
            "organization": "Mosip",
            "type": "8"
          },
          "captureDevice": null,
          "featureExtractionAlgorithm": null,
          "comparisonAlgorithm": null,
          "compressionAlgorithm": null
        },
        "bdb": "<BASE64 ENCODED ISO BYTES>",
        "sb": null,
        "sbInfo": null,
        "element": null
      }
    ]
  }
    },
    "documents": {
      "proofOfAddress": {
    "document": "<DOCUMENT BYTES>",
    "value": "proofOfAddress",
    "type": "DOC004",
    "format": "jpg"
  },
  "proofOfIdentity": {
    "document": "<DOCUMENT BYTES>",
    "value": "proofOfIdentity",
    "type": "DOC004",
    "format": "jpg"
  }
    },
    "fields": {
      "proofOfAddress": "{\r\n  \"value\" : \"proofOfAddress\",\r\n  \"type\" : \"DOC004\",\r\n  \"format\" : \"jpg\"\r\n}",
"gender": "[ {\r\n  \"language\" : \"eng\",\r\n  \"value\" : \"Male\"\r\n}, {\r\n  \"language\" : \"ara\",\r\n  \"value\" : \"الذكر\"\r\n} ]",
"city": "[ {\r\n  \"language\" : \"eng\",\r\n  \"value\" : \"Kenitra\"\r\n}, {\r\n  \"language\" : \"ara\",\r\n  \"value\" : \"القنيطرة\"\r\n} ]",
"postalCode": "14000",
"fullName": "[ {\r\n  \"language\" : \"eng\",\r\n  \"value\" : \"Test after fix\"\r\n}, {\r\n  \"language\" : \"ara\",\r\n  \"value\" : \"Test after fix\"\r\n} ]",
"dateOfBirth": "1976/01/01",
"referenceIdentityNumber": "2345235252352353523",
"individualBiometrics": "{\r\n  \"format\" : \"cbeff\",\r\n  \"version\" : 1.0,\r\n  \"value\" : \"individualBiometrics_bio_CBEFF\"\r\n}",
"proofOfIdentity": "{\r\n  \"value\" : \"proofOfIdentity\",\r\n  \"type\" : \"DOC003\",\r\n  \"format\" : \"jpg\"\r\n}",
"IDSchemaVersion": 0.1,
"province": "[ {\r\n  \"language\" : \"eng\",\r\n  \"value\" : \"Kenitra\"\r\n}, {\r\n  \"language\" : \"ara\",\r\n  \"value\" : \"القنيطرة\"\r\n} ]",
"zone": "[ {\r\n  \"language\" : \"eng\",\r\n  \"value\" : \"Assam\"\r\n}, {\r\n  \"language\" : \"ara\",\r\n  \"value\" : \"العصام\"\r\n} ]",
"phone": "9606139887",
"addressLine1": "[ {\r\n  \"language\" : \"eng\",\r\n  \"value\" : \"asdadsfas\"\r\n}, {\r\n  \"language\" : \"ara\",\r\n  \"value\" : \"asdadsfas\"\r\n} ]",
"addressLine2": "[ {\r\n  \"language\" : \"eng\",\r\n  \"value\" : \"qqwqrqwrw\"\r\n}, {\r\n  \"language\" : \"ara\",\r\n  \"value\" : \"qqwqrqwrw\"\r\n} ]",
"residenceStatus": "[ {\r\n  \"language\" : \"eng\",\r\n  \"value\" : \"Non-Foreigner\"\r\n}, {\r\n  \"language\" : \"ara\",\r\n  \"value\" : \"غير أجنبي\"\r\n} ]",
"addressLine3": "[ {\r\n  \"language\" : \"eng\",\r\n  \"value\" : \"wfwfwef\"\r\n}, {\r\n  \"language\" : \"ara\",\r\n  \"value\" : \"wfwfwef\"\r\n} ]",
"region": "[ {\r\n  \"language\" : \"eng\",\r\n  \"value\" : \"Rabat Sale Kenitra\"\r\n}, {\r\n  \"language\" : \"ara\",\r\n  \"value\" : \"جهة الرباط سلا القنيطرة\"\r\n} ]",
"email": "niyati.swami@technoforte.co.in"
    },
    "id": "10001100770000320200921092256",
    "metaInfo": {
      "biometrics": "{\r\n  \"applicant\" : {\r\n    \"leftEye\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"f310da6a-797b-45d8-b3a5-d1cfe8f0329e\"\r\n    },\r\n    \"rightIndex\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"b2968543-ae0e-4036-8038-790fb11aebbd\"\r\n    },\r\n    \"rightLittle\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"4fa613de-6d09-4955-a554-885e918edc86\"\r\n    },\r\n    \"leftLittle\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"dc8f4f8d-72db-4393-92b8-3bfd261d501f\"\r\n    },\r\n    \"leftIndex\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"b472b350-083f-412e-80d9-b9dae865ac74\"\r\n    },\r\n    \"face\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"542bea75-350d-4bd8-8067-b01f806d9d8d\"\r\n    },\r\n    \"rightEye\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"94c78e40-1f5c-41a3-8423-08e6f86965f1\"\r\n    },\r\n    \"rightThumb\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"927c10eb-4a39-4250-97db-3b75f7c791d8\"\r\n    },\r\n    \"rightRing\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"9187d8d7-64db-40b4-ba27-3640f9c715e0\"\r\n    },\r\n    \"rightMiddle\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"e6941ad4-d606-420e-9ac0-4544f2db590d\"\r\n    },\r\n    \"leftRing\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"1d180682-bda9-4fe8-bec9-adf45544c932\"\r\n    },\r\n    \"leftThumb\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"50d6e8ac-9393-43f2-b7bd-524480602812\"\r\n    },\r\n    \"leftMiddle\" : {\r\n      \"numRetry\" : 1,\r\n      \"forceCaptured\" : false,\r\n      \"BIRIndex\" : \"7d43c3b1-0667-498a-8a24-81f985591bb4\"\r\n    }\r\n  }\r\n}",
      "exceptionBiometrics": "[ ]",
      "documents": "[ {\r\n  \"documentName\" : \"proofOfAddress\",\r\n  \"documentCategory\" : \"POA\",\r\n  \"documentOwner\" : \"Applicant\",\r\n  \"documentType\" : \"DOC004\"\r\n}, {\r\n  \"documentName\" : \"proofOfIdentity\",\r\n  \"documentCategory\" : \"POI\",\r\n  \"documentOwner\" : \"Applicant\",\r\n  \"documentType\" : \"DOC003\"\r\n} ]",
      "metaData": "[ {\r\n  \"label\" : \"registrationId\",\r\n  \"value\" : \"10001100770000320200720092256\"\r\n}, {\r\n  \"label\" : \"creationDate\",\r\n  \"value\" : \"2020-07-20T14:54:49.823Z\"\r\n}, {\r\n  \"label\" : \"Registration Client Version Number\",\r\n  \"value\" : \"1.0.10-rc2\"\r\n}, {\r\n  \"label\" : \"registrationType\",\r\n  \"value\" : \"New\"\r\n}, {\r\n  \"label\" : \"preRegistrationId\",\r\n  \"value\" : null\r\n}, {\r\n  \"label\" : \"machineId\",\r\n  \"value\" : \"10077\"\r\n}, {\r\n  \"label\" : \"centerId\",\r\n  \"value\" : \"10001\"\r\n}, {\r\n  \"label\" : \"dongleId\",\r\n  \"value\" : null\r\n}, {\r\n  \"label\" : \"keyIndex\",\r\n  \"value\" : \"4F:38:72:D9:F8:DB:94:E7:22:48:96:D0:91:01:6D:3C:64:90:2E:14:DC:D2:F8:14:1F:2A:A4:19:1A:BC:91:41\"\r\n}, {\r\n  \"label\" : \"consentOfApplicant\",\r\n  \"value\" : \"Yes\"\r\n} ]",
      "operationsData": "[ {\r\n  \"label\" : \"officerId\",\r\n  \"value\" : \"110122\"\r\n}, {\r\n  \"label\" : \"officerBiometricFileName\",\r\n  \"value\" : null\r\n}, {\r\n  \"label\" : \"supervisorId\",\r\n  \"value\" : null\r\n}, {\r\n  \"label\" : \"supervisorBiometricFileName\",\r\n  \"value\" : null\r\n}, {\r\n  \"label\" : \"supervisorPassword\",\r\n  \"value\" : \"false\"\r\n}, {\r\n  \"label\" : \"officerPassword\",\r\n  \"value\" : \"true\"\r\n}, {\r\n  \"label\" : \"supervisorPIN\",\r\n  \"value\" : null\r\n}, {\r\n  \"label\" : \"officerPIN\",\r\n  \"value\" : null\r\n}, {\r\n  \"label\" : \"supervisorOTPAuthentication\",\r\n  \"value\" : \"false\"\r\n}, {\r\n  \"label\" : \"officerOTPAuthentication\",\r\n  \"value\" : \"false\"\r\n} ]",
      "capturedRegisteredDevices": "[ ]",
      "capturedNonRegisteredDevices": null,
      "checkSum": "[ {\r\n  \"label\" : \"mosip-client.jar\",\r\n  \"value\" : \"3BD4FDE4F7E6BFF03ED0E2E735825DF07C9C2C3FF91C0A344F7E72C5378126E4\"\r\n}, {\r\n  \"label\" : \"mosip-services.jar\",\r\n  \"value\" : \"02E72AA598FAE10C2097DBDA241A48245806F524735A12A26CC5D4986206A22C\"\r\n} ]",
      "printingName": "[ ]"
    },
    "process": "New",
    "schemaJson": "{\"$schema\":\"http:\\/\\/json-schema.org\\/draft-07\\/schema#\",\"description\":\"MOSIP Sample identity\",\"additionalProperties\":false,\"title\":\"MOSIP identity\",\"type\":\"object\",\"definitions\":{\"simpleType\":{\"uniqueItems\":true,\"additionalItems\":false,\"type\":\"array\",\"items\":{\"additionalProperties\":false,\"type\":\"object\",\"required\":[\"language\",\"value\"],\"properties\":{\"language\":{\"type\":\"string\"},\"value\":{\"type\":\"string\"}}}},\"documentType\":{\"additionalProperties\":false,\"type\":\"object\",\"properties\":{\"format\":{\"type\":\"string\"},\"type\":{\"type\":\"string\"},\"value\":{\"type\":\"string\"}}},\"biometricsType\":{\"additionalProperties\":false,\"type\":\"object\",\"properties\":{\"format\":{\"type\":\"string\"},\"version\":{\"type\":\"number\",\"minimum\":0},\"value\":{\"type\":\"string\"}}}},\"properties\":{\"identity\":{\"additionalProperties\":false,\"type\":\"object\",\"required\":[\"IDSchemaVersion\",\"fullName\",\"dateOfBirth\",\"gender\",\"addressLine1\",\"addressLine2\",\"addressLine3\",\"region\",\"province\",\"city\",\"zone\",\"postalCode\",\"phone\",\"email\",\"proofOfIdentity\",\"individualBiometrics\"],\"properties\":{\"proofOfAddress\":{\"bioAttributes\":[],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/documentType\"},\"gender\":{\"bioAttributes\":[],\"fieldCategory\":\"pvt\",\"format\":\"\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/simpleType\"},\"city\":{\"bioAttributes\":[],\"validators\":[{\"validator\":\"^(?=.{0,50}$).*\",\"arguments\":[],\"type\":\"regex\"}],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/simpleType\"},\"postalCode\":{\"bioAttributes\":[],\"validators\":[{\"validator\":\"^[(?i)A-Z0-9]{5}$|^NA$\",\"arguments\":[],\"type\":\"regex\"}],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"type\":\"string\",\"fieldType\":\"default\"},\"proofOfException-1\":{\"bioAttributes\":[],\"fieldCategory\":\"evidence\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/documentType\"},\"referenceIdentityNumber\":{\"bioAttributes\":[],\"validators\":[{\"validator\":\"^([0-9]{10,30})$\",\"arguments\":[],\"type\":\"regex\"}],\"fieldCategory\":\"pvt\",\"format\":\"kyc\",\"type\":\"string\",\"fieldType\":\"default\"},\"individualBiometrics\":{\"bioAttributes\":[\"leftEye\",\"rightEye\",\"rightIndex\",\"rightLittle\",\"rightRing\",\"rightMiddle\",\"leftIndex\",\"leftLittle\",\"leftRing\",\"leftMiddle\",\"leftThumb\",\"rightThumb\",\"face\"],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/biometricsType\"},\"province\":{\"bioAttributes\":[],\"validators\":[{\"validator\":\"^(?=.{0,50}$).*\",\"arguments\":[],\"type\":\"regex\"}],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/simpleType\"},\"zone\":{\"bioAttributes\":[],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/simpleType\"},\"proofOfDateOfBirth\":{\"bioAttributes\":[],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/documentType\"},\"addressLine1\":{\"bioAttributes\":[],\"validators\":[{\"validator\":\"^(?=.{0,50}$).*\",\"arguments\":[],\"type\":\"regex\"}],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/simpleType\"},\"addressLine2\":{\"bioAttributes\":[],\"validators\":[{\"validator\":\"^(?=.{3,50}$).*\",\"arguments\":[],\"type\":\"regex\"}],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/simpleType\"},\"residenceStatus\":{\"bioAttributes\":[],\"fieldCategory\":\"kyc\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/simpleType\"},\"addressLine3\":{\"bioAttributes\":[],\"validators\":[{\"validator\":\"^(?=.{3,50}$).*\",\"arguments\":[],\"type\":\"regex\"}],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/simpleType\"},\"email\":{\"bioAttributes\":[],\"validators\":[{\"validator\":\"^[A-Za-z0-9_\\\\-]+(\\\\.[A-Za-z0-9_]+)*@[A-Za-z0-9_-]+(\\\\.[A-Za-z0-9_]+)*(\\\\.[a-zA-Z]{2,})$\",\"arguments\":[],\"type\":\"regex\"}],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"type\":\"string\",\"fieldType\":\"default\"},\"parentOrGuardianRID\":{\"bioAttributes\":[],\"fieldCategory\":\"evidence\",\"format\":\"none\",\"type\":\"string\",\"fieldType\":\"default\"},\"parentOrGuardianBiometrics\":{\"bioAttributes\":[\"leftEye\",\"rightEye\",\"rightIndex\",\"rightLittle\",\"rightRing\",\"rightMiddle\",\"leftIndex\",\"leftLittle\",\"leftRing\",\"leftMiddle\",\"leftThumb\",\"rightThumb\",\"face\"],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/biometricsType\"},\"fullName\":{\"bioAttributes\":[],\"validators\":[{\"validator\":\"^(?=.{3,50}$).*\",\"arguments\":[],\"type\":\"regex\"}],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/simpleType\"},\"dateOfBirth\":{\"bioAttributes\":[],\"validators\":[{\"validator\":\"^(1869|18[7-9][0-9]|19[0-9][0-9]|20[0-9][0-9])\\/([0][1-9]|1[0-2])\\/([0][1-9]|[1-2][0-9]|3[01])$\",\"arguments\":[],\"type\":\"regex\"}],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"type\":\"string\",\"fieldType\":\"default\"},\"individualAuthBiometrics\":{\"bioAttributes\":[\"leftEye\",\"rightEye\",\"rightIndex\",\"rightLittle\",\"rightRing\",\"rightMiddle\",\"leftIndex\",\"leftLittle\",\"leftRing\",\"leftMiddle\",\"leftThumb\",\"rightThumb\",\"face\"],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/biometricsType\"},\"parentOrGuardianUIN\":{\"bioAttributes\":[],\"fieldCategory\":\"evidence\",\"format\":\"none\",\"type\":\"string\",\"fieldType\":\"default\"},\"proofOfIdentity\":{\"bioAttributes\":[],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/documentType\"},\"IDSchemaVersion\":{\"bioAttributes\":[],\"fieldCategory\":\"none\",\"format\":\"none\",\"type\":\"number\",\"fieldType\":\"default\",\"minimum\":0},\"proofOfException\":{\"bioAttributes\":[],\"fieldCategory\":\"evidence\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/documentType\"},\"phone\":{\"bioAttributes\":[],\"validators\":[{\"validator\":\"^[+]*([0-9]{1})([0-9]{9})$\",\"arguments\":[],\"type\":\"regex\"}],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"type\":\"string\",\"fieldType\":\"default\"},\"parentOrGuardianName\":{\"bioAttributes\":[],\"fieldCategory\":\"evidence\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/simpleType\"},\"proofOfRelationship\":{\"bioAttributes\":[],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/documentType\"},\"UIN\":{\"bioAttributes\":[],\"fieldCategory\":\"none\",\"format\":\"none\",\"type\":\"string\",\"fieldType\":\"default\"},\"region\":{\"bioAttributes\":[],\"validators\":[{\"validator\":\"^(?=.{0,50}$).*\",\"arguments\":[],\"type\":\"regex\"}],\"fieldCategory\":\"pvt\",\"format\":\"none\",\"fieldType\":\"default\",\"$ref\":\"#\\/definitions\\/simpleType\"}}}}}",
    "schemaVersion": "0.1",
    "source": "REGISTRATION_CLIENT"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "v1"
}
```

#### Response

**Success Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.registration.packet.reader",
  "version": "v1",
  "responsetime": "2020-10-01T09:31:43.827Z",
  "metadata": null,
  "response": [
    {
      "id": "10001100770000320200921092256",
      "packetName": "10001100770000320200921092256_evidence",
      "source": "REGISTRATION_CLIENT",
      "process": "New",
      "schemaVersion": "0.0",
      "signature": "",
      "encryptedHash": "rs4TF5CtMdA2gW9dLZs0_J5oXRBP6Fw2Y6s8wyYU1tU",
      "providerName": "PacketWriterImpl",
      "providerVersion": "v1.0",
      "creationDate": "2020-10-01T09:31:43.331244Z"
    },
    {
      "id": "10001100770000320200921092256",
      "packetName": "10001100770000320200921092256_optional",
      "source": "REGISTRATION_CLIENT",
      "process": "New",
      "schemaVersion": "0.0",
      "signature": "",
      "encryptedHash": "rs4TF5CtMdA2gW9dLZs0_J5oXRBP6Fw2Y6s8wyYU1tU",
      "providerName": "PacketWriterImpl",
      "providerVersion": "v1.0",
      "creationDate": "2020-10-01T09:31:43.418894Z"
    },
    {
      "id": "10001100770000320200921092256",
      "packetName": "10001100770000320200921092256_id",
      "source": "REGISTRATION_CLIENT",
      "process": "New",
      "schemaVersion": "0.0",
      "signature": "",
      "encryptedHash": "zYEcrSLks5KScVLPnjv2lf9i0T085WgNf1HQuiOg_9k",
      "providerName": "PacketWriterImpl",
      "providerVersion": "v1.0",
      "creationDate": "2020-10-01T09:31:43.752116Z"
    }
  ],
  "errors": []
}
```

**Failure Response**

**Response Code : 200 (OK)**

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-09-02T08:21:16.891Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-ATH-401",
      "message": "Authentication Failed"
    }
  ]
}
```

#### Failure Details

| Error Code  | Message                                            | Scenario               |
| ----------- | -------------------------------------------------- | ---------------------- |
| KER-ATH-401 | Authentication Failed                              | Authentication Failure |
| KER-PUT-003 | Packet encryption failed                           |                        |
| KER-PUT-005 | API not accessible                                 |                        |
| KER-PUT-004 | System Exception occured                           |                        |
| KER-PUT-006 | No available provider for given source and process |                        |
| KER-PUT-013 | No Object store adapter found.                     |                        |
| KER-PUT-014 | Packet keeper exception occured.                   |                        |
| KER-PUT-009 | Unable to parse the zip                            |                        |
| KER-PUT-010 | Failed to generate digital signature               |                        |
