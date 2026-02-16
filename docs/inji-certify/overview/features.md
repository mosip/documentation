# Features

Inji Certify comes with a comprehensive suite of features designed to make credential issuance seamless, secure, and standards-compliant. Key features include:

## 1. Standards Based Credential Issuance

Inji Certify is built to issue digital credentials that are fully compliant with globally recognized standards, ensuring interoperability across systems and jurisdictions. It:

* Supports **W3C Verifiable Credentials Data Model (versions 1.1 and 2.0)** for secure, portable, and verifiable documents
* Implements **OpenID for Verifiable Credential Issuance (OpenID4VCI)** for seamless and secure delivery of credentials to digital wallets
* Ensures interoperability across systems and jurisdictions

## 2. Multiple Credential Support for Issuers

Inji Certify allows a single issuer to manage and issue multiple types of verifiable credentials within the same ecosystem. This is especially useful for organizations running diverse programs or services under one authority.

**Example scenarios:**

* A **Transport Authority** issuing both _Driver's Licenses_ and _Commercial Vehicle Permits_
* A **University** issuing _Student ID Cards_, _Degree Certificates_, and _Transcript Credentials_
* A **Health Department** issuing _Vaccination Certificates_ and _Medical Practitioner Licenses_
* A **Border Control Agency** issuing _Cross-Border Transport Passes_ and _Work Permits_

This flexibility ensures that one issuer can cater to multiple credentialing needs without managing separate systems or infrastructures.

## 3. Addition of Credential Type via API Post Onboarding

Inji Certify enables issuers to expand their credential portfolio even after the initial onboarding, ensuring they can respond quickly to evolving program or policy needs. Through secure APIs, issuers can create and configure new credential types without system downtime or complex redeployments.

**Key capabilities include:**

* **Post-onboarding expansion** of credential types to support new use cases
* **API-driven setup** for fast and seamless integration into existing workflows
* **No infrastructure changes required**, minimizing operational overhead

