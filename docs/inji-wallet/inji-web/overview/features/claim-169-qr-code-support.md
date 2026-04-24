# Claim 169 QR Code Support

### Overview

**Inji Web Wallet** supports receiving and using Verifiable Credentials (VCs) that contain **Claim-169 formatted QR code blocks**. These QR blocks are issued as **CBOR Web Tokens (CWT)** embedded inside the credential and encoded as **Base64**.

This feature enables **secure, compact, and privacy-preserving QR sharing**, particularly useful for **offline and quick verification scenarios**.

The Web Wallet can:

* Download credentials containing embedded **Claim-169 QR blocks**
* Securely store QR payloads within the browser wallet storage
* Render QR codes dynamically for presentation
* Allow users to present QR-based identity attributes when required
* Perform validation checks for **size, structure, and format**

### Specification Details

Claim-169 QR blocks follow standards based on:

* **IANA Claim-169 Registry**
* **CBOR (Concise Binary Object Representation)**
* **CWT (CBOR Web Token)**
* **Base64-encoded QR payloads embedded inside a VC**

A Claim-169 enabled Verifiable Credential may include:

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

Each QR block contains **CBOR-encoded identity attributes**, such as:

| Claim ID | Attribute    |
| -------- | ------------ |
| 4        | Full Name    |
| 12       | Phone Number |
| 17       | Face Image   |

***

### Why This Feature Matters

Claim-169 QR codes enable **identity data to be shared without requiring internet connectivity**, supporting **fast in-person verification workflows**.

Key benefits include:

* **Offline verification capability** through QR scanning
* **Selective disclosure**, where only required attributes are shared
* **Quick presentation of identity data** by displaying QR codes in the browser
* **Compact and secure encoding** using CBOR and CWT
* Support for **multiple QR codes within a single credential** for different verification scenarios\\

### Supported Credential Types

Claim-169 QR support applies to Verifiable Credentials that:

* Contain **embedded CWT QR blocks**
* Include **Base64-encoded Claim-169 QR fields**
* Are issued through **supported issuance flows**

Supported credential formats include:

* **W3C Verifiable Credentials (JSON-LD 1.1 / 2.0)**

## How Does the Claim-169 QR Code Flow Work?

### User Flow (Step-by-Step)

**Step 1: Credential Download**

When a credential containing QR blocks is downloaded to the **Inji Web Wallet**:

* The wallet extracts QR fields (such as `qr1`, `qr2`, etc.)
* Base64 content is decoded to obtain the **CWT payload**
* Optional validations are performed:
  * CWT structure validation
  * CBOR decoding
  * Signature verification (depending on configuration)
* The QR payload is stored securely within the **Web Wallet storage**

**Step 2: Viewing QR Codes**

When a user opens the credential in the Web Wallet:

* The wallet detects available QR blocks
* CBOR payload is converted into a **QR image**
* The QR is displayed with an **issuer-defined label** (for example, _Age Verification_)
* If decoding fails or the QR exceeds size limits, an **error message is displayed**

**Step 3: Sharing QR Codes**

During verification:

* The user selects the required QR code from the credential
* The Web Wallet displays the QR on screen
* The verifier scans the QR using a scanner or verification application

No additional data is transmitted beyond the information encoded inside the QR.

#### Multi-QR Credential Support

A single credential may contain **multiple QR codes**, enabling different verification contexts, such as:

* **Age Verification**
* **Address Verification**
* **Identity Proof**

**Note:** While **Inji Certify** supports the design for issuing **multiple QR codes**, **Inji Wallet currently does not support multiple QR codes for Claim-169 credentials.**

<figure><img src="../../../../.gitbook/assets/Claim 169 - Wallet.png" alt=""><figcaption></figcaption></figure>

## Current Limitations

* Signature verification of **CWT payloads may vary depending on browser capabilities**
* Issuers must configure **QR labels and supported attributes**
* Only **Base64-encoded CWT QR blocks** are supported in the current release
* Advanced error handling and customization are limited in the current implementation

## Learn More

To understand how Claim-169 QR codes are issued and integrated with wallets, refer to:

**Claim-169 QR Code Support – Issuance Documentation**
