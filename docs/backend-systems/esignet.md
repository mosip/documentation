# Esignet

The Esignet service is used by INJI for online login. User can log-in to any service provider portal which is integrated with Esignet.

## QR code scan and login to service provider portal
User has to open portal integrated with Esignet and scan QR code using app scanner.
1. After scanning QR code INJI app will call below API and pass link code.
   {% swagger src=".gitbook/assets/esignet.yml" path="/linked-authorization/link-transaction" method="post" %}
   [mimoto.yml](.gitbook/assets/esignet.yml)
   {% endswagger %}
2. After completing offline face auth and selecting essential and optional information below 2 APIs will be called.
   {% swagger src=".gitbook/assets/esignet.yml" path="/linked-authorization/authenticate" method="post" %}
   [mimoto.yml](.gitbook/assets/esignet.yml)
   {% endswagger %}

   {% swagger src=".gitbook/assets/esignet.yml" path="/linked-authorization/consent" method="post" %}
   [mimoto.yml](.gitbook/assets/esignet.yml)
   {% endswagger %}