# Features

**Inji Web Wallet** is a browser-based, open-source digital wallet designed for secure **download, verification, storage, and sharing** of Verifiable Credentials (VCs). It supports **OpenID4VCI**, **OpenID4VP**, **IETF** **SD-JWT**, and **W3C VC** standards—no app install required.

### **Multiple Credential Format Support**

Inji Wallet is designed for interoperability and flexibility by supporting a wide range of credential formats:

* **W3C Verifiable Credentials (JSON-LD VCs) Data Model 1.1**
  * Standards-based credential format is widely adopted across ecosystems.
  * Suitable for general-purpose credential issuance and verification.
  * Supports OpenID4VP-based live presentation of JSON-LD VCs to any compliant verifier
* **ISO 18013-5 (mDL)**
  * Mobile Driving License and Mobile Document specification.
  * Supports use cases like identity verification in transport, law enforcement, and service access.
* **IETF SD-JWT**
  * **IETF** **SD-JWT Verifiable Credentials**: Enables holders to download and share credentials in IETF **SD-JWT format**. This allows users to share only the necessary attributes while keeping other data private, ensuring **privacy-preserving credential sharing**.
  * Allows users to share only the required claims with verifiers via the OpenIDVP flow, where these selectively disclosable claims can be shared as per the user's need. _**(Coming Soon in the upcoming release)**_

This multi-format support allows Inji Wallet to work seamlessly across different ecosystems, ensuring **compatibility, security, and user privacy**.

### Login with Any Identity Provider (IdP)

* Supports Google and other OpenID-compliant IdPs
* Credentials are stored securely in the browser-based wallet after login, enabling access across sessions and devices, depending on the configuration.
* Verifiable Credentials are now stored in the **“Stored Cards”** section.
* You can view and download the credential as a PDF file locally on your system, or print it out once downloaded.
* You can reset your passcode if you forget it during login. However, the option to change the passcode after logging in is currently not available.

### Guest Mode (No Login Required)

* Ideal for privacy-sensitive or public campaigns
* Credentials are downloaded directly to the local device (not stored in the wallet)

### Credential Download Options

* **OpenID for VC Issuance**: Interoperable with trusted issuers
* **Example Issuers**:
  * Republic of Veridonia National ID Department - National ID
  * StayProtected Insurance - Insurance Credentials
  * Republic of Veridonia Tax Department - Tax ID
  * AgroVeritas Property & Land Registry - Land Record

### **Claim 169 QR Code Support**

* Supports **standardized QR codes** for initiating credential download and sharing flows.
* Download credentials containing embedded Claim 169 QR blocks
* Store and render these QR blocks for display
* Allow users to present the QR-based identity data when required
* Ensure proper validation and security checks (size, format, signature, structure)

### **SVG-based Credential Rendering** <a href="#id-4.-svg-based-credential-rendering" id="id-4.-svg-based-credential-rendering"></a>

* Inji Web Wallet now supports **SVG-based credential rendering** for **Data Model 2.0 VCs**.
* This allows credentials issued under the Data Model 2.0 schema to be displayed as **secure, dynamic SVG visuals** within the wallet.
* The rendering ensures that displayed information (such as name, ID, issuer, and other attributes) directly corresponds to the **cryptographically verified credential data**.
* This enhancement improves **readability**, **user trust**, and **consistency** while maintaining alignment with the underlying verifiable data.
* Support for SVG rendering for other data models may be added in future versions.

### Verifying Credential Authenticity

* Inji Web Wallet uses robust cryptography to verify that the VC is:
  * Digitally signed by a trusted issuer
  * Cryptographically valid based on its proof type
  * Tamper-evident and verifiable using Inji Verify or any compliant verifier

## Storage Options

| Type                      | Description                                     |
| ------------------------- | ----------------------------------------------- |
| **Web Wallet Storage**    | Stored securely in the web wallet after login   |
| **Local Storage (Guest)** | Downloaded PDF with embedded QR for offline use |

## Credential Sharing Options

