# Mock Relying Party

This guide helps in setting up the mock OIDC-relying party portal. This portal uses the authorization code flow with private key JWT client authentication to fetch the user profile.

The mock relying party portal is built with reactJS. This consists of the below two components:

1. mock-relying-party-ui
2. mock-relying-party-service

## Mock relying party UI

UI component consists of the login page and a user profile page.

The login webpage is built with the `Log in with eSignet` button. With the click of this button, the user is redirected to the authorization endpoint of the eSignet UI.

The user profile "_**/userprofile**_" webpage is crafted to which the eSignet server redirects after successful authentication with "_**auth-code**_".

On a load of the user profile webpage, the "_**/fetchUserInfo**_" endpoint of the mock-relying-party service is invoked with a valid auth code.

## Mock relying party service

This service only hosts the "_**/fetchUserInfo**_" endpoint.

The "_**/fetchUserInfo**_" endpoint will invoke the "_**/token**_" endpoint of the eSignet server with client\_private\_jwt auth.

On receiving the id-token and access-token from the "_**/token**_" endpoint, the mock-relying-party-service invokes the "_**/userinfo**_" endpoint of the eSignet server to fetch user details. Decoded user info is returned as the response to the "_**/fetchUserInfo**_" endpoint.

## How to build and run the mock relying party portal locally?

To build and run the mock relying party portal please refer to the below README.md file

{% embed url="https://github.com/mosip/esignet-mock-services/blob/master/docker-compose/README.md" %}
