# Relying Party

The relying party is an OAuth client who should be able to authenticate the end user and get the user information. For availing these [features](../../overview/features/), the relying party needs to partner with an eSignet-compliant authentication system to register and integrate.

## Pre-requisites

Connect with an authentication system which uses the eSignet solution for onboarding relying parties. As a part of this activity, you should receive the environment details and register yourself to receive a client ID.

You can use our sandbox environment to integrate as well. For more details visit our page on [Sandbox Details](../../try-it-out/).

## Integration steps

### Configuring the redirect URI

Create a webpage where the user is redirected after successful authentication and consent are provided. The URL of this page should be shared as a query parameter as part of the authorization endpoint.

{% hint style="info" %}
Ensure that the redirect URI is also shared with the authentication partner to configure the same on the eSignet server.
{% endhint %}

### Add a button on your login screen

Add a button on your website (i.e., Log in with eSignet), which should call the authorization endpoint and navigate the user to the eSignet UI screen for authentication and consent capture.

{% swagger src="../../.gitbook/assets/e-Signet.yml" path="/authorize" method="get" %}
[e-Signet.yml](../../.gitbook/assets/e-Signet.yml)
{% endswagger %}

After the authorization endpoint is called, the eSignet server validates the request and redirects the user to the authentication screen.

### Handling authentication success and failure scenarios

After the authentication is performed successfully, the webpage will receive a "code" in the query parameter, which is the "authorization code" to call the token API to get the ID and access tokens.

In case of failure, the redirect URI webpage would receive an "error" and "error description" in the query parameter. The OIDC client can also define its behaviour in the event of failure.

### Retrieving ID and access tokens

Once the authentication code is received, you can now call the token endpoint to get the ID and access tokens.

{% swagger src="../../.gitbook/assets/e-Signet.yml" path="/oauth/token" method="post" %}
[e-Signet.yml](../../.gitbook/assets/e-Signet.yml)
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

{% swagger src="../../.gitbook/assets/e-Signet.yml" path="/oidc/userinfo" method="get" %}
[e-Signet.yml](../../.gitbook/assets/e-Signet.yml)
{% endswagger %}

**Example 1**

```
{
  "sub": "63EBC25D699305A26EE740A955852EAB2E6527BFF2F5E9E5562B502DACECD020",
  "address": {
    "street_address": "#991, 47 Street, 6 block",
    "country": "KTA",
    "locality": "KNT",
    "region": "RSK",
    "postal_code": "14022"
  },
  "gender": "Male",
  "phone": "91600395660",
  "name": "Manoj",
  "email": "manoj@mail.com"
}
```

**Example 2**

```
{
  "sub": "63EBC25D699305A26EE740A955852EAB2E6527BFF2F5E9E5562B502DACECD020",
  "name#en": "Manoj",
  "address#en": {
    "formatted#en": "#991, 47 Street, 6 block"
  },
  "phone": "91600395660",
  "gender#kn": "ಗಂಡು",
  "name#kn": "ಮನೋಜ್",
  "address#kn": {
    "formatted#kn": "#991, 47 ಸ್ಟ್ರೀಟ್, 6 ಬ್ಲಾಕ್"
  },
  "gender#en": "Male",
  "email": "mohd.taheer@gmail.com"
}
```

{% hint style="info" %}
The response is signed and then encrypted, with the result being a nested JWT. Signed using the authentication system's private key. Signed full JWT will then be encrypted using the OIDC client's public key.
{% endhint %}

## How do I get credentials or register?

eSignet exposes APIs using which a relying party can register and receive credentials to connect with eSignet.

{% swagger src="../../.gitbook/assets/e-Signet.yml" path="/client-mgmt/oidc-client" method="post" %}
[e-Signet.yml](../../.gitbook/assets/e-Signet.yml)
{% endswagger %}

{% swagger src="../../.gitbook/assets/e-Signet.yml" path="/client-mgmt/oidc-client/{client_id}" method="put" %}
[e-Signet.yml](../../.gitbook/assets/e-Signet.yml)
{% endswagger %}

{% hint style="info" %}
You can connect with your identity provider for details on how to get registered and receive your client ID.
{% endhint %}
