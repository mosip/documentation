---
icon: house
---

# Overview

> _Inji Web isn't just a web interface – it's a bridge to digital inclusion, enabling secure and seamless access to digital identity and credentials, even without a smartphone. Built to support open and equitable digital ecosystems for everyone._

Inji Web, akin to the [Inji Wallet](https://docs.mosip.io/inji/inji-mobile-wallet/overview), is an open-source, standards-compliant web-based wallet that enables users to **securely download, manage, and share Verifiable Credentials (VCs)** through a web interface. This easy-to-use platform enables users to access and store their credentials, ensuring confident presentation to service providers for verification and service access, with ease and reliability. Rooted in the principles of inclusivity, it empowers individuals to access benefits or services, even without smartphones.

**Inji Web** is a reference implementation which can be adopted by **ecoystem partners, countries, system integrators (SIs), governments and organizations**—built **with** the community.

* **Service Providers** can extend, customize, or white-label the solution
* **Governments** can deploy it for inclusive, public-facing identity journeys
* **Developers** can contribute, fork, and innovate to suit local needs

It’s ideal for communities with limited smartphone access and ensures full interoperability with open digital identity ecosystems using:

### Core Design Principles

* **Web Accessibility for All**\
  Full credential access via desktop or shared devices.
* **Standard-Compliant Architecture**\
  Based on OpenID4VCI, W3C VC Data Model, IETF SD-JWT, and OpenID4VP support for presenting JSON-LD Verifiable Credentials to any compliant verifier.
* **User-Controlled Credential Sharing**\
  Complete control over how, when, and with whom to share.
* **Modular and Configurable Login System**\
  Supports Google and other OpenID-compliant IdPs.
* **Trustworthy Credential Lifecycle**\
  Credentials are digitally signed by issuers, tamper-evident, and easily verifiable.

### Capabilities Snapshot

**Multiple Credential Format Support**

Inji Wallet is designed for interoperability and flexibility by supporting a wide range of credential formats:

* **W3C Verifiable Credentials (JSON-LD VCs) Data Model 1.1**
  * Standards-based credential format is widely adopted across ecosystems.
  * Suitable for general-purpose credential issuance and verification.
* **IETF SD-JWT**
  * **IETF** **SD-JWT Verifiable Credentials**: Enables holders to download and share credentials in IETF **SD-JWT format**. This allows users to share only the necessary attributes while keeping other data private, ensuring **privacy-preserving credential sharing**.
  * Allows users to share only the required claims with verifiers via the OpenIDVP flow, where these selectively disclosable claims can be shared as per the user's need. _**(Coming Soon)**_
* **OpenID4VP Credential Presentation for JSON-LD VC Format**
  * Enables users to present W3C JSON-LD Verifiable Credentials directly to verifiers using OpenID4VP flows.
  * Fully interoperable with Inji Verify and any OpenID4VP-compliant verifier.
* **Login with Any IdP**\
  Access your wallet using Google or any OpenID-compliant Identity Provider.
* **Download from Trusted Issuers**\
  Select an issuer, enter UIN/VID/Registration Number or any unique identifier, and securely download credentials.
* **Web Wallet Storage (Post-login)**\
  Credentials are stored in your secure, logged-in web wallet session, enabling access across sessions and devices, depending on configuration.
  * Verifiable Credentials are now stored in the **“Stored Cards”** section.
  * You can view and download the credential as a PDF file locally on your system, or print it out once downloaded.
  * You can reset your passcode if you forget it during login. However, the option to change the passcode after logging in is currently not available.
*   **Local PDF Download Support**

    Optionally download credentials as **PDFs** with embedded QR codes for physical copies. Users can present these PDFs to verifiers to access services without requiring a web session.
* **Easy Credential Sharing and Presentation**\
  Share credentials via QR code scan, PDF upload, or printed presentation.\
  \
  Present Credentials via OpenID4VP: Users can now share JSON-LD VCs using a live, secure OpenID4VP presentation flow.
* **Interoperability with Verifiers**\
  Fully compatible with Inji Verify and other OpenID4VP-compliant verifier portals.
* **Flexible Identity Inputs**\
  Authenticate using UIN, Date of Birth, or Registration Number for credential retrieval.

### How It Works

1. **Login & Onboarding**\
   Authenticate via Google or another OpenID-compliant IdP.
2. **Choose Issuer & Credential**\
   Select from available issuers and credential types.
3. **Authenticate Identity**\
   Provide UIN, Date of Birth, or Registration Number.
4. **Download Credential**\
   Receive a PDF with an embedded QR code.
5. **Share Credential via Scan & Upload**
   * Upload the PDF containing the QR code to the verifier portal.
   * Scan the QR code from the PDF via the verifier portal.
   * Present the credentials in printed form
6. **Share via OpenID4VP Presentation Flow**
   * Select the credential you wish to present.
   * Inji Web launches an OpenID4VP flow with the verifier.
   * User reviews and approves credential sharing.
   * Verifier receives a cryptographically verifiable VP.
7. **Use as Guest (No Login)** Skip login using Guest Mode — no IdP required.
   * Direct credential download only (no storage in web wallet).

### Sneak Peek: Upcoming Features

* W3C VC Data Model 2.0 Support
* SVG-based Credential Templates
* Sharing of IETF SD-JWT Selective Disclosure via OpenIDVP
* Presentation During Issuance
* Credential Revocation

### Technology and Integration

Inji Web interacts with:

* [Mimoto APIs](https://mosip.stoplight.io/docs/mimoto/5bf5a1n68g4tq-mimoto) for managing issuer details, facilitating VC download and generating PDF
* [eSignet APIs](https://mosip.stoplight.io/docs/identity-provider/jlmszj6dlxigw-e-signet) for authentication

***

### Learn More

#### <i class="fa-book-open">:book-open:</i> Related Reading

* For any queries, contributions, or to collaborate, join us on the [Inji community forum](https://community.mosip.io/c/inji/16) or raise a PR via the [GitHub repository](https://github.com/mosip/inji-web).

<i class="fa-question">:question:</i> FAQs: [Frequently Asked Questions](../../../page-1.md)

<i class="fa-pen">:pen:</i> Glossary: [Glossary Of Terms](../../../glossary.md)

{% include "../../../.gitbook/includes/useful-links.md" %}
