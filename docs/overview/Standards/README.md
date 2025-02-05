---
description: Building on the most trusted security protocols.
---

# Standards

eSignet is built on industry-leading security standards, ensuring robust privacy and data protection. It implements [OpenID Connect](https://openid.net/connect/) and [OAuth 2.0](https://oauth.net/2/), leveraging the most secure and trusted authentication flows to safeguard user identities.

#### Security and Interoperability

* eSignet integrates [SBI (Secure Biometric Interface)](https://standards.ieee.org/ieee/3167/10925/) to enable an ecosystem of biometric players. Please refer [here](https://docs.mosip.io/1.2.0/biometrics/biometric-devices) to view the list of supported devices.
* It adopts emerging standards for **verifiable credentials** with OpenID and seamless **wallet integration**.
* With **eSignet v1.5.0**, support has been introduced for [Identity Assurance](../features/#identity-assurance-flow-ekyc-verification) under **OpenID Connect** for fetching the **verified user claims** and their **metadata**.

For more details on the open standards followed by eSignet, please refer to the below links:

* [OAuth 2.0](https://oauth.net/2/)
* [OpenID Connect](https://openid.net/specs/openid-connect-core-1_0.html)
* [IEEE SA P3167 SBI 2.0](https://standards.ieee.org/ieee/3167/10925/)
* [Identity Assurance 1.0](https://openid.net/specs/openid-connect-4-identity-assurance-1_0.html)

#### Supported Authentication Flows

As eSignet incorporates **OpenID Connect**, a wide range of client libraries are available for seamless integration. Therefore, it is recommended to avoid creating custom code for the integration process.

eSignet implements and supports only the flows mentioned below:

| Standards              | Flow                         | Client authentication |
| ---------------------- | ---------------------------- | --------------------- |
| OAuth 2.0              | Authorization Code with PKCE | private-key-jwt       |
| OIDC                   | Authorization Code with PKCE | private-key-jwt       |
| Identity Assurance 1.0 | Authorization Code with PKCE | private-key-jwt       |

With the principle of security by design, the support is provided for confidential clients only.&#x20;

#### **Security Enhancements**

The authorization code flow involves exchanging an authorization code for a token. This exchange requires client application authentication.

* **Private-key-jwt -**  Our supported client authentication method is private-key-jwt only which ensures that the token is given to a legitimate client.
* **PKCE** - We also support the [PKCE ](https://www.rfc-editor.org/rfc/rfc7636)**(Proof Key for Code Exchange)** security extension for exchanging an authorization code for a token, which guarantees that the authorization code was obtained by the same client application performing the code exchange.&#x20;

{% hint style="info" %}
**Note:** eSignet currently supports the **S256 challenge method** in its PKCE implementation.
{% endhint %}

**eSignet as OAuth 2.0 server**

* eSignet’s **OAuth 2.0 implementation** is a lightweight solution designed specifically for **OIDC authentication flows**. It does not function as a full-fledged authorization server but provides the **essential capabilities required for identity verification**.
* Additionally, eSignet does not support **role-based access control** as it is designed for integration with **national-level identity solutions**, where predefined roles are not necessary.
