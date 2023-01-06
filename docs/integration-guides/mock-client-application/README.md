# Mock Relying Party Portal

This guides helps in setting up the mock OIDC relying party portal. This portal uses `authorization code flow` with `private-key-jwt` client authentication to fetch the user profile.

OIDC mock relying party portal is built with reactJS. This consists of 2 components:

1. **OIDC-UI**

UI component consists of login page and the user profile page. Login webpage is built with "Log in with e-Signet" button. On Click of this button user is redirected to authorization endpoint of e-Signet UI. User profile `/userprofile` webpage is crafted to which e-Signet server redirects to after successful authentication with `auth-code`. On load of  Userprofile webpage, `/fetchUserInfo` endpoint of oidc-server is invoked with valid auth-code. 
    
    Required environment variables:
    - IDP_UI_BASE_URL : Base URL of e-signet UI   
    - OIDC_BASE_URL : Based URL of ODIC-server
    - REDIRECT_URI : userprofile page URL of OIDC-UI 
    - CLIENT_ID : Client id as registered with e-signet authentication system
    - ACRS : Space separated list of required auth context references  


2. **OIDC-Server**

This server only hosts `/fetchUserInfo` endpoint. `/fetchUserInfo` endpoint will build the `client_assertion` and sign with the `PRIVATE_KEY` set as environment variable to invoke `/token` endpoint of e-Signet server. On receiving id-token and access-token from /token endpoint, OIDC-Server invokes `/userinfo` endpoint of e-Signet server to fetch user details.

    Required environment variables:
    - IDP_BASE_URL`: e-signet backend server base URL
    - IDP_AUD_URL : Value to be set to "aud" claim of client_assertion for the token endpoint
    - PRIVATE_KEY : Base64 encoded value of private key(JWK) which is used to sign the client_assertion.


## Try with docker compose: TODO


