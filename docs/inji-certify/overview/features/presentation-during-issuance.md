---
hidden: true
---

# Presentation During Issuance

### Overview

The **Presentation During Issuance (PDI)** feature enhances the credential issuance experience by allowing Inji Certify to request and verify an existing Verifiable Credential (VC) from the holder’s wallet as a mandatory step before issuing a new VC. This feature is aligned with the OpenID for Verifiable Credential Issuance (OpenID4VCI) and OpenID for Verifiable Presentations (OpenID4VP) standards.

In this flow, the issuer enforces a verification step during issuance, where the wallet is required to present a specific credential to validate the holder’s eligibility before issuing a VC.

This approach ensures that issuance is conditional, secure, and user‑consented, while avoiding reliance on external or offline verification mechanisms.

### Why This Feature Matters

Presentation During Issuance brings several advantages:

* **Stronger Trust at Issuance:** Ensures that sensitive credentials (eg: Driving Licenses ) are issued only after validating an authoritative credential (eg: National ID).
* **User‑Centric Verification:** The holder presents credentials directly from their wallet with explicit consent.
* **Reduced Backend Dependencies:** Eliminates the need for additional backend integrations or manual checks for eligibility verification.
* **Standards Alignment:** Leverages OpenID4VCI and OpenID4VP, improving interoperability across issuers and wallets.
* **Privacy by Design:** Credentials are shared only for verification purposes and are not persisted beyond the issuance transaction.

### How It Works – Step‑by‑Step (Certify Perspective)

The following sequence describes how Inji Certify handles Driving License issuance using the Presentation During Issuance feature.

#### 1. Certify Receives Issuance Request

The resident initiates the download of a **Driving License VC** from the Inji Wallet. The wallet sends an issuance request to Inji Certify using the supported OpenID4VCI issuance flow.

Certify evaluates the issuance policy and determines that **National ID verification is mandatory** for Driving License issuance.

#### 2. Certify Sends Presentation Request

Inji Certify prepares and sends a **Presentation Request** to the wallet, specifying:

* Required credential type: **National ID VC**
* Required claims or attributes (if applicable)
* Challenge / nonce to prevent replay attacks

This request instructs the wallet to present a valid National ID credential before issuance can proceed.

#### 3. Wallet Collects User Consent and Credential

Upon receiving the presentation request:

* The wallet discovers available credentials that satisfy the request
* The resident is prompted to select their **National ID VC**
* The wallet constructs a **Verifiable Presentation (VP)**, signed using the holder’s proof

The generated VP is then submitted to Inji Certify.

#### 4. Certify Verifies the Presentation

Inji Certify validates the received Verifiable Presentation by performing:

* Cryptographic signature verification
* Issuer trust validation
* Credential schema and claim validation
* Expiry and revocation status checks
* Nonce and challenge verification

Only upon successful verification does Certify proceed further.

#### 5. Certify Issues the Driving License VC

After successful presentation verification:

* Certify constructs the **Driving License Verifiable Credential**
* The credential is issued to the wallet via the credential endpoint

The wallet securely stores the issued Driving License VC for the resident’s use.

#### 6. Issuance Completion

The resident can now view and use the **Driving License VC** from their wallet. If verification fails at any stage, the issuance is terminated and an appropriate error is returned.



<figure><img src="../../../.gitbook/assets/ic-0140-presentation-during-issuance.png" alt=""><figcaption></figcaption></figure>



### Security Considerations

* **Replay Protection:** Presentation requests include nonces and challenges to prevent replay attacks.
* **Explicit User Consent:** Wallet requires user approval before sharing any credential.
* **Minimal Disclosure:** Only required credentials and claims are requested for verification.
* **No Persistent Storage:** Presented credentials are not stored beyond the verification process.

### Limitations

* Client‑based authorization is not supported.
* Only a single issuance mode can be configured per issuer.
* If Presentation During Issuance is enabled, alternative issuance modes (e.g., simple wallet‑initiated issuance without verification) are not supported for the same issuer.)

Please refer to the relevant GitHub technical documentation for detailed configuration, policy setup, and API‑level implementation details.
