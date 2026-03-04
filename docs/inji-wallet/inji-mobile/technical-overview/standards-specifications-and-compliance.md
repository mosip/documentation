---
hidden: true
---

# Standards, Specifications and Compliance



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