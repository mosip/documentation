# Building Verifiable Credentials Wallet with Inji Libraries

## Overview <a href="#overview" id="overview"></a>

This guide provides step-by-step documentation for building a **Kotlin-based verifiable credential wallet** from scratch using **Inji stack libraries**. The purpose of this guide is to demonstrate how developers can leverage the Inji ecosystem to securely **download, verify, store, and present verifiable credentials (VCs)**. The guide is currently focused on **Android-based implementations**, but all the Inji libraries are also available in **Swift for iOS**.

This guide is aimed at developers who want to either **create a custom wallet** or **enhance an existing application** to support VC-based digital identity functionality.

The sample app illustrates how to:

* Securely generate and manage cryptographic keys
* Download credentials from trusted issuers
* Verify the authenticity of credentials
* Store and display credentials to end users
* Optionally present credentials via QR code

{% hint style="success" %}
**Note:**\
The terms **“custom wallet”** and **“verifiable credentials wallet”** are used interchangeably throughout this document. Both refer to a wallet application built using Inji libraries to securely **download, verify, store, and present verifiable credentials (VCs)**.
{% endhint %}

### Key Features of the Custom Wallet <a href="#key-features-of-the-custom-wallet" id="key-features-of-the-custom-wallet"></a>

By following this “build your own digital credentials wallet” flow, your application achieves:

* **Secure Key Management**
  * Hardware-backed RS256/ES256 keys, safely managed by Secure Keystore.
* **End-to-End Credential Issuance**
  * Complete flow from user authentication to credential download.
* **Credential Verification**
  * Ensures authenticity with cryptographic checks and expiry validation.
* **Secure Storage & Display**
  * Verified credentials are saved in the app and rendered as cards for users.
* **Issuer Management**
  * Supports multiple trusted issuers and their metadata.
* **Credential Presentation**
  * Option to present credentials via QR code (Pixelpass).
* **Extensible Architecture**
  * Modular libraries allow developers to extend or replace parts of the flow.

