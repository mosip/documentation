## Overview

Inji Verify enables verifiers to validate Verifiable Credentials encoded in QR codes through an intuitive web portal and embeddable SDK components. It follows the standards of OpenID4VP and W3C Verifiable Credentials Data Model (1.1 & 2.0). Verifiers can scan, upload, or receive credentials via secure online sharing to instantly authenticate identity documents, certificates, and digital credentials across industries.

> ❗ **Important!** Before you proceed, you should be aware of the relevant standards. Please read the following before proceeding:
>
>   * [OpenID4VP - OpenID for Verifiable Presentations 1.0](https://openid.net/specs/openid-4-verifiable-presentations-1_0.html)
>   * [W3C VC - Verifiable Credentials Data Model](https://www.w3.org/TR/vc-data-model/)

In particular, Inji Verify focuses on the verifier's role and provides the following features:

| Feature                                                                 | Coverage |
|:------------------------------------------------------------------------|:---------|
| QR Code Scanning (camera-based)                                         | ✅        |
| QR Code Upload (file-based)                                             | ✅        |
| OpenID4VP Verifiable Presentation (Cross-Device & Same-Device)          | ✅        |
| Support for JSON-LD VC Format                                           | ✅        |
| Support for SD-JWT VC Format                                            | ✅        |
| Revocation Status Verification                                          | ✅        |
| Multi-lingual Credential Display                                        | ✅        |
| SVG Rendering Support                                                   | ✅        |
| MOSIP UIN VC Verification                                               | ✅        |
| Embeddable SDK Components                                               | ✅        |
| Offline Verification via BLE                                            | ❌        |

To know more about features available in Inji Verify, please refer to [this documentation](https://docs.inji.io/inji-verify/functional-overview/functional-overview).

## Try It Out
[**Inji Verify Collab Guide**](/docs/inji-verify/functional-overview/releases-1/inji-verify-collab-guide.md) helps you with exploring Inji Verify in our [Sandbox Collab Environment](https://collab.mosip.net/).

## Architecture

Inji Verify features a modular architecture with a React-based frontend and a Java Spring Boot backend. It interacts with digital wallets and credential holders via QR codes and OpenID4VP protocols for secure credential presentation and verification.

**Key Technical Components:**

- **Inji Verify UI**: React-based web portal serving as the primary interface for QR code scanning, uploading, and verification results display
- **Inji Verify Backend**: Java Spring Boot service handling VC verification, OpenID4VP flows, and cryptographic validation
- **PixelPass Library**: Decodes CBOR-encoded and standard QR codes for credential extraction
- **VC Verifier Library**: Validates credentials using Ed25519 and RSA cryptographic standards
- **PostgreSQL Database**: Stores OpenID4VP transaction data, presentation definitions, and VP tokens

For a detailed view of Inji Verify's architecture and components, check this [link](https://docs.inji.io/inji-verify/technical-overview/components).

## SDK Integration

Inji Verify provides an **SDK-first architecture** that enables verifier applications to embed credential verification capabilities directly, without deploying the full Inji Verify application.

### SDK Components

* **OpenID4VP VP Verification Component**
  Enables cross-device and same-device Verifiable Presentation verification flows using OpenID4VP standards.
* **Scan/Upload Component** *(Coming Soon)*
  Embeddable QR code scanning and upload functionality for direct integration into verifier applications.

### How to Use the SDK

* **[OpenID4VP Integration Guide](https://docs.inji.io/inji-verify/technical-overview/integration-guides/openid4vp-vp-verification-integration-guide)** – Step-by-step guide covering installation, setup, and usage
* **[SDK Documentation](https://github.com/mosip/inji-verify/blob/release-0.14.x/inji-verify-sdk/Readme.md)** – Technical reference for SDK components and APIs

The Inji Verify UI serves as a reference implementation demonstrating how these SDK components can be orchestrated into a complete verifier application.

## Deployment

Inji Verify supports two modes of deployment to cater to different users with different purposes:

1.  **Local Development Setup**

    * Intended for experimentation and development. Local Setup can be carried out in two ways:
        * **Developer Setup with Docker Compose**
            * Recommended for developers who want full-featured access for development and testing.
            * Refer to [this guide](https://github.com/mosip/inji-verify/blob/release-0.11.x/README.md#developer-setup) to try this mode of setup.
        * **Demo Setup with Docker Compose**
            * Recommended for showcasing specific use cases with simplified configuration.
            * Refer to [this guide](https://github.com/mosip/inji-verify/blob/release-0.11.x/README.md#demo-setup) to try this mode of setup.
    * This is for developers, community members, and country representatives to explore the application, demonstrate its usage to external stakeholders, or conduct proof-of-concepts (POCs).

2.  **Deployment with Kubernetes cluster**

    * Designed for production environments.
    * Enables organizations to host and utilize the verification platform at scale.
    * Click [here](https://docs.inji.io/readme/setup/deploy#deploying-inji-verify) to learn more about this mode of deployment.

## Configurations

In this section, you will find the key configurations required to enable specific features or to run the application.

### Environment Configuration

For local development and Docker Compose deployments, configure the following environment variables:

```properties
# Backend Configuration
SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/inji_verify
SPRING_DATASOURCE_USERNAME=postgres
SPRING_DATASOURCE_PASSWORD=your_password

# Frontend Configuration
REACT_APP_BACKEND_URL=http://localhost:8080
```

**Note**: Ensure PostgreSQL is running before starting the backend service.

To know more about configuration options, please refer to [this link](https://github.com/mosip/inji-verify/blob/release-0.12.x/README.md).

### QR Code Compatibility

Configure scanning parameters based on your use case:

| Feature | Supported Versions |
|:--------|:-------------------|
| QR Code Scanning | v22 and below (consistent), v23-v27 (variable) |
| QR Code Upload | v32 and below |
| Camera Resolution | 12+ megapixels recommended |

## Databases

Inji Verify uses PostgreSQL for persistent storage of OpenID4VP transaction data, presentation definitions, and VP tokens. Refer to the [repository documentation](https://github.com/mosip/inji-verify) for database setup scripts.

## Upgrades

### Upgrade from 0.15.x to 0.16.0

Please refer to the [release notes](https://docs.inji.io/inji-verify/releases/version-0.16.0) for upgrade considerations and new features in version 0.16.0.

## Upcoming Features

* Offline Verification using BLE Technology
* Scan/Upload SDK Component for direct embedding
* Enhanced tablet responsiveness
* CBOR encoding capability in PixelPass library

**Note**: Offline BLE verification will enable credential validation without internet connectivity, adhering to OpenID standards for network-constrained environments.

## Documentation

* **API Documentation:**
  API endpoints and server details are available via Stoplight documentation: [Inji Verify API Documentation](https://mosip.stoplight.io/docs/inji-verify/branches/main/).

* **Product Documentation:**

    * To know more about Inji Verify from a functional and use case perspective, you can refer to our main document: [Overview | Inji Verify](https://docs.inji.io/inji-verify/overview)
    * Inji Verify is part of Inji Stack, to know more about Inji Stack you can refer to our stack document: [Inji | Inji](https://docs.inji.io/)

## Contribution & Community

We welcome contributions from everyone!

* [Check here](https://docs.inji.io/readme/contribution/code-contribution) to learn how you can contribute code to this application.
* If you have any questions or run into issues while trying out the application, feel free to post them in the [MOSIP Community](https://community.mosip.io/) — we'll be happy to help you out.
