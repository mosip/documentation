---
description: Empowering secure and seamless digital identity verification.
---

# 🌐 eSignet

Digital identity is rapidly becoming the standard for citizen identificatio&#x6E;**.** Whether accessing services on government platforms or private service portals, user authentication is now a critical requirement. To ensure secure, private, and inclusive access, authentication mechanisms must adhere to established standards that guarantee data protection and build user trust.

### Where does eSignet fit in? <a href="#where-does-esignet-comes-in" id="where-does-esignet-comes-in"></a>

In this context, **eSignet** plays a critical role by providing a secure, standards-compliant digital identity solution that empowers both users and service providers. It enables:

* **Trusted identity verification** across platforms.
* **Flexible login and authentication methods** tailored to various assurance levels.
* **Inclusive access** designed to serve diverse user groups and device capabilities.
* **Consent-driven data and profile sharing**, ensuring transparency and user control.

eSignet ensures that digital interactions are not only seamless but also secure, private, and user-centric. Built on trusted protocols and designed with a privacy-first approach, eSignet empowers both users and service providers with confidence and control.

eSignet comprises of 2 specific modules/parts:

1. [eSignet Auth](./#what-is-esignet-auth)
2. [Signup](./#what-is-signup)

#### What is eSignet Auth? <a href="#what-is-esignet-auth" id="what-is-esignet-auth"></a>

**eSignet** is a powerful, open-source digital identity authentication module that enables secure and standardized access to online services. It is developed by **MOSIP** and built by implementing specific OpenID Connect (OIDC) RFCs to provide high assurance.\
It is designed to be **independent and be used as a standalone authentication module** and can be easily integrated with **any identity system or repository** that supports authentication and attribute retrieval. While it includes reference integrations with MOSIP, its architecture is flexible and open enough to be adopted for a wide range of digital services ecosystems.

Whether you're building a citizen portal, a financial application, or any service that requires identity verification, **eSignet can serve as your trusted, modular identity layer**.

#### What is Signup? <a href="#what-is-signup" id="what-is-signup"></a>

The Signup Module is a self-contained, independent component that enables individuals to create and manage their digital identity profiles designed for seamless integration with eSignet auth module.

Beyond profile creation, the module also offers support for **identity verification capabilities**, including support for **eKYC Verification**, ensuring that user identities can be reliably validated during signup. With a focus on inclusivity, low-barrier entry, and progressive trust building, it can be used to extend digital identity to underserved or unregistered populations.

### Who Can Use eSignet? <a href="#who-can-use-esignet-.1" id="who-can-use-esignet-.1"></a>

**eSignet modules are for any organization**, public or private, that needs secure and standards based identity authentication.

* Government services providers.
* Financial institutions.
* Healthcare platforms.
* Educational portals.
* Enterprises seeking secure access systems.

> If your system provides identity data and authentication APIs, you can integrate with eSignet - **no dependence on MOSIP required**.

**eSignet** isn’t just another login module it is a **future-ready authentication and identity gateway**, built to meet the evolving needs of digital public infrastructure and beyond.

## Key Capabilities and Value Propositions of eSignet <a href="#key-capabilities-and-value-propositions-of-esignet" id="key-capabilities-and-value-propositions-of-esignet"></a>

### **Seamless Integration** <a href="#seamless-integration" id="seamless-integration"></a>

eSignet provides a framework to **integrate existing identity systems**—such as national ID databases, passport systems, or driver's license repositories—for both authentication and eKYC (Know Your Customer) use cases. It offers:

* Secure login flows
* Verified identity claim sharing
* Support for authentication via any trusted ID source

> eSignet works equally well with government ID platforms or any organization’s internal ID repository. Integration is **easy, standards-based, and extensible**.

### Signup & Profile Linking Support <a href="#signup-and-profile-linking-support" id="signup-and-profile-linking-support"></a>

eSignet’s **Signup Module is** an entry point for users to create and enhance their digital profile. This enables:

* Account creation for new users.
* Linking of existing identities with digital services.
* Smooth onboarding flows across services.
* ID proofing.

### Built on Trusted Open Standards <a href="#built-on-trusted-open-standards" id="built-on-trusted-open-standards"></a>

* Compliant with **OpenID Connect (OIDC)** protocol
* Implements specific OIDC RFCs suited for **high-assurance, national-level identity verification**
* Enables **Verifiable Credentials (VCs)** and **OIDC Assurance Extensions** for trusted identity claim sharing

### Privacy, Consent, and Inclusive Access <a href="#privacy-consent-and-inclusive-access" id="privacy-consent-and-inclusive-access"></a>

**eSignet** upholds key principles to enable secure, user-focused digital identity experiences:

* **User-Centric Privacy:** Ensures data privacy through explicit, consent-based information sharing at every interaction point.
* **Inclusive Access:** Accommodates diverse user needs by supporting multiple authentication methods, languages, and identity types across devices and connectivity levels.

### 🔗 What Can eSignet Be Used For? <a href="#what-can-esignet-be-used-for" id="what-can-esignet-be-used-for"></a>

<table data-header-hidden><thead><tr><th width="229.7386474609375"></th><th></th></tr></thead><tbody><tr><td>Use Case</td><td>Description</td></tr><tr><td><strong>Seamless Login</strong></td><td>Use eSignet as a login provider for any relying party application. No need for users to maintain separate credentials.</td></tr><tr><td><strong>Identity Verification</strong></td><td>Authenticate users securely against trusted identity providers (national ID, passport system, etc.). Leverage biometrics for added assurance.</td></tr><tr><td><strong>Consented Data Sharing</strong></td><td>With user consent, share verified attributes needed for profile creation or to meet eKYC requirements.</td></tr><tr><td><strong>Profile Creation</strong></td><td>Leverage signup module to perform eKYC and register new users.</td></tr></tbody></table>



<!--

Old

In today’s digital-first world, most services are transitioning online, making a secure and trusted digital identity more important than ever. A secure and trusted digital identity is crucial to facilitate personalized access to these online services.&#x20;

**eSignet** strives to provide a user-friendly and effective method for individuals to authenticate themselves and utilize online services while also having the option to share their profile information. Moreover, eSignet supports multiple modes of identity verification to ensure inclusivity and broaden access, thereby reducing potential digital barriers.

Additionally, eSignet offers a seamless and straightforward solution for incorporating an existing trusted identity database into the digital realm. By enabling digital identities and providing identity verification and service access, eSignet delivers a sophisticated and user-friendly experience.

#### **Addressing Privacy & Inclusivity**🔒

While existing verification methods offer security, they often lack inclusivity and do not fully address privacy concerns. At eSignet, we are continuously exploring ways to **bridge the digital divide** while prioritizing **user privacy and control** over personal data.

👉 Learn more about[ **identity verification**](https://docs.esignet.io/glossary#identity-verification) methods.\
👉 Explore[ **Inji** ](https://docs.inji.io/)to understand modern verification techniques using verifiable credentials for decentralized authentication.

The images below depict the eSignet user login process, showcasing different authentication methods:

<div data-full-width="true"><img src="_images/e-signet-qr.jpg" alt="Login using QR code"> <img src="_images/e-signet-bio.jpg" alt="Login using fingerprint"></div>

#### **What can eSignet be used for?**

✅ **Seamless Login:** eSignet is a reliable login provider for a relying party application that allows access to the service without additional login credentials.

✅ **Identity Verification:** eSignet also offers a secure method for verifying an individual's identity against trusted identity providers such as national identity databases, driver's license systems, passport systems, or other reputable sources. The level of assurance is determined by the authentication factor utilized, with biometric authentication providing an added layer of user presence confirmation.

✅ **Consented Data Sharing: e**Signet facilitates consented data sharing for profile creation or meeting **Electronic Know Your Customer (eKYC)** requirements for relying parties. When a relying party requests authentication, they can also request specific attributes needed for profile creation or compliance with eKYC norms.

User data is only shared with explicit consent during the authentication process.

#### **How is eSignet different from other services?**

eSignet re-imagines authentication services to factor in emerging trends and the need for assured digital identities. It brings critical capabilities to the authentication process.

**Key features include** ✨

✅ **Seamless integration** - Framework to seamlessly integrate existing identity stores for authentication and KYC (Know Your Customer) requirements.

✅ **Advanced biometric authentication** - for enhanced security.

✅ **Comprehensive support** - for wallet-based authentication.

#### Who Can Use eSignet?

eSignet is a contemporary and adaptable system for verifying digital identities. This solution is not involved with the issuance and management of IDs. It is designed to be compatible with any ID repository through a straightforward integration model.&#x20;

**Any ID repository that provides authentication and attribute retrieval capabilities can utilize eSignet with ease!** 🚀&#x20;


-->