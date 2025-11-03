# Features

Inji Certify comes with a comprehensive suite of features designed to make credential issuance seamless, secure, and standards-compliant. Key features include:

1. #### Standards Based Credential Issuance

Inji Certify is built to issue digital credentials that are fully compliant with globally recognized standards, ensuring interoperability across systems and jurisdictions. It:

* Supports **W3C Verifiable Credentials Data Model (versions 1.1 and 2.0)** for secure, portable, and verifiable documents
* Implements **OpenID for Verifiable Credential Issuance (OpenID4VCI)** for seamless and secure delivery of credentials to digital wallets.
* Ensures interoperability across systems and jurisdictions.

2. #### Multiple Credential Support for Issuers:

Inji Certify allows a single issuer to manage and issue multiple types of verifiable credentials within the same ecosystem. This is especially useful for organizations running diverse programs or services under one authority. **Example scenarios:**

1. A **Transport Authority** issuing both _Driver's Licenses_ and _Commercial Vehicle Permits_.
2. A **University** issuing _Student ID Cards_, _Degree Certificates_, and _Transcript Credentials_.
3. A **Health Department** issuing _Vaccination Certificates_ and _Medical Practitioner Licenses_.
4. A **Border Control Agency** issuing _Cross-Border Transport Passes_ and _Work Permits_.

This flexibility ensures that one issuer can cater to multiple credentialing needs without managing separate systems or infrastructures.

3. #### Addition of Credential Type via API post onboarding

Inji Certify enables issuers to expand their credential portfolio even after the initial onboarding, ensuring they can respond quickly to evolving program or policy needs. Through secure APIs, issuers can create and configure new credential types without system downtime or complex redeployments **Key capabilities include:**

* **Post-onboarding expansion** of credential types to support new use cases.
* **API-driven setup** for fast and seamless integration into existing workflows.
* **No infrastructure changes required**, minimizing operational overhead.

