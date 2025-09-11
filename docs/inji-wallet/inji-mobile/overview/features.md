# Features

Inji Mobile is an open-source digital wallet designed to enable individuals to receive, store, and present Verifiable Credentials (VCs) securely, both online and offline. Purpose-built to align with global standards like W3C VC, OpenID4VCI, OpenID4VP, IETF SD-JWT, and ISO 18013-5 (mDL), it brings interoperability, user autonomy, and strong cryptographic guarantees to digital identity ecosystems.

#### Multiple Credential Format Support

Inji Wallet is designed for interoperability and flexibility by supporting a wide range of credential formats:

* **W3C Verifiable Credentials (JSON-LD VCs) Data Model 1.1**
  * Standards-based credential format is widely adopted across ecosystems.
  * Suitable for general-purpose credential issuance and verification.
* **ISO 18013-5 (mDL)**
  * Mobile Driving License and Mobile Document specification.
  * Supports use cases like identity verification in transport, law enforcement, and service access.
* **IETF SD-JWT**
  * **IETF** **SD-JWT Verifiable Credentials**: Enables holders to download and share credentials in IETF **SD-JWT format**. This allows users to share only the necessary attributes while keeping other data private, ensuring **privacy-preserving credential sharing**.
  * Allows users to share only the required claims with verifiers via the OpenIDVP flow, where these selectively disclosable claims can be shared as per the user's need. _**(Coming Soon in the upcoming release)**_

This multi-format support allows Inji Wallet to work seamlessly across different ecosystems, ensuring **compatibility, security, and user privacy**.

### Download, Verify, and Store Verifiable Credentials

Inji Wallet makes it easy and secure for residents to manage their digital identity and credentials. From downloading and verifying to sharing and backing up Verifiable Credentials (VCs), this guide outlines all key features and workflows available in the wallet.

### Downloading Verifiable Credentials

#### OpenID for VC Issuance

Residents can download VCs from trusted issuers integrated with OpenID for the VCI protocol.

**Example Issuers:**

* Republic of Veridonia National ID Department - National ID
* StayProtected Insurance - Insurance Credentials
* Republic of Veridonia Tax Department - Tax ID
* AgroVeritas Property & Land Registry - Land Record
* Veridonia Department of Motor Vehicles - mDoc

#### Pre-Authorised Credential Offers (Without Transaction Code)

* Users download credentials directly using a credential\_offer URI
* No login required; pre-auth code embedded in the offer
* Used in mass issuance or public campaigns (e.g., vaccination certificates, offline cards)

#### Pre-Authorised Credential Offers (With Transaction Code)

* Adds a one-time transaction code (OTP / claim code) to bind issuance to the user
* User enters code in-app to retrieve VC securely
* Ideal for privacy-sensitive issuance (e.g., mDL, insurance)

### Verifying Credential Authenticity

Inji Mobile Wallet uses robust cryptographic libraries to verify that the VC is:

* Digitally signed by a trusted issuer.
* Cryptographically valid based on proof type.
*   In addition to traditional VC formats like JSON-LD and mDoc/mDL, I**nji Mobile** now supports Multiple Credential Format Support

    Inji Wallet is designed for interoperability and flexibility by supporting a wide range of credential formats:

    * **W3C Verifiable Credentials (JSON-LD VCs) Data Model 1.1**
      * Standards-based credential format is widely adopted across ecosystems.
      * Suitable for general-purpose credential issuance and verification.
    * **ISO 18013-5 (mDL)**
      * Mobile Driving License and Mobile Document specification.
      * Supports use cases like identity verification in transport, law enforcement, and service access.
    * **IETF SD-JWT**
      * **IETF** **SD-JWT Verifiable Credentials**: Enables holders to download and share credentials in IETF **SD-JWT format**. This allows users to share only the necessary attributes while keeping other data private, ensuring **privacy-preserving credential sharing**.
      * Allows users to share only the required claims with verifiers via the OpenIDVP flow, where these selectively disclosable claims can be shared as per the user's need. _**(Coming Soon in the upcoming release)**_

    This multi-format support allows Inji Wallet to work seamlessly across different ecosystems, ensuring **compatibility, security, and user privacy**. Multiple Credential Format Support

    Inji Wallet is designed for interoperability and flexibility by supporting a wide range of credential formats:

    * **W3C Verifiable Credentials (JSON-LD VCs) Data Model 1.1**
      * Standards-based credential format is widely adopted across ecosystems.
      * Suitable for general-purpose credential issuance and verification.
    * **ISO 18013-5 (mDL)**
      * Mobile Driving License and Mobile Document specification.
      * Supports use cases like identity verification in transport, law enforcement, and service access.
    * **IETF SD-JWT**
      * **IETF** **SD-JWT Verifiable Credentials**: Enables holders to download and share credentials in IETF **SD-JWT format**. This allows users to share only the necessary attributes while keeping other data private, ensuring **privacy-preserving credential sharing**.
      * Allows users to share only the required claims with verifiers via the OpenIDVP flow, where these selectively disclosable claims can be shared as per the user's need. _**(Coming Soon in the upcoming release)**_

    This multi-format support allows Inji Wallet to work seamlessly across different ecosystems, ensuring **compatibility, security, and user privacy**. IETF **SD-JWT credentials**. This enables privacy-preserving selective disclosure, where users can reveal only the claims required by a verifier while keeping all other claims private.

#### Signature Algorithm Support in Inji Mobile

