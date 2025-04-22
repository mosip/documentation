# Functional Overview

## How does Inji Certify work?

1. **Database Integration**: Inji Certify enables issuers to connect with existing databases to issue VCs. It assumes the source database has a primary key for each data record and information required to authenticate a user (e.g., phone, email, or other personal information).
2. **Credential Schema Configuration**: Issuers can configure their credential schemas for various types of certificates they wish to issue, ensuring alignment with W3C VC v1.1 standards.
3. **VC Issuance**: Authorized methods return VCs of an individual in linked data-proof (JSON-LD) and JWT formats.

## Verifiable Credentials Issuance Through Inji Certify

### Overview

Verifiable Credentials (VCs) are digital representations of physical credentials such as passports and licenses. These credentials are cryptographically signed, ensuring tamper resistance and immediate verifiability. VCs empower users by allowing them to store credentials in digital wallets and seamlessly access various services.

### Inji Certify for VC Issuance

Inji Certify is a powerful and versatile platform designed for seamless issuance of Verifiable Credentials (VCs). It leverages a robust architecture that integrates with existing credential registries, enabling organizations to efficiently and securely issue standards-compliant VCs.

Key features of Inji Certify for VC Issuance include:

* **Seamless Integration:** Replaces the earlier reliance on eSignet with a seamless integration of the Sunbird RC plugin, streamlining the credential issuance process.
* **Flexible Schema Definition:** Allows issuers to easily define and customize credential schemas for various credential types, ensuring compliance with W3C VC v1.1 standards and facilitating interoperability.
* **Efficient Issuance:** Enables the efficient issuance of VCs in the industry-standard JSON-LD format.
* **Enhanced Security:** Incorporates robust security measures to protect the integrity and confidentiality of issued credentials.

### Plugin Integration

Inji Certify supports a flexible plugin architecture that allows for seamless integration with various external systems and data sources. This plugin architecture enhances the platform's adaptability and allows for customization to meet diverse credentialing needs.

The plugins are categorized into two main types:

#### VC Issuance Plugins:

* **Role:** VC Issuance Plugins are responsible for the core process of generating and issuing Verifiable Credentials (VCs).
* **Functionality:**
  * These plugins typically interact with external identity or authentication systems (e.g., identity providers, registries) to obtain necessary information about the credential recipient (e.g., name, date of birth, unique identifiers).
  * They then utilize this information to generate the VC in the appropriate format (e.g., JSON-LD) according to the defined credential schema.
  * Finally, the plugin issues the generated VC to the recipient.
* **Examples:**
  * **Mock Certify Plugin:** This plugin simulates a real-world scenario by interacting with the **Mosip Mock Identity System**. It retrieves sample identity data from the mock system and subsequently generates and issues VCs based on this data. This plugin is valuable for testing and development purposes.
  * **MOSIP IDA Certify Plugin:** This plugin integrates with the **Mosip National ID System**, a real-world identity platform. It retrieves verified identity information from the Mosip National ID System and utilizes this data to generate and issue VCs.
  * **Sunbird RC Certify Plugin:** This plugin interacts with the **Sunbird RC registry**, a platform for managing learning resources and learner data. It retrieves relevant data from the Sunbird RC registry, such as academic records and certifications, and generates and issues VCs based on this retrieved information.

#### Data Provider Plugins

* **Role:** Data Provider Plugins are responsible for fetching relevant data from external sources or registries.
* **Functionality:**
  * These plugins connect to external data sources (e.g., databases, APIs, registries) and retrieve the necessary information about the credential recipient or the credential itself.
  * The retrieved data is then provided to a VC Issuance Plugin for further processing, including VC generation and issuance.
* **Examples:**
  * **Mock CSV Data Provider Plugin:** This plugin retrieves data from a **CSV file** that acts as a sample data source or a simplified registry. It extracts relevant information from the CSV file and provides it to a connected VC Issuance Plugin. This plugin is useful for testing and development purposes, allowing for easy simulation of data from various sources.
  * **Postgres Data Provider Plugin:** This plugin connects to a **PostgreSQL database** that acts as a data repository. It retrieves relevant data (e.g., user profiles, academic records) from the specified tables within the PostgreSQL database and provides this data to a connected VC Issuance Plugin for further processing.

#### Authentication and Credential Transfer

Inji Certify employs OpenID4VCI, an extension of the OAuth 2.0 protocol, for secure and interoperable credential issuance. This mechanism ensures:

1. **Standards-Based Interaction**: Establishes compatibility with various digital wallet providers.
2. **Reliable User Authentication**: Authenticates individuals before issuing credentials.
3. **Wallet-Initiated Flow**: Supports a streamlined flow where VCs are delivered just in time upon request from the user’s wallet.

## **Segregation of eSignet VCI Component to Inji Certify**

Inji Certify, a platform for issuing and managing verifiable credentials (VCs), has enhanced its system by segregating the **eSignet VCI component**. This strategic move optimizes functionality and scalability.

{% hint style="info" %}
**Important Update: Now eSignet VCI is known as Inji Certify Core!**
{% endhint %}
