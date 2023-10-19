# Features

## One Login

e-Signet offers a convenient feature called One Login, which allows users to access applications and various services through a single interface. This feature provides a single sign-on (SSO) experience, eliminating the need for multiple logins. Additionally, e-Signet enables seamless login to any government service by utilizing a single credential through the existing ID repository.

## Password-less Authentication

e-Signet implements a password-less login method that leverages authentication factors supported by our system. This approach enhances security by mitigating the potential risks associated with password-related security vulnerabilities, such as weak passwords, password reuse, and phishing attacks.

{% hint style="info" %}
Though we don't believe in passwords, e-Signet still provides an option to enable password-based authentication for an authentication system that stores passwords. In order to perform password-based authentication in e-Signet, you can go through the below article.

[How to enable password-based authentication in e-Signet?](../../faq/#how-to-configure-password-authentication-in-e-signet)
{% endhint %}

## Support for various Authentication Modalities

### OTP Authentication

OTP authentication offers an additional level of security due to the short validity period of the OTP. In the case of logging in to e-Signet with OTP as the chosen method, our system generates a unique OTP and delivers it to the user via a registered communication channel, such as SMS or email. Upon receiving the OTP, the user can input it into the login interface. The system then compares the entered OTP with the generated one. If they match, the user is granted access to the system.

### Biometric Authentication

e-Signet can connect to any biometric device that complies with IEEE P3167 SBI 2.0 standards, perform secure biometric capture, and enable authentication against an underlying ID system that has the capability to perform biometric authentication.

### Wallet-Based Authentication

Mobile wallet-based authentication can be utilized to scan a QR code and finalize the authentication process using the previously activated credentials for online login. Additionally, facial authentication can happen on the wallet to make sure the presence is verified.

## Verifiable Credentials Issuance

Verifiable credentials (VCs) are an open standard for digital credentials. They can represent information found in physical credentials, such as a passport or license, in digital format. They have numerous advantages over physical credentials, most notably that they're digitally signed, which makes them tamper-resistant and instantly verifiable.

VCs are generally issued by entities who are eligible to assert claims on specific domain aspects about an individual/entity. These issuer entities are also widely trusted by relying parties in an ecosystem.

Individuals/holder receives and stores these VCs from issuers in their digital wallet apps and later will use these VCs to avail of various services.

OID4VCI is a mechanism built extending the OAuth 2.0 protocol to enable standards-based interaction between wallets and issuer applications to transfer VCs. Since this is based on proved OAuth 2.0 protocol, issuers also get a reliable mechanism to authenticate the individual before delivering the VC. This promotes interoperability between wallet providers and issuers.

e-Signet being an OAuth 2.0 & OIDC-based solution, it is enhanced to support OID4VCI flows. Once the e-Signet VCI solution is integrated into a classic issuer, it can enable the issuer application to become OID4VCI compliant and become interoperable with all OID4VCI compatible wallets.

## Consent

User consent refers to the voluntary and informed agreement provided by an individual, often referred to as a user, to a specific action, process, or request. Users should have a clear understanding of what they are consenting to. User consent is particularly important in the context of data privacy, where it is required in many jurisdictions for organizations to obtain explicit consent from individuals before collecting, processing, or sharing their personal data.

Consent mechanisms are often used in the form of checkboxes, pop-up notifications, or consent forms on applications to ensure that the users understand and agree to data processing practices.\
\
e-Signet stores the consent in a built-in **consent registry** which is specifically designed to store user consent on claims and scopes that are requested during the first login into a relying party's application using e-Signet.

## Language Support for e-Signet

The e-Signet user interface (UI) offers comprehensive language support to facilitate effective communication. By default, e-Signet includes language bundles for Arabic, English, Hindi, Kannada, and Tamil. Moreover, it can be easily customized to incorporate additional languages as necessary to accommodate specific country requirements.

Furthermore, e-Signet has undergone meticulous testing to ensure seamless compatibility with right-to-left (RTL) languages. This means that users can rely on e-Signet to confidently navigate and interact with RTL content.

{% hint style="info" %}
In order to add more language bundles in e-Signet, you can go through the below article.

[How to add a new language to e-Signet?](../../faq/#how-to-add-a-new-language-in-e-signet)

In order to remove a language from e-Signet, you can go through the below article.

[How to remove a language from the e-Signet default setup?](../../faq/#how-to-remove-a-language-from-the-e-signet-default-setup)
{% endhint %}
