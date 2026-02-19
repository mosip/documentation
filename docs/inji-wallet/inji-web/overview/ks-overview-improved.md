---
icon: house
---

# Overview

Inji Web enables users to securely download, manage, and share Verifiable Credentials through a standards-compliant web interface. It follows OpenID4VCI (OpenID for VC Issuance) and supports W3C Verifiable Credentials (1.1). Users can download credentials from trusted issuers and share them with verifiers using OpenID4VP-compliant presentation flows.

> **Important!** Before you proceed, you should be aware of OpenID4VC & W3C VC. Please read the following standards:
> - [OpenID4VCI - OpenID for Verifiable Credential Issuance](https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0-ID1.html)
> - [W3C VC - Verifiable Credentials Overview](https://www.w3.org/TR/vc-overview/)

Inji Web is designed for inclusivity, empowering individuals to access benefits and services even without smartphones. It's ideal for communities with limited smartphone access and ensures full interoperability with open digital identity ecosystems.

### Key Capabilities

| Feature | Description |
|---------|-------------|
| **Multiple Credential Formats** | W3C JSON-LD VCs (Data Model 1.1), IETF SD-JWT VCs |
| **Credential Presentation** | OpenID4VP flow for sharing JSON-LD VCs with verifiers |
| **Flexible Authentication** | Login with Google or any OpenID-compliant IdP |
| **Web Wallet Storage** | Store credentials securely in logged-in sessions |
| **PDF Download** | Download credentials as PDFs with embedded QR codes |
| **Guest Mode** | Download credentials without login (no storage) |

To know more about features available in Inji Web, refer to the [Features Documentation](https://docs.mosip.io/inji/inji-web/functional-overview/features).

---

## Architecture

Inji Web features a modular architecture built on React with a Backend for Frontend (BFF) layer. It interacts with credential issuers via OpenID4VCI and supports verification through OpenID4VP.

For a detailed view of Inji Web's architecture and components, check the [Architecture Documentation](https://docs.mosip.io/inji/inji-web/technical-overview/architecture).

### Architecture Components

| Component | Description |
|-----------|-------------|
| **Inji Web Frontend** | React-based portal for credential workflows |
| **Mimoto (BFF)** | Backend for Frontend handling API calls, session management, and orchestration |
| **Inji Certify** | Credential issuer returning signed Verifiable Credentials |
| **Inji Verify** | Validates credential authenticity and integrity |
| **Datashare** | Temporary storage for credentials (guest sessions) |
| **PostgreSQL** | Persistent storage for logged-in users |
| **Redis** | Session management and volatile state data |
| **eSignet** | Authentication layer for authorization and token issuance |

---

## Deployment

Inji Web supports two deployment modes to cater to different users:

### 1. Local Development Setup

Intended for experimentation and user experience:

- **Local Setup with Docker Compose**
  - Recommended for users who want to experience the product from a technical/backend perspective.
  - Refer to the [Local Setup Guide](https://docs.mosip.io/inji/inji-web/build-and-deploy/local-setup) to try this mode.

- **Local Setup without Docker Compose**
  - Recommended for developers or community contributors who want to perform debugging or gain a deeper understanding of the codebase.

### 2. Deployment with Kubernetes Cluster

- Designed for production environments
- Enables hosting and utilization of the product at scale
- Click [here](https://docs.inji.io/readme/setup/deploy#deploying-inji-web) to learn more about this deployment mode

---

## Supported Browsers

Inji Web is compatible with the following browsers:

| Browser | Version |
|---------|---------|
| Google Chrome | 103.0.5060.114 and above |
| Mozilla Firefox | 100.0 and above |
| Microsoft Edge | 104.0.1293.47 and above |
| Mac Safari | 14.1 and above |

---

## Technology Stack

Inji Web is built using modern web technologies:

| Technology | Version | Purpose |
|------------|---------|---------|
| React JS | 18.3.1 | UI component framework |
| TypeScript | 4.9.5 | Strongly typed programming |
| Redux Toolkit | 2.2.3 | Global state management |
| Tailwind CSS | 3.4.3 | Utility-first styling |
| i18next | 23.11.2 | Internationalization |

---

## Upcoming Features

- W3C VC Data Model 2.0 Support
- SVG-based Credential Templates
- Sharing of IETF SD-JWT Selective Disclosure via OpenID4VP
- Presentation During Issuance
- Credential Revocation

---

## Documentation

- **API Documentation**: [Mimoto API Documentation](https://mosip.stoplight.io/docs/mimoto/5bf5a1n68g4tq-mimoto)
- **Product Documentation**:
  - [Inji Web Overview](https://docs.mosip.io/inji/inji-web/overview)
  - [End User Guide](https://docs.mosip.io/inji/inji-web/functional-overview/end-user-guide)
  - [Workflow Documentation](https://docs.mosip.io/inji/inji-web/functional-overview/workflow)

---

## Contribution & Community

We welcome contributions from everyone!

- [Check here](https://docs.inji.io/readme/contribution/code-contribution) to learn how you can contribute code to this application.
- If you have any questions or run into issues, feel free to post them in the [MOSIP Community](https://community.mosip.io/c/inji/16) — we'll be happy to help you out.
- For collaboration or PRs, visit the [GitHub Repository](https://github.com/mosip/inji-web).
