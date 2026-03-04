---
hidden: true
---

# Standards, Specifications and Compliance

## Standards Implemented in Certify

Inji Certify is the credential issuer module. It enables organizations to issue digitally signed, standards-compliant verifiable credentials at scale. Certify is the origination point for all credentials that flow through the Inji ecosystem.

### **W3C Verifiable Credentials Data Model**

Specification: https://www.w3.org/TR/vc-data-model/ (See Standards Library for details)

Certify-Specific Implementation:

·      Credential Issuance: Full support for both v1.1 and v2.0 credential structures

·      Proof Types: JSON-LD Proofs, JWT, SD-JWT, planned Data Integrity 2.0

·      Automatic Versioning: Can issue v1.1 credentials for legacy systems or v2.0 for modern deployments

·      Multi-Format Support: Same credential content can be delivered in JSON-LD, JWT, or SD-JWT based on holder request

·      SVG Rendering Templates: v2.0 credentials can include SVG-based display templates for visual rendering in wallets

·      Semantic Contexts: Custom JSON-LD contexts for domain-specific vocabularies (e.g., educational credentials, health credentials)

·      Credential Status: Includes revocation status endpoint referencing W3C Bitstring Status List

Release Timeline: - v0.8.0+: W3C VC 1.1 support - v0.11.0+: Full W3C VC 2.0 support - Ongoing: Enhanced proof mechanisms, new credential types

### **OAuth 2.0 & OpenID Connect**

Specification: https://tools.ietf.org/html/rfc6749, https://openid.net/connect/ (See Standards Library for details)

Certify-Specific Implementation:

·      Authorization Code Flow: Secure user login and credential issuance authorization

·      OIDC Integration: eSignet integration for federated identity; supports Google OAuth, Keycloak, custom OIDC providers

·      Token Validation: Issued access tokens validated against configured identity provider

·      Scope Management: Fine-grained scopes for different credential types and issuance flows

·      Pre-Authorized Code Flow: Direct issuance without full OIDC flow (speed for certain deployment scenarios)

·      User Binding: Credentials bound to authenticated user identity

### **OpenID4VCI (Verifiable Credential Issuance)**

Specification: https://openid.net/specs/openid-4-verifiable-credential-issuance-1\_0-13.html (See Standards Library for details)

Certify-Specific Implementation:

·      Credential Endpoint (/credential): Responds to credential requests from wallet holders

·      Batch Issuance: Issue multiple credentials in single request

·      Multiple Formats: Issue JSON-LD, JWT, or SD-JWT based on holder capability and issuer policy

·      Credential Offer: Generate shareable credential\_offer URIs that wallets can accept

·      Authorization Server Integration: Pluggable authorization (eSignet, Keycloak, custom OAuth 2.0)

·      Deferred Issuance: Support for issuance transactions that complete over time

·      Proof Validation: Require holders to prove key possession during issuance

·      Response Metadata: Provide issuance details (accepted algorithms, supported formats, etc.)

Release Info: Available since v0.8.0; enhanced with each release

### **W3C DIDs (Decentralized Identifiers)**

Specification: https://www.w3.org/TR/did-core/ (See Standards Library for details)

Certify-Specific Implementation:

·      DID Publishing: Issuers publish their DID as credential issuer identifier

·      Key Publication: DIDs resolve to public key material for signature verification

·      DID Methods Supported: did:mosip, did:ion, did:key (method-specific implementations)

·      Credential Context: All credentials include ‘issuer’ field with issuer DID

·      Key Rotation: Support for DID key rotation while maintaining credential validation

·      Interoperability: DIDs follow W3C DID specification for universal recognition

### **JSON-LD (Linked Data)**

Specification: https://www.w3.org/TR/json-ld11/ (See Standards Library for details)

Certify-Specific Implementation:

·      Credential Context: Custom JSON-LD contexts for domain-specific vocabularies

·      Semantic Mapping: Map credential attributes to standard URIs (schema.org, FOAF, custom vocabularies)

·      Linked Data Processing: Support for @context, @id, @type in credential structure

·      Extensibility: Custom vocabularies without breaking interoperability

·      Human-Readable Output: Credentials include human-friendly labels alongside URIs

### **Selective Disclosure JWT (SD-JWT)**

Specification: https://datatracker.ietf.org/doc/html/draft-ietf-oauth-selective-disclosure-jwt (See Standards Library for details)

Certify-Specific Implementation:

·      SD-JWT Issuance: Issue credentials with selectively-disclosable claims

·      Salt & Hash Structure: Each claim salted and hashed for selective disclosure

·      Discloser Binding: Support for listing which claims verifier may request

·      Claim Encryption: Optional encryption of undisclosed claims

·      Fallback Disclosure: Holder can disclose claims not explicitly requested (if issuer allows)

·      Release Timeline: Drafts in v0.12.0, full support v0.13.0+

### **W3C Bitstring Status List**

Specification: https://www.w3.org/TR/vc-bitstring-status-list/ (See Standards Library for details)

