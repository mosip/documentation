# Configuring Resident OIDC Client

Below are the steps to create the Resident OIDC client as standard steps in DevOps after e-Signet and Resident deployment.

## Pre-requisites

1.  Have a user created in keycloak with the below roles as needed for the Authorization token in the API requests:

    i. ZONAL\_ADMIN,

    ii. PARTNER\_ADMIN,

    iii. POLICY\_MANAGER,

    iv. MISP\_PARTNER,

    v. PMS\_ADMIN
2. Authenticating user to take the token and use it in all APIs invoked in further steps:

* **Swagger URL** - https://api-internal.dev2.mosip.net/v1/authmanager/swagger-ui/index.html?configUrl=/v1/authmanager/v3/api-docs/swagger-config#/authmanager/getAllAuthTokens
* **Request Body**:

```
{
  "id": "string",
  "version": "string",
  "requesttime": "2023-01-04T11:49:29.007Z",
  "metadata": {},
  "request": {
    "userName": "balaji",
    "password": "mosip123",
    "appId": "partner",
    "clientId": "mosip-pms-client",
    "clientSecret": "*****"
  }
}
```

## Step-by-step process to create and configure the Resident OIDC client

### I. Create Auth Partner for Resident OIDC Client

**Step 1**: Creating a policy group for resident OIDC Client

* Note: Since policymanager service swagger does not work, you can use postman for APIs in it.
* POST - `https://api-internal.dev2.mosip.net/v1/policymanager/policies/group/new`

**Request Body**:

```
{
  "id": "string",
  "version": "string",
  "requesttime": "2023-01-04T11:52:19.734Z",
  "metadata": {},
  "request": {
    "name": "Resident OIDC Client Policy Group",
    "desc": "Resident OIDC Client Policy Group"
  }
}
```

* Make note of the `prolicyGroupId` from the response.

**Step 2**: Creating a policy for Resident OIDC client

POST - https://api-internal.dev2.mosip.net/v1/policymanager/policies

**Request Body**:

```
{
	"id": "",
	"metadata": null,
	"request": {
		"policyId": "resident-oidc-client-policy",
		"name": "resident-oidc-client-policy",
		"desc": "Resident OIDC Client Policy",
		"policies": {
			"authTokenType": "policy",
			"allowedKycAttributes": [{
				"attributeName": "fullName"
			}, {
				"attributeName": "gender"
			}, {
				"attributeName": "residenceStatus"
			}, {
				"attributeName": "dateOfBirth"
			}, {
				"attributeName": "photo"
			}, {
				"attributeName": "phone"
			}, {
				"attributeName": "email"
			}, {
				"attributeName": "individual_id"
			}],
			"allowedAuthTypes": [{
				"authSubType": "IRIS",
				"authType": "bio",
				"mandatory": false
			}, {
				"authSubType": "FINGER",
				"authType": "bio",
				"mandatory": false
			}, {
				"authSubType": "FACE",
				"authType": "bio",
				"mandatory": false
			}, {
				"authSubType": "",
				"authType": "otp",
				"mandatory": false
			}, {
				"authSubType": "",
				"authType": "otp-request",
				"mandatory": false
			}, {
				"authSubType": "",
				"authType": "kyc",
				"mandatory": false
			}, {
				"authSubType": "",
				"authType": "demo",
				"mandatory": false
			}, {
				"authSubType": "",
				"authType": "kycauth",
				"mandatory": false
			}, {
				"authSubType": "",
				"authType": "kycexchange",
				"mandatory": false
			}]
		},
		"policyGroupName": "Resident OIDC Client Policy Group",
		"policyType": "Auth",
		"version": "1.1"
	},
	"version": "1.0",
	"requesttime": "2022-12-29T13:12:28.479Z"
}
```

**Step 3**: Publishing policy

POST - https://api-internal.dev2.mosip.net/v1/policymanager/policies/\{{policyId\}}/group/\{{policyGroupId\}}/publish Path params: \* `policyId` - resident-oidc-client-policy \* `policyGroupId` - from previous response

**Step 4**: Resident OIDC Client Partner self registration

**Swagger URL**: https://api-internal.dev2.mosip.net/v1/partnermanager/swagger-ui/index.html?configUrl=/v1/partnermanager/v3/api-docs/swagger-config#/partner-service-controller/partnerSelfRegistration

**Request Body**:

```
{
  "id": "string",
  "version": "string",
  "requesttime": "2023-01-04T12:01:37.001Z",
  "metadata": {},
  "request": {
    "partnerId": "resident-oidc-client-partner",
    "policyGroup": "Resident OIDC Client Policy Group",
    "organizationName": "IITB",
    "address": "bangalore",
    "contactNumber": "6483839992",
    "emailId": "resident-oidc-client-partner1@mosip.com",
    "partnerType": "Auth_Partner",
    "langCode": "eng"
  }
}
```

**Step 5**: Upload ROOT Certificate as CA certificate

i. Get certificate from keymanager with below parameters:

* **Swagger URL**: https://api-internal.dev2.mosip.net/v1/keymanager/swagger-ui/index.html?configUrl=/v1/keymanager/v3/api-docs/swagger-config#/keymanager/getCertificate
* `AppID: "ROOT", refID: ""`

ii. Uploaded it as CA certificate:

* **Swagger URL** - https://api-internal.dev2.mosip.net/v1/partnermanager/swagger-ui/index.html?configUrl=/v1/partnermanager/v3/api-docs/swagger-config#/partner-service-controller/uploadCACertificate

**Request Body** (Example only):

```
{
  "id": "string",
  "version": "string",
  "requesttime": "2023-01-04T12:05:36.167Z",
  "metadata": {},
  "request": {
    "certificateData": "-----BEGIN CERTIFICATE-----\nMIIDpzCCAo+gAwIBAgII6l7mtDAeV24wDQYJKoZIhvcNAQELBQAwcDELMAkGA1UE\nBhMCSU4xCzAJBgNVBAgMAktBMRIwEAYDVQQHDAlCQU5HQUxPUkUxDTALBgNVBAoM\nBElJVEIxGjAYBgNVBAsMEU1PU0lQLVRFQ0gtQ0VOVEVSMRUwEwYDVQQDDAx3d3cu\nbW9zaXAuaW8wHhcNMjIxMjAyMTI0MzE2WhcNMzAxMTMwMTI0MzE2WjBwMQswCQYD\nVQQGEwJJTjELMAkGA1UECAwCS0ExEjAQBgNVBAcMCUJBTkdBTE9SRTENMAsGA1UE\nCgwESUlUQjEaMBgGA1UECwwRTU9TSVAtVEVDSC1DRU5URVIxFTATBgNVBAMMDHd3\ndy5tb3NpcC5pbzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMUC+wOQ\n87BDOLL3kuRwpmobe528+lD/YrlR+crplYw0Rt2a76DJZZVBDQuuqPEjIQmrdROR\n6sScsVpHeJRleoPuckSrG5BgtLQDKT9wrMVIInnT3wUt2Yrm4HIEzldv3IYBLLeM\n6KOtaO5Zrtq030sS5nQngyt//Fi3OjIzFRuDIBUdIsWst3ctqKPJNCXc27G6FxSi\nwUiZ1QTvcRsqOrMU4EBzkg/+6wa2tz3IUHUiT3mwuzBriUkY1CA6ZTTtLHow0iiH\nOJaBdwoGFsBH9qDPJyuotcrLRuWghtZ+gIp+25aenPdxqudzqJyGQbJ4X9OjIFRI\nfFbJZx+h98/4NMsCAwEAAaNFMEMwEgYDVR0TAQH/BAgwBgEB/wIBAjAdBgNVHQ4E\nFgQU+SkfP3g/n4j8c0Evl64iOk3fL78wDgYDVR0PAQH/BAQDAgKEMA0GCSqGSIb3\nDQEBCwUAA4IBAQBRbJYyjb77Q0So1xoHL18aNvQTvB2pjhW9BOFpXDrrF/nzI2sd\nye/pypM97dktpncIm9v/vTenyFOJRrtU9DzkBkuI+TfjQDPHoYGiLtT8OaFwZ5OD\nf6XVCptIm0IAeoqbEA9n+ovQ8s8iuKRUyYOnOHNqMffYBBCfXKOJwtRvrzHykvLI\n31RWye2NllNrT6cpz8f7v8QSZlIpcg8J0n62hao+NLbjWvqLYS9DVoqKjM/+gHOK\nqrxDD9brR8Tbi8DKm+wGk6yK/ebW2CtrK6euV0zCD7Qu2mZ1wOttyAbID0bXUV+o\nyoPx1FYS4jHjATEzypS9IftVYvU53W/TUMgt\n-----END CERTIFICATE-----\n",
    "partnerDomain": "Auth"
  }
}
```

**Step 6**: Upload RESIDENT certificate as CA certificate

i. Get certificate from keymanager with below parameters:

* **Swagger URL**: https://api-internal.dev2.mosip.net/v1/keymanager/swagger-ui/index.html?configUrl=/v1/keymanager/v3/api-docs/swagger-config#/keymanager/getCertificate
* `AppID: "RESIDENT", refID: ""`

ii. Uploaded it as CA certificate:

**Swagger URL** - https://api-internal.dev2.mosip.net/v1/partnermanager/swagger-ui/index.html?configUrl=/v1/partnermanager/v3/api-docs/swagger-config#/partner-service-controller/uploadCACertificate

**Request Body** (Example only):

```
{
  "id": "string",
  "version": "string",
  "requesttime": "2023-01-04T12:05:36.167Z",
  "metadata": {},
  "request": {
    "certificateData": "-----BEGIN CERTIFICATE-----\nMIIDpzCCAo+gAwIBAgII6l7mtDAeV24wDQYJKoZIhvcNAQELBQAwcDELMAkGA1UE\nBhMCSU4xCzAJBgNVBAgMAktBMRIwEAYDVQQHDAlCQU5HQUxPUkUxDTALBgNVBAoM\nBElJVEIxGjAYBgNVBAsMEU1PU0lQLVRFQ0gtQ0VOVEVSMRUwEwYDVQQDDAx3d3cu\nbW9zaXAuaW8wHhcNMjIxMjAyMTI0MzE2WhcNMzAxMTMwMTI0MzE2WjBwMQswCQYD\nVQQGEwJJTjELMAkGA1UECAwCS0ExEjAQBgNVBAcMCUJBTkdBTE9SRTENMAsGA1UE\nCgwESUlUQjEaMBgGA1UECwwRTU9TSVAtVEVDSC1DRU5URVIxFTATBgNVBAMMDHd3\ndy5tb3NpcC5pbzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMUC+wOQ\n87BDOLL3kuRwpmobe528+lD/YrlR+crplYw0Rt2a76DJZZVBDQuuqPEjIQmrdROR\n6sScsVpHeJRleoPuckSrG5BgtLQDKT9wrMVIInnT3wUt2Yrm4HIEzldv3IYBLLeM\n6KOtaO5Zrtq030sS5nQngyt//Fi3OjIzFRuDIBUdIsWst3ctqKPJNCXc27G6FxSi\nwUiZ1QTvcRsqOrMU4EBzkg/+6wa2tz3IUHUiT3mwuzBriUkY1CA6ZTTtLHow0iiH\nOJaBdwoGFsBH9qDPJyuotcrLRuWghtZ+gIp+25aenPdxqudzqJyGQbJ4X9OjIFRI\nfFbJZx+h98/4NMsCAwEAAaNFMEMwEgYDVR0TAQH/BAgwBgEB/wIBAjAdBgNVHQ4E\nFgQU+SkfP3g/n4j8c0Evl64iOk3fL78wDgYDVR0PAQH/BAQDAgKEMA0GCSqGSIb3\nDQEBCwUAA4IBAQBRbJYyjb77Q0So1xoHL18aNvQTvB2pjhW9BOFpXDrrF/nzI2sd\nye/pypM97dktpncIm9v/vTenyFOJRrtU9DzkBkuI+TfjQDPHoYGiLtT8OaFwZ5OD\nf6XVCptIm0IAeoqbEA9n+ovQ8s8iuKRUyYOnOHNqMffYBBCfXKOJwtRvrzHykvLI\n31RWye2NllNrT6cpz8f7v8QSZlIpcg8J0n62hao+NLbjWvqLYS9DVoqKjM/+gHOK\nqrxDD9brR8Tbi8DKm+wGk6yK/ebW2CtrK6euV0zCD7Qu2mZ1wOttyAbID0bXUV+o\nyoPx1FYS4jHjATEzypS9IftVYvU53W/TUMgt\n-----END CERTIFICATE-----\n",
    "partnerDomain": "Auth"
  }
}
```

**Step 7**: Upload `RESIDENT : IDP_USER_INFO` certificate as Partner certificate

i. Get certificate from keymanager with below parameters:

* **Swagger URL:** https://api-internal.dev2.mosip.net/v1/keymanager/swagger-ui/index.html?configUrl=/v1/keymanager/v3/api-docs/swagger-config#/keymanager/getCertificate
* `AppID: "RESIDENT", refID: "IDP_USER_INFO"`

ii. Uploaded it as Partner certificate:

**Swagger URL** - https://api-internal.dev2.mosip.net/v1/partnermanager/swagger-ui/index.html?configUrl=/v1/partnermanager/v3/api-docs/swagger-config#/partner-service-controller/uploadPartnerCertificate

