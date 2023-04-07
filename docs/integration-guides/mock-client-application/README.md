# Mock Relying Party Portal

This guides helps in setting up the mock OIDC relying party portal. This portal uses `authorization code flow` with `private-key-jwt` client authentication to fetch the user profile.

OIDC mock relying party portal is built with reactJS. This consists of 2 components:

1. **OIDC-UI**

UI component consists of login page and the user profile page. Login webpage is built with "Log in with e-Signet" button. On click of this button, the user is redirected to authorization endpoint of e-Signet UI. User profile `/userprofile` webpage is crafted to which e-Signet server redirects to after successful authentication with `auth-code`. On load of  Userprofile webpage, `/fetchUserInfo` endpoint of oidc-server is invoked with valid auth-code. 
    
    Required environment variables:
    - ESIGNET_UI_BASE_URL: MOSIP ESIGNET UI URL (Example:https://esignet.dev.mosip.net/)
    - MOCK_RELYING_PARTY_SERVER_URL: This will be internally resolved to Mock relying party server by internal nginx (Example:http://esignet.dev.mosip.net/mock-relying-party-server)
    - REDIRECT_URI: Value that needs to be passed into authorize redirect_uri parameter (Example:https://health-services.com/userprofile)
    - CLIENT_ID: Relying Party client Id, that is registered with MOSIP (Example:health-services)
    - ACRS: Value that needs to be passed into authorize acr_values parameter (Example:mosip:esignet:acr:generated-code)

2. **OIDC-Server**

This server only hosts `/fetchUserInfo` endpoint. `/fetchUserInfo` endpoint will build the `client_assertion` and sign with the `PRIVATE_KEY` set as environment variable to invoke `/token` endpoint of e-Signet server. On receiving id-token and access-token from `/token` endpoint, OIDC-Server invokes `/userinfo` endpoint of e-Signet server to fetch user details.

    Required environment variables:
    - ESIGNET_SERVICE_URL: MOSIP ESIGNET API URL (Example:http://esignet.esignet/v1/esignet)
    - ESIGNET_AUD_URL : Value to be set to "aud" claim of client_assertion for the token endpoint
    - CLIENT_PRIVATE_KEY : Base64 encoded value of private key(JWK) which is used to sign the client_assertion.
