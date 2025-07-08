# Features


Inji Mobile is an open-source digital wallet designed to enable individuals to receive, store, and present Verifiable Credentials (VCs) securely, both online and offline. Purpose-built to align with global standards like W3C VC, OpenID4VCI, OpenID4VP, SD-JWT, and ISO 18013-5 (mDL), it brings interoperability, user autonomy, and strong cryptographic guarantees to digital identity ecosystems.

### 🟢 Feature(a): Download, Verify, and Store Verifiable Credentials

Inji Wallet makes it easy and secure for residents to manage their digital identity and credentials. From downloading and verifying to sharing and backing up Verifiable Credentials (VCs), this guide outlines all key features and workflows available in the wallet.

### 1. Downloading Verifiable Credentials

#### OpenID for VC Issuance

Residents can download VCs from trusted issuers integrated with OpenID for the VCI protocol.

**Example Issuers:**
- Republic of Veridonia National ID Department - National ID
- StayProtected Insurance - Insurance Credentials
- Republic of Veridonia Tax Department - Tax ID
- AgroVeritas Property & Land Registry - Land Record
- Veridonia Department of Motor Vehicles - mDoc

#### Pre-Authorised Credential Offers (Without Transaction Code)
- Users download credentials directly using a credential_offer URI
- No login required; pre-auth code embedded in the offer
- Used in mass issuance or public campaigns (e.g., vaccination certificates, offline cards)

#### Pre-Authorised Credential Offers (With Transaction Code)
- Adds a one-time transaction code (OTP / claim code) to bind issuance to the user
- User enters code in-app to retrieve VC securely
- Ideal for privacy-sensitive issuance (e.g., mDL, insurance)

### 🟢 Features(b): Verifying Credential Authenticity

Inji Mobile Wallet uses robust cryptographic libraries to verify that the VC is:
- Digitally signed by a trusted issuer.
- Cryptographically valid based on proof type.

#### Signature Algorithm Support in Inji Mobile

| Format                      | Signature Algorithm              | Status        | Notes                                                                 |
|-----------------------------|----------------------------------|---------------|-----------------------------------------------------------------------|
| W3C JSON-LD                 | ED25519 2018                     | ✅Supported  | Compact, fast signatures with high security                           |
| mDoc/mDL                    | ED25519 2018                     | ✅Supported  | Used in mobile document ecosystems                                    |
| W3C JSON-LD                 | ED25519 2020                     | ✅Supported  | Updated key format with enhanced key representation                   |
| mDoc/mDL                    | ED25519 2020                     | ✅Supported  | Widely used in mobile identity contexts                               |
| W3C JSON-LD                 | RS256 (RSA with SHA-256)         | ✅Supported  | Backward compatibility; used in some legacy systems                   |
| mDoc/mDL                    | RS256 (RSA with SHA-256)         | ✅Supported  | Applicable for RSA-backed mobile IDs                                  |
| W3C JSON-LD                 | ECC K1                           | ✅Supported  | Common in OpenID ecosystem                                            |
| mDoc/mDL                    | ECC K1                           | ✅Supported  | Used in various driver license implementations                        |
| JSON-LD                     | ECC R1                           | 🔄Planned    | High-security EdDSA variant                                           |
| mDoc/mDL                    | ECC R1                           | 🔄Planned    | Emerging support for high-security mobile documents                   |
| SD-JWT                      | ECC R1                           | 🔄Planned    | For selective disclosure with strong cryptographic guarantees         |
| DIDComm v2 Messaging        | Curve25519 / X25519              | ⏳Research   | Enables secure, encrypted VP exchange                                 |
| JSON-LD ZKPs (VC-ZKP)       | BBS+                             | ⏳Research   | For advanced privacy-preserving credentials using Zero-Knowledge Proofs |


### 🟢 Feature(c): Sharing Verifiable Credentials

Inji Wallet supports secure sharing of Verifiable Credentials (VCs) in multiple ways — both **online and offline** — with strong privacy and authentication.

| Method                     | Description                                                                                     | Connectivity | User Control / Notes                              |
|----------------------------|-------------------------------------------------------------------------------------------------|--------------|---------------------------------------------------|
| **QR Code Sharing**        | Generate QR using PixelPass. Scan or upload on verifier portal.                                | ✅ Online     | Quick and compact                                 |
| **BLE (Bluetooth) Sharing**| Share VCs offline using Bluetooth Low Energy.                                                  | ❌ Offline    | Peer-to-peer; face match supported                |
| **SSO via QR Code**        | Scan QR on service portal → share selected VCs after user consent.                             | ✅ Online     | Fine-grained VC selection and SSO login           |
| **OpenID4VP – Cross-Device**| Scan verifier’s QR from another device → present VCs post face verification.                  | ✅ Online     | Secure, decentralized VC presentation             |
| **OpenID4VP – Same Device**| Tap QR on browser → deep-link opens wallet → share credentials.                                | ✅ Online     | Seamless redirect                                 |

**Note:** All methods include **user consent** and **privacy-by-design** to ensure secure, context-aware interactions.


### 🟢 Feature(d): Backup and Restore

Inji Wallet includes a secure, one-time backup setup based on the platform:

| Platform | Backup Option | Notes                        |
|----------|----------------|------------------------------|
| Android  | Google Drive   | Select Google account        |
| iOS      | iCloud         | Uses logged-in Apple account |

**Ideal for:**
- Phone upgrades
- App crashes or resets


### 🟢 Feature(e): User-Friendly Interface & Quick Actions

Designed for ease of use with intuitive UI components:
- Multiple VC Views: Mini cards to full detail
- Separation of Downloaded vs. Received VCs
- Quick Access Menu: Share, Share with Selfie via the kebab menu (⋮) on card
- Select from a list of credential types offered by the issuer.
- Choose only the VCs they want to download, ensuring relevance and control.
- VCs grouped by type (ID, insurance, education)
- Recent VCs shown first


### 🟢 Feature(f): Wallet Security & Device Features

- **Biometric / Passcode Access**  
  - App requires authentication on every open or session timeout  
  - Supports Android biometrics and Apple Face ID / Touch ID

- **Private Key Storage in Secure Enclave**  
  - Private keys are stored using Android Keystore / iOS Secure Enclave  
  - Keys cannot be exported or tampered

### 🟡 Planned Features

- Revocation Status
- SD-JWT Selective Disclosure
- Injii Mobile Wallet Login
- Presentation during Issuance

🔗 Refer to the [Inji Wallet User Guide](https://docs.inji.io/inji-wallet/inji-mobile/functional-overview/end-user-guide)  
🔗 See [Feature Workflows](https://docs.inji.io/inji-wallet/inji-mobile/functional-overview/feature-workflows)  
🎬 Watch [Feature Demo Video](https://youtu.be/9Z1WuTd8q0M)
