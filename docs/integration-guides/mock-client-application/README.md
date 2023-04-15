# Mock Relying Party

This guide helps in setting up the mock OIDC-relying party portal. This portal uses the authorization code flow with private key JWT client authentication to fetch the user profile.

OIDC mock relying party portal is built with reactJS. This consists of 2 components:

1. OIDC-UI
2. OIDC-Server

## OIDC UI

UI component consists of the login page and a user profile page. The login webpage is built with the "Log in with e-Signet" button. With the click of this button, the user is redirected to the authorization endpoint of the e-Signet UI. The user profile `/userprofile` webpage is crafted to which the e-Signet server redirects after successful authentication with `auth-code`. On a load of the user profile webpage, `/fetchUserInfo` endpoint of the OIDC server is invoked with a valid auth code.

### Required environment variables

* ESIGNET\_UI\_BASE\_URL: MOSIP e-Signet UI URL (Example: https://esignet.dev.mosip.net/)
* MOCK\_RELYING\_PARTY\_SERVER\_URL: This will be internally resolved to mock relying party server by internal nginx (Example: http://esignet.dev.mosip.net/mock-relying-party-server)
* REDIRECT\_URI: Value that needs to be passed into authorize redirect\_uri parameter (Example: https://health-services.com/userprofile)
* CLIENT\_ID: The relying party client Id, that is registered with MOSIP (Example: health-services)
* ACRS: Value that needs to be passed into authorize acr\_values parameter (Example: mosip:esignet:acr:generated-code)

## **OIDC Server**

This server only hosts `/fetchUserInfo` endpoint. `/fetchUserInfo` endpoint will build the `client_assertion` and sign with the `PRIVATE_KEY` set as an environment variable to invoke `/token` endpoint of the e-Signet server. On receiving the id-token and access-token from `/token` endpoint, OIDC-Server invokes `/userinfo` endpoint of the e-Signet server to fetch user details.

### Required environment variables

* ESIGNET\_SERVICE\_URL: MOSIP e-Signet API URL (Example: http://esignet.esignet/v1/esignet)
* ESIGNET\_AUD\_URL: Value to be set to "aud" claim of client\_assertion for the token endpoint
* CLIENT\_PRIVATE\_KEY: Base64 encoded value of the private key (JWK) which is used to sign the client\_assertion.
