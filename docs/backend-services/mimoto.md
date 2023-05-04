# Mimoto

Mimoto service is used by Inji to request, download and use verifiable credentials(VC). It provides all necessary APIs to the Inji app. Internally it acts as a proxy for resident service. Mimoto gets the request from Inji, does all the validations and forwards it to resident service. Additionally, it subscribes to the web-sub event to be able to download the VC once it's ready. Below are some of the important INJI to Mimoto communication. The API documentation of Mimoto is present [here](https://mosip.stoplight.io/docs/mimoto).

## Requesting and downloading credentials

As mentioned in previous documentation, INJI allows users to enter their unique ID(UIN or VID) and download credentials. Multiple Mimoto APIs are being called to complete the process in the backend.

* After entering the unique ID, the user is asked to enter OTP on the next screen. In the backend below API is called to send the OTP to the user as email or SMS.

{% swagger src="../.gitbook/assets/mimoto.json" path="/req/otp" method="post" %}
[mimoto.json](../.gitbook/assets/mimoto.json)
{% endswagger %}

* After the user enters OTP, Inji calls below Mimoto API to request a new credential.

{% swagger src="../.gitbook/assets/mimoto.json" path="/credentialshare/request" method="post" %}
[mimoto.json](../.gitbook/assets/mimoto.json)
{% endswagger %}

* The credentials are downloaded asynchronously after the request is processed. First below API will be called to check the status of credentials.

{% swagger src="../.gitbook/assets/mimoto.json" path="/credentialshare/request/status/{requestId}" method="get" %}
[mimoto.json](../.gitbook/assets/mimoto.json)
{% endswagger %}

4. After the credential status is **ISSUED**, the app will initiate download. Below API will be called to download credential.

{% swagger src="../.gitbook/assets/mimoto.json" path="/credentialshare/download" method="post" %}
[mimoto.json](../.gitbook/assets/mimoto.json)
{% endswagger %}

## Activating credentials

Credentials has to be activated in order to use it for online login. When user selects **Activate** option, an OTP will be sent to user and credential will be activated.

1. To send OTP to user, below API will be called.

{% swagger src="../.gitbook/assets/mimoto.json" path="/binding-otp" method="post" %}
[mimoto.json](../.gitbook/assets/mimoto.json)
{% endswagger %}

2. After successful OTP validation, a keypair is generated in the phone and public key will be synced with server. The app receives certificate which it stores in the keystore securely. This is called activation process.

{% swagger src="../.gitbook/assets/mimoto.json" path="/wallet-binding" method="post" %}
[mimoto.json](../.gitbook/assets/mimoto.json)
{% endswagger %}
