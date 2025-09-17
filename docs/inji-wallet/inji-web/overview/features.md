# Features

**Inji Web Wallet** is a browser-based, open-source digital wallet designed for secure **download, verification, storage, and sharing** of Verifiable Credentials (VCs). It supports **OpenID4VCI**, **OpenID4VP**, **SD-JWT**, and **W3C VC** standards—no app install required.

## Key Features

## Login with Any Identity Provider (IdP)

* Supports Google and other OpenID-compliant IdPs
* Credentials are stored securely in the browser-based wallet after login, enabling access across sessions and devices, depending on the configuration.
* Verifiable Credentials are now stored in the **“Stored Cards”** section.
* You can view and download the credential as a PDF file locally on your system, or print it out once downloaded.
* You can reset your passcode if you forget it during login. However, the option to change the passcode after logging in is currently not available.

## Guest Mode (No Login Required)

* Ideal for privacy-sensitive or public campaigns
* Credentials are downloaded directly to the local device (not stored in the wallet)

## Credential Download Options

* **OpenID for VC Issuance**: Interoperable with trusted issuers
* **Example Issuers**:
  * Republic of Veridonia National ID Department - National ID
  * StayProtected Insurance - Insurance Credentials
  * Republic of Veridonia Tax Department - Tax ID
  * AgroVeritas Property & Land Registry - Land Record

## Verifying Credential Authenticity

* Digital signature validation
* Tamper-evidence and issuer authenticity checks
* **Supported formats**:
  * W3C JSON-LD Data Model 1.1

## Storage Options

| Type                      | Description                                     |
| ------------------------- | ----------------------------------------------- |
| **Web Wallet Storage**    | Stored securely in the web wallet after login   |
| **Local Storage (Guest)** | Downloaded PDF with embedded QR for offline use |

## Credential Sharing Options

| Method                  | Description                                  | Connectivity |
| ----------------------- | -------------------------------------------- | ------------ |
| **Scan PDF**            | Scan PDF on verifier portal (Inji Verify)    | Online       |
| **Print or Screenshot** | For physical presentation or screen scanning | Offline      |
| **Upload PDF**          | Used in verifier workflows like Inji Verify  | Online       |

## User Experience Highlights

* No app install—fully browser-based
* Clear distinction between **wallet-stored** and **locally stored** credentials
* Guided flows and contextual help for all users

## Signature Algorithm Support

**Signature Algorithm Support in Inji Web**

| Format                 | Signature Algorithm      | Web Wallet (Login) | Guest Mode (Without Login) | Notes                                               |
| ---------------------- | ------------------------ | ------------------ | -------------------------- | --------------------------------------------------- |
| W3C JSON-LD            | ED25519 2018             | Supported          | Not Supported              | Compact, fast signatures with high security         |
| W3C JSON-LD            | ED25519 2020             | Supported          | Not Supported              | Enhanced key format with better structure           |
| W3C JSON-LD            | RS256 (RSA with SHA-256) | Supported          | Supported                  | Backward compatibility; legacy systems              |
| W3C JSON-LD            | ECC K1                   | Supported          | Not Supported              | Common in OpenID ecosystem                          |
| W3C JSON-LD            | ECC R1                   | Planned            | Planned                    | Strong elliptic curve variant                       |
| W3C Data Integrity 2.0 | RS256                    | Planned            | Planned                    | JWS with canonicalized digest                       |
| W3C Data Integrity 2.0 | EdDSA (Ed25519)          | Planned            | Planned                    | Based on JWS EdDSA                                  |
| W3C Data Integrity 2.0 | ES256K                   | Planned            | Planned                    | JWS-based signing with secp256k1                    |
| W3C Data Integrity 2.0 | ES256                    | Planned            | Planned                    | Strong elliptic curve variant                       |
| JWT VC                 | RS256                    | Planned            | Planned                    | Planned under VC-JWT compliance                     |
| JWT VC                 | ES256K                   | Planned            | Planned                    | Awaiting certification                              |
| JWT VC                 | ES256                    | Planned            | Planned                    | Under consideration                                 |
| JWT VC                 | x509 (PKI v3)            | Planned            | Planned                    | Public key in JWT header; x509 cert chain planned   |
| SD-JWT VC              | RS256                    | Supported          | In Progress                | SD-JWT verification being integrated                |
| SD-JWT VC              | ES256K                   | Supported          | Supported                  | Selective Disclosure compatible                     |
| SD-JWT VC              | ES256                    | Planned            | In Progress                | Strong elliptic curve variant                       |
| SD-JWT VC              | EdDSA (Ed25519)          | Supported          | In Progress                | Not yet supported in Certify (issuer side)          |
| SD-JWT VC              | x509 (PKI v3)            | In Progress        | In Progress                | Used for advanced SD-JWT scenarios                  |
| mDoc / mDL             | RS256                    | Planned            | Planned                    | Used in mobile document ecosystems                  |
| mDoc / mDL             | EdDSA(Ed25519)           | Planned            | Planned                    | Widely used in mobile identity contexts             |
| mDoc / mDL             | ES256K                   | Planned            | Planned                    | Used in various driver license implementations      |
| mDoc / mDL             | ES256                    | Planned            | Planned                    | Emerging support for high-security mobile documents |
| mDoc / mDL             | x509 (PKI v3)            | Planned            | Planned                    | x509 certificate chain                              |

## Planned Features

* Selective Disclosure using SD-JWT
* OpenIDVP
* Presentation During Issuance
* Support of mDoc/mDL VC format
* VC sharing via Bluetooth (Web BLE support)

## Read More

* [Inji Web Wallet User Guide](https://docs.inji.io/inji-wallet/inji-web/functional-overview/end-user-guide)
* [Feature Workflows](https://docs.inji.io/inji-wallet/inji-web/functional-overview/workflow)
* _Feature Demo Video (Coming Soon)_
