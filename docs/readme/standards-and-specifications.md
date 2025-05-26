---
icon: nfc
---

# Standards and Specifications

> **Building on open standards isn’t just about technology—it’s about creating a seamless, secure, and globally trusted way for people to own, share, and verify their credentials effortlessly, no matter where they are.**

Inji is built on open standards to ensure **interoperability, security, and trust** in verifiable credentials. It adheres to globally recognized frameworks, making it **technically compliant with open standards**, allowing for **large-scale adoption across multiple countries**.

This document provides an overview of the **standards followed by Inji** and how they guide the development of features for **credential issuance, storage, sharing, and verification**.

### **1. Why Standards Matter?**

By adhering to open standards, Inji ensures that:

* **Credentials are portable and verifiable** across different ecosystems.
* **Trust frameworks are standardized**, enabling seamless interoperability.
* **Security and privacy** are maintained through globally accepted cryptographic methods.&#x20;
* It supports **adoption at scale**, allowing organizations, governments, and enterprises to integrate verifiable credentials efficiently.

### **2. Open Standards Followed**

Inji follows globally recognized specifications to support **trusted digital verifiable credential solutions**:

#### **A. Verifiable Credentials & Data Models**

**W3C Verifiable Credentials Data Model 1.1 & 2.0**:

* Inji supports the W3C Verifiable Credentials Data Model for issuing, presenting, and verifying digital credentials.
* Follows the W3C VC format, enabling interoperability across different identity ecosystems.
* Supports JSON-LD and CBOR formats for VCs.

<table><thead><tr><th>Open- Standard Name</th><th width="308.516357421875">Open-Doc Standard Link</th><th>Version</th><th>Module following?</th></tr></thead><tbody><tr><td>W3C Data Model 1.1</td><td><a href="https://www.w3.org/TR/vc-data-model/">https://www.w3.org/TR/vc-data-model/</a></td><td>v1.1</td><td>Inji Certify</td></tr><tr><td>W3C Data Model 2.0</td><td><a href="https://www.w3.org/TR/vc-data-model-2.0/">https://www.w3.org/TR/vc-data-model-2.0/</a></td><td>v2.0</td><td>Inji Certify</td></tr></tbody></table>

**ISO/IEC 18013-5** – International standard for mobile driving licenses (mDL).

#### **B. Credential Issuance & Presentation**

* **OpenID4VCI** – Standardized process for issuing verifiable credentials.
* **OpenID4VP & OpenID4VP\_BLE** – Enables verifiable presentations via OpenID protocols, including **offline sharing using BLE**.

#### **C. Secure Claims & Cryptographic Standards**

* **Claim 169: IANA CBOR Web Token (CWT)** – Compact, privacy-preserving claims format for credentials.
* **Elliptic Curve Cryptography (ECC), RSA, and EdDSA** – Ensures **strong cryptographic protection** for credential signing.

### **3. Standards Followed in Inji**

**A. W3C Verifiable Credentials (VC)**

* Inji supports the W3C Verifiable Credentials Data Model for issuing, presenting, and verifying digital credentials.
* Follows the W3C VC format, enabling interoperability across different identity ecosystems.
* Supports JSON-LD, JWT, and CBOR formats for VCs.

**B. OpenID for Verifiable Presentations (OpenID4VP)**

* Enables selective disclosure of credentials while maintaining user privacy.
* Supports QR code-based and deep-linking mechanisms for credential presentation.
* Ensures verifier authentication to prevent unauthorized access.

**C. OpenID for Verifiable Credential Issuance (OpenID4VCI)**

* Facilitates the secure issuance of VCs to holders.
* Supports various credential formats, including SD-JWT and mDoc/mDL.
* Implements OAuth 2.0-based authorization for credential issuance.

**D. ISO/IEC 18013-5 (Mobile Driving Licenses - mDL)**

* Enables interoperability with government-issued mobile driver’s licenses (mDL).
* Supports NFC and QR-based interactions for secure credential exchange.

**E. Decentralized Identifiers (DIDs) & DIDComm**

* Uses W3C DID standards for self-sovereign identity.
* Implements DIDComm for secure peer-to-peer communication between holders, verifiers, and issuers.
