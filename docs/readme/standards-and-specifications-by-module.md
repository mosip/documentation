---
icon: nfc
---

# Inji Standards and Specifications by Module

> **Comprehensive Reference**: A complete overview of W3C standards, cryptographic protocols, and interoperable specifications supported across the Inji Verifiable Credentialing Stack, organized by module for rapid implementation and verification.

Inji is built on **open standards** to ensure **interoperability, security, and trust** in verifiable credentials. This document consolidates all standards, specifications, and protocols across Inji modules—**Certify** (issuer), **Wallet Mobile & Web** (holder), and **Verify** (verifier)—providing a clear snapshot of which module supports what standards and in which versions.

---

## Table of Contents

1. [Overview](#overview)
2. [Core Standards Foundation](#core-standards-foundation)
3. [Inji Certify (Credential Issuer)](#inji-certify-credential-issuer)
4. [Inji Wallet Mobile (Credential Holder)](#inji-wallet-mobile-credential-holder)
5. [Inji Wallet Web (Credential Holder)](#inji-wallet-web-credential-holder)
6. [Inji Verify (Credential Verifier)](#inji-verify-credential-verifier)
7. [Cross-Module Standards Summary](#cross-module-standards-summary)

---

## Overview

### Why Standards Matter

By adhering to open standards, Inji ensures that:

- **Credentials are portable and verifiable** across different ecosystems
- **Trust frameworks are standardized**, enabling seamless interoperability
- **Security and privacy** are maintained through globally accepted cryptographic methods
- It supports **adoption at scale**, allowing organizations, governments, and enterprises to integrate verifiable credentials efficiently

### Standards Bodies Referenced

| Organization | Standards | Role |
|--------------|-----------|------|
| **W3C** (World Wide Web Consortium) | Verifiable Credentials Data Model, DID, Bitstring Status List | Credential data models and identity standards |
| **OpenID Foundation** | OpenID4VCI, OpenID4VP, OpenID4VP_BLE | Credential issuance and presentation protocols |
| **IETF** | SD-JWT, OAuth 2.0 | Selective disclosure and authorization |
| **ISO** | ISO 18013-5/7 (mDL/mDoc) | Mobile document standards |
| **MOSIP** | Claim 169 (QR Code Specification) | Privacy-preserving QR-encoded credentials |

---

## Core Standards Foundation

### Fundamental Standards for All Modules

| Standard | Version | Purpose | Status |
|----------|---------|---------|--------|
| **W3C Verifiable Credentials Data Model** | 1.1 | Industry-standard credential format with semantic interoperability | Widely Supported |
| **W3C Verifiable Credentials Data Model** | 2.0 | Latest specification with enhanced features and Data Integrity proofs |  Supported (Certify, Verify, Mobile) |
| **OAuth 2.0** | - | Industry-standard authorization framework for secure access |  Supported |
| **OpenID Connect (OIDC)** | - | Authentication layer built on OAuth 2.0 |  Supported (Certify via eSignet) |
| **W3C Decentralized Identifiers (DIDs)** | 1.0 | Self-sovereign identity for issuers and holders |  Supported (Certify, Mobile) |

---

## Inji Certify (Credential Issuer)

Inji Certify enables organizations to issue digitally signed, standards-compliant verifiable credentials at scale.

### Credential Data Models

| Standard | Version | Support Status | Description |
|----------|---------|----------------|-------------|
| **W3C VC Data Model** | 1.1 | Available | Current international standard for digital credentials |
| **W3C VC Data Model** | 2.0 | Available | Latest specification with enhanced features |

**Key Capabilities:**
- Full compliance with both versions
- Automatic compatibility with evolving standards
- Supports forward migration from 1.1 to 2.0

### Issuance Protocols

| Protocol | Version | Support Status | Description |
|----------|---------|----------------|-------------|
| **OpenID4VCI** | Draft 13 | Available | Standardized secure credential delivery to wallets |
| **OAuth 2.0** | - | Available | Authorization framework for credential requests |
| **OIDC** | - | Available (via eSignet) | Authentication for authorized issuance |

**Key Features:**
- Pre-authorized code flow (credential_offer with pre-auth code)
- Authorization code flow (standard OIDC authentication)
- Credential binding with DID keys and JWT proofs
- Support for external OAuth 2.0 providers (eSignet, Keycloak)

### Credential Formats

| Format | Version | Status | Description | Release Info |
|--------|---------|--------|-------------|--------------|
| **JSON-LD** | W3C 1.1/2.0 | Available | Linked Data Proofs for semantic interoperability and government deployments | Available since v0.8.0 |
| **Signed JWT (JWS)** | - | Available | Compact JSON-based format—60% faster transmission than JSON-LD | Available since v0.8.0 |
| **SD-JWT** | Draft (IETF) | Available | Privacy-first selective disclosure credentials | Draft in v0.12.0, Full in v0.13.0 |
| **mDoc** | ISO 18013-5/7 | Coming Soon | International standard for mobile documents | Planned v0.14.0+ |
| **mDL** | ISO 18013-5/7 | Coming Soon | Mobile driver's license standard for border control and aviation | Planned for future release |

**Format Support Matrix:**

For **JSON-LD Credentials**:
- Supports Linked Data Proofs with cryptographic signatures
- Compatible with semantically meaningful data through JSON-LD context
- Widely adopted in government and enterprise deployments

For **Signed JWT (JWS)**:
- Compact, self-contained format ideal for enterprise systems
- Faster processing and transmission
- Better suited for high-throughput issuance scenarios

For **SD-JWT**:
- Enables privacy-preserving selective disclosure
- Users can share only required claims with verifiers
- Full IETF SD-JWT specification compliance

### Cryptographic Algorithms

| Algorithm | Variant | Key Size | Support Status | Use Case |
|-----------|---------|----------|----------------|----------|
| **RSA** | RSA-2048, RSA-4096 | 2048/4096-bit | Available | FIPS 140-2 compliance for US government deployments |
| **Ed25519** | 2018 Specification | 128-bit | Available | High-performance elliptic curve, 10x smaller keys |
| **Ed25519** | 2020 Specification | 128-bit | Available (v0.11.0+) | Enhanced key format with better structure |
| **ECC K1** | secp256k1 | 256-bit | Available (v0.11.0+) | Common in OpenID ecosystem, quantum-compatible |
| **ECC R1** | secp256r1 (P-256) | 256-bit | Available | Strong elliptic curve variant for enterprise |

**Security Characteristics:**
- **RSA**: Mature, widely supported, but larger key sizes
- **Ed25519**: Modern cryptography, superior performance, reduced key size
- **ECC**: Quantum-resistant compatible, balance of security and performance

### QR Code & Offline Standards

| Standard | Format | Status | Description |
|----------|--------|--------|-------------|
| **Claim 169** | CBOR-CWT | Coming (v0.14.0) | MOSIP specification for privacy-preserving QR-encoded credentials |
| **CBOR** | Binary Format | Available | Concise Binary Object Representation for efficient credential delivery |

### Revocation & Status Management

| Standard | Version | Status | Description |
|----------|---------|--------|-------------|
| **W3C Bitstring Status List** | 2.0 | Available | Efficient revocation mechanism for JSON-LD credentials |

**Capabilities:**
- Real-time credential revocation
- Automated revocation list publication
- Verifier discovery of revocation endpoints

### Additional Features

| Feature | Status | Description |
|---------|--------|-------------|
| **DID Support** | Available | W3C-compliant DIDs for issuer identity |
| **Multi-Tenant Deployment** | Available | Separate issuers, branding, and configurations |
| **External CA-Signed Certificates** | Available | Integration of PKI infrastructure |
| **Multi-Language Credentials** | Available | Support for multiple language variants |
| **SVG-Based Rendering** | Available | Visual templates for credential display |

---

## Inji Wallet Mobile (Credential Holder)

Inji Mobile is a standards-compliant mobile wallet for securely receiving, storing, and presenting verifiable credentials online and offline.

### Credential Data Models

| Standard | Version | Support Status | Description |
|----------|---------|----------------|-------------|
| **W3C VC Data Model** | 1.1 | Available | Standards-based credential storage and presentation |
| **W3C VC Data Model** | 2.0 | Available | Support for enhanced features and SVG rendering |

### Credential Formats

| Format | Version | Status | Description |
|--------|---------|--------|-------------|
| **JSON-LD** | W3C 1.1/2.0 | Available | Linked Data credentials with semantic context |
| **SD-JWT** | IETF Draft | Available | Privacy-preserving selective disclosure credentials |
| **ISO mDL** | ISO 18013-5 | Available | Mobile driver's license credential format |
| **ISO mDoc** | ISO 18013-5/7 | Available (in development) | Mobile document format for secure offline verification |

**Format Capabilities:**
- **JSON-LD**: Full support for government and enterprise credentials
- **SD-JWT**: Users can selectively disclose claims per verifier request
- **ISO mDL/mDoc**: Offline-verifiable credentials with NFC and QR-based interactions

### Credential Issuance Protocols

| Protocol | Version | Support Status | Description |
|----------|---------|----------------|-------------|
| **OpenID4VCI** | Draft 13 | Available | Download credentials directly from trusted issuers |
| **Pre-Authorized Code Flow** | OIDC4VCI | Available | Direct download using credential_offer URI |

### Credential Presentation Protocols

| Protocol | Version | Support Status | Description |
|----------|---------|----------------|-------------|
| **OpenID4VP** | Draft 23 | Available | Verifiable presentation via QR code deep linking and same-device flows |
| **OpenID4VP-BLE** | Draft 23 Extension | Available | Offline credential sharing via Bluetooth Low Energy |

**Presentation Capabilities:**
- **Cross-Device**: Holder receives request on different device (QR code)
- **Same-Device**: Direct app-to-app presentation
- **Offline (BLE)**: Direct P2P transfer without internet connection

### Cryptographic Algorithms

| Algorithm | Version | Support Status | Description |
|-----------|---------|----------------|-------------|
| **Ed25519** | 2018 | Available | Verification of credentials signed with Ed25519 |
| **Ed25519** | 2020 | Available | Enhanced Ed25519 key format verification |
| **RSA** | - | Available | Verification of RSA-signed credentials |
| **ECC K1** | - | Available | Verification of ECC K1 signatures |

### Advanced Features

| Feature | Status | Description |
|---------|--------|-------------|
| **SVG-Based Credential Rendering** | Available | Support for W3C VC Data Model 2.0 SVG templates |
| **Revocation Checking** | Available | Real-time status verification using W3C Bitstring Status List |
| **Offline Face Match** | Available | Biometric authentication for offline credential sharing |
| **Biometric/Passcode Protection** | Available | Device-level security for app access |
| **Secure Local Storage** | Available | Encrypted, integrity-verified storage using platform keystores |
| **QR Code Display** | Available | Share credentials via QR code encoding |

### Verifiable Presentation Exchange

| Feature | Status | Description |
|---------|--------|-------------|
| **Presentation During Issuance (PDI)** | Available | Present existing credentials to fulfill issuer requirements during new credential issuance |
| **Selective Disclosure** | Available | Share only required claims with verifiers |
| **Consent-Driven Sharing** | Available | User-controlled, explicit consent for each presentation |

---

## Inji Wallet Web (Credential Holder)

Inji Web is a browser-based, open-source wallet for downloading, managing, and sharing verifiable credentials without requiring a mobile app installation.

### Credential Data Models

| Standard | Version | Support Status | Description |
|----------|---------|----------------|-------------|
| **W3C VC Data Model** | 1.1 | Available | Standards-based credential storage and presentation |

*Note: Support for W3C VC Data Model 2.0 is in the roadmap for future releases.*

### Credential Formats

| Format | Version | Status | Description |
|--------|---------|--------|-------------|
| **JSON-LD** | W3C 1.1 | Available | Linked Data credentials with semantic context |
| **SD-JWT** | IETF Draft | Available | Privacy-preserving selective disclosure credentials |
| **JWT VC** | - | Planned | Compact JSON Web Token format |
| **W3C Data Integrity 2.0** | - | Planned | Enhanced proof mechanisms |

### Credential Issuance Protocols

| Protocol | Version | Support Status | Description |
|----------|---------|----------------|-------------|
| **OpenID4VCI** | Draft 13 | Available | Download credentials directly from issuers |
| **Google OAuth 2.0** | - | Available | Login with Google or OpenID-compliant providers |

### Credential Presentation Protocols

| Protocol | Version | Support Status | Description |
|----------|---------|----------------|-------------|
| **OpenID4VP** | Draft 23 | Available (v0.15.0+) | Live, interactive verifiable presentation flows |

**Presentation Capabilities:**
- Verifier-initiated presentation requests
- Real-time credential matching and selection
- Cryptographically signed VP responses

### Cryptographic Signature Support

**JSON-LD with Proof Suites:**

| Algorithm | Version | Web (Login) | Guest Mode | Notes |
|-----------|---------|------------|-----------|-------|
| ED25519 | 2018 | Supported | Supported | Compact, fast signatures with high security |
| ED25519 | 2020 | Supported | Supported | Enhanced key format with better structure |
| RS256 | RSA | Supported | Supported | Backward compatibility with legacy systems |
| ECC K1 | secp256k1 | Supported | Supported | Common in OpenID ecosystem |
| ECC R1 | secp256r1 | Planned | Planned | Strong elliptic curve variant |

**W3C Data Integrity 2.0 (Planned):**

| Algorithm | Support Status | Description |
|-----------|----------------|-------------|
| RS256 | Planned | JWS with canonicalized digest |
| EdDSA (Ed25519) | Planned | Based on JWS EdDSA |
| ES256K | Planned | JWS-based signing with secp256k1 |
| ES256 | Planned | Strong elliptic curve variant |

**SD-JWT Support:**

| Algorithm | Web (Login) | Guest Mode | Notes |
|-----------|------------|-----------|-------|
| RS256 | Supported | Supported | SD-JWT verification being integrated |
| ES256K | Supported | Supported | Selective Disclosure compatible |
| ES256 | Planned | Supported | Strong elliptic curve variant |
| EdDSA (Ed25519) | Supported | Supported | Not yet supported in Certify (issuer side) |
| x509 (PKI v3) | In Progress | In Progress | Advanced SD-JWT scenarios |

**JWT VC Support (Planned):**

| Algorithm | Support Status | Notes |
|-----------|----------------|-------|
| RS256 | Planned | Under VC-JWT compliance |
| ES256K | Planned | Awaiting certification |
| ES256 | Planned | Under consideration |
| x509 (PKI v3) | Planned | Public key in JWT header; x509 cert chain planned |

**mDoc/mDL Support (Planned):**

| Algorithm | Support Status | Use Case |
|-----------|----------------|----------|
| RS256 | Planned | Mobile document ecosystems |
| EdDSA (Ed25519) | Planned | Mobile identity contexts |
| ES256K | Planned | Driver license implementations |
| ES256 | Planned | High-security mobile documents |
| x509 (PKI v3) | Planned | X509 certificate chain |

### Core Features

| Feature | Status | Description |
|---------|--------|-------------|
| **Multiple Credential Formats** | Available | JSON-LD, SD-JWT, with JWT VC and mDL planned |
| **Credential Download** | Available | Direct download from OpenID4VCI issuers |
| **OpenID4VP Presentation** | Available (v0.15.0+) | Live presentation with verifiers |
| **PDF Download** | Available | Save credentials as PDFs with embedded QR codes |
| **Guest Mode** | Available | Download credentials without login (no persistent storage) |
| **Web Wallet Storage** | Available | Store credentials securely in logged-in sessions |
| **Flexible Authentication** | Available | Google OAuth or any OpenID-compliant IdP |

---

## Inji Verify (Credential Verifier)

Inji Verify is a web portal for verifying verifiable credentials, supporting both QR code-based and OpenID4VP presentation flows.

### Credential Data Models

| Standard | Version | Support Status | Description |
|----------|---------|----------------|-------------|
| **W3C VC Data Model** | 1.1 | Available | Current international standard for credential verification |
| **W3C VC Data Model** | 2.0 | Available | Latest specification with enhanced features |

### Verification Protocols

| Protocol | Version | Support Status | Description |
|----------|---------|----------------|-------------|
| **OpenID4VP** | Draft 23 | Available | Cross-device and same-device verifiable presentation flows |

### Credential Formats

| Format | Version | Status | Description |
|--------|---------|--------|-------------|
| **JSON-LD** | W3C 1.1/2.0 | Available | Linked Data credentials with semantic context |
| **SD-JWT** | IETF Draft | Available | Selective Disclosure JWT with privacy-preserving claim sharing |
| **mDoc/mDL** | ISO 18013-5/7 | Coming Soon | Mobile document and driver's license format |

### QR Code Standards

| Standard | Version | Support Status | Description |
|----------|---------|----------------|-------------|
| **Claim 169** | MOSIP Spec | Available | MOSIP specification for compact CBOR-encoded QR credentials |
| **CBOR** | - | Available | Concise Binary Object Representation for decoding QR data |

**QR Code Capabilities:**
- Scan QR codes directly from devices
- Upload QR code images (PDF, JPEG, JPG, PNG)
- Decode Claim 169-compliant credentials
- Display scanned credential details

### Cryptographic Verification

| Algorithm | Support Status | Description |
|-----------|----------------|-------------|
| **Ed25519** | Available | High-performance elliptic curve verification (2018 & 2020) |
| **RSA** | Available | RSA signature verification for broad compatibility |
| **ECC K1** | Available | Verification of secp256k1 signatures |

### Credential Verification Features

| Feature | Status | Description |
|---------|--------|-------------|
| **QR Code Verification** | Available | Scan or upload QR codes with Claim 169 support |
| **OpenID4VP Verification** | Available | Verify presentations from OpenID4VP flows |
| **Revocation Checking** | Available | Real-time status verification against issuer registries |
| **VC Format Verification** | Available (JSON-LD, SD-JWT) | Partial for mDoc/mDL (coming soon) |
| **Credential Display** | Available | SVG rendering with multilingual support (11 languages) |
| **MOSIP UIN VCs** | Available | Compatibility with MOSIP ecosystem credentials |
| **Offline Verification** | Coming Soon | BLE-based verifiable presentation for offline scenarios |

### Advanced Features

| Feature | Status | Description |
|---------|--------|-------------|
| **SDK Components** | Available | OpenID4VP VP Verification and Scan/Upload components as NPM modules |
| **Presentation Exchange** | Available | Query and match credentials based on verifier requirements |
| **Trust Assessment** | Available | Display issuer information and credential validation status |

---

## Cross-Module Standards Summary

### Comprehensive Standards Coverage Matrix

| Standard | Certify | Wallet Mobile | Wallet Web | Verify |
|----------|---------|---------------|-----------|--------|
| **W3C VC Data Model 1.1** | Available | Available | Available | Available |
| **W3C VC Data Model 2.0** | Available | Available | Planned | Available |
| **OpenID4VCI** | Available (Issuer) | Available (Client) | Available (Client) | - |
| **OpenID4VP** | - | Available (Client) | Available (Client) | Available (Server) |
| **OpenID4VP-BLE** | - | Available (Client) | - | Coming Soon (Server) |
| **OAuth 2.0 / OIDC** | Available | Available | Available | - |
| **JSON-LD VCs** | Available (Issue & Sign) | Available (Store & Present) | Available (Store & Present) | Available (Verify) |
| **Signed JWT (JWS)** | Available (Issue & Sign) | Partial (Read only) | Planned | Available (Verify) |
| **SD-JWT** | Available (Issue & Sign) | Available (Store & Present) | Available (Store & Present) | Available (Verify) |
| **ISO mDL/mDoc** | Planned (Issue & Sign) | Available (Store & Present) | Planned (Store & Present) | Planned (Verify) |
| **Claim 169 (QR)** | Planned (Issue & Encode) | Available (Display) | - | Available (Scan & Decode) |
| **W3C Bitstring Status List** | Available (Publish) | Available (Check) | Available (Check) | Available (Check) |
| **W3C DIDs** | Available | Available | Available | Available |
| **Ed25519 Signing** | Available | Available | Available | Available |
| **RSA Signing** | Available | Available | Available | Available |
| **ECC (K1, R1)** | Available | Available | Available | Available |

**Legend:**
Fully Available/Supported
Coming Soon (Next Releases)
Partial Support or Read-Only
Not Applicable

### Credential Lifecycle by Module

```
┌─────────────────────────────────────────────────────────────────┐
│                  CREDENTIAL LIFECYCLE                            │
├─────────────────────────────────────────────────────────────────┤
│                                                                   │
│  ISSUE (Certify)           STORE (Mobile/Web)    VERIFY (Verify) │
│  ───────────────           ──────────────────    ──────────────   │
│  • W3C VC 1.1/2.0          • W3C VC 1.1/2.0     • W3C VC 1.1/2.0 │
│  • OpenID4VCI              • OpenID4VCI          • OpenID4VP      │
│  • JSON-LD, JWT, SD-JWT    • JSON-LD, SD-JWT    • JSON-LD, SD-JWT│
│  • Sign with: RSA, Ed25519 • Present with:      • Verify: RSA,  │
│    ECC K1/R1               OpenID4VP, BLE       Ed25519, ECC    │
  │  • Claim 169 QR (Coming)   • Display SVG (Mob)   • Claim 169 QR  │
│                            • Offline Face Match  • Check Status  │
│                            • Revocation Check    │
│                                                                   │
└─────────────────────────────────────────────────────────────────┘
```

---

## Standards Support Timeline

### Current Release Status by Module

#### Inji Certify

| Version | Release Date | Major Standards Additions |
|---------|--------------|--------------------------|
| v0.8.0 | May 2024 | W3C VC 1.1, JSON-LD, OpenID4VCI (Draft 13) |
| v0.11.0 | May 2025 | Ed25519 (2018 & 2020), ECC K1, Keycloak integration |
| v0.12.0 | - | SD-JWT (Draft) |
| v0.13.0 | - | SD-JWT (Full), Enhanced OAuth 2.0 support |
| v0.14.0 | - | Claim 169 QR Code, mDoc/mDL (Initial) |
| **Upcoming** | - | W3C Data Integrity 2.0, Full mDoc/mDL support |

#### Inji Wallet Mobile

| Feature | Status | Standards |
|---------|--------|-----------|
| **Core Wallet** | Available | W3C VC 1.1/2.0, OpenID4VCI, OpenID4VP |
| **SD-JWT Support** | Available | IETF SD-JWT with selective disclosure |
| **mDL Support** | Available | ISO 18013-5, offline verification |
| **SVG Rendering** | Available | W3C VC Data Model 2.0 |
| **BLE Sharing** | Available | OpenID4VP-BLE (offline) |
| **Revocation** | Available | W3C Bitstring Status List |

#### Inji Wallet Web

| Feature | Status | Standards |
|---------|--------|-----------|
| **JSON-LD Support** | Available | W3C VC 1.1 |
| **SD-JWT Support** | Available | IETF SD-JWT |
| **OpenID4VP** | Available (v0.15.0+) | OpenID4VP (Draft 23) |
| **JWT VC** | Planned | JWT VC format |
| **Data Integrity 2.0** | Planned | W3C Data Integrity 2.0 |
| **W3C VC 2.0** | Planned | W3C VC Data Model 2.0 |

#### Inji Verify

| Feature | Status | Standards |
|---------|--------|-----------|
| **QR Code Verification** | Available | Claim 169, CBOR |
| **OpenID4VP Support** | Available | OpenID4VP (Draft 23) |
| **JSON-LD & SD-JWT** | Available | W3C VC 1.1/2.0, IETF SD-JWT |
| **SVG Rendering** | Available | W3C VC Data Model 2.0 |
| **mDoc/mDL** | Coming Soon | ISO 18013-5/7 |
| **Offline (BLE)** | Coming Soon | OpenID4VP-BLE |


---


<!--

## Key Interoperability Insights

### Cross-Ecosystem Verification

**Inji credentials are verifiable by:**
- Any W3C Verifiable Credential-compliant verifier
- Systems implementing OpenID4VP specification
- Microsoft Entra Verified ID
- Hyperledger Aries-based verifiers
- Trinsic and other commercial VC platforms
- Custom verifier applications implementing standards

**Why interoperability works:**
- W3C VC standard format (not proprietary to Inji)
- Standard cryptographic algorithms (EdDSA, RSA, ECDSA)
- Open protocols (OpenID4VCI/VP based on published specifications)
- DID support with standard DID methods

### Ecosystem Integration Points

| Integration | Module | Standard | Use Case |
|-------------|--------|----------|----------|
| **Issuer Integration** | Certify | OpenID4VCI + OAuth 2.0 | Connect external issuers and credential schemas |
| **Wallet Interop** | Mobile/Web | OpenID4VCI + OpenID4VP | Works with any standards-compliant wallet |
| **Verifier Interop** | Verify | OpenID4VP | Accept credentials from any standards-compliant issuer |
| **Trust Registry** | All | W3C DIDs | Discover and verify issuer identities |
| **Revocation Recovery** | All | W3C Bitstring Status List | Universal revocation checking |

---

## Roadmap: Upcoming Standards Support

### Near-Term (Next 2-3 Releases)

- **Inji Certify v0.14.0**: Claim 169 QR Code full support, mDoc/mDL initial implementation
- **Inji Web**: OpenID4VP enhancement, W3C Data Integrity 2.0 proofs
- **Inji Verify**: mDoc/mDL verification, BLE-based offline verification

### Medium-Term (6+ Months)

- **Full mDoc/mDL Support**: Complete ISO 18013-5/7 implementation across all modules
- **W3C Data Integrity 2.0**: Enhanced proof mechanisms in all modules
- **Post-Quantum Cryptography**: Preparation for quantum-safe algorithms
- **Advanced Privacy Features**: Zero-knowledge proofs, decentralized revocation

### Long-Term Strategic Directions

- **W3C VC 2.0 Universal Rollout**: Complete transition to V2.0 across ecosystem
- **BLE as Standard**: Offline credential sharing without internet dependency
- **Holder Binding v2**: Stronger binding mechanisms for credential linking
- **Trust Framework Evolution**: Multi-issuer PKI and federation support

---

## References

### W3C Specifications

| Specification | Link | Version |
|---------------|------|---------|
| Verifiable Credentials Data Model | https://www.w3.org/TR/vc-data-model/ | 1.1 (REC) |
| Verifiable Credentials Data Model 2.0 | https://www.w3.org/TR/vc-data-model-2.0/ | WD (Latest) |
| Decentralized Identifiers (DIDs) | https://www.w3.org/TR/did-core/ | 1.0 (REC) |
| Bitstring Status List v2.0 | https://www.w3.org/TR/vc-bitstring-status-list/ | REC |
| Data Integrity 1.0 | https://www.w3.org/TR/vc-data-integrity/ | ED |

### OpenID Foundation Specifications

| Specification | Link | Version |
|---------------|------|---------|
| OpenID4VCI | https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0-ID1.html | Draft 13 |
| OpenID4VP | https://openid.net/specs/openid-4-verifiable-presentations-1_0.html | Draft 23 |
| OpenID4VP (Offline) | https://tlodderstedt.github.io/openid-for-verifiable-presentations-offline-1_0-00.html | Draft |

### IETF Specifications

| Specification | Link | Version |
|---------------|------|---------|
| SD-JWT | https://datatracker.ietf.org/doc/html/draft-ietf-oauth-selective-disclosure-jwt | Draft |
| OAuth 2.0 | https://tools.ietf.org/html/rfc6749 | RFC 6749 |
| JSON Web Token (JWT) | https://tools.ietf.org/html/rfc7519 | RFC 7519 |

### ISO Standards

| Specification | Link | Version |
|---------------|------|---------|
| ISO/IEC 18013-5 (mDL) | https://www.iso.org/standard/69084.html | 2021 |
| ISO/IEC 18013-7 (mDoc) | https://www.iso.org/standard/80601.html | Under Development |

### MOSIP Standards

| Specification | Link | Version |
|---------------|------|---------|
| Claim 169 (QR Code) | https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification | Latest |

### Related Documentation

- [Inji Certify Overview & Features](https://docs.mosip.io/inji/inji-certify/overview)
- [Inji Wallet Mobile Overview & Features](https://docs.mosip.io/inji/inji-wallet/inji-mobile/overview)
- [Inji Wallet Web Overview & Features](https://docs.mosip.io/inji/inji-wallet/inji-web/overview)
- [Inji Verify Overview & Features](https://docs.mosip.io/inji/inji-verify/overview)
- [Release Notes & Version History](https://docs.mosip.io/inji/)

---

## About This Document

**Document Version**: 1.0
**Last Updated**: February 27, 2026
**Maintained By**: Inji Documentation Team
**Status**: Active (Updated with Latest Release Information)

This document consolidates standards and specifications information from:
- Inji module overview and features documentation
- Release notes and version changelogs
- Technical implementation guides
- Official W3C, OpenID, and ISO standards
- GitHub repositories and community contributions

---

**For the most current information on standards support, please refer to the individual module documentation pages and official release notes.**

-->