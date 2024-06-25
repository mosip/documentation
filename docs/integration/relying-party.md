# Relying Party

A relying party refers to a service provider that relies on an eSignet based identity provider for authentication and identity verification. This enables users to provide their identity details/ biometrics securely and conveniently to access the services provided by the relying party.

## Getting Started

This guide helps the developers of the relying party to get started with their development environment.

### Pre-requisites

#### Setup your development machine:

* Choose the technology stack (PHP, Python, Java, Node, Kotlin, Swift etc).
* Choose the OpenId plugins for the respective technology stack.
* Choose the JWT plugins for the respective technology stack.
*   Create the keys (a password-protected private key & store it safely).

    {% hint style="info" %}
    Please do not use the same key for production. Its extremely dangerous. Create keys in safe production-grade hardened machines/vault/HSM.
    {% endhint %}
* Design your callback API. The callback API is redirected by eSignet over the user's browser upon successful authentication. As best practice please ensure the callback API can render the UX as soon as possible so the user is aware of the progress. Please note that the user is redirected on both success and failure authentication. On failure, the user will be redirected without an auth-code. So based on the authentication response relying party portal needs to take the necessary action before allowing the user to move forward.

#### Register / Onboard as OIDC client with ID provider

Once the above steps are completed the relying parties developers/managers are required to follow these steps:

* Work with the respective ID provider (eSignet provider) and request a client ID. You would need to share your public key to obtain your client ID. It is the same public key created in the above steps.
* Provide the name that you want to register with the ID provider, the same name will be displayed on the eSignet authentication and consent page to the end user.
* List the fields/attributes that you need from the eSignet ID provider upon the user’s consent. This is also called a claim. It's expected that the relying party indicates the mandatory and optional claims. The possible values can be discovered from the eSignet [.well-known](../build-and-deploy/configuration/.well-known/openid-configuration.md).
* Provide the logo for your application and organization to be utilized for display on the eSignet authentication page.
* Provide any of the following callback URL patterns for local development & QA.

```
    http://localhost:<portnumber>/*

    http://127.0.0.1:<portnumber>/*

    http://ipaddrress-of-your-server:portnumber/*

    my.phone.app://oauth/*
```

{% hint style="info" %}
These callback URL are for development purpose and choose them according to the URL in your development/qa environment. As much as possible \* should avoided as it could result in security issues. For development its ok to provide the \* as above. For the phone app the app callback deeplink should be provided. The following are the unsupported URL patterns.

```
  \\*
  
  http*
  
  https://*
  
  https://domain*
  
  residentapp://*
```
{% endhint %}

* Upon receiving the above information the ID provider should be able to process the request and provide you back with the client ID.

{% hint style="warning" %}
The eSignet providers may have additional non-technical requirements. Those are specific to the provider. This document will not cover those.
{% endhint %}

#### Development of Relying party application

Setup your development environment. Once done you need to follow the following steps

* Invoking eSignet authorize URL
  * Add a button on your login screen. The button might have standards in terms of logo, colour, and size. The ID provider usually provides these guidelines.