Access to comprehensive **documentation and guidelines** --- _(refer to this_ [_link_](https://github.com/mosip/inji-certify/blob/master/docs/Credential-Issuer-Configuration.md#credential-configuration) _for details on configuring VC types)_.

4. #### Support for Multiple Credential Formats

Inji Certify provides issuers with the capability to generate verifiable credentials in multiple **industry-accepted formats**, ensuring broad interoperability across ecosystems, wallets, and verification systems. This flexibility makes it easier for organizations to adopt digital credentials without being locked into a single standard.

**Currently supported formats:**

* **JSON-LD Credentials** - Standards-based credentials using Linked Data Proofs, widely adopted in decentralized identity ecosystems for interoperability and verifiability.
* **Signed JWT (JWS)** - Compact, JSON-based credentials that enable efficient transmission and verification across web and enterprise systems.
* **SD-JWT (Selective Disclosure JWT)** - Draft Release, Experimental\*\* -- Privacy-preserving credentials that allow holders to selectively disclose attributes while keeping the rest private.

Note: in the 0.12.0 release we have included support for SD-jWT as a draft release.

**Upcoming formats (Coming Soon):**

* **mDoc (ISO 18013-5/7)** -- A mobile document format for secure, offline-verifiable digital documents.
* **mDL (ISO 18013-5/7)** -- A mobile driver's license format, enabling secure and convenient digital driver's license presentation on mobile devices.

By supporting both **current and emerging standards**, Inji Certify ensures that credentials are **secure, future-ready, and interoperable** with a wide range of applications, wallets, and verification ecosystems.

5. #### Efficient Signing with Multiple Algorithms

Inji Certify ensures that every credential is protected through **digital signatures**, guaranteeing authenticity, integrity, and tamper resistance. To meet diverse ecosystem and compliance needs, it offers issuers the flexibility to choose from a wide range of cryptographic signing algorithms.

**Key capabilities include:**

* **Configurable Signing Algorithms** -- Issuers can select the signing algorithm of choice during credential setup.
* **Supported Options** -- Includes **RSA**, **Ed25519 (2018 & 2020 specs)**, and **Elliptic Curve (ECC K1 & R1)**.
* **Enhanced Cryptographic Flexibility** -- Support for Ed25519 and ECC Curve ensures compatibility with modern secure systems, broader wallet ecosystems, and evolving standards.
* **Standards Compliance** -- All signatures are interoperable and verifiable across wallets and verification systems.
* **Security and Adaptability** -- Enables issuers to stay aligned with cryptographic best practices and adapt to regional or program-specific security requirements.

This combination of efficiency, flexibility, and compliance ensures that credentials issued through Inji Certify remain future-ready, secure, and widely interoperable.

6. #### Plugin Support and Integration Capabilities

Inji Certify is built on a **modular plugin architecture**, enabling seamless integration with identity systems, registries, data sources, and third-party services. This design makes the platform highly flexible, customizable, and easy to adopt across diverse ecosystems while simplifying both implementation and testing.

**Key plugin categories include:**

1. **VC Issuance Plugins** These plugins are responsible for generating and signing verifiable credentials. They typically connect with external identity or authentication systems, obtain the required information, and issue the VC in compliance with global standards. **Currently supported issuance plugins:**
   * **MOSIP Identity Plugin** -- Integrates with MOSIP for trusted identity verification.
   * **Sunbird Plugin** -- Enables seamless integration with Sunbird-based services.
2. **Data Provider Plugins** These plugins fetch relevant data from external registries or data sources. The retrieved data is returned as a JSON object which Inji Certify then uses to generate and issue the corresponding verifiable credential. **Currently supported data provider plugins:**
   * **Mock IDA Plugin** -- Provides a simulated identity verification environment for testing and development.
   * **Mock CSV Data Provider Plugin** -- Useful for sandbox environments and test data simulation. Please refer to
   * **Postgres Data Provider Plugin** -- Connects to Postgres databases to fetch real-time data from registries or external systems.

For detailed instructions on configuring the Data Provider Plugin, please refer to this [guide](https://github.com/mosip/inji-certify/blob/master/docs/Local-Development.md)

Issuers can easily integrate additional custom plugins by following the detailed guidelines provided in this [link](https://github.com/mosip/inji-certify/blob/master/docs/Custom-Plugin-K8s.md). This extensible plugin framework ensures that Inji Certify can adapt to unique organizational needs without heavy customization. to know more about this feature please refer to this link: [VC Issuance vs Data Provider Plugin](https://github.com/mosip/inji-certify/blob/master/docs/VCIssuance-vs-DataProvider.md)

7. #### Revocation Mechanism \*(Draft Release -- Experimental, JSON-LD Only)

**Important:** This feature is in **draft release** and currently supports **JSON-LD credentials only**. It is intended for experimentation and early feedback, **not for production use**.

Inji Certify introduces an initial implementation of revocation to enhance the trust and reliability of Verifiable Credentials (VCs).

**Current draft capabilities include:**

* **Revocation List (Experimental)** -- Maintains a list of revoked JSON-LD credentials.
* **Revocation API** -- Allows issuers to mark JSON-LD credentials as revoked.
* **Verification API** -- Enables verifiers to check whether a JSON-LD credential is valid or revoked.
* **Discovery API** -- Provides access to the most up-to-date revocation list.

This draft release establishes the foundation for a standardized revocation mechanism in Inji Certify, with broader credential format support planned in future iterations. Click [here](https://github.com/mosip/inji-certify/blob/master/docs/VC-Revocation-Support.md) to know more about this feature.

8. #### SVG Rendering Support

Inji Certify provides support for **SVG-based credential rendering**, ensuring wallets can display visually consistent and branded representations of issued credentials.

**Why it matters:** With SVG rendering support powered by the renderMethod metadata and defined templates, Certify ensures that **every credential not only carries trust and verifiability, but also a consistent, secure, and issuer-branded visual identity** across all wallets.

**How it works:**

* renderMethod **in Metadata** -- Certify includes a renderMethod parameter within the credential metadata, instructing wallets on how the credential should be visually rendered.

**Key Benefits:**

* **Consistent Branding** -- Logos, colors, and layouts can be issuer-defined, ensuring uniform credential presentation across different wallets.
* **Scalable & Device-Friendly** -- SVG ensures high-quality rendering on any screen size, from mobile devices to large displays.
* **Wallet Interoperability** -- By embedding the rendering method in the credential metadata, any compliant wallet can render credentials without custom logic.
* **Flexible Output** -- Wallets can convert rendered SVGs into other formats (PNG, PDF) for sharing or offline use.

Please refer this [guide](https://github.com/mosip/inji-certify/blob/master/docs/Rendering-Template.md) to know more about this feature.

9. #### External Authentication Integration

Inji Certify provides support for integrating with external authentication services compliant with OAuth 2.0, such as eSignet, Keycloak, and others. This allows issuers to leverage existing identity and access management solutions seamlessly.

**Why it matters:** By supporting external authentication providers, Certify enables issuers to adopt the authentication mechanism that best fits their ecosystem requirements. This ensures flexibility, stronger security, and compliance with existing organizational standards.

**How it works:**

* **OAuth 2.0 Compliance** -- Certify connects with external authentication services that follow the OAuth 2.0 standard.
* **Configurable Integration** -- Issuers can configure Certify to integrate with different authentication providers based on their needs (e.g., eSignet for government deployments, Keycloak for open-source identity management, or other OAuth 2.0 providers).
* **Seamless Authorization** -- Once integrated, the external service handles user authentication, and Certify issues credentials only after successful authorization.

**Key Benefits:**

* **Flexibility** -- Issuers can choose and configure the authentication provider that suits their ecosystem.
* **Enhanced Security** -- Leverages robust, battle-tested external identity providers for authentication.
* **Standards-Based** -- OAuth 2.0 compliance ensures interoperability with widely adopted identity solutions.
* **Customisable per Issuer** -- Different issuers can configure different authentication services within the same Certify deployment.

## Read More

Check [Inji Certify Repository](https://github.com/mosip/inji-certify/tree/master) to explore these above mentioned features.
