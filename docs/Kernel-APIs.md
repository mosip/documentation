# Kernel APIs

* Security APIs
  * [Key Manager Service](Kernel-APIs.md#key-manager-service-private)
  * [Crypto Manager Service](Kernel-APIs.md#crypto-manager-private)
  * [License Key Service](Kernel-APIs.md#license-key-manager-private)
  * [Crypto Signature Service](Kernel-APIs.md#crypto-signature-service-private)
* Notification APIs
  * [SMS Notification Service](Kernel-APIs.md#sms-notification-private)
  * [Email Notification Service](Kernel-APIs.md#email-notification-private)
* ID Generator APIs
  * [UIN Service](Kernel-APIs.md#uin--external)
  * [RID Service](Kernel-APIs.md#rid-generator-private)
  * [Static Token Service](Kernel-APIs.md#static-token-generator-private)
* Common APIs
  * [Audit Manager Service](Kernel-APIs.md#audit-manager-private)
  * [Data Sync Service](Kernel-APIs.md#sync-data-public)
  * [Applicant Types Service](Kernel-APIs.md#applicant-type-public)
  * [OTP Manager Service](Kernel-APIs.md#otp-manager-private)
  * [Registration Center APIs](Registration-Center-APIs.md)

## Key Manager Service (Private)

This service in MOSIP are used for operations related to key management and interaction with SoftHSM or RealHSM for key generation.

* [POST /generateCSR](Kernel-APIs.md#post-generatecsr)
* [POST /generateMasterKey/{objectType}](Kernel-APIs.md#post-generatemasterkey-objecttype)
* [GET /getCertificate](Kernel-APIs.md#get-getcertificate)
* [POST /uploadCertificate](Kernel-APIs.md#post-uploadcertificate)
* [POST /uploadOtherDomainCertificate](Kernel-APIs.md#post-uploadotherdomaincertificate)

### POST /generateCSR

This service will generate CSRs for a MOSIP application.

#### Resource URL

`https://{base_url}/v1/keymanager/generateCSR`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | No          |

#### Request Part Parameters

| Name             | Required | Description                                                                                                                | Example           |
| ---------------- | -------- | -------------------------------------------------------------------------------------------------------------------------- | ----------------- |
| applicationId    | Yes      | ID of the MOSIP Application for which we want to generate the CSR                                                          | KERNEL            |
| commonName       | Yes      | The fully qualified domain name (FQDN) of your server.                                                                     | MOSIP             |
| country          | Yes      | The two-letter ISO code for the country where your organization is location.                                               | IN for India      |
| state            | Yes      | The state/region where your organization is located.                                                                       | KA                |
| location         | Yes      | The city where your organization is located.                                                                               | BANGALORE         |
| organization     | Yes      | The legal name of your organization. This should not be abbreviated and should include suffixes such as Inc, Corp, or LLC. | IIITB             |
| organizationUnit | Yes      | The division of your organization handling the certificate.                                                                | MOSIP-TECH-CENTER |

#### Request

```
{
  "id": "io.mosip.keymanager.generateCSR",
  "metadata": {},
  "request": {
    "applicationId": "KERNEL",
    "commonName": "MOSIP",
    "country": "IN",
    "location": "BANGALORE",
    "organization": "IIITB",
    "organizationUnit": "MOSIP-TECH-CENTER",
    "referenceId": "string",
    "state": "KA"
  },
  "requesttime": "2020-10-05T13:14:56.696Z",
  "version": "1.0"
}
```

#### Responses

**Success Response**

```
{
  "errors": null,
  "id": "io.mosip.keymanager.generateCSR",
  "metadata": {},
  "response": {
    "certSignRequest": "string",
    "certificate": "string",
    "expiryAt": "string",
    "issuedAt": "string",
    "timestamp": "2020-10-05T13:14:56.696Z"
  },
  "responsetime": "2020-10-05T13:14:56.696Z",
  "version": "1.0"
}
```

**Response Code : 200 (OK)**

**Failure Response**

```
{
  "id": "io.mosip.keymanager.generateCSR",
  "version": "1.0",
  "responsetime": "2020-10-05T13:14:56.696Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-KMS-012",
      "message": "Key Generation Process is not completed."
    }
  ]
}
```

**Response Code : 200 (OK)**

### POST /generateMasterKey/{objectType}

This service will generate master keys for a MOSIP application.

#### Resource URL

`https://{base_url}/v1/keymanager/generateMasterKey/{objectType}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Path Parameters

| Name       | Required | Description                                         | Example |
| ---------- | -------- | --------------------------------------------------- | ------- |
| objectType | Yes      | Object Type can be Response Type Certificate or CSR |         |

#### Request Part Parameters

| Name             | Required | Description                                                                                                                | Example           |
| ---------------- | -------- | -------------------------------------------------------------------------------------------------------------------------- | ----------------- |
| applicationId    | Yes      | ID of the MOSIP Application for which we want to generate the Master Key                                                   | REGISTRATION      |
| commonName       | Yes      | The fully qualified domain name (FQDN) of your server.                                                                     | MOSIP             |
| country          | Yes      | The two-letter ISO code for the country where your organization is location.                                               | IN for India      |
| state            | Yes      | The state/region where your organization is located.                                                                       | KA                |
| location         | Yes      | The city where your organization is located.                                                                               | BANGALORE         |
| organization     | Yes      | The legal name of your organization. This should not be abbreviated and should include suffixes such as Inc, Corp, or LLC. | IIITB             |
| organizationUnit | Yes      | The division of your organization handling the certificate.                                                                | MOSIP-TECH-CENTER |
| referenceId      | No       | ID of the Machine or Partner for whom the Key is getting generated                                                         |                   |
| force            | Yes      | Force attribute will force key rotation.                                                                                   | true or false     |

#### Request

```
{
  "id": "io.mosip.keymanager.generateMasterKey",
  "metadata": {},
  "request": {
    "applicationId": "KERNEL",
    "commonName": "MOSIP",
    "country": "IN",
    "force": false,
    "location": "BANGALORE",
    "organization": "IIITB",
    "organizationUnit": "MOSIP-TECH-CENTER",
    "referenceId": "string",
    "state": "KA"
  },
  "requesttime": "2020-10-05T13:44:48.123Z",
  "version": "1.0"
}
```

#### Responses

**Success Response**

```
{
  "errors": null,
  "id": "io.mosip.keymanager.generateMasterKey",
  "metadata": {},
  "response": {
    "certSignRequest": "string",
    "certificate": "string",
    "expiryAt": "string",
    "issuedAt": "string",
    "timestamp": "2020-10-05T13:44:48.123Z"
  },
  "responsetime": "2020-10-05T13:44:48.123Z",
  "version": "1.0"
}
```

**Response Code : 200 (OK)**

**Error Response**

```
{
  "id": "io.mosip.keymanager.generateMasterKey",
  "version": "1.0",
  "responsetime": "2020-10-05T13:44:48.123Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-KMS-010",
      "message": "Reference Id Not Supported for the Application ID."
    }
  ]
}
```

**Response Code : 200 (OK)**

### GET /getCertificate

This service will retrieve a certificate using the application id and reference id.

#### Resource URL

`https://{base_url}/v1/keymanager/getCertificate?applicationId={application_id}&referenceId={reference_id}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Query Parameters

| Name          | Required | Description                                                            | Example |
| ------------- | -------- | ---------------------------------------------------------------------- | ------- |
| applicationId | Yes      | ID of the MOSIP Application for which we want to fetch the certificate |         |
| referenceId   | No       | ID of the Machine or Partner for whom we want to fetch the certificate |         |

#### Request Part Parameters

\-NA-

#### Request

\-NA-

#### Responses

**Success Response**

```
{
  "errors": null,
  "id": "string",
  "metadata": {},
  "response": {
    "certSignRequest": "string",
    "certificate": "string",
    "expiryAt": "string",
    "issuedAt": "string",
    "timestamp": "string"
  },
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

**Response Code : 200 (OK)**

**Error Response**

```
{
  "id": null,
  "version": null,
  "responsetime": "2020-10-05T13:53:53.799Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-KMS-005",
      "message": "Required String parameter 'applicationId' is not present"
    }
  ]
}
```

**Response Code : 200 (OK)**

#### Failure Details

| Error Code  | Error Message                                            |
| ----------- | -------------------------------------------------------- |
| KER-KMS-002 | ApplicationId not found in Key Policy                    |
| KER-KMS-005 | Required String parameter 'applicationId' is not present |
| KER-KMS-012 | Key Generation Process is not completed.                 |

### POST /uploadCertificate

This service will be used to upload a certificate.

#### Resource URL

`https://{base_url}/v1/keymanager/uploadCertificate`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | No          |

#### Request Part Parameters

| Name            | Required | Description                                                              | Example |
| --------------- | -------- | ------------------------------------------------------------------------ | ------- |
| applicationId   | Yes      | ID of the MOSIP Application for which we want to fetch the certificate   |         |
| certificateData | Yes      | The certificate data                                                     |         |
| referenceId     | No       | ID of the Machine or Partner for which we want to upload the certificate |         |

#### Request

```
{
  "id": "io.mosip.keymanager.uploadCertificate",
  "metadata": {},
  "request": {
    "applicationId": "KERNEL",
    "certificateData": "<certificate data>",
    "referenceId": "10001"
  },
  "requesttime": "2020-10-05T14:05:34.658Z",
  "version": "1.0"
}
```

#### Responses

**Success Response**

```
{
  "errors": null,
  "id": "io.mosip.keymanager.uploadCertificate",
  "metadata": {},
  "response": {
    "status": "success",
    "timestamp": "2020-10-05T14:01:51.588Z"
  },
  "responsetime": "2020-10-05T14:05:34.658Z",
  "version": "1.0"
}
```

**Response Code : 200 (OK)**

**Error Response**

```
{
  "id": "io.mosip.keymanager.uploadCertificate",
  "version": "1.0",
  "responsetime": "2020-10-05T14:05:34.658Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-KMS-003",
      "message": "No unique alias is found"
    }
  ]
}
```

**Response Code : 200 (OK)**

#### Failure Details

| Error Code  | Error Message                                            |
| ----------- | -------------------------------------------------------- |
| KER-KMS-002 | ApplicationId not found in Key Policy                    |
| KER-KMS-005 | Required String parameter 'applicationId' is not present |
| KER-KMS-012 | Key Generation Process is not completed.                 |
| KER-KMS-003 | No unique alias is found                                 |
| KER-KMS-013 | Certificate Parsing Error.                               |

### POST /uploadOtherDomainCertificate

This service will be used to upload a certificate which is of other domains with in MOSIP system.

#### Resource URL

`https://{base_url}/v1/keymanager/uploadOtherDomainCertificate`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | No          |

#### Request Part Parameters

| Name            | Required | Description                                                              | Example |
| --------------- | -------- | ------------------------------------------------------------------------ | ------- |
| applicationId   | Yes      | ID of the MOSIP Application for which we want to fetch the certificate   |         |
| certificateData | Yes      | The certificate data                                                     |         |
| referenceId     | No       | ID of the Machine or Partner for which we want to upload the certificate |         |

#### Request

```
{
  "id": "io.mosip.keymanager.uploadOtherDomainCertificate",
  "metadata": {},
  "request": {
    "applicationId": "KERNEL",
    "certificateData": "<certificate data>",
    "referenceId": "10001"
  },
  "requesttime": "2020-10-05T14:05:34.658Z",
  "version": "1.0"
}
```

#### Responses

**Success Response**

```
{
  "errors": null,
  "id": "io.mosip.keymanager.uploadOtherDomainCertificate",
  "metadata": {},
  "response": {
    "status": "success",
    "timestamp": "2020-10-05T14:01:51.588Z"
  },
  "responsetime": "2020-10-05T14:05:34.658Z",
  "version": "1.0"
}
```

**Response Code : 200 (OK)**

**Error Response**

```
{
  "id": "io.mosip.keymanager.uploadOtherDomainCertificate",
  "version": "1.0",
  "responsetime": "2020-10-05T14:11:11.810Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-KMS-013",
      "message": "Certificate Parsing Error."
    }
  ]
}
```

**Response Code : 200 (OK)**

#### Failure Details

| Error Code  | Error Message                                            |
| ----------- | -------------------------------------------------------- |
| KER-KMS-002 | ApplicationId not found in Key Policy                    |
| KER-KMS-005 | Required String parameter 'applicationId' is not present |
| KER-KMS-012 | Key Generation Process is not completed.                 |
| KER-KMS-003 | No unique alias is found                                 |
| KER-KMS-013 | Certificate Parsing Error.                               |

## Crypto Manager (Private)

* [POST v1/cryptomanager/encrypt](Kernel-APIs.md#post-v-1-cryptomanager-encrypt)
* [POST v1/cryptomanager/decrypt](Kernel-APIs.md#post-v-1-cryptomanager-decrypt)

### POST v1/cryptomanager/encrypt

This service will encrypt provided plain string data with session symmetric key and encrypt symmetric key with application specific public key based on given timestamp(current timestamp of encryption). This will respond combined encrypted data and symmetric key having a key splitter.

#### Resource URL

`https://{base_url}/v1/cryptomanager/encrypt`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request

```
{
  "id": "io.mosip.cryptomanager.encrypt",
  "metadata": {},
  "request": {
    "aad": "VGhpcyBpcyBzYW1wbGUgYWFk",
    "applicationId": "REGISTRATION",
    "data": "string",
    "referenceId": "REF01",
    "salt": "LA7YcvP9DdLIVI5CwFt1SQ",
    "timeStamp": "2018-12-10T06:12:52.994Z"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "1.0"
}
```

#### Responses

**Success Response**

```
{
  "id": "io.mosip.cryptomanager.encrypt",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2018-12-10T06:12:52.994Z",
  "errors": null,
  "response": {
    "data": "wk4RM2su2lBXuhx3_EtBijXTDp0Y20fJA6tmoONPjr6YBLqwu_YRWiSa10o-bQWesb-IobxPg-KsZq-Gc0L6Rq6besw-rMavg5a5nPU7b3pAug0N6Ek4B7S8v_tc5cu7LBRdBv1mRSS2onxXbT2R4qeEwl_11KtxPs_ek6g4vV6oEQRem2fPhop_21DaoWVEZFovHAAJDqSFj3R38A-fxvHHpVSa9BRTe-DeTKj_xZsNYXQixZR3jMdijtm8Q7lIT3E1x8LYp-hG3RhR_xC7trAOTqilzLjLfirE3Wjfor5bhLiG9eZyTb52ihKsDV1l2oBAhn9Aao_fYl3UD5QekSNLRVlfU1BMSVRURVIjeKen-3j5KhnE-93Qfe_pBfMBIKEkTJJ7pR-4cO7l-X0"
  } 
}   
```

**Response Code : 200 (OK)**

### POST v1/cryptomanager/decrypt

This service will decrypt encryted data along with symmetric key having splitter for given timestamp(encryption timestamp).

#### Resource URL

`https://mosip.io/v1/cryptomanager/decrypt`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request

```
{
  "id": "io.mosip.cryptomanager.decrypt",
  "metadata": {},
  "request": {
    "aad": "VGhpcyBpcyBzYW1wbGUgYWFk",
    "applicationId": "REGISTRATION",
    "data": "string",
    "referenceId": "REF01",
    "salt": "LA7YcvP9DdLIVI5CwFt1SQ",
    "timeStamp": "2018-12-10T06:12:52.994Z"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "1.0"
}
```

#### Responses

**Success Response**

```
{
  "id": "io.mosip.cryptomanager.decrypt",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2018-12-10T06:12:52.994Z",
  "errors": null,
  "response": {
    "data": "string"
  }
}	
```

**Response Code : 200 (OK)**

**Error Response**

```
{
  "id": "io.mosip.cryptomanager.decrypt",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2018-12-10T06:12:52.994Z",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
 "response": null
}	
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                                  | Error Description                     |
| ----------- | -------------------------------------------------------------- | ------------------------------------- |
| KER-CRY-001 | No Such algorithm is supported                                 | No Such algorithm is supported        |
| KER-CRY-002 | public key is invalid                                          | public key is invalid                 |
| KER-CRY-003 | data sent to decrypt is without key splitter or invalid        | invalid data without key breaker      |
| KER-CRY-003 | or not base64 encoded                                          | Invalid data                          |
| KER-CRY-004 | should not be null or empty                                    | Invalid request                       |
| KER-CRY-005 | cannot connect to keymanager service                           | cannot connect to key manager service |
| KER-CRY-006 | Keymanager Service has replied with following error            | keymanager service error              |
| KER-CRY-008 | Error occur while parsing error from response                  | Response Parse Error                  |
| KER-CRY-007 | timestamp should be in ISO 8601 format yyyy-MM-ddTHH::mm:ss.SZ | DateTime Parse Exception              |
| KER-CRY-500 | Internal server error                                          | Internal server error                 |

## License Key Manager (Private)

MISPs call the IDA to authenticate the Individuals. There can be various service calls such as Demographic, biometric based authentications. Each service calls have the permission associated. When a service call comes to the IDA, a request is sent to the Kernel module to retrieve the permissions for the License Key.

This service facilitates generation of license key, mapping the license key to several permissions, and fetch permissions mapped to a license key.

**License Key Generation**

This component generates a license key for a specified MISP ID.

* [POST /license/generate](Kernel-APIs.md#post-license-generate)
* [POST /license/permission](Kernel-APIs.md#post-license-permission)
* [GET /license/permission](Kernel-APIs.md#get-license-permission)
* [PUT /license/status](Kernel-APIs.md#put-license-status)

### POST /license/generate

#### Resource URL

`https://mosip.io/v1/licensekeymanager/license/generate`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name              | Required | Description                                                        | Default Value | Example                  |
| ----------------- | -------- | ------------------------------------------------------------------ | ------------- | ------------------------ |
| licenseExpiryTime | Yes      | The time at which the license will expire                          |               | 2019-03-07T10:00:00.000Z |
| MISPId            | Yes      | The MISP ID against which the license key generated will be mapped |               | 9837                     |

#### Request

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
    "licenseExpiryTime": "2019-03-07T10:00:00.000Z",
	"MISPId": "9837"
  }
}
```

#### Responses

**Success Response**

**Description: license key generated successfully**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "licenseKey": "gR7Mw7tA7S7qifkf"
  }
}
```

**Response Code : 200 (OK)**

### POST /license/permission

This component maps various permissions provided to a specified license key.

#### Resource URL

`https://mosip.io/v1/licensekeymanager/license/permission`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name        | Required | Description                                                                   | Default Value | Example          |
| ----------- | -------- | ----------------------------------------------------------------------------- | ------------- | ---------------- |
| licenseKey  | Yes      | The license key to which the permissions will be mapped                       |               | gR7Mw7tA7S7qifkf |
| MISPId      | Yes      | The MISP ID against which the license key is mapped                           |               | 9837             |
| permissions | Yes      | The list of permissions that will be mapped to the MISP-licensekey mentioned. |               | OTP Trigger      |

#### Request

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
	"licenseKey": "gR7Mw7tA7S7qifkf",
	"permissions": [
	  "OTP Trigger","OTP Authentication"
	],
    "MISPId": "9837"
  }
}
```

#### Responses

**Success Response**

**Description: license key permission updated successfully**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "status": "Mapped License with the permissions"
  }
}
```

**Response Code : 200 (OK)**

### GET /license/permission

This component fetches various permission mapped to a license key.

#### Resource URL

`https://mosip.io/v1/licensekeymanager/license/permission`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name       | Required | Description                                                  | Default Value | Example          |
| ---------- | -------- | ------------------------------------------------------------ | ------------- | ---------------- |
| licenseKey | Yes      | The license key for which the permissions need to be fetched |               | gR7Mw7tA7S7qifkf |
| MISPId     | Yes      | The MISP ID against which the license key is mapped          |               | 9837             |

#### Request

`https://mosip.io/v1/licensekeymanager/license/permission?licenseKey=gR7Mw7tA7S7qifkf&MISPId=9837`

#### Responses

**Success Response**

**Description: license key permissions fetched successfully**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "permissions": [
	  "OTP Trigger",
	  "OTP Authentication"
	]
  }
}
```

**Response Code : 200 (OK)**

### PUT /license/status

This service moves the status of the license key to SUSPENDED status.

#### Resource URL

`https://mosip.io/v1/licensekeymanager/license/status`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name       | Required | Description                                                                      | Default Value | Example          |
| ---------- | -------- | -------------------------------------------------------------------------------- | ------------- | ---------------- |
| licenseKey | Yes      | The license key for which the permissions need to be fetched                     |               | gR7Mw7tA7S7qifkf |
| status     | Yes      | The status of the license key. It is an enumeration {ACTIVE, SUSPENDED, BLOCKED} |               | ACTIVE           |

#### Request

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
	"licensekey":"gR7Mw7tA7S7qifkf",
	"status":"ACTIVE"
  }
}
```

#### Responses

**Success Response**

**Description: license key suspended successfully**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response" : {
	"message":"The status had been changed successfully. "
  }
}	
```

**Response Code : 200 (OK)**

**Failure Response**

**Description: Invalid license key**

```
{
  "id": "string",
  "version": "string",
  "responsetime": "2019-04-04T05:03:18.287Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_APP_001",
      "message": "License key not found"
    }
  ]
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                                       | Error Description             |
| ----------- | ------------------------------------------------------------------- | ----------------------------- |
| KER-LKM-001 | TSP entered is null or empty                                        | Illegal TSP                   |
| KER-LKM-002 | The length of license key generated was not of the specified length | Invalid generated license key |
| KER-LKM-003 | Permission value entered is not accepted                            | Not acceptable permission     |
| KER-LKM-004 | LicenseKey Not Found.                                               | LicenseKey Not Found          |
| KER-LKM-005 | LicenseKey Expired.                                                 | LicenseKey Expired            |
| KER-LKM-006 | License Key entered is null or empty.                               | Illegal license key           |
| KER-LKM-007 | Permission entered is an empty string.                              | Illegal Permission            |
| KER-LKM-008 | Expiry DateTime should be ahead of current DateTime.                | Date expired                  |
| KER-LKM-009 | No Permissions has been mapped to the entered TSP-LicenseKey Pair.  | No Permissions mapped         |

## Crypto Signature Service (Private)

* [POST v1/signature/sign](Kernel-APIs.md#post-v-1-signature-sign)
* [POST v1/signature/validate](Kernel-APIs.md#post-v-1-signature-validate)

### POST v1/signature/sign

This service will sign provided plain string data.

#### Resource URL

`https://mosip.io/v1/signature/sign`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request

```
{
  "id": "string",
  "metadata": {},
  "request": {
  "data": "test"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

#### Responses

**Success Response**

```
{
  "id": null,
  "version": null,
  "responsetime": "2019-05-20T10:12:43.624Z",
  "metadata": null,
  "response": {
    "signature": "DrgkF2vm4WvBe04UNe-RePRcrg77uQpsH3GENRcglBsid-K0UDReeeZVKwimOdwV7Ht1j-_D1BFf2sCrM8ni7ztE5Xc_3TEaniOAnOgZDRSI0GG-uSqjH51AwTSl1PYdStfXtOn6HEfEU68JG7TdAliDI5C7thJ1YNmPnHusIsZzX6sW_VfvSpLeA_RzCqnUDH_VaEzZt_5zRYiQv9van4wt0P7HTfIBlQ5zaeO3wXOc3Pogct3ssKwqdaMmZdc7QTDOFqDZZVceMTIXKyiH-ZVs_u3QXRysiLVdXoz7d7yXHdWxQtzsfMjY7alMJNgbmu4X26LYNRemn65Mmn6ixA",
    "timestamp": "2019-05-20T10:12:43.082Z"
  },
  "errors": null
}	
```

**Response Code : 200 (OK)**

### POST v1/signature/validate

This service will decrypt encryted data along with symmetric key having splitter for given timestamp(encryption timestamp).

#### Resource URL

`https://mosip.io/v1/signature/validate`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request

```
{
  "id": "string",
  "metadata": {},
  "request": {
    "signature": "DrgkF2vm4WvBe04UNe-RePRcrg77uQpsH3GENRcglBsid-K0UDReeeZVKwimOdwV7Ht1j-_D1BFf2sCrM8ni7ztE5Xc_3TEaniOAnOgZDRSI0GG-uSqjH51AwTSl1PYdStfXtOn6HEfEU68JG7TdAliDI5C7thJ1YNmPnHusIsZzX6sW_VfvSpLeA_RzCqnUDH_VaEzZt_5zRYiQv9van4wt0P7HTfIBlQ5zaeO3wXOc3Pogct3ssKwqdaMmZdc7QTDOFqDZZVceMTIXKyiH-ZVs_u3QXRysiLVdXoz7d7yXHdWxQtzsfMjY7alMJNgbmu4X26LYNRemn65Mmn6ixA",
    "data": "test",
    "timestamp": "2019-05-20T10:12:43.082Z"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

#### Responses

**Success Response**

**Description: decrypt encryted data along with symmetric key having splitter**

```
{
    "id": null,
    "version": null,
    "responsetime": "2019-05-20T10:21:02.027Z",
    "metadata": null,
    "response": {
        "status": "success",
        "message": "Validation Successful"
    },
    "errors": null
}	
```

**Response Code : 200 (OK)**

**Error Response**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
 "response": null
}	
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message           | Error Description                   |
| ----------- | ----------------------- | ----------------------------------- |
| KER-CSS-999 | Invalid request input   | While passing Invalid input request |
| KER-CSS-101 | Validation Unsuccessful | While sign response in not valid    |
| KER-CSS-102 | Internal server error   | Internal server error               |

## SMS Notification (Private)

* [POST /sms/send](Kernel-APIs.md#post-sms-send)

### POST /sms/send

This service will send request to SMS gateway.

#### Resource URL

`https://mosip.io/v1/smsnotifier/sms/send`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Request format          | JSON        |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name    | Required | Description                                    | Default Value | Example                        |
| ------- | -------- | ---------------------------------------------- | ------------- | ------------------------------ |
| message | Yes      | Message in the SMS                             |               | This is the sample SMS message |
| number  | Yes      | Mobile number to which the SMS have to be sent |               | 743764398                      |

#### Request

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
	"message": "Your Booking Request accepted. B-Ref BI56793",
	"number": "89900074454"
  }
}
```

#### Responses

**Success Response**

**Description: sms send successfully**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
	"message": "Sms Request Sent",
	"status": "success"
  }
}	
```

**Response Code : 200 (OK)**

**Error Response**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "response": null
}	
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                                                       | Error Description          |
| ----------- | ----------------------------------------------------------------------------------- | -------------------------- |
| KER-NOS-001 | Number and message can't be empty, null                                             | SMS Illegal Input          |
| KER-NOS-002 | Contact number cannot contains alphabet,special character or less than or more than | SMS Invalid Contact Number |
| KER-NOS-500 | Internal server error                                                               | Internal server error      |

## Email Notification (Private)

* [POST /email/send](Kernel-APIs.md#post-email-send)

### POST /email/send

This service will send request to Email/SMTP Service.

#### Resource URL

`https://dev.mosip.io/v1/emailnotifier/email/send`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Request format          | Form Data   |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name        | Required | Description              | Default Value | Example             |
| ----------- | -------- | ------------------------ | ------------- | ------------------- |
| mailTo      | Yes      | Mail ID of the recepient |               | `mosip@gmail.com`   |
| mailCc      | No       | Mail ID of the recepient |               | `mosip@gmail.com`   |
| mailSubject | Yes      | Mail ID of the recepient |               | Sample mail subject |
| mailContent | No       | Mail ID of the recepient |               | Sample mail content |
| attachments | No       | Mail ID of the recepient |               | multipart/formdata  |

#### Request

```
-H "Content-Type: multipart/form-data" 
-F "attachments={}" 
-F "mailCc=user1@gmail.com" 
-F "mailContent=OTP for Auth" 
-F "mailSubject=OTP" 
-F "mailTo=admin1@gmail.com"
```

#### Responses

**Success Response**

**Description: sms send successfully**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
	"message": "Email Request sent",
	"status": "success"
  }
}	
```

**Response Code : 200 (OK)**

**Error Response**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "response": null
}	
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                     | Error Description                  |
| ----------- | ------------------------------------------------- | ---------------------------------- |
| KER-NOE-001 | To must be valid. It can't be empty or null.      | Receiver Address not found         |
| KER-NOE-002 | Subject must be valid. It can't be empty or null. | Subject not found                  |
| KER-NOE-003 | Content must be valid. It can't be empty or null. | Content not found                  |
| KER-NOE-004 |                                                   | Mail Send Exception Code           |
| KER-NOE-005 |                                                   | Mail Authentication Exception Code |
| KER-NOE-006 |                                                   | Mail Exception Code                |
| KER-NOE-999 | Data not valid                                    | Request Data not valid             |
| KER-NOE-500 |                                                   | Internal Server Error              |

## UIN (External)

* [GET /uin](Kernel-APIs.md#uin-get)
* [PUT /uin](Kernel-APIs.md#put-uin)

### GET /uin

This service will return unused UIN from UIN pool

#### Resource URL

`https://mosip.io/v1/uingenerator/uin`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name | Required | Description | Default Value | Example |
| ---- | -------- | ----------- | ------------- | ------- |
| -NA- |          |             |               |         |

#### Request

N/A

#### Responses

**Success Response**

**Description: uin generated successfully**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
	"uin": "734168915279"
  }
}
```

**Response Code : 200 (OK)**

### PUT /uin

This service will update the issued UN status to Assigned or Unassigned(Unused).

#### Resource URL

`https://mosip.io/v1/uingenerator/uin`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name | Required | Description | Default Value | Example |
| ---- | -------- | ----------- | ------------- | ------- |
| -NA- |          |             |               |         |

#### Request

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request" : {
    "uin":"5193698130",
    "status":"ASSIGNED"
  }
}
```

#### Responses

**Success Response**

**Description: uin status updated successfully**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "uin":"5193698130",
    "status":"ASSIGNED"
  }
}
```

