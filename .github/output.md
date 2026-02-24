# New Features for Inji Certify (Finetuned from input.md)

## Core Features

### Presentation During Issuance

Strengthen trust and security in credential issuance workflows by requiring presentation of an existing Verifiable Credential as proof before issuing a new credential.

- **Presentation Request**: Request the presentation of an existing VC from the wallet as part of issuing a new credential
- **Internal Presentation Verification**: Submitted VC presentations are verified internally by Inji Certify before triggering issuance
- **Conditional Issuance**: Automatic issuance and delivery of a new VC upon successful verification of the presented credential
- **Trust-Based Workflows**: Enable advanced, trust-first issuance flows for richer and more secure credential ecosystems
- **Standards Compliance**: Enabled using OpenID4VCI and Presentation Exchange standards for maximum interoperability

### QR Code-Based Credential Issuance (Claim 169)

Issue privacy-preserving credentials via standardized QR codes, enabling offline and low-connectivity credential access.

- **Claim 169 QR Generation**: Encode issued VCs into Claim 169–compliant QR codes that adhere to global standards for machine-readable identity
- **CBOR-CWT Encoding**: Support for compact, privacy-preserving CBOR Web Token encoding of credential data
- **Offline Accessibility**: Improve usability in offline or low-connectivity environments through QR code–based delivery
- **Standard-Based Issuance**: Delivery of QR-encoded credentials aligned with interoperable QR specifications
- **Ecosystem Compatibility**: Wallets and verification tools can request and obtain credentials by scanning Claim 169–formatted QR codes

### Pre-Authorized Code Flow

Streamline credential issuance with pre-authorized codes, eliminating re-authentication for trusted workflows.

- **Pre-Authorized Credential Offers**: Generate credential offers containing pre-authorized codes that wallets use to obtain access tokens and request VCs
- **Simplified User Experience**: Users who have already been verified by the issuer receive credentials without re-authenticating during issuance
- **Flexible Delivery Methods**: Support for multiple delivery channels including QR codes and deep links
- **Transaction Code Support**: Optional PIN/transaction code requirement during credential redemption for additional security
- **OpenID4VCI Standards-Based**: Implements the OpenID4VCI pre-authorized code flow for credential offer redemption and issuance


## Standards, Specifications and Compliance

### Issuance Protocols (additions)

| Protocol | Status | Description |
|----------|--------|-------------|
| **Pre-Authorized Code Flow** | Coming Soon (0.14.0) | Streamlined issuance using pre-authorized codes without re-authentication |
| **Presentation During Issuance** | Coming Soon (0.14.0) | Trust-based issuance requiring presentation of existing VC as proof |

### Credential Formats (additions)

| Format | Status | Description |
|--------|--------|-------------|
| **Claim 169 QR Code** | Coming Soon (0.14.0) | Privacy-preserving CBOR-CWT encoded credentials via standardized QR codes |

