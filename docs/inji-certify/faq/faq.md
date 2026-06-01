# FAQ

<details>

<summary>Why and what was the segregation of eSignet VCI Component to Inji Certify?</summary>

**Segregation of eSignet VCI Component to Inji Certify**

Inji Certify, a platform for issuing and managing verifiable credentials (VCs), has enhanced its system by segregating the eSignet VCI component. This strategic move optimizes functionality and scalability.

Important Update: Now eSignet VCI is known as Inji Certify Core!

**What was eSignet VCI?**

**eSignet VCI** was a microservice for secure authentication, issuance, and verification of VCs, based on OAuth 2.0 and OpenID Connect protocols. It ensures reliable user authentication and promotes interoperability across systems.

**Reasons for Segregation**

**1. Enhanced Specialization and Focus**

* Separating eSignet VCI allows Inji Certify to focus on credential issuance while eSignet VCI concentrates on secure authentication and verification, improving efficiency.

**2. Improved Scalability**

* Each component can now scale independently based on demand, ensuring the platform handles varying loads effectively.

**4. Streamlined Maintenance and Updates**

* Independent updates and maintenance reduce downtime and allow for quicker deployment of enhancements and security patches.

**5. Facilitating Multi-Tenancy**

* The segregation will support multiple issuers on a single Inji Certify instance, ensuring data integrity and security for each issuer in the upcoming implementation of Inji Certify.

**How the Segregation Works**

* **Modular Structure**: Now eSignet VCI is maintained as a separate module within the Inji Certify which offers an Inji Certify core under the Certify repository, ensuring a clear separation of concerns while maintaining a unified codebase.
* **Enhanced Configuration**: Organizations can now configure Inji Certify core which offers the VC issuances independently to meet specific requirements, allowing for customized solutions.

The segregation of eSignet VCI enhances Inji Certify’s performance and scalability, providing a robust solution for issuing and managing verifiable credentials. This strategic move ensures a more secure and efficient credentialing ecosystem for organizations and users.

</details>
