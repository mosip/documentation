# Mimoto

Mimoto is a BFF(Backend for Frontend) for Inji Mobile. It's being used to get default configuration, download verifiable credentials (VC) and activate VC.\
It provides all necessary APIs to the Inji Mobile and acts as a proxy for resident services. Mimoto gets the request from Inji Mobile, performs all the validations and forwards it to respective services. Additionally, it subscribes to the web-sub event to be able to download the VC once it's ready.

Detailed API documentation of Mimoto is available [here](https://mosip.stoplight.io/docs/mimoto).

Below are some of the important APIs.

## Support for downloading VC from multiple Issuers

* To get list of issuers, the below API is called.
* To get list issuer's configuration, the below API is called.

Below are 2 types of issuers fo downloading VC:

1. [Download via UIN/VID](mimoto.md#download-via-uinvid)
2. [Download via eSignet](mimoto.md#download-via-esignet)

### Download via UIN/VID

Inji Mobile allows the users to enter their unique ID (UIN or VID) and download the credentials. Multiple Mimoto APIs are being called to complete the process in the backend.

* After entering the unique ID, the user is asked to enter an OTP on the next screen. In the backend, below API is called to send the OTP to the user as an email or SMS.

{% swagger src="../.gitbook/assets/mimoto (1).json" path="/req/otp" method="post" %}
[mimoto (1).json](<../.gitbook/assets/mimoto (1).json>)
{% endswagger %}

* After the user enters the OTP, Inji calls the below Mimoto API to request a new credential.

{% swagger src="../.gitbook/assets/mimoto (1).json" path="/credentialshare/request" method="post" %}
[mimoto (1).json](<../.gitbook/assets/mimoto (1).json>)
{% endswagger %}

* The credentials are downloaded asynchronously after the request is processed. First, the API mentioned below is called to check the status of the credentials.

{% swagger src="../.gitbook/assets/mimoto (1).json" path="/credentialshare/request/status/{requestId}" method="get" %}
[mimoto (1).json](<../.gitbook/assets/mimoto (1).json>)
{% endswagger %}

* After the credential status is **ISSUED**, the app initiates download. The API below will be called to download the credential.

{% swagger src="../.gitbook/assets/mimoto (1).json" path="/credentialshare/download" method="post" %}
[mimoto (1).json](<../.gitbook/assets/mimoto (1).json>)
{% endswagger %}

### Download via eSignet

Inji Mobile allows the users to download VC by redirecting to user to eSignet UI. Multiple APIs are being called to complete the process in the backend.

* Inji Mobile initiates authenticate API by redirecting user to eSignet UI. On eSignet UI, user is given option to enter the unique ID, the user is asked to enter an OTP on the next screen. In the backend, below API is called to get token.

{% swagger src="../.gitbook/assets/mimoto (1).json" path="/get-token" method="post" %}
[mimoto (1).json](<../.gitbook/assets/mimoto (1).json>)
{% endswagger %}

* After getting token response, Inji Mobile initiates download request. Refer [here](esignet.md#download-vc)

## Activate credentials

Credentials have to be activated in order to use them for online login. When a user selects **Activate** option, an OTP is sent to the user and credentials are activated.

* To send an OTP to a user, the below API is called.

{% swagger src="../.gitbook/assets/mimoto (1).json" path="/binding-otp" method="post" %}
[mimoto (1).json](<../.gitbook/assets/mimoto (1).json>)
{% endswagger %}

* After successful OTP validation, a keypair is generated in the phone and the public key is synced with server. The mimoto receives a certificate and create thumbprint which it stores in the keystore securely. This is called as the **activation process.**

{% swagger src="../.gitbook/assets/mimoto (1).json" path="/wallet-binding" method="post" %}
[mimoto (1).json](<../.gitbook/assets/mimoto (1).json>)
{% endswagger %}

## Configuration

The configurable properties for mimoto can be found at [mimoto-default.properties](https://github.com/mosip/mosip-config/blob/collab/mimoto-default.properties). This property file is maintained as one for each deployment environment. On [this](https://github.com/mosip/mosip-config) repository, each environment configuration is placed in a corresponding branch specific to that environment.

> Refer to [mimoto-default.properties](https://github.com/mosip/mosip-config/blob/collab/mimoto-default.properties) of Collab environment.

The implementers can choose to use the existing configurations or add new configurations to them.

### Issuers Listing

The user is currently on the `+` button on the Home screen, which will open `Add new card` screen, where all the issuers are displayed Below issuers list API gives out all the issuers list

{% swagger src="../.gitbook/assets/mimoto (1).json" path="/issuers" method="get" %}
[mimoto (1).json](<../.gitbook/assets/mimoto (1).json>)
{% endswagger %}

To get complete configuration of the specific issuer, below api is called.

{% swagger src="../.gitbook/assets/mimoto (1).json" path="/issuers/{issuer-id}" method="get" %}
[mimoto (1).json](<../.gitbook/assets/mimoto (1).json>)
{% endswagger %}
