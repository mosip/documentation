# Relying Party Integration

## Pre-requisites

Connect with an Authentication Partner who is using the e-Signet solution for onboarding relying parties. As part of this activity, you should receive the environment details and a client ID.

You can use our sandbox environment to integrate as well. For more details visit our page on [Sandbox Details](sandbox-details.md).

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
