---
icon: house
---

# Overview

## Overview

Inji Certify enables issuers to generate, sign and issue a verifiable credentials. It follows the standard of OpenID4VCI (Open ID For VC Issuance) draft 13. It also issues VC complaints with W3C Verifiable Credentials (1.1 & 2.0). Issuers can configure credential schemas for different certificate types, generating credentials in different VC formats such JSON-LD, SD-JWT etc.

### How is the 'Inji Certify Documentation' organised?

The docs follow the typical journey: understand → try → set up → build → integrate → deploy → operate.

* [**Overview**](./)**:** Get the product basics and the mental model. Subsections cover capabilities and core concepts like [Features](features/).
* [**Test**](../functional-overview/)**:** Run a working flow end-to-end before you invest in setup. Subsections cover “Try it out”, workflow, and end-user steps.
* [**Setup**](../build-and-deploy/)**:** Get Certify running locally or in a shared environment. Subsections cover local setup and a guided deployment path.
* [**Develop**](../technical-overview/)**:** Go deeper on how Certify is built and how to extend it. Subsections cover the tech stack, architecture, supported OS, and key management.
* [**API**](../api.md)**:** Use the API reference to integrate wallets, clients, and surrounding services. Expect endpoint-level details, request/response shapes, and auth expectations.
* [**Deploy**](/broken/spaces/aY8BQ4hdzhSchZV814Ev/pages/ZNmtG0GlL4fe4bqA0rKO)**:** Jump straight to production-style deployment instructions. This points to the Kubernetes-focused deployment guide.
* [**Releases**](../releases/)**:** Track what changed between versions and what to upgrade to. Subsections include per-version notes and test reports.



### Standards, Specifications and Compliance

> ❗ **Important!** Before you proceed, you can acuaint yourself with OpenID4VC & W3C VC. Refer to the following standards before proceeding:
>
> * [OpenID4VC - OpenID for Verifiable Credential Issuance - draft 13](https://openid.net/specs/openid-4-verifiable-credential-issuance-1_0-ID1.html)
> * [W3C VC - Verifiable Credentials Overview](https://www.w3.org/TR/vc-overview/)

In particular, certify focuses on the issuer’s role in and provides the following features from OpenID4VC (draft 13):

| Feature                     | Status      | Description                                                       |
| --------------------------- | ----------- | ----------------------------------------------------------------- |
| **Issuer Metadata**         | Available   | Publish credential issuer configuration and supported credentials |
| **Access Token Validation** | Available   | Validate OAuth 2.0 access tokens for secure credential requests   |
| **Credential Issuance**     | Available   | Issue signed Verifiable Credentials to digital wallets            |
| **Credential Binding**      | Partial     | DID keys and JWT proof supported; CWT proof coming soon           |
| **VC Formats**              | Partial     | JSON-LD and SD-JWT supported; mDoc/mDL coming soon                |
| **Revocation**              | Partial     | JSON-LD supported; SD-JWT and mDoc/mDL coming soon                |
| **Credential Offer Flows**  | Coming Soon | Pre-authorised and authorisation code flows                       |

To know more about features available in certify please refer to [this documentation](features/).

## Architecture

Certify features a modular architecture that supports both direct issuance and proxying of VCs from external sources. It interacts with external digital wallets via APIs.

For a detailed view of Inji Certify’s architecture and components, check this [link](../technical-overview/architecture.md).

## Plugin Support

Inji Certify provides a **plugin-based architecture** that enables modular, extensible, and customizable credential issuance workflows.

### Types of Plugins

* **VC Issuance Plugins** Handle the retrieval and alignment of Verifiable Credentials (VCs) as per standards, and manage the issuance process.
* **Data Provider Plugins** Fetch raw data from various sources, generate the credential, sign it, and issue it.
  * Currently supported integrations: PostgresSQL and CSV files.

### How to Use Plugins

* [**Overview: Choosing the Right Plugin**](https://github.com/inji/inji-certify/blob/master/docs/VCIssuance-vs-DataProvider.md) – Learn the differences between the two plugin types and how to decide which suits your issuer requirements.
* [**Postgres Data Provider Plugin**](https://github.com/inji/digital-credential-plugins/tree/master/postgres-dataprovider-plugin) – Example walkthrough using the **Land Registry use case**. The same steps can be adapted for other use cases.
* [**Mock CSV Data Provider Plugin**](https://github.com/mosip/digital-credential-plugins/tree/master/mock-certify-plugin#mockcsvdataproviderplugin) – Guide for trying out the CSV-based plugin.
* [**VC Issuance Plugin**](https://github.com/mosip/digital-credential-plugins/tree/master/mock-certify-plugin#mockvcissuanceplugin) - Guide for trying VC issuance plugin.

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

1. **Local Development Setup**
   * Intended for experimentation and user experience. Local Setup can be carried out in two ways:
     * **Local Setup with Docker Compose**
       * Recommended for users who want to experience the product from a technical/backend perspective.
       * Refer to [this guide](link/) to try this mode of setup.
     * **Local Setup without Docker Compose**
       * Recommended for developers or community contributors who want to perform debugging or gain a deeper understanding of the Inji Certify codebase.
       * Refer to [this guide](link/) to try this mode of setup.
   * This is for developers, community members, and country representatives to explore the application, demonstrate its usage to external stakeholders, or conduct proof-of-concepts (POCs).
2. **Deployment with Kubernetes cluster**
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

Refer to [SQL scripts](db_scripts/) and go through its README.

## Upgrades

### Upgrade from 0.11.0 to 0.12.0

Please refer to step-by-step [migration guide](https://github.com/inji/inji-certify/blob/master/docs/Migration-Guide-0.11.0-to-0.12.0.md) for upgrade from 0.11.0 to 0.12.0.

## Upcoming Features

* Additional formats: mDoc/mDL, Signed JWT
* Credential Revocation APIs & discovery mechanisms (SD-JWT, mDoc/mDL)
* Presentation during Issuance
* Pre authorised code & credential offer

**Note** : Currently, mDoc/mDL support is available only in mock mode. A full implementation will be provided in a future release.

## Documentation

* **API Documentation:** API endpoints, base URL (`/v1/certify`), and mock server details are available via Stoplight and Swagger documentation: [Inji Certify API Documentation](https://mosip.stoplight.io/docs/inji-certify).
* **Product Documentation:**
  * To know more about Inji Certify in the perspective of functional and use cases you can refer to our main document: [Overview | Inji](https://docs.inji.io/inji-certify/overview)
  * Inji Certify is part of Inji Stack, to know more about Inji Stack you can refer to our stack document: [Inji | Inji](https://docs.inji.io/)

## Contribution & Community

We welcome contributions from everyone!

* [Check here](https://docs.inji.io/readme/contribution/code-contribution) to learn how you can contribute code to this application.
* If you have any questions or run into issues while trying out the application, feel free to post them in the [MOSIP Community](https://community.mosip.io/) — we’ll be happy to help you out.
