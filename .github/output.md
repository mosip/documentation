# Features

## Core Features

### Presentation During Issuance
Strengthen trust in credential workflows by requiring verification of an existing credential before issuing a new one.

- **Presentation Request**: Request and receive an existing Verifiable Credential from the wallet, enabling issuers to validate user claims before proceeding
- **Presentation Verification**: Internally verify submitted VC presentations, ensuring authenticity and validity without external dependencies
- **Conditional Issuance**: Automatically issue and deliver a new VC upon successful verification, creating seamless trust-based workflows

This feature implements advanced issuance patterns using OpenID4VCI and Presentation Exchange standards, enabling richer credential ecosystems where trust is established through prior credentials.

**How it works**: When a user requests a new credential, Inji Certify prompts the wallet to present an existing VC. The presentation is verified internally, and upon successful validation, the new credential is automatically issued and delivered to the wallet—all within a single, secure interaction flow.

[Learn more about Presentation During Issuance](https://docs.inji.io/inji-certify/features/presentation-during-issuance)

---

### QR Code-Based Credential Issuance
Issue privacy-preserving Verifiable Credentials via standardized QR codes, enabling offline and low-connectivity credential delivery.

- **Claim 169 QR Generation**: Encode issued VCs into Claim 169–compliant QR codes, ensuring interoperability across ecosystem wallets and verification tools
- **CBOR-CWT Encoding**: Deliver credentials in compact, privacy-preserving CBOR Web Token format, reducing payload size while maintaining security
- **Standard-Based Issuance**: Align with global standards for machine-readable identity, enabling seamless integration with diverse verification systems

This capability implements the Claim 169 specification for embedding identity data in QR codes, supporting compact, secure, and machine-readable credential representation.

**How it works**: Inji Certify generates a Verifiable Credential, encodes it into CBOR Web Token format, and renders it as a Claim 169-compliant QR code. Wallets and consumer applications scan the QR code to obtain the credential—ideal for environments with limited connectivity or where physical credential delivery is preferred.

[Learn more about QR Code-Based Issuance](https://docs.inji.io/inji-certify/features/qr-code-issuance)

---

### Pre-Authorized Code Flow
Simplify credential issuance for pre-verified users by eliminating re-authentication during the delivery process.

- **Pre-Authorized Credential Offers**: Generate credential offers with embedded pre-authorized codes, streamlining the issuance process for trusted workflows
- **Flexible Delivery Channels**: Distribute credential offers via QR codes, deep links, or other channels, meeting users where they are
- **Transaction Code Support**: Optionally require a PIN or transaction code during redemption, adding an extra layer of security when needed

This feature implements the OpenID4VCI pre-authorized code flow, designed for scenarios where the issuer has already verified the user's identity and wants to simplify credential delivery.

**How it works**: The issuer generates a credential offer containing a pre-authorized code and delivers it to the user via QR code or deep link. The wallet redeems the offer by exchanging the pre-authorized code for an access token, then requests the VC—all without requiring the user to re-authenticate. An optional transaction code can be required for additional security.

[Learn more about Pre-Authorized Code Flow](https://docs.inji.io/inji-certify/features/pre-auth-code-flow)