<table><thead><tr><th width="161.46728515625">Format</th><th width="178.84588623046875">Signature Algorithm</th><th width="170.56036376953125">Status</th><th>Notes</th></tr></thead><tbody><tr><td>W3C JSON-LD</td><td>ED25519 2018</td><td>Supported</td><td>Compact, fast signatures with high security</td></tr><tr><td>mDoc/mDL</td><td>ED25519 2018</td><td>Supported</td><td>Used in mobile document ecosystems</td></tr><tr><td>W3C JSON-LD</td><td>ED25519 2020</td><td>Supported</td><td>Updated key format with enhanced key representation</td></tr><tr><td>mDoc/mDL</td><td>ED25519 2020</td><td>Supported</td><td>Widely used in mobile identity contexts</td></tr><tr><td>W3C JSON-LD</td><td>RS256 (RSA with SHA-256)</td><td>Supported</td><td>Backward compatibility; used in some legacy systems</td></tr><tr><td>mDoc/mDL</td><td>RS256 (RSA with SHA-256)</td><td>Supported</td><td>Applicable for RSA-backed mobile IDs</td></tr><tr><td>W3C JSON-LD</td><td>ECC K1</td><td>Supported</td><td>Common in OpenID ecosystem</td></tr><tr><td>mDoc/mDL</td><td>ECC K1</td><td>Supported</td><td>Used in various driver license implementations</td></tr><tr><td>IETF SD-JWT</td><td>ED25519</td><td>Supported</td><td>For selective disclosure with strong cryptographic guarantees</td></tr><tr><td>IETF SD-JWT</td><td>RS256</td><td>Supported</td><td>For selective disclosure with strong cryptographic guarantees</td></tr><tr><td>IETF SD-JWT</td><td>ECC K1</td><td>Supported</td><td>For selective disclosure with strong cryptographic guarantees</td></tr><tr><td>JSON-LD</td><td>ECC R1</td><td>Planned</td><td>High-security EdDSA variant</td></tr><tr><td>mDoc/mDL</td><td>ECC R1</td><td>Planned</td><td>Emerging support for high-security mobile documents</td></tr><tr><td>IETF SD-JWT</td><td>ECC R1</td><td>Planned</td><td>For selective disclosure with strong cryptographic guarantees</td></tr><tr><td>DIDComm v2 Messaging</td><td>Curve25519 / X25519</td><td>Research</td><td>Enables secure, encrypted VP exchange</td></tr><tr><td>JSON-LD ZKPs (VC-ZKP)</td><td>BBS+</td><td>Research</td><td>For advanced privacy-preserving credentials using Zero-Knowledge Proofs</td></tr></tbody></table>

### Sharing Verifiable Credentials

Inji Wallet supports secure sharing of Verifiable Credentials (VCs) in multiple ways — both **online and offline** — with strong privacy and authentication.

<table><thead><tr><th>Method</th><th width="257.124267578125">Description</th><th>Connectivity</th><th>User Control / Notes</th></tr></thead><tbody><tr><td><strong>QR Code Sharing</strong></td><td>Generate QR using PixelPass. Scan or upload on verifier portal.</td><td>Online</td><td>Quick and compact</td></tr><tr><td><strong>BLE (Bluetooth) Sharing</strong></td><td>Share VCs offline using Bluetooth Low Energy.</td><td>Offline</td><td>Peer-to-peer; face match supported</td></tr><tr><td><strong>SSO via QR Code</strong></td><td>Scan QR on service portal → share selected VCs after user consent.</td><td>Online</td><td>Fine-grained VC selection and SSO login</td></tr><tr><td><strong>OpenID4VP – Cross-Device</strong></td><td>Scan verifier’s QR from another device → present VCs post face verification.</td><td>Online</td><td>Secure, decentralized VC presentation</td></tr><tr><td><strong>OpenID4VP – Same Device</strong></td><td>Tap QR on browser → deep-link opens wallet → share credentials.</td><td>Online</td><td>Seamless redirect</td></tr></tbody></table>

**Note:** All methods include **user consent** and **privacy-by-design** to ensure secure, context-aware interactions.

### Backup and Restore

Inji Wallet includes a secure, one-time backup setup based on the platform:

| Platform | Backup Option | Notes                        |
| -------- | ------------- | ---------------------------- |
| Android  | Google Drive  | Select Google account        |
| iOS      | iCloud        | Uses logged-in Apple account |

**Ideal for:**

* Phone upgrades
* App crashes or resets

### User-Friendly Interface & Quick Actions

Designed for ease of use with intuitive UI components:

* Multiple VC Views: Mini cards to full detail
* Separation of Downloaded vs. Received VCs
* Quick Access Menu: Share, Share with Selfie via the kebab menu (⋮) on card
* Select from a list of credential types offered by the issuer.
* Choose only the VCs they want to download, ensuring relevance and control.
* VCs grouped by type (ID, insurance, education)
* Recent VCs shown first

### Wallet Security & Device Features

* **Biometric / Passcode Access**
  * App requires authentication on every open or session timeout
  * Supports Android biometrics and Apple Face ID / Touch ID
* **Private Key Storage in Secure Enclave**
  * Private keys are stored using Android Keystore / iOS Secure Enclave
  * Keys cannot be exported or tampered

### Planned Features

* Revocation Status
* IETF SD-JWT Selective Disclosure
* Injii Mobile Wallet Login
* Presentation during Issuance

## **Read More**

* [Inji Wallet User Guide](https://docs.inji.io/inji-wallet/inji-mobile/functional-overview/end-user-guide)
* [Feature Workflows](https://docs.inji.io/inji-wallet/inji-mobile/functional-overview/feature-workflows)
* 🎬 [Feature Demo Video](https://youtu.be/9Z1WuTd8q0M)
