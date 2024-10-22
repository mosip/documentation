# eSignet

The eSignet service is utilized by Inji Wallet for online login and downloading the VC. Users have the ability to log in to any service provider portal that is integrated with eSignet.

## Online login

### QR code scanning and login to the service provider portal

The user is required to open the portal integrated with eSignet and utilize the app scanner to scan the QR code.

After successfully scanning the QR code, Inji Wallet will access the API below and transmit the link code.

{% swagger src="../../../../.gitbook/assets/Identity-Provider.yaml" path="/linked-authorization/link-transaction" method="post" %}
[Identity-Provider.yaml](../../../../.gitbook/assets/Identity-Provider.yaml)
{% endswagger %}

* After successfully completing the offline face authentication and selecting the required and optional information, the two specified APIs are invoked.

{% swagger src="../../../../.gitbook/assets/Identity-Provider.yaml" path="/linked-authorization/authenticate" method="post" %}
[Identity-Provider.yaml](../../../../.gitbook/assets/Identity-Provider.yaml)
{% endswagger %}

{% swagger src="../../../../.gitbook/assets/Identity-Provider.yaml" path="/linked-authorization/consent" method="post" %}
[Identity-Provider.yaml](../../../../.gitbook/assets/Identity-Provider.yaml)
{% endswagger %}

### Download VC

The user is currently on the `Add new card` screen and chooses the option to `Download via eSignet`.

* Inji Wallet utilizes the `react-native-app-auth` library to authorize and redirect the user to the eSignet user interface. The configuration for redirection is retrieved as part of the issuer's configuration.
* Once the user is on the eSignet user interface, they input the necessary information such as a unique ID and OTP (One-time Password). After entering the OTP, the user is redirected back to Inji Wallet in order to generate a key pair and initiate the request to download the credential.

For credential request, refer credential\_endpoint attribute in issuer's configuration response.

{% swagger src="../../../../.gitbook/assets/Identity-Provider.yaml" path="/vci/credential" method="post" %}
[Identity-Provider.yaml](../../../../.gitbook/assets/Identity-Provider.yaml)
{% endswagger %}
