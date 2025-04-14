# eSignet

The eSignet service is utilized by Inji Wallet for online login. Users have the ability to log in to any service provider portal that is integrated with eSignet.

## Online login

### QR code scanning and login to the service provider portal

The user is required to open the portal integrated with eSignet and utilize the app scanner to scan the QR code.

After successfully scanning the QR code, Inji Wallet will access the API below and transmit the link code.



#### Link Transaction endpoint V2

{% openapi-operation spec="api" path="/linked-authorization/v2/link-transaction" method="post" %}
[Broken link](broken-reference)
{% endopenapi-operation %}

After successfully completing the offline face authentication and selecting the required and optional information, the two specified APIs are invoked.

#### Linked Authentication Endpoint V2

{% openapi-operation spec="api" path="/linked-authorization/v2/authenticate" method="post" %}
[Broken link](broken-reference)
{% endopenapi-operation %}



#### Linked Consent Endpoint V2

{% openapi-operation spec="api" path="/linked-authorization/v2/consent" method="post" %}
[Broken link](broken-reference)
{% endopenapi-operation %}



