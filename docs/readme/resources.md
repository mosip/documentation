---
icon: book-open
---

# Resources

## Overview

The resources section provides a comprehensive introduction to the **Inji modules** — **Inji Mobile Wallet**, **Inji Web Wallet**, **Inji Verify**, and **Inji Certify**, showcasing how its modules deliver trusted, low-cost, and scalable credential management across sectors.

Each demonstration video explains the product’s purpose, setup, features, and practical applications. Together, they offer an end-to-end understanding of how verifiable credentials can be issued, held, and verified instantly, across both digital and paper-based formats.

### **Video Playlist**

**Watch the complete series on YouTube:** [Inji Stack Demonstration Playlist](https://www.youtube.com/playlist?list=PLJH-POb_55z_kaiEpAzaT_H4hUdGW6QcQ)

### **1. Inji Stack: Overview**

**What you'll learn**:

* An introduction to the **Inji Stack**, the open-source suite by MOSIP for verifiable credentials.
* Explanation of how the core modules like **Inji Certify, Inji Wallet, and Inji Verify** work together to create a trusted digital credential ecosystem.
* Overview of Inji's role in enabling secure, interoperable, and privacy-preserving data exchange.
* Demonstrates the potential of verifiable credentials in sectors like **education, healthcare, governance** and many more.

{% embed url="https://youtu.be/WQI3qan8egY?si=iVbP4xMqW7zbw29L" %}

### **2. Inji Mobile Wallet: Product Overview**

**What you'll learn**:

* Comprehensive walkthrough of the **Inji Mobile Wallet** app.
* Demonstrates secure storage, management, and sharing of verifiable credentials.
* Covers key features:
  * **Selective disclosure** for privacy-preserving data sharing.
  * **Offline verification** via Bluetooth Low Energy (BLE).
  * **OpenID4VP-based interoperability** with verifiers.
  * **Multi-issuer and multi-credential** handling.
  * Highlights use cases in **travel, employment, public service delivery** and many more.

{% embed url="https://youtu.be/hO12UQXtkqI?si=_ULdhdOpP7bcGw3M" %}



### **3. Inji Web Wallet: Product Overview**

**What you'll learn**:

* Introduction to the **Inji Web Wallet**, a browser-based wallet that complements the mobile app.
* Demonstrates credential management and secure sharing using QR codes in both digital and printed form.
* Explains how the web wallet supports **W3C VC**, **OpenID4VP**, and **ISO** standards for global interoperability.
* Showcases accessibility for users without smartphones or in assisted-use environments.

{% embed url="https://youtu.be/hcCn2AGe6AY?si=Ks4XWIIam-BzIWXe" %}



### **4. Inji Web Wallet: Local Setup Guide**

**What you'll learn**:

* Step-by-step guide to setting up the **Inji Web Wallet locally** using **IntelliJ** instead of Docker for faster iteration.
* Walkthrough of dependencies, configuration steps, and environment setup.
* Demonstrates how to load and test credentials within the local environment.

{% embed url="https://youtu.be/QYUI-ovSVX8?si=UGhskY9IxqK-AJX9" %}



### **5. Inji Wallet: Mimoto Setup**

**What you'll learn**:

* Configuration of **Mimoto backend** for Inji Wallet integration using **Docker Compose**.
* This setup provides a **ready-to-run local Docker environment for Mimoto**, which acts as the backend for Inji Web and the BFF (Backend-for-Frontend) for Inji Mobile, enabling secure OIDC-based authentication and credential exchange.
* It helps developers **quickly configure, test, and integrate Mimoto with Inji services** in a non-production environment.

{% embed url="https://youtu.be/yzK6arInf40?si=6dNhYc7QhEi8F0TY" %}

### **6. Inji Verify: Product Overview -- Your Gateway to Trusted Verifiable Credential Verification**

**What you'll learn**:

* Overview of **Inji Verify**, the verifier module for digital and paper-based credential verification.
* Demonstrates secure, instant QR-based verification workflows.
* Highlights modular SDK integration, interoperability with OpenID4VP, and verifier backend service.

{% embed url="https://youtu.be/0mDMG-4anaE?si=wuETz8iV_pDZ9-gt" %}

### **7. Inji Verify: Technical Deep Dive**

**What you'll learn**:

* Detailed explanation of **Inji Verify's architecture**, including backend services, SDKs, and UI components.
* Covers **OpenID4VP flows**, handling of verifiable presentations, and data validation.
* Shows how to run Verify locally using **Docker Compose** and how to integrate SDK components into React-based applications.

{% embed url="https://youtu.be/odf_bo38NKI?si=IkE3_6Cz0P3njBrK" %}

### **8. Inji Certify: Product Overview**

**What you'll learn**:

* Introduction to **Inji Certify**, the credential issuance module of the Inji Stack.
* Demonstrates how authorized entities can issue, manage, and revoke verifiable digital credentials.
* Explains interoperability with **OpenID4VC**, **W3C VC**, and other standards.



{% embed url="https://youtu.be/VdF3UpTb6wY?si=cPorpyKUJ6bvwmqx" %}



### **9. Inji Certify: Local Setup & Deployment using Docker Compose**

**What you'll learn**:

* Step-by-step local deployment of **Inji Certify** using Docker Compose.
* Explains configuration of plug-ins, environment variables, and credential templates.
* Demonstrates issuance and revocation flows in a local testing environment.



{% embed url="https://youtu.be/3jMP-X8PAvM?si=7dgg2-w21vHCOax1" %}



### **10. Inji Certify: Technical Deep Dive -- Verifiable Credential Issuance**

**What you'll learn**:

* In-depth look at **Inji Certify's credential issuance architecture**.
* Explains credential templates, signing algorithms, revocation APIs, and integration with data sources.
* Details plug-in architecture for flexible issuance from multiple registries or databases.



{% embed url="https://youtu.be/r_HnbLYQfVo?si=4ISNQSEHT-LZ2zcC" %}



***

## Inji Ecosystem Workshop

{% hint style="warning" %}
**Note**: The video resources listed below are earlier recordings from webinars held in **2024**. While they are not being archived at this time, they remain available as they provide useful context and practical demonstrations that may still benefit viewers.
{% endhint %}

### 1. Comprehensive demonstration on Digital Identity Management and Credential Integration

{% embed url="https://youtu.be/eyhnGFED-xc?si=Btq6pZgUXO_rEyzQ" %}

The workshop aims to provide a comprehensive understanding of the Inji ecosystem, focusing on its various components, configuration, and practical usage. It covered essential topics to help participants effectively use and integrate Inji's features.

* **Understanding DID Methods**: The workshop explains the different Decentralized Identifier (DID) methods supported by Inji, helping participants grasp how digital identities are managed.
* **OIDC Client and p12 File Creation**: Participants learn how to create an OIDC client and generate a p12 file, ensuring secure key storage and authentication processes.
* **Configuring Mimoto in Inji Web**: Detailed steps are provided to configure Mimoto within the Inji Web application, addressing common issues and ensuring seamless integration.
* **Credential Management**: The workshop covers how credentials are stored, secured, and validated in both **Web** and **Wallets**, emphasizing security and compliance with standards.
* **Real-World Deployment and Integration**: It discusses the roles of issuers and service providers in real-world deployments, the use of blockchain for security, and the potential for running AI agents for selective disclosure.

### 2. Inji Certify Credential Issuance Workshop <a href="#inji-certify-credential-issuance-workshop" id="inji-certify-credential-issuance-workshop"></a>

{% embed url="https://youtu.be/cmF8e36P3GM?si=8yGY8qGD0Tb9qpIy" %}

The Workshop demonstrates how to integrate Inji Certify, a credential issuance platform, with a custom data provider plugin to issue 'Verifiable Credentials'. The specific use case covered is issuing farmer IDs based on official land registry data.

* **Data Setup**: A sample farmer registry is created in a database with details like National ID, Name, Phone Number, and Land Ownership Information.
* **Configuration**: A velocity template is defined to format the data, issuer information and verification keys are configured, and a "well-known" property is set up.
* **Plugin Development**: A data provider plugin is created to fetch farmer data from the registry based on the national ID.
* **Docker Compose Setup**: A Docker environment is set up to run the database, Inji Certify, Nginx, and Inji Web.
* **Demonstration**: A farmer ID is entered, authenticated, and a verifiable credential is issued based on the retrieved data.

### 3. Inji A Technical Deep Dive

{% embed url="https://youtu.be/yrnJT_EB-sA?si=Aj_xVHiN-cGhMFnq" %}

The webinar delves into the technical architecture and implementation details of the Inji Stack, specifically focusing on the Inji Wallet and its integration with other stacks/components like eSignet and Inji Certify. The webinar offers a comprehensive overview of the technical intricacies involved in building a decentralized credential issuance and verification system using the MOSIP's Inji platform.

* **Inji Wallet:** A mobile application that acts as both a digital wallet for storing verifiable credentials (VCs) and a verifier of VCs.
* **Integration with eSignet and Inji Certify:** eSignat is used for authentication and authorization, while Inji Certify is responsible for issuing VCs.
* **Technical Architecture:** The webinar covers the high-level architecture, including the use of Mimoto as a backend for frontend (BFF), the role of the Tuvali library for secure VC transfer, and the integration of native modules for specific functionalities.
* **API Interactions:** The session explains how Inji Wallet interacts with various APIs, including those for fetching issuer lists, obtaining access tokens, and binding wallets to relying parties.
* **Configuration:** The webinar discusses the configuration aspects, such as setting up issuer information, defining VC templates, and configuring the connection to eSignet.
* **Development and Integration:** The presentation provides insights into the development process, including the use of React Native for the mobile app, the integration of native modules, and the management of data storage.

### 4. Unlocking the Value of Integrations with Inji and eSignet

{% embed url="https://youtu.be/DSQmHKnVQsE?si=AgiahlTfsd5BDlbk" %}

The webinar delves into MOSIP's solutions for identity verification and credential management also to see how national IDs empower citizens in the digital age.

* **National ID as an Enabler**: Learn how national IDs can be used to access various services.
* **Digital Transformation**: Explore how IDs can streamline processes for citizens and governments.
* **eSignet**: An online authentication solution supporting multiple methods like OTP, digital wallets, and biometrics.
* **Inji**: A platform for managing the lifecycle of verifiable credentials.
* **Real-World Impact**: Understand how eSignet and Inji provide secure and efficient digital experiences.
