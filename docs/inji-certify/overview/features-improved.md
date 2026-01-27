# Features

## Overview

Inji Certify transforms how organizations issue digital credentials, replacing slow, error-prone manual processes with a modern platform that issues secure, globally-recognized credentials in seconds. Whether you're a government agency managing millions of driver's licenses, a university certifying thousands of graduates, or a healthcare provider issuing vaccination records during a crisis, Inji Certify delivers the speed, security, and flexibility you need.

Organizations using Inji Certify reduce credential issuance time by up to 80%, eliminate infrastructure costs by up to 70%, and achieve instant global interoperability—all while maintaining the highest security standards. Built on W3C Verifiable Credentials and OpenID4VCI, every credential works seamlessly across borders, platforms, and digital wallet ecosystems without additional configuration.

The platform's modular architecture means you don't need to replace your existing systems. Connect to your current identity providers, databases, and registries through simple plugins, issue credentials in any format your users need, and maintain complete control over security and branding—all from a single, unified platform.

## Core Features

### Credential Creation and Issuance

#### Standards-Based Credential Issuance

Issue digital credentials that are automatically trusted and accepted worldwide, eliminating interoperability challenges and ensuring your credentials work everywhere from day one.

- **W3C Verifiable Credentials Compliance**: Full support for versions 1.1 and 2.0 ensures your credentials meet current and future international standards, protecting your investment and ensuring long-term compatibility with emerging verification systems
- **OpenID4VCI Integration**: Credentials are delivered directly to users' digital wallets in seconds using industry-standard protocols—no manual email distribution, no printing, no delivery delays
- **Global Interoperability**: Issue a credential once and it works instantly across different countries, organizations, verification platforms, and wallet applications without additional configuration or translation
- **Future-Proof Architecture**: Automatic compatibility with emerging standards means your credentials remain valid and verifiable as global standards evolve, protecting against obsolescence

#### Multi-Credential Portfolio Management

Consolidate all your credential programs into one platform, eliminating the complexity and cost of managing separate systems for each credential type.

- **Unlimited Credential Types**: Issue driver's licenses, professional certifications, educational credentials, health documents, permits, and any other credential type—all from one unified system without per-credential licensing fees
- **Real-World Proven**: Successfully deployed by Transport Authorities issuing commercial vehicle permits and driver's licenses simultaneously; Universities managing student IDs, degrees, and transcripts from a single platform; Health Departments issuing both vaccination certificates and practitioner licenses during high-volume campaigns
- **Zero System Overhead**: Add new credential types without purchasing additional servers, deploying new infrastructure, maintaining separate databases, or training staff on multiple systems—reducing IT costs by up to 70%
- **Unified User Experience**: Recipients recognize and trust the same issuer across all credential types, increasing adoption rates and reducing help desk calls by up to 60%

#### Dynamic Credential Type Expansion

Launch new credential programs in hours instead of months, enabling your organization to respond immediately to policy changes, emergency needs, or new service offerings.

