# Features

## Overview

Inji Verify empowers organizations to validate Verifiable Credentials (VCs) instantly through an intuitive web portal. Whether scanning QR codes, uploading documents, or verifying credentials via secure OpenID4VP flows, verifiers can confirm credential authenticity in seconds—reducing manual verification time and ensuring trust across education, healthcare, government, and enterprise sectors.

The platform combines modular SDK components with enterprise-grade security, enabling seamless integration into existing verifier applications while maintaining compliance with W3C VC Data Model standards.

## Standards, Specifications, and Compliance

Inji Verify adheres to industry standards for interoperable and trustworthy credential verification.

### Credential Formats

| Format | Description |
|--------|-------------|
| **W3C VC Data Model 1.1 & 2.0** | Industry-standard Verifiable Credentials ensuring interoperability |
| **JSON-LD** | Linked data credentials with semantic context |
| **SD-JWT** | Selective Disclosure JWT credentials with privacy-preserving claim sharing |

### QR Code Encoding Standards

| Standard | Description |
|----------|-------------|
| **Claim 169** | MOSIP specification for encoding credentials into compact, machine-readable QR codes using CBOR (Concise Binary Object Representation) for efficient, offline-friendly credential delivery |

### Cryptographic Algorithms

| Algorithm | Support Status |
|-----------|----------------|
| Ed25519 Verification Key 2018 | Supported |
| Ed25519 Verification Key 2020 | Supported |
| RSA Verification Key 2018 | Supported |

### Verification Methods

- `did:web` with proofValue or JWS
- `https://` endpoints with proofValue or JWS

### Protocol Support

- **OpenID4VP**: Cross-device and same-device Verifiable Presentation flows per OpenID specifications

## Core Verification Features

### QR Code Scanning
Verify credentials instantly by scanning QR codes directly through your device's camera, including Claim 169–encoded credentials.

<!-- [End User Guide](../docs/inji-verify/functional-overview/end-user-guide.md) -->

- **Real-time Camera Scanning**: Point your device camera at any QR code to initiate instant verification, eliminating manual data entry and reducing verification time to seconds
- **Claim 169 Support**: Verify compact QR-encoded credentials mapped to Claim 169 standard for offline-friendly credential delivery
- **Mobile Zoom Control**: Adjust magnification using the zoom slider for optimal scanning accuracy, especially useful for small or densely-encoded QR codes
- **Multi-Version Support**: Compatible with QR code versions v1 through v27, ensuring broad interoperability with credentials from various issuers

### Document Upload Verification

<!-- [Workflow](../docs/inji-verify/functional-overview/workflow/) -->

Upload credential documents directly to the portal for verification when scanning isn't possible.

- **Multi-Format Support**: Upload PDFs, JPEG, JPG, and PNG files containing embedded QR codes, providing flexibility for different credential formats
- **Extended QR Support**: Process QR code versions up to v32 through the upload feature, supporting higher-density credentials that exceed scan capability
- **Batch Document Processing**: Verify credentials embedded in multi-page documents without extracting individual pages


### OpenID4VP Presentation Verification

Verify Verifiable Presentations securely using OpenID4VP standards for both cross-device and same-device scenarios.

- **Cross-Device Flow**: Generate authorization requests as QR codes that users scan with their mobile wallet (Inji Web or any OpenID4VP-compliant wallet), receive signed Verifiable Presentations, and display validated results
- **Same-Device Flow**: Initiate verification on the same mobile device via deep links, enabling seamless app-to-app credential sharing without a second device
- **Streamlined Online Sharing**: Embed URLs instead of dense VCs in QR codes, reducing complexity while maintaining secure credential retrieval from designated storage locations

### SD-JWT Credential Verification

Verify selective disclosure credentials while preserving holder privacy.

- **Selective Attribute Display**: Visually distinguish disclosed claims from undisclosed attributes, providing transparency about what information is shared
- **Cross-Flow Compatibility**: Verify SD-JWT VCs via QR scanning, upload, and VP verification flows with consistent behavior
- **Privacy-Preserving Validation**: Confirm credential authenticity without requiring disclosure of all embedded claims

