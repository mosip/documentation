# Local Setup

**Inji Certify** is a robust platform that enables issuers to connect with an existing Credential Registry to issue verifiable credentials. Issuers can configure credential schemas for various types of certificates they wish to issue. Certificates are generated in JSON-LD format as per the W3C Verifiable Credentials (VC) v1.1 standard.

This guide is designed to help developers set up **Inji Certify** in their local environment, providing detailed instructions to replicate the platform's functionality for development or testing purposes.

## Getting Started

To begin, visit the **Inji Certify** repository on GitHub:

* **Repository Link**: [**Inji Certify Repository**](https://github.com/mosip/inji-certify/tree/v0.10.1)

The repository contains all the necessary files and instructions to set up Inji Certify on your local machine.

## Prerequisites

Before proceeding with the installation, ensure you have the following installed:

* Docker (26.0.0)
* Docker Compose (2.25)
* [**Git bash**](https://gitforwindows.org/) shell to run the scripts, if on _Windows_
* [**GNU sed**](https://formulae.brew.sh/formula/gnu-sed) installed, if on _Mac_
* A URL to host your DID for verifying VCs(Verifiable Credentials) can use [**GitHub pages**](https://docs.github.com/en/pages/quickstart) here or any other self-hosted server which is highly available for use by verifiers.

Please visit the [**Pre-requisites**](https://github.com/mosip/inji-certify/blob/v0.10.1/docker-compose/docker-compose-injistack/README.md) section in the ReadME file to explore in detail.

## Installation and Setup

The setup involves deploying [**Inji Certify**](https://github.com/mosip/inji-certify/blob/v0.10.1/docker-compose/docker-compose-injistack/README.md) using Docker Compose. Follow the steps given in the [**README file**](https://github.com/mosip/inji-certify/blob/v0.10.1/README.md) within the Inji Certify repository.

## Explore Inji Certify

Once the setup is complete, you can start exploring the functionality of **Inji Certify**:

* **Configure Credential Schemas**: Set up schemas for various types of certificates you wish to issue.
* **Interact with the System**: Test the issuance and management of credentials through our reference platform Inji Web. Please click [**here**](https://github.com/mosip/inji-certify/blob/v0.10.1/README.md) to explore the steps!

For additional configuration and usage instructions, consult the documentation included in the repository.


## Configuring Certify with Keycloak Authorization Server

### Set the Authorize URL of Certify to point to the KeyCloak Authorization server, 
This means configure mosip.certify.authorization.url and configure the mosip.certify.authn.issuer-uri & mosip.certify.authn.jwk-set-uri appropriately. 

* **General Concept**: This step configures your application ("Certify") with the essential endpoints of your chosen Identity Provider ("Keycloak").
    * `mosip.certify.authorization.url`: This corresponds to the provider's standard OAuth 2.0 Authorization Endpoint, where users are redirected for login and consent.
    * `mosip.certify.authn.issuer-uri`: This is the standard OIDC Issuer Identifier. Your application uses this to verify the `iss` (issuer) claim in tokens it receives, ensuring they come from the expected provider.
    * `mosip.certify.authn.jwk-set-uri`: This is the standard OIDC JWKS URI. Your application fetches the provider's public keys from this URL to verify the digital signature of received JWTs (like ID Tokens).

**Note**: Any compliant OAuth 2.0 / OIDC provider will have corresponding values for these standard endpoints, which you'd find in their documentation or OIDC discovery document (`.well-known/openid-configuration`).

**Configure** `mosip.certify.identifier` to the value matching the `aud` value configured in the client.
* **General Concept**: This configures your application's own identifier (`mosip.certify.identifier`) as it should appear in the `aud` (Audience) claim of tokens issued by the IdP for this specific application ("client" registration in the IdP).
* **Note**: Validating the `aud` claim is a standard security measure for resource servers (like your "Certify" application) to ensure a received token was intended for them and not another application. The value is typically the Client ID or a specific Audience URI defined during application registration in the IdP.

**Configure the scope correctly as per the scope of the VerifiableCredential as configured in the Keycloak client in the prior steps.**
* **General Concept**: scope is a standard OAuth 2.0 parameter representing the permissions your application is requesting.
* **Note**: Your application needs to be configured to request the specific scopes it requires (these might be standard OIDC scopes like openid, profile, email, or custom scopes related to specific functionalities, like Verifiable Credentials here). Importantly, these scopes must also be explicitly allowed for your application ("client") within the Identity Provider's settings (in Keycloak's client configuration in this case).

**Configure the credential types to match the VC in the well known**
* **General Concept**: This step is specific to the application's domain (handling Verifiable Credentials). It involves configuring the application to understand the specific types of resources it manages.
* **Note**: The reference to "well known" likely points to a discovery mechanism (perhaps the OIDC discovery endpoint if extended, or a domain-specific registry/schema definition location) where these credential types are formally defined. This ensures the application's internal configuration aligns with external standards or definitions relevant to its function.


## Explore the APIs

To explore all the available APIs of **Inji Certify**, refer to the [**API documentation**](https://mosip.stoplight.io/docs/inji-certify/25f435617408e-inji-certify) provided within the platform. This will allow you to interact with the various endpoints and understand their functionality in detail.


## Additional Resources

For further insights and guidance on using **Inji Certify** effectively, refer to the following:

* **Comprehensive Documentation**: Available within the repository’s [**README**](https://github.com/mosip/inji-certify/blob/v0.10.1/README.md) file.
* **Support**: Engage with the developer [**MOSIP community**](http://community.mosip.io) or seek support for any issues encountered during the setup.
