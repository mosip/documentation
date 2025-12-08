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

_For detailed configuration and supported input types, please refer to the_ [_technical guide on GitHub_](https://github.com/mosip/esignet/blob/master/docs/design/dynamic-forms.md)_._
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

* **Pushed Authorization Requests (PAR)** — moves authorization requests from the browser front-channel to a secure server-to-server POST. PAR prevents exposure and tampering of authorization parameters (redirect URIs, scopes, claims) in browser URLs and ensures the authorization server processes exactly what the client intended.
* **Demonstrating Proof-of-Possession (DPoP)** — binds access tokens to a client-held cryptographic key and requires the client to present a signed, per-request proof. DPoP makes stolen tokens unusable by third parties and prevents replay or misuse of intercepted tokens.
* **Authorization Server Issuer Identification (OIDC Metadata checks)** — enforces clear, verifiable issuer metadata so clients can confirm they are interacting with the intended authorization server. This prevents environment mix-ups and server impersonation attacks (e.g., sandbox vs production confusion or malicious endpoints).

{% hint style="success" %}
FAPI 2.0 For a deeper understanding of FAPI 2.0 and the mechanisms implemented in eSignet, see the FAPI 2.0 Security Profile specification: https://openid.net/specs/fapi-security-profile-2\_0-final.html.
{% endhint %}

{% hint style="success" %}
Attacker model and mitigations with FAPI 2.0

FAPI 2.0 defends high-risk OAuth/OIDC flows against tampering, mix-up, phishing, token theft/replay, and leakage via front-channel exposure. To know more about this refer [here](https://openid.net/specs/fapi-2_0-attacker-model.html)
{% endhint %}

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
