# Standards

eSignet implements [**OpenID Connect**](https://openid.net/connect/) and [**OAuth 2.0**](https://oauth.net/2/) flows to work its magic. We have chosen the most secure and trustworthy flows to ensure user privacy and data security.

It relies on [**SBI (Secure Biometric Interface)**](https://standards.ieee.org/ieee/3167/10925/) to enable an ecosystem of biometric players. To have a look at the supported devices, click [here](https://docs.mosip.io/1.2.0/biometrics/biometric-devices).

eSignet also leverages emerging standards for using verifiable credentials with OpenID and for wallet integration.

To learn more about the open standards followed by eSignet, read:

* [OAuth 2.0](https://oauth.net/2/)
* [OpenID Connect](https://openid.net/specs/openid-connect-core-1\_0.html)
* [OpenID4VCI](https://openid.net/specs/openid-4-verifiable-credential-issuance-1\_0.html)
* [IEEE SA P3167 SBI 2.0](https://standards.ieee.org/ieee/3167/10925/)

As eSignet incorporates **OpenID Connect**, a wide range of client libraries are available for seamless integration. Therefore, it is recommended to avoid creating custom code for the integration process.

eSignet implements and supports only the flows mentioned below:

<table><thead><tr><th width="145">   Standards</th><th>       Flow</th><th>Client authentication</th></tr></thead><tbody><tr><td>OAuth 2.0</td><td>Authorization Code with PKCE</td><td>private-key-jwt</td></tr><tr><td>OIDC</td><td>Authorization Code with PKCE</td><td>private-key-jwt</td></tr><tr><td>OpenID4VCI</td><td>Authorization Code flow (Wallet-initiated) returning Just In Time VC</td><td>private-key-jwt</td></tr></tbody></table>

With the principle of **security by design**, the support is provided for confidential clients only. The authorization code flow involves exchanging an authorization code for a token. This exchange requires client application authentication. Our supported client authentication method is `private-key-jwt` only which ensures that the token is given to a legitimate client. We also support the [PKCE ](https://www.rfc-editor.org/rfc/rfc7636)security extension for exchanging an authorization code for a token, which guarantees that the authorization code was obtained by the same client application performing the exchange.

**Note:** In eSignet, currently S256 Challenge method is supported in PKCE implementation.&#x20;

#### eSignet as OAuth 2.0 server

* eSignet OAuth2.0 implementation is not a full-fledged authorization server and supports only the bare minimum required for OpenID4VCI and OIDC flow.
* e-Signet system does not support roles, as the e-Signet is designed to be integrated with national level identity solution which will used by all the residents of the country, where roles are not required.

