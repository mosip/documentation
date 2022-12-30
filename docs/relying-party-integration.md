# Relying Party Integration

The relying party is an `OAuth` client which requires to authenticate the user and get user claims from IdP.
For example, in MOSIP, the auth-partner is considered as a relying party. A partner may register one or more than one OIDC clients with an unique public-key.
Auth policy mapped to auth partner must provision the below `allowedAuthTypes`.
* kycauth
* kycexchange
* otp-request

## Pre-requisites

Connect with an Authentication Partner who is using the e-Signet solution for onboarding relying parties. As a part of this activity, you should receive the environment details and a client ID.

You can use our sandbox environment to integrate as well. For more details visit our page on [Sandbox Details](sandbox-details/).

## Integration Steps

### Configuring the redirect URI

Create a webpage where the user would be redirected after authentication is successful and consent is provided. The URL of this page should be shared as a query parameter as part of the Authorization Endpoint.

{% hint style="info" %}
Please make sure that the redirect URI is also shared with the Authentication Partner to configure the same in the e-Signet server.
{% endhint %}

### Add a button on your login screen

Add a button on your website (i.e, Log in with Signet), which should call the authorization endpoint and navigate the user to the e-Signet UI screen for authentication and consent capture.

{% swagger src=".gitbook/assets/Identity-Provider.yml" path="/authorize" method="get" %}
[Identity-Provider.yml](.gitbook/assets/Identity-Provider.yml)
{% endswagger %}

After the authorization endpoint is called, the e-Signet server validates the request and redirects the user to the authentication screen.

### Handling authentication success and failure scenarios

After the authentication is performed successfully, the webpage will receive a "code" in the query parameter which is the "authorization code" to call the token API to get the ID and Access tokens.

In case of failure, the redirect URI webpage would receive an "error" and "error description" in the query parameter. The OIDC client can also define its behaviour in case of failure.

### Retrieving ID and access tokens

Once the authentication code is received, you can now call the token endpoint to get the ID and Access tokens.

{% swagger src=".gitbook/assets/Identity-Provider.yml" path="/oauth/token" method="post" %}
[Identity-Provider.yml](.gitbook/assets/Identity-Provider.yml)
{% endswagger %}

### Retrieving user info

Using the access token you can call the user info endpoint to get the user information as an encrypted JWT.

{% swagger src=".gitbook/assets/Identity-Provider.yml" path="/oidc/userinfo" method="get" %}
[Identity-Provider.yml](.gitbook/assets/Identity-Provider.yml)
{% endswagger %}

{% hint style="info" %}
The response is signed and then encrypted, with the result being a nested JWT. Signed using the authentication system's private key. Signed full JWT will then be encrypted using the OIDC client's public key.
{% endhint %}


  How to get credentials or register for IdP
    Non-MOSIP deployment:
      https://mosip.stoplight.io/docs/identity-provider/branches/main/e5bf97e265109-create-oidc-client-endpoint
      https://mosip.stoplight.io/docs/identity-provider/branches/main/6081c36c68d08-update-oidc-client-endpoint
    MOSIP-deployment:
      In the mosip deployment, Auth partners are considered as relying parties, creating of oidc client under each auth-partner
      is provisioned. An auth-partner can have multiple oidc clients.
      Auth-partner's are mapped with one or more policies. Policy defines the registered/supported authentication factors and kyc attributes. 
      An oidc client is created for an auth-partner with a particular policy via pms portal.
      Pms portal, resolves the ACRs and user claims based on the mapped policy. 
      pms service internally calls client-mgmt apis of IDP-service and raises a websub event to IDA to create the client details respective databases.
      single point API to create/update OIDC client in IDP and IDA is 
      POST https://api-internal.dev.mosip.net/v1/partnermanager/oidc/client
      PUT https://api-internal.dev.mosip.net/v1/partnermanager/oidc/client
