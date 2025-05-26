---
icon: book-open
---

# Resources

## Inji Ecosystem Workshop

### Comprehensive demonstration on Digital Identity Management and Credential Integration

{% embed url="https://youtu.be/eyhnGFED-xc?si=Btq6pZgUXO_rEyzQ" %}

The workshop aims to provide a comprehensive understanding of the Inji ecosystem, focusing on its various components, configuration, and practical usage. It covered essential topics to help participants effectively use and integrate Inji's features.

* **Understanding DID Methods**: The workshop explains the different Decentralized Identifier (DID) methods supported by Inji, helping participants grasp how digital identities are managed.
* **OIDC Client and p12 File Creation**: Participants learn how to create an OIDC client and generate a p12 file, ensuring secure key storage and authentication processes.
* **Configuring Mimoto in Inji Web**: Detailed steps are provided to configure Mimoto within the Inji Web application, addressing common issues and ensuring seamless integration.
* **Credential Management**: The workshop covers how credentials are stored, secured, and validated in both **Web** and **Wallets**, emphasizing security and compliance with standards.
* **Real-World Deployment and Integration**: It discusses the roles of issuers and service providers in real-world deployments, the use of blockchain for security, and the potential for running AI agents for selective disclosure.

## Inji Certify Credential Issuance Workshop <a href="#inji-certify-credential-issuance-workshop" id="inji-certify-credential-issuance-workshop"></a>

{% embed url="https://youtu.be/cmF8e36P3GM?si=8yGY8qGD0Tb9qpIy" %}

The Workshop demonstrates how to integrate Inji Certify, a credential issuance platform, with a custom data provider plugin to issue 'Verifiable Credentials'. The specific use case covered is issuing farmer IDs based on official land registry data.

* **Data Setup**: A sample farmer registry is created in a database with details like National ID, Name, Phone Number, and Land Ownership Information.
* **Configuration**: A velocity template is defined to format the data, issuer information and verification keys are configured, and a "well-known" property is set up.
* **Plugin Development**: A data provider plugin is created to fetch farmer data from the registry based on the national ID.
* **Docker Compose Setup**: A Docker environment is set up to run the database, Inji Certify, Nginx, and Inji Web.
* **Demonstration**: A farmer ID is entered, authenticated, and a verifiable credential is issued based on the retrieved data.

## Inji A Technical Deep Dive

{% embed url="https://youtu.be/yrnJT_EB-sA?si=Aj_xVHiN-cGhMFnq" %}

The webinar delves into the technical architecture and implementation details of the Inji Stack, specifically focusing on the Inji Wallet and its integration with other stacks/components like eSignet and Inji Certify. The webinar offers a comprehensive overview of the technical intricacies involved in building a decentralized credential issuance and verification system using the MOSIP's Inji platform.

* **Inji Wallet:** A mobile application that acts as both a digital wallet for storing verifiable credentials (VCs) and a verifier of VCs.
* **Integration with eSignet and Inji Certify:** eSignat is used for authentication and authorization, while Inji Certify is responsible for issuing VCs.
* **Technical Architecture:** The webinar covers the high-level architecture, including the use of Mimoto as a backend for frontend (BFF), the role of the Tuvali library for secure VC transfer, and the integration of native modules for specific functionalities.
* **API Interactions:** The session explains how Inji Wallet interacts with various APIs, including those for fetching issuer lists, obtaining access tokens, and binding wallets to relying parties.
* **Configuration:** The webinar discusses the configuration aspects, such as setting up issuer information, defining VC templates, and configuring the connection to eSignet.
* **Development and Integration:** The presentation provides insights into the development process, including the use of React Native for the mobile app, the integration of native modules, and the management of data storage.

## Unlocking the Value of Integrations with Inji and eSignet

{% embed url="https://youtu.be/DSQmHKnVQsE?si=AgiahlTfsd5BDlbk" %}

The webinar delves into MOSIP's solutions for identity verification and credential management also to see how national IDs empower citizens in the digital age.

* **National ID as an Enabler**: Learn how national IDs can be used to access various services.
* **Digital Transformation**: Explore how IDs can streamline processes for citizens and governments.
* **eSignet**: An online authentication solution supporting multiple methods like OTP, digital wallets, and biometrics.
* **Inji**: A platform for managing the lifecycle of verifiable credentials.
* **Real-World Impact**: Understand how eSignet and Inji provide secure and efficient digital experiences.
