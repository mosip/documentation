# Mimoto

Mimoto service is used by Inji to request, download and use verifiable credentials (VC). It provides all necessary APIs to the Inji. Internally, it acts as a proxy for resident services. Mimoto gets the request from Inji, performs all the validations and forwards it to resident services. Additionally, it subscribes to the web-sub event to be able to download the VC once it's ready. Below are some of the important APIs for Inji to Mimoto communication. The API documentation of Mimoto is available [here](https://mosip.stoplight.io/docs/mimoto).

## Requesting and downloading credentials

As mentioned in previous documentation, Inji allows the users to enter their unique ID (UIN or VID) and download the credentials. Multiple Mimoto APIs are being called to complete the process in the backend.

* After entering the unique ID, the user is asked to enter an OTP on the next screen. In the backend, below API is called to send the OTP to the user as an email or SMS.

{% swagger src="../.gitbook/assets/mimoto.json" path="/req/otp" method="post" %}
[mimoto.json](../.gitbook/assets/mimoto.json)
{% endswagger %}

* After the user enters the OTP, Inji calls the below Mimoto API to request a new credential.

{% swagger src="../.gitbook/assets/mimoto.json" path="/credentialshare/request" method="post" %}
[mimoto.json](../.gitbook/assets/mimoto.json)
{% endswagger %}

* The credentials are downloaded asynchronously after the request is processed. First, the API mentioned below is called to check the status of the credentials.

{% swagger src="../.gitbook/assets/mimoto.json" path="/credentialshare/request/status/{requestId}" method="get" %}
[mimoto.json](../.gitbook/assets/mimoto.json)
{% endswagger %}

* After the credential status is **ISSUED**, the app initiates download. The API below will be called to download the credential.

{% swagger src="../.gitbook/assets/mimoto.json" path="/credentialshare/download" method="post" %}
[mimoto.json](../.gitbook/assets/mimoto.json)
{% endswagger %}

## Activating credentials

Credentials have to be activated in order to use them for online login. When a user selects **Activate** option, an OTP is sent to the user and credentials are activated.

* To send an OTP to a user, the below API is called.

{% swagger src="../.gitbook/assets/mimoto.json" path="/binding-otp" method="post" %}
[mimoto.json](../.gitbook/assets/mimoto.json)
{% endswagger %}

* After successful OTP validation, a keypair is generated in the phone and the public key is synced with server. The app receives a certificate which it stores in the keystore securely. This is called as the **activation process.**

{% swagger src="../.gitbook/assets/mimoto.json" path="/wallet-binding" method="post" %}
[mimoto.json](../.gitbook/assets/mimoto.json)
{% endswagger %}
