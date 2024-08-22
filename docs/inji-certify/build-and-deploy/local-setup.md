# Local Setup

**Inji Certify** is a robust platform that enables issuers to connect with an existing Credential Registry to issue verifiable credentials. Issuers can configure credential schemas for various types of certificates they wish to issue. Certificates are generated in JSON-LD format as per the W3C Verifiable Credentials (VC) v1.1 standard.

This guide is designed to help developers set up **Inji Certify** in their local environment, providing detailed instructions to replicate the platform's functionality for development or testing purposes.

#### **1. Getting Started**

To begin, visit the **Inji Certify** repository on GitHub:

* **Repository Link**: [**Inji Certify Repository**](https://github.com/mosip/inji-certify/tree/v0.9.0)

The repository contains all the necessary files and instructions to set up Inji Certify on your local machine.

#### **2. Prerequisites**

Before proceeding with the installation, ensure you have the following installed:

* Docker (26.0.0)
* Docker Compose (2.25)
* [**Git bash**](https://gitforwindows.org/) shell to run the scripts, if on _Windows_
* [**GNU sed**](https://formulae.brew.sh/formula/gnu-sed) installed, if on _Mac_
* A URL to host your DID for verifying VCs(Verifiable Credentials) can use [**GitHub pages**](https://docs.github.com/en/pages/quickstart) here or any other self-hosted server which is highly available for use by verifiers.

Please visit the [**Pre-requisites**](https://github.com/mosip/inji-certify/tree/v0.9.0?tab=readme-ov-file#pre-requisites) section in the ReadME file to explore in detail.

#### **3. Installation and Setup**

The setup involves deploying [**Inji Certify**](https://github.com/mosip/inji-certify/tree/v0.9.0) using Docker Compose. Follow the steps given in the [**README file**](https://github.com/mosip/inji-certify/tree/v0.9.0?tab=readme-ov-file#inji-certify) within the Inji Certify repository.

#### **4. Explore Inji Certify**

Once the setup is complete, you can start exploring the functionality of **Inji Certify**:

* **Configure Credential Schemas**: Set up schemas for various types of certificates you wish to issue.
* **Interact with the System**: Test the issuance and management of credentials through our reference platform Inji Web. Please click [**here**](https://github.com/mosip/inji-certify/tree/v0.9.0) to explore the steps!

For additional configuration and usage instructions, consult the documentation included in the repository.

#### **5. Explore the APIs**

To explore all the available APIs of **Inji Certify**, refer to the [**API documentation**](https://mosip.stoplight.io/docs/inji-certify/25f435617408e-inji-certify) provided within the platform. This will allow you to interact with the various endpoints and understand their functionality in detail.

#### **6. Additional Resources**

For further insights and guidance on using **Inji Certify** effectively, refer to the following:

* **Comprehensive Documentation**: Available within the repository’s [**README**](https://github.com/mosip/inji-certify/tree/v0.9.0?tab=readme-ov-file) file.
* **Support**: Engage with the developer [**MOSIP community**](http://community.mosip.io) or seek support for any issues encountered during the setup.
