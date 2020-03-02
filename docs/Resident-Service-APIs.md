This section details out all Resident Service REST APIs

* [OTP Request API](#post-residentv1reqotp)

* [Service Request Status Check API](#post-residentv1ridcheck-status)

* [e-UIN API](#post-residentv1reqeuin)

* [Re-print UIN API](#post-residentv1reqprint-uin)

* [Retrieve Lost UIN API](#post-residentv1requin)

* [Retrieve Lost RID API](#post-residentv1reqrid)

* [UIN Update API](#post-residentv1requpdate-uin)

* [VID Generate API](#post-/residentv1vid)

* [VID Revoke API](#patch-residentv1vid{vid})

* [Lock Authentication Type API](#post-residentv1reqauth-lock)

* [UnLock Authentication Type API](#post-residentv1reqauth-unlock)

* [Authentication History API](#post-residentv1reqauth-history)


## POST /resident/v1/req/otp
This service enables Individual to request for an OTP. The OTP will be send via registered message/email to the Individual. This OTP can then be used to authenticate in other resident services.

#### Resource URL 
<div>https://mosip.io/resident/v1/req/otp</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | No

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | mosip.resident.otp | 
version | Y | API version |  | v1 
requestTime| Y |Time when Request was captured| | 2018-12-09T06:39:03.683Z
request: transactionID| Y | Transaction ID of request | | dabed834-974f-11e9-bc42-526af7764f64
request: individualId| N | VID | | 9830872690593682
request: individualIdType| Y | Allowed Type of Individual ID - VID, UIN, demo | VID 
request: demographics|N| Demographic data of an Individual| |


Mandatory fields for different types of authentications- 
* If individualIdType is  VID or UIN then individualId is Mandatory
* If individualIdType is demo then  demographics is Mandatory


#### Request Body -1
```JSON
{
  "id": "mosip.resident.otp",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:03.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "demographics": null
  }
}
```

#### Request Body -2
```JSON
{
  "id": "mosip.resident.otp",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:03.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": null,
  "individualIdType": "demo",
  "demographics": {
      "name": [
        {
          "language": "fra",
          "value": "Ibrahim Ibn Ali"
        }
      ],
      "gender": [
        {
          "language": "fra",
          "value": "mâle"
        }
      ],
      "postalCode": {
          "type": "10004"
        },
      "phone": {
          "type": "998989989809"
        },
      "email": {
          "type": "abcdefgh@xyz.com"
        }
    }
  }
}
```


#### Responses:
##### Success Response:
###### Status Code : 200 (OK)
       
```JSON
{
  "id": "mosip.resident.otp",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "response": {
    "status": "success",
    "message": "Notification has been sent to abXXXXXXXXXcd@xyz.com"
  },
  "errors": null
}
```

##### Failed Response:   
###### Status Code : 200 (OK)   

```JSON
{
  "id": "mosip.resident.otp",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "response": null,
  "errors": [
    {
      "errorCode": "RES-REP-089",
      "errorMessage": "Invalid VID"
    }
  ]
}
```

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
XXX-XXX-001 | OTP Request failed | 
XXX-XXX-002 | Invalid VID | No active VID found  




## POST /resident/v1/rid/check-status
This service will respond with service request (UIN Generation/Updation,Reprint etc) status and notification will be sent to phone/email.

#### Resource URL
<div>https://mosip.io/resident/v1/rid/check-status</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | | mosip.resident.uinstatus
version | Y | API version | | v1
requestTime| Y |Time when Request was captured| | 2018-12-09T06:39:04.683Z
request: transactionID| N | Transaction ID of request | | dabed834-974f-11e9-bc42-526af7764f64
request: individualId| Y | RID | | 9830872690593682
request: individualIdType| Y | Allowed Type of Individual ID - RID | RID 

#### Request Body
```JSON
{
  "id": "mosip.resident.uinstatus",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "individualId": "9830872690593682",
  "individualIdType": "RID"
  }
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)   

```JSON
{
  "id": "mosip.resident.uinstatus",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {
    "ridStatus": "PROCESSING"
  },
  "errors": null
}
```

##### Failed Response:
###### Status Code : 200 (OK)    

```JSON
{
  "id": "mosip.resident.uinstatus",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "Invalid RID"
    }
  ]
}
```
#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
RES-TUG-002| Data entered does not match or not valid or not found
RES-TUG-004| No Registered Mobile/email ID found


## POST /resident/v1/req/euin
This request will authenticate an Individual based on provided OTP and respond with e-UIN. Notification will be sent to phone/email.

#### Resource URL
<div>https://mosip.io/resident/v1/req/euin</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | | mosip.resident.euin
version | Y | API version | | v1
requestTime| Y |Time when Request was captured| | 2018-12-09T06:39:04.683Z
request: transactionID| Y | Transaction ID of request | | dabed834-974f-11e9-bc42-526af7764f64
request: individualId| Y | VID | | 9830872690593682
request: individualIdType| Y | Allowed Type of Individual ID - VID, UIN | VID
request: cardType| Y | Allowed Type of cardType - MASKED_UIN, UIN |  
request: otp| Y | OTP | | 


#### Request Body
```JSON
{
  "id": "mosip.resident.euin",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "cardType": "MASKED_UIN",
  "otp": "123456"
  }
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)   

```JSON
{
  "id": "mosip.resident.euin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {
    "euin": "<uin-pdf byte string>",
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

##### Failed Response:
###### Status Code : 200 (OK)

```JSON
{
  "id": "mosip.resident.euin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
RES-DOW-001| OTP Authentication Failed.
RES-DOW-002| Data entered is not valid.
RES-DOW-004| No Registered Mobile/email ID found.




## POST /resident/v1/req/print-uin
This request will authenticate an Individual based on provided OTP and post a request for UIN re-print to Postal Service. Notification will be sent to phone/email.

#### Resource URL
<div>https://mosip.io/resident/v1/req/print-uin</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | | mosip.resident.reprintuin
version | Y | API version | | v1
requestTime| Y |Time when Request was captured| | 2018-12-09T06:39:04.683Z
request: transactionID| Y | Transaction ID of request | | dabed834-974f-11e9-bc42-526af7764f64
request: individualId| Y | VID | | 9830872690593682
request: individualIdType| Y | Allowed Type of Individual ID - VID, UIN | VID
request: cardType| Y | Allowed Type of cardType - MASKED_UIN, UIN | 
request: otp| Y | OTP | | 


#### Request Body
```JSON
{
  "id": "mosip.resident.reprintuin",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "cardType": "MASKED_UIN",
  "otp": "123456"
  }
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)   

```JSON
{
  "id": "mosip.resident.reprintuin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {
	"rid": "770872690593682",
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

##### Failed Response:
###### Status Code : 200 (OK)    

```JSON
{
  "id": "mosip.resident.reprintuin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
RES-REP-001| OTP Authentication Failed.
RES-REP-002| Data entered is not valid.
RES-REP-004| No Registered Mobile/email ID found.





## POST /resident/v1/req/uin
This request will authenticate an Individual based on provided OTP and respond with UIN. Notification will be sent to phone/email.


#### Resource URL
<div>https://mosip.io/resident/v1/req/uin</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | | mosip.resident.lostuin
version | Y | API version | | v1
requestTime| Y |Time when Request was captured| | 2018-12-09T06:39:04.683Z
request: transactionID| Y | Transaction ID of request | | dabed834-974f-11e9-bc42-526af7764f64
request: individualIdType| Y | Allowed Type of Individual ID - demo | demo 
request: otp| Y | OTP | | 
request: demographics|N| Demographic data of an Individual| |


#### Request Body
```JSON
{
  "id": "mosip.resident.lostuin",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualIdType": "demo",
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
      "postalCode": {
          "type": "10004"
        },
      "phone": {
          "type": "998989989809"
        },
      "email": {
          "type": "abcdefgh@xyz.com"
        }
    }
  }
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)

```JSON
{
  "id": "mosip.resident.lostuin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {
	"uin": "989768897876565",
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

##### Failed Response:
###### Status Code : 200 (OK)    

```JSON
{
  "id": "mosip.resident.lostuin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```
#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
RES-LOU-001|OTP Validation Failed.
RES-LOU-002|Data entered does not match.
RES-LOU-004|No Registered Mobile/email ID found.



## POST /resident/v1/req/rid
This request will authenticate an Individual based on provided OTP and respond with RID. Notification will be sent to phone/email.


#### Resource URL
<div>https://mosip.io/resident/v1/req/rid</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | | mosip.resident.lostrid
version | Y | API version | | v1
requestTime| Y |Time when Request was captured| | 2018-12-09T06:39:04.683Z
request: transactionID| Y | Transaction ID of request | | dabed834-974f-11e9-bc42-526af7764f64
request: individualIdType| Y | Allowed Type of Individual ID - demo | demo 
request: otp| Y | OTP | | 
request: demographics|N| Demographic data of an Individual| |


#### Request Body
```JSON
{
  "id": "mosip.resident.lostrid",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualIdType": "demo",
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
      "postalCode": {
          "type": "10004"
        },
      "phone": {
          "type": "998989989809"
        },
      "email": {
          "type": "abcdefgh@xyz.com"
        }
    }
  }
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)

```JSON
{
  "id": "mosip.resident.lostrid",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {
    "rid": "989768897876565",
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

##### Failed Response:
###### Status Code : 200 (OK)    

```JSON
{
  "id": "mosip.resident.lostrid",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```
#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
RES-LOR-001|OTP Validation Failed.
RES-LOR-002|Data entered does not match.
RES-LOR-004|No Registered Mobile/email ID found.



## POST /resident/v1/req/update-uin
This request will authenticate an Individual based on provided OTP and respond with RID after successfully placing update request to Registration Processor. Notification will be sent to phone/email.

#### Resource URL
<div>https://mosip.io/resident/v1/req/update-uin</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | | mosip.resident.uin
version | Y | API version | | v1
requestTime| Y |Time when Request was captured| | 2018-12-09T06:39:04.683Z
request: transactionID| Y | Transaction ID of request | | dabed834-974f-11e9-bc42-526af7764f64
request: individualId| Y | UIN | | 9830872690593682
request: individualIdType| Y | Allowed Type of Individual ID - VID, UIN | UIN 
request: otp| Y | OTP | | 
request: demographics|Y| Demographic data of an Individual| |


#### Request Body
```JSON
{ 
   "id":"mosip.resident.updateuin",
   "version":"v1",
   "requestTime":"2018-12-09T06:39:04.683Z",
   "request":{ 
      "transactionID":"dabed834-974f-11e9-bc42-526af7764f64",
      "individualId":"9830872690593682",
      "individualIdType":"UIN",
      "otp":"123456",
      "identityJson":"<base64 encoded identity json byte array>",
      "documents":[ 
         { 
            "name":"<document name same as present inside id json>",
            "value":"<base64 encoded document byte array>"
         },
         { 
            "name":"<document name same as present inside id json>",
            "value":"<base64 encoded document byte array>"
         }
      ]
   }
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)

```JSON
{
  "id": "mosip.resident.updateuin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {
    "rid": "989768897876565",
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

##### Failed Response:
###### Status Code : 200 (OK)    

```JSON
{
  "id": "mosip.resident.uin",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
RES-UIU-001| OTP Authentication Failed.
RES-UIU-002| Data entered does not match or not valid.
RES-UIU-004| No Registered Mobile/email ID found.
RES-UIU-005| Status of UIN Update is UnSuccessful.



## POST /resident/v1/vid
This request will authenticate an Individual based on provided OTP and will generate VID for the respective UIN.

#### Resource URL
<div>https://mosip.io/resident/v1/vid</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | | mosip.resident.vid
version | Y | API version | | v1
requestTime| Y |Time when Request was captured| | 2018-12-09T06:39:04.683Z
request: transactionID| Y | Transaction ID of request | | dabed834-974f-11e9-bc42-526af7764f64
request: vidType	| Y |	VID Type	- PERPETUAL or  TEMPORARY | 
request: individualId| Y | UIN | | 9830872690593682
request: individualIdType| Y | Allowed Type of Individual ID - UIN | UIN 
request: otp| Y | OTP | | 


#### Request Body
```JSON
{
  "id": "mosip.resident.vid",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": "9830872690593682",
  "individualIdType": "UIN",
  "otp": "123456",
  "vidType": "PERPETUAL" 
  }
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)   

```JSON
{
  "id": "mosip.resident.vid",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
   "response": {
    "vid": "989768897876565",
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

##### Failed Response:
###### Status Code : 200 (OK)    

```JSON
{
  "id": "mosip.resident.vid",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
RES-VID-002| OTP Authentication Failed.
RES-VID-003| Data entered is not valid.
RES-VID-004| No Registered Mobile/email ID found.









## PATCH /resident/v1/vid/{vid}
This request will authenticate an Individual based on provided OTP and will revoke respective VID.

#### Resource URL
<div>https://mosip.io/resident/v1/vid/9830872690593682</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | | mosip.resident.vidstatus
version | Y | API version | | v1
requestTime| Y |Time when Request was captured| | 2018-12-09T06:39:04.683Z
request: transactionID| Y | Transaction ID of request | | dabed834-974f-11e9-bc42-526af7764f64
request: vidStatus	| Y| 	Status of VID	-	REVOKED |
request: individualId| Y | VID | | 9830872690593682
request: individualIdType| Y | Allowed Type of Individual ID - VID | VID 
request: otp| Y | OTP | | 


#### Request Body
```JSON
{
  "id": "mosip.resident.vidstatus",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": "9830872690593682",
  "individualIdType": "VID",
  "otp": "123456",
  "vidStatus": "REVOKED"
  }
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)   

```JSON
{
  "id": "mosip.resident.vidstatus",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
   "response": {
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

##### Failed Response:
###### Status Code : 200 (OK)    

```JSON
{
  "id": "mosip.resident.vidstatus",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
RES-RID-002| OTP Authentication Failed.
RES-RID-003| Data entered is not valid.
RES-RID-004| No Registered Mobile/email ID found.
RES-RID-005| VID revocation request failed. Please visit the nearest registration center for assistance.












## POST /resident/v1/req/auth-lock
This request will authenticate an Individual based on provided OTP and will lock provided authentication types.

#### Resource URL
<div>https://mosip.io/resident/v1/req/auth-lock</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | | mosip.resident.authlock
version | Y | API version | | v1
requestTime| Y |Time when Request was captured| | 2018-12-09T06:39:04.683Z
request: transactionID| Y | Transaction ID of request | | dabed834-974f-11e9-bc42-526af7764f64
request: authType	| Y| 	Allowed Type	-	demo,bio,bio-FMR,bio-IIR,bio-FID |
request: individualId| Y | UIN | | 9830872690593682
request: individualIdType| Y | Allowed Type of Individual ID - UIN,VID | UIN 
request: otp| Y | OTP | | 


#### Request Body
```JSON
{
  "id": "mosip.resident.authlock",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": "9830872690593682",
  "individualIdType": "UIN",
  "otp": "123456",
  "authType": ["bio-FMR","bio-FACE"]
  }
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)   

```JSON
{
  "id": "mosip.resident.authlock",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
   "response": {
    "status": "success",
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

##### Failed Response:
###### Status Code : 200 (OK)    

```JSON
{
  "id": "mosip.resident.authlock",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```
#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
RES-LOC-001|OTP Authentication Failed.
RES-LOC-002| Data entered is not valid.
RES-LOC-004| No Registered Mobile/email ID found.
RES-LOC-005| Locking for the Authentication type(s) is Unsuccessful.














## POST /resident/v1/req/auth-unlock
This request will authenticate an Individual based on provided OTP and will unlock provided locked authentication types.

#### Resource URL
<div>https://mosip.io/resident/v1/req/auth-unlock</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | | mosip.resident.authunlock
version | Y | API version | | v1
requestTime| Y |Time when Request was captured| | 2018-12-09T06:39:04.683Z
request: transactionID| Y | Transaction ID of request | | dabed834-974f-11e9-bc42-526af7764f64
request: authType	| Y| 	Allowed Type	-demo,bio,bio-FMR,bio-IIR,bio-FID  |
request: individualId| Y | UIN | | 9830872690593682
request: individualIdType| Y | Allowed Type of Individual ID - UIN,VID | UIN 
request: otp| Y | OTP | | 


#### Request Body
```JSON
{
  "id": "mosip.resident.authunlock",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": "9830872690593682",
  "individualIdType": "UIN",
  "otp": "123456",
  "authType": ["bio-FIR"]
  }
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK) 

```JSON
{
  "id": "mosip.resident.authunlock",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
   "response": {
    "status": "success",
   "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

##### Failed Response:
###### Status Code : 200 (OK)    

```JSON
{
  "id": "mosip.resident.authunlock",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```

#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
RES-ULC-001| OTP Authentication Failed.
RES-ULC-002| Data entered is not Valid.
RES-ULC-004| No Registered Mobile/email ID found.
RES-ULC-005| Unlocking for the Authentication type is Unsuccessful.










## POST /resident/v1/req/auth-history
This request will authenticate an Individual based on provided OTP and respond with auth history. Notification will be sent to phone/email.

#### Resource URL
<div>https://mosip.io/resident/v1/req/auth-history</div>

#### Resource details

Resource Details | Description
------------ | -------------
Response format | JSON
Requires Authentication | Yes

#### Request Body Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
id | Y | API Id | | mosip.resident.authhistory
version | Y | API version | | v1
requestTime| Y |Time when Request was captured| | 2018-12-09T06:39:04.683Z
request: transactionID| Y | Transaction ID of request | | dabed834-974f-11e9-bc42-526af7764f64
request: individualId| Y | UIN | | 9830872690593682
request: individualIdType| Y | Allowed Type of Individual ID - UIN,VID | UIN 
request: otp| Y | OTP | | 


#### Request Body
```JSON
{
  "id": "mosip.resident.authhistory",
  "version": "v1",
  "requestTime": "2018-12-09T06:39:04.683Z",
  "request": {
  "transactionID": "dabed834-974f-11e9-bc42-526af7764f64",
  "individualId": "9830872690593682",
  "individualIdType": "UIN",
  "otp": "123456"
  }
}
```

#### Responses:
##### Success Response:
###### Status Code : 200 (OK)   

```JSON
{
  "id": "mosip.resident.authhistory",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
   "response": {
	"authHistory": [{authDetails1},{authDetails2}],   
    "message": "Notification has been sent to the provided contact detail(s)"
  },
  "errors": null
}
```

##### Failed Response:
###### Status Code : 200 (OK)    

```JSON
{
  "id": "mosip.resident.authhistory",
  "version": "v1",
  "responseTime": "2018-12-09T06:39:04.683Z",
  "response": {

  },
  "errors": [
    {
      "errorCode": "XXX-XXX-002",
      "errorMessage": "OTP Authentication Failed"
    }
  ]
}
```
#### Failure details
Error Code | Error Message | Error Description
------------|------------------------------|-------------
RES-AUT-001| OTP Authentication Failed.
RES-AUT-002| Data entered is not valid.
RES-AUT-004| No Registered Mobile/email ID found.
RES-AUT-005| Mandatory values not entered.