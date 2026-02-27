---
icon: house
---

# Overview

> Inji Mobile isn't just a wallet – it’s a gateway to digital trust, empowering every individual to carry their identity with dignity, privacy, and control.\
> — Inspired by the vision of open, inclusive digital identity ecosystems.

**Inji Mobile** is an open-source mobile wallet built to securely **receive, store, manage, and share Verifiable Credentials (VCs)**, whether online or offline. Designed in line with global standards such as **W3C VC Data Model**, **OpenID4VCI**, **OpenID4VP**, **ISO 18013-5 (mDL)**, and **IETF SD-JWT**, Inji Mobile enables individuals to carry digital identity, documents, certificates, etc., with full privacy, consent, and control.

Whether you're a citizen accessing government services, a developer building digital identity applications, or a verifier validating credentials, Inji Mobile offers a trusted, standards-compliant foundation for secure and privacy-preserving interactions. As a **reference implementation**, Inji Mobile is both a ready-to-use wallet and a modular solution; its SDKs, libraries, and components can be used independently or bundled into custom apps, depending on the adopter’s needs and specific use cases.

### Core Design Principles

* **Interoperability-First**\
  Complies with major standards: OpenID4VCI, OpenID4VP, W3C Data Model, IETF SD-JWT, JWT VC, and ISO mDL/mDoc.
* **Offline Functionality**\
  BLE-based VC sharing and **offline face authentication**, ensuring usability even in no-connectivity environments.
* **User Sovereignty**\
  Credentials are held entirely by the user, with **granular consent-driven sharing**.
* **Modular Security Architecture**\
  Combines robust cryptography with flexible authentication mechanisms and strong privacy guarantees.
* **Cross-Platform Native Implementation**\
  Built in **React Native** with Kotlin (Android) and Swift (iOS) integrations for native performance.

### Capabilities Snapshot

#### Multiple Credential Format Support

Inji Wallet is designed for interoperability and flexibility by supporting a wide range of credential formats:

* **W3C Verifiable Credentials (JSON-LD VCs) Data Model 1.1 and Data Model 2.0**
  * Standards-based credential format is widely adopted across ecosystems.
  * Suitable for general-purpose credential issuance and verification.
* **ISO 18013-5 (mDL)**
  * Mobile Driving License and Mobile Document specification.
  * Supports use cases like identity verification in transport, law enforcement, and service access.
* **IETF SD-JWT**
  * **IETF** **SD-JWT Verifiable Credentials**: Enables holders to download and share credentials in IETF **SD-JWT format**. This allows users to share only the necessary attributes while keeping other data private, ensuring **privacy-preserving credential sharing**.
  * Allows users to share only the required claims with verifiers via the OpenIDVP flow, where these selectively disclosable claims can be shared as per the user's need.&#x20;

This multi-format support allows Inji Wallet to work seamlessly across different ecosystems, ensuring **compatibility, security, and user privacy**.

#### Secure Storage of VCs

* Digitally signed credentials from trusted issuers
* Encrypted and integrity-verified local storage.
* Supports multiple credential formats including W3C JSON-LD VCs, ISO mDL/mDoc, and **IETF SD-JWT.**

#### Seamless Credential Sharing

