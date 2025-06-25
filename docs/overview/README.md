---
description: A Modern and Inclusive Digital Identity Authentication Solution
icon: house
---

# Overview

### Overview

eSignet is envisioned as a thin add-on system to any existing digital ID solution to bring in additional capabilities and enhance functionalities.

Please take a moment to watch the video below to explore valuable insights into eSignet and its wide array of powerful features! 🚀✨

{% embed url="https://www.youtube.com/watch?v=ZfUPRv71s_0" %}

Now, let us understand the key objectives of [eSignet](../).

### Enhancing authentication methods

* It implements [OpenID Connect](https://openid.net/connect/) flows, which helps the relying party perform quick and easy integrations using pre-existing libraries for user verification.
* The system supports only the secure options in OpenID Connect, like authorization code flow to ensure the resident data is handled securely.
* It is integrated with [SBI](https://standards.ieee.org/ieee/3167/10925/) (Secure Biometric Interface) to facilitate secure biometric collection for biometric-based user verification.
* The system supports multiple authentication factors, like OTP, biometrics, etc., to be inclusive for all people.
* All integrations to the ID system are taken as a runtime plug-able library to allow the reuse of official container images that help with easier upgrades.
* Since this is designed especially for country-scale resident verification, eSignet does not support additional features like role management, session management, etc.

### User Centricity

At eSignet, our core goals are to prioritize inclusion and accessibility. We place a strong emphasis on user privacy and data protection. Our platform, eSignet, is designed to enhance user convenience by providing various options and accommodating flexibility in the realm of identity verification.

* **One ID**: Gain access to multiple services with ease. Users can log in to integrated government and private sector services using a single identity credential.
* **Mandatory User Consent**: Before allowing access to personal information, we require users to provide explicit consent. Our platform incorporates a built-in consent flow.
* **Multiple modes of authentication**: We offer various methods for identity verification to accommodate individual preferences.
* **Credential protection**: We ensure login credentials are not shared with relying parties. The login process takes place exclusively on the eSignet platform.

### Go digital quickly

* Fast and secure digital verification across services.
* Ability to verify residents with the same level of assurance as during registration (OTP, Biometric, Cryptographic key).
* Empower the government to offer digital verification and e-KYC as a service, enabling improved access to financial inclusion.
* Easy integration with relying parties, as we follow standard-based protocols, reducing time to market.
* Narrow and bridge the digital divide by enabling multiple modes of verification.

For more details on eSignet, please go through the below documentation.

<table data-view="cards"><thead><tr><th></th><th data-hidden></th><th data-hidden></th><th data-hidden data-card-target data-type="content-ref"></th><th data-hidden data-card-cover data-type="files"></th></tr></thead><tbody><tr><td><mark style="color:blue;">Explore eSignet’s features for secure, seamless, and versatile authentication.</mark></td><td></td><td></td><td><a href="broken-reference">Broken link</a></td><td><a href="../.gitbook/assets/features.png">features.png</a></td></tr><tr><td><mark style="color:blue;">Explore eSignet’s principles of privacy, security, and flexibility.</mark></td><td></td><td></td><td><a href="principles/">principles</a></td><td><a href="../.gitbook/assets/principles (1).png">principles (1).png</a></td></tr><tr><td><mark style="color:blue;">Explore eSignet’s standards and secure authentication flows.</mark></td><td></td><td></td><td><a href="Standards/">Standards</a></td><td><a href="../.gitbook/assets/Standards.png">Standards.png</a></td></tr></tbody></table>

### Documentation

Explore the following resources for more details on eSignet:

* [Technology Stack](broken-reference)
* [Components](broken-reference)
* [Try It Out](broken-reference)
* [Integrate with eSignet](broken-reference)



***

<!--

**Content Update**:

Added: 24 june
Reviewed: 24 June 25



**eSignet Auth** is a modular, standalone identity authentication service designed to enable secure and flexible user verification across digital ecosystems. Built on **open standards**, it implements **OAuth 2.0 and OpenID Connect** protocols, functioning as both an **authorization server** and a **resource server**.

### **1. Designed for Inclusivity** <a href="#id-1.-designed-for-inclusivity" id="id-1.-designed-for-inclusivity"></a>

eSignet Auth ensures that digital authentication is accessible and adaptable for all, regardless of device type or user capability.

* **Multiple Authentication Factors**\
  Supports a variety of methods including **OTP** (for feature phones), **biometrics** (iris, face, fingerprint), and **wallet-based face authentication** (for smartphone users). These modes ensure inclusive access across different user demographics and contexts.
* **Customizable Authentication Workflows**\
  Flexible by design, eSignet Auth can be tailored to meet country-specific, sector-specific, or application-specific requirements. New authentication methods can be easily added and existing flows modified without major system changes.

### **2. Standards-Based ID Authentication with High Assurance** <a href="#id-2.-standards-based-id-authentication-with-high-assurance" id="id-2.-standards-based-id-authentication-with-high-assurance"></a>

eSignet Auth delivers secure identity verification through a **standards-compliant** and **assurance-driven** approach.

* **OAuth 2.0 and OpenID Connect Based**\
  Uses established OAuth 2.0 flows and OpenID Connect for secure, token-based identity authentication, enabling seamless and reliable integration with existing systems.
* **Support for High Assurance Biometrics**\
  Enables robust identity authentication using **iris**, **face**, or **fingerprint** recognition. These high-assurance modalities are ideal for accessing sensitive services such as healthcare, financial services, and government platforms.

This combination of standards compliance and biometric authentication ensures strong, verifiable digital identities with configurable assurance levels.

### **3. How It Builds Trust** <a href="#id-3.-how-it-builds-trust" id="id-3.-how-it-builds-trust"></a>

Trust is foundational to eSignet Auth’s architecture, achieved through strong privacy controls, consent-driven design, and secure token handling.

* **Consented User Data Sharing**\
  Personal data is shared only after explicit, informed user consent. The consent flow is embedded into the authentication process and mandatory for data access.
* **No Data Storage**\
  eSignet Auth does **not store any personally identifiable information (PII)**. It acts solely as a verification and authentication layer, reducing exposure to privacy risks.
* **Prevention of Unwanted Profiling**\
  Issues **partner-specific user tokens** for each relying party, ensuring that user activity cannot be tracked or correlated across services—thus preserving privacy and stopping cross-service profiling.

### **4. Seamless Integration Across Ecosystems** <a href="#id-4.-seamless-integration-across-ecosystems" id="id-4.-seamless-integration-across-ecosystems"></a>

eSignet Auth is built for flexibility, allowing it to plug into various components across digital identity and service delivery ecosystems.

* **Compatible with Any ID System**\
  Integrates easily with any centralized or federated identity system. Its standards-based framework allows it to work with a wide variety of ID registries and data structures.
* **Connects with Any Relying Party (Service Portal)**\
  Service providers—such as banks, government departments, healthcare portals, and telecom services—can authenticate users through eSignet Auth with minimal integration effort. The use of standard APIs and protocols enables quick and secure onboarding.

This ecosystem-agnostic design ensures that eSignet Auth can serve as a unifying layer for identity authentication across sectors.

### **5. Summary** <a href="#id-5.-summary" id="id-5.-summary"></a>

**eSignet Auth** is a powerful, secure, and inclusive authentication module that can be deployed as part of a digital ID system or independently.

It offers:

* Inclusive access through multiple, customizable authentication methods
* Secure and standards-compliant identity verification using OAuth 2.0 and OpenID Connect
* High-assurance options via biometric authentication (iris, face, fingerprint)
* Consent-driven data handling with no storage of user PII
* Prevention of user profiling across services
* Easy integration with any identity system or service provider
* Open-source and vendor-neutral, ensuring no lock-in and full transparency

Whether used by governments, enterprises, or technology providers, **eSignet Auth** delivers a trusted, flexible, and future-ready solution for digital identity authentication.

Please take a moment to watch the video below to explore valuable insights into eSignet and its wide array of powerful features!



\[Add link to the video]

\[Documentation Link]






-->
