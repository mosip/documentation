# ID Authentication

eSignet is integrated with the MOSIP ID Authentication module as an authentication provider. The defined plugins interface has been  implemented using the APIs available in the MOSIP ID Authentication module. 

Here is a list of the APIs that have been integrated into the eSignet plugin interface implementation.

* **KYC Authentication** API to perform authentication for an identity provider like eSignet
* **KYC Exchange** API to share an encrypted KYC token to an identity provider
* **Key Binding** API to authenticate a user to bind the ID and Wallet of an user
* **VC Exchange** API to share the VC associate to a user who was authenticated earlier and has shared the associated KYC Token

## Appendix - API Specifications

{% swagger src="../../.gitbook/assets/id-authentication-new.yaml" path="/idauthentication/v1/key-auth/delegated/{IdP-LK}​/{Auth-Partner-ID}​/{oidc-client-id}" method="post" %}
[id-authentication-new.yaml](../../.gitbook/assets/id-authentication-new.yaml)
{% endswagger %}

{% swagger src="../../.gitbook/assets/id-authentication-new.yaml" path="/idauthentication/v1/kyc-exchange/delegated/{IdP-LK}​/{Auth-Partner-ID}​/{oidc-client-id}" method="post" %}
[id-authentication-new.yaml](../../.gitbook/assets/id-authentication-new.yaml)
{% endswagger %}

{% swagger src="../../.gitbook/assets/id-authentication-new.yaml" path="/idauthentication/v1/identity-key-binding/delegated/{IdP-LK}/{Auth-Partner-ID}/{OIDC-Client-Id}" method="post" %}
[id-authentication-new.yaml](../../.gitbook/assets/id-authentication-new.yaml)
{% endswagger %}

{% swagger src="../../.gitbook/assets/id-authentication-new.yaml" path="/idauthentication/v1/vci-exchange/delegated/{IdP-LK}/{Auth-Partner-ID}/{OIDC-Client-Id}" method="post" %}
[id-authentication-new.yaml](../../.gitbook/assets/id-authentication-new.yaml)
{% endswagger %}
