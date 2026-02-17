

Presentation During Issuance

Inji Certify introduces support for an additional issuance mode called Presentation During Issuance, enhancing trust and security in credential issuance workflows.

In this mode, the issuer requests the presentation of an existing Verifiable Credential (VC) from the wallet as part of issuing a new VC. The submitted presentation is verified internally by Inji Certify, and upon successful verification, the issuance of the new VC is triggered and delivered to the wallet.

This feature strengthens security, trust, and interoperability and is typically enabled using protocols such as OpenID4VCIand standards like Presentation Exchange.

Capabilities include:

Presentation Request — Ability to request the presentation of an existing VC from the wallet

Presentation Verification — Internal verification of the submitted VC presentation

Conditional Issuance — Automatic issuance and delivery of a new VC upon successful verification

This release lays the groundwork for advanced, trust-based issuance flows in Inji Certify, enabling richer and more secure credential ecosystems.

Issuance of Verifiable Credentials with QR code

Inji Certify introduces support for QR-code-based VC issuance using Claim 169, enabling privacy-preserving and interoperable credential issuance directly via standardized, compact QR codes.

With this feature, Inji Certify can generate verifiable credentials that are encoded into CBOR Web Token (CWT) form and delivered through QR codes compliant with Claim 169 specifications — a specification for embedding identity data in QR codes that supports compact, secure, and machine-readable representation of credential data.

This capability allows wallets and other consumer applications to request and obtain credentials by scanning a Claim 169-formatted QR code, improving usability in offline or low-connectivity environments and ensuring alignment with an interoperable QR standard.

Capabilities include:

Claim 169 QR Generation — Ability to encode issued VCs into Claim 169–compliant QR codes

CBOR-CWT Encoding — Support for compact, privacy-preserving CBOR Web Token encoding of VC data

Standard-Based Issuance — Delivery of QR-encoded credentials that adhere to global standards for machine-readable identity

This release expands Inji Certify’s issuance modalities to include QR code–centric workflows using standardized Claim 169 structures, enhancing accessibility and interoperability with ecosystem wallets and verification tools.

VC Issuance with pre authorised code (Pre Auth Code Flow)

Inji Certify introduces support for the Pre-Authorized Code Flow with Credential Offer, enabling streamlined and user-friendly issuance of Verifiable Credentials (VCs).

This feature implements the OpenID4VCI pre-authorized code flow, where Inji Certify can issue a credential offer containing a pre-authorized code that the wallet uses to obtain an access token and then request a VC — without requiring the end user to re-authenticate during the issuance process. This flow is ideal for scenarios where the issuer has already verified the user’s identity and wants to simplify credential delivery.

With this enhancement, credential offers can be delivered via QR codes, deep links, or other channels, and wallets can redeem them with or without an additional transaction code (PIN).

Capabilities include:

Pre-Authorized Credential Offers — Generate offers that embed a pre-authorized code to streamline issuance

Standards-Based Flow — Implements the OpenID4VCI flow for credential offer redemption and issuance

Flexible Delivery — Support for multiple delivery methods such as QR codes and deep links

Transaction Code Support — Optional support for requiring a PIN/transaction code during credential redemption

This release enhances Inji Certify’s interoperability with OpenID4VCI ecosystems and improves the user experience for VC issuance in trusted workflows.

