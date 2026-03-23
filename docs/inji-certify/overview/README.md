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

As an OpenID4VC (draft 13) compliant issuer, Inji Certify provides the following features:

| Feature                     | Status      | Description                                                       |
| --------------------------- | ----------- | ----------------------------------------------------------------- |
| **Issuer Metadata**         | Available   | Publish credential issuer configuration and supported credentials |
| **Access Token Validation** | Available   | Validate OAuth 2.0 access tokens for secure credential requests   |
| **Credential Issuance**     | Available   | Issue signed Verifiable Credentials to digital wallets            |
| **Credential Binding**      | Partial     | DID keys and JWT proof supported; CWT proof coming soon           |
| **VC Formats**              | Partial     | JSON-LD and SD-JWT supported; mDoc/mDL coming soon                |
| **Revocation**              | Partial     | JSON-LD supported; SD-JWT and mDoc/mDL coming soon                |
| **Credential Offer Flows**  | Coming Soon | Pre-authorised and authorisation code flows                       |

To know more about features available in Inji Certify please refer to [this documentation](features/).

## Architecture

Inji Certify features a modular architecture that supports both direct issuance and proxying of VCs from external sources. It interacts with external digital wallets via APIs.

For a detailed view of Inji Certify’s architecture and components, check this [link](../technical-overview/architecture.md).

## Plugin Support

Inji Certify provides a **plugin-based architecture** that enables modular, extensible, and customizable credential issuance workflows.

### Types of Plugins

* **VC Issuance Plugins** Handle the retrieval and alignment of Verifiable Credentials (VCs) as per standards, and manage the issuance process.
* **Data Provider Plugins** Fetch raw data from various sources, generate the credential, sign it, and issue it.
  * Currently supported integrations: PostgresSQL and CSV files.


## Deployment

Inji Certify supporting two mode of deployment to cater different users with different purpose:

1. Local Development Setup
2. Deployment with Kubernetes cluster

If you are creating your own custom plugin, you can refer to [this link](https://github.com/mosip/inji-certify/blob/master/docs/Custom-Plugin-K8s.md) to know steps to deploy custom plugins using kubernetes.

## Documentation

* **API Documentation:** API endpoints, base URL (`/v1/certify`), and mock server details are available via Stoplight and Swagger documentation: [Inji Certify API Documentation](https://mosip.stoplight.io/docs/inji-certify).
* **Product Documentation:**
  * To know more about Inji Certify in the perspective of functional and use cases you can refer to our main document: [Overview | Inji](https://docs.inji.io/inji-certify/overview)
  * Inji Certify is part of Inji Stack, to know more about Inji Stack you can refer to our stack document: [Inji | Inji](https://docs.inji.io/)

## Contribution & Community

We welcome contributions from everyone!

* [Check here](https://docs.inji.io/readme/contribution/code-contribution) to learn how you can contribute code to this application.
* If you have any questions or run into issues while trying out the application, feel free to post them in the [MOSIP Community](https://community.mosip.io/) — we’ll be happy to help you out.
