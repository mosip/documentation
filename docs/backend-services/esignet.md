# e-Signet

The e-Signet service is used by Inji for online login. Users can log in to any service provider portal which is integrated with e-Signet.

## QR code scan and login to the service provider portal

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
