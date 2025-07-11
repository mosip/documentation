# Development and Integration with eSignet

#### Development of Relying party application

Setup your development environment. Once done you need to follow the following steps

* Invoking eSignet authorize URL
  * Add a button on your login screen. The button might have standards in terms of logo, colour, and size. The ID provider usually provides these guidelines.

Here is the[ UI storybook](https://mosip.github.io/mosip-sdk/?path=/docs/javascript-sign-in-with-esignet--docs) deployed by eSignet which can help relying party developers build the buttons for their website.

*   The button upon click should get a unique state (a random value) & nonce (a random value) from the server and redirect to the "/authorize" endpoint of the ID provider. A sample URL is listed here. The details of what is supported are listed on the [.well-known](../../configuration/.well-known/) file in the respective eSignet provider.

    * Sample /authorize Request:

    ```
      GET https://esignet.id.provider.domain.name/authorize?nonce=ere973eieljznge2311&state=eree2311&client_id=Mv45rBnfuu0ocWDy9APT5k5LZbGE_l0wX7P9vQXXswg&redirect_uri=https://relyingparty.dev.net/userprofile&scope=openid profile&response_type=code&acr_values=mosip:idp:acr:generated-code mosip:idp:acr:biometrics mosip:idp:acr:linked-wallet&claims={"userinfo":{"given_name":{"essential":true},"phone_number":{"essential":false},"email":{"essential":true},"picture":{"essential":false},"gender":{"essential":false},"birthdate":{"essential":false},"address":{"essential":false}},"id_token":{}}&claims_locales=en&display=page&ui_locales=en-US
    ```

{% openapi src="../../../../.gitbook/assets/esignet-1.2.0.yml" path="/authorize" method="get" %}
[esignet-1.2.0.yml](../../../../.gitbook/assets/esignet-1.2.0.yml)
{% endopenapi %}

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
  * On Success, proceed with exchanging the authorization code for an access token using the token endpoint.
  * On failure, use the error and error description to decide on the user flow in your portal.
* Exchange authorization code for an Access token using the token endpoint.
  * The token endpoint should include client\_assertion (JWT signed using OAuth Client private key). As this needs a private key to build the request, we suggest the relying party should delegate the token request to the backend server.
  * eSignet only supports `private_key_jwt` client authentication methods.
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

{% openapi src="../../../../.gitbook/assets/esignet-1.2.0.yml" path="/oauth/v2/token" method="post" %}
[esignet-1.2.0.yml](../../../../.gitbook/assets/esignet-1.2.0.yml)
{% endopenapi %}

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

* Get userinfo with the access token
  * In case the developer is interested in the user’s information (eKYC) like given\_name or anything that the claim has then Using the access token you can call the user info endpoint to get the user information as a signed JWT.

{% openapi src="../../../../.gitbook/assets/esignet-1.2.0.yml" path="/oidc/userinfo" method="get" %}
[esignet-1.2.0.yml](../../../../.gitbook/assets/esignet-1.2.0.yml)
{% endopenapi %}

*   User info endpoints response example is listed below:

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

The above command would extract the public key to esignet\_public.der file. When prompted for the password, enter the same passphrase as before.

#### Tools to convert Public key to JWK format

Use any of the online platforms or tools of your choice to convert the `esignet_public.der` to JWK format. You can open the file in any text editor, and copy its contents, and use the tools listed below to convert to JWK.

* install `pem-jwk` tool
* Use the below command to convert the public key in PEM format to JWK

`pem-jwk esignet_public.der > ./esignet_public.jwk`

Other online tools are listed below:

* [https://pem2jwk.vercel.app/](https://pem2jwk.vercel.app/)
* [https://8gwifi.org/jwkconvertfunctions.jsp](https://8gwifi.org/jwkconvertfunctions.jsp)
* [https://irrte.ch/jwt-js-decode/pem2jwk.html](https://irrte.ch/jwt-js-decode/pem2jwk.html)
