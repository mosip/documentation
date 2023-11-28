# e-Signet

The e-Signet service is used by Inji for online login and downloading VC. Users can log in to any service provider portal which is integrated with e-Signet.

## Online login

### QR code scan and login to the service provider portal

The user has to open the portal integrated with e-Signet and scan the QR code using the app scanner.

* After scanning the QR code, Inji will call the below API and pass the link code.

{% swagger src="../.gitbook/assets/Identity-Provider.yaml" path="/linked-authorization/link-transaction" method="post" %}
[Identity-Provider.yaml](../.gitbook/assets/Identity-Provider.yaml)
{% endswagger %}

* After completing the offline face authentication and selecting the essential and optional information, the two APIs mentioned below are called.

{% swagger src="../.gitbook/assets/Identity-Provider.yaml" path="/linked-authorization/authenticate" method="post" %}
[Identity-Provider.yaml](../.gitbook/assets/Identity-Provider.yaml)
{% endswagger %}

{% swagger src="../.gitbook/assets/Identity-Provider.yaml" path="/linked-authorization/consent" method="post" %}
[Identity-Provider.yaml](../.gitbook/assets/Identity-Provider.yaml)
{% endswagger %}

### Download VC

The user is on Add new card screen, and selects download via eSignet.

* Inji uses `react-native-app-auth` to authorize and redirect user to eSignet UI.
Configuration for redirection is fetch as part of issuer configuration.

* Once user is on eSignet UI, user enters required information (unique ID, OTP).
After entering OTP, user is redirected back to Inji to generate key pair and initiates download credential request.

For credential request, refer credential_endpoint attribute in issuer's configuration response.

{% swagger src="../.gitbook/assets/mimoto.json" path="/issuers/{issuer-id}t" method="post" %}
[mimoto.json](../.gitbook/assets/mimoto.json)
{% endswagger %}
[//]: <> (Add download credential endpoint)
