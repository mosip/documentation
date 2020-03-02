
Security APIs
- [Key Manager Service](#key-manager-private)
- [Crypto Manager Service](#crypto-manager-private)
- [License Key Service](#license-key-manager-private)
- [Crypto Signature Service](#crypto-signature-service-private)

Notification APIs
- [SMS Notification Service](#sms-notification-private)
- [Email Notification Service](#email-notification-private)

ID Generator APIs
- [UIN Service](#uin--external)
- [RID Service](#rid-generator-private)
- [Static Token Service](#static-token-generator-private)

Common APIs
- [Audit Service](#audit-manager-private)
- [Data Sync Service](#sync-data-public)
- [Applicant Types Service](#applicant-type-public)
- [OTP Manager Service](#otp-manager-private)
- [Registration Center APIs](Registration-Center-APIs.md)


# Key Manager (Private)

* [GET /publickey](#get-publickey)
* [POST /decrypt](#post-decrypt)


### GET /publickey

This service will provide the public key for the specific application. 

#### Resource URL
<div>https://mosip.io/v1/keymanager/publickey</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description |  Example
-----|----------|-------------|--------
applicationId |Yes|Id of the application| REGISTRATION,IDA
referenceId|No|Id of the Machine/MISP|
timeStamp |Yes|Date-time  in UTC ISO-8601| 2007-12-03T10:15:30Z

#### Request
<div>https://mosip.io/v1/keymanager/publickey/REGISTRATION?timeStamp=2018-12-09T06%3A39%3A03.683Z </div>

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: public key issued successfully
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

### POST /decrypt

This service will decrypt the encrypted symmetric key 

#### Resource URL
<div>https://mosip.io/v1/keymanager/decrypt </div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description |  Example
-----|----------|-------------|--------
applicationId |Yes|Id of the application| REGISTRATION,IDA
referenceId|No|Id of the Machine/MISP|
timeStamp (encryption timestamp) |Yes|Date-time  in UTC ISO-8601| 2007-12-03T10:15:30Z

#### Request

```
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



#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: decrypt the encrypted symmetric key successfully
```
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

##### Error Response:
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

#### Failure details
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

* [POST v1/cryptomanager/encrypt](#post-v1cryptomanagerencrypt)
* [POST v1/cryptomanager/decrypt](#post-v1cryptomanagerdecrypt)

### POST v1/cryptomanager/encrypt

This service will encrypt provided plain string data with session symmetric key and encrypt symmetric key with application specific public key based on given timestamp(current timestamp of encryption). This will respond combined encrypted data and symmetric key having a key splitter.  

#### Resource URL
<div>https://mosip.io/v1/cryptomanager/encrypt</div>


#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes


#### Request

```
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

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: encrypted data successfully
```
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



### POST v1/cryptomanager/decrypt

This service will decrypt encryted data along with symmetric key having splitter for given timestamp(encryption timestamp). 

#### Resource URL
<div>https://mosip.io/v1/cryptomanager/decrypt</div>


#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes


#### Request

```
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

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: decrypt encryted data along with symmetric key having splitter
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

##### Error Response:
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

#### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-CRY-001 |	No Such algorithm is supported	|   No Such algorithm is supported
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

## License Key Generation

This component generates a license key for a specified MISP ID.

* [POST /license/generate](#post-licensegenerate)

* [POST /license/permission](#post-licensepermission)

* [GET /license/permission](#get-licensepermission)

* [PUT /license/status](#put-licensestatus)

### POST /license/generate

#### Resource URL
<div>https://mosip.io/v1/licensekeymanager/license/generate </div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
licenseExpiryTime|Yes|The time at which the license will expire| |2019-03-07T10:00:00.000Z 
MISPId|Yes|The MISP ID against which the license key generated will be mapped| |9837

#### Request
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
#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: license key generated successfully
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
### POST /license/permission

This component maps various permissions provided to a specified license key.

#### Resource URL
<div>https://mosip.io/v1/licensekeymanager/license/permission </div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
licenseKey|Yes|The license key to which the permissions will be mapped| |gR7Mw7tA7S7qifkf 
MISPId|Yes|The MISP ID against which the license key is mapped| |9837
permissions|Yes|The list of permissions that will be mapped to the MISP-licensekey mentioned.| |OTP Trigger

#### Request
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
#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: license key permission updated successfully
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

### GET /license/permission

This component fetches various permission mapped to a license key.

#### Resource URL
<div>https://mosip.io/v1/licensekeymanager/license/permission </div>

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
<div>https://mosip.io/v1/licensekeymanager/license/permission?licenseKey=gR7Mw7tA7S7qifkf&MISPId=9837</div>

```
N/A
```
#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: license key permissions fetched successfully
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


### PUT /license/status

This service moves the status of the license key to SUSPENDED status.

#### Resource URL
<div>https://mosip.io/v1/licensekeymanager/license/status </div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
licenseKey|Yes|The license key for which the permissions need to be fetched| |gR7Mw7tA7S7qifkf 
status|Yes|The status of the license key. It is an enumeration {ACTIVE, SUSPENDED, BLOCKED}| |ACTIVE

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
#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: license key suspended successfully
Sample Success Response:

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
##### Failure Response:
###### Status code: '200'
###### Description: Invalid license key

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

#### Failure details
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

* [POST v1/signature/sign](#post-sign)
* [POST v1/signature/validate](#post-validate)

### POST v1/signature/sign

This service will sign  provided plain string data.  

#### Resource URL
<div>https://mosip.io/v1/signature/sign</div>


#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes


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

#### Responses:
##### Success Response:
###### Status code: '200'
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



### POST v1/signature/validate

This service will decrypt encryted data along with symmetric key having splitter for given timestamp(encryption timestamp). 

#### Resource URL
<div>https://mosip.io/v1/signature/validate</div>


#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes


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

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: decrypt encryted data along with symmetric key having splitter
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

##### Error Response:
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

#### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-CSS-999 | Invalid request input | while passing Invalid input request
KER-CSS-101 | Validation Unsuccessful| while sign response in not valid
KER-CSS-102 | Internal server error  | Internal server error


# SMS Notification (Private)

* [POST /sms/send](#post-sms-send)

### POST /sms/send

This service will send request to SMS gateway. 

#### Resource URL
<div>https://mosip.io/v1/smsnotifier/sms/send</div>


#### Resource details

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

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: sms send successfully
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

##### Error Response:
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

#### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-NOS-001 |	Number and message can't be empty, null	|   SMS Illegal Input
KER-NOS-002 | Contact number cannot contains alphabet,special character or less than or more than | SMS Invalid Contact Number
KER-NOS-500 | Internal server error | Internal server error


# Email Notification (Private)

* [POST /email/send](#post-email-send)

### POST /email/send

This service will send request to Email/SMTP Service. 

#### Resource URL
<div>https://dev.mosip.io/v1/emailnotifier/email/send </div>


#### Resource details

Resource Details | Description
------------ | -------------
Request format | Form Data
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
mailTo |Yes|Mail ID of the recepient| |```mosip@mindtree.com```
mailCc |No|Mail ID of the recepient| |```mosip@mindtree.com```
mailSubject |Yes|Mail ID of the recepient| | Sample mail subject
mailContent |No|Mail ID of the recepient| | Sample mail content
attachments |No|Mail ID of the recepient| | multipart/formdata


#### Request

```
-H "Content-Type: multipart/form-data" 
-F "attachments={}" 
-F "mailCc=user1@gmail.com" 
-F "mailContent=OTP for Auth" 
-F "mailSubject=OTP" 
-F "mailTo=admin1@gmail.com"
```

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: sms send successfully
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

##### Error Response:
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

#### Failure details
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

## UIN-get service

* [GET /uin](#uin-get-service)

* [PUT /uin](#put-uin)


### GET /uin

This service will return unused UIN from UIN pool 

#### Resource URL
<div>https://mosip.io/v1/uingenerator/uin </div>
 

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-

#### Request
N/A

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: uin generated successfully
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


## UIN- Status Update service

### PUT /uin

This service will update the issued UN status to Assigned or Unassigned(Unused).  

#### Resource URL
<div>https://mosip.io/v1/uingenerator/uin</div>
 

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-

#### Request

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


#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: uin status updated successfully
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

##### Error Response:
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

#### Failure details
Error Code | Error Message | Error Description
-----|----------|-------------
KER-UIG-001 | UIN could not be found | UIN could not be found
KER-UIG-003 | Given UIN status not found | UIN Status not found
KER-UIG-004 | Given UIN is not in ISSUED status | UIN Not Issued
KER-UIG-005 | Internal Server Error | Internal Server Error
KER-UIG-006 | Error in retrieving from config server | Config Server Fetch failed


# RID generator (Private)

* [GET /v1/ridgenerator/generate/rid/10002/10032](#get-ridgenerator)

### GET /generate/rid/{centerid}/{machineid}

This service returns a RID for the requested CenterID and MachineID. 

#### Resource URL
<div>https://mosip.io/v1//generate/rid/{centerid}/{machineid}/</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
centerid|Yes|Centerid of registration| -NA- |10002
machineid|Yes|Machineid of registration| -NA- |10032

#### Request
```JSON
-NA-
```
#### Responses:
##### Success Response:
###### Status code: '200'
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

##### Error Response:
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

#### Failure details
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

* [GET tokenidgenerator/{uin}/{partnercode}](#get-tokenidgeneratoruinpartnercode)

### GET tokenidgenerator/{uin}/{partnercode}

This service returns a static token for the requested UIN and Partner ID. It will return the same Static Token for every call made with the same UIN and Partner ID. 

#### Resource URL
<div>https://mosip.io/v1/tokenidgenerator/{uin}/{partnercode}/</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
UIN|Yes|UIN of the individual.| -NA- |2345346532564566
partnercode|Yes|ID of the partner.| -NA- |9373

#### Request
```JSON
-NA-
```
#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: token id generated successfully
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

##### Failure Response:
###### Status code: '200'
###### Description: Invalid parameters
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

#### Failure details
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

### POST /audits

#### Resource URL
<div>https://mosip.io/v1/auditmanager/audits</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
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

#### Request
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
#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: audit request completed successfully
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

##### Error Response:
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

#### Failure details
Error Code | Error Message | Error Description
------------|----------|-------------
KER-AUD-001 | Invalid Audit Request. Required parameters must be present | Handler Exception
KER-AUD-002 | Invalid Audit Request. Format is incorrect. | Invalid Format
KER-AUD-500 | Internal server error | Internal server error

# Sync data (Public)

* [GET /masterdata](#get-masterdata)

* [GET /masterdata/{registrationcenterid}](#get-masterdataregistrationcenterid)

* [GET /configs](#get-configs)

* [GET /roles](#get-roles)

* [GET /userdetails/{regid}](#get-userdetailsregistrationcenterid)

* [GET /publickey](#get-publickey)

* [POST /tpm/publickey](#post-tpmpublickey)


## GET /masterdata

This service will provides the list of all master data. This service is used mainly by the Enrolment client module. 

#### Resource URL
<div>https://mosip.io/v1/syncdata/masterdata</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
macaddress|No|MAC address of the machine| | 
serialnumber|No|serial number of the machine| | 
lastUpdated|No|Date in UTC ISO format| | 
keyindex|Yes|Thumbprint of the public key corresponding to this machine| | 


#### Request

<div>https://mosip.io/v1/syncdata/masterdata?macaddress=e1:01:2b:c2:1d:b0&serialnumber=NM5328114630&keyindex=ys6823u22 </div>

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: latest masterdata for the provided machine.
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

### GET /masterdata/{registrationcenterid}

This service will provides the list of all master data. This service is used mainly by the Enrollment client module. 

#### Resource URL
<div>https://mosip.io/v1/syncdata/masterdata/10001?macaddress=e1:01:2b:c2:1d:b0&serialnumber=NM5328114630</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
regcenterId|Yes|Registration center id| |
macaddress|No|MAC address of the machine| | 
serialnumber|No|Serial number of the machine| | 
lastUpdated|No|Date in UTC ISO format| | 
keyindex|Yes|Thumbprint of the public key corresponding to this machine| | 


#### Request
v1/syncdata/masterdata/10001?macaddress=e1:01:2b:c2:1d:b0&serialnumber=NM5328114630&keyindex=ys6823u22

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: latest masterdata for the provided machine.
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

### GET /configs

This service will return back the global and registration configuration data of the MOSIP platform. 

#### Resource URL
<div>https://mosip.io/v1/syncdata/configs </div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-

#### Request

N/A

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: latest configuration details.
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

### GET /roles

This service will return back the all roles of the applications. 

#### Resource URL
<div>https://mosip.io/v1/syncdata/roles </div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-

#### Request
N/A

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: all roles of the application
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

### GET /userdetails/{registrationcenterid} 

This service will return back the list of users and its role-mapping based on the registration-center-id. 

#### Resource URL
<div>https://mosip.io/v1/syncdata/userdetails/{registrationcenterid} </div>


#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
-NA-

#### Request
<div>https://mosip.io/v1/syncdata/userdetails/110011 </div>

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: list of users and role-mapping 
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
### GET /publickey/{applicationId}


This service will provide the public key for the specific application fetched from key manager. 

#### Resource URL
<div>https://mosip.io/v1/syncdata/publickey/{applicationId}</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description |  Example
-----|----------|-------------|--------
applicationId |Yes|Id of the application| REGISTRATION,IDA
referenceId|No|Id of the Machine/MISP|
timeStamp |Yes|Date-time  in UTC ISO-8601| 2007-12-03T10:15:30Z

#### Request
<div>https://mosip.io/v1/syncdata/publickey/REGISTRATION?timeStamp=2018-12-09T06%3A39%3A03.683Z </div>

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: public key for the specified application
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
		  "expiryAt": "2018-12-10T06:12:51.994"
	    }
}	
```

### POST /tpm/publickey

This service will upload the public key corresponding to a particular machine which are used in the MOSIP platform. This service will be used specifically in the Registration Client machines. 

#### Resource URL
<div>https://mosip.io/v1/syncdata/tpm/publickey </div> TODO

#### Resource details

Resource Details | Description
------------ | -------------
Request format | application/json
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
machineName |Yes|Name of the machine| | MDLGE6273
publickey |Yes|Base 64 encoded Public key of the passed machine| | 


#### Request

```
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



#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: The public key had been mapped to the machine
```
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

##### Error Response:

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

* [GET /applicanttype/getApplicantType](#get-applicanttypegetApplicantType)


### GET /applicanttype/getApplicantType

This service finds the Applicant type for the combination of Individual type code,Gender code ,DOB ,Biometric available and Language code. If there is a combination entry exists for these combinations, the corresponding Applicant Type code is returned. 

#### Resource URL
<div>https://mosip.io/v1/applicanttype/getApplicantType</div>

#### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Part Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
individualTypeCode|Yes|The code of the individual type| -NA- |INDTYP_002
genderCode|Yes|The code of the Gender. | -NA- |ML
dateofbirth|Yes|Date of birth in UTC standard ISO8601 format| -NA- |2008-10-04T05:00:00.000Z
biometricAvailable|No|Is the biometric details available| -NA- |true
languagecode|Yes|Language code in ISO 639-2 standard| -NA- |eng

#### Request
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

#### Responses:
##### Success Response:
###### Status code: '200'
###### Description: applicant type code fetched successfully
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

##### Failure Response:
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

#### Failure details
Error Code | Error Message | Error Description
------------|----------|-------------
KER-MSD-147 | Applicant Type data does not exist | No Application Found
KER-MSD-148 | One or more input parameter is invalid or does not exist | Invalid Request


# OTP Manager (Private)

### POST OTP Generator
This component facilitates generation of OTP for various purposes. EG: Login in Pre-registration

The OTP Generator component will receive a request to generate OTP, validate if the OTP generation request is from an authorized source, call OTP generator API with the input parameters (Key), receive the OTP from the OTP generator API which is generated based on the OTP generation policy and respond to the source with the OTP.

The OTP Generator can also reject a request from a blocked/frozen account and assign a validity to each OTP that is generated, based on the defined policy

### Resource URL
### `POST /generate`

### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
key |Yes|Key| | 9820173642



### Example Request

v1/otpmanager/otp/generate

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
### Example:
##### Success Response
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

##### Failure Response
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

### Validator
This component facilitates basic validation of an OTP. 

This includes: Receiving a request for OTP validation with required input parameters (Key), Validating the pattern of OTP generated based on defined policy, validating if the OTP is active/inactive and responding to the source with a response (Valid/Invalid)

This component also facilitates deletion of every successfully validated OTP when consumed and freezing an account for exceeding the number of retries/wrong input of OTP. 

### Resource URL
### `GET /validate`

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

### Example Request

v1/otpmanager/validate?key=9820173642&otp=123456

### Example Response
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

#### Failure details
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
