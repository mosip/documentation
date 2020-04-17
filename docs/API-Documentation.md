This document talks about the API Documentation Standards in MOSIP.

**Sample API Documentation**

# Authorization and Authentication APIs
<Description>
* [Send OTP](#send-otp)
* [Authenticate UserId and OTP](#authenticate-userid-and-otp)

{% hint style="info" %}
**Swagger URL:** `https://<env>.mosip.io/v1/authmanager/swagger-ui.html#`
{% endhint %}

## Send OTP
This service sends an OTP to the user. The caller of this service have to send the channel in which the OTP will be sent. Based on the application ID, the corresponding channel's recipient address will be found out and the OTP is send accordingly. Note: At this point of time, no Auth Token will be generated.

### Resource URL
`POST https://<env>.mosip.io/v1/authmanager/authenticate/sendotp`
{% hint style="warning" %}
Please donot leave it as `POST /v1/authenticate/sendotp`
{% endhint %}

### Resource details
Resource Details | Description
------------ | -------------
Response format | JSON 
Requires Authentication | <Yes/No>; <Roles>
{% hint style="info" %}
* In response format just return the response format i.e. JSON
* If Authentication is needed add the Roles for authentication
{% endhint %}

### Parameters
Name | Required | Description | Values 
-----|----------|-------------|---------------
userid | Yes | This is the userid of the user. Based on the useridtype, this will vary. | Example - M392380
otpchannel | Yes | This is the channel in which the OTP will be sent. | EMAIL or MOBILE
useridtype | Yes | This field is the user id type. | UIN or VID or USERID
appid | Yes | This is the application ID of the caller of this service. | PREREGISTRATION, REGISTRATIONCLIENT, REGISTRATIONPROCESSOR, IDA
templateVariables | No | This is the map of custom template variables | Example - {"UIN":"2530192395"}
context|Yes|This shows the purpose of the sending otp | auth-otp(default), auth-login-otp
{% hint style="info" %}
* Name - name of the request parameter
* Required - Yes/No (for mandatory or optional)
* Description - Short Description of the parameter
* Values - Mostly constants and default or exapmles values should be marked as default or example
{% endhint %}

### Sample Request
```JSON
{
  "id": "mosip.authentication.sendotp",
  "metadata": {},
  "request": {
    "appId": "ida",
    "otpChannel": [
      "email"
    ],
    "context":"auth-otp",
    "templateVariables": {"UIN":"2530192395"},
    "userId": "2530192395",
    "useridtype": "UIN"
  },
  "requesttime": "2019-04-29T07:01:24.692Z",
  "version": "1.0"
}
```
{% hint style="warning" %}
* Make sure id and version is present in sample request and response (not just string)
* Make sure sample requesttime and responsetime is present in the sample
* Variables should have proper values not just - "string"
* Indentation should be of two space only and format of JSON should be proper 
{% endhint %}

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

### Failure Details
Error Code | Error Message | Scenario
-----------|----------|-------------
KER-AUTH-CHANNEL_INVALID | The passed channel is invalid. | This is the error response in case if the channel is not valid. 
AUTH_ERR_MULTIPLE_CHANNELS | Multiple channels are not supported in your module. | In case, if the caller can send only one channel, then this error will be sent. For example, Pre-Registration module cannot have multiple channels. 
AUTH_ERR_USER_NOT_FOUND | The passed in user is not found | If the passed user details is not found in the system.
AUTH_ERR_CHANNELPATH_NOT_FOUND | The passed in user is not found | If the channel's path is not found.

## Authenticate UserId and OTP
This service authenticates the use ID and the OTP. If the authentication is successful, an AuthToken will be sent in the Response header. 

### Resource URL
`https://<env>.mosip.io/v1/authmanager/authenticate/useridOTP`

### Resource details
Resource Details | Description
------------ | -------------
Response format | Response Header and JSON message 
Requires Authentication | No

### Parameters
Name | Required | Description | Values
-----|----------|-------------|---------------
userid | Yes | This is the userid of the user against which the OTP had been sent. | Example - M392380
otp | Yes | This is OTP which is sent to the userid's preferred channel | Example - 6473

### Sample Request
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

### Sample Response

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

### Failure Details
Error Code | Error Message | Scenario
-----------|----------|-------------
AUTH_ERR_INVALIDOTP | The passed in OTP is invalid | If the passed OTP is not valid. 
AUTH_ERR_EXPIREDOTP | The passed OTP is expired | If the passed OTP is expired. 