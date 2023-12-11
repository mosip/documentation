# v1.2.0

**Release Name**: eSignet VCI

**Upgrade From**: 1.1.0

**Release Date**: November 18, 2023

## Overview

The 1.2.0 version of eSignet is the fourth release of eSignet which mainly focuses on the [**VC Issuance**](../../integration/vc-issuance.md) feature.

* **Verifiable Credentials Issuance**: eSignet is an OAuth 2.0 and OIDC-based solution that has been enhanced to support OID4VCI flows. By integrating the eSignet VCI solution into a traditional issuer, it allows the issuer application to become compliant with OID4VCI standards, ensuring interoperability with all OID4VCI compatible wallets.
* **Signed Consent**: eSignet securely saves the consent in a dedicated consent registry that is specifically designed to store user consent for claims and scopes requested during the initial login to a relying party's application using eSignet.
* **PKCE Security extension added**: We also provide support for the [PKCE](https://www.rfc-editor.org/rfc/rfc7636) security extension, which allows for the secure exchange of an authorization code for a token. This guarantees that the authorization code was obtained by the client application itself during the exchange process.
* **Multiple wallet support:** Mobile wallet-based authentication can be employed to scan a QR code and complete the authentication process utilizing the previously activated credentials for online login. Moreover, facial authentication can occur on the wallet to ensure the presence of the authorized individual is verified.
* **Language Support for eSignet:**  The eSignet user interface (UI) offers comprehensive language support to facilitate effective communication. By default, eSignet includes language bundles for Arabic, English, Hindi, Kannada, and Tamil. Moreover, it can be easily customized to incorporate additional languages as necessary to accommodate specific country requirements. Furthermore, eSignet has undergone meticulous testing to ensure seamless compatibility with right-to-left (RTL) languages. This means that users can rely on eSignet to confidently navigate and interact with RTL content.

## Features Included

Below are the features available in the release:

* Login with OTP
* Login with biometrics
* Wallet-based authentication
* Multi-language support
* Captcha validation
* Consent storage
* VC Issuance

## Repositories Released

* eSignet: TBA
* artifactory-ref-impl: TBA
* mosip-config: TBA

For details on deployment, go through the [helm charts in the eSignet repository](https://github.com/mosip/esignet/tree/v1.1.0/helm).

## Documentation

* [Feature Documentation](../../overview/features/)
* [Integration Guides](../../integration/)
* [End User Guide](../../end-user-guide/)
* [QA Report](test-report/)
