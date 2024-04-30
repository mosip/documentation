# Overview

## **Empowering Users with Verifiable Credentials**

Traditionally, institutes and organizations expend considerable time and effort maintaining user data, yet users often encounter challenges accessing services and benefits requiring information about themselves, their assets, and achievements. Inji Certify addresses this gap by enabling organizations to issue verifiable credentials and empowering users to securely store, share, and manage their data based on open standards and specifications.

Inji Certify empowers organizations to issue verifiable credentials across a wide range of applications. It offers robust capabilities to facilitate this process.

1. **Credential Schema:**
   * Inji Certify offers organizations the flexibility to configure credential schemas for the verifiable credentials (VCs) they issue, ensuring alignment with specific use cases and requirements.
2. **Generation and Signing of VCs:**
   * Organizations can seamlessly generate and digitally sign VCs with their issuer's digital signature, ensuring authenticity and trustworthiness.
3. **User Authentication and Binding:**
   * Inji Certify facilitates user authentication for fetching credentials and ensures the binding of credentials with the user's identity, enhancing security and reliability.
4. **Interoperability:**
   * The generated credential aligns with OpenID specifications, ensuring interoperability with other compliant systems and platforms.
5. **Plugin Support:**&#x20;
   * Enable plugin support for Registry, allowing users to seamlessly integrate custom plugins by following README instructions.
6. **Verifiable Credential Formats Support**:&#x20;
   * Configure the generation of JSON,mdoc, mDL, and SD-JWT to cater to different data format requirements.
7. **Revocation Mechanism:**
   * Implement a credential revocation mechanism, leveraging Sunbird C's system and enhancing it by making revocation lists discoverable through Discovery APIs.

**Integration with Microservices:**

* **eSignet VCI and Sunbird C:**
  * Inji Certify leverages eSignet VCI and Sunbird C, robust microservices dedicated to credentialing. These services enable seamless authentication, issuance, and verification of verifiable credentials.

**Conclusion:**

Inji Certify revolutionizes the way organizations issue and manage verifiable credentials, empowering users with greater control over their data and access to services. With its configurable schema, seamless generation and signing of VCs, and integration with robust microservices, Inji Certify sets a new standard for secure and efficient credentialing. Explore the possibilities with Inji Certify and unlock the potential of verifiable credentials for your organization.

{% hint style="info" %}
Inji Certify uses [**eSignet VCI**](https://docs.esignet.io/integration) and [**Sunbird C**](https://rc.sunbird.org/v/v2.0.0/learn/technical-overview/credentialling)[ ](https://rc.sunbird.org/)(credentialling microservices)
{% endhint %}

&#x20;