**Response Code : 200 (OK)**

**Error Response**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "response": null
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                          | Error Description          |
| ----------- | -------------------------------------- | -------------------------- |
| KER-UIG-001 | UIN could not be found                 | UIN could not be found     |
| KER-UIG-003 | Given UIN status not found             | UIN Status not found       |
| KER-UIG-004 | Given UIN is not in ISSUED status      | UIN Not Issued             |
| KER-UIG-005 | Internal Server Error                  | Internal Server Error      |
| KER-UIG-006 | Error in retrieving from config server | Config Server Fetch failed |

## RID generator (Private)

* [GET /v1/ridgenerator/generate/rid/{centerid}/{machineid}](Kernel-APIs.md#get-v-1-ridgenerator-generate-rid-centerid-machineid)

### GET /v1/ridgenerator/generate/rid/{centerid}/{machineid}

This service returns a RID for the requested CenterID and MachineID.

#### Resource URL

`https://mosip.io/v1//generate/rid/{centerid}/{machineid}/`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name      | Required | Description               | Default Value | Example |
| --------- | -------- | ------------------------- | ------------- | ------- |
| centerid  | Yes      | Centerid of registration  | -NA-          | 10002   |
| machineid | Yes      | Machineid of registration | -NA-          | 10032   |

#### Request

```
-NA-
```

#### Responses

**Success Response**

```
{
  "id": null,
  "version": null,
  "responsetime": "2019-05-07T04:30:40.061Z",
  "metadata": null,
  "response": {
    "rid": "10002100320001920190507043040"
  },
  "errors": null
}
```

**Error Response**

```
{
  "id": null,
  "version": null,
  "responsetime": "2019-05-07T04:30:40.061Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ]
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                | Error Description                              |
| ----------- | -------------------------------------------- | ---------------------------------------------- |
| KER-RIG-002 | Empty input entered                          | Empty Input Error Code                         |
| KER-RIG-003 | Input length is not valid                    | Input length error code                        |
| KER-RIG-004 | Timestamp length should be greater than zero | Invalid CenterID or MachineID Timestamp Length |
| KER-RIG-005 | Error occured while fetching rid             | RID Fetch Exception                            |
| KER-RIG-006 | Error occured while storing rid              | RID Update Exception                           |
| KER-RIG-007 | Sequence length should be greater than zero  | Invalid SEQ\_Length Exception                  |
| KER-RIG-999 |                                              | HTTP Message Not Readable                      |
| KER-RIG-500 |                                              | Runtime Exception                              |

## Static Token generator (Private)

* [GET tokenidgenerator/{uin}/{partnercode}](Kernel-APIs.md#get-tokenidgenerator-uin-partnercode)

### GET tokenidgenerator/{uin}/{partnercode}

This service returns a static token for the requested UIN and Partner ID. It will return the same Static Token for every call made with the same UIN and Partner ID.

#### Resource URL

`https://mosip.io/v1/tokenidgenerator/{uin}/{partnercode}/`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name        | Required | Description            | Default Value | Example          |
| ----------- | -------- | ---------------------- | ------------- | ---------------- |
| UIN         | Yes      | UIN of the individual. | -NA-          | 2345346532564566 |
| partnercode | Yes      | ID of the partner.     | -NA-          | 9373             |

#### Request

```
-NA-
```

#### Responses

**Success Response**

**Description: token id generated successfully**

```
{
  "id": "mosip.kernel.tokenid.generate",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2019-04-04T05:03:18.287Z",
  "response": {
  "tokenID": "268177021248100621690339355202974361"
   },
  "errors": null
}
```

**Response Code : 200 (OK)**

**Failure Response**

**Description: Invalid parameters**

```
{
  "id": "mosip.kernel.tokenid.generate",
  "version": "1.0",
  "metadata": {},
  "responsetime": "2019-04-04T05:03:18.287Z",
  "response": null,
  "errors": [
    {
      "errorCode": "KER-TIG-010",
      "message": "UIN and partner code cannot be empty"
    }
  ]
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                        | Error Description                  |
| ----------- | ------------------------------------ | ---------------------------------- |
| KER-UIG-005 | Internal Server Error                | Internal Server Error              |
| KER-TIG-010 | UIN and partner code cannot be empty | Empty UIN or PARTNERCODE Exception |
| KER-RIG-500 |                                      | Runtime Exception                  |

## Audit Manager (Private)

Audits are events/transactions which need to be captured and stored to facilitate auditing. This data could further be used for reporting by the business.

This includes auditing various event types like System events (Periodic scans), Business events/transactions (Change in demo data), Security Events etc.

The Audit Manager component will receive a request to audit and store data, validate the request is from an authorized source, securely store the requested data and respond back with an acknowledgement of storage (Success/Failure). This component will also ensure non-auditable data is not stored.

It will also ensure audit data stored is archived based on the defined archival policy.

* [POST /audits](Kernel-APIs.md#post-audits)

### POST /audits

#### Resource URL

`https://mosip.io/v1/auditmanager/audits`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name            | Required | Description              | Default Value | Example                  |
| --------------- | -------- | ------------------------ | ------------- | ------------------------ |
| eventId         | Yes      | ID of the event          |               |                          |
| eventName       | Yes      | Name of the event        |               | Periodic Scan            |
| eventType       | Yes      | Type of the event        |               | System Event             |
| actionTimeStamp | Yes      | Timestamp of the event   |               | 2018-10-04T05:57:20.929Z |
| hostName        | Yes      | Hostname                 |               | Hostname                 |
| hostIp          | Yes      | IP of the host           |               | 2018-10-04T05:57:20.929Z |
| applicationId   | Yes      | ID of the Application    |               | 1                        |
| applicationName | Yes      | Name of the event        |               | Registration             |
| sessionUserId   | Yes      | Session User Id          |               |                          |
| sessionUserName | Yes      | Session User name        |               |                          |
| id              | Yes      | ID                       |               | 15426388761562           |
| idType          | Yes      | ID Type                  |               | Unique Id                |
| createdBy       | Yes      | Actor of the event       |               |                          |
| moduleName      | No       | Name of the module       |               | Schedulor                |
| moduleId        | No       | ID of the module         |               | SCHE93                   |
| description     | No       | Description of the event |               | Example description      |

#### Request

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
	"eventId": "string",
	"eventName": "string",
	"eventType": "string",
	"actionTimeStamp": "2018-10-04T05:57:20.929Z",
	"hostName": "string",
	"hostIp": "string",
	"applicationId": "string",
	"applicationName": "string",
	"sessionUserId": "string",
	"sessionUserName": "string",
	"id": "string",
	"idType": "string",
	"createdBy": "string",
	"moduleName": "string",
	"moduleId": "string",
	"description": "string"
  }
}
```

#### Responses

**Success Response**

**Description: audit request completed successfully**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "status": true
  }
}
```

