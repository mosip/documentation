# Pre Registration APIs

This section details about the service API in the Pre-Registration modules.

* [Login Service](Pre-Registration-APIs.md#login-service-public)
* [Demographic Service](Pre-Registration-APIs.md#demographic-service-public)
* [Document Service](Pre-Registration-APIs.md#document-service-public)
* [DataSync Service](Pre-Registration-APIs.md#datasync-service-external)
* [Booking Service](Pre-Registration-APIs.md#booking-service-public)
* [BatchJob Service](Pre-Registration-APIs.md#batchjob-service-private)
* [Generate QR code service](Pre-Registration-APIs.md#generate-qr-code-service-public)
* [Notification Service](Pre-Registration-APIs.md#notification-service-public)
* [Transliteration Service](Pre-Registration-APIs.md#transliteration-service-public)
* [Captcha Service](Pre-Registration-APIs.md#captcha-service-public)

{% hint style="info" %}
**Note:** The id, version and requesttime in request and responsetime in response bodies are optional fields and not consumed by pre-registration application unless defined. Though we need to pass these as part of the request, it should not be tested. Few of the error messages are intended for API consumer, who are mostly SI and developers. User friendly messages need to be mapped in the UI reference implementation.
{% endhint %}

{% hint style="info" %}
**API testing Prerequisites**

* Generate a Authorization Token by using following Kernel AuthManager APIs
  * To send an OTP [/authmanager/sendOTPUsingPOST](AuthN-and-AuthZ-APIs.md#generate-otp)
  * To validate the OTP [/authmanager/userIdOTPUsingPOST](AuthN-and-AuthZ-APIs.md#validate-otp) Once OTP get validate successfully you will get the Authorization token.
* Use this Authorization token in the every request header of all pre-registration APIs.
{% endhint %}

## Login Service (Public)

This service details used by Pre-Registration portal to authenticate user by sending OTP to the user, validating with userid and OTP.

* [POST /login/sendOtp](Pre-Registration-APIs.md#post-loginsendotp)
* [POST /login/validateOtp](Pre-Registration-APIs.md#post-loginvalidateotp)
* [POST /login/invalidateToken](Pre-Registration-APIs.md#post-logininvalidatetoken)
* [GET /login/config](Pre-Registration-APIs.md#get-loginconfig)
* [GET /login/refreshconfig](Pre-Registration-APIs.md#get-loginrefreshconfig)

### POST /login/sendOtp

This request will send the OTP to the requested user in the preferred channel(sms/email)

#### Resource URL

`https://{base_url}/preregistration/v1/login/sendOtp`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | No          |

#### Request Part Parameters

| Name           | Required | Description                                           | Comment                              |
| -------------- | -------- | ----------------------------------------------------- | ------------------------------------ |
| id             | Yes      | id                                                    | mosip.pre-registration.login.sendotp |
| version        | Yes      | version of the application                            | 1.0                                  |
| requesttime    | Yes      | Time of the request                                   | 2019-01-16T05:23:08.019Z             |
| request        | Yes      | Request for the application                           |                                      |
| request.userid | Yes      | user id of the applicant(mobile number/email address) | 8907654778                           |

#### For SMS

**Request for SMS**

```
{
  "id": "mosip.pre-registration.login.sendotp",
  "version": "1.0",
  "requesttime": "2019-05-14T07:24:47.605Z",
  "request": {
    "userId": "8907654778"
  }
}
```

**Responses for SMS**

**Success Response**

**Status code**: 200

**Description**: OTP sent successfully to specified channel

```
{
  "id": "mosip.pre-registration.login.sendotp",
  "version": "1.0",
  "responsetime": "2019-06-03T06:41:46.796Z",
  "response": {
    "message": "Sms Request Sent",
    "status": "success"
  },
  "errors": null
}
```

#### For Email

**Request for Email**

```
{
  "id": "mosip.pre-registration.login.sendotp",
  "version": "1.0",
  "requesttime": "2019-05-14T07:24:47.605Z",
  "request": {
	"userId": "info@mosip.io"
  }
}
```

**Responses for Email**

**Success Response**

**Status code**: 200

**Description**: OTP sent successfully to specified channel

```
{
  "id": "mosip.pre-registration.login.sendotp",
  "version": "1.0",
  "responsetime": "2019-06-03T06:41:46.796Z",
  "response": {
    "message": "Email Request submitted",
    "status": "success"
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: Invalid parameters

```
{
  "id": "mosip.pre-registration.login.sendotp",
  "version": "1.0",
  "responsetime": "2019-05-14T16:46:39.582Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_AUTH_001",
      "message": "OTP failed to send through a specified channel"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                       | Error Description                       |
| ------------------- | ----------------------------------- | --------------------------------------- |
| PRG\_PAM\_LGN\_008  | Invalid Request userId received     | if requested userId is empty or invalid |
| PRG\_PAM\_CORE\_001 | Request id is invalid               | Invalid or empty Request Id             |
| PRG\_PAM\_CORE\_002 | Request version is invalid          | Invalid or empty Request version        |
| PRG\_PAM\_CORE\_003 | Invalid request time                | Empty Request time                      |
| PRG\_CORE\_REQ\_013 | Request date should be current date | If request date is not current date     |

### POST /login/validateOtp

This request will validate the OTP with respect to userid and provide the authorize token in the browser cookies.

#### Resource URL

`https://{base_url}/preregistration/v1/login/validateOtp`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | No          |

#### Request Part Parameters

| Name           | Required | Description                                            | Comment                                |
| -------------- | -------- | ------------------------------------------------------ | -------------------------------------- |
| id             | Yes      | id                                                     | mosip.pre-registration.login.useridotp |
| version        | Yes      | version of the application                             | 1.0                                    |
| requesttime    | Yes      | Time of the request                                    | 2019-01-16T05:23:08.019Z               |
| request        | Yes      | Request for the application                            |                                        |
| request.userid | Yes      | user id of the applicant (mobile number/email address) | 8907654778                             |
| request.OTP    | Yes      | received OTP                                           | 345674                                 |

#### Request

```
{
  "id": "mosip.pre-registration.login.useridotp",
  "version": "1.0",
  "requesttime": "2019-06-03T08:28:04.783Z",
  "request": {
    "otp": "345674",
    "userId": "8907654778"
  }
}
```

#### Responses

**Success Response**

**Status code**: 200

**Description**: sms sent successfully

```
{
  "id": "mosip.pre-registration.login.useridotp",
  "version": "1.0",
  "responsetime": "2019-06-03T06:47:10.838Z",
  "response": {
    "message": "VALIDATION_SUCCESSFUL",
    "status": "success"
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: Invalid parameters

```
{
  "id": "mosip.pre-registration.login.useridotp",
  "version": "1.0",
  "responsetime": "2019-06-03T18:03:12.305Z",
  "response": null,
  "errors": [
    {
      "errorCode": "KER-OTV-005",
      "message": "Validation can't be performed against this key. Generate OTP first."
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                                                           | Error Description                                          |
| ------------------- | ----------------------------------------------------------------------- | ---------------------------------------------------------- |
| KER-ATH-003         | User Detail doesn't exist.                                              | If userId is empty or invalid                              |
| KER-OTV-003         | OTP can't be empty or null.                                             | If otp field is empty or null                              |
| KER-OTV-004         | OTP consists of only numeric characters. No other characters is allowed | If otp contains character other than numeric               |
| PRG\_PAM\_CORE\_001 | Request id is invalid                                                   | Invalid or empty Request Id                                |
| PRG\_PAM\_CORE\_002 | Request version is invalid                                              | Invalid or empty Request version                           |
| PRG\_PAM\_CORE\_003 | Invalid request time                                                    | Empty Request time                                         |
| PRG\_CORE\_REQ\_013 | Request date should be current date                                     | If request date is not current date                        |
| PRG\_PAM\_LGN\_013  | VALIDATION\_UNSUCCESSFUL                                                | If incorrect otp is entered                                |
| PRG\_PAM\_LGN\_014  | Token is not present in the header                                      | When token does not come from kernel service in the header |

### POST /login/invalidateToken

This request will invalidate the authorization token when force logout is done.

#### Resource URL

`https://{base_url}/preregistration/v1/login/invalidateToken`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Token invalidated successfully

```
{
  "id": "mosip.pre-registration.login.invalidate",
  "version": "1.0",
  "responsetime": "2019-05-16T09:37:04.941Z",
  "response": {
    "message": "Token has been invalidated successfully",
    "status": "success"
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: Token is not present in cookies

```
{
  "id": "mosip.pre-registration.login.invalidate",
  "version": "1.0",
  "responsetime": "2019-06-14T08:41:17.156Z",
  "response": null,
  "errors": [
    {
      "errorCode": "KER-ATH-007",
      "message": "Token is not present in cookies"
    }
  ]
}
```

#### Other Failure details

| Error Code  | Error Message                                                | Error Description                      |
| ----------- | ------------------------------------------------------------ | -------------------------------------- |
| KER-ATH-008 | Token is not present in datastore, Please try with new token | If token is not present in datastore   |
| KER-ATH-006 | Cookies are empty                                            | When no Cookie is passed in the header |

### GET /login/config

This request will load the configuration parameters while loading the pre-registration portal page.

{% hint style="info" %}
All the values are retrieving from the pre-registration config properties file. If any value get changed in the config properties file it will get reflected in the response of this API. Following mentioned response is the sample of that.
{% endhint %}

#### Resource URL

`https://{base_url}/preregistration/v1/login/config`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | No          |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Config parameter retrieved sucessfully

```
{
  "id": "mosip.pre-registration.login.config",
  "version": "1.0",
  "responsetime": "2019-05-14T16:01:20.534Z",
  "response": {
    "mosip.kernel.otp.default-length": "6",
    "mosip.id.validation.identity.postalCode": "^[(?i)A-Z0-9]{5}$",
    "mosip.left_to_right_orientation": "eng,fra",
    "preregistration.recommended.centers.locCode": "5",
    "mosip.kernel.otp.validation-attempt-threshold": "10",
    "mosip.country.code": "MOR",
    "mosip.primary-language": "fra",
    "preregistration.timespan.cancel": "1",
    "mosip.default.dob.month": "01",
    "mosip.preregistration.auto.logout.timeout": "60",
    "preregistration.availability.noOfDays": "5",
    "mosip.kernel.otp.expiry-time": "180",
    "mosip.id.validation.identity.dateOfBirth": "^\\d{4}/([0]\\d|1[0-2])/([0-2]\\d|3[01])$",
    "mosip.supported-languages": "eng,ara,fra",
    "preregistration.workflow.documentupload": "true/false",
    "preregistration.workflow.demographic": "true/false",
    "preregistration.documentupload.allowed.file.nameLength": "50",
    "mosip.id.validation.identity.postalCode.length": "5",
    "mosip.kernel.sms.number.length": "10",
    "preregistration.availability.sync": "6",
    "mosip.id.validation.identity.email.length": "50",
    "preregistration.timespan.rebook": "1",
    "mosip.id.validation.identity.email": "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$",
    "mosip.id.validation.identity.age": "^(150|1[0-4][0-9]|[1-9]?[0-9])$",
    "mosip.id.validation.identity.referenceIdentityNumber": "^([0-9]{10,30})$",
    "mosip.right_to_left_orientation": "ara",
    "mosip.kernel.pin.length": "6",
    "mosip.id.validation.identity.phone": "^([6-9]{1})([0-9]{9})$",
    "preregistration.workflow.booking": "true/false",
    "mosip.preregistration.auto.logout.ping": "30 ",
    "mosip.id.validation.identity.referenceIdentityNumber.length": "30",
    "mosip.id.validation.identity.fullName.[*].value": "^(?=.{0,50}$).*",
    "mosip.id.validation.identity.addressLine1.[*].value": "^(?=.{0,50}$).*",
    "mosip.login.mode": "email,mobile",
    "mosip.id.validation.identity.phone.length": "10",
    "mosip.preregistration.auto.logout.idle": "180",
    "preregistration.auto.logout": "10",
    "mosip.secondary-language": "ara",
    "preregistration.nearby.centers": "2000",
    "preregistration.documentupload.allowed.file.size": "1000000",
    "mosip.default.dob.day": "01",
    "preregistration.booking.offset": "1",
    "preregistration.documentupload.allowed.file.type": "application/pdf,image/jpeg,image/png,image/gif"
  },
  "errors": null
}
```

#### Other Failure details

| Error Code     | Error Message                              | Error Description                              |
| -------------- | ------------------------------------------ | ---------------------------------------------- |
| PRG\_AUTH\_012 | Config file not found in the config server | If config file is missing in the config server |

### GET /login/refreshconfig

This request will reload the configuration parameters.

{% hint style="info" %}
When ever there is change in the property file, then this rest end point should be called manually,so that the property get reflected.
{% endhint %}

#### Resource URL

`https://{base_url}/preregistration/v1/login/refreshconfig`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | No          |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Config parameter retrieved sucessfully

```
{
  "id": "mosip.pre-registration.login.config",
  "version": "1.0",
  "responsetime": "2019-08-08T07:43:45.908Z",
  "response": "success",
  "errors": null
} 
```

#### Other Failure details

| Error Code     | Error Message                              | Error Description                              |
| -------------- | ------------------------------------------ | ---------------------------------------------- |
| PRG\_AUTH\_012 | Config file not found in the config server | If config file is missing in the config server |

## Demographic Service (public)

This service details used by Pre-Registration portal to maintain the demographic data by providing his/her basic details.

* [POST /applications](Pre-Registration-APIs.md#post-applications)
* [PUT /applications/{preRegistrationId}](Pre-Registration-APIs.md#put-applicationspreRegistrationid)
* [GET /applications/{preRegistrationId}](Pre-Registration-APIs.md#get-applicationspreRegistrationid)
* [GET /applications/status/{preRegistrationId}](Pre-Registration-APIs.md#get-applicationsstatuspreRegistrationid)
* [GET /applications](Pre-Registration-APIs.md#get-applications)
* [DELETE /applications/{preRegistrationId}](Pre-Registration-APIs.md#delete-applicationspreRegistrationid)

### POST /applications

This request is used to create new pre-registration with demographic details, which generates pre-registration id and associates it with demographic details.

#### Resource URL

`https://{base_url}/preregistration/v1/applications`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                                                        | Required | Description                                     | Comment                                        |
| ----------------------------------------------------------- | -------- | ----------------------------------------------- | ---------------------------------------------- |
| id                                                          | Yes      | Id of the application                           | mosip.pre-registration.demographic.create      |
| version                                                     | Yes      | version of the application                      | 1.0                                            |
| requesttime                                                 | Yes      | Request time of the application                 | 2019-01-16T05:23:08.019Z                       |
| request                                                     | Yes      | Request for the application                     |                                                |
| request.langCode                                            | Yes      | primary language code                           | value will be derived from UI                  |
| request.demographicDetails                                  | Yes      | demographicDetails of the applicant             |                                                |
| request.demographicDetails.identity                         | Yes      | identity of the applicant                       |                                                |
| request.demographicDetails.identity.gender                  | Yes      | gender of the applicant                         | value will be derived from the domain metadata |
| request.demographicDetails.identity.city                    | Yes      | city of the applicant                           | value will be derived from the domain metadata |
| request.demographicDetails.identity.phone                   | Optional | mobile number of the applicant                  |                                                |
| request.demographicDetails.identity.IDSchemaVersion         | Optional | id schema version                               | 1                                              |
| request.demographicDetails.identity.fullName                | Yes      | full name of the applicant                      |                                                |
| request.demographicDetails.identity.dateOfBirth             | Yes      | date of birth of the applicant                  |                                                |
| request.demographicDetails.identity.email                   | Optional | email Id of the applicant                       |                                                |
| request.demographicDetails.identity.province                | Yes      | province of the applicant                       | value will be derived from the domain metadata |
| request.demographicDetails.identity.postalCode              | Yes      | postal code of the applicant                    |                                                |
| request.demographicDetails.identity.addressLine1            | Yes      | address Line 1 of the applicant                 |                                                |
| request.demographicDetails.identity.addressLine2            | Optional | address Line 2 of the applicant                 |                                                |
| request.demographicDetails.identity.addressLine3            | Optional | address Line 3 of the applicant                 |                                                |
| request.demographicDetails.identity.region                  | Yes      | region of the applicant                         | value will be derived from the domain metadata |
| request.demographicDetails.identity.residenceStatus         | Yes      | residence status of the applicant               | value will be derived from the domain metadata |
| request.demographicDetails.identity.zone                    | Yes      | zone of the applicant                           | value will be derived from the domain metadata |
| request.demographicDetails.identity.referenceIdentityNumber | Yes      | referenceIdentityNumber Number of the applicant |                                                |

#### Request

```
{
  "id": "mosip.pre-registration.demographic.create",
  "version": "1.0",
  "request": {
    "langCode": "eng",
    "demographicDetails": {
      "identity": {
        "IDSchemaVersion": 1,
        "fullName": [
          {
            "language": "eng",
            "value": "Puja Thakur"
          },
          {
            "language": "ara",
            "value": "پُجَ تهَكُر"
          }
        ],
        "dateOfBirth": "1996/01/01",
        "gender": [
          {
            "language": "eng",
            "value": "MLE"
          },
          {
            "language": "ara",
            "value": "MLE"
          }
        ],
        "addressLine1": [
          {
            "language": "eng",
            "value": "Green olive villa"
          },
          {
            "language": "ara",
            "value": "گرِِن ُلِڤِ ڤِللَ"
          }
        ],
        "residenceStatus": [
          {
            "language": "eng",
            "value": "FR"
          },
          {
            "language": "ara",
            "value": "FR"
          }
        ],
        "addressLine2": [
          {
            "language": "eng",
            "value": "22 ananda reddy Layout"
          },
          {
            "language": "ara",
            "value": "٢٢ َنَندَ رِددي لَيُُت"
          }
        ],
        "addressLine3": [
          {
            "language": "eng",
            "value": ""
          },
          {
            "language": "ara",
            "value": ""
          }
        ],
        "region": [
          {
            "language": "eng",
            "value": "RSK"
          },
          {
            "language": "ara",
            "value": "RSK"
          }
        ],
        "province": [
          {
            "language": "eng",
            "value": "KTA"
          },
          {
            "language": "ara",
            "value": "KTA"
          }
        ],
        "city": [
          {
            "language": "eng",
            "value": "KNT"
          },
          {
            "language": "ara",
            "value": "KNT"
          }
        ],
        "zone": [
          {
            "language": "eng",
            "value": "BNMR"
          },
          {
            "language": "ara",
            "value": "BNMR"
          }
        ],
        "postalCode": "14022",
        "phone":"9999999999",
        "email": "mosip@gmail.com",
        "referenceIdentityNumber": "12312312312312"
      }
    }
  },
  "requesttime": "2019-08-19T11:18:48.393Z"
}
```

#### Responses

**Success Response**

**Status code**: 200

**Description**: Pre-Registration successfully Created

```
{
  "id": "mosip.pre-registration.demographic.create",
  "version": "1.0",
  "responsetime": "2019-08-19T11:18:51.326Z",
  "response": {
    "preRegistrationId": "46537143845798",
    "createdDateTime": "2019-08-19T11:18:51.281Z",
    "statusCode": "Pending_Appointment",
    "langCode": "eng",
    "demographicDetails": {
      "identity": {
        "gender": [
          {
            "language": "eng",
            "value": "MLE"
          },
          {
            "language": "ara",
            "value": "MLE"
          }
        ],
        "city": [
          {
            "language": "eng",
            "value": "KNT"
          },
          {
            "language": "ara",
            "value": "KNT"
          }
        ],
        "postalCode": "14022",
        "fullName": [
          {
            "language": "eng",
            "value": "Puja Thakur"
          },
          {
            "language": "ara",
            "value": "پُجَ تهَكُر"
          }
        ],
        "dateOfBirth": "1996/01/01",
        "referenceIdentityNumber": "12312312312312",
        "phone":"9999999999",
        "email": "mosip@mosip.io",
        "IDSchemaVersion": 1,
        "province": [
          {
            "language": "eng",
            "value": "KTA"
          },
          {
            "language": "ara",
            "value": "KTA"
          }
        ],
        "zone": [
          {
            "language": "eng",
            "value": "BNMR"
          },
          {
            "language": "ara",
            "value": "BNMR"
          }
        ],
        "addressLine1": [
          {
            "language": "eng",
            "value": "Green olive villa"
          },
          {
            "language": "ara",
            "value": "گرِِن ُلِڤِ ڤِللَ"
          }
        ],
        "residenceStatus": [
          {
            "language": "eng",
            "value": "FR"
          },
          {
            "language": "ara",
            "value": "FR"
          }
        ],
        "addressLine2": [
          {
            "language": "eng",
            "value": "22 ananda reddy Layout"
          },
          {
            "language": "ara",
            "value": "٢٢ َنَندَ رِددي لَيُُت"
          }
        ],
        "addressLine3": [
          {
            "language": "eng",
            "value": ""
          },
          {
            "language": "ara",
            "value": ""
          }
        ],
        "region": [
          {
            "language": "eng",
            "value": "RSK"
          },
          {
            "language": "ara",
            "value": "RSK"
          }
        ]
      }
    }
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: invalid or empty request id

```
{
  "id": "mosip-registration.demographic.create",
  "version": "1.0",
  "responsetime": "2019-05-20T05:52:20.435Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_CORE_001",
      "message": "Request id is invalid"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                                                    | Error Description                                                                                   |
| ------------------- | ---------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| PRG\_PAM\_CORE\_002 | Request version is invalid                                       | Invalid or empty Request version                                                                    |
| PRG\_PAM\_CORE\_003 | Invalid request time                                             | Empty Request time                                                                                  |
| PRG\_CORE\_REQ\_013 | Request date should be current date                              | If request date is not current date                                                                 |
| PRG\_CORE\_REQ\_014 | Lang code is invalid                                             | when language code is invalid or empty                                                              |
| PRG\_PAM\_CORE\_011 | encryption failed                                                | encryption of demographic data failed                                                               |
| PRG\_PAM\_APP\_007  | json parsing is failed                                           | demographic json parsing failed                                                                     |
| PRG\_PAM\_CORE\_010 | hashing failed                                                   | demographic data hashing failed                                                                     |
| PRG\_PAM\_CORE\_012 | decryption failes                                                | decryption of demographic data failed                                                               |
| PRG\_PAM\_APP\_020  | Rest call to get prid failed                                     | Service call to get Prid failed                                                                     |
| PRG\_PAM\_APP\_021  | Duplicate key for prid                                           | Failure of unique key constrains                                                                    |
| KER-IOV-005         | Missing input parameter - identity/fullName                      | If fullName attribute is not found in the identity request                                          |
| KER-IOV-005         | Missing input parameter - identity/dateOfBirth\|identity/age     | If dateOfBirth attribute is not found in the identity request                                       |
| KER-IOV-005         | Missing input parameter - identity/gender                        | If gender attribute is not found in the identity request                                            |
| KER-IOV-005         | Missing input parameter - identity/residenceStatus               | If residenceStatus attribute is not found in the identity request                                   |
| KER-IOV-005         | Missing input parameter - identity/addressLine1                  | If addressLine1 attribute is not found in the identity request                                      |
| KER-IOV-005         | Missing input parameter - identity/region                        | If region attribute is not found in the identity request                                            |
| KER-IOV-005         | Missing input parameter - identity/zone                          | If zone attribute is not found in the identity request                                              |
| KER-IOV-005         | Missing input parameter - identity/province                      | If province attribute is not found in the identity request                                          |
| KER-IOV-005         | Missing input parameter - identity/city                          | If city attribute is not found in the identity request                                              |
| KER-IOV-005         | Missing input parameter - identity/postalCode                    | If postalCode attribute is not found in the identity request                                        |
| KER-IOV-005         | Missing input parameter - identity/referenceIdentityNumber       | If referenceIdentityNumber attribute is not found in the identity request                           |
| KER-IOV-004         | Invalid input parameter - identity/phone                         | If phone attribute is found but it's value is empty or invalid                                      |
| KER-IOV-004         | Invalid input parameter - identity/email                         | If email attribute is found but it's value is empty or invalid                                      |
| KER-IOV-004         | Invalid input parameter - identity/fullName/{\*}/language        | If language code is empty or invalid in the specified position(\*) inside fullName attribute        |
| KER-IOV-004         | Invalid input parameter - identity/dateOfBirth                   | If dateOfBirth value is empty or invalid                                                            |
| KER-IOV-004         | Invalid input parameter - identity/gender/{\*}/language          | If language code is empty or invalid in the specified position(\*) inside gender attribute          |
| KER-IOV-004         | Invalid input parameter - identity/gender/{\*}/value             | If value is empty or invalid in the specified position(\*) inside gender attribute                  |
| KER-IOV-004         | Invalid input parameter - identity/addressLine1/{\*}/language    | If language code is empty or invalid in the specified position(\*) inside addressLine1 attribute    |
| KER-IOV-004         | Invalid input parameter - identity/addressLine2/{\*}/language    | If language code is empty or invalid in the specified position(\*) inside addressLine2 attribute    |
| KER-IOV-004         | Invalid input parameter - identity/addressLine3/{\*}/language    | If language code is empty or invalid in the specified position(\*) inside addressLine3 attribute    |
| KER-IOV-004         | Invalid input parameter - identity/residenceStatus/{\*}/language | If language code is empty or invalid in the specified position(\*) inside residenceStatus attribute |
| KER-IOV-004         | Invalid input parameter - identity/region/{\*}/language          | If language code is empty or invalid in the specified position(\*) inside region attribute          |
| KER-IOV-004         | Invalid input parameter - identity/region/{\*}/value             | If value is empty or invalid in the specified position(\*) inside region attribute                  |
| KER-IOV-004         | Invalid input parameter - identity/province/{\*}/language        | If language code is empty or invalid in the specified position(\*) inside province attribute        |
| KER-IOV-004         | Invalid input parameter - identity/province/{\*}/value           | If value is empty or invalid in the specified position(\*) inside province attribute                |
| KER-IOV-004         | Invalid input parameter - identity/city/{\*}/language            | If language code is empty or invalid in the specified position(\*) inside city attribute            |
| KER-IOV-004         | Invalid input parameter - identity/city/{\*}/value               | If value is empty or invalid in the specified position(\*) inside city attribute                    |
| KER-IOV-004         | Invalid input parameter - identity/zone/{\*}/language            | If language code is empty or invalid in the specified position(\*) inside zone attribute            |
| KER-IOV-004         | Invalid input parameter - identity/zone/{\*}/value               | If value is empty or invalid in the specified position(\*) inside zone attribute                    |
| KER-IOV-004         | Invalid input parameter - identity/postalCode                    | If postalCode is empty or invalid                                                                   |
| KER-IOV-004         | Invalid input parameter - identity/referenceIdentityNumber       | If referenceIdentityNumber is empty or invalid                                                      |

### PUT /applications/{preRegistrationId}

This request is used to update pre-registration's demographic details by providing pre-registration id in the path parameter and updated demographic details in request body.

#### Resource URL

`https://{base_url}/preregistration/v1/applications/{preRegistrationId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name              | Required | Description                            | Comment        |
| ----------------- | -------- | -------------------------------------- | -------------- |
| preRegistrationId | Yes      | pre-registration id of the application | 64269837502851 |

#### Request Body Parameters

| Name                                                        | Required | Description                                     | Comment                                        |
| ----------------------------------------------------------- | -------- | ----------------------------------------------- | ---------------------------------------------- |
| id                                                          | Yes      | Id of the application                           | mosip.pre-registration.demographic.create      |
| version                                                     | Yes      | version of the application                      | 1.0                                            |
| requesttime                                                 | Yes      | Request time of the application                 | 2019-01-16T05:23:08.019Z                       |
| request                                                     | Yes      | Request for the application                     |                                                |
| request.langCode                                            | Yes      | primary language code                           | value will be derived from UI                  |
| request.demographicDetails                                  | Yes      | demographicDetails of the applicant             |                                                |
| request.demographicDetails.identity                         | Yes      | identity of the applicant                       |                                                |
| request.demographicDetails.identity.gender                  | Yes      | gender of the applicant                         | value will be derived from the domain metadata |
| request.demographicDetails.identity.city                    | Yes      | city of the applicant                           | value will be derived from the domain metadata |
| request.demographicDetails.identity.phone                   | Optional | mobile number of the applicant                  |                                                |
| request.demographicDetails.identity.IDSchemaVersion         | Optional | id schema version                               | 1                                              |
| request.demographicDetails.identity.fullName                | Yes      | full name of the applicant                      |                                                |
| request.demographicDetails.identity.dateOfBirth             | Yes      | date of birth of the applicant                  |                                                |
| request.demographicDetails.identity.email                   | Optional | email Id of the applicant                       |                                                |
| request.demographicDetails.identity.province                | Yes      | province of the applicant                       | value will be derived from the domain metadata |
| request.demographicDetails.identity.postalCode              | Yes      | postal code of the applicant                    |                                                |
| request.demographicDetails.identity.addressLine1            | Yes      | address Line 1 of the applicant                 |                                                |
| request.demographicDetails.identity.addressLine2            | Optional | address Line 2 of the applicant                 |                                                |
| request.demographicDetails.identity.addressLine3            | Optional | address Line 3 of the applicant                 |                                                |
| request.demographicDetails.identity.region                  | Yes      | region of the applicant                         | value will be derived from the domain metadata |
| request.demographicDetails.identity.residenceStatus         | Yes      | residence status of the applicant               | value will be derived from the domain metadata |
| request.demographicDetails.identity.zone                    | Yes      | zone of the applicant                           | value will be derived from the domain metadata |
| request.demographicDetails.identity.referenceIdentityNumber | Yes      | referenceIdentityNumber Number of the applicant |                                                |

#### Request

```
{
  "id": "mosip.pre-registration.demographic.update",
  "version": "1.0",
  "request": {
    "langCode": "eng",
    "demographicDetails": {
      "identity": {
        "IDSchemaVersion": 1,
        "fullName": [
          {
            "language": "eng",
            "value": "Puja Thakur"
          },
          {
            "language": "ara",
            "value": "پُجَ تهَكُر"
          }
        ],
        "dateOfBirth": "1996/01/01",
        "gender": [
          {
            "language": "eng",
            "value": "MLE"
          },
          {
            "language": "ara",
            "value": "MLE"
          }
        ],
        "addressLine1": [
          {
            "language": "eng",
            "value": "Green olive villa"
          },
          {
            "language": "ara",
            "value": "گرِِن ُلِڤِ ڤِللَ"
          }
        ],
        "residenceStatus": [
          {
            "language": "eng",
            "value": "FR"
          },
          {
            "language": "ara",
            "value": "FR"
          }
        ],
        "addressLine2": [
          {
            "language": "eng",
            "value": "22 ananda reddy Layout"
          },
          {
            "language": "ara",
            "value": "٢٢ َنَندَ رِددي لَيُُت"
          }
        ],
        "addressLine3": [
          {
            "language": "eng",
            "value": ""
          },
          {
            "language": "ara",
            "value": ""
          }
        ],
        "region": [
          {
            "language": "eng",
            "value": "RSK"
          },
          {
            "language": "ara",
            "value": "RSK"
          }
        ],
        "province": [
          {
            "language": "eng",
            "value": "KTA"
          },
          {
            "language": "ara",
            "value": "KTA"
          }
        ],
        "city": [
          {
            "language": "eng",
            "value": "KNT"
          },
          {
            "language": "ara",
            "value": "KNT"
          }
        ],
        "zone": [
          {
            "language": "eng",
            "value": "BNMR"
          },
          {
            "language": "ara",
            "value": "BNMR"
          }
        ],
        "postalCode": "14022",
        "phone":"9999999999",
        "email": "mosip@mosip.io",
        "referenceIdentityNumber": "12312312312312"
      }
    }
  },
  "requesttime": "2019-08-19T11:18:48.393Z"
}
```

#### Responses

**Success Response**

**Status code**: 200

**Description**: Pre-Registration demographic details successfully updated

```
{
  "id": "mosip.pre-registration.demographic.update",
  "version": "1.0",
  "responsetime": "2019-08-19T11:18:51.326Z",
  "response": {
    "preRegistrationId": "46537143845798",
    "createdDateTime": "2019-08-19T11:18:51.281Z",
    "statusCode": "Pending_Appointment",
    "langCode": "eng",
    "demographicDetails": {
      "identity": {
        "gender": [
          {
            "language": "eng",
            "value": "MLE"
          },
          {
            "language": "ara",
            "value": "MLE"
          }
        ],
        "city": [
          {
            "language": "eng",
            "value": "KNT"
          },
          {
            "language": "ara",
            "value": "KNT"
          }
        ],
        "postalCode": "14022",
        "fullName": [
          {
            "language": "eng",
            "value": "Puja Thakur"
          },
          {
            "language": "ara",
            "value": "پُجَ تهَكُر"
          }
        ],
        "dateOfBirth": "1996/01/01",
        "referenceIdentityNumber": "12312312312312",
        "IDSchemaVersion": 1,
        "province": [
          {
            "language": "eng",
            "value": "KTA"
          },
          {
            "language": "ara",
            "value": "KTA"
          }
        ],
        "zone": [
          {
            "language": "eng",
            "value": "BNMR"
          },
          {
            "language": "ara",
            "value": "BNMR"
          }
        ],
        "addressLine1": [
          {
            "language": "eng",
            "value": "Green olive villa"
          },
          {
            "language": "ara",
            "value": "گرِِن ُلِڤِ ڤِللَ"
          }
        ],
        "residenceStatus": [
          {
            "language": "eng",
            "value": "FR"
          },
          {
            "language": "ara",
            "value": "FR"
          }
        ],
        "addressLine2": [
          {
            "language": "eng",
            "value": "22 ananda reddy Layout"
          },
          {
            "language": "ara",
            "value": "٢٢ َنَندَ رِددي لَيُُت"
          }
        ],
        "addressLine3": [
          {
            "language": "eng",
            "value": ""
          },
          {
            "language": "ara",
            "value": ""
          }
        ],
        "region": [
          {
            "language": "eng",
            "value": "RSK"
          },
          {
            "language": "ara",
            "value": "RSK"
          }
        ],
        "phone": "9999999999",
        "email": "mosip@mosip.io"
      }
    }
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: Invalid preregistration id(non-empty) or data is not found for that preregistration id.

```
{
  "id": "mosip.pre-registration.demographic.update",
  "version": "1.0",
  "responsetime": "2019-05-20T06:31:35.160Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_APP_005",
      "message": "No data found for the requested pre-registration id"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                                                    | Error Description                                                                                   |
| ------------------- | ---------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| PRG\_PAM\_CORE\_001 | Request id is invalid                                            | Invalid or empty Request Id                                                                         |
| PRG\_PAM\_CORE\_002 | Request version is invalid                                       | Invalid or empty Request version                                                                    |
| PRG\_PAM\_CORE\_003 | Invalid request time                                             | Empty Request time                                                                                  |
| PRG\_CORE\_REQ\_013 | Request date should be current date                              | If request date is not current date                                                                 |
| PRG\_PAM\_CORE\_011 | encryption failed                                                | encryption of demographic data failed                                                               |
| PRG\_PAM\_APP\_007  | json parsing is failed                                           | demographic json parsing failed                                                                     |
| PRG\_PAM\_CORE\_010 | hashing failed                                                   | demographic data hashing failed                                                                     |
| PRG\_PAM\_CORE\_012 | decryption failes                                                | decryption of demographic data failed                                                               |
| PRG\_PAM\_APP\_017  | Requested preregistration id does not belong to the user         | when the user tries to access another user's demographic data                                       |
| KER-IOV-005         | Missing input parameter - identity/fullName                      | If fullName attribute is not found in the identity request                                          |
| KER-IOV-005         | Missing input parameter - identity/dateOfBirth\|identity/age     | If dateOfBirth attribute is not found in the identity request                                       |
| KER-IOV-005         | Missing input parameter - identity/gender                        | If gender attribute is not found in the identity request                                            |
| KER-IOV-005         | Missing input parameter - identity/residenceStatus               | If residenceStatus attribute is not found in the identity request                                   |
| KER-IOV-005         | Missing input parameter - identity/addressLine1                  | If addressLine1 attribute is not found in the identity request                                      |
| KER-IOV-005         | Missing input parameter - identity/region                        | If region attribute is not found in the identity request                                            |
| KER-IOV-005         | Missing input parameter - identity/zone                          | If zone attribute is not found in the identity request                                              |
| KER-IOV-005         | Missing input parameter - identity/province                      | If province attribute is not found in the identity request                                          |
| KER-IOV-005         | Missing input parameter - identity/city                          | If city attribute is not found in the identity request                                              |
| KER-IOV-005         | Missing input parameter - identity/postalCode                    | If postalCode attribute is not found in the identity request                                        |
| KER-IOV-005         | Missing input parameter - identity/referenceIdentityNumber       | If referenceIdentityNumber attribute is not found in the identity request                           |
| KER-IOV-004         | Invalid input parameter - identity/phone                         | If phone attribute is found but it's value is empty or invalid                                      |
| KER-IOV-004         | Invalid input parameter - identity/email                         | If email attribute is found but it's value is empty or invalid                                      |
| KER-IOV-004         | Invalid input parameter - identity/fullName/{\*}/language        | If language code is empty or invalid in the specified position(\*) inside fullName attribute        |
| KER-IOV-004         | Invalid input parameter - identity/dateOfBirth                   | If dateOfBirth value is empty or invalid                                                            |
| KER-IOV-004         | Invalid input parameter - identity/gender/{\*}/language          | If language code is empty or invalid in the specified position(\*) inside gender attribute          |
| KER-IOV-004         | Invalid input parameter - identity/gender/{\*}/value             | If value is empty or invalid in the specified position(\*) inside gender attribute                  |
| KER-IOV-004         | Invalid input parameter - identity/addressLine1/{\*}/language    | If language code is empty or invalid in the specified position(\*) inside addressLine1 attribute    |
| KER-IOV-004         | Invalid input parameter - identity/addressLine2/{\*}/language    | If language code is empty or invalid in the specified position(\*) inside addressLine2 attribute    |
| KER-IOV-004         | Invalid input parameter - identity/addressLine3/{\*}/language    | If language code is empty or invalid in the specified position(\*) inside addressLine3 attribute    |
| KER-IOV-004         | Invalid input parameter - identity/residenceStatus/{\*}/language | If language code is empty or invalid in the specified position(\*) inside residenceStatus attribute |
| KER-IOV-004         | Invalid input parameter - identity/region/{\*}/language          | If language code is empty or invalid in the specified position(\*) inside region attribute          |
| KER-IOV-004         | Invalid input parameter - identity/region/{\*}/value             | If value is empty or invalid in the specified position(\*) inside region attribute                  |
| KER-IOV-004         | Invalid input parameter - identity/province/{\*}/language        | If language code is empty or invalid in the specified position(\*) inside province attribute        |
| KER-IOV-004         | Invalid input parameter - identity/province/{\*}/value           | If value is empty or invalid in the specified position(\*) inside province attribute                |
| KER-IOV-004         | Invalid input parameter - identity/city/{\*}/language            | If language code is empty or invalid in the specified position(\*) inside city attribute            |
| KER-IOV-004         | Invalid input parameter - identity/city/{\*}/value               | If value is empty or invalid in the specified position(\*) inside city attribute                    |
| KER-IOV-004         | Invalid input parameter - identity/zone/{\*}/language            | If language code is empty or invalid in the specified position(\*) inside zone attribute            |
| KER-IOV-004         | Invalid input parameter - identity/zone/{\*}/value               | If value is empty or invalid in the specified position(\*) inside zone attribute                    |
| KER-IOV-004         | Invalid input parameter - identity/postalCode                    | If postalCode is empty or invalid                                                                   |
| KER-IOV-004         | Invalid input parameter - identity/referenceIdentityNumber       | If referenceIdentityNumber is empty or invalid                                                      |

### GET /applications/{preRegistrationId}

This request is used to retrieve Pre-Registration demographic data by pre-Registration id provided in request path parameter.

#### Resource URL

`https://{base_url}/preregistration/v1/applications/{preRegistrationId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name              | Required | Description           | Comment        |
| ----------------- | -------- | --------------------- | -------------- |
| preRegistrationId | Yes      | Id of the application | 32042841521591 |

#### Responses

**Success Response:**

**Status code**: 200

**Description**: Demographic data successfully retrieved

```
{
  "id": "mosip.pre-registration.demographic.retrieve.details",
  "version": "1.0",
  "responsetime": "2019-05-20T06:33:08.516Z",
  "response": {
    "preRegistrationId": "32042841521591",
    "createdBy": "8754462073",
    "createdDateTime": "2019-05-20T06:25:00.262Z",
    "updatedBy": "8754462073",
    "updatedDateTime": "2019-05-20T06:30:37.900Z",
    "statusCode": "Pending_Appointment",
    "langCode": "fra",
    "demographicDetails": {
      "identity": {
        "referenceIdentityNumber": "9182345678456",
        "gender": [
          {
            "language": "fra",
            "value": "MLE"
          },
          {
            "language": "ara",
            "value": "MLE"
          }
        ],
        "city": [
          {
            "language": "fra",
            "value": "BNMR"
          },
          {
            "language": "ara",
            "value": "BNMR"
          }
        ],
        "postalCode": "56059",
        "fullName": [
          {
            "language": "fra",
            "value": "Rakesh P"
          },
          {
            "language": "ara",
            "value": "سهَسهَنك "
          }
        ],
        "zone": [
          {
            "language": "fra",
            "value": "14022"
          },
          {
            "language": "ara",
            "value": "14022"
          }
        ],
        "dateOfBirth": "1993/12/12",
        "IDSchemaVersion": 1,
        "province": [
          {
            "language": "fra",
            "value": "KTA"
          },
          {
            "language": "ara",
            "value": "KTA"
          }
        ],
        "phone": "9680958812",
        "addressLine1": [
          {
            "language": "fra",
            "value": "005-DS Max Silicon"
          },
          {
            "language": "ara",
            "value": "٠٠٥-دس مَكس سِلِكُن"
          }
        ],
        "residenceStatus": [
          {
            "language": "fra",
            "value": "NFR"
          },
          {
            "language": "ara",
            "value": "NFR"
          }
        ],
        "addressLine2": [
          {
            "language": "fra",
            "value": "Global Village"
          },
          {
            "language": "ara",
            "value": "گلُبَل ڤِللَگِ"
          }
        ],
        "addressLine3": [
          {
            "language": "fra",
            "value": "Karnataka"
          },
          {
            "language": "ara",
            "value": "كَرنَتَكَ"
          }
        ],
        "region": [
          {
            "language": "fra",
            "value": "RSK"
          },
          {
            "language": "ara",
            "value": "RSK"
          }
        ],
        "email": "rak@gmail.com"
      }
    }
  },
  "errors": null
}
```

**Failure Response**

**Status code**: '200'

**Description**: No data found for the requested pre-registration id(non-empty).

```
{
  "id": "mosip.pre-registration.demographic.retrieve.details",
  "version": "1.0",
  "responsetime": "2019-05-20T06:35:18.678Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_APP_005",
      "message": "No data found for the requested pre-registration id"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                                            | Error Description                                             |
| ------------------- | -------------------------------------------------------- | ------------------------------------------------------------- |
| PRG\_PAM\_CORE\_010 | hashing failed                                           | demographic data hashing failed                               |
| PRG\_PAM\_CORE\_012 | decryption failes                                        | decryption of demographic data failed                         |
| PRG\_PAM\_APP\_007  | json parsing is failed                                   | demographic json parsing failed                               |
| PRG\_PAM\_APP\_017  | Requested preregistration id does not belong to the user | when the user tries to access another user's demographic data |

### GET /applications/status/{preRegistrationId}

This request is used to retrieve pre-registration application status by providing the pre-registration id in request path parameter.

#### Resource URL

`https://{base_url}/preregistration/v1/applications/status/{preRegistrationId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameter

| Name              | Required | Description           | Comment        |
| ----------------- | -------- | --------------------- | -------------- |
| preRegistrationId | Yes      | Id of the application | 62076019780925 |

#### Responses

**Success Response**

**Status code**: 200

**Description**: All applications status fetched successfully

```
{
  "id": "mosip.pre-registration.demographic.retrieve.status",
  "version": "1.0",
  "responsetime": "2019-05-14T16:17:19.601Z",
  "response": {
    "preRegistartionId": "29810389154051",
    "statusCode": "Pending_Appointment"
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: No data found for the requested pre-registration id(non-empty).

```
{
  "id": "mosip.pre-registration.demographic.retrieve.status",
  "version": "1.0",
  "responsetime": "2019-05-14T16:17:34.330Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_APP_005",
      "message": "No data found for the requested pre-registration id"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                                            | Error Description                                             |
| ------------------- | -------------------------------------------------------- | ------------------------------------------------------------- |
| PRG\_PAM\_CORE\_010 | hashing failed                                           | demographic data hashing failed                               |
| PRG\_PAM\_APP\_017  | Requested preregistration id does not belong to the user | when the user tries to access another user's demographic data |

### GET /applications

This request is used to retrieve all Pre-Registration id, Full name in both language, Status Code, Document details(Only for Proof Of Address), Appointment details and Postal Code by user id from authorization token.

* [Without Pagination](Pre-Registration-APIs.md#without-pagination)
* [With Pagination](Pre-Registration-APIs.md#with-pagination)

#### Without pagination

if pageIndex parameter is not passed as query param, then all the demographic data for the user will be retrieved without applying pagination mechanism.

**Resource URL**

`https://{base_url}/preregistration/v1/applications`

**Resource details**

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

**Responses**

**Success Response**

**Status code**: 200

**Description**: All applications fetched successfully

```
{
  "id": "mosip.pre-registration.demographic.retrieve.basic",
  "version": "1.0",
  "responsetime": "2019-06-27T10:44:18.988Z",
  "response": {
    "basicDetails": [
      {
        "preRegistrationId": "26501647251326",
        "statusCode": "Pending_Appointment",
        "bookingMetadata": null,
        "demographicMetadata": {
          "proofOfAddress": null,
          "postalCode": "14022",
          "fullName": [
            {
              "language": "fra",
              "value": "jagadishwari"
            },
            {
              "language": "ara",
              "value": "جَگَدِسهوَرِ سِلڤَرَج"
            }
          ]
        }
      },
      {
        "preRegistrationId": "31601973604129",
        "statusCode": "Booked",
        "bookingMetadata": {
          "registration_center_id": "10003",
          "appointment_date": "2019-07-01",
          "time_slot_from": "14:15",
          "time_slot_to": "14:30"
        },
        "demographicMetadata": {
          "proofOfAddress": {
            "docCatCode": "POA",
            "docTypCode": "RNC",
            "docName": "Rajath.pdf",
            "langCode": "eng",
            "documentId": "ef51cd37-98c7-11e9-8fd2-6fbffb0a0035"
          },
          "postalCode": "14023",
          "fullName": [
            {
              "language": "eng",
              "value": "Rajath"
            },
            {
              "language": "ara",
              "value": "رَجَته"
            }
          ]
        }
      }
    ],
    "totalRecords": "2",
    "noOfRecords": "0",
    "pageIndex": "0"
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: No record found for the requested user id.

```
{
  "id": "mosip.pre-registration.demographic.retrieve.basic",
  "version": "1.0",
  "responsetime": "2019-05-20T07:12:37.316Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_APP_005",
      "message": "No record found for the requested user id"
    }
  ]
}
```

**Other Failure details**

| Error Code          | Error Message                                    | Error Description                                   |
| ------------------- | ------------------------------------------------ | --------------------------------------------------- |
| PRG\_PAM\_CORE\_010 | hashing failed                                   | demographic data hashing failed                     |
| PRG\_PAM\_CORE\_012 | decryption failed                                | decryption of demographic data failed               |
| PRG\_PAM\_APP\_007  | json parsing is failed                           | demographic json parsing failed                     |
| PRG\_PAM\_APP\_018  | Failed to read the identity json from the server | If the configured identity json file is unreachable |

#### With pagination

If pageIndex parameter is passed as query param, then all the demographic data for the user will be retrieved in terms of pages.

* PageSize parameter is configurable.
* PageIndex is by default 0 if no value is passed for query param.

**Resource URL**

`https://{base_url}/preregistration/v1/applications?pageIndex=0`

**Resource details**

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

**Request Query Parameter**

| Name      | Required | Description                   | Comment       |
| --------- | -------- | ----------------------------- | ------------- |
| pageIndex | Yes      | page index of the application | 0(By default) |

**Responses**

**Success Response**

**Status code**: 200

**Description**: All applications fetched successfully

```
{
  "id": "mosip.pre-registration.demographic.retrieve.basic",
  "version": "1.0",
  "responsetime": "2019-06-27T10:44:18.988Z",
  "response": {
    "basicDetails": [
      {
        "preRegistrationId": "26501647251326",
        "statusCode": "Pending_Appointment",
        "bookingMetadata": null,
        "demographicMetadata": {
          "proofOfAddress": null,
          "postalCode": "14022",
          "fullName": [
            {
              "language": "fra",
              "value": "jagadishwari"
            },
            {
              "language": "ara",
              "value": "جَگَدِسهوَرِ سِلڤَرَج"
            }
          ]
        }
      },
      {
        "preRegistrationId": "31601973604129",
        "statusCode": "Booked",
        "bookingMetadata": {
          "registration_center_id": "10003",
          "appointment_date": "2019-07-01",
          "time_slot_from": "14:15",
          "time_slot_to": "14:30"
        },
        "demographicMetadata": {
          "proofOfAddress": {
            "docCatCode": "POA",
            "docTypCode": "RNC",
            "docName": "Rajath.pdf",
            "langCode": "eng",
            "documentId": "ef51cd37-98c7-11e9-8fd2-6fbffb0a0035"
          },
          "postalCode": "14023",
          "fullName": [
            {
              "language": "eng",
              "value": "Rajath"
            },
            {
              "language": "ara",
              "value": "رَجَته"
            }
          ]
        }
      }
    ],
    "totalRecords": "2",
    "noOfRecords": "2",
    "pageIndex": "0"
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: No record found for the requested user id.

```
{
    "id": "mosip.pre-registration.demographic.retrieve.basic",
    "version": "1.0",
    "responsetime": "2019-05-20T07:12:37.316Z",
    "response": null,
    "errors": [
        {
            "errorCode": "PRG_PAM_APP_005",
            "message": "No record found for the requested user id"
        }
    ]
}
```

**Other Failure details**

| Error Code          | Error Message                                    | Error Description                                                       |
| ------------------- | ------------------------------------------------ | ----------------------------------------------------------------------- |
| PRG\_PAM\_APP\_016  | no record found for the requested page index     | if there is no more demographic data found for the requested page index |
| PRG\_PAM\_APP\_019  | Invalid page index value                         | If page index value is invalid                                          |
| PRG\_PAM\_APP\_015  | Page size must be greater than zero              | if page size is invalid or if it is defined 0 or less than 0 in config  |
| PRG\_PAM\_CORE\_010 | hashing failed                                   | demographic data hashing failed                                         |
| PRG\_PAM\_CORE\_012 | decryption failed                                | decryption of demographic data failed                                   |
| PRG\_PAM\_APP\_007  | json parsing is failed                           | demographic json parsing failed                                         |
| PRG\_PAM\_APP\_018  | Failed to read the identity json from the server | If the configured identity json file is unreachable                     |

### DELETE /applications/{preRegistrationId}

This request is used to discard the entire pre-registration details based pre-registration id provided in request path parameter.

#### Resource URL

`https://{base_url}/preregistration/v1/applications/{preRegistrationId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name              | Required | Description                            | Comment        |
| ----------------- | -------- | -------------------------------------- | -------------- |
| preRegistrationId | Yes      | pre-registration id of the application | 29605371807216 |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Deletion of individual is successfully

```
{
  "id": "mosip.pre-registration.demographic.delete",
  "version": "1.0",
  "errors": null,
  "responsetime": "2019-05-20T10:28:37.488Z",
  "response": [
    {
      "preRegistrationId": "29605371807216",
      "deletedBy": "9886442073",
      "deletedDateTime": "2019-05-20T10:28:37.485+0000"
    }
  ]
}
```

**Failure Response**

**Status code**: 200

**Description**: No data found for the requested pre-registration id(non-empty)

```
{
  "id": "mosip.pre-registration.demographic.delete",
  "version": "1.0",
  "responsetime": "2019-05-20T07:25:04.305Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_APP_005",
      "message": "No data found for the requested pre-registration id"
    }
  ]
}
```

#### Other Failure details

| Error Code         | Error Message                                            | Error Description                                                                         |
| ------------------ | -------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| PRG\_PAM\_APP\_003 | delete operation is not allowed                          | Deletion of Preregistration fails if its status is neither pending appointment nor booked |
| PRG\_PAM\_DOC\_016 | failed to delete the booking                             | If Booking data is failed to delete                                                       |
| PRG\_PAM\_APP\_004 | failed to delete the pre-registration data               | If Preregistration data is failed to delete                                               |
| PRG\_PAM\_APP\_017 | Requested preregistration id does not belong to the user | when the user tries to access another user's demographic data                             |

## Document Service (public)

This service enables Pre-Registration portal to request for uploading the document for a particular pre-registration. If any one upload file greater than specified size which is allowed by ngnix config; it will give 413 Request Entity Too Large error.

* [POST /documents/{preRegistrationId}](Pre-Registration-APIs.md#post-documentspreregistrationid)
* [PUT /documents/{preRegistrationId}](Pre-Registration-APIs.md#put-documentspreregistrationid)
* [GET /documents/preregistration/{preRegistrationId}](Pre-Registration-APIs.md#get-documentspreregistrationpreregistrationid)
* [GET /documents/{documentId}?preRegistrationId={preRegistrationId}](Pre-Registration-APIs.md#get-documentsdocumentidpreregistrationidpreregistrationid)
* [DELETE /documents/preregistration/{preRegistrationId}](Pre-Registration-APIs.md#delete-documentspreregistrationpreregsitrationid)
* [DELETE /documents/{documentId}?preRegistrationId={preRegistrationId}](Pre-Registration-APIs.md#delete-documentsdocumentidpreregistrationidpreregistrationid)

### POST /documents/{preRegistrationId}

This request is used to upload document with the metadata which include document category code, document type code and document format for a pre-registration Id.

{% hint style="info" %}
Document category code, document type code and language code are derived from kernel master data. Specification for the same can be found in [Document APIs](Document-APIs.md).
{% endhint %}

URL:

1. For valid Document category code refer below GET method for respective language code : /documentcategories/{langcode}
2. For valid Document type code refer below GET method for respective language and document category code: /documenttypes/{documentcategorycode}/{langcode}

#### Resource URL

`https://{base_url}/preregistration/v1/documents/{preRegistrationId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name              | Required | Description                            | Comment        |
| ----------------- | -------- | -------------------------------------- | -------------- |
| preRegistrationId | Yes      | Pre-registration id of the application | 32042841521591 |

#### Request Part Parameters

| Name | Required | Description                      | Comment |
| ---- | -------- | -------------------------------- | ------- |
| file | Yes      | Document which we need to upload |         |

#### Request Part (Document request) Parameters

| Name               | Required | Description                      | Comment                                |
| ------------------ | -------- | -------------------------------- | -------------------------------------- |
| id                 | Yes      | Id of the application            | mosip.pre-registration.document.upload |
| version            | Yes      | version of the application       | 1.0                                    |
| requesttime        | Yes      | Request tme of the application   | 2019-01-16T05:23:08.019Z               |
| request            | Yes      | Request for the application      |                                        |
| request.docCatCode | Yes      | Document category code           | POA                                    |
| request.docTypCode | Yes      | Document type code               | RNC                                    |
| request.langCode   | Yes      | Language code of the application | fra                                    |

#### Request

```
{
  "id": "mosip.pre-registration.document.upload",
  "version": "1.0",
  "requesttime": "2019-06-18T07:22:57.086Z",
  "request": {
    "docCatCode": "POA",
    "docTypCode": "RNC",
    "langCode": "fra"
  }
}
```

#### Responses

**Success Response**

**Status code**: 200

**Description**: Document uploaded successfully

```
{
  "id": "mosip.pre-registration.document.upload",
  "version": "1.0",
  "responsetime": "2019-06-18T10:03:15.828Z",
  "response": {
    "preRegistrationId": "63418297368795",
    "docId": "91a1e0ac-91af-11e9-a605-d9ae0e3774a9",
    "docName": "Doc.pdf",
    "docCatCode": "POA",
    "docTypCode": "RNC",
    "docFileFormat": "pdf"
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: Invalid document format supported

```
{
  "id": "mosip.pre-registration.document.upload",
  "version": "1.0",
  "responsetime": "2019-05-20T09:55:27.008Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_DOC_004",
      "message": "Invalid document format supported"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                                            | Error Description                                                           |
| ------------------- | -------------------------------------------------------- | --------------------------------------------------------------------------- |
| PRG\_PAM\_CORE\_001 | Request id is invalid                                    | Invalid or empty Request Id                                                 |
| PRG\_PAM\_CORE\_002 | Request version is invalid                               | Invalid or empty Request version                                            |
| PRG\_PAM\_CORE\_003 | Invalid request time                                     | Empty Request time                                                          |
| PRG\_CORE\_REQ\_013 | Request date should be current date                      | If request date is not current date                                         |
| PRG\_PAM\_DOC\_007  | Document exceeding permitted size                        | when uploaded document size is exceeding the configured size                |
| PRG\_CORE\_REQ\_018 | Document Catagory code is invalid                        | empty or invalid document category code                                     |
| PRG\_CORE\_REQ\_017 | Document type code is invalid                            | empty or invalid document type code                                         |
| PRG\_CORE\_REQ\_014 | Language code is invalid                                 | If language code is empty or invalid                                        |
| PRG\_PAM\_CORE\_011 | encryption failed                                        | encryption of document data failed                                          |
| PRG\_PAM\_DOC\_015  | Json exception                                           | document request json parsing failed                                        |
| PRG\_PAM\_CORE\_010 | hashing failed                                           | document data hashing failed                                                |
| PRG\_PAM\_DOC\_010  | Document virus scan failed                               | virus scan of uploaded document is failed                                   |
| PRG\_PAM\_APP\_005  | No data found for the requested pre-registration id      | invalid preregistration id or data is not found for that preregistration id |
| PRG\_PAM\_DOC\_012  | Document table not accessible                            | access to document table fails                                              |
| PRG\_PAM\_DOC\_009  | Document upload failed                                   | if the document & document details are failed to store                      |
| PRG\_PAM\_APP\_017  | Requested preregistration id does not belong to the user | when the user tries to access another user's demographic data               |

### PUT /documents/{preRegistrationId}

This request is used to copy the document from source pre-registration id to destination pre-registration id with the specified document category code.

#### Resource URL

`https://{base_url}/preregistration/v1/documents/{preRegistrationId}?catCode={doc_cat_code}&sourcePreId={preRegistrationId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name              | Required | Description                                        | Comment        |
| ----------------- | -------- | -------------------------------------------------- | -------------- |
| preRegistrationId | Yes      | Destination Pre-registration id of the application | 67531403498547 |

#### Request Query Parameters

| Name        | Required | Description                                   | Comment        |
| ----------- | -------- | --------------------------------------------- | -------------- |
| catCode     | Yes      | Document category code                        | POA            |
| sourcePreId | Yes      | Source Pre-registration id of the application | 97285429827016 |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Document successfully copied

```
{
  "id": "mosip.pre-registration.document.copy",
  "version": "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": {
    "preRegsitrationId": "67531403498547",
    "docId": "8196222-5fb0-11e9-rg3b-7d108980f456",
    "docName": "address.pdf",
    "docCatCode": "POA",
    "docTypCode": "RNC",
    "docFileFormat": "pdf"
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: If Document has not been uploaded for the source pre-registration Id(non-empty)

```
{
  "id": "mosip.pre-registration.document.copy",
  "version": "1.0",
  "responsetime": "2019-05-20T11:09:14.246Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_DOC_005",
      "message": "Documents is not found for the requested pre-registration id"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                                            | Error Description                                                                                                                                       |
| ------------------- | -------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| PRG\_CORE\_REQ\_001 | request parameter is missing                             | If source or destination preregistration id is empty                                                                                                    |
| PRG\_CORE\_REQ\_017 | Catagory code is invalid                                 | if document category code is not POA                                                                                                                    |
| PRG\_PAM\_APP\_005  | No data found for the requested pre-registration id      | If source preregistration id or destination preregistration id is invalid(non-empty) or no preregistration data found for any of the preregistration id |
| PRG\_PAM\_DOC\_012  | Document table not accessible                            | access to document table fails                                                                                                                          |
| PRG\_PAM\_DOC\_009  | Document upload failed                                   | if the document & document details are failed to store                                                                                                  |
| PRG\_PAM\_DOC\_011  | Document copy failed from source to destination          | when document is not copied from source to destination preregistration id                                                                               |
| PRG\_CORE\_REQ\_010 | hashing failed                                           | document data hashing failed                                                                                                                            |
| PRG\_PAM\_APP\_017  | Requested preregistration id does not belong to the user | when the user tries to access another user's demographic data                                                                                           |

### GET /documents/preregistration/{preRegistrationId}

This request used to retrieve all documents metadata associated with particular pre-registration.

#### Resource URL

`https://{base_url}/preregistration/v1/documents/preregistration/{preRegistrationId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name              | Required | Description                            | Comment        |
| ----------------- | -------- | -------------------------------------- | -------------- |
| preRegistrationId | Yes      | Pre-registration id of the application | 97285429827016 |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Documents retrieved successfully

```
{
  "id": "mosip.pre-registration.document.fetch.metadata",
  "version": "1.0",
  "responsetime": "2019-06-18T10:26:02.622Z",
  "response": {
    "documentsMetaData": [
      {
        "docName": "Doc.pdf",
        "documentId": "d4585c1e-91b1-11e9-a605-eb637a690b50",
        "docCatCode": "POA",
        "docTypCode": "RNC",
        "langCode": "fra"
      },
      {
        "docName": "Passport.pdf",
        "documentId": "6f036ecf-91b3-11e9-a605-cd68a2d40011",
        "docCatCode": "POI",
        "docTypCode": "CIN",
        "langCode": "fra"
      }
    ]
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: if pre-registration id is invalid(non-empty)

```
{
  "id": "mosip.pre-registration.document.fetch.metadata",
  "version": "1.0",
  "responsetime": "2019-05-20T11:17:54.743Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_APP_005",
      "message": "No data found for the requested pre-registration id"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                                                | Error Description                                                                            |
| ------------------- | ------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
| PRG\_PAM\_DOC\_012  | Document table not accessible                                | access to document table fails                                                               |
| PRG\_PAM\_DOC\_005  | Failed to fetch from File System server                      | if the document is failed to be fetched from file system                                     |
| PRG\_PAM\_CORE\_012 | decryption failes                                            | decryption of document data failed                                                           |
| PRG\_PAM\_CORE\_010 | hashing failed                                               | document data hashing failed                                                                 |
| PRG\_PAM\_APP\_017  | Requested preregistration id does not belong to the user     | when the user tries to access another user's demographic data                                |
| PRG\_PAM\_DOC\_005  | Documents is not found for the requested pre-registration id | when the document is not uploaded for the preregistration id                                 |
| PRG\_PAM\_APP\_005  | No data found for the requested pre-registration id          | When the application is deleted and trying to fetch the document of that pre-registration-id |

### GET /documents/{documentId}?preRegistrationId={preRegistrationId}

This request used to retrieve the document for a particular document id from the File System server.

#### Resource URL

`https://{base_url}/preregistration/v1/documents/{documentId}?preRegistrationId={preRegistrationId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name       | Required | Description                    | Comment                              |
| ---------- | -------- | ------------------------------ | ------------------------------------ |
| documentId | Yes      | document id of the application | 0748c439-4f83-11e9-ae3b-7b0aa1318f48 |

#### Request Query Parameters

| Name              | Required | Description                            | Comment        |
| ----------------- | -------- | -------------------------------------- | -------------- |
| preRegistrationId | Yes      | pre-registration id of the application | 74843948119371 |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Document successfully retrieved

```
{
  "id": "mosip.pre-registration.document.fetch.content",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response":{
    "document": "ByteArray"
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: if pre-registration id is invalid(non-empty)

```
{
  "id": "mosip.pre-registration.document.fetch.metadata",
  "version": "1.0",
  "responsetime": "2019-05-20T11:17:54.743Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_APP_005",
      "message": "No data found for the requested pre-registration id"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                                            | Error Description                                                                                                |
| ------------------- | -------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| PRG\_PAM\_DOC\_012  | Document table not accessible                            | access to document table fails                                                                                   |
| PRG\_PAM\_DOC\_005  | Failed to fetch from File System server                  | if the document is failed to be fetched from file system                                                         |
| PRG\_CORE\_REQ\_012 | decryption failed                                        | decryption of document data failed                                                                               |
| PRG\_CORE\_REQ\_010 | hashing failed                                           | document data hashing failed                                                                                     |
| PRG\_PAM\_APP\_017  | Requested preregistration id does not belong to the user | when the user tries to access another user's demographic data                                                    |
| PRG\_PAM\_DOC\_022  | DocumentId is not belongs to the pre-registration Id     | If document id is not related to the pre-registration id or if document is not found for the pre-registration id |

### DELETE /documents/preregistration/{preRegsitrationId}

This request used to delete all the documents which are associated with requested pre-registration id.

#### Resource URL

`https://{base_url}/preregistration/v1/documents/preregistration/{preRegistrationId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name              | Required | Description                            | Comment        |
| ----------------- | -------- | -------------------------------------- | -------------- |
| preRegsitrationId | Yes      | pre-registration id of the application | 37802950913289 |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Documents successfully deleted

```
{
  "id": "mosip.pre-registration.document.delete",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": {
    "message": "All documents assosiated with requested pre-registration id deleted sucessfully"
  },
  "errors":null
}
```

**Failure Response**

**Status code**: 200

**Description**: if the pre-registration id is invalid(non-empty)

```
{
  "id": "mosip.pre-registration.document.fetch.metadata",
  "version": "1.0",
  "responsetime": "2019-07-03T10:28:02.252Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_APP_005",
      "message": "No data found for the requested pre-registration id"
    }
  ]
}
```

#### Other Failure details

| Error Code         | Error Message                                                | Error Description                                                                            |
| ------------------ | ------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
| PRG\_PAM\_DOC\_006 | Documents failed to delete                                   | if the document & document details are failed to delete                                      |
| PRG\_PAM\_DOC\_012 | Document table not accessible                                | access to document table fails                                                               |
| PRG\_PAM\_APP\_017 | Requested preregistration id does not belong to the user     | when the user tries to access another user's demographic data                                |
| PRG\_PAM\_DOC\_005 | Documents is not found for the requested pre-registration id | If document is not uploaded for the pre-registration id                                      |
| PRG\_PAM\_APP\_005 | No data found for the requested pre-registration id          | When the application is deleted and trying to fetch the document of that pre-registration-id |

### DELETE /documents/{documentId}?preRegistrationId={preRegistrationId}

This request used to delete the document for a particular document id from database and File System server.

#### Resource URL

`https://{base_url}/preregistration/v1/documents/{documentId}?preRegistrationId={preRegistrationId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name       | Required | Description                    | Comment                              |
| ---------- | -------- | ------------------------------ | ------------------------------------ |
| documentId | Yes      | document id of the application | 0748c439-4f83-11e9-ae3b-7b0aa1318f48 |

#### Request Query Parameters

| Name              | Required | Description                            | Comment        |
| ----------------- | -------- | -------------------------------------- | -------------- |
| preRegistrationId | Yes      | pre-registration id of the application | 74843948119371 |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Document successfully deleted

```
{
  "id": "mosip.pre-registration.document.delete.specific",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": {
    "message": "Document successfully deleted"
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: if the pre-registration id is invalid(non-empty)

```
{
  "id": "mosip.pre-registration.document.fetch.metadata",
  "version": "1.0",
  "responsetime": "2019-07-03T10:28:02.252Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_APP_005",
      "message": "No data found for the requested pre-registration id"
    }
  ]
}
```

#### Other Failure details

| Error Code         | Error Message                                            | Error Description                                                                                                |
| ------------------ | -------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| PRG\_PAM\_DOC\_006 | Documents failed to delete                               | if the document & document details are failed to delete                                                          |
| PRG\_PAM\_DOC\_012 | Document table not accessible                            | access to document table fails                                                                                   |
| PRG\_PAM\_APP\_017 | Requested preregistration id does not belong to the user | when the user tries to access another user's demographic data                                                    |
| PRG\_PAM\_DOC\_022 | DocumentId is not belongs to the pre-registration Id     | If document id is not related to the pre-registration id or if document is not found for the pre-registration id |

## DataSync Service (External)

This service enables Pre-Registration to a registration client, request to retrieve all pre-registration ids based on registration client id, appointment date and an user type.

* [POST /sync](Pre-Registration-APIs.md#post-sync)
* [POST /sync/consumedPreRegIds](Pre-Registration-APIs.md#post-syncconsumedpreregids)
* [GET /sync/{preRegistrationId}](Pre-Registration-APIs.md#get-syncpreregistrationid)

### POST /sync

This request is used by registration client to retrieve all the pre-registration Ids by the date range of appointment done.

#### Resource URL

`https://{base_url}/preregistration/v1/sync`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                         | Required | Description                                           | Comment                         |
| ---------------------------- | -------- | ----------------------------------------------------- | ------------------------------- |
| id                           | Yes      | Id of the application                                 | mosip.pre-registration.datasync |
| version                      | Yes      | version of the application                            | 1.0                             |
| requesttime                  | Yes      | Request time of the application                       | 2019-01-16T05:23:08.019Z        |
| request                      | Yes      | Request for the application                           |                                 |
| request.registrationCenterId | Yes      | Registration Center Id for which the data is required | 10001                           |
| request.fromDate             | Yes      | From date of the appointment                          | 2019-02-09                      |
| request.toDate               | Yes      | To date of the appointment                            | 2019-02-12                      |

#### Request

```
{
  "id": "mosip.pre-registration.datasync.fetch.ids",
  "version": "1.0",
  "requesttime": "2019-05-16T06:57:29.969Z",
  "request": {
    "registrationCenterId":"10001",
    "fromDate":"2019-05-09",
    "toDate":"2019-05-20"
  }
}
```

#### Responses

**Success Response**

**Status code**: 200

**Description**: All Pre-Registration Ids fetched successfully

```
{
  "id": "mosip.pre-registration.datasync.fetch.ids",
  "version": "1.0",
  "responsetime": "2019-05-16T08:34:01.315",
  "response": {
    "transactionId": "5afbfbae-77b5-11e9-8dea-e342188bfd4e",
    "countOfPreRegIds": "2",
    "preRegistrationIds": {
      "47184958619749": "2019-05-15T11:44:28.966",
      "76426186439718": "2019-05-16T05:54:01.999"
    }
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: If appointment is not booked under the registration center and requested date range.

```
{
  "id": "mosip.pre-registration.datasync.fetch.ids",
  "version": "1.0",
  "responsetime": "2019-05-16T08:32:19.732Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_BOOK_RCI_032",
      "message": "Record not found for date range and reg center id"
    }
  ]
}
```

#### Other Failure details

| Error Code           | Error Message                       | Error Description                              |
| -------------------- | ----------------------------------- | ---------------------------------------------- |
| PRG\_PAM\_CORE\_001  | Request id is invalid               | Invalid or empty Request Id                    |
| PRG\_PAM\_CORE\_002  | Request version is invalid          | Invalid or empty Request version               |
| PRG\_PAM\_CORE\_003  | Invalid request time                | Empty Request time                             |
| PRG\_CORE\_REQ\_013  | Request date should be current date | If request date is not current date            |
| PRG\_DATA\_SYNC\_009 | registration center id is invalid   | Empty registration center Id                   |
| PRG\_CORE\_REQ\_013  | Request date should be current date | when the date is not current date              |
| PRG\_DATA\_SYNC\_007 | Demographic record failed to fetch  | when rest service to demographic service fails |
| PRG\_DATA\_SYNC\_016 | booking data not found              | when rest service to booking service fails     |
| PRG\_CORE\_REQ\_019  | Invalid date time format            | If from date or to date is invalid             |
| PRG\_CORE\_REQ\_020  | From date is greater than To date   | If from date is greater than to date           |

### POST /sync/consumedPreRegIds

This request is used by registration processor, to retrieve all processed pre-registration ids and store in pre-registration database so that after batch jon run , job will delete records from main table and move to history table(consumed).

#### Resource URL

`https://{base_url}/preregistration/v1/sync/consumedPreRegIds`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                       | Required | Description                     | Comment                               |
| -------------------------- | -------- | ------------------------------- | ------------------------------------- |
| id                         | Yes      | Id of the application           | mosip.pre-registration.datasync.store |
| version                    | Yes      | version of the application      | 1.0                                   |
| requesttime                | Yes      | Request time of the application | 2019-01-16T05:23:08.019Z              |
| request                    | Yes      | Request for the application     |                                       |
| request.preRegistrationIds | Yes      | List of Preregistration Ids     | 42973267563920                        |

#### Request

```
{
  "id": "mosip.pre-registration.datasync.store",
  "version": "1.0",
  "requesttime": "2019-02-11T07:05:08.850Z",
  "request": {
    "preRegistrationIds": [
      "94625367217037",
      "43526512857302"
    ]
  }
}
```

#### Responses

**Success Response**

**Status code**: 200

**Description**: Consumed Pre-Registrations saved

```
{
  "id": "mosip.pre-registration.datasync.store",
  "version" : "1.0",
  "responsetime": "2019-02-16T17:31:04.021Z",
  "response": {
    "transactionId": "26fde349-0e56-11e9-99e1-f7683fbbce99",
    "countOfPreRegIds": "2",
    "preRegistrationIds": "2"
  },
  "errors":null
}
```

**Failure Response**

**Status code**: 200

**Description**: No pre-registration ids passed in request body or all the preregistration ids are invalid

```
{
  "id": "mosip.pre-registration.datasync.store",
  "version": "1.0",
  "responsetime": "2019-05-16T08:41:48.546Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_DATA_SYNC_011",
      "message": "requested preregistration ids are not valid"
    }
  ]
}
```

#### Other Failure details

| Error Code           | Error Message                       | Error Description                              |
| -------------------- | ----------------------------------- | ---------------------------------------------- |
| PRG\_PAM\_CORE\_001  | Request id is invalid               | Invalid or empty Request Id                    |
| PRG\_PAM\_CORE\_002  | Request version is invalid          | Invalid or empty Request version               |
| PRG\_PAM\_CORE\_003  | Invalid request time                | Empty Request time                             |
| PRG\_CORE\_REQ\_013  | Request date should be current date | If request date is not current date            |
| PRG\_DATA\_SYNC\_007 | Demographic record failed to fetch  | when rest service to demographic service fails |

### GET /sync/{preRegistrationId}

This request is used by registration client to retrieve particular pre-registration data based on a pre-registration id.

{% hint style="info" %}
ID.json will include both demographic and uploaded document metadata content.
{% endhint %}

#### Resource URL

`https://{base_url}/preregistration/v1/sync/{preRegistrationId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name              | Required | Description         | Comment        |
| ----------------- | -------- | ------------------- | -------------- |
| preRegistrationId | Yes      | Pre Registration id | 41342175487213 |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Data Sync records fetched

```
{
  "id": "mosip.pre-registration.datasync.fetch",
  "version": "1.0",
  "responsetime": "2019-05-16T08:34:56.440",
  "response": {
    "pre-registration-id": "47184958619749",
    "registration-client-id": "10001",
    "appointment-date": "2019-05-17",
    "from-time-slot": "09:00",
    "to-time-slot": "09:15",
    "zip-filename": "47184958619749",
    "zip-bytes": "ByteArray"
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: No demographic data exists for the requested pre-registration id or if the pre-registration id is invalid(non-empty)

```
{
  "id": "mosip.pre-registration.datasync.fetch",
  "version": "1.0",
  "responsetime": "2019-05-20T12:10:36.682Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_APP_005",
      "message": "No data found for the requested pre-registration id"
    }
  ]
}
```

#### Other Failure details

| Error Code           | Error Message                      | Error Description                                           |
| -------------------- | ---------------------------------- | ----------------------------------------------------------- |
| PRG\_BOOK\_RCI\_013  | booking data not found             | If appointment is not booked against the preregistration id |
| PRG\_DATA\_SYNC\_007 | Demographic record failed to fetch | when rest service to demographic service fails              |
| PRG\_DATA\_SYNC\_016 | booking data not found             | when rest service to booking service fails                  |
| PRG\_DATA\_SYNC\_005 | Unable to create zip file          | If any error occurs while creating the zip file bytes       |
| PRG\_DATA\_SYNC\_014 | file IO exception                  | File system exception                                       |
| PRG\_DATA\_SYNC\_006 | unable to fetch the document       | when rest service to document service fails                 |

## Booking Service (Public)

This service details used by Pre-Registration portal to book an appointment by providing his/her basic appointment details.

* [GET appointment/availability/sync](Pre-Registration-APIs.md#get-appointmentavailabilitysync)
* [POST /appointment/{preRegistrationId}](Pre-Registration-APIs.md#post-appointmentpreregistrationid)
* [POST /appointment](Pre-Registration-APIs.md#post-appointment)
* [PUT /appointment/{preRegistrationId}](Pre-Registration-APIs.md#put-appointmentpreregistrationid)
* [GET /appointment/{preRegistrationId}](Pre-Registration-APIs.md#get-appointmentpreregistrationid)
* [GET /appointment/availability/{registrationCenterId}](Pre-Registration-APIs.md#get-appointmentavailabilityregistrationcenterid)
* [GET /appointment/preRegistrationId/{registrationCenterId}?from\_date=:date\&to\_date=:date](Pre-Registration-APIs.md#get-appointmentpreregistrationidregistrationcenteridfrom\_datedateto\_datedate)

### GET /appointment/availability/sync

This request is used to synchronize booking slots availability table with master data.

#### Resource URL

`https://{base_url}/preregistration/v1/appointment/availability/sync`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Master Data Sync is successful

```
{
  "id": "mosip.pre-registration.appointment.availability.sync",
  "version": "1.0",
  "responsetime": "2019-05-20T09:48:43.394Z",
  "response": "MASTER_DATA_SYNCED_SUCCESSFULLY",
  "errors": null
}
```

#### Other Failure details

| Error Code          | Error Message                                              | Error Description                                              |
| ------------------- | ---------------------------------------------------------- | -------------------------------------------------------------- |
| PRG\_BOOK\_RCI\_015 | No available slots found for specified registration center | If no slots are available in the specified registration center |
| PRG\_BOOK\_RCI\_016 | Availablity table not accessible                           | access to availability table fails                             |
| PRG\_BOOK\_RCI\_034 | Json processing exception                                  | Json parse exception while sending notification                |
| PRG\_BOOK\_RCI\_033 | Notification service call failed                           | Notification service call fail                                 |
| PRG\_BOOK\_RCI\_020 | Master data not found                                      | Master date service call fail                                  |

### POST /appointment/{preRegistrationId}

This request is used to book an registration center. If the appointment data exists for the requested pre-registration id, it will cancel it and update the new appointment data. If no appointment data then it will book an appointment for specified registration center and time slot.

#### Resource URL

`https://{base_url}/preregistration/v1/appointment/{preRegistrationId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name              | Required | Description                            | Comment        |
| ----------------- | -------- | -------------------------------------- | -------------- |
| preRegsitrationId | Yes      | pre-registration id of the application | 37802950913289 |

#### Request Body Parameters

| Name                             | Required | Description                     | Comment                             |
| -------------------------------- | -------- | ------------------------------- | ----------------------------------- |
| id                               | Yes      | Id of the application           | mosip.pre-registration.booking.book |
| version                          | Yes      | version of the application      | 1.0                                 |
| requesttime                      | Yes      | Request time of the application | 2019-01-16T05:23:08.019Z            |
| request                          | Yes      | Request for the application     |                                     |
| request.registration\_center\_id | Yes      | Registration center Id          | 10005                               |
| request.appointment\_date        | Yes      | Date of the appointment         | 2019-01-19                          |
| request.time\_slot\_from         | Yes      | Time Slot From                  | 12:15:00                            |
| request.time\_slot\_to           | Yes      | Time Slot To                    | 12:28:00                            |

#### Request

```
{
  "id": "mosip.pre-registration.booking.book",
  "version": "1.0",
  "requesttime": "2019-05-16T15:31:32.957Z",
  "request": {
    "registration_center_id": "10001",
    "appointment_date": "2019-05-17",
    "time_slot_from": "09:30:00",
    "time_slot_to": "09:45:00"
  }
}
```

#### Responses

**Success Response**

**Status code**: 200

**Description**: Appointment booked successfully

```
{
  "id": "mosip.pre-registration.booking.book",
  "version": "1.0",
  "responsetime": "2019-05-16T09:57:38.433Z",
  "response": {
    "bookingMessage": "Appointment booked successfully"
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: If demographic data not found for the preregistration id or if Pre Registration Id is invalid(non-empty).

```
{
  "id": "mosip.pre-registration.booking.book",
  "version": "1.0",
  "responsetime": "2019-05-16T09:58:41.110Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_APP_005",
      "message": "No data found for the requested pre-registration id"
    }
  ]
}
```

**Failure Response**

**Status code**: 200

**Description**: Slot availability not found for selected time.

```
{
  "id": "mosip.pre-registration.booking.book",
  "version": "1.0",
  "responsetime": "2019-05-15T10:12:07.623Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_BOOK_RCI_002",
      "message": "Availability not found for the selected time"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                                                           | Error Description                                                                                                                                              |
| ------------------- | ----------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| PRG\_PAM\_CORE\_001 | Request id is invalid                                                   | Invalid or empty Request Id                                                                                                                                    |
| PRG\_PAM\_CORE\_002 | Request version is invalid                                              | Invalid or empty Request version                                                                                                                               |
| PRG\_PAM\_CORE\_003 | Invalid request time                                                    | Empty Request time                                                                                                                                             |
| PRG\_CORE\_REQ\_013 | Request date should be current date                                     | If request date is not current date                                                                                                                            |
| PRG\_BOOK\_RCI\_002 | Availability not found for the selected time                            | When availability not found for the requested registration center id or appointment date or time slot                                                          |
| PRG\_BOOK\_RCI\_003 | User has not selected time slot                                         | If from time slot or to time slot is empty                                                                                                                     |
| PRG\_BOOK\_RCI\_005 | Booking table not found                                                 | access to appointment table fails                                                                                                                              |
| PRG\_BOOK\_RCI\_007 | Registration center id not entered                                      | If registration center id is empty                                                                                                                             |
| PRG\_BOOK\_RCI\_008 | Booking date time not selected                                          | If appointment date is empty                                                                                                                                   |
| PRG\_BOOK\_RCI\_013 | Booking data not found                                                  | while rebooking, when the preregistration status is booked but appointment data not found in the database                                                      |
| PRG\_BOOK\_RCI\_015 | No available slots found for specified registration center              | If no slots are available in the specified registration center                                                                                                 |
| PRG\_BOOK\_RCI\_016 | Availablity table not accessible                                        | access to availability table fails                                                                                                                             |
| PRG\_BOOK\_RCI\_024 | Availablity update failed                                               | when appointment availability is failed to update                                                                                                              |
| PRG\_BOOK\_RCI\_026 | Booking status cannot be altered                                        | when we tend to modify the appointment details after the configured time span for rebook                                                                       |
| PRG\_BOOK\_RCI\_028 | Failed to delete the pre-registration record                            | while rebooking, failed to delete old appointment details                                                                                                      |
| PRG\_BOOK\_RCI\_031 | Invalid Booking Date Time found for preregistration id - 37513708391357 | If appointment date is past date and also when appointment date is present date but the appointment time is past. If the date format is other than YYYY-MM-DD. |
| PRG\_PAM\_APP\_017  | Requested preregistration id does not belong to the user                | when the user tries to access another user's demographic data                                                                                                  |

### POST /appointment

This request is used to book mulitple registration centers. If the appointment data exists for the requested pre-registration ids, it will cancel it and update the new appointment data. If no appointment data then it will book an appointment for specified registration center and time slot.

#### Resource URL

`https://{base_url}/preregistration/v1/appointment`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Body Parameters

| Name                             | Required | Description                     | Comment                             |
| -------------------------------- | -------- | ------------------------------- | ----------------------------------- |
| id                               | Yes      | Id of the application           | mosip.pre-registration.booking.book |
| version                          | Yes      | version of the application      | 1.0                                 |
| requesttime                      | Yes      | Request time of the application | 2019-01-16T05:23:08.019Z            |
| request                          | Yes      | Request for the application     |                                     |
| request.preRegistrationid        | Yes      | Preregistration Id              | 51489749326453                      |
| request.registration\_center\_id | Yes      | Registration center Id          | 10001                               |
| request.appointment\_date        | Yes      | Date of the appointment         | 2019-04-22                          |
| request.time\_slot\_from         | Yes      | Time Slot From                  | 15:30:00                            |
| request.time\_slot\_to           | Yes      | Time Slot To                    | 15:45:00                            |

#### Request

```
{
  "id": "mosip.pre-registration.booking.book",
  "version": "1.0",
  "requesttime": "2019-05-15T10:52:04.737Z",
  "request": {
    "bookingRequest": [
      {
        "preRegistrationId": "20167403769842",
        "registration_center_id": "10001",
        "appointment_date": "2019-04-22",
        "time_slot_from": "15:30:00",
        "time_slot_to": "15:45:00"
      },
      {
        "preRegistrationId": "94625367217037",
        "registration_center_id": "10008",
        "appointment_date": "2019-04-23",
        "time_slot_from": "15:30:00",
        "time_slot_to": "15:45:00"
      }
    ]
  }
}
```

#### Responses

**Success Response**

**Status code**: 200

**Description**: Appointment booked successfully

```
{
  "id": "mosip.pre-registration.booking.book",
  "version": "1.0",
  "responsetime": "2019-05-15T10:58:35.546Z",
  "response": {
    "bookingStatusResponse": [
      {
        "bookingMessage": "Appointment booked successfully"
      },
      {
        "bookingMessage": "Appointment booked successfully"
      }
    ]
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: If demographic data is not found for any of the preregistration id or if Pre Registration Id is invalid(non-empty).

```
{
  "id": "mosip.pre-registration.booking.book",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": null,
  "errors":[ 
    {
      "errorCode": "PRG_PAM_APP_005",
      "message": "No data found for the requested pre-registration id"
    }
  ]
}
```

**Failure Response**

**Status code**: 200

**Description**: Slot availability not found for selected time.

```
{
  "id": "mosip.pre-registration.booking.book",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": null,
  "errors":[ 
    {
      "errorCode": "PRG_BOOK_RCI_002",
      "message": "Availability not found for the selected time"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                                                           | Error Description                                                                                                                                             |
| ------------------- | ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| PRG\_PAM\_CORE\_001 | Request id is invalid                                                   | Invalid or empty Request Id                                                                                                                                   |
| PRG\_PAM\_CORE\_002 | Request version is invalid                                              | Invalid or empty Request version                                                                                                                              |
| PRG\_PAM\_CORE\_003 | Invalid request time                                                    | Empty Request time                                                                                                                                            |
| PRG\_CORE\_REQ\_013 | Request date should be current date                                     | If request date is not current date                                                                                                                           |
| PRG\_BOOK\_RCI\_007 | Registration center id not entered                                      | If registration center id is empty                                                                                                                            |
| PRG\_BOOK\_RCI\_008 | Booking date time not selected                                          | If appointment date is empty                                                                                                                                  |
| PRG\_BOOK\_RCI\_002 | Availability not found for the selected time                            | When availability not found for the requested registration center id or appointment date or time slot                                                         |
| PRG\_BOOK\_RCI\_016 | Availability table not accessible                                       | access to availability table fails                                                                                                                            |
| PRG\_BOOK\_RCI\_005 | Booking table not found                                                 | access to appointment table fails                                                                                                                             |
| PRG\_BOOK\_RCI\_024 | Availability update failed                                              | when appointment availability is failed to update                                                                                                             |
| PRG\_BOOK\_RCI\_013 | Booking data not found                                                  | while rebooking, when the preregistration status is booked but appointment data not found in the database                                                     |
| PRG\_BOOK\_RCI\_026 | Booking status cannot be altered                                        | when we tend to modify the appointment details after the configured time span for rebook                                                                      |
| PRG\_BOOK\_RCI\_028 | Failed to delete the pre-registration record                            | while rebooking, failed to delete old appointment details                                                                                                     |
| PRG\_BOOK\_RCI\_031 | Invalid Booking Date Time found for preregistration id - 37513708391357 | If appointment date is past date and also when appointment date is present date but the appointment time is past.If the date format is other than YYYY-MM-DD. |
| PRG\_PAM\_APP\_017  | Requested preregistration id does not belong to the user                | when the user tries to access another user's demographic data                                                                                                 |

### PUT /appointment/{preRegistrationId}

This request used to cancel the appointment. Which will retrieve the appointment details for the specified pre-registration id,if appointment data exists update the availability for the slot by increasing the value and delete the record from the table and update the demographic record status "Pending\_Appointment".

#### Resource URL

`https://{base_url}/preregistration/v1/appointment/{preRegistrationId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Appointment cancelled successfully

```
{
  "id": "mosip.pre-registration.appointment.cancel",
  "version": "1.0",
  "responsetime": "2019-05-31T09:26:05.870Z",
  "response": {
    "transactionId": "1da8f8b8-8386-11e9-a18f-cb89ed940c1b",
    "message": "Appointment for the selected application has been successfully cancelled"
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: Appointment cancellation failed.

```
{
  "id": "mosip.pre-registration.appointment.cancel",
  "version": "1.0",
  "responsetime": "2019-05-15T11:05:30.680Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_BOOK_RCI_018",
      "message": "Appointment cannot be canceled"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                                            | Error Description                                                                                                    |
| ------------------- | -------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| PRG\_BOOK\_RCI\_013 | Booking data not found                                   | if appointment is not booked against the requested preregistration id                                                |
| PRG\_BOOK\_RCI\_016 | Availability table not accessible                        | access to availability table fails                                                                                   |
| PRG\_BOOK\_RCI\_005 | Booking table not found                                  | access to appointment table fails                                                                                    |
| PRG\_BOOK\_RCI\_024 | Availability update failed                               | when appointment availability is failed to update                                                                    |
| PRG\_BOOK\_RCI\_026 | Booking status cannot be altered                         | when we tend to cancel the appointment details after the configured time span for cancel                             |
| PRG\_BOOK\_RCI\_018 | Appointment cannot be canceled                           | If status is other than booked                                                                                       |
| PRG\_PAM\_APP\_005  | No data found for the requested pre-registration id      | If no demographic data found for the requested preregistration id or if the preregistration id is invalid(non-empty) |
| PRG\_PAM\_APP\_017  | Requested preregistration id does not belong to the user | when the user tries to access another user's demographic data                                                        |

### GET /appointment/{preRegistrationId}

This request is to retrieve Pre-Registration appointment details by pre-Registration id.

#### Resource URL

`https://{base_url}/preregistration/v1/appointment/{preRegistrationId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name              | Required | Description           | Comment        |
| ----------------- | -------- | --------------------- | -------------- |
| preRegistrationId | Yes      | Id of the application | 37802950913289 |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Appointment details successfully retrieved

```
{
  "id": "mosip.pre-registration.appointment.fetch",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": {
    "registration_center_id": "10005",
    "appointment_date": "2019-02-13",
    "time_slot_from": "16:10",
    "time_slot_to": "16:23"
  },
  "errors":null
}
```

**Failure Response**

**Status code**: 200

**Description**: No Appointment record found for the specified pre-registration id

```
{
  "id": "mosip.pre-registration.appointment.fetch",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": null,
  "errors":[ 
    {
      "errorCode": "PRG_BOOK_RCI_013",
      "message": "Booking data not found"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                                            | Error Description                                                     |
| ------------------- | -------------------------------------------------------- | --------------------------------------------------------------------- |
| PRG\_BOOK\_RCI\_013 | Booking data not found                                   | if appointment is not booked against the requested preregistration id |
| PRG\_PAM\_APP\_017  | Requested preregistration id does not belong to the user | when the user tries to access another user's demographic data         |

### GET /appointment/availability/{registrationCenterId}

This request is used to retrieve all appointment slots available for booking based on the specified registration center id.

#### Resource URL

`https://{base_url}/preregistration/v1/appointment/availability/{registrationCenterId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name                 | Required | Description            | Comment |
| -------------------- | -------- | ---------------------- | ------- |
| registrationCenterId | Yes      | Registration Center Id | 10004   |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Availability details fetched successfully

```
{
  "id": "mosip.pre-registration.appointment.availability",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": {
    "regCenterId": "10004",
    "centerDetails": [
      {
        "date": "2019-02-13",
        "timeSlots": [
          {
            "fromTime": "09:00:00",
            "toTime": "09:15:00",
            "availability": 4
          },
          {
            "fromTime": "09:15:00",
            "toTime": "09:30:00",
            "availability": 3
          }
        ],
        "holiday": false
      },
      {
        "date": "2019-02-14",
        "timeSlots": [
          {
            "fromTime": "09:00:00",
            "toTime": "09:15:00",
            "availability": 4
          },
          {
            "fromTime": "09:15:00",
            "toTime": "09:30:00",
            "availability": 3
          }
        ],
        "holiday": false
      }
    ]
  },
  "errors":null
}
```

**Failure Response**

**Status code**: 200

**Description**: No available slots found for specified registration center.

```
{
  "id": "mosip.pre-registration.appointment.availability",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": null,
  "errors":[ 
    {
      "errorCode": "PRG_BOOK_RCI_015",
      "message": "No available slots found for specified registration center"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                     | Error Description                  |
| ------------------- | --------------------------------- | ---------------------------------- |
| PRG\_BOOK\_RCI\_016 | Availability table not accessible | access to availability table fails |

### GET /appointment/preRegistrationId/{registrationCenterId}?from\_date=:Date\&to\_date=:Date

This request is used to retrieve all pre-registration ids available for specified registration center and date range.

{% hint style="info" %}
If toDate parameter value is not passed in the request, fromDate will be considered as toDate.
{% endhint %}

#### Resource URL

`https://{base_url}/preregistration/v1/appointment/preRegistrationId/{registrationCenterId}?from_date=:Date&to_date=:Date`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Path Parameters

| Name                 | Required | Description            | Comment |
| -------------------- | -------- | ---------------------- | ------- |
| registrationCenterId | Yes      | Registration Center Id | 10002   |

#### Request Query Parameters

| Name     | Required | Description | Comment    |
| -------- | -------- | ----------- | ---------- |
| fromDate | Yes      | From Date   | 2019-02-12 |
| toDate   | Yes      | To Date     | 2019-06-15 |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Availability details fetched successfully

```
{
  "id": "mosip.pre-registration.appointment.ids",
  "version": "1.0",
  "responsetime": "2019-05-15T11:21:39.328Z",
  "response": {
    "registration_center_id": "10002",
    "pre_registration_ids": [
      "76426186439718"
    ]
  },
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: No available slots found for specified registration center with date range.

```
{
  "id": "mosip.pre-registration.appointment.ids",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": null,
  "errors":[ 
    {
      "errorCode": "PRG_BOOK_RCI_032",
      "message": "Record not found for date range and reg center id"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                     | Error Description                    |
| ------------------- | --------------------------------- | ------------------------------------ |
| PRG\_BOOK\_RCI\_005 | Booking table not found           | access to appointment table fails    |
| PRG\_CORE\_REQ\_019 | Invalid date time format          | If from date or to date is invalid   |
| PRG\_CORE\_REQ\_020 | From date is greater than To date | If from date is greater than to date |

## BatchJob Service (Private)

This service is used by Pre-Registration portal to update an expired pre-registration id and consumed pre-registration id.

{% hint style="info" %}
Below are privileged APIs cannot be operate with individuals credentials.
{% endhint %}

* [PUT batch/expiredStatus](Pre-Registration-APIs.md#put-expiredstatus)
* [PUT batch/consumedStatus](Pre-Registration-APIs.md#put-consumedstatus)

### PUT /expiredStatus

This request is used to update status of pre-registration ids appointment to expired status in database. Batch service will expire all the appointments from date before exceution date till the last execution date of batch job.

#### Resource URL

`https://{base_url}/preregistration/v1/batch/expiredStatus`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Expired status updated successfully

```
{
  "id": "mosip.pre-registration.batchjob.service.expired",
  "version": "1.0",
  "responsetime": "2019-05-20T07:26:55.303Z",
  "response": "Registration appointment status updated to expired successfully",
  "errors": null
}
```

**Failure Response**

**Status code**: 200

**Description**: No pre-registration record found to update expired status

```
{
  "id": "mosip.pre-registration.batchjob.service.expired",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": null,
  "errors":[ 
    {
      "errorCode": "PRG_PAM_BAT_001",
      "message": "No pre-registration id found to update status"
    } 
  ]
}
```

#### Other Failure details

| Error Code         | Error Message                        | Error Description                          |
| ------------------ | ------------------------------------ | ------------------------------------------ |
| PRG\_PAM\_BAT\_004 | Demographic table not accessible     | If data is not found for preRegistrationId |
| PRG\_PAM\_BAT\_005 | Reg appointment table not accessible | If Reg appointment table not accessible    |

### PUT /consumedStatus

This request is used to update the consumed status for all pre-Registration ids given by registration processor.

#### Resource URL

`https://{base_url}/preregistration/v1/batch/consumedStatus`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Responses

**Success Response**

**Status code**: 200

**Description**: Consumed status updated successfully

```
{
  "id": "mosip.pre-registration.batchjob.service.consumed",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": "Demographic status to consumed updated successfully",
  "errors":null
}
```

**Failure Response**

**Status code**: 200

**Description**: No pre-registration record found to update consumed status

```
{
  "id": "mosip.pre-registration.batchjob.service.consumed",
  "version": "1.0",
  "responsetime": "2019-05-20T07:33:21.232Z",
  "response": null,
  "errors": [
    {
      "errorCode": "PRG_PAM_BAT_001",
      "message": "No pre-registration id found to update status"
    }
  ]
}
```

#### Other Failure details

| Error Code         | Error Message                                 | Error Description                                |
| ------------------ | --------------------------------------------- | ------------------------------------------------ |
| PRG\_PAM\_BAT\_004 | Demographic table not accessible              | If data is not found for preRegistrationId       |
| PRG\_PAM\_BAT\_005 | Reg appointment table not accessible          | If Reg appointment table not accessible          |
| PRG\_PAM\_BAT\_006 | Processed prereg list table not accessible    | If Processed prereg list table not accessible    |
| PRG\_PAM\_BAT\_007 | Document table not accessible                 | If document table not accessible                 |
| PRG\_PAM\_BAT\_008 | Reg appointment consumed table not accessible | If Reg appointment consumed table not accessible |
| PRG\_PAM\_BAT\_009 | Demographic consumed table not accessible     | If Demographic consumed table not accessible     |
| PRG\_PAM\_BAT\_010 | Document consumed table not accessible        | If document consumed table not accessible        |

## Generate QR code service (public)

This service details used by Pre-Registration portal to generate QR Code.

* [POST qrCode/generate](Pre-Registration-APIs.md#post-qrcodegenerate)

### POST qrCode/generate

This request is used to generate QR Code for the pre-registration acknowledgement.

#### Resource URL

`https://{base_url}/preregistration/v1/qrCode/generate`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name          | Required | Description                                  | Comment                                |
| ------------- | -------- | -------------------------------------------- | -------------------------------------- |
| id            | Yes      | Id of the application                        | mosip.pre-registration.qrcode.generate |
| version       | Yes      | version of the application                   | 1.0                                    |
| requesttime   | Yes      | Request time of the application              | 2019-01-16T05:23:08.019Z               |
| request       | Yes      | Request for the application                  |                                        |
| request.value | Yes      | Any string that you want to generate QR code |                                        |

#### Request

{% hint style="info" %}
Below is the sample request with no validation for request value
{% endhint %}

```
{
  "id": "mosip.pre-registration.qrcode.generate",
  "version": "1.0",
  "requesttime": "2019-01-09T15:31:32.957Z",
  "request": "37802950913289"	
}
```

#### Responses

**Success Response**

**Status code**: 200

**Description**: QR Code generated successfully

```
{
  "id": "mosip.pre-registration.qrcode.generate",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": {
    "qrcode":"ByteArray"
  },
  "errors":null
}
```

**Failure Response**

**Status code**: 200

**Description**: Failed to generate QR code

```
{
  "id": "mosip.pre-registration.qrcode.generate",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": null,
  "errors":[ 
    {
      "errorCode": "PRG_QRC_002",
	  "message": "Failed to generate QR code"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                       | Error Description                                      |
| ------------------- | ----------------------------------- | ------------------------------------------------------ |
| PRG\_PAM\_CORE\_001 | Request id is invalid               | Invalid or empty Request Id                            |
| PRG\_PAM\_CORE\_002 | Request version is invalid          | Invalid or empty Request version                       |
| PRG\_PAM\_CORE\_003 | Invalid request time                | Empty Request time                                     |
| PRG\_CORE\_REQ\_013 | Request date should be current date | If request date is not current date                    |
| PRG\_PAM\_CORE\_004 | Request body is invalid             | Invalid or empty Request body                          |
| PRG\_QRC\_001       | File input output exception         | when there is any input / output file operation issues |
| PRG\_CORE\_REQ\_013 | Request date should be current date | If request date is other than current date             |

## Notification Service (public)

This service details used by Pre-Registration portal to trigger notification via SMS or email.

* [POST notification/notify](Pre-Registration-APIs.md#post-notificationnotify)

### POST notification/notify

This request is used to notify the pre-registration acknowledgement via Email and SMS.

#### Resource URL

`https://{base_url}/preregistration/v1/notification/notify`

#### Resource details

| Resource Details        | Description         |
| ----------------------- | ------------------- |
| Request format          | multipart/form-data |
| Response format         | JSON                |
| Requires Authentication | Yes                 |

#### Request Part (NotificationRequestDTO) Parameters

| Name                        | Required                          | Description                         | Comment                                                                                                                                                                                                                                                                                         |
| --------------------------- | --------------------------------- | ----------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| id                          | Yes                               | Id of the application               | mosip.pre-registration.notification.notify                                                                                                                                                                                                                                                      |
| version                     | Yes                               | version of the application          | 1.0                                                                                                                                                                                                                                                                                             |
| requesttime                 | Yes                               | Request time of the application     | 2019-01-16T05:23:08.019Z                                                                                                                                                                                                                                                                        |
| request                     | Yes                               | Request for the application         |                                                                                                                                                                                                                                                                                                 |
| request.name                | Yes                               | user name of the application        | Sanober Noor                                                                                                                                                                                                                                                                                    |
| request.preRegistrationId   | Yes                               | Pre Registration of the application | 37802950913289                                                                                                                                                                                                                                                                                  |
| request.appointmentDate     | Yes                               | Booking appointment date            | 2019-01-18                                                                                                                                                                                                                                                                                      |
| request.appointmentTime     | Yes                               | Booking appointment time            | 12:02                                                                                                                                                                                                                                                                                           |
| request.mobNum              | Optional(If emailID is non empty) | applicant mobile number             | 9480456789                                                                                                                                                                                                                                                                                      |
| request.emailID             | Optional(If mobNum is non empty)  | applicant email Id                  | `sanober@gmail.com`                                                                                                                                                                                                                                                                             |
| request.additionalRecipient | Yes                               | additional recipient                | It is a Boolean value(true/false). If it is **true** then **request.mobNum** and **request.emailId** get validated otherwise even though value is present for those values validation will not happen and it will get the mobile number/email address from the identity json from the database. |
| request.isBatch             | Yes                               | Required for batch job              | It is a Boolean value(true/false). If it is **true** then it consider this call as a cancel appointment only otherwise it will considered as a normal notification call and validate appointment details.                                                                                       |

#### Request Part Parameters

| Name       | Required | Description                                    | Comment            |
| ---------- | -------- | ---------------------------------------------- | ------------------ |
| attachment | Yes      | pdf file of acknowledgment page                | 37802950913289.pdf |
| langCode   | Yes      | language code whatever user choose while login | eng                |

#### Request

```
{
  "id": "mosip.pre-registration.notification.notify",
  "version": "1.0",
  "requesttime": "2019-01-09T15:31:32.957Z",
  "request": {
	"name": "sanober noor",
	"preRegistrationId": "37802950913289",
	"appointmentDate": "2019-01-22",
	"appointmentTime": "09:15 AM",
	"mobNum": "9999999999",
	"emailID": "mosip@mosip.io",
    "additionalRecipient":"true",
    "isBatch":"false"
  }
}
```

#### Responses

**Success Response**

**Status code**: 200

**Description**: Email and sms request successfully submitted

```
{
  "id": "mosip.pre-registration.notification.notify",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": {
    "message": "Email and sms request successfully submitted"
  },
  "errors":null
}
```

**Failure Response**

**Status code**: 200

**Description**: Mobile number or Email Id is missing

```
{
  "id": "mosip.pre-registration.notification.notify",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": null,
  "errors":[ 
    {
      "errorCode": "PRG_ACK_001",
      "message": "Mobile number or Email Id is missing"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                                       | Error Description                                                                                       |
| ------------------- | --------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| PRG\_PAM\_CORE\_001 | Request id is invalid                               | Invalid or empty Request Id                                                                             |
| PRG\_PAM\_CORE\_002 | Request version is invalid                          | Invalid or empty Request version                                                                        |
| PRG\_PAM\_CORE\_003 | Invalid request time                                | Empty Request time                                                                                      |
| PRG\_CORE\_REQ\_013 | Request date should be current date                 | If request date is not current date                                                                     |
| PRG\_PAM\_ACK\_002  | Mandatory fields are missing                        | If isBatch field is null                                                                                |
| PRG\_PAM\_ACK\_008  | Full name is not valid                              | If name field is invalid or empty                                                                       |
| PRG\_PAM\_ACK\_009  | Appointment date is not valid                       | If appointmentDate field is invalid or empty                                                            |
| PRG\_PAM\_ACK\_010  | Appointment time is not valid                       | If appointmentTime field is invalid or empty                                                            |
| PRG\_PAM\_APP\_005  | No data found for the requested pre-registration id | If additionalRecipient is false and there will be no demographic data for requested pre-registration id |
| PRG\_CORE\_REQ\_013 | Request date should be current date                 | If request date is other than current date                                                              |
| PRG\_PAM\_ACK\_006  | Email is not valid                                  | If additionalRecipient is true and email id pattern is invalid                                          |
| PRG\_PAM\_ACK\_007  | Phone number is not valid                           | If additionalRecipient is true and phone number is invalid                                              |

## Transliteration Service (Public)

This service is used by Pre-Registration portal to transliterate given value from one language to another language. In this API transliteration is using IDB ICU4J library , so accuracy will be less.

* [POST /transliteration/transliterate](Pre-Registration-APIs.md#post-transliterationtransliterate)

### POST /transliteration/transliterate

This request is used to transliterate from\_Field\_value to to\_field\_value based on given valid from\_lang\_code to to\_lang\_code.

#### Resource URL

`https://{base_url}/preregistration/v1/transliteration/transliterate`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Parameters

| Name                       | Required | Description                     | Example                                              |
| -------------------------- | -------- | ------------------------------- | ---------------------------------------------------- |
| id                         | Yes      | Id of the application           | mosip.pre-registration.transliteration.transliterate |
| version                    | Yes      | version of the application      | 1.0                                                  |
| requesttime                | Yes      | Request time of the application | 2019-01-16T05:23:08.019Z                             |
| request                    | Yes      | Request for the application     |                                                      |
| request.from\_field\_lang  | Yes      | From language code              | eng                                                  |
| request.from\_field\_value | Yes      | From field value                | Kishan                                               |
| request.to\_field\_lang    | Yes      | To language code                | ara                                                  |

#### Request

```
{
  "id": "mosip.pre-registration.transliteration.transliterate",
  "version": "1.0",
  "requesttime": "2019-01-09T15:31:32.957Z",
  "request": {
    "from_field_lang": "eng",
    "from_field_value": "Kishan",
    "to_field_lang": "ara"
  }
}
```

#### Responses

**Success Response**

**Status code**: 200

**Description**: Given key is transliterated successfully

```
{
  "id": "mosip.pre-registration.transliteration.transliterate",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": {
    "from_field_lang": "eng",
    "from_field_value": "Kishan",
    "to_field_lang": "ara",
    "to_field_value": "كِسهَن"
  },
  "errors":null
}
```

**Failure Response**

**Status code**: 200

**Description**: Failed to transliterate

```
{
  "id": "mosip.pre-registration.transliteration.transliterate",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": null,
  "errors":[
    {
      "errorCode": "PRG_TRL_APP_001",
      "message": "Failed to transliterate"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                       | Error Description                         |
| ------------------- | ----------------------------------- | ----------------------------------------- |
| PRG\_PAM\_CORE\_001 | Request id is invalid               | Invalid or empty Request Id               |
| PRG\_PAM\_CORE\_002 | Request version is invalid          | Invalid or empty Request version          |
| PRG\_PAM\_CORE\_003 | Invalid request time                | Empty Request time                        |
| PRG\_CORE\_REQ\_013 | Request date should be current date | If request date is not current date       |
| PRG\_TRL\_APP\_008  | Unsupported language                | If langCode is other than ara,eng and fra |
| PRG\_TRL\_APP\_002  | Incorrect mandatory Fields          | If any of the request is null             |

## Captcha Service (Public)

This service is used in Pre-Registration portal to protects the website from spam and abuse. In this API we are google recaptcha V2 to authenticate.

* [POST /captcha/validatecaptcha](Pre-Registration-APIs.md#post-captchavalidatecaptcha)

### POST /captcha/validatecaptcha

This request is used to validate the response from the google recaptcha v2 API used in the front end application.

#### Resource URL

`https://{base_url}/preregistration/v1/captcha/validatecaptcha`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | NO          |

#### Parameters

| Name                   | Required | Description                     | Example                                    |
| ---------------------- | -------- | ------------------------------- | ------------------------------------------ |
| id                     | Yes      | Id of the application           | mosip.pre-registration.captcha.id.validate |
| version                | Yes      | version of the application      | 1.0                                        |
| requesttime            | Yes      | Request time of the application | 2019-01-16T05:23:08.019Z                   |
| request                | Yes      | Request for the application     |                                            |
| request.captcha\_token | Yes      | token                           |                                            |

#### Request

```
{
  "id": "mosip.pre-registration.captcha.id.validate",
  "version": "1.0",
  "requesttime": "2019-01-09T15:31:32.957Z",
  "request": {
    "captchaToken": "token_string",
  }
}
```

#### Responses

**Success Response**

**Status code**: 200

**Description**: Captcha successfully verified

```
{
  "id": "mosip.pre-registration.captcha.id.validate",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": {
    "success": "true",
    "message": "Captcha successfully verified",
  },
  "errors":null
}
```

**Failure Response**

**Status code**: 200

**Description**: Invalid Captcha

```
{
  "id": "mosip.pre-registration.captcha.id.validate",
  "version" : "1.0",
  "responsetime": "2019-01-16T17:31:04.021Z",
  "response": null,
  "errors":[
    {
      "errorCode": "PRG_PAM_005",
      "message": "Invalid Captcha entered"
    }
  ]
}
```

#### Other Failure details

| Error Code          | Error Message                                    | Error Description                   |
| ------------------- | ------------------------------------------------ | ----------------------------------- |
| PRG\_PAM\_CORE\_001 | Request id is invalid                            | Invalid or empty Request Id         |
| PRG\_PAM\_CORE\_002 | Request version is invalid                       | Invalid or empty Request version    |
| PRG\_PAM\_CORE\_003 | Invalid request time                             | Empty Request time                  |
| PRG\_CORE\_REQ\_013 | Request date should be current date              | If request date is not current date |
| PRG-PAM-006         | Invalid request , Request can't be null or empty |                                     |

## Common Exception Details for all Preregistration API

| Error Code          | Error Message                                                 | Error Description                                                                              |
| ------------------- | ------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| PRG\_CORE\_REQ\_015 | Error message will come accordingly to the exception occurred | This error code will occur for MethodArgumentNotValidException,HttpMessageNotReadableException |
| PRG\_CORE\_REQ\_016 | Error message will come accordingly to the exception occurred | This error code will occur for Exception,RuntimeException                                      |
| KER-ATH-402         | Token expired                                                 | If the auth token got expired                                                                  |
| KER-ATH-401         | Invalid Token                                                 | If the auth token is invalid                                                                   |
