---
icon: nfc
---

# Inji Standards and Specifications (v2) - Logical Structure

> **Single Source of Truth**: A comprehensive, non-repetitive reference of all standards, specifications, and cryptographic protocols used across the Inji verifiable credentialing stack—organized by standard definition, then by module implementation.

Inji is built on **open standards** to ensure **interoperability, security, and trust** in verifiable credentials. This document consolidates all standards across Inji modules—**Certify** (issuer), **Wallet Mobile & Web** (holder), and **Verify** (verifier)—with clear separation between standard definitions and module-specific implementations.

---

## Table of Contents

1. [Overview](#overview)
2. [Quick Reference Matrix](#quick-reference-matrix)
3. [Standards Detail Library](#standards-detail-library)
4. [Inji Certify - Standards Implementation](#inji-certify---standards-implementation)
5. [Inji Wallet Mobile - Standards Implementation](#inji-wallet-mobile---standards-implementation)
6. [Inji Wallet Web - Standards Implementation](#inji-wallet-web---standards-implementation)
7. [Inji Verify - Standards Implementation](#inji-verify---standards-implementation)
8. [Cross-Module Features Matrix](#cross-module-features-matrix)
9. [Standards Roadmap & Timeline](#standards-roadmap--timeline)
10. [References](#references)

---

## Overview

### Why Standards Matter

By adhering to open standards, Inji ensures:

- **Portable Credentials**: Credentials issued by Inji can be verified by ANY W3C-compliant verifier
- **Ecosystem Interoperability**: Works with Microsoft Entra, Hyperledger Aries, Trinsic, and custom implementations
- **Trusted Security**: Standards define cryptographic best practices, not proprietary magic
- **Vendor Independence**: No lock-in; standards-based = future-proof
- **Large-Scale Adoption**: Governments, enterprises, and NGOs can integrate with confidence

### Standards Bodies & Organizations

| Organization | Role | Standards Contributed |
|--------------|------|----------------------|
| **W3C** (World Wide Web Consortium) | Global web standards body | Verifiable Credentials, DIDs, Data Integrity, Bitstring Status List |
| **OpenID Foundation** | Authentication & federation standards | OpenID4VCI, OpenID4VP (credential issuance & presentation) |
| **IETF** (RFC authors) | Internet engineering standards | SD-JWT, OAuth 2.0, CWT, CBOR, JWT |
| **ISO** (International Standards Organization) | Hardware & document standards | ISO 18013-5/7 (mDL/mDoc for mobile documents) |
| **MOSIP** (MOSIP Project) | MOSIP-specific standards | Claim 169 (QR-encoded credentials), Identity standards |

---

## Quick Reference Matrix

At a glance: which standards are used by which modules?

| Standard | Version | Certify | Mobile | Web | Verify | Primary RFC/Link |
|----------|---------|---------|--------|-----|--------|------------------|
| **W3C VC Data Model** | 1.1 | ✅ | ✅ | ✅ | ✅ | https://www.w3.org/TR/vc-data-model/ |
| **W3C VC Data Model** | 2.0 | ✅ | ✅ | 🔲 | ✅ | https://www.w3.org/TR/vc-data-model-2.0/ |
| **OAuth 2.0** | RFC 6749 | ✅ | ✅ | ✅ | - | https://tools.ietf.org/html/rfc6749 |
| **OpenID Connect** | 1.0 | ✅ (via eSignet) | ✅ | ✅ | - | https://openid.net/connect/ |
| **OpenID4VCI** | Draft 13 | ✅ Issuer | ✅ Client | ✅ Client | - | https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0-13.html |
| **OpenID4VP** | Draft 23 | - | ✅ Client | ✅ Client | ✅ Server | https://openid.net/specs/openid-4-verifiable-presentations-1_0-23.html |
| **OpenID4VP-BLE** | Draft 23 Ext | - | ✅ (Offline) | - | 🔲 Server | https://github.com/openid/OpenID4VP |
| **W3C DIDs** | 1.0 | ✅ | ✅ | ✅ | ✅ | https://www.w3.org/TR/did-core/ |
| **JSON-LD** | 1.1 | ✅ | ✅ | ✅ | ✅ | https://www.w3.org/TR/json-ld11/ |
| **SD-JWT** | IETF Draft | ✅ | ✅ | ✅ | ✅ | https://datatracker.ietf.org/doc/html/draft-ietf-oauth-selective-disclosure-jwt |
| **W3C Bitstring Status List** | 2.0 | ✅ | ✅ | ✅ | ✅ | https://www.w3.org/TR/vc-bitstring-status-list/ |
| **CBOR** | RFC 7049 | ✅ | ✅ | - | ✅ | https://tools.ietf.org/html/rfc7049 |
| **CWT/COSE** | RFC 8152/9052 | 🔲 | ✅ | - | ✅ | https://tools.ietf.org/html/rfc8152 |
| **Claim 169** | MOSIP v1.2.0 | 🔲 v0.14 | ✅ | - | ✅ | https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification |
| **ISO 18013-5** | mDL | 🔲 | ✅ | 🔲 | 🔲 | https://www.iso.org/standard/69084.html |
| **ISO 18013-7** | mDoc | 🔲 | 🔲 Dev | 🔲 | 🔲 Dev | https://www.iso.org/standard/80601.html |
| **W3C Data Integrity 2.0** | WD | 🔲 | - | 🔲 | - | https://www.w3.org/TR/vc-data-integrity/ |
| **JWT** | RFC 7519 | ✅ | ✅ | ✅ | ✅ | https://tools.ietf.org/html/rfc7519 |

**Legend**: ✅ Available | 🔲 Planned/Coming Soon | - Not Applicable | Dev In Development

---

## Standards Detail Library

Each standard is defined ONCE here. Module-specific implementations are documented in Section 4-7.

### W3C Verifiable Credentials Data Model

**Official Specification**:
- **v1.1** (Recommendation, 2019): https://www.w3.org/TR/vc-data-model/
- **v2.0** (Working Draft, latest): https://www.w3.org/TR/vc-data-model-2.0/

**Overview**: Industry-standard specification for expressing credentials as JSON-LD documents with W3C-compliant proof mechanisms. Defines the structure, semantics, and verification requirements for all digital credentials.

**Why It Matters**: 
- Universal credential format recognized across 30+ countries
- Semantic interoperability via JSON-LD context
- Foundation for all Inji credential types
- Backwards compatible: v1.1 → v2.0 migration path

**Supported By**:

| Module | Status | Role |
|--------|--------|------|
| Certify | Available (both v1.1 & v2.0) | Issue credentials in W3C format |
| Mobile | Available (v1.1 & v2.0) | Store, display, and present credentials |
| Web | Available (v1.1, v2.0 planned v0.16.0) | Download and present in browser |
| Verify | Available (both v1.1 & v2.0) | Verify credential proofs and signatures |

**Key Aspects Across Implementation**:
- Supports multiple proof types: JSON-LD proofs, JWT, Data Integrity proofs
- Credential structure: issuer, subject, claims, issued date, expiration
- Holder binding: Proof of possession via cryptographic signatures
- Selective disclosure: Latest v2.0 includes selective claim presentation

---

### OAuth 2.0 & OpenID Connect

**Official Specifications**:
- **OAuth 2.0** (RFC 6749): https://tools.ietf.org/html/rfc6749
- **OpenID Connect 1.0** (OpenID Foundation): https://openid.net/connect/

**Overview**: OAuth 2.0 is the industry-standard authorization framework. OpenID Connect (OIDC) adds an authentication layer on top, enabling secure user login and identity delegation.

**Why It Matters**:
- Enables federation: users login via eSignet, Google, Keycloak, etc.
- Credential issuance tokens (access tokens) validated via OAuth
- Authorization code flow for secure credential flows
- Industry standard for 15+ years

**Supported By**:

| Module | Status | Role |
|--------|--------|------|
| Certify | Available | Authorization for credential issuance; OIDC login via eSignet |
| Mobile | Available | Authorization to download credentials from issuers |
| Web | Available | OAuth login (Google, OpenID providers); authorization for credential download |
| Verify | - | Not directly used (verification is post-issuance) |

---

### OpenID for Verifiable Credential Issuance (OpenID4VCI)

**Official Specification**: 
- **Draft 13** (Latest stable): https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0-13.html

**Overview**: OpenID Foundation standard for securely delivering verifiable credentials to wallet holders. Extends OAuth 2.0 with credential-specific flows.

**Why It Matters**:
- Standardized credential distribution protocol (not proprietary)
- Multiple issuance flows: pre-authorized (fast), authorization code (secure)
- Supports multiple credential formats: JSON-LD, JWT, SD-JWT, mDoc
- Enable interoperability: any OpenID4VCI issuer can issue to any OpenID4VCI-compliant wallet

**Supported By**:

| Module | Status | Role |
|--------|--------|------|
| Certify | Available (v0.8.0+) | Issue credentials to holders via standardized protocol |
| Mobile | Available (v0.8.0+) | Download credentials from OpenID4VCI-compliant issuers |
| Web | Available (v0.8.0+) | Download credentials in browser without app |
| Verify | - | Not applicable (verifier receives credentials, not issues) |

---

### OpenID for Verifiable Presentations (OpenID4VP)

**Official Specification**:
- **Draft 23** (Latest stable): https://openid.net/specs/openid-4-verifiable-presentations-1_0-23.html

**Overview**: OpenID Foundation standard for requesting and receiving verifiable presentations. Enables verifiers to request credentials from holders in a standardized way.

**Why It Matters**:
- Standardized presentation protocol (holders and verifiers can interoperate)
- Multiple presentation modes: cross-device (QR), same-device (app-to-app), BLE (offline)
- Selective disclosure: verifier specifies which claims are needed; holder discloses only those
- Replaces proprietary presentation workflows

**Supported By**:

| Module | Status | Role |
|--------|--------|------|
| Certify | - | Not applicable |
| Mobile | Available (v0.9.0+) | Present credentials to verifiers via QR, same-device, or BLE |
| Web | Available (v0.15.0+) | Present credentials from browser to verifier web portals |
| Verify | Available (v0.17.0+) | Request and verify presentations from holders |

---

### OpenID4VP-BLE (Offline Presentation)

**Specification**:
- **Extension to OpenID4VP Draft 23**: https://github.com/openid/OpenID4VP (offline extensions)

**Overview**: Extension to OpenID4VP enabling offline credential presentation via Bluetooth Low Energy (BLE). Allows holders to present credentials without internet connectivity.

**Why It Matters**:
- Credentials work in low-connectivity scenarios (refugee camps, remote borders, field verification)
- BLE direct P2P communication: no server required
- Same cryptographic validation as online presentations
- Critical for humanitarian and border control use cases

**Supported By**:

| Module | Status | Role |
|--------|--------|------|
| Certify | - | Not applicable |
| Mobile | Available (v0.14.0+) | Present credentials via BLE when verifier unavailable |
| Web | - | Browser cannot use BLE (security model limitation) |
| Verify | Planned (v0.18.0) | Receive and validate offline BLE presentations |

---

### W3C Decentralized Identifiers (DIDs)

**Official Specification**:
- **W3C DID Core 1.0** (Recommendation, 2021): https://www.w3.org/TR/did-core/

**Overview**: W3C standard for creating self-sovereign, decentralized identifiers independent of any centralized directory. Format: `did:method:identifier` (e.g., `did:mosip:123456`).

**Why It Matters**:
- Issuer identity verification: verifiers can resolve issuer DIDs to public keys
- Self-sovereign identity: no government or company controls the identifier
- Decentralized: DID methods can use blockchains, DIRs, or proprietary registries
- Cryptographic verification: public keys are resolvable and verifiable

**Supported By**:

| Module | Status | Role |
|--------|--------|------|
| Certify | Available (v0.8.0+) | Issuers publish DIDs and sign credentials with DID keys |
| Mobile | Available (v0.9.0+) | Verify issuer DIDs; resolve issuer public keys for signature validation |
| Web | Available | Verify issuer DIDs; support for holder-bound DIDs |
| Verify | Available | Resolve issuer DIDs; validate signatures against DID-published keys |

**Supported DID Methods**:
- `did:mosip:` – MOSIP-based identifiers (primary for Inji in MOSIP deployments)
- `did:ion:` – Layer 2 DID method (Sidetree-based, interoperable)
- `did:key:` – Embedded key DIDs (for testing and simple cases)

---

### JSON-LD (Linked Data for JSON)

**Official Specification**:
- **JSON-LD 1.1** (W3C Recommendation, 2020): https://www.w3.org/TR/json-ld11/

**Overview**: Framework for representing linked data in JSON format using semantic contexts. Enables shared understanding of data semantics across different systems.

**Why It Matters**:
- Semantic interoperability: different systems understand the same data meaning
- URI-based vocabularies: claims like `name`, `birthDate` are URIs, not ambiguous strings
- Linked data: credentials can reference other credentials, forming knowledge graphs
- W3C VC Data Model 1.1 recommendation

**Supported By**:

| Module | Status | Role |
|--------|--------|------|
| Certify | Available | Credentials issued in JSON-LD format with semantic contexts |
| Mobile | Available | Store and display credentials with semantic understanding |
| Web | Available | Display credentials in human-readable format via JSON-LD context |
| Verify | Available | Verify credentials and validate semantic claims |

---

### Selective Disclosure JWT (SD-JWT)

**Official Specification**:
- **IETF Internet-Draft**: https://datatracker.ietf.org/doc/html/draft-ietf-oauth-selective-disclosure-jwt

**Overview**: Privacy-first JWT format where credential holder can selectively disclose claims to verifiers. Claims are salted and hashed; holder reveals only requested ones with proof.

**Why It Matters**:
- Privacy: holder doesn't share unnecessary claims (e.g., shares age verification without exposing birthdate)
- Cryptographic proof: verifier can validate disclosed claims without seeing undisclosed ones
- Compact: much smaller than full credential with filtered fields
- IETF standardization path (moving toward RFC status)

**Supported By**:

| Module | Status | Role |
|--------|--------|------|
| Certify | Available (v0.12.0+) | Issue SD-JWT credentials with selectively disclosable claims |
| Mobile | Available (v0.10.0+) | Store SD-JWT and present only disclosed claims on verifier request |
| Web | Available (v0.15.0+) | Present SD-JWT credentials with selective disclosure |
| Verify | Available (v0.17.0+) | Verify SD-JWT presentations and validate selective disclosure proofs |

---

### W3C Bitstring Status List 2.0

**Official Specification**:
- **W3C Specification**: https://www.w3.org/TR/vc-bitstring-status-list/

**Overview**: Efficient revocation mechanism for credentials. Issuer publishes a bitstring (array of bits) where each bit represents revocation status of one credential. Credentials reference their bit position.

**Why It Matters**:
- Scalable revocation: millions of credentials' status in one compact bitstring
- Privacy: doesn't reveal which credentials are revoked (just a bitstring)
- Efficient: holders check one bitstring vs querying issuer for each credential
- Universal: works with any credential format

**Supported By**:

| Module | Status | Role |
|--------|--------|------|
| Certify | Available (v0.10.0+) | Publish revocation bitstrings; encode status list endpoint in credentials |
| Mobile | Available (v0.10.0+) | Check bitstring status before presenting credentials |
| Web | Available (v0.15.0+) | Validate credential status via bitstring check |
| Verify | Available (v0.17.0+) | Verify credential status before accepting presentations |

---

### CBOR (Concise Binary Object Representation)

**Official Specification**:
- **RFC 7049**: https://tools.ietf.org/html/rfc7049

**Overview**: Binary data serialization format similar to JSON but more compact. Maps, arrays, strings encoded in few bytes. Foundation for QR code and offline credential encoding.

**Why It Matters**:
- Compact: CBOR payloads 30-50% smaller than JSON equivalents
- QR-friendly: smaller data = more dense QR codes = easier to scan
- Efficient parsing: lightweight protocol ideal for low-power devices
- CWT foundation: CBOR tokens used for signed credentials

**Supported By**:

| Module | Status | Role |
|--------|--------|------|
| Certify | Available (v0.14.0+) | Encode Claim 169 QR credentials in CBOR format |
| Mobile | Available (v0.10.0+) | Decode and store CBOR-encoded QR payloads |
| Web | - | Not applicable (browsers handle JSON, not CBOR directly) |
| Verify | Available (v0.17.0+) | Decode CBOR QR codes; validate CBOR structure |

---

### CBOR Web Token (CWT) & COSE Signing

**Official Specification**:
- **RFC 8152 (now 9052/9053)**: https://tools.ietf.org/html/rfc8152

**Overview**: CBOR-based equivalent of JWT. Uses COSE (CBOR Object Signing and Encryption) for authenticated encryption and signing. Standard for signed CBOR credentials.

**Why It Matters**:
- Compact signed credentials: signatures included in CBOR payload
- IANA standard: Ed25519 and P-256 signatures registered
- Claim 169 standard: Claim 169 QR codes use CWT signing
- Offline verification: credentials carry proofs, no server needed

**Supported By**:

| Module | Status | Role |
|--------|--------|------|
| Certify | Planned (v0.14.0) | Issue Claim 169 credentials with CWT signatures |
| Mobile | Available (v0.10.0+) | Verify CWT signatures on Claim 169 QR codes |
| Web | - | Not directly used (JSON-based credentials in web) |
| Verify | Available (v0.17.0+) | Validate CWT signatures on Claim 169 QR presentations |

---

### Claim 169: MOSIP QR Code Specification

**Official Specification**:
- **MOSIP v1.2.0** (Latest, Sept 2025): https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification
- **v1.1.0**: https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification-1
- **v1.0.0**: https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specifications-1.0.0

**Overview**: IANA-registered MOSIP standard for compact, cryptographically-signed identity QR codes. Encodes identity attributes in CBOR format, signed with Ed25519 or ECC, embeddable in QR codes.

**Why It Matters**:
- Humanitarian focus: v1.2.0 adds refugee-specific attributes (legal status, secondary language, location code)
- Offline verification: QR contains full credential + proof; no server needed
- Standardized encoding: 23 identity attributes in compact CBOR format
- IANA official: Registered as IANA CWT claim, interoperable across systems

**Evolution**:
- **v1.0.0** (2024): Basic 18 attributes (ID, name, DOB, gender, address, nationality, etc.)
- **v1.1.0** (2024): Enhanced security documentation; same 18 attributes
- **v1.2.0** (Sept 2025): Added 5 humanitarian attributes (legal status, secondary language, location code, country of issuance, secondary language name); expanded working group (UNHCR, GIZ, OpenSPP)

**Supported By**:

| Module | Status | Role |
|--------|--------|------|
| Certify | Planned (v0.14.0) | Encode and sign Claim 169 QR credentials in CBOR-CWT format |
| Mobile | Available (v0.10.0+) | Receive Claim 169 QR credentials from issuers; store and display QR blocks |
| Web | - | Not applicable (QR-based credentials are mobile-centric) |
| Verify | Available (v0.17.0+) | Scan or upload Claim 169 QR codes; decode CBOR; validate signatures |

**Claim 169 QR Structure** (v1.2.0):
- Attributes 1-18: Standard identity (name, DOB, address, nationality, etc.)
- Attribute 19: Full Name - Secondary Language
- Attribute 20: Secondary Language Code
- Attribute 21: Location Code
- Attribute 22: Legal Status (refugee, asylum seeker, stateless, etc.)
- Attribute 23: Country of Issuance
- Encryption: CBOR-encoded, optionally encrypted
- Signature: Ed25519 or ECC proof

---

### ISO 18013-5/7: Mobile Document Standards (mDL & mDoc)

**Official Specifications**:
- **ISO 18013-5:2021** (Mobile Driver's License): https://www.iso.org/standard/69084.html
- **ISO 18013-7** (Gen Proof Signatures): https://www.iso.org/standard/80601.html

**Overview**: ISO international standards for mobile identity documents (driver licenses, general documents, travel credentials). Credentials stored in CBOR format, verified offline via NFC or QR.

**Why It Matters**:
- Government standard: used for border control, aviation, age verification
- Offline verification: full credential + proof in device, no server dependency
- Biometric binding: holder's face/fingerprint linked to credential
- Interoperable: any ISO 18013-compliant reader can verify (border gates, airports)

**Supported By**:

| Module | Status | Role |
|--------|--------|------|
| Certify | Planned (v0.14.0+) | Issue ISO mDL/mDoc credentials in CBOR format |
| Mobile | Available (v0.12.0+) | Store mDL credentials; support NFC/BLE presentation to readers |
| Web | Planned (v0.16.0+) | Display mDoc credentials (note: NFC is not browser-available) |
| Verify | Planned (v0.18.0+) | Verify mDL/mDoc credentials from NFC or QR presentation |

**Key Difference from W3C VC**:
- W3C VC: JSON-LD based, semantic, flexible
- ISO mDL/mDoc: Binary (CBOR) based, cryptographically compact, government-focused

---

### W3C Data Integrity 2.0

**Official Specification**:
- **W3C Working Draft**: https://www.w3.org/TR/vc-data-integrity/

**Overview**: Emerging W3C specification for cryptographic proofs on JSON-LD documents using JWS (JSON Web Signature) formats. More flexible than JSON-LD Proofs; supports Ed25519, RSA, ECDSA.

**Why It Matters**:
- Modern proof mechanisms: moves beyond legacy JSON-LD proof suites
- Standardized JWS integration: aligns with JWT/SD-JWT ecosystem
- Planned for W3C VC 2.0 adoption
- Backward compatible: works with existing VC infrastructure

**Supported By**:

| Module | Status | Role |
|--------|--------|------|
| Certify | Planned (v0.15.0+) | Issue credentials with Data Integrity 2.0 proofs |
| Mobile | Planned (v0.16.0+) | Verify Data Integrity proofs on credentials |
| Web | Planned (v0.16.0+) | Display and verify Data Integrity proofs |
| Verify | Planned (v0.18.0+) | Validate Data Integrity 2.0 signed credentials |

---

### JWT (JSON Web Token)

**Official Specification**:
- **RFC 7519**: https://tools.ietf.org/html/rfc7519

**Overview**: Compact, self-contained format for securely transmitting information as JSON. Consists of header (algorithm), payload (claims), signature (HMAC or asymmetric).

**Why It Matters**:
- Industry standard since 2015: understood by every OAuth/OIDC system
- Compact: smaller than W3C VC format, ideal for constrained networks
- Stateless verification: signature validates entire token
- Foundation for SD-JWT, W3C Data Integrity, JWS

**Supported By**:

| Module | Status | Role |
|--------|--------|------|
| Certify | Available (v0.8.0+) | Issue JWT-formatted credentials (JWT-VC format) |
| Mobile | Available (v0.9.0+) | Store JWT credentials; verify JWT signatures |
| Web | Available (v0.15.0+) | Display and present JWT credentials |
| Verify | Available (v0.17.0+) | Verify JWT signatures |

---

### Cryptographic Algorithms

**Supported algorithms across Inji modules**:

#### EdDSA (Ed25519 & Ed448)

**Specification**:
- **RFC 8032**: https://tools.ietf.org/html/rfc8032

**Why It Matters**:
- Modern elliptic curve: 10x smaller key sizes than RSA-2048 (32 bytes vs 256 bytes)
- High performance: faster signing/verification than RSA
- Quantum-resistant-ready: smaller key space reduces future quantum threat
- W3C recommended for new implementations

**Support**:

| Algorithm | Version | Certify | Mobile | Web | Verify | Notes |
|-----------|---------|---------|--------|-----|--------|-------|
| Ed25519 | 2018 Spec | Available | Available | Available | Available | Legacy format, still supported |
| Ed25519 | 2020 Spec | Available (v0.11.0+) | Available | Available | Available | Enhanced key format, recommended |

---

#### ECDSA (Elliptic Curve DSA)

**Specification**:
- **FIPS 186-4**: https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.186-4.pdf

**Why It Matters**:
- Standardized elliptic curves: P-256 (secp256r1), secp256k1
- Balance: stronger than DSA, smaller keys than RSA
- Interoperable: widely supported in blockchain and OpenID ecosystem

**Support**:

| Algorithm | Curve | Certify | Mobile | Web | Verify | Notes |
|-----------|-------|---------|--------|-----|--------|-------|
| ECDSA | secp256k1 (K1) | Available (v0.11.0+) | Available | Available | Available | OpenID ecosystem standard |
| ECDSA | P-256 (R1) | Available (v0.11.0+) | Available | Planned | Available | NIST standard |
| ECDSA | P-384 | Planned | Planned | Planned | Planned | High-security variant |

---

#### RSA (Rivest-Shamir-Adleman)

**Specification**:
- **RFC 8017**: https://tools.ietf.org/html/rfc8017

**Why It Matters**:
- Mature standard: 30+ years, broad compatibility
- FIPS compliant: required for US government systems
- Proven security: no known mathematical breakthroughs
- Legacy support: many existing credentials use RSA

**Support**:

| Key Size | Certify | Mobile | Web | Verify | Notes |
|----------|---------|--------|-----|--------|-------|
| RSA-2048 | Available | Available | Available | Available | Minimum secure size |
| RSA-4096 | Available | Available | Available | Available | High security, slower |

**Note**: RSA keys are 4-8x larger than Ed25519; use Ed25519 for new credentials.

---

## Inji Certify - Standards Implementation

### Overview

Inji Certify is the credential issuer module. It enables organizations to issue digitally signed, standards-compliant verifiable credentials at scale. Certify is the origination point for all credentials that flow through the Inji ecosystem.

### Standards Implemented in Certify

---

#### W3C Verifiable Credentials Data Model

**Specification**: https://www.w3.org/TR/vc-data-model/ (See Standards Library for details)

**Certify-Specific Implementation**:

- **Credential Issuance**: Full support for both v1.1 and v2.0 credential structures
- **Proof Types**: JSON-LD Proofs, JWT, SD-JWT, planned Data Integrity 2.0
- **Automatic Versioning**: Can issue v1.1 credentials for legacy systems or v2.0 for modern deployments
- **Multi-Format Support**: Same credential content can be delivered in JSON-LD, JWT, or SD-JWT based on holder request
- **SVG Rendering Templates**: v2.0 credentials can include SVG-based display templates for visual rendering in wallets
- **Semantic Contexts**: Custom JSON-LD contexts for domain-specific vocabularies (e.g., educational credentials, health credentials)
- **Credential Status**: Includes revocation status endpoint referencing W3C Bitstring Status List

**Release Timeline**:
- v0.8.0+: W3C VC 1.1 support
- v0.11.0+: Full W3C VC 2.0 support
- Ongoing: Enhanced proof mechanisms, new credential types

---

#### OAuth 2.0 & OpenID Connect

**Specification**: https://tools.ietf.org/html/rfc6749, https://openid.net/connect/ (See Standards Library for details)

**Certify-Specific Implementation**:

- **Authorization Code Flow**: Secure user login and credential issuance authorization
- **OIDC Integration**: eSignet integration for federated identity; supports Google OAuth, Keycloak, custom OIDC providers
- **Token Validation**: Issued access tokens validated against configured identity provider
- **Scope Management**: Fine-grained scopes for different credential types and issuance flows
- **Pre-Authorized Code Flow**: Direct issuance without full OIDC flow (speed for certain deployment scenarios)
- **User Binding**: Credentials bound to authenticated user identity

---

#### OpenID4VCI (Verifiable Credential Issuance)

**Specification**: https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0-13.html (See Standards Library for details)

**Certify-Specific Implementation**:

- **Credential Endpoint** (`/credential`): Responds to credential requests from wallet holders
- **Batch Issuance**: Issue multiple credentials in single request
- **Multiple Formats**: Issue JSON-LD, JWT, or SD-JWT based on holder capability and issuer policy
- **Credential Offer**: Generate shareable credential_offer URIs that wallets can accept
- **Authorization Server Integration**: Pluggable authorization (eSignet, Keycloak, custom OAuth 2.0)
- **Deferred Issuance**: Support for issuance transactions that complete over time
- **Proof Validation**: Require holders to prove key possession during issuance
- **Response Metadata**: Provide issuance details (accepted algorithms, supported formats, etc.)

**Release Info**: Available since v0.8.0; enhanced with each release

---

#### W3C DIDs (Decentralized Identifiers)

**Specification**: https://www.w3.org/TR/did-core/ (See Standards Library for details)

**Certify-Specific Implementation**:

- **DID Publishing**: Issuers publish their DID as credential issuer identifier
- **Key Publication**: DIDs resolve to public key material for signature verification
- **DID Methods Supported**: did:mosip, did:ion, did:key (method-specific implementations)
- **Credential Context**: All credentials include 'issuer' field with issuer DID
- **Key Rotation**: Support for DID key rotation while maintaining credential validation
- **Interoperability**: DIDs follow W3C DID specification for universal recognition

---

#### JSON-LD (Linked Data)

**Specification**: https://www.w3.org/TR/json-ld11/ (See Standards Library for details)

**Certify-Specific Implementation**:

- **Credential Context**: Custom JSON-LD contexts for domain-specific vocabularies
- **Semantic Mapping**: Map credential attributes to standard URIs (schema.org, FOAF, custom vocabularies)
- **Linked Data Processing**: Support for @context, @id, @type in credential structure
- **Extensibility**: Custom vocabularies without breaking interoperability
- **Human-Readable Output**: Credentials include human-friendly labels alongside URIs

---

#### Selective Disclosure JWT (SD-JWT)

**Specification**: https://datatracker.ietf.org/doc/html/draft-ietf-oauth-selective-disclosure-jwt (See Standards Library for details)

**Certify-Specific Implementation**:

- **SD-JWT Issuance**: Issue credentials with selectively-disclosable claims
- **Salt & Hash Structure**: Each claim salted and hashed for selective disclosure
- **Discloser Binding**: Support for listing which claims verifier may request
- **Claim Encryption**: Optional encryption of undisclosed claims
- **Fallback Disclosure**: Holder can disclose claims not explicitly requested (if issuer allows)
- **Release Timeline**: Drafts in v0.12.0, full support v0.13.0+

---

#### W3C Bitstring Status List

**Specification**: https://www.w3.org/TR/vc-bitstring-status-list/ (See Standards Library for details)

**Certify-Specific Implementation**:

- **Status List Publishing**: Publish credential revocation status as bitstring
- **Credential Status Entry**: Credentials include reference to status list (list ID + position)
- **Revocation API**: Endpoint (`/revoke`) to revoke issued credentials
- **Bitstring Format**: Binary format with efficient indexing for 1M+ credentials
- **Privacy Preservation**: Bitstring doesn't reveal which specific credentials are revoked
- **Distribution**: Status list hosted and distributed by issuer

---

#### CBOR (Concise Binary Object Representation)

**Specification**: https://tools.ietf.org/html/rfc7049 (See Standards Library for details)

**Certify-Specific Implementation**:

- **Claim 169 Encoding**: Encode identity attributes in CBOR format for QR embedding
- **Compact Payload**: CBOR-encoded credentials 30-50% smaller than JSON
- **QR Size Optimization**: Compact encoding ensures QR codes remain scannable
- **Release Timeline**: Claim 169 support planned v0.14.0

---

#### CWT/COSE (CBOR Web Token & Object Signing and Encryption)

**Specification**: https://tools.ietf.org/html/rfc8152 (See Standards Library for details)

**Certify-Specific Implementation**:

- **Claim 169 Signing**: Sign CBOR-encoded identity QR codes with CWT/COSE signatures
- **Ed25519 Signing**: Use Ed25519 algorithm for Claim 169 signatures (IANA-registered)
- **Signature Validation**: Digital signatures embedded in CBOR payload for offline verification
- **Release Timeline**: Planned v0.14.0 with Claim 169 support

---

#### Claim 169: MOSIP QR Code Specification

**Specification**: https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification (See Standards Library for details)

**Certify-Specific Implementation**:

- **QR Encoding**: Encode identity credentials as Claim 169-compliant CBOR-CWT QR codes
- **Attribute Support**: Support all 23 attributes (v1.2.0):
  - Standard 18 identity attributes (name, DOB, nationality, address, etc.)
  - Humanitarian focus: legal status, secondary language, location code
- **Signature Schema**: Ed25519 or ECC signatures for offline verification
- **QR Embedding**: Claim 169 QR can be embedded in W3C credentials as supplementary format
- **Multi-QR Support**: Single credential can contain multiple Claim 169 QRs (different use cases)
- **Release Timeline**: Planned v0.14.0

---

#### JWT (JSON Web Token)

**Specification**: https://tools.ietf.org/html/rfc7519 (See Standards Library for details)

**Certify-Specific Implementation**:

- **JWT-VC Issuance**: Issue credentials in JWT (not JSON-LD) format
- **Claims in JWT**: Credential structure mapped to JWT claims structure
- **Compact Distribution**: JWT smaller and faster than JSON-LD equivalent
- **Signature Algorithm Selection**: Support Ed25519, RSA, ECDSA signing algorithms
- **Token Expiration**: exp claim for credential lifetime management

---

#### Cryptographic Algorithms (Signing)

**Certify-Specific Implementation**:

| Algorithm | Version | Status | Use Case |
|-----------|---------|--------|----------|
| Ed25519 | 2018 Spec | Available | Modern, high-performance signing |
| Ed25519 | 2020 Spec | Available (v0.11.0+) | Enhanced key format, recommended |
| RSA | 2048-bit | Available | FIPS 140-2 compliance, legacy systems |
| RSA | 4096-bit | Available | High-security deployments |
| ECDSA | secp256k1 | Available (v0.11.0+) | OpenID ecosystem, blockchain-compatible |
| ECDSA | P-256 | Available (v0.11.0+) | NIST standard, high security |
| ECDSA | P-384 | Planned | Enhanced security variant |

---

#### W3C Data Integrity 2.0 (Planned)

**Specification**: https://www.w3.org/TR/vc-data-integrity/ (See Standards Library for details)

**Certify-Specific Implementation** (Planned v0.15.0+):

- **JWS-Based Proofs**: Migrate from JSON-LD Proofs to JWS-based Data Integrity proofs
- **Algorithm Support**: Ed25519, RSA, ECDSA with Data Integrity 2.0 format
- **Canonical JSON**: Canonicalized JSON-LD before signing (prevents tampering)
- **Backward Compatibility**: Continue issuing JSON-LD Proofs for legacy systems

---

## Inji Wallet Mobile - Standards Implementation

### Overview

Inji Mobile is the credential holder wallet for smartphones (iOS/Android). It receives credentials from issuers, stores them securely, and presents them to verifiers in standardized formats.

### Standards Implemented in Mobile

---

#### W3C Verifiable Credentials Data Model

**Specification**: https://www.w3.org/TR/vc-data-model/ (See Standards Library for details)

**Mobile-Specific Implementation**:

- **Credential Reception**: Receive W3C VC 1.1 and v2.0 credentials from OpenID4VCI issuers
- **Local Storage**: Encrypted storage of credentials in device secure enclave
- **Credential Display**: Render credential claims with issuer-defined templates (SVG in v2.0)
- **Offline Access**: Stored credentials accessible without internet connection
- **Selective Viewing**: Users can view specific claims without sharing all credential data
- **Multi-VC Support**: Store 100s of credentials from multiple issuers

---

#### OpenID4VCI (Verifiable Credential Issuance)

**Specification**: https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0-13.html (See Standards Library for details)

**Mobile-Specific Implementation**:

- **Credential Request**: Send `/credential` requests to issuer endpoints
- **Authorization Headers**: Include OAuth access tokens in credential requests
- **Requested Format**: Specify desired credential format (JSON-LD, JWT, SD-JWT)
- **Proof of Possession**: Generate proofs (JWTs with app keys) for credential binding
- **Batch Download**: Download multiple credentials in single flow
- **Wallet Interaction**: Present credential_offer QR codes to user for acceptance
- **Status Tracking**: UI for tracking issuance progress and errors

---

#### OpenID4VP (Verifiable Presentations)

**Specification**: https://openid.net/specs/openid-4-verifiable-presentations-1_0-23.html (See Standards Library for details)

**Mobile-Specific Implementation**:

- **Presentation Request Parsing**: Receive OpenID4VP presentation requests via QR or deep link
- **Credential Matching**: Match holder credentials against verifier claim requirements
- **Selective Disclosure**: Present only requested claims (especially important for SD-JWT)
- **User Consent**: Explicit user approval before sharing credentials
- **Multiple Presentation Modes**:
  - Cross-device: Scan verifier QR, send presentation back via HTTPS
  - Same-device: Deep link to verifier app, receive request, return presentation
  - BLE: Direct Bluetooth connection for offline scenarios
- **Signature Generation**: Sign presentation with holder key proof
- **Response Transmission**: Send signed VP back to verifier

---

#### OpenID4VP-BLE (Offline Presentation)

**Specification**: https://github.com/openid/OpenID4VP (offline extensions) (See Standards Library for details)

**Mobile-Specific Implementation**:

- **BLE Pairing**: Pair mobile with verifier via Bluetooth Low Energy
- **Direct Communication**: P2P credential presentation without internet
- **Offline Verification**: Verifier validates credentials locally using embedded proofs
- **Use Cases**: Border control, refugee camps, low-connectivity areas
- **Release Timeline**: Available v0.14.0+; expanded with each release

---

#### W3C DIDs (Decentralized Identifiers)

**Specification**: https://www.w3.org/TR/did-core/ (See Standards Library for details)

**Mobile-Specific Implementation**:

- **Issuer DID Resolution**: Resolve issuer DIDs to retrieve public keys for signature validation
- **Holder DID Support**: Option to bind credentials to holder DID (self-sovereign identity)
- **DID Method Resolution**: Support did:mosip, did:ion, did:key methods
- **Trust Anchors**: Anchor verifier trust to verifier DID
- **Offline DID Resolution**: Cache resolved DIDs for offline verification

---

#### JSON-LD (Linked Data)

**Specification**: https://www.w3.org/TR/json-ld11/ (See Standards Library for details)

**Mobile-Specific Implementation**:

- **Semantic Display**: Parse JSON-LD @context to display claims with human-friendly labels
- **Language Support**: Multi-language credential display via JSON-LD context
- **Linked Data Navigation**: Support for linked data references within credentials
- **Context Caching**: Cache JSON-LD contexts for offline access

---

#### Selective Disclosure JWT (SD-JWT)

**Specification**: https://datatracker.ietf.org/doc/html/draft-ietf-oauth-selective-disclosure-jwt (See Standards Library for details)

**Mobile-Specific Implementation**:

- **Storage**: Store SD-JWT credentials with all salts and hashes
- **Selective Presentation**: Generate disclosure tokens for only claims requested by verifier
- **Claim Proof**: Provide salts and hashes proving disclosed claims match issuer's hashes
- **Privacy**: Undisclosed claims remain private; verifier can't see them
- **Release Timeline**: Available v0.10.0+; enhanced with each release

---

#### W3C Bitstring Status List

**Specification**: https://www.w3.org/TR/vc-bitstring-status-list/ (See Standards Library for details)

**Mobile-Specific Implementation**:

- **Status Checking**: Before presenting, check credential status in issuer's bitstring
- **Background Refresh**: Periodically refresh bitstring status in background
- **Offline Caching**: Cache bitstring for offline status validation (if available)
- **Revoked Credential Handling**: Notify user if credential is revoked; prevent presentation

---

#### CBOR (Concise Binary Object Representation)

**Specification**: https://tools.ietf.org/html/rfc7049 (See Standards Library for details)

**Mobile-Specific Implementation**:

- **QR Decoding**: Decode CBOR-encoded payloads from Claim 169 QR codes
- **Claim 169 Storage**: Store CBOR-encoded QR payloads as part of credentials
- **Binary Parsing**: Efficient parsing of compact binary credentials
- **Library Integration**: Uses PixelPass library (v0.7.0+) for CBOR decoding

---

#### CWT/COSE (CBOR Web Token & Object Signing and Encryption)

**Specification**: https://tools.ietf.org/html/rfc8152 (See Standards Library for details)

**Mobile-Specific Implementation**:

- **CWT Signature Verification**: Verify Ed25519 or ECC signatures on CWT tokens
- **Claim 169 Validation**: Validate COSE signatures on Claim 169 QR codes
- **Embedded Proofs**: Extract and validate signatures embedded in CBOR payloads
- **Offline Verification**: Verify signatures without server contact

---

#### Claim 169: MOSIP QR Code Specification

**Specification**: https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification (See Standards Library for details)

**Mobile-Specific Implementation**:

- **QR Reception**: Receive Claim 169-encoded QR credentials from issuers
- **QR Storage**: Store QR payloads securely in device encrypted storage
- **CBOR Parsing**: Decode CBOR-encoded identity attributes
- **Multiple QR Support**: Support credentials with multiple QR codes (different contexts)
- **QR Display**: Show QR code to verifier for presentation (camera scanning)
- **Offline QR Presentation**: Present QR via BLE for offline verification
- **Credential Binding**: Link Claim 169 QR to holder identity
- **Release Timeline**: Available v0.10.0+; enhanced v0.14.0+

---

#### ISO 18013-5 (Mobile Driver's License)

**Specification**: https://www.iso.org/standard/69084.html (See Standards Library for details)

**Mobile-Specific Implementation**:

- **mDL Reception**: Receive ISO 18013-5 mDL credentials from government issuers
- **NFC Presentation**: Present mDL via NFC for offline verification in readers
- **BLE Presentation**: NFC-less presentation via Bluetooth
- **Biometric Binding**: Holder biometric (face) bound to credential
- **Selective Disclosure**: Present only fields requested by reader
- **Release Timeline**: Available v0.12.0+; enhanced with each release

---

#### JWT (JSON Web Token)

**Specification**: https://tools.ietf.org/html/rfc7519 (See Standards Library for details)

**Mobile-Specific Implementation**:

- **JWT Storage**: Store JWT-formatted credentials
- **Signature Verification**: Verify JWT signatures (HMAC, RSA, ECDSA)
- **Token Parsing**: Extract claims from JWT payload
- **Presentation**: Present JWT credentials to verifiers via OpenID4VP

---

#### Cryptographic Signature Verification

**Mobile-Specific Implementation**:

| Algorithm | Versions | Status |
|-----------|----------|--------|
| Ed25519 | 2018 & 2020 | Available (verify only) |
| RSA | 2048, 4096 | Available (verify only) |
| ECDSA K1 | secp256k1 | Available (verify only) |
| ECDSA R1 | P-256 | Available (verify only) |

---

## Inji Wallet Web - Standards Implementation

### Overview

Inji Web is a browser-based, progressive web app (PWA) credential wallet. No app installation required; works in modern browsers.

### Standards Implemented in Web

---

#### W3C Verifiable Credentials Data Model

**Specification**: https://www.w3.org/TR/vc-data-model/ (See Standards Library for details)

**Web-Specific Implementation**:

- **Credential Download**: Receive W3C VC 1.1 credentials from OpenID4VCI issuers
- **Session Storage**: Store credentials in browser session or local storage (user-authorized)
- **Credential Display**: Render credentials in HTML with semantic understanding
- **PDF Export**: Download credentials as PDF with embedded QR codes
- **No App Required**: Work entirely in browser; no native app installation
- **Note**: v2.0 support planned for v0.16.0+

---

#### OpenID4VCI (Verifiable Credential Issuance)

**Specification**: https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0-13.html (See Standards Library for details)

**Web-Specific Implementation**:

- **OAuth Flow**: Browser-based OAuth 2.0 flow for authentication with issuer
- **Credential Download**: Fetch credentials via HTTPS from issuer endpoint
- **Credential Request**: Submit credential requests with format preferences
- **Token Management**: Handle OAuth access tokens for credential requests
- **User Interface**: Web forms for credential issuance workflow
- **Release Timeline**: Available since v0.8.0

---

#### OpenID4VP (Verifiable Presentations)

**Specification**: https://openid.net/specs/openid-4-verifiable-presentations-1_0-23.html (See Standards Library for details)

**Web-Specific Implementation**:

- **Presentation Request Parsing**: Receive OpenID4VP requests from verifier web portals
- **Credential Matching**: Match holder credentials against verifier requirements
- **Browser-Based Signature**: Sign presentations using JavaScript crypto APIs
- **Selective Disclosure**: Present only requested claims
- **Response Transmission**: Send signed VP via HTTPS to verifier
- **Release Timeline**: Available v0.15.0+

**Note**: BLE (offline) is not available in browsers (security model limitation)

---

#### W3C DIDs (Decentralized Identifiers)

**Specification**: https://www.w3.org/TR/did-core/ (See Standards Library for details)

**Web-Specific Implementation**:

- **Issuer DID Resolution**: Resolve issuer DIDs in browser to verify signatures
- **DID Cache**: Cache resolved DIDs for offline access
- **Holder DID Options**: Support for holder-bound DIDs (emerging feature)

---

#### JSON-LD (Linked Data)

**Specification**: https://www.w3.org/TR/json-ld11/ (See Standards Library for details)

**Web-Specific Implementation**:

- **Semantic Rendering**: Display credentials with human-friendly claim labels
- **Language Support**: Multi-language credential display via JSON-LD context
- **Browser Processing**: Client-side JSON-LD context resolution

---

#### Selective Disclosure JWT (SD-JWT)

**Specification**: https://datatracker.ietf.org/doc/html/draft-ietf-oauth-selective-disclosure-jwt (See Standards Library for details)

**Web-Specific Implementation**:

- **Storage**: Store SD-JWT credentials in browser storage
- **Selective Presentation**: Generate disclosure tokens for requested claims only
- **Privacy**: Undisclosed claims remain hidden from verifiers
- **Release Timeline**: Available v0.15.0+

---

#### JWT (JSON Web Token)

**Specification**: https://tools.ietf.org/html/rfc7519 (See Standards Library for details)

**Web-Specific Implementation**:

- **Storage**: Store JWT credentials in browser storage
- **Signature Verification**: Browser-based JWT verification using JavaScript crypto
- **Token Display**: Show JWT claims in human-readable format

---

#### W3C Bitstring Status List

**Specification**: https://www.w3.org/TR/vc-bitstring-status-list/ (See Standards Library for details)

**Web-Specific Implementation**:

- **Status Checking**: Optionally check credential status before presentation
- **Issuer Call**: Fetch and validate bitstring from issuer (with CORS support)

---

#### Cryptographic Signature Verification

**Web-Specific Implementation** (via browser crypto APIs):

| Algorithm | Status | Notes |
|-----------|--------|-------|
| Ed25519 | Available (v0.15.0+) | Verify Ed25519 signatures |
| RSA | Available | RSA verification in browsers |
| ECDSA K1 | Available | Verify secp256k1 signatures |
| ECDSA R1 | Available | Verify P-256 signatures |

---

#### W3C Data Integrity 2.0 (Planned)

**Specification**: https://www.w3.org/TR/vc-data-integrity/ (See Standards Library for details)

**Web-Specific Implementation** (Planned v0.16.0+):

- **JWS Verification**: Browser-based JWS signature verification
- **Canonical JSON Validation**: Verify canonicalized JSON-LD proofs

---

## Inji Verify - Standards Implementation

### Overview

Inji Verify is the credential verifier portal (web application). It enables organizations to verify credentials from holders, validate cryptographic proofs, and check revocation status.

### Standards Implemented in Verify

---

#### W3C Verifiable Credentials Data Model

**Specification**: https://www.w3.org/TR/vc-data-model/ (See Standards Library for details)

**Verify-Specific Implementation**:

- **Credential Reception**: Accept W3C VC 1.1 and v2.0 credentials from holders
- **Structure Validation**: Validate credential structure (issuer, subject, claims, proofs)
- **Format Support**: Handle JSON-LD, JWT, SD-JWT, ISO mDL/mDoc formats
- **Proof Verification**: Validate W3C proofs (JSON-LD, JWT, Data Integrity)
- **Revocation Checking**: Validate credential status via W3C Bitstring Status List

---

#### OpenID4VP (Verifiable Presentations)

**Specification**: https://openid.net/specs/openid-4-verifiable-presentations-1_0-23.html (See Standards Library for details)

**Verify-Specific Implementation**:

- **Presentation Request Generation**: Create OpenID4VP requests specifying required credentials
- **Holder Discovery**: Generate presentation QR codes for holders to scan
- **Response Validation**: Receive and validate signed presentations from holders
- **Claim Validation**: Verify that presented claims match requested format/values
- **Multi-Device Flow**: Support both cross-device (QR) and same-device flows
- **Release Timeline**: Available v0.17.0+

---

#### OpenID4VP-BLE (Offline Presentation)

**Specification**: https://github.com/openid/OpenID4VP (offline extensions) (See Standards Library for details)

**Verify-Specific Implementation** (Planned v0.18.0+):

- **BLE Receiver**: Accept credential presentations via Bluetooth Low Energy
- **Offline Verification**: Validate credentials without internet connectivity
- **Use Cases**: Border control, refugee processing, field verification
- **P2P Communication**: Direct mobile-to-verifier communication via BLE

---

#### W3C DIDs (Decentralized Identifiers)

**Specification**: https://www.w3.org/TR/did-core/ (See Standards Library for details)

**Verify-Specific Implementation**:

- **Issuer DID Resolution**: Resolve issuer DIDs to fetch public keys
- **Signature Validation**: Use resolved keys to validate credential signatures
- **Trust Anchors**: Anchor verifier identity to its own DID
- **DID Caching**: Cache resolved DIDs for performance

---

#### JSON-LD (Linked Data)

**Specification**: https://www.w3.org/TR/json-ld11/ (See Standards Library for details)

**Verify-Specific Implementation**:

- **Semantic Processing**: Parse JSON-LD @context to understand credential claims
- **Compaction**: Expand JSON-LD for processing; compact for display
- **Custom Vocabularies**: Support domain-specific claim vocabularies
- **Display**: Render credentials with human-readable claim labels (11 languages)

---

#### Selective Disclosure JWT (SD-JWT)

**Specification**: https://datatracker.ietf.org/doc/html/draft-ietf-oauth-selective-disclosure-jwt (See Standards Library for details)

**Verify-Specific Implementation**:

- **Presentation Acceptance**: Accept SD-JWT presentations from holders
- **Disclosure Validation**: Verify that disclosed claims match issuer hashes
- **Salt Verification**: Validate cryptographic salts used in disclosure
- **Selective Claim Inspection**: View only disclosed claims; undisclosed remain hidden
- **Release Timeline**: Available v0.17.0+

---

#### W3C Bitstring Status List

**Specification**: https://www.w3.org/TR/vc-bitstring-status-list/ (See Standards Library for details)

**Verify-Specific Implementation**:

- **Status Endpoint Lookup**: Extract status list endpoint from credential
- **Bitstring Fetch**: Fetch issuer's bitstring
- **Status Validation**: Check credential's bit position in bitstring
- **Revocation Detection**: Alert if credential is revoked
- **Release Timeline**: Available v0.17.0+

---

#### CBOR (Concise Binary Object Representation)

**Specification**: https://tools.ietf.org/html/rfc7049 (See Standards Library for details)

**Verify-Specific Implementation**:

- **QR Decoding**: Decode CBOR-encoded QR payloads
- **Claim 169 Parsing**: Parse CBOR-formatted identity data
- **Structure Validation**: Validate CBOR structure conformance
- **Binary Parsing**: Efficient decoding of compact credentials

---

#### CWT/COSE (CBOR Web Token & Object Signing and Encryption)

**Specification**: https://tools.ietf.org/html/rfc8152 (See Standards Library for details)

**Verify-Specific Implementation**:

- **CWT Signature Validation**: Verify Ed25519 or ECC signatures on CWT tokens
- **Claim 169 Verification**: Validate COSE signatures on Claim 169 QR codes
- **Proof Extraction**: Extract and validate signatures from CBOR payloads
- **Release Timeline**: Available v0.17.0+

---

#### Claim 169: MOSIP QR Code Specification

**Specification**: https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification (See Standards Library for details)

**Verify-Specific Implementation**:

- **QR Scanning**: Camera-based scanning of Claim 169 QR codes
- **QR Upload**: Accept QR images (PDF, JPEG, PNG) for processing
- **CBOR Decoding**: Decode CBOR-encoded identity attributes
- **Signature Validation**: Verify Ed25519 or ECC signatures
- **Attribute Display**: Show 23 identity attributes (v1.2.0) in UI
- **Humanitarian Fields**: Support for legal status, secondary language, location code
- **Multiple QR Support**: Handle credentials with multiple Claim 169 QRs
- **Release Timeline**: Available v0.17.0+

---

#### ISO 18013-5/7 (Mobile Document Standards)

**Specification**: https://www.iso.org/standard/69084.html (mDL), https://www.iso.org/standard/80601.html (mDoc) (See Standards Library for details)

**Verify-Specific Implementation** (Planned v0.18.0+):

- **NFC Reception**: Accept mDL credentials via NFC from mobile wallets
- **Structure Validation**: Validate mDL/mDoc CBOR structure and attributes
- **Biometric Validation**: Display holder biometric and verify match
- **Selective Disclosure**: Handle selective attribute presentation
- **Offline Verification**: Validate embedded signatures without server contact

---

#### JWT (JSON Web Token)

**Specification**: https://tools.ietf.org/html/rfc7519 (See Standards Library for details)

**Verify-Specific Implementation**:

- **JWT Parsing**: Extract and validate JWT credentials
- **Signature Verification**: Verify JWT signatures (RS256, ES256, EdDSA)
- **Claim Inspection**: Display claims in human-readable format

---

#### Cryptographic Signature Verification

**Verify-Specific Implementation**:

| Algorithm | Status | Notes |
|-----------|--------|-------|
| Ed25519 | Available (v0.17.0+) | High-performance signature verification |
| RSA | Available | RSA-2048/4096 verification |
| ECDSA K1 | Available | secp256k1 signature verification |
| ECDSA R1 | Available | P-256 signature verification |

---

## Cross-Module Features Matrix

At a glance: which feature is supported by which module?

| Feature | Certify | Mobile | Web | Verify | Version/Notes |
|---------|---------|--------|-----|--------|---------------|
| **Issue W3C VC 1.1** | ✅ | - | - | - | v0.8.0+ |
| **Issue W3C VC 2.0** | ✅ | - | - | - | v0.11.0+ |
| **Store W3C VC 1.1** | - | ✅ | ✅ | - | v0.8.0+ |
| **Store W3C VC 2.0** | - | ✅ | 🔲 v0.16.0 | - | v0.11.0+ |
| **Verify W3C VC 1.1/2.0** | - | - | - | ✅ | v0.17.0+ |
| **Issue JSON-LD Credentials** | ✅ | - | - | - | v0.8.0+ |
| **Present JSON-LD Credentials** | - | ✅ | ✅ | - | v0.8.0+ |
| **Verify JSON-LD Proofs** | - | - | - | ✅ | v0.17.0+ |
| **Issue JWT Credentials** | ✅ | - | - | - | v0.8.0+ |
| **Present JWT Credentials** | - | ✅ | ✅ | - | v0.9.0+ |
| **Verify JWT Signatures** | - | - | - | ✅ | v0.17.0+ |
| **Issue SD-JWT Credentials** | ✅ | - | - | - | v0.13.0+ |
| **Present SD-JWT (Selective)** | - | ✅ | ✅ | - | v0.10.0+ |
| **Verify SD-JWT Presentations** | - | - | - | ✅ | v0.17.0+ |
| **OpenID4VCI Issuer** | ✅ | - | - | - | v0.8.0+ |
| **OpenID4VCI Client (Download)** | - | ✅ | ✅ | - | v0.8.0+ |
| **OpenID4VP Client (Present)** | - | ✅ | ✅ | - | v0.9.0+, Web v0.15.0+ |
| **OpenID4VP Server (Verify)** | - | - | - | ✅ | v0.17.0+ |
| **OpenID4VP-BLE (Offline)** | - | ✅ | - | 🔲 v0.18.0 | v0.14.0+ |
| **OAuth 2.0 Integration** | ✅ | ✅ | ✅ | - | v0.8.0+ |
| **OIDC Support (Federated Login)** | ✅ eSignet | ✅ | ✅ | - | v0.9.0+ |
| **Publish DIDs** | ✅ | - | - | - | v0.8.0+ |
| **Resolve Issuer DIDs** | - | ✅ | ✅ | ✅ | v0.9.0+ |
| **Holder-Bound DIDs** | - | 🔲 | 🔲 | - | Future |
| **W3C Bitstring Status List** | ✅ Publish | ✅ Check | ✅ Check | ✅ Check | v0.10.0+ |
| **Issue Claim 169 QRs** | 🔲 v0.14.0 | - | - | - | Planned |
| **Store Claim 169 QRs** | - | ✅ | - | - | v0.10.0+ |
| **Present Claim 169 QRs** | - | ✅ | - | - | v0.10.0+ |
| **Scan Claim 169 QRs** | - | - | - | ✅ | v0.17.0+ |
| **Verify Claim 169 Signatures** | - | ✅ | - | ✅ | v0.10.0+, Verify v0.17.0+ |
| **Issue ISO mDL** | 🔲 v0.14.0+ | - | - | - | Planned |
| **Store mDL Credentials** | - | ✅ | 🔲 | - | v0.12.0+ |
| **Present mDL (NFC/BLE)** | - | ✅ | - | - | v0.12.0+ |
| **Verify mDL Presentations** | - | - | - | 🔲 v0.18.0 | Planned |
| **Ed25519 Signing** | ✅ | - | - | - | v0.8.0+ |
| **Ed25519 Verification** | - | ✅ | ✅ | ✅ | v0.8.0+ |
| **RSA Signing** | ✅ | - | - | - | v0.8.0+ |
| **RSA Verification** | - | ✅ | ✅ | ✅ | v0.8.0+ |
| **ECDSA Signing** | ✅ | - | - | - | v0.11.0+ |
| **ECDSA Verification** | - | ✅ | ✅ | ✅ | v0.11.0+ |
| **PDF Export** | - | - | ✅ | - | v0.15.0+ |
| **Multi-Language Display** | - | ✅ | ✅ | ✅ | v0.11.0+ (11 languages) |
| **SVG Credential Templates** | ✅ | ✅ | ✅ | ✅ | v2.0 support, v0.11.0+ |
| **Offline Credential Storage** | - | ✅ | ✅ Guest | - | v0.8.0+ |
| **Revocation Checking** | - | ✅ | ✅ | ✅ | v0.10.0+ |

**Legend**: ✅ Available | 🔲 Planned/Coming | - Not Applicable

---

## Standards Roadmap & Timeline

### Certify Release Timeline

| Version | Release Date | Major Standards Additions |
|---------|--------------|--------------------------|
| v0.8.0 | May 2024 | W3C VC 1.1, OpenID4VCI Draft 13, JSON-LD, OAuth 2.0 |
| v0.9.0 | July 2024 | OpenID Connect (eSignet integration), Enhanced DID support |
| v0.10.0 | Sept 2024 | W3C Bitstring Status List, Revocation endpoints |
| v0.11.0 | Nov 2024 | Ed25519 (2020 spec), ECC K1/R1 signing, Enhanced crypto |
| v0.12.0 | Jan 2025 | SD-JWT (Draft) support, PKI integration |
| v0.13.0 | Mar 2025 | SD-JWT (Full), Enhanced OAuth flows |
| v0.14.0 | May 2025 | **Claim 169 QR**, Initial ISO mDL/mDoc |
| v0.15.0 | July 2025 | W3C Data Integrity 2.0 proofs |
| **v0.16.0+** | Q4 2025+ | Full mDoc/mDL support, Extended crypto (P-384) |

### Mobile Release Timeline

| Version | Release | Major Standards Additions |
|---------|---------|--------------------------|
| v0.8.0 | May 2024 | OpenID4VCI client, W3C VC reception, JSON-LD display |
| v0.9.0 | July 2024 | OpenID4VP client, QR presentation |
| v0.10.0 | Sept 2024 | Claim 169 QR storage & display, Bitstring status check |
| v0.11.0 | Nov 2024 | Ed25519 (2020) verification, ECDSA K1/R1, Multi-language |
| v0.12.0 | Jan 2025 | ISO 18013-5 mDL support, NFC presentation |
| v0.13.0 | Mar 2025 | Enhanced SD-JWT support, Improved revocation |
| v0.14.0 | May 2025 | **OpenID4VP-BLE offline**, Enhanced Claim 169 |
| **v0.15.0+** | Q3 2025+ | mDoc support, Data Integrity 2.0 verification |

### Web Release Timeline

| Version | Release | Major Standards Additions |
|---------|---------|--------------------------|
| v0.8.0 | May 2024 | OpenID4VCI client, JSON-LD credentials |
| v0.12.0 | Jan 2025 | SD-JWT support, Enhanced auth flows |
| v0.15.0 | Q2 2025 | **OpenID4VP support**, W3C VC 2.0 planning |
| v0.16.0 | Q3 2025 | W3C VC 2.0 full support, Data Integrity 2.0 |
| **v0.17.0+** | Q4 2025+ | mDoc support, Extended crypto algorithms |

### Verify Release Timeline

| Version | Release | Major Standards Additions |
|---------|---------|--------------------------|
| v0.17.0 | Q1 2025 | **Claim 169 QR verification**, OpenID4VP Draft 23, SD-JWT |
| v0.18.0 | Q2 2025 | **OpenID4VP-BLE (offline)**, ISO mDL/mDoc verification |
| v0.19.0 | Q3 2025 | W3C Data Integrity 2.0 verification, Extended crypto |
| **v0.20.0+** | Q4 2025+ | Full mDoc support, Post-quantum crypto preparation |

---

## References

### W3C Specifications

| Specification | Link | Current Version | Status |
|---------------|------|-----------------|--------|
| Verifiable Credentials Data Model 1.1 | https://www.w3.org/TR/vc-data-model/ | 1.1 | W3C Recommendation |
| Verifiable Credentials Data Model 2.0 | https://www.w3.org/TR/vc-data-model-2.0/ | WD (Working Draft) | Latest |
| Decentralized Identifiers (DIDs) v1.0 | https://www.w3.org/TR/did-core/ | 1.0 | W3C Recommendation |
| JSON-LD 1.1 | https://www.w3.org/TR/json-ld11/ | 1.1 | W3C Recommendation |
| Bitstring Status List v2.0 | https://www.w3.org/TR/vc-bitstring-status-list/ | 2.0 | W3C Specification |
| Data Integrity 1.0 | https://www.w3.org/TR/vc-data-integrity/ | 1.0 | W3C Editor's Draft |

### OpenID Foundation Specifications

| Specification | Link | Version | Status |
|---------------|------|---------|--------|
| OpenID4VCI | https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0-13.html | Draft 13 | Latest Stable |
| OpenID4VP | https://openid.net/specs/openid-4-verifiable-presentations-1_0-23.html | Draft 23 | Latest Stable |
| OpenID Connect Core 1.0 | https://openid.net/specs/openid-connect-core-1_0.html | 1.0 | Approved |

### IETF RFC Standards

| Specification | RFC | Link | Status |
|---------------|-----|------|--------|
| OAuth 2.0 | RFC 6749 | https://tools.ietf.org/html/rfc6749 | Standard |
| JSON Web Token (JWT) | RFC 7519 | https://tools.ietf.org/html/rfc7519 | Standard |
| CBOR | RFC 7049 | https://tools.ietf.org/html/rfc7049 | Standard |
| COSE Signing and Encryption | RFC 8152 | https://tools.ietf.org/html/rfc8152 | Standard |
| EdDSA (Ed25519, Ed448) | RFC 8032 | https://tools.ietf.org/html/rfc8032 | Standard |
| SD-JWT | Draft | https://datatracker.ietf.org/doc/html/draft-ietf-oauth-selective-disclosure-jwt | Internet Draft |

### ISO Standards

| Specification | ISO Reference | Link | Status |
|---------------|----------------|------|--------|
| Mobile Driver's License | ISO 18013-5:2021 | https://www.iso.org/standard/69084.html | Published |
| Mobile Document Spec | ISO 18013-7 | https://www.iso.org/standard/80601.html | In Progress |

### MOSIP Standards

| Specification | Version | Link | Status |
|---------------|---------|------|--------|
| Claim 169: QR Code Spec | v1.2.0 (Latest) | https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification | Current |
| Claim 169: QR Code Spec | v1.1.0 | https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification-1 | Archive |
| Claim 169: QR Code Spec | v1.0.0 | https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specifications-1.0.0 | Archive |

### Related Documentation

| Document | Link | Purpose |
|----------|------|---------|
| Inji Certify Overview | https://docs.mosip.io/inji/inji-certify/overview | Credential issuer features |
| Inji Mobile Wallet | https://docs.mosip.io/inji/inji-wallet/inji-mobile/overview | Holder wallet features |
| Inji Web Wallet | https://docs.mosip.io/inji/inji-wallet/inji-web/overview | Browser-based wallet |
| Inji Verify Portal | https://docs.mosip.io/inji/inji-verify/overview | Credential verifier |
| Release Notes | https://docs.mosip.io/inji/releases | Version history & features |

---

## Document Information

**Document Version**: 2.0 (Restructured for Non-Repetition)  
**Last Updated**: March 3, 2026  
**Structure Implemented**: Standards Detail Library (single source) + Module Implementation (features only)  
**Key Improvement**: Each standard defined once; modules reference and extend with implementation details  
**Maintenance Model**: Update standard info in one place (Section 3); module features in their respective sections (4-7)

---

**This document represents Inji's commitment to open standards-based interoperability. For the latest release information, refer to official Inji documentation and GitHub repositories.**
