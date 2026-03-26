# National ID VC Issuance

### Overview

The UIN Issuance capability in **Inji Certify 0.14.0** introduces a flexible and extensible approach to credential issuance by decoupling dependency on the traditional IDA system and enabling dynamic data retrieval through a new **IDA Data Provider Plugin**. This enhancement allows Certify to fetch raw KYC data, transform it into Verifiable Credentials (VCs), and support multiple cryptographic key types and signing algorithms aligned with MOSIP standards.

Instead of relying on a fixed IDA-driven issuance flow, Certify now leverages a plugin-based architecture where external data sources (such as IDA APIs) can be integrated seamlessly. This enables greater control over credential structure, claim mapping, localization, and signing behavior, making the issuance process more adaptable across different country implementations.

### Why This Feature Matters

The introduction of the IDA Data Provider Plugin and enhanced issuance flow brings several key benefits:

* **Flexible Data Integration:** Allows Certify to fetch raw KYC data directly from IDA APIs, enabling custom credential structures instead of relying on predefined formats.
* **Expanded Cryptographic Support:** Supports multiple key types such as RSA, EC R1, ECK1, and ED, overcoming earlier limitations where only RSA-based signing was supported.
* **Improved Customization:** Enables dynamic mapping of claims using templates, including support for custom claims and localized attributes (e.g., multi-language names and addresses).
* **Decoupled Architecture:** Separates data fetching from credential issuance using plugin models, making the system more modular and extensible.
* **Enhanced Trust & Verification:** Supports country-specific signing keys with public key verification via DID URLs, allowing issuers to validate credential authenticity independently.
* **Operational Resilience:** Automatically falls back to internal key manager certificates if external signing certificates expire, ensuring uninterrupted issuance.
* **Optimized QR Code Generation:** Introduces image compression via the kernel biometric API to efficiently embed photos in QR codes without performance issues.

### How It Works – Step-by-Step (Certify Perspective)

The following sequence describes how Inji Certify handles UIN-based credential issuance using the new plugin-driven architecture:

#### 1. Certify Initiates Data Fetch via Plugin

Certify invokes the **IDA Data Provider Plugin**, which implements the DataProviderPlugin interface. The plugin uses the fetchData method to construct a request containing:

* Individual ID (UIN/VID)
* Required claims

This request is sent to the IDA KYC Exchange API.

#### 2. Authentication via OIDC

The plugin retrieves an access token through an OIDC flow:

* Token is obtained using e-Signet integration
* Cached authentication context is used to optimize performance
* Individual ID is retrieved from cache (optionally encrypted based on configuration)

#### 3. KYC Data Retrieval

The IDA API responds with a JSON payload containing KYC attributes such as:

* Name
* Gender
* Address
* Photo

The plugin forwards this data to Certify for processing.

#### 4. Claim Mapping & Credential Preparation

Certify maps the retrieved KYC data into VC claims using configurable templates:

* OIDC claims are transformed into VC-compatible structure
* Localization is applied where available (multi-language fields)
* Custom claims can be injected via mapping and policy configurations

#### 5. Individual ID Processing

Certify determines the type of identifier:

* UIN or VID is inferred based on format/length using regex or policy rules
* Encryption settings are applied based on configuration (secure vs non-secure storage)

#### 6. Credential Signing Configuration

Certify prepares the credential for signing:

* Selects signing key (country-provided or internal key manager)
* Supports multiple key types (RSA, EC, ED, etc.)
* Publishes the public key via DID URL for external verification

#### 7. Credential Issuance

Certify generates the Verifiable Credential:

* Applies the configured template and claims
* Signs the credential using the selected key
* Embeds compressed photo (if required for QR code)

The credential is then returned to the requesting wallet or system.

#### 8. Verification & Key Handling

* Countries can verify issued credentials using the public key exposed via DID URL
* If a country-specific certificate expires:
  * Certify automatically switches to internal key manager
  * No issuance disruption occurs
  * Responsibility remains with the country to rotate certificates

### Security Considerations

**Secure Data Handling:** Sensitive identifiers (UIN/VID) can be encrypted based on configuration, though compatibility with e-Signet must be ensured.

**OIDC-Based Authentication:** All KYC data requests are secured via access tokens obtained through OIDC flows.

**Key Transparency & Trust:** Public keys published via DID URLs allow independent verification of credential signatures.

**Certificate Lifecycle Management:** Automatic fallback ensures continuity, but proper monitoring and renewal of certificates is critical.

### Limitations

* Encryption of individual ID may require careful alignment between e-Signet and Certify configurations.
* Localization support depends on consistency of input data (e.g., language-tagged attributes).
* Custom claim configuration requires validation of supported mapping properties.
* Logging and alerting for certificate fallback behavior need further verification.

### Supported Capabilities

* IDA API-based KYC data retrieval via plugin
* Support for multiple signing algorithms and key types
* Template-driven VC generation with localization support
* QR code optimization with compressed images
* DID-based public key exposure for verification

Please refer to the relevant [GitHub technical documentation](https://github.com/inji/inji-certify/tree/master/docs) for detailed configuration, policy setup, and API‑level implementation details.
