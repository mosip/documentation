# Mimoto

Mimoto service is used by INJI to request, download and use verifiable credentials(VC). It provides all necessary APIs to INJI app. Internally it acts as a proxy for resident-service. Mimoto gets the request from Inji, does all the validations and forwards it to resident-service. 
Additionally, it subscribes to websub event to be able to download the VC once its ready. Below are some of the important INJI to Mimoto communcation. 
The API documentation of Mimoto is present [here](https://mosip.stoplight.io/docs/mimoto).

## Requesting and downloading credentials
As mentioned in previous documentation, INJI allows user to enter unique ID(UIN or VID) and download credentials.
In the backend multiple Mimoto APIs are being called to complete entire process. 
1. After entering unique ID, user is asked to enter OTP in the next screen. In the backend below API is called to send the OTP to user as email or SMS.
   {% swagger src=".gitbook/assets/mimoto.yml" path="/req/otp" method="post" %}
   [mimoto.yml](.gitbook/assets/mimoto.yml)
   {% endswagger %}
2. After user enters OTP, the INJI app calls below Mimoto API to request new credential.
   {% swagger src=".gitbook/assets/mimoto.yml" path="/credentialshare/request" method="post" %}
   [mimoto.yml](.gitbook/assets/mimoto.yml)
   {% endswagger %}
3. The credentials are downloaded asynchronously after the request is processed. First below API will be called to check the status of credential.
   {% swagger src=".gitbook/assets/mimoto.yml" path="/credentialshare/request/status/{requestId}" method="get" %}
   [mimoto.yml](.gitbook/assets/mimoto.yml)
   {% endswagger %}
4. After the credential status is "ISSUED", the app will initialte download. Below API will be called to download credential.
   {% swagger src=".gitbook/assets/mimoto.yml" path="/credentialshare/download" method="get" %}
   [mimoto.yml](.gitbook/assets/mimoto.yml)
   {% endswagger %}

## Activating credentials
Credentials has to be activated in order to use it for online login. When user selects "Activate" option, an OTP will be sent to user and crendential will be activated.
1. To send OTP to user, below API will be called.
   {% swagger src=".gitbook/assets/mimoto.yml" path="/binding-otp" method="post" %}
   [mimoto.yml](.gitbook/assets/mimoto.yml)
   {% endswagger %}
2. After successful OTP validation, a keypair is generated in the phone and public key will be synced with server. The app receives certificate which it stores in the keystore securely. This is called activation process.
   {% swagger src=".gitbook/assets/mimoto.yml" path="/wallet-binding" method="post" %}
   [mimoto.yml](.gitbook/assets/mimoto.yml)
   {% endswagger %}