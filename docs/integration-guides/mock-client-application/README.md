# Mock Relying Party Application

This guides helps you to setup mock OIDC relying party application, capable of following authorization code flow with private-key-jwt client authentication to fetch user profile.

OIDC mock relying party application is built with reactJS. This consists of 2 components:

1. OIDC-UI

    UI component consists of login page and user profile page. Login webpage is built with a button "Log in with e-Signet". On Click of this button user is redirected to authorization endpoint of e-signet UI. User profile /userprofile is crafted to be the URL to which e-signet server redirects with auth-code after successful authentication in e-signet portal. Userprofile page invokes /fetchUserInfo endpoint of oidc-server with valid auth-code and other client details. 
    
    Required environment variables:
    - IDP_UI_BASE_URL : Base URL of e-signet UI   
    - OIDC_BASE_URL : Based URL of ODIC-server
    - REDIRECT_URI : userprofile page URL of OIDC-UI 
    - CLIENT_ID : Client id as registered with e-signet authentication system
    - ACRS : Space separated list of required auth context references  


2. OIDC-Server

    Server is responsible to invoke token endpoint with valid client_assertion and then call userinfo endpoint of e-signet server to fetch user details with a valid access-token.

    Required environment variables:
    - IDP_BASE_URL : e-signet backend server base URL
    - IDP_AUD_URL : Value to be set to "aud" claim of client_assertion for the token endpoint
    - PRIVATE_KEY : Base64 encoded value of private key(JWK) which is used to sign the client_assertion.


## Try with docker compose: TODO


