---
description: A Modern and Inclusive Digital Identity Authentication Solution
icon: globe
---

# eSignet

## Overview

Digital identity is rapidly becoming the standard for citizen identificatio, Whether accessing services on government platforms or private service portals, user authentication is now a critical requirement. To ensure secure, private, and inclusive access, authentication mechanisms must adhere to established standards that guarantee data protection and build user trust.

### Where does eSignet fits in?

**eSignet** plays a critical role by providing a secure, standards-compliant digital identity solution that empowers both users and service providers. It enables:

* **Trusted identity verification** across platforms.
* **Flexible login and authentication methods** tailored to various assurance levels.
* **Inclusive access** designed to serve diverse user groups and device capabilities.
* **Consent-driven data and profile sharing**, ensuring transparency and user control.

eSignet ensures that digital interactions are not only seamless but also secure, private, and user-centric. Built on trusted protocols and designed with a privacy-first approach, eSignet empowers both users and service providers with confidence and control.

**eSignet comprises of 2 specific modules/parts**:

1. [eSignet Auth](esignet-authentication/README.md)
2. [Signup](esignet-signup/README.md)

#### What is eSignet Authentication?

**eSignet** authentication is a powerful, open-source digital identity authentication module that enables secure and standardized access to online services. It is developed by **MOSIP** and built by implementing specific OpenID Connect (OIDC) RFCs to provide high assurance. It is designed to be **independent and be used as a standalone authentication module** and can be easily integrated with **any identity system or repository** that supports authentication and attribute retrieval. While it includes reference integrations with MOSIP, its architecture is flexible and open enough to be adopted for a wide range of digital services ecosystems.

Whether you're building a citizen portal, a financial application, or any service that requires identity verification, **eSignet can serve as your trusted, modular identity layer**.

#### What is Signup?

The Signup Module is a self-contained, independent component that enables individuals to create and manage their digital identity profiles designed for seamless integration with eSignet auth module.

Beyond profile creation, the module also offers support for **identity verification capabilities**, including support for **eKYC Verification**, ensuring that user identities can be reliably validated during signup. With a focus on inclusivity, low-barrier entry, and progressive trust building, it can be used to extend digital identity to under-served or unregistered populations.

### **Key Features of eSignet**

* **Login with Trusted ID** Enables users to authenticate using a secure identity issued by a government authority or a trusted provider.
* **Inclusive Support for Multiple Authentication Factors** Accommodates a variety of authentication methods including biometrics, one-time passwords (OTP), and wallet-based authentication.
* **Frictionless Addition of New Authentication Factors** Architected to seamlessly integrate emerging authentication technologies without requiring major system modifications.
* **Integration with Multiple Registries** Provides the capability to connect with various identity registries to facilitate comprehensive user verification.
* **Simple Integration with Relying Parties (Service Providers)** Streamlines the onboarding process for service providers requiring robust identity verification.
* **User Consent Management** Incorporates a built-in mechanism to obtain explicit user consent for data access and usage.
* **Protection Against Unwanted Profiling** Safeguards personal data by preventing unauthorized tracking or profiling of users.
* **Multiple Assurance Levels** Supports varying levels of identity assurance, depending on the authentication method employed.
* **Digital Wallet Integration** Enables secure, device-based authentication through integration with digital wallets.
* **KYC-Verified Signup** Support for user's identity verification through video-eKYC during registration by leveraging its Signup module.

### **What Differentiates eSignet**

#### 1. **Enhancing Authentication Methods Through Secure Standards**

* **Standards-Based Architecture** Utilizes OpenID Connect flows built on the OAuth 2.0 framework, allowing seamless integration via widely supported libraries.
* **Scalable for Country-Wide Implementation** Designed to deliver secure authentication and KYC verification at national scale, ensuring high reliability and performance.
* **Secure Biometric Integration** Incorporates the Secure Biometric Interface (SBI) to enable secure biometric data collection for identity verification.
* **Advanced Security Features** Supports secure OpenID Connect options such as the authorization code flow and includes enhanced fraud prevention measures.

#### 2. **User-Centric Design**

* **Single Identity Credential** Enables users to access integrated public and private sector services using a unified digital identity.
* **Mandatory Consent Enforcement** Ensures that all data access is governed by an explicit, user-centric consent flow.
* **Support for Diverse Authentication Methods** Accommodates various verification approaches to meet individual preferences and improve usability and liveness detection.
* **Credential Security** Ensures that user authentication is handled exclusively on the eSignet platform, preventing unauthorized data sharing with third parties unless consented by the user.

#### 3. **Accelerated Digital Transformation**

* **Fast and Secure Digital Verification** Facilitates rapid user verification across multiple digital services.
* **Assurance Parity with Registration** Maintains consistent verification quality using the same methods employed during initial user onboarding (OTP, biometrics, cryptographic keys).
* **Government Enablement for e-KYC Services** Empowers governments to offer digital identity verification and e-KYC services, fostering broader access to financial and digital services.
* **Effortless Integration for Service Providers** Adheres to open standards, significantly reducing time-to-market for deploying identity services.
* **Bridging the Digital Divide** Offers flexible verification modes to cater to users across the digital access spectrum.

### **Inclusivity at Its Core**

eSignet is engineered to ensure inclusive access to digital identity verification, supporting multiple verification models and modalities to meet the varied needs of users and the devices they use.

#### **Verification Models**

* **Assisted Verification and Data Collection** Enables identity verification with the assistance of an operator or at a physical kiosk.
* **Self-Identification for Online Services** Allows users to independently verify their identity through remote digital channels.

#### **Verification Modalities**

* **OTP-Based Authentication (Feature Phone Users)** Offers SMS-based OTP login for users with basic mobile devices.
* **Wallet-Based Facial Authentication (Smartphone Users)** Enables face recognition authentication via digital wallets on smartphones.
* **Biometric Authentication (Non-Phone Users)** Supports biometric verification for users without mobile access, via assisted modes or kiosks.

### **Who is eSignet for?**

* **Government Agencies** Offers a secure, standards-based identity verification layer for transforming existing IDs into interoperable digital identities.
* **Service Providers** Enables efficient service delivery through secure identity verification, eKYC, and consent-based data access across sectors such as banking, telecommunications, and insurance.
* **Citizens and Residents** Empowers individuals to prove their identity securely and conveniently while preserving privacy across a broad range of digital services.
* **Developers and System Integrators** Provides a comprehensive set of tools and standards to enable seamless integration of digital ID authentication and eKYC functionalities.

### **Potential Use Cases**

* **Healthcare**: Patients use OTP or biometrics to access health portals securely, ensuring inclusive access to medical services.
* **Education**: Universities leverage face authentication for secure access to exams or hostel services, enhancing accessibility.
* **Social Welfare Programmes:** Enables precise distribution of benefits to verified and eligible recipients.
* **Taxation:** Facilitates simplified tax filing and accurate taxpayer identification.
* **Voting Systems:** Ensures secure and reliable voter authentication during elections.
* **Banking:** Supports secure customer onboarding and transaction verification.
* **Insurance:** Verified KYC data with high assurance levels enables faster, compliant onboarding, promoting financial inclusion.
* **Border Control:** Enhances national security by verifying the identity of travelers and supporting secure cross-border movement.

The use cases listed above are illustrative and not exhaustive, eSignet can be adapted to support a wide range of additional applications across both public and private sectors.

Refer below to know more about eSignet principles and standards:

[Explore eSignet’s principles of privacy, security, and flexibility](readme/principles.md).

[Explore eSignet’s standards and secure authentication flows](readme/standards.md).