This section contains all the Authentication and Authorization APIs.
* [Authentication](#authentication)
	* [Send OTP](#send-otp)
	* [Authenticate using userID and OTP](#authenticate-using-userid-and-otp)
	* [Authenticate using username and password](#authenticate-using-username-and-password)
	* [Authenticate using clientid and secret key](#authenticate-using-clientid-and-secret-key)
* [Authorization](#authorization)
	* [Validate token](#validate-token)
	* [Invalidate token](#invalidate-token)
* [OTP services](#otp-services)
	* [Generate OTP](#generate-otp)
	* [Validate OTP](#validate-otp)

# Authentication

## Send OTP
This service sends an OTP to the user. The caller of this service have to send the channel in which the OTP will be sent. Based on the application ID, the corresponding channel's recipient address will be found out and the OTP is send accordingly. Note: At this point of time, no Auth Token will be generated. 

### Resource URL
`POST https://{base_url}/v1/authmanager/authenticate/sendotp`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON Message
Requires Authentication | No

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
userid | Yes | This is the userid of the user. Based on the useridtype, this will vary.| NA | M392380
otpchannel | Yes | This is the channel in which the OTP will be sent. It is an array of the enumeration {"email", "phone"}. If the channel is not found, ChannelNotSupported error will be sent back| NA | phone
useridtype | Yes | This field is the user id type. It should be one the {"UIN", "USERID"}. Based on the combination of "appid" and "useridtype" the system identifies from which system to pickup the channel's recipient address | NA | USERID
appid | Yes | This is the application ID of the caller of this service. It should be on of the {"preregistration", "registrationclient", "registrationprocessor", "ida", "admin", "resident"} | NA | preregistration
templateVariables | No| This is the map of custom template variables | NA | {"UIN":"2530192395"}
context | Yes | This shows the purpose of the sending otp like Login, notification, etc. | "auth-otp" for default OTP| auth-otp, auth-login-otp

### Example Request
```JSON
{
  "id": "string",
  "metadata": {},
  "request": {
    "appId": "ida",
    "otpChannel": [
      "email"
    ],
    "context":"auth-otp",
    "templateVariables":{"UIN":"2530192395"},
    "userId": "2530192395",
    "useridtype": "UIN"
  },
  "requesttime": "2019-04-29T07:01:24.692Z",
  "version": "string"
}
```

### Example Response

#### Success Response 

```JSON
{
  "id": "mosip.authentication.sendotp",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "response": {
    "status": "success",
    "message":"OTP had been sent successfully"
  }
}
```

#### Error Response 
1. Invalid Channel: This is the error response in case if the channel is not valid. 
```JSON
{
  "id": "mosip.authentication.sendotp",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "errors":[
    {
      "errorCode": "KER-AUTH-CHANNEL_INVALID",
      "message": "The passed channel is invalid."
    }	
  ]
}
```

2. Multiple channels not supported: In case, if the caller can send only one channel, then this error will be sent. For example, Pre-Registration module cannot have multiple channels. 
```JSON
{
  "id": "mosip.authentication.sendotp",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "errors":[
    {
      "errorCode": "AUTH_ERR_MULTIPLE_CHANNELS",
      "message": "Multiple channels are not supported in your module."
    }	
  ]
}
```
3. User not found: If the passed is not found in the system. 
```JSON
{
  "id": "mosip.authentication.sendotp",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "errors":[
    {
      "errorCode": "AUTH_ERR_USER_NOT_FOUND",
      "message": "The passed in user is not found"
    }	
  ]
}
```
4. Channel path not found: If the channel's path is not found. For example, if the channel is email and the email ID is not found for that user. 
```JSON
{
  "id": "mosip.authentication.sendotp",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "errors":[
    {
      "errorCode": "AUTH_ERR_CHANNELPATH_NOT_FOUND",
      "message": "The passed in user is not found"
    }	
  ]
}
```

## Authenticate using userID and OTP

This service authenticates the use ID and the OTP. If the authentication is successful, an AuthToken will be sent in the Response header. 

### Resource URL
`POST https://{base_url}/v1/authmanager/authenticate/useridOTP`

### Resource details
Resource Details | Description
------------ | -------------
Response format | Response Header and JSON Message 
Requires Authentication | No

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
userid | Yes | This is the userid of the user against which the OTP had been sent. Based on the useridtype, this will vary. | NA | M392380
otp | Yes| This is OTP which is sent to the userid's preferred channel | NA | 6473

### Example Request
```JSON
{
  "id": "mosip.authentication.useridOTP",
  "version":"1.0",	
  "requesttime":"2007-12-03T10:15:30Z",
  "request": {
    "userid": "M392380",
    "otp": "6473"
  }
}
```

### Example Response

#### Success Response 
```
Response Cookie:

Set-Cookie →Authorization=Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJpbmRpdmlkdWFsIiwibW9iaWxlIjoiOTY2MzE3NTkyOCIsIm1haWwiOiJpbmRpdmlkdWFsQGdtYWlsLmNvbSIsInJvbGUiOiJwZXJzb24iLCJpYXQiOjE1NTEzNDU1NjUsImV4cCI6MTU1MTM1MTU2NX0.pCyibViXo31enOgRD60BnKjEpEA-78yzbWnZGChxCIZ5lTpYnhgm-0dtoT3neFebTJ8eAI7-o8jDWMCMqq6uSw; Max-Age=6000000; Expires=Wed, 08-May-2019 19:59:43 GMT; Path=/; Secure; HttpOnly
```

```JSON
{
  "id": "mosip.authentication.useridOTP",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "response": {
    "status": "success",
    "message":"OTP validation is successfull"
  }
}
```

### Error Responses

1. Invalid OTP: If the passed OTP is not valid. 
```JSON
{
  "id": "mosip.authentication.useridOTP",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "errors":[
    {
      "errorCode": "AUTH_ERR_INVALIDOTP",
      "message": "The passed in OTP is invalid"
    }	
  ]
}
```

2. Expired OTP: If the passed OTP is expired. 
```JSON
{
  "id": "mosip.authentication.useridOTP",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "errors":[
    {
      "errorCode": "AUTH_ERR_EXPIREDOTP",
      "message": "The passed OTP is expired"
    }	
  ]
}
```

## Authenticate using username and password
This service will authenticate the username and password. 

### Resource URL
`POST https://dev.mosip.io/v1/authmanager/authenticate/useridPwd`

### Resource details
Resource Details | Description
------------ | -------------
Response format | Response Header and JSON Message
Requires Authentication | No

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
username | Yes | This is the username of the user. | NA | M392380
password | Yes | This is the password of the user.| NA | ADGDAGADFF
appid | Yes | This is the application ID of the caller of this service. It should be on of the {"preregistration", "registrationclient", "registrationprocessor", "ida", "admin", "resident"} | NA | preregistration

### Example Request
```JSON
{
  "id": "mosip.authentication.useridPwd",
  "version":"1.0",	
  "requesttime":"2007-12-03T10:15:30Z",
  "request": {
    "username": "M392380",
    "password": "fdkj943lkj32k32ew$8Kf",
    "appid": "registrationclient"
  }
}
```

### Example Response

#### Success Response 
```
Response Cookie:

Set-Cookie →Authorization=Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJpbmRpdmlkdWFsIiwibW9iaWxlIjoiOTY2MzE3NTkyOCIsIm1haWwiOiJpbmRpdmlkdWFsQGdtYWlsLmNvbSIsInJvbGUiOiJwZXJzb24iLCJpYXQiOjE1NTEzNDU1NjUsImV4cCI6MTU1MTM1MTU2NX0.pCyibViXo31enOgRD60BnKjEpEA-78yzbWnZGChxCIZ5lTpYnhgm-0dtoT3neFebTJ8eAI7-o8jDWMCMqq6uSw; Max-Age=6000000; Expires=Wed, 08-May-2019 19:59:43 GMT; Path=/; Secure; HttpOnly
```

```JSON
{
  "id": "mosip.authentication.useridPwd",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "response": {
    "status": "success",
    "message":"Username and password combination had been validated successfully"
  }
}
```

#### Error Responses
1. Invalid credentials: If the passed credentials is not correct. 
```JSON
{
  "id": "mosip.authentication.useridPwd",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "errors":[
    {
      "errorCode": "AUTH_ERR_INVALIDCREDENTIALS",
      "message": "The passed in credentials is not correct"
    }	
  ]
}
```

2. Invalid application ID: If the passed in application is not correct. 
```JSON
{
  "id": "mosip.authentication.useridPwd",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "errors":[
    {
      "errorCode": "AUTH_ERR_INVALIDAPPID",
      "message": "The passed in application ID is not correct"
    }	
  ]
}
```

## Authenticate using clientid and secret key
This service will authenticate the clientid and secret key. When an application try to call any service in the MOSIP system, the call have to be authenticated and authorized. For example, when Pre-registration application calls some master service, the call have to be authenticated first. This call can facilitate the call. 
The clientid would have provided to the caller application before hand using another procedure. So, before making this call, the caller application have to have the clientid and the secret key.  

### Resource URL
`POST https://{base_url}/v1/authmanager/authenticate/clientidsecretkey`

### Resource details
Resource Details | Description
------------ | -------------
Response format | Response Header and JSON Message
Requires Authentication | No

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
clientid|Yes|This is the client id, provided to the caller application upfront. | NA | D72HJDF8
secretkey|Yes|This is the secret key which was provided to the application corresponding to the clientid| NA | JSlj8p789sdfjhlsJKDHFS

### Example Request
```JSON
{
  "id": "mosip.authentication.clientidsecretkey",
  "version":"1.0",	
  "requesttime":"2007-12-03T10:15:30Z",
  "request": {
    "clientid": "D72HJDF8",
    "secretkey": "JSlj8p789sdfjhlsJKDHFS"
  }
}
```

### Example Response

#### Success Response 
```
Response Cookie:

Set-Cookie →Authorization=Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJpbmRpdmlkdWFsIiwibW9iaWxlIjoiOTY2MzE3NTkyOCIsIm1haWwiOiJpbmRpdmlkdWFsQGdtYWlsLmNvbSIsInJvbGUiOiJwZXJzb24iLCJpYXQiOjE1NTEzNDU1NjUsImV4cCI6MTU1MTM1MTU2NX0.pCyibViXo31enOgRD60BnKjEpEA-78yzbWnZGChxCIZ5lTpYnhgm-0dtoT3neFebTJ8eAI7-o8jDWMCMqq6uSw; Max-Age=6000000; Expires=Wed, 08-May-2019 19:59:43 GMT; Path=/; Secure; HttpOnly
```

```JSON
{
  "id": "mosip.authentication.clientidsecretkey",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "response": {
    "status": "success",
    "message":"Clientid and Token combination had been validated successfully"
  }
}
```

#### Error Responses
1. Invalid credentials: If the passed credentials is not correct. 
```JSON
{
  "id": "mosip.authentication.clientidsecretkey",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "errors":[
    {
      "errorCode": "AUTH_ERR_INVALIDCLIENTIDCREDENTIALS",
      "message": "The passed in credentials is not correct"
    }	
  ]
}
```

# Authorization

## Validate token
This service checks the validity of the Auth token.

### Resource URL
`POST https://{base_url}/v1/authmanager/authorize/validateToken`

### Resource detail
Resource Details | Description
------------ | -------------
Response format | The response will be sent in the Response Header and also a JSON message will be returned. 
Requires Authentication | no

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
Authorization|Yes|AuthToken passed in the request cookie| | Mosip-TokeneyeyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiJiMDhmODZhZi0zNWRhLTQ4ZjItOGZhYi1jZWYzOTA0NjYwYmQifQ.-xN_h82PHVTCMA9vdoHrcZxH-x5mb11y1537t3rGzcM

### Example Request
```
Request Cookie:
Authorization=Mosip-TokeneyeyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiJiMDhmODZhZi0zNWRhLTQ4ZjItOGZhYi1jZWYzOTA0NjYwYmQifQ.-xN_h82PHVTCMA9vdoHrcZxH-x5mb11y1537t3rGzcM
```

### Example Response

#### Success Response 
```JSON
{
  "id": "mosip.authorize.validatetoken",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "response": {
    "message":"Token had been validated successfully"
  }
}
```

#### Error Responses
1. Invalid Token: If the passed token is not correct. 
```JSON
{
  "id": "mosip.authentication.validatetoken",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "errors":[
    {
      "errorCode": "AUTH_ERR_TOKENNOTVALID",
      "message": "The passed in Token is not correct"
    }	
  ]
}
```

## Invalidate token
This service invalidates the token

### Resource URL
`POST https://{base_url}/v1/authmanager/authorize/invalidateToken`

### Resource details
Resource Details | Description
------------ | -------------
Response format | Response Cookie and JSON Message
Requires Authentication | No

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
Authorization|Yes|AuthToken passed in the request cookie| | eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiJiMDhmODZhZi0zNWRhLTQ4ZjItOGZhYi1jZWYzOTA0NjYwYmQifQ.-xN_h82PHVTCMA9vdoHrcZxH-x5mb11y1537t3rGzcM

### Example Request
```
Request Cookie:
Authorization=Mosip-TokeneyeyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiJiMDhmODZhZi0zNWRhLTQ4ZjItOGZhYi1jZWYzOTA0NjYwYmQifQ.-xN_h82PHVTCMA9vdoHrcZxH-x5mb11y1537t3rGzcM 
```

### Example Response

#### Success Response 
```JSON
{
  "id": "mosip.authorize.invalidatetoken",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "response": {
    "message":"Token invalidated successfully"
  }	
}
```

#### Error Responses
1. Empty Cookie: If the passed Cookie is empty. 
```JSON
{
  "id": "mosip.authentication.invalidatetoken",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "errors":[
    {
      "errorCode": "AUTH_ERR_COOKIEEMPTY",
      "message": "The passed in Cookie is empty"
    }	
  ]
}
```

# OTP services

## Generate OTP
The OTP Generator component will receive a request to generate OTP, validate if the OTP generation request is from an authorized source, call OTP generator API with the input parameters (Key), receive the OTP from the OTP generator API which is generated based on the OTP generation policy and respond to the source with the OTP.

The OTP Generator can also reject a request from a blocked/frozen account and assign a validity to each OTP that is generated, based on the defined policy

### Resource URL
`POST https://{base_url}/v1/otpmanager/otp/generate`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON Message 
Requires Authentication | No

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
key|Yes|AuthToken passed in the request header| | 

### Example Request
```JSON
{
  "id": "mosip.otp.generateOTP",
  "version":"1.0",	
  "requesttime":"2007-12-03T10:15:30Z",
  "request": {
    "key": "9820173642"
  }
}
```

### Example Response

#### Success Response
```JSON
{
  "id": "mosip.otp.generateOTP",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "response": {
    "otp": "849004",
    "status": "GENERATION_SUCCESSFUL"
  }
}
```

#### Error Responses
NA

## Validate OTP
This component facilitates basic validation of an OTP.

This includes: Receiving a request for OTP validation with required input parameters (Key), Validating the pattern of OTP generated based on defined policy, validating if the OTP is active/inactive and responding to the source with a response (Valid/Invalid)

This component also facilitates deletion of every successfully validated OTP when consumed and freezing an account for exceeding the number of retries/wrong input of OTP.

### Resource URL
`https://dev-test.southindia.cloudapp.azure.com/v1/otpmanager/otp/validate?key=87637740607&otp=123456`

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON Message
Requires Authentication | no

### Parameters
Name | Required | Description | Default Value | Example
-----|----------|-------------|---------------|--------
Key|Yes|AuthToken passed in the request header| NA | 9820173642
otp|Yes|OTP which was sent to the user| NA | 849004

### Example Request
NA

### Example Response

#### Success Response 
```JSON
{
  "id": "mosip.otp.validateOTP",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "response": {
    "status": "success",
    "message": "VALIDATION SUCCESSFUL"
  }
}
```

#### Error Responses
1. Invalid OTP: If the passed OTP is not correct. 
```JSON
{
  "id": "mosip.authentication.validateOTP",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "errors":[
    {
      "errorCode": "AUTH_ERR_OTPNOTVALID",
      "message": "The passed in OTP is not valid"
    }	
  ]
}
```

2. OTP Expired: If the passed OTP had been expired. 
```JSON
{
  "id": "mosip.authentication.validateOTP",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "errors":[
    {
      "errorCode": "AUTH_ERR_OTPEXPIRED",
      "message": "The passed in OTP is expired"
    }	
  ]
}
```
