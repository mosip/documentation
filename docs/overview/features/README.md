# Features

## Unified Login

eSignet offers a convenient feature called Unified Login, which allows users to access applications and various services through a single interface thus eliminating the need for multiple logins. Additionally, eSignet enables seamless login to any government service by utilizing a single credential through the existing ID repository.

## Support for various Authentication Modalities

### OTP Authentication

OTP authentication offers an additional level of security due to its short validity period. When logging into eSignet with OTP as the chosen method, our system generates a unique OTP and delivers it to the user via a registered communication channel, such as SMS or email. Upon receiving the OTP, the user can input it into the login interface. The system then compares the entered OTP with the generated one. If they match, the user is granted access to the system.

### Biometric Authentication

eSignet can connect to any biometric device that complies with IEEE P3167 SBI 2.0 standards, perform secure biometric capture, and enable authentication against an underlying ID system that can perform biometric authentication.

### Wallet-based Authentication

Mobile wallet-based authentication can be utilized to scan a QR code and finalize the authentication process using the previously activated credentials for online login. Additionally, facial authentication can happen on the wallet to make sure the presence is verified.

### Password-based Authentication

eSignet also offers password authentication as one of its authentication factors. With eSignet's integration capabilities, existing ID repositories storing user accounts with passwords can now be easily integrated with eSignet. This integration enables OpenID based login, allowing users to access relying party services seamlessly.

[**How to enable password-based authentication in eSignet?**](../../faq/#how-to-configure-password-authentication-in-esignet)

### Knowledge Based Identification

eSignet has expanded its authentication options to include Knowledge-Based Identification (KBI) as one of its factors. With eSignet's integration capabilities, existing ID repositories storing user-specific details can now be easily integrated with eSignet thereby enabling service providers to authenticate users.

#### [How to configure KBI form in eSignet UI?](./#how-to-configure-kbi-form-in-esignet-ui)

[**How is the authenticator plugin implemented for KBI with Sunbird RC?**](../../faq/#how-is-authenticator-plugin-implemented-for-kbi-with-sunbird-rc)

#### Verifiable Credentials&#x20;

Verifiable credentials (VCs) are digital representations of physical credentials like passports or licenses. They are digitally signed, making them tamper-resistant and instantly verifiable. Issued by trusted entities, VCs are stored in digital wallet apps and used by individuals to access various services.

{% hint style="info" %}
**Note:** VCI is supported up to [eSignet v1.4.2](https://docs.esignet.io/versions/v1.4.2) but will no longer be supported in future versions.
{% endhint %}

Verifiable Credentials Issuance (VCI) is now supported by[ Inji Certify](https://docs.mosip.io/inji/inji-certify/overview), to know more about VCI please refer [here](https://docs.mosip.io/inji/inji-certify/overview#verifiable-credentials-issuance-through-inji-certify).

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
📝 **Note:** \
1\. To add more language bundles in eSignet, you can go through the below article.

[How to add a new language to eSignet?](https://docs.esignet.io/faq#how-to-add-a-new-language-in-esignet)

2. To remove a language from eSignet, you can go through the below article.

[How to remove a language from the eSignet default setup?](../../faq/#how-to-remove-a-language-from-the-esignet-default-setup)
{% endhint %}

