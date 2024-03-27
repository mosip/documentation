# Sync Data APIs

This page contains detail about the service APIs for sync data that is sent from server to registration client.

## Sync data (Public)

* [GET /configs](Sync-Data-APIs.md#get-configs)
* [GET /roles](Sync-Data-APIs.md#get-roles)
* [GET /userdetails/{registrationcenterid}](Sync-Data-APIs.md#get-userdetails-registrationcenterid)
* [GET /publickey](Sync-Data-APIs.md#get-publickey)
* [POST /tpm/publickey](Sync-Data-APIs.md#post-tpm-publickey)
* [POST /tpm/publickey/verify](Sync-Data-APIs.md#post-tpm-publickey)
* [GET /clientsettings](Sync-Data-APIs.md#get-clientsettings)
* [GET /clientsettings/{regcenterid}](Sync-Data-APIs.md#get-clientsettings-regcenterid)

### GET /configs

This service will return back the global and registration configuration data of the MOSIP platform.

#### Resource URL

`https://mosip.io/v1/syncdata/configs`

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

**Description: latest configuration details.**

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

### GET /roles

This service will return back the all roles of the applications.

#### Resource URL

`https://mosip.io/v1/syncdata/roles`

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

**Description: all roles of the application**

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

### GET /userdetails/{registrationcenterid}

This service will return back the list of users and its role-mapping based on the registration-center-id.

#### Resource URL

`https://mosip.io/v1/syncdata/userdetails/{registrationcenterid}`

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

`https://mosip.io/v1/syncdata/userdetails/110011`

#### Responses

**Success Response**

**Description: list of users and role-mapping**

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

### GET /publickey/{applicationId}

This service will provide the public key for the specific application fetched from key manager.

#### Resource URL

`https://mosip.io/v1/syncdata/publickey/{applicationId}`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name          | Required | Description               | Example              |
| ------------- | -------- | ------------------------- | -------------------- |
| applicationId | Yes      | Id of the application     | REGISTRATION,IDA     |
| referenceId   | No       | Id of the Machine/MISP    |                      |
| timeStamp     | Yes      | Date-time in UTC ISO-8601 | 2007-12-03T10:15:30Z |

#### Request

`https://mosip.io/v1/syncdata/publickey/REGISTRATION?timeStamp=2018-12-09T06%3A39%3A03.683Z`

#### Responses

**Success Response**

**Description: public key and current active profile for the specified application**

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
	"publicKey": "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwUAubI0cMDZMlalDYbzZj4G2UrWY0QDtmZQyqU_ER5CA1gbxlHDQIesm1DVyp6kf1sG-RcosKPqKIhe9vKLPx5pzQXinGdl_8e5bkPpg2RLlDoNju1ycohPrCk0VOd4eNU90-SRJZH_62QE1_MG2yIohI7e7cuC93Q9SHMD8jmJ7DX2zTui4zbo-c5g7vFAtzDgxJg0vSPGbap682xkWZNgzRA_ctrnHF_9_JMzP_6Equ8E_g5BaI3jkWnVmDNjDzzseBH9zHpfbx6wNYrzQZy8iqqywbUtbHWtM0ALkH7nLi4atVbL6a-ryFt6Tq7qfGzYhLtWN47t4GxwyOJC99QIDAQAB",
	"issuedAt": "2018-01-01T10:00:00",
	"expiryAt": "2018-12-10T06:12:51.994",
	"profile" : "prod"
  }
}	
```

**Response Code : 200 (OK)**

### POST /tpm/publickey

This service will upload the public key corresponding to a particular machine which are used in the MOSIP platform. This service will be used specifically in the Registration Client machines.

#### Resource URL

`https://mosip.io/v1/syncdata/tpm/publickey`

#### Resource details

| Resource Details        | Description      |
| ----------------------- | ---------------- |
| Request format          | application/json |
| Response format         | JSON             |
| Requires Authentication | Yes              |

#### Request Part Parameters

| Name        | Required | Description                                      | Default Value | Example   |
| ----------- | -------- | ------------------------------------------------ | ------------- | --------- |
| machineName | Yes      | Name of the machine                              |               | MDLGE6273 |
| publickey   | Yes      | Base 64 encoded Public key of the passed machine |               |           |

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

#### Responses

**Success Response**

**Description: The public key had been mapped to the machine**

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

### POST /tpm/publickey/verify

This service will only verify the public key corresponding to a particular machine which are used in the MOSIP platform. This service will be used specifically in the Registration Client machines.

#### Resource URL

`https://mosip.io/v1/syncdata/tpm/publickey/verify`

#### Resource details

| Resource Details        | Description      |
| ----------------------- | ---------------- |
| Request format          | application/json |
| Response format         | JSON             |
| Requires Authentication | Yes              |

#### Request Part Parameters

| Name        | Required | Description                                      | Default Value | Example   |
| ----------- | -------- | ------------------------------------------------ | ------------- | --------- |
| machineName | Yes      | Name of the machine                              |               | MDLGE6273 |
| publickey   | Yes      | Base 64 encoded Public key of the passed machine |               |           |

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

#### Responses

**Success Response**

**Description: Verifies if the public key has been mapped to the machine**

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

### GET /clientsettings

This service will provides the list of all clientsettings. This service is used mainly by the Enrollment client module.

#### Resource URL

`https://mosip.io/v1/syncdata/clientsettings?keyindex=bb:2f:9f:29:2c:8b:fb:44:51:ba:f7:f9:66:9b:f2:f0:5a:2d:7c:2b:24:ac:a7:08:53:35:a0:b7:96:50:f0:24&lastupdated=2018-12-10T11:42:52.994Z`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name        | Required | Description                                                | Default Value | Example |
| ----------- | -------- | ---------------------------------------------------------- | ------------- | ------- |
| lastupdated | No       | Date in UTC ISO format                                     |               |         |
| keyindex    | Yes      | Thumbprint of the public key corresponding to this machine |               |         |

#### Request

`https://mosip.io/v1/syncdata/clientsettings?keyindex=bb:2f:9f:29:2c:8b:fb:44:51:ba:f7:f9:66:9b:f2:f0:5a:2d:7c:2b:24:ac:a7:08:53:35:a0:b7:96:50:f0:24`

#### Responses

**Success Response**

**Description: latest clientsettings for the provided machine.**

```
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

### GET /clientsettings/{regcenterid}

This service will provides the list of all master data. This service is used mainly by the Enrollment client module.

#### Resource URL

`https://mosip.io/v1/syncdata/clientsettings/10001?keyindex=bb:2f:9f:29:2c:8b:fb:44:51:ba:f7:f9:66:9b:f2:f0:5a:2d:7c:2b:24:ac:a7:08:53:35:a0:b7:96:50:f0:24&lastupdated=2018-12-10T11:42:52.994Z`

#### Resource details

| Resource Details        | Description |
| ----------------------- | ----------- |
| Response format         | JSON        |
| Requires Authentication | Yes         |

#### Request Part Parameters

| Name        | Required | Description                                                | Default Value | Example |
| ----------- | -------- | ---------------------------------------------------------- | ------------- | ------- |
| regcenterid | Yes      | Registration center id                                     |               |         |
| lastupdated | No       | Date in UTC ISO format                                     |               |         |
| keyindex    | Yes      | Thumbprint of the public key corresponding to this machine |               |         |

#### Request

`v1/syncdata/clientsettings/10001?keyindex=bb:2f:9f:29:2c:8b:fb:44:51:ba:f7:f9:66:9b:f2:f0:5a:2d:7c:2b:24:ac:a7:08:53:35:a0:b7:96:50:f0:24`

#### Responses

**Success Response**

**Description: latest masterdata for the provided machine.**

```
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

**Failure details**

| Error Code  | Error Message                                                            | Error Description                                 |
| ----------- | ------------------------------------------------------------------------ | ------------------------------------------------- |
| KER-SNC-100 | Error occurred while parsing lastUpdated timesatamp                      | last updated parse exception                      |
| KER-SNC-101 | Error occurred while fetching Applications                               | application fetch exception                       |
| KER-SNC-102 | Error occurred while fetching Machine Details                            | machine detail fetch exception                    |
| KER-SNC-103 | Error occurred while fetching Machine Registration Center                | machine reg center fetch exception                |
| KER-SNC-104 | Error occurred while fetching Registration Center                        | reg center fetch exception                        |
| KER-SNC-105 | Error occurred while fetching Registration Center Type                   | reg center type fetch exception                   |
| KER-SNC-106 | Error occurred while fetching Templates                                  | template fetch exception                          |
| KER-SNC-107 | Error occurred while fetching Template Types                             | template type fetch exception                     |
| KER-SNC-108 | Error occurred while fetching Reason Category                            | reason category fetch exception                   |
| KER-SNC-109 | Error occurred while fetching Holidays                                   | holiday fetch exception                           |
| KER-SNC-110 | Error occurred while fetching Blacklisted Words                          | blacklisted words fetch exception                 |
| KER-SNC-111 | Error occurred while fetching Biometric types                            | biometric type fetch exception                    |
| KER-SNC-112 | Error occurred while fetching Biometric Attribute types                  | biometric attr type fetch exception               |
| KER-SNC-113 | Error occurred while fetching Titles                                     | title fetch exception                             |
| KER-SNC-114 | Error occurred while fetching Languages                                  | language fetch exception                          |
| KER-SNC-115 | Error occurred while fetching Genders                                    | gender fetch exception                            |
| KER-SNC-116 | Error occurred while fetching Registration Center Devices                | registartion center devices fetch exception       |
| KER-SNC-117 | Error occurred while fetching Devices                                    | devices fetch exception                           |
| KER-SNC-118 | Error occurred while fetching Document Category                          | document category fetch exception                 |
| KER-SNC-119 | Error occurred while fetching Document Types                             | document type fetch exception                     |
| KER-SNC-120 | Error occurred while fetching Id Type                                    | id type fetch exception                           |
| KER-SNC-121 | Error occurred while fetching Device Specification                       | device specification fetch exception              |
| KER-SNC-122 | Error occurred while fetching Machine Specification                      | machine specification fetch exception             |
| KER-SNC-123 | Error occurred while fetching Machine Type                               | machine type fetch exception                      |
| KER-SNC-124 | Error occurred while fetching Location                                   | location fetch exception                          |
| KER-SNC-125 | Error occurred while fetching Device Type                                | device type fetch exception                       |
| KER-SNC-126 | Error occurred while fetching Valid Document Type                        | valid document fetch exception                    |
| KER-SNC-127 | Error occurred while fetching Valid Document Type                        | reason list fetch exception                       |
| KER-SNC-128 | Error occurred while fetching data                                       | thread interrupted while fetch exception          |
| KER-SNC-999 | Request Data not valid                                                   | Request Data Not Valid                            |
| KER-SNC-129 | Error occurred while fetching Registration Center Machine                | REG CENTER MACHINE Fetch Exception                |
| KER-SNC-130 | Error occurred while fetching Registration Center Device                 | REG CENTER DEVICE Fetch Exception                 |
| KER-SNC-131 | Error occurred while fetching Registration Center Machine Device         | REG CENTER MACHINE DEVICE Fetch Exception         |
| KER-SNC-132 | Error occurred while fetching Registration Center Machine Device         | REG CENTER USER MACHINE DEVICE Fetch Exception    |
| KER-SNC-133 | Error occurred while fetching Registration Center User                   | REG CENTER USER Fetch Exception                   |
| KER-SNC-134 | Machine id not found                                                     | MACHINE ID Not found Exception                    |
| KER-SNC-500 | Internal server error                                                    | Internal server error                             |
| KER-SNC-135 | Timestamp cannot be future date                                          | Invalid Timestamp                                 |
| KER-SNC-136 | Error occurred while fetching Registration Center User History           | REG CENTER USER HISTORY Fetch Exception           |
| KER-SNC-137 | Error occurred while fetching Registration Center Machine User History   | REG CENTER MACHINE USER HISTORY Fetch Exception   |
| KER-SNC-138 | Error occurred while fetching Registration Center Device History         | REG CENTER DEVICE HISTORY Fetch Exception         |
| KER-SNC-139 | Error occurred while fetching Registration Center Machine History        | REG CENTER MACHINE HISTORY Fetch Exception        |
| KER-SNC-140 | Mac-Address and Serial Number cannot be empty                            | Empty MAC OR SERIAL Number                        |
| KER-SNC-141 | Registration center not found                                            | REGISTRATION CENTER Not Found                     |
| KER-SNC-142 | Error occurred while fetching app authorization methods                  | APP AUTHORIZATION METHOD Fetch Exception          |
| KER-SNC-143 | Error occurred while fetching app details                                | APP DETAIL Fetch Exception                        |
| KER-SNC-144 | Error occurred while fetching app role priorities                        | APP ROLE PRIORITY Fetch Exception                 |
| KER-SNC-145 | Error occurred while fetching processList                                | PROCESS LIST Fetch Exception                      |
| KER-SNC-146 | Error occurred while fetching screen authorizations                      | SCREEN AUTHORIZATION Fetch Exception              |
| KER-SNC-147 | Error occurred while fetching Individual types                           | Individual types Fetch Exception                  |
| KER-SNC-148 | Mac-Address and/or Serial Number does not exist                          | INVALID MAC OR SERIAL Number                      |
| KER-SNC-149 | Registration Center has been updated for the received Machine ID         | REG CENTER Updated                                |
| KER-SNC-150 | Error occured while fetching screen detail                               | SCREEN DETAIL Fetch Exception                     |
| KER-SNC-151 | Error occurred while fetching ApplicantValidDocument                     | APPLICANT VALID DOCUMENT Fetch Exception          |
| KER-SNC-152 | Error occurred while fetching Registration Center Machine Device History | REG CENTER MACHINE DEVICE HISTORY Fetch Exception |
| KER-SNC-153 | Error occured while fetching sync job definitons                         | SYNC JOB DEF Fetch Exception                      |
| KER-SNC-154 | Error occured while parsing the response                                 | SYNC JOB DEF Parse Exception                      |
