# Overview

## **Empowering Users with Verifiable Credentials**

## **Introduction** <a href="#introduction" id="introduction"></a>

Traditionally, institutes and organizations expend considerable time and effort maintaining user data, yet users often encounter challenges accessing services and benefits requiring information about themselves, their assets, and achievements. Inji Certify addresses this gap by enabling organizations to issue verifiable credentials and empowering users to securely store, share, and manage their data based on open standards and specifications.

### **Key Features of Inji Certify**

#### **Generation and Signing of Verifiable Credentials**

* Organizations can seamlessly generate VCs and digitally sign them with their issuer's digital signature. This process ensures the authenticity and trustworthiness of the credentials, making them tamper-resistant and instantly verifiable.

#### **Interoperability**

* The generated credentials align with OpenID specifications, ensuring interoperability with other compliant systems and platforms. This allows for a seamless integration into existing ecosystems, promoting broader adoption and usage of VCs.

#### **Plugin Support**

* Inji Certify enables plugin support for the Registry, allowing users to integrate custom plugins easily by following the provided **README** instructions in the Inji Certify Repository. This feature enhances the platform's flexibility and adaptability to various organizational needs.
  * **Current Plugin Support:**
    * Sunbird Plugin
    * Mock IDA Plugin
    * MOSIP Identity Plugin

#### **Verifiable Credential Formats Support**

* Inji Certify supports multiple credential formats, including JSON, and SD-JWT. This versatility caters to different data format requirements, ensuring compatibility with various applications and systems.
  * Future Support
    * mDoc
    * mDL

#### **Revocation Mechanism**

* Inji Certify includes a revocation mechanism to ensure the integrity and trustworthiness of issued verifiable credentials (VCs):
  * **Revocation Mechanism**: Allows issuers to invalidate credentials that are no longer valid due to expiration, fraud, or changes in status.
  * **Revocation List**: Maintains a registry of revoked credentials.
  * **API Interfaces**: Provides Revocation API for issuers to revoke credentials and Verification API for third parties to check credential status.
  * **Discovery API**: Enables discovery of the revocation list to ensure verifications are based on the latest information.

#### **Multi-Tenancy Model**

* Multiple issuers can be onboarded on a single instance of Inji Certify, allowing diverse data providers to manage and issue credentials within the same platform while ensuring data security and integrity.

### **How Inji Certify Works**

1. **Database Integration**: Inji Certify enables issuers to connect with existing databases to issue VCs. It assumes the source database has a primary key for each data record and information required to authenticate a user (e.g., phone, email, or other personal information).
2. **Credential Schema Configuration**: Issuers can configure their credential schemas for various types of certificates they wish to issue, ensuring alignment with W3C VC v1.1 standards.
3. **VC Issuance**: Authorized methods return VCs of an individual in linked data-proof (JSON-LD) and JWT formats.

### **Segregation of eSignet VCI Component to Inji Certify**

Inji Certify, a platform for issuing and managing verifiable credentials (VCs), has enhanced its system by segregating the [**eSignet VCI component**](https://docs.esignet.io/overview/features#verifiable-credentials-issuance). This strategic move optimizes functionality and scalability.

{% hint style="info" %}
**Important Update: Now eSignet VCI is known as Inji Certify Core!**
{% endhint %}

### **What was eSignet VCI?**

[**eSignet VCI** ](https://docs.esignet.io/overview/features#verifiable-credentials-issuance)is a microservice for secure authentication, issuance, and verification of VCs, based on OAuth 2.0 and OpenID Connect protocols. It ensures reliable user authentication and promotes interoperability across systems.

#### **Reasons for Segregation**

**1. Enhanced Specialization and Focus**

* Separating eSignet VCI allows Inji Certify to focus on credential issuance while eSignet VCI concentrates on secure authentication and verification, improving efficiency.

**2. Improved Scalability**

* Each component can now scale independently based on demand, ensuring the platform handles varying loads effectively.

**4. Streamlined Maintenance and Updates**

* Independent updates and maintenance reduce downtime and allow for quicker deployment of enhancements and security patches.

**5. Facilitating Multi-Tenancy**

* The segregation will support multiple issuers on a single Inji Certify instance, ensuring data integrity and security for each issuer in the upcoming implementation of Inji Certify.

#### **How the Segregation Works**

* **Modular Structure**: Now eSignet VCI is maintained as a separate module within the Inji Certify which offers an Inji Certify core under the Certify repository, ensuring a clear separation of concerns while maintaining a unified codebase.
* **Enhanced Configuration**: Organizations can now configure Inji Certify core which offers the VC issuances independently to meet specific requirements, allowing for customized solutions.

The segregation of eSignet VCI enhances Inji Certify’s performance and scalability, providing a robust solution for issuing and managing verifiable credentials. This strategic move ensures a more secure and efficient credentialing ecosystem for organizations and users.

### **Conclusion**

Inji Certify revolutionizes how organizations issue and manage verifiable credentials, empowering users with greater control over their data and access to services. With its configurable schema, seamless generation and signing of VCs, and integration with robust microservices, Inji Certify sets a new standard for secure and efficient credentialing. Explore the possibilities with Inji Certify and unlock the potential of verifiable credentials for your organization.