**For the detailed feature list of Inji Mobile Wallet, refer** [**here**](https://docs.inji.io/inji-wallet/inji-mobile/overview/features) **!**

### Prerequisites for Building a Custom Wallet <a href="#prerequisites-for-building-a-custom-wallet" id="prerequisites-for-building-a-custom-wallet"></a>

Before starting, ensure you have:

* **Android Studio** (latest stable version)
* **Kotlin** (with Gradle support)
* **Internet access** for API calls to the Authorization Server and Issuing Authority
* **Trusted Issuer configuration** (issuer metadata like `client_id`, `credential_configuration_id`, `redirect_uri`, etc.)

### Inji Libraries Used for Building a Custom Wallet <a href="#inji-libraries-used-for-building-a-custom-wallet" id="inji-libraries-used-for-building-a-custom-wallet"></a>

The custom wallet application integrates several **Inji stack libraries**, which provide ready-made methods for credential flows.

| Component                       | Library                                                                   | Primary Function                                                                                                                                                               |
| ------------------------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Secure Keystore**             | [secure-keystore](https://github.com/mosip/secure-keystore/tree/master)   | Generates and stores cryptographic key pairs (RS256 / ES256). Used to create Proof JWT.                                                                                        |
| **VCI Client**                  | [inji-vci-client](https://app.gitbook.com/u/J3VZVcoSqjX2LqmZbSg5nHJZEPI2) | Handles the credential issuance protocol: authorization, token exchange, proof generation, and downloading the credential.                                                     |
| **VC Verifier**                 | [vc-verifier](https://app.gitbook.com/u/J3VZVcoSqjX2LqmZbSg5nHJZEPI2)     | Verifies credentials by checking digital signatures, expiration, and issuer authenticity.                                                                                      |
| **Pixelpass** (optional)        | [pixelpass](https://github.com/mosip/pixelpass/tree/master)               | Generates QR codes for credential presentation.                                                                                                                                |
| **Issuing Authority (Certify)** | [inji-certify](https://app.gitbook.com/u/J3VZVcoSqjX2LqmZbSg5nHJZEPI2)    | Authority from which the final credential (VC) is issued and downloaded.                                                                                                       |
| **Authorization Server (AS)**   | (External)                                                                | Service where users authenticate to get authorization codes. In case of Inji eSignet can also be used as authorization server as it is a MOSIP product so both are compatible. |

### Setup <a href="#setup" id="setup"></a>

1. **Create Activity**
   * In Android Studio, create a new project with an empty activity.
2. **Add Dependencies**
   *   Open `app/build.gradle` and add the required dependencies for the Inji libraries:

       `implementation "org.inji:inji-actor-secure-keystore:<version>" implementation "org.inji:inji-vci-client:<version>" implementation "org.inji:inji-vc-verifier:<version>" implementation "org.inji:inji-pixelpass:<version>" // optional`
3. **Resolve Dependencies**
   * Sync the project to fetch dependencies.
   * You can now call the methods provided by the Inji libraries.

### **Step-by-step guide:** <a href="#step-by-step-guide" id="step-by-step-guide"></a>

The flow below shows how the custom verifiable credentials wallet downloads and verifies a credential.

<figure><img src="../../../../../.gitbook/assets/image (13).png" alt=""><figcaption></figcaption></figure>

#### Step 1: Initialization & Key Generation <a href="#step-1-initialization-and-key-generation" id="step-1-initialization-and-key-generation"></a>

* Call `generate_key_pair()` from **Secure Keystore**.
  * Generates RS256 or ES256 key pair, stored in Android hardware keystore.
* Retrieve **issuer metadata** (`client_id`, `redirect_uri`, etc.) from trusted issuers list.
* Call `request_credential_from_trusted_issuer()` in **VCI Client** , passing credential configuration and client metadata.

#### Step 2: User Authorization <a href="#step-2-user-authorization" id="step-2-user-authorization"></a>

* **VCI Client** returns a callback requiring user authorization.
* Wallet opens a web-view to the **Authorization Server**.
* User authenticates, and an **authorization code** is returned to the wallet.
* Wallet sends the authorization code to the **VCI Client**, fulfilling the callback.

#### Step 3: Token Exchange <a href="#step-3-token-exchange" id="step-3-token-exchange"></a>

* VCI Client triggers `get_token_response` callback.
* Wallet makes a **POST request** to the token endpoint with auth code.
* **Authorization Server** responds with an access token + `cNonce`.
* Wallet returns a token response to the **VCI Client**.

#### Step 4: Proof Generation & Credential Download <a href="#step-4-proof-generation-and-credential-download" id="step-4-proof-generation-and-credential-download"></a>

* VCI Client requests a Proof JWT (`get_proof_JWT`).
* Wallet constructs JWT with claims: `nonce`, `aud`, `iat`, `exp`.
* Wallet uses **Secure Keystore** to sign JWT.
* Wallet sends signed Proof JWT to **VCI Client**.
* **VCI Client** requests credentials from **Issuing Authority** and returns the final credential JSON.

#### Step 5: Verification & Storage <a href="#step-5-verification-and-storage" id="step-5-verification-and-storage"></a>

* Wallet calls `verify()` from **VC Verifier 🔎**, passing credential JSON.
* **VC Verifier** checks validity (signature, expiry, issuer).
* Verification result returned (`True/False` with message).
* If valid, the wallet stores credentials and renders as a card view.

#### Optional Step: Credential Presentation <a href="#optional-step-credential-presentation" id="optional-step-credential-presentation"></a>

* Wallet calls **Pixelpass** to generate QR code.
* Pixelpass returns a QR image for displaying to the verifier.

{% hint style="success" %}
Using **Inji libraries and SDKs**, which are built on open standards, developers can build their own custom wallets or integrate these libraries into existing applications, effectively transforming them into **VC-based wallets**.\

{% endhint %}