### Real-Time Verification

Instant validation results without processing delays.

- **Immediate Feedback**: Verification results displayed within seconds of submission
- **No Queue Processing**: Direct validation without batch processing delays
- **Live Status Updates**: Progress indicators during credential processing

## Credential Display & Status

### Revocation Status Checking

Ensure credentials are current and valid by checking issuer revocation status.

- **Real-time Status Verification**: Query credential status against issuer registries to detect revoked credentials immediately
- **Visual Status Indicators**: Display clear valid, invalid, or revoked status with color-coded results for instant comprehension
- **Trust Maintenance**: Prevent acceptance of invalidated credentials, protecting organizational integrity

### Credential Status Display

Clear visual presentation of verification results.

- **Valid Credentials**: Green indicators confirm active, verified credentials with full claim display
- **Invalid Credentials**: Red indicators highlight credentials that fail cryptographic validation
- **Expired Credentials**: Amber indicators show credentials past their validity period

### Multilingual Credential Display

View and verify credentials in multiple languages for global accessibility.

- **Localized Claim Values**: Display credential claims in the holder's or verifier's preferred language based on issuer-provided translations
- **11 Language Support**: Interface available in English, Portuguese, Spanish, French, Arabic, Khmer, Tamil, Hindi, and Kannada
- **Regional Accessibility**: Improve verification experiences across diverse populations and geographic regions

### SVG Credential Rendering

Display credentials with issuer-intended visual presentation and branding.

- **Original Design Preservation**: Render credentials in Scalable Vector Graphics format maintaining layout, typography, and visual elements
- **Brand Consistency**: Display credentials exactly as issuers designed them, ensuring visual authenticity alongside cryptographic validation
- **High-Resolution Output**: Crisp credential display across all screen sizes and resolutions

### Error Handling & User Guidance

Guide users through verification issues with actionable feedback.

- **Invalid QR Detection**: Clear messaging when QR codes contain malformed or unreadable data
- **Expired Credential Alerts**: Informative notices when credentials have passed validity dates
- **Decoding Failure Guidance**: Step-by-step instructions for resolving upload or scanning issues

## Integrations & SDK

[Integration Guide](../docs/inji-verify/technical-overview/integration-guides/openid4vp-vp-verification-integration-guide.md)

### Modular SDK Components

Embed verification capabilities directly into your verifier applications using plug-and-play components.

- **Scan/Upload Component**: Integrate QR code scanning or file upload functionality into your application without building from scratch
- **OpenID4VP VP Verification Component**: Add cross-device and same-device VP verification flows aligned with OpenID4VP specifications
- **Independent NPM Modules**: Import only the components you need, reducing bundle size and dependency overhead

| Component | Technology | Purpose |
|-----------|------------|---------|
| Scan/Upload | TypeScript / React 18.2.0 | QR code capture and file upload |
| VP Verification | TypeScript / React 18.2.0 | OpenID4VP presentation verification |

### PixelPass Library Integration

Decode QR codes accurately using the integrated PixelPass SDK.

