# Relying Party Integration (MOSIP)

## Overview

1.  How to register OIDC with IDP?

    a. Get registered with MOSIP [Partner Management System](https://docs.mosip.io/1.2.0/modules/partner-management-services).

    b. Login into Partner management system.

    c. Trigger flowing APIs to register a OIDC client app to IDP

### Create OIDC API Endpoint

POST https://dev.mosip.net/v1/idp/client-mgmt/oidc-client

```
REQUEST BODY (application/json)
{
	"requestTime": "2011-10-05T14:48:00.000Z",
	"request": {
		"clientId": "e-health-service",
		"clientName": "Health Service",
		"relyingPartyId": "bharath-gov",
		"logoUri": "http://example.com",
		"publicKey": {},
		"authContextRefs": [
			"mosip:idp:acr:static-code"
		],
		"userClaims": [
			"name"
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

```
RESPONSE BODY (application/json)

{
	"responseTime": "string",
	"response": {
		"clientId": "string"
	},
	"errors": [
		{
			"errorCode": "duplicate_client_id",
			"errorMessage": "string"
		}
	]
}
```

d. To update OIDC client details trigger below api

• Update OIDC API Endpoint

PUT https://dev.mosip.net/v1/idp/client-mgmt/oidc-client/{client\_id}

```
REQUEST BODY (application/json)

{
	"requestTime": "2022-09-22T08:03:45.000Z",
	"request": {
		"clientName": "Health Service",
		"status": "active",
		"logoUri": "http://example.com",
		"redirectUris": [
			"http://example.com"
		],
		"userClaims": [
			"name"
		],
		"authContextRefs": [
			"mosip:idp:acr:static-code"
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

```
RESPONSE BODY (application/json)

{
	"responseTime": "string",
	"response": {
		"clientId": "string"
	},
	"errors": [
		{
			"errorCode": "invalid_client_id",
			"errorMessage": "string"
		}
	]
}
```

1. How to integrate OIDC with IDP? Step 1 : Create a button on your OIDC app (i.e, Login with MOSIP), which will navigate the user to IDP-UI for authentication and consent capture.

• OIDC Authorization endpoint GET https://dev.mosip.net/v1/idp/authorize should be the redirect URI for the button with the following query parameters

• client\_id\*: string

• redirect\_uri\*: string

• response\_type\*: code

• scope\*: openid profile (Options - openid, profile, email, address, phone, offline\_access)

• acr\_values: string

• claims: string

• claims\_locales: string

• display: page (Options - page, popup, touch, wap)

• max\_age: number

• nonce: string

• prompt: none (Options - none, login, consent, select\_account)

• state: string

• ui\_locales: string

```
  Step2. Create a web page where user will be redirect to after login in and accepting the claims.
The URL of this page should be passed as a query parameter in the authorize api mentioned above.
The user will be redirect to this URL with the below query parameters.
a. General parameters
```

◦ nonce: string ◦ state: string ◦ b. On successfull transaction • code: string

```
c. On transaction failure
```

• error: string • error\_description: string

```
The webpage should handle the below cases.
```

1. On a succesful transaction, the webpage will receive “code” query parameter which is authcode. • OIDC client app should trigger token API (mentioned below), with the “code” received in the query parameter, to fetch auth token from IDP service. • Once received, OIDC client app should then use the token in userInfo API endpoint (mentioned below), to fetch user information.
2. On failure, the webpage will receive “error” and “error\_description”(optional) query parameter. The OIDC client can define its behaviour for failure case.

• Token API Endpoint

```
POST https://dev.mosip.net/v1/idp/oauth/token
```

REQUEST BODY (application/x-www-form-urlencoded)

• grant\_type\*: authorization\_code • code\*: string • client\_id\*: string • client\_assertion\_type\*: urn:ietf:params:oauth:client-assertion-type:jwt-bearer • client\_assertion\*: string • redirect\_uri\*: string

```
RESPONSE BODY(application/json)
{
	"id_token": "string",
	"access_token": "string",
	"token_type": "Bearer",
	"expires_in": 0
}
```

• UserInfo API Endpoint

```
GET https://dev.mosip.net/v1/idp/oidc/userinfo
```

REQUEST HEADER Authorization: string

Note: Bearer

RESPONSE BODY (application/jwt) string

Note : The response is signed and then encrypted, with the result being a Nested JWT. Signed using IDA server's private key. Signed full JWT will then be encrypted using OIDC client's public key.

1. Work flow diagram.
