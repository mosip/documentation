# e-Signet

The e-Signet service is used by INJI for online login. Users can log in to any service provider portal which is integrated with Esignet.

## QR code scan and login to the service provider portal

The user has to open the portal integrated with Esignet and scan the QR code using the app scanner.

1. After scanning the QR code INJI app will call the below API and pass the link code.
2. After completing offline face auth and selecting essential and optional information below 2 APIs will be called.

{% swagger src="../backend-systems/.gitbook/assets/esignet.yml" path="/linked-authorization/authenticate" method="post" %}
[esignet.yml](../backend-systems/.gitbook/assets/esignet.yml)
{% endswagger %}

{% swagger src="../backend-systems/.gitbook/assets/esignet.yml" path="/linked-authorization/consent" method="post" %}
[esignet.yml](../backend-systems/.gitbook/assets/esignet.yml)
{% endswagger %}
