# Version 0.12.2

**Release Version:** 0.12.2

**Release Type:** Developer Release

**Release Date:** 23rd October, 2025

### **Overview**

Inji Certify v0.12.2 focuses on enabling issuers with greater control and flexibility in managing their credential signing infrastructure, while also improving usability and operational stability.

This release introduces new issuer-facing APIs that allow seamless integration with external Certificate Authorities (CAs) through a complete CSR generation and signed certificate upload workflow. By orchestrating with Key Manager, Certify ensures that issuers can securely generate CSRs, validate and store CA-signed certificates, and immediately leverage them for VC signing, thereby expanding deployment capacity and supporting sovereign CA setups.

Alongside this core capability, the release also improves accessibility for external users by updating key documentation references and Postman collections to point to the collaboration environment, ensuring a smoother setup and integration experience. Additionally, database scripts now include the Shedlock table, resolving prior gaps and providing reliable distributed job scheduling for production deployments.

Together, these enhancements not only extend the functional capacity of Certify but also strengthen its readiness for large-scale, real-world integrations.

### **Major Highlights / Features**

* **CSR & Certificate Management APIs** – Certify now exposes APIs to generate CSRs via Key Manager for `aphid`and `refid`, download them, and upload externally signed certificates. Uploaded certificates are validated and securely stored, enabling their use in VC signing.
* **Updated Documentation Links** – Postman collections and reference URLs have been updated to point to the collaboration environment, ensuring external users can easily test and integrate.
* **Database Script Correction** – Shedlock table has been added to DB scripts to support distributed job scheduling and ensure reliable execution in production setups.

### Bug Fixes

<table><thead><tr><th width="185">JIRA</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1237">INJICERT-1237</a></td><td>Allow issuer to generate CSR for app id and ref id to enable external CA signing and certificate upload into certify</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1238">INJICERT-1238</a></td><td>Update Postman Collection to refer collab environment</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1242">INJICERT-1242</a></td><td>Enabling shedlock table to facilitate scheduled jobs within certify</td></tr></tbody></table>

### Known Issues

Below is the list of known issues related to the release v0.12.2. To access all known issues related to Inji Certify please click [**here**](https://mosip.atlassian.net/issues/INJICERT-852?filter=11419\&jql=project%20%3D%20%22Inji%20Certify%22%20AND%20issuetype%20%3D%20Bug%20%20AND%20labels%20not%20in%20%28API_Automation%2C%20AWSdevicefarm%2C%20device_specific%2C%20qa-inji-UI-auto%29%20%20and%20status%20NOT%20IN%20%28Closed%2C%20Fixed%2C%20Canceled%2CCancelled%29%20%20ORDER%20BY%20created%20DESC%2C%20updated%20DESC)

<table><thead><tr><th width="186">JIRA</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1249">INJICERT-1249</a></td><td>SD-JWT VC fetch is failing after CSR generated and uploaded to certify</td></tr></tbody></table>

### Repository Released

<table><thead><tr><th width="343">Repositories</th><th>Tags</th></tr></thead><tbody><tr><td>inji-certify</td><td><a href="https://github.com/mosip/inji-certify/tree/v0.12.2">0.12.2</a></td></tr></tbody></table>

### Compatible Modules <a href="#compatible-modules" id="compatible-modules"></a>

The following table outlines the tested and certified compatibility of 0.12.2 with other modules.

| Module                | Version (with tag links)                                                        |
| --------------------- | ------------------------------------------------------------------------------- |
| eSignet               | [v1.6.2](https://github.com/mosip/esignet/tree/v1.6.2)                          |
| IDA                   | [v1.2.1.0](https://github.com/mosip/id-authentication/tree/v1.2.1.0)            |
| Sunbird C             | [v2.0.0](https://github.com/Sunbird-RC/sunbird-rc-core/releases/tag/v2.0.0-rc3) |
| esignet-mock-services | [v0.11.2](https://github.com/mosip/esignet-mock-services/tree/v0.11.2)          |
| commons               | [v1.3.0-beta](https://github.com/mosip/commons/tree/v1.3.0-beta.3).3            |
| key-manager           | [v1.3.0-beta.4](https://github.com/mosip/keymanager/tree/v1.3.0-beta.4)         |
| mimoto                | [0.15.0](https://github.com/mosip/mimoto/tree/v0.15.0) (for docker compose)     |
| Inji-web              | [0.11.0](https://github.com/mosip/inji-web/tree/v0.11.0) (for docker compose)   |
| Inji-web              | [0.13.1](https://github.com/mosip/inji-web/tree/v0.13.1)                        |
| mimoto                | [0.18.1](https://github.com/mosip/mimoto/tree/v0.18.1)                          |

### Documentation

* [Feature Documentation](https://docs.mosip.io/inji/inji-certify/functional-overview/features)
* [Local Setup](https://docs.mosip.io/inji/inji-certify/build-and-deploy/local-setup)
* [API Documentation](https://mosip.stoplight.io/docs/inji-certify/25f435617408e-inji-certify)
* [Test Report](test-report.md)
