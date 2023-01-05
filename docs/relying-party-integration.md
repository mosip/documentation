# Relying Party

The relying party is an OAuth client who should be able to authenticate the end user and get the user information. For availing these [features](architecture/features.md), the relying party needs to partner with an e-Signet-compliant authentication system to register and integrate.

## Pre-requisites

Connect with an authentication system which uses the e-Signet solution for onboarding relying parties. As a part of this activity, you should receive the environment details and register yourself to receive a client ID.

You can use our sandbox environment to integrate as well. For more details visit our page on [Sandbox Details](sandbox-details/).

## Integration steps

### Configuring the redirect URI

Create a webpage where the user is redirected after successful authentication and consent is provided. The URL of this page should be shared as a query parameter as part of the Authorization Endpoint.

{% hint style="info" %}
Ensure that the redirect URI is also shared with the Authentication Partner to configure the same in the e-Signet server.
{% endhint %}

### Add a button on your login screen

Add a button on your website (i.e, Log in with e-Signet), which should call the authorization endpoint and navigate the user to the e-Signet UI screen for authentication and consent capture.

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

**Sample ID-token**

```
header: 
{
  "kid": "NOt7BZBkG4nAAX0vE_-S4wT8S5cKUqDTLPOyaTJAu_w",
  "alg": "RS256"
}
```

```
payload: 
{
  "at_hash": "ggJyqKcuYHdwARpWzeHKMMgDdRRNe61oN6O7xzEuyiY",
  "sub": "268524736272681240519736297238054502",
  "aud": "yzLgU7sj8fr2qcqL-MZjwYnl-5ADiClp7Ycj8LiUV5I",
  "acr": "mosip:idp:acr:generated-code",
  "auth_time": 1672759590,
  "iss": "https://api.dev.mosip.net/v1/idp",
  "exp": 1672766837,
  "iat": 1672759637,
  "nonce": "973eieljzng"
}
```

**Access Token**

```
header: 
{
  "kid": "NOt7BZBkG4nAAX0vE_-S4wT8S5cKUqDTLPOyaTJAu_w",
  "alg": "RS256"
}
```

```
payload: 
{
  "sub": "268524736272681240519736297238054502",
  "aud": "yzLgU7sj8fr2qcqL-MZjwYnl-5ADiClp7Ycj8LiUV5I",
  "iss": "https://api.dev.mosip.net/v1/idp",
  "exp": 1672766837,
  "iat": 1672759637
}
```

### Retrieving user info

Using the access token you can call the user info endpoint to get the user information as an encrypted JWT.

{% swagger src=".gitbook/assets/Identity-Provider.yml" path="/oidc/userinfo" method="get" %}
[Identity-Provider.yml](.gitbook/assets/Identity-Provider.yml)
{% endswagger %}

{% hint style="danger" %}
**To add: Sample JWT** [swati.periwal](https://app.gitbook.com/u/9VJJOcYOrkRCddb5atxhF55I3sq1 "mention")\*\*\*\*
{% endhint %}

{% hint style="info" %}
The response is signed and then encrypted, with the result being a nested JWT. Signed using the authentication system's private key. Signed full JWT will then be encrypted using the OIDC client's public key.
{% endhint %}

## How to get credentials or register?

e-Signet exposes APIs using which a relying party can be registered and receive credentials to connect with e-Signet.

{% swagger src=".gitbook/assets/Identity-Provider.yml" path="/client-mgmt/oidc-client" method="post" %}
[Identity-Provider.yml](.gitbook/assets/Identity-Provider.yml)
{% endswagger %}

{% swagger src=".gitbook/assets/Identity-Provider.yml" path="/client-mgmt/oidc-client/{client_id}" method="put" %}
[Identity-Provider.yml](.gitbook/assets/Identity-Provider.yml)
{% endswagger %}

{% hint style="info" %}
You can connect with your identity provider for details to get registered and receive your client ID.
{% endhint %}
