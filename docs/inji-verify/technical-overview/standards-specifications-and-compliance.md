---
hidden: true
---

# Standards, Specifications and Compliance

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