| Method                     | Description                                                                                                                                                                                                                                                               | Connectivity |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ |
| **Scan PDF**               | Scan PDF on verifier portal (Inji Verify)                                                                                                                                                                                                                                 | Online       |
| **Print or Screenshot**    | For physical presentation or screen scanning                                                                                                                                                                                                                              | Offline      |
| **Upload PDF**             | Used in verifier workflows like Inji Verify                                                                                                                                                                                                                               | Online       |
| **OpenID4VP Presentation** | <ul><li>Users can present <strong>JSON-LD VCs</strong> through an <strong>OpenID4VP-compliant</strong> flow.</li><li>Enables secure, real-time credential sharing with user consent.</li><li>Fully interoperable with Inji Verify and other compliant verifiers</li></ul> | Online       |

## User Experience Highlights

* Browser-based; no app installation needed
* Clear distinction between **wallet-stored** and **locally stored** credentials
* Guided flows and contextual help for all users

| Format                 | Signature Algorithm      | Web Wallet (Login) | Guest Mode (Without Login) | Notes                                               |
| ---------------------- | ------------------------ | ------------------ | -------------------------- | --------------------------------------------------- |
| W3C JSON-LD            | ED25519 2018             | Supported          | Supported                  | Compact, fast signatures with high security         |
| W3C JSON-LD            | ED25519 2020             | Supported          | Supported                  | Enhanced key format with better structure           |
| W3C JSON-LD            | RS256 (RSA with SHA-256) | Supported          | Supported                  | Backward compatibility; legacy systems              |
| W3C JSON-LD            | ECC K1                   | Supported          | Supported                  | Common in OpenID ecosystem                          |
| W3C JSON-LD            | ECC R1                   | Planned            | Planned                    | Strong elliptic curve variant                       |
| W3C Data Integrity 2.0 | RS256                    | Planned            | Planned                    | JWS with canonicalized digest                       |
| W3C Data Integrity 2.0 | EdDSA (Ed25519)          | Planned            | Planned                    | Based on JWS EdDSA                                  |
| W3C Data Integrity 2.0 | ES256K                   | Planned            | Planned                    | JWS-based signing with secp256k1                    |
| W3C Data Integrity 2.0 | ES256                    | Planned            | Planned                    | Strong elliptic curve variant                       |
| JWT VC                 | RS256                    | Planned            | Planned                    | Planned under VC-JWT compliance                     |
| JWT VC                 | ES256K                   | Planned            | Planned                    | Awaiting certification                              |
| JWT VC                 | ES256                    | Planned            | Planned                    | Under consideration                                 |
| JWT VC                 | x509 (PKI v3)            | Planned            | Planned                    | Public key in JWT header; x509 cert chain planned   |
| SD-JWT VC              | RS256                    | Supported          | Supported                  | SD-JWT verification being integrated                |
| SD-JWT VC              | ES256K                   | Supported          | Supported                  | Selective Disclosure compatible                     |
| SD-JWT VC              | ES256                    | Planned            | Supported                  | Strong elliptic curve variant                       |
| SD-JWT VC              | EdDSA (Ed25519)          | Supported          | Supported                  | Not yet supported in Certify (issuer side)          |
| SD-JWT VC              | x509 (PKI v3)            | In Progress        | In Progress                | Used for advanced SD-JWT scenarios                  |
| mDoc / mDL             | RS256                    | Planned            | Planned                    | Used in mobile document ecosystems                  |
| mDoc / mDL             | EdDSA(Ed25519)           | Planned            | Planned                    | Widely used in mobile identity contexts             |
| mDoc / mDL             | ES256K                   | Planned            | Planned                    | Used in various driver license implementations      |
| mDoc / mDL             | ES256                    | Planned            | Planned                    | Emerging support for high-security mobile documents |
| mDoc / mDL             | x509 (PKI v3)            | Planned            | Planned                    | x509 certificate chain                              |

***

{% include "../../../../.gitbook/includes/useful-links.md" %}

## Features in the Pipeline

* Selective Disclosure using SD-JWT via OpenIDVP Flow
* Presentation During Issuance
* Revocation Status
* Support of mDoc/mDL VC format

## Read More

* [Inji Web Wallet User Guide](https://docs.inji.io/inji-wallet/inji-web/functional-overview/end-user-guide)
* [Feature Workflows](https://docs.inji.io/inji-wallet/inji-web/functional-overview/workflow)
* _Feature Demo Video (Coming Soon)_
