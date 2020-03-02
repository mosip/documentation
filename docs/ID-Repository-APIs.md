This section details about the REST services in ID Repository module.
* [ID Services](#identity-services-private)
* [VID Services](#vid-services-private)

## Identity Services (Private)
These services is used by Registration Processor to store/update during registration process and ID Authentication to retrieve Identity of an Individual for their authentication.
* [POST /idrepository/v1/identity/](#post-idrepositoryv1identity)
* [GET /idrepository/v1/identity/uin/{uin}?type=bio](#get-idrepositoryv1identityuinuintypebio)
* [GET /idrepository/v1/identity/rid/{rid}?type=bio](#get-idrepositoryv1identityridridtypebio)
* [PATCH /idrepository/v1/identity/](#patch-idrepositoryv1identity)     

#### Users of Identity service -
1. `Registration Processor` - *Registration Processor* will create a new ID record or update an existing ID record in ID repository and store corresponding demographic and bio-metric documents. *Registration Processor* can also retrieve Identity details of an Individual using RID.
2. `ID Authentication` - *ID Authentication* can retrieve Identity details of an Individual using UIN for authentication purpose.

**Note** - Identity Services does not support search based on attributes of an ID.

### POST /idrepository/v1/identity/     

This service will create a new ID record in ID repository and store corresponding demographic and bio-metric documents. 

#### Resource URL
<div>https://mosip.io/idrepository/v1/identity/</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | yes | Id of the API | mosip.id.create | 
version | yes | version of the API | | v1
requesttime | yes | timestamp of the request | | 2018-12-11T06:12:25.288Z
request | yes | Request Body attributes | | 
request: registrationId | yes | registration id | | 
request: biometricReferenceId | yes | ABIS Reference ID | | 
request: identity | yes | JSON body as per ID object schema | | 
request: documents | yes | Documents that are to be uploaded for any ID attribute | | 

#### Request:
```JSON
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

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: Identity stored successfully
```JSON
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

##### Failure details
Error Code | Error Message | Error Description
-----------|----------|-------------
IDR-IDC-001|Missing Input Parameter - %s|Input Parameter Missing
IDR-IDC-002|Invalid Input Parameter - %s|Invalid Input Parameter
IDR-IDC-003|Invalid Request|Invalid Request attribute
IDR-IDC-004|Unknown error occurred |An unknown error occurred
IDR-IDC-005|Input Data Validation Failed|Validation on input fails
IDR-IDC-006|Error occurred while performing DB operations|DB connectivity error
IDR-IDC-008|4XX - Client Error occurred|4XX error from Kernel APIs
IDR-IDC-009|5XX - Server Error occurred|5XX error from Kernel APIs
IDR-IDC-010|Connection timed out|Connection timed out while invoking REST APIs
IDR-IDC-011|Authorization Failed|Input role is not authorized to access the service
IDR-IDC-012|Record already exists in DB|Identity with input UIN or RID already exists in DB      
IDR-IDS-003|Failed to encrypt/decrypt message using Kernel Crypto Manager|Error thrown from Kernel Crypto Manager
IDR-IDS-004|Failed to store/retrieve files in DFS|Error while storing file in DFS
IDR-IDS-005|Failed to process Id Object using kernel Id Object validator|Error while validating ID Object against Id ObjectValidator
IDR-IDS-007|Failed to retrieve data from kernel Masterdata|Error while retrieving data from Kernel MasterData


### GET /idrepository/v1/identity/uin/{uin}?type=bio         

This service will retrieve an ID record from ID repository for a given UIN (Unique Identification Number) and identity type as bio/demo/all. 
1. When type=bio is selected, individualBiometrics along with Identity details of the Individual are returned
2. When type=demo is selected, Demographic documents along with Identity details of the Individual are returned
3. When type=all is selected, both individualBiometrics and demographic documents are returned along with Identity details of the Individual    

If no identity type is provided, stored Identity details of the Individual will be returned as a default response.

#### Resource URL
<div>https://mosip.io/idrepository/v1/identity/uin/{uin}?type=bio</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Responses: 
##### Success Response:
###### Status code: '200'
###### Description: Identity retrieved successfully 
```JSON
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

##### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
IDR-IDC-004|Unknown error occurred |An unknown error occurred
IDR-IDC-006|Error occurred while performing DB operations|DB connectivity error
IDR-IDC-007|No Record(s) found|Identity with input UIN does not exist
IDR-IDC-008|4XX - Client Error occurred|4XX error from Kernel APIs
IDR-IDC-009|5XX - Server Error occurred|5XX error from Kernel APIs
IDR-IDC-010|Connection timed out|Connection timed out while invoking REST APIs
IDR-IDC-011|Authorization Failed|Input role is not authorized to access the service     
IDR-IDS-001|Identity Element hash does not match|Error while matching Identity hash with hash of decrypted Identity
IDR-IDS-002|Biometric/Document hash does not match|Error while matching hash of Biometric/Document with hash of decrypted Biometric/Document
IDR-IDS-003|Failed to encrypt/decrypt message using Kernel Crypto Manager|Error thrown from Kernel Crypto Manager
IDR-IDS-004|Failed to store/retrieve files in DFS|Error while storing file in DFS
IDR-IDS-006|File(s) not found in DFS|Requested Biometric/Demographic documents not found in DFS
IDR-IDS-007|Failed to retrieve data from kernel Masterdata|Error while retrieving data from Kernel MasterData



### GET /idrepository/v1/identity/rid/{rid}?type=bio         

This operation will retrieve an ID record from ID repository for a given RID (Registration ID) and identity type as bio/demo/all. 
1. When type=bio is selected, individualBiometrics along with Identity details of Individual are returned
2. When type=demo is selected, Demographic documents along with Identity details of Individual are returned
3. When type=all is selected, both individualBiometrics and demographic documents are returned along with Identity details of Individual    

If no identity type is provided, stored latest Identity details of Individual mapped to the UIN of input RID will be returned as a default response.

#### Resource URL
<div>https://mosip.io/idrepository/v1/identity/rid/{rid}?type=bio</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Responses: 
##### Success Response:
###### Status code: '200'
###### Description: Identity retrieved successfully 
```JSON
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

##### Failure details
Error Code | Error Message | Error Description
-----------|----------|-------------
IDR-IDC-004|Unknown error occurred |An unknown error occurred
IDR-IDC-006|Error occurred while performing DB operations|DB connectivity error
IDR-IDC-007|No Record(s) found|Identity with input RID does not exist
IDR-IDC-008|4XX - Client Error occurred|4XX error from Kernel APIs
IDR-IDC-009|5XX - Server Error occurred|5XX error from Kernel APIs
IDR-IDC-010|Connection timed out|Connection timed out while invoking REST APIs
IDR-IDC-011|Authorization Failed|Input role is not authorized to access the service    
IDR-IDS-001|Identity Element hash does not match|Error while matching Identity hash with hash of decrypted Identity
IDR-IDS-002|Biometric/Document hash does not match|Error while matching hash of Biometric/Document with hash of decrypted Biometric/Document
IDR-IDS-003|Failed to encrypt/decrypt message using Kernel Crypto Manager|Error thrown from Kernel Crypto Manager
IDR-IDS-004|Failed to store/retrieve files in DFS|Error while storing file in DFS
IDR-IDS-006|File(s) not found in DFS|Requested Biometric/Demographic documents not found in DFS
IDR-IDS-007|Failed to retrieve data from kernel Masterdata|Error while retrieving data from Kernel MasterData


### PATCH /idrepository/v1/identity/     
This operation will update an existing ID record in the ID repository for a given UIN (Unique Identification Number)

#### Resource URL
<div>https://mosip.io/idrepository/v1/identity/</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | Id of the API | mosip.id.update | 
version | Y | version of the API | | v1
requesttime | Y | timestamp of the request | | 2018-12-11T06:12:25.288Z
request | Y | Request body attributes | | 
request: status | N | status of ID | | 
request: registrationId | Y | Registration id | | 
request: biometricReferenceId | N | ABIS Reference Id | | 
request: identity | M | JSON body as per the ID object schema | | 
request: identity: UIN | M | UIN for which Identity is updated | | 
request: documents | N | Documents that are to be uploaded for any ID attribute | | 

#### Request:
```JSON
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

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: Identity updated successfully
```JSON
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

##### Failure details
Error Code | Error Message | Error Description
-----------|----------|-------------
IDR-IDC-001|Missing Input Parameter - %s|Input Parameter Missing
IDR-IDC-002|Invalid Input Parameter - %s|Invalid Input Parameter
IDR-IDC-003|Invalid Request|Invalid Request attribute
IDR-IDC-004|Unknown error occurred |An unknown error occurred
IDR-IDC-005|Input Data Validation Failed|Validation on input fails
IDR-IDC-006|Error occurred while performing DB operations|DB connectivity error
IDR-IDC-008|4XX - Client Error occurred|4XX error from Kernel APIs
IDR-IDC-009|5XX - Server Error occurred|5XX error from Kernel APIs
IDR-IDC-010|Connection timed out|Connection timed out while invoking REST APIs
IDR-IDC-011|Authorization Failed|Input role is not authorized to access the service
IDR-IDC-012|Record already exists in DB|Identity with input RID already exists in DB      
IDR-IDS-001|Identity Element hash does not match|Error while matching Identity hash with hash of decrypted Identity
IDR-IDS-002|Biometric/Document hash does not match|Error while matching hash of Biometric/Document with hash of decrypted Biometric/Document
IDR-IDS-003|Failed to encrypt/decrypt message using Kernel Crypto Manager|Error thrown from Kernel Crypto Manager
IDR-IDS-004|Failed to store/retrieve files in DFS|Error while storing file in DFS
IDR-IDS-006|File(s) not found in DFS|Requested Biometric/Demographic documents not found in DFS
IDR-IDS-005|Failed to process Id Object using kernel Id Object validator|Error while validating ID Object against Id ObjectValidator
IDR-IDS-007|Failed to retrieve data from kernel Masterdata|Error while retrieving data from Kernel MasterData


## VID Services (Private)
These services can be used to perform various operations on VID like generate or re-generate VID, update VID status, etc.
* [POST /idrepository/v1/vid](#post-idrepositoryv1vid)
* [GET /idrepository/v1/vid/{vid}](#get-idrepositoryv1vidvid)
* [PATCH /idrepository/v1/vid/{vid}](#patch-idrepositoryv1vidvid)
* [POST /idrepository/v1/vid/{vid}/regenerate](#post-idrepositoryv1vidvidregenerate)
* [PATCH /idrepository/v2/vid/deactivate](#patch-idrepositoryv2viddeactivate)
* [PATCH /idrepository/v2/vid/reactivate](#patch-idrepositoryv2vidreactivate)

#### Users of VID services -
1. `Registration Processor` - *Registration Processor* will create a new perpetual VID once UIN is generated successfully.
2. `Resident Services` - Individual can use *Resident Services* to generate or re-generate a new temporary VID.
3. `ID Authentication` - *ID Authentication* can retrieve UIN for a given VID for authenticating Individual using VID.

### POST /idrepository/v1/vid        
This service will generate a new VID based on VID type provided.

#### Resource URL
<div>https://mosip.io/idrepository/v1/vid</div>

#### Resource details     
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | yes | Id of the API | mosip.vid.create | 
version | yes | version of the API | | v1
requesttime | yes | timestamp of the request | | 2019-04-30T06:12:25.288Z
request | yes | Request Body attributes | | 
request: vidType | yes | VID Type |  | Perpetual or Temporary 
request: UIN| yes | Individual's UIN |  | 981576026435

#### Request:
```JSON
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

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: VID created successfully
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

##### Failure details
Error Code | Error Message | Error Description
-----------|----------|-------------
IDR-VID-002|Failed to generate VID|Error while generating VID
IDR-VID-003|Could not generate/regenerate VID as per policy|Error while generating VID based on policy
IDR-VID-004|Deactivate UIN or Blocked UIN|UIN is either de-activated or blocked
IDR-VID-005|Failed to retrieve uin data using Identity Service|Error while retrieving UIN details from Identity Service
IDR-IDC-001|Missing Input Parameter - %s|Input Parameter Missing
IDR-IDC-002|Invalid Input Parameter - %s|Invalid Input Parameter
IDR-IDC-003|Invalid Request|Invalid Request attribute
IDR-IDC-004|Unknown error occurred |An unknown error occurred
IDR-IDC-005|Input Data Validation Failed|Validation on input fails
IDR-IDC-006|Error occurred while performing DB operations|DB connectivity error
IDR-IDC-008|4XX - Client Error occurred|4XX error from Kernel APIs
IDR-IDC-009|5XX - Server Error occurred|5XX error from Kernel APIs
IDR-IDC-010|Connection timed out|Connection timed out while invoking REST APIs
IDR-IDC-011|Authorization Failed|Input role is not authorized to access the service    
 


### GET /idrepository/v1/vid/{vid}        
This service will retrieve associated decrypted UIN for a given VID, once VID is successfully validated.

#### Resource URL
<div>https://mosip.io/idrepository/v1/vid/{vid}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes


#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: UIN for a given VID retrieved successfully
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


##### Failure details
Error Code | Error Message | Error Description
-----------|----------|-------------
IDR-VID-001|VID is <vid-status>|Here status could be REVOKED, EXPIRED, USED, INVALIDATED or DEACTIVATED
IDR-VID-004|<uin-status> UIN |Here, uin-status could be either de-activated or blocked
IDR-VID-005|Failed to retrieve uin data using Identity Service|Error while retrieving UIN details from Identity Service
IDR-VID-006|Uin hash does not match|Error while matching hash of UIN against decrypted UIN 
IDR-IDC-004|Unknown error occurred |An unknown error occurred
IDR-IDC-006|Error occurred while performing DB operations|DB connectivity error
IDR-IDC-007|No Record(s) found|Input VID does not exist in DB
IDR-IDC-008|4XX - Client Error occurred|4XX error from Kernel APIs
IDR-IDC-009|5XX - Server Error occurred|5XX error from Kernel APIs
IDR-IDC-010|Connection timed out|Connection timed out while invoking REST APIs
IDR-IDC-011|Authorization Failed|Input role is not authorized to access the service    



### PATCH /idrepository/v1/vid/{vid}   
This service will update status associated with a given VID, if the current status of VID is 'ACTIVE'.

#### Resource URL
<div>https://mosip.io/idrepository/v1/vid/{vid}</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | yes | Id of the API | mosip.vid.update | 
version | yes | version of the API | | v1
requesttime | yes | timestamp of the request | | 2019-04-30T06:12:25.288Z
request | yes | Request Body attributes | | 
request: vidStatus | yes | status of VID | | USED or REVOKED or EXPIRED

#### Request:
```JSON
{
  "id": "mosip.vid.update",
  "version": "v1",
  "requesttime": "2019-04-30T06:12:25.288Z",
  "request": {
    "vidStatus": 'REVOKED'
  }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: VID status updated successfully
```JSON
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



##### Failure details
Error Code | Error Message | Error Description
-----------|----------|-------------
IDR-VID-001|VID is DEACTIVATED or VID is REVOKED|VID is REVOKED,EXPIRED,USED,INVALIDATED or DEACTIVATED
IDR-VID-004|Deactivate UIN or Blocked UIN|UIN is either de-activated or blocked
IDR-VID-005|Failed to retrieve uin data using Identity Service|Error while retrieving UIN details from Identity Service
IDR-VID-006|Uin hash does not match|Error while matching hash of UIN against decrypted UIN 
IDR-IDC-004|Unknown error occurred |An unknown error occurred
IDR-IDC-006|Error occurred while performing DB operations|DB connectivity error
IDR-IDC-007|No Record(s) found|Input VID does not exist in DB
IDR-IDC-008|4XX - Client Error occurred|4XX error from Kernel APIs
IDR-IDC-009|5XX - Server Error occurred|5XX error from Kernel APIs
IDR-IDC-010|Connection timed out|Connection timed out while invoking REST APIs
IDR-IDC-011|Authorization Failed|Input role is not authorized to access the service   



### POST /idrepository/v1/vid/{vid}/regenerate   
This service will re-generate VID for a given VID, only if the current status of VID is 'ACTIVE', 'USED', or 'EXPIRED'.

#### Resource URL
<div>https://mosip.io/idrepository/v1/vid/{vid}/regenerate</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: VID re-generated successfully
```JSON
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


##### Failure details
Error Code | Error Message | Error Description
-----------|----------|-------------
IDR-VID-002|Failed to generate VID|Error while generating VID
IDR-VID-003|Could not generate/regenerate VID as per policy|Error while generating VID based on policy
IDR-VID-004|Deactivate UIN or Blocked UIN|UIN is either de-activated or blocked
IDR-VID-005|Failed to retrieve uin data using Identity Service|Error while retrieving UIN details from Identity Service
IDR-VID-006|Uin hash does not match|Error while matching hash of UIN against decrypted UIN 
IDR-IDC-001|Missing Input Parameter - %s|Input Parameter Missing
IDR-IDC-002|Invalid Input Parameter - %s|Invalid Input Parameter
IDR-IDC-003|Invalid Request|Invalid Request attribute
IDR-IDC-004|Unknown error occurred |An unknown error occurred
IDR-IDC-005|Input Data Validation Failed|Validation on input fails
IDR-IDC-006|Error occurred while performing DB operations|DB connectivity error
IDR-IDC-008|4XX - Client Error occurred|4XX error from Kernel APIs
IDR-IDC-009|5XX - Server Error occurred|5XX error from Kernel APIs
IDR-IDC-010|Connection timed out|Connection timed out while invoking REST APIs
IDR-IDC-011|Authorization Failed|Input role is not authorized to access the service   


### PATCH /idrepository/v2/vid/deactivate   
This service will de-activate VIDs mapped against the provided UIN, only if the current status of VID is 'ACTIVE'.

#### Resource URL
<div>https://mosip.io/idrepository/v2/vid/deactivate</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | yes | Id of the API | mosip.vid.deactivate| 
version | yes | version of the API | | v2
requesttime | yes | timestamp of the request | | 2019-04-30T06:12:25.288Z
request | yes | Request Body attributes | | 
request: UIN| yes | Individual's UIN | | 981576026435

#### Request:
```JSON
{
  "id": "mosip.vid.deactivate",
  "version": "v2",
  "requesttime": "2019-05-21T06:13:05.218Z",
  "request": {
    "UIN": 981576026435
  }
}
```
#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: VIDs de-activated successfully
```JSON
{
  "id": "mosip.vid.deactivate",
  "version": "v2",
  "responsetime": "2019-05-21T06:13:05.218Z",
  "response": {
    "vidStatus": 'DEACTIVATED'
  }
}
```

##### Failure details
Error Code | Error Message | Error Description
-----------|----------|-------------
IDR-VID-001|VID is <vid-status>|Here status could be REVOKED, EXPIRED, USED, INVALIDATED or DEACTIVATED
IDR-VID-004|Deactivate UIN or Blocked UIN|UIN is either de-activated or blocked
IDR-VID-006|Uin hash does not match|Error while matching hash of UIN against decrypted UIN 
IDR-VID-005|Failed to retrieve uin data using Identity Service|Error while retrieving UIN details from Identity Service
IDR-IDC-001|Missing Input Parameter - %s|Input Parameter Missing
IDR-IDC-002|Invalid Input Parameter - %s|Invalid Input Parameter
IDR-IDC-003|Invalid Request|Invalid Request attribute
IDR-IDC-004|Unknown error occurred |An unknown error occurred
IDR-IDC-005|Input Data Validation Failed|Validation on input fails
IDR-IDC-006|Error occurred while performing DB operations|DB connectivity error
IDR-IDC-007|No Record(s) found|No VID records found
IDR-IDC-008|4XX - Client Error occurred|4XX error from Kernel APIs
IDR-IDC-009|5XX - Server Error occurred|5XX error from Kernel APIs
IDR-IDC-010|Connection timed out|Connection timed out while invoking REST APIs
IDR-IDC-011|Authorization Failed|Input role is not authorized to access the service   

### PATCH /idrepository/v2/vid/reactivate   
This service will re-activate VIDs mapped against the provided UIN, only if the current status of VID is 'DEACTIVATED', 'INACTIVE' and not 'EXPIRED'.

#### Resource URL
<div>https://mosip.io/idrepository/v2/vid/reactivate</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | yes | Id of the API | mosip.vid.reactivate| 
version | yes | version of the API | | v2
requesttime | yes | timestamp of the request | | 2019-04-30T06:12:25.288Z
request | yes | Request Body attributes | | 
request: UIN| yes | Individual's UIN | | 981576026435

#### Request:
```JSON
{
  "id": "mosip.vid.reactivate",
  "version": "v2",
  "requesttime": "2019-05-21T06:13:05.218Z",
  "request": {
    "UIN": 981576026435
  }
}
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: VIDs re-activated successfully
```JSON
{
  "id": "mosip.vid.reactivate",
  "version": "v2",
  "responsetime": "2019-05-21T06:13:05.218Z",
  "response": {
    "vidStatus": ‘ACTIVE’
  }
}
```

##### Failure details
Error Code | Error Message | Error Description
-----------|----------|-------------
IDR-VID-001|VID is <vid-status>|Here status could be REVOKED, EXPIRED, USED.
IDR-VID-004|Deactivate UIN or Blocked UIN|UIN is either de-activated or blocked
IDR-VID-006|Uin hash does not match|Error while matching hash of UIN against decrypted UIN 
IDR-VID-005|Failed to retrieve uin data using Identity Service|Error while retrieving UIN details from Identity Service
IDR-IDC-001|Missing Input Parameter - %s|Input Parameter Missing
IDR-IDC-002|Invalid Input Parameter - %s|Invalid Input Parameter
IDR-IDC-003|Invalid Request|Invalid Request attribute
IDR-IDC-004|Unknown error occurred |An unknown error occurred
IDR-IDC-005|Input Data Validation Failed|Validation on input fails
IDR-IDC-006|Error occurred while performing DB operations|DB connectivity error
IDR-IDC-007|No Record(s) found|No VID records found
IDR-IDC-008|4XX - Client Error occurred|4XX error from Kernel APIs
IDR-IDC-009|5XX - Server Error occurred|5XX error from Kernel APIs
IDR-IDC-010|Connection timed out|Connection timed out while invoking REST APIs
IDR-IDC-011|Authorization Failed|Input role is not authorized to access the service   