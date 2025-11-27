# Version 0.13.0

<!--
Version 0.13.0

Release Version: v0.13.0

Release Type: Developer Release

Release Date: Coming Soon

## Overview

Inji Certify v0.13.0 introduces major advances in credential issuance and lifecycle management, This includes:

* A full implementation of the Revocation flow enabling issuers to mark credentials as revoked and track them with a ledger.

* Support to upload externally-signed CA certificates into the key-management workflow, allowing organizations to use their own PKI for signing credentials.

* Full implementation of the SD-JWT (Selective Disclosure JWT) issuance feature.

* Updated Docker-Compose support that aligns with the latest versions of the associated modules (Inji Web & Mimoto).

## Major Highlights & Features

### Revocation Implementation
The revocation feature is now fully functional, issuers can revoke VCs, and the ledger can be configured for indexing to support efficient search for revocation lookup. Please refer to [this link](link) to know more about this feature [link to feature page](link)

### Externally Signed Certificate Upload
New APIs allow the following steps:
* Generate a CSR via the generateCSR endpoint.
* Upload the CA certificate via the upload-ca-certificate endpoint.
* Upload the signed certificate via the uploadCertificate endpoint.
* Once configured, the system’s key manager uses these externally signed certificates to generate keys and sign VCs.

Click here to know more about this feature [link to feature page](link)

### SD-JWT Implementation
Credentials can now be issued in SD-JWT format , offering issuers selective disclosure capabilities and enhanced privacy options.

Click [here](link) to know more about this 

### Docker-Compose Upgrade
The docker-compose.yml definitions have been updated to reference latest versions of Inji Web and Mimoto, helping streamline environment setup, testing, and CI/CD workflows.

Refer [here](link) to know more about it [Github link for docker document](link)

User Stories Released



-->