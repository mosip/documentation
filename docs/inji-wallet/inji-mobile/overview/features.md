# Features

Inji Mobile is an open-source digital wallet designed to enable individuals to receive, store, and present Verifiable Credentials (VCs) securely, both online and offline. Purpose-built to align with global standards like W3C VC, OpenID4VCI, OpenID4VP, IETF SD-JWT, and ISO 18013-5 (mDL), it brings interoperability, user autonomy, and strong cryptographic guarantees to digital identity ecosystems.

### Core Mobile Wallet Features

### 1. Multiple Credential Format Support

Inji Wallet is designed for interoperability and flexibility by supporting a wide range of credential formats:

* **W3C Verifiable Credentials (JSON-LD VCs) Data Model 1.1**
  * Standards-based credential format is widely adopted across ecosystems.
  * Suitable for general-purpose credential issuance and verification.
* **ISO 18013-5 (mDL)**
  * Mobile Driving License and Mobile Document specification.
  * Supports use cases like identity verification in transport, law enforcement, and service access.
* **IETF SD-JWT**
  * **IETF** **SD-JWT Verifiable Credentials**: Enables holders to download and share credentials in IETF **SD-JWT format**. This allows users to share only the necessary attributes while keeping other data private, ensuring **privacy-preserving credential sharing**.
  * Allows users to share only the required claims with verifiers via the OpenIDVP flow, where these selectively disclosable claims can be shared as per the user's need.&#x20;

This multi-format support allows Inji Wallet to work seamlessly across different ecosystems, ensuring **compatibility, security, and user privacy**.

### 2. Download, Verify, and Share Verifiable Credentials

Inji Wallet makes it easy and secure for residents to manage their digital identity and credentials. From downloading and verifying to sharing and backing up Verifiable Credentials (VCs), this guide outlines all key features and workflows available in the wallet.

#### 2.1 Downloading Verifiable Credentials

#### a) OpenID for VC Issuance

Residents can download VCs from trusted issuers integrated with OpenID for the VCI protocol.

**Example Issuers:**

* Republic of Veridonia National ID Department - National ID
* StayProtected Insurance - Insurance Credentials
* Republic of Veridonia Tax Department - Tax ID
* AgroVeritas Property & Land Registry - Land Record
* Veridonia Department of Motor Vehicles - mDoc

#### b) Pre-Authorised Credential Offers (Without Transaction Code)

* Users download credentials directly using a credential\_offer URI
* No login required; pre-auth code embedded in the offer
* Used in mass issuance or public campaigns (e.g., vaccination certificates, offline cards)

#### c) Pre-Authorised Credential Offers (With Transaction Code)

* Adds a one-time transaction code (OTP / claim code) to bind issuance to the user
* User enters code in-app to retrieve VC securely
* Ideal for privacy-sensitive issuance (e.g., mDL, insurance)

#### 2.2 Verifying Credential Authenticity

Inji Mobile Wallet uses robust cryptographic libraries to verify that the VC is:

* **Digitally signed by a trusted issuer,** ensuring the credential originates from a valid and recognized entity.
* **Cryptographically valid based on proof type** — verifying the integrity of the data using the appropriate proof mechanisms (e.g., JSON-LD proof, JWT, IETF SD-JWT, etc.).
* **Not revoked or expired** — performing revocation status checks using status lists, revocation registries, or endpoints defined in the VC metadata.
* **Untampered** — confirming that no field or claim in the credential has been altered since issuance.
* **Bound to the correct holder (where applicable)** — verifying holder binding in cases where the VC includes a subject proof (e.g., via DID or SD-JWT binding).

### 3. Sharing Verifiable Credentials

Inji Wallet supports secure sharing of Verifiable Credentials (VCs) in multiple ways — both **online and offline** — with strong privacy and authentication.

