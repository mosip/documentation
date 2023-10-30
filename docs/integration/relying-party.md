# Relying Party

A relying party is a service provider that depends on an identity provider for authentication and identity verification, enabling users to access their services securely and conveniently.

For a relying party to use eSignet to authenticate and get the user information of their customers,

* They need to register as a client in eSignet
* They need to integrate with eSignet APIs (as per OpenID Connect) on their web or mobile applications.

## Pre-requisites

### Configuring the redirect URI

The relying party needs to configure a redirect URI to its website where eSignet will be sending the auth-code post successful authentication.

{% hint style="info" %}
**Supported URI patterns**

* https://relying-party-portal.com/\*
* https://relying-party-portal.com/login/\*
* residentapp://oauth/\*

**Unsupported URI patterns**

* \*
* http\*
* https://domain\*
* io.mosip.residentapp://\*
{% endhint %}

### Register on eSignet using the client management APIs

eSignet exposes APIs using which a relying party can register and receive OIDC client IDs to connect with eSignet.

{% swagger src="../.gitbook/assets/esignet-1.2.0.yml" path="/client-mgmt/oauth-client" method="post" %}
[esignet-1.2.0.yml](../.gitbook/assets/esignet-1.2.0.yml)
{% endswagger %}

{% swagger src="../.gitbook/assets/esignet-1.2.0.yml" path="/client-mgmt/oauth-client/{client_id}" method="put" %}
[esignet-1.2.0.yml](../.gitbook/assets/esignet-1.2.0.yml)
{% endswagger %}

{% hint style="info" %}
For creating an OIDC client, the relying party needs to provide a list of redirect URIs that can be used during authentication, a valid logo URL, and a public key as JWK apart from other details in the API.
{% endhint %}

## Integration steps

### Add a button on your login screen

Add a button on your website (i.e., Log in with eSignet), which should call the "_**/authorize**_" endpoint and navigate the user to the eSignet UI screen for authentication and consent capture.

Here is the UI storybook deployed by eSignet which can help relying party developers build the buttons for their website.

{% embed url="https://mosip.github.io/mosip-plugins/?path=/docs/javascript-sign-in-with-esignet--docs" %}

{% swagger src="../.gitbook/assets/esignet-1.2.0.yml" path="/authorize" method="get" %}
[esignet-1.2.0.yml](../.gitbook/assets/esignet-1.2.0.yml)
{% endswagger %}

After the "_**/authorize**_" endpoint is called, the eSignet server validates the request and redirects the user to the authentication screen.

### Handling authentication success and failure scenarios

After the authentication is performed successfully, the webpage will receive a "code" in the query parameter, which is the "authorization code" to call the token API to get the ID and access tokens. Once, the access token is retrieved, the relying party can use it to get the user info using the user-info API.

In case of failure, the redirect URI webpage would receive an "error" and "error description" in the query parameter. The OIDC client can also define its behaviour in the event of failure.

#### Retrieving ID and access tokens

Once the authentication code is received, you can now call the token endpoint to get the ID and access tokens.

{% swagger src="../.gitbook/assets/esignet-1.2.0.yml" path="/oauth/v2/token" method="post" %}
[esignet-1.2.0.yml](../.gitbook/assets/esignet-1.2.0.yml)
{% endswagger %}

**Sample ID token**

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

#### Retrieving user info

Using the access token you can call the user info endpoint to get the user information as an encrypted JWT.

{% swagger src="../.gitbook/assets/esignet-1.2.0.yml" path="/oidc/userinfo" method="get" %}
[esignet-1.2.0.yml](../.gitbook/assets/esignet-1.2.0.yml)
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
