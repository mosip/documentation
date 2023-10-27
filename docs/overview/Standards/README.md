# Standards

*
* It implements [OpenID Connect](https://openid.net/connect/) flows, which helps the relying party perform quick and easy integrations using pre-existing libraries for user verification.
* The system supports only the secure options in OpenID Connect, like authorization code flow to ensure the resident data is handled securely.
* It is integrated with [SBI](https://standards.ieee.org/ieee/3167/10925/) (Secure Biometric Interface) to facilitate secure biometric collection for biometric-based user verification.
* The system supports multiple authentication factors, like OTP, biometrics, etc., to be inclusive for all people.
* All integrations to the ID system are taken as a runtime plug-able library to allow the reuse of official container images that help with easier upgrades.
* Since this is designed especially for country-scale resident verification, we do not support additional features like role management, session management, etc.

## Open Standards

To learn more about the open standards followed by eSignet, read:

* [OAuth 2.0](https://oauth.net/2/)
* [OpenID Connect](https://openid.net/specs/openid-connect-core-1\_0.html)
* [OpenID4VCI](https://openid.net/specs/openid-4-verifiable-credential-issuance-1\_0.html)
* [IEEE SA P3167 SBI 2.0](https://standards.ieee.org/ieee/3167/10925/)

As eSignet follows OpenID Connect, it gets a lot of client libraries for integration. Hence, avoid custom code building for integration.

### eSignet relies on standards

eSignet implements [**OpenID Connect**](https://openid.net/connect/) and [**OAuth 2.0**](https://oauth.net/2/) flows to work its magic. We have chosen the most secure and trustworthy flow to ensure user privacy and data security.

eSignet relies on [**SBI (Secure Biometric Interface)**](https://standards.ieee.org/ieee/3167/10925/) to enable an ecosystem of biometric players. To have a look at the supported devices, click [here](https://docs.mosip.io/1.2.0/biometrics/biometric-devices).

eSignet leverages emerging standards for using verifiable credentials with OpenID and for wallet integration.