Here is the[ UI storybook](https://mosip.github.io/mosip-sdk/?path=/docs/javascript-sign-in-with-esignet--docs) deployed by eSignet which can help relying party developers build the buttons for their website.

*   The button upon click should get a unique state (a random value) & nonce (a random value) from the server and redirect to the "/authorize" endpoint of the ID provider. A sample URL is listed here. The details of what is supported are listed on the [.well-known](../build-and-deploy/configuration/.well-known/) file in the respective eSignet provider.

    * Sample /authorize Request:

    ```
      GET https://esignet.id.provider.domain.name/authorize?nonce=ere973eieljznge2311&state=eree2311&client_id=Mv45rBnfuu0ocWDy9APT5k5LZbGE_l0wX7P9vQXXswg&redirect_uri=https://relyingparty.dev.net/userprofile&scope=openid profile&response_type=code&acr_values=mosip:idp:acr:generated-code mosip:idp:acr:biometrics mosip:idp:acr:linked-wallet&claims={"userinfo":{"given_name":{"essential":true},"phone_number":{"essential":false},"email":{"essential":true},"picture":{"essential":false},"gender":{"essential":false},"birthdate":{"essential":false},"address":{"essential":false}},"id_token":{}}&claims_locales=en&display=page&ui_locales=en-US
    ```

{% swagger src="../.gitbook/assets/esignet-1.2.0.yml" path="/authorize" method="get" %}
[esignet-1.2.0.yml](../.gitbook/assets/esignet-1.2.0.yml)
{% endswagger %}

* This will navigate the user to the ID provider’s eSignet UI screen for the authentication page. If you have reached here and there is no error on the screen then congrats on your achievement.
* Now the user is expected to enter his credentials on eSignet. Upon success or cancellation, the user's browser will be redirected to the approved callback URL.
* Callback
  * The callback URL is the landing page/URL after the completion (Success|Failure) of authentication. The relying party developers are requested to provide this callback URL. The following signatures apply for the same.

{% hint style="info" %}
https://relyingparty.domain.name/callbackurl?state=same-that-you-supplied\&nonce=same-that-you-supplied\&code=authorization\_code\&error\_description=in\_case\_of\_error\_this\_is\_sent\&error=error\_code
{% endhint %}

{% hint style="info" %}
https://relyingparty.domain.name/callbackurl is based on the domain pattern you sent during OAuth client registration.
{% endhint %}

* Once the redirection happens the relying party is expected to perform the following
  * Send the state to the server. Validate if they are the same as expected. The server should also ensure the combination of state is valid.
  * On Success, proceed with exchanging authorization code for access token using token endpoint.
  * On failure, use the error and error description to decide on the user flow in your portal.
* Exchange authorization code for Access token using token endpoint.
  * Token endpoint should include client\_assertion (JWT signed using OAuth Client private key). As this needs a private key to build the request, we suggest relying party should delegate token request to backend server.
  * eSignet only supports `private_key_jwt` client authentication method.
  *   The server should generate a JWT with the following payload.

      ```
      {
      "iat": <current time>,
      "nbf": <current time>,
      "exp": <1-6 minutes from current time>,
      "jti": <random nonce>,
      "sub": <client id>,
      "iss": <client id>,
      "aud": <id provider domain uri's token end point>
      }
      ```

{% swagger src="../.gitbook/assets/esignet-1.2.0.yml" path="/oauth/v2/token" method="post" %}
[esignet-1.2.0.yml](../.gitbook/assets/esignet-1.2.0.yml)
{% endswagger %}

*   Sample ID token JWT header and payload

    ```
      header: 
      {
        "kid": "NOt7BZBkG4nAAX0vE_-S4wT8S5cKUqDTLPOyaTJAu_w",
        "alg": "RS256"
      }

      payload: 
      {
        "at_hash": "ggJyqKcuYHdwARpWzeHKMMgDdRRNe61oN6O7xzEuyiY",
        "sub": "268524736272681240519736297238054502",
        "aud": "yzLgU7sj8fr2qcqL-MZjwYnl-5ADiClp7Ycj8LiUV5I",
        "acr": "mosip:idp:acr:generated-code",
        "auth_time": 1672759590,
        "iss": "https://esignet.id.provider.domain.name",
        "exp": 1672766837,
        "iat": 1672759637,
        "nonce": "973eieljzng"
      }
    ```
*   Sample Access token JWT header and payload

    ```
    header:
    {
    "kid": "NOt7BZBkG4nAAX0vE_-S4wT8S5cKUqDTLPOyaTJAu_w",
    "alg": "RS256"
    }

    payload:
    {
    "sub": "268524736272681240519736297238054502",
    "aud": "yzLgU7sj8fr2qcqL-MZjwYnl-5ADiClp7Ycj8LiUV5I",
    "iss": "https://esignet.id.provider.domain.name",
    "exp": 1672766837,
    "iat": 1672759637
    }
    ```
* If the developer is only interested in login/verify then we could consider the return of access token as a successful login. The remaining steps are optional.

{% hint style="info" %}
The access token & ID token are considered as a piece of confidential information and its expected to be kept safe by the relying party.
{% endhint %}

* Get userinfo with access token
  * In case the developer is interested in the user’s information (eKYC) like given\_name or anything that the claim has then Using the access token you can call the user info endpoint to get the user information as a signed JWT.

{% swagger src="../.gitbook/assets/esignet-1.2.0.yml" path="/oidc/userinfo" method="get" %}
[esignet-1.2.0.yml](../.gitbook/assets/esignet-1.2.0.yml)
{% endswagger %}

*   User info endpoints response example listed below:

    ```
    Example 1: 

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

    Example 2: 

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
eSignet by design does not maintain any session. So the entire session management and logout are features beyond what eSignet supports.
{% endhint %}

### Key pair creation for registering OAuth client

`openssl genrsa -aes256 -out esignet_private.pem 2048`

The above command would ask you for a passphrase. Please provide a complex passphrase and ensure that it's remembered safely. Ensure to regenerate a new key when you go live the first time and keep the password/keys only on the server/HSM with restricted access.

openssl rsa -pubout -in esignet\_private.pem -out esignet\_public.der

The above command would extract the public key to esignet\_public.der file. When prompted for password, enter the same passphrase as before.

#### Tools to convert Public key to JWK format

Use any of the online platforms or tools of your choice to convert the `esignet_public.der` to JWK format. You can open the file in any text editor and copy its contents and use the tools listed below to conver to JWK.

* install `pem-jwk` tool
* Use the below command to convert public key in PEM format to JWK

`pem-jwk esignet_public.der > ./esignet_public.jwk`

Other online tools are listed below:

* [https://pem2jwk.vercel.app/](https://pem2jwk.vercel.app/)
* [https://8gwifi.org/jwkconvertfunctions.jsp](https://8gwifi.org/jwkconvertfunctions.jsp)
* [https://irrte.ch/jwt-js-decode/pem2jwk.html](https://irrte.ch/jwt-js-decode/pem2jwk.html)
