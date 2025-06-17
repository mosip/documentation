---
description: Explore eSignet’s powerful features for secure access.
---

# ✨ Features

## Unified Login

eSignet offers a convenient feature called Unified Login, which allows users to access applications and various services through a single interface thus eliminating the need for multiple logins. Additionally, eSignet enables seamless login to any government service by utilizing a single credential through the existing ID repository.

### Password-less Authentication <a href="#password-less-authentication" id="password-less-authentication"></a>

eSignet implements a password-less login method that leverages authentication factors supported by our system. This approach enhances security by mitigating the potential risks associated with password-related security vulnerabilities, such as weak passwords, password reuse, and phishing attacks.

## Support for various Authentication Modalities

### OTP Authentication

OTP authentication offers an additional level of security due to its short validity period. When logging into eSignet with OTP as the chosen method, our system generates a unique OTP and delivers it to the user via a registered communication channel, such as SMS or email. Upon receiving the OTP, the user can input it into the login interface. The system then compares the entered OTP with the generated one. If they match, the user is granted access to the system.

### Biometric Authentication

eSignet can connect to any biometric device that complies with IEEE P3167 SBI 2.0 standards, perform secure biometric capture, and enable authentication against an underlying ID system that can perform biometric authentication.

### Wallet-based Authentication

Mobile wallet-based authentication can be utilized to scan a QR code and finalize the authentication process using the previously activated credentials for online login. Additionally, facial authentication can be performed on the wallet to verify the presence.

### Knowledge Based Identification

eSignet has expanded its authentication options to include Knowledge-Based Identification (KBI) as one of its factors. With eSignet's integration capabilities, existing ID repositories storing user-specific details can now be easily integrated with eSignet thereby enabling service providers to authenticate users.

Below are some of the FAQs on KBI:

