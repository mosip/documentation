---
icon: house
---

# Overview

Inji Certify enables issuers to generate, sign and issue a verifiable credentials. It follows the standard of OpenID4VCI (Open ID For VC Issuance) draft 13. It also issues VC complaints with W3C Verifiable Credentials (1.1 & 2.0). Issuers can configure credential schemas for different certificate types, generating credentials in different VC formats such JSON-LD, SD-JWT etc.

Traditionally, institutes and organizations spend considerable time and effort maintaining user data, yet users often encounter challenges accessing services and benefits requiring information about themselves, their assets, and achievements. Inji Certify addresses this gap by enabling organizations to issue verifiable credentials and empowering users to securely store, share, and manage their data based on open standards and specifications.

Inji Certify is a powerful tool that enables issuers to seamlessly connect with existing data sources to issue verifiable credentials. It serves as a versatile solution for both organizations and individuals looking to issue and manage digitally verifiable credentials efficiently. By connecting with existing databases and offering configurable credential schemas, it caters to diverse use cases across different sectors and industries.

## Who is the intended user of Inji Certify?

The intended users of Inji Certify are divided into two main groups:

### 1. Organizations

#### Types of Organizations

* **Educational Institutions**: Such as universities, colleges, and training centers that need to issue academic certificates, diplomas, transcripts, and other educational credentials.
* **Employers**: Companies and businesses that issue employment certificates, offer letters, salary slips, and letters of recommendation to employees.
* **Government Agencies**: Entities that issue identity documents, licenses, permits, and other official certifications.
* **Professional Associations**: Organizations that issue professional certifications, licenses, and endorsements for specific skills or achievements.

#### Benefits for Organizations

* **Streamlined Credential Issuance**: Automates the process of issuing verifiable credentials, reducing manual work and administrative overhead.
* **Enhanced Security**: Ensures that issued credentials are authentic and tamper-proof.
* **Interoperability**: Supports industry standards, making credentials easily verifiable by other systems and platforms.

### 2. Individuals

#### Types of Individuals

* **Educators**: Tuition teachers, tutors, and trainers who need to issue certificates for completed courses, tests, or quizzes.
* **Employers**: Small business owners and managers who issue personalized letters of recommendation or verification of employment.
* **Professionals**: Freelancers, consultants, and other professionals who provide certifications or endorsements for skills, achievements, and project completions.

#### Benefits for Individuals

* **Empowerment**: Allows individuals to create and manage verifiable credentials for various purposes, enhancing trust and credibility in their professional and personal interactions.
* **Ease of Use**: Simplifies the process of generating and storing digital credentials.
* **Verification**: Ensures that credentials issued by individuals are recognized as authentic and verifiable.

<figure><img src="../../.gitbook/assets/functional-overview.png" alt=""><figcaption></figcaption></figure>

## Overall Purpose

Inji Certify is designed to meet the needs of both organizations and individuals by providing a robust, secure, and easy-to-use platform for issuing and managing verifiable credentials. By supporting multiple data formats and integrating seamlessly with existing databases, Inji Certify caters to diverse use cases across various sectors and industries.


---

<!--

