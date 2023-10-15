# Mock Relying Party

This guide helps in setting up the mock OIDC-relying party portal. This portal uses the authorization code flow with private key JWT client authentication to fetch the user profile.

Mock relying party portal is built with reactJS. This consists of two components:

1. mock-relying-party-ui
2. mock-relying-party-service

## Mock relying party UI

UI component consists of the login page and a user profile page. The login webpage is built with the "Log in with e-Signet" button. With the click of this button, the user is redirected to the authorization endpoint of the e-Signet UI. The user profile `/userprofile` webpage is crafted to which the e-Signet server redirects after successful authentication with `auth-code`. On a load of the user profile webpage, `/fetchUserInfo` endpoint of the mock-relying-party-service is invoked with a valid auth code.


## Mock relying party service

This service only hosts `/fetchUserInfo` endpoint. `/fetchUserInfo` endpoint will invoke `/token` endpoint of the e-Signet server with client_private_jwt auth. On receiving the id-token and access-token from `/token` endpoint, mock-relying-party-service invokes `/userinfo` endpoint of the e-Signet server to fetch user details. Decoded userinfo is returned back as response to `/fetchUserInfo` endpoint.


## How to build and run mock relying party portal in local?

Refer below readme in their respective repositories tobuild and run mock relying party portal.

https://github.com/mosip/esignet-mock-services/tree/release-0.9.X/mock-relying-party-service#build--run-for-developers
https://github.com/mosip/esignet-mock-services/tree/release-0.9.X/mock-relying-party-ui#build--run-for-developers