Certify-Specific Implementation:

·      Status List Publishing: Publish credential revocation status as bitstring

·      Credential Status Entry: Credentials include reference to status list (list ID + position)

·      Revocation API: Endpoint (/revoke) to revoke issued credentials

·      Bitstring Format: Binary format with efficient indexing for 1M+ credentials

·      Privacy Preservation: Bitstring doesn’t reveal which specific credentials are revoked

·      Distribution: Status list hosted and distributed by issuer

### **CBOR (Concise Binary Object Representation)**

Specification: https://tools.ietf.org/html/rfc7049 (See Standards Library for details)

Certify-Specific Implementation:

·      Claim 169 Encoding: Encode identity attributes in CBOR format for QR embedding

·      Compact Payload: CBOR-encoded credentials 30-50% smaller than JSON

·      QR Size Optimization: Compact encoding ensures QR codes remain scannable

·      Release Timeline: Claim 169 support planned v0.14.0

### **CWT/COSE (CBOR Web Token & Object Signing and Encryption)**

Specification: https://tools.ietf.org/html/rfc8152 (See Standards Library for details)

Certify-Specific Implementation:

·      Claim 169 Signing: Sign CBOR-encoded identity QR codes with CWT/COSE signatures

·      Ed25519 Signing: Use Ed25519 algorithm for Claim 169 signatures (IANA-registered)

·      Signature Validation: Digital signatures embedded in CBOR payload for offline verification

·      Release Timeline: Planned v0.14.0 with Claim 169 support

### **Claim 169: MOSIP QR Code Specification**

Specification: https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification (See Standards Library for details)

Certify-Specific Implementation:

·      QR Encoding: Encode identity credentials as Claim 169-compliant CBOR-CWT QR codes

·      Attribute Support: Support all 23 attributes (v1.2.0):

o   Standard 18 identity attributes (name, DOB, nationality, address, etc.)

o   Humanitarian focus: legal status, secondary language, location code

·      Signature Schema: Ed25519 or ECC signatures for offline verification

·      QR Embedding: Claim 169 QR can be embedded in W3C credentials as supplementary format

·      Multi-QR Support: Single credential can contain multiple Claim 169 QRs (different use cases)

·      Release Timeline: Planned v0.14.0

### **JWT (JSON Web Token)**

Specification: https://tools.ietf.org/html/rfc7519 (See Standards Library for details)

Certify-Specific Implementation:

·      JWT-VC Issuance: Issue credentials in JWT (not JSON-LD) format

·      Claims in JWT: Credential structure mapped to JWT claims structure

·      Compact Distribution: JWT smaller and faster than JSON-LD equivalent

·      Signature Algorithm Selection: Support Ed25519, RSA, ECDSA signing algorithms

·      Token Expiration: exp claim for credential lifetime management

### **Cryptographic Algorithms (Signing)**

Certify-Specific Implementation:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Algorithm</td><td valign="bottom">Version</td><td valign="bottom">Status</td><td valign="bottom">Use Case</td></tr><tr><td valign="bottom">Ed25519</td><td valign="bottom">2018 Spec</td><td valign="bottom">Available</td><td valign="bottom">Modern, high-performance signing</td></tr><tr><td valign="bottom">Ed25519</td><td valign="bottom">2020 Spec</td><td valign="bottom">Available (v0.11.0+)</td><td valign="bottom">Enhanced key format, recommended</td></tr><tr><td valign="bottom">RSA</td><td valign="bottom">2048-bit</td><td valign="bottom">Available</td><td valign="bottom">FIPS 140-2 compliance, legacy systems</td></tr><tr><td valign="bottom">RSA</td><td valign="bottom">4096-bit</td><td valign="bottom">Available</td><td valign="bottom">High-security deployments</td></tr><tr><td valign="bottom">ECDSA</td><td valign="bottom">secp256k1</td><td valign="bottom">Available (v0.11.0+)</td><td valign="bottom">OpenID ecosystem, blockchain-compatible</td></tr><tr><td valign="bottom">ECDSA</td><td valign="bottom">P-256</td><td valign="bottom">Available (v0.11.0+)</td><td valign="bottom">NIST standard, high security</td></tr><tr><td valign="bottom">ECDSA</td><td valign="bottom">P-384</td><td valign="bottom">Planned</td><td valign="bottom">Enhanced security variant</td></tr></tbody></table>

### **W3C Data Integrity 2.0 (Planned)**

Specification: https://www.w3.org/TR/vc-data-integrity/ (See Standards Library for details)

Certify-Specific Implementation (Planned v0.15.0+):

·      JWS-Based Proofs: Migrate from JSON-LD Proofs to JWS-based Data Integrity proofs

·      Algorithm Support: Ed25519, RSA, ECDSA with Data Integrity 2.0 format

·      Canonical JSON: Canonicalized JSON-LD before signing (prevents tampering)

·      Backward Compatibility: Continue issuing JSON-LD Proofs for legacy systems
