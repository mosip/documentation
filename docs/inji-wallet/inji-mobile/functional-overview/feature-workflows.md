# Workflow

## End-to-End Workflow for Inji Mobile Wallet

### Credential Download via OpenID4VCI Flow

This workflow describes how Inji Wallet downloads a Verifiable Credential (VC) from an issuing authority using the OpenID4VCI protocol.

```mermaid
sequenceDiagram
    participant W as Inji Wallet 📱
    participant keystore as Secure Keystore 🗝️
    participant VCI as VCI Client 🔐📄
    participant Verifier as VC Verifier 🔎
    participant Pixelpass as Pixelpass 🔲
    participant AS as Authorization Server 🔐
    participant Certify as Issuing Authority 🏛️

   W->>keystore: Generate and store key-pair
   W->>VCI: Download VC
   VCI-->>W: Authorize User
   W->>AS: Redirect to Auth server and authenticate the User
   AS-->>W: Return Auth code
   W->>VCI: Auth code
   VCI-->>W: Get Token Response
   W->>AS: Token Request with received auth code
   AS-->>W: Token Response<br/>(access-token, cNonce)
   W->>VCI: Token Response
   VCI-->>W: Get Proof JWT
   Note over W: Construct proof JWT
   W->>keystore: sign the request
   keystore-->>W: Return signature
   W->>VCI: Proof JWT
   Note over VCI: Construct download request
   VCI->>Certify: Download Credential
   Certify-->>VCI: Return Credential(VC)
   VCI-->>W: Return Credential(VC)
   W->>Verifier: Verify the Credential
   alt Verified Successfully
   Verifier-->>W: Return True
   Note over W: Store the VC, Render the VC
   W->>Pixelpass: Generate QR code
   Pixelpass-->>W: Return QR code image
   Note over W: Cache QR code and render
   else Verification Failed
   Verifier-->>W: Return false with error
   Note over W: Display error
   end
```

**Actors:**

* **Inji Wallet:** Orchestrates the process, interacts with VCI Client and Secure Keystore.
* **Secure Keystore:** Signs cryptographic proofs.
* **VCI Client:** Manages OpenID4VCI communication with the Issuing Authority.
* **Authorization Server:** Authenticates the user (e.g., eSignet).
* **Issuing Authority:** Issues the VC.
* **VC Verifier:** Verifies credential authenticity.
* **Pixelpass:** Handles QR code generation and encoding.

**Workflow Steps:**

1. **Key Pair Generation:**\
   On first use, Inji Wallet generates and securely stores a cryptographic key pair via the Secure Keystore.
2. **VC Download Request:**\
   User initiates VC download (via UIN/VID or KBI). Wallet instructs VCI Client to start the OpenID4VCI issuance flow.
3. **User Authentication:**\
   VCI Client redirects the user to the Authorization Server. User authenticates (OTP, KBI, etc.). Authorization Server returns an auth code.
4. **Token Exchange:**\
   Wallet exchanges the auth code for an access token and nonce from the Authorization Server.
5. **Proof Construction:**\
   Wallet creates a proof JWT with the nonce, sends it to Secure Keystore for signing, and receives the signed proof JWT.
6. **Credential Issuance Request:**\
   VCI Client sends the signed proof JWT to the Issuing Authority. Issuer returns the VC.
7. **Credential Verification:**\
   Wallet verifies the VC with the VC Verifier (checks signature and schema). If verification fails, an error is shown.
8. **VC Storage and Rendering:**\
   Verified credentials are securely stored. For some credentials, a QR code is cached for offline use.

### Verifiable Presentation (VP) Sharing via OpenID4VP Flow

This workflow explains how Inji Wallet shares selected VCs with a verifier (Relying Party) using the OpenID4VP protocol.

```mermaid
sequenceDiagram
    participant U as User 🙋
    participant W as Inji Wallet 📱
    participant keystore as Secure Keystore 🗝️
    participant OVP as OpenId4VP Module 🔐📄
    participant Verifier as Relying Party(Verifier) 🌐

   W->>keystore: Generate and store key-pair
   Note over Verifier: Generate QR code with auth request
   W->>Verifier: Scan QR code
   Verifier-->>W: Return auth request
   W->>OVP: Pass auth request
   Note over OVP: validate the auth request
   OVP-->>W: Return validated auth request
   Note over W: Process auth request and<br/>display Matching VCs
   U->>W: Select VCs and give consent
   W->>OVP: Construct unsigned VP token<br/>(selected VCs based on format, holderId, & SignatureSuite)
   Note over OVP: Construct unsigned VP token by attaching proof without signature
   OVP-->>W: Return unsigned VP token by format
   Note over W: Sign VP token
   W->>OVP: Return signed data
   OVP->>Verifier: Send Auth response<br/>(VP token, Presentation Submission)
```

**Actors:**

* **User:** Selects credentials and provides consent.
* **Inji Wallet:** Manages the process, interacts with OpenID4VP Module and Secure Keystore.
* **Secure Keystore:** Signs VP tokens.
* **OpenID4VP Module:** Validates requests and structures the VP token.
* **Relying Party (Verifier):** Requests and validates credentials.

**Workflow Steps:**

1. **QR Code Creation:**\
   The verifier generates a QR code containing the authentication request.
2. **QR Code Scan:**\
   User scans the QR code in Inji Wallet, which extracts the auth request.
