---
description: Core principles that define eSignet
---

# Principles

eSignet is designed with the architectural principles mentioned below. These architecture principles are core to developing the system's features and greatly influence how and why specific software design patterns are used.

### Data Privacy 🛡️&#x20;

eSignet prioritizes user privacy by minimizing data exposure and ensuring secure interactions:

* **No ID Storage by Relying Parties:** Users enter their ID directly on the eSignet page, preventing relying parties from storing it. This reduces the risk of profiling in case of data breaches.
* **Privacy-Enabled Token (PSUT):** Instead of sharing user IDs, eSignet issues a unique **Partner Specific User Token (PSUT)** for each user-relying party pair.
* **Protection of Sensitive Data:** Sensitive information is never stored or logged in clear text.
* **User Controlled Consent:** Users have full control over what data is shared with relying parties.

### No Vendor Lock-in 🔄

eSignet is designed to be **vendor-neutral**, ensuring flexibility and interoperability:

* **Open Standards:** Any biometric device that complies with the **IEEE P3167 SBI 2.0** specification can integrate with eSignet.
* **No Dependence on Proprietary Solutions:** Organizations can choose their preferred biometric devices and infrastructure without being restricted to a single vendor.

### Commodity Computing 📦

eSignet is optimized for cost-efficiency and scalability:

* **Containerized Backend:** All eSignet backend services run as **Docker containers**, eliminating dependencies on specialized hardware or specific cloud providers.
* **Multi-Platform Support:** It can be deployed on any general-purpose **virtual machine (VM)** that supports Docker.
* **Avoids Vendor Lock-in:** Organizations are free to use their existing cloud or on-premise infrastructure.

### Secure By Default 🔐

Security is a core principle of eSignet, ensuring end-to-end protection:

* **Encryption at All Stages:** Data is encrypted **in transit and at rest** to prevent unauthorized access.
* **Trusted Integrations:** eSignet only integrates with verified and **trusted applications**.
* **Fraud Prevention:** Authentication is tied to specific transactions, reducing the risk of unauthorized access.
* **Digital Signatures:** Every incoming and outgoing request is digitally signed to ensure authenticity.
* **Encrypted Data Sharing:** All data shared with relying parties is encrypted for additional security.
* **Internal Threat Protection:** Database records are secured with **integrity checks** to detect tampering.
* **Centralized Key Management:** A robust key management system ensures secure cryptographic operations.
* **API Security:** All APIs are protected using **OAuth 2.0**, ensuring secure access control.