> ❗ **Important\!** Before you proceed, you should be aware of OpenID4VC & W3C VC. Please read the following standards before proceeding:
>
>   * [OpenID4VC - OpenID for Verifiable Credential Issuance - draft 13](https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0-ID1.html)
>   * [W3C VC - Verifiable Credentials Overview](https://www.w3.org/TR/vc-overview/)


## Overview

Inji Certify enables issuers to generate, sign and issue a verifiable credentials. It follows the standard of OpenID4VCI (Open ID For VC Issuance) draft 13. It also issues VC complaints with W3C Verifiable Credentials (1.1 & 2.0). Issuers can configure credential schemas for different certificate types, generating credentials in different VC formats such JSON-LD, SD-JWT etc.

In particular, certify focuses on the issuer’s role in and provides the following features from OpenID4VC (draft 13):

| Feature                                                                 | Coverage |
|:------------------------------------------------------------------------|:---------|
| Issuer Metadata                                                         | ✅        |
| Support for access token validation                                     | ✅        |
| Credential Issuance                                                     | ✅        |
| Credential Binding with did:.. keys                                     | ✅        |
| Credential Binding with jwt proof                                       | ✅        |
| Support for JSON\_LD VC Format                                          | ✅        |
| Support for IETF SD\_JWT VC Format with support only for vc+sd\_jwt     | ✅        |
| Revocation support for JSON\_LD                                         | ✅        |
| Support for mDoc/mDL VC Format                                          | ❌        |
| Credential Offer with Pre Authorisation Code Flow                       | ❌        |
| Credential Offer with Authorisation Code Flow                           | ❌        |
| Credential Binding with cwt proof                                       | ❌        |

To know more about features available in certify please refer to [this documentation](https://docs.inji.io/inji-certify/overview/features).

## Architecture

Certify features a modular architecture that supports both direct issuance and proxying of VCs from external sources. It interacts with external digital wallets via APIs.

For a detailed view of Inji Certify’s architecture and components, check this [link](https://docs.inji.io/inji-certify/technical-overview/components).

## Plugin Support

Inji Certify provides a **plugin-based architecture** that enables modular, extensible, and customizable credential issuance workflows.

### Types of Plugins

* **VC Issuance Plugins**
  Handle the retrieval and alignment of Verifiable Credentials (VCs) as per standards, and manage the issuance process.
* **Data Provider Plugins**
  Fetch raw data from various sources, generate the credential, sign it, and issue it.
    * Currently supported integrations: PostgresSQL and CSV files.

### How to Use Plugins

* **[Overview: Choosing the Right Plugin](docs/VCIssuance-vs-DataProvider.md)** – Learn the differences between the two plugin types and how to decide which suits your issuer requirements.
* **[Postgres Data Provider Plugin](https://github.com/mosip/digital-credential-plugins/tree/master/postgres-dataprovider-plugin)** – Example walkthrough using the **Land Registry use case**. The same steps can be adapted for other use cases.
* **[Mock CSV Data Provider Plugin](https://github.com/mosip/digital-credential-plugins/tree/master/mock-certify-plugin#mockcsvdataproviderplugin)** – Guide for trying out the CSV-based plugin.
* **[VC Issuance Plugin](https://github.com/mosip/digital-credential-plugins/tree/master/mock-certify-plugin#mockvcissuanceplugin)** - Guide for trying VC issuance plugin.

### Advanced: Creating Custom Plugins

For advanced users, you can develop your own plugins by implementing the `DataProviderPlugin` interface:

```java
public interface DataProviderPlugin {
    // Implement your custom logic here
}
```

* **Reference Implementation:** [Postgres Data Provider Plugin](https://github.com/mosip/digital-credential-plugins/tree/master/postgres-dataprovider-plugin)
* Once a custom plugin has been developed refer to this [document](https://github.com/mosip/inji-certify/blob/master/docs/Custom-Plugin-K8s.md) to deploy the plugin.

## Deployment

Inji Certify supporting two mode of deployment to cater different users with different purpose:

1.  **Local Development Setup**

    * Intended for experimentation and user experience. Local Setup can be carried out in two ways:
        * **Local Setup with Docker Compose**
            * Recommended for users who want to experience the product from a technical/backend perspective.
            * Refer to [this guide](docker-compose/docker-compose-injistack/README.md) to try this mode of setup.
        * **Local Setup without Docker Compose**
            * Recommended for developers or community contributors who want to perform debugging or gain a deeper understanding of the Inji Certify codebase.
            * Refer to [this guide](docs/Local-Development.md) to try this mode of setup.
    * This is for developers, community members, and country representatives to explore the application, demonstrate its usage to external stakeholders, or conduct proof-of-concepts (POCs).

2.  **Deployment with Kubernetes cluster**

    * Designed for production environments.
    * Enables issuers to host and utilize the product at scale.
    * Click [here](https://docs.inji.io/readme/setup/deploy#deploying-inji-certify) to learn more about this mode of deployment.

If you are creating your own custom plugin, you can refer to [this link](https://github.com/mosip/inji-certify/blob/master/docs/Custom-Plugin-K8s.md) to know steps to deploy custom plugins using kubernetes.

## Configurations

In this section, you will refer to the key configurations which required to be enabled for specific feature or to run the whole applications.

### Auth Service Integration (e.g., Keycloak)

For authentication flows (e.g., with eSignet or other OIDC providers who are compliant with oAuth 2.0), below configuration to be modified as part of integration:

```properties
mosip.certify.authorization.url= https://keycloak-26.collab.mosip.net/auth/realms/inji
mosip.certify.authn.issuer-uri=${mosip.certify.authorization.url} 
mosip.certify.authn.jwk-set-uri=${mosip.certify.authorization.url}/protocol/openid-connect/certs
mosip.certify.identifier=${mosip.certify.domain.url}
mosip.certify.domain.url=https://injicertify-mock.collab.mosip.net
```

**Note** : OIDC scopes relevant to VC issuance.

To know more about this configuration please refer to [this link](https://docs.inji.io/inji-certify/build-and-deploy/local-setup#configuring-certify-with-keycloak-authorization-server).


### Enable VC Issuance with mock mDoc/mDL format

To enable certify to issue VC with mDoc/mDL (mock is supported currently) few properties needed to be updated. Refer [here](https://github.com/mosip/digital-credential-plugins/tree/master/mock-certify-plugin#mdocmockvcissuanceplugin) to know about the properties.

## Databases

Refer to [SQL scripts](db_scripts/README.md) and go through its README.

## Upgrades

### Upgrade from 0.11.0 to 0.12.0

Please refer to step-by-step [migration guide](docs/Migration-Guide-0.11.0-to-0.12.0.md) for upgrade from 0.11.0 to 0.12.0.

## Upcoming Features

* Additional formats: mDoc/mDL, Signed JWT
* Credential Revocation APIs & discovery mechanisms (SD-JWT, mDoc/mDL)
* Presentation during Issuance
* Pre authorised code & credential offer

**Note** : Currently, mDoc/mDL support is available only in mock mode. A full implementation will be provided in a future release.

## Documentation

* **API Documentation:**
  API endpoints, base URL (`/v1/certify`), and mock server details are available via Stoplight and Swagger documentation: [Inji Certify API Documentation](https://mosip.stoplight.io/docs/inji-certify).

* **Product Documentation:**

    * To know more about Inji Certify in the perspective of functional and use cases you can refer to our main document: [Overview | Inji](https://docs.inji.io/inji-certify/overview)
    * Inji Certify is part of Inji Stack, to know more about Inji Stack you can refer to our stack document: [Inji | Inji](https://docs.inji.io/)

## Contribution & Community

We welcome contributions from everyone\!

* [Check here](https://docs.inji.io/readme/contribution/code-contribution) to learn how you can contribute code to this application.
* If you have any questions or run into issues while trying out the application, feel free to post them in the [MOSIP Community](https://community.mosip.io/) — we’ll be happy to help you out.

-->
