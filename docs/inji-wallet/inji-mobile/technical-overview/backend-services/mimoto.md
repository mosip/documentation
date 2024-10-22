# Mimoto

Mimoto is a BFF(Backend for Frontend) for Inji Wallet. It's being used to get default configuration, download verifiable credentials (VC) and activate VC.\
It provides all necessary APIs to the Inji Wallet and acts as a proxy for resident services. Mimoto gets the request from Inji Wallet, performs all the validations and forwards it to respective services. Additionally, it subscribes to the web-sub event to be able to download the VC once it's ready.

Detailed API documentation of Mimoto is available [here](https://mosip.stoplight.io/docs/mimoto).

## Support for downloading VC from multiple Issuers

* To get a list of issuers, [this](https://mosip.stoplight.io/docs/mimoto/67ec1f78ee034-list-issuers) API is called. For retrieving the credential types and display properties, `.well-known` location is referred for every issuer from the [mimoto-issuers-config.json](https://github.com/mosip/mosip-config/blob/collab/mimoto-issuers-config.json)

### Download via eSignet

Inji Wallet allows the users to download VC by redirecting the user to eSignet UI. Multiple APIs are being called to complete the process in the backend.

* Inji Wallet initiates authenticate API by redirecting users to eSignet UI. On eSignet UI, user is given option to enter the unique ID, the user is asked to enter an OTP on the next screen. In the backend, token API is called to get a token. Refer [here](https://docs.esignet.io/integration/wallet/credential-holder) for more details.
* After getting a token response, Inji Wallet initiates a download request. Refer[ here](https://docs.mosip.io/inji/inji-mobile-wallet/backend-services/esignet#download-vc)

## Activate credentials

Credentials have to be activated in order to use them for online login. When a user selects **Activate** option, an OTP is sent to the user and credentials are activated.

* To send an OTP to a user, the below API is called.

{% swagger src="../../../../.gitbook/assets/mimoto (1).json" path="/binding-otp" method="post" %}
[mimoto (1).json](<../../../../.gitbook/assets/mimoto (1).json>)
{% endswagger %}

* After successful OTP validation, a keypair is generated in the phone and the public key is synced with server. The mimoto receives a certificate and create thumbprint which it stores in the keystore securely. This is called as the **activation process.**

{% swagger src="../../../../.gitbook/assets/mimoto (1).json" path="/wallet-binding" method="post" %}
[mimoto (1).json](<../../../../.gitbook/assets/mimoto (1).json>)
{% endswagger %}

## Configuration

The configurable properties for mimoto can be found at [mimoto-default.properties](https://github.com/mosip/mosip-config/blob/collab1/mimoto-default.properties). This property file is maintained as one for each deployment environment. On [this](https://github.com/mosip/mosip-config) repository, each environment configuration is placed in a corresponding branch specific to that environment.

> Refer to [mimoto-default.properties](https://github.com/mosip/mosip-config/blob/collab1/mimoto-default.properties) of Collab environment.

The implementers can choose to use the existing configurations or add new configurations to them.

### Issuers Listing

The user is currently on the `+` button on the Home screen, which will open `Add new card` screen, where all the issuers are displayed Below issuers list API gives out all the issuers list

{% swagger src="../../../../.gitbook/assets/mimoto (1).json" path="/issuers" method="get" %}
[mimoto (1).json](<../../../../.gitbook/assets/mimoto (1).json>)
{% endswagger %}

To get complete configuration of the specific issuer, below api is called.

{% swagger src="../../../../.gitbook/assets/mimoto (1).json" path="/issuers/{issuer-id}" method="get" %}
[mimoto (1).json](<../../../../.gitbook/assets/mimoto (1).json>)
{% endswagger %}
