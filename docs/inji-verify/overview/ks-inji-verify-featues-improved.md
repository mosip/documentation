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

[End User Guide](../docs/inji-verify/functional-overview/end-user-guide.md)

- **Real-time Camera Scanning**: Point your device camera at any QR code to initiate instant verification, eliminating manual data entry and reducing verification time to seconds
- **Claim 169 Support**: Verify compact QR-encoded credentials mapped to Claim 169 standard for offline-friendly credential delivery
- **Mobile Zoom Control**: Adjust magnification using the zoom slider for optimal scanning accuracy, especially useful for small or densely-encoded QR codes
- **Multi-Version Support**: Compatible with QR code versions v1 through v27, ensuring broad interoperability with credentials from various issuers

### Document Upload Verification

[Workflow](../docs/inji-verify/functional-overview/workflow/)

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
- **Library Version**: Integrated [PixelPass v0.7.0](https://www.npmjs.com/package/@mosip/pixelpass/v/0.7.0) for secure processing

### Backend Verification Services

Robust server-side verification with persistent data storage.

- **VC-Verifier Library Integration**: Server-side verification supporting Ed25519 and RSA cryptographic standards
- **PostgreSQL Database**: Durable data storage replacing in-memory solutions, ensuring verification continuity and audit trails
- **VP Proof Verification**: Validate both Verifiable Credentials and Verifiable Presentations server-side

### API Documentation

- [Inji Verify APIs](../docs/inji-verify/api.md)

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

Refer to Roadmap 2026 to keep updated about the upcoming features. 


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