**Response Code : 200 (OK)**

**Error Response**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "response": null
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                              | Error Description     |
| ----------- | ---------------------------------------------------------- | --------------------- |
| KER-AUD-001 | Invalid Audit Request. Required parameters must be present | Handler Exception     |
| KER-AUD-002 | Invalid Audit Request. Format is incorrect.                | Invalid Format        |
| KER-AUD-500 | Internal server error                                      | Internal server error |

## Applicant type (Public)

These set of services does various operations regarding the applicant type.

* [GET /applicanttype/getApplicantType](Kernel-APIs.md#get-applicanttype-getapplicanttype)

### GET /applicanttype/getApplicantType

This service finds the Applicant type for the combination of Individual type code,Gender code ,DOB ,Biometric available and Language code. If there is a combination entry exists for these combinations, the corresponding Applicant Type code is returned.

#### Resource URL

`https://mosip.io/v1/applicanttype/getApplicantType`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name               | Required | Description                                  | Default Value | Example                  |
| ------------------ | -------- | -------------------------------------------- | ------------- | ------------------------ |
| individualTypeCode | Yes      | The code of the individual type              | -NA-          | INDTYP\_002              |
| genderCode         | Yes      | The code of the Gender.                      | -NA-          | ML                       |
| dateofbirth        | Yes      | Date of birth in UTC standard ISO8601 format | -NA-          | 2008-10-04T05:00:00.000Z |
| biometricAvailable | No       | Is the biometric details available           | -NA-          | true                     |
| languagecode       | Yes      | Language code in ISO 639-2 standard          | -NA-          | eng                      |

#### Request

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
    "attributes": [
      {
        "attribute": "individualTypeCode",
        "value": "FR"
      },
      {
        "attribute": "dateofbirth",
        "value": "2012-03-08T11:46:12.640Z"
      },
      {
        "attribute": "genderCode",
        "value": "MLE"
      },
      {
        "attribute": "biometricAvailable",
        "value": false
      }
    ]
  }
}
```

#### Responses

**Success Response**

**Description: applicant type code fetched successfully**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response" : {
	"applicationtypecode": "002"
  }
}
```

