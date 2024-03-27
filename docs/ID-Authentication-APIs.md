# ID Authentication APIs

This section details about the REST services in ID Authentication module.

* [Authentication Service](ID-Authentication-APIs.md#authentication-service-public)
* [eKYC Service](ID-Authentication-APIs.md#ekyc-service-public)
* [OTP Request Service](ID-Authentication-APIs.md#otp-request-service-public)
* [Internal Authentication Service](ID-Authentication-APIs.md#authentication-service-internal)
* [Authentication Transactions Service](ID-Authentication-APIs.md#authentication-transactions-service-internal)
* [Authentication Type Status Service](ID-Authentication-APIs.md#authentication-types-status-service-internal)

## Authentication Service (Public)

This service details authentication methods that can be used by authentication partners to authenticate an individual. Below are various authentication types currently supported by this service:

* OTP based - OTP (Time based OTP)
* Demographic based - Name, Date of Birth, Age, Gender, Address, Full Address
* Biometric based - Fingerprint, Iris and Face

### Users of Authentication service

1. **MISP (MOSIP Infrastructure Service Provider)** - MISP's role is limited to infrastructure provisioning and acting as a gate keeper for all authentication requests sent to this service. The MISP is also responsible for the policy creation on the MOSIP servers so their partners will follow the set policy.
2. **Authentication Partners** - Authentication Partners register themselves with MOSIP, under a MISP. Authentication requests are captured by authentication partners and sent to MOSIP, via MISP.
3. **Partner-API-Key** - Associated against a policy.

### POST /idauthentication/v1/auth/

This request will authenticate an individual, based on provided authentication type(s).

#### Resource URL

`https://{base_url}/idauthentication/v1/auth/{:MISP-LicenseKey}/{:Auth-Partner-ID}/{:Partner-Api-Key}`

#### Resource Details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Header Parameters

| Name          | Required | Description                                 |
| ------------- | -------- | ------------------------------------------- |
| Authorization | Y        | For consent token                           |
| Signature     | Y        | For signature of the authentication request |

#### Request Path Parameters

| Name            | Required | Description                                                  |
| --------------- | -------- | ------------------------------------------------------------ |
| MISP-LicenseKey | Y        | License key provided to the MISP                             |
| eKYC-Partner-ID | Y        | Partner ID of the authentication partner sending the request |
| Partner-API-Key | Y        | API Key associated to the partner and the policy             |

#### Request Body Parameters

| Name                 | Required | Description                                                                                                                                                                                                                                   |
| -------------------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id                   | Y        | This represents the API ID. The value here should be "mosip.identity.auth".                                                                                                                                                                   |
| version              | Y        | This represents the version of the API.                                                                                                                                                                                                       |
| transactionID        | Y        | This represents the Transaction ID of the request.                                                                                                                                                                                            |
| requestTime          | Y        | This represents the time when request was created. Ex: "2019-02-15T10:01:57.086+05:30".                                                                                                                                                       |
| env                  | Y        | This represents the environment. Allowed values are "Staging"                                                                                                                                                                                 |
| domainUri            | Y        | This represents the Unique URI per auth providers. This can be used to federate across multiple providers or countries or unions.                                                                                                             |
| requestedAuth        | Y        | This represents the authentication types requested.                                                                                                                                                                                           |
| requestedAuth.otp    | Y        | This is used to inform that OTP authentication was performed as part of this request. Default Value here is false. Allowed values are true or false.                                                                                          |
| requestedAuth.demo   | Y        | This is used to inform that demographic authentication was performed as part of this request. Default value here is false. Allowed values are true or false.                                                                                  |
| requestedAuth.bio    | Y        | This is used to inform that biometric authentication was performed as part of this request. Default Value here is false. Allowed values are true or false.                                                                                    |
| individualId         | Y        | This represents the ID of resident (VID or UIN). Ex: "9830872690593682".                                                                                                                                                                      |
| individualIdType     | Y        | ID Type used for authentication. Allowed Types of ID - VID, UIN. Default value here is VID.                                                                                                                                                   |
| consentObtained      | Y        | If consent of residnet is obtained? Default value here is true.                                                                                                                                                                               |
| thumbprint           | Y        | Thumbprint of public key certificate used for encryption of sessionKey. This will be used during key rotation                                                                                                                                 |
| requestSessionKey    | Y        | Symmetric Key to be created, and then encrypt the generated Symmetric Key using 'MOSIP Public Key' shared to Partner, and then Base-64-URL encoded. Algorithm used for encryption can be RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING.               |
| requestHMAC          | Y        | SHA-256 hash of request block before encryption. Encryption is done using 'requestSessionKey' and then base64URL encoded. Algorithm used for encryption can be AES/GCM/PKCS5Padding.                                                          |
| request              | Y        | Request block to be used for authenticating the resident. This is encrypted using 'requestSessionKey' and then base64URL encoded. Algorithm used for encryption can be AES/GCM/PKCS5Padding.                                                  |
| request.otp          | N        | OTP used for authentication. This is mandatory when requestedAuth.otp is true.                                                                                                                                                                |
| request.timestamp    | N        | Timestamp when request block was captured.                                                                                                                                                                                                    |
| request.demographics | N        | Demographic data of the residnet. This is mandatory when requestedAuth.demo is true.                                                                                                                                                          |
| request.biometrics   | N        | Biometric data of an Individual which is sent in the response from the Capture API of SBI spec v1.0. Refer to the [SBI spec v1.0](broken-reference) specification for complete information. This is mandatory when requestedAuth.bio is true. |

#### Request Body

```
{
  "id": "mosip.identity.auth",
  "version": "v1",
  "requestTime": "2019-02-15T10:01:57.086+05:30",
  "env": "<Target environment>",
  "domainUri": "<URI of the authentication server>",
  "transactionID": "<Transaction ID of the authentication request>",
  "requestedAuth": {
    "otp": true,
    "demo": false,
    "bio": false
  },
  "consentObtained": true,
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "thumbprint": "<Thumbprint of the public key certficate used for enryption of sessionKey. This is necessary for key rotaion>",
  "requestSessionKey": "<Encrypted and Base64-URL-encoded session key>",
  "requestHMAC": "<SHA-256 of request block before encryption and then hash is encrypted using the requestSessionKey>",
  //Encrypted with session key and base-64-URL encoded
  "request": {
    "timestamp": "2019-02-15T10:01:56.086+05:30 - ISO format timestamp",
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
      "age": "25",
      "dob": "25/11/1990",
      "fullAddress": [
        {
          "language": "ara",
          "value": "عنوان العينة سطر 1, عنوان العينة سطر 2"
        },
        {
          "language": "fra",
          "value": "exemple d'adresse ligne 1, exemple d'adresse ligne 2"
        }
      ]
    },
    //Same as the response from the Capture API of SBI v1.0. Refer to the [SBI v1.0 specification]() for complete information.
    "biometrics": [
      {
        "specVersion" : "<SBI specification version>",
        "data": "<JWS signature format of data containing encrypted biometrics and device details>",
        "hash": "<SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format>", // For the first entry assume empty string as previous data block
        "sessionKey": "<Encrypted and base64-URL-encoded session key>",
        "thumbprint": "<SHA256 representation of thumbprint of the certificate that was used for encryption of session key>"
      },
      {
        "specVersion" : "<SBI specification version>",
        "data": "<JWS signature format of data containing encrypted biometrics and device details>",
        "hash": "<SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format>",
        "sessionKey": "<Encrypted and base64-URL-encoded session key>",
        "thumbprint": "<SHA256 representation of thumbprint of the certificate that was used for encryption of session key>"
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
  "id": "mosip.identity.auth",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "transactionID": "<transaction_id used in request>",
  "response": {
    "authStatus": true,
    "authToken": "<authentication_token>"
  },
  "errors": null
}
```

**Failed Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.identity.auth",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "transactionID": "<transaction_id used in request>",
  "response": {
    "authStatus": false,
    "authToken": null
  },
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

For details about the error codes view the section [common error codes and messages](ID-Authentication-APIs.md#common-error-codes-and-messages).

## e-KYC Service (Public)

This service details authentication (eKYC auth) that can be used by authentication partners to authenticate an individual and send individual's KYC details as response. Below are various authentication types supported by e-KYC authentication:

1. OTP Authentication - OTP
2. Biometric Authentication - Fingerprint, IRIS and Face

### Users of KYC service

1. `MISP (MOSIP Infrastructure Service Provider)` - MISP's role is limited to infrastructure provisioning and acting as a gate keeper for all KYC requests sent to this service. The MISP is also responsible for policy creation on the MOSIP servers so their partners will follow the set policy.
2. `Partners` - _eKYC-Partners_ register themselves with MOSIP, under a MISP. KYC requests are captured by eKYC-Partners and sent to MOSIP, via MISP.
3. `Partner-Api-Key` - Associated against a policy.

### POST /idauthentication/v1/kyc/

This request will provide KYC details of an individual, once the individual is successfully authenticated.

#### Resource URL

`https://{base_url}/idauthentication/v1/kyc/:MISP-LicenseKey/:eKYC-Partner-ID/:Partner-Api-Key`

#### Resource Details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Header Parameters

| Name          | Required | Description                                 |
| ------------- | -------- | ------------------------------------------- |
| Authorization | Y        | For consent token                           |
| Signature     | Y        | For signature of the authentication request |

#### Request Path Parameters

| Name            | Required | Description                                                  |
| --------------- | -------- | ------------------------------------------------------------ |
| MISP-LicenseKey | Y        | License key provided to the MISP                             |
| eKYC-Partner-ID | Y        | Partner ID of the authentication partner sending the request |
| Partner-API-Key | Y        | API Key associated to the partner and the policy             |

#### Request Body Parameters

| Name                 | Required | Description                                                                                                                                                                                                                                   |
| -------------------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id                   | Y        | This represents the API ID. The value here should be "mosip.identity.kyc".                                                                                                                                                                    |
| version              | Y        | This represents the version of the API.                                                                                                                                                                                                       |
| transactionID        | Y        | This represents the Transaction ID of the request.                                                                                                                                                                                            |
| requestTime          | Y        | This represents the time when request was created. Ex: "2019-02-15T10:01:57.086+05:30".                                                                                                                                                       |
| env                  | Y        | This represents the environment. Allowed values are "Staging"                                                                                                                                                                                 |
| domainUri            | Y        | This represents the Unique URI per authentication providers. This can be used to federate across multiple providers or countries or unions.                                                                                                   |
| requestedAuth        | Y        | This represents the authentication types requested.                                                                                                                                                                                           |
| requestedAuth.otp    | Y        | This is used to inform that OTP authentication was performed as part of this request. Default Value here is false. Allowed values are true or false.                                                                                          |
| requestedAuth.demo   | Y        | This is used to inform that demographic authentication was performed as part of this request. Default value here is false. Allowed values are true or false.                                                                                  |
| requestedAuth.bio    | Y        | This is used to inform that biometric authentication was performed as part of this request. Default Value here is false. Allowed values are true or false.                                                                                    |
| individualId         | Y        | This represents the ID of resident (VID or UIN). Ex: "9830872690593682".                                                                                                                                                                      |
| individualIdType     | Y        | ID Type used for authentication. Allowed Types of ID - VID, UIN. Default value here is VID.                                                                                                                                                   |
| consentObtained      | Y        | If consent of residnet is obtained? Default value here is true.                                                                                                                                                                               |
| thumbprint           | Y        | Thumbprint of public key certificate used for encryption of sessionKey. This will be used during key rotation                                                                                                                                 |
| requestSessionKey    | Y        | Symmetric Key to be created, and then encrypt the generated Symmetric Key using 'MOSIP Public Key' shared to Partner, and then Base-64-URL encoded. Algorithm used for encryption can be RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING.               |
| requestHMAC          | Y        | SHA-256 hash of request block before encryption. Encryption is done using 'requestSessionKey' and then base64URL encoded. Algorithm used for encryption can be AES/GCM/PKCS5Padding.                                                          |
| request              | Y        | Request block to be used for authenticating the resident. This is encrypted using 'requestSessionKey' and then base64URL encoded. Algorithm used for encryption can be AES/GCM/PKCS5Padding.                                                  |
| request.otp          | N        | OTP used for authentication. This is mandatory when requestedAuth.otp is true.                                                                                                                                                                |
| request.timestamp    | N        | Timestamp when request block was captured.                                                                                                                                                                                                    |
| request.demographics | N        | Demographic data of the residnet. This is mandatory when requestedAuth.demo is true.                                                                                                                                                          |
| request.biometrics   | N        | Biometric data of an Individual which is sent in the response from the Capture API of SBI spec v1.0. Refer to the [SBI spec v1.0](broken-reference) specification for complete information. This is mandatory when requestedAuth.bio is true. |
| secondaryLangCode    | N        | Secondary language code. If specifed, the KYC response will contain KYC data for the give secondary language code also along with primary language data. Otherwise, the response will contain only primary language data.                     |

#### Request Body

```
{
  "id": "mosip.identity.kyc",
  "version": "v1",
  "requestTime": "2019-02-15T10:01:57.086+05:30",
  "env": "<Target environment>",
  "domainUri": "<URI of the authentication server>",
  "transactionID": "<Transaction ID of the authentication request>",
  "requestedAuth": {
    "otp": true,
    "demo": false,
    "bio": true
  },
  "consentObtained": true,
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "thumbprint": "<SHA256 representation of thumb-print of the MOSIP public key certificate used for encryption of sessionKey>",
  "requestSessionKey": "<Encrypted using MOSIP public key and base64-URL-encoded session key>",
  "requestHMAC": "<SHA-256 of request block before encryption and then hash is encrypted using the requestSessionKey>",
  //request section is first encrypted with the session key and then base64-URL-encoded
  "request": {
    "timestamp": "2019-02-15T10:01:56.086+05:30 - ISO format time-stamp",
    "otp": "123456",
    //biometric section is same as the response from Capture API mentioned in [SBIv1.0 specification]()
    "biometrics": [
      {
        "specVersion" : "<SBI specification version>",
        "data": "<JWS signature format of data containing encrypted biometrics and device details>",
        "hash": "<SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format>", // For the first entry assume empty string as previous data block
        "sessionKey": "<Encrypted with MOSIP public key and base64-URL-encoded session key>",
        "thumbprint": "<SHA256 representation of thumb-print of the MOSIP public key that was used for encryption of session key>"
      },
      {
        "specVersion" : "<SBI specification version>",
        "data": "<JWS signature format of data containing encrypted biometrics and device details>",
        "hash": "<SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format>",
        "sessionKey": "<Encrypted and base64-URL-encoded session key>",
        "thumbprint": "<SHA256 representation of thumb-print of the MOSIP public key that was used for encryption of session key>"
      }
    ]
  },
  "secondaryLangCode": "ara"
}
```

#### Responses

**Success Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.identity.kyc",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "transactionID": "<Transaction ID received in request>",
  "response": {
    "kycStatus": true,
    "authResponseToken": "<Authentication response token>",
    //Encrypted KYC info using Partner's public key and base64-URL-encoded
	"identity": {
      "name": [
        {
          "language": "ara",
          "value": "ابراهيم"
        },
        {
          "language": "fra",
          "value": "Ibrahim"
        }
      ],
      "dob": "25/11/1990",
      "gender": [
        {
          "language": "ara",
          "value": "الذكر"
        }
      ],
      "phoneNumber": "+212-5398-12345",
      "emailId": "sample@samplamail.com",
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
      ]
    },
    "thumbnail": "<SHA256 representation of thumb-print of the Partner's public key used for encryption of identity block>"
  },
  "errors": null
}
```

**Failed Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.identity.kyc",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "transactionID": "<Transaction ID received in request>",
  "response": {
    "kycStatus": false,
    "authResponseToken": null,
    "identity": null,
    "thumbnail": null
  },
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

For details about the error codes view the section [common error codes and message](ID-Authentication-APIs.md#common-error-codes-and-messages).

## OTP Request Service (Public)

This service enables authentication partners to request for an OTP for an individual. The OTP will be send via message or email as requested to the individual. This OTP can then be used to authenticate the individual using authentication or eKYC service.

### Users of OTP Request service

1. `MISP (MOSIP Infrastructure Service Provider)` - MISP acts as a gate keeper for any OTP requests sent to this service. MISP is also responsible for the policy creation on the MOSIP servers so their partners will follow the set policy.
2. `Partners` - _Auth-Partners_ and _eKYC-Partners_ can send OTP Request to MOSIP on behalf of the individual for Authentication and eKYC requests respectively, via MISP.
3. `Partner-Api-Key` - Associated against a policy.

### POST /idauthentication/v1/otp/

This request will send an OTP to the individual whoes UIN/VID is entered.

#### Resource URL

`https://{base_url}/idauthentication/v1/otp/:MISP-LicenseKey/:Partner-ID/:Partner-Api-Key`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Header Parameters

| Name          | Required | Description                                                     |
| ------------- | -------- | --------------------------------------------------------------- |
| Authorization | Y        | This is for sending the consent token                           |
| Signature     | Y        | This is for sending the signature of the authentication request |

#### Request Body Parameters

| Name             | Required | Description                                                                                                   |
| ---------------- | -------- | ------------------------------------------------------------------------------------------------------------- |
| id               | Y        | This represents the API ID. The value here would be "mosip.identity.otp".                                     |
| version          | Y        | This represents the API version.                                                                              |
| transactionID    | Y        | Transaction ID of the request. Ex: "1234567890".                                                              |
| requestTime      | Y        | Time when request was captured. Ex:"2019-02-15T10:01:57.086+05:30"                                            |
| env              | Y        | Target environment. Allowed values are "Staging", "Developer", "Pre-Production" or "Production".              |
| domainUri        | Y        | Unique URI per auth providers. This can be used to federate across multiple providers or countries or unions. |
| individualId     | Y        | ID of resident (VID or UIN). Ex: "9830872690593682".                                                          |
| individualIdType | Y        | ID Type of resident used. Allowed Types of ID - VID, UIN. Default Value here is VID.                          |
| otpChannel       | Y        | OTP channel for sending OTP request. Allowed OTP Channels - EMAIL, PHONE.                                     |

#### Request Body

```
{
  "id": "mosip.identity.otp",
  "version": "v1",
  "requestTime": "2019-02-15T07:22:57.086+05:30",
  "env": "<Target environment>",
  "domainUri": "<URI of the authentication server>",
  "transactionID": "<Transaction ID of the authentication request>",
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "otpChannel": [
    "EMAIL",
    "PHONE"
  ]
}
```

#### Responses

**Success Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.identity.otp",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "transactionID": "<Transaction ID of the authentication request>",
  "response": {
    "maskedMobile": "XXXXXXX123",
    "maskedEmail": "abXXXXXXXXXcd@xyz.com"
  },
  "errors": null
}
```

**Failed Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.identity.otp",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "transactionID": "<Transaction ID of the authentication request>",
  "response": null,
  "errors": [
    {
      "errorCode": "IDA-MLC-003",
      "errorMessage": "Invalid VID",
      "actionMessage": "Please retry with correct VID"
    }
  ]
}
```

#### Failure Details

| Error Code  | Error Message                                                                    | Description                                                                                    | Action Message                                             |
| ----------- | -------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| IDA-MLC-001 | Request to be received at MOSIP within\<x> hrs/min                               | Invalid Time stamp                                                                             | Please send the request within \<x> hrs/min                |
| IDA-MLC-002 | Invalid UIN                                                                      | Invalid UIN                                                                                    | Please retry with the correct UIN.                         |
| IDA-MLC-003 | UIN has been deactivated                                                         | UIN Deactivated                                                                                | Your UIN status is not active.                             |
| IDA-MLC-004 | Invalid VID                                                                      | Invalid VID                                                                                    | Please retry with correct VID.                             |
| IDA-MLC-005 | %s VID                                                                           | Expired,Used,Revoked VID                                                                       | Please regenerate VID and try again                        |
| IDA-MLC-006 | Missing Input parameter- \<attribute> Example: Missing Input parameter- version  | Missing Input parameter- attribute - all the mandatory attributes                              |                                                            |
| IDA-MLC-007 | Request could not be processed. Please try again                                 | Could not process request/Unknown error; Invalid Auth Request; Unable to encrypt eKYC response |                                                            |
| IDA-MLC-009 | Invalid Input parameter- attribute                                               | Invalid Input parameter- attribute                                                             |                                                            |
| IDA-MLC-010 | VID has been deactivated                                                         | VID corresponding to a deactivated UIN                                                         |                                                            |
| IDA-MLC-014 | \<Notification Channel> not registered. Individual has to register and try again | \<Notification Channel> not Registered (Phone/e-mail/both)                                     | Please register your \<Notification Channel> and try again |
| IDA-MLC-015 | Identity Type - \<Identity Type> not configured for the country                  | ID Type (UIN/VID) not supported for a country                                                  |                                                            |
| IDA-MLC-017 | Invalid UserID                                                                   | Invalid UserID                                                                                 |                                                            |
| IDA-MLC-018 | %s not available in database                                                     | UIN,VID, User ID not available in database                                                     |                                                            |
| IDA-MPA-004 | MOSIP Public key expired.                                                        | MOSIP Public key expired                                                                       | Please reinitiate the request with updated public key      |
| IDA-MPA-005 | OTP Request Usage not allowed as per policy                                      | OTP Trigger Usage not allowed as per policy                                                    |                                                            |
| IDA-MPA-007 | License key does not belong to a registered MISP                                 | License key does not belong to a registered MISP/ License key invalid                          |                                                            |
| IDA-MPA-008 | License key of MISP has expired                                                  | License key expired                                                                            |                                                            |
| IDA-MPA-009 | Partner is not registered                                                        | PartnerID Invalid                                                                              |                                                            |
| IDA-MPA-010 | MISP and Partner not mapped                                                      | MISP and Partner not                                                                           |                                                            |
| IDA-MPA-011 | License key of MISP is suspended                                                 | License key status of MISP is suspended                                                        |                                                            |
| IDA-MPA-012 | Partner is deactivated                                                           | PartnerID is not active                                                                        |                                                            |
| IDA-MPA-014 | Partner is not assigned with any policy                                          | PartnerID is not mapped to a policy                                                            |                                                            |
| IDA-MPA-017 | License key of MISP is blocked                                                   | License key status of MISP is blocked                                                          |                                                            |
| IDA-OTA-001 | In numerous OTP requests received                                                | OTP Flooding error                                                                             |                                                            |
| IDA-OTA-002 | Could not generate/send OTP                                                      | Could not generate/send OTP                                                                    |                                                            |
| IDA-OTA-006 | UIN is locked for OTP generation. Please try again later                         | Try to generate OTP for a frozen Account                                                       |                                                            |
| IDA-OTA-008 | OTP Notification Channel not provided.                                           | No OTP Channel is provided in the input                                                        |                                                            |
| IDA-OTA-009 | \<Notification Channel> not configured for the country                           | \<Notification Channel> not configured (Phone/e-mail/both)                                     |                                                            |

## Authentication Service (Internal)

This service details authentication (yes/no) that can be used by MOSIP modules to authenticate an individual using UserID/VID/UIN. Below are various authentication types supported by this service - Biometric based - Fingerprint, IRIS and Face.

### Users of Internal Authentication service

1. `Registration Client` - Registration Client can authenticate biometrics of Operator or Supervisor while on-boarding them.
2. `Registration Processor` - Registration Processor can authenticate biometrics of Operator or Supervisor while processing registration packets.

### POST /idauthentication/v1/internal/auth

This request will authenticate an Operator/Supervisor using Biometric authentication.

#### Resource URL

`https://{base_url}/idauthentication/v1/internal/auth`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Header Parameters

| Name          | Required | Description                                                     |
| ------------- | -------- | --------------------------------------------------------------- |
| Authorization | Y        | This is for sending the consent token                           |
| Signature     | Y        | This is for sending the signature of the authentication request |

#### Request Body Parameters

| Name                 | Required | Description                                                                                                                                                                                                                                   |
| -------------------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id                   | Y        | This represents the API ID. The value here should be "mosip.identity.auth.internal".                                                                                                                                                          |
| version              | Y        | This represents the version of the API.                                                                                                                                                                                                       |
| transactionID        | Y        | This represnets the Transaction ID of the request.                                                                                                                                                                                            |
| requestTime          | Y        | This represents the time when request was created. Ex: "2019-02-15T10:01:57.086+05:30".                                                                                                                                                       |
| env                  | Y        | This represents the enviornment. Allowed values are "Staging"                                                                                                                                                                                 |
| domainUri            | Y        | This represents the Unique URI per auth providers. This can be used to federate across multiple providers or countries or unions.                                                                                                             |
| requestedAuth        | Y        | This represents the authentication types requested.                                                                                                                                                                                           |
| requestedAuth.otp    | Y        | This is used to inform that OTP authentication was performed as part of this request. Default Value here is false. Allowed values are true or false.                                                                                          |
| requestedAuth.demo   | Y        | This is used to inform that demographic authentication was performed as part of this request. Default value here is false. Allowed values are true or false.                                                                                  |
| requestedAuth.bio    | Y        | This is used to inform that biometric authentication was performed as part of this request. Default Value here is false. Allowed values are true or false.                                                                                    |
| individualId         | Y        | This represents the ID of resident (VID or UIN). Ex: "9830872690593682".                                                                                                                                                                      |
| individualIdType     | Y        | ID Type used for authentication. Allowed Types of ID - VID, UIN. Default value here is VID.                                                                                                                                                   |
| consentObtained      | Y        | If consent of residnet is obtained? Default value here is true.                                                                                                                                                                               |
| thumbprint           | Y        | Thumbprint of public key certificate used for encryption of sessionKey. This will be used during key rotation                                                                                                                                 |
| requestSessionKey    | Y        | Symmetric Key to be created, and then encrypt the generated Symmetric Key using 'MOSIP Public Key' shared to Partner, and then Base-64-URL encoded. Algorithm used for encryption can be RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING.               |
| requestHMAC          | Y        | SHA-256 hash of request block before encryption. Encryption is done using 'requestSessionKey' and then base64URL encoded. Algorithm used for encryption can be AES/GCM/PKCS5Padding.                                                          |
| request              | Y        | Request block to be used for authenticating the resident. This is encrypted using 'requestSessionKey' and then base64URL encoded. Algorithm used for encryption can be AES/GCM/PKCS5Padding.                                                  |
| request.otp          | N        | OTP used for authentication. This is mandatory when requestedAuth.otp is true.                                                                                                                                                                |
| request.timestamp    | N        | Timestamp when request block was captured.                                                                                                                                                                                                    |
| request.demographics | N        | Demographic data of the residnet. This is mandatory when requestedAuth.demo is true.                                                                                                                                                          |
| request.biometrics   | N        | Biometric data of an Individual which is sent in the response from the Capture API of SBI spec v1.0. Refer to the [SBI spec v1.0](broken-reference) specification for complete information. This is mandatory when requestedAuth.bio is true. |

#### Request Body

```
{
  "id": "mosip.identity.auth.internal",
  "version": "v1",
  "requestTime": "2019-02-15T10:01:57.086+05:30",
  "env": "<Target environment>",
  "domainUri": "<URI of the authentication server>",
  "transactionID": "<Transaction ID of the authentication request>",
  "requestedAuth": {
    "otp": true,
    "demo": false,
    "bio": false
  },
  "consentObtained": true,
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "thumbprint": "<Thumbprint of the public key certficate used for enryption of sessionKey. This is necessary for key rotaion>",
  "requestSessionKey": "<Encrypted and Base64-URL-encoded session key>",
  "requestHMAC": "<SHA-256 of request block before encryption and then hash is encrypted using the requestSessionKey>",
  //Encrypted with session key and base-64-URL encoded
  "request": {
    "timestamp": "2019-02-15T10:01:56.086+05:30 - ISO format timestamp",
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
      "age": "25",
      "dob": "25/11/1990",
      "fullAddress": [
        {
          "language": "ara",
          "value": "عنوان العينة سطر 1, عنوان العينة سطر 2"
        },
        {
          "language": "fra",
          "value": "exemple d'adresse ligne 1, exemple d'adresse ligne 2"
        }
      ]
    },
    //Same as the response from the Capture API of SBI v1.0. Refer to the [SBI v1.0 specification]() for complete information.
    "biometrics": [
      {
        "specVersion" : "<SBI specification version>",
        "data": "<JWS signature format of data containing encrypted biometrics and device details>",
        "hash": "<SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format>", // For the first entry assume empty string as previous data block
        "sessionKey": "<Encrypted and base64-URL-encoded session key>",
        "thumbprint": "<SHA256 representation of thumbprint of the certificate that was used for encryption of session key>"
      },
      {
        "specVersion" : "<SBI specification version>",
        "data": "<JWS signature format of data containing encrypted biometrics and device details>",
        "hash": "<SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format>",
        "sessionKey": "<Encrypted and base64-URL-encoded session key>",
        "thumbprint": "<SHA256 representation of thumbprint of the certificate that was used for encryption of session key>"
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
  "id": "mosip.identity.auth.internal",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "transactionID": "1234567890",
  "response": {
    "authStatus": true
  },
  "errors": null
}
```

**Failed Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.identity.auth.internal",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "transactionID": "1234567890",
  "response": {
    "authStatus": false
  },
  "errors": [
    {
      "errorCode": "IDA-MLC-009",
      "errorMessage": "Invalid UserId",
      "actionMessage": "Please retry with the correct UserId"
    }
  ]
}
```

#### Failure Details

| Error Code  | Error Message                                                                    | Description                                                                                                         | Action Message                                             |
| ----------- | -------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| IDA-BIA-001 | Biometric data – \<Biometric Attribute> did not match                            | Finger,Iris,Face Mismatch                                                                                           | Please give your biometrics again.                         |
| IDA-BIA-002 | Duplicate fingers in request.                                                    | Duplicate fingers                                                                                                   | Please try again with distinct fingers                     |
| IDA-BIA-003 | Number of Fingers should not exceed 10.                                          | Fingers exceeding 10                                                                                                |                                                            |
| IDA-BIA-006 | Biometric data \<Biometric Attribute> not available in database.                 | Missing biometric data in MOSIP database                                                                            | Your Biometric data is not available in MOSIP              |
| IDA-BIA-007 | Duplicate Irises in request.                                                     | Duplicate Irises used                                                                                               | Please try again with distinct Irises                      |
| IDA-BIA-008 | Number of Iris should not exceed 2.                                              | Irises exceeding 2                                                                                                  |                                                            |
| IDA-BIA-009 | Number of Face records should not exceed 1.                                      | Face exceeding 1                                                                                                    |                                                            |
| IDA-MLC-001 | Request to be received at MOSIP within\<x> hrs/min                               | Invalid Time stamp                                                                                                  | Please send the request within \<x> hrs/min                |
| IDA-MLC-002 | Invalid UIN                                                                      | Invalid UIN                                                                                                         | Please retry with the correct UIN.                         |
| IDA-MLC-003 | UIN has been deactivated                                                         | UIN Deactivated                                                                                                     | Your UIN status is not active.                             |
| IDA-MLC-006 | Missing Input parameter- \<attribute> Example: Missing Input parameter- version  | Missing Input parameter- attribute - all the mandatory attributes                                                   |                                                            |
| IDA-MLC-007 | Request could not be processed. Please try again                                 | Could not process request/Unknown error; Invalid Auth Request; Unable to encrypt eKYC response                      |                                                            |
| IDA-MLC-008 | No authentication type selected                                                  | No authentication type selected in the request                                                                      |                                                            |
| IDA-MLC-009 | Invalid Input parameter- attribute                                               | Invalid Input parameter- attribute                                                                                  |                                                            |
| IDA-MLC-011 | Unsupported Authentication Type - \<Auth Type> - \<SubType> if applicable        | Auth Type not supported for a country                                                                               | Please use other Authentication Types in the request       |
| IDA-MLC-012 | Individual's Consent is not available                                            | Invalid resident consent for eKYC/Auth                                                                              |                                                            |
| IDA-MLC-013 | Missing \<authtype> auth attribute                                               | Missing authtype parameter – when \<auth-type> = ‘True’ and corresponding auth attribute missing (OTP,Demo and Bio) |                                                            |
| IDA-MLC-014 | \<Notification Channel> not registered. Individual has to register and try again | \<Notification Channel> not Registered (Phone/e-mail/both)                                                          | Please register your \<Notification Channel> and try again |
| IDA-MLC-015 | Identity Type - \<Identity Type> not configured for the country                  | ID Type (UIN/USERID) not supported for a country                                                                    |                                                            |
| IDA-MLC-017 | Invalid UserID                                                                   | Invalid UserID                                                                                                      |                                                            |
| IDA-MLC-018 | %s not available in database                                                     | UIN, User ID not available in database                                                                              |                                                            |
| IDA-MPA-003 | Unable to decrypt Request.                                                       | Invalid encryption of session key/request                                                                           |                                                            |
| IDA-MPA-004 | MOSIP Public key expired.                                                        | MOSIP Public key expired                                                                                            | Please reinitiate the request with updated public key      |

## Authentication Transactions Service (Internal)

Authentication Transactions Service can be used by Resident Services to retrieve authentication history of an Individual initiated by Partners. Authentications done by MOSIP's internal modules for any verification will not be returned.

### Users of Authentication Transactions Service

`Resident Services` - Resident Services will send UIN or VID to retrieve all authentication transactions of an Individual, that are initiated by Partners.

### GET /idauthentication/v1/internal/authTransactions/individualIdType/

This request will retrieve authentication transactions for the given UIN/VID, alongwith pageStart and pageFetch parameters.

#### Resource URL

```
https://{base_url}/idauthentication/v1/internal/authTransactions/individualIdType/:IDType/individualId/:ID?pageStart=1&pageFetch=10
```

#### Resource Details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name    | Required | Description                                |
| ------- | -------- | ------------------------------------------ |
| ID Type | Y        | Allowed values here can be UIN or VID.     |
| ID      | Y        | This is the value of ID Type - UIN or VID. |

#### Request Query Parameters

The authentication transactions can be queried using this REST service for certain count of transactions which can be retrieved for given pageStart number with pageFetch. The default pageStart value is 1. The default pageFetch value is 10. This default pageFetch value will be taken into account only if the pageStart is provided. If both pageStart and pageFetch values are not provided, all the authentication transactions for the UIN/VID are returned in the response.

| Name      | Required | Description                                                 |
| --------- | -------- | ----------------------------------------------------------- |
| pageStart | N        | The page number to start. Default value here is "1".        |
| pageFetch | N        | The number of entries per page. Default value here is "10". |

#### Responses

**Success Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.identity.auth.transactions.read",
  "responseTime": "2019-07-11T07:30:59.383",
  "version": "v1",
  "errors": [],
  "response": {
    "authTransactions": [
      {
        "transactionID": "1234567890",
        "requestdatetime": "2019-07-10T07:28:59.383",
        "authtypeCode": "FINGERPRINT-AUTH",
        "statusCode": "Y",
        "statusComment": "Finger Authentication Success",
        "referenceIdType": "UIN",
        "entityName": ""
	  },
	  {
        "transactionID": "1234567891",
        "requestdatetime": "2019-07-11T07:29:59.383",
        "authtypeCode": "OTP-REQUEST",
        "statusCode": "F",
        "statusComment": "OTP Authentication Failed",
        "referenceIdType": "UIN",
        "entityName": ""
      }
    ]
  }
}
```

**Failed Response**

**Response Code : 200 (OK)**

```
{
  "id": "mosip.identity.auth.transactions.read",
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

## Identity Update Event Notification Service (Internal)

Whenever an UIN/VID is inserted or updated in ID-Repository module that event will be notifid to ID-Authentication using this Identity Update Event Notification Service.

### Users of Retrieve Authentication Types Status Service

**ID-Repository** - For any UIN/VID create/update event in ID-Repository module will notify ID-Authentication with this service.

### POST /idauthentication/v1/internal/notify

This request will post the notification for VID/UIN create/update event.

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                            | Required | Description                                                                                                                                                                    |
| ------------------------------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| consentObtained                 | Y        | Individual's consent                                                                                                                                                           |
| id                              | Y        | This represents the API ID. Allowed value here is "mosip.identity.event.notify".                                                                                               |
| version                         | Y        | This represents the API version.                                                                                                                                               |
| timestamp                       | Y        | Time when Request was captured. Ex: "2019-02-15T10:01:57.086+05:30".                                                                                                           |
| request                         | Y        | Auth type status attributes to be applied for the Individual.                                                                                                                  |
| request.events                  | Y        | List of events each for UIN/VID create/update.                                                                                                                                 |
| request.events.event\_type      | Y        | Allowed event types are CREATE\_UIN, UPDATE\_UIN, CREATE\_VID or UPDATE\_VID.                                                                                                  |
| request.events.uin              | N        | This has the UIN value. Atlease one of request:events:uin/request:events:vid field should be present, or both can be present.                                                  |
| request.events.vid              | N        | This has the VID value. Atlease one of request:events:uin/request:events:vid field should be present, or both can be present.                                                  |
| request.events.expiryTimestamp  | N        | The expiry time of the UIN/VID on which the event is sent (as per the event\_type). If not provided or `null` it is assumed as no expiry. Ex: "2020-02-15T10:01:57.086+05:30". |
| request.events.transactionLimit | N        | The transaction limit of VID only for VID based event\_type. If not provided or `null` it is assumed as no-limit.                                                              |

#### Request Body

```
{
  "id": "moip.ida.notification.event",
  "timestamp": "2019-02-15T10:01:57.086+05:30",
  "version": "1.0",
  "request": {
    "events": [
      {
        "event_type ": "CREATE_UIN",
        "uin": "9830872690 ",
        "expiryTimestamp": null,
        "transactionLimit": null
      },
      {
        "event_type ": "CREATE_VID",
        "vid": "5603872690593682",
        "uin": "9830872690",
        "expiryTimestamp": "2020-02-15T10:01:57.086+05:30",
        "transactionLimit": 1
      },
      {
        "event_type ": "UPDATE_UIN",
        "uin": "9830872690",
        "vid": "5603872690593682",
        "expiryTimestamp": null,
        "transactionLimit": null
      },
      {
        "event_type ": "UPDATE_VID",
        "vid": "5603872690593682",
        "uin": "9830872690",
        "expiryTimestamp": "2020-02-15T10:01:57.086+05:30",
        "transactionLimit": 1
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
  "id": "moip.ida.notification.event",
  "version": "1.0",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "errors": null
}
```

**Failed Response**

**Response Code : 200 (OK)**

```
{
  "id": "moip.ida.notification.event",
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
| IDA-MLC-006 | Missing Input parameter- \<attribute> Example: Missing Input parameter- version | Missing Input parameter- attribute - all the mandatory attributes |                                             |
| IDA-MLC-007 | Request could not be processed. Please try again                                | Could not process request/Unknown error; Invalid Auth Request     |                                             |
| IDA-MLC-009 | Invalid Input parameter- attribute                                              | Invalid Input parameter- attribute                                |                                             |

## Common Error Codes and Messages

| Error Code  | Error Message                                                                                                         | Description                                                                                                         | Action Message                                             |
| ----------- | --------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| IDA-BIA-001 | Biometric data – \<Biometric Attribute> did not match                                                                 | Finger,Iris,Face Mismatch                                                                                           | Please give your biometrics again.                         |
| IDA-BIA-002 | Duplicate fingers in request.                                                                                         | Duplicate fingers                                                                                                   | Please try again with distinct fingers                     |
| IDA-BIA-003 | Number of Fingers should not exceed 10.                                                                               | Fingers exceeding 10                                                                                                |                                                            |
| IDA-BIA-006 | Biometric data \<Biometric Attribute> not available in database.                                                      | Missing biometric data in MOSIP database                                                                            | Your Biometric data is not available in MOSIP              |
| IDA-BIA-007 | Duplicate Irises in request.                                                                                          | Duplicate Irises used                                                                                               | Please try again with distinct Irises                      |
| IDA-BIA-008 | Number of Iris should not exceed 2.                                                                                   | Irises exceeding 2                                                                                                  |                                                            |
| IDA-BIA-009 | Number of Face records should not exceed 1.                                                                           | Face exceeding 1                                                                                                    |                                                            |
| IDA-DEA-001 | Demographic data \<demo attribute> in \<Language Code> (if applicable) did not match                                  | name, Full Address, Address line Items, Gender, Phone,e-mail,DOB,DOB Type, and age Mismatch in any language         | Please re-enter your \<demo attribute> in \<Language Code> |
| IDA-DEA-002 | Unsupported Language Code \<XX>                                                                                       | Unsupported language Code used in the Lang attribute                                                                |                                                            |
| IDA-DEA-003 | Demographic data \<Demographic Attribute> in \<Language Code> (if applicable) not available in database.              | Individual’s data not available                                                                                     |                                                            |
| IDA-MLC-001 | Request to be received at MOSIP within\<x> hrs/min                                                                    | Invalid Time stamp                                                                                                  | Please send the request within \<x> hrs/min                |
| IDA-MLC-002 | Invalid UIN                                                                                                           | Invalid UIN                                                                                                         | Please retry with the correct UIN.                         |
| IDA-MLC-003 | UIN has been deactivated                                                                                              | UIN Deactivated                                                                                                     | Your UIN status is not active.                             |
| IDA-MLC-004 | Invalid VID                                                                                                           | Invalid VID                                                                                                         | Please retry with correct VID.                             |
| IDA-MLC-005 | %s VID                                                                                                                | Expired,Used,Revoked VID                                                                                            | Please regenerate VID and try again                        |
| IDA-MLC-006 | Missing Input parameter- \<attribute> Example: Missing Input parameter- version                                       | Missing Input parameter- attribute - all the mandatory attributes                                                   |                                                            |
| IDA-MLC-007 | Request could not be processed. Please try again                                                                      | Could not process request/Unknown error; Invalid Auth Request; Unable to encrypt eKYC response                      |                                                            |
| IDA-MLC-008 | No authentication type selected                                                                                       | No authentication type selected in the request                                                                      |                                                            |
| IDA-MLC-009 | Invalid Input parameter- attribute                                                                                    | Invalid Input parameter- attribute                                                                                  |                                                            |
| IDA-MLC-010 | VID has been deactivated                                                                                              | VID corresponding to a deactivated UIN                                                                              |                                                            |
| IDA-MLC-011 | Unsupported Authentication Type - \<Auth Type> - \<SubType> if applicable                                             | Auth Type not supported for a country                                                                               | Please use other Authentication Types in the request       |
| IDA-MLC-012 | Individual's Consent is not available                                                                                 | Invalid resident consent for eKYC/Auth                                                                              |                                                            |
| IDA-MLC-013 | Missing \<authtype> auth attribute                                                                                    | Missing authtype parameter – when \<auth-type> = ‘True’ and corresponding auth attribute missing (OTP,Demo and Bio) |                                                            |
| IDA-MLC-014 | \<Notification Channel> not registered. Individual has to register and try again                                      | \<Notification Channel> not Registered (Phone/e-mail/both)                                                          | Please register your \<Notification Channel> and try again |
| IDA-MLC-015 | Identity Type - \<Identity Type> not configured for the country                                                       | ID Type (UIN/VID) not supported for a country                                                                       |                                                            |
| IDA-MLC-018 | %s not available in database                                                                                          | UIN,VID, User ID not available in database                                                                          |                                                            |
| IDA-MPA-003 | Unable to decrypt Request.                                                                                            | Invalid encryption of session key/request                                                                           |                                                            |
| IDA-MPA-004 | MOSIP Public key expired.                                                                                             | MOSIP Public key expired                                                                                            | Please reinitiate the request with updated public key      |
| IDA-MPA-006 | \<Auth Type> - \<Sub Type> (if applicable) Authentication Usage not allowed as per policy (Eg: OTP/Demo/Bio - Finger) | All Authentication Usages not allowed as per policy                                                                 |                                                            |
| IDA-MPA-007 | License key does not belong to a registered MISP                                                                      | License key does not belong to a registered MISP/ License key invalid                                               |                                                            |
| IDA-MPA-008 | License key of MISP has expired                                                                                       | License key expired                                                                                                 |                                                            |
| IDA-MPA-009 | Partner is not registered                                                                                             | PartnerID Invalid                                                                                                   |                                                            |
| IDA-MPA-010 | MISP and Partner not mapped                                                                                           | MISP and Partner not                                                                                                |                                                            |
| IDA-MPA-011 | License key of MISP is suspended                                                                                      | License key status of MISP is suspended                                                                             |                                                            |
| IDA-MPA-012 | Partner is deactivated                                                                                                | PartnerID is not active                                                                                             |                                                            |
| IDA-MPA-014 | Partner is not assigned with any policy                                                                               | PartnerID is not mapped to a policy                                                                                 |                                                            |
| IDA-MPA-015 | \<Auth Type> - \<Sub Type> (if applicable) Authentiation Usage is mandatory as per policy (Eg: OTP/Demo/Bio - Finger) | Mandatory Auth Type as per policy of the partner is not available in the auth request                               |                                                            |
| IDA-MPA-016 | HMAC Validation failed                                                                                                | HMAC value does not match                                                                                           |                                                            |
| IDA-MPA-017 | License key of MISP is blocked                                                                                        | License key status of MISP is blocked                                                                               |                                                            |
| IDA-OTA-003 | OTP has expired                                                                                                       | OTP expired                                                                                                         | Please regenerate OTP and try again after sometime.        |
| IDA-OTA-004 | OTP is invalid                                                                                                        | OTP Invalid                                                                                                         | Please provide correct OTP value.                          |
| IDA-OTA-005 | Input transactionID does not match transactionID of OTP Request                                                       | Invalid Transaction ID                                                                                              |                                                            |
| IDA-OTA-007 | UIN is locked for OTP validation due to exceeding no of invalid OTP trials                                            | Validate wrong OTP for exceeding no of retries                                                                      |                                                            |
| IDA-OTA-010 | Input Identity Type does not match Identity Type of OTP Request                                                       | Invalid Identity Type                                                                                               |                                                            |
