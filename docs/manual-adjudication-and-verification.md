# Manual Adjudication and Verification

* When biometric duplicates are found in ABIS, the MOSIP system sends a request for manual adjudication to the Manual Adjudication System via a queue. 
* The system integrator can build the Manual Adjudication System, which would be listening to the `MOSIP-to-ManualAdjudication` queue for any manual adjudication requests and sends a response back in the `ManualAdjudication-to-MOSIP` system after verifying the data.
* The data sent to the Manual Adjudication System is driven by a policy defined in MOSIP and the specification is similar to ABIS identify request.

The manual adjudication stage in [registration processor](https://docs.mosip.io/1.2.0/modules/registration-processor) performs the following functions:
* Sends the applicant's demographic and biometric information (via queue + Datashare) to Manual Adjudication System (MAS).
* Receives decision from MAS and accordingly forwards the packets.
* If rejected, notifies the applicant.

### Manual Adjudication request to Queue is as follows:

```
{
  "id": "mosip.manual.adjudication.adjudicate",
  "version": "1.0",
  "requestId": "987654321-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2019-02-14T12:40:59.768Z",
  "referenceId": "27847657360002520181208123456",
  "referenceURL": "<datashare url for regid>",
  "gallery": {
    "referenceIds": [
      {
        "referenceId": "27847657360002520181208123451",
        "referenceURL": "<data share for matchedRegId>"
      },
      {
        "referenceId": "27847657360002520181208123452",
        "referenceURL": "<data share for matchedRegId>"
      }
    ],
    "addtional": [
      {
        "abisId": "<abis app code>",
        "response": "<abis response text received>"
      }
    ]
  }
}
```
#### Request parameters 

`requestId`: request_id that is associated with each request present in `reg_manual_verification` table.

`referenceId`: reg_id that is associated with each request present in `reg_manual_verification` table.

`referenceURL`: Datashare url of biometrics, demographics(identity), audits, metainfo, documents of reg_id

`gallery`: contains the matched ref_id and referenceURL of matched ref_id.

### Sample request

```
{
  "id": "mosip.manual.adjudication.adjudicate",
  "version": "1.0",
  "requestId": "4d4f27d3-ec73-41c4-a384-bf87fce4969e",
  "referenceId": "10002100741000320210107125533",
  "requesttime": "2021-01-19T07:16:22.930Z",
  "referenceURL": "http://datashare-service/v1/datashare/get/mpolicy-default-adjudication/mpartner-default-adjudication/mpartner-default-adjudicationmpolicy-default-adjudication202011110619201EpLEjvD",
  "addtional": null,
  "gallery": {
    "referenceIds": [
      {
        "referenceId": "10002100741000120210107111325",
        "referenceURL": "http://datashare-service/v1/datashare/get/mpolicy-default-adjudication/mpartner-default-adjudication/mpartner-default-adjudicationmpolicy-default-adjudication202137493575474iefnvvsD"
      }
    ]
  }
}
```

### Manual adjudication response structure from MAS

```
{
  "id": "mosip.manual.adjudication.adjudicate",
  "requestId": "987654321-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2019-02-14T12:40:59.768Z",
  "returnValue": "1",
  "candidateList": {
    "count": "1",
    "candidates": [
      {
        "referenceId": "27847657360002520181208123451",
        "analytics": {
          //This section is optional 
          "primaryOperatorID": "110011",
          "primaryOperatorComments": "<comments provided by operator>",
          "secondaryOperatorID": "110012",
          "secondaryOperatorComments": "<comments provided by operator>",
          "key1": "value1",
          "key2": "value2"
        }
      }   
    ],
    "analytics": {
      // This section is optional
      "key1": "value1",
      "key2": "value2"
    }
  }
}
```

#### Response parameters

`returnValue`:   1-Success, 2-Failure

`candidateList`: It contains matched candidate referenceIds, count and analytics.

### Scenario: No match

#### Response structure- Not Matched (No Duplicate Profile found)

```json
{
  "id": "mosip.manual.adjudication.adjudicate",
  "requestId": "c278b2f1-29f7-4d1a-9fa7-e93e3f932816",
  "responsetime": "2022-09-23T06:31:31.7456782+00:00",
  "returnValue": "1",
  "candidateList": {
    "count": "0",
    "candidates": [],
    "analytics": null
  }
}
```

### Scenario: There are matches


#### Response structure

```json
{
  "id": "mosip.manual.adjudication.adjudicate",
  "requestId": "58d5bb0e-e65e-4907-b452-81edbfd3ae46",
  "responsetime": "2022-09-23T06:33:11.9869624+00:00",
  "returnValue": "1",
  "candidateList": {
    "count": "1",
    "candidates": [
      {
        "referenceId": "10001100010000620220923053704",
        "analytics": {
          "primaryOperatorID": "admin",
          "primaryOperatorComments": "MATCHED",
          "Face": "F",
          "Finger": "Right_Thumb,Right_Index,Right_Middle,Right_Ring,Right_Little,Left_Thumb,Left_Index,Left_Middle,Left_Ring,Left_Little",
          "Iris": "Right_Iris,Left_Iris"
        }
      }
    ],
    "analytics": null
  }
}
```

## Datashare structure 

Datashare contains biometrics, identity documents, metainfo, audits related to particular rid and the datashare URL contains encrypted form of this data.

_Note_: Datashare encryption using partner key and decryption in MAS is using private key of that partner.

### Sample Request URL

GET https://datashare-service/v1/datashare/get/mpolicy-default-adjudication/mpartner-default-adjudication/mpartner-default-adjudicationmpolicy-default-adjudication202011110619201EpLEjvD

### Sample Encrypted Response

{% hint style="info" %}

**The structure of the encrypted data downloaded from referenceURL in MOSIP 1.2.0 or later versions.** 
The data downloaded would be URL-safe base64 encoded. Hence, after decoding the data will be in the below format. It will be divided into two parts after splitting using #KEY_SPLITTER#.

{% endhint %}

| Encrypted Key Data | KEY\_SPLITTER   | Encrypted Actual Data |
| ------------------ | --------------- | --------------------- |
| Block 1            | #KEY\_SPLITTER# | Block 2               |

{% hint style="info" %}


**Block 1:**

Block 1, i.e. the encrypted key data is again split into three parts,
•	The 1st part is _**VER_BYTES**_ (version bytes). The Current version constant is set as VER_R2 and this is present in the first 6 bytes of Block 1.

•	The 2nd part is the _**Certificate Thumbprint**_ i.e. the key identifier which is present in the next 32 bytes after VER_BYTES.

•	The 3rd part is the _**Encrypted Random AES Key**_, encrypted with the RSA OAEP - SHA256-MFG1. This constitutes the remaining 256 bytes of Block 1.


**Block 2:**

Block 2, i.e. the encrypted actual data is again split into two parts,

•	The 1st part is the random 32 bytes which will be used as _**AAD**_ in AES encryption (first 32 bytes). From this 32 bytes AAD data, the first 12 bytes is _**IV/Nonce**_.

•	The 2nd part is the encrypted data which is encrypted using AES GCM PKCS5Padding.

**The structure of the encrypted data downloaded from referenceURL in MOSIP 1.1.5.5 or prior versions.**

The data downloaded would be base64 encoded. Hence, after decoding the data will be in the below format. It will be divided into two parts after splitting using #KEY_SPLITTER#.

{% endhint %}

| Encrypted Key Data | KEY\_SPLITTER   | Encrypted Actual Data |
| ------------------ | --------------- | --------------------- |
| Block 1            | #KEY\_SPLITTER# | Block 2               |

{% hint style="info" %}
**Block 1:**

Block 1, i.e. the encrypted key data is again split into two parts,

* The first part is the _**Certificate Thumbprint**_ i.e. the key identifier which is the first 32 bytes in Block 1.
* The second part is the _**Encrypted Random AES Key**_ which is encrypted with RSA OAEP - SHA256-MFG1. This constitutes the remaining 256 bytes of Block 1.

**Block 2:**

Block 2, i.e. the encrypted actual data is again split into two parts,

* The 1st part is the _**Encrypted data**_, encrypted using AES GCM PKCS5Padding.
* The 2nd part is _**IV/Nonce**_ i.e. the last 32 bytes appended after encrypted data.

{% endhint %}

### Sample response in case of Authentication Failure

```
{
  "id": null,
 "version": null,
  "responsetime": "2021-02-05T06:29:48.257Z",
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
### Possible Error Codes and messages from Datashare URL

|Error Code  |	Error Message   |
|------------|------------------|
|DAT-SER-003 |	File does not exist or File is empty |
|DAT-SER-006 |	Data share not found |
|DAT-SER-006 |	Data share usage expired |
|KER-ATH-401 | Authentication failed |
|KER-ATH-403 | Forbidden |

### Policy structure

`partner Id`: `mpartner-default-adjudication`
`policy Id`: `mpolicy-default-adjudication`

```
{
  "shareableAttributes": [
    {
      "attributeName": "biometrics",
      "group": "CBEFF",
      "source": [
        {
          "attribute": "registration-client/NEW/individualBiometrics",
          "filter": [
            {
              "type": "Iris"
            }
          ]
        },
        {
          "attribute": "CNIE/verification/biometrics",
          "filter": [
            {
              "type": "Finger"
            }
          ]
        },
        {
          "attribute": "CNIE/verification/biometrics",
          "filter": [
            {
              "type": "Face"
            }
          ]
        }
      ],
      "encrypted": true,
      "format": "extraction"
    },
    {
      "attributeName": "fullName",
      "source": [
        {
          "attribute": "fullName"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "dateOfBirth",
      "source": [
        {
          "attribute": "dateOfBirth"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "gender",
      "source": [
        {
          "attribute": "gender"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "phone",
      "source": [
        {
          "attribute": "phone"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "email",
      "source": [
        {
          "attribute": "email"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "addressLine1",
      "source": [
        {
          "attribute": "addressLine1"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "addressLine2",
      "source": [
        {
          "attribute": "addressLine2"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "addressLine3",
      "source": [
        {
          "attribute": "addressLine3"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "region",
      "source": [
        {
          "attribute": "region"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "province",
      "source": [
        {
          "attribute": "province"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "city",
      "source": [
        {
          "attribute": "city"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "postalCode",
      "source": [
        {
          "attribute": "postalCode"
        }
      ],
      "encrypted": true
    }
  ],
  "dataSharePolicies": {
    "typeOfShare": "Data Share",
    "validForInMinutes": "30",
    "transactionsAllowed": "100000",
    "encryptionType": "none",
    "shareDomain": "datashare.datashare",
    "source": "Packet Manager"
  }
}
```

### Configuration used in Manual adjudication

```
registration.processor.queue.manual.adjudication.request
registration.processor.queue.manual.adjudication.request.messageTTL
registration.processor.manual.adjudication.policy.id
registration.processor.manual.adjudication.subscriber.id
registration.processor.manual.adjudication.subscriber.id
mosip.regproc.data.share.protocol
mosip.regproc.data.share.internal.domain.name
registration.processor.queue.manual.adjudication.request
registration.processor.queue.manual.adjudication.request.messageTTL
registration.processor.manual.adjudication.policy.id
registration.processor.manual.adjudication.subscriber.id
registration.processor.manual.adjudication.subscriber.id
mosip.regproc.data.share.protocol
mosip.regproc.data.share.internal.domain.name
```

In `registration-processor-default.properties`, the possible Error codes are as follows:

|Error Code  |	Error Message   |
|------------|------------------|
|RPR-MVS-000|   manual verification failed |
|RPR-MVS-001|  Registration Id should not empty or null|
|RPR-MVS-002|   No matched reference id found for given RID|
|RPR-MVS-025|   Manual adjudication failed|
|RPR-MVS-022|   Registration Id should not empty or null|
|RPR-MVS-022|   `TablenotAccessibleException` in Manual verification|
|RPR-MVS-021|   Manual verification rejected|
|RPR-MVS-025|   Manual verification resend to queue|
|RPR-SYS-012|  IO EXCEPTION|

## Verification

This stage is applicable only if required biometrics are not present in the packet as per country configuration.
* Sends applicant's demographic  documents (via Queue + Datashare) to external Verification System (VS).
* Receives decision from VS and accordingly forwards the packets.
* If rejected, notifies the applicant.


### Verification request to Queue is as follows:

```
{
  "id": "mosip.verification.adjudicate",
  "version": "1.0",
  "requestId": "987654321-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2019-02-14T12:40:59.768Z",
  "referenceId": "27847657360002520181208123456",
  "referenceURL": "<datashare url for regid>",
    "addtional": [
      {
        "abisId": "<abis app code>",
        "response": "<abis response text received>"
      }
    ]
  }
}
```

`requestId`: verification_request_id that is associated with each request present in `reg_verification table`.

`referenceId`: reg_id  that is associated with each request present in `reg_verification` table.

`referenceURL`: Datashare URL of biometrics, demographics(identity) ,audits, metainfo, documents of   reg_id  .


#### Sample request
```
{
  "id": " mosip.verification.adjudicate ",
  "version": "1.0",
  "requestId": "4d4f27d3-ec73-41c4-a384-bf87fce4969e",
  "referenceId": "10002100741000320210107125533",
  "requesttime": "2021-01-19T07:16:22.930Z",
  "referenceURL": "http://datashare-service/v1/datashare/get/mpolicy-default-adjudication/mpartner-default-adjudication/mpartner-default-adjudicationmpolicy-default-adjudication202011110619201EpLEjvD",
  "addtional": null,
}
```

#### Sample Response 

```
{
  "id": " mosip.verification.adjudicate ",
  "requestId": "4d4f27d3-ec73-41c4-a384-bf87fce4969e",
  "responsetime": "2021-01-19T13:16:22.930Z",
  "returnValue": "1"
}
```

**Response parameters**

`returnValue`:  1-success,  2-failure 

### Datashare structure 

Datashare contains biometrics, identity, documents, metainfo, audits related to particular `rid` and datashare URL contains encrypted form of this data.

_Note_: Datashare encryption using partner key and decryption in MAS is using private key of that partner.

#### Sample request URL

GET https://datashare-service/v1/datashare/get/mpolicy-default-adjudication/mpartner-default-adjudication/mpartner-default-adjudicationmpolicy-default-adjudication202011110619201EpLEjvD

#### Sample Encrypted Response

{% hint style="info" %}

**The structure of the encrypted data downloaded from referenceURL in MOSIP 1.2.0 or later versions.** 
The data downloaded would be URL-safe base64 encoded. Hence, after decoding the data will be in the below format. It will be divided into two parts after splitting using #KEY_SPLITTER#.

{% endhint %}

| Encrypted Key Data | KEY\_SPLITTER   | Encrypted Actual Data |
| ------------------ | --------------- | --------------------- |
| Block 1            | #KEY\_SPLITTER# | Block 2               |

{% hint style="info" %}

**Block 1:**

Block 1, i.e. the encrypted key data is again split into three parts,
•	The 1st part is _**VER_BYTES**_ (version bytes). The Current version constant is set as VER_R2 and this is present in the first 6 bytes of Block 1.

•	The 2nd part is the _**Certificate Thumbprint**_ i.e. the key identifier which is present in the next 32 bytes after VER_BYTES.

•	The 3rd part is the _**Encrypted Random AES Key**_, encrypted with the RSA OAEP - SHA256-MFG1. This constitutes the remaining 256 bytes of Block 1.

**Block 2:**

Block 2, i.e. the encrypted actual data is again split into two parts,

•	The 1st part is the random 32 bytes which will be used as _**AAD**_ in AES encryption (first 32 bytes). From this 32 bytes AAD data, the first 12 bytes is _**IV/Nonce**_.

•	The 2nd part is the encrypted data which is encrypted using AES GCM PKCS5Padding.

**The structure of the encrypted data downloaded from referenceURL in MOSIP 1.1.5.5 or prior versions.**

The data downloaded would be base64 encoded. Hence, after decoding the data will be in the below format. It will be divided into two parts after splitting using #KEY_SPLITTER#.

{% endhint %}

| Encrypted Key Data | KEY\_SPLITTER   | Encrypted Actual Data |
| ------------------ | --------------- | --------------------- |
| Block 1            | #KEY\_SPLITTER# | Block 2               |

{% hint style="info" %}
**Block 1:**

Block 1, i.e. the encrypted key data is again split into two parts,

* The first part is the _**Certificate Thumbprint**_ i.e. the key identifier which is the first 32 bytes in Block 1.
* The second part is the _**Encrypted Random AES Key**_ which is encrypted with RSA OAEP - SHA256-MFG1. This constitutes the remaining 256 bytes of Block 1.

**Block 2:**

Block 2, i.e. the encrypted actual data is again split into two parts,

* The 1st part is the _**Encrypted data**_, encrypted using AES GCM PKCS5Padding.
* The 2nd part is _**IV/Nonce**_ i.e. the last 32 bytes appended after encrypted data.

{% endhint %}


### Sample Response in case of Authentication Failure
```
{
  "id": null,
 "version": null,
  "responsetime": "2021-02-05T06:29:48.257Z",
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
**Possible Error codes and Messages from Datashare URL**

|Error Code  |	Error Message   |
|------------|------------------|
|DAT-SER-003|	File does not exists or File is empty|
|DAT-SER-006|	Data share not found|
|DAT-SER-006|	Data share usage expired|
|KER-ATH-401|	Authentication Failed|
|KER-ATH-403|	Forbidden|


### Policy structure

`partner Id`: mpartner-default-adjudication
`policy Id`: mpolicy-default-adjudication
 
``` 
{
  "shareableAttributes": [
    {
      "attributeName": "biometrics",
      "group": "CBEFF",
      "source": [
        {
          "attribute": "registration-client/NEW/individualBiometrics",
          "filter": [
            {
              "type": "Iris"
            }
          ]
        },
        {
          "attribute": "CNIE/verification/biometrics",
          "filter": [
            {
              "type": "Finger"
            }
          ]
        },
        {
          "attribute": "CNIE/verification/biometrics",
          "filter": [
            {
              "type": "Face"
            }
          ]
        }
      ],
      "encrypted": true,
      "format": "extraction"
    },
    {
      "attributeName": "fullName",
      "source": [
        {
          "attribute": "fullName"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "dateOfBirth",
      "source": [
        {
          "attribute": "dateOfBirth"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "gender",
      "source": [
        {
          "attribute": "gender"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "phone",
      "source": [
        {
          "attribute": "phone"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "email",
      "source": [
        {
          "attribute": "email"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "addressLine1",
      "source": [
        {
          "attribute": "addressLine1"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "addressLine2",
      "source": [
        {
          "attribute": "addressLine2"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "addressLine3",
      "source": [
        {
          "attribute": "addressLine3"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "region",
      "source": [
        {
          "attribute": "region"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "province",
      "source": [
        {
          "attribute": "province"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "city",
      "source": [
        {
          "attribute": "city"
        }
      ],
      "encrypted": true
    },
    {
      "attributeName": "postalCode",
      "source": [
        {
          "attribute": "postalCode"
        }
      ],
      "encrypted": true
    }
  ],
  "dataSharePolicies": {
    "typeOfShare": "Data Share",
    "validForInMinutes": "30",
    "transactionsAllowed": "100000",
    "encryptionType": "none",
    "shareDomain": "datashare.datashare",
    "source": "Packet Manager"
  }
}
```

### Configuration used in Verification

```
registration.processor.queue.verification.request
registration.processor.queue.verification.request.messageTTL
registration.processor.verification.policy.id
registration.processor.verification.subscriber.id
activemq.message.format
mosip.regproc.data.share.protocol
mosip.regproc.data.share.internal.domain.name
```

### Error Codes


|Error Code  |	Error Message   |
|------------|------------------|
|RPR-MVS-004|  No Assigned Record Found| 
|RPR-MVS-025|  Multiple rids found for a reference id|
|RPR-MVS-022|  TablenotAccessibleException in Manual verification|
|RPR-VER-002|   Verification failed|
|RPR-VER-004|  Resend for verification| 
|RPR-MVS-016|  Reg Id should not be null or empty|
|RPR-MVS-021|   Manual verification rejected|