<table><thead><tr><th width="176.83203125">Method</th><th width="287.495361328125">Description</th><th>Connectivity</th><th>User Control / Notes</th></tr></thead><tbody><tr><td><strong>QR Code Sharing</strong></td><td>Generate QR using PixelPass. Scan or upload on verifier portal.</td><td>Online</td><td>Quick and compact</td></tr><tr><td><strong>BLE (Bluetooth) Sharing</strong></td><td>Share VCs offline using Bluetooth Low Energy.</td><td>Offline</td><td>Peer-to-peer; face match supported</td></tr><tr><td><strong>SSO via QR Code</strong></td><td>Scan QR on service portal → share selected VCs after user consent.</td><td>Online</td><td>Fine-grained VC selection and SSO login</td></tr><tr><td><strong>OpenID4VP – Cross-Device</strong></td><td>Scan verifier’s QR from another device → present VCs post face verification.<br><br>Example: Sharing of JSON-LD,mDoc VCs etc</td><td>Online</td><td>Secure, decentralized VC presentation</td></tr><tr><td><strong>OpenID4VP – Same Device</strong></td><td>Tap QR on browser → deep-link opens wallet → share credentials.<br><br>Example: Sharing of JSON-LD,mDoc VCs etc</td><td>Online</td><td>Seamless redirect</td></tr><tr><td><strong>SD-JWT Verifiable Presentation (VP) Support</strong></td><td><p></p><ul><li>Inji Wallet supports <strong>OpenID for Verifiable Presentations (OpenID4VP)</strong> flow for credentials in the <strong>IETF SD-JWT</strong> format.</li></ul><ul><li>Holders can selectively disclose specific claims while keeping other attributes private.</li></ul><ul><li>This ensures privacy-preserving credential sharing with verifiers, aligning with IETF SD-JWT and OpenID4VP standards.</li></ul><ul><li>The wallet validates signed authorization requests and presents only the chosen claims, ensuring security and consent-driven sharing.</li></ul></td><td>Online</td><td>Consent-based sharing</td></tr></tbody></table>

**Note:** All methods include **user consent** and **privacy-by-design** to ensure secure, context-aware interactions.

### **4. SVG-based Credential Rendering**

* Inji Wallet now supports **SVG-based credential rendering** for **Data Model 2.0 VCs**.
* This allows credentials issued under the Data Model 2.0 schema to be displayed as **secure, dynamic SVG visuals** within the wallet.
* The rendering ensures that displayed information (such as name, ID, issuer, and other attributes) directly corresponds to the **cryptographically verified credential data**.
* This enhancement improves **readability**, **user trust**, and **consistency** while maintaining alignment with the underlying verifiable data.
* Support for SVG rendering for other data models may be added in future versions.

### 5. Additional Mobile Wallet Features

#### 5.1 Backup and Restore

Inji Wallet includes a secure, one-time backup setup based on the platform:

| Platform | Backup Option | Notes                        |
| -------- | ------------- | ---------------------------- |
| Android  | Google Drive  | Select Google account        |
| iOS      | iCloud        | Uses logged-in Apple account |

**Ideal for:**

* Phone upgrades
* App crashes or resets

#### 5.2 User-Friendly Interface & Quick Actions

Designed for ease of use with intuitive UI components:

* Multiple VC Views: Mini cards to full detail
* Separation of Downloaded vs. Received VCs
* Quick Access Menu: Share, Share with Selfie via the kebab menu (⋮) on card
* Select from a list of credential types offered by the issuer.
* Choose only the VCs they want to download, ensuring relevance and control.
* VCs grouped by type (ID, insurance, education)
* Recent VCs shown first

#### 5.3 Wallet Security & Device Features

* **Biometric / Passcode Access**
  * App requires authentication on every open or session timeout
  * Supports Android biometrics and Apple Face ID / Touch ID
* **Private Key Storage in Secure Enclave**
  * Private keys are stored using Android Keystore / iOS Secure Enclave
  * Keys cannot be exported or tampered

### 6. Features in the Pipeline

* Revocation Status
* Presentation during Issuance
* Injii Mobile Wallet Login
* Claim 169 QR Code Parsing and Download

### Read More <a href="#read-more" id="read-more"></a>

Check the [Inji Mobile Wallet Repository](https://github.com/mosip/inji-wallet/tree/master/docs) to explore the above-mentioned features.