**Request Body** (Example only):

```
{
  "id": "string",
  "version": "string",
  "requesttime": "2023-01-04T12:08:21.575Z",
  "metadata": {},
  "request": {
    "partnerId": "resident-oidc-client-partner",
    "certificateData": "-----BEGIN CERTIFICATE-----\nMIIDwjCCAqqgAwIBAgIIoRmb9yY4CKEwDQYJKoZIhvcNAQELBQAwezELMAkGA1UE\nBhMCSU4xCzAJBgNVBAgMAktBMRIwEAYDVQQHDAlCQU5HQUxPUkUxDTALBgNVBAoM\nBElJVEIxJTAjBgNVBAsMHE1PU0lQLVRFQ0gtQ0VOVEVSIChSRVNJREVOVCkxFTAT\nBgNVBAMMDHd3dy5tb3NpcC5pbzAeFw0yMzAxMDUxMDUxNTVaFw0yNTAxMDQxMDUx\nNTVaMIGFMQswCQYDVQQGEwJJTjELMAkGA1UECAwCS0ExEjAQBgNVBAcMCUJBTkdB\nTE9SRTENMAsGA1UECgwESUlUQjElMCMGA1UECwwcTU9TSVAtVEVDSC1DRU5URVIg\nKFJFU0lERU5UKTEfMB0GA1UEAwwWUkVTSURFTlQtSURQX1VTRVJfSU5GTzCCASIw\nDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOnf8SAV5eGquoY14fm9VJek1lhw\n66XuCerkrKdh/z1rIWQ/FqPuYknDj9NZJJAlVREW6JHo+6KQrHc9tPbE023GGh/I\nVsE7aA+0BuuNqpc8VqU2lq7gyFJkcFMY5zwVZQAfKr5Pupjshrc6ctfU+ODA6Xf4\n7mu6h6JkFiGRrMqmUDpbUvdNlx/qFTA2HvzUDifGxR5xUyRqNXGHodlRDKBkfNDh\no/fDlmR34bLCU+yGX1ItUMcdD2E0OJ8eM96YZBMNS0GG16xCl75wPgi5e2bd2sC9\nlL10nwsPNiJE5hQ4oPKf105bITgY35vhe9NLFFxNZRLQDhdF1ntJkO7A0X0CAwEA\nAaM/MD0wDAYDVR0TAQH/BAIwADAdBgNVHQ4EFgQUEnfeQxn8dsw2R71FnysdyTHB\nHrAwDgYDVR0PAQH/BAQDAgUgMA0GCSqGSIb3DQEBCwUAA4IBAQAnMYSL5ZmRqwLC\n07atGZf8Ur2YSJehKTRuNZMSYkujvXfGhFb58AxcUv3NPFhDq7xfV0qdPzKaZFlZ\nynPqc/Zkof+mPDKWH7iEj+nnFtjJ472RXtUeMsHOBrGKz5w1+sjF/P8Cj0PXyel5\nSVhodOv314hWJEwNw8djiwDPmR7ABCNorGTaP7yjc525abEZf8LYEBSoi6LvoMhV\n/bBMIV91rpi36Xl0spJVc8sg6ProjJPRqMBXhmlurxovmMgBQek2we7f/ZYN3EL+\nMi8XW1N7zHcbLUgj6/eLMZa+yTBN4uirFEwyfok2snbNB/1bXmEfNNUY7P5FdBvM\nDnn2U+wG\n-----END CERTIFICATE-----\n",
    "partnerDomain": "Auth"
  }
}
```

**Step 8**: Create policy Mapping request:

* **Swagger URL:** https://api-internal.dev2.mosip.net/v1/partnermanager/swagger-ui/index.html?configUrl=/v1/partnermanager/v3/api-docs/swagger-config#/partner-service-controller/mapPolicyToPartner
* Path param:
  * `partnerId` : resident-oidc-client-partner

**Request Body**:

```
{
  "id": "string",
  "version": "string",
  "requesttime": "2023-01-04T13:18:11.206Z",
  "metadata": {},
  "request": {
    "policyName": "resident-oidc-client-policy",
    "useCaseDescription": "resident-oidc-client-policy"
  }
}
```

**Output**:

```
{
  "id": "string",
  "version": "string",
  "responsetime": "2023-01-04T12:10:57.353Z",
  "metadata": null,
  "response": {
    "mappingkey": "834602",
    "message": "Policy mapping request submitted successfully."
  },
  "errors": []
}
```

