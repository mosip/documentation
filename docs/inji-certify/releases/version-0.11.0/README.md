# Version 0.11.0

**Release Version**: v0.11.0

**Release Type**: Developer Release

**Release** **Date**: 2nd May, 2025

### Overview

Inji Certify v0.11.0 brings major enhancements focused on improving security, standards compliance, and interoperability in verifiable credential issuance. This release expands cryptographic support, simplifies deployment, strengthens identity integration, and aligns closely with OpenID4VC and OpenID4VCI specifications. It also introduces initial support for third-party wallets and identity platforms, making Inji Certify more versatile and extensible in digital ID ecosystems.

### Major Highlights/Features

* **Keycloak Integration**: Seamless integration with Keycloak has been introduced, providing secure, standards-based authentication aor verifiable credential issuance.
* **Enabled for Interoperability and Integration**: Inji Certify now supports seamless interoperability with digital wallets that adhere to the OpenID for Verifiable Credentials (OpenID4VC) specification. Having gone through rigorous testing, Inji Certify now assures and attests that it can integrate effortlessly with any wallet designed to be interoperable and compliant with OpenID4VC standards and thereby enhancing its versatility and adoption in diverse ecosystems.
* **Expanded Cryptographic Algorithm Support in Inji Certify**\
  Inji Certify now offers enhanced cryptographic flexibility through support for additional signing algorithms:
  * **ECC K1 2019 Key Support**: Inji Certify supports signing and verification using ECC K1 2019 keys, enabling compatibility with a broader range of secure systems and ensuring robust security for verifiable credentials.
  * **Ed25519 Signing (2018 & 2020)**: Verifiable credential requests can now be signed using Ed25519 keys, compliant with both 2018 and 2020 specifications. This enhancement ensures interoperability with diverse ecosystems and aligns with modern cryptographic standards.
* **eSignet v1.5.1 Compatibility**: Full support for eSignet 1.5.1.
* **OpenID4VCI Compliance Improvements**: Docker Compose now supports redirection of the .well-known endpoint as per spec.
* **Simplified Setup**: Dependency on Artifactory removed for streamlined deployment.

### Enhancements

* Improved cryptographic flexibility through support of ECC K1 2019 and Ed25519 key types.
* Enhanced ecosystem integration by supporting Keycloak and eSignet 1.5.1.
* Support for Talaos and Altme wallets expands adoption in OpenID4VC ecosystems.
* Alignments made with OpenID4VCI specs to improve compatibility and standard adherence.

### Bug Fixes

| JIRA                                                            | Description                                                                                         |
| --------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| [INJICERT-867](https://mosip.atlassian.net/browse/INJICERT-867) | In docker compose, jar is still copied from one place to another place to continue with VC download |
| [INJICERT-895](https://mosip.atlassian.net/browse/INJICERT-895) | Spec compliance - Issues                                                                            |
| [INJICERT-901](https://mosip.atlassian.net/browse/INJICERT-901) | Incorrect Required Claims in VC Issuance                                                            |
| [INJICERT-902](https://mosip.atlassian.net/browse/INJICERT-902) | kid Not Set Correctly for did:jwk Verification                                                      |
| [INJICERT-933](https://mosip.atlassian.net/browse/INJICERT-933) | Certify docker compose should also support redirection of the well-known as per OpenID4VCI          |

**Known Issues**

Below is the list of known issues. To read in detail and view all the topics related to Inji Certify please click [**here**](https://mosip.atlassian.net/issues/INJICERT-852?filter=11419\&jql=project%20%3D%20%22Inji%20Certify%22%20AND%20issuetype%20%3D%20Bug%20%20AND%20labels%20not%20in%20%28API_Automation%2C%20AWSdevicefarm%2C%20device_specific%2C%20qa-inji-UI-auto%29%20%20and%20status%20NOT%20IN%20%28Closed%2C%20Fixed%2C%20Canceled%2CCancelled%29%20%20ORDER%20BY%20created%20DESC%2C%20updated%20DESC)

| JIRA                                                            | Description                                                                    |
| --------------------------------------------------------------- | ------------------------------------------------------------------------------ |
| [ES-2289](https://mosip.atlassian.net/browse/ES-2289)           | Esignet Oauth API is failing intermittently                                    |
| [INJIVER-1069](https://mosip.atlassian.net/browse/INJIVER-1069) | The MOSIP UIN VC's created from reg-client are not verifiable from INJI-verify |

### Repository Released

| Repositories               | Tags Released                                                             |
| -------------------------- | ------------------------------------------------------------------------- |
| inji-certify               | [v0.11.0](https://github.com/mosip/inji-certify/tree/v0.11.0)             |
| digital-credential-plugins | [v0.4.0](https://github.com/mosip/digital-credential-plugins/tree/v0.4.0) |
| inji-config                | [v0.8.0](https://github.com/mosip/inji-config/tree/v0.8.0)                |

### Compatible Modules

The following table outlines the tested and certified compatibility of \<release version> with other modules.

| Module               | Version(With tag links)                                                         |
| -------------------- | ------------------------------------------------------------------------------- |
| eSignet              | [v1.5.1](https://github.com/mosip/esignet/tree/v1.5.1)                          |
| Sunbird C            | [v2.0.0](https://github.com/Sunbird-RC/sunbird-rc-core/releases/tag/v2.0.0-rc3) |
| Key Manager          | [v1.3.0-beta.2](https://github.com/mosip/keymanager/tree/v1.3.0-beta.2)         |
| commons              | [v1.3.0-beta.1](https://github.com/mosip/commons/tree/v1.3.0-beta.1)            |
| mock-identity-system | [v0.10.1](https://github.com/mosip/esignet-mock-services/tree/v0.10.0)          |

## Documentation

* [Functional Overview](https://docs.inji.io/inji-certify/overview)
* [Feature Documentation](https://docs.inji.io/inji-certify/overview/features)
* [API Documentation](https://mosip.stoplight.io/docs/inji-certify/25f435617408e-inji-certify)
* [QA Report](https://docs.inji.io/inji-certify/releases/version-0.11.0/test-report)