**Response Code : 200 (OK)**

**Failure Response**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "response" : null
}
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                            | Error Description    |
| ----------- | -------------------------------------------------------- | -------------------- |
| KER-MSD-147 | Applicant Type data does not exist                       | No Application Found |
| KER-MSD-148 | One or more input parameter is invalid or does not exist | Invalid Request      |

## OTP Manager (Private)

* [OTP Generator](Kernel-APIs.md#otp-generator)
* [OTP validator](Kernel-APIs.md#otp-validator)

### OTP Generator

This component facilitates generation of OTP for various purposes. EG: Login in Pre-registration

The OTP Generator component will receive a request to generate OTP, validate if the OTP generation request is from an authorized source, call OTP generator API with the input parameters (Key), receive the OTP from the OTP generator API which is generated based on the OTP generation policy and respond to the source with the OTP.

The OTP Generator can also reject a request from a blocked/frozen account and assign a validity to each OTP that is generated, based on the defined policy

#### Resource URL

`POST /generate`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name | Required | Description | Default Value | Example    |
| ---- | -------- | ----------- | ------------- | ---------- |
| key  | Yes      | Key         |               | 9820173642 |

#### Request

`v1/otpmanager/otp/generate`

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
	"key": "9820173642"
  }
}
```

#### Response

**Success Response**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "otp": "849004",
	"status": "GENERATION_SUCCESSFUL"
  }
}
```

