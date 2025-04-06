# Features

Currently, Inji Certify offers the following features:

#### **Key Features**

**Credential Issuance**

* **Verifiable Credential Issuance**: Enables issuers to seamlessly issue verifiable credentials using the Inji Certify core component (This eSignet VCI segregated to Inji Certify)
* **Integration Capabilities**: Supports integration with:
  * MOSIP Identity Plugin for identity verification.
  * Sunbird Plugin for seamless integration with Sunbird services.
  * Mock IDA Plugin for testing and development purposes.
  * **Data Provider Plugins:** These plugins fetch relevant data from external sources or registries to generate and issue the corresponding VCs.
    * Mock CSV Data Provider Plugin
    * Postgres Data Provider Plugin
* **Multiple Credential Schemas**: Allows configuration of multiple credential schemas for various certificate types.
* **JSON-LD Format**: Generates certificates compliant with W3C VC v1.1 standards in JSON-LD format, ensuring interoperability and compatibility.

Users can easily integrate custom plugins into the Inji Certify Registry, This plugin architecture allows for seamless integration with various external systems and data sources, making Inji Certify a highly adaptable and customizable solution for diverse credentialing needs.

**Ease of Installation**

* **Streamlined Setup**: Simplifies installation with a single shell startup script connecting Docker-compose scripts.
* **Helm Support**: Provides Helm support for deployment flexibility.
* **User-Friendly**: Emphasizes ease of use, reducing complexity and deployment time.

Inji Certify streamlines the issuance of verifiable credentials with robust integration capabilities and a straightforward installation process. It supports multiple credential schemas and ensures compliance with industry standards, making it a versatile solution for organizations needing secure and efficient credential management.\
\
**Check** [**Inji Certify Repository**](https://github.com/mosip/inji-certify/tree/v0.9.0) **to explore these above features!**