- **CBOR Decoding**: Process CBOR-encoded QR codes for compact credential verification
- **Reliable Data Extraction**: Ensure accurate decoding of embedded credential data for downstream validation
- **Library Version**: Integrated [PixelPass v0.8.0-RC2](https://www.npmjs.com/package/@injistack/pixelpass/v/0.8.0-RC2?activeTab=versions) for secure processing

### Backend Verification Services

Robust server-side verification with persistent data storage.

- **VC-Verifier Library Integration**: Server-side verification supporting Ed25519 and RSA cryptographic standards
- **PostgreSQL Database**: Durable data storage replacing in-memory solutions, ensuring verification continuity and audit trails
- **VP Proof Verification**: Validate both Verifiable Credentials and Verifiable Presentations server-side

### API Documentation

- [Inji Verify APIs](https://mosip.stoplight.io/docs/inji-verify/63da8fc2ca609-open-id-4-vp-verifier-api-inji-verify)

## Ecosystem Compatibility

### MOSIP UIN-Based VC Support

Verify credentials issued using MOSIP Unique Identification Numbers.

- **MOSIP Ecosystem Integration**: Seamlessly validate UIN-based credentials within MOSIP identity frameworks
- **Expanded Interoperability**: Support verification of national ID credentials across MOSIP-aligned implementations

### DID Method Support

- **did:web**: Resolve issuer keys from web-hosted DID documents
- **HTTPS Endpoints**: Direct key resolution from issuer-hosted verification endpoints

## Deployment & Platform Support

### Docker Compose Deployment

Simplify installation and deployment with containerized setup.

- **Quick Setup**: Deploy the complete verification stack with a single Docker Compose command
- **Environment Consistency**: Ensure identical configurations across development, staging, and production environments
- **Resource Isolation**: Run verification services in isolated containers for security and performance

### Scalable Architecture

Handle growing verification volumes without performance degradation.

- **Horizontal Scaling**: Distribute load across multiple verification instances
- **Optimized Performance**: Efficient resource utilization under varying demand
- **Enterprise-Ready**: Support high-volume verification scenarios for large organizations

### UI Theme Customization

Adapt the verification portal appearance to match organizational branding.

- **Custom Theming**: Configure colors, logos, and visual elements to align with your organization's identity
- **White-Label Ready**: Deploy branded verification portals for country-specific or enterprise implementations

### Supported Browsers

| Browser | Minimum Version |
|---------|-----------------|
| Google Chrome | 103.0+ |
| Mozilla Firefox | 100.0+ |
| Microsoft Edge | 104.0+ |
| Safari (macOS) | 14.1+ |

### Camera Requirements for Scanning

| Requirement | Specification |
|-------------|---------------|
| Resolution | 12 megapixels or higher |
| Quality | 1020p minimum |
| Lighting | Well-lit environment |
| Effects | No filters or dark mode |

### QR Code Version Compatibility

| Feature | Supported Versions | Notes |
|---------|-------------------|-------|
| Scan | v1 - v22 | Consistent performance |
| Scan | v23 - v27 | Variable results based on content density |
| Upload | v1 - v32 | Full support |

## Additional Capabilities

Features that enhance the overall verification experience:

### Responsive Interface Design

Optimal verification experience across all devices and screen sizes.

- **Mobile-First Design**: Full functionality on smartphones with back camera scanning capability
- **Desktop Optimization**: Enhanced layout for larger screens with keyboard accessibility
- **Cross-Browser Compatibility**: Consistent experience across Chrome, Firefox, Edge, and Safari

### Enhanced Security

Protect sensitive credential data throughout the verification process.

- **Digital Signature Validation**: Cryptographic verification ensures credential authenticity and detects tampering
- **Encryption Protection**: Secure handling of sensitive information during processing
- **PixelPass Security**: Secure QR code processing through audited library implementation

## Upcoming Features

Refer to Roadmap 2026 to keep updated about the upcoming features [here](../../../readme/roadmap/README.md).


<!--


## Learn More

- **Workflow Documentation**: [Verification Workflows](../docs/inji-verify/functional-overview/workflow/)
- **Integration Guide**: [SDK Integration](../docs/inji-verify/technical-overview/integration-guides/openid4vp-vp-verification-integration-guide.md)
- **API Documentation**: [Inji Verify APIs](../docs/inji-verify/api.md)
- **Community**: [MOSIP Community Forum](https://community.mosip.io/c/inji/16)


---

Inji Verify 0.17.0 Enhancements

### Richer Verification Responses

The `/vc-verification` and `/vp-result/{txnId}` endpoints now return contextual details beyond simple success or failure status:

- **Detailed Failure Reasons**: Distinguish between expiry, revocation, schema mismatch, signature issues, or policy checks
- **Per-Credential Status**: Identify which credentials passed or failed in multi-credential presentations
- **Actionable Outcomes**: Enable applications to prompt users to retry, present alternative credentials, or escalate to manual review

-->




<!-- Before 0.17.0 Release

# Old Content


Inji Verify offers a seamless credential verification experience through QR code scanning, upload functionality, and Pixel Pass SDK integration for accurate decoding. Utilizing a robust Verification SDK ensures the authenticity and integrity of credentials. The portal displays credentials accurately based on issuer configurations and handles errors effectively. With a user-friendly, responsive interface, real-time verification, and scalable performance, Inji Verify provides an efficient and flexible verification solution.

Here is a comprehensive summary of the features offered by Inji Verify.

1. **QR Code Scanning:** Inji Verify allows users to easily scan QR codes using their device's camera, enabling swift verification of credentials. For mobile scans, a zoom slider is available now to adjust magnification, enhancing the scanning and verification experience.
2. **Upload QR Code:** Users can upload QR code images directly to the portal for verification, providing flexibility in the verification process.

* Supports various formats like PDFs and images(JPEG, JPG, and PNG) containing QR codes.

3. **Verifying QR Codes Using OpenID4VP Standards (Online Sharing)**

* **Streamlined Credential Sharing**: Inji Verify utilizes[ **OpenID4VP**](https://openid.net/specs/openid-4-verifiable-presentations-1_0.html#name-cross-device-flow) standards, embedding a URL in the QR code for online credential sharing, reducing the need for embedding dense Verifiable Credentials (VCs).
* **Efficient Scanning**: Users can scan the QR code, which directs them to a secure VC storage location like [**Inji Web**](https://docs.mosip.io/inji/inji-web/functional-overview/features#store-verifiable-credentials-vc) or any other platform adhering to OpenID4VP standards.
* **Secure Authorization Flow**: Upon scanning the QR code, Inji Verify initiates an authorization request, securely retrieving and verifying the credential from Inji Web.
* **Cross-Device Sharing**: Supports seamless cross-device credential sharing, simplifying verification and minimizing QR code complexity.
* **Same-Device Sharing**: Inji Verify now supports OpenID4VP Same Device Flow, where both the verifier and wallet operate on the same mobile device.

4. **Docker Compose for Easy Installation**: Simplifies deployment and setup through Docker Compose, allowing quick and efficient installation.
5. **Pixel Pass Integration:** Inji Verify seamlessly integrates with Pixel Pass SDK, ensuring accurate decoding of QR code data for verification purposes.

* **CBOR Decoding Support:** PixelPass library now supports decoding of CBOR-encoded QR codes, enabling Inji Verify to verify CBOR-encoded QR codes. **Note**: CBOR encoding capability within the PixelPass library is still under development.

6. **Verification SDK:** The portal utilizes a robust Verification SDK to validate decoded data, ensuring the authenticity and integrity of the credentials.
7. **Credential Display**: Inji Verify retrieves display properties of credentials from the issuer's well-known configuration, ensuring a consistent and accurate representation of credential details.
   * **Valid Credential Display**: These credentials are currently active and verified using the Inji Verify Portal.
   * **Invalid Credential Display**: These credentials are active but invalid.
   * **Expired Credential Display**: These credentials have passed their validity period and are no longer active.
8. **OpenIDVP Cross Device flow**: OpenID for Verifiable Presentations (OpenID4VP) enables users to securely share their Verifiable Credentials (VCs) from their digital wallet with a verifier, even when they are using different devices.

* A verifier requests specific credentials from the user.
* The user’s wallet (on a different device) allows them to share either all or only the available credentials.
* The shared credentials are then verified for authenticity and validity.
* The verification result is displayed on Inji Verify, confirming whether the credentials are valid or not.

This ensures a secure and flexible way of sharing credentials across different devices while maintaining privacy and control over what gets shared.

9. **OpenIDVP Same Device flow**: Inji Verify now supports OpenID4VP Same Device Flow, where both the verifier and mobile wallet operate on the same mobile device.

* The verifier sends an Authorization Request (with `presentation_definition`) via deep link.
* The wallet processes the request, authenticates the user, gathers consent, and returns a `vp_token` via redirect (`response_mode=direct_post`).
* Inji Verify parses the `vp_token`, validates the claims, and displays Verifiable Credential (VC) results (valid, expired, or invalid) with color-coded status.
* Multiple VCs can be displayed in card format, each with expandable details and a JSON download option.
* This enables a seamless, app-like user experience for mobile users without requiring a second device.

10. **Ease of Integrating Modular SDK Components with Verifier Applications**:

* Inji Verify provides modular SDK components that empower verifier (relying party) applications to seamlessly integrate VC verification workflows—without relying on the full Inji Verify reference application.
* **Scan/Upload Component** – Enables QR code scanning or file upload for verifying credentials.
* **OpenID4VP VP Verification Component** – Supports Verifiable Presentation: Cross Device and Same Device flows aligned with the OpenID4VP specification
* These plug-and-play components are:
  * Developed using TypeScript and Optimized for React environments
  * Published as independent NPM modules to ensure flexibility and reusability
* This flexibility enables verifiers to easily integrate VC verification into their own UI, use only the modules they need and reduce dependency on the entire Inji Verify codebase
* The Inji Verify UI is provided as a reference implementation to demonstrate how the SDK components can be orchestrated in a full-fledged verifier application. It is not required for adoption. Developers are encouraged to go through step-by-step [integration guide](../../technical-overview/integration-guides/openid4vp-vp-verification-integration-guide.md) and selectively embed only the components relevant to their business needs.

**Note**: Inji Verify SDK components supports React version- 18.2.0

11. **Backend Setup**: Inji Verify's backend supports robust and secure verification of Verifiable Credentials (VCs). The integration of the vc-verifier library facilitates server-side verification of VCs, accommodating both Ed25519 (Signature 2018 & 2020) and RSA (Signature 2018) cryptographic standards. To ensure persistent and reliable data storage, the backend has transitioned from an in-memory H2 database to a PostgreSQL database which enhances data durability.
12. **Language Selection**: User can choose from the listed languages for better usability such that the text description and VC result on the UI is displayed based on the chosen language. Inji Verify supports the following international languages which includes Portuguese, Spanish, French, English, Arabic, Khmer and the Indian vernacular langauges includes Tamil, Hindia and Kannada.
13. **UI Theme customization**: UI themes can be customized so that any integrators/ country can change the UI theme based on their requirements.
14. **Server setup for VC and VP proof Verification**: Server setup for VC and VP proof Verification: The vc-verifier library has been integrated into Inji Verify to enable server-side verification of both Verifiable Credentials (VCs) and Verifiable Presentations (VPs) which supports key types: `Ed25519VerificationKey2018`, `Ed25519VerificationKey2020`, and `RSAVerificationKey2018` .
15. **Error Handling:** The portal features comprehensive error handling mechanisms, guiding users in case of invalid QR codes, or expired QR codes and decoding failures.
16. **User-friendly Interface**: Inji Verify offers an intuitive interface, providing a seamless experience for users to navigate and verify credentials effortlessly. The new version includes a responsive design for mobile devices across various browsers, enhancing the ease of exploring, scanning, and uploading features.
17. **Real-time Verification:** Users can verify credentials in real time, ensuring prompt validation and reducing verification delays.
18. **Scalability:** Inji Verify is designed to scale efficiently, accommodating growing user demands and ensuring optimal performance under varying load conditions.

{% hint style="warning" %}
**Note**: Currently the scope of VCs that can be verified are:

* VCs adhering to **W3C VC Data Model** 1.1 and 2.0 standards, promoting interoperability and adherence to industry specifications.
* **Algorithms** supported: Ed25519 Verification Key 2018, Ed25519 Verification Key 2020, RSA Verification Key 2018
* **VC format** support: JSON-LD
* **Verification methods** supported:
  * verificationMethod is `did:web` and in combination with proofValue or jws\
    \*verificationMethod is `https://` and in combination with proofValue or jws
{% endhint %}

19. **Cross-Platform Compatibility**:
    1. Compatible with a wide range of devices and operating systems, including desktops, mobile devices, and laptops.
    2. A mobile responsive version with back camera capability is now available.
    3. Responsive design ensures optimal performance and usability across different screen sizes and resolutions.
    4. Tablet responsiveness tested on specific devices; still under development.
    5. Accessible from anywhere with an internet connection for convenient on-the-go verification.
20. **QR Code Version Compatibility and Technical Requirements**:

    **Scan Feature QR Code Compatibility**:

    * QR code versions supported for the scan feature range from v22 and below with consistent performance.
    * Versions from v23 to v27 show inconsistent results due to varying data bytes based on the use case for verifiable credentials embedded into the QR code.
    * Versions above v27 are not supported for the scan feature. If you have a QR code version above v27, please use the upload feature to upload the document or QR code for verification.

    **Camera Resolution Requirement**:

    * The device's front, back, or web camera resolution must exceed 12 megapixels.
    * Resolutions below this range result in inconsistent QR code scanning.
    * Cameras should be used in well-lit environments without filters, ensuring proper alignment for optimal scanning.

    **Upload Feature QR Code Compatibility**:

    * QR code versions supported for the upload feature range from v32 and below.
21. **Enhanced Security and Data Protection**:
    * Inji Verify employs encryption techniques to protect sensitive information and prevent tampering.
    * Advanced algorithms and cryptographic methods ensure that QR codes have not been tampered with.
    * Utilizes [**pixel pass library v0.5.0**](https://www.npmjs.com/package/@mosip/pixelpass/v/0.5.0) for secure QR code processing.
    * Real-time verification provides instant feedback on credential validity, giving users confidence in authenticity.
22. **Future SDK Development Roadmap**:

{% hint style="info" %}
**Note:** The **Inji Verify SDK- Scan / Upload component** to enable developers to easily embed VC verification capabilities into their verifier (relying party) applications will be coming out in future releases! Stay tuned!
{% endhint %}

23. **SD JWT support**:

Inji Verify now supports SD-JWT Verifiable Credentials (VCs) across QR code scanning, upload, and VP verification (cross-device and same-device flows), adhering to OpenID4VP and OpenID4VCI standards. Users can verify SD-JWT VCs by scanning or uploading QR codes, and securely share credentials between devices or on the same device. The portal visually distinguishes disclosed and undisclosed claims, enhancing privacy and transparency. Robust error handling guides users through invalid QR codes or VP submission issues, ensuring a seamless and secure verification experience.

For more detailed information on each step and the underlying systems, click [**here**](../../functional-overview/workflow/)**.**

24. **Revocation Support**: This feature introduces the ability to update a Verifiable Credential (VC) status to “Revoked” when it is invalidated by the issuer. It ensures that verifiers can always check the latest credential status and helps maintain the integrity and trustworthiness of the verification process.
25. **Multilingual Support**: With this enhancement, VCs can now display claims in multiple languages. It allows issuers to include localized claim values, enabling verifiers and holders to view credentials in their preferred language, thereby improving accessibility and inclusivity across different regions and user groups.
26. **SVG Rendering Support**: This feature enables the rendering of Verifiable Credentials in Scalable Vector Graphics (SVG) format, preserving the original design, layout, and branding of the credential. As a result, the displayed credential closely matches the issuer’s intended visual presentation, ensuring both authenticity and aesthetic consistency.
27. **Support for MOSIP UIN-based VCs**: This enhancement adds compatibility for Verifiable Credentials issued using MOSIP Unique Identification Numbers (UINs). It allows verifiers to process and validate these credentials seamlessly, strengthening the ecosystem’s alignment with MOSIP’s identity framework and enabling broader interoperability.


-->