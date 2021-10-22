* Security APIs
	* [Key Manager Service](#key-manager-private)
	* [Crypto Manager Service](#crypto-manager-private)
	* [License Key Service](#license-key-manager-private)
	* [Crypto Signature Service](#crypto-signature-service-private)
* Notification APIs
	* [SMS Notification Service](#sms-notification-private)
	* [Email Notification Service](#email-notification-private)
* ID Generator APIs
	* [UIN Service](#uin--external)
	* [RID Service](#rid-generator-private)
	* [Static Token Service](#static-token-generator-private)
* Common APIs
	* [Audit Manager Service](#audit-manager-private)
	* [Data Sync Service](#sync-data-public)
	* [Applicant Types Service](#applicant-type-public)
	* [OTP Manager Service](#otp-manager-private)
	* [Registration Center APIs](Registration-Center-APIs.md)

# Key Manager (Private)
* [GET /publickey](#get-publickey)
* [POST /decrypt](#post-decrypt)

## GET /publickey
This service will provide the public key for the specific application. 

### Resource URL
`https://mosip.io/v1/keymanager/publickey`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description |  Example
-----|----------|-------------|--------
applicationId |Yes|Id of the application| REGISTRATION,IDA
referenceId|No|Id of the Machine/MISP|
timeStamp |Yes|Date-time  in UTC ISO-8601| 2007-12-03T10:15:30Z

### Request
`https://mosip.io/v1/keymanager/publickey/REGISTRATION?timeStamp=2018-12-09T06%3A39%3A03.683Z `

### Responses

#### Success Response

##### Description: public key is issued successfully
```JSON

{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
		  "publicKey": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwUAubI0cMDZMlalDYbzZj4G2UrWY0QDtmZQyqU_ER5CA1gbxlHDQIesm1DVyp6kf1sG-RcosKPqKIhe9vKLPx5pzQXinGdl_8e5bkPpg2RLlDoNju1ycohPrCk0VOd4eNU90-SRJZH_62QE1_MG2yIohI7e7cuC93Q9SHMD8jmJ7DX2zTui4zbo-c5g7vFAtzDgxJg0vSPGbap682xkWZNgzRA_ctrnHF_9_JMzP_6Equ8E_g5BaI3jkWnVmDNjDzzseBH9zHpfbx6wNYrzQZy8iqqywbUtbHWtM0ALkH7nLi4atVbL6a-ryFt6Tq7qfGzYhLtWN47t4GxwyOJC99QIDAQAB",
		  "issuedAt": "2018-01-01T10:00:00",
		  "expiryAt": "2018-12-10T06:12:51.994"
   }
	
}
```
**Response Code : 200 (OK)**

## POST /decrypt
This service will decrypt the encrypted symmetric key 

### Resource URL
`https://mosip.io/v1/keymanager/decrypt `

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description |  Example
-----|----------|-------------|--------
applicationId |Yes|Id of the application| REGISTRATION,IDA
referenceId|No|Id of the Machine/MISP|
timeStamp (encryption timestamp) |Yes|Date-time  in UTC ISO-8601| 2007-12-03T10:15:30Z

### Request
```json
{	
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
    "request": {
      "applicationId": "REGISTRATION",
      "encryptedSymmetricKey": "encryptedSymmetricKey",
      "referenceId": "REF01",
      "timeStamp": "2018-12-10T06:12:52.994Z"
    }
}
```

### Responses

#### Success Response

##### Description: decrypt the encrypted symmetric key successfully
```json
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "symmetricKey": "decryptedSymmetricKey"
  }
}
```
**Response Code : 200 (OK)**

#### Error Response
```json
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

### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-KMS-001 |	Certificate is not valid	|   validity check fail
KER-KMS-002 |   ApplicationId not found in Key Policy | ApplicationId not valid
KER-KMS-003 | No unique alias is found| No unique alias
KER-KMS-004 | No Such algorithm is supported| No such algorithm exception
KER-KMS-005 | Invalid request | Invalid request
KER-KMS-006 | timestamp should be in ISO 8601 format yyyy-MM-ddTHH::mm:ss.SSSZ | date time parse exception
KER-KMS-007 | Exception occured in cypto library | Crypto exception
KER-KMS-500 | Internal server error | Internal server error

# Crypto Manager (Private)
* [POST v1/cryptomanager/encrypt](#post-v-1-cryptomanager-encrypt)
* [POST v1/cryptomanager/decrypt](#post-v-1-cryptomanager-decrypt)

## POST v1/cryptomanager/encrypt
This service will encrypt provided plain string data with session symmetric key and encrypt symmetric key with application specific public key based on given timestamp(current timestamp of encryption). This will respond combined encrypted data and symmetric key having a key splitter.  

### Resource URL
`https://mosip.io/v1/cryptomanager/encrypt`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request
```json
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
    "applicationId": "REGISTRATION",
    "data": "string",
    "referenceId": "REF01",
    "salt": null,
    "timeStamp": "2018-11-10T06:12:52.994Z"
  }       
}
```

### Responses

##### Description: encrypted data successfully
```json
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
  "response": {
    "data": "wk4RM2su2lBXuhx3_EtBijXTDp0Y20fJA6tmoONPjr6YBLqwu_YRWiSa10o-bQWesb-IobxPg-KsZq-Gc0L6Rq6besw-rMavg5a5nPU7b3pAug0N6Ek4B7S8v_tc5cu7LBRdBv1mRSS2onxXbT2R4qeEwl_11KtxPs_ek6g4vV6oEQRem2fPhop_21DaoWVEZFovHAAJDqSFj3R38A-fxvHHpVSa9BRTe-DeTKj_xZsNYXQixZR3jMdijtm8Q7lIT3E1x8LYp-hG3RhR_xC7trAOTqilzLjLfirE3Wjfor5bhLiG9eZyTb52ihKsDV1l2oBAhn9Aao_fYl3UD5QekSNLRVlfU1BMSVRURVIjeKen-3j5KhnE-93Qfe_pBfMBIKEkTJJ7pR-4cO7l-X0"
  } 
}   
```
**Response Code : 200 (OK)**

## POST v1/cryptomanager/decrypt
This service will decrypt encryted data along with symmetric key having splitter for given timestamp(encryption timestamp). 

### Resource URL
`https://mosip.io/v1/cryptomanager/decrypt`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request
```json
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "request": {
    "applicationId": "REGISTRATION",
    "data": "Fj3R38A-fxvHHpVSa9BRTe-DeTKj_xZsNYXQixZR3jMdijtm8Q7lIT3E1x8_xC7trAOTqilzLjLfirE3Wjfor5b",
    "referenceId": "REF01",
    "salt": null,
    "timeStamp": "2018-12-10T06:12:52.994Z"
  } 
}
```

### Responses

#### Success Response

##### Description: decrypt encryted data along with symmetric key having splitter
```
{
  "id": "string",
  "version": "string",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": null,
 "response": {
 		"data": "string"
             }
}	
```
**Response Code : 200 (OK)**

#### Error Response
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

### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-CRY-001 | No Such algorithm is supported | No Such algorithm is supported
KER-CRY-002 | public key is invalid | public key is invalid
KER-CRY-003 | data sent to decrypt is without key splitter or invalid | invalid data without key breaker
KER-CRY-003 | or not base64 encoded | Invalid data
KER-CRY-004 | should not be null or empty | Invalid request
KER-CRY-005 | cannot connect to keymanager service | cannot connect to key manager service
KER-CRY-006 | Keymanager Service has replied with following error | keymanager service error
KER-CRY-008 | Error occur while parsing error from response | Response Parse Error
KER-CRY-007 | timestamp should be in ISO 8601 format yyyy-MM-ddTHH::mm:ss.SZ | DateTime Parse Exception
KER-CRY-500 | Internal server error | Internal server error

# License Key Manager (Private)
MISPs call the IDA to authenticate the Individuals. There can be various service calls such as Demographic, biometric based authentications. Each service calls have the permission associated. When a service call comes to the IDA, a request is sent to the Kernel module to retrieve the permissions for the License Key.

This service facilitates generation of license key, mapping the license key to several permissions, and fetch permissions mapped to a license key.

**License Key Generation**

This component generates a license key for a specified MISP ID.

* [POST /license/generate](#post-license-generate)
* [POST /license/permission](#post-license-permission)
* [GET /license/permission](#get-license-permission)
* [PUT /license/status](#put-license-status)

## POST /license/generate

### Resource URL
`https://mosip.io/v1/licensekeymanager/license/generate `

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
licenseExpiryTime|Yes|The time at which the license will expire| |2019-03-07T10:00:00.000Z 
MISPId|Yes|The MISP ID against which the license key generated will be mapped| |9837

### Request
```JSON
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

### Responses

#### Success Response

##### Description: license key generated successfully
```JSON
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

## POST /license/permission
This component maps various permissions provided to a specified license key.

### Resource URL
`https://mosip.io/v1/licensekeymanager/license/permission `

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
licenseKey|Yes|The license key to which the permissions will be mapped| |gR7Mw7tA7S7qifkf 
MISPId|Yes|The MISP ID against which the license key is mapped| |9837
permissions|Yes|The list of permissions that will be mapped to the MISP-licensekey mentioned.| |OTP Trigger

### Request
```JSON
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

### Responses

#### Success Response

##### Description: license key permission updated successfully
```JSON
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

## GET /license/permission
This component fetches various permission mapped to a license key.

### Resource URL
`https://mosip.io/v1/licensekeymanager/license/permission `

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
licenseKey|Yes|The license key for which the permissions need to be fetched| |gR7Mw7tA7S7qifkf 
MISPId|Yes|The MISP ID against which the license key is mapped| |9837

### Request
`https://mosip.io/v1/licensekeymanager/license/permission?licenseKey=gR7Mw7tA7S7qifkf&MISPId=9837`

### Responses

#### Success Response

##### Description: license key permissions fetched successfully
```JSON
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

## PUT /license/status
This service moves the status of the license key to SUSPENDED status.

### Resource URL
`https://mosip.io/v1/licensekeymanager/license/status `

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
licenseKey|Yes|The license key for which the permissions need to be fetched| |gR7Mw7tA7S7qifkf 
status|Yes|The status of the license key. It is an enumeration {ACTIVE, SUSPENDED, BLOCKED}| |ACTIVE

### Request
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
### Responses

#### Success Response

##### Description: license key suspended successfully
```JSON
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
#### Failure Response

##### Description: Invalid license key
```JSON
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

### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-LKM-001 |	TSP entered is null or empty	|   Illegal TSP
KER-LKM-002 | The length of license key generated was not of the specified length | Invalid generated license key
KER-LKM-003 | Permission value entered is not accepted | Not acceptable permission
KER-LKM-004 | LicenseKey Not Found. | LicenseKey Not Found
KER-LKM-005 | LicenseKey Expired. | LicenseKey Expired
KER-LKM-006 | License Key entered is null or empty. | Illegal license key
KER-LKM-007 | Permission entered is an empty string. | Illegal Permission
KER-LKM-008 | Expiry DateTime should be ahead of current DateTime. | Date expired
KER-LKM-009 | No Permissions has been mapped to the entered TSP-LicenseKey Pair. | No Permissions mapped


# Crypto Signature Service (Private)
* [POST v1/signature/sign](#post-v-1-signature-sign)
* [POST v1/signature/validate](#post-v-1-signature-validate)

## POST v1/signature/sign
This service will sign  provided plain string data.  

### Resource URL
`https://mosip.io/v1/signature/sign`


### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes


### Request
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

### Responses

#### Success Response
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

## POST v1/signature/validate
This service will decrypt encryted data along with symmetric key having splitter for given timestamp(encryption timestamp). 

### Resource URL
`https://mosip.io/v1/signature/validate`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request
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

### Responses

#### Success Response

##### Description: decrypt encryted data along with symmetric key having splitter
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

#### Error Response
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

### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-CSS-999 | Invalid request input | While passing Invalid input request
KER-CSS-101 | Validation Unsuccessful| While sign response in not valid
KER-CSS-102 | Internal server error  | Internal server error


# SMS Notification (Private)
* [POST /sms/send](#post-sms-send)

## POST /sms/send
This service will send request to SMS gateway. 

### Resource URL
`https://mosip.io/v1/smsnotifier/sms/send`

### Resource details
Resource Details | Description
------------ | -------------
Request format | JSON
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
message |Yes|Message in the SMS| | This is the sample SMS message
number |Yes|Mobile number to which the SMS have to be sent| | 743764398

### Request
```JSON
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

### Responses

#### Success Response

##### Description: sms send successfully
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

#### Error Response
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

### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-NOS-001 |	Number and message can't be empty, null	|   SMS Illegal Input
KER-NOS-002 | Contact number cannot contains alphabet,special character or less than or more than | SMS Invalid Contact Number
KER-NOS-500 | Internal server error | Internal server error

# Email Notification (Private)
* [POST /email/send](#post-email-send)

## POST /email/send
This service will send request to Email/SMTP Service. 

### Resource URL
`https://dev.mosip.io/v1/emailnotifier/email/send `

### Resource details
Resource Details | Description
------------ | -------------
Request format | Form Data
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
mailTo |Yes|Mail ID of the recepient| |```mosip@gmail.com```
mailCc |No|Mail ID of the recepient| |```mosip@gmail.com```
mailSubject |Yes|Mail ID of the recepient| | Sample mail subject
mailContent |No|Mail ID of the recepient| | Sample mail content
attachments |No|Mail ID of the recepient| | multipart/formdata

### Request
```
-H "Content-Type: multipart/form-data" 
-F "attachments={}" 
-F "mailCc=user1@gmail.com" 
-F "mailContent=OTP for Auth" 
-F "mailSubject=OTP" 
-F "mailTo=admin1@gmail.com"
```

### Responses

#### Success Response

##### Description: sms send successfully
```JSON
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

#### Error Response
```JSON
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

### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-NOE-001 | To must be valid. It can't be empty or null. | Receiver Address not found
KER-NOE-002 | Subject must be valid. It can't be empty or null. | Subject not found
KER-NOE-003 | Content must be valid. It can't be empty or null. | Content not found
KER-NOE-004 | | Mail Send Exception Code
KER-NOE-005 | | Mail Authentication Exception Code
KER-NOE-006 | | Mail Exception Code
KER-NOE-999 | Data not valid | Request Data not valid
KER-NOE-500 |  | Internal Server Error


# UIN  (External)
* [GET /uin](#uin-get)
* [PUT /uin](#put-uin)

## GET /uin
This service will return unused UIN from UIN pool 

### Resource URL
`https://mosip.io/v1/uingenerator/uin `
 
### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-

### Request
N/A

### Responses

#### Success Response

##### Description: uin generated successfully
```JSON
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

## PUT /uin
This service will update the issued UN status to Assigned or Unassigned(Unused).  

### Resource URL
`https://mosip.io/v1/uingenerator/uin`
 
### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-

### Request
```JSON
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

### Responses

#### Success Response

##### Description: uin status updated successfully
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

#### Error Response
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

### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-UIG-001 | UIN could not be found | UIN could not be found
KER-UIG-003 | Given UIN status not found | UIN Status not found
KER-UIG-004 | Given UIN is not in ISSUED status | UIN Not Issued
KER-UIG-005 | Internal Server Error | Internal Server Error
KER-UIG-006 | Error in retrieving from config server | Config Server Fetch failed

# RID generator (Private)
* [GET /v1/ridgenerator/generate/rid/{centerid}/{machineid}](#get-v-1-ridgenerator-generate-rid-centerid-machineid)

## GET /v1/ridgenerator/generate/rid/{centerid}/{machineid}
This service returns a RID for the requested CenterID and MachineID. 

### Resource URL
`https://mosip.io/v1//generate/rid/{centerid}/{machineid}/`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
centerid|Yes|Centerid of registration| -NA- |10002
machineid|Yes|Machineid of registration| -NA- |10032

### Request
```JSON
-NA-
```
### Responses

#### Success Response
```JSON
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

#### Error Response
```JSON
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

### Failure details
Error Code | Error Message | Error Description
------------|----------|-------------
KER-RIG-002 | Empty input entered | Empty Input Error Code
KER-RIG-003 | Input length is not valid | Input length error code
KER-RIG-004 | Timestamp length should be greater than zero | Invalid CenterID or MachineID Timestamp Length
KER-RIG-005 | Error occured while fetching rid | RID Fetch Exception
KER-RIG-006 | Error occured while storing rid | RID Update Exception
KER-RIG-007 | Sequence length should be greater than zero | Invalid SEQ_Length Exception
KER-RIG-999 | | HTTP Message Not Readable
KER-RIG-500 | | Runtime Exception


# Static Token generator (Private)
* [GET tokenidgenerator/{uin}/{partnercode}](#get-tokenidgenerator-uin-partnercode)

## GET tokenidgenerator/{uin}/{partnercode}

This service returns a static token for the requested UIN and Partner ID. It will return the same Static Token for every call made with the same UIN and Partner ID. 

### Resource URL
`https://mosip.io/v1/tokenidgenerator/{uin}/{partnercode}/`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
UIN|Yes|UIN of the individual.| -NA- |2345346532564566
partnercode|Yes|ID of the partner.| -NA- |9373

### Request
```JSON
-NA-
```
### Responses

#### Success Response

##### Description: token id generated successfully
```JSON
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

#### Failure Response

##### Description: Invalid parameters
```JSON
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

### Failure details
Error Code | Error Message | Error Description
------------|----------|-------------
KER-UIG-005 | Internal Server Error | Internal Server Error
KER-TIG-010 | UIN and partner code cannot be empty | Empty UIN or PARTNERCODE Exception
KER-RIG-500 | | Runtime Exception

# Audit Manager (Private)
Audits are events/transactions which need to be captured and stored to facilitate auditing. This data could further be used for reporting by the business.

This includes auditing various event types like System events (Periodic scans), Business events/transactions (Change in demo data), Security Events etc.

The Audit Manager component will receive a request to audit and store data, validate the request is from an authorized source, securely store the requested data and respond back with an acknowledgement of storage (Success/Failure). This component will also ensure non-auditable data is not stored.

It will also ensure audit data stored is archived based on the defined archival policy.

* [POST /audits](#post-audits)

## POST /audits

### Resource URL
`https://mosip.io/v1/auditmanager/audits`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
eventId|Yes|ID of the event| | 
eventName|Yes|Name of the event| | Periodic Scan
eventType|Yes|Type of the event| | System Event
actionTimeStamp|Yes|Timestamp of the event| | 2018-10-04T05:57:20.929Z
hostName|Yes|Hostname| | Hostname
hostIp|Yes|IP of the host| | 2018-10-04T05:57:20.929Z
applicationId|Yes|ID of the Application| | 1
applicationName|Yes|Name of the event| | Registration
sessionUserId|Yes|Session User Id| | 
sessionUserName|Yes|Session User name| | 
id|Yes|ID| | 15426388761562
idType|Yes|ID Type| | Unique Id
createdBy|Yes|Actor of the event| | 
moduleName|No|Name of the module| | Schedulor
moduleId|No|ID of the module| | SCHE93
description|No|Description of the event| |Example description 

### Request
```JSON
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

### Responses

#### Success Response

##### Description: audit request completed successfully
```JSON
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

#### Error Response
```JSON
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

### Failure details
Error Code | Error Message | Error Description
------------|----------|-------------
KER-AUD-001 | Invalid Audit Request. Required parameters must be present | Handler Exception
KER-AUD-002 | Invalid Audit Request. Format is incorrect. | Invalid Format
KER-AUD-500 | Internal server error | Internal server error

# Sync data (Public)
* [GET /masterdata](#get-masterdata)
* [GET /masterdata/{registrationcenterid}](#get-masterdata-registrationcenterid)
* [GET /configs](#get-configs)
* [GET /roles](#get-roles)
* [GET /userdetails/{registrationcenterid}](#get-userdetails-registrationcenterid)
* [GET /publickey](#get-publickey)
* [POST /tpm/publickey](#post-tpm-publickey)
* [POST /tpm/publickey/verify](#post-tpm-publickey)
* [GET /clientsettings](#get-clientsettings)
* [GET /clientsettings/{regcenterid}](#get-clientsettings-regcenterid)

## GET /masterdata
This service will provides the list of all master data. This service is used mainly by the Enrolment client module. 

### Resource URL
`https://mosip.io/v1/syncdata/masterdata`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
macaddress|No|MAC address of the machine| | 
serialnumber|No|serial number of the machine| | 
lastUpdated|No|Date in UTC ISO format| | 
keyindex|Yes|Thumbprint of the public key corresponding to this machine| | 

### Request
`https://mosip.io/v1/syncdata/masterdata?macaddress=e1:01:2b:c2:1d:b0&serialnumber=NM5328114630&keyindex=ys6823u22 `

### Responses

#### Success Response

##### Description: latest masterdata for the provided machine.
```JSON
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
    "lastSyncTime": "2019-03-04T12:34:15.477Z",
	"registrationCenter": [
	  {
		"id": "10007",
        "name": "Center Sidi Taibi",
        "centerTypeCode": "REG",
        "addressLine1": "Rabat Road",
        "addressLine2": "Sidi Taibi",
        "addressLine3": "Morroco",
        "latitude": "34.192861",
        "longitude": "-6.683662",
        "locationCode": "14025",
        "holidayLocationCode": "KTA",
        "contactPhone": "811552880",
		"numberOfStations": null,
		"workingHours": "8:00:00",
		"numberOfKiosks": 1,
		"perKioskProcessTime": "00:15:00",
		"centerStartTime": "09:00:00",
		"centerEndTime": "17:00:00",
		"timeZone": "(GTM+01:00) CENTRAL EUROPEAN TIME",
		"contactPerson": "Monty Carlo",
		"lunchStartTime": "13:00:00",
		"lunchEndTime": "14:00:00",
		"isDeleted": null,
		"langCode": "eng",
        "isActive": true  
      }
    ],
    "registrationCenterTypes": [
      {
        "isDeleted": null,
        "langCode": "fra",
        "isActive": true,
        "code": "REG",
        "name": "Ordinaire",
        "descr": "Centre dinscription rÃ©guliÃ¨re"
      }
    ],
    "machineDetails": [
	  {
		"id": "10007",
		"name": "Machine 7",
		"serialNum": "LK8186452621",
		"macAddress": "6d:a6:30:56:66:9f",
		"ipAddress": "192.168.0.227",
		"machineSpecId": "1001",
		"validityDateTime": null,
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
    ],
    "machineSpecification": [
	  {
	    "id": "1001",
	    "name": "Ø³ØªØ± Â ",
	    "brand": "Ø¯Ù„Ù‘ Â ",
	    "model": "3568",
	    "machineTypeCode": "DKS",
	    "minDriverversion": "1.454",
	    "description": "Ù„Ø£Ø®Ø° Ø§Ù„ØªØ³Ø¬ÙŠÙ„Ø§Øª",
	    "isDeleted": null,
	    "langCode": "ara",
	    "isActive": true
	  }
    ],
	"machineType": [
	  {
		"code": "DKS",
		"name": "Ø§Ù„Ø­Ø§Ø³ÙˆØ¨",
		"description": "Ø£Ø¬Ù‡Ø²Ø© Ø§Ù„ÙƒÙ…Ø¨ÙŠÙˆØªØ± Ø§Ù„Ù…ÙƒØªØ¨ÙŠØ©",
		"isDeleted": null,
		"langCode": "ara",
		"isActive": true
	  }
	],
	"devices": [
	  {
		"id": "3000027",
		"name": "Finger Print Scanner 7",
		"serialNum": "CX8481464983",
		"deviceSpecId": "165",
		"macAddress": "d4:98:44:dd:aa:f1",
		"ipAddress": null,
		"validityDateTime": null,
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"deviceTypes": [
	  {
		"code": "FRS",
		"name": "Finger Print Scanner",
		"description": "For scanning fingerprints",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"deviceSpecifications": [
	  {
		"id": "165",
		"name": "Fingerprint Scanner",
		"brand": "Safran Morpho",
		"model": "1300 E2",
		"deviceTypeCode": "FRS",
		"minDriverversion": "1.12",
		"description": "To scan fingerprint",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"holidays": [
	  {
		"holidayId": "2000049",
		"holidayDate": "2019-01-01",
		"holidayDay": "2",
		"holidayMonth": "1",
		"holidayYear": "2019",
		"holidayName": "Jour de lâ€™an",
		"locationCode": "KTA",
		"isDeleted": null,
		"langCode": "fra",
		"isActive": true
	  }
	],
	"documentCategories": [
	  {
		"code": "POA",
		"name": "Proof of Address",
		"description": "Address Proof",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"documentTypes": [
	  {
		"code": "CIN",
		"name": "CNIE card",
		"description": "Moroccan National Electronic ID Card",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"validDocumentMapping": [
	  {
		"docTypeCode": "CIN",
		"docCategoryCode": "POI",
		"isDeleted": null,
		  "langCode": "eng",
		  "isActive": true
		}
	  ],
	"templates": [
	  {
		"id": "1101",
		"name": "Template for authorization content",
		"description": "Template for authorization content",
		"fileFormatCode": "txt",
		"model": null,
		"fileText": "Dear $name\nYour Authentication of UIN $uin using $authType on $date at $time Hrs $status at a device deployed by MOSIP Services",
		"moduleId": "10004",
		"moduleName": "ID Authentication",
		"templateTypeCode": "auth-email-content",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"templatesTypes": [
	  {
		"code": "auth-email-content",
		"description": "Template for authorization content",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
      }
	],
	"templateFileFormat": [
	  {
		"code": "txt",
		"description": "Text File",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"reasonCategory": [
	  {
		"code": "MNA",
		"name": "Manual Adjudication",
		"description": "Rejection during Manual Adjudication",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"reasonList": [
      {
		"code": "APM",
		"name": "Age-Photo Mismatch",
		"description": "Mismatch between the Age and Photo",
		"rsnCatCode": "CLR",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"blackListedWords": [
	  {
		"word": "shit",
		"description": "Blacklisted Word",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"locationHierarchy": [
	  {
		"isDeleted": null,
		"langCode": "ara",
		"isActive": true,
		"code": "MOR",
		"name": "Ø§Ù„Ù’Ù€Ù…ÙŽØºÙ’Ø±Ù�Ø¨Ù�",
		"hierarchyLevel": 0,
		"hierarchyName": "Ø¨Ù„Ø¯",
		"parentLocCode": null,
		"createdBy": null,
		"updatedBy": null
	  }
	],
	"biometricattributes": [
	  {
		"code": "LTM",
		"name": "Left Thumb",
		"description": "Print of Left Thumb",
		"biometricTypeCode": "FNR",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"biometricTypes": [
	  {
		"code": "FNR",
		"name": "Fingerprint",
		"description": "Finger prints of the applicant",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"applications": [
	  {
		"code": "app01",
		"name": "application 1",
		"description": "app description",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"applicantValidDocuments": [
	  {
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true,
		"appTypeCode": "001",
		"docTypeCode": "CIN",
		"docCatCode": "POI"
	  }
	],
	"individualTypes": [
	  {
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true,
		"code": "FR",
		"name": "Foreigner"
	  }
	],
	"appDetails": [
	  {
		"id": "10001",
		"name": "Pre-Registration",
		"descr": "Web portal for pre-registrations",
		"langCode": "eng",
		"isDeleted": null,
		"isActive": true
	  }
	],
	"appRolePriorities": [
	  {
		"appId": "10003",
		"processId": "login_auth",
		"roleCode": "SUPERADMIN",
		"priority": 1,
		"langCode": "eng",
		"isDeleted": null,
		"isActive": true
	  }
	],
	"screenAuthorizations": [
	  {
		"screenId": "approveRegistrationRoot",
		"roleCode": "SUPERADMIN",
		"isPermitted": true,
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"processList": [
	  {
		"id": "login_auth",
		"name": "Login authentication",
		"descr": "Login authentication",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"registrationCenterMachines": [
	  {
		"regCenterId": "10007",
		"machineId": "10007",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"registrationCenterDevices": [
	  {
		"regCenterId": "10007",
		"deviceId": "3000027",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"registrationCenterMachineDevices": [
	  {
		"regCenterId": "10007",
		"machineId": "10007",
		"deviceId": "3000027",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"registrationCenterUserMachines": [
	  {
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true,
		"cntrId": "10007",
		"machineId": "10007",
		"usrId": "110007"
	  }
	],
	"registrationCenterUsers": [
	  {
		"regCenterId": "10007",
		"userId": "110007",
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true
	  }
	],
	"registrationCenterMachineHistory": [
	  {
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true,
		"regCenterId": "10007",
		"machineId": "10007",
		"effectivetimes": "2019-02-27T10:50:57.626598"
	  }
	],
	"registrationCenterDeviceHistory": [
	  {
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true,
		"regCenterId": "10007",
		"deviceId": "3000027",
		"effectivetimes": "2019-02-27T10:50:57.589Z"
	  }
	],
	"registrationCenterMachineDeviceHistory": [
	  {
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true,
		"regCenterId": "10007",
		"machineId": "10007",
		"deviceId": "3000027",
		"effectivetimes": "2019-02-27T10:50:57.607964"
	  }
	],
	"registrationCenterUserMachineMappingHistory": [
	  {
		"cntrId": "10007",
		"machineId": "10007",
		"usrId": "110007",
		"effectivetimes": "2019-02-27T10:50:57.660Z"
	  }
	],
	"registrationCenterUserHistory": [
	  {
		"isDeleted": null,
		"langCode": "eng",
		"isActive": true,
		"regCntrId": "10007",
		"userId": "110007",
		"effectDateTimes": "2019-02-27T10:50:57.644336"
	  }
	]
  }
}
```
**Response Code : 200 (OK)**

## GET /masterdata/{registrationcenterid}
This service will provides the list of all master data. This service is used mainly by the Enrollment client module. 

### Resource URL
`https://mosip.io/v1/syncdata/masterdata/10001?macaddress=e1:01:2b:c2:1d:b0&serialnumber=NM5328114630`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
regcenterId|Yes|Registration center id| |
macaddress|No|MAC address of the machine| | 
serialnumber|No|Serial number of the machine| | 
lastUpdated|No|Date in UTC ISO format| | 
keyindex|Yes|Thumbprint of the public key corresponding to this machine| | 

### Request
v1/syncdata/masterdata/10001?macaddress=e1:01:2b:c2:1d:b0&serialnumber=NM5328114630&keyindex=ys6823u22

### Responses

#### Success Response

##### Description: latest masterdata for the provided machine.
```JSON
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
	"lastSyncTime": "2019-03-04T12:34:15.477Z",
	"registrationCenter": [
      {
        "id": "10007",
        "name": "Center Sidi Taibi",
        "centerTypeCode": "REG",
        "addressLine1": "Rabat Road",
        "addressLine2": "Sidi Taibi",
        "addressLine3": "Morroco",
        "latitude": "34.192861",
        "longitude": "-6.683662",
        "locationCode": "14025",
        "holidayLocationCode": "KTA",
        "contactPhone": "811552880",
        "numberOfStations": null,
        "workingHours": "8:00:00",
        "numberOfKiosks": 1,
        "perKioskProcessTime": "00:15:00",
        "centerStartTime": "09:00:00",
        "centerEndTime": "17:00:00",
        "timeZone": "(GTM+01:00) CENTRAL EUROPEAN TIME",
        "contactPerson": "Monty Carlo",
        "lunchStartTime": "13:00:00",
        "lunchEndTime": "14:00:00",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "registrationCenterTypes": [
      {
        "isDeleted": null,
        "langCode": "fra",
        "isActive": true,
        "code": "REG",
        "name": "Ordinaire",
        "descr": "Centre dinscription rÃ©guliÃ¨re"
      }
    ],
    "machineDetails": [
      {
        "id": "10007",
        "name": "Machine 7",
        "serialNum": "LK8186452621",
        "macAddress": "6d:a6:30:56:66:9f",
        "ipAddress": "192.168.0.227",
        "machineSpecId": "1001",
        "validityDateTime": null,
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "machineSpecification": [
      {
        "id": "1001",
        "name": "Ø³ØªØ± Â ",
        "brand": "Ø¯Ù„Ù‘ Â ",
        "model": "3568",
        "machineTypeCode": "DKS",
        "minDriverversion": "1.454",
        "description": "Ù„Ø£Ø®Ø° Ø§Ù„ØªØ³Ø¬ÙŠÙ„Ø§Øª",
        "isDeleted": null,
        "langCode": "ara",
        "isActive": true
      }
    ],
    "machineType": [
      {
        "code": "DKS",
        "name": "Ø§Ù„Ø­Ø§Ø³ÙˆØ¨",
        "description": "Ø£Ø¬Ù‡Ø²Ø© Ø§Ù„ÙƒÙ…Ø¨ÙŠÙˆØªØ± Ø§Ù„Ù…ÙƒØªØ¨ÙŠØ©",
        "isDeleted": null,
        "langCode": "ara",
        "isActive": true
      }
    ],
    "devices": [
      {
        "id": "3000027",
        "name": "Finger Print Scanner 7",
        "serialNum": "CX8481464983",
        "deviceSpecId": "165",
        "macAddress": "d4:98:44:dd:aa:f1",
        "ipAddress": null,
        "validityDateTime": null,
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "deviceTypes": [
      {
        "code": "FRS",
        "name": "Finger Print Scanner",
        "description": "For scanning fingerprints",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "deviceSpecifications": [
      {
        "id": "165",
        "name": "Fingerprint Scanner",
        "brand": "Safran Morpho",
        "model": "1300 E2",
        "deviceTypeCode": "FRS",
        "minDriverversion": "1.12",
        "description": "To scan fingerprint",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "holidays": [
      {
        "holidayId": "2000049",
        "holidayDate": "2019-01-01",
        "holidayDay": "2",
        "holidayMonth": "1",
        "holidayYear": "2019",
        "holidayName": "Jour de lâ€™an",
        "locationCode": "KTA",
        "isDeleted": null,
        "langCode": "fra",
        "isActive": true
      }
    ],
    "documentCategories": [
      {
        "code": "POA",
        "name": "Proof of Address",
        "description": "Address Proof",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "documentTypes": [
      {
        "code": "CIN",
        "name": "CNIE card",
        "description": "Moroccan National Electronic ID Card",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "validDocumentMapping": [
      {
        "docTypeCode": "CIN",
        "docCategoryCode": "POI",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "templates": [
      {
        "id": "1101",
        "name": "Template for authorization content",
        "description": "Template for authorization content",
        "fileFormatCode": "txt",
        "model": null,
        "fileText": "Dear $name\nYour Authentication of UIN $uin using $authType on $date at $time Hrs $status at a device deployed by MOSIP Services",
        "moduleId": "10004",
        "moduleName": "ID Authentication",
        "templateTypeCode": "auth-email-content",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "templatesTypes": [
      {
        "code": "auth-email-content",
        "description": "Template for authorization content",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "templateFileFormat": [
      {
        "code": "txt",
        "description": "Text File",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "reasonCategory": [
      {
        "code": "MNA",
        "name": "Manual Adjudication",
        "description": "Rejection during Manual Adjudication",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "reasonList": [
      {
        "code": "APM",
        "name": "Age-Photo Mismatch",
        "description": "Mismatch between the Age and Photo",
        "rsnCatCode": "CLR",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "blackListedWords": [
      {
        "word": "shit",
        "description": "Blacklisted Word",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "locationHierarchy": [
      {
        "isDeleted": null,
        "langCode": "ara",
        "isActive": true,
        "code": "MOR",
        "name": "Ø§Ù„Ù’Ù€Ù…ÙŽØºÙ’Ø±Ù�Ø¨Ù�",
        "hierarchyLevel": 0,
        "hierarchyName": "Ø¨Ù„Ø¯",
        "parentLocCode": null,
        "createdBy": null,
        "updatedBy": null
      }
    ],
    "biometricattributes": [
      {
        "code": "LTM",
        "name": "Left Thumb",
        "description": "Print of Left Thumb",
        "biometricTypeCode": "FNR",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "biometricTypes": [
      {
        "code": "FNR",
        "name": "Fingerprint",
        "description": "Finger prints of the applicant",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "applications": [
      {
        "code": "app01",
        "name": "application 1",
        "description": "app description",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "applicantValidDocuments": [
      {
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true,
        "appTypeCode": "001",
        "docTypeCode": "CIN",
        "docCatCode": "POI"
      }
    ],
    "individualTypes": [
      {
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true,
        "code": "FR",
        "name": "Foreigner"
      }
    ],
    "appDetails": [
      {
        "id": "10001",
        "name": "Pre-Registration",
        "descr": "Web portal for pre-registrations",
        "langCode": "eng",
        "isDeleted": null,
        "isActive": true
      }
    ],
    "appRolePriorities": [
      {
        "appId": "10003",
        "processId": "login_auth",
        "roleCode": "SUPERADMIN",
        "priority": 1,
        "langCode": "eng",
        "isDeleted": null,
        "isActive": true
      }
    ],
    "screenAuthorizations": [
      {
        "screenId": "approveRegistrationRoot",
        "roleCode": "SUPERADMIN",
        "isPermitted": true,
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "processList": [
      {
        "id": "login_auth",
        "name": "Login authentication",
        "descr": "Login authentication",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "registrationCenterMachines": [
      {
        "regCenterId": "10007",
        "machineId": "10007",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "registrationCenterDevices": [
      {
        "regCenterId": "10007",
        "deviceId": "3000027",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "registrationCenterMachineDevices": [
      {
        "regCenterId": "10007",
        "machineId": "10007",
        "deviceId": "3000027",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "registrationCenterUserMachines": [
      {
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true,
        "cntrId": "10007",
        "machineId": "10007",
        "usrId": "110007"
      }
    ],
    "registrationCenterUsers": [
      {
        "regCenterId": "10007",
        "userId": "110007",
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true
      }
    ],
    "registrationCenterMachineHistory": [
      {
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true,
        "regCenterId": "10007",
        "machineId": "10007",
        "effectivetimes": "2019-02-27T10:50:57.626598"
      }
    ],
    "registrationCenterDeviceHistory": [
      {
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true,
        "regCenterId": "10007",
        "deviceId": "3000027",
        "effectivetimes": "2019-02-27T10:50:57.589Z"
      }
    ],
    "registrationCenterMachineDeviceHistory": [
      {
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true,
        "regCenterId": "10007",
        "machineId": "10007",
        "deviceId": "3000027",
        "effectivetimes": "2019-02-27T10:50:57.607964"
      }
    ],
    "registrationCenterUserMachineMappingHistory": [
      {
        "cntrId": "10007",
        "machineId": "10007",
        "usrId": "110007",
        "effectivetimes": "2019-02-27T10:50:57.660Z"
      }
    ],
    "registrationCenterUserHistory": [
      {
        "isDeleted": null,
        "langCode": "eng",
        "isActive": true,
        "regCntrId": "10007",
        "userId": "110007",
        "effectDateTimes": "2019-02-27T10:50:57.644336"
      }
    ]
  }
}
```
**Response Code : 200 (OK)**

## GET /configs
This service will return back the global and registration configuration data of the MOSIP platform. 

### Resource URL
`https://mosip.io/v1/syncdata/configs`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-

### Request
N/A

### Responses

#### Success Response

##### Description: latest configuration details.
```JSON
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
    "registrationConfiguration": {
	  "keyValidityPeriodPreRegPack": "3",
	  "smsNotificationTemplateRegCorrection": "OTP for your request is $otp",
	  "defaultDOB": "1-Jan",
	  "smsNotificationTemplateOtp": "OTP for your request is $otp",
	  "supervisorVerificationRequiredForExceptions": "true",
	  "keyValidityPeriodRegPack": "3",
	  "irisRetryAttempts": "10",
	  "fingerprintQualityThreshold": "120",
	  "multifactorauthentication": "true",
	  "smsNotificationTemplateUpdateUIN": "OTP for your request is $otp",
	  "supervisorAuthType": "password",
	  "maxDurationRegPermittedWithoutMasterdataSyncInDays": "10",
	  "modeOfNotifyingIndividual": "mobile",
	  "emailNotificationTemplateUpdateUIN": "Hello $user the OTP is $otp",
	  "maxDocSizeInMB": "150",
	  "emailNotificationTemplateOtp": "Hello $user the OTP is $otp",
	  "emailNotificationTemplateRegCorrection": "Hello $user the OTP is $otp",
	  "faceRetry": "12",
	  "noOfFingerprintAuthToOnboardUser": "10",
	  "smsNotificationTemplateLostUIN": "OTP for your request is $otp",
	  "supervisorAuthMode": "IRIS",
	  "operatorRegSubmissionMode": "fingerprint",
	  "officerAuthType": "password",
	  "faceQualityThreshold": "25",
	  "gpsDistanceRadiusInMeters": "3",
	  "automaticSyncFreqServerToClient": "25",
	  "maxDurationWithoutMasterdataSyncInDays": "7",
	  "loginMode": "bootable dongle",
	  "irisQualityThreshold": "25",
	  "retentionPeriodAudit": "3",
	  "fingerprintRetryAttempts": "234",
	  "emailNotificationTemplateNewReg": "Hello $user the OTP is $otp",
	  "passwordExpiryDurationInDays": "3",
	  "emailNotificationTemplateLostUIN": "Hello $user the OTP is $otp",
	  "blockRegistrationIfNotSynced": "10",
	  "noOfIrisAuthToOnboardUser": "10",
	  "smsNotificationTemplateNewReg": "OTP for your request is $otp"
    },
    "globalConfiguration": {
	  "mosip.kernel.email.max-length": "50",
	  "mosip.kernel.email.domain.ext-max-lenght": "7",
	  "mosip.kernel.rid.sequence-length": "5",
	  "mosip.kernel.uin.uin-generation-cron": "0 * * * * *",
	  "mosip.kernel.email.special-char": "!#$%&'*+-/=?^_`{|}~.",
	  "mosip.kernel.prid.sequence-limit": "3",
	  "mosip.kernel.email.domain.ext-min-lenght": "2",
	  "mosip.kernel.machineid.length": "4",
	  "mosip.supported-languages": "eng,ara,fra",
	  "auth.header.name": "Authorization",
	  "mosip.kernel.phone.min-length": "9",
	  "mosip.kernel.virus-scanner.host": "104.211.209.102",
	  "mosip.kernel.email.min-length": "7",
	  "mosip.kernel.uin.length.conjugative-even-digits-limit": "3",
	  "mosip.kernel.rid.machineid-length": "5",
	  "mosip.kernel.prid.repeating-block-limit": "3",
	  "mosip.kernel.vid.length.repeating-block-limit": "2",
	  "mosip.kernel.rid.length": "29",
	  "mosip.kernel.uin.restricted-numbers": "786,666",
	  "mosip.kernel.keygenerator.asymmetric-algorithm-name": "RSA ",
	  "mosip.kernel.email.domain.special-char": "-",
	  "mosip.kernel.vid.length.repeating-limit": "2",
	  "mosip.kernel.uin.length.reverse-digits-limit": "5",
	  "mosip.kernel.vid.not-start-with": "0,1",
	  "mosip.kernel.registrationcenterid.length": "4",
	  "mosip.kernel.phone.special-char": "+ -",
	  "mosip.kernel.uin.uins-to-generate": "200000",
	  "mosip.kernel.vid.length": "16",
	  "mosip.kernel.uin.length.repeating-block-limit": "2",
	  "mosip.kernel.uin.length.sequence-limit": "3",
	  "mosip.kernel.keygenerator.symmetric-algorithm-length": "256",
	  "mosip.kernel.keygenerator.symmetric-algorithm-name": "AES",
	  "mosip.kernel.crypto.symmetric-algorithm-name": "AES",
	  "mosip.kernel.virus-scanner.port": "3310",
	  "mosip.kernel.rid.centerid-length": "5",
	  "mosip.kernel.uin.length.digits-limit": "5",
	  "mosip.kernel.rid.timestamp-length": "14",
	  "mosip.kernel.vid.length.sequence-limit": "3",
	  "mosip.kernel.keygenerator.asymmetric-algorithm-length": "2048",
	  "mosip.kernel.uin.min-unused-threshold": "100000",
	  "auth.role.prefix": "ROLE_",
	  "auth.server.validate.url": "https://integ.mosip.io/authmanager/validate_token",
	  "mosip.kernel.prid.length": "14",
	  "mosip.kernel.syncdata.registration-center-config-file": 
			"registration-${spring.profiles.active}.properties",
	  "mosip.kernel.crypto.asymmetric-algorithm-name": "RSA",
	  "mosip.kernel.uin.length": "12",
	  "mosip.kernel.phone.max-length": "15",
	  "mosip.kernel.prid.repeating-limit": "2",
	  "mosip.kernel.tokenid.length": "36",
	  "mosip.kernel.MISPid.length": "4",
	  "mosip.kernel.syncdata.global-config-file": "application-${spring.profiles.active}.properties",
	  "mosip.kernel.prid.not-start-with": "0,1",
	  "mosip.kernel.tokenid.sequence-limit": "3",
	  "mosip.kernel.uin.length.repeating-limit": "2",
	  "mosip.kernel.data-key-splitter": "#KEY_SPLITTER#"
    }
  }
}
```
**Response Code : 200 (OK)**

## GET /roles
This service will return back the all roles of the applications. 

### Resource URL
`https://mosip.io/v1/syncdata/roles `

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-

### Request
N/A

### Responses

#### Success Response

##### Description: all roles of the application
```JSON
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
    "roles": [
	  {
		"roleId": "REGISTRATION_ADMIN",
		"roleName": "REGISTRATION_ADMIN",
		"roleDescription": "Registration administrator"
	  },
	  {
		"roleId": "MISP",
		"roleName": "MISP",
		"roleDescription": "Trusted Service Provider"
	  }
	] 
  }
}		
```
**Response Code : 200 (OK)**

## GET /userdetails/{registrationcenterid} 
This service will return back the list of users and its role-mapping based on the registration-center-id. 

### Resource URL
`https://mosip.io/v1/syncdata/userdetails/{registrationcenterid} `

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-

### Request
`https://mosip.io/v1/syncdata/userdetails/110011 `

### Responses

#### Success Response

##### Description: list of users and role-mapping 
```JSON
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
    "userDetails": [
	  {
		"userName": "110001",
		"mail": "user@mosip.com",
		"mobile": "987654321",
		"langCode": null,
		"userPassword": "e1NIQTI1Nn05SmN0UmJRb01OR0FOZzhxSzE2U0hsOW5xaGl0Q2VsTjBjME1CQi90RXlrPQ==",
		"name": "user",
		"roles": [
		  "REGISTRATION_ADMIN"
		]
	  }
	]
  }
}	
```
**Response Code : 200 (OK)**

## GET /publickey/{applicationId}
This service will provide the public key for the specific application fetched from key manager. 

### Resource URL
`https://mosip.io/v1/syncdata/publickey/{applicationId}`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description |  Example
-----|----------|-------------|--------
applicationId |Yes|Id of the application| REGISTRATION,IDA
referenceId|No|Id of the Machine/MISP|
timeStamp |Yes|Date-time  in UTC ISO-8601| 2007-12-03T10:15:30Z

### Request
`https://mosip.io/v1/syncdata/publickey/REGISTRATION?timeStamp=2018-12-09T06%3A39%3A03.683Z `

### Responses

#### Success Response

##### Description: public key and current active profile for the specified application
```JSON
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
	"publicKey": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwUAubI0cMDZMlalDYbzZj4G2UrWY0QDtmZQyqU_ER5CA1gbxlHDQIesm1DVyp6kf1sG-RcosKPqKIhe9vKLPx5pzQXinGdl_8e5bkPpg2RLlDoNju1ycohPrCk0VOd4eNU90-SRJZH_62QE1_MG2yIohI7e7cuC93Q9SHMD8jmJ7DX2zTui4zbo-c5g7vFAtzDgxJg0vSPGbap682xkWZNgzRA_ctrnHF_9_JMzP_6Equ8E_g5BaI3jkWnVmDNjDzzseBH9zHpfbx6wNYrzQZy8iqqywbUtbHWtM0ALkH7nLi4atVbL6a-ryFt6Tq7qfGzYhLtWN47t4GxwyOJC99QIDAQAB",
	"issuedAt": "2018-01-01T10:00:00",
	"expiryAt": "2018-12-10T06:12:51.994",
	"profile" : "prod"
  }
}	
```
**Response Code : 200 (OK)**

## POST /tpm/publickey
This service will upload the public key corresponding to a particular machine which are used in the MOSIP platform. This service will be used specifically in the Registration Client machines. 

### Resource URL
`https://mosip.io/v1/syncdata/tpm/publickey`

### Resource details
Resource Details | Description
------------ | -------------
Request format | application/json
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
machineName |Yes|Name of the machine| | MDLGE6273
publickey |Yes|Base 64 encoded Public key of the passed machine| | 

### Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "machineName": "Machine name",
    "publicKey": "Base 64 encoded public key"
  },
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Responses

#### Success Response

##### Description: The public key had been mapped to the machine
```JSON
{
  "id": "mosip.kernel.sync.publickeytomachine",
  "version": "1.0",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "response": {
	"keyIndex": "ThumbprintOfThePublickey"
  }
}
```
**Response Code : 200 (OK)**

#### Error Response
```JSON
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

## POST /tpm/publickey/verify
This service will only verify the public key corresponding to a particular machine which are used in the MOSIP platform. This service will be used specifically in the Registration Client machines. 

### Resource URL
`https://mosip.io/v1/syncdata/tpm/publickey/verify`

### Resource details
Resource Details | Description
------------ | -------------
Request format | application/json
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
machineName |Yes|Name of the machine| | MDLGE6273
publickey |Yes|Base 64 encoded Public key of the passed machine| | 

### Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "machineName": "Machine name",
    "publicKey": "Base 64 encoded public key"
  },
  "requesttime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "version": "string"
}
```

### Responses

#### Success Response

##### Description: Verifies if the public key has been mapped to the machine
```JSON
{
  "id": "mosip.kernel.sync.publickeytomachine",
  "version": "1.0",
  "metadata": {},
  "responsetime": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
  "errors": [
    {
      "errorCode": "string",
      "message": "string"
    }
  ],
  "response": {
	"keyIndex": "ThumbprintOfThePublickey"
  }
}
```
**Response Code : 200 (OK)**

#### Error Response
```JSON
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

## GET /clientsettings

This service will provides the list of all clientsettings. This service is used mainly by the Enrollment client module. 

### Resource URL
`https://mosip.io/v1/syncdata/clientsettings?keyindex=bb:2f:9f:29:2c:8b:fb:44:51:ba:f7:f9:66:9b:f2:f0:5a:2d:7c:2b:24:ac:a7:08:53:35:a0:b7:96:50:f0:24&lastupdated=2018-12-10T11:42:52.994Z`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
lastupdated|No|Date in UTC ISO format| | 
keyindex|Yes|Thumbprint of the public key corresponding to this machine| | 


### Request
`https://mosip.io/v1/syncdata/clientsettings?keyindex=bb:2f:9f:29:2c:8b:fb:44:51:ba:f7:f9:66:9b:f2:f0:5a:2d:7c:2b:24:ac:a7:08:53:35:a0:b7:96:50:f0:24`

### Responses

#### Success Response

##### Description: latest clientsettings for the provided machine.
```JSON
{
  "id": null,
  "version": null,
  "responsetime": "2020-02-26T13:36:16.215Z",
  "metadata": null,
  "response": {
    "lastSyncTime": "2020-02-26T13:36:16.056Z",
    "dataToSync": [
      {
        "entityName": "Application",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "AppAuthenticationMethod",
        "entityType": "structured",
        "data": [
          "{\"appId\":\"10003\",\"processId\":\"eod_auth\",\"roleCode\":\"REGISTRATION_OFFICER\",\"authMethodCode\":\"OTP\",\"methodSequence\":2,\"langCode\":\"eng\",\"isDeleted\":null,\"isActive\":false}"
        ]
      },
      {
        "entityName": "AppDetail",
        "entityType": "structured",
        "data": [
          "{\"id\":\"10009\",\"name\":\"التحكم في الهوية\",\"descr\":\"بوابة الويب لتكوين التطبيقات\",\"langCode\":\"ara\",\"isDeleted\":null,\"isActive\":true}",
          "{\"id\":\"10011\",\"name\":\"بوابة المقيمين\",\"descr\":\"البوابة الإلكترونية لخدمات إنشاء معرف المشاركة\",\"langCode\":\"ara\",\"isDeleted\":null,\"isActive\":true}"
        ]
      },
      {
        "entityName": "AppRolePriority",
        "entityType": "structured",
        "data": [
          "{\"appId\":\"10003\",\"processId\":\"eod_auth\",\"roleCode\":\"REGISTRATION_ADMIN\",\"priority\":1,\"langCode\":\"eng\",\"isDeleted\":null,\"isActive\":true}"
        ]
      },
      {
        "entityName": "Machine",
        "entityType": "structured",
        "data": [
          "{\"id\":\"10030\",\"name\":\"Machine 30\",\"serialNum\":\"FB5962911664\",\"macAddress\":\"70-5A-0F-8C-01-39\",\"ipAddress\":\"192.168.0.356\",\"machineSpecId\":\"1001\",\"validityDateTime\":null,\"keyIndex\":null,\"publicKey\":null,\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "MachineSpecification",
        "entityType": "structured",
        "data": [
          "{\"id\":\"1001\",\"name\":\"Vostro\",\"brand\":\"Dell\",\"model\":\"3568\",\"machineTypeCode\":\"DKS\",\"minDriverversion\":\"1.454\",\"description\":\"To take enrollments\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "MachineType",
        "entityType": "structured",
        "data": [
          "{\"code\":\"DKS\",\"name\":\"Desktop\",\"description\":\"Desktop Computer\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "RegistrationCenterType",
        "entityType": "structured",
        "data": [
          "{\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true,\"code\":\"REG\",\"name\":\"منتظم\",\"descr\":\"مركز التسجيل العادي\"}",
          "{\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true,\"code\":\"REG\",\"name\":\"Regular\",\"descr\":\"Regular Registration Center\"}",
          "{\"isDeleted\":null,\"langCode\":\"fra\",\"isActive\":true,\"code\":\"REG\",\"name\":\"Ordinaire\",\"descr\":\"Centre dinscription régulière\"}"
        ]
      },
      {
        "entityName": "RegistrationCenter",
        "entityType": "structured",
        "data": [
          "{\"id\":\"10001\",\"name\":\"Center A Ben Mansour\",\"centerTypeCode\":\"REG\",\"addressLine1\":\"P4238\",\"addressLine2\":\"Ben Mansour\",\"addressLine3\":\"Morocco\",\"latitude\":\"34.52117\",\"longitude\":\"-6.453275\",\"locationCode\":\"14022\",\"holidayLocationCode\":\"KTA\",\"contactPhone\":\"779517433\",\"numberOfStations\":null,\"workingHours\":\"8:00:00\",\"numberOfKiosks\":3,\"perKioskProcessTime\":[0,15],\"centerStartTime\":[9,0],\"centerEndTime\":[17,0],\"timeZone\":\"(GTM+01:00) CENTRAL EUROPEAN TIME\",\"contactPerson\":\"John Doe\",\"lunchStartTime\":[13,0],\"lunchEndTime\":[14,0],\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "RegistrationCenterMachine",
        "entityType": "structured",
        "data": [
          "{\"regCenterId\":\"10001\",\"machineId\":\"10030\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}",
          "{\"regCenterId\":\"10001\",\"machineId\":\"10001\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}",
          "{\"regCenterId\":\"10001\",\"machineId\":\"10031\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "RegistrationCenterDevice",
        "entityType": "structured",
        "data": [
          "{\"regCenterId\":\"10001\",\"deviceId\":\"3000170\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "RegistrationCenterMachineDevice",
        "entityType": "structured",
        "data": [
          "{\"regCenterId\":\"10001\",\"machineId\":\"10030\",\"deviceId\":\"3000169\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "RegistrationCenterUserMachine",
        "entityType": "structured",
        "data": [
          "{\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true,\"cntrId\":\"10001\",\"machineId\":\"10001\",\"usrId\":\"110001\"}"
        ]
      },
      {
        "entityName": "RegistrationCenterUser",
        "entityType": "structured",
        "data": [
          "{\"regCenterId\":\"10001\",\"userId\":\"110030\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "Device",
        "entityType": "structured",
        "data": [
          "{\"id\":\"3000167\",\"name\":\"Dummy IRIS Scanner 30\",\"serialNum\":\"BS563Q2230815\",\"deviceSpecId\":\"327\",\"macAddress\":\"6D-58-E2-DF-74-34\",\"ipAddress\":null,\"validityDateTime\":[2018,12,10,11,42,52,994000000],\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "DeviceSpecification",
        "entityType": "structured",
        "data": [
          "{\"id\":\"920\",\"name\":\"سِنل فُنتٍ ِنكجت\",\"brand\":\"َنّ\",\"model\":\"TS207\",\"deviceTypeCode\":\"PRT\",\"minDriverversion\":\"1.123\",\"description\":\"لطباعة الوثائق\",\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "DeviceType",
        "entityType": "structured",
        "data": [
          "{\"code\":\"FRS\",\"name\":\"ماسح بصمة الأصبع\",\"description\":\"لمسح بصمات الأصابع\",\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "DeviceTypeDPM",
        "entityType": "structured",
        "data": [
          "{\"code\":\"Finger\",\"name\":\"Finger\",\"descr\":\"Fingerprint Biometric\",\"isDeleted\":null,\"langCode\":null,\"isActive\":true}",
          "{\"code\":\"Face\",\"name\":\"Face\",\"descr\":\"Face Biometric\",\"isDeleted\":null,\"langCode\":null,\"isActive\":true}",
          "{\"code\":\"Iris\",\"name\":\"Iris\",\"descr\":\"Iris Biomertric\",\"isDeleted\":null,\"langCode\":null,\"isActive\":true}"
        ]
      },
      {
        "entityName": "DeviceSubTypeDPM",
        "entityType": "structured",
        "data": [
          "{\"code\":\"SingleIris\",\"dtypeCode\":\"Iris\",\"name\":\"Single\",\"descr\":\"Single\",\"isDeleted\":null,\"langCode\":null,\"isActive\":true}"
        ]
      },
      {
        "entityName": "DeviceProvider",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "DeviceService",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "RegisteredDevice",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "Template",
        "entityType": "structured",
        "data": [
          "{\"id\":\"1173\",\"name\":\"فتح ناجح لأنواع مصادقة البريد الإلكتروني الموضوع\",\"description\":\"فتح ناجح لأنواع مصادقة البريد الإلكتروني الموضوع\",\"fileFormatCode\":\"txt\",\"model\":\"velocity\",\"fileText\":\"تم إلغاء تأمين نوع AUTH بنجاح\",\"moduleId\":\"10006\",\"moduleName\":\"Resident Services\",\"templateTypeCode\":\"RS_UNLOCK_AUTH_SUCCESS_EMAIL_SUB\",\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "TemplateFileFormat",
        "entityType": "structured",
        "data": [
          "{\"code\":\"xml\",\"description\":\"XML File\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "TemplateType",
        "entityType": "structured",
        "data": [
          "{\"code\":\"RS_VIN_GEN_SUCCESS_EMAIL_SUB\",\"description\":\"VID Generation Success Email Subject\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "Holiday",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "BlacklistedWords",
        "entityType": "structured",
        "data": [
          "{\"word\":\"نيغا\",\"description\":\"كلمة القائمة السوداء\",\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "BiometricType",
        "entityType": "structured",
        "data": [
          "{\"code\":\"FNR\",\"name\":\"Fingerprint\",\"description\":\"Finger prints of the applicant\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "BiometricAttribute",
        "entityType": "structured",
        "data": [
          "{\"code\":\"LI\",\"name\":\"Iris gauche\",\"description\":\"Gravure de Iris Gauche\",\"biometricTypeCode\":\"IRS\",\"isDeleted\":null,\"langCode\":\"fra\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "Title",
        "entityType": "structured",
        "data": [
          "{\"code\":\"MRS\",\"titleName\":\"ست\",\"titleDescription\":\"عنوان أنثى\",\"langCode\":\"ara\",\"isDeleted\":null,\"isActive\":true}"
        ]
      },
      {
        "entityName": "Language",
        "entityType": "structured",
        "data": [
          "{\"code\":\"eng\",\"name\":\"English\",\"family\":\"Indo-European\",\"nativeName\":\"English\",\"isDeleted\":null,\"isActive\":true}"
        ]
      },
      {
        "entityName": "Gender",
        "entityType": "structured",
        "data": [
          "{\"code\":\"OTH\",\"genderName\":\"Others\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":false}"
        ]
      },
      {
        "entityName": "IdType",
        "entityType": "structured",
        "data": [
          "{\"code\":\"VID\",\"name\":\"ID virtuel\",\"descr\":\"Identifiant utilisé en remplacement de UIN\",\"isDeleted\":null,\"langCode\":\"fra\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "Location",
        "entityType": "structured",
        "data": [
          "{\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true,\"code\":\"SOUS\",\"name\":\"Souissi\",\"hierarchyLevel\":4,\"hierarchyName\":\"Zone\",\"parentLocCode\":\"RAB\"}"
        ]
      },
      {
        "entityName": "ReasonCategory",
        "entityType": "structured",
        "data": [
          "{\"code\":\"CLR\",\"name\":\"رفض العميل\",\"description\":\"رفض تسجيل العميل\",\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "ReasonList",
        "entityType": "structured",
        "data": [
          "{\"code\":\"ADM\",\"name\":\"يتم مطابقة جميع التفاصيل\",\"description\":\"يتم مطابقة جميع التفاصيل\",\"rsnCatCode\":\"MNA\",\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "IndividualType",
        "entityType": "structured",
        "data": [
          "{\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true,\"code\":\"FR\",\"name\":\"أجنبي\"}",
          "{\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true,\"code\":\"NFR\",\"name\":\"Non-Foreigner\"}"
        ]
      },
      {
        "entityName": "DocumentCategory",
        "entityType": "structured",
        "data": [
          "{\"code\":\"POI\",\"name\":\"إثبات هوية\",\"description\":\"إثبات الهوية\",\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "DocumentType",
        "entityType": "structured",
        "data": [
          "{\"code\":\"DOC018\",\"name\":\"Water bill as long as it is not more than 3 months’ old\",\"description\":\"Water bill as long as it is not more than 3 months’ old\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "ValidDocument",
        "entityType": "structured",
        "data": [
          "{\"docTypeCode\":\"DOC014\",\"docCategoryCode\":\"POA\",\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "ApplicantValidDocument",
        "entityType": "structured",
        "data": [
             "{\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true,\"appTypeCode\":\"003\",\"docTypeCode\":\"CRN\",\"docCatCode\":\"POR\"}"
        ]
      },
      {
        "entityName": "ScreenAuthorization",
        "entityType": "structured",
        "data": [
          "{\"screenId\":\"uploadPacketRoot\",\"roleCode\":\"REGISTRATION_OFFICER\",\"isPermitted\":true,\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "ScreenDetail",
        "entityType": "structured",
        "data": [
          "{\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true,\"id\":\"updateClientSoftwareRoot\",\"appId\":\"10003\",\"name\":\"updateClientSoftwareRoot\",\"descr\":\"updateClientSoftwareRoot\"}"
        ]
      },
      {
        "entityName": "ProcessList",
        "entityType": "structured",
        "data": [
          "{\"id\":\"exception_auth\",\"name\":\"استثناء المصادقة\",\"descr\":\"استثناء المصادقة\",\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "FoundationalTrustProvider",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "RegistrationCenterUserHistory",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "RegistrationCenterUserMachineHistory",
        "entityType": "structured",
        "data": [
          "{\"cntrId\":\"10001\",\"machineId\":\"10031\",\"usrId\":\"110031\",\"effectivetimes\":\"2018-12-10T11:42:52.994Z\"}",
          "{\"cntrId\":\"10001\",\"machineId\":\"10001\",\"usrId\":\"110001\",\"effectivetimes\":\"2018-12-10T11:42:52.994Z\"}"
        ]
      },
      {
        "entityName": "RegistrationCenterMachineDeviceHistory",
        "entityType": "structured",
        "data": [
          "{\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true,\"regCenterId\":\"10001\",\"machineId\":\"10001\",\"deviceId\":\"3000101\",\"effectivetimes\":[2018,12,10,11,42,52,994000000]}"
        ]
      },
      {
        "entityName": "RegistrationCenterDeviceHistory",
        "entityType": "structured",
        "data": [
          "{\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true,\"regCenterId\":\"10001\",\"deviceId\":\"3000170\",\"effectivetimes\":\"2018-12-10T11:42:52.994Z\"}"
        ]
      },
      {
        "entityName": "RegistrationCenterMachineHistory",
        "entityType": "structured",
        "data": [
          "{\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true,\"regCenterId\":\"10001\",\"machineId\":\"10001\",\"effectivetimes\":[2018,12,10,11,42,52,994000000]}"
        ]
      },
      {
        "entityName": "SyncJobDef",
        "entityType": "structured",
        "data": []
      }
    ]
  },
  "errors": null
}
```
**Response Code : 200 (OK)**

## GET /clientsettings/{regcenterid}
This service will provides the list of all master data. This service is used mainly by the Enrollment client module. 

### Resource URL
`https://mosip.io/v1/syncdata/clientsettings/10001?keyindex=bb:2f:9f:29:2c:8b:fb:44:51:ba:f7:f9:66:9b:f2:f0:5a:2d:7c:2b:24:ac:a7:08:53:35:a0:b7:96:50:f0:24&lastupdated=2018-12-10T11:42:52.994Z`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
regcenterid|Yes|Registration center id| |
lastupdated|No|Date in UTC ISO format| | 
keyindex|Yes|Thumbprint of the public key corresponding to this machine| | 

### Request
`v1/syncdata/clientsettings/10001?keyindex=bb:2f:9f:29:2c:8b:fb:44:51:ba:f7:f9:66:9b:f2:f0:5a:2d:7c:2b:24:ac:a7:08:53:35:a0:b7:96:50:f0:24`

### Responses

#### Success Response

##### Description: latest masterdata for the provided machine.
```JSON
{
  "id": null,
  "version": null,
  "responsetime": "2020-02-26T13:36:16.215Z",
  "metadata": null,
  "response": {
    "lastSyncTime": "2020-02-26T13:36:16.056Z",
    "dataToSync": [
      {
        "entityName": "Application",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "AppAuthenticationMethod",
        "entityType": "structured",
        "data": [
          "{\"appId\":\"10003\",\"processId\":\"eod_auth\",\"roleCode\":\"REGISTRATION_OFFICER\",\"authMethodCode\":\"OTP\",\"methodSequence\":2,\"langCode\":\"eng\",\"isDeleted\":null,\"isActive\":false}"
        ]
      },
      {
        "entityName": "AppDetail",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "AppRolePriority",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "Machine",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "MachineSpecification",
        "entityType": "structured",
        "data": [
          "{\"id\":\"1001\",\"name\":\"Vostro\",\"brand\":\"Dell\",\"model\":\"3568\",\"machineTypeCode\":\"DKS\",\"minDriverversion\":\"1.454\",\"description\":\"To take enrollments\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "MachineType",
        "entityType": "structured",
        "data": [
          "{\"code\":\"DKS\",\"name\":\"Desktop\",\"description\":\"Desktop Computer\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "RegistrationCenterType",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "RegistrationCenter",
        "entityType": "structured",
        "data": [
          "{\"id\":\"10001\",\"name\":\"Center A Ben Mansour\",\"centerTypeCode\":\"REG\",\"addressLine1\":\"P4238\",\"addressLine2\":\"Ben Mansour\",\"addressLine3\":\"Morocco\",\"latitude\":\"34.52117\",\"longitude\":\"-6.453275\",\"locationCode\":\"14022\",\"holidayLocationCode\":\"KTA\",\"contactPhone\":\"779517433\",\"numberOfStations\":null,\"workingHours\":\"8:00:00\",\"numberOfKiosks\":3,\"perKioskProcessTime\":[0,15],\"centerStartTime\":[9,0],\"centerEndTime\":[17,0],\"timeZone\":\"(GTM+01:00) CENTRAL EUROPEAN TIME\",\"contactPerson\":\"John Doe\",\"lunchStartTime\":[13,0],\"lunchEndTime\":[14,0],\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "RegistrationCenterMachine",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "RegistrationCenterDevice",
        "entityType": "structured",
        "data": [
          "{\"regCenterId\":\"10001\",\"deviceId\":\"3000170\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "RegistrationCenterMachineDevice",
        "entityType": "structured",
        "data": [
          "{\"regCenterId\":\"10001\",\"machineId\":\"10030\",\"deviceId\":\"3000169\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "RegistrationCenterUserMachine",
        "entityType": "structured",
        "data": [
          "{\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true,\"cntrId\":\"10001\",\"machineId\":\"10001\",\"usrId\":\"110001\"}"
        ]
      },
      {
        "entityName": "RegistrationCenterUser",
        "entityType": "structured",
        "data": [
          "{\"regCenterId\":\"10001\",\"userId\":\"110030\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "Device",
        "entityType": "structured",
        "data": [
          "{\"id\":\"3000167\",\"name\":\"Dummy IRIS Scanner 30\",\"serialNum\":\"BS563Q2230815\",\"deviceSpecId\":\"327\",\"macAddress\":\"6D-58-E2-DF-74-34\",\"ipAddress\":null,\"validityDateTime\":[2018,12,10,11,42,52,994000000],\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "DeviceSpecification",
        "entityType": "structured",
        "data": [
          "{\"id\":\"920\",\"name\":\"سِنل فُنتٍ ِنكجت\",\"brand\":\"َنّ\",\"model\":\"TS207\",\"deviceTypeCode\":\"PRT\",\"minDriverversion\":\"1.123\",\"description\":\"لطباعة الوثائق\",\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "DeviceType",
        "entityType": "structured",
        "data": [
          "{\"code\":\"FRS\",\"name\":\"ماسح بصمة الأصبع\",\"description\":\"لمسح بصمات الأصابع\",\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "DeviceTypeDPM",
        "entityType": "structured",
        "data": [
          "{\"code\":\"Finger\",\"name\":\"Finger\",\"descr\":\"Fingerprint Biometric\",\"isDeleted\":null,\"langCode\":null,\"isActive\":true}",
          "{\"code\":\"Face\",\"name\":\"Face\",\"descr\":\"Face Biometric\",\"isDeleted\":null,\"langCode\":null,\"isActive\":true}",
          "{\"code\":\"Iris\",\"name\":\"Iris\",\"descr\":\"Iris Biomertric\",\"isDeleted\":null,\"langCode\":null,\"isActive\":true}"
        ]
      },
      {
        "entityName": "DeviceSubTypeDPM",
        "entityType": "structured",
        "data": [
          "{\"code\":\"SingleIris\",\"dtypeCode\":\"Iris\",\"name\":\"Single\",\"descr\":\"Single\",\"isDeleted\":null,\"langCode\":null,\"isActive\":true}"
        ]
      },
      {
        "entityName": "DeviceProvider",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "DeviceService",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "RegisteredDevice",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "Template",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "TemplateFileFormat",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "TemplateType",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "Holiday",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "BlacklistedWords",
        "entityType": "structured",
        "data": [
          "{\"word\":\"نيغا\",\"description\":\"كلمة القائمة السوداء\",\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "BiometricType",
        "entityType": "structured",
        "data": [
          "{\"code\":\"FNR\",\"name\":\"Fingerprint\",\"description\":\"Finger prints of the applicant\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "BiometricAttribute",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "Title",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "Language",
        "entityType": "structured",
        "data": [
          "{\"code\":\"eng\",\"name\":\"English\",\"family\":\"Indo-European\",\"nativeName\":\"English\",\"isDeleted\":null,\"isActive\":true}"
        ]
      },
      {
        "entityName": "Gender",
        "entityType": "structured",
        "data": [
          "{\"code\":\"OTH\",\"genderName\":\"Others\",\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":false}"
        ]
      },
      {
        "entityName": "IdType",
        "entityType": "structured",
        "data": [
          "{\"code\":\"VID\",\"name\":\"ID virtuel\",\"descr\":\"Identifiant utilisé en remplacement de UIN\",\"isDeleted\":null,\"langCode\":\"fra\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "Location",
        "entityType": "structured",
        "data": [
          "{\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true,\"code\":\"SOUS\",\"name\":\"Souissi\",\"hierarchyLevel\":4,\"hierarchyName\":\"Zone\",\"parentLocCode\":\"RAB\"}"
        ]
      },
      {
        "entityName": "ReasonCategory",
        "entityType": "structured",
        "data": [
          "{\"code\":\"CLR\",\"name\":\"رفض العميل\",\"description\":\"رفض تسجيل العميل\",\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "ReasonList",
        "entityType": "structured",
        "data": [
          "{\"code\":\"ADM\",\"name\":\"يتم مطابقة جميع التفاصيل\",\"description\":\"يتم مطابقة جميع التفاصيل\",\"rsnCatCode\":\"MNA\",\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "IndividualType",
        "entityType": "structured",
        "data": [
          "{\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true,\"code\":\"FR\",\"name\":\"أجنبي\"}",
          "{\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true,\"code\":\"NFR\",\"name\":\"Non-Foreigner\"}"
        ]
      },
      {
        "entityName": "DocumentCategory",
        "entityType": "structured",
        "data": [
          "{\"code\":\"POI\",\"name\":\"إثبات هوية\",\"description\":\"إثبات الهوية\",\"isDeleted\":null,\"langCode\":\"ara\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "DocumentType",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "ValidDocument",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "ApplicantValidDocument",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "ScreenAuthorization",
        "entityType": "structured",
        "data": [
          "{\"screenId\":\"uploadPacketRoot\",\"roleCode\":\"REGISTRATION_OFFICER\",\"isPermitted\":true,\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true}"
        ]
      },
      {
        "entityName": "ScreenDetail",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "ProcessList",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "FoundationalTrustProvider",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "RegistrationCenterUserHistory",
        "entityType": "structured",
        "data": []
      },
      {
        "entityName": "RegistrationCenterUserMachineHistory",
        "entityType": "structured",
        "data": [
          "{\"cntrId\":\"10001\",\"machineId\":\"10031\",\"usrId\":\"110031\",\"effectivetimes\":\"2018-12-10T11:42:52.994Z\"}",
          "{\"cntrId\":\"10001\",\"machineId\":\"10001\",\"usrId\":\"110001\",\"effectivetimes\":\"2018-12-10T11:42:52.994Z\"}"
        ]
      },
      {
        "entityName": "RegistrationCenterMachineDeviceHistory",
        "entityType": "structured",
        "data": [
          "{\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true,\"regCenterId\":\"10001\",\"machineId\":\"10001\",\"deviceId\":\"3000101\",\"effectivetimes\":[2018,12,10,11,42,52,994000000]}"
        ]
      },
      {
        "entityName": "RegistrationCenterDeviceHistory",
        "entityType": "structured",
        "data": [
          "{\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true,\"regCenterId\":\"10001\",\"deviceId\":\"3000170\",\"effectivetimes\":\"2018-12-10T11:42:52.994Z\"}"
        ]
      },
      {
        "entityName": "RegistrationCenterMachineHistory",
        "entityType": "structured",
        "data": [
          "{\"isDeleted\":null,\"langCode\":\"eng\",\"isActive\":true,\"regCenterId\":\"10001\",\"machineId\":\"10001\",\"effectivetimes\":[2018,12,10,11,42,52,994000000]}"
        ]
      },
      {
        "entityName": "SyncJobDef",
        "entityType": "structured",
        "data": []
      }
    ]
  },
  "errors": null
}
```
**Response Code : 200 (OK)**

#### Failure details
Error Code | Error Message | Error Description
------------|----------|-------------
KER-SNC-100 | Error occurred while parsing lastUpdated timesatamp | last updated parse exception
KER-SNC-101 | Error occurred while fetching Applications | application fetch exception
KER-SNC-102 | Error occurred while fetching Machine Details | machine detail  fetch  exception
KER-SNC-103 | Error occurred while fetching Machine Registration Center | machine reg center fetch exception
KER-SNC-104 | Error occurred while fetching Registration Center | reg  center  fetch  exception
KER-SNC-105 | Error occurred while fetching Registration Center Type | reg  center  type  fetch  exception
KER-SNC-106 | Error occurred while fetching Templates | template  fetch  exception
KER-SNC-107 | Error occurred while fetching Template Types | template  type  fetch  exception
KER-SNC-108 | Error occurred while fetching Reason Category | reason  category  fetch  exception
KER-SNC-109 | Error occurred while fetching Holidays | holiday  fetch  exception
KER-SNC-110 | Error occurred while fetching Blacklisted Words | blacklisted  words  fetch  exception
KER-SNC-111 | Error occurred while fetching Biometric types | biometric type  fetch  exception
KER-SNC-112 | Error occurred while fetching Biometric Attribute types | biometric attr type fetch exception
KER-SNC-113 | Error occurred while fetching Titles | title  fetch  exception
KER-SNC-114 | Error occurred while fetching Languages | language  fetch  exception
KER-SNC-115 | Error occurred while fetching Genders | gender  fetch  exception
KER-SNC-116 | Error occurred while fetching Registration Center Devices | registartion  center  devices  fetch  exception
KER-SNC-117 | Error occurred while fetching Devices | devices  fetch  exception
KER-SNC-118 | Error occurred while fetching Document Category | document  category  fetch  exception
KER-SNC-119 | Error occurred while fetching Document Types | document  type  fetch  exception
KER-SNC-120 | Error occurred while fetching Id Type | id  type  fetch  exception
KER-SNC-121 | Error occurred while fetching Device Specification | device  specification  fetch  exception
KER-SNC-122 | Error occurred while fetching Machine Specification | machine  specification  fetch  exception
KER-SNC-123 | Error occurred while fetching Machine Type | machine  type  fetch  exception
KER-SNC-124 | Error occurred while fetching Location | location  fetch  exception
KER-SNC-125 | Error occurred while fetching Device Type | device  type  fetch  exception
KER-SNC-126 | Error occurred while fetching Valid Document Type | valid  document  fetch  exception
KER-SNC-127 | Error occurred while fetching Valid Document Type | reason  list  fetch  exception
KER-SNC-128 | Error occurred while fetching data | thread  interrupted  while  fetch  exception
KER-SNC-999 | Request Data not valid | Request Data Not Valid
KER-SNC-129 | Error occurred while fetching Registration Center Machine | REG  CENTER  MACHINE Fetch Exception
KER-SNC-130 | Error occurred while fetching Registration Center Device | REG  CENTER  DEVICE Fetch Exception
KER-SNC-131 | Error occurred while fetching Registration Center Machine Device | REG  CENTER  MACHINE  DEVICE Fetch Exception
KER-SNC-132 | Error occurred while fetching Registration Center Machine Device | REG  CENTER  USER  MACHINE  DEVICE Fetch Exception
KER-SNC-133 | Error occurred while fetching Registration Center User | REG  CENTER  USER Fetch Exception
KER-SNC-134 | Machine id not found | MACHINE  ID  Not found Exception
KER-SNC-500 | Internal server error | Internal server error
KER-SNC-135 | Timestamp cannot be future date | Invalid Timestamp
KER-SNC-136 | Error occurred while fetching Registration Center User History | REG  CENTER  USER  HISTORY Fetch Exception
KER-SNC-137 | Error occurred while fetching Registration Center Machine User History | REG  CENTER  MACHINE  USER  HISTORY Fetch Exception
KER-SNC-138 | Error occurred while fetching Registration Center Device History | REG  CENTER  DEVICE  HISTORY Fetch Exception
KER-SNC-139 | Error occurred while fetching Registration Center Machine History | REG  CENTER  MACHINE  HISTORY Fetch Exception
KER-SNC-140 | Mac-Address and Serial Number cannot be empty | Empty  MAC  OR  SERIAL  Number
KER-SNC-141 | Registration center not found | REGISTRATION  CENTER Not Found
KER-SNC-142 | Error occurred while fetching app authorization methods | APP  AUTHORIZATION  METHOD Fetch Exception
KER-SNC-143 | Error occurred while fetching app details | APP  DETAIL Fetch Exception
KER-SNC-144 | Error occurred while fetching app role priorities | APP  ROLE  PRIORITY Fetch Exception
KER-SNC-145 | Error occurred while fetching processList | PROCESS  LIST Fetch Exception
KER-SNC-146 | Error occurred while fetching screen authorizations | SCREEN  AUTHORIZATION Fetch Exception
KER-SNC-147 | Error occurred while fetching Individual types | Individual types Fetch Exception
KER-SNC-148 | Mac-Address and/or Serial Number does not exist | INVALID  MAC  OR  SERIAL  Number
KER-SNC-149 | Registration Center has been updated for the received Machine ID | REG CENTER  Updated
KER-SNC-150 | Error occured while fetching screen detail | SCREEN  DETAIL Fetch Exception
KER-SNC-151 | Error occurred while fetching ApplicantValidDocument | APPLICANT  VALID  DOCUMENT Fetch Exception
KER-SNC-152 | Error occurred while fetching Registration Center Machine Device History | REG  CENTER  MACHINE  DEVICE  HISTORY Fetch Exception
KER-SNC-153 | Error occured while fetching sync job definitons | SYNC  JOB  DEF Fetch Exception
KER-SNC-154 | Error occured while parsing the response | SYNC  JOB  DEF  Parse Exception


# Applicant type (Public)
These set of services does various operations regarding the applicant type.
* [GET /applicanttype/getApplicantType](#get-applicanttype-getapplicanttype)

## GET /applicanttype/getApplicantType
This service finds the Applicant type for the combination of Individual type code,Gender code ,DOB ,Biometric available and Language code. If there is a combination entry exists for these combinations, the corresponding Applicant Type code is returned. 

### Resource URL
`https://mosip.io/v1/applicanttype/getApplicantType`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
individualTypeCode|Yes|The code of the individual type| -NA- |INDTYP_002
genderCode|Yes|The code of the Gender. | -NA- |ML
dateofbirth|Yes|Date of birth in UTC standard ISO8601 format| -NA- |2008-10-04T05:00:00.000Z
biometricAvailable|No|Is the biometric details available| -NA- |true
languagecode|Yes|Language code in ISO 639-2 standard| -NA- |eng

### Request
```JSON
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

### Responses

#### Success Response

##### Description: applicant type code fetched successfully
```JSON
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

#### Failure Response
```JSON
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

### Failure details
Error Code | Error Message | Error Description
------------|----------|-------------
KER-MSD-147 | Applicant Type data does not exist | No Application Found
KER-MSD-148 | One or more input parameter is invalid or does not exist | Invalid Request


# OTP Manager (Private)
* [OTP Generator](#otp-generator)
* [OTP validator](#otp-validator)

## OTP Generator
This component facilitates generation of OTP for various purposes. EG: Login in Pre-registration

The OTP Generator component will receive a request to generate OTP, validate if the OTP generation request is from an authorized source, call OTP generator API with the input parameters (Key), receive the OTP from the OTP generator API which is generated based on the OTP generation policy and respond to the source with the OTP.

The OTP Generator can also reject a request from a blocked/frozen account and assign a validity to each OTP that is generated, based on the defined policy

### Resource URL
`POST /generate`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
key |Yes|Key| | 9820173642

### Request
`v1/otpmanager/otp/generate`

```JSON
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

### Response

#### Success Response
```JSON
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

#### Failure Response
```JSON
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

## OTP Validator
This component facilitates basic validation of an OTP. 

This includes: Receiving a request for OTP validation with required input parameters (Key), Validating the pattern of OTP generated based on defined policy, validating if the OTP is active/inactive and responding to the source with a response (Valid/Invalid)

This component also facilitates deletion of every successfully validated OTP when consumed and freezing an account for exceeding the number of retries/wrong input of OTP. 

### Resource URL
`GET /validate`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
key |Yes|Key| | 9820173642
otp|Yes|OTP| | 123456

### Request
`v1/otpmanager/validate?key=9820173642&otp=123456`

### Response
```JSON
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

### Failure details
Error Code | Error Message | Error Description
------------|----------|-------------
KER-OTG-001 | Key length should be in the range of 3-64. | Illegal Key Input
KER-OTV-001 | Key can't be empty or null. | Invalid Key Input
KER-OTV-002 | Length of key should be in the range of 3-64. | Illegal Key Input
KER-OTV-003 | OTP can't be empty or null. | Invalid OTP Input
KER-OTV-004 | OTP consists of only numeric characters. No other characters is allowed. | Ileegal OTP Input
KER-OTV-005 | Validation can't be performed against this key. Generate OTP first. | key not found
KER-OTV-500 | Internal server error | Internal server error
KER-OTV-999 | HTTP Message Not Readable Exception | Http Message Not Readable
KER-OTG-002 | Crypto failure | Crypto failure
KER-OTG-003 | Invalid key or algorithm found | Algorithm Failure
KER-OTG-004 | IO exception found | IO Failure
