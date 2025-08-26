# Version 0.12.0

Release Version: 0.12.0

Release Type: Developer Release

Release Date: 26th August, 2025

### Overview <a href="#overview" id="overview"></a>

**Inji Certify v0.12.0**, brings significant enhancements in credential issuance, revocation, and cryptographic support. This release continues our commitment to aligning with emerging standards while providing issuers with flexible configuration and integration capabilities.

### Major Highlights/ Features <a href="#major-highlights-features" id="major-highlights-features"></a>

* Credential Formats – Draft Implementation
  * SD-JWT and JWT support: Draft implementation enabling issuers to issue credentials in Selective Disclosure JWT (SD-JWT) format, expanding interoperability across wallets. Refer to [feature description](https://docs.inji.io/inji-certify/overview/features#support-for-multiple-credential-formats) to know more about this feature
* VC Configuration & Binding
  * Configurable VC Type: Issuers can now configure the VC Type dynamically, providing greater flexibility for different issuance use cases. Refer to [feature description](https://docs.inji.io/inji-certify/overview/features#addition-of-credential-type-via-api-post-onboarding) for more details.
  * DID Binding with did key:key: Added support for binding credentials to did:key, enhancing decentralization and cryptographic agility.
  * DID Binding with did:web for `kid` generation: Introduced support for did:web and automated key ID (kid) generation to enable smooth VC issuance in SD-JWT format.
* Revocation – Draft Implementation
  * VC Revocation: Initial draft implementation of revocation capabilities, allowing issuers to mark credentials as revoked and support verifiers in checking credential status. Refer to [feature description](https://docs.inji.io/inji-certify/overview/features#revocation-mechanism-draft-release-experimental-json-ld-only) for more details.
* Cryptography & Data Integrity
  * Data Integrity Support: Added support for W3C Data Integrity Proofs, providing a standards-based mechanism for ensuring verifiability of issued credentials.
  * ECC R1 Curve Support: Extended cryptographic suite with support for Elliptic Curve secp256r1 (P-256), enabling broader adoption and compliance. Refer to [feature description](https://docs.inji.io/inji-certify/overview/features#efficient-signing-with-multiple-algorithms) for more details.

{% hint style="info" %}
Note:

* When configuring the VC type, ensure that the `didUrl` value in the config file matches the value sent through the API; otherwise, VC issuance will fail.
* The VC Revocation feature is enabled by default for all VCs configured in Inji Certify. Configuration options to customise this will be introduced in an upcoming release.
* VC Revocation and SD-JWT support are released as draft features. They are marked as draft since additional enhancements are still in progress to enable the complete end-to-end flow and to complete comprehensive regression testing.
{% endhint %}

### User Stories Released <a href="#user-stories-released" id="user-stories-released"></a>

| Feature                                                                      | Description                                                                                                         | JIRA                                                                                                                                                               |
| ---------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Addition/Configuration of Verifiable Credential Type via API post onboarding | Enabling issuer configure new VC types based on the requirement at any time                                         | [INJICERT-769](https://mosip.atlassian.net/browse/INJICERT-769)                                                                                                    |
|                                                                              | Enabling additional validation to support the configuration of VC type addition                                     | [INJICERT-1036](https://mosip.atlassian.net/browse/INJICERT-1036)                                                                                                  |
| Revocation of VC                                                             | Searching VC to be revoked                                                                                          | [INJICERT-1116](https://mosip.atlassian.net/browse/INJICERT-1116)                                                                                                  |
|                                                                              | Revoking VC through API                                                                                             | [INJICERT-792](https://mosip.atlassian.net/browse/INJICERT-792)                                                                                                    |
| Support for VC Issuance with SD-JWT format                                   | Enable Trust Element in VC Format (SD-JWT) Using did:web in iss Attribute                                           | [INJICERT-1060](https://mosip.atlassian.net/browse/INJICERT-1060)                                                                                                  |
|                                                                              | Issuing VC in SD-JWT Format                                                                                         | [INJICERT-61](https://mosip.atlassian.net/browse/INJICERT-61)                                                                                                      |
|                                                                              | Enabling key manager to support did:web binding for VC signing                                                      | [MOSIP-41756](https://mosip.atlassian.net/browse/MOSIP-41756)                                                                                                      |
| Data Integrity Proof                                                         | Support for W3C **Data Integrity Proofs**                                                                           | [INJICERT-1033](https://mosip.atlassian.net/browse/INJICERT-1033)                                                                                                  |
| Code Refactoring                                                             | Refactoring code to enhance the code quality of the application                                                     | <p><a href="https://mosip.atlassian.net/browse/INJICERT-978">INJICERT-978</a></p><p><a href="https://mosip.atlassian.net/browse/INJICERT-768">INJICERT-768</a></p> |
| Signing VC with ECC R1 Algorithm                                             | Extending application’s capability of VC signing and providing support to sign with ECC R1 algorithm                | [INJICERT-977](https://mosip.atlassian.net/browse/INJICERT-977)                                                                                                    |
| DID integration for VC                                                       | Allows credentials to be cryptographically bound to a DID, ensuring stronger identity association and verifiability | [INJICERT-522](https://mosip.atlassian.net/browse/INJICERT-522)                                                                                                    |

### Bug Fixes <a href="#bug-fixes" id="bug-fixes"></a>

| JIRA                                                              | Description                                                                                                      |
| ----------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| [INJICERT-1184](https://mosip.atlassian.net/browse/INJICERT-1184) | StatusListCredential in credential status of VC is not accessible                                                |
| [INJICERT-1178](https://mosip.atlassian.net/browse/INJICERT-1178) | Resolved an issue where certain test cases were failing with a `java.lang.NullPointerException` error.           |
| [INJICERT-1160](https://mosip.atlassian.net/browse/INJICERT-1160) | Fixed a bug related to VC download for land registry VC type                                                     |
| [INJICERT-1156](https://mosip.atlassian.net/browse/INJICERT-1156) | Issue related to deploying Inji Certify with docker resolved                                                     |
| [INJICERT-1155](https://mosip.atlassian.net/browse/INJICERT-1155) | resolved issue related to VC issuance post the DB changes introduced as part of the new feature change           |
| [INJICERT-1120](https://mosip.atlassian.net/browse/INJICERT-1120) | When credential config APIs used to add new credential type, we need to still update signature in git properties |
| [INJICERT-903](https://mosip.atlassian.net/browse/INJICERT-903)   | aud in Access Token Uses containsAll Instead of contains                                                         |
| [INJICERT-544](https://mosip.atlassian.net/browse/INJICERT-544)   | Certify doesn't give the @context of the VC it's downloading                                                     |
| [INJICERT-324](https://mosip.atlassian.net/browse/INJICERT-324)   | VC download is failing with credential type "LifeInsuranceCredential"                                            |
| [INJICERT-298](https://mosip.atlassian.net/browse/INJICERT-298)   | VC download is failing with signature alg (ES256) supported values mentioned in well-known response              |
| [MOSIP-42537](https://mosip.atlassian.net/browse/MOSIP-42537)     | Incorrect representation of x5c field in JWT header                                                              |

### Known Issues <a href="#known-issue" id="known-issue"></a>

Below is the list of known issues related to the release v0.12.0. To access all known issues related to Inji Certify please click [**here**](https://mosip.atlassian.net/issues/INJICERT-852?filter=11419\&jql=project%20%3D%20%22Inji%20Certify%22%20AND%20issuetype%20%3D%20Bug%20%20AND%20labels%20not%20in%20%28API_Automation%2C%20AWSdevicefarm%2C%20device_specific%2C%20qa-inji-UI-auto%29%20%20and%20status%20NOT%20IN%20%28Closed%2C%20Fixed%2C%20Canceled%2CCancelled%29%20%20ORDER%20BY%20created%20DESC%2C%20updated%20DESC)

| JIRA                                                              | Description                                                                                       |
| ----------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| [INJICERT-1185](https://mosip.atlassian.net/browse/INJICERT-1185) | Config dependency for did url is still exists                                                     |
| [INJICERT-1182](https://mosip.atlassian.net/browse/INJICERT-1182) | "credentialStatusPurposes" from credential config API is getting overwritten by git configuration |
| [INJICERT-1176](https://mosip.atlassian.net/browse/INJICERT-1176) | VC fetch is failing for proof\_jwt with did:key binding for ES256 signature only                  |

### Repositories Released <a href="#repository-released" id="repository-released"></a>

| Repositories               | Tags Released                                                             |
| -------------------------- | ------------------------------------------------------------------------- |
| inji-certify               | [v0.12.0](https://github.com/mosip/inji-certify/tree/v0.12.0)             |
| digital-credential-plugins | [v0.5.0](https://github.com/mosip/digital-credential-plugins/tree/v0.5.0) |
| inji-config                | [v0.10.0](https://github.com/mosip/inji-config/tree/v0.10.0)              |
| key manager                | [v1.3.0-beta.4](https://github.com/mosip/keymanager/tree/v1.3.0-beta.4)   |
| commons                    | [v1.3.0-beta.3](https://github.com/mosip/commons/tree/v1.3.0-beta.3)      |

### Compatible Modules <a href="#compatible-modules" id="compatible-modules"></a>

The following table outlines the tested and certified compatibility of \<release version> with other modules.

| Modules               | Version (with tag links)                                                        |
| --------------------- | ------------------------------------------------------------------------------- |
| eSignet               | [v1.5.1](https://github.com/mosip/esignet/tree/v1.5.1)                          |
| id-authentication     | [v1.2.1.0](https://github.com/mosip/id-authentication/tree/v1.2.1.0)            |
| Sunbird C             | [v2.0.0](https://github.com/Sunbird-RC/sunbird-rc-core/releases/tag/v2.0.0-rc3) |
| esignet-mock-services | [v0.10.1](https://github.com/mosip/esignet-mock-services/tree/v0.10.1)          |

### Documentation <a href="#documentation" id="documentation"></a>

* [Feature Documentation](https://docs.mosip.io/inji/inji-certify/functional-overview/features)
* [QA Report](test-report.md)
* [Local Setup](https://docs.mosip.io/inji/inji-certify/build-and-deploy/local-setup)
* [API Documentation](https://mosip.stoplight.io/docs/inji-certify/25f435617408e-inji-certify)