Access to comprehensive **documentation and guidelines** — _(refer to this_ [_link_](https://github.com/mosip/inji-certify/blob/master/docs/Credential-Issuer-Configuration.md#credential-configuration) _for details on configuring VC types)_.

## 4. Support for Multiple Credential Formats

Inji Certify provides issuers with the capability to generate verifiable credentials in multiple **industry-accepted formats**, ensuring broad interoperability across ecosystems, wallets, and verification systems. This flexibility makes it easier for organizations to adopt digital credentials without being locked into a single standard.

**Currently supported formats:**

* **JSON-LD Credentials** — Standards-based credentials using Linked Data Proofs, widely adopted in decentralized identity ecosystems for interoperability and verifiability
* **Signed JWT (JWS)** — Compact, JSON-based credentials that enable efficient transmission and verification across web and enterprise systems
* **SD-JWT (Selective Disclosure JWT)** — Privacy-preserving credentials that allow holders to selectively disclose attributes while keeping the rest private

**Note:** In the 0.12.0 release we have included support for SD-JWT as a draft release.

**Upcoming formats (Coming Soon):**

* **mDoc (ISO 18013-5/7)** — A mobile document format for secure, offline-verifiable digital documents
* **mDL (ISO 18013-5/7)** — A mobile driver's license format, enabling secure and convenient digital driver's license presentation on mobile devices

By supporting both **current and emerging standards**, Inji Certify ensures that credentials are **secure, future-ready, and interoperable** with a wide range of applications, wallets, and verification ecosystems.

## 5. Efficient Signing with Multiple Algorithms

Inji Certify ensures that every credential is protected through **digital signatures**, guaranteeing authenticity, integrity, and tamper resistance. To meet diverse ecosystem and compliance needs, it offers issuers the flexibility to choose from a wide range of cryptographic signing algorithms.

**Key capabilities include:**

* **Configurable Signing Algorithms** — Issuers can select the signing algorithm of choice during credential setup
* **Supported Options** — Includes **RSA**, **Ed25519 (2018 & 2020 specs)**, and **Elliptic Curve (ECC K1 & R1)**
* **Enhanced Cryptographic Flexibility** — Support for Ed25519 and ECC Curve ensures compatibility with modern secure systems, broader wallet ecosystems, and evolving standards
* **Standards Compliance** — All signatures are interoperable and verifiable across wallets and verification systems
* **Security and Adaptability** — Enables issuers to stay aligned with cryptographic best practices and adapt to regional or program-specific security requirements

This combination of efficiency, flexibility, and compliance ensures that credentials issued through Inji Certify remain future-ready, secure, and widely interoperable.

## 6. Plugin Support and Integration Capabilities

Inji Certify is built on a **modular plugin architecture**, enabling seamless integration with identity systems, registries, data sources, and third-party services. This design makes the platform highly flexible, customizable, and easy to adopt across diverse ecosystems while simplifying both implementation and testing.

**Key plugin categories include:**

### VC Issuance Plugins

These plugins are responsible for generating and signing verifiable credentials. They typically connect with external identity or authentication systems, obtain the required information, and issue the VC in compliance with global standards.

**Currently supported issuance plugins:**

* **MOSIP Identity Plugin** — Integrates with MOSIP for trusted identity verification
* **Sunbird Plugin** — Enables seamless integration with Sunbird-based services

### Data Provider Plugins

These plugins fetch relevant data from external registries or data sources. The retrieved data is returned as a JSON object which Inji Certify then uses to generate and issue the corresponding verifiable credential.

**Currently supported data provider plugins:**

* **Mock IDA Plugin** — Provides a simulated identity verification environment for testing and development
* **Mock CSV Data Provider Plugin** — Useful for sandbox environments and test data simulation
* **Postgres Data Provider Plugin** — Connects to Postgres databases to fetch real-time data from registries or external systems

For detailed instructions on configuring the Data Provider Plugin, please refer to this [guide](https://github.com/mosip/inji-certify/blob/master/docs/Local-Development.md).

Issuers can easily integrate additional custom plugins by following the detailed guidelines provided in this [link](https://github.com/mosip/inji-certify/blob/master/docs/Custom-Plugin-K8s.md). This extensible plugin framework ensures that Inji Certify can adapt to unique organizational needs without heavy customization. To know more about this feature please refer to this link: [VC Issuance vs Data Provider Plugin](https://github.com/mosip/inji-certify/blob/master/docs/VCIssuance-vs-DataProvider.md).

## 7. Revocation Mechanism (JSON-LD Only)

Inji Certify introduces an initial implementation of revocation to enhance the trust and reliability of Verifiable Credentials (VCs).

**Capabilities include:**

* **Revocation List** — Maintains a list of revoked JSON-LD credentials
* **Revocation API** — Allows issuers to mark JSON-LD credentials as revoked
* **Verification API** — Enables verifiers to check whether a JSON-LD credential is valid or revoked
* **Discovery API** — Provides access to the most up-to-date revocation list

This release establishes the foundation for a standardized revocation mechanism in Inji Certify, with broader credential format support planned in future iterations. Click [here](https://github.com/mosip/inji-certify/blob/master/docs/VC-Revocation-Support.md) to know more about this feature.

## 8. Ledger for Issued Verifiable Credentials

Inji Certify includes an optional ledger that records every Verifiable Credential (VC) issued by the system. When enabled, this ledger provides a searchable index of issued credentials, making it easier for issuers to track, audit, and manage credentials throughout their lifecycle.

**Why it matters:** The ledger simplifies operations such as revocation, where the system must quickly locate the credential being revoked. With indexed search support, issuers can retrieve credentials efficiently without maintaining an external lookup system.

**Key Capabilities:**

* **Configurable Recording** — Issuers can choose whether or not to maintain an internal record of all issued VCs.
* **Indexed Search** — The ledger supports searching issued credentials based on predefined indexes, enabling faster retrieval.
* **Revocation Support** — When revocation is enabled, the ledger must be active, unless the issuer provides an external system capable of performing credential lookup.

**Considerations:** If the issuer intends to use Inji Certify's built-in revocation workflow, the ledger feature must be turned on. Otherwise, the issuer is responsible for implementing their own mechanism to locate credentials during revocation.

## 9. SVG Rendering Support

Inji Certify provides support for **SVG-based credential rendering**, ensuring wallets can display visually consistent and branded representations of issued credentials.

**Why it matters:** With SVG rendering support powered by the renderMethod metadata and defined templates, Certify ensures that **every credential not only carries trust and verifiability, but also a consistent, secure, and issuer-branded visual identity** across all wallets.

**How it works:**

* **renderMethod in Metadata** — Certify includes a renderMethod parameter within the credential metadata, instructing wallets on how the credential should be visually rendered

**Key Benefits:**

* **Consistent Branding** — Logos, colors, and layouts can be issuer-defined, ensuring uniform credential presentation across different wallets
* **Scalable & Device-Friendly** — SVG ensures high-quality rendering on any screen size, from mobile devices to large displays
* **Wallet Interoperability** — By embedding the rendering method in the credential metadata, any compliant wallet can render credentials without custom logic
* **Flexible Output** — Wallets can convert rendered SVGs into other formats (PNG, PDF) for sharing or offline use

Please refer this [guide](https://github.com/mosip/inji-certify/blob/master/docs/Rendering-Template.md) to know more about this feature.

## 10. External Authentication Integration

Inji Certify provides support for integrating with external authentication services compliant with OAuth 2.0, such as eSignet, Keycloak, and others. This allows issuers to leverage existing identity and access management solutions seamlessly.

**Why it matters:** By supporting external authentication providers, Certify enables issuers to adopt the authentication mechanism that best fits their ecosystem requirements. This ensures flexibility, stronger security, and compliance with existing organizational standards.

**How it works:**

* **OAuth 2.0 Compliance** — Certify connects with external authentication services that follow the OAuth 2.0 standard
* **Configurable Integration** — Issuers can configure Certify to integrate with different authentication providers based on their needs (e.g., eSignet for government deployments, Keycloak for open-source identity management, or other OAuth 2.0 providers)
* **Seamless Authorization** — Once integrated, the external service handles user authentication, and Certify issues credentials only after successful authorization

**Key Benefits:**

* **Flexibility** — Issuers can choose and configure the authentication provider that suits their ecosystem
* **Enhanced Security** — Leverages robust, battle-tested external identity providers for authentication
* **Standards-Based** — OAuth 2.0 compliance ensures interoperability with widely adopted identity solutions
* **Customizable per Issuer** — Different issuers can configure different authentication services within the same Certify deployment

## 11. VC Signing with External CA-Signed Certificates

Inji Certify supports the use of externally issued, CA-signed certificates for credential signing, enabling issuers to integrate their own public key infrastructure (PKI) into the credential issuance workflow.

**Key Benefits**

* Trust Alignment — Credentials are signed using the issuer’s own CA-backed certificates, reinforcing alignment with local or institutional PKI policies.
* Greater Adoption Flexibility — Countries and organizations can adopt Certify without restructuring their existing certificate management models.
* Seamless Compliance — Using a recognized CA certificate simplifies audits and compliance checks by matching established trust and governance frameworks.
* End-To-End Security — The signing process remains fully managed through the Key Manager, ensuring secure key handling while maintaining issuer-specific trust anchors.

To explore the full workflow and configuration, refer to the [detailed feature document.](https://github.com/mosip/inji-certify/blob/release-0.13.x/docs/PKI-Support-and-Integration-with-SD-JWT-VC.md)

For deeper insights into certificate and key lifecycle handling, see the documentation on the [Role of the Key Manager](../technical-overview/key-manager.md) in Certify.

## 12. Multi language support

Inji Certify have capability to issue VC in multiple language based on the configuration done by issuer. During the VC type configuration, VC schema can be defined in multiple languages. While issuing the VC, based on the preferred language of the user, VC will be issued in that particular language.


<!-- Coming up with Inji Certify 0.14.0
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


-->


## Read More

Check [Inji Certify Repository](https://github.com/mosip/inji-certify/tree/master) to explore these above mentioned features.
