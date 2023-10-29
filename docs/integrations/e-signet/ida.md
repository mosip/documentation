# ID Authentication

MOSIP's ID Authentication Module is integrated with eSignet to provide APIs for various interface plugins defined in eSignet.

The APIs recently added for eSignet integration are,

* KYC Authentication API to perform authentication for an identity provider like eSignet
* KYC Exchange API to share an encrypted KYC token to an identity provider
* Key Binding API to authenticate a user to bind the ID and Wallet of an user
* VC Exchange API to share the VC associate to a user who was authenticated earlier and has shared the associated KYC Token

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
