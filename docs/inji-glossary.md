# Inji Verifiable Credentials Stack - Glossary of Terms

> **Note**: This glossary provides a comprehensive list of terms and definitions used in the Verifiable Credentials ecosystem. Terms are categorized for easy reference across different personas including Business Leaders, CPOs, Tech Leaders, Developers, Implementers, and Users.
>
> **Sources**: All definitions are sourced exclusively from the Inji codebase, Inji GitHub repositories (inji-certify, inji-wallet, inji-web, inji-verify), and Community.mosip.io. Terms marked with *[Definition pending]* require input from internal SMEs and stakeholders.

---

## Core Verifiable Credentials Concepts

### Verifiable Credential (VC)
A tamper-proof, instantly verifiable data format that is cryptographically signed by a trusted issuer. Users can store VCs securely on their devices or browsers and share them when needed. VCs are digital versions of trusted documents (e.g., IDs, certificates) that can be securely shared and instantly verified.

*Source: Inji documentation, inji-certify README*

### Verifiable Presentation (VP)
A cryptographically secured package containing one or more Verifiable Credentials that a holder shares with a verifier. The wallet generates a Verifiable Presentation containing only the selected claims, which is then securely shared with the verifier.

*Source: Inji Wallet documentation*

### Credential Subject
The entity about whom claims are made in a Verifiable Credential. For example, in an employee credential, the employee is the credential subject about whom claims like job title and employee number are made.

*Source: Inji Verify overview*

### Credential Holder
The individual or entity which possesses the credential (e.g., the student with the degree, the citizen with the passport, the employee with the work permit). The holder stores and manages their VCs. Inji's 'Holder-module' is called Inji Wallet.

*Source: Inji documentation*

### Credential Issuer
The entity that issues the credential and makes claims about the subject (e.g., a university issuing a degree, a government issuing a passport, an employer issuing a work permit). The issuer cryptographically signs the VC. Inji's 'Issuance-module' is called Inji Certify.

*Source: Inji documentation*

### Credential Verifier
The entity that requests and verifies the credential to confirm a claim (e.g., an employer checking a degree, a border agent checking a passport, a landlord checking a work permit). The verifier checks the cryptographic proofs to ensure the VC's authenticity and integrity. Inji Verify is MOSIP's verification module.

*Source: Inji documentation*

### Claim
An immutable statement made about the credential subject, such as employee number, job title, name, or date of birth. Claims are cryptographically signed by the issuer to ensure they cannot be tampered with.

*Source: Inji Verify overview*

### Proof
Cryptographic methods used to verify the data source and ensure data integrity. Proofs utilize cryptographic methods to verify the data source and ensure data integrity. Supported proof types include JWT, JSON-LD proof, and IETF SD-JWT.

*Source: Inji Verify overview, Inji Wallet documentation*

### Trust Framework
*[Definition pending]*

### Credential Schema
The structure that defines the format, fields, and validation rules for a specific type of Verifiable Credential. Issuers can configure credential schemas for different certificate types, generating credentials in different VC formats.

*Source: Inji Certify overview*

