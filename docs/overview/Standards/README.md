# Standards

eSignet implements [OpenID Connect](https://openid.net/connect/) and [OAuth 2.0](https://oauth.net/2/) flows to work its magic. We have chosen the most secure and trustworthy flows to ensure user privacy and data security.

It relies on [SBI (Secure Biometric Interface)](https://standards.ieee.org/ieee/3167/10925/) to enable an ecosystem of biometric players. To have a look at the supported devices, click [here](https://docs.mosip.io/1.2.0/biometrics/biometric-devices).

eSignet leverages emerging standards for using verifiable credentials with OpenID and for wallet integration.

With eSignet v1.5.0, support is added for [Identity Assurance](../features/#identity-assurance-flow-ekyc-verification) under OpenID Connect for fetching the verified user claims and their metadata.

To learn more about the open standards followed by eSignet, please refer to the below links:

* [OAuth 2.0](https://oauth.net/2/)
* [OpenID Connect](https://openid.net/specs/openid-connect-core-1_0.html)
* [IEEE SA P3167 SBI 2.0](https://standards.ieee.org/ieee/3167/10925/)
* [Identity Assurance 1.0](https://openid.net/specs/openid-connect-4-identity-assurance-1_0.html)

As eSignet incorporates **OpenID Connect**, a wide range of client libraries are available for seamless integration. Therefore, it is recommended to avoid creating custom code for the integration process.

eSignet implements and supports only the flows mentioned below:

| **Standards**          | **Flow**                     | **Client authentication** |
| ---------------------- | ---------------------------- | ------------------------- |
| OAuth 2.0              | Authorization Code with PKCE | private-key-jwt           |
| OIDC                   | Authorization Code with PKCE | private-key-jwt           |
| Identity Assurance 1.0 | Authorization Code with PKCE | private-key-jwt           |

With the principle of security by design, the support is provided for confidential clients only. The authorization code flow involves exchanging an authorization code for a token. This exchange requires client application authentication. Our supported client authentication method is private-key-jwt only which ensures that the token is given to a legitimate client. We also support the [PKCE ](https://www.rfc-editor.org/rfc/rfc7636)security extension for exchanging an authorization code for a token, which guarantees that the authorization code was obtained by the same client application performing the exchange.

{% hint style="info" %}
**Note:** In eSignet, currently S256 Challenge method is supported in PKCE implementation.
{% endhint %}

**eSignet as OAuth 2.0 server**

* eSignet OAuth2.0 implementation is not a full-fledged authorization server and supports only the bare minimum required for OIDC flow.
* eSignet system does not support roles, as it is designed to be integrated with national level identity solutions that can be used by the residents of the country, where roles are not required.
