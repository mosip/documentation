# What is eSignet?

eSignet is a powerful, open-source digital identity authentication platform that enables secure and standardized access to online services. It is developed by [MOSIP](https://www.mosip.io/) and built by implementing specific [OpenID Connect (OIDC)](https://openid.net/developers/how-connect-works/) RFCs, giving it the foundation to provide high-assurance identity verification, and it functions as both an authorization server and a resource server within the systems it is deployed into.

eSignet is designed to function independently as a standalone authentication module, and it can be integrated with any identity system or repository that supports authentication and attribute retrieval. While it includes reference integrations with MOSIP, its architecture is open and flexible enough to be adopted across a wide range of digital service ecosystems, not just MOSIP-based ones. eSignet is also fully open-source and vendor-neutral, so adopting it does not lock an organization into a single vendor's roadmap or pricing — its code, standards compliance, and integration paths are all transparent and available for inspection.

Whether the use case is a citizen portal, a financial application, or any service that requires identity verification, eSignet can serve as a trusted, modular identity layer. At a glance, it supports login through OTP, biometrics, and wallet-based methods; enforces configurable, user-driven consent; supports multiple levels of identity assurance; and complies with security standards including [OpenID Connect](https://openid.net/developers/how-connect-works/), [OAuth 2.0](https://oauth.net/2/), and the [FAPI 2.0 Security Profile](standards.md#id-3.-supported-rfcs) — the full breakdown of these capabilities is covered in [Features](features.md).

### How eSignet Builds Trust

Trust is foundational to eSignet's architecture, and it is achieved through strong privacy controls, consent-driven design, and secure token handling rather than through policy alone.

* **Consented user data sharing**: personal data is shared only after explicit, informed user consent. The consent flow is embedded directly into the authentication process and is mandatory before any data access takes place.
* **No storage of personal data**: eSignet does not store any personally identifiable information (PII). It acts solely as a verification and authentication layer, which reduces the platform's exposure to privacy risk since there is no central store of user data for an attacker to target.
* **Prevention of unwanted profiling**: eSignet issues relying-party-specific user tokens for each relying party it serves, which means a user's activity with one service cannot be tracked or correlated with their activity on another. This preserves user privacy and actively prevents cross-service profiling, rather than merely discouraging it through policy.

### Seamless Integration Across Ecosystems

eSignet is built for flexibility, allowing it to plug into a wide range of components across digital identity and service delivery ecosystems.

* **Compatible with any ID system**: eSignet integrates with any centralized or federated identity system. Its standards-based framework allows it to work with a wide variety of ID registries and underlying data structures, rather than requiring a specific one.
* **Connects with any relying party (service portal)**: service providers such as banks, government departments, healthcare portals, and telecom operators can authenticate users through eSignet with [minimal integration](../develop/integration/relying-party/) effort. Its use of standard APIs and protocols enables quick and secure onboarding rather than a custom integration for every new service provider.

This ecosystem-agnostic design allows eSignet to serve as a unifying identity authentication layer across sectors, rather than a solution tied to one industry or one type of identity system.

### Inclusive by Design

eSignet is engineered to ensure inclusive access to digital identity verification, supporting multiple verification models to meet the varied needs of users and the devices they use. Digital authentication is only as inclusive as the range of methods it supports, so eSignet is built to remain accessible and adaptable for all users, regardless of device type or individual capability.

* **Assisted verification and data collection**: identity verification carried out with the help of an operator, or at a physical kiosk, for users who are unable or prefer not to self-verify online.
* **Self-identification for online services**: identity verification that users complete independently through remote digital channels, without needing an operator or a physical location.

The specific authentication factors available under each of these models — OTP, biometrics, wallet-based login, and more — are covered in [Features](features.md).

Please take a moment to watch the video below to explore valuable insights into eSignet and its wide array of powerful features!

{% embed url="https://www.youtube.com/watch?v=ZfUPRv71s_0" %}

### **Who is esignet for?**

* **Government agencies**: eSignet offers a secure, standards-based identity verification layer that helps transform existing identity systems into interoperable digital identities, without requiring those agencies to build an authentication layer from scratch.
* **Service providers**: eSignet enables efficient service delivery through secure identity verification, eKYC, and consent-based data access across sectors such as banking, telecommunications, and insurance, so providers can verify users without operating their own identity infrastructure.
* **Citizens and residents**: eSignet empowers individuals to prove their identity securely and conveniently, while preserving their privacy, across a broad range of digital services — from a single trusted identity rather than a separate credential per service.
* **Developers and system integrators**: eSignet provides a comprehensive set of tools and standards that enable seamless integration of digital ID authentication and eKYC functionality into new and existing services.

Whether it's deployed by a government, an enterprise, or a technology provider building on top of it, eSignet is designed to deliver a trusted, flexible, and future-ready foundation for digital identity authentication.

### **Potential use cases**

* **Healthcare**: Patients use OTP or biometrics to access health portals securely, ensuring inclusive access to medical services regardless of the device they have available.
* **Education**: Universities leverage face authentication for secure access to exams or hostel services, improving both security and accessibility for students.
* **Social welfare programmes**: eSignet enables precise distribution of benefits to verified and eligible recipients, reducing the risk of benefits reaching the wrong person.
* **Taxation**: eSignet facilitates simplified tax filing and accurate taxpayer identification, reducing friction for taxpayers while maintaining verification integrity.
* **Voting systems**: eSignet ensures secure and reliable voter authentication during elections, helping protect the integrity of the voting process.
* **Banking**: eSignet supports secure customer onboarding and transaction verification, giving banks a standards-based way to confirm who they're transacting with.
* **Insurance**: Verified KYC data with high assurance levels enables faster, compliant onboarding, promoting financial inclusion for customers who might otherwise face lengthy manual verification.
* **Border control**: eSignet enhances national security by verifying the identity of travelers and supporting secure cross-border movement.

{% hint style="info" %}
**Note:** The use cases listed above are illustrative and not exhaustive. eSignet can be adapted to support a wide range of additional applications across both public and private sectors.
{% endhint %}
