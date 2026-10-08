---
description: Core principles that define eSignet.
---

# Principles

eSignet is designed around the architectural principles below. These principles are core to how the system's features are built, and they largely explain why specific software design patterns are used throughout eSignet rather than being an afterthought layered on top.

### Data Privacy

eSignet prioritizes user privacy by minimizing data exposure and ensuring secure interactions:

* **No storage of personal data, tracked by relying-party-specific tokens**: eSignet does not store any personally identifiable information (PII), sensitive data is processed transiently for authentication and is never retained. Instead of sharing a common user ID across services, eSignet issues a unique Partner Specific User Token (PSUT) for each user–relying party pair, which is also what prevents a user's activity from being tracked or correlated across services. See [How eSignet Builds Trust](what-is-esignet.md#how-esignet-builds-trust) for the full explanation.
* **Protection of sensitive data**: any sensitive information that does pass through eSignet is never stored or logged in clear text.
* **User-controlled consent**: users retain full control over what data is shared with relying parties, and that control is enforced rather than optional, see [User-Centric Design](principles.md#user-centric-design) below for how consent enforcement works.

### No Vendor Lock-in

eSignet is built to be vendor-neutral and open-source, promoting maximum flexibility, interoperability, and independence:

* **Open standards across the stack**: eSignet adheres to open standards across its entire architecture, not only in its authentication protocols, which lets it integrate with a wide range of identity systems and infrastructure components instead of being tied to a specific proprietary format. (The specific protocols its authentication flows are built on are covered under Enhancing Authentication Methods Through Secure Standards.
* **No dependence on proprietary solutions**: organizations are free to use their preferred biometric devices, software components, and infrastructure without being tied to a specific vendor or ecosystem.
* **An open-source foundation**: as an open-source product, eSignet provides full transparency and avoids proprietary lock-in, letting adopters customize, extend, and audit the solution to their own requirements, [refer here](what-is-esignet.md) for more on what this means in practice.

### Commodity Computing

eSignet is optimized for cost-efficiency and scalability:

* **Containerized backend**: all eSignet backend services run as Docker containers, which removes any dependency on specialized hardware or a specific cloud provider.
* **Multi-platform support**: eSignet can be deployed on any general-purpose virtual machine that supports Docker, rather than requiring a particular platform.

Together, these choices mean eSignet's infrastructure requirements don't lock an adopter into a specific cloud provider or hardware vendor, reinforcing the vendor independence described under No Vendor Lock-in, above.

### Secure By Design

Security is a core principle of eSignet, ensuring end-to-end protection rather than being addressed only at the perimeter:

* **Trusted integrations**: eSignet only integrates with verified and trusted applications, rather than accepting connections from any client that presents itself.
* **Fraud prevention**: authentication is tied to specific transactions rather than a generic session, which reduces the risk of unauthorized or replayed access  this complements the authorization-code-flow and protocol-level protections described under Enhancing Authentication Methods Through Secure Standards, below.
* **Centralized key management**: a robust key management system underpins eSignet's cryptographic operations, rather than leaving key handling to individual components.
* **API security**: all state-changing APIs, including data-modification and client-management endpoints, are protected with OAuth 2.0, enforcing authenticated and authorized access to every operation that changes data.

### Enhancing Authentication Methods Through Secure Standards

* **Standards-based architecture**: eSignet is built on [OpenID Connect flows layered on the OAuth 2.0 framework](standards.md), which allows it to integrate seamlessly with the wide ecosystem of libraries and tools that already support these widely adopted standards, instead of requiring a proprietary integration approach.
* **Scalable for country-wide implementation**: eSignet is designed to deliver secure authentication and KYC verification at national scale, with the reliability and performance that scale demands.
* **Secure biometric integration**: eSignet incorporates the [Secure Biometric Interface (SBI)](standards.md#id-1.-security) to enable secure, tamper-resistant biometric data collection for identity verification.
* **Advanced security features**: eSignet supports secure OpenID Connect options such as the authorization code flow, and includes enhanced fraud-prevention measures on top of the base protocol.

### User-Centric Design

* **A single identity credential**: eSignet lets users access integrated public- and private-sector services using one unified digital identity, rather than juggling separate credentials per service.
* **Consent enforcement**: User consent flow is enabled by default, and enforced wherever the use case calls for it; deployments where the country or governing policy has determined consent isn't required can turn it off explicitly.
* **Support for diverse authentication methods**: eSignet accommodates a range of verification approaches to meet individual user preferences, and this approach improves both general usability and liveness detection during verification.
* **Credential security**: User authentication is handled exclusively on the eSignet platform, which prevents unauthorized data sharing with third parties unless the user has explicitly consented to it.

### Accelerated Digital Transformation

* **Fast and secure digital verification**: eSignet facilitates rapid user verification across multiple digital services, rather than requiring a lengthy manual check per service.
* **Assurance parity with registration**: eSignet maintains consistent verification quality by using the same methods employed during a user's initial onboarding - OTP, biometrics, or cryptographic keys, so authentication doesn't fall below the assurance bar set at registration.
* **Government enablement for e-KYC services**: eSignet empowers governments to offer digital identity verification and e-KYC as a service, fostering broader access to financial and digital services for their citizens.
* **Effortless integration for service providers**: eSignet adheres to open standards, which significantly reduces the time it takes to deploy identity services compared to building or integrating a proprietary system.
* **Bridging the digital divide**: eSignet offers flexible verification modes to cater to users across the digital access spectrum, see [Inclusive by Design](what-is-esignet.md#inclusive-by-design) for how this works in practice.
