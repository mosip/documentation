# Presentation During Issuance (PDI)

## Overview

Presentation During Issuance (PDI) in **Inji Mobile Wallet** is a mechanism that allows an issuer to **request and verify an existing Verifiable Credential (VC)** from a user **before issuing a new credential**.

Instead of relying on OTPs, reference numbers, or manual checks, PDI enables issuers to request a **Verifiable Presentation (VP)** from the wallet as part of the issuance flow. The issuer validates the presented credential to confirm identity, eligibility, or authorization before issuing the new credential.

Inji Wallet implements this feature using **OpenID4VCI** for issuance and **OpenID4VP** for presentation, with protocol complexity abstracted through dedicated client libraries.

## Why This Feature Matters

#### a) Stronger Security & Fraud Prevention

Issuers verify cryptographically signed credentials rather than relying solely on user-entered verification methods, reducing the risk of impersonation and fraud.

#### b) Trust-Based Issuance

Credentials are issued only after validating trusted, issuer-backed proofs, ensuring relying parties receive authentic and eligible credentials.

#### c) Improved User Experience

Users don’t need to remember IDs or complete repetitive verification steps. Credential selection and consent happen directly within the wallet.

#### d) Privacy-Preserving Verification

Only required credentials are shared, and users explicitly approve what data is presented, ensuring transparency and user control.

#### e) Standards-Based & Interoperable

Built on OpenID4VCI and OpenID4VP standards, PDI supports interoperable credential ecosystems across sectors and issuers.

### Supported Credential Types

**Credentials That Can Be Presented (for verification)**

Any verifiable credential that:

* Is stored in the wallet
* Matches the issuer’s presentation policy
* Conforms to supported formats and schemas

**Supported Formats**

* **W3C JSON-LD Verifiable Credentials (v1.1 and v2.0)**\
  Credentials conforming to the W3C Verifiable Credentials Data Model, including JSON-LD-based credentials with linked data proofs.
* **mDoc / mDL (ISO 18013-5 / 18013-7)**\
  Mobile document credentials, such as mobile driving licenses and other ISO-compliant mobile IDs, where issuer and verifier support is available.
* **SD-JWT (IETF)**\
  Selective Disclosure JWT-based credentials compliant with IETF specifications, enabling privacy-preserving disclosure of claims.

> The exact credential requirement is defined by the issuer.

### How Does the Presentation During Issuance Flow Work?

#### User Flow (Step-by-Step)

1. **User requests a new credential**\
   The user initiates a request for a new credential from an issuer using Inji Wallet.
2. **Issuer requires verification**\
   The issuer determines that an existing credential must be presented to confirm eligibility or identity.
3. **Wallet displays eligible credentials**\
   Inji Wallet identifies and shows credentials that satisfy the issuer’s request.
4. **User selects a credential**\
   The user chooses one credential to present.
5. **User reviews and approves sharing**\
   The wallet clearly shows what information will be shared, and the user provides explicit consent.
6. **Wallet sends Verifiable Presentation**\
   The wallet creates and sends a signed Verifiable Presentation to the issuer.
7. **The issuer verifies the presentation**\
   The issuer validates:
   * Credential authenticity
   * Trust chain of the original issuer
   * Proof of subject control
8. **The issuer issues the new credential**\
   Upon successful verification, the issuer issues the requested credential.
9. **The wallet stores the issued credential**\
   The new credential is securely stored and becomes available to the user.

<figure><img src="../../../../.gitbook/assets/PDI Flow.png" alt=""><figcaption></figcaption></figure>

### Wallet Responsibilities

* Display issuer requirements
* Show eligible credentials
* Capture user consent
* Create and send Verifiable Presentations
* Store newly issued credentials securely

### Issuer Responsibilities

* Define presentation requirements
* Verify presented credentials
* Enforce issuance policies
* Issue credentials upon successful verification

#### Error Feedback Granularity

* Some failure cases (e.g., invalid presentation, policy mismatch) may return generic errors; enhanced user-facing messaging may be added in future updates.

### Learn More

**Presentation During Issuance – Inji Wallet:** To **l**earn how PDI works end-to-end, including issuer policies, presentation exchange, and issuance flows.