* **Offline sharing** via [Bluetooth Low Energy (BLE)](https://tlodderstedt.github.io/openid-for-verifiable-presentations-offline-1_0-00.html)
* **Online presentation** using QR-code SSO and [OpenID4VP](https://openid.net/specs/openid-4-verifiable-presentations-1_0.html)
* Supports **same-device and cross-device** interactions

#### Authentication & Face Verification

* Offline **face match verification** to authenticate the user during VC sharing
* Device-level biometric/passcode unlock for app access

#### Deep Link-Based SSO (Wallet Login Authentication - WLA)

* Tap-to-login via QR code scanning
* Smart redirection to service post-verification
* Works across any OpenID4VP-compliant verifier

#### Credential Download via Pre-Auth Code

* Download credentials via **pre-authorized flow**
* Supports various credential types: national IDs, driver's licenses, health cards, academic degrees, etc.

#### **SD-JWT OpenIDVP Support**

* Inji Mobile supports **Selective Disclosure JWT (SD-JWT)** credentials.
* Enables **privacy-preserving presentations**, where users can share only the specific attributes required by a verifier, rather than the entire credential.
* Fully compliant with the **OpenID for Verifiable Presentations Draft 23 (OpenID4VP)** specification for SD-JWT.
* Improves compatibility with ecosystems adopting **SD-JWT and OpenID-based verifiable presentation**.

#### **SVG-Based Credential Rendering**

* Introduces support for **SVG templates** via the **Inji VC Renderer** library.
* Allows credentials to be rendered in a **visually rich, scalable, and customizable format**.
* Enables **dynamic layouts**, inclusion of **logos, photos, and design elements**, while staying aligned with the **W3C VC Data Model 2.0**.
* Improves on-screen display and print-ready credential rendering experience.

#### Revocation Support

* **Automatically checks if a card is still valid** by reading the issuer’s revocation list whenever a credential is downloaded or refreshed.
* **Uses W3C Bitstring Status List**, ensuring global, standards-based detection of revoked.
* **Shows clear status indicators** (Valid, Revoked, Pending) so users immediately know whether a card can be safely shared.
* Supports manual status checks&#x20;

#### Presentation During Issuance (PDI)

Inji Mobile supports **Presentation During Issuance (PDI)** a secure flow where users can **prove eligibility using an existing credential before receiving a new one**.

Instead of repeating identity checks or submitting documents again, the wallet can present a **Verifiable Presentation (VP)** of an already stored credential to the issuer during the issuance process.

**Example:** Present your **National ID credential** → Receive a **Driving License or Health Card**

* Receive new credentials faster without repeating onboarding steps
* Reuse trusted credentials already stored in the wallet
* Approve exactly what information is shared before issuance

## Claim-169 QR Code Support

Inji Mobile supports **Claim-169 QR Codes**, a standardized QR format used to support receiving and using Verifiable Credentials (VCs) that contain **Claim 169–formatted QR code blocks**, issued as **CBOR-based CWT (CBOR Web Tokens)** inside the credential.\
This ensures secure, compact, and privacy-preserving QR sharing ideally suited for offline or quick verification scenarios.

The goal of this feature is to allow the wallet to:

* Download credentials containing embedded Claim 169 QR blocks
* Store and render these QR blocks for display
* Allow users to present the QR-based identity data when required
* Ensure proper validation and security checks (size, format, signature, structure)

### How It Works

1. **Credential Download**\
   Users can obtain VCs using their unique identifiers (UIN/VID or other methods), authenticate via OTP, and securely store them.
2. **Credential Storage**\
   All credentials are stored encrypted, verified using the issuer’s digital signature, and integrity is validated via a unique **HASH**. In addition to standard VC formats, Inji Mobile supports JSON-LD, ISO mDL/mDoc and IETF SD-JWT credentials, ensuring the privacy-preserving selective disclosure of claims during verification.
3. **Sharing Credentials**\
   Users can share credentials:
   * Offline using BLE
   * Online by scanning QR codes via OpenID4VP
   * Simple Upload and Scan of QR codes
4. **Face Verification**\
   Optional offline face authentication ensures the right holder is presenting credentials during in-person verifications.
5. **Consent & Privacy**\
   Credential sharing is **consent-based**, giving users full control over what data is shared and with whom.

### Sneak Peek: Upcoming Features

* Support for **JWT-format credentials**
* **Wallet Login with IdPs**&#x20;
* Multiple Profile Creation
* Credential Refresh Support

### Technology and Integration

1. The app leverages [**Mimoto APIs**](https://mosip.stoplight.io/docs/mimoto/k6907m3dzc1gi-mimoto)

* Wallet configuration and trusted issuer setup
* VC download
* Holder binding of credentials (public key association)

2. Refer to [**Inji Certify APIs**](https://mosip.stoplight.io/docs/inji-certify/25f435617408e-inji-certify)

* Fetch issuer's well-known metadata
* Download VCs (OpenID4VCI flow)

3. Additionally, it utilises [**eSignet APIs**](https://mosip.stoplight.io/docs/identity-provider/zevye0dm733qx-link-transaction-endpoint-v2) to enable seamless online login for users.

### Summary

**Inji Mobile** is more than just a credential wallet; it’s a **reference implementation** for inclusive, offline-capable, standards-compliant digital identity. With full support for online and offline VC flows, strong cryptographic safeguards, and a user-first design, it provides a powerful tool for citizens, developers, and governments alike. Inji Mobile gives you the **interoperable building blocks** you need.

### Get Involved

For any queries, contributions, or to collaborate, join us on the [**Inji community forum**](https://community.mosip.io/c/inji/16) or raise a PR via the [**GitHub repository**](https://github.com/mosip/inji-wallet).
