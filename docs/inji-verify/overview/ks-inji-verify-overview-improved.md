# Overview

## Inji Verify

Inji Verify enables verifiers and relying parties to validate Verifiable Credentials encoded in QR codes through an intuitive web portal interface. It follows the standards of W3C Verifiable Credentials Data Model 1.1 and 2.0, and OpenID4VP (OpenID for Verifiable Presentations).

Inji Verify decodes QR code data using the PixelPass library and validates the credential's authenticity using cryptographic verification methods. These credentials represent digitally secured versions of both traditional paper and digital credentials, ensuring secure and reliable verification across various industries and use cases.

> **Important!** Before you proceed, you should be aware of the relevant standards. Please read the following before proceeding:
>
> * [W3C VC - Verifiable Credentials Overview](https://www.w3.org/TR/vc-overview/)
> * [OpenID4VP - OpenID for Verifiable Presentations](https://openid.net/specs/openid-4-verifiable-presentations-1_0.html)

## Standards, Specifications and Compliance

Inji Verify adheres to international standards, ensuring credential verification is trusted and interoperable worldwide.

### Credential Data Models

| Standard | Description |
|----------|-------------|
| **W3C Verifiable Credentials 1.1** | Current international standard for digital credentials |
| **W3C Verifiable Credentials 2.0** | Latest specification with enhanced features |

### Verification Protocols

| Protocol | Description |
|----------|-------------|
| **OpenID4VP** | Cross-device and same-device Verifiable Presentation flows |

### Credential Formats

| Format | Status | Description |
|--------|--------|-------------|
| **JSON-LD** | Available | Linked Data credentials with semantic context |
| **SD-JWT** | Available | Selective Disclosure JWT with privacy-preserving claim sharing |
| **mDoc/mDL (ISO 18013-5/7)** | Coming Soon | Mobile document and driver's license format |

### QR Code Encoding Standards

| Standard | Status | Description |
|----------|--------|-------------|
| **Claim 169** | Available | MOSIP specification for compact CBOR-encoded QR credentials |
| **CBOR Encoding** | Available | Concise Binary Object Representation for efficient credential delivery |

### Cryptographic Algorithms

| Algorithm | Description |
|-----------|-------------|
| **Ed25519 (2018 & 2020)** | High-performance elliptic curve verification |
| **RSA (2018)** | RSA signature verification for broad compatibility |

### Feature Coverage

| Feature | Status | Description |
|---------|--------|-------------|
| **QR Code Verification** | Available | Scan or upload QR codes (PDF, JPEG, JPG, PNG) including Claim 169 format |
| **OpenID4VP Verification** | Available | Cross-device and same-device Verifiable Presentation flows |
| **VC Format Verification** | Partial | JSON-LD and SD-JWT supported; mDoc/mDL coming soon |
| **Credential Display** | Available | SVG rendering with multilingual support (11 languages) |
| **Revocation Checking** | Available | Real-time status verification against issuer registries |
| **MOSIP UIN VCs** | Available | Compatibility with MOSIP ecosystem credentials |
| **SDK Components** | Available | OpenID4VP VP Verification and Scan/Upload components as NPM modules |
| **Offline Verification** | Coming Soon | BLE-based verifiable presentation for offline scenarios |

To know more about features available in Inji Verify please refer to the [Features Documentation](../functional-overview/functional-overview.md).

## Try It Out

Explore Inji Verify in our [Sandbox Collab Environment](https://collab.mosip.net/).

## Architecture

Inji Verify serves as a verification platform for verifiable credentials, offering an intuitive web portal designed to streamline the process of verifying VCs for users. The platform consists of a React-based frontend and a Java Spring Boot backend service.

**Key Components:**

* **Inji Verify UI**: React-based web portal for scanning/uploading QR codes and displaying verification results
* **Inji Verify Backend**: Java Spring Boot service for server-side VC verification and OpenID4VP handling
* **PixelPass Library**: Decodes QR code data including CBOR-encoded credentials
* **VC Verifier Library**: Performs cryptographic verification of credentials
* **PostgreSQL Database**: Stores OpenID4VP presentation definitions and transaction data

For a detailed view of Inji Verify's architecture and components, check the [Components Documentation](../technical-overview/components.md).

## Deployment

Inji Verify supports two modes of deployment to cater to different users with different purposes:

1. **Local Development Setup**

   * Intended for experimentation and development. Local Setup can be carried out in two ways:
     * **Developer Setup with Docker Compose**
       * Full-featured access for development and testing
       * Clone the repository and follow the [Developer Setup Guide](https://github.com/mosip/inji-verify/blob/release-0.12.x/README.md#developer-setup)
     * **Demo Setup**
       * Optimized for showcasing specific use cases
       * Follow the [Demo Setup Guide](https://github.com/mosip/inji-verify/blob/release-0.12.x/README.md#demo-setup)
   * This is for developers, community members, and country representatives to explore the application, demonstrate its usage to external stakeholders, or conduct proof-of-concepts (POCs).

2. **Deployment with Kubernetes Cluster**

   * Designed for production environments.
   * Enables organizations to host and utilize the product at scale.
   * Click [here](https://docs.inji.io/readme/setup/deploy#deploying-inji-verify) to learn more about this mode of deployment.

**Prerequisites:**
* Node 18 (install using [nvm](https://github.com/nvm-sh/nvm))
* Java 21 (install using [sdkman](https://sdkman.io/))
* Maven
* Docker 20.4 and above

## SDK Integration

Inji Verify SDK provides plug-and-play React components that enable developers to integrate credential verification workflows into their verifier (relying party) applications.

### Available SDK Components

| Component | Description |
|-----------|-------------|
| **OpenID4VP VP Verification** | React component for cross-device and same-device VP verification flows |
| **Scan/Upload** | Component for embedding VC verification capabilities (coming soon) |

### Integration Resources

* **SDK Documentation**: [Inji Verify SDK Integration Guide](../technical-overview/integration-guides/openid4vp-vp-verification-integration-guide.md)
* **NPM Package**: Each component is distributed as an independent NPM module

The Inji Verify UI serves as a reference implementation demonstrating how these reusable SDK components can be orchestrated to build a complete verifier application.

## Configurations

### Verification Method Resolution

* `did:web` with proofValue or JWS
* `https://` URL with proofValue or JWS

### QR Code Compatibility

| Feature | Supported Versions |
|---------|-------------------|
| **Scan Feature** | v22 and below (consistent), v23-v27 (variable) |
| **Upload Feature** | v32 and below |

**Camera Requirements:** 12+ megapixels, good lighting, no filters

## Upcoming Features

* OpenID4VP Same-Device Flow with Web Wallets
* Server-Side ECC-R1 Verification
* Ability to verify mDoc and mDL
* Offline Verification SDK
* BLE-based Verifiable Presentation
* BBS+ Support
* Native Android/iOS Apps
* Trust Registry Integration (KERI, DEDI protocols)

## Documentation

* **API Documentation:**
  API endpoints and mock server details are available via Stoplight documentation: [Inji Verify API Documentation](https://mosip.stoplight.io/docs/inji-verify/branches/main/)

* **Product Documentation:**
  * To know more about Inji Verify from a functional and use case perspective, you can refer to our main document: [Overview | Inji](https://docs.inji.io/inji-verify/overview)
  * Inji Verify is part of Inji Stack, to know more about Inji Stack you can refer to our stack document: [Inji | Inji](https://docs.inji.io/)

## Contribution & Community

We welcome contributions from everyone!

* [Check here](https://docs.inji.io/readme/contribution/code-contribution) to learn how you can contribute code to this application.
* If you have any questions or run into issues while trying out the application, feel free to post them in the [MOSIP Community](https://community.mosip.io/) — we'll be happy to help you out.
