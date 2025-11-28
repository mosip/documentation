# Version 0.13.0

**Release Version** 0.13.0

**Release Type**: Developer Release

**Release Date**: Coming Soon

## Overview

Inji Certify v0.13.0 introduces major advances in credential issuance and lifecycle management and this includes the following:

* A full implementation of the [Revocation Flow](../../overview/features.md#10-ledger-for-issued-verifiable-credentials) enabling issuers to mark credentials as revoked and track them with a ledger.

* Support to '[Upload Externally-signed CA Certificates](../../overview/features.md#11-vc-signing-with-external-ca-signed-certificates)' into the key-management workflow, allowing organizations to use their own PKI for signing credentials.

* Full implementation of the [SD-JWT - Selective Disclosure JWT](link) issuance feature.

* Updated Docker-Compose support that aligns with the latest versions of the associated modules (Inji Web & Mimoto).

## Major Highlights & Features

### Revocation Implementation
The [Revocation feature](../../overview/features.md#7-revocation-mechanism-draft-release--experimental-json-ld-only) is now fully functional, issuers can revoke VCs, and the ledger can be configured for indexing to support efficient search for revocation lookup.

### Externally Signed Certificate Upload
Organizations can now integrate their own PKI by uploading [externally signed CA certificates](../../overview/features.md#11-vc-signing-with-external-ca-signed-certificates) into Inji Certify's Key Manager.

New APIs allow the following steps:
* Generate a CSR via the generateCSR endpoint.
* Upload the CA certificate via the upload-ca-certificate endpoint.
* Upload the signed certificate via the uploadCertificate endpoint.
* Once configured, the system’s key manager uses these externally signed certificates to generate keys and sign VCs.

### SD-JWT Implementation
You can now Issue Credentials in [SD-JWT - Selective Disclosure JWT](link) format, offering issuers selective disclosure capabilities and enhanced privacy options.

### Docker-Compose Upgrade
WSe have now [Updated The docker-compose.yml definitions](link) to reference latest versions of Inji Web and Mimoto, helping streamline environment setup, testing, and CI/CD workflows.


User Stories Released

-->