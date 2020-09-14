This section details about the REST services in ID Authentication module.

* [Authentication Service](#authentication-service-public)
* [eKYC Service](#ekyc-service-public)
* [OTP Request Service](#otp-request-service-public)
* [Internal Authentication Service](#authentication-service-internal)
* [Authentication Transactions Service](#authentication-transactions-service-internal)
* [Authentication Type Status Service](#authentication-types-status-service-internal)

# Authentication Service (Public)
This service details authentication methods that can be used by authentication partners to authenticate a resident. Below are various authentication types currently supported by this service:

* OTP based - OTP (Time based OTP)
* Demographic based - Name, Date of Birth, Age, Gender, Address, Full Address
* Biometric based - Fingerprint, Iris and Face

## Users of Authentication service

1. **MISP (MOSIP Infrastructure Service Provider)** - MISP's role is limited to infrastructure provisioning and acting as a gate keeper for all authentication requests sent to this service. The MISP is also responsible for the policy creation on the MOSIP servers so their partners will follow the set policy.
2. **Authentication Partners** - Authentication Partners register themselves with MOSIP, under a MISP. Authentication requests are captured by authentication partners and sent to MOSIP, via MISP.
3. **Partner-API-Key** - Associated against a policy.

## POST /idauthentication/v1/auth/
This request will authenticate a resident, based on provided authentication type(s).

### Resource URL
`https://{base_url}/idauthentication/v1/auth/{:MISP-LicenseKey}/{:Auth-Partner-ID}/{:Partner-Api-Key}`

### Resource Details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Header Parameters
Name | Description
-----|-------------
Authorization | <ul><li>This is the authentication token</li><li>This is a mandatory parameter</li><li>**Ex:**</li></ul>

### Request Path Parameters
Name | Description
-----|------------
MISP-LicenseKey | Licence key provided to the MISP
eKYC-Partner-ID | Partner ID of the authentication partner sending the request
Partner-Api-Key | API Key associated to the partner and the policy

### Request Body Parameters
Name | Description
-----|--------------------
id | <ul><li>API ID</li><li>This is a mandatory parameter</li><li>**Ex:** mosip.identity.auth</li></ul>
version | <ul><li>API version</li><li>This is a mandatory parameter</li><li>**Ex:** v1</li></ul>
transactionID | <ul><li>Transaction ID of the request</li><li>This is a mandatory parameter</li><li>**Ex:** 1234567890</li></ul>
requestTime | <ul><li>Time when request was captured</li><li>This is a mandatory parameter</li><li>**Ex:** 2019-02-15T10:01:57.086+05:30</li></ul>
env | <ul><li>Target environment</li><li>Allowed values are "Staging" | "Developer" | "Pre-Production" | "Production"</li><li>This is a mandatory parameter</li></ul>
domainUri | <ul><li>Unique URI per auth providers.</li><li>This can be used to federate across multiple providers or countries or unions.</li><li>This is a mandatory parameter</li></ul>
requestedAuth | <ul><li>Authentication types requested</li><li>This is a mandatory parameter</li></ul>
requestedAuth.otp | <ul><li>OTP authentication was requested?</li><li>This is a mandatory parameter</li><li>**Default Value:** false</li><li>**Ex:** true or false</li></ul>
requestedAuth.demo | <ul><li>Demographic authentication was requested?</li><li>This is a mandatory parameter</li><li>**Default Value:** false</li><li>**Ex:** true or false</li></ul>
requestedAuth.bio | <ul><li>Biometric authentication was requested?</li><li>This is a mandatory parameter</li><li>**Default Value:** false</li><li>**Ex:** true or false</li></ul>
individualId | <ul><li>ID of resident (VID or UIN)</li><li>This is a mandatory parameter</li><li>**Ex:** 9830872690593682</li></ul>
individualIdType | <ul><li>ID Type of resident used</li><li>This is a mandatory parameter</li><li>Allowed Types of ID - VID, UIN</li><li>**Default Value:** VID</li></ul>
consentObtained | <ul><li>If consent of residnet is obtained?</li><li>This is a mandatory parameter</li><li><li>**Default Value:** true</li></ul>
thumbprint | <ul><li>Thumbprint of public key certificate used for encryption of sessionKey</li><li>This is a mandatory parameter</li><li><li>This is currently not being used</li></ul>
requestSessionKey | <ul><li>Symmetric Key to be created, and then encrypt the generated Symmetric Key using 'MOSIP Public Key' shared to Partner, and then Base-64-URL encoded</li><li>Algorithm used for encryption can be  RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING</li><li>This is a mandatory parameter</li></ul>
requestHMAC | <ul><li>SHA-256 hash of request block before encryption</li><li>Encryption is done using 'requestSessionKey' and then base64URL encoded</li><li>Algorithm used for encryption can be AES/GCM/PKCS5Padding</li><li>This is a mandatory parameter</li></ul>
request | <ul><li>Request block to be used for authenticating the resident</li><li>This is encrypted using 'requestSessionKey' and then base64URL encoded</li><li>Algorithm used for encryption can be AES/GCM/PKCS5Padding</li><li>This is a mandatory parameter</li></ul>
request.otp | <ul><li>OTP used for authentication</li><li>This is mandatory when requestedAuth.otp is true</li></ul>
request.timestamp | <ul><li>Timestamp when request block was captured</li><li>This is an optional parameter</li></ul>
request.demographics | <ul><li>Demographic data of the residnet</li><li>This is mandatory when requestedAuth.demo is true</li></ul>
request.biometrics | <ul><li>Biometric data of an Individual which is sent in the response from the Capture API of SBI spec v1.0.</li><li>Refer to the [SBI spec v1.0](Secure-Biometric-Interface-Specification.md#capture) specification for complete information.</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.specVersion | <ul><li>SBI spec version used to capture the biometrics</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.data | <ul><li>JWS format of Biometric data of an Individual with X509 certificate.</li><li>The payload present in JWS is encrypted by below request.biometrics.sessionKey</li><li>symmetric encryption algorithm is used - AES/GCM/PKCS5Padding</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.hash | <ul><li>SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format.</li><li>While calculating the hash for the first biometrics.data entry assume empty string as previous data block.</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.sessionKey | <ul><li>Symmetric key used by [SBI spec v1.0](Secure-Biometric-Interface-Specification.md#capture) to encrypt above biometric data attribute.</li><li>This symmetric key is encrypted by MOSIP Public Key shared to Device Providers using asymmetric key algorithm - RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING, and then Base64-url-encoded</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.thumbprint | <ul><li>SHA256 representation of thumbprint of the certificate that was used for encryption of session key</li><li>This is mandatory when requestedAuth.bio is true</li></ul>

### Request Body
```JSON
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

### Responses

#### Success Response
**Response Code : 200 (OK)**
```JSON
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

#### Failed Response
**Response Code : 200 (OK)**
```JSON
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

### Failure Details
For details about the error codes view the section [common error codes and messages](#common-error-codes-and-messages).

# e-KYC Service (Public)
This service details authentication (eKYC auth) that can be used by authentication partners to authenticate a resident and send resident's KYC details as response. Below are various authentication types supported by e-KYC authentication:

1. OTP Authentication - OTP
2. Biometric Authentication - Fingerprint, IRIS and Face

## Users of KYC service

1. `MISP (MOSIP Infrastructure Service Provider)` - MISP's role is limited to infrastructure provisioning and acting as a gate keeper for all KYC requests sent to this service. The MISP is also responsible for policy creation on the MOSIP servers so their partners will follow the set policy.
2. `Partners` - *eKYC-Partners* register themselves with MOSIP, under a MISP. KYC requests are captured by eKYC-Partners and sent to MOSIP, via MISP.
3. `Partner-Api-Key` - Associated against a policy.

## POST /idauthentication/v1/kyc/
This request will provide KYC details of a resident, once the resident is successfully authenticated.

### Resource URL
`https://{base_url}/idauthentication/v1/kyc/:MISP-LicenseKey/:eKYC-Partner-ID/:Partner-Api-Key`

### Resource Details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Header Parameters
Name | Description
-----|------------
Authorization | <ul><li>This is the authentication token</li><li>This is a mandatory parameter</li><li>**Ex:**</li></ul>

### Request Path Parameters
Name | Description
-----|------------
MISP-LicenseKey | Licence key provided to the MISP
eKYC-Partner-ID | Partner ID of the authentication partner sending the request
Partner-Api-Key | API Key associated to the partner and the policy


### Request Body Parameters
Name | Description
-----|--------------------
id | <ul><li>API ID</li><li>This is a mandatory parameter</li><li>**Ex:** mosip.identity.kyc</li></ul>
version | <ul><li>API version</li><li>This is a mandatory parameter</li><li>**Ex:** v1</li></ul>
transactionID | <ul><li>Transaction ID of the request</li><li>This is a mandatory parameter</li><li>**Ex:** 1234567890</li></ul>
requestTime | <ul><li>Time when request was captured</li><li>This is a mandatory parameter</li><li>**Ex:** 2019-02-15T10:01:57.086+05:30</li></ul>
env | <ul><li>Target environment</li><li>Allowed values are "Staging" | "Developer" | "Pre-Production" | "Production"</li><li>This is a mandatory parameter</li></ul>
domainUri | <ul><li>Unique URI per auth providers.</li><li>This can be used to federate across multiple providers or countries or unions.</li><li>This is a mandatory parameter</li></ul>
requestedAuth | <ul><li>Authentication types requested</li><li>This is a mandatory parameter</li></ul>
requestedAuth.otp | <ul><li>OTP authentication was requested?</li><li>This is a mandatory parameter</li><li>**Default Value:** false</li><li>**Ex:** true or false</li></ul>
requestedAuth.demo | <ul><li>Demographic authentication was requested?</li><li>This is a mandatory parameter</li><li>**Default Value:** false</li><li>**Ex:** true or false</li></ul>
requestedAuth.bio | <ul><li>Biometric authentication was requested?</li><li>This is a mandatory parameter</li><li>**Default Value:** false</li><li>**Ex:** true or false</li></ul>
individualId | <ul><li>ID of resident (VID or UIN)</li><li>This is a mandatory parameter</li><li>**Ex:** 9830872690593682</li></ul>
individualIdType | <ul><li>ID Type of resident used</li><li>This is a mandatory parameter</li><li>Allowed Types of ID - VID, UIN</li><li>**Default Value:** VID</li></ul>
consentObtained | <ul><li>If consent of residnet is obtained?</li><li>This is a mandatory parameter</li><li><li>**Default Value:** true</li></ul>
thumbprint | <ul><li>Thumbprint of public key certificate used for encryption of sessionKey</li><li>This is a mandatory parameter</li><li><li>This is currently not being used</li></ul>
requestSessionKey | <ul><li>Symmetric Key to be created, and then encrypt the generated Symmetric Key using 'MOSIP Public Key' shared to Partner, and then Base-64-URL encoded</li><li>Algorithm used for encryption can be  RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING</li><li>This is a mandatory parameter</li></ul>
requestHMAC | <ul><li>SHA-256 hash of request block before encryption</li><li>Encryption is done using 'requestSessionKey' and then base64URL encoded</li><li>Algorithm used for encryption can be AES/GCM/PKCS5Padding</li><li>This is a mandatory parameter</li></ul>
request | <ul><li>Request block to be used for authenticating the resident</li><li>This is encrypted using 'requestSessionKey' and then base64URL encoded</li><li>Algorithm used for encryption can be AES/GCM/PKCS5Padding</li><li>This is a mandatory parameter</li></ul>
request.otp | <ul><li>OTP used for authentication</li><li>This is mandatory when requestedAuth.otp is true</li></ul>
request.timestamp | <ul><li>Timestamp when request block was captured</li><li>This is an optional parameter</li></ul>
request.demographics | <ul><li>Demographic data of the residnet</li><li>This is mandatory when requestedAuth.demo is true</li></ul>
request.biometrics | <ul><li>Biometric data of an Individual which is sent in the response from the Capture API of SBI spec v1.0.</li><li>Refer to the [SBI spec v1.0](Secure-Biometric-Interface-Specification.md#capture) specification for complete information.</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.specVersion | <ul><li>SBI spec version used to capture the biometrics</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.data | <ul><li>JWS format of Biometric data of an Individual with X509 certificate.</li><li>The payload present in JWS is encrypted by below request.biometrics.sessionKey</li><li>symmetric encryption algorithm is used - AES/GCM/PKCS5Padding</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.hash | <ul><li>SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format.</li><li>While calculating the hash for the first biometrics.data entry assume empty string as previous data block.</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.sessionKey | <ul><li>Symmetric key used by [SBI spec v1.0](Secure-Biometric-Interface-Specification.md#capture) to encrypt above biometric data attribute.</li><li>This symmetric key is encrypted by MOSIP Public Key shared to Device Providers using asymmetric key algorithm - RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING, and then Base64-url-encoded</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.thumbprint | <ul><li>SHA256 representation of thumbprint of the certificate that was used for encryption of session key</li><li>This is mandatory when requestedAuth.bio is true</li></ul>

### Request Body
```JSON
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
  }
}
```

**Data Block**
```JSON
"data": {
  "digitalId": "digital Id as described in this document",
  "deviceCode": "A unique code given by MOSIP after successful registration",
  "deviceServiceVersion": "MDS version",
  "bioType": "Finger",
  "bioSubType": "UNKNOWN",
  "purpose": "Auth  or Registration",
  "env": "Target environment",
  "domainUri": "URI of the auth server",
  "bioValue": "Encrypted with session key and base64urlencoded biometric data",
  "transactionId": "Unique transaction id",
  "timestamp": "ISO format datetime with time zone",
  "requestedScore": "Floating point number to represent the minimum required score for the capture",
  "qualityScore": "Floating point number representing the score for the current capture"
}
```

### Responses

#### Success Response
**Response Code : 200 (OK)**
```JSON
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

#### Failed Response
**Response Code : 200 (OK)**
```JSON
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

### Failure Details
For details about the error codes view the section [common error codes and message](#common-error-codes-and-messages).

# OTP Request Service (Public)
This service enables authentication partners to request for an OTP for a resident. The OTP will be send via message or email as requested to the resident. This OTP can then be used to authenticate the resident using authentication or eKYC service.

## Users of OTP Request service
1. `MISP (MOSIP Infrastructure Service Provider)` - MISP acts as a gate keeper for any OTP requests sent to this service. MISP is also responsible for the policy creation on the MOSIP servers so their partners will follow the set policy.
2. `Partners` - *Auth-Partners* and *eKYC-Partners* can send OTP Request to MOSIP on behalf of the resident for Authentication and eKYC requests respectively, via MISP.
3. `Partner-Api-Key` - Associated against a policy.

## POST /idauthentication/v1/otp/
This request will send an OTP to the resident.

### Resource URL 
`https://{base_url}/idauthentication/v1/otp/:MISP-LicenseKey/:Partner-ID/:Partner-Api-Key`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Header Parameters
Name | Description
-----|------------
Authorization | <ul><li>This is the authentication token</li><li>This is a mandatory parameter</li><li>**Ex:**</li></ul>

### Request Body Parameters
Name | Description
-----|-------------
id | <ul><li>API ID</li><li>This is a mandatory parameter</li><li>**Ex:** mosip.identity.otp</li></ul>
version | <ul><li>API version</li><li>This is a mandatory parameter</li><li>**Ex:** v1</li></ul>
transactionID | <ul><li>Transaction ID of the request</li><li>This is a mandatory parameter</li><li>**Ex:** 1234567890</li></ul>
requestTime | <ul><li>Time when request was captured</li><li>This is a mandatory parameter</li><li>**Ex:** 2019-02-15T10:01:57.086+05:30</li></ul>
env | <ul><li>Target environment</li><li>Allowed values are "Staging" | "Developer" | "Pre-Production" | "Production"</li><li>This is a mandatory parameter</li></ul>
domainUri | <ul><li>Unique URI per auth providers.</li><li>This can be used to federate across multiple providers or countries or unions.</li><li>This is a mandatory parameter</li></ul>
individualId | <ul><li>ID of resident (VID or UIN)</li><li>This is a mandatory parameter</li><li>**Ex:** 9830872690593682</li></ul>
individualIdType | <ul><li>ID Type of resident used</li><li>This is a mandatory parameter</li><li>Allowed Types of ID - VID, UIN</li><li>**Default Value:** VID</li></ul>
otpChannel | <ul><li>OTP channel for sending OTP request</li><li>This is a mandatory parameter</li><li>Allowed OTP Channels - EMAIL, PHONE</li></ul>

### Request Body
```JSON
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

### Responses

#### Success Response
**Response Code : 200 (OK)**
```JSON
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

#### Failed Response  
**Response Code : 200 (OK)**
```JSON
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

### Failure Details
Error Code|Error Message|Description|Action Message
-----------|-------------|-----------|----------------
IDA-MLC-001|Request to be received at MOSIP within&lt;x&gt; hrs/min|Invalid Time stamp|Please send the request within &lt;x&gt; hrs/min
IDA-MLC-002|Invalid UIN|Invalid UIN|Please retry with the correct UIN.
IDA-MLC-003|UIN has been deactivated|UIN Deactivated|Your UIN status is not active.
IDA-MLC-004|Invalid VID|Invalid VID|Please retry with correct VID.
IDA-MLC-005|%s VID|Expired,Used,Revoked VID|Please regenerate VID and try again
IDA-MLC-006|Missing Input parameter- &lt;attribute&gt;  Example: Missing Input parameter- version|Missing Input parameter- attribute - all the mandatory attributes |
IDA-MLC-007|Request could not be processed. Please try again|Could not process request/Unknown error; Invalid Auth Request; Unable to encrypt eKYC response|
IDA-MLC-009|Invalid Input parameter- attribute  |Invalid Input parameter- attribute|
IDA-MLC-010|VID has been deactivated|VID corresponding to a deactivated UIN|
IDA-MLC-014|&lt;Notification Channel&gt; not registered. Individual has to register and try again|&lt;Notification Channel&gt; not Registered (Phone/e-mail/both)|Please register your &lt;Notification Channel&gt; and try again
IDA-MLC-015| Identity Type - &lt;Identity Type&gt; not configured for the country|ID Type (UIN/VID) not supported for a country|
IDA-MLC-017|Invalid UserID|Invalid UserID|
IDA-MLC-018|%s not available in database|UIN,VID, User ID not available in database|
IDA-MPA-004|MOSIP Public key expired. |MOSIP Public key expired|Please reinitiate the request with updated public key
IDA-MPA-005|OTP Request Usage not allowed as per policy|OTP Trigger Usage not allowed as per policy|
IDA-MPA-007|License key does not belong to a registered MISP|License key does not belong to a registered MISP/ License key invalid|
IDA-MPA-008|License key of MISP has expired|License key expired|
IDA-MPA-009|Partner is not registered|PartnerID Invalid|
IDA-MPA-010|MISP and Partner not mapped|MISP and Partner not |
IDA-MPA-011|License key of MISP is suspended|License key status of MISP is suspended|
IDA-MPA-012|Partner is deactivated|PartnerID is not active|
IDA-MPA-014|Partner is not assigned with any policy|PartnerID is not mapped to a policy|
IDA-MPA-017|License key of MISP is blocked|License key status of MISP is blocked|
IDA-OTA-001|Innumerous OTP requests received|OTP Flooding error|
IDA-OTA-002|Could not generate/send OTP|Could not generate/send OTP|
IDA-OTA-006|UIN is locked for OTP generation. Please try again later |Try to generate OTP for a frozen Account|
IDA-OTA-008|OTP Notification Channel not provided.|No OTP Channel is provided in the input|
IDA-OTA-009|&lt;Notification Channel&gt; not configured for the country|&lt;Notification Channel&gt; not configured (Phone/e-mail/both)|

# Authentication Service (Internal)
This service details authentication (yes/no) that can be used by MOSIP modules to authenticate a resident using UserID/VID/UIN. Below are various authentication types supported by this service - Biometric based - Fingerprint, IRIS and Face.

## Users of Internal Authentication service

1. `Registration Client` - Registration Client can authenticate biometrics of Operator or Supervisor while onboarding them.
2. `Registration Processor` - Registration Processor can authenticate biometrics of Operator or Supervisor while processing registration packets.

## POST /idauthentication/v1/internal/auth
This request will authenticate an Operator/Supervisor using Biometric authentication.

### Resource URL
`https://{base_url}/idauthentication/v1/internal/auth`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Header Parameters
Name | Description
-----|------------
Authorization | <ul><li>This is the authentication token</li><li>This is a mandatory parameter</li><li>**Ex:**</li></ul>

### Request Body Parameters
Name | Description
-----|--------------------
id | <ul><li>API ID</li><li>This is a mandatory parameter</li><li>**Ex:** mosip.identity.kyc</li></ul>
version | <ul><li>API version</li><li>This is a mandatory parameter</li><li>**Ex:** v1</li></ul>
transactionID | <ul><li>Transaction ID of the request</li><li>This is a mandatory parameter</li><li>**Ex:** 1234567890</li></ul>
requestTime | <ul><li>Time when request was captured</li><li>This is a mandatory parameter</li><li>**Ex:** 2019-02-15T10:01:57.086+05:30</li></ul>
env | <ul><li>Target environment</li><li>Allowed values are "Staging" | "Developer" | "Pre-Production" | "Production"</li><li>This is a mandatory parameter</li></ul>
domainUri | <ul><li>Unique URI per auth providers.</li><li>This can be used to federate across multiple providers or countries or unions.</li><li>This is a mandatory parameter</li></ul>
requestedAuth | <ul><li>Authentication types requested</li><li>This is a mandatory parameter</li></ul>
requestedAuth.otp | <ul><li>OTP authentication was requested?</li><li>This is a mandatory parameter</li><li>**Default Value:** false</li><li>**Ex:** true or false</li></ul>
requestedAuth.demo | <ul><li>Demographic authentication was requested?</li><li>This is a mandatory parameter</li><li>**Default Value:** false</li><li>**Ex:** true or false</li></ul>
requestedAuth.bio | <ul><li>Biometric authentication was requested?</li><li>This is a mandatory parameter</li><li>**Default Value:** false</li><li>**Ex:** true or false</li></ul>
individualId | <ul><li>ID of resident (VID or UIN) or User ID of operator or supervisor</li><li>This is a mandatory parameter</li><li>**Ex:** 9830872690593682</li></ul>
individualIdType | <ul><li>ID Type of resident used</li><li>This is a mandatory parameter</li><li>Allowed Types of ID - VID, UIN and USERID</li><li>**Default Value:** USERID</li></ul>
consentObtained | <ul><li>If consent of residnet is obtained?</li><li>This is a mandatory parameter</li><li><li>**Default Value:** true</li></ul>
thumbprint | <ul><li>Thumbprint of public key certificate used for encryption of sessionKey</li><li>This is a mandatory parameter</li><li><li>This is currently not being used</li></ul>
requestSessionKey | <ul><li>Symmetric Key to be created, and then encrypt the generated Symmetric Key using 'MOSIP Public Key' shared to Partner, and then Base-64-URL encoded</li><li>Algorithm used for encryption can be  RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING</li><li>This is a mandatory parameter</li></ul>
requestHMAC | <ul><li>SHA-256 hash of request block before encryption</li><li>Encryption is done using 'requestSessionKey' and then base64URL encoded</li><li>Algorithm used for encryption can be AES/GCM/PKCS5Padding</li><li>This is a mandatory parameter</li></ul>
request | <ul><li>Request block to be used for authenticating the resident</li><li>This is encrypted using 'requestSessionKey' and then base64URL encoded</li><li>Algorithm used for encryption can be AES/GCM/PKCS5Padding</li><li>This is a mandatory parameter</li></ul>
request.otp | <ul><li>OTP used for authentication</li><li>This is mandatory when requestedAuth.otp is true</li></ul>
request.timestamp | <ul><li>Timestamp when request block was captured</li><li>This is an optional parameter</li></ul>
request.demographics | <ul><li>Demographic data of the residnet</li><li>This is mandatory when requestedAuth.demo is true</li></ul>
request.biometrics | <ul><li>Biometric data of an Individual which is sent in the response from the Capture API of SBI spec v1.0.</li><li>Refer to the [SBI spec v1.0](Secure-Biometric-Interface-Specification.md#capture) specification for complete information.</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.specVersion | <ul><li>SBI spec version used to capture the biometrics</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.data | <ul><li>JWS format of Biometric data of an Individual with X509 certificate.</li><li>The payload present in JWS is encrypted by below request.biometrics.sessionKey</li><li>symmetric encryption algorithm is used - AES/GCM/PKCS5Padding</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.data.bioType | <ul><li>Biometric data type - Finger,Iris,Face.</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.data.bioSubType | <ul><li>Biometric data sub-types for respective biometric types.</li><li>For Finger Modality: "Left IndexFinger", "Left MiddleFinger","Left RingFinger","Left LittleFinger","Left Thumb","Right IndexFinger", "Right MiddleFinger","Right RingFinger","Right LittleFinger","Right Thumb","UNKNOWN"</li><li>For Iris Modality: "Left","Right","UNKNOWN"</li><li>For Face Modality:  No sub type</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.data.bioValue | <ul><li>Biometric data encrypted with session key and base-64-URL encoded</li><li>For symmetric key encryption of bioValue, base64 encoded value of last 16 digits of biometrics.data.timestamp should be used as aad parameter, and base 64 encoded value of last 12 digits of biometrics.data.timestamp should be used as iv(salt) parameter.</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.data.timestamp | <ul><li>This timestamp is used in encryption of biometrics.data.bioValue as described above.</li><li>This is mandatory when requestedAuth.bio is true</li><li>**Ex:** 2019-02-15T10:01:57.086+05:30</li></ul>
request.biometrics.hash | <ul><li>SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format.</li><li>While calculating the hash for the first biometrics.data entry assume empty string as previous data block.</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.sessionKey | <ul><li>Symmetric key used by [SBI spec v1.0](Secure-Biometric-Interface-Specification.md#capture) to encrypt above biometric data attribute.</li><li>This symmetric key is encrypted by MOSIP Public Key shared to Device Providers using asymmetric key algorithm - RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING, and then Base64-url-encoded</li><li>This is mandatory when requestedAuth.bio is true</li></ul>
request.biometrics.thumbprint | <ul><li>SHA256 representation of thumbprint of the certificate that was used for encryption of session key</li><li>This is mandatory when requestedAuth.bio is true</li></ul>

### Request Body
```JSON
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

### Responses

#### Success Response
**Response Code : 200 (OK)**
```JSON
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

#### Failed Response
**Response Code : 200 (OK)**
```JSON
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

### Failure Details
Error Code|Error Message|Description|Action Message
-----------|-------------|-----------|----------------
IDA-BIA-001| Biometric data &ndash; &lt;Biometric Attribute&gt; did not match|Finger,Iris,Face Mismatch|Please give your biometrics again.
IDA-BIA-002|Duplicate fingers in request.|Duplicate fingers|Please try again with distinct fingers
IDA-BIA-003|Number of Fingers should not exceed 10.|Fingers exceeding 10|
IDA-BIA-006|Biometric data &lt;Biometric Attribute&gt; not available in database.|Missing biometric data in MOSIP database |Your Biometric data is not available in MOSIP
IDA-BIA-007|Duplicate Irises in request.|Duplicate Irises used|Please try again with distinct Irises
IDA-BIA-008|Number of Iris should not exceed 2.|Irises exceeding 2|
IDA-BIA-009|Number of Face records should not exceed 1.|Face exceeding 1|
IDA-MLC-001|Request to be received at MOSIP within&lt;x&gt; hrs/min|Invalid Time stamp|Please send the request within &lt;x&gt; hrs/min
IDA-MLC-002|Invalid UIN|Invalid UIN|Please retry with the correct UIN.
IDA-MLC-003|UIN has been deactivated|UIN Deactivated|Your UIN status is not active.
IDA-MLC-006|Missing Input parameter- &lt;attribute&gt;  Example: Missing Input parameter- version|Missing Input parameter- attribute - all the mandatory attributes |
IDA-MLC-007|Request could not be processed. Please try again|Could not process request/Unknown error; Invalid Auth Request; Unable to encrypt eKYC response|
IDA-MLC-008|No authentication type selected|No authentication type selected in the request|
IDA-MLC-009|Invalid Input parameter- attribute  |Invalid Input parameter- attribute|
IDA-MLC-011|Unsupported Authentication Type - &lt;Auth Type&gt; - &lt;SubType&gt; if applicable|Auth Type not supported for a country|Please use other Authentication Types in the request
IDA-MLC-012|Individual's Consent is not available|Invalid resident consent for eKYC/Auth|
IDA-MLC-013|Missing  &lt;authtype&gt; auth attribute  |Missing authtype parameter &ndash; when &lt;auth-type&gt; = &lsquo;True&rsquo; and corresponding auth attribute missing (OTP,Demo and Bio)|
IDA-MLC-014|&lt;Notification Channel&gt; not registered. Individual has to register and try again|&lt;Notification Channel&gt; not Registered (Phone/e-mail/both)|Please register your &lt;Notification Channel&gt; and try again
IDA-MLC-015| Identity Type - &lt;Identity Type&gt; not configured for the country|ID Type (UIN/USERID) not supported for a country|
IDA-MLC-017|Invalid UserID|Invalid UserID|
IDA-MLC-018|%s not available in database|UIN, User ID not available in database|
IDA-MPA-003|Unable to decrypt Request.|Invalid encryption of session key/request|
IDA-MPA-004|MOSIP Public key expired. |MOSIP Public key expired|Please reinitiate the request with updated public key

# Authentication Transactions Service (Internal)
Authentication Transactions Service can be used by Resident Services to retrieve authentication history of an Individual initiated by Partners. Authentications done by MOSIP's internal modules for any verification will not be returned. 

## Users of Authentication Transactions Service
1. `Resident Services` - Resident Services will send UIN or VID to retrieve all authentication transactions of an Individual, that are initiated by Partners.

## GET /idauthentication/v1/internal/authTransactions/individualIdType/:IDType/individualId/:ID?pageStart=1&pageFetch=10
This request will retrieve authentication transactions for the given UIN/VID, alongwith pageStart and pageFetch parameters.

### Resource URL
`https://{base_url}/idauthentication/v1/internal/authTransactions/individualIdType/:IDType/individualId/:ID?pageStart=1&pageFetch=10`

### Resource Details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Header Parameters
Name | Description
-----|------------
Authorization | <ul><li>This is the authentication token</li><li>This is a mandatory parameter</li><li>**Ex:**</li></ul>

### Request Path Parameters
Name | Description
-----|-------------
ID Type | <ul><li>This is an mandatory parameter</li><li>Values can be UIN or VID</li></ul>
ID | <ul><li>This is an mandatory parameter</li><li>This is the value of ID Type - UIN or VID</li></ul>

### Request Query Parameters
The authentication transactions can be queried using this REST service for certain count of transactions which can be retrieved for given pageStart number with pageFetch. The default pageStart value is 1. The default pageFetch value is 10. This default pageFetch value will be taken into account only if the pageStart is provided. If both pageStart and pageFetch values are not provided, all the authentication transactions for the UIN/VID are returned in the response.

Name | Description
-----|-------------
pageStart | <ul><li>The page number to start</li><li>This is an optional parameter</li><li>**Default Value:** 1</li></ul>
pageFetch | <ul><li>The number of entries per page</li><li>This is an optional parameter</li><li>**Default Value:** 10</li></ul>

### Responses

#### Success Response
**Response Code : 200 (OK)**
```JSON
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

#### Failed Response
**Response Code : 200 (OK)**
```JSON
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

### Failure Details
Error Code|Error Message|Description|Action Message
-----------|-------------|-----------|----------------
IDA-MLC-001|Request to be received at MOSIP within&lt;x&gt; hrs/min|Invalid Time stamp|Please send the request within &lt;x&gt; hrs/min
IDA-MLC-002|Invalid UIN|Invalid UIN|Please retry with the correct UIN.
IDA-MLC-003|UIN has been deactivated|UIN Deactivated|Your UIN status is not active.
IDA-MLC-007|Request could not be processed. Please try again|Could not process request/Unknown error; Invalid Auth Request|
IDA-MLC-009|Invalid Input parameter- attribute  |Invalid Input parameter- attribute|
IDA-MLC-015| Identity Type - &lt;Identity Type&gt; not configured for the country|ID Type (UIN/USERID) not supported for a country|
IDA-MLC-018|%s not available in database|UIN, VID not available in database|

# Authentication Types Status Service (Internal)
Authentication Types Status Service can be used by Resident Services to retrieve or update status (locked or unlocked) of Auth Types of an Individual using VID/UIN. 

## Users of Retrieve Authentication Types Status Service -
1. **Resident Services** - Individual can request to lock or unlock one or more authentication types using Resident Services, which in turn calls this service to store or retrieve the auth type status.  

## GET /idauthentication/v1/internal/authtypes/status/individualIdType/:IDType/individualId/:ID
This request will retrieve status (locked or unlocked) of Auth Types of an Individual using VID/UIN. 

### Resource URL
`https://{base_url}/idauthentication/v1/internal/authtypes/status/individualIdType/:IDType/individualId/:ID`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Path Parameters
Name | Description 
-----|-------------
ID Type | <ul><li>The page number to start</li><li>This is a mandatory parameter</li><li>**Default Value:** VID</li></ul>
ID | <ul><li>The value of IDType - UIN or VID</li><li>This is a mandatory parameter</li></ul>

### Responses

#### Success Response
**Response Code : 200 (OK)**
```JSON
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

#### Failed Response
**Response Code : 200 (OK)**
```JSON
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

### Failure Details
Error Code|Error Message|Description|Action Message
-----------|-------------|-----------|----------------
IDA-MLC-001|Request to be received at MOSIP within&lt;x&gt; hrs/min|Invalid Time stamp|Please send the request within &lt;x&gt; hrs/min
IDA-MLC-002|Invalid UIN|Invalid UIN|Please retry with the correct UIN.
IDA-MLC-003|UIN has been deactivated|UIN Deactivated|Your UIN status is not active.
IDA-MLC-007|Request could not be processed. Please try again|Could not process request/Unknown error; Invalid Auth Request|
IDA-MLC-009|Invalid Input parameter- attribute  |Invalid Input parameter- attribute|
IDA-MLC-015| Identity Type - &lt;Identity Type&gt; not configured for the country|ID Type (UIN/USERID) not supported for a country|
IDA-MLC-018|%s not available in database|UIN, VID not available in database|

## PUT /idauthentication/v1/internal/authtypes/status
This request will lock or unlock one or more authenticate types for an Individual using VID/UIN. 

### Resource URL
`https://{base_url}/idauthentication/v1/internal/authtypes/status`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
consentObtained | Y | Individual's consent | | 
id | Y | API Id | mosip.identity.otp | 
version | Y | API version |  | 1.0 
requestTime| Y |Time when Request was captured| | 2019-02-15T10:01:57.086+05:30
individualId| Y | VID | | 9830872690593682
individualIdType| Y | Allowed Type of Individual ID - VID, UIN | VID
request| Y | Auth type status attributes to be applied for the Individual | | 
request: authTypes| Y | List of auth type status attributes to be applied for the Individual | | 
request: authTypes: authType| Y | Auth type to lock - otp, demo, bio | | bio
request: authTypes: authSubType| N | Auth sub type to lock (if applicable for the selected autType) | | Finger
request: authTypes: isLocked|Y| Boolean value (`true` or `false`) whether to lock or unlock the selected authType (and authSubType) | | true

### Request Body
```JSON
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

### Responses

#### Success Response
**Response Code : 200 (OK)**
```JSON
{
  //API Metadata
  "id": "mosip.identity.authtype.status.update",
  "version": "1.0",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "errors": null
}
```

#### Failed Response
**Response Code : 200 (OK)**
```JSON
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

### Failure Details
Error Code|Error Message|Description|Action Message
-----------|-------------|-----------|----------------
IDA-MLC-001|Request to be received at MOSIP within&lt;x&gt; hrs/min|Invalid Time stamp|Please send the request within &lt;x&gt; hrs/min
IDA-MLC-002|Invalid UIN|Invalid UIN|Please retry with the correct UIN.
IDA-MLC-003|UIN has been deactivated|UIN Deactivated|Your UIN status is not active.
IDA-MLC-006|Missing Input parameter- &lt;attribute&gt;  Example: Missing Input parameter- version|Missing Input parameter- attribute - all the mandatory attributes |
IDA-MLC-007|Request could not be processed. Please try again|Could not process request/Unknown error; Invalid Auth Request|
IDA-MLC-009|Invalid Input parameter- attribute  |Invalid Input parameter- attribute|
IDA-MLC-012|Individual's Consent is not available|Invalid resident consent for eKYC/Auth|
IDA-MLC-015| Identity Type - &lt;Identity Type&gt; not configured for the country|ID Type (UIN/USERID) not supported for a country|
IDA-MLC-018|%s not available in database|UIN, VID not available in database|

# Identity Update Event Notificcation Service (Internal)
Whenever an UIN/VID is inserted or updated in ID-Repository module that event will be notifid to ID-Authentication using this Identity Update Event Notificcation Service.

## Users of Retrieve Authentication Types Status Service
1. **ID-Repository** -  For any UIN/VID create/update event in ID-Repository module will notify ID-Authentication with this service.

## POST /idauthentication/v1/internal/notify
This request will post the notification for VID/UIN create/update event. 

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
consentObtained | Y | Individual's consent | | 
id | Y | API Id | mosip.identity.event.notify | 
version | Y | API version |  | 1.0 
timestamp| Y |Time when Request was captured| | 2019-02-15T10:01:57.086+05:30
request| Y | Auth type status attributes to be applied for the Individual | | 
request: events| Y | List of events each for UIN/VID create/update | | 
request: events: event_type| Y | Event type - CREATE_UIN, UPDATE_UIN, CREATE_VID, UPDATE_VID | | CREATE_UIN
request: events: uin| atlease one of request:events:uin/request:events:vid field should be present, or both can be present | UIN value | | 9830872690
request: events: vid| atlease one of request:events:uin/request:events:vid field should be present, or both can be present | VID value | | 5603872690593682
request: events: expiryTimestamp|N| The expiry time of the UIN/VID on which the event is sent (as per the event_type). If not provided or `null` it is assumed as no expiry | | 2020-02-15T10:01:57.086+05:30
request: events: transactionLimit|N| The transaction limit of VID only for VID based event_type. If not provided or `null` it is assumed as no-limit | | 1

### Request Body
```JSON
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

### Responses

#### Success Response
**Response Code : 200 (OK)**
```JSON
{
  "id": "moip.ida.notification.event",
  "version": "1.0",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "errors": null
}
```

#### Failed Response
**Response Code : 200 (OK)**
```JSON
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

### Failure Details
Error Code | Error Message | Description | Action Message
-----------|---------------|-------------|----------------
IDA-MLC-001|Request to be received at MOSIP within&lt;x&gt; hrs/min|Invalid Time stamp|Please send the request within &lt;x&gt; hrs/min
IDA-MLC-002|Invalid UIN|Invalid UIN|Please retry with the correct UIN.
IDA-MLC-006|Missing Input parameter- &lt;attribute&gt;  Example: Missing Input parameter- version|Missing Input parameter- attribute - all the mandatory attributes |
IDA-MLC-007|Request could not be processed. Please try again|Could not process request/Unknown error; Invalid Auth Request|
IDA-MLC-009|Invalid Input parameter- attribute  |Invalid Input parameter- attribute|

# Common Error Codes and Messages
Error Code|Error Message|Description|Action Message
-----------|-------------|-----------|----------------
IDA-BIA-001| Biometric data &ndash; &lt;Biometric Attribute&gt; did not match|Finger,Iris,Face Mismatch|Please give your biometrics again.
IDA-BIA-002|Duplicate fingers in request.|Duplicate fingers|Please try again with distinct fingers
IDA-BIA-003|Number of Fingers should not exceed 10.|Fingers exceeding 10|
IDA-BIA-006|Biometric data &lt;Biometric Attribute&gt; not available in database.|Missing biometric data in MOSIP database |Your Biometric data is not available in MOSIP
IDA-BIA-007|Duplicate Irises in request.|Duplicate Irises used|Please try again with distinct Irises
IDA-BIA-008|Number of Iris should not exceed 2.|Irises exceeding 2|
IDA-BIA-009|Number of Face records should not exceed 1.|Face exceeding 1|
IDA-DEA-001|Demographic data  &lt;demo attribute&gt;  in  &lt;Language Code&gt; (if applicable) did not match|name, Full Address, Address line Items, Gender, Phone,e-mail,DOB,DOB Type, and age Mismatch in any language|Please re-enter your  &lt;demo attribute&gt;  in &lt;Language Code&gt; 
IDA-DEA-002|Unsupported Language Code &lt;XX&gt;|Unsupported language Code used in the Lang attribute|
IDA-DEA-003|Demographic data  &lt;Demographic Attribute&gt; in &lt;Language Code&gt; (if applicable)  not available in database.|Individual&rsquo;s data not available|
IDA-MLC-001|Request to be received at MOSIP within&lt;x&gt; hrs/min|Invalid Time stamp|Please send the request within &lt;x&gt; hrs/min
IDA-MLC-002|Invalid UIN|Invalid UIN|Please retry with the correct UIN.
IDA-MLC-003|UIN has been deactivated|UIN Deactivated|Your UIN status is not active.
IDA-MLC-004|Invalid VID|Invalid VID|Please retry with correct VID.
IDA-MLC-005|%s VID|Expired,Used,Revoked VID|Please regenerate VID and try again
IDA-MLC-006|Missing Input parameter- &lt;attribute&gt;  Example: Missing Input parameter- version|Missing Input parameter- attribute - all the mandatory attributes |
IDA-MLC-007|Request could not be processed. Please try again|Could not process request/Unknown error; Invalid Auth Request; Unable to encrypt eKYC response|
IDA-MLC-008|No authentication type selected|No authentication type selected in the request|
IDA-MLC-009|Invalid Input parameter- attribute  |Invalid Input parameter- attribute|
IDA-MLC-010|VID has been deactivated|VID corresponding to a deactivated UIN|
IDA-MLC-011|Unsupported Authentication Type - &lt;Auth Type&gt; - &lt;SubType&gt; if applicable|Auth Type not supported for a country|Please use other Authentication Types in the request
IDA-MLC-012|Individual's Consent is not available|Invalid resident consent for eKYC/Auth|
IDA-MLC-013|Missing  &lt;authtype&gt; auth attribute  |Missing authtype parameter &ndash; when &lt;auth-type&gt; = &lsquo;True&rsquo; and corresponding auth attribute missing (OTP,Demo and Bio)|
IDA-MLC-014|&lt;Notification Channel&gt; not registered. Individual has to register and try again|&lt;Notification Channel&gt; not Registered (Phone/e-mail/both)|Please register your &lt;Notification Channel&gt; and try again
IDA-MLC-015| Identity Type - &lt;Identity Type&gt; not configured for the country|ID Type (UIN/VID) not supported for a country|
IDA-MLC-018|%s not available in database|UIN,VID, User ID not available in database|
IDA-MPA-003|Unable to decrypt Request.|Invalid encryption of session key/request|
IDA-MPA-004|MOSIP Public key expired. |MOSIP Public key expired|Please reinitiate the request with updated public key
IDA-MPA-006|&lt;Auth Type&gt; - &lt;Sub Type&gt; (if applicable) Authentication Usage not allowed as per policy (Eg: OTP/Demo/Bio - Finger)|All Authentication Usages not allowed as per policy|
IDA-MPA-007|License key does not belong to a registered MISP|License key does not belong to a registered MISP/ License key invalid|
IDA-MPA-008|License key of MISP has expired|License key expired|
IDA-MPA-009|Partner is not registered|PartnerID Invalid|
IDA-MPA-010|MISP and Partner not mapped|MISP and Partner not |
IDA-MPA-011|License key of MISP is suspended|License key status of MISP is suspended|
IDA-MPA-012|Partner is deactivated|PartnerID is not active|
IDA-MPA-014|Partner is not assigned with any policy|PartnerID is not mapped to a policy|
IDA-MPA-015|&lt;Auth Type&gt; - &lt;Sub Type&gt; (if applicable) Authentiation Usage is mandatory as per policy (Eg: OTP/Demo/Bio - Finger)|Mandatory Auth Type as per policy of the partner is not available in the auth request|
IDA-MPA-016|HMAC Validation failed|HMAC value does not match|
IDA-MPA-017|License key of MISP is blocked|License key status of MISP is blocked|
IDA-OTA-003|OTP has expired|OTP expired|Please regenerate OTP and try again after sometime.
IDA-OTA-004|OTP is invalid|OTP Invalid|Please provide correct OTP value.
IDA-OTA-005|Input transactionID does not match transactionID of OTP Request|Invalid Transaction ID|
IDA-OTA-007|UIN is locked for OTP validation due to exceeding no of invalid OTP trials |Validate wrong OTP for exceeding no of retries|
IDA-OTA-010|Input Identity Type does not match Identity Type of OTP Request|Invalid Identity Type|