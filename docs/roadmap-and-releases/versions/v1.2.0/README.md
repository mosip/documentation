# v1.2.0

**Release Name**: eSignet VCI

**Release Number:** v1.2.0

**Release Date**: 11th December, 2023

## Overview

The 1.2.0 version of eSignet focuses on the [**VC Issuance**](broken-reference) feature.

* **Verifiable Credentials Issuance**: eSignet is an OAuth 2.0 and OIDC-based solution that has been enhanced to support OID4VCI flows. Integrating the eSignet VCI solution into a traditional issuer, allows the issuer application to become compliant with OID4VCI standards, ensuring interoperability with all OID4VCI compatible wallets.
* **Signed Consent**: eSignet securely saves the consent in a dedicated consent registry that is specifically designed to store user consent for claims and scopes requested during the initial login to a relying party's application using eSignet.
* **PKCE Security extension added**: We also provide support for the [PKCE](https://www.rfc-editor.org/rfc/rfc7636) security extension, which allows for the secure exchange of an authorization code for a token. This guarantees that the authorization code was obtained by the client application itself during the exchange process.
* **Multiple wallet support:** Mobile wallet-based authentication can be employed to scan a QR code and complete the authentication process utilizing the previously activated credentials for online login. Moreover, facial authentication can occur on the wallet to ensure the presence of the authorized individual is verified.
* **Language Support for eSignet:** The eSignet user interface (UI) offers comprehensive language support to facilitate effective communication. By default, eSignet includes language bundles for Arabic, English, Hindi, Kannada, and Tamil. Moreover, it can be easily customized to incorporate additional languages as necessary to accommodate specific country requirements. Furthermore, eSignet has undergone meticulous testing to ensure seamless compatibility with right-to-left (RTL) languages. This means that users can rely on eSignet to confidently navigate and interact with RTL content.

### Features Included

Below are the features available in the release:

* Login with OTP
* Login with biometrics
* Wallet-based authentication
* Multi-language support
* Captcha validation
* Consent storage
* VC Issuance

### Repositories Released

| Repository Released                | Tags                                                                         |
| ---------------------------------- | ---------------------------------------------------------------------------- |
| keymanager                         | [1.2.0.1-B3](https://github.com/mosip/keymanager/tree/v1.2.0.1-B3)           |
| id-authentication                  | [1.2.0.1-B5](https://github.com/mosip/id-authentication/tree/v1.2.0.1-B5)    |
| Artifactory-ref-impl               | [1.2.0.1-B6](https://github.com/mosip/artifactory-ref-impl/tree/v1.2.0.1-B6) |
| mosip-config                       | [1.2.0-ES](https://github.com/mosip/mosip-config/tree/v1.2.0-ES)             |
| mosip-helm                         | [1.2.0-ES](https://github.com/mosip/mosip-helm/tree/v1.2.0-ES)               |
| mosip-infra                        | [1.2.0-ES](https://github.com/mosip/mosip-infra/tree/v1.2.0-ES)              |
| esignet                            | [1.2.0](https://github.com/mosip/esignet/tree/v1.2.0)                        |
| esignet-mock-services              | [0.9.1](https://github.com/mosip/esignet-mock-services/tree/v0.9.1)          |
| mosip-file-server                  | [1.2.0.1-B4](https://github.com/mosip/mosip-file-server/tree/v1.2.0.1-B4)    |
| mosip-plugins/sign-in-with-esignet | [0.9.1](https://github.com/mosip/mosip-plugins/tree/v0.9.1)                  |
| mosip-onboarding                   | [1.2.0.1-B4](https://github.com/mosip/mosip-onboarding/tree/v1.2.0.1-B4)     |

For details on deployment, go through the [helm charts](https://github.com/mosip/esignet/tree/v1.1.0/helm) in the eSignet repository.

### Documentation

* [Feature Documentation](../../../esignet-authentication/features.md)
* [Integration Guides](../../../esignet-authentication/develop/integration/relying-party/development-and-integration-with-esignet.md)
* [End User Guide](../../../esignet-authentication/test/end-user-guide/README.md)
* [API Documentation](https://github.com/mosip/esignet/blob/v1.2.0/docs/idp-oidc-service-openapi.yaml)
* [QA Report](test-report.md)
