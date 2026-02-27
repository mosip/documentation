---
hidden: true
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
***



# README

Standards & Specifications:
OpenID for Verifiable Credential Issuance (OpenID4VCI) - Draft 13
🔗 Specification (Draft 13): https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0-13.html
OpenID for Verifiable Presentations (OpenID4VP) - Draft 23
🔗 Specification (Draft 23): https://openid.net/specs/openid-4-verifiable-presentations-1_0-23.html
Selective Disclosure for JWTs (SD-JWT)
🔗 IETF Internet-Draft: https://datatracker.ietf.org/doc/html/draft-ietf-oauth-selective-disclosure-jwt
ISO/IEC 18013-5:2021 – Mobile Driving Licence (mDL)
🔗 ISO 18013-5 Overview: https://www.iso.org/standard/69084.html
⚠️ Note: ISO documents are paid standards; only summaries are public.
W3C Verifiable Credentials Data Model v1.1
🔗 W3C Recommendation: https://www.w3.org/TR/vc-data-model-1.1/
W3C Verifiable Credentials Data Model v2.0
🔗 W3C Working Draft (latest): https://www.w3.org/TR/vc-data-model-2.0/
Bitstring Status List v2.0
🔗 W3C Specification: https://www.w3.org/TR/vc-bitstring-status-list/
🔗 Status List vocabulary: https://www.w3.org/ns/credentials/status/
Claim169 - QR Code based Verifiable Credentials
🔗 169 - QR Code Specifications: https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification




# INJI WEB


| Format                 | Signature Algorithm      | Web Wallet (Login) | Guest Mode (Without Login) | Notes                                               |
| ---------------------- | ------------------------ | ------------------ | -------------------------- | --------------------------------------------------- |
| W3C JSON-LD            | ED25519 2018             | Supported          | Supported                  | Compact, fast signatures with high security         |
| W3C JSON-LD            | ED25519 2020             | Supported          | Supported                  | Enhanced key format with better structure           |
| W3C JSON-LD            | RS256 (RSA with SHA-256) | Supported          | Supported                  | Backward compatibility; legacy systems              |
| W3C JSON-LD            | ECC K1                   | Supported          | Supported                  | Common in OpenID ecosystem                          |
| W3C JSON-LD            | ECC R1                   | Planned            | Planned                    | Strong elliptic curve variant                       |
| W3C Data Integrity 2.0 | RS256                    | Planned            | Planned                    | JWS with canonicalized digest                       |
| W3C Data Integrity 2.0 | EdDSA (Ed25519)          | Planned            | Planned                    | Based on JWS EdDSA                                  |
| W3C Data Integrity 2.0 | ES256K                   | Planned            | Planned                    | JWS-based signing with secp256k1                    |
| W3C Data Integrity 2.0 | ES256                    | Planned            | Planned                    | Strong elliptic curve variant                       |
| JWT VC                 | RS256                    | Planned            | Planned                    | Planned under VC-JWT compliance                     |
| JWT VC                 | ES256K                   | Planned            | Planned                    | Awaiting certification                              |
| JWT VC                 | ES256                    | Planned            | Planned                    | Under consideration                                 |
| JWT VC                 | x509 (PKI v3)            | Planned            | Planned                    | Public key in JWT header; x509 cert chain planned   |
| SD-JWT VC              | RS256                    | Supported          | Supported                  | SD-JWT verification being integrated                |
| SD-JWT VC              | ES256K                   | Supported          | Supported                  | Selective Disclosure compatible                     |
| SD-JWT VC              | ES256                    | Planned            | Supported                  | Strong elliptic curve variant                       |
| SD-JWT VC              | EdDSA (Ed25519)          | Supported          | Supported                  | Not yet supported in Certify (issuer side)          |
| SD-JWT VC              | x509 (PKI v3)            | In Progress        | In Progress                | Used for advanced SD-JWT scenarios                  |
| mDoc / mDL             | RS256                    | Planned            | Planned                    | Used in mobile document ecosystems                  |
| mDoc / mDL             | EdDSA(Ed25519)           | Planned            | Planned                    | Widely used in mobile identity contexts             |
| mDoc / mDL             | ES256K                   | Planned            | Planned                    | Used in various driver license implementations      |
| mDoc / mDL             | ES256                    | Planned            | Planned                    | Emerging support for high-security mobile documents |
| mDoc / mDL             | x509 (PKI v3)            | Planned            | Planned                    | x509 certificate chain                              |




