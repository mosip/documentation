---
description: Explore eSignet’s powerful features for secure access.
---

# Features

eSignet Auth is one of the two core modules within the eSignet. Purpose-built for identity authentication, eSignet Auth serves as a lightweight and flexible middleware layer between identity systems and service portals. It is designed to support secure, scalable, and privacy-conscious authentication workflows across a wide range of digital services—whether in government, finance, education, or enterprise environments.

## On-Demand Selection of Authentication Factors

eSignet Auth allows service providers to define and configure authentication factors dynamically—based on user context, service sensitivity, or assurance levels. This modular approach supports flexible authentication journeys tailored to specific policy or risk requirements.

### Supported Authentication Methods:

* **Password-Based Login** Traditional username and password login, with optional UI settings such as enabling or hiding the 'Forgot Password' link.
* **OTP (One-Time Password) Authentication** One-time codes sent via SMS or email for time-bound access—especially suitable in contexts where biometrics or wallets are unavailable.
* **Knowledge-Based Identification (KBI)** Authentication via answers to identity-based questions, ideal for low-connectivity or limited-device scenarios.

{% hint style="info" %}
**FAQ Highlights for KBI**:

* [How to configure KBI form in eSignet UI?](../general/faq.md#how-to-configure-knowledge-based-identification-kbi-form-in-esignet-ui)
* [How is the authenticator plugin implemented for KBI with Sunbird RC?](https://docs.esignet.io/general/faq#how-is-authenticator-plugin-implemented-for-kbi-with-sunbird-rc)
{% endhint %}

{% hint style="info" %}
**Configurable KBI Form (UI Schema–Driven)**

eSignet’s KBI authentication flow now supports **dynamic, UI Schema–based form rendering**, replacing the earlier fixed and static field layout. Relying Parties can now **configure and adapt the KBI form fields** as per their verification needs, offering greater flexibility and customization without code changes.

_For detailed configuration and supported input types, please refer to the technical guide on GitHub._
{% endhint %}

* **Biometric Authentication** Authentication using biometrics through devices compliant with IEEE P3167 SBI 2.0 standards.
  * **On-Demand Selection of Biometric Modalities**

Service providers can selectively enable biometric modalities—such as facial recognition, fingerprint, or iris scan—based on device capabilities, assurance needs, or user preferences.

* Wallet-Based QR Code Login Authenticate by scanning a QR code with a mobile wallet containing pre-verified credentials. Optional face recognition within the wallet confirms user presence.

{% hint style="info" %}
All authentication flows are fully configurable via the eSignet Auth UI, making it easy to implement diverse login journeys across user segments and assurance levels.
{% endhint %}

## Verifiable Credentials

eSignet supports Verifiable Credentials (VCs)—digital versions of official documents like passports, certificates, or licenses. These credentials are issued by trusted authorities, digitally signed to prevent tampering, and stored securely in digital wallets. They allow individuals to prove their identity and access services quickly and reliably.

**Note** : [VCI is supported up to eSignet v1.4.2](https://github.com/mosip/esignet/tree/v1.4.2). Going forward, VCI support is provided through Inji Certify. Please refer to [Inji Certify](https://docs.inji.io/inji-certify/overview) for the latest implementation.

## Consent Management

eSignet Auth enables fine-grained control over user consent, ensuring transparency and compliance with privacy standards.

**Key Consent Features**:

* **Re-Consent**: Automatically prompt users for re-consent when claim scopes change or when existing consent has expired.
* **Consent Storage** All user consents are stored in a built-in Consent Registry, providing auditability and control for both users and service providers.
* **Consent Expiry Configuration** Define how long a user’s consent remains valid—per session, per time window, or indefinitely.
* **Configuring Claims** Supports all standard claims as defined by the OpenID Connect (OIDC) protocol. Custom claim configurations can be set depending on authentication requirements or service needs.
* **Configurable Consent** Consent behavior can be tailored per flow or service with the following options:
  * Enforce Mandatory Consent: Force consent collection regardless of previous user decisions.
  * Re-consent: Request users to consent again, useful for policy updates or critical changes.
  * Bypass Consent: Skip the consent step entirely where it's not necessary.

## FAPI 2.0 Security Profile Compliance <a href="#fapi-2.0-security-profile" id="fapi-2.0-security-profile"></a>

### **What is the FAPI 2.0 Security Profile?**

The FAPI (Financial-grade API) 2.0 Security Profile is a set of standards and best practices built on OAuth2/OpenID Connect to deliver high-assurance, interoperable, and phishing-resistant API and authentication flows. FAPI 2.0 is widely adopted in high-risk industries (banking, government IDM, digital public infrastructure) where confidentiality, integrity, and client assurance must be provable and enforceable.

### **Why we implemented FAPI 2.0 in eSignet?**

eSignet handles high-assurance identity and authentication transactions. Adopting FAPI 2.0 raises the baseline security posture by addressing real-world risks in front-channel flows, token misuse, and server impersonation. Implementing FAPI features helps eSignet better protect sensitive claims and tokens, reduce the attack surface for authorization flows, and improve interoperability with partner systems that already follow financial-grade security practices.

### **RFCs implemented**

To align eSignet with the FAPI 2.0 profile, v1.7.0 introduces support for three RFCs that together harden authorization flows:

* [**Pushed Authorization Requests (PAR)**](features.md#what-is-par-sub-section-of-the-fapi-2.0-security-profile-section-above)  — moves authorization requests from the browser front-channel to a secure server-to-server POST. PAR prevents exposure and tampering of authorization parameters (redirect URIs, scopes, claims) in browser URLs and ensures the authorization server processes exactly what the client intended.
* **Demonstrating Proof-of-Possession (DPoP)** — binds access tokens to a client-held cryptographic key and requires the client to present a signed, per-request proof. DPoP makes stolen tokens unusable by third parties and prevents replay or misuse of intercepted tokens.
* **Authorization Server Issuer Identification (OIDC Metadata checks)** — enforces clear, verifiable issuer metadata so clients can confirm they are interacting with the intended authorization server. This prevents environment mix-ups and server impersonation attacks (e.g., sandbox vs production confusion or malicious endpoints).

#### **What is PAR?**  <a href="#what-is-par-sub-section-of-the-fapi-2.0-security-profile-section-above" id="what-is-par-sub-section-of-the-fapi-2.0-security-profile-section-above"></a>

Pushed Authorization Requests (PAR) introduce a more secure way for a Relying Party (RP) to initiate the OAuth/OIDC authorization flow. Instead of sending sensitive authorization parameters (such as redirect URIs, scopes, claims, and client details) through a browser redirect, the RP “pushes” these parameters directly to eSignet using a secure, back-channel POST request. eSignet returns a **request URI**, which is then used in the front-channel redirect to complete the flow.\
This design ensures that the _actual authorization request_ is exchanged only between trusted servers and never exposed to the user’s browser, links, logs, or intermediaries.

#### **Why PAR was introduced**

Traditional OAuth flows rely on front-channel redirects where authorization parameters appear in the URL. These URLs may pass through multiple layers—browser history, proxies, referrers, server logs—exposing sensitive data and enabling tampering. PAR eliminates these weaknesses by shifting the critical parts of the request to a protected server-to-server interaction.

#### **What attacks PAR prevents**

PAR strengthens authorization security by mitigating:

* **Request Parameter Injection / Tampering:** Attackers cannot modify scopes, redirect URLs, or claims because these parameters are never in the browser.
* **Open Redirect & Redirect URI Manipulation:** The server-to-server flow ensures redirect URIs are validated and bound to the pushed request.
* **Phishing via Modified Authorization Requests:** Attackers cannot alter the authorization flow to trick users into consenting to malicious scopes.
* **Exposure of Sensitive Parameters:** Prevents leakage through browser history, logs, referrers, or intermediary systems.
* **Replay Attacks on Request Objects:** The request URI has a short validity and is bound to a specific pushed request, limiting misuse.

#### **What can Relying Parties expect when integrating with PAR?**

RPs adopting PAR with eSignet should expect:

* A requirement to send authorization requests via a **secure POST request** to the `/par` endpoint.
* eSignet will return a **request\_uri** and expiry value.
* The browser redirect will use only the `request_uri`, keeping the full request confidential.
* Reduced risk of invalid, manipulated, or tampered authorization requests.
* Seamless compatibility with modern OAuth/OIDC libraries that support PAR.

#### **Specification implemented**

eSignet implements [**RFC 9126 – OAuth 2.0 Pushed Authorization Requests**](https://datatracker.ietf.org/doc/html/rfc9126), which standardizes this server-to-server mechanism for high-assurance authorization flows.

\
Refer to the **eSignet PAR documentation** in the GitHub repository for endpoint details, sample requests, and integration steps.

#### **What is DPoP ?**

Demonstrating Proof of Possession (DPoP) is a security mechanism designed to ensure that access tokens issued by eSignet cannot be used by anyone other than the client that originally obtained them.\
In traditional OAuth flows, access tokens are often **bearer tokens**, meaning _anyone who has the token can use it_. DPoP strengthens this by binding each token to a public key generated by the RP. Every request to eSignet’s protected endpoints must include a **DPoP proof** — a signed JWT that proves the client holds the private key.

This transforms access tokens from simple bearer tokens into **sender-constrained tokens**, making intercepting or stealing them useless.

#### **Why DPoP was introduced**

Bearer tokens, while convenient, pose a high risk in distributed environments. If intercepted in transit, logs, compromised apps, or browser storage, they can be reused by attackers.\
DPoP ensures that even if a token leaks, it _cannot_ be used without the corresponding private key, which attackers do not possess.

#### **What attacks DPoP prevents**

DPoP prevents a set of high-impact token misuse scenarios, including:

* **Token Replay Attacks** – Stolen tokens cannot be reused by attackers.
* **Token Theft Via Browser or App Compromise** – Tokens are unusable without the private key.
* **Interception by Malicious Intermediaries / Proxies** – Sender-constrained tokens render interception ineffective.
* **Cross-Device Abuse** – Tokens are bound to the RP’s key, preventing use from another device or service.

#### **Specification implemented**

eSignet implements [**RFC 9449 – OAuth 2.0 Demonstrating Proof-of-Possession (DPoP)**](https://datatracker.ietf.org/doc/html/rfc9449), which defines the creation and verification of DPoP proofs and sender-constrained access tokens.

#### **What should relying parties expect when integrating with eSignet?**

Relying Parties integrating with DPoP in eSignet will need to:

* Generate and manage a key pair (public/private) for DPoP.
* Include a **DPoP proof JWT** in requests to token and resource endpoints.
* Receive **DPoP-bound access tokens**, which only work when accompanied by valid proofs.
* Ensure backend services can sign DPoP proofs (since private keys must never be exposed to browser clients).

\
Please refer to the **DPoP section in the eSignet documentation** on GitHub for implementation steps and example payloads.

#### **What is Authorization Server Issuer Identification?**

Authorization Server Issuer Identification ensures that a Relying Party (RP) can **cryptographically verify the identity of the Authorization Server (eSignet)** before processing tokens or responses issued by it.\
Traditionally, OAuth/OIDC clients rely on the `issuer` value published in the `.well-known` metadata and assume that all tokens and endpoints they interact with belong to that same issuer.\
However, sophisticated attacks—such as mix-up attacks—exploit situations where clients are tricked into sending tokens or requests to the wrong authorization server.

To prevent this, the Authorization Server must include an **explicit** `iss` **(issuer) identifier** in authorization responses and tokens, allowing clients to ensure that the response actually originated from the expected authorization server.

#### **What attacks this prevents**

Authorization Server Issuer Identification primarily protects RPs against:

* **Authorization Server Mix-Up Attacks** – Prevents attackers from redirecting the client to a malicious authorization server.
* **Token Substitution Attacks** – Ensures tokens cannot be injected from another issuer.
* **Cross-AS Confusion** – Prevents clients from accidentally mixing tokens from multiple identity providers.
* **Phishing-style Authorization Redirections** – RP can verify it is interacting with the legitimate eSignet Authorization Server.

By validating the `iss` claim, clients ensure strong trust in the source of all authorization artifacts.

#### **Specification implemented**

eSignet implements the [**RFC-9207** - **OAuth 2.0 Authorization Server Issuer Identifier specification**](https://datatracker.ietf.org/doc/html/rfc9207)

#### **What can Relying Parties expect when integrating with this?**

Relying Parties integrating with eSignet should expect the following behavior:

* All authorization responses will include a mandatory `iss` **(issuer) parameter**.
* RPs must validate that the issuer in the response **matches the issuer value retrieved from eSignet’s** `.well-known/openid-configuration`.
* Token responses and ID tokens will remain consistent with the expected issuer to prevent cross-provider confusion.
* RP libraries that support FAPI 2.0 or modern OIDC security profiles will automatically validate these issuer claims.
* This significantly reduces the risk of authorization mix-up scenarios during integration.

## Customizable UI

eSignet Auth provides an adaptable and customizable UI framework that allows service providers to align the authentication interface with their brand, user flow, and assurance requirements.

**UI Customization Capabilities**:

* [**Purpose Display Configuration**](develop/configuration/purpose-based-ui-rendering-in-esignet.md)**:**&#x43;learly indicate the intent of the action—e.g., Login, Verify Identity, or Link Account—to guide user interaction.
* [**Multiple Login ID Options**](develop/configuration/login-id-configuration-in-esignet.md)**:** Enable users to choose from different login identifiers such as email, phone number, or username—improving accessibility across user segments.
* **Theme and Layout Customization:** Tailor look and feel to match your portal’s branding, including colors, logos, fonts, and button styles.
* **Context-Aware UI Behavior:** Adjust UI flow based on user type, assurance level, or chosen authentication factor (e.g., show/hide biometric prompts or OTP inputs dynamically).

## Language Support

To ensure inclusive access for diverse user groups, eSignet offers multilingual UI support. Out-of-the-box language options include Arabic, English, Hindi, Kannada, and Tamil. Additional languages can be easily integrated to meet specific country or regional requirements.

{% hint style="info" %}
[How to add a new language to eSignet?](https://docs.esignet.io/general/faq#how-to-add-a-new-language-in-esignet)

[How to remove a language from the eSignet default setup?](https://docs.esignet.io/general/faq#how-to-remove-a-language-from-the-esignet-default-setup)
{% endhint %}