Make not of the `mappingKey`.

**Step 9**: Approve policy mapping:

**Swagger URL** - https://api-internal.dev2.mosip.net/v1/partnermanager/partners/policy/\{{mapping key\}}

_Note: This mapping key will be returned as an output from policy mapping request._

**Request Body**:

```
{
  "id": "string",
  "version": "string",
  "requesttime": "2023-01-04T12:13:15.114Z",
  "metadata": {},
  "request": {
    "status": "APPROVED"
  }
}
```

## II. Creating Resident OIDC Client

**Step 1**: Prepare the RESIDENT JWKS public key JSON.

**i. Get certificate from keymanager with below parameters**

* **Swagger URL**: https://api-internal.dev2.mosip.net/v1/keymanager/swagger-ui/index.html?configUrl=/v1/keymanager/v3/api-docs/swagger-config#/keymanager/getCertificate
* `AppID: "RESIDENT", refID: ""`

**ii. Store the certificate as `resident-oidc.cer`file. Make sure to replace  chars with line breaks and save it**\*

**iii. Get the KeyID of the above certificate using Get All Certificates API**

* **Swagger URL**: https://api-internal.dev2.mosip.net/v1/keymanager/swagger-ui/index.html?configUrl=/v1/keymanager/v3/api-docs/swagger-config#/keymanager/getAllCertificates
* `AppID: "RESIDENT", refID: ""`

From the response get the `keyId`. This will be the `kid` attribute in the OIDC client creation step.

**iv. Get JWKS public key JSON from certificate**

Use the `certpem2jwksjson.jar` with below command to get the JWKS of that. (Attached the Java code of that for creating automted step of this)

```
java -jar certpem2jwksjson.jar resident-oidc.cer 
```

In the console, the JSON text of the public key of the certificate will be printed. Copy it.

**v. Correct the `kid` in JWKS public key JSON**

In the JSON public key, replace the `kid` value with the `keyId` in the earlier step.

**Step 2: Create the OIDC client in PMS**

**Swagger URL**: https://api-internal.dev2.mosip.net/v1/partnermanager/swagger-ui/index.html?configUrl=/v1/partnermanager/v3/api-docs/swagger-config#/client-management-controller/createClient

In the request body, make sure to replace thebelow attributes:

1. `publicKey` - the JWKS public key JSON from earlier step
2. `logoUri` - Correct hostname for the Resident UI
3. `redirectUris` - Correct the hostname for Resident Service

**Request Body** (Example only):

```
{
	"id": "string",
	"version": "string",
	"requesttime": "2023-01-04T12:15:14.854Z",
	"metadata": {},
	"request": {
		"name": "resident-oidc-client",
		"policyName": "resident-oidc-client-policy",
		"publicKey": {
			"kty": "RSA",
			"e": "AQAB",
			"use": "sig",
			"kid": "RbW-bNIihYlr2GWVyqIgshHHFxe2pIkkvdTp_Iedmic",
			"alg": "RS256",
			"n": "AMROKZuU_9xeybzmZdRHLCpJqh1ThfHtEf_Vbbm11TpfDno0-eoYga-y8YuLBTW8jKIffhB8UdScnkmtG0m71qNMvyjNa01IcX_C2yGZCmMZt6o57R6Pyc4ygIQojnb-_iumbiJBlwdm4alyCAxbZes4EaodFjWZakmdEGt7cezKF3RCaeateAPQ8slWq6RREn3BmKdE1VMOmvNNQTbbSh5wJzSwlgSbaNHuhhsjci98bkbnvssxs5ad9-UuT4T4_0yi9nQFQ530kXRW_IAhavzY-g_RjLpRwakUFxPsb8BL2Y6TbGk0WOm9kN-Rir1ef7woK4pVMX5_SbOT785Iczs="
		},
		"authPartnerId": "resident-oidc-client-partner",
		"logoUri": "https://resident.dev2.mosip.net/assets/logo.png",
		"redirectUris": [
			"https://api-internal.dev2.mosip.net/resident/v1/login-redirect/**"
		],
		"grantTypes": [
			"authorization_code"
		],
		"clientAuthMethods": [
			"private_key_jwt"
		]
	}
}
```

The response will contain the Resident OIDC client ID in `clientId` attribute.

**Step 3**: Configure the Resident OIDC client in `resident-default.properties`.

Configure the above obtained Resident OIDC client ID `resident-default.properties` with property name `mosip.iam.module.clientID`.

_Note: This will need a restart of the resident service if it is already deployed._
