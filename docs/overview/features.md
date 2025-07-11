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

**FAQ Highlights for KBI**:

[How to configure KBI form in eSignet UI?](https://docs.esignet.io/overview/features#how-to-configure-kbi-form-in-esignet-ui)

[How is the authenticator plugin implemented for KBI with Sunbird RC?](https://docs.esignet.io/general/faq#how-is-authenticator-plugin-implemented-for-kbi-with-sunbird-rc)

* **Biometric Authentication** Authentication using biometrics through devices compliant with IEEE P3167 SBI 2.0 standards.
  * **On-Demand Selection of Biometric Modalities**

Service providers can selectively enable biometric modalities—such as facial recognition, fingerprint, or iris scan—based on device capabilities, assurance needs, or user preferences.

* Wallet-Based QR Code Login Authenticate by scanning a QR code with a mobile wallet containing pre-verified credentials. Optional face recognition within the wallet confirms user presence.

All authentication flows are fully configurable via the eSignet Auth UI, making it easy to implement diverse login journeys across user segments and assurance levels.

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

## Customizable UI

eSignet Auth provides an adaptable and themeable UI framework that allows service providers to align the authentication interface with their brand, user flow, and assurance requirements.

**UI Customization Capabilities**:

* [**Purpose Display Configuration**](../esignet-authentication/develop/configuration/purpose-based-ui-rendering-in-esignet.md) Clearly indicate the intent of the action—e.g., Login, Verify Identity, or Link Account—to guide user interaction.
* [**Multiple Login ID Options**](../esignet-authentication/develop/configuration/login-id-configuration-in-esignet.md) Enable users to choose from different login identifiers such as email, phone number, or username—improving accessibility across user segments.
* **Theme and Layout Customization** Tailor look and feel to match your portal’s branding, including colors, logos, fonts, and button styles.
* **Context-Aware UI Behavior** Adjust UI flow based on user type, assurance level, or chosen authentication factor (e.g., show/hide biometric prompts or OTP inputs dynamically).

## Language Support

To ensure inclusive access for diverse user groups, eSignet offers multilingual UI support. Out-of-the-box language options include Arabic, English, Hindi, Kannada, and Tamil. Additional languages can be easily integrated to meet specific country or regional requirements.

[How to add a new language to eSignet?](https://docs.esignet.io/general/faq#how-to-add-a-new-language-in-esignet)

[How to remove a language from the eSignet default setup?](https://docs.esignet.io/general/faq#how-to-remove-a-language-from-the-esignet-default-setup)

