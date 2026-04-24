# Claim 169 QR Code Support

### Overview

Inji Mobile Wallet supports receiving and using Verifiable Credentials (VCs) that contain [**Claim-169**](https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification) **formatted QR code blocks**. These QR blocks are issued as **CBOR Web Tokens (CWT)** embedded inside the credential and encoded as Base64.

This feature enables secure, compact, and privacy-preserving QR sharing, especially suited for **offline and quick verification scenarios**.

The wallet can:

* Download credentials containing embedded Claim-169 QR blocks
* Store and render QR payloads securely
* Allow users to present QR-based identity data when required
* Perform validation checks for size, structure, and format

#### Specification Details

[Claim-169 ](https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification)QR blocks follow standards based on:

* **IANA** [**Claim-169**](https://docs.mosip.io/1.2.0/readme/standards-and-specifications/mosip-standards/169-qr-code-specification) **Registry**
* **CBOR (Concise Binary Object Representation)**
* **CWT (CBOR Web Token)**
* Base64-encoded QR payloads embedded inside a VC

A Claim-169-enabled VC may include:

```
{
  "credentialSubject": {
    "id": "${_holderId}",
    "fullName": "${fullName}",
    "mobileNumber": "${mobileNumber}",
    "dateOfBirth": "${dateOfBirth}",
    "identityQRCode": $claim_169_values[0]
  }
}
```

Each QR block contains CBOR data with attributes such as:

| Claim ID | Attribute    |
| -------- | ------------ |
| 4        | Full Name    |
| 12       | Phone Number |
| 17       | Face Image   |

### Why This Feature Matters

* Claim-169 QR codes allow identity data to be shared without internet connectivity, enabling fast in-person verification.
* Each QR can contain only the required attributes, reducing unnecessary disclosure of personal data.
* Users can present identity data by simply displaying a QR code for scanning.
* CBOR + CWT provides a compact and cryptographically secure way to encode identity attributes.
* A single credential can contain multiple QR codes for different verification use cases.

### Supported Credential Types

Claim-169 QR support applies to Verifiable Credentials that:

* Contain embedded **CWT QR blocks**
* Include Base64-encoded Claim-169 QR fields
* Are issued via supported issuance flows

Supported VC formats include:

* W3C Verifiable Credentials (JSON-LD 1.1 / 2.0)

### How Does the Claim-169 QR Code Flow Work?

#### **User Flow (Step-by-Step)**

**Step 1: Credential Download**

When a credential containing QR blocks is downloaded:

* Wallet extracts QR fields (qr1, qr2, etc.)
* Decodes Base64 → obtains CWT
* Performs optional validation:
  * CWT structure check
  * CBOR decoding
  * Signature verification (platform-dependent)
* Stores QR payload securely in encrypted storage

**Step 2: Viewing QR Codes**

When the user opens the credential:

* Wallet detects available QR blocks
* Converts CBOR payload → QR image
* Displays QR with issuer-defined label (e.g., Age Verification)

If decoding fails or QR exceeds size limits, an error message is shown.

**Step 3: Sharing QR Codes**

For verifier interactions:

* User selects the required QR code
* Wallet displays QR on screen
* Verifier scans the QR directly

No additional data leaves the device beyond what is encoded in the QR.

#### **Multi-QR Credential Support**

A single credential may contain multiple QR codes, for example:

* Age Verification
* Address Verification
* Identity Proof

**Note:** While **Inji Certify** supports the design for issuing **multiple QR codes**, **Inji Wallet currently does not support multiple QR codes for Claim-169 credentials.**

<div data-with-frame="true"><figure><img src="../../../../.gitbook/assets/Claim 169 - Wallet.png" alt=""><figcaption></figcaption></figure></div>

### Current Limitations

* Signature verification of CWT payloads may vary by platform.
* Requires issuer configuration to provide QR labels and supported attributes.
* Only Base64-encoded CWT QR blocks are supported in the current release.
* Customized error handling is not supported in the current capacity.

### Learn More

**Claim 169 QR Code Support**: To learn how this QR code is issued and works with Inji Mobile Wallet, please click [here](https://github.com/inji/inji-certify/blob/release-0.14.x/docs/Claim-169-QR-Code-Support.md) to understand its issuance.
