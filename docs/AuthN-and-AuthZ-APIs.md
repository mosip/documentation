# AuthN and AuthZ APIs

This section contains all the Authentication and Authorization APIs.

* [Authentication](AuthN-and-AuthZ-APIs.md#authentication)
  * [Send OTP](AuthN-and-AuthZ-APIs.md#send-otp)
  * [Authenticate using userID and OTP](AuthN-and-AuthZ-APIs.md#authenticate-using-userid-and-otp)
  * [Authenticate using username and password](AuthN-and-AuthZ-APIs.md#authenticate-using-username-and-password)
  * [Authenticate using clientid and secret key](AuthN-and-AuthZ-APIs.md#authenticate-using-clientid-and-secret-key)
* [Authorization](AuthN-and-AuthZ-APIs.md#authorization)
  * [Validate token](AuthN-and-AuthZ-APIs.md#validate-token)
  * [Invalidate token](AuthN-and-AuthZ-APIs.md#invalidate-token)
* [OTP services](AuthN-and-AuthZ-APIs.md#otp-services)
  * [Generate OTP](AuthN-and-AuthZ-APIs.md#generate-otp)
  * [Validate OTP](AuthN-and-AuthZ-APIs.md#validate-otp)

## Authentication

### Send OTP

This service sends an OTP to the user. The caller of this service have to send the channel in which the OTP will be sent. Based on the application ID, the corresponding channel's recipient address will be found out and the OTP is send accordingly. Note: At this point of time, no Auth Token will be generated.

#### Resource URL

`POST https://{base_url}/v1/authmanager/authenticate/sendotp`

#### Resource details

| Resource Details        | Description  |
| ----------------------- | ------------ |
| Response format         | JSON Message |
| Requires Authentication | No           |

#### Parameters

| Name              | Required | Description                                                                                                                                                                                                    | Default Value              | Example                  |
| ----------------- | -------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------- | ------------------------ |
| userid            | Yes      | This is the userid of the user. Based on the useridtype, this will vary.                                                                                                                                       | NA                         | M392380                  |
| otpchannel        | Yes      | This is the channel in which the OTP will be sent. It is an array of the enumeration {"email", "phone"}. If the channel is not found, ChannelNotSupported error will be sent back                              | NA                         | phone                    |
| useridtype        | Yes      | This field is the user id type. It should be one the {"UIN", "USERID"}. Based on the combination of "appid" and "useridtype" the system identifies from which system to pickup the channel's recipient address | NA                         | USERID                   |
| appid             | Yes      | This is the application ID of the caller of this service. It should be on of the {"preregistration", "registrationclient", "registrationprocessor", "ida", "admin", "resident"}                                | NA                         | preregistration          |
| templateVariables | No       | This is the map of custom template variables                                                                                                                                                                   | NA                         | {"UIN":"2530192395"}     |
| context           | Yes      | This shows the purpose of the sending otp like Login, notification, etc.                                                                                                                                       | "auth-otp" for default OTP | auth-otp, auth-login-otp |

#### Example Request

```
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

#### Example Response

**Success Response**

```
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

**Error Response**

1. Invalid Channel: This is the error response in case if the channel is not valid.

```
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

1. Multiple channels not supported: In case, if the caller can send only one channel, then this error will be sent. For example, Pre-Registration module cannot have multiple channels.

```
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

1. User not found: If the passed is not found in the system.

```
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

1. Channel path not found: If the channel's path is not found. For example, if the channel is email and the email ID is not found for that user.

```
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

### Authenticate using userID and OTP

This service authenticates the use ID and the OTP. If the authentication is successful, an AuthToken will be sent in the Response header.

#### Resource URL

`POST https://{base_url}/v1/authmanager/authenticate/useridOTP`

#### Resource details

| Resource Details        | Description                      |
| ----------------------- | -------------------------------- |
| Response format         | Response Header and JSON Message |
| Requires Authentication | No                               |

#### Parameters

| Name   | Required | Description                                                                                                  | Default Value | Example |
| ------ | -------- | ------------------------------------------------------------------------------------------------------------ | ------------- | ------- |
| userid | Yes      | This is the userid of the user against which the OTP had been sent. Based on the useridtype, this will vary. | NA            | M392380 |
| otp    | Yes      | This is OTP which is sent to the userid's preferred channel                                                  | NA            | 6473    |

#### Example Request

```
{
  "id": "string",
  "metadata": {},
  "request": {
    "appId": "admin",
    "clientId": "mosip-admin-client",
    "clientSecret": "xyz123",
    "password": "mosip",
    "userName": "110006"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

#### Example Response

**Success Response**

```
Response Cookie:

Set-Cookie →Authorization=Mosip-TokeneyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJpbmRpdmlkdWFsIiwibW9iaWxlIjoiOTY2MzE3NTkyOCIsIm1haWwiOiJpbmRpdmlkdWFsQGdtYWlsLmNvbSIsInJvbGUiOiJwZXJzb24iLCJpYXQiOjE1NTEzNDU1NjUsImV4cCI6MTU1MTM1MTU2NX0.pCyibViXo31enOgRD60BnKjEpEA-78yzbWnZGChxCIZ5lTpYnhgm-0dtoT3neFebTJ8eAI7-o8jDWMCMqq6uSw; Max-Age=6000000; Expires=Wed, 08-May-2019 19:59:43 GMT; Path=/; Secure; HttpOnly
```

```
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

#### Error Responses

1. Invalid OTP: If the passed OTP is not valid.

```
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

1. Expired OTP: If the passed OTP is expired.

```
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

### Authenticate using username and password

This service will authenticate the username and password.

#### Resource URL

`https://{base_url}/v1/authmanager/authenticate/internal/useridPwd`

#### Resource details

| Resource Details        | Description                      |
| ----------------------- | -------------------------------- |
| Response format         | Response Header and JSON Message |
| Requires Authentication | No                               |

#### Parameters

| Name     | Required | Description                                                                                                                                                                     | Default Value | Example         |
| -------- | -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------- | --------------- |
| username | Yes      | This is the username of the user.                                                                                                                                               | NA            | M392380         |
| password | Yes      | This is the password of the user.                                                                                                                                               | NA            | ADGDAGADFF      |
| appid    | Yes      | This is the application ID of the caller of this service. It should be on of the {"preregistration", "registrationclient", "registrationprocessor", "ida", "admin", "resident"} | NA            | preregistration |

#### Example Request

```
{
  "id": "string",
  "metadata": {},
  "request": {
    "appId": "admin",
    "clientId": "mosip-admin-client",
    "clientSecret": "xyz123",
    "password": "mosip",
    "userName": "110006"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

#### Example Response

**Success Response**

```
{
  "id": "string",
  "version": "string",
  "responsetime": "2021-01-06T05:52:26.667Z",
  "metadata": null,
  "response": {
    "token": "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJyanpjdUZPTmpBLWZRRDZYVVpYeFlldk5UZWtYcnZKVXN1RG5TeHJjZ0tZIn0.eyJqdGkiOiJkZDRhMjEwOS02MjVmLTRjYmItOWIzNy1iMzkxNzFjNzMyMTIiLCJleHAiOjE2MDk5NDgzNDYsIm5iZiI6MCwiaWF0IjoxNjA5OTEyMzQ2LCJpc3MiOiJodHRwczovL3FhMi5tb3NpcC5uZXQva2V5Y2xvYWsvYXV0aC9yZWFsbXMvbW9zaXAiLCJhdWQiOiJhY2NvdW50Iiwic3ViIjoiMjM0ZWM5M2YtNmFmZC00N2JkLTk0MmEtM2Q1NDFiNzQ2YmU0IiwidHlwIjoiQmVhcmVyIiwiYXpwIjoibW9zaXAtYWRtaW4tY2xpZW50IiwiYXV0aF90aW1lIjowLCJzZXNzaW9uX3N0YXRlIjoiMzk4YTZiMjktNWMyOS00YzdiLTg3MWQtZjQ2MzU0MjMwMjk1IiwiYWNyIjoiMSIsImFsbG93ZWQtb3JpZ2lucyI6WyJodHRwczovL3FhMi5tb3NpcC5uZXQiXSwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbIlJFR0lTVFJBVElPTl9BRE1JTiIsIlJFR0lTVFJBVElPTl9PRkZJQ0VSIiwiUkVHSVNUUkFUSU9OX1NVUEVSVklTT1IiLCJaT05BTF9BRE1JTiIsIlJFU0lERU5UIiwib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiIsIkdMT0JBTF9BRE1JTiIsIklORElWSURVQUwiXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6ImVtYWlsIHByb2ZpbGUiLCJlbWFpbF92ZXJpZmllZCI6ZmFsc2UsIm5hbWUiOiJUZXN0MTEwMDA2IEF1dG8xMTAwMDYiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiIxMTAwMDYiLCJnaXZlbl9uYW1lIjoiVGVzdDExMDAwNiIsImZhbWlseV9uYW1lIjoiQXV0bzExMDAwNiIsImVtYWlsIjoiMTEwMDA2QHh5ei5jb20ifQ.lA9U1PP4gMAQxnLmM9AACv8tR4Y48ixkZDalNrkeA8LXcZxvAEr3f9ETb3OwYfVUIDk-soG44PrEVOvzV8gMYFWaL7UaD6djk9OciPzebyzB-nLzjPfDYm3a6AmP1y62Wplqd_p_lfGqpGt0_CAKweMlLpKAExu9XYe6cArtWjZzjIKkun_kiPuFdJyYeRNWY4Fj1Z7y-TijmihD1XPH4QRNxmv-prSNCUt9d4RElhMWB-xaPEhxcaSgQVnmbPdeF_wBIbBvUAuye2iaXlZ3AcETQHm5wJIO_0Wfh-7Dj24sB9QkjZWHTq62l2AgjN-t-jPp3mf3hyhUJVttzl2wmA",
    "message": "Username and password combination had been validated successfully",
    "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICIyMDA1NWFmYS1mNDRkLTQ2ZWItYjFhZC03NzdlOTBjN2ZlYmMifQ.eyJqdGkiOiIyNmRlOWMyMy02MTVhLTRhZDQtOWYxMC05MmMxZTljOWU4MzgiLCJleHAiOjE2MDk5NDgzNDYsIm5iZiI6MCwiaWF0IjoxNjA5OTEyMzQ2LCJpc3MiOiJodHRwczovL3FhMi5tb3NpcC5uZXQva2V5Y2xvYWsvYXV0aC9yZWFsbXMvbW9zaXAiLCJhdWQiOiJodHRwczovL3FhMi5tb3NpcC5uZXQva2V5Y2xvYWsvYXV0aC9yZWFsbXMvbW9zaXAiLCJzdWIiOiIyMzRlYzkzZi02YWZkLTQ3YmQtOTQyYS0zZDU0MWI3NDZiZTQiLCJ0eXAiOiJSZWZyZXNoIiwiYXpwIjoibW9zaXAtYWRtaW4tY2xpZW50IiwiYXV0aF90aW1lIjowLCJzZXNzaW9uX3N0YXRlIjoiMzk4YTZiMjktNWMyOS00YzdiLTg3MWQtZjQ2MzU0MjMwMjk1IiwicmVhbG1fYWNjZXNzIjp7InJvbGVzIjpbIlJFR0lTVFJBVElPTl9BRE1JTiIsIlJFR0lTVFJBVElPTl9PRkZJQ0VSIiwiUkVHSVNUUkFUSU9OX1NVUEVSVklTT1IiLCJaT05BTF9BRE1JTiIsIlJFU0lERU5UIiwib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiIsIkdMT0JBTF9BRE1JTiIsIklORElWSURVQUwiXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6ImVtYWlsIHByb2ZpbGUifQ.EKBfxRRfRiPMf6mKQINwgmblvRfRkAjviIddfncEZ2o",
    "expiryTime": 36000,
    "userId": null,
    "status": "success",
    "refreshExpiryTime": 36000
  },
  "errors": null
}
```

**Error Responses**

1. Invalid credentials: If the passed credentials is not correct.

```
{
  "id": "string",
  "version": "string",
  "responsetime": "2021-01-06T05:54:39.952Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-ATH-023",
      "message": "Invalid Credentials"
    }
  ]
}
```

1. Invalid application ID: If the passed in application is not correct.

```
{
  "id": "string",
  "version": "string",
  "responsetime": "2021-01-06T05:55:11.849Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-ATH-026",
      "message": "Realm not found:: admin11"
    }
  ]
}
```

### Authenticate using clientid and secret key

This service will authenticate the clientid and secret key. When an application try to call any service in the MOSIP system, the call have to be authenticated and authorized. For example, when Pre-registration application calls some master service, the call have to be authenticated first. This call can facilitate the call. The clientid would have provided to the caller application before hand using another procedure. So, before making this call, the caller application have to have the clientid and the secret key.

#### Resource URL

`POST https://{base_url}/v1/authmanager/authenticate/clientidsecretkey`

#### Resource details

| Resource Details        | Description                      |
| ----------------------- | -------------------------------- |
| Response format         | Response Header and JSON Message |
| Requires Authentication | No                               |

#### Parameters

| Name      | Required | Description                                                                                | Default Value | Example                |
| --------- | -------- | ------------------------------------------------------------------------------------------ | ------------- | ---------------------- |
| clientid  | Yes      | This is the client id, provided to the caller application upfront.                         | NA            | D72HJDF8               |
| secretkey | Yes      | This is the secret key which was provided to the application corresponding to the clientid | NA            | JSlj8p789sdfjhlsJKDHFS |

#### Example Request

```
{
  "id": "string",
  "metadata": {},
  "request": {
    "appId": "admin",
    "clientId": "mosip-abis-client",
    "secretKey": "abc123"
  },
  "requesttime": "2018-12-10T06:12:52.994Z",
  "version": "string"
}
```

#### Example Response

**Success Response**

```
Response Cookie:

Set-Cookie 
authorization: eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJyanpjdUZPTmpBLWZRRDZYVVpYeFlldk5UZWtYcnZKVXN1RG5TeHJjZ0tZIn0.eyJqdGkiOiI2Yzg0ZDMyNi04NjZhLTRmZTQtOGJiMy02NGY0YWVjNmZiZDAiLCJleHAiOjE2MDk5NDg3NTAsIm5iZiI6MCwiaWF0IjoxNjA5OTEyNzUwLCJpc3MiOiJodHRwczovL3FhMi5tb3NpcC5uZXQva2V5Y2xvYWsvYXV0aC9yZWFsbXMvbW9zaXAiLCJhdWQiOiJhY2NvdW50Iiwic3ViIjoiODdmMDU3NjQtNzg5ZC00ZTZiLTljMWUtYzU2YmJkYzI5NTYzIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoibW9zaXAtYWJpcy1jbGllbnQiLCJhdXRoX3RpbWUiOjAsInNlc3Npb25fc3RhdGUiOiJiNjZjMjBiMy03OTY1LTQ0ZDUtODg3Ny00Zjk2MDNlNzI5OTEiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbImh0dHBzOi8vcWEyLm1vc2lwLm5ldCJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7Im1vc2lwLWFiaXMtY2xpZW50Ijp7InJvbGVzIjpbInVtYV9wcm90ZWN0aW9uIl19LCJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6ImVtYWlsIHByb2ZpbGUiLCJjbGllbnRJZCI6Im1vc2lwLWFiaXMtY2xpZW50IiwiY2xpZW50SG9zdCI6IjEwLjI0NC4zLjM1IiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJzZXJ2aWNlLWFjY291bnQtbW9zaXAtYWJpcy1jbGllbnQiLCJjbGllbnRBZGRyZXNzIjoiMTAuMjQ0LjMuMzUifQ.ntez3ZkbDsjWi467JVj9d3kfktbUc7e6zQhHv0bVJfmiQA0N1QGyXAiZdqZrHj3cgFo0Lft54jgEtCGZZAma8nAw9IDICet9TA2A_u5hZ3oAq6HwYMS1pWb43jx5K9RRr_Yc-hdNnma754KzHhJgU1A7e_y0m88MT_oohHpRQ16jItEfC0AUQUvOAsxPwn-mmhu4uFFEq9e05ftBDIEBr24t-8feWN92uCJVMrSYHHjFL2ayg03I4Zkw1IupfLa-HACIlIToUmAk00aPxLtyWMFpOHVcLKBS2i9gEeqCEiUzklwuEp0B4aCqk5_M-Ng2X6VcGsCUJ8ACWRG4lCQQYA 
```

```
{
  "id": "string",
  "version": "string",
  "responsetime": "2021-01-06T05:59:10.695Z",
  "metadata": null,
  "response": {
    "status": "Success",
    "message": "Clientid and Token combination had been validated successfully"
  },
  "errors": null
}
```

**Error Responses**

1. Invalid credentials: If the passed credentials is not correct.

```
{
  "id": "string",
  "version": "string",
  "responsetime": "2021-01-06T06:00:17.962Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "500",
      "message": "401 Unauthorized"
    }
  ]
}
```

1. Incorrect Application ID: If wrong application ID is passed

```
{
  "id": "string",
  "version": "string",
  "responsetime": "2021-01-06T06:00:45.374Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-ATH-026",
      "message": "Realm not found:: adminXX"
    }
  ]
}
```

## Authorization

### Validate token

This service checks the validity of the Auth token.

#### Resource URL

`GET https://{base_url}/v1/authmanager/authorize/admin/validateToken`

#### Resource detail

| Resource Details        | Description                                                                                |
| ----------------------- | ------------------------------------------------------------------------------------------ |
| Response format         | The response will be sent in the Response Header and also a JSON message will be returned. |
| Requires Authentication | no                                                                                         |

#### Parameters

| Name          | Required | Description                            | Default Value | Example                                                                                                                                                           |
| ------------- | -------- | -------------------------------------- | ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Authorization | Yes      | AuthToken passed in the request cookie |               | Mosip-TokeneyeyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiJiMDhmODZhZi0zNWRhLTQ4ZjItOGZhYi1jZWYzOTA0NjYwYmQifQ.-xN\_h82PHVTCMA9vdoHrcZxH-x5mb11y1537t3rGzcM |

#### Example Request

```
Request Cookie:
authorization: eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJyanpjdUZPTmpBLWZRRDZYVVpYeFlldk5UZWtYcnZKVXN1RG5TeHJjZ0tZIn0.eyJqdGkiOiIxZmUxYjQxNS1kY2NjLTQ2NmQtYTc5My03MTI5MGYzYmNmM2IiLCJleHAiOjE2MDk5NDc5ODgsIm5iZiI6MCwiaWF0IjoxNjA5OTExOTg4LCJpc3MiOiJodHRwczovL3FhMi5tb3NpcC5uZXQva2V5Y2xvYWsvYXV0aC9yZWFsbXMvbW9zaXAiLCJhdWQiOiJhY2NvdW50Iiwic3ViIjoiODdmMDU3NjQtNzg5ZC00ZTZiLTljMWUtYzU2YmJkYzI5NTYzIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoibW9zaXAtYWJpcy1jbGllbnQiLCJhdXRoX3RpbWUiOjAsInNlc3Npb25fc3RhdGUiOiIyZjc1YjdkZS0zMjJkLTRjOGUtYmE4Yi0xNmI4M2UzMTYyMmIiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbImh0dHBzOi8vcWEyLm1vc2lwLm5ldCJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7Im1vc2lwLWFiaXMtY2xpZW50Ijp7InJvbGVzIjpbInVtYV9wcm90ZWN0aW9uIl19LCJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6ImVtYWlsIHByb2ZpbGUiLCJjbGllbnRJZCI6Im1vc2lwLWFiaXMtY2xpZW50IiwiY2xpZW50SG9zdCI6IjEwLjI0NC4zLjM1IiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJzZXJ2aWNlLWFjY291bnQtbW9zaXAtYWJpcy1jbGllbnQiLCJjbGllbnRBZGRyZXNzIjoiMTAuMjQ0LjMuMzUifQ.mQncxuxncDlvkCY6YxrC9DK3ACx27ArjzGMuKUjLl9Z4qPKdyio9zMPiZdCiOgEp75ctmoG5iIEVmeYZnNgv05enxaGHBqAmGC3S9-X_QeWA3bSSIjvpSh0w9hnSlLDN5UoYxnM9uSshGAfaCmJffbwKNqIMgOQxk4AdsGErTaUo8nf_Ugn76GTHH5iJb7mALuoqHgpYsr_lZfn5_N53B-NRdY_EjZ58fPdBFP9wPaJqmmTEfn4gDYvp_dB6vYD0l0MQVi_5CsBmqdQYgspH2m3DH9gtgdkbb3Wo84U0j-CwMgtIz2CTpCv3Ds_4r13XGgd7TIjLKQ2BhCxZ1G-KGg 
```

#### Example Response

**Success Response**

```
{
  "id": null,
  "version": null,
  "responsetime": "2021-01-06T05:47:46.359Z",
  "metadata": null,
  "response": {
    "userId": "service-account-mosip-abis-client",
    "mobile": null,
    "mail": null,
    "langCode": null,
    "userPassword": null,
    "name": "service-account-mosip-abis-client",
    "role": "offline_access,uma_authorization,",
    "token": "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJyanpjdUZPTmpBLWZRRDZYVVpYeFlldk5UZWtYcnZKVXN1RG5TeHJjZ0tZIn0.eyJqdGkiOiIxZmUxYjQxNS1kY2NjLTQ2NmQtYTc5My03MTI5MGYzYmNmM2IiLCJleHAiOjE2MDk5NDc5ODgsIm5iZiI6MCwiaWF0IjoxNjA5OTExOTg4LCJpc3MiOiJodHRwczovL3FhMi5tb3NpcC5uZXQva2V5Y2xvYWsvYXV0aC9yZWFsbXMvbW9zaXAiLCJhdWQiOiJhY2NvdW50Iiwic3ViIjoiODdmMDU3NjQtNzg5ZC00ZTZiLTljMWUtYzU2YmJkYzI5NTYzIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoibW9zaXAtYWJpcy1jbGllbnQiLCJhdXRoX3RpbWUiOjAsInNlc3Npb25fc3RhdGUiOiIyZjc1YjdkZS0zMjJkLTRjOGUtYmE4Yi0xNmI4M2UzMTYyMmIiLCJhY3IiOiIxIiwiYWxsb3dlZC1vcmlnaW5zIjpbImh0dHBzOi8vcWEyLm1vc2lwLm5ldCJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7Im1vc2lwLWFiaXMtY2xpZW50Ijp7InJvbGVzIjpbInVtYV9wcm90ZWN0aW9uIl19LCJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6ImVtYWlsIHByb2ZpbGUiLCJjbGllbnRJZCI6Im1vc2lwLWFiaXMtY2xpZW50IiwiY2xpZW50SG9zdCI6IjEwLjI0NC4zLjM1IiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJzZXJ2aWNlLWFjY291bnQtbW9zaXAtYWJpcy1jbGllbnQiLCJjbGllbnRBZGRyZXNzIjoiMTAuMjQ0LjMuMzUifQ.mQncxuxncDlvkCY6YxrC9DK3ACx27ArjzGMuKUjLl9Z4qPKdyio9zMPiZdCiOgEp75ctmoG5iIEVmeYZnNgv05enxaGHBqAmGC3S9-X_QeWA3bSSIjvpSh0w9hnSlLDN5UoYxnM9uSshGAfaCmJffbwKNqIMgOQxk4AdsGErTaUo8nf_Ugn76GTHH5iJb7mALuoqHgpYsr_lZfn5_N53B-NRdY_EjZ58fPdBFP9wPaJqmmTEfn4gDYvp_dB6vYD0l0MQVi_5CsBmqdQYgspH2m3DH9gtgdkbb3Wo84U0j-CwMgtIz2CTpCv3Ds_4r13XGgd7TIjLKQ2BhCxZ1G-KGg",
    "rid": null
  },
  "errors": null
}
```

**Error Responses**

1. Invalid Token: If the passed token is not correct.

```
{
  "id": null,
  "version": null,
  "responsetime": "2021-01-06T05:45:34.203Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-ATH-401",
      "message": "Authentication Failed : Invalid Token :Token verification failed"
    }
  ]
}
```

1. Cookie is empty: If the cookie is not set

```
{
  "id": null,
  "version": null,
  "responsetime": "2021-01-06T05:56:46.127Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-ATH-006",
      "message": "Cookies are empty"
    }
  ]
}
```

### Invalidate token

This service invalidates the token

#### Resource URL

`POST https://{base_url}/v1/authmanager/authorize/invalidateToken`

#### Resource details

| Resource Details        | Description                      |
| ----------------------- | -------------------------------- |
| Response format         | Response Cookie and JSON Message |
| Requires Authentication | No                               |

#### Parameters

| Name          | Required | Description                            | Default Value | Example                                                                                                                                              |
| ------------- | -------- | -------------------------------------- | ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| Authorization | Yes      | AuthToken passed in the request cookie |               | eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiJiMDhmODZhZi0zNWRhLTQ4ZjItOGZhYi1jZWYzOTA0NjYwYmQifQ.-xN\_h82PHVTCMA9vdoHrcZxH-x5mb11y1537t3rGzcM |

#### Example Request

```
Request Cookie:
Authorization=Mosip-TokeneyeyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VySWQiOiJiMDhmODZhZi0zNWRhLTQ4ZjItOGZhYi1jZWYzOTA0NjYwYmQifQ.-xN_h82PHVTCMA9vdoHrcZxH-x5mb11y1537t3rGzcM 
```

#### Example Response

**Success Response**

```
{
  "id": "mosip.authorize.invalidatetoken",
  "ver": "1.0",
  "responsetime": "2007-12-03T10:15:30Z",
  "response": {
    "message":"Token invalidated successfully"
  }	
}
```

**Error Responses**

1. Empty Cookie: If the passed Cookie is empty.

```
{
  "id": null,
  "version": null,
  "responsetime": "2021-01-06T05:56:46.127Z",
  "metadata": null,
  "response": null,
  "errors": [
    {
      "errorCode": "KER-ATH-006",
      "message": "Cookies are empty"
    }
  ]
}
```

## OTP services

### Generate OTP

The OTP Generator component will receive a request to generate OTP, validate if the OTP generation request is from an authorized source, call OTP generator API with the input parameters (Key), receive the OTP from the OTP generator API which is generated based on the OTP generation policy and respond to the source with the OTP.

The OTP Generator can also reject a request from a blocked/frozen account and assign a validity to each OTP that is generated, based on the defined policy

#### Resource URL

`POST https://{base_url}/v1/otpmanager/otp/generate`

#### Resource details

| Resource Details        | Description  |
| ----------------------- | ------------ |
| Response format         | JSON Message |
| Requires Authentication | No           |

#### Parameters

| Name | Required | Description                            | Default Value | Example |
| ---- | -------- | -------------------------------------- | ------------- | ------- |
| key  | Yes      | AuthToken passed in the request header |               |         |

#### Example Request

```
{
  "id": "mosip.otp.generateOTP",
  "version":"1.0",	
  "requesttime":"2007-12-03T10:15:30Z",
  "request": {
    "key": "9820173642"
  }
}
```

#### Example Response

**Success Response**

```
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

**Error Responses**

NA

### Validate OTP

This component facilitates basic validation of an OTP.

This includes: Receiving a request for OTP validation with required input parameters (Key), Validating the pattern of OTP generated based on defined policy, validating if the OTP is active/inactive and responding to the source with a response (Valid/Invalid)

This component also facilitates deletion of every successfully validated OTP when consumed and freezing an account for exceeding the number of retries/wrong input of OTP.

#### Resource URL

`https://dev-test.southindia.cloudapp.azure.com/v1/otpmanager/otp/validate?key=87637740607&otp=123456`

#### Resource details

| Resource Details        | Description  |
| ----------------------- | ------------ |
| Response format         | JSON Message |
| Requires Authentication | no           |

#### Parameters

| Name | Required | Description                            | Default Value | Example    |
| ---- | -------- | -------------------------------------- | ------------- | ---------- |
| Key  | Yes      | AuthToken passed in the request header | NA            | 9820173642 |
| otp  | Yes      | OTP which was sent to the user         | NA            | 849004     |

#### Example Request

NA

#### Example Response

**Success Response**

```
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

**Error Responses**

1. Invalid OTP: If the passed OTP is not correct.

```
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

1. OTP Expired: If the passed OTP had been expired.

```
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
