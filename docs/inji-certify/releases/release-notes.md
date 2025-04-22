# Version 0.8.1

**Release Name**: Inji Certify 0.8.1 (Patch)

**Support**: Developer Release

**Release Date**: 17th May, 2024

### **Overview**  <a href="#overview" id="overview"></a>

Version 0.8.1 introduces significant enhancements to streamline the management and issuance of verifiable credentials using the Sunbird platform. Key updates include:

1. **Sunbird Installation and Configuration:**
   * Postman collections are provided for creating issuers and credential schemas.
2. **DID Generation:**
   * To generate Decentralized Identifiers (DIDs) using the web method and an empty services list. The configuration within the Sunbird installation ensures that the generated DIDs are resolvable. When creating an issuer (which involves a DID generation call), this configuration will be used to generate the DIDs.
   * Added steps to make the generated DID discoverable for local testing
3. **Credential Schema and Issuance Registry:**
   * Users can create credential schemas and issuance registries.
   * Important identifiers (`$.schema[0].author` and `$.schema[0].id`) were noted for schema requests.
4. **Endpoint and Environment Variable Configuration:**
   * Hostname configuration for endpoints based on Docker setup.
   * `aud` variable and `audUrl` in the postman collection updated to the local OAuth token endpoint.
5. **Knowledge-Based Identification (KBI):**
   * KBI process implemented as per Postman collection.
   * Base64 encoded KBI details for authorization.
6. **Credential Generation:**
   * We adjusted the pre-request script for `/vci/credential` API.
   * Keypair and algorithm updated for generating smaller Verifiable Credentials.

**Repository Released**

| **Repositories** | **Tags Released**                                                                   |
| ---------------- | ----------------------------------------------------------------------------------- |
| Inji Certify     | [**v0.8.1**](https://github.com/mosip/inji-certify/tree/v0.8.1)                     |
| eSignet          | [**v1.4.0**](https://github.com/mosip/esignet/releases/tag/v1.4.0)                  |
| Sunbird C        | [**v2.0.0**](https://github.com/Sunbird-RC/sunbird-rc-core/releases/tag/v2.0.0-rc3) |

#### **Known Issues** <a href="#known-issues" id="known-issues"></a>

No Known Issues

#### **Documentation** <a href="#documentation" id="documentation"></a>

* [Feature Documentation](https://docs.mosip.io/inji/inji-certify/functional-overview/features)
* [Local Setup](https://docs.mosip.io/inji/inji-certify/build-and-deploy/local-setup)

