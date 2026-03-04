# Standards and Compliances Details

#### W3C Verifiable Credentials Data Model

Official Specification: - v1.1 (Recommendation, 2019): https://www.w3.org/TR/vc-data-model/ - v2.0 (Working Draft, latest): https://www.w3.org/TR/vc-data-model-2.0/

Overview: Industry-standard specification for expressing credentials as JSON-LD documents with W3C-compliant proof mechanisms. Defines the structure, semantics, and verification requirements for all digital credentials.

Why It Matters: - Universal credential format recognized across 30+ countries - Semantic interoperability via JSON-LD context - Foundation for all Inji credential types - Backwards compatible: v1.1 → v2.0 migration path

Supported By:

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Module</td><td valign="top">Status</td><td valign="top">Role</td></tr><tr><td valign="top">Certify</td><td valign="top">Available (both v1.1 &#x26; v2.0)</td><td valign="top">Issue credentials in W3C format</td></tr><tr><td valign="top">Mobile</td><td valign="top">Available (v1.1 &#x26; v2.0)</td><td valign="top">Store, display, and present credentials</td></tr><tr><td valign="top">Web</td><td valign="top">Available (v1.1, v2.0 planned v0.16.0)</td><td valign="top">Download and present in browser</td></tr><tr><td valign="top">Verify</td><td valign="top">Available (both v1.1 &#x26; v2.0)</td><td valign="top">Verify credential proofs and signatures</td></tr></tbody></table>

Key Aspects Across Implementation: - Supports multiple proof types: JSON-LD proofs, JWT, Data Integrity proofs - Credential structure: issuer, subject, claims, issued date, expiration - Holder binding: Proof of possession via cryptographic signatures - Selective disclosure: Latest v2.0 includes selective claim presentation.

#### OAuth 2.0 & OpenID Connect

Official Specifications: - OAuth 2.0 (RFC 6749): https://tools.ietf.org/html/rfc6749 - OpenID Connect 1.0 (OpenID Foundation): https://openid.net/connect/

Overview: OAuth 2.0 is the industry-standard authorization framework. OpenID Connect (OIDC) adds an authentication layer on top, enabling secure user login and identity delegation.

Why It Matters: - Enables federation: users login via eSignet, Google, Keycloak, etc. - Credential issuance tokens (access tokens) validated via OAuth - Authorization code flow for secure credential flows - Industry standard for 15+ years

Supported By:

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Module</td><td valign="top">Status</td><td valign="top">Role</td></tr><tr><td valign="top">Certify</td><td valign="top">Available</td><td valign="top">Authorization for credential issuance; OIDC login via eSignet</td></tr><tr><td valign="top">Mobile</td><td valign="top">Available</td><td valign="top">Authorization to download credentials from issuers</td></tr><tr><td valign="top">Web</td><td valign="top">Available</td><td valign="top">OAuth login (Google, OpenID providers); authorization for credential download</td></tr><tr><td valign="top">Verify</td><td valign="top">-</td><td valign="top">Not directly used (verification is post-issuance)</td></tr></tbody></table>

#### OpenID for Verifiable Credential Issuance (OpenID4VCI)

Official Specification: - Draft 13 (Latest stable): https://openid.net/specs/openid-4-verifiable-credential-issuance-1\_0-13.html

Overview: OpenID Foundation standard for securely delivering verifiable credentials to wallet holders. Extends OAuth 2.0 with credential-specific flows.

Why It Matters: - Standardized credential distribution protocol (not proprietary) - Multiple issuance flows: pre-authorized (fast), authorization code (secure) - Supports multiple credential formats: JSON-LD, JWT, SD-JWT, mDoc - Enable interoperability: any OpenID4VCI issuer can issue to any OpenID4VCI-compliant wallet

Supported By:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Module</td><td valign="bottom">Status</td><td valign="bottom">Role</td></tr><tr><td valign="bottom">Certify</td><td valign="bottom">Available (v0.8.0+)</td><td valign="bottom">Issue credentials to holders via standardized protocol</td></tr><tr><td valign="bottom">Mobile</td><td valign="bottom">Available (v0.8.0+)</td><td valign="bottom">Download credentials from OpenID4VCI-compliant issuers</td></tr><tr><td valign="bottom">Web</td><td valign="bottom">Available (v0.8.0+)</td><td valign="bottom">Download credentials in browser without app</td></tr><tr><td valign="bottom">Verify</td><td valign="bottom">-</td><td valign="bottom">Not applicable (verifier receives credentials, not issues)</td></tr></tbody></table>

#### OpenID for Verifiable Presentations (OpenID4VP)

Official Specification: - Draft 23 (Latest stable): https://openid.net/specs/openid-4-verifiable-presentations-1\_0-23.html

Overview: OpenID Foundation standard for requesting and receiving verifiable presentations. Enables verifiers to request credentials from holders in a standardized way.

Why It Matters: - Standardized presentation protocol (holders and verifiers can interoperate) - Multiple presentation modes: cross-device (QR), same-device (app-to-app), BLE (offline) - Selective disclosure: verifier specifies which claims are needed; holder discloses only those - Replaces proprietary presentation workflows

Supported By:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Module</td><td valign="bottom">Status</td><td valign="bottom">Role</td></tr><tr><td valign="bottom">Certify</td><td valign="bottom">-</td><td valign="bottom">Not applicable</td></tr><tr><td valign="bottom">Mobile</td><td valign="bottom">Available (v0.9.0+)</td><td valign="bottom">Present credentials to verifiers via QR, same-device, or BLE</td></tr><tr><td valign="bottom">Web</td><td valign="bottom">Available (v0.15.0+)</td><td valign="bottom">Present credentials from browser to verifier web portals</td></tr><tr><td valign="bottom">Verify</td><td valign="bottom">Available (v0.17.0+)</td><td valign="bottom">Request and verify presentations from holders</td></tr></tbody></table>

#### OpenID4VP-BLE (Offline Presentation)

Specification: - Extension to OpenID4VP Draft 23: https://github.com/openid/OpenID4VP (offline extensions)

Overview: Extension to OpenID4VP enabling offline credential presentation via Bluetooth Low Energy (BLE). Allows holders to present credentials without internet connectivity.

Why It Matters: - Credentials work in low-connectivity scenarios (refugee camps, remote borders, field verification) - BLE direct P2P communication: no server required - Same cryptographic validation as online presentations - Critical for humanitarian and border control use cases

Supported By:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Module</td><td valign="bottom">Status</td><td valign="bottom">Role</td></tr><tr><td valign="bottom">Certify</td><td valign="bottom">-</td><td valign="bottom">Not applicable</td></tr><tr><td valign="bottom">Mobile</td><td valign="bottom">Available (v0.14.0+)</td><td valign="bottom">Present credentials via BLE when verifier unavailable</td></tr><tr><td valign="bottom">Web</td><td valign="bottom">-</td><td valign="bottom">Browser cannot use BLE (security model limitation)</td></tr><tr><td valign="bottom">Verify</td><td valign="bottom">Planned (v0.18.0)</td><td valign="bottom">Receive and validate offline BLE presentations</td></tr></tbody></table>

#### W3C Decentralized Identifiers (DIDs)

Official Specification: - W3C DID Core 1.0 (Recommendation, 2021): https://www.w3.org/TR/did-core/

Overview: W3C standard for creating self-sovereign, decentralized identifiers independent of any centralized directory. Format: did:method:identifier (e.g., did:mosip:123456).

Why It Matters: - Issuer identity verification: verifiers can resolve issuer DIDs to public keys - Self-sovereign identity: no government or company controls the identifier - Decentralized: DID methods can use blockchains, DIRs, or proprietary registries - Cryptographic verification: public keys are resolvable and verifiable

Supported By:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Module</td><td valign="bottom">Status</td><td valign="bottom">Role</td></tr><tr><td valign="bottom">Certify</td><td valign="bottom">Available (v0.8.0+)</td><td valign="bottom">Issuers publish DIDs and sign credentials with DID keys</td></tr><tr><td valign="bottom">Mobile</td><td valign="bottom">Available (v0.9.0+)</td><td valign="bottom">Verify issuer DIDs; resolve issuer public keys for signature validation</td></tr><tr><td valign="bottom">Web</td><td valign="bottom">Available</td><td valign="bottom">Verify issuer DIDs; support for holder-bound DIDs</td></tr><tr><td valign="bottom">Verify</td><td valign="bottom">Available</td><td valign="bottom">Resolve issuer DIDs; validate signatures against DID-published keys</td></tr></tbody></table>

Supported DID Methods: - did:mosip: – MOSIP-based identifiers (primary for Inji in MOSIP deployments) - did:ion: – Layer 2 DID method (Sidetree-based, interoperable) - did:key: – Embedded key DIDs (for testing and simple cases)

#### JSON-LD (Linked Data for JSON)

Official Specification: - JSON-LD 1.1 (W3C Recommendation, 2020): https://www.w3.org/TR/json-ld11/

Overview: Framework for representing linked data in JSON format using semantic contexts. Enables shared understanding of data semantics across different systems.

Why It Matters: - Semantic interoperability: different systems understand the same data meaning - URI-based vocabularies: claims like name, birthDate are URIs, not ambiguous strings - Linked data: credentials can reference other credentials, forming knowledge graphs - W3C VC Data Model 1.1 recommendation

Supported By:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Module</td><td valign="bottom">Status</td><td valign="bottom">Role</td></tr><tr><td valign="bottom">Certify</td><td valign="bottom">Available</td><td valign="bottom">Credentials issued in JSON-LD format with semantic contexts</td></tr><tr><td valign="bottom">Mobile</td><td valign="bottom">Available</td><td valign="bottom">Store and display credentials with semantic understanding</td></tr><tr><td valign="bottom">Web</td><td valign="bottom">Available</td><td valign="bottom">Display credentials in human-readable format via JSON-LD context</td></tr><tr><td valign="bottom">Verify</td><td valign="bottom">Available</td><td valign="bottom">Verify credentials and validate semantic claims</td></tr></tbody></table>

#### Selective Disclosure JWT (SD-JWT)

Official Specification: - IETF Internet-Draft: https://datatracker.ietf.org/doc/html/draft-ietf-oauth-selective-disclosure-jwt

Overview: Privacy-first JWT format where credential holder can selectively disclose claims to verifiers. Claims are salted and hashed; holder reveals only requested ones with proof.

Why It Matters: - Privacy: holder doesn’t share unnecessary claims (e.g., shares age verification without exposing birthdate) - Cryptographic proof: verifier can validate disclosed claims without seeing undisclosed ones - Compact: much smaller than full credential with filtered fields - IETF standardization path (moving toward RFC status)

Supported By:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Module</td><td valign="bottom">Status</td><td valign="bottom">Role</td></tr><tr><td valign="bottom">Certify</td><td valign="bottom">Available (v0.12.0+)</td><td valign="bottom">Issue SD-JWT credentials with selectively disclosable claims</td></tr><tr><td valign="bottom">Mobile</td><td valign="bottom">Available (v0.10.0+)</td><td valign="bottom">Store SD-JWT and present only disclosed claims on verifier request</td></tr><tr><td valign="bottom">Web</td><td valign="bottom">Available (v0.15.0+)</td><td valign="bottom">Present SD-JWT credentials with selective disclosure</td></tr><tr><td valign="bottom">Verify</td><td valign="bottom">Available (v0.17.0+)</td><td valign="bottom">Verify SD-JWT presentations and validate selective disclosure proofs</td></tr></tbody></table>

#### W3C Bitstring Status List 2.0

Official Specification: - W3C Specification: https://www.w3.org/TR/vc-bitstring-status-list/

Overview: Efficient revocation mechanism for credentials. Issuer publishes a bitstring (array of bits) where each bit represents revocation status of one credential. Credentials reference their bit position.

Why It Matters: - Scalable revocation: millions of credentials’ status in one compact bitstring - Privacy: doesn’t reveal which credentials are revoked (just a bitstring) - Efficient: holders check one bitstring vs querying issuer for each credential - Universal: works with any credential format

Supported By:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Module</td><td valign="bottom">Status</td><td valign="bottom">Role</td></tr><tr><td valign="bottom">Certify</td><td valign="bottom">Available (v0.10.0+)</td><td valign="bottom">Publish revocation bitstrings; encode status list endpoint in credentials</td></tr><tr><td valign="bottom">Mobile</td><td valign="bottom">Available (v0.10.0+)</td><td valign="bottom">Check bitstring status before presenting credentials</td></tr><tr><td valign="bottom">Web</td><td valign="bottom">Available (v0.15.0+)</td><td valign="bottom">Validate credential status via bitstring check</td></tr><tr><td valign="bottom">Verify</td><td valign="bottom">Available (v0.17.0+)</td><td valign="bottom">Verify credential status before accepting presentations</td></tr></tbody></table>

#### CBOR (Concise Binary Object Representation)

Official Specification: - RFC 7049: https://tools.ietf.org/html/rfc7049

Overview: Binary data serialization format similar to JSON but more compact. Maps, arrays, strings encoded in few bytes. Foundation for QR code and offline credential encoding.

Why It Matters: - Compact: CBOR payloads 30-50% smaller than JSON equivalents - QR-friendly: smaller data = more dense QR codes = easier to scan - Efficient parsing: lightweight protocol ideal for low-power devices - CWT foundation: CBOR tokens used for signed credentials

Supported By:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Module</td><td valign="bottom">Status</td><td valign="bottom">Role</td></tr><tr><td valign="bottom">Certify</td><td valign="bottom">Available (v0.14.0+)</td><td valign="bottom">Encode Claim 169 QR credentials in CBOR format</td></tr><tr><td valign="bottom">Mobile</td><td valign="bottom">Available (v0.10.0+)</td><td valign="bottom">Decode and store CBOR-encoded QR payloads</td></tr><tr><td valign="bottom">Web</td><td valign="bottom">-</td><td valign="bottom">Not applicable (browsers handle JSON, not CBOR directly)</td></tr><tr><td valign="bottom">Verify</td><td valign="bottom">Available (v0.17.0+)</td><td valign="bottom">Decode CBOR QR codes; validate CBOR structure</td></tr></tbody></table>

#### CBOR Web Token (CWT) & COSE Signing

Official Specification: - RFC 8152 (now 9052/9053): https://tools.ietf.org/html/rfc8152

Overview: CBOR-based equivalent of JWT. Uses COSE (CBOR Object Signing and Encryption) for authenticated encryption and signing. Standard for signed CBOR credentials.

Why It Matters: - Compact signed credentials: signatures included in CBOR payload - IANA standard: Ed25519 and P-256 signatures registered - Claim 169 standard: Claim 169 QR codes use CWT signing - Offline verification: credentials carry proofs, no server needed

Supported By:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Module</td><td valign="bottom">Status</td><td valign="bottom">Role</td></tr><tr><td valign="bottom">Certify</td><td valign="bottom">Planned (v0.14.0)</td><td valign="bottom">Issue Claim 169 credentials with CWT signatures</td></tr><tr><td valign="bottom">Mobile</td><td valign="bottom">Available (v0.10.0+)</td><td valign="bottom">Verify CWT signatures on Claim 169 QR codes</td></tr><tr><td valign="bottom">Web</td><td valign="bottom">-</td><td valign="bottom">Not directly used (JSON-based credentials in web)</td></tr><tr><td valign="bottom">Verify</td><td valign="bottom">Available (v0.17.0+)</td><td valign="bottom">Validate CWT signatures on Claim 169 QR presentations</td></tr></tbody></table>

#### Claim 169: MOSIP QR Code Specification

Official Specification: - MOSIP v1.2.0 (Latest, Sept 2025): https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification - v1.1.0: https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification-1 - v1.0.0: https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specifications-1.0.0

Overview: IANA-registered MOSIP standard for compact, cryptographically-signed identity QR codes. Encodes identity attributes in CBOR format, signed with Ed25519 or ECC, embeddable in QR codes.

Why It Matters: - Humanitarian focus: v1.2.0 adds refugee-specific attributes (legal status, secondary language, location code) - Offline verification: QR contains full credential + proof; no server needed - Standardized encoding: 23 identity attributes in compact CBOR format - IANA official: Registered as IANA CWT claim, interoperable across systems

Evolution: - v1.0.0 (2024): Basic 18 attributes (ID, name, DOB, gender, address, nationality, etc.) - v1.1.0 (2024): Enhanced security documentation; same 18 attributes - v1.2.0 (Sept 2025): Added 5 humanitarian attributes (legal status, secondary language, location code, country of issuance, secondary language name); expanded working group (UNHCR, GIZ, OpenSPP)

Supported By:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Module</td><td valign="bottom">Status</td><td valign="bottom">Role</td></tr><tr><td valign="bottom">Certify</td><td valign="bottom">Planned (v0.14.0)</td><td valign="bottom">Encode and sign Claim 169 QR credentials in CBOR-CWT format</td></tr><tr><td valign="bottom">Mobile</td><td valign="bottom">Available (v0.10.0+)</td><td valign="bottom">Receive Claim 169 QR credentials from issuers; store and display QR blocks</td></tr><tr><td valign="bottom">Web</td><td valign="bottom">-</td><td valign="bottom">Not applicable (QR-based credentials are mobile-centric)</td></tr><tr><td valign="bottom">Verify</td><td valign="bottom">Available (v0.17.0+)</td><td valign="bottom">Scan or upload Claim 169 QR codes; decode CBOR; validate signatures</td></tr></tbody></table>

Claim 169 QR Structure (v1.2.0): - Attributes 1-18: Standard identity (name, DOB, address, nationality, etc.) - Attribute 19: Full Name - Secondary Language - Attribute 20: Secondary Language Code - Attribute 21: Location Code - Attribute 22: Legal Status (refugee, asylum seeker, stateless, etc.) - Attribute 23: Country of Issuance - Encryption: CBOR-encoded, optionally encrypted - Signature: Ed25519 or ECC proof

#### ISO 18013-5/7: Mobile Document Standards (mDL & mDoc)

Official Specifications: - ISO 18013-5:2021 (Mobile Driver’s License): https://www.iso.org/standard/69084.html - ISO 18013-7 (Gen Proof Signatures): https://www.iso.org/standard/80601.html

Overview: ISO international standards for mobile identity documents (driver licenses, general documents, travel credentials). Credentials stored in CBOR format, verified offline via NFC or QR.

Why It Matters: - Government standard: used for border control, aviation, age verification - Offline verification: full credential + proof in device, no server dependency - Biometric binding: holder’s face/fingerprint linked to credential - Interoperable: any ISO 18013-compliant reader can verify (border gates, airports)

Supported By:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Module</td><td valign="bottom">Status</td><td valign="bottom">Role</td></tr><tr><td valign="bottom">Certify</td><td valign="bottom">Planned (v0.14.0+)</td><td valign="bottom">Issue ISO mDL/mDoc credentials in CBOR format</td></tr><tr><td valign="bottom">Mobile</td><td valign="bottom">Available (v0.12.0+)</td><td valign="bottom">Store mDL credentials; support NFC/BLE presentation to readers</td></tr><tr><td valign="bottom">Web</td><td valign="bottom">Planned (v0.16.0+)</td><td valign="bottom">Display mDoc credentials (note: NFC is not browser-available)</td></tr><tr><td valign="bottom">Verify</td><td valign="bottom">Planned (v0.18.0+)</td><td valign="bottom">Verify mDL/mDoc credentials from NFC or QR presentation</td></tr></tbody></table>

Key Difference from W3C VC: - W3C VC: JSON-LD based, semantic, flexible - ISO mDL/mDoc: Binary (CBOR) based, cryptographically compact, government-focused

#### W3C Data Integrity 2.0

Official Specification: - W3C Working Draft: https://www.w3.org/TR/vc-data-integrity/

Overview: Emerging W3C specification for cryptographic proofs on JSON-LD documents using JWS (JSON Web Signature) formats. More flexible than JSON-LD Proofs; supports Ed25519, RSA, ECDSA.

Why It Matters: - Modern proof mechanisms: moves beyond legacy JSON-LD proof suites - Standardized JWS integration: aligns with JWT/SD-JWT ecosystem - Planned for W3C VC 2.0 adoption - Backward compatible: works with existing VC infrastructure

Supported By:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Module</td><td valign="bottom">Status</td><td valign="bottom">Role</td></tr><tr><td valign="bottom">Certify</td><td valign="bottom">Planned (v0.15.0+)</td><td valign="bottom">Issue credentials with Data Integrity 2.0 proofs</td></tr><tr><td valign="bottom">Mobile</td><td valign="bottom">Planned (v0.16.0+)</td><td valign="bottom">Verify Data Integrity proofs on credentials</td></tr><tr><td valign="bottom">Web</td><td valign="bottom">Planned (v0.16.0+)</td><td valign="bottom">Display and verify Data Integrity proofs</td></tr><tr><td valign="bottom">Verify</td><td valign="bottom">Planned (v0.18.0+)</td><td valign="bottom">Validate Data Integrity 2.0 signed credentials</td></tr></tbody></table>

#### JWT (JSON Web Token)

Official Specification: - RFC 7519: https://tools.ietf.org/html/rfc7519

Overview: Compact, self-contained format for securely transmitting information as JSON. Consists of header (algorithm), payload (claims), signature (HMAC or asymmetric).

Why It Matters: - Industry standard since 2015: understood by every OAuth/OIDC system - Compact: smaller than W3C VC format, ideal for constrained networks - Stateless verification: signature validates entire token - Foundation for SD-JWT, W3C Data Integrity, JWS

Supported By:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Module</td><td valign="bottom">Status</td><td valign="bottom">Role</td></tr><tr><td valign="bottom">Certify</td><td valign="bottom">Available (v0.8.0+)</td><td valign="bottom">Issue JWT-formatted credentials (JWT-VC format)</td></tr><tr><td valign="bottom">Mobile</td><td valign="bottom">Available (v0.9.0+)</td><td valign="bottom">Store JWT credentials; verify JWT signatures</td></tr><tr><td valign="bottom">Web</td><td valign="bottom">Available (v0.15.0+)</td><td valign="bottom">Display and present JWT credentials</td></tr><tr><td valign="bottom">Verify</td><td valign="bottom">Available (v0.17.0+)</td><td valign="bottom">Verify JWT signatures</td></tr></tbody></table>

#### Cryptographic Algorithms

Supported algorithms across Inji modules:

**EdDSA (Ed25519 & Ed448)**

Specification: - RFC 8032: https://tools.ietf.org/html/rfc8032

Why It Matters: - Modern elliptic curve: 10x smaller key sizes than RSA-2048 (32 bytes vs 256 bytes) - High performance: faster signing/verification than RSA - Quantum-resistant-ready: smaller key space reduces future quantum threat - W3C recommended for new implementations

Support:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Algorithm</td><td valign="bottom">Version</td><td valign="bottom">Certify</td><td valign="bottom">Mobile</td><td valign="bottom">Web</td><td valign="bottom">Verify</td><td valign="bottom">Notes</td></tr><tr><td valign="bottom">Ed25519</td><td valign="bottom">2018 Spec</td><td valign="bottom">Available</td><td valign="bottom">Available</td><td valign="bottom">Available</td><td valign="bottom">Available</td><td valign="bottom">Legacy format, still supported</td></tr><tr><td valign="bottom">Ed25519</td><td valign="bottom">2020 Spec</td><td valign="bottom">Available (v0.11.0+)</td><td valign="bottom">Available</td><td valign="bottom">Available</td><td valign="bottom">Available</td><td valign="bottom">Enhanced key format, recommended</td></tr></tbody></table>

**ECDSA (Elliptic Curve DSA)**

Specification: - FIPS 186-4: https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.186-4.pdf

Why It Matters: - Standardized elliptic curves: P-256 (secp256r1), secp256k1 - Balance: stronger than DSA, smaller keys than RSA - Interoperable: widely supported in blockchain and OpenID ecosystem

Support:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Algorithm</td><td valign="bottom">Curve</td><td valign="bottom">Certify</td><td valign="bottom">Mobile</td><td valign="bottom">Web</td><td valign="bottom">Verify</td><td valign="bottom">Notes</td></tr><tr><td valign="bottom">ECDSA</td><td valign="bottom">secp256k1 (K1)</td><td valign="bottom">Available (v0.11.0+)</td><td valign="bottom">Available</td><td valign="bottom">Available</td><td valign="bottom">Available</td><td valign="bottom">OpenID ecosystem standard</td></tr><tr><td valign="bottom">ECDSA</td><td valign="bottom">P-256 (R1)</td><td valign="bottom">Available (v0.11.0+)</td><td valign="bottom">Available</td><td valign="bottom">Planned</td><td valign="bottom">Available</td><td valign="bottom">NIST standard</td></tr><tr><td valign="bottom">ECDSA</td><td valign="bottom">P-384</td><td valign="bottom">Planned</td><td valign="bottom">Planned</td><td valign="bottom">Planned</td><td valign="bottom">Planned</td><td valign="bottom">High-security variant</td></tr></tbody></table>

**RSA (Rivest-Shamir-Adleman)**

Specification: - RFC 8017: https://tools.ietf.org/html/rfc8017

Why It Matters: - Mature standard: 30+ years, broad compatibility - FIPS compliant: required for US government systems - Proven security: no known mathematical breakthroughs - Legacy support: many existing credentials use RSA

Support:

<table data-header-hidden><thead><tr><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Key Size</td><td valign="bottom">Certify</td><td valign="bottom">Mobile</td><td valign="bottom">Web</td><td valign="bottom">Verify</td><td valign="bottom">Notes</td></tr><tr><td valign="bottom">RSA-2048</td><td valign="bottom">Available</td><td valign="bottom">Available</td><td valign="bottom">Available</td><td valign="bottom">Available</td><td valign="bottom">Minimum secure size</td></tr><tr><td valign="bottom">RSA-4096</td><td valign="bottom">Available</td><td valign="bottom">Available</td><td valign="bottom">Available</td><td valign="bottom">Available</td><td valign="bottom">High security, slower</td></tr></tbody></table>

Note: RSA keys are 4-8x larger than Ed25519; use Ed25519 for new credentials.
