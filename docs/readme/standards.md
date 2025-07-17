---
description: Building on the most trusted security protocols.
---

# Standards & Security
eSignet is built on industry-leading security standards, ensuring robust privacy and data protection. It implements [OpenID Connect Core 1.0](https://openid.net/specs/openid-connect-core-1_0-final.html) and [OAuth 2.0](https://oauth.net/2/), leveraging the most secure and trusted authentication flows to safeguard user identities.

#### 1. Security

* **Biometric Integration via SBI**\
  eSignet integrates with the [**Secure Biometric Interface (SBI)**](https://standards.ieee.org/ieee/3167/10925/) to support a wide range of biometric service providers.\
  Please refer the links below for the SBI library to enable the biometric auth with eSignet
  * [React SBI Library](https://github.com/mosip/mosip-sdk/tree/master/react-secure-biometric-interface-integrator)
  * [JS SBI Library](https://github.com/mosip/mosip-sdk/tree/master/secure-biometric-interface-integrator)
  * [Supported Devices](https://docs.mosip.io/1.2.0/id-lifecycle-management/supporting-components/biometrics/biometric-devices) - View the list of compatible biometric devices.
* **HSM Integration with PKCS #11**\
  eSignet supports **Hardware Security Module (HSM)** integration using **PKCS #11** for the secure storage and management of signing keys.

#### 2. Interoperability

* **Verifiable Credentials & Wallet Integration**\
  eSignet adopts **OpenID standards** to support **verifiable credentials** and **wallet-based identity verification**, enabling seamless cross-platform interoperability.
* **Identity Assurance (Introduced in v1.5.0)**\
  From version **v1.5.0**, eSignet includes support for [**Identity Assurance**](../esignet-authentication/features.md#identity-assurance-flow-ekyc-verification) **under OpenID Connect**, allowing retrieval of verified user claims and associated metadata.
* **well-knowns**\
  eSignet implements **well-known to publish the URI for metadata discovery**. Below are the supporting standardized .well-known endpoints for dynamic service configuration and discovery.

| **Name**             | **URL Paths**                           |
| -------------------- | --------------------------------------- |
| OpenID Configuration | /.well-known/openid-configuration       |
| Jwks Json            | /.well-known/jwks.json                  |
| Authorization Server | /.well-known/oauth-authorization-server |
|                      |                                         |

#### 2. Supported Standards and RFCs

eSignet provides a limited implementation of the OpenID protocol, supporting the following RFCs and standards:

**a. OAuth 2.0 Standards:**

* [OAuth 2.0 RFC 6749](https://www.rfc-editor.org/rfc/rfc6749) - Authorization code flow support
* [OAuth 2.0 RFC 6750](https://datatracker.ietf.org/doc/html/rfc6750) - Authorization Framework: Bearer Token Usage
* [OAuth 2.0 RFC 7523](https://www.rfc-editor.org/rfc/rfc7523) - JWT profile for client authentication
* [OAuth 2.0 RFC 7636 ](https://datatracker.ietf.org/doc/html/rfc7636)- PKCE security extension
* [OpenID Connect Core 1.0](https://openid.net/specs/openid-connect-core-1_0-final.html)
* [Open ID Connect Discovery 1.0](https://openid.net/specs/openid-connect-discovery-1_0.html)

**b. Token and Discovery Standards:**

* [RFC 7515](https://www.rfc-editor.org/rfc/rfc7515.html) - JSON Web Signature
* [RFC 7517](https://datatracker.ietf.org/doc/html/rfc7517) - JSON Web Keys
* [RFC 7519](https://www.rfc-editor.org/rfc/rfc7519) - ID token and access token as JWT
* [OAuth 2.0 RFC 8414](https://datatracker.ietf.org/doc/html/rfc8414) - Authorization Server Metadata
* [RFC 5785 ](https://www.rfc-editor.org/rfc/rfc5785)- Followed for both openid and oauth well-knowns

**c. Identity Proofing and security:**

* [Identity Assurance 1.0](https://openid.net/specs/openid-connect-4-identity-assurance-1_0.html)
* [IEEE SA P3167 SBI 2.0](https://openid.net/specs/openid-connect-4-identity-assurance-1_0.html)

#### 3. Supported Authentication Flows

As eSignet incorporates **OpenID Connect**, a wide range of client libraries are available for seamless integration. Therefore, it is recommended to avoid creating custom code for the integration process.

eSignet implements and supports only the flows mentioned below:

| **Standards**          | **Flow**                     | **Client Authentication** |
| ---------------------- | ---------------------------- | ------------------------- |
| OAuth 2.0              | Authorization Code with PKCE | private-key-jwt           |
| OIDC                   | Authorization Code with PKCE | private-key-jwt           |
| Identity Assurance 1.0 | Authorization Code with PKCE | private-key-jwt           |

**Note:** eSignet supports **confidential clients only**, adhering to the principle of **security by design**.

#### 4. Security Enhancements

* **Authorization Code Flow** – Exchanges an authorization code for a token, requiring client authentication.
* **Private-key-jwt -** Our supported client authentication method is private-key-jwt only which ensures that the token is given to a legitimate client.
* **PKCE** - We also support the [PKCE ](https://www.rfc-editor.org/rfc/rfc7636)(Proof Key for Code Exchange) security extension for exchanging an authorization code for a token, which guarantees that the authorization code was obtained by the same client application performing the code exchange.

**Note:** eSignet currently supports the S256 challenge method in its PKCE implementation.

#### 5. eSignet as OAuth 2.0 server

eSignet’s OAuth 2.0 implementation is a lightweight solution designed specifically for OIDC authentication flows. It does not function as a full-fledged authorization server but provides the essential capabilities required for identity verification and kyc. Additionally, eSignet:

* **Does not support role-based access control** - As it is designed for integration with national-level identity solutions, where predefined roles are not necessary for residents.

***


<!--
Old Content - Reflected till today as on 19th-June-2025

eSignet is built on industry-leading security standards, ensuring robust privacy and data protection. It implements [OpenID Connect Core 1.0](https://openid.net/specs/openid-connect-core-1_0-final.html) and [OAuth 2.0](https://oauth.net/2/), leveraging the most secure and trusted authentication flows to safeguard user identities.

### 1. Security and Interoperability <a href="#id-1.-security-and-interoperability" id="id-1.-security-and-interoperability"></a>

* eSignet integrates [SBI (Secure Biometric Interface)](https://standards.ieee.org/ieee/3167/10925/) to enable an ecosystem of biometric players.\
  Please refer [here](https://docs.mosip.io/1.2.0/biometrics/biometric-devices) to view the list of supported devices.\
  Additionally, eSignet:
* Adopts emerging standards for verifiable credentials with OpenID and seamless wallet integration.
* With eSignet v1.5.0, support has been introduced for [Identity Assurance](https://docs.esignet.io/overview/features#identity-assurance-flow-ekyc-verification) under OpenID Connect for fetching the verified user claims and their metadata.
* eSignet integrates with HSM PKCE 11 for the safe and secure storage of signing keys.
* eSignet implements OpenID Connect Discovery 1.0. Below are the supported well-knowns.

| Name                     | URL Paths                               |
| ------------------------ | --------------------------------------- |
| OpenID Configuration     | /.well-known/openid-configuration       |
| Jwks Json                | /.well-known/jwks.json                  |
| Authorization Server     | /.well-known/oauth-authorization-server |
| OpenID Credential Issuer | /.well-known/openid-credential-issuer   |

### 2. Supported Standards and RFCs <a href="#id-2.-supported-standards-and-rfcs" id="id-2.-supported-standards-and-rfcs"></a>

eSignet provides a limited implementation of the OpenID protocol, supporting the following RFCs and standards:

#### a. OAuth 2.0 Standards: <a href="#oauth-2.0-standards" id="oauth-2.0-standards"></a>

* [OAuth 2.0 RFC 6749](https://www.rfc-editor.org/rfc/rfc6749) - Authorization code flow support
* [OAuth 2.0 RFC 7636 ](https://datatracker.ietf.org/doc/html/rfc7636)- PKCE security extension
* [OAuth 2.0 RFC 7523](https://www.rfc-editor.org/rfc/rfc7523) - JWT profile for client authentication

#### b. Token and Discovery Standards: <a href="#token-and-discovery-standards" id="token-and-discovery-standards"></a>

* [RFC 7519](https://www.rfc-editor.org/rfc/rfc7519) - ID token and access token as JWT
* [RFC 5785 ](https://www.rfc-editor.org/rfc/rfc5785)- Followed for both openid and oauth well-knowns

#### c. Additional Security and Identity Standards: <a href="#additional-security-and-identity-standards" id="additional-security-and-identity-standards"></a>

* [Identity Assurance 1.0](https://openid.net/specs/openid-connect-4-identity-assurance-1_0.html)
* [IEEE SA P3167 SBI 2.0](https://openid.net/specs/openid-connect-4-identity-assurance-1_0.html)

### 3. Supported Authentication Flows <a href="#id-3.-supported-authentication-flows" id="id-3.-supported-authentication-flows"></a>

As eSignet incorporates **OpenID Connect**, a wide range of client libraries are available for seamless integration. Therefore, it is recommended to avoid creating custom code for the integration process.

eSignet implements and supports only the flows mentioned below:

| Standards              | Flow                         | Client Authentication |
| ---------------------- | ---------------------------- | --------------------- |
| OAuth 2.0              | Authorization Code with PKCE | private-key-jwt       |
| OIDC                   | Authorization Code with PKCE | private-key-jwt       |
| Identity Assurance 1.0 | Authorization Code with PKCE | private-key-jwt       |

{% hint style="info" %}
**Note:** eSignet supports **confidential clients only**, adhering to the principle of **security by design**.
{% endhint %}

### 4. Security Enhancements <a href="#id-4.-security-enhancements" id="id-4.-security-enhancements"></a>

* **Authorization Code Flow** – Exchanges an authorization code for a token, requiring client authentication.
* **Private-key-jwt -** Our supported client authentication method is private-key-jwt only which ensures that the token is given to a legitimate client.
* **PKCE** - We also support the [PKCE ](https://www.rfc-editor.org/rfc/rfc7636)(Proof Key for Code Exchange) security extension for exchanging an authorization code for a token, which guarantees that the authorization code was obtained by the same client application performing the code exchange.

{% hint style="info" %}
**Note:** eSignet currently supports the S256 challenge method in its PKCE implementation.
{% endhint %}

### 5. eSignet as OAuth 2.0 server <a href="#id-5.-esignet-as-oauth-2.0-server" id="id-5.-esignet-as-oauth-2.0-server"></a>

eSignet’s OAuth 2.0 implementation is a lightweight solution designed specifically for OIDC authentication flows. It does not function as a full-fledged authorization server but provides the essential capabilities required for identity verification and kyc.\
Additionally, eSignet:

* **Does not support role-based access control** - As it is designed for integration with national-level identity solutions, where predefined roles are not necessary.


-->