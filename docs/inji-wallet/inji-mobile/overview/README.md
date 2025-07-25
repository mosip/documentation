---
icon: house
---

# Overview

> Inji Mobile isn't just a wallet – it’s a gateway to digital trust, empowering every individual to carry their identity with dignity, privacy, and control.\
> — Inspired by the vision of open, inclusive digital identity ecosystems.

**Inji Mobile** is an open-source mobile wallet built to securely **receive, store, manage, and share Verifiable Credentials (VCs)**, whether online or offline. Designed in line with global standards such as **W3C VC Data Model**, **OpenID4VCI**, **OpenID4VP**, **ISO 18013-5 (mDL)**, and **IETF SD-JWT**, Inji Mobile enables individuals to carry digital identity, documents, certificates e.t.c with full privacy, consent, and control.

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

#### Secure Storage of VCs

* Digitally signed credentials from trusted issuers
* Encrypted and integrity-verified local storage

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

### How It Works

1. **Credential Download**\
   Users can obtain VCs using their unique identifiers (UIN/VID or other methods), authenticate via OTP, and securely store them.
2. **Credential Storage**\
   All credentials are stored encrypted, verified using the issuer’s digital signature, and integrity is validated via unique **HASH**.
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

* Support for **W3C Data Model 2.0** and **SVG Templates**
* **Selective Disclosure** using **SD-JWT**
* Support for **JWT-format credentials**
* **Presentation During Issuance**
* **Wallet Login with IdPs** (OpenID4VP-based WLA)
* **Credential Revocation Support**

### Summary

**Inji Mobile** is more than just a credential wallet, it’s a **reference implementation** for inclusive, offline-capable, standards-compliant digital identity. With full support for online and offline VC flows, strong cryptographic safeguards, and a user-first design, it provides a powerful tool for citizens, developers, and governments alike. Inji Mobile gives you the **interoperable building blocks** you need.

### Technology and Integration

