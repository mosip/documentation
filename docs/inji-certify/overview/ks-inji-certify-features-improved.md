# Features

## Overview

Inji Certify transforms how organizations issue digital credentials, replacing slow, error-prone manual processes with a modern platform that issues secure, globally-recognized credentials in seconds. Whether you're a government agency managing millions of driver's licenses, a university certifying thousands of graduates, or a healthcare provider issuing vaccination records during a crisis, Inji Certify delivers the speed, security, and flexibility you need.

Organizations using Inji Certify reduce credential issuance time by up to 80%, eliminate infrastructure costs by up to 70%, and achieve instant global interoperability—all while maintaining the highest security standards. Built on W3C Verifiable Credentials and OpenID4VCI, every credential works seamlessly across borders, platforms, and digital wallet ecosystems without additional configuration.

The platform's modular architecture means you don't need to replace your existing systems. Connect to your current identity providers, databases, and registries through simple plugins, issue credentials in any format your users need, and maintain complete control over security and branding—all from a single, unified platform.

## Standards, Specifications and Compliance

Inji Certify adheres to international standards, ensuring your credentials are trusted and accepted by verification systems worldwide.

### Credential Data Models

| Standard | Description |
|----------|-------------|
| **W3C Verifiable Credentials 1.1** | Current international standard for digital credentials |
| **W3C Verifiable Credentials 2.0** | Latest specification with enhanced features |

### Issuance Protocols

| Protocol | Description |
|----------|-------------|
| **OpenID4VCI** | Secure credential delivery directly to digital wallets |
| **OAuth 2.0** | Industry-standard authentication and authorization |

### Credential Formats

| Format | Status | Description |
|--------|--------|-------------|
| **JSON-LD** | Available | Linked Data Proofs for semantic interoperability and government deployments |
| **Signed JWT (JWS)** | Available | Compact format for enterprise environments—60% faster transmission |
| **SD-JWT** | Available | Privacy-first selective disclosure credentials (draft in 0.12.0, full in 0.13.0) |
| **mDoc (ISO 18013-5/7)** | Coming Soon | International standard for mobile documents and offline verification |
| **mDL (ISO 18013-5/7)** | Coming Soon | Mobile driver's license standard for border control and aviation |

### Cryptographic Algorithms

| Algorithm | Use Case |
|-----------|----------|
| **RSA (2048/4096-bit)** | FIPS 140-2 compliance for US government deployments |
| **Ed25519 (2018 & 2020)** | 128-bit security with 10x smaller keys—faster mobile verification |
| **Elliptic Curve (ECC K1 & R1)** | Quantum-resistant compatible, high-performance signing |


## Core Features

### Credential Creation and Issuance

Issue digital credentials that are automatically trusted and accepted worldwide, eliminating interoperability challenges.

- **W3C Verifiable Credentials Compliance**: Full support for versions 1.1 and 2.0 ensures credentials meet current and future international standards
- **OpenID4VCI Integration**: Credentials delivered directly to users' digital wallets in seconds using industry-standard protocols—no manual distribution
- **Global Interoperability**: Issue a credential once and it works instantly across countries, organizations, and wallet applications
- **Future-Proof Architecture**: Automatic compatibility with emerging standards protects against obsolescence

### Multi-Credential Portfolio Management

Consolidate all credential programs into one platform, eliminating complexity and cost of managing separate systems.

