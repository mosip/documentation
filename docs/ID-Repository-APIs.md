# ID Repository APIs

This section details about the REST services in ID Repository module.

* [ID Services](ID-Repository-APIs.md#identity-services-private)
* [VID Services](ID-Repository-APIs.md#vid-services-private)

## Identity Services (Private)

These services is used by Registration Processor to store/update during registration process and ID Authentication to retrieve Identity of an Individual for their authentication.

* [POST /idrepository/v1/identity/](ID-Repository-APIs.md#post-idrepository-v-1-identity)
* [GET /idrepository/v1/identity/uin/{uin}?type=bio](ID-Repository-APIs.md#get-idrepository-v-1-identity-uin-uin-type-bio)
* [GET /idrepository/v1/identity/rid/{rid}?type=bio](ID-Repository-APIs.md#get-idrepository-v-1-identity-rid-rid-type-bio)
* [PATCH /idrepository/v1/identity/](ID-Repository-APIs.md#patch-idrepository-v-1-identity)

### Users of Identity service

1. `Registration Processor` - _Registration Processor_ will create a new ID record or update an existing ID record in ID repository and store corresponding demographic and bio-metric documents. _Registration Processor_ can also retrieve Identity details of an Individual using RID.
2. `ID Authentication` - _ID Authentication_ can retrieve Identity details of an Individual using UIN for authentication purpose.

{% hint style="info" %}
Identity Services does not support search based on attributes of an ID.
{% endhint %}

### POST /idrepository/v1/identity/

This service will create a new ID record in ID repository and store corresponding demographic and bio-metric documents.

#### Resource URL

`https://mosip.io/idrepository/v1/identity/`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                          | Required | Description                                            | Default Value   | Example                  |
| ----------------------------- | -------- | ------------------------------------------------------ | --------------- | ------------------------ |
| id                            | yes      | Id of the API                                          | mosip.id.create |                          |
| version                       | yes      | version of the API                                     |                 | v1                       |
| requesttime                   | yes      | timestamp of the request                               |                 | 2018-12-11T06:12:25.288Z |
| request                       | yes      | Request Body attributes                                |                 |                          |
| request: registrationId       | yes      | registration id                                        |                 |                          |
| request: biometricReferenceId | yes      | ABIS Reference ID                                      |                 |                          |
| request: identity             | yes      | JSON body as per ID object schema                      |                 |                          |
| request: documents            | yes      | Documents that are to be uploaded for any ID attribute |                 |                          |

**Request**

```
{
  "id": "mosip.id.create",
  "version": "v1",
  "requesttime": "2018-12-11T06:12:25.288Z",
  "request": {
    "registrationId": "12342343200065201812120100555",
    "biometricReferenceId": "<ABIS Reference ID>",
    "identity": {
      "IDSchemaVersion": 1,
      "UIN": 981576026435,
      "fullName": [
        {
          "language": "ara",
          "value": "ابراهيم بن علي"
        },
        {
          "language": "fra",
          "value": "Ibrahim Ibn Ali"
        }
      ],
      "dateOfBirth": "1955/04/15",
      "age": 45,
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
      "addressLine1": [
        {
          "language": "ara",
          "value": "عنوان العينة سطر 1"
        },
        {
          "language": "fra",
          "value": "exemple d'adresse ligne 1"
        }
      ],
      "addressLine2": [
        {
          "language": "ara",
          "value": "عنوان العينة سطر 2"
        },
        {
          "language": "fra",
          "value": "exemple d'adresse ligne 2"
        }
      ],
      "addressLine3": [
        {
          "language": "ara",
          "value": "عنوان العينة سطر 3"
        },
        {
          "language": "fra",
          "value": "exemple d'adresse ligne 3"
        }
      ],
      "region": [
        {
          "language": "ara",
          "value": "طنجة - تطوان - الحسيمة"
        },
        {
          "language": "fra",
          "value": "Tanger-Tétouan-Al Hoceima"
        }
      ],
      "province": [
        {
          "language": "ara",
          "value": "فاس-مكناس"
        },
        {
          "language": "fra",
          "value": "Fès-Meknès"
        }
      ],
      "city": [
        {
          "language": "ara",
          "value": "الدار البيضاء"
        },
        {
          "language": "fra",
          "value": "Casablanca"
        }
      ],
      "postalCode": "570004",
      "phone": "9876543210",
      "email": "abc@xyz.com",
      "parentOrGuardianRIDOrUIN": 212124324784912,
      "parentOrGuardianName": [
        {
          "language": "ara",
          "value": "سلمى"
        },
        {
          "language": "fra",
          "value": "salma"
        }
      ],
      "proofOfAddress": {
        "format": "pdf",
        "type": "drivingLicense",
        "value": "fileReferenceID"
      },
      "proofOfIdentity": {
        "format": "txt",
        "type": "passport",
        "value": "fileReferenceID"
      },
      "proofOfRelationship": {
        "format": "pdf",
        "type": "passport",
        "value": "fileReferenceID"
      },
      "proofOfDateOfBirth": {
        "format": "pdf",
        "type": "passport",
        "value": "fileReferenceID"
      },
      "individualBiometrics": {
        "format": "cbeff",
        "version": 1,
        "value": "fileReferenceID"
      },
      "parentOrGuardianBiometrics": {
        "format": "cbeff",
        "version": 1,
        "value": "fileReferenceID"
      }
    },
    "documents": [
      {
        "category": "proofOfAddress",
        "value": "<Base 64 encoded byte array of PoA document>"
      },
      {
        "category": "proofOfIdentity",
        "value": "<Base 64 encoded byte array of PoI document>"
      },
      {
        "category": "proofOfRelationship",
        "value": "<Base 64 encoded byte array of PoR document>"
      },
      {
        "category": "individualBiometrics",
        "value": "<Base 64 encoded byte array of CBEFF document>"
      },
      {
        "category": "parentOrGuardianBiometrics",
        "value": "<Base 64 encoded byte array of CBEFF document>"
      }
    ]
  }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.id.create",
  "version": "v1",
  "responsetime": "2018-12-11T06:13:05.218Z",
  "response": {
    "status": "ACTIVATED",
    "entity": "http://mosip.io/idrepository/v1/identity/uin/{uin}"
  }
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                                 | Error Description                                           |
| ----------- | ------------------------------------------------------------- | ----------------------------------------------------------- |
| IDR-IDC-001 | Missing Input Parameter - %s                                  | Input Parameter Missing                                     |
| IDR-IDC-002 | Invalid Input Parameter - %s                                  | Invalid Input Parameter                                     |
| IDR-IDC-003 | Invalid Request                                               | Invalid Request attribute                                   |
| IDR-IDC-004 | Unknown error occurred                                        | An unknown error occurred                                   |
| IDR-IDC-005 | Input Data Validation Failed                                  | Validation on input fails                                   |
| IDR-IDC-006 | Error occurred while performing DB operations                 | DB connectivity error                                       |
| IDR-IDC-008 | 4XX - Client Error occurred                                   | 4XX error from Kernel APIs                                  |
| IDR-IDC-009 | 5XX - Server Error occurred                                   | 5XX error from Kernel APIs                                  |
| IDR-IDC-010 | Connection timed out                                          | Connection timed out while invoking REST APIs               |
| IDR-IDC-011 | Authorization Failed                                          | Input role is not authorized to access the service          |
| IDR-IDC-012 | Record already exists in DB                                   | Identity with input UIN or RID already exists in DB         |
| IDR-IDS-003 | Failed to encrypt/decrypt message using Kernel Crypto Manager | Error thrown from Kernel Crypto Manager                     |
| IDR-IDS-004 | Failed to store/retrieve files in DFS                         | Error while storing file in DFS                             |
| IDR-IDS-005 | Failed to process Id Object using kernel Id Object validator  | Error while validating ID Object against Id ObjectValidator |
| IDR-IDS-007 | Failed to retrieve data from kernel Masterdata                | Error while retrieving data from Kernel MasterData          |

### GET /idrepository/v1/identity/uin/{uin}?type=bio

This service will retrieve an ID record from ID repository for a given UIN (Unique Identification Number) and identity type as bio/demo/all.

1. When type=bio is selected, individualBiometrics along with Identity details of the Individual are returned
2. When type=demo is selected, Demographic documents along with Identity details of the Individual are returned
3. When type=all is selected, both individualBiometrics and demographic documents are returned along with Identity details of the Individual

If no identity type is provided, stored Identity details of the Individual will be returned as a default response.

#### Resource URL

`https://mosip.io/idrepository/v1/identity/uin/{uin}?type=bio`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Responses

**Success Response**

```
{
  "id": "mosip.id.read",
  "version": "v1",
  "responsetime": "2018-12-11T06:13:05.218Z",
  "response": {
    //JSON object as per the ID Object Schema defined by the system owner
    "status": "ACTIVATED",
    "identity": {
      "IDSchemaVersion": 1.0,
      "UIN": 981576026435,
      "fullName": [
        {
          "language": "ara",
          "value": "ابراهيم بن علي"
        },
        {
          "language": "fra",
          "value": "Ibrahim Ibn Ali"
        }
      ],
      "dateOfBirth": "1955/04/15",
      "age": 45,
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
      "addressLine1": [
        {
          "language": "ara",
          "value": "عنوان العينة سطر 1"
        },
        {
          "language": "fra",
          "value": "exemple d'adresse ligne 1"
        }
      ],
      "addressLine2": [
        {
          "language": "ara",
          "value": "عنوان العينة سطر 2"
        },
        {
          "language": "fra",
          "value": "exemple d'adresse ligne 2"
        }
      ],
      "addressLine3": [
        {
          "language": "ara",
          "value": "عنوان العينة سطر 3"
        },
        {
          "language": "fra",
          "value": "exemple d'adresse ligne 3"
        }
      ],
      "region": [
        {
          "language": "ara",
          "value": "طنجة - تطوان - الحسيمة"
        },
        {
          "language": "fra",
          "value": "Tanger-Tétouan-Al Hoceima"
        }
      ],
      "province": [
        {
          "language": "ara",
          "value": "فاس-مكناس"
        },
        {
          "language": "fra",
          "value": "Fès-Meknès"
        }
      ],
      "city": [
        {
          "language": "ara",
          "value": "الدار البيضاء"
        },
        {
          "language": "fra",
          "value": "Casablanca"
        }
      ],
      "postalCode": "570004",
      "phone": "9876543210",
      "email": "abc@xyz.com",
      "parentOrGuardianRIDOrUIN": 212124324784912,
      "parentOrGuardianName": [
        {
          "language": "ara",
          "value": "سلمى"
        },
        {
          "language": "fra",
          "value": "salma"
        }
      ],
      "proofOfAddress": {
        "format": "pdf",
        "type": "drivingLicense",
        "value": "fileReferenceID"
      },
      "proofOfIdentity": {
        "format": "txt",
        "type": "passport",
        "value": "fileReferenceID"
      },
      "proofOfRelationship": {
        "format": "pdf",
        "type": "passport",
        "value": "fileReferenceID"
      },
      "proofOfDateOfBirth": {
        "format": "pdf",
        "type": "passport",
        "value": "fileReferenceID"
      },
      "individualBiometrics": {
        "format": "cbeff",
        "version": 1.0,
        "value": "fileReferenceID"
      },
      "parentOrGuardianBiometrics": {
        "format": "cbeff",
        "version": 1.0,
        "value": "fileReferenceID"
      }
    },
    "documents": [
      {
        "category": "individualBiometrics",
        "value": "<Base 64 encoded byte array of CBEFF document>"
      }
    ]
  }
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                                 | Error Description                                                                         |
| ----------- | ------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| IDR-IDC-004 | Unknown error occurred                                        | An unknown error occurred                                                                 |
| IDR-IDC-006 | Error occurred while performing DB operations                 | DB connectivity error                                                                     |
| IDR-IDC-007 | No Record(s) found                                            | Identity with input UIN does not exist                                                    |
| IDR-IDC-008 | 4XX - Client Error occurred                                   | 4XX error from Kernel APIs                                                                |
| IDR-IDC-009 | 5XX - Server Error occurred                                   | 5XX error from Kernel APIs                                                                |
| IDR-IDC-010 | Connection timed out                                          | Connection timed out while invoking REST APIs                                             |
| IDR-IDC-011 | Authorization Failed                                          | Input role is not authorized to access the service                                        |
| IDR-IDS-001 | Identity Element hash does not match                          | Error while matching Identity hash with hash of decrypted Identity                        |
| IDR-IDS-002 | Biometric/Document hash does not match                        | Error while matching hash of Biometric/Document with hash of decrypted Biometric/Document |
| IDR-IDS-003 | Failed to encrypt/decrypt message using Kernel Crypto Manager | Error thrown from Kernel Crypto Manager                                                   |
| IDR-IDS-004 | Failed to store/retrieve files in DFS                         | Error while storing file in DFS                                                           |
| IDR-IDS-006 | File(s) not found in DFS                                      | Requested Biometric/Demographic documents not found in DFS                                |
| IDR-IDS-007 | Failed to retrieve data from kernel Masterdata                | Error while retrieving data from Kernel MasterData                                        |

### GET /idrepository/v1/identity/rid/{rid}?type=bio

This operation will retrieve an ID record from ID repository for a given RID (Registration ID) and identity type as bio/demo/all.

1. When type=bio is selected, individualBiometrics along with Identity details of Individual are returned
2. When type=demo is selected, Demographic documents along with Identity details of Individual are returned
3. When type=all is selected, both individualBiometrics and demographic documents are returned along with Identity details of Individual

If no identity type is provided, stored latest Identity details of Individual mapped to the UIN of input RID will be returned as a default response.

#### Resource URL

`https://mosip.io/idrepository/v1/identity/rid/{rid}?type=bio`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Responses

**Success Response**

```
{
  "id": "mosip.id.read",
  "version": "v1",
  "responsetime": "2018-12-11T06:13:05.218Z",
  "response": {
    //JSON object as per the ID Object Schema defined by the system owner
    "status": "ACTIVATED",
    "identity": {
      "IDSchemaVersion": 1.0,
      "UIN": 981576026435,
      "fullName": [
        {
          "language": "ara",
          "value": "ابراهيم بن علي"
        },
        {
          "language": "fra",
          "value": "Ibrahim Ibn Ali"
        }
      ],
      "dateOfBirth": "1955/04/15",
      "age": 45,
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
      "addressLine1": [
        {
          "language": "ara",
          "value": "عنوان العينة سطر 1"
        },
        {
          "language": "fra",
          "value": "exemple d'adresse ligne 1"
        }
      ],
      "addressLine2": [
        {
          "language": "ara",
          "value": "عنوان العينة سطر 2"
        },
        {
          "language": "fra",
          "value": "exemple d'adresse ligne 2"
        }
      ],
      "addressLine3": [
        {
          "language": "ara",
          "value": "عنوان العينة سطر 3"
        },
        {
          "language": "fra",
          "value": "exemple d'adresse ligne 3"
        }
      ],
      "region": [
        {
          "language": "ara",
          "value": "طنجة - تطوان - الحسيمة"
        },
        {
          "language": "fra",
          "value": "Tanger-Tétouan-Al Hoceima"
        }
      ],
      "province": [
        {
          "language": "ara",
          "value": "فاس-مكناس"
        },
        {
          "language": "fra",
          "value": "Fès-Meknès"
        }
      ],
      "city": [
        {
          "language": "ara",
          "value": "الدار البيضاء"
        },
        {
          "language": "fra",
          "value": "Casablanca"
        }
      ],
      "postalCode": "570004",
      "phone": "9876543210",
      "email": "abc@xyz.com",
      "parentOrGuardianRIDOrUIN": 212124324784912,
      "parentOrGuardianName": [
        {
          "language": "ara",
          "value": "سلمى"
        },
        {
          "language": "fra",
          "value": "salma"
        }
      ],
      "proofOfAddress": {
        "format": "pdf",
        "type": "drivingLicense",
        "value": "fileReferenceID"
      },
      "proofOfIdentity": {
        "format": "txt",
        "type": "passport",
        "value": "fileReferenceID"
      },
      "proofOfRelationship": {
        "format": "pdf",
        "type": "passport",
        "value": "fileReferenceID"
      },
      "proofOfDateOfBirth": {
        "format": "pdf",
        "type": "passport",
        "value": "fileReferenceID"
      },
      "individualBiometrics": {
        "format": "cbeff",
        "version": 1.0,
        "value": "fileReferenceID"
      },
      "parentOrGuardianBiometrics": {
        "format": "cbeff",
        "version": 1.0,
        "value": "fileReferenceID"
      }
    },
    "documents": [
      {
        "category": "individualBiometrics",
        "value": "<Base 64 encoded byte array of CBEFF document>"
      }
    ]
  }
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                                 | Error Description                                                                         |
| ----------- | ------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| IDR-IDC-004 | Unknown error occurred                                        | An unknown error occurred                                                                 |
| IDR-IDC-006 | Error occurred while performing DB operations                 | DB connectivity error                                                                     |
| IDR-IDC-007 | No Record(s) found                                            | Identity with input RID does not exist                                                    |
| IDR-IDC-008 | 4XX - Client Error occurred                                   | 4XX error from Kernel APIs                                                                |
| IDR-IDC-009 | 5XX - Server Error occurred                                   | 5XX error from Kernel APIs                                                                |
| IDR-IDC-010 | Connection timed out                                          | Connection timed out while invoking REST APIs                                             |
| IDR-IDC-011 | Authorization Failed                                          | Input role is not authorized to access the service                                        |
| IDR-IDS-001 | Identity Element hash does not match                          | Error while matching Identity hash with hash of decrypted Identity                        |
| IDR-IDS-002 | Biometric/Document hash does not match                        | Error while matching hash of Biometric/Document with hash of decrypted Biometric/Document |
| IDR-IDS-003 | Failed to encrypt/decrypt message using Kernel Crypto Manager | Error thrown from Kernel Crypto Manager                                                   |
| IDR-IDS-004 | Failed to store/retrieve files in DFS                         | Error while storing file in DFS                                                           |
| IDR-IDS-006 | File(s) not found in DFS                                      | Requested Biometric/Demographic documents not found in DFS                                |
| IDR-IDS-007 | Failed to retrieve data from kernel Masterdata                | Error while retrieving data from Kernel MasterData                                        |

### PATCH /idrepository/v1/identity/

This operation will update an existing ID record in the ID repository for a given UIN (Unique Identification Number)

#### Resource URL

`https://mosip.io/idrepository/v1/identity/`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                          | Required | Description                                            | Default Value   | Example                  |
| ----------------------------- | -------- | ------------------------------------------------------ | --------------- | ------------------------ |
| id                            | Y        | Id of the API                                          | mosip.id.update |                          |
| version                       | Y        | version of the API                                     |                 | v1                       |
| requesttime                   | Y        | timestamp of the request                               |                 | 2018-12-11T06:12:25.288Z |
| request                       | Y        | Request body attributes                                |                 |                          |
| request: status               | N        | status of ID                                           |                 |                          |
| request: registrationId       | Y        | Registration id                                        |                 |                          |
| request: biometricReferenceId | N        | ABIS Reference Id                                      |                 |                          |
| request: identity             | M        | JSON body as per the ID object schema                  |                 |                          |
| request: identity: UIN        | M        | UIN for which Identity is updated                      |                 |                          |
| request: documents            | N        | Documents that are to be uploaded for any ID attribute |                 |                          |

#### Request

```
{
  "id": "mosip.id.update",
  "version": "v1",
  "requesttime": "2018-12-11T06:12:25.288Z",
  "request": {
    //JSON object as per the ID Object Schema defined by the system owner
    "registrationId": "12342343200065201812120100556",
    "biometricReferenceId": "<ABIS Reference ID>",
    "status": "DEACTIVATED",
    "identity": {
      "UIN": 981576026435,
      "email": "sample123@email.com",
      "individualBiometrics": {
        "format": "cbeff",
        "version": 1.0,
        "value": "updated_bio_doc_name"
      }
    },
    "documents": [
      {
        "category": "individualBiometrics",
        "value": "<Base 64 encoded byte array of updated CBEFF document>"
      }
    ]
  }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.id.update",
  "version": "v1",
  "responsetime": "2018-12-11T06:13:05.218Z",
  "response": {
    "status": "DEACTIVATED",
    "entity": "http://mosip.io/identity/568469473107"
  }
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                                 | Error Description                                                                         |
| ----------- | ------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| IDR-IDC-001 | Missing Input Parameter - %s                                  | Input Parameter Missing                                                                   |
| IDR-IDC-002 | Invalid Input Parameter - %s                                  | Invalid Input Parameter                                                                   |
| IDR-IDC-003 | Invalid Request                                               | Invalid Request attribute                                                                 |
| IDR-IDC-004 | Unknown error occurred                                        | An unknown error occurred                                                                 |
| IDR-IDC-005 | Input Data Validation Failed                                  | Validation on input fails                                                                 |
| IDR-IDC-006 | Error occurred while performing DB operations                 | DB connectivity error                                                                     |
| IDR-IDC-008 | 4XX - Client Error occurred                                   | 4XX error from Kernel APIs                                                                |
| IDR-IDC-009 | 5XX - Server Error occurred                                   | 5XX error from Kernel APIs                                                                |
| IDR-IDC-010 | Connection timed out                                          | Connection timed out while invoking REST APIs                                             |
| IDR-IDC-011 | Authorization Failed                                          | Input role is not authorized to access the service                                        |
| IDR-IDC-012 | Record already exists in DB                                   | Identity with input RID already exists in DB                                              |
| IDR-IDS-001 | Identity Element hash does not match                          | Error while matching Identity hash with hash of decrypted Identity                        |
| IDR-IDS-002 | Biometric/Document hash does not match                        | Error while matching hash of Biometric/Document with hash of decrypted Biometric/Document |
| IDR-IDS-003 | Failed to encrypt/decrypt message using Kernel Crypto Manager | Error thrown from Kernel Crypto Manager                                                   |
| IDR-IDS-004 | Failed to store/retrieve files in DFS                         | Error while storing file in DFS                                                           |
| IDR-IDS-006 | File(s) not found in DFS                                      | Requested Biometric/Demographic documents not found in DFS                                |
| IDR-IDS-005 | Failed to process Id Object using kernel Id Object validator  | Error while validating ID Object against Id ObjectValidator                               |
| IDR-IDS-007 | Failed to retrieve data from kernel Masterdata                | Error while retrieving data from Kernel MasterData                                        |

## VID Services (Private)

These services can be used to perform various operations on VID like generate or re-generate VID, update VID status, etc.

* [POST /idrepository/v1/vid](ID-Repository-APIs.md#post-idrepository-v-1-vid)
* [GET /idrepository/v1/vid/{vid}](ID-Repository-APIs.md#get-idrepository-v-1-vid-vid)
* [PATCH /idrepository/v1/vid/{vid}](ID-Repository-APIs.md#patch-idrepository-v-1-vid-vid)
* [POST /idrepository/v1/vid/{vid}/regenerate](ID-Repository-APIs.md#post-idrepository-v-1-vid-vid-regenerate)
* [PATCH /idrepository/v2/vid/deactivate](ID-Repository-APIs.md#patch-idrepository-v-2-vid-deactivate)
* [PATCH /idrepository/v2/vid/reactivate](ID-Repository-APIs.md#patch-idrepository-v-2-vid-reactivate)

### Users of VID services

1. `Registration Processor` - _Registration Processor_ will create a new perpetual VID once UIN is generated successfully.
2. `Resident Services` - Individual can use _Resident Services_ to generate or re-generate a new temporary VID.
3. `ID Authentication` - _ID Authentication_ can retrieve UIN for a given VID for authenticating Individual using VID.

### POST /idrepository/v1/vid

This service will generate a new VID based on VID type provided.

#### Resource URL

`https://mosip.io/idrepository/v1/vid`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name             | Required | Description              | Default Value    | Example                  |
| ---------------- | -------- | ------------------------ | ---------------- | ------------------------ |
| id               | yes      | Id of the API            | mosip.vid.create |                          |
| version          | yes      | version of the API       |                  | v1                       |
| requesttime      | yes      | timestamp of the request |                  | 2019-04-30T06:12:25.288Z |
| request          | yes      | Request Body attributes  |                  |                          |
| request: vidType | yes      | VID Type                 |                  | Perpetual or Temporary   |
| request: UIN     | yes      | Individual's UIN         |                  | 981576026435             |

#### Request

```
{
  "id": "mosip.vid.create",
  "version": "v1",
  "requesttime": "2019-04-30T06:12:25.288Z",
  "request": {
    "vidType": "Perpetual",
    "UIN": 981576026435
  }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.vid.create",
  "version": "v1",
  "responsetime": "2019-04-30T06:13:05.218Z",
  "response": {
    "vidStatus": "ACTIVE",
    "VID": 1234512345
  }
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                      | Error Description                                        |
| ----------- | -------------------------------------------------- | -------------------------------------------------------- |
| IDR-VID-002 | Failed to generate VID                             | Error while generating VID                               |
| IDR-VID-003 | Could not generate/regenerate VID as per policy    | Error while generating VID based on policy               |
| IDR-VID-004 | Deactivate UIN or Blocked UIN                      | UIN is either de-activated or blocked                    |
| IDR-VID-005 | Failed to retrieve uin data using Identity Service | Error while retrieving UIN details from Identity Service |
| IDR-IDC-001 | Missing Input Parameter - %s                       | Input Parameter Missing                                  |
| IDR-IDC-002 | Invalid Input Parameter - %s                       | Invalid Input Parameter                                  |
| IDR-IDC-003 | Invalid Request                                    | Invalid Request attribute                                |
| IDR-IDC-004 | Unknown error occurred                             | An unknown error occurred                                |
| IDR-IDC-005 | Input Data Validation Failed                       | Validation on input fails                                |
| IDR-IDC-006 | Error occurred while performing DB operations      | DB connectivity error                                    |
| IDR-IDC-008 | 4XX - Client Error occurred                        | 4XX error from Kernel APIs                               |
| IDR-IDC-009 | 5XX - Server Error occurred                        | 5XX error from Kernel APIs                               |
| IDR-IDC-010 | Connection timed out                               | Connection timed out while invoking REST APIs            |
| IDR-IDC-011 | Authorization Failed                               | Input role is not authorized to access the service       |

### GET /idrepository/v1/vid/{vid}

This service will retrieve associated decrypted UIN for a given VID, once VID is successfully validated.

#### Resource URL

`https://mosip.io/idrepository/v1/vid/{vid}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Responses

**Success Response**

```
{
  "id": "mosip.vid.read",
  "version": "v1",
  "responsetime": "2019-04-30T06:13:05.218Z",
  "response": {
    "UIN": 981576026435
  }
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                      | Error Description                                                       |
| ----------- | -------------------------------------------------- | ----------------------------------------------------------------------- |
| IDR-VID-001 | VID is                                             | Here status could be REVOKED, EXPIRED, USED, INVALIDATED or DEACTIVATED |
| IDR-VID-004 | UIN                                                | Here, uin-status could be either de-activated or blocked                |
| IDR-VID-005 | Failed to retrieve uin data using Identity Service | Error while retrieving UIN details from Identity Service                |
| IDR-VID-006 | Uin hash does not match                            | Error while matching hash of UIN against decrypted UIN                  |
| IDR-IDC-004 | Unknown error occurred                             | An unknown error occurred                                               |
| IDR-IDC-006 | Error occurred while performing DB operations      | DB connectivity error                                                   |
| IDR-IDC-007 | No Record(s) found                                 | Input VID does not exist in DB                                          |
| IDR-IDC-008 | 4XX - Client Error occurred                        | 4XX error from Kernel APIs                                              |
| IDR-IDC-009 | 5XX - Server Error occurred                        | 5XX error from Kernel APIs                                              |
| IDR-IDC-010 | Connection timed out                               | Connection timed out while invoking REST APIs                           |
| IDR-IDC-011 | Authorization Failed                               | Input role is not authorized to access the service                      |

### PATCH /idrepository/v1/vid/{vid}

This service will update status associated with a given VID, if the current status of VID is 'ACTIVE'.

#### Resource URL

`https://mosip.io/idrepository/v1/vid/{vid}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name               | Required | Description              | Default Value    | Example                    |
| ------------------ | -------- | ------------------------ | ---------------- | -------------------------- |
| id                 | yes      | Id of the API            | mosip.vid.update |                            |
| version            | yes      | version of the API       |                  | v1                         |
| requesttime        | yes      | timestamp of the request |                  | 2019-04-30T06:12:25.288Z   |
| request            | yes      | Request Body attributes  |                  |                            |
| request: vidStatus | yes      | status of VID            |                  | USED or REVOKED or EXPIRED |

#### Request

```
{
  "id": "mosip.vid.update",
  "version": "v1",
  "requesttime": "2019-04-30T06:12:25.288Z",
  "request": {
    "vidStatus": 'REVOKED'
  }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.vid.update",
  "version": "v1",
  "responsetime": "2019-04-30T06:13:05.218Z",
  "response": {
    "vidStatus": "REVOKED",
    "UIN": null,
    "VID": null,
    "restoredVidDetails": {
      "vidStatus": "ACTIVE",
      "UIN": null,
      "VID": 4290754956350965
    }
  }
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                      | Error Description                                        |
| ----------- | -------------------------------------------------- | -------------------------------------------------------- |
| IDR-VID-001 | VID is DEACTIVATED or VID is REVOKED               | VID is REVOKED,EXPIRED,USED,INVALIDATED or DEACTIVATED   |
| IDR-VID-004 | Deactivate UIN or Blocked UIN                      | UIN is either de-activated or blocked                    |
| IDR-VID-005 | Failed to retrieve uin data using Identity Service | Error while retrieving UIN details from Identity Service |
| IDR-VID-006 | Uin hash does not match                            | Error while matching hash of UIN against decrypted UIN   |
| IDR-IDC-004 | Unknown error occurred                             | An unknown error occurred                                |
| IDR-IDC-006 | Error occurred while performing DB operations      | DB connectivity error                                    |
| IDR-IDC-007 | No Record(s) found                                 | Input VID does not exist in DB                           |
| IDR-IDC-008 | 4XX - Client Error occurred                        | 4XX error from Kernel APIs                               |
| IDR-IDC-009 | 5XX - Server Error occurred                        | 5XX error from Kernel APIs                               |
| IDR-IDC-010 | Connection timed out                               | Connection timed out while invoking REST APIs            |
| IDR-IDC-011 | Authorization Failed                               | Input role is not authorized to access the service       |

### POST /idrepository/v1/vid/{vid}/regenerate

This service will re-generate VID for a given VID, only if the current status of VID is 'ACTIVE', 'USED', or 'EXPIRED'.

#### Resource URL

`https://mosip.io/idrepository/v1/vid/{vid}/regenerate`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Responses

**Success Response**

```
{
  "id": "mosip.vid.regenerate",
  "version": "v1",
  "responsetime": "2019-05-21T06:13:05.218Z",
  "response": {
    "vidStatus": 'ACTIVE',
    "VID": 1234512345
  }
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                      | Error Description                                        |
| ----------- | -------------------------------------------------- | -------------------------------------------------------- |
| IDR-VID-002 | Failed to generate VID                             | Error while generating VID                               |
| IDR-VID-003 | Could not generate/regenerate VID as per policy    | Error while generating VID based on policy               |
| IDR-VID-004 | Deactivate UIN or Blocked UIN                      | UIN is either de-activated or blocked                    |
| IDR-VID-005 | Failed to retrieve uin data using Identity Service | Error while retrieving UIN details from Identity Service |
| IDR-VID-006 | Uin hash does not match                            | Error while matching hash of UIN against decrypted UIN   |
| IDR-IDC-001 | Missing Input Parameter - %s                       | Input Parameter Missing                                  |
| IDR-IDC-002 | Invalid Input Parameter - %s                       | Invalid Input Parameter                                  |
| IDR-IDC-003 | Invalid Request                                    | Invalid Request attribute                                |
| IDR-IDC-004 | Unknown error occurred                             | An unknown error occurred                                |
| IDR-IDC-005 | Input Data Validation Failed                       | Validation on input fails                                |
| IDR-IDC-006 | Error occurred while performing DB operations      | DB connectivity error                                    |
| IDR-IDC-008 | 4XX - Client Error occurred                        | 4XX error from Kernel APIs                               |
| IDR-IDC-009 | 5XX - Server Error occurred                        | 5XX error from Kernel APIs                               |
| IDR-IDC-010 | Connection timed out                               | Connection timed out while invoking REST APIs            |
| IDR-IDC-011 | Authorization Failed                               | Input role is not authorized to access the service       |

### PATCH /idrepository/v2/vid/deactivate

This service will de-activate VIDs mapped against the provided UIN, only if the current status of VID is 'ACTIVE'.

#### Resource URL

`https://mosip.io/idrepository/v2/vid/deactivate`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name         | Required | Description              | Default Value        | Example                  |
| ------------ | -------- | ------------------------ | -------------------- | ------------------------ |
| id           | yes      | Id of the API            | mosip.vid.deactivate |                          |
| version      | yes      | version of the API       |                      | v2                       |
| requesttime  | yes      | timestamp of the request |                      | 2019-04-30T06:12:25.288Z |
| request      | yes      | Request Body attributes  |                      |                          |
| request: UIN | yes      | Individual's UIN         |                      | 981576026435             |

#### Request

```
{
  "id": "mosip.vid.deactivate",
  "version": "v2",
  "requesttime": "2019-05-21T06:13:05.218Z",
  "request": {
    "UIN": 981576026435
  }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.vid.deactivate",
  "version": "v2",
  "responsetime": "2019-05-21T06:13:05.218Z",
  "response": {
    "vidStatus": 'DEACTIVATED'
  }
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                      | Error Description                                                       |
| ----------- | -------------------------------------------------- | ----------------------------------------------------------------------- |
| IDR-VID-001 | VID is                                             | Here status could be REVOKED, EXPIRED, USED, INVALIDATED or DEACTIVATED |
| IDR-VID-004 | Deactivate UIN or Blocked UIN                      | UIN is either de-activated or blocked                                   |
| IDR-VID-006 | Uin hash does not match                            | Error while matching hash of UIN against decrypted UIN                  |
| IDR-VID-005 | Failed to retrieve uin data using Identity Service | Error while retrieving UIN details from Identity Service                |
| IDR-IDC-001 | Missing Input Parameter - %s                       | Input Parameter Missing                                                 |
| IDR-IDC-002 | Invalid Input Parameter - %s                       | Invalid Input Parameter                                                 |
| IDR-IDC-003 | Invalid Request                                    | Invalid Request attribute                                               |
| IDR-IDC-004 | Unknown error occurred                             | An unknown error occurred                                               |
| IDR-IDC-005 | Input Data Validation Failed                       | Validation on input fails                                               |
| IDR-IDC-006 | Error occurred while performing DB operations      | DB connectivity error                                                   |
| IDR-IDC-007 | No Record(s) found                                 | No VID records found                                                    |
| IDR-IDC-008 | 4XX - Client Error occurred                        | 4XX error from Kernel APIs                                              |
| IDR-IDC-009 | 5XX - Server Error occurred                        | 5XX error from Kernel APIs                                              |
| IDR-IDC-010 | Connection timed out                               | Connection timed out while invoking REST APIs                           |
| IDR-IDC-011 | Authorization Failed                               | Input role is not authorized to access the service                      |

### PATCH /idrepository/v2/vid/reactivate

This service will re-activate VIDs mapped against the provided UIN, only if the current status of VID is 'DEACTIVATED', 'INACTIVE' and not 'EXPIRED'.

#### Resource URL

`https://mosip.io/idrepository/v2/vid/reactivate`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name         | Required | Description              | Default Value        | Example                  |
| ------------ | -------- | ------------------------ | -------------------- | ------------------------ |
| id           | yes      | Id of the API            | mosip.vid.reactivate |                          |
| version      | yes      | version of the API       |                      | v2                       |
| requesttime  | yes      | timestamp of the request |                      | 2019-04-30T06:12:25.288Z |
| request      | yes      | Request Body attributes  |                      |                          |
| request: UIN | yes      | Individual's UIN         |                      | 981576026435             |

#### Request

```
{
  "id": "mosip.vid.reactivate",
  "version": "v2",
  "requesttime": "2019-05-21T06:13:05.218Z",
  "request": {
    "UIN": 981576026435
  }
}
```

#### Responses

**Success Response**

```
{
  "id": "mosip.vid.reactivate",
  "version": "v2",
  "responsetime": "2019-05-21T06:13:05.218Z",
  "response": {
    "vidStatus": ‘ACTIVE’
  }
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                      | Error Description                                        |
| ----------- | -------------------------------------------------- | -------------------------------------------------------- |
| IDR-VID-001 | VID is                                             | Here status could be REVOKED, EXPIRED, USED.             |
| IDR-VID-004 | Deactivate UIN or Blocked UIN                      | UIN is either de-activated or blocked                    |
| IDR-VID-006 | Uin hash does not match                            | Error while matching hash of UIN against decrypted UIN   |
| IDR-VID-005 | Failed to retrieve uin data using Identity Service | Error while retrieving UIN details from Identity Service |
| IDR-IDC-001 | Missing Input Parameter - %s                       | Input Parameter Missing                                  |
| IDR-IDC-002 | Invalid Input Parameter - %s                       | Invalid Input Parameter                                  |
| IDR-IDC-003 | Invalid Request                                    | Invalid Request attribute                                |
| IDR-IDC-004 | Unknown error occurred                             | An unknown error occurred                                |
| IDR-IDC-005 | Input Data Validation Failed                       | Validation on input fails                                |
| IDR-IDC-006 | Error occurred while performing DB operations      | DB connectivity error                                    |
| IDR-IDC-007 | No Record(s) found                                 | No VID records found                                     |
| IDR-IDC-008 | 4XX - Client Error occurred                        | 4XX error from Kernel APIs                               |
| IDR-IDC-009 | 5XX - Server Error occurred                        | 5XX error from Kernel APIs                               |
| IDR-IDC-010 | Connection timed out                               | Connection timed out while invoking REST APIs            |
| IDR-IDC-011 | Authorization Failed                               | Input role is not authorized to access the service       |

## Authentication Types Status Service (Internal)

Authentication Types Status Service can be used by Resident Services to retrieve or update status (locked or unlocked) of Auth Types of an Individual using VID/UIN.

### Users of Retrieve Authentication Types Status Service -

1. **Resident Services** - Individual can request to lock or unlock one or more authentication types using Resident Services, which in turn calls this service to store or retrieve the auth type status.

### GET /idauthentication/v1/internal/authtypes/status/individualIdType/:IDType/individualId/:ID

This request will retrieve status (locked or unlocked) of Auth Types of an Individual using VID/UIN.

#### Resource URL

`https://{base_url}/idauthentication/v1/internal/authtypes/status/individualIdType/:IDType/individualId/:ID`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name    | Description                                                                                                                  |
| ------- | ---------------------------------------------------------------------------------------------------------------------------- |
| ID Type | <ul><li>The page number to start</li><li>This is a mandatory parameter</li><li><strong>Default Value:</strong> VID</li></ul> |
| ID      | <ul><li>The value of IDType - UIN or VID</li><li>This is a mandatory parameter</li></ul>                                     |

#### Responses

**Success Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.identity.authtype.status.read",
  "version": "1.0",
  "requestTime": "2019-02-15T10:01:57.086+05:30",
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "request": {
    // Status of AuthTypes and AuthSubTypes
    "authTypes": [
      {
        "authType": "otp",
        "isLocked": false
      },
      {
        "authType": "demo",
        "isLocked": false
      },
      {
        "authType": "bio",
        "authSubType": "Finger",
        "isLocked": true
      },
      {
        "authType": "bio",
        "authSubType": "Iris",
        "isLocked": true
      },
      {
        "authType": "bio",
        "authSubType": "Face",
        "isLocked": true
      }
    ]
  }
}
```

**Failed Response**

**Response Code : 200 (OK)**

```
{
  //API Metadata
  "id": "mosip.identity.authtype.status.read",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "errors": [
    {
      "errorCode": "IDA-MLC-002",
      "errorMessage": "Invalid UIN",
      "actionMessage": "Please retry with the correct UIN"
    }
  ]
}
```

#### Failure Details

| Error Code  | Error Message                                                   | Description                                                   | Action Message                              |
| ----------- | --------------------------------------------------------------- | ------------------------------------------------------------- | ------------------------------------------- |
| IDA-MLC-001 | Request to be received at MOSIP within\<x> hrs/min              | Invalid Time stamp                                            | Please send the request within \<x> hrs/min |
| IDA-MLC-002 | Invalid UIN                                                     | Invalid UIN                                                   | Please retry with the correct UIN.          |
| IDA-MLC-003 | UIN has been deactivated                                        | UIN Deactivated                                               | Your UIN status is not active.              |
| IDA-MLC-007 | Request could not be processed. Please try again                | Could not process request/Unknown error; Invalid Auth Request |                                             |
| IDA-MLC-009 | Invalid Input parameter- attribute                              | Invalid Input parameter- attribute                            |                                             |
| IDA-MLC-015 | Identity Type - \<Identity Type> not configured for the country | ID Type (UIN/USERID) not supported for a country              |                                             |
| IDA-MLC-018 | %s not available in database                                    | UIN, VID not available in database                            |                                             |

### PUT /idauthentication/v1/internal/authtypes/status

This request will lock or unlock one or more authenticate types for an Individual using VID/UIN.

#### Resource URL

`https://{base_url}/idauthentication/v1/internal/authtypes/status`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                            | Required | Description                                                                                         | Default Value      | Example                       |
| ------------------------------- | -------- | --------------------------------------------------------------------------------------------------- | ------------------ | ----------------------------- |
| consentObtained                 | Y        | Individual's consent                                                                                |                    |                               |
| id                              | Y        | API Id                                                                                              | mosip.identity.otp |                               |
| version                         | Y        | API version                                                                                         |                    | 1.0                           |
| requestTime                     | Y        | Time when Request was captured                                                                      |                    | 2019-02-15T10:01:57.086+05:30 |
| individualId                    | Y        | VID                                                                                                 |                    | 9830872690593682              |
| individualIdType                | Y        | Allowed Type of Individual ID - VID, UIN                                                            | VID                |                               |
| request                         | Y        | Auth type status attributes to be applied for the Individual                                        |                    |                               |
| request: authTypes              | Y        | List of auth type status attributes to be applied for the Individual                                |                    |                               |
| request: authTypes: authType    | Y        | Auth type to lock - otp, demo, bio                                                                  |                    | bio                           |
| request: authTypes: authSubType | N        | Auth sub type to lock (if applicable for the selected autType)                                      |                    | Finger                        |
| request: authTypes: isLocked    | Y        | Boolean value (`true` or `false`) whether to lock or unlock the selected authType (and authSubType) |                    | true                          |

#### Request Body

```
{
  "id": "mosip.identity.authtype.status.update",
  "version": "1.0",
  "requestTime": "2019-02-15T10:01:57.086+05:30",
  "consentObtained": true,
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "request": {
    // AuthTypes and AuthSubTypes present in the below list can be locked or unlocked
    "authTypes": [
      {
        "authType": "otp",
        "isLocked": false
      },
      {
        "authType": "demo",
        "isLocked": false
      },
      {
        "authType": "bio",
        "authSubType": "Finger",
        "isLocked": true
      },
      {
        "authType": "bio",
        "authSubType": "Iris",
        "isLocked": true
      },
      {
        "authType": "bio",
        "authSubType": "Face",
        "isLocked": true
      }
    ]
  }
}
```

#### Responses

**Success Response**

**Response Code : 200 (OK)**

```
{
  //API Metadata
  "id": "mosip.identity.authtype.status.update",
  "version": "1.0",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "errors": null
}
```

**Failed Response**

**Response Code : 200 (OK)**

```
{
  //API Metadata
  "id": "mosip.identity.authtype.status.update",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "errors": [
    {
      "errorCode": "IDA-MLC-002",
      "errorMessage": "Invalid UIN",
      "actionMessage": "Please retry with the correct UIN"
    }
  ]
}
```

#### Failure Details

| Error Code  | Error Message                                                                   | Description                                                       | Action Message                              |
| ----------- | ------------------------------------------------------------------------------- | ----------------------------------------------------------------- | ------------------------------------------- |
| IDA-MLC-001 | Request to be received at MOSIP within\<x> hrs/min                              | Invalid Time stamp                                                | Please send the request within \<x> hrs/min |
| IDA-MLC-002 | Invalid UIN                                                                     | Invalid UIN                                                       | Please retry with the correct UIN.          |
| IDA-MLC-003 | UIN has been deactivated                                                        | UIN Deactivated                                                   | Your UIN status is not active.              |
| IDA-MLC-006 | Missing Input parameter- \<attribute> Example: Missing Input parameter- version | Missing Input parameter- attribute - all the mandatory attributes |                                             |
| IDA-MLC-007 | Request could not be processed. Please try again                                | Could not process request/Unknown error; Invalid Auth Request     |                                             |
| IDA-MLC-009 | Invalid Input parameter- attribute                                              | Invalid Input parameter- attribute                                |                                             |
| IDA-MLC-012 | Individual's Consent is not available                                           | Invalid resident consent for eKYC/Auth                            |                                             |
| IDA-MLC-015 | Identity Type - \<Identity Type> not configured for the country                 | ID Type (UIN/USERID) not supported for a country                  |                                             |
| IDA-MLC-018 | %s not available in database                                                    | UIN, VID not available in database                                |                                             |
