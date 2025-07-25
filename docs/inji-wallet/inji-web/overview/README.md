---
icon: house
---

# Overview

>  *Inji Web isn't just a web interface – it's a bridge to digital inclusion, enabling secure and seamless access to digital identity and credentials, even without a smartphone. Built to support open and equitable digital ecosystems for everyone.*

Inji Web, akin to the [Inji Wallet](https://docs.mosip.io/inji/inji-mobile-wallet/overview), is an open-source, standards-compliant web-based wallet that enables users to **securely download, manage, and share Verifiable Credentials (VCs)** through a web interface. This easy-to-use platform enables users to access and store their credentials, ensuring confident presentation to service providers for verification and service access, with ease and reliability. Rooted in the principles of inclusivity, it empowers individuals to access benefits or services, even without smartphones.

**Inji Web** is a reference implementation which can be adopted by **ecoystem partners, countries, system integrators (SIs),goverments and organizations**—built **with** the community.

- **Service Providers** can extend, customize, or white-label the solution  
- **Governments** can deploy it for inclusive, public-facing identity journeys  
- **Developers** can contribute, fork, and innovate to suit local needs


It’s ideal for communities with limited smartphone access and ensures full interoperability with open digital identity ecosystems using:

### Core Design Principles

- **Web Accessibility for All**  
  Full credential access via desktop or shared devices.

- **Standard-Compliant Architecture**  
  Based on OpenID4VCI, W3C VC Data Model, SD-JWT (in progress), and OpenID4VP (upcoming).

- **User-Controlled Credential Sharing**  
  Complete control over how, when, and with whom to share.

- **Modular and Configurable Login System**  
  Supports Google and other OpenID-compliant IdPs.

- **Trustworthy Credential Lifecycle**  
  Credentials are digitally signed by issuers, tamper-evident, and easily verifiable.

### Capabilities Snapshot

- **Login with Any IdP**  
  Access your wallet using Google or any OpenID-compliant Identity Provider.

- **Download from Trusted Issuers**  
  Select an issuer, enter UIN/VID/Registration Number or any unique identifier, and securely download credentials.

- **Web Wallet Storage (Post-login)**  
  Credentials are stored in your secure, logged-in web wallet session—enabling access across sessions and devices, depending on configuration.

- **Local Storage Support**  
  Optionally download credentials as digitally signed PDFs with embedded QR codes for offline use or physical copies.

- **Easy Credential Sharing**  
  Share credentials via QR code scan, PDF upload, or printed presentation.

- **Interoperability with Verifiers**  
  Fully compatible with Inji Verify and other OpenID4VP-compliant verifier portals.

- **Flexible Identity Inputs**  
  Authenticate using UIN, Date of Birth, or Registration Number for credential retrieval.


### How It Works

1. **Login & Onboarding**  
   Authenticate via Google or another OpenID-compliant IdP.

2. **Choose Issuer & Credential**  
   Select from available issuers and credential types.

3. **Authenticate Identity**  
   Provide UIN, Date of Birth, or Registration Number.

4. **Download Credential**  
   Receive a digitally signed PDF with an embedded QR code.

5. **Share Credential**  
   - Upload PDF on the verifier portal  
   - Scan QR code  
   - Present printed credential
  
6. **Use as Guest (No Login)**
   Skip login using Guest Mode — no IdP required.  
   * Direct credential download only (no storage in web wallet).

### Sneak Peek: Upcoming Features

- W3C VC Data Model 2.0 Support  
- SVG-based Credential Templates  
- Selective Disclosure via SD-JWT  
- Presentation During Issuance  
- Credential Revocation

### Technology and Integration

Inji Web interacts with:

* [Mimoto APIs](https://mosip.stoplight.io/docs/mimoto/5bf5a1n68g4tq-mimoto) for managing issuers details, facilitate VC download and generate PDF
* [eSignet APIs](https://mosip.stoplight.io/docs/identity-provider/jlmszj6dlxigw-e-signet) for authentication

### Get Involved

For any queries, contributions, or to collaborate, join us on the [Inji community forum](https://community.mosip.io/c/inji/16) or raise a PR via the [GitHub repository](https://github.com/mosip/inji-web).