- **Unlimited Credential Types**: Issue driver's licenses, certifications, educational credentials, health documents, and permits—all from one unified system
- **Real-World Proven**: Deployed by Transport Authorities (vehicle permits + driver's licenses), Universities (student IDs + degrees + transcripts), and Health Departments (vaccination certificates + practitioner licenses)
- **Zero System Overhead**: Add new credential types without additional servers, infrastructure, or staff training—reducing IT costs by up to 70%
- **Unified User Experience**: Recipients recognize and trust the same issuer across all credential types, reducing help desk calls by up to 60%

### Dynamic Credential Type Expansion

Launch new credential programs in hours instead of months.

- **Instant Response to Change**: Add new credential types within hours when policies change or emergencies arise
- **API-Driven Configuration**: Configure and deploy new credential types programmatically through secure APIs
- **Zero Downtime Deployment**: Launch new programs without interrupting active issuance or requiring maintenance windows
- **Self-Service Empowerment**: Internal teams configure new types independently using [step-by-step guides](https://github.com/mosip/inji-certify/blob/master/docs/Credential-Issuer-Configuration.md#credential-configuration)

### Advanced Cryptographic Signing

Protect every credential with military-grade digital signatures.

- **Algorithm Flexibility**: Choose RSA, Ed25519, or ECC to meet regulatory requirements—FIPS 140-2, eIDAS, or industry mandates
- **Next-Generation Cryptography**: Ed25519/ECC provides 128-bit security with smaller keys for faster mobile verification
- **Regulatory Alignment**: Configure signing algorithms per credential type for different compliance requirements
- **High-Performance Processing**: Sign thousands of credentials per minute on standard hardware
- **Universal Verification**: All signatures instantly verifiable across any compliant wallet or verification system


## Credential Lifecycle and Status Management

### Revocation Mechanism

Instantly invalidate compromised, expired, or fraudulently obtained credentials to maintain trust throughout the credential lifecycle.

**Current Capabilities (JSON-LD Credentials):**

- **Instant Revocation**: Mark credentials as invalid through secure API calls with changes propagating to all verification systems within seconds
- **Real-Time Verification**: Verifiers check credential validity in real-time, preventing acceptance of revoked credentials and reducing fraud by up to 99%
- **Automated List Management**: Platform automatically maintains and publishes up-to-date revocation lists accessible to verifiers worldwide
- **Verifier Discovery**: Automated discovery mechanisms ensure verification systems always access the latest revocation information

Complete workflow details: [Revocation Documentation](https://github.com/mosip/inji-certify/blob/master/docs/VC-Revocation-Support.md)

### Issued Credential Ledger

Maintain comprehensive audit trails and enable rapid credential lookup with an optional internal ledger.

- **Compliance-Driven Recording**: Enable or disable ledger recording based on privacy policies, regulatory requirements, and data retention obligations
- **Instant Retrieval**: Indexed search returns credential information in milliseconds for rapid response to revocation requests or fraud investigations
- **Revocation Integration**: Ledger provides lookup mechanism for identifying credentials requiring invalidation
- **Complete Audit Trail**: Track full lifecycle—who requested, when issued, what data, current status—supporting fraud prevention and compliance reporting
- **Privacy Protection**: Disable ledger entirely if privacy regulations prohibit internal record-keeping

**Important**: Built-in revocation requires an enabled ledger unless you provide an external credential lookup mechanism.


## Credential Branding and Customization

### SVG-Based Credential Rendering

Ensure credentials display with consistent, professional branding across every digital wallet and device.

- **Brand Consistency**: Define logos, colors, layout, and visual identity once—credentials display identically on any device worldwide
- **Device-Perfect Display**: SVG vector format ensures crisp rendering on any screen size without pixelation
- **Universal Wallet Support**: Embedded rendering instructions in credential metadata enable correct display in any standards-compliant wallet
- **Flexible Sharing**: Export credentials to PNG for printing, PDF for email, or other formats for offline use
- **Trust Through Recognition**: Familiar visual branding builds user confidence and reduces verification time

Configure your credential's visual identity: [Rendering Template Guide](https://github.com/mosip/inji-certify/blob/master/docs/Rendering-Template.md)

### Multi-Language Credential Support

Reach diverse populations by issuing credentials in users' preferred languages.

- **Automatic Language Selection**: Configure credential schemas in multiple languages; platform automatically issues in user's selected language
- **Configuration-Based Simplicity**: Define language variants once during credential type configuration—no custom development required
- **User-Driven Personalization**: Users select preferred language during issuance; credentials automatically generated in that language
- **Global Deployment Support**: Issue credentials for diverse populations across multiple countries from a single platform
- **Verification Integrity**: All language variants contain identical verifiable information with the same cryptographic signatures


## Integrations → [Plugin Comparison Guide](https://github.com/mosip/inji-certify/blob/master/docs/VCIssuance-vs-DataProvider.md)

### Plugin Architecture

Connect Inji Certify to existing identity systems, databases, and registries in days instead of months.

#### VC Issuance Plugins

Integrate with trusted identity verification systems:

| Plugin | Purpose |
|--------|---------|
| **MOSIP Identity Plugin** | Government-grade biometric verification and deduplication for national ID programs |
| **Sunbird Plugin** | Education and skills credentialing infrastructure integration |

#### Data Provider Plugins

Automatically populate credentials with current, accurate data:

| Plugin | Purpose |
|--------|---------|
| **Postgres Data Provider** | Connect directly to PostgreSQL databases—reduce manual entry errors by up to 95% |
| **Mock CSV Data Provider** | Test complete workflows with realistic simulated data before production |
| **Mock IDA Plugin** | Create isolated sandbox environments for developer training and demonstrations |

#### Extensibility

- **Custom Plugin Development**: Build plugins for proprietary systems using detailed [development guides](https://github.com/mosip/inji-certify/blob/master/docs/Custom-Plugin-K8s.md)
- **Modular Architecture**: Add, update, or replace plugins without disrupting active credential issuance
- **Rapid Testing**: Built-in mock plugins enable validating workflows before production deployment

### External Authentication Integration

Leverage existing identity and access management investments.

- **Authentication Provider Choice**: Integrate with eSignet, Keycloak, Microsoft Azure AD, or any OAuth 2.0-compliant service
- **Standards-Based Integration**: OAuth 2.0 compliance ensures compatibility with 99% of enterprise identity systems
- **Proven Security**: Rely on battle-tested authentication platforms with MFA, threat detection, and compliance certifications
- **Multi-Tenant Flexibility**: Different issuers can use different authentication providers based on security policies
- **Seamless User Experience**: Users authenticate through familiar systems; Certify issues credentials only after successful verification

### CA-Signed Certificate Support

Integrate your organization's existing Certificate Authority infrastructure.

- **Trust Continuity**: Sign credentials using existing CA-backed certificates, aligning with established institutional trust frameworks
- **Regulatory Compliance**: Meet local PKI regulations and industry standards without restructuring certificate management
- **Audit Simplification**: CA-signed certificates streamline compliance audits and security assessments
- **Secure Operations**: Integrated Key Manager handles cryptographic operations securely—private keys never leave HSM protection

Explore detailed configuration: [PKI Support Guide](https://github.com/mosip/inji-certify/blob/release-0.13.x/docs/PKI-Support-and-Integration-with-SD-JWT-VC.md) | [Key Manager Documentation](../technical-overview/key-manager.md)


## Deployment

### Deployment Options

Inji Certify supports flexible deployment models:

| Mode | Use Case |
|------|----------|
| **Local Development (Docker Compose)** | Quick setup for experimentation and backend exploration |
| **Local Development (Without Docker)** | For developers and contributors debugging the codebase |
| **Kubernetes Cluster** | Production environments at scale |

- **Local Setup Guide**: [Docker Compose Setup](https://github.com/mosip/inji-certify/blob/master/docs/Local-Development.md)
- **Production Deployment**: [Kubernetes Deployment Guide](https://docs.inji.io/readme/setup/deploy#deploying-inji-certify)
- **Custom Plugin Deployment**: [Custom Plugin K8s Guide](https://github.com/mosip/inji-certify/blob/master/docs/Custom-Plugin-K8s.md)

### Enterprise-Grade Security

Built-in security features protect credentials from issuance through verification.

- **End-to-End Encryption**: All credential data encrypted during transmission and at rest
- **OAuth 2.0 Authentication**: Industry-standard authentication with multi-factor authentication and token-based security
- **Configurable Cryptographic Signing**: Every credential digitally signed with your choice of algorithms
- **PKI Integration**: Support for CA-signed certificates with existing certificate infrastructure
- **Comprehensive Audit Logging**: Every issuance, revocation, and configuration change logged with timestamps and user information


## Additional Capabilities

Features that enhance the overall issuance experience:

### Comprehensive Documentation and Support

Accelerate implementation with extensive documentation and reference implementations.

- **Step-by-Step Configuration**: [Credential Configuration Guide](https://github.com/mosip/inji-certify/blob/master/docs/Credential-Issuer-Configuration.md#credential-configuration)
- **Plugin Development**: [Custom Plugin Development Guide](https://github.com/mosip/inji-certify/blob/master/docs/Custom-Plugin-K8s.md)
- **Local Development Setup**: [Development Guide](https://github.com/mosip/inji-certify/blob/master/docs/Local-Development.md)
- **Complete Reference**: [Inji Certify GitHub Repository](https://github.com/mosip/inji-certify/tree/master)


## Getting Started

Transform your credential issuance process in days, not months:

1. **Review Technical Architecture** → [Technical Overview](../technical-overview/key-manager.md)
2. **Configure Your First Credential** → [Credential Configuration Guide](https://github.com/mosip/inji-certify/blob/master/docs/Credential-Issuer-Configuration.md#credential-configuration)
3. **Set Up Integrations** → [Plugin Setup Guide](https://github.com/mosip/inji-certify/blob/master/docs/Local-Development.md)
4. **Test with Mock Data** → Validate workflows using sandbox plugins
5. **Configure Security** → [PKI Integration](https://github.com/mosip/inji-certify/blob/release-0.13.x/docs/PKI-Support-and-Integration-with-SD-JWT-VC.md)
6. **Customize Appearance** → [Rendering Guide](https://github.com/mosip/inji-certify/blob/master/docs/Rendering-Template.md)
7. **Go Live** → Issue credentials with confidence


## Learn More

- **Revocation Workflow**: [Revocation Documentation](https://github.com/mosip/inji-certify/blob/master/docs/VC-Revocation-Support.md)
- **PKI Integration**: [PKI Support Guide](https://github.com/mosip/inji-certify/blob/release-0.13.x/docs/PKI-Support-and-Integration-with-SD-JWT-VC.md)
- **Visual Customization**: [Rendering Template Guide](https://github.com/mosip/inji-certify/blob/master/docs/Rendering-Template.md)
- **Plugin Architecture**: [Plugin Comparison](https://github.com/mosip/inji-certify/blob/master/docs/VCIssuance-vs-DataProvider.md)
- **Custom Development**: [Plugin Development](https://github.com/mosip/inji-certify/blob/master/docs/Custom-Plugin-K8s.md)
- **Security Architecture**: [Key Manager](../technical-overview/key-manager.md)
- **Complete Reference**: [GitHub Repository](https://github.com/mosip/inji-certify/tree/master)
- **Community**: [MOSIP Community Forum](https://community.mosip.io/c/inji/16)




---

Inji Certify 0.14.0: Features to be included

# New Features for Inji Certify (Finetuned from input.md)

## Core Features

### Presentation During Issuance

Strengthen trust and security in credential issuance workflows by requiring presentation of an existing Verifiable Credential as proof before issuing a new credential.

- **Presentation Request**: Request the presentation of an existing VC from the wallet as part of issuing a new credential
- **Internal Presentation Verification**: Submitted VC presentations are verified internally by Inji Certify before triggering issuance
- **Conditional Issuance**: Automatic issuance and delivery of a new VC upon successful verification of the presented credential
- **Trust-Based Workflows**: Enable advanced, trust-first issuance flows for richer and more secure credential ecosystems
- **Standards Compliance**: Enabled using OpenID4VCI and Presentation Exchange standards for maximum interoperability

### QR Code-Based Credential Issuance (Claim 169)

Issue privacy-preserving credentials via standardized QR codes, enabling offline and low-connectivity credential access.

- **Claim 169 QR Generation**: Encode issued VCs into Claim 169–compliant QR codes that adhere to global standards for machine-readable identity
- **CBOR-CWT Encoding**: Support for compact, privacy-preserving CBOR Web Token encoding of credential data
- **Offline Accessibility**: Improve usability in offline or low-connectivity environments through QR code–based delivery
- **Standard-Based Issuance**: Delivery of QR-encoded credentials aligned with interoperable QR specifications
- **Ecosystem Compatibility**: Wallets and verification tools can request and obtain credentials by scanning Claim 169–formatted QR codes

### Pre-Authorized Code Flow

Streamline credential issuance with pre-authorized codes, eliminating re-authentication for trusted workflows.

- **Pre-Authorized Credential Offers**: Generate credential offers containing pre-authorized codes that wallets use to obtain access tokens and request VCs
- **Simplified User Experience**: Users who have already been verified by the issuer receive credentials without re-authenticating during issuance
- **Flexible Delivery Methods**: Support for multiple delivery channels including QR codes and deep links
- **Transaction Code Support**: Optional PIN/transaction code requirement during credential redemption for additional security
- **OpenID4VCI Standards-Based**: Implements the OpenID4VCI pre-authorized code flow for credential offer redemption and issuance


## Standards, Specifications and Compliance

### Issuance Protocols (additions)

| Protocol | Status | Description |
|----------|--------|-------------|
| **Pre-Authorized Code Flow** | Coming Soon (0.14.0) | Streamlined issuance using pre-authorized codes without re-authentication |
| **Presentation During Issuance** | Coming Soon (0.14.0) | Trust-based issuance requiring presentation of existing VC as proof |

### Credential Formats (additions)

| Format | Status | Description |
|--------|--------|-------------|
| **Claim 169 QR Code** | Coming Soon (0.14.0) | Privacy-preserving CBOR-CWT encoded credentials via standardized QR codes |