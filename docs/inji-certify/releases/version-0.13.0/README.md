# Version 0.13.0

**Release Version** 0.13.0

**Release Type**: Developer Release

**Release Date**: 28th November, 2025

## Overview

Inji Certify v0.13.0 introduces major advances in credential issuance and lifecycle management and this includes the following:

* A full implementation of the **Revocation Flow** enabling issuers to mark credentials as revoked and track them with a ledger.
* Support to upload **Externally-signed CA Certificates** into the key-management workflow, allowing organizations to use their own PKI for signing credentials.
* Full implementation of the **SD-JWT - Selective Disclosure JWT** issuance feature.
* Updated Docker-Compose support that aligns with the latest versions of the associated modules (Inji Web & Mimoto).

## Major Highlights & Features

The [**Revocation**](https://docs.inji.io/inji-certify/overview/features#id-7.-revocation-mechanism-json-ld-only) feature is now fully functional, issuers can revoke VCs, and the ledger can be configured for indexing to support efficient search for revocation lookup.

Organizations can now integrate their own PKI by uploading [**externally-signed CA Certificates**](https://docs.inji.io/inji-certify/overview/features#id-11.-vc-signing-with-external-ca-signed-certificates) into Inji Certify's Key Manager.

You can now Issue Credentials in [**SD-JWT - Selective Disclosure JWT**](https://docs.inji.io/inji-certify/overview/features#id-4.-support-for-multiple-credential-formats) format, offering issuers selective disclosure capabilities and enhanced privacy options.

*   **Revocation Implementation**

    The [**Revocation**](https://docs.inji.io/inji-certify/overview/features#id-7.-revocation-mechanism-json-ld-only) feature is now fully functional, issuers can revoke VCs, and the ledger can be configured for indexing to support efficient search for revocation lookup.
*   **Externally Signed Certificate Upload**

    Organizations can now integrate their own PKI by uploading [**externally-signed CA Certificates**](https://docs.inji.io/inji-certify/overview/features#id-11.-vc-signing-with-external-ca-signed-certificates)  into Inji Certify's Key Manager.

    New APIs allow the following steps:

    * Generate a CSR via the generateCSR endpoint.
    * Upload the CA certificate via the upload-ca-certificate endpoint.
    * Upload the signed certificate via the uploadCertificate endpoint.
    * Once configured, the system’s key manager uses these externally signed certificates to generate keys and sign VCs.
*   **SD-JWT Implementation**

    You can now Issue Credentials in [**SD-JWT - Selective Disclosure JWT**](https://docs.inji.io/inji-certify/overview/features#id-4.-support-for-multiple-credential-formats) format, offering issuers selective disclosure capabilities and enhanced privacy options.
*   **Docker-Compose Upgrade**

    We have now [Updated The docker-compose.yml definitions](link/) to reference latest versions of Inji Web and Mimoto, helping streamline environment setup, testing, and CI/CD workflows.

## User Stories Released <a href="#user-stories-released" id="user-stories-released"></a>

<table><thead><tr><th width="189.640625">Feature</th><th width="359.80859375">Description</th><th>JIRA</th></tr></thead><tbody><tr><td>Revocation of VC</td><td>Searching VC to be revoked</td><td><a href="https://mosip.atlassian.net/browse/INJICERT-1116">INJICERT-1116</a></td></tr><tr><td> </td><td>Enabling revocation through configuration using API</td><td><a href="https://mosip.atlassian.net/browse/INJICERT-1139">INJICERT-1139</a></td></tr><tr><td>Support for latest mimoto &#x26; Inji Web</td><td>Enabling docker compose setup to support latest released version of mimoto and Inji Web</td><td><a href="https://mosip.atlassian.net/browse/INJICERT-1164">INJICERT-1164</a></td></tr><tr><td>Decouple Ledger Search Table Updates from Credential Status</td><td>Enabling Ledger as a feature to use without revocation</td><td><a href="https://mosip.atlassian.net/browse/INJICERT-1173">INJICERT-1173</a></td></tr><tr><td>Enable Ledger Search</td><td>Enabling Ledger search based on id, statuslisindex and statuslistcredential</td><td><a href="https://mosip.atlassian.net/browse/INJICERT-1207">INJICERT-1207</a></td></tr><tr><td>Multiple language VC issuance</td><td>Issuing VC with multiple language based on the data present in data source</td><td><a href="https://mosip.atlassian.net/browse/INJICERT-1220">INJICERT-1220</a></td></tr><tr><td>Allowing to upload external CA certificate</td><td>Exposing key manager API through certify to upload CA certificate</td><td><a href="https://mosip.atlassian.net/browse/INJICERT-1259">INJICERT-1259</a></td></tr></tbody></table>

## Bug Fixes <a href="#bug-fixes" id="bug-fixes"></a>

Below are a few key bugs that have been addressed as part of this release. Please click [here](https://mosip.atlassian.net/jira/software/c/projects/INJICERT/issues/?jql=project%20%3D%20%22INJICERT%22%20AND%20fixVersion%20%3D%200.13.0%20AND%20type%3DBug) to learn more about the issues that have been resolved:

<table><thead><tr><th width="196.7578125">JIRA</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1162">INJICERT-1126</a></td><td>Incorrect x5c Field in JWT Header – Certificate Passed Instead of Full Trust Chain</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1180">INJICERT-1180</a></td><td>Issue while fetching VC from inji mobile with signed using RSA signature</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1183">INJICERT-1183</a></td><td>Issues in Credential config APIs</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1185">INJICERT-1185</a></td><td>Config dependency for did url is still exists</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1186">INJICERT-1186</a></td><td>VC fetch is failing for 2.0 model from docker compose</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1214">INJICERT-1214</a></td><td>Unable to decode encoded list of credentialStatus</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1217">INJICERT-1217</a></td><td>Ledger Search API supports credentialId as an optional parameter, then should be treated as null</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1218">INJICERT-1218</a></td><td>Automation scripts are using ClientID as the jti value.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1240">INJICERT-1240</a></td><td>Land regsitry usecase 2.0 model VC fetch is failing with unknown error -Query did not return a unique result: 2 results were returned</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1241">INJICERT-1241</a></td><td>Mosipid VC fetch is failing with error "IDA-MLC-007"</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1262">INJICERT-1262</a></td><td>License compliance issue-inji-certify</td></tr></tbody></table>

### Known Issues <a href="#known-issues" id="known-issues"></a>

Below is the list of known issues related to the release v0.13.0. To access all known issues related to Inji Certify please click [**here**](https://mosip.atlassian.net/issues/INJICERT-852?filter=11419\&jql=project%20%3D%20%22Inji%20Certify%22%20AND%20issuetype%20%3D%20Bug%20%20AND%20labels%20not%20in%20%28API_Automation%2C%20AWSdevicefarm%2C%20device_specific%2C%20qa-inji-UI-auto%29%20%20and%20status%20NOT%20IN%20%28Closed%2C%20Fixed%2C%20Canceled%2CCancelled%29%20%20ORDER%20BY%20created%20DESC%2C%20updated%20DESC)**.**

<table data-header-hidden><thead><tr><th width="174.8515625">JIRA</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJICERT-1265">INJICERT-1265</a></td><td>Upload ca cert for ecck1 signalgo is failing</td></tr></tbody></table>

## Repository Released

<table><thead><tr><th width="373.5859375">Repositories</th><th>Tags</th></tr></thead><tbody><tr><td>inji-certify</td><td><a href="https://github.com/mosip/inji-config/tree/v0.12.0">v0.13.0</a></td></tr><tr><td>inji-config</td><td><a href="https://github.com/mosip/inji-certify/tree/v0.13.0">v0.12.0</a></td></tr><tr><td>keymanager</td><td><a href="https://github.com/mosip/keymanager/tree/v1.3.0-beta.5">v1.3.0-beta.5</a></td></tr><tr><td>mosip-functional-tests</td><td><a href="https://github.com/mosip/mosip-functional-tests/tree/v1.3.5">v1.3.5</a></td></tr></tbody></table>

## Compatible Modules

| Modules               | Version                                                                         |
| --------------------- | ------------------------------------------------------------------------------- |
| eSignet               | [v1.6.2](https://github.com/mosip/esignet/tree/v1.6.2)                          |
| IDA                   | [1.2.1.0](https://github.com/mosip/id-authentication/tree/v1.2.1.0)             |
| Sunbird C             | [v2.0.0](https://github.com/Sunbird-RC/sunbird-rc-core/releases/tag/v2.0.0-rc3) |
| esignet-mock-services | [v0.11.2](https://github.com/mosip/esignet-mock-services/tree/v0.11.2)          |
| commons               | [v1.3.0-beta.3](https://github.com/mosip/commons/tree/v1.3.0-beta.3)            |
| keymanager            | [v1.3.0-beta.5](https://github.com/mosip/keymanager/tree/v1.3.0-beta.5)         |
| mimoto                | [v0.18.1](https://github.com/mosip/mimoto/tree/v0.18.1)                         |
| inji-web              | [v0.13.1](https://github.com/mosip/inji-web/tree/v0.13.1)                       |

## Documentation

* [Feature Documentation](https://docs.mosip.io/inji/inji-certify/functional-overview/features)
* [Local Setup](https://docs.mosip.io/inji/inji-certify/build-and-deploy/local-setup)
* [API Documentation](https://mosip.stoplight.io/docs/inji-certify/25f435617408e-inji-certify)
* [Test Report](https://docs.inji.io/inji-certify/releases/version-0.13.0/test-report)