**Response Code : 200 (OK)**

**Failure Response**

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "response": null
}
```

**Response Code : 200 (OK)**

### OTP Validator

This component facilitates basic validation of an OTP.

This includes: Receiving a request for OTP validation with required input parameters (Key), Validating the pattern of OTP generated based on defined policy, validating if the OTP is active/inactive and responding to the source with a response (Valid/Invalid)

This component also facilitates deletion of every successfully validated OTP when consumed and freezing an account for exceeding the number of retries/wrong input of OTP.

#### Resource URL

`GET /validate`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name | Required | Description | Default Value | Example    |
| ---- | -------- | ----------- | ------------- | ---------- |
| key  | Yes      | Key         |               | 9820173642 |
| otp  | Yes      | OTP         |               | 123456     |

#### Request

`v1/otpmanager/validate?key=9820173642&otp=123456`

#### Response

```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "response": {
	"status": "success",
	"message": "VALIDATION SUCCESSFUL"
  }
}	
```

**Response Code : 200 (OK)**

#### Failure details

| Error Code  | Error Message                                                            | Error Description         |
| ----------- | ------------------------------------------------------------------------ | ------------------------- |
| KER-OTG-001 | Key length should be in the range of 3-64.                               | Illegal Key Input         |
| KER-OTV-001 | Key can't be empty or null.                                              | Invalid Key Input         |
| KER-OTV-002 | Length of key should be in the range of 3-64.                            | Illegal Key Input         |
| KER-OTV-003 | OTP can't be empty or null.                                              | Invalid OTP Input         |
| KER-OTV-004 | OTP consists of only numeric characters. No other characters is allowed. | Ileegal OTP Input         |
| KER-OTV-005 | Validation can't be performed against this key. Generate OTP first.      | key not found             |
| KER-OTV-500 | Internal server error                                                    | Internal server error     |
| KER-OTV-999 | HTTP Message Not Readable Exception                                      | Http Message Not Readable |
| KER-OTG-002 | Crypto failure                                                           | Crypto failure            |
| KER-OTG-003 | Invalid key or algorithm found                                           | Algorithm Failure         |
| KER-OTG-004 | IO exception found                                                       | IO Failure                |
