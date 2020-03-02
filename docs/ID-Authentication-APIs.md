
This section details about the REST services in ID Authentication module.
* [Authentication Service](#authentication-service-public) - This service can be used by Partners to authenticate an Individual using OTP, Demographic or Biometric-based authentication.
* [eKYC Service](#ekyc-service-public) - This service can be used by Partners to retrieve KYC details of an Individual, after authenticating them using OTP or Biometric-based authentication.
* [OTP Request Service](#otp-request-service-public) - This service can be used by Partners to send OTP on behalf of Individual, which can then be used for OTP-based authentication.
* [Internal Authentication Service](#authentication-service-internal) - This service can be used by MOSIP modules to authenticate Individual using Biometric-based authentication.
* [Authentication Transactions Service](#authentication-transactions-service-internal) - This service can be used by MOSIP modules to retrieve authentication transactions.
* [Authentication Type Status Service](#authentication-types-status-service-internal) - This service can be used by MOSIP modules to store/update/retrieve status of authentication types.

## Authentication Service (Public)
This service details authentication (yes/no auth) that can be used by Partners to authenticate an Individual. Below are various authentication types supported by this service - 
1. OTP based - OTP (Time based OTP)
2. Demographic based - Name, DOB, Age, Gender, Address, FullAddress
3. Biometric based - Fingerprint, IRIS and Face

#### Users of Authentication service -
1. `MISP (MOSIP Infrastructure Service Provider)` - MISP's role is limited to infrastructure provisioning and acting as a gate keeper for all authentication requests sent to this service. The MISP is also responsible for the policy creation on the MOSIP servers so their partners will follow the set policy.
2. `Partners` - *Auth-Partners* register themselves with MOSIP, under a MISP. Authentication requests are captured by Auth-Partners and sent to MOSIP, via MISP.

* [POST /idauthentication/v1/auth/](#post-idauthenticationv1auth) 

### POST /idauthentication/v1/auth/
This request will authenticate an Individual, based on provided authentication type(s).

#### Resource URL
<div>https://mosip.io/idauthentication/v1/auth/:Auth-Partner-ID/:MISP-LicenseKey</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | | mosip.identity.auth
version | Y | API version | | v1
transactionID| Y | Transaction ID of request | | 1234567890
requestTime| Y |Time when Request was captured| | 2019-02-15T10:01:57.086+05:30
requestedAuth| Y | Authentication Types requested| | 
requestedAuth: otp| Y | OTP Authentication Type | false| false
requestedAuth: demo| Y | Demographic Authentication Type | false| false
requestedAuth: bio| Y | Biometric Authentication Type | false|false
individualId| Y | VID of Individual | | 9830872690593682 
individualIdType| Y | Allowed Type of Individual ID - VID, UIN | VID |
consentObtained| Y | If consent of Individual is obtained | true
keyIndex| Y | Thumbprint of public key certificate used for encryption of sessionKey &lt;Not used currently&gt;| 
requestSessionKey| Y | Symmetric Key to be created, and then encrypt the generated Symmetric Key using 'MOSIP Public Key' shared to Partner using RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING algorithm, and then Base-64-URL encoded.| | 
requestHMAC| Y | SHA-256 hash of request block before encryption, which is encrypted with 'requestSessionKey' using AES/GCM/PKCS5Padding algorithm, and then Base-64-URL encoded | |
request| Y | Request block to be used for authenticating Individual, encrypted with 'requestSessionKey' using AES/GCM/PKCS5Padding algorithm, and then Base-64-URL encoded | | 
request: otp| N | OTP | | 
request: timestamp| N | Timestamp when request block was captured| | 
request: demographics|N| Demographic data of an Individual| |
request: biometrics|N| Biometric data of an Individual which is sent in the response from the Capture API of MDS v0.9.2. Refer to the [MDS v0.9.2](https://github.com/mosip/mosip-docs/wiki/MOSIP-Device-Service-Specification/5495eff4efe79718b4bb57cd95178e917d517671#53-capture) specification for complete information. | |
request: biometrics: data|Y| JWS format of Biometric data of an Individual with X509 certificate. The payload present in JWS is encrypted by below biometrics.sessionKey using symmetric encryption algorithm - AES/GCM/PKCS5Padding | |
request: biometrics: hash|Y| SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format. While calculating the hash for the first biometrics.data entry assume empty string as previous data block.| |
request: biometrics: sessionKey|Y| Symmetric key used by [MDS v0.9.2](https://github.com/mosip/mosip-docs/wiki/MOSIP-Device-Service-Specification/5495eff4efe79718b4bb57cd95178e917d517671#53-capture) to encrypt above biometric data attribute. This symmetric key is encrypted by MOSIP Public Key shared to Device Providers using asymmetric key algorithm - RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING, and then Base64-url-encoded| |


Mandatory fields for different types of authentications- 
1. **OTP Auth** - request: **otp** attribute is mandatory 
2. **Demographic Auth** - request: **demographics**  attribute is mandatory
2. **Biometric Auth** - request: **biometrics** attribute is mandatory

#### Request Body
```JSON
{
  "id": "mosip.identity.auth",
  "version": "v1",
  "requestTime": "2019-02-15T10:01:57.086+05:30",
  "transactionID": "1234567890",
  "requestedAuth": {
    "otp": true,
    "demo": false,
    "bio": false
  },
  "consentObtained": true,
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "keyIndex": "<Thumbprint of the public key certficate used for enryption of sessionKey. This is necessary for key rotaion>",
  "requestSessionKey": "<Encrypted and Base64-URL-encoded session key>",
  "requestHMAC": "<SHA-256 of request block before encryption and then hash is encrypted using the requestSessionKey>",
  "request": { // Encrypted with session key and base-64-URL encoded
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
    //biometrics section below is set with the response from the Capture API of MDS v0.9.2. Refer to the MDS v0.9.2 specification for complete information.
    "biometrics": [
      {
        "data": "<JWS signature format of data containing encrypted biometrics and device details>",
        "hash": "<SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format>", // For the first entry assume empty string as previous data block
        "sessionKey": "<Encrypted and Base64 url-encoded session key>"
      },
      {
        "data": "<JWS signature format of data containing encrypted biometrics and device details>",
        "hash": "<SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format>",
        "sessionKey": "<Encrypted and Base64 url-encoded session key>"
      }
    ]
  }
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)
###### Description : Successfully authenticated an Individual    

```JSON
{
  //API Metadata
  "id": "mosip.identity.auth",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  //Response Metadata
  "transactionID": "txn12345",
  //Auth Response
  "response": {
    "authStatus": true,
    "staticToken": "<static_token>"
  },
  "errors": null
}
```

##### Failed Response:
###### Status Code : 200 (OK)    
###### Description : Authentication of an Individual failed

```JSON
{
  //API Metadata
  "id": "mosip.identity.auth",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  //Response Metadata
  "transactionID": "txn12345",
  //Auth Response
  "response": {
    "authStatus": false,
    "staticToken": null
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
##### Failure Details
Error Code|Error Message|Description|Action Message
-----------|-------------|-----------|----------------
IDA-BIA-001| Biometric data &ndash; &lt;Biometric Attribute&gt; did not match|FIR,IIR,FACE Mismatch|Please give your biometrics again.
IDA-BIA-002|Duplicate fingers in request.|Duplicate fingers|Please try again with distinct fingers
IDA-BIA-003|Number of Fingers should not exceed 10.|Fingers exceeding 10|
IDA-BIA-006|Biometric data &lt;Biometric Attribute&gt; not available in database.|Missing biometric data in MOSIP database |Your Biometric data is not available in MOSIP
IDA-BIA-007|Duplicate Irises in request.|Duplicate Irises used|Please try again with distinct Irises
IDA-BIA-008|Number of IIR should not exceed 2.|Irises exceeding 2|
IDA-BIA-009|Number of FACE records should not exceed 1.|Face exceeding 1|
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
IDA-MPA-006|&lt;Auth Type&gt; - &lt;Sub Type&gt; (if applicable) Authentication Usage not allowed as per policy (Eg: OTP/Demo/Bio - FIR)|All Authentication Usages not allowed as per policy|
IDA-MPA-007|License key does not belong to a registered MISP|License key does not belong to a registered MISP/ License key invalid|
IDA-MPA-008|License key of MISP has expired|License key expired|
IDA-MPA-009|Partner is not registered|PartnerID Invalid|
IDA-MPA-010|MISP and Partner not mapped|MISP and Partner not |
IDA-MPA-011|License key of MISP is suspended|License key status of MISP is suspended|
IDA-MPA-012|Partner is deactivated|PartnerID is not active|
IDA-MPA-014|Partner is not assigned with any policy|PartnerID is not mapped to a policy|
IDA-MPA-015|&lt;Auth Type&gt; - &lt;Sub Type&gt; (if applicable) Authentiation Usage is mandatory as per policy (Eg: OTP/Demo/Bio - FIR)|Mandatory Auth Type as per policy of the partner is not available in the auth request|
IDA-MPA-016|HMAC Validation failed|HMAC value does not match|
IDA-MPA-017|License key of MISP is blocked|License key status of MISP is blocked|
IDA-OTA-003|OTP has expired|OTP expired|Please regenerate OTP and try again after sometime.
IDA-OTA-004|OTP is invalid|OTP Invalid|Please provide correct OTP value.
IDA-OTA-005|Input transactionID does not match transactionID of OTP Request|Invalid Transaction ID|
IDA-OTA-007|UIN is locked for OTP validation due to exceeding no of invalid OTP trials |Validate wrong OTP for exceeding no of retries|
IDA-OTA-010|Input Identity Type does not match Identity Type of OTP Request|Invalid Identity Type|

## eKYC Service (Public)
This service details authentication (eKYC auth) that can be used by Partners to authenticate an Individual and send Individual's KYC details as response. Below are various authentication types supported by eKYC Authentication - 
1. OTP Authentication - OTP
2. Biometric Authentication - Fingerprint, IRIS and Face

#### Users of KYC service -
1. `MISP (MOSIP Infrastructure Service Provider)` - MISP's role is limited to infrastructure provisioning and acting as a gate keeper for all KYC requests sent to this service. The MISP is also responsible for policy creation on the MOSIP servers so their partners will follow the set policy.
2. `Partners` - *eKYC-Partners* register themselves with MOSIP, under a MISP. KYC requests are captured by eKYC-Partners and sent to MOSIP, via MISP.

* [POST /idauthentication/v1/kyc/](#post-idauthenticationv1kyc) 

### POST /idauthentication/v1/kyc/
This request will provide KYC details of Individual, once an Individual is successfully authenticated.

#### Resource URL
<div>https://mosip.io/idauthentication/v1/kyc/:eKYC-Partner-ID/:MISP-LicenseKey</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | | mosip.identity.kyc
version | Y | API version | | v1
transactionID| Y | Transaction ID of request | | 1234567890
requestTime| Y |Time when Request was captured| | 2019-02-15T10:01:57.086+05:30
requestedAuth| Y | Authentication Types requested| | 
requestedAuth: otp| Y | OTP Authentication Type | false| false
requestedAuth: demo| Y | Demographic Authentication Type | false| false
requestedAuth: bio| Y | Biometric Authentication Type | false|false
individualId| Y | VID of Individual | | 9830872690593682 
individualIdType| Y | Allowed Type of Individual ID - VID, UIN | VID |
consentObtained| Y | If consent of Individual is obtained | true
secondaryLangCode| Y | Secondary Language Code | |
keyIndex| Y | Thumbprint of public key certificate used for encryption of sessionKey &lt;Not used currently&gt;| 
requestSessionKey| Y | Symmetric Key to be created, and then encrypt the generated Symmetric Key using 'MOSIP Public Key' shared to Partner using RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING algorithm, and then Base-64-URL encoded.| | 
requestHMAC| Y | SHA-256 hash of request block before encryption, which is encrypted with 'requestSessionKey' using AES/GCM/PKCS5Padding algorithm, and then Base-64-URL encoded | |
request| Y | Request block to be used for authenticating Individual, encrypted with 'requestSessionKey' using AES/GCM/PKCS5Padding algorithm, and then Base-64-URL encoded | | 
request: otp| N | OTP | | 
request: timestamp| N | Timestamp when request block was captured| | 
request: demographics|N| Demographic data of an Individual| |
request: biometrics|N| Biometric data of an Individual which is sent in the response from the Capture API of MDS v0.9.2. Refer to the [MDS v0.9.2](https://github.com/mosip/mosip-docs/wiki/MOSIP-Device-Service-Specification/5495eff4efe79718b4bb57cd95178e917d517671#53-capture) specification for complete information. | |
request: biometrics: data|Y| JWS format of Biometric data of an Individual with X509 certificate. The payload present in JWS is encrypted by below biometrics.sessionKey using symmetric encryption algorithm - AES/GCM/PKCS5Padding | |
request: biometrics: hash|Y| SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format. While calculating the hash for the first biometrics.data entry assume empty string as previous data block.| |
request: biometrics: sessionKey|Y| Symmetric key used by [MDS v0.9.2](https://github.com/mosip/mosip-docs/wiki/MOSIP-Device-Service-Specification/5495eff4efe79718b4bb57cd95178e917d517671#53-capture) to encrypt above biometric data attribute. This symmetric key is encrypted by MOSIP Public Key shared to Device Providers using asymmetric key algorithm - RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING, and then Base64-url-encoded| |


#### Request Body
```JSON
{
  "id": "mosip.identity.kyc",
  "version": "v1",
  "requestTime": "2019-02-15T10:01:57.086+05:30",
  "transactionID": "1234567890",
  "requestedAuth": {
    "otp": true,
    "demo": false,
    "bio": true
  },
  "consentObtained": true,
  "secondaryLangCode": "<sec-lang-code>",
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "keyIndex": "<Thumbprint of the public key certficate used for enryption of sessionKey. This is necessary for key rotaion>",
  "requestSessionKey": "<Encrypted and Base64-URL-encoded session key>",
  "requestHMAC": "<SHA-256 of request block before encryption and then hash is encrypted using the requestSessionKey>",
  "request": { // Encrypted with session key and base-64-URL encoded
    "timestamp": "2019-02-15T10:01:56.086+05:30 - ISO format timestamp",
    "otp": "123456",
    //biometrics section below is set with the response from the Capture API of MDS v0.9.2. Refer to the MDS v0.9.2 specification for complete information.
    "biometrics": [
      {
        "data": "<JWS signature format of data containing encrypted biometrics and device details>",
        "hash": "<SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format>", // For the first entry assume empty string as previous data block
        "sessionKey": "<Encrypted and Base64 url-encoded session key>"
      },
      {
        "data": "<JWS signature format of data containing encrypted biometrics and device details>",
        "hash": "<SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format>",
        "sessionKey": "<Encrypted and Base64 url-encoded session key>"
      }
    ]
  }
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)
###### Description : Successful KYC Authentication of an Individual    

```JSON
{
  //API Metadata
  "id": "mosip.identity.kyc",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  //Response Metadata
  "transactionID": "txn12345",
  //Auth Response
  "response": {
    "kycStatus": true,
    "staticToken": "<static_token>",
    "identity": {// encoded encrypted KYC info using Partner's public key
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
    }
  },
  "errors": null
}
```

##### Failed Response:
###### Status Code : 200 (OK)
###### Description : KYC Authentication of an Individual failed    

```JSON
{
  //API Metadata
  "id": "mosip.identity.kyc",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  //Response Metadata
  "transactionID": "txn12345",
  //Auth Response
  "response": {// encoded encrypted KYC info using Partner's public key
    "kycStatus": false,
    "identity": null
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
##### Failure Details
Error Code|Error Message|Description|Action Message
-----------|-------------|-----------|----------------
IDA-BIA-001| Biometric data &ndash; &lt;Biometric Attribute&gt; did not match|FIR,IIR,FACE Mismatch|Please give your biometrics again.
IDA-BIA-002|Duplicate fingers in request.|Duplicate fingers|Please try again with distinct fingers
IDA-BIA-003|Number of FIR should not exceed 10.|Fingers exceeding 10|
IDA-BIA-006|Biometric data &lt;Biometric Attribute&gt; not available in database.|Missing biometric data in MOSIP database |Your Biometric data is not available in MOSIP
IDA-BIA-007|Duplicate Irises in request.|Duplicate Irises used|Please try again with distinct Irises
IDA-BIA-008|Number of IIR should not exceed 2.|Irises exceeding 2|
IDA-BIA-009|Number of FACE records should not exceed 1.|Face exceeding 1|
IDA-EKA-001|Unable to encrypt eKYC response|Invalid encryption of eKYC response|
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
IDA-MPA-006|&lt;Auth Type&gt; - &lt;Sub Type&gt; (if applicable) Authentication Usage not allowed as per policy (Eg: OTP/Demo/Bio - FIR)|All Authentication Usages not allowed as per policy|
IDA-MPA-007|License key does not belong to a registered MISP|License key does not belong to a registered MISP/ License key invalid|
IDA-MPA-008|License key of MISP has expired|License key expired|
IDA-MPA-009|Partner is not registered|PartnerID Invalid|
IDA-MPA-010|MISP and Partner not mapped|MISP and Partner not |
IDA-MPA-011|License key of MISP is suspended|License key status of MISP is suspended|
IDA-MPA-012|Partner is deactivated|PartnerID is not active|
IDA-MPA-013|Partner is unauthorised for eKYC|Partner has no permission for e-KYC|
IDA-MPA-014|Partner is not assigned with any policy|PartnerID is not mapped to a policy|
IDA-MPA-015|&lt;Auth Type&gt; - &lt;Sub Type&gt; (if applicable) Authentiation Usage is mandatory as per policy (Eg: OTP/Demo/Bio - FIR)|Mandatory Auth Type as per policy of the partner is not available in the auth request|
IDA-MPA-016|HMAC Validation failed|HMAC value does not match|
IDA-MPA-017|License key of MISP is blocked|License key status of MISP is blocked|
IDA-OTA-003|OTP has expired|OTP expired|Please regenerate OTP and try again after sometime.
IDA-OTA-004|OTP is invalid|OTP Invalid|Please provide correct OTP value.
IDA-OTA-005|Input transactionID does not match transactionID of OTP Request|Invalid Transaction ID|
IDA-OTA-007|UIN is locked for OTP validation due to exceeding no of invalid OTP trials |Validate wrong OTP for exceeding no of retries|
IDA-OTA-010|Input Identity Type does not match Identity Type of OTP Request|Invalid Identity Type|

## OTP Request Service (Public)
This service enables Partners to request for an OTP for an Individual. The OTP will be send via message or email as requested to the Individual. This OTP can then be used to authenticate an Individual using Authentication or eKYC service.

#### Users of OTP Request service -
1. `MISP (MOSIP Infrastructure Service Provider)` - MISP acts as a gate keeper for any OTP requests sent to this service. MISP is also responsible for the policy creation on the MOSIP servers so their partners will follow the set policy.
2. `Partners` - *Auth-Partners* and *eKYC-Partners* can send OTP Request to MOSIP on behalf of Individual for Authentication and eKYC requests respectively, via MISP.

* [POST /idauthentication/v1/otp/](#post-idauthenticationv1otp) 

### POST /idauthentication/v1/otp/
This request will send an OTP to the Individual.

#### Resource URL 
<div>https://mosip.io/idauthentication/v1/otp/:Partner-ID/:MISP-LicenseKey</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | mosip.identity.otp | 
version | Y | API version |  | v1 
transactionID| Y | Transaction ID of request | | 1234567890
requestTime| Y |Time when Request was captured| | 2019-02-15T10:01:57.086+05:30
individualId| Y | VID | | 9830872690593682
individualIdType| Y | Allowed Type of Individual ID - VID, UIN | VID
otpChannel| Y | Allowed OTP Channels - EMAIL, PHONE| | true


#### Request Body
```JSON
{
  "id": "mosip.identity.otp",
  "version": "v1",
  "requestTime": "2019-02-15T07:22:57.086+05:30",
  "transactionID": "txn12345",
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "otpChannel": [
    "EMAIL",
    "PHONE"
  ]
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)
###### Description : OTP for Authentication or KYC Service was successfully sent to the Individual        

```JSON
{
  //API Metadata
  "id": "mosip.identity.otp",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  //Response Metadata
  "transactionID": "txn12345",
  //OTP Response
  "response": {
    "maskedMobile": "XXXXXXX123",
    "maskedEmail": "abXXXXXXXXXcd@xyz.com"
  },
  "errors": null
}
```

##### Failed Response:   
###### Status Code : 200 (OK)
###### Description : Failed to send OTP to the Individual   

```JSON
{
  //API Metadata
  "id": "mosip.identity.otp",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  //Response Metadata
  "transactionID": "txn12345",
  //OTP Response
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
##### Failure Details
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


## Authentication Service (Internal)
This service details authentication (yes/no auth) that can be used by MOSIP modules to authenticate an Individual using UserID/VID/UIN. Below are various authentication types supported by this service - Biometric based - Fingerprint, IRIS and Face

#### Users of Internal Authentication service -
1. `Registration Client` - Registration Client can authenticate biometrics of Operator or Supervisor while onboarding them.
2. `Registration Processor` - Registration Processor can authenticate biometrics of Operator or Supervisor while processing registration packets.

* [POST /idauthentication/v1/internal/auth](#post-idauthenticationv1internalauth) 

### POST /idauthentication/v1/internal/auth
This request will authenticate an Operator/Supervisor using Biometric authentication.

#### Resource URL
<div>https://mosip.io/idauthentication/v1/internal/auth</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | | mosip.identity.auth.internal
version | Y | API version | | v1
transactionID| Y | Transaction ID of request | | 1234567890
requestTime| Y |Time when Request was captured| | 2019-02-15T10:01:57.086+05:30
requestedAuth| Y | Authentication Types requested| | 
requestedAuth: otp| Y | OTP Authentication Type | false| false
requestedAuth: demo| Y | Demographic Authentication Type | false| false
requestedAuth: bio| Y | Biometric Authentication Type | false|false
individualId| Y | UserID of Operator/Supervisor | | 9830872690593682 
individualIdType| Y | Allowed Type of Individual ID - USERID, VID, UIN | USERID |
consentObtained| Y | If consent of Individual is obtained | true
keyIndex| Y | Thumbprint of public key certificate used for encryption of sessionKey &lt;Not used currently&gt;| 
requestSessionKey| Y | Symmetric Key to be created, and then encrypt the generated Symmetric Key using 'MOSIP Public Key' shared to Partner using RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING algorithm, and then Base-64-URL encoded| | 
requestHMAC| Y | SHA-256 hash of request block before encryption, which is encrypted with 'requestSessionKey' using AES/GCM/PKCS5Padding algorithm, and then Base-64-URL encoded | |
request| Y | Request block to be used for authenticating Individual, encrypted with 'requestSessionKey' using AES/GCM/PKCS5Padding algorithm, and then Base-64-URL encoded | | 
request: otp| N | OTP | | 
request: timestamp| N | Timestamp when request block was captured| | 
request: biometrics|N| Biometric data of an Individual| |
request: biometrics: data|Y| Base-64-URL encoded Biometric data of an Individual which is encrypted by below biometrics.sessionKey using symmetric encryption algorithm - AES/GCM/PKCS5Padding | |
request: biometrics: data: bioType|Y| Biometric data type - FIR,IIR,FACE | |
request: biometrics: data: bioSubType|Y| Biometric data sub-type - "Left IndexFinger", "Left MiddleFinger","Left RingFinger","Left LittleFinger","Left Thumb","Right IndexFinger", "Right MiddleFinger","Right RingFinger","Right LittleFinger","Right Thumb","Left Iris","Right Iris","Face", "UNKNOWN" | |
request: biometrics: data: bioValue|Y| Biometric data encrypted with session key and base-64-URL encoded. For symmetric key encryption of bioValue, base64 encoded value of last 16 digits of biometrics.data.timestamp should be used as aad parameter,  and base 64 encoded value of last 12 digits of biometrics.data.timestamp should be used as iv (salt) parameter.| |
request: biometrics: data: timestamp|Y| This timestamp is used in encryption of biometrics.data.bioValue as described above. | | 2019-02-15T10:01:57.086+05:30
request: biometrics: hash|Y| SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format. While calculating the hash for the first biometrics.data entry assume empty string as previous data block.| |
request: biometrics: sessionKey|Y| Symmetric key used to encrypt above biometric data attribute. This symmetric key is encrypted by MOSIP Public Key shared to Device Providers using asymmetric key algorithm - RSA/ECB/OAEPWITHSHA-256ANDMGF1PADDING, and then Base64-url-encoded| |


#### Request Body
```JSON
{
  "id": "mosip.identity.auth.internal",
  "version": "v1",
  "requestTime": "2019-02-15T10:01:57.086+05:30",
  "transactionID": "1234567890",
  "requestedAuth": {
    "bio": true,
    "demo": false
  },
  "consentObtained": true,
  "individualId": "9830872690593682",
  "individualIdType": "USERID",
  "keyIndex": "<Thumbprint of the public key certficate used for enryption of sessionKey. This is necessary for key rotaion>",
  "requestSessionKey": "<Encrypted and Base64-URL-encoded session key>",
  "requestHMAC": "<SHA-256 of request block before encryption and then hash is encrypted using the requestSessionKey>",
  "request": { // Encrypted with session key and base-64-URL encoded
    "timestamp": "2019-02-15T10:01:56.086+05:30 - ISO format timestamp",
    "biometrics": [
      {
        "data": { // Base-64-URL encoded
          "bioType": "FIR",
          "bioSubType": "UNKNOWN",
          "bioValue": "<encrypted with session key and base-64-URL encoded biometric data>",
          "timestamp": "2019-02-15T10:01:57.086+05:30"
        },
        "hash": "<SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format>",
        "sessionKey": "<Encrypted and Base64 url-encoded session key>",
      },
      {
        "data": { // Base-64-URL encoded
          "bioType": "IIR",
          "bioSubType": "RIGHT",
          "bioValue": "<encrypted with session key and base-64-URL encoded biometric data>",
          "timestamp": "2019-02-15T10:01:57.086+05:30"
        },
        "hash": "<SHA-256 hash of (SHA-256 hash of previous data block in hex format + SHA-256 of current data block before encrypting in hex format) in hex format>",
        "sessionKey": "<Encrypted and Base64 url-encoded session key>",
      }
    ]
  }
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)
###### Description : Successfully authenticated an Individual    

```JSON
{
  //API Metadata
  "id": "mosip.identity.auth.internal",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  //Response Metadata
  "transactionID": "1234567890",
  //Auth Response
  "response": {
    "authStatus": true
  },
  "errors": null
}
```

##### Failed Response:
###### Status Code : 200 (OK)    
###### Description : Authentication of an Individual failed

```JSON
{
  //API Metadata
  "id": "mosip.identity.auth.internal",
  "version": "v1",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  //Response Metadata
  "transactionID": "1234567890",
  //Auth Response
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
##### Failure Details
Error Code|Error Message|Description|Action Message
-----------|-------------|-----------|----------------
IDA-BIA-001| Biometric data &ndash; &lt;Biometric Attribute&gt; did not match|FIR,IIR,FACE Mismatch|Please give your biometrics again.
IDA-BIA-002|Duplicate fingers in request.|Duplicate fingers|Please try again with distinct fingers
IDA-BIA-003|Number of Fingers should not exceed 10.|Fingers exceeding 10|
IDA-BIA-006|Biometric data &lt;Biometric Attribute&gt; not available in database.|Missing biometric data in MOSIP database |Your Biometric data is not available in MOSIP
IDA-BIA-007|Duplicate Irises in request.|Duplicate Irises used|Please try again with distinct Irises
IDA-BIA-008|Number of IIR should not exceed 2.|Irises exceeding 2|
IDA-BIA-009|Number of FACE records should not exceed 1.|Face exceeding 1|
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


## Authentication Transactions Service (Internal)
Authentication Transactions Service can be used by Resident Services to retrieve authentication history of an Individual initiated by Partners. Authentications done by MOSIP's internal modules for any verification will not be returned. 

#### Users of Authentication Transactions Service -
1. `Resident Services` - Resident Services will send UIN or VID to retrieve all authentication transactions of an Individual, that are initiated by Partners.
 

* [GET /idauthentication/v1/internal/authTransactions/individualIdType/:IDType/individualId/:ID?pageStart=1&pageFetch=10](#get-idauthenticationv1internalauthtransactionsindividualidtypeidtypeindividualididpagestart1pagefetch10) 

### GET /idauthentication/v1/internal/authTransactions/individualIdType/:IDType/individualId/:ID?pageStart=1&pageFetch=10
This request will retrieve authentication transactions for the given UIN/VID, alongwith pageStart and pageFetch parameters.

#### Resource URL
<div>https://mosip.io/idauthentication/v1/internal/authTransactions/individualIdType/:IDType/individualId/:ID?pageStart=1&pageFetch=10</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Query Parameters
The authentication transactions can be queried using this REST service for certain count of transactions which can be retrieved for given pageStart number with pageFetch. The default pageStart value is 1. The default pageFetch value is 10. This default pageFetch value will be taken into account only if the pageStart is provided. If both pageStart and pageFetch values are not provided, all the authentication transactions for the UIN/VID are returned in the response.

Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
pageStart | N | The page number to start | 1 | 2
pageFetch | N | The number of entries per page | 10 | 20

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)
###### Description : Successfully retrieved authentication transactions    

```JSON
{
        //API Metadata
	"id": "mosip.identity.auth.transactions.read",
	"responseTime": "2019-07-11T07:30:59.383",
	"version": "v1",
	"errors": [],
        //Response
	"response": {
		"authTransactions": [{
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

##### Failed Response:
###### Status Code : 200 (OK)    
###### Description : Failed to retrieve authentication transactions

```JSON
{
  //API Metadata
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
##### Failure Details
Error Code|Error Message|Description|Action Message
-----------|-------------|-----------|----------------
IDA-MLC-001|Request to be received at MOSIP within&lt;x&gt; hrs/min|Invalid Time stamp|Please send the request within &lt;x&gt; hrs/min
IDA-MLC-002|Invalid UIN|Invalid UIN|Please retry with the correct UIN.
IDA-MLC-003|UIN has been deactivated|UIN Deactivated|Your UIN status is not active.
IDA-MLC-007|Request could not be processed. Please try again|Could not process request/Unknown error; Invalid Auth Request|
IDA-MLC-009|Invalid Input parameter- attribute  |Invalid Input parameter- attribute|
IDA-MLC-015| Identity Type - &lt;Identity Type&gt; not configured for the country|ID Type (UIN/USERID) not supported for a country|
IDA-MLC-018|%s not available in database|UIN, VID not available in database|


## Authentication Types Status Service (Internal)
Authentication Types Status Service can be used by Resident Services to retrieve or update status (locked or unlocked) of Auth Types of an Individual using VID/UIN. 

#### Users of Retrieve Authentication Types Status Service -
1. `Resident Services` - Individual can request to lock or unlock one or more authentication types using Resident Services, which in turn calls this service to store or retrieve the auth type status.
  

* [GET /idauthentication/v1/internal/authtypes/status/individualIdType/:IDType/individualId/:ID](#get-idauthenticationv1internalauthtypesstatusindividualidtypeidtypeindividualidid) 
* [PUT /idauthentication/v1/internal/authtypes/status](#put-idauthenticationv1internalauthtypesstatus) 

### GET /idauthentication/v1/internal/authtypes/status/individualIdType/:IDType/individualId/:ID
This request will retrieve status (locked or unlocked) of Auth Types of an Individual using VID/UIN. 

#### Resource URL
<div>https://mosip.io/idauthentication/v1/internal/authtypes/status/individualIdType/:IDType/individualId/:ID</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Path Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
IDType | Y | UIN or VID |   | VID
ID | Y | The value of IDType - UIN or VID |   | 1234567890

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)
###### Description : Successfully retrieved auth type status list    

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
        "authSubType": "FIR",
        "isLocked": true
      },
      {
        "authType": "bio",
        "authSubType": "IIR",
        "isLocked": true
      },
      {
        "authType": "bio",
        "authSubType": "FACE",
        "isLocked": true
      }
    ]
  }
}
```

##### Failed Response:
###### Status Code : 200 (OK)    
###### Description : Failed to retrieve auth type status

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
##### Failure Details
Error Code|Error Message|Description|Action Message
-----------|-------------|-----------|----------------
IDA-MLC-001|Request to be received at MOSIP within&lt;x&gt; hrs/min|Invalid Time stamp|Please send the request within &lt;x&gt; hrs/min
IDA-MLC-002|Invalid UIN|Invalid UIN|Please retry with the correct UIN.
IDA-MLC-003|UIN has been deactivated|UIN Deactivated|Your UIN status is not active.
IDA-MLC-007|Request could not be processed. Please try again|Could not process request/Unknown error; Invalid Auth Request|
IDA-MLC-009|Invalid Input parameter- attribute  |Invalid Input parameter- attribute|
IDA-MLC-015| Identity Type - &lt;Identity Type&gt; not configured for the country|ID Type (UIN/USERID) not supported for a country|
IDA-MLC-018|%s not available in database|UIN, VID not available in database|


### PUT /idauthentication/v1/internal/authtypes/status
This request will lock or unlock one or more authenticate types for an Individual using VID/UIN. 

#### Resource URL
<div>https://mosip.io/idauthentication/v1/internal/authtypes/status</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
consentObtained | Y | Individual's consent | | 
id | Y | API Id | mosip.identity.otp | 
version | Y | API version |  | v1 
transactionID| Y | Transaction ID of request | | 1234567890
requestTime| Y |Time when Request was captured| | 2019-02-15T10:01:57.086+05:30
individualId| Y | VID | | 9830872690593682
individualIdType| Y | Allowed Type of Individual ID - VID, UIN | VID
request| Y | Auth type status attributes to be applied for the Individual | | 
request: authTypes| Y | List of auth type status attributes to be applied for the Individual | | 
request: authTypes: authType| Y | Auth type to lock - otp, demo, bio | | bio
request: authTypes: authSubType| N | Auth sub type to lock (if applicable for the selected autType) | | FIR
request: authTypes: isLocked|Y| Boolean value (`true` or `false`) whether to lock or unlock the selected authType (and authSubType) | | true

#### Request Body
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
        "authSubType": "FIR",
        "isLocked": true
      },
      {
        "authType": "bio",
        "authSubType": "IIR",
        "isLocked": true
      },
      {
        "authType": "bio",
        "authSubType": "FACE",
        "isLocked": true
      }
    ]
  }
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)
###### Description : Successfully updated auth type status    

```JSON
{
  //API Metadata
  "id": "mosip.identity.authtype.status.update",
  "version": "1.0",
  "responseTime": "2019-02-15T07:23:19.590+05:30",
  "errors": null
}
```

##### Failed Response:
###### Status Code : 200 (OK)    
###### Description : Failed to update auth type status

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
##### Failure Details
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