1. The app leverages [**Mimoto APIs**](https://mosip.stoplight.io/docs/mimoto/k6907m3dzc1gi-mimoto)

* Wallet configuration and trusted issuer setup
* VC download
* Holder binding of credentials (public key association)

2. Refer to [**Inji Certify APIs**](https://mosip.stoplight.io/docs/inji-certify/25f435617408e-inji-certify)

* Fetch issuer well-known metadata
* Download VCs (OpenID4VCI flow)

3. Additionally, it utilises [**eSignet APIs**](https://mosip.stoplight.io/docs/identity-provider/zevye0dm733qx-link-transaction-endpoint-v2) to enable seamless online login for users.

### Get Involved

For any queries, contributions, or to collaborate, join us on the [**Inji community forum**](https://community.mosip.io/c/inji/16) or raise a PR via the [**GitHub repository**](https://github.com/mosip/inji-wallet).


<!--
Content Update
Copied: 13 July 2025
Reviewed and Edited: 13-14 July 2025

Overview
Inji provides a way to share tamper-proof, instantly verifiable data which is cryptographically signed by a trusted issuer, and users can store them securely on their devices or browsers and share them when needed.



What is Verifiable Credentials and how does it help?

Verifiable Credentials (VCs) provide a way to share tamper-proof, instantly verifiable data. They are cryptographically signed by a trusted issuer, and users can store them securely on their devices or browsers and share them when needed.

Examples of Verifiable Credentials include:

* A national ID issued as a digital credential
* A diploma issued by a university
* A background verification report from an employer
* A subsidy or benefit eligibility certificate from a government agency

VCs allow:
* Instant verification, even offline
* User control over when and how data is shared
* Interoperability across platforms and borders
* Reduced fraud and manual checks

These credentials are held in a secure digital wallet—either on mobile or through a web browser—and can be reused across services, eliminating repetitive processes and improving both user experience and system integrity.



What Is Inji?

Inji is a comprehensive stack that enables the secure issuance, storage, exchange, and verification of Verifiable Credentials. It replaces traditional, paper-based processes with a trusted digital-first approach, empowering individuals and simplifying service delivery across sectors.

Inji's "Triangle of Trust" in VCs:
The VC model operates on a "triangle of trust" involving three main roles:

* Issuer: The entity that issues the credential and makes claims about the subject (e.g., a university issuing a degree, a government issuing a passport, an employer issuing a work permit). The issuer cryptographically signs the VC. 
* Holder: The individual or entity who possesses the credential (e.g., the student with the degree, the citizen with the passport, the employee with the work permit). The holder stores and manages their VCs.

* Verifier: The entity that requests and verifies the credential to confirm a claim (e.g., an employer checking a degree, a border agent checking a passport, a landlord checking a work permit). The verifier checks the cryptographic proofs to ensure the VC's authenticity and integrity.


How it work (simplified):
* Issuance: An issuer creates a digital credential with claims about a subject and cryptographically signs it.
* Holding: The signed credential is then given to the holder, who stores it securely in a digital wallet or similar application.
* Presentation: When needed, the holder can present the VC (or a verifiable presentation, which can include multiple VCs or selectively disclosed information) to a verifier.
* Verification: The verifier uses the cryptographic proofs within the VC to confirm that it was issued by a trusted party and has not been tampered with. This verification often involves checking against a "Verifiable Data Registry" where public keys of issuers are stored.



















Inji’s Key Capabilities


Secure Issuance: Issue verifiable credentials with digital signatures, ensuring authenticity.

Cross-Platform Accessibility: Available via mobile app or web interface, ensuring inclusivity for all users.

Privacy-Preserving Sharing: Users control what they share, with whom, and for how long.

Offline Compatibility: Works in low-connectivity or offline environments, critical for inclusion.

Fast, Trusted Verification: Credentials can be verified quickly and securely, even by non-technical service providers.


Inji Stack Components

Inji Certify – Credential Issuance

Enables trusted entities to issue digitally signed credentials. Supports:

* Multiple formats: JSON-LD, SD-JWT,mDOC and many more.

 A tool that enables issuers to seamlessly connect with existing data sources to issue verifiable credentials.

* Connecting with existing databases and offering configurable credential schemas, it caters to diverse use cases across different sectors and industries.


Inji Wallet – Credential Holding and Sharing

Empowers users to manage their credentials on different devices:

* Inji Mobile: Android and iOS app to download, store, and present credentials securely

* Inji Web: Browser-based wallet for users without smartphones, offering print and share features



Inji Verify – Credential Verification

Allows service providers and organisations to:

* Scan and validate credentials
* Check credential status (validity, expiry, revocation)
* Integrate with existing onboarding or service workflows


Inji Infra – Supporting Infrastructure(Upcoming)

Provides foundational services for:

* Revocation management
* Ledger and credential status checks
* Federation and audit trail support


Inji Govern – Governance and Policy Management(Upcoming)

Manages rules, schemas, and compliance:

* Policy definition for credential lifecycle
* Schema and credential registry management
* Assurance levels for ecosystem participants


# Real-World Applications

Healthcare: Immunization records, medical certification

Education: Degrees, training certificates, and learning records

Social Welfare: Benefit eligibility, ration cards

Finance: KYC credentials, account onboarding

Mobility: Driving licenses, transportation passes

Employment: Job credentials, background checks

Many more……….



# Interoperability and Standards

Inji follows widely adopted open standards, ensuring flexibility and long-term sustainability:

* W3C Verifiable Credentials Data Model
* OpenID for Verifiable Presentation (OpenID4VP)
* OpenID for Verifiable Credential Issuance (OpenID4VCI)
* Claim 169
* ISO/IEC 18013-5: mDoc/mDL
* IETF SD-JWT-based Verifiable Credentials
* W3C based SD-JWT-based Verifiable Credentials
* DID (Decentralised Identifiers) support
* Can interoperate with existing IAM and identity ecosystems


# Component Diagram

This section will contain a clear diagram illustrating the interaction between Inji Certify, Inji Wallet (mobile + web), Inji Verify. The diagram should also show the componets involved to build Inji.

[Image]


Summary

Inji provides a secure, inclusive, and interoperable solution for issuing and managing digital credentials. By enabling individuals to hold their credentials and share them when needed, Inji supports faster access to services while protecting privacy and reducing fraud.

Whether you are:

* A user needing better control over their identity and credentials,
* An issuer needing to deliver secure digital certificates, or
* A verifier needing reliable proof of information,

Inji offers the tools you need to make digital credentialing simple, trusted, and universal.