[**How to configure KBI form in eSignet UI?**](./#how-to-configure-kbi-form-in-esignet-ui)

[**How is the authenticator plugin implemented for KBI with Sunbird RC?**](../../general/faq.md#how-is-authenticator-plugin-implemented-for-kbi-with-sunbird-rc)

#### Verifiable Credentials

Verifiable credentials (VCs) are digital representations of physical credentials like passports or licenses. They are digitally signed, making them tamper-resistant and instantly verifiable. Issued by trusted entities, VCs are stored in digital wallet apps and used by individuals to access various services.

{% hint style="info" %}
**Note:** VCI is supported up to [eSignet v1.4.2](https://docs.esignet.io/versions/v1.4.2) but will no longer be supported in future versions.
{% endhint %}

**Verifiable Credentials Issuance (VCI)** is now supported by[ Inji Certify](https://docs.mosip.io/inji/inji-certify/overview), to know more about VCI please refer [here](https://docs.mosip.io/inji/inji-certify/overview#verifiable-credentials-issuance-through-inji-certify).

## Consent

User consent refers to the voluntary and informed agreement provided by an individual, often referred to as a user, to a specific action, process, or request. Users should have a clear understanding of what they are consenting to. User consent is particularly important in the context of data privacy, where it is required in many jurisdictions for organizations to obtain explicit consent from individuals before collecting, processing, or sharing their data.

Consent mechanisms are often used in the form of checkboxes, pop-up notifications, or consent forms on applications to ensure that the users understand and agree to data processing practices.\
\
eSignet stores the consent in a built-in **consent registry** which is specifically designed to store user consent on claims and scopes that are requested during the first login into a relying party's application using eSignet.

### **Identity Assurance Flow(eKYC verification)**

eSignet has been enhanced to integrate the OpenID Connect (OIDC) protocol extension for identity assurance and verification metadata, enabling a video-based eKYC verification process during user sign in. This enhancement allows relying parties (e.g., banks, insurance companies, and other regulated entities) to authenticate users and verify their identity claims with a high level of confidence, combining video verification with traditional methods like document scanning and biometric checks.

#### **OpenID Connect Assurance Extension**

The [OpenID Connect Assurance Extension](https://openid.net/specs/openid-connect-4-identity-assurance-1_0.html) is an enhancement to the OpenID Connect (OIDC) protocol that adds assurance data to identity claims. While OpenID Connect enables secure authentication, the assurance extension provides additional metadata about the trustworthiness and verification of claims. This assurance data includes:

* **Verification Status**: Whether the claim is self-asserted or verified (e.g., by government-issued IDs, document validation, or biometric checks).
* **Verification Process Details**: Information about who and how the claim was verified, such as the trust framework, process, and method used (e.g., in-person document check, video verification, or biometric validation).
* **Assurance Level**: The level of confidence or trust in the claim's accuracy.

This extension is particularly useful in scenarios requiring strong identity verification, such as eKYC (electronic Know Your Customer) processes in regulated industries like banking and finance.

#### **Claim level status** <a href="#claim-level-status" id="claim-level-status"></a>

Based on the request for verified claims, eSignet displays fine-grained details for each claim about its availability and its verification status to the end user. With this, the end-user is well informed about the claim details and is enabled to go through the verification process or deny the request.

## Language Support for eSignet

The eSignet user interface (UI) offers comprehensive language support to facilitate effective communication. By default, eSignet includes language bundles for Arabic, English, Hindi, Kannada, and Tamil. Moreover, it can be easily customized to incorporate additional languages as necessary to accommodate specific country requirements.

Furthermore, eSignet has undergone meticulous testing to ensure seamless compatibility with right-to-left (RTL) languages. This means that users can rely on eSignet to confidently navigate and interact with RTL content.

{% hint style="info" %}
📝 **Note:**

1. To add more language bundles in eSignet, please refer to the below FAQs.

[How to add a new language to eSignet?](https://docs.esignet.io/faq#how-to-add-a-new-language-in-esignet)

2. To remove a language from eSignet, please refer to the below FAQ.

[How to remove a language from the eSignet default setup?](../../general/faq.md#how-to-remove-a-language-from-the-esignet-default-setup)
{% endhint %}



<!-- >
New Content - 17-June-2025 (In review)


## Features

eSignet Auth is one of the two core modules within the eSignet. Purpose-built for identity authentication, eSignet Auth serves as a lightweight and flexible middleware layer between identity systems and service portals. It is designed to support secure, scalable, and privacy-conscious authentication workflows across a wide range of digital services—whether in government, finance, education, or enterprise environments.

### On-Demand Selection of Authentication Factors

eSignet Auth allows service providers to define and configure authentication factors dynamically—based on user context, service sensitivity, or assurance levels. This modular approach supports flexible authentication journeys tailored to specific policy or risk requirements.

**Supported Authentication Methods:**

* **Password-Based Login**\
  Traditional username and password login, with optional UI settings such as enabling or hiding the 'Forgot Password' link.
* **OTP (One-Time Password) Authentication**\
  One-time codes sent via SMS or email for time-bound access—especially suitable in contexts where biometrics or wallets are unavailable.
* **Knowledge-Based Identification (KBI)**\
  Authentication via answers to identity-based questions, ideal for low-connectivity or limited-device scenarios.
  * **📝 FAQ Highlights for KBI:**

> - [**How to configure KBI form in eSignet UI?**](https://docs.esignet.io/overview/features#how-to-configure-kbi-form-in-esignet-ui)
> - [**How is the authenticator plugin implemented for KBI with Sunbird RC?**](https://docs.esignet.io/general/faq#how-is-authenticator-plugin-implemented-for-kbi-with-sunbird-rc)

* **Biometric Authentication**\
  Authentication using biometrics through devices compliant with IEEE P3167 SBI 2.0 standards.
  *   **On-Demand Selection of Biometric Modalities**

      Service providers can selectively enable biometric modalities—such as facial recognition, fingerprint, or iris scan—based on device capabilities, assurance needs, or user preferences.
* **Wallet-Based QR Code Login**\
  Authenticate by scanning a QR code with a mobile wallet containing pre-verified credentials. Optional face recognition within the wallet confirms user presence.

> All authentication flows are fully configurable via the eSignet Auth UI, making it easy to implement diverse login journeys across user segments and assurance levels.

### **Verifiable Credentials**

eSignet supports **Verifiable Credentials (VCs)**—digital versions of official documents like passports, certificates, or licenses. These credentials are issued by trusted authorities, digitally signed to prevent tampering, and stored securely in digital wallets. They allow individuals to prove their identity and access services quickly and reliably.

> **Note:** VCI is supported up to eSignet v1.4.2\<Link to the 1.4.2 git hub >. Going forward, VCI support is provided through **Inji Certify**. Please refer to Inji Certify\<Link to inji certify docs> for the latest implementation.

### Consent Management

eSignet Auth enables fine-grained control over user consent, ensuring transparency and compliance with privacy standards.

**Key Consent Features:**

* **Re-Consent:**\
  Automatically prompt users for re-consent when claim scopes change or when existing consent has expired.
* **Consent Storage**\
  All user consents are stored in a built-in **Consent Registry**, providing auditability and control for both users and service providers.
* **Consent Expiry Configuration**\
  Define how long a user’s consent remains valid—per session, per time window, or indefinitely.
* **Configuring Claims**\
  Supports **all standard claims as defined by the OpenID Connect (OIDC) protocol**. Custom claim configurations can be set depending on authentication requirements or service needs.
* **Configurable Consent**\
  Consent behavior can be tailored per flow or service with the following options:
  * **Enforce Mandatory Consent**: Force consent collection regardless of previous user decisions.
  * **Re-consent**: Request users to consent again, useful for policy updates or critical changes.
  * **Bypass Consent**: Skip the consent step entirely where it's not necessary.

### **Customizable UI**

eSignet Auth provides an adaptable and themeable UI framework that allows service providers to align the authentication interface with their brand, user flow, and assurance requirements.

**UI Customization Capabilities:**

* **Purpose Display Configuration \<Link to the Purpose based configuration page>**\
  Clearly indicate the intent of the action—e.g., Login, Verify Identity, or Link Account—to guide user interaction.
* **Multiple Login ID Options \<Link to the login configuration page under configure eSignet>**\
  Enable users to choose from different login identifiers such as email, phone number, or username—improving accessibility across user segments.
* **Theme and Layout Customization**\
  Tailor look and feel to match your portal’s branding, including colors, logos, fonts, and button styles.
* **Context-Aware UI Behavior**\
  Adjust UI flow based on user type, assurance level, or chosen authentication factor (e.g., show/hide biometric prompts or OTP inputs dynamically).

### **Language Support**

To ensure inclusive access for diverse user groups, eSignet offers multilingual UI support. Out-of-the-box language options include **Arabic, English, Hindi, Kannada, and Tamil**. Additional languages can be easily integrated to meet specific country or regional requirements.

1. [How to add a new language to eSignet?](https://docs.esignet.io/faq#how-to-add-a-new-language-in-esignet)
2. [How to remove a language from the eSignet default setup?](https://docs.esignet.io/general/faq#how-to-remove-a-language-from-the-esignet-default-setup)



--> 



