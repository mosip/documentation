---
hidden: true
---

# Standards, Specifications and Compliance


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