### Credential Type
A category of credential that defines what kind of information it contains (e.g., National ID, Insurance Credential, Driver's License). A single issuer can manage and issue multiple types of verifiable credentials within the same ecosystem.

*Source: Inji Certify features*

### Credential Status
The current state of a Verifiable Credential, which can be: **Valid** (credential is active and verified), **Revoked** (credential has been invalidated by the issuer), **Expired** (credential has passed its validity period), or **Pending** (credential status is being checked).

*Source: Inji Wallet features*

### Credential Offer
A mechanism for issuers to initiate credential issuance to holders. Can be delivered via a credential_offer URI with or without a pre-authorization code.

*Source: Inji Wallet features*

### Credential Manifest
*[Definition pending]*

### Credential Binding
The process of cryptographically linking a credential to its intended holder to prevent unauthorized use. Inji Certify supports credential binding with DID keys and JWT proof.

*Source: inji-certify README*

### Holder Binding
Verifying that the credential is bound to the correct holder, especially in cases where the VC includes a subject proof (e.g., via DID or SD-JWT binding).

*Source: Inji Wallet features*

### Key Binding
*[Definition pending]*

### Credential Revocation
The process by which an issuer invalidates a Verifiable Credential before its natural expiry. Inji Certify maintains a Revocation List and provides Revocation APIs allowing issuers to mark credentials as revoked. Verifiers can check whether a credential is valid or revoked using the Verification API.

*Source: Inji Certify features*

### Credential Expiry
The date after which a Verifiable Credential is no longer considered valid. Credential metadata includes the expiry date, and Inji Wallet performs expiry checks during verification.

*Source: Inji Wallet features*

### Credential Lifecycle
The complete journey of a credential from issuance through storage, presentation, potential revocation, and eventual expiry.

*Source: Inji FAQ*

### Credential Exchange
*[Definition pending]*

### Credential Issuance
The process by which an issuer creates, signs, and delivers a Verifiable Credential to a holder. An issuer creates a digital credential with claims about a subject and cryptographically signs it.

*Source: Inji documentation*

### Credential Verification
The process by which a verifier uses cryptographic proofs within the VC to confirm that it was issued by a trusted party and has not been tampered with. This often involves checking against a Verifiable Data Registry where public keys of issuers are stored.

*Source: Inji documentation*

### Credential Presentation
When the holder presents the VC (or a verifiable presentation, which can include multiple VCs or selectively disclosed information) to a verifier for verification purposes.

*Source: Inji documentation*

### Credential Storage
The secure storage of Verifiable Credentials on a user's device or in a secure cloud storage. After successful verification, the Verifiable Credential is securely stored in the wallet platform's secure storage solution to ensure reliable and convenient access.

*Source: Inji Web workflow*

---

## Identity Standards and Protocols

### Decentralized Identifier (DID)
A new type of identifier that enables verifiable, decentralized digital identity. Inji uses W3C DID standards for self-sovereign identity. All identities in Sunbird-RC are DID-compliant and are web-resolvable.

*Source: Inji Certify architecture, Standards documentation*

### DID Document
*[Definition pending]*

### DID Method
*[Definition pending]*

### Self-Sovereign Identity (SSI)
An approach to digital identity that gives individuals control over their own identity data. Inji follows SSI principles by enabling holders to store credentials on their devices and control when and how data is shared.

*Source: Inji Standards documentation*

### Linked Data
*[Definition pending]*

### JSON-LD (JSON Linked Data)
A format for encoding Verifiable Credentials using JSON with linked data context. Inji supports JSON-LD credentials with standards-based Linked Data Proofs, widely adopted across ecosystems for interoperability and verifiability.

*Source: Inji Certify features*

### JSON Web Token (JWT)
A compact, URL-safe format for representing claims securely between two parties. JWT is one of the supported credential formats in Inji, enabling efficient transmission and verification across web and enterprise systems.

*Source: Inji Certify features*

### JSON Web Signature (JWS)
A standard for digitally signing content using JSON-based data structures. Signed JWT (JWS) credentials enable compact, JSON-based credentials that enable efficient transmission and verification.

*Source: Inji Certify features*

### JSON Web Key (JWK)
*[Definition pending]*

### JSON Web Encryption (JWE)
*[Definition pending]*

### CBOR (Concise Binary Object Representation)
A binary data format used for compact, efficient encoding of data. PixelPass uses CBOR encoding to compress JSON data for more efficient QR code generation.

*Source: PixelPass documentation*

### COSE (CBOR Object Signing and Encryption)
*[Definition pending]*

### W3C VC Data Model 1.1
The W3C Verifiable Credentials Data Model version 1.1, which Inji supports for issuing, presenting, and verifying digital credentials across different identity ecosystems.

*Source: Inji Standards documentation*

### W3C VC Data Model 2.0
The W3C Verifiable Credentials Data Model version 2.0, which Inji Certify supports alongside version 1.1. Inji Wallet now supports SVG-based credential rendering for Data Model 2.0 VCs.

*Source: Inji Wallet features, Inji Certify overview*

### OpenID Connect (OIDC)
An authentication layer built on top of OAuth 2.0. eSignet implements OpenID Connect flows that help relying parties perform quick integrations using pre-existing libraries for user verification.

*Source: Inji Certify architecture*

### OAuth 2.0
An authorization framework that enables applications to obtain limited access to user accounts. Inji Certify implements OAuth 2.0-based authorization for credential issuance and supports integration with OAuth 2.0 compliant authentication services like eSignet and Keycloak.

*Source: Inji Standards documentation, Inji Certify features*

### OpenID4VCI (OpenID for Verifiable Credential Issuance)
A standardized protocol for issuing verifiable credentials securely to digital wallets. Inji Certify follows OpenID4VCI draft 13 standard for secure credential delivery. It facilitates the secure issuance of VCs to holders and supports various credential formats including SD-JWT and mDoc/mDL.

*Source: Inji Certify overview, Standards documentation*

### OpenID4VP (OpenID for Verifiable Presentations)
A protocol that enables selective disclosure of credentials while maintaining user privacy. It supports QR code-based and deep-linking mechanisms for credential presentation and ensures verifier authentication to prevent unauthorized access.

*Source: Inji Standards documentation*

### IETF SD-JWT (Selective Disclosure JWT)
Privacy-preserving credentials that allow holders to selectively disclose attributes while keeping the rest private. Enables holders to download and share credentials in SD-JWT format, allowing users to share only the necessary attributes while keeping other data private.

*Source: Inji Wallet features, Inji Certify features*

### ISO 18013-5 (mDL Standard)
The international standard for Mobile Driving Licenses (mDL) and Mobile Documents (mDoc). Inji supports this standard for secure, offline-verifiable digital documents with NFC and QR-based interactions for secure credential exchange.

*Source: Inji Standards documentation*

### mDoc (Mobile Document)
A mobile document format specified in ISO 18013-5/7 for secure, offline-verifiable digital documents. Inji Certify has upcoming support for full mDoc implementation.

*Source: Inji Certify features*

### mDL (Mobile Driving License)
A mobile driver's license format as specified in ISO 18013-5, enabling secure and convenient digital driver's license presentation on mobile devices. Inji Wallet supports mDoc credentials from issuers like the Veridonia Department of Motor Vehicles.

*Source: Inji Wallet features, Inji Certify features*

### Claim 169 (IANA CBOR Web Token)
A compact, privacy-preserving claims format for credentials registered with IANA. It provides a compact format for credentials and is part of the standards Inji follows.

*Source: Inji Standards documentation*

---

## Cryptographic Concepts

### Digital Signature
A cryptographic mechanism used by issuers to sign credentials, guaranteeing authenticity, integrity, and tamper resistance. Every credential issued by Inji Certify is protected through digital signatures.

*Source: Inji Certify features*

### Public Key
A cryptographic key that can be shared publicly and is used by verifiers to confirm the issuer's signature on a credential. The verifier uses the issuer's public key to confirm the signature.

*Source: Inji FAQ*

### Private Key
A cryptographic key kept secret by the issuer and used to sign credentials. The issuer signs the credential with their private key. In Inji Wallet, private keys are stored using Android Keystore or iOS Secure Enclave and cannot be exported or tampered with.

*Source: Inji FAQ, Inji Wallet features*

### Key Pair
A combination of a public key and a private key generated together. When credentials are activated, a keypair is generated in the phone and the public key is synced with the server.

*Source: Mimoto documentation*

### Cryptographic Proof
A mathematical proof that verifies data authenticity and integrity. Inji Mobile Wallet verifies that VCs are cryptographically valid based on proof type, verifying the integrity of the data using appropriate proof mechanisms.

*Source: Inji Wallet features*

### Key Management
The administration of cryptographic keys including generation, storage, rotation, and destruction. The Keymanager Service in Inji Certify manages cryptographic keys used for signing and verifying credentials, ensuring secure storage and retrieval.

*Source: Inji Certify architecture*

### Hardware Security Module (HSM)
A physical computing device that safeguards and manages cryptographic keys. Inji Certify's infrastructure includes HSM for secure key management.

*Source: Inji Certify architecture*

### Secure Enclave
A hardware-based security feature on iOS devices that provides a secure environment for cryptographic operations. Inji Wallet stores private keys using the iOS Secure Enclave, ensuring keys cannot be exported or tampered with.

*Source: Inji Wallet features, Secure Keystore documentation*

### Secure Keystore
A cross-platform cryptographic key management library for Android and iOS, supporting secure key generation, encryption/decryption, HMAC, and digital signatures using native platform security features (Android Keystore and iOS Keychain/Secure Enclave). Supports Android 6.0+ (Hardware-backed keystore) and iOS 13.0+ (Secure Enclave + Keychain).

*Source: Secure Keystore documentation*

### RS256 (RSA Signature with SHA-256)
An RSA-based signature algorithm supported by Inji Certify for signing credentials. Part of the configurable signing algorithms available to issuers.

*Source: Inji Certify features*

### ES256 (ECDSA Signature with SHA-256)
An Elliptic Curve signature algorithm using the P-256 curve. Inji's Secure Keystore supports ES256 for digital signatures.

*Source: Secure Keystore documentation*

### EdDSA (Edwards-curve Digital Signature Algorithm)
A modern digital signature scheme using Edwards curves. Inji Certify supports EdDSA for credential signing, ensuring compatibility with modern secure systems and broader wallet ecosystems.

*Source: Inji Certify features*

### Ed25519
A specific implementation of EdDSA using the Curve25519 curve. Inji supports Ed25519 Verification Key 2018 and Ed25519 Verification Key 2020 for credential verification. Inji's cryptographic implementation uses Ephemeral Key Pairs generated from X25519 curve.

*Source: Inji Verify overview, Tuvali documentation*

### Proof Type
The identifier for the cryptographic method used to create a proof. Supported proof types include JWT proof. Currently, Inji Certify supports JWT proof type for credential binding.

*Source: Inji Certify README, Inji FAQ*

### Proof Purpose
*[Definition pending]*

### Proof Value
*[Definition pending]*

### Zero-Knowledge Proof (ZKP)
*[Definition pending]*

### BBS+ Signatures
*[Definition pending]*

### Key Rotation
*[Definition pending]*

### Key Derivation
The process of deriving cryptographic keys from a shared secret. In Tuvali, Wallet and Verifier derive respective keys using HKDF as defined in RFC5869.

*Source: Tuvali documentation*

---

## Privacy and Security

### Selective Disclosure
A privacy-preserving feature that allows users to share only specific claims from a credential while keeping other attributes private. IETF SD-JWT support allows credential holders to share only required claims/attributes with verifiers.

*Source: Inji Wallet features, Inji FAQ*

### Minimal Disclosure
The principle of sharing only the minimum amount of information necessary for a specific verification purpose. SD-JWT credentials ensure privacy-preserving and minimal disclosure of information.

*Source: Inji Wallet documentation*

### Data Minimization
A privacy principle ensuring only necessary data is collected and shared. All Inji sharing methods include user consent and privacy-by-design to ensure secure, context-aware interactions.

*Source: Inji Wallet features*

### Privacy by Design
An approach where privacy considerations are embedded into the design and architecture of systems. All Inji Wallet sharing methods include user consent and privacy-by-design.

*Source: Inji Wallet features*

### Consent Management
The process of managing user permissions for data sharing. Users explicitly choose when and what to share with verifiers.

*Source: Inji FAQ*

### User Consent
Explicit permission from the user before sharing credential data. All sharing methods in Inji include user consent, and credentials are shared only after the user confirms consent.

*Source: Inji Wallet features*

### Privacy-Preserving Credential Sharing
Sharing credentials in a way that protects user privacy, typically through selective disclosure. IETF SD-JWT enables privacy-preserving credential sharing where users share only the necessary attributes while keeping other data private.

*Source: Inji Wallet features*

### Unlinkability
*[Definition pending]*

### Pseudonymity
*[Definition pending]*

### Tamper-Evidence
A property ensuring that any unauthorized modification to a credential can be detected. Verifiable credentials are tamper-evident, meaning any modification is detected through cryptographic verification.

*Source: Inji FAQ*

### Tamper-Proof
A property of credentials meaning data cannot be altered without detection. Inji provides tamper-proof, instantly verifiable data cryptographically signed by a trusted issuer.

*Source: Inji documentation*

### Non-Repudiation
*[Definition pending]*

### Authenticity
The property of being genuine and verified as coming from the claimed source. Verifiable QR codes utilize digital signatures to safeguard the authenticity and integrity of the data.

*Source: Inji Verify overview*

### Integrity Verification
The process of confirming that data has not been altered. Inji Wallet confirms that no field or claim in the credential has been altered since issuance.

*Source: Inji Wallet features*

### Credential Authenticity
Verification that a credential is genuine and was issued by a legitimate issuer. Inji Mobile Wallet verifies that the VC is digitally signed by a trusted issuer, ensuring the credential originates from a valid and recognized entity.

*Source: Inji Wallet features*

### Biometric Authentication
Using biological characteristics (fingerprint, face) for user authentication. Inji Wallet supports Android biometrics and Apple Face ID/Touch ID for app access and credential sharing confirmation.

*Source: Inji Wallet features*

### Face Match
A biometric verification feature that compares a live selfie with the face photo in a credential. Supported during BLE sharing and credential presentation to verify the holder's identity.

*Source: Inji Wallet features*

### Liveness Detection
*[Definition pending]*

---

## Inji Stack Components

### Inji Wallet
A digital wallet solution that empowers users to manage their credentials on different devices. It enables individuals to receive, store, and present Verifiable Credentials (VCs) securely, both online and offline.

*Source: Inji documentation*

### Inji Mobile Wallet
A mobile application (Android and iOS) specifically created to streamline all types of identification and credentials into one digital wallet. It offers secure, trustworthy, and dependable mobile Verifiable Credentials wallet designed to download, store, share VCs, enable users to log in to relying parties, and generate QR codes for offline sharing.

*Source: inji-wallet README*

### Inji Web Wallet
A browser-based wallet accessible from any computer for users who do not have access to a smartphone for accessing and using digital credentials. Users can fetch, download, store, and share credentials through a web interface.

*Source: inji-web README*

### Inji Certify
A platform that enables issuers to generate, sign, and issue verifiable credentials. It follows the OpenID4VCI (OpenID for VC Issuance) draft 13 standard and issues VCs compliant with W3C Verifiable Credentials (1.1 & 2.0). Issuers can configure credential schemas for different certificate types, generating credentials in formats such as JSON-LD, SD-JWT, etc.

*Source: Inji Certify overview*

### Inji Verify
A robust verification tool and web interface designed to validate the verifiable credentials encoded in QR codes. Users can Scan, Validate, Fetch, and Display credentials. It decodes data stored within QR codes using the PixelPass library and validates the verifiable credential.

*Source: inji-verify README, Inji Verify overview*

### Mimoto
A Backend for Frontend (BFF) service for Inji Wallet. It provides all necessary APIs to Inji Wallet and acts as a proxy for resident services. It gets requests from Inji Wallet, performs validations, and forwards them to respective services. It also handles default configuration, VC downloads, and VC activation.

*Source: Mimoto documentation*

### eSignet
An authentication service utilized by Inji Wallet for online login. Users can log in to any service provider portal integrated with eSignet. It implements OpenID Connect flows for quick and easy integrations using pre-existing libraries for user verification.

*Source: eSignet documentation*

### Tuvali
A module that supports transferring Verifiable Credentials (VCs) over Bluetooth Low Energy (BLE). It implements OpenID for VP over BLE specification for secure offline credential sharing. The transfer flow includes connection setup with cryptographic key exchange, data transfer, and connection closure.

*Source: Tuvali documentation*

### PixelPass
A versatile library designed to simplify working with QR codes and data compression. It generates QR codes from data, compresses JSON using CBOR encoding, and decodes compressed data back to original format. Available as NPM, Kotlin, Swift, and Java artifacts. Features include zlib compression (level 9), base45 encoding/decoding, and CBOR encoding/decoding for JSON data.

*Source: PixelPass documentation*

### VCI-Client
A client library for requesting Verifiable Credentials from credential issuers. Available as Kotlin and Swift packages for Android and iOS respectively. It handles credential requests, proof JWT submission, and credential response processing.

*Source: VCI-Client documentation*

### BLE Verifier
A component that enables verification of credentials shared over Bluetooth Low Energy. Supports peer-to-peer offline sharing with face match verification.

*Source: Inji Wallet features*

### Sunbird RC
A registry and credentialing platform integrated with Inji Certify. It provides Identity Service (DID-compliant identities), Credential Schema Service (stores VC schemas and view templates), and Credential Service (core issuance service that transforms payloads into W3C-compliant Verifiable Credentials).

*Source: Inji Certify architecture*

### Durian (Secure Storage)
The secure storage solution used by Inji Web to store Verifiable Credentials. After successful verification, credentials are securely stored in Durian for reliable and convenient access with protection against unauthorized access.

*Source: Inji Web workflow*

### MOSIP (Modular Open Source Identity Platform)
An open-source platform for foundational identity. Inji is governed by MOSIP with community contributions. MOSIP provides the broader identity ecosystem within which Inji operates.

*Source: Inji FAQ, Community.mosip.io*

---

## Credential Formats and Types

### JSON-LD Verifiable Credential
A standards-based credential format using Linked Data Proofs, widely adopted across decentralized identity ecosystems for interoperability and verifiability.

*Source: Inji Certify features*

### JWT Verifiable Credential
Compact, JSON-based credentials that enable efficient transmission and verification across web and enterprise systems using the Signed JWT (JWS) format.

*Source: Inji Certify features*

### SD-JWT Verifiable Credential
Privacy-preserving credentials using Selective Disclosure JWT format that allow holders to selectively disclose attributes while keeping the rest private.

*Source: Inji Certify features*

### mDoc Credential
A Mobile Document credential format following ISO 18013-5/7 for secure, offline-verifiable digital documents. Mock issuance is currently supported with full implementation planned for future releases.

*Source: Inji Certify features*

### National ID Credential
A digital credential representing a national identity document. Example: Republic of Veridonia National ID Department issues National ID credentials through Inji Wallet.

*Source: Inji Wallet features*

### Insurance Credential
A Verifiable Credential containing insurance policy information. Example: StayProtected Insurance and Veridonia Insurance issue insurance credentials.

*Source: Inji Wallet features, Inji Web workflow*

### Tax ID Credential
A Verifiable Credential containing tax identification information. Example: Republic of Veridonia Tax Department issues Tax ID credentials.

*Source: Inji Wallet features*

### Land Record Credential
A Verifiable Credential containing property and land ownership information. Example: AgroVeritas Property & Land Registry issues Land Record credentials.

*Source: Inji Wallet features*

### Education Credential
A Verifiable Credential representing academic achievements such as diplomas, transcripts, and degree certificates issued by educational institutions.

*Source: Inji Certify overview, Inji Verify use cases*

### Employment Credential
A Verifiable Credential containing employment-related information such as job offers, salary slips, and letters of recommendation.

*Source: Inji Certify overview*

### Healthcare Credential
A Verifiable Credential containing medical records, vaccination certificates, or prescription information for secure verification in healthcare settings.

*Source: Inji Verify use cases*

### Travel Credential
A Verifiable Credential used as a digital passport or travel document to facilitate border control and verify traveler identities.

*Source: Inji Verify use cases*

### Vaccination Certificate
A Verifiable Credential certifying vaccination status. Can be issued through mass issuance campaigns using pre-authorized credential offers.

*Source: Inji Wallet features*

### Mobile Driving License (mDL)
A mobile driver's license credential following ISO 18013-5 standard. Supports use cases like identity verification in transport, law enforcement, and service access. Issued by entities like Veridonia Department of Motor Vehicles.

*Source: Inji Wallet features*

---

## Issuance Concepts

### Credential Issuer
See "Credential Issuer" in Core Concepts section.

### Issuer Metadata
Configuration information about a credential issuer including credential types offered, display properties, and endpoints. Retrieved from the `.well-known` location for every issuer configured in mimoto-issuers-config.json.

*Source: Mimoto documentation, inji-certify README*

### Issuer DID
*[Definition pending]*

### Credential Endpoint
The API endpoint where credential requests are submitted and credentials are issued. Configured as part of IssuerMetaData in the VCI-Client.

*Source: VCI-Client documentation*

### Token Endpoint
The endpoint for obtaining access tokens during the credential issuance flow. Part of the OAuth 2.0/OIDC integration.

*Source: Mimoto documentation*

### Authorization Server
A service that handles authentication and authorization for credential issuance. Inji Certify supports integration with OAuth 2.0 compliant authorization services such as eSignet and Keycloak.

*Source: Inji Certify features, inji-certify README*

### Access Token
A token issued by authorization providers based on authentication, used to authorize credential requests. Required for making credential requests to the issuer.

*Source: VCI-Client documentation*

### Authorization Code
A code obtained during the OAuth 2.0 authorization flow that is exchanged for an access token.

*Source: Inji Standards documentation*

### Pre-Authorized Code Flow
A credential issuance flow where users download credentials directly using a credential_offer URI without login, with pre-auth code embedded in the offer. Used in mass issuance or public campaigns (e.g., vaccination certificates).

*Source: Inji Wallet features*

### Authorization Code Flow
A standard OAuth 2.0 flow for credential issuance where users authenticate first, then receive credentials. Users are redirected to eSignet UI to enter unique ID and OTP.

*Source: Mimoto documentation*

### Deferred Credential Issuance
*[Definition pending]*

### Batch Credential Issuance
*[Definition pending]*

### Transaction Code
A one-time code (OTP/claim code) used in pre-authorized credential offers to bind issuance to a specific user. User enters the code in-app to retrieve VC securely. Ideal for privacy-sensitive issuance (e.g., mDL, insurance).

*Source: Inji Wallet features*

### Proof of Possession
*[Definition pending]*

### Proof JWT
A JWT proof used for making credential requests. The proof is generated by the wallet and sent with the credential request. Currently, Inji supports JWT proof type.

*Source: VCI-Client documentation, Inji FAQ*

### Credential Response
The response from a credential issuer containing the issued Verifiable Credential. If the issuer does not respond properly, a DownloadFailedException is thrown.

*Source: VCI-Client documentation*

### Credential Audience
The intended recipient or verifier of a credential. Configured as part of IssuerMetaData.

*Source: VCI-Client documentation*

### Credential Format
The technical format in which a credential is encoded. Supported formats include JSON-LD, SD-JWT, and mDoc/mDL.

*Source: Inji Certify features*

### VC Issuance Plugin
A plugin responsible for generating and signing Verifiable Credentials. These plugins connect with external identity or authentication systems to obtain information about the credential recipient and generate VCs in appropriate formats. Examples include MOSIP Identity Plugin and Sunbird Plugin.

*Source: Inji Certify features, inji-certify README*

### Data Provider Plugin
A plugin that fetches relevant data from external registries or data sources. The retrieved data is returned as a JSON object which Inji Certify uses to generate and issue the corresponding VC. Examples include Mock CSV Data Provider Plugin and Postgres Data Provider Plugin.

*Source: Inji Certify features, inji-certify README*

### Authenticator Plugin
A plugin that provides methods to authenticate the end-user with control of supported authentication factors. There is a default plugin implemented for Sunbird Registry.

*Source: Inji Certify architecture*

### Audit Plugin
A plugin that tracks and logs actions within the system for auditing purposes.

*Source: Inji Certify architecture*

---

## Presentation and Sharing Concepts

### Presentation Definition
*[Definition pending]*

### Presentation Submission
*[Definition pending]*

### Presentation Request
A request from a verifier specifying which credentials or claims are needed. The verifier specifies required claims (e.g., Name, Date of Birth) in the OpenID4VP flow.

*Source: Inji Wallet documentation*

### Verifiable Presentation
See "Verifiable Presentation (VP)" in Core Concepts section.

### QR Code Sharing
Sharing credentials by generating a QR code using PixelPass that can be scanned or uploaded on verifier portals. Quick and compact method for online sharing.

*Source: Inji Wallet features*

### BLE (Bluetooth Low Energy) Sharing
Sharing VCs offline using Bluetooth Low Energy through the Tuvali module. Enables peer-to-peer credential transfer with optional face match verification.

*Source: Inji Wallet features*

### Offline Sharing
Sharing credentials without internet connectivity using BLE or QR codes that contain the full credential data. Critical for inclusion in low-connectivity environments.

*Source: Inji Wallet features, Inji FAQ*

### Online Sharing
Sharing credentials over the internet using OpenID4VP flows. Includes SSO via QR Code and OpenID4VP cross-device/same-device flows.

*Source: Inji Wallet features*

### Cross-Device Flow
An OpenID4VP flow where the user scans a verifier's QR code from another device (e.g., scanning a desktop QR with mobile wallet), then presents VCs after face verification. The verifier generates an Authorization Request as a QR code, the user scans it with a mobile wallet, and the wallet responds with a vp_token.

*Source: Inji Wallet features, Inji Verify overview*

### Same-Device Flow
An OpenID4VP flow where credential presentation happens on the same device. User taps QR on browser, deep-link opens wallet, and credentials are shared through a seamless redirect. Request can invoke the wallet via deep link where the wallet processes the request and returns the signed Verifiable Presentation.

*Source: Inji Wallet features, Inji Verify overview*

### Proximity Sharing
*[Definition pending]*

### Remote Sharing
*[Definition pending]*

### Deep Link
A URL that opens a specific location within a mobile app. Used in same-device OpenID4VP flows to invoke the wallet directly from a browser and share credentials.

*Source: Inji Wallet features*

### Redirect URI
A URL where the user is redirected after completing an authentication or authorization flow. Configured for verifiers and used in OpenID4VP flows.

*Source: Mimoto documentation*

### Return URL
*[Definition pending]*

### Face Verification
Biometric verification using facial comparison to confirm the credential holder's identity before sharing. Users are prompted for authentication (Face) if the VC contains a face photo.

*Source: Inji Wallet documentation*

### Selfie Verification
A Share with Selfie option available through the quick access menu on credential cards, enabling biometric verification before sharing.

*Source: Inji Wallet features*

### Consent-Based Sharing
Credential sharing that requires explicit user consent. SD-JWT VP Support ensures consent-driven sharing where the wallet validates signed authorization requests and presents only the chosen claims.

*Source: Inji Wallet features*

---

## Verification Concepts

### Credential Verifier
See "Credential Verifier" in Core Concepts section.

### Trusted Verifier
A verifier that has been registered and configured as trusted. Configured in mimoto-trusted-verifiers.json with clientId and redirect URI for online sharing.

*Source: Mimoto documentation*

### Verification Result
The outcome of credential verification, indicating whether the credential is valid, invalid, expired, or revoked.

*Source: Inji Verify documentation*

### Signature Verification
The process of validating the cryptographic signature on a credential to confirm it was signed by the claimed issuer using their private key.

*Source: Inji FAQ*

### Status Check
The process of checking a credential's current status (valid, revoked, or expired). The wallet automatically checks status when a card is downloaded, and users can manually recheck anytime.

*Source: Inji Wallet features*

### Revocation Check
Checking whether a credential has been revoked by the issuer. Verifier checks revocation status as part of the verification process.

*Source: Inji FAQ*

### Expiry Check
Checking whether a credential has passed its expiry date. Inji Wallet performs checks to confirm credentials are not revoked or expired.

*Source: Inji Wallet features*

### Schema Validation
*[Definition pending]*

### Proof Verification
Verifying the cryptographic proof embedded in a credential to ensure data integrity and authenticity.

*Source: Inji Verify overview*

### Issuer Verification
Confirming that the issuer of a credential is legitimate and their cryptographic key is verified as legitimate.

*Source: Inji FAQ*

### Trust Registry
*[Definition pending]*

### DID Resolution
The process of resolving a DID to obtain the associated DID Document containing public keys and service endpoints. Verification methods supported include `did:web` in combination with proofValue or jws.

*Source: Inji Verify overview*

### Public Key Resolution
The process of obtaining the issuer's public key to verify a credential's signature. Often involves resolving DIDs or accessing well-known endpoints.

*Source: Inji Verify overview*

---

## Revocation Mechanisms

### Status List 2021
*[Definition pending]*

### Revocation Registry
A system that maintains the status of credentials, allowing issuers to revoke credentials and verifiers to check revocation status.

*Source: Inji Certify features*

### Revocation List
A maintained list of revoked credentials. Inji Certify maintains a Revocation List for JSON-LD credentials and provides a Discovery API for access to the most up-to-date revocation list.

*Source: Inji Certify features*

### Credential Status Type
*[Definition pending]*

### BitString Status List
*[Definition pending]*

### Expiry-Based Revocation
Credentials automatically become invalid after their expiry date, providing a passive form of credential invalidation.

*Source: Inji Wallet features*

### On-Demand Status Check
Users can recheck a credential's status whenever needed, with clear results shown instantly.

*Source: Inji Wallet features*

### Cached Credential Status
Revocation status can be cached for offline scenarios, though periodic online updates are recommended.

*Source: Inji FAQ*

### Status List Entry
*[Definition pending]*

### Status Purpose
*[Definition pending]*

---

## Architecture and Infrastructure

### API Layer
The entry point for all interactions with Inji Certify, including requests from external Digital Wallets. It handles routing, authorization (using OAuth2 OpenID Connect), and request validation.

*Source: Inji Certify architecture*

### VC Signer
A component that digitally signs Verifiable Credentials to guarantee authenticity and integrity. Part of Inji Certify's core layer.

*Source: Inji Certify architecture*

### Template Engine
A component that manages templates for different VC types, populating them with data before signing. Handles the generation of credential templates.

*Source: Inji Certify architecture*

### Keymanager Service
A service layer that manages cryptographic keys used for signing and verifying credentials. It ensures secure storage and retrieval of keys and handles key rotation and management tasks.

*Source: Inji Certify architecture*

### Plugin Architecture
A modular plugin-based architecture that enables extensible and customizable credential issuance workflows. Allows integration with identity systems, registries, data sources, and third-party services.

*Source: Inji Certify features*

### Credential Service
The core issuance service in Sunbird RC. Called with a payload, it transforms the data into a W3C-compliant Verifiable Credential in JSON-LD format and signs it using the private key generated during issuer creation.

*Source: Inji Certify architecture*

### Identity Service
The central service in Sunbird RC that maintains identities across the system. All identities are DID-compliant and web-resolvable. Other microservices depend on this for generating any identity.

*Source: Inji Certify architecture*

### Schema Service
The Credential Schema Service in Sunbird RC that stores the schema of Verifiable Credentials along with associated view templates.

*Source: Inji Certify architecture*

### Vault Service
A HashiCorp Vault-based keystore that stores key pairs and secrets for issuers. The Identity Service depends on the vault service.

*Source: Inji Certify architecture*

### PostgreSQL Database
The main database used by Inji Certify and Inji Verify for storing configuration, credentials, and operational data.

*Source: inji-certify README, inji-verify README*

### Cache Layer
A caching system in Inji Certify's infrastructure for improving performance.

*Source: Inji Certify architecture*

### Docker Container
A containerization format used to package and deploy Inji components. All Inji services have Docker images available for deployment.

*Source: inji-certify README, inji-wallet README, inji-verify README, inji-web README*

### Kubernetes
An orchestration platform supported for production deployments of Inji components. Enables issuers to host and utilize the product at scale.

*Source: inji-certify README*

### Microservices Architecture
The architectural style used by Inji Certify with separate services for different functions (e.g., Identity Service, Schema Service, Credential Service).

*Source: Inji Certify architecture*

### Modular Architecture
An architectural approach used by Inji where components function independently, enabling seamless updates and scalability without affecting core functionality.

*Source: Inji Verify overview*

---

## User Experience Terms

### Credential Card
The visual representation of a credential in the wallet interface. Can be displayed as mini cards or full detail views.

*Source: Inji Wallet features*

### Mini Card View
A compact card display format showing essential credential information.

*Source: Inji Wallet features*

### Full Detail View
An expanded view of a credential showing all claims and metadata.

*Source: Inji Wallet features*

### Kebab Menu
The three-dot menu (⋮) on credential cards providing quick access to actions like Share and Share with Selfie.

*Source: Inji Wallet features*

### Quick Actions
Fast access options available through the kebab menu on credential cards, including Share and Share with Selfie.

*Source: Inji Wallet features*

### Credential Download
The process of retrieving a Verifiable Credential from an issuer and storing it in the wallet.

*Source: Inji Wallet features*

### Credential Backup
The process of securely backing up wallet credentials. Android uses Google Drive and iOS uses iCloud. Supports phone upgrades and app crash recovery.

*Source: Inji Wallet features*

### Credential Restore
The process of restoring previously backed up credentials to a wallet, typically after phone upgrades or app resets.

*Source: Inji Wallet features*

### Passcode Protection
Security feature requiring a passcode to access the wallet app.

*Source: Inji Wallet features*

### Biometric Lock
Security feature requiring biometric authentication (fingerprint, face) to access the wallet app on every open or session timeout.

*Source: Inji Wallet features*

### App Authentication
Required authentication (biometric or passcode) to access the Inji Wallet application.

*Source: Inji Wallet features*

### Session Timeout
The duration after which the wallet requires re-authentication to continue use.

*Source: Inji Wallet features*

### Multi-Credential Support
The ability to store and manage multiple credentials of different types in the same wallet. Users can have multiple credentials for the same purpose (e.g., two driver's licenses).

*Source: Inji Wallet features, Inji FAQ*

### Credential Grouping
Organization of credentials by type (ID, insurance, education) in the wallet interface.

*Source: Inji Wallet features*

### Recent Credentials
Recently downloaded or accessed credentials shown first in the wallet interface for quick access.

*Source: Inji Wallet features*

---

## Integration Concepts

### Relying Party
An entity that relies on credential verification to provide services. Inji Verify SDK provides components for relying party applications to integrate credential verification.

*Source: Inji Verify overview*

### Service Provider
An entity integrated with eSignet that users can log into using their credentials. Users can log in to any service provider portal integrated with eSignet.

*Source: eSignet documentation*

### Identity Provider (IdP)
A service that provides identity authentication. eSignet serves as an identity provider for Inji-based authentication.

*Source: Mimoto documentation*

### Authentication Flow
The sequence of steps for user authentication, typically involving unique ID entry and OTP verification through eSignet.

*Source: Mimoto documentation*

### Single Sign-On (SSO)
A method allowing users to log in to multiple services with a single set of credentials. SSO via QR Code enables scanning QR on service portal and sharing selected VCs after user consent.

*Source: Inji Wallet features*

### Token Exchange
*[Definition pending]*

### Client ID
A unique identifier for an application in OAuth/OIDC flows. Required for issuer and verifier configuration in mimoto-issuers-config.json and mimoto-trusted-verifiers.json.

*Source: Mimoto documentation*

### Client Secret
*[Definition pending]*

### Client Alias
An alias for the client used in OIDC configuration. Updated alongside Client ID in issuer configuration.

*Source: Mimoto documentation*

### Redirect URI
A URL where users are redirected after authentication. Configured for verifiers in mimoto-trusted-verifiers.json for online sharing.

*Source: Mimoto documentation*

### Callback URL
*[Definition pending]*

### Well-Known Configuration
A standardized endpoint (`.well-known`) where issuers publish their metadata including credential types and display properties.

*Source: Mimoto documentation*

### OIDC Discovery
The process of discovering OpenID Connect provider configuration from well-known endpoints.

*Source: inji-certify README*

### Metadata Endpoint
An endpoint providing configuration information about an issuer or authorization server.

*Source: inji-certify README*

---

## Mobile and Platform Concepts

### Android Keystore
Android's hardware-backed keystore for secure cryptographic key storage. Inji Wallet stores private keys using Android Keystore, ensuring keys cannot be exported or tampered.

*Source: Inji Wallet features, Secure Keystore documentation*

### iOS Secure Enclave
Apple's hardware-based security feature for cryptographic operations. Inji Wallet uses iOS Secure Enclave for private key storage with protection against export or tampering.

*Source: Inji Wallet features, Secure Keystore documentation*

### iOS Keychain
Apple's secure storage system for sensitive data. Secure Keystore uses iOS Keychain/Secure Enclave for key management.

*Source: Secure Keystore documentation*

### Google Drive Backup
Cloud backup option for Inji Wallet on Android devices. Users select their Google account for backup.

*Source: Inji Wallet features*

### iCloud Backup
Cloud backup option for Inji Wallet on iOS devices. Uses the logged-in Apple account.

*Source: Inji Wallet features*

### Face ID
Apple's facial recognition system. Supported by Inji Wallet for biometric authentication.

*Source: Inji Wallet features*

### Touch ID
Apple's fingerprint recognition system. Supported by Inji Wallet for biometric authentication.

*Source: Inji Wallet features*

### Android Biometrics
Android's biometric authentication framework. Supported by Inji Wallet for app authentication.

*Source: Inji Wallet features*

### React Native
A framework for building native mobile apps using React. Inji Wallet uses React Native 0.74.5 with Hermes Engine enabled.

*Source: inji-wallet README*

### Kotlin
A programming language for Android development. Inji provides Kotlin packages for components like VCI-Client, PixelPass, and Tuvali.

*Source: VCI-Client documentation, PixelPass documentation*

### Swift
A programming language for iOS development. Inji provides Swift packages for components like VCI-Client, PixelPass, and Tuvali.

*Source: VCI-Client documentation, PixelPass documentation*

### Native App
An application built specifically for a mobile platform. Inji Wallet is available as native apps for Android and iOS.

*Source: Inji documentation*

### Web App
An application accessed through a web browser. Inji Web is a browser-based wallet accessible from any computer.

*Source: inji-web README*

### Progressive Web App (PWA)
*[Definition pending]*

### Deep Linking
A technique to navigate users directly into a specific location within a mobile app. Used in same-device OpenID4VP flows.

*Source: Inji Standards documentation*

### Universal Links
*[Definition pending]*

### App Links
*[Definition pending]*

---

## Standards Bodies and Organizations

### W3C (World Wide Web Consortium)
The international standards organization responsible for the Verifiable Credentials Data Model that Inji implements.

*Source: Inji documentation*

### IETF (Internet Engineering Task Force)
The standards body responsible for SD-JWT specifications that Inji supports.

*Source: Inji documentation*

### ISO (International Organization for Standardization)
The standards body responsible for ISO 18013-5 (mDL) that Inji supports for mobile driving licenses.

*Source: Inji Standards documentation*

### OpenID Foundation
The organization responsible for OpenID4VCI and OpenID4VP specifications that Inji implements.

*Source: Inji Standards documentation*

### Decentralized Identity Foundation (DIF)
*[Definition pending]*

### Trust Over IP Foundation (ToIP)
*[Definition pending]*

### MOSIP Community
The open-source community that governs Inji development. Contributions are welcome from the community, and questions can be posted in the MOSIP Community forum (community.mosip.io).

*Source: inji-certify README, Community.mosip.io*

### Verifiable Credentials Working Group
*[Definition pending]*

---

## Compliance and Governance

### Trust Framework
*[Definition pending]*

### Governance Framework
*[Definition pending]*

### GDPR (General Data Protection Regulation)
*[Definition pending]*

### Data Protection
*[Definition pending]*

### Accessibility Standards
*[Definition pending]*

### WCAG (Web Content Accessibility Guidelines)
*[Definition pending]*

### ADA Compliance
*[Definition pending]*

### Audit Trail
Logging provided by the Audit Plugin that tracks and logs actions within the system for auditing purposes.

*Source: Inji Certify architecture*

### Event Logging
*[Definition pending]*

### Telemetry
Data collection for monitoring application usage and performance. Inji Wallet connects to a Telemetry Server (OBSRV_HOST) for analytics.

*Source: inji-wallet README*

---

## Deployment and Operations

### Cloud Deployment
Deploying Inji components on cloud infrastructure. Supports flexible deployment options including cloud, on-premises, and hybrid.

*Source: Inji FAQ*

### On-Premises Deployment
Deploying Inji components on an organization's own infrastructure rather than cloud services.

*Source: Inji FAQ*

### Hybrid Deployment
A deployment model combining cloud and on-premises infrastructure.

*Source: Inji FAQ*

### Sandbox Environment
An environment for experimentation and testing. Local development setup is intended for experimentation and user experience.

*Source: inji-certify README*

### Production Environment
A deployment environment designed for production with Kubernetes cluster support, enabling issuers to host and utilize the product at scale.

*Source: inji-certify README*

### Configuration Management
Managing configuration through properties files and environment configuration. Configurable properties are maintained per deployment environment with environment-specific branches in repositories.

*Source: Mimoto documentation*

### Environment Variables
Configuration values set in the deployment environment. Inji Web connects with Mimoto using configuration in env.config.js file.

*Source: inji-web README*

### Helm Charts
Kubernetes deployment packages available in helm folders for deploying Inji components on K8s clusters.

*Source: inji-certify README, inji-verify README, inji-web README*

### CI/CD Pipeline
*[Definition pending]*

### Load Balancing
*[Definition pending]*

### Horizontal Scaling
*[Definition pending]*

### High Availability
*[Definition pending]*

---

## Rendering and Display

### SVG-Based Rendering
Credential rendering using Scalable Vector Graphics format. Inji Wallet supports SVG-based credential rendering for Data Model 2.0 VCs, preserving the original design, layout, and branding of credentials. Ensures displayed information directly corresponds to cryptographically verified credential data.

*Source: Inji Wallet features, Inji Certify features*

### Credential Template
Templates for different VC types managed by the Template Engine. Inji Certify includes renderMethod parameter in credential metadata instructing wallets on credential visual rendering.

*Source: Inji Certify architecture, Inji Certify features*

### View Template
Templates stored by the Credential Schema Service that define how credentials are visually displayed.

*Source: Inji Certify architecture*

### Card Rendering
The process of displaying credentials as visual cards in the wallet interface.

*Source: Inji Wallet features*

### QR Code Generation
Creating QR codes from credential data. PixelPass provides generateQRCode function that takes data, ECC (Error Correction Level), and header to return a base64 encoded PNG image.

*Source: PixelPass documentation*

### QR Code Scanning
Reading QR codes using device camera. Users can easily scan QR codes embedded within documents. Devices should have at least 12 megapixels camera with 1020p quality for optimal results.

*Source: Inji Verify overview*

### QR Code Upload
Uploading QR code images for verification rather than scanning. Users can upload QR codes or documents with QR codes printed on them.

*Source: Inji Verify overview*

### PixelPass Encoding
The compression and encoding process used by PixelPass: Compressed > CBOR Encoded > Base45 Encoded.

*Source: PixelPass documentation*

### Data Compression
Reducing data size for efficient QR code generation. PixelPass uses zlib compression with the highest compression level (level 9).

*Source: PixelPass documentation*

### Credential Display Metadata
Metadata provided by issuers including credential display name, logo, background color, background image, and text color for rendering credentials.

*Source: Inji Web customization documentation*

---

## Advanced Concepts

### Credential Chaining
*[Definition pending]*

### Derived Credentials
*[Definition pending]*

### Sub-Credentials
*[Definition pending]*

### Credential Bundle
*[Definition pending]*

### Multi-Issuer Support
The ability to download and manage credentials from multiple issuers in the same wallet. Mimoto provides APIs to get a list of issuers and retrieve configuration for specific issuers.

*Source: Mimoto documentation, Inji Wallet features*

### Multi-Credential Wallet
A wallet capable of storing multiple types of credentials. Inji Mobile Wallet streamlines all types of identification and credentials into one digital wallet.

*Source: inji-wallet README*

### Cross-Border Verification
*[Definition pending]*

### Interoperability
The ability of credentials and systems to work across different platforms and ecosystems. By adhering to open standards, Inji ensures credentials are portable and verifiable across different ecosystems.

*Source: Inji Standards documentation*

### Federation
*[Definition pending]*

### Ecosystem Portability
The ability to use credentials across different systems and platforms. W3C VC format is not proprietary to Inji and credentials are verifiable by systems outside the MOSIP ecosystem.

*Source: Inji FAQ*

### Vendor Lock-In Prevention
Avoiding dependence on a single vendor's technology. Inji is open-source with no licensing fees and credentials work across different platforms.

*Source: Inji FAQ*

### Open Source Governance
Inji is governed by MOSIP with community contributions. Check contribution guidelines to learn how to contribute code.

*Source: inji-certify README*

---

*This glossary is sourced exclusively from the Inji codebase, Inji GitHub repositories (inji-certify, inji-wallet, inji-web, inji-verify), and Community.mosip.io. Terms marked with [Definition pending] require input from internal SMEs, Tech Leaders, and Stakeholders from the Inji organization.*


Now add the definitions to these terms
Make sure you define them by sourcing the content from: 