---
icon: house
---

# Overview

> _"Inji Mobile isn't just a wallet – it’s a gateway to digital trust, empowering every individual to carry their identity with dignity, privacy, and control."_  
> — Inspired by the vision of open, inclusive digital identity ecosystems


**Inji Mobile** is an open-source mobile wallet built to securely **receive, store, manage, and share Verifiable Credentials (VCs)**, whether online or offline. Designed in line with global standards such as **W3C VC Data Model**, **OpenID4VCI**, **OpenID4VP**, **ISO 18013-5 (mDL)**, and **IETF SD-JWT**, Inji Mobile enables individuals to carry digital identity, documents, certificates e.t.c with full privacy, consent, and control.

Whether you're a citizen accessing government services, a developer building digital identity applications, or a verifier validating credentials, Inji Mobile offers a trusted, standards-compliant foundation for secure and privacy-preserving interactions. As a **reference implementation**, Inji Mobile is both a ready-to-use wallet and a modular solution — its SDKs, libraries, and components can be used independently or bundled into custom apps, depending on the adopter’s needs and specific use cases.


### Core Design Principles

- **Interoperability-First**  
  Complies with major standards: OpenID4VCI, OpenID4VP, W3C Data Model, IETF SD-JWT, JWT VC, and ISO mDL/mDoc.

- **Offline Functionality**  
  BLE-based VC sharing and **offline face authentication**, ensuring usability even in no-connectivity environments.

- **User Sovereignty**  
  Credentials are held entirely by the user, with **granular consent-driven sharing**.

- **Modular Security Architecture**  
  Combines robust cryptography with flexible authentication mechanisms and strong privacy guarantees.

- **Cross-Platform Native Implementation**  
  Built in **React Native** with Kotlin (Android) and Swift (iOS) integrations for native performance.


### Capabilities Snapshot

#### Secure Storage of VCs

- Digitally signed credentials from trusted issuers  
- Encrypted and integrity-verified local storage  

#### Seamless Credential Sharing

- **Offline sharing** via [Bluetooth Low Energy (BLE)](https://tlodderstedt.github.io/openid-for-verifiable-presentations-offline-1_0-00.html)  
- **Online presentation** using QR-code SSO and [OpenID4VP](https://openid.net/specs/openid-4-verifiable-presentations-1_0.html)  
- Supports **same-device and cross-device** interactions  

#### Authentication & Face Verification

- Offline **face match verification** to authenticate the user during VC sharing  
- Device-level biometric/passcode unlock for app access  

#### Deep Link-Based SSO (Wallet Login Authentication - WLA)

- Tap-to-login via QR code scanning  
- Smart redirection to service post-verification  
- Works across any OpenID4VP-compliant verifier  

#### Credential Download via Pre-Auth Code

- Download credentials via **pre-authorized flow**  
- Supports various credential types: national IDs, driver's licenses, health cards, academic degrees, etc.

### How It Works

1. **Credential Download**  
   Users can obtain VCs using their unique identifiers (UIN/VID or other methods), authenticate via OTP, and securely store them.

2. **Credential Storage**  
   All credentials are stored encrypted, verified using the issuer’s digital signature, and integrity is validated via unique **HASH**.

3. **Sharing Credentials**  
   Users can share credentials:
   - Offline using BLE  
   - Online by scanning QR codes via OpenID4VP
   - Simple Upload and Scan of QR codes

4. **Face Verification**  
   Optional offline face authentication ensures the right holder is presenting credentials during in-person verifications.

5. **Consent & Privacy**  
   Credential sharing is **consent-based**, giving users full control over what data is shared and with whom.

### Sneak Peek: Upcoming Features

- Support for **W3C Data Model 2.0** and **SVG Templates**  
- **Selective Disclosure** using **SD-JWT**  
- Support for **JWT-format credentials**  
- **Presentation During Issuance**  
- **Wallet Login with IdPs** (OpenID4VP-based WLA)  
- **Credential Revocation Support**

### Summary

**Inji Mobile** is more than just a credential wallet, it’s a **reference implementation** for inclusive, offline-capable, standards-compliant digital identity. With full support for online and offline VC flows, strong cryptographic safeguards, and a user-first design, it provides a powerful tool for citizens, developers, and governments alike. Inji Mobile gives you the **interoperable building blocks** you need.


### Technology and Integration

1. The app leverages **[Mimoto APIs](https://mosip.stoplight.io/docs/mimoto/k6907m3dzc1gi-mimoto)**

- Wallet configuration and trusted issuer setup  
- VC download  
- Holder binding of credentials (public key association)  

2. Refer to **[Inji Certify APIs](https://mosip.stoplight.io/docs/inji-certify/25f435617408e-inji-certify)**

- Fetch issuer well-known metadata  
- Download VCs (OpenID4VCI flow)

3. Additionally, it utilises **[eSignet APIs](https://mosip.stoplight.io/docs/identity-provider/zevye0dm733qx-link-transaction-endpoint-v2)** to enable seamless online login for users.

## Get Involved

For any queries, contributions, or to collaborate, join us on the [**Inji community forum**](https://community.mosip.io/c/inji/16) or raise a PR via the [**GitHub repository**](https://github.com/mosip/inji-mobile).