3. **Auth Request Validation:**\
   Wallet passes the request to the OpenID4VP Module for validation (issuer, signature, expiry, audience).
4. **Display Matching VCs & User Consent:**\
   Wallet finds matching credentials, displays them, and the user selects which to share and gives consent.
5. **Construct Unsigned VP Token:**\
   Wallet sends selected VCs and metadata to the OpenID4VP Module, which constructs the VP token (unsigned).
6. **Sign VP Token:**\
   OpenID4VP Module sends the unsigned VP token to Secure Keystore for signing. The signed VP token is returned.
7. **Send Auth Response to Verifier:**\
   Wallet sends the signed VP token and presentation\_submission to the verifier. The verifier validates the response and, if successful, completes the transaction.

## Features Flow

This document delineates the workflow for essential functionalities of Inji Wallet.

### 1. First App Launch

After installing the application for the first time, the user will be asked to set up unlock method for it. The app supports biometric or PIN-based locks. For more details, refer to the [End User Guide](end-user-guide.md).

#### Launch with passcode unlock method

<figure><img src="../../../.gitbook/assets/inji_first_launch_with_passcode.png" alt=""><figcaption></figcaption></figure>

#### Launch with biometric unlock method

<figure><img src="../../../.gitbook/assets/inji_first_launch_with_biometric.png" alt=""><figcaption></figcaption></figure>

### 2. Downloading, Verifying and storing credentials

Residents have the ability to download a Verifiable Credential (VC) for themselves, their family members, or friends using a single mobile device. This can be done through two methods:

While downloading the VCs, the credentials are validated and verified for the authenticity of the issuer using the signature and the proof type provided in the VC.

* Downloading VC using OpenID for VC Issuance Flow (eSignet)

#### Download via eSignet

Below sections are going to detail as how Inji Wallet as an OIDC client to OpenID4VCI method of downloading a VC and illustrated implementations.

**Download credentials using UIN / VID**:

This method of VC download illustrates the **OpenID4VCI** method of download using UIN / VID issued to the resident. In this, eSignet plays the authentication and authorisation end point to connect to the credential provider (Reference Implementation: MOSIP). To understand more about Onboarding Mimoto (Inji BFF) as an OIDC client to support credential issuance from any issuer who support OpenID4VCI protocol refer [here](https://docs.mosip.io/inji/inji-mobile-wallet/customization-overview/credential_providers).

**Download credentials using Knowledge Based Identification (KBI)**

This method of VC download illustrates the **OpenID4VCI** method of download using KBI (Knowledge Based Identification). In this, eSignet plays the authentication, authorisation and credential issuance end point to connect to the credential provider. To understand more about Onboarding Mimoto (Inji BFF) as an OIDC client to support credential issuance from any issuer who supports **OpenID4VCI** protocol, refer [here](https://docs.mosip.io/inji/inji-mobile-wallet/customization-overview/credential_providers).

<figure><img src="../../../.gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>

**Appendix**:

* The term “identifier” in the architecture diagram refers to the unique identifier which can be used to download the credential on the esignet login Page
* eSignet supports Various types of authorizations, ACR value is configured based on the Issuers' need to include the authorization mode in the authorization page
* Types of Authorization Supported for Credential Download by eSignet are:
  *   **Login With OTP**: Credential download using OTP Based authentication to authorize the user

      **Illustrated Implementation**: National ID credentials download
  *   **Login With KBI**: Credential download using KBI to authorize the user. The knowledge (as described by the credential issuer to authorize) is exposed to eSignet from Registry (Issuer) through eSignet Issuance Plugins

      **Illustrated Implementation**: Insurance ID credentials download

### 3. Sharing of credentials

The credentials are shared in a peer-to-peer model with the verifier application. The data exchange between devices is done using the BLE Protocol. For more information, refer to [Tuvali](../technical-overview/integration-guide/building-verifiable-credentials-wallet-with-inji-libraries/tuvali/) documentation.

<figure><img src="../../../.gitbook/assets/vc_share (1).png" alt=""><figcaption></figcaption></figure>

### 4. QR code login process

* Residents can use Inji Wallet to log in to any service provider app (integrated with e-Signet) by just scanning a QR code from their portal.
* The app performs offline face auth after scanning the QR code to verify the user's presence.
* Once the presence is verified, the resident is given the option to choose the optional information to be shared with the service provider portal.
* After consent is provided, the app sends a WLA (Wallet local auth) token which is a JWT token to the relying party.
* The resident is then given the access to the portal after the token verification.

#### Step 1: VC activation process

<figure><img src="../../../.gitbook/assets/vc_activation (1).png" alt=""><figcaption></figcaption></figure>

#### Step 2: QR code login

<figure><img src="../../../.gitbook/assets/online_qr_login (1).png" alt=""><figcaption></figcaption></figure>

### 5. Data backup and restore

From Settings screen, users can access Backup settings screen. In Backup settings screen, users can configure their preferences for data backup. The setting, configured once during the application's lifecycle, determines whether Google Drive or iCloud will be utilized based on the device platform. To restore backup data to the mobile wallet, users must log in to the same account and configure settings within the app accordingly. Additionally, restored Verifiable Credentials (VCs) should be re-activated to enable QR Code login functionality.

<figure><img src="../../../.gitbook/assets/android (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/ios (2).png" alt=""><figcaption></figcaption></figure>