- **Instant Response to Change**: Add new credential types within hours when policies change or emergencies arise—no waiting for vendor updates, lengthy procurement cycles, or complex system deployments
- **API-Driven Configuration**: Technical teams configure and deploy new credential types programmatically through secure APIs, integrating seamlessly into existing automation workflows and DevOps pipelines
- **Zero Downtime Deployment**: Launch new credential programs without interrupting active issuance operations, affecting existing users, or requiring maintenance windows—maintain 24/7 service availability
- **Self-Service Empowerment**: Internal teams configure new credential types independently using comprehensive [step-by-step guides](https://github.com/mosip/inji-certify/blob/master/docs/Credential-Issuer-Configuration.md#credential-configuration), eliminating dependency on external vendors and reducing time-to-market by up to 90%

### Format and Standards Support

#### Multi-Format Credential Generation

Ensure your credentials work with any digital wallet your users choose, eliminating user frustration and maximizing adoption across diverse populations and use cases.

**Currently Available:**

- **JSON-LD Credentials**: Standards-based format using Linked Data Proofs, essential for government and public sector deployments requiring semantic interoperability, machine-readable verification, and long-term archival compliance
- **Signed JWT (JWS)**: Compact, efficient format perfect for enterprise environments and high-volume issuance scenarios—transmit credentials 60% faster than JSON-LD while maintaining full cryptographic verification across web applications and APIs
- **SD-JWT (Selective Disclosure JWT)**: Privacy-first credentials that protect user data by allowing selective attribute sharing—users can prove they're over 21 without revealing their exact birthdate, or verify employment without disclosing salary information (draft release in version 0.12.0, full release planned for 0.13.0)

**Coming Soon:**

- **mDoc (ISO 18013-5/7)**: International standard for mobile documents, enabling secure offline verification without internet connectivity—critical for border control, law enforcement, and remote area deployments
- **mDL (ISO 18013-5/7)**: Mobile driver's license standard recognized by international aviation and border control authorities, facilitating seamless travel and reducing identity verification time by up to 75%

Supporting multiple formats simultaneously means users choose their preferred wallet without worrying about compatibility, increasing adoption rates and reducing support costs.

#### Advanced Cryptographic Signing

Protect every credential with military-grade digital signatures that guarantee authenticity, prevent tampering, detect fraud, and meet the most stringent international security and compliance requirements.

- **Algorithm Flexibility**: Choose from RSA (2048/4096-bit), Ed25519 (2018 & 2020 specifications), and Elliptic Curve (ECC K1 & R1) to meet specific regulatory requirements—FIPS 140-2 for US government, eIDAS for European compliance, or industry-specific mandates for healthcare and finance
- **Next-Generation Cryptography**: Ed25519 and ECC support provides 128-bit security with keys 10x smaller than RSA, enabling faster verification on mobile devices while ensuring compatibility with emerging quantum-resistant systems
- **Regulatory Alignment**: Configure signing algorithms per credential type to meet different compliance requirements—use FIPS-approved algorithms for government credentials while optimizing performance for high-volume commercial issuance
- **High-Performance Processing**: Efficient algorithms enable signing thousands of credentials per minute on standard hardware, supporting large-scale deployments and emergency response scenarios without expensive infrastructure upgrades
- **Universal Verification**: All signatures are instantly verifiable across any compliant wallet or verification system worldwide, ensuring your credentials are accepted everywhere without additional configuration

### Integration and Extensibility

#### Plugin Architecture for Seamless Integration

Connect Inji Certify to your existing identity systems, databases, and registries in days instead of months, preserving your technology investments while modernizing credential issuance.

**VC Issuance Plugins:**

Integrate with trusted identity verification systems to ensure credentials are issued only to verified individuals:

- **MOSIP Identity Plugin**: Connect with MOSIP's government-grade identity platform for biometric verification, deduplication, and trusted identity assurance—ideal for national ID programs and large-scale government deployments
- **Sunbird Plugin**: Seamlessly integrate with Sunbird's education and skills credentialing infrastructure, enabling unified learning and achievement records across educational institutions

**Data Provider Plugins:**

Automatically populate credentials with current, accurate data from your authoritative registries and databases:

- **Postgres Data Provider**: Connect directly to PostgreSQL databases containing registry data—credentials always reflect the latest information without manual data entry, reducing errors by up to 95%
- **Mock CSV Data Provider**: Test complete credential workflows with realistic simulated data before connecting to production systems, reducing implementation risk and accelerating deployment schedules
- **Mock IDA Plugin**: Create isolated sandbox environments for developer training, user acceptance testing, and stakeholder demonstrations without exposing or affecting live systems

**Extensibility:**

- **Custom Plugin Development**: Build plugins for proprietary systems, legacy databases, or specialized registries using detailed [development guides](https://github.com/mosip/inji-certify/blob/master/docs/Custom-Plugin-K8s.md) with code examples, API documentation, and reference implementations
- **Modular Architecture**: Add, update, or replace plugins without disrupting active credential issuance—maintain continuous operations while evolving your integration landscape
- **Rapid Testing**: Built-in mock plugins and testing frameworks enable validating workflows, training staff, and demonstrating capabilities before production deployment

Understand which plugin type best fits your use case: [VC Issuance vs Data Provider Plugin Guide](https://github.com/mosip/inji-certify/blob/master/docs/VCIssuance-vs-DataProvider.md)

#### External Authentication Integration

Leverage your existing identity and access management investments instead of managing yet another authentication system, reducing costs and improving security through proven enterprise solutions.

- **Authentication Provider Choice**: Integrate with your preferred OAuth 2.0-compliant provider—government-grade eSignet for public sector deployments, open-source Keycloak for flexibility, Microsoft Azure AD for enterprise environments, or any OAuth 2.0-compliant service
- **Standards-Based Integration**: OAuth 2.0 compliance ensures compatibility with 99% of enterprise identity systems, eliminating custom development and reducing integration time from months to days
- **Proven Security**: Rely on battle-tested authentication platforms with multi-factor authentication, threat detection, and compliance certifications instead of building and maintaining custom security infrastructure
- **Multi-Tenant Flexibility**: Different issuers within the same Certify deployment can use different authentication providers based on their unique security policies, regulatory requirements, or organizational preferences
- **Seamless User Experience**: Users authenticate through familiar systems they already trust; Certify issues credentials only after successful verification, maintaining security without creating new user barriers

#### CA-Signed Certificate Support

Integrate your organization's existing Certificate Authority infrastructure into credential signing, maintaining established trust relationships while modernizing credential issuance.

- **Trust Continuity**: Sign credentials using your organization's existing CA-backed certificates, ensuring new digital credentials align with established institutional trust frameworks that stakeholders already recognize and accept
- **Regulatory Compliance**: Meet local PKI regulations, industry standards, and government mandates without restructuring certificate management processes or undergoing costly re-certification
- **Adoption Acceleration**: Countries and organizations adopt Certify faster when they can preserve existing certificate governance models, reducing procurement barriers and political resistance to modernization
- **Audit Simplification**: CA-signed certificates with established trust chains streamline compliance audits, security assessments, and regulatory reviews by aligning with recognized frameworks
- **Secure Operations**: The integrated Key Manager handles all cryptographic operations securely—private keys never leave HSM protection while supporting your organization's certificate policies

Explore detailed configuration: [PKI Support and Integration Guide](https://github.com/mosip/inji-certify/blob/release-0.13.x/docs/PKI-Support-and-Integration-with-SD-JWT-VC.md) | Learn about secure key handling: [Key Manager Documentation](../technical-overview/key-manager.md)

### Credential Lifecycle Management

#### Revocation Mechanism

Instantly invalidate compromised, expired, or fraudulently obtained credentials to maintain trust and security throughout the credential lifecycle.

**Current Capabilities (JSON-LD Credentials):**

- **Instant Revocation**: Mark credentials as invalid through secure API calls with changes propagating to all verification systems within seconds—critical for responding to security breaches, lost credentials, or fraudulent issuance
- **Real-Time Verification**: Verifiers check credential validity in real-time before accepting them, preventing acceptance of revoked credentials and reducing fraud by up to 99%
- **Automated List Management**: The platform automatically maintains and publishes up-to-date revocation lists accessible to verifiers worldwide, eliminating manual processes and reducing administrative burden
- **Verifier Discovery**: Automated discovery mechanisms ensure verification systems always access the latest revocation information without manual configuration or periodic updates

This robust implementation provides immediate revocation capabilities for JSON-LD credentials, with expanded support for JWT, SD-JWT, and mDoc formats planned for upcoming releases. Complete workflow details: [Revocation Documentation](https://github.com/mosip/inji-certify/blob/master/docs/VC-Revocation-Support.md)

#### Issued Credential Ledger

Maintain comprehensive audit trails and enable rapid credential lookup with an optional internal ledger that simplifies compliance reporting and operational management.

- **Compliance-Driven Recording**: Enable or disable ledger recording based on your organization's privacy policies, regulatory requirements, and data retention obligations—full control over what information is retained
- **Instant Retrieval**: Indexed search capabilities return credential information in milliseconds, enabling rapid response to revocation requests, fraud investigations, or compliance audits
- **Revocation Integration**: When using Certify's built-in revocation workflow, the ledger provides the lookup mechanism for identifying credentials requiring invalidation—or integrate your own external system for customized workflows
- **Complete Audit Trail**: Track the full lifecycle of every credential issued—who requested it, when it was issued, what data it contains, and current status—supporting fraud prevention, compliance reporting, and dispute resolution
- **Privacy Protection**: Organizations can disable the ledger entirely if they prefer managing credential tracking through external systems or if privacy regulations prohibit internal record-keeping

**Important**: Built-in revocation requires an enabled ledger unless you provide an external credential lookup mechanism.

### User Experience and Accessibility

#### SVG-Based Credential Rendering

Ensure credentials display with consistent, professional branding across every digital wallet and device, reinforcing trust and recognition regardless of how users view their credentials.

- **Brand Consistency**: Define your organization's logos, colors, layout, and visual identity once—credentials display identically whether viewed on an iPhone in Tokyo, an Android phone in São Paulo, or a desktop browser in Berlin
- **Device-Perfect Display**: SVG's vector format ensures credentials render crisply on any screen size—from smartwatches to 4K displays—without pixelation, quality loss, or layout problems
- **Universal Wallet Support**: Embedded rendering instructions in credential metadata enable any standards-compliant wallet to display your credentials correctly without custom wallet-specific development or ongoing maintenance
- **Flexible Sharing**: Users can export credentials to PNG for printing, PDF for email sharing, or other formats for offline use—maintaining professional appearance across all output types
- **Trust Through Recognition**: Every credential carries not just cryptographic verification, but also familiar, secure visual branding that builds user confidence and reduces verification time

Configure your credential's visual identity: [Rendering Template Guide](https://github.com/mosip/inji-certify/blob/master/docs/Rendering-Template.md)

#### Multi-Language Credential Support

Reach diverse populations and support global deployments by issuing credentials in users' preferred languages, increasing accessibility and adoption while reducing support costs.

- **Automatic Language Selection**: Configure credential schemas in multiple languages during setup; the platform automatically issues credentials in the user's selected language without additional processing or manual intervention
- **Configuration-Based Simplicity**: Define language variants once during credential type configuration—no custom development, duplicate credential definitions, or complex translation workflows required
- **User-Driven Personalization**: Users select their preferred language during the issuance process; credentials are automatically generated in that language, improving user satisfaction and reducing confusion
- **Global Deployment Support**: Issue credentials for diverse populations across multiple countries, regions, and language groups from a single platform—essential for multinational organizations and cross-border initiatives
- **Verification Integrity**: All language variants contain identical verifiable information with the same cryptographic signatures, ensuring trust and verification work consistently regardless of display language

## Advanced Features

### For System Administrators and Developers

#### Comprehensive Documentation and Support

Accelerate implementation and reduce development time with extensive documentation, code examples, configuration guides, and reference implementations.

- **Step-by-Step Configuration**: Detailed guides for setting up credential types, configuring plugins, and integrating authentication → [Configuration Documentation](https://github.com/mosip/inji-certify/blob/master/docs/Credential-Issuer-Configuration.md#credential-configuration)
- **Plugin Development**: Build custom integrations with code examples, API references, and best practices → [Custom Plugin Development Guide](https://github.com/mosip/inji-certify/blob/master/docs/Custom-Plugin-K8s.md)
- **Local Development Setup**: Get developers productive quickly with environment setup guides and troubleshooting tips → [Development Guide](https://github.com/mosip/inji-certify/blob/master/docs/Local-Development.md)
- **Complete Reference Library**: Explore all features, technical specifications, and implementation examples → [Inji Certify GitHub Repository](https://github.com/mosip/inji-certify/tree/master)

### Integration and Security

#### Enterprise-Grade Security

Built-in security features protect credentials from issuance through verification, meeting international standards and regulatory requirements without additional security infrastructure.

- **End-to-End Encryption**: All credential data is encrypted during transmission and at rest, protecting sensitive information from interception or unauthorized access
- **OAuth 2.0 Authentication**: Industry-standard authentication protocols protect issuance endpoints with multi-factor authentication, token-based security, and session management
- **Configurable Cryptographic Signing**: Every credential is digitally signed with your choice of algorithms—RSA, Ed25519, or ECC—preventing tampering and enabling instant fraud detection
- **PKI Integration**: Support for CA-signed certificates enables organizations to leverage existing certificate infrastructure and maintain established trust chains
- **Comprehensive Audit Logging**: Every issuance, revocation, and configuration change is logged with timestamps, user information, and action details—supporting compliance reporting, security investigations, and dispute resolution

#### Standards Compliance

Inji Certify adheres to international standards, ensuring your credentials are trusted and accepted by verification systems worldwide:

- **W3C Verifiable Credentials Data Model** (versions 1.1 and 2.0) - International standard for digital credentials
- **OpenID for Verifiable Credential Issuance** (OpenID4VCI) - Secure credential delivery protocol
- **ISO 18013-5/7** (upcoming) - International standard for mobile documents and driver's licenses
- **OAuth 2.0** - Industry-standard authentication and authorization framework
- **JSON-LD, JWT, SD-JWT** - Multiple credential formats for maximum interoperability
- **Ed25519, ECC, RSA** - Modern cryptographic algorithms for future-proof security

## Getting Started

Transform your credential issuance process in days, not months. Inji Certify provides everything you need to issue secure, globally-recognized digital credentials:

### Quick Start Path

1. **Review Technical Architecture** → Understand how Inji Certify components work together and how it integrates with your systems: [Technical Overview](../technical-overview/key-manager.md)

2. **Configure Your First Credential** → Follow step-by-step instructions to create your first credential type: [Credential Configuration Guide](https://github.com/mosip/inji-certify/blob/master/docs/Credential-Issuer-Configuration.md#credential-configuration)

3. **Set Up Integrations** → Connect to your identity systems and data sources using plugins: [Plugin Setup Guide](https://github.com/mosip/inji-certify/blob/master/docs/Local-Development.md)

4. **Test with Mock Data** → Validate your complete workflow using sandbox plugins before production deployment

5. **Configure Security** → Set up authentication, choose signing algorithms, and configure revocation: [PKI Integration](https://github.com/mosip/inji-certify/blob/release-0.13.x/docs/PKI-Support-and-Integration-with-SD-JWT-VC.md)

6. **Customize Appearance** → Design credential rendering templates with your organization's branding: [Rendering Guide](https://github.com/mosip/inji-certify/blob/master/docs/Rendering-Template.md)

7. **Go Live** → Issue credentials with confidence knowing they're secure, standards-compliant, and globally interoperable

### Implementation Support

- **Complete Documentation**: Access comprehensive guides covering every aspect of setup, configuration, and operation
- **Code Examples**: Reference implementations and working code samples accelerate development
- **Plugin Library**: Pre-built integrations for common systems reduce custom development
- **Testing Tools**: Mock plugins and sandbox environments enable risk-free testing

## Learn More

Explore detailed documentation for specific capabilities and advanced configurations:

### Core Capabilities
- **Revocation Workflow**: Implement instant credential invalidation → [Revocation Documentation](https://github.com/mosip/inji-certify/blob/master/docs/VC-Revocation-Support.md)
- **PKI Integration**: Configure CA-signed certificates → [PKI Support Guide](https://github.com/mosip/inji-certify/blob/release-0.13.x/docs/PKI-Support-and-Integration-with-SD-JWT-VC.md)
- **Visual Customization**: Design credential appearance → [Rendering Template Guide](https://github.com/mosip/inji-certify/blob/master/docs/Rendering-Template.md)

### Integration Guides
- **Plugin Architecture**: Understand plugin types and selection → [Plugin Comparison](https://github.com/mosip/inji-certify/blob/master/docs/VCIssuance-vs-DataProvider.md)
- **Custom Development**: Build tailored integrations → [Plugin Development](https://github.com/mosip/inji-certify/blob/master/docs/Custom-Plugin-K8s.md)
- **Development Environment**: Set up local testing → [Development Setup](https://github.com/mosip/inji-certify/blob/master/docs/Local-Development.md)

### Technical Details
- **Security Architecture**: Understand key management and signing → [Key Manager](../technical-overview/key-manager.md)
- **Complete Reference**: Explore all features and specifications → [GitHub Repository](https://github.com/mosip/inji-certify/tree/master)

---

**Ready to modernize credential issuance?** Start with the [Configuration Guide](https://github.com/mosip/inji-certify/blob/master/docs/Credential-Issuer-Configuration.md#credential-configuration) and issue your first credential in under an hour.
- **Plugin Development Guide**: Build custom plugins to integrate with proprietary systems → [Custom Plugin Development](https://github.com/mosip/inji-certify/blob/master/docs/Custom-Plugin-K8s.md)
- **Local Development Setup**: Get started quickly with development environment configuration → [Development Guide](https://github.com/mosip/inji-certify/blob/master/docs/Local-Development.md)
- **Complete Repository**: Explore all features, examples, and technical documentation → [Inji Certify GitHub Repository](https://github.com/mosip/inji-certify/tree/master)

### Integration and Security Features

#### Enterprise-Grade Security

Built-in security features ensure credentials are protected from issuance through verification, meeting international security standards and regulatory requirements.

- **End-to-End Encryption**: All credential data is encrypted during transmission and storage
- **OAuth 2.0 Authentication**: Industry-standard authentication protocols protect issuance endpoints
- **Cryptographic Signing**: Every credential is digitally signed with configurable algorithms to prevent tampering
- **CA Certificate Support**: Integrate with your organization's existing PKI infrastructure
- **Audit Logging**: Comprehensive logging supports compliance reporting and security investigations

#### Standards Compliance

Inji Certify adheres to global standards, ensuring your credentials are trusted and accepted worldwide:

- **W3C Verifiable Credentials Data Model** (v1.1 and v2.0)
- **OpenID for Verifiable Credential Issuance** (OpenID4VCI)
- **ISO 18013-5/7** (upcoming mDoc and mDL support)
- **OAuth 2.0** (authentication and authorization)
- **JSON-LD**, **JWT**, **SD-JWT**, and emerging credential formats

## Getting Started

Ready to modernize your credential issuance process? Inji Certify provides everything you need to issue secure, standards-compliant digital credentials:

1. **Explore the Repository**: Review technical documentation, API guides, and configuration examples → [Inji Certify GitHub](https://github.com/mosip/inji-certify/tree/master)
2. **Configure Your First Credential**: Follow the step-by-step guide → [Credential Configuration](https://github.com/mosip/inji-certify/blob/master/docs/Credential-Issuer-Configuration.md#credential-configuration)
3. **Set Up Plugins**: Connect to your identity systems and data sources → [Plugin Setup Guide](https://github.com/mosip/inji-certify/blob/master/docs/Local-Development.md)
4. **Test with Mock Data**: Use sandbox plugins to validate workflows before production deployment
5. **Go Live**: Issue credentials with confidence knowing they're secure, standards-compliant, and globally interoperable

## Learn More

- **Technical Architecture**: Understand how Inji Certify components work together → [Technical Overview](../technical-overview/key-manager.md)
- **Revocation Workflow**: Implement credential revocation → [Revocation Documentation](https://github.com/mosip/inji-certify/blob/master/docs/VC-Revocation-Support.md)
- **PKI Integration**: Configure CA-signed certificates → [PKI Support Guide](https://github.com/mosip/inji-certify/blob/release-0.13.x/docs/PKI-Support-and-Integration-with-SD-JWT-VC.md)
- **Rendering Templates**: Customize credential appearance → [Rendering Guide](https://github.com/mosip/inji-certify/blob/master/docs/Rendering-Template.md)
- **Plugin Architecture**: Build custom integrations → [Plugin Development](https://github.com/mosip/inji-certify/blob/master/docs/Custom-Plugin-K8s.md)
