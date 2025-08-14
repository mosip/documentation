# Version 0.13.1

**Release Name**: Inji Verify v0.13.1

**Support**: Developer Release

**Release Date**: Coming Soon

### Overview

The Inji Verify 0.13.1 patch release includes critical fixes to ensure smooth deployment and prevent issues encountered in version 0.13.0.

### Key Updates:

**1. Database Upgrade Script Fix:** 
* In version 0.13.0, the db_upgrade script was missing the table creation script verify-vc_submission.sql.This caused the Inji Verify service to fail when upgrading from version 0.12.3 (which already had the database set up), as the required table was not created.
* The previous workaround (in 0.13.0) required manually running verify-vc_submission.sql from db_scripts.
* **Fix**: This patch release now includes the missing script in db_scripts, ensuring the table is created automatically during upgrades.

**2. Configuration Update:** 
* Updates have been made to mimoto-trusted-verifiers.json to support redirect calls from InjiWeb during online Verifiable Credential (VC) sharing.

**Note:** We recommend upgrading directly to Inji Verify v0.13.1 instead of using v0.13.0.
 If you continue using v0.13.0, you must manually run verify-vc_submission.sql from db_scripts to create the required table.


### Repositories: Released/Dependent

| Repositories        | Tags: Released/Dependent                                     |
| ------------------- | ------------------------------------------------------------ |
| Inji Verify         | v0.13.1 |

### Projects: Released

Inji Verify Repositories: 4 projects (all these projects are of same version) as below:

1. inji-verify-service - [0.13.1 Inji Verify service](https://github.com/mosip/inji-verify/tree/release-0.13.x/verify-service)
2. inji-verify-ui (ref implementation) - [https://github.com/mosip/inji-verify/tree/release-0.13.x/verify-ui](https://github.com/mosip/inji-verify/tree/release-0.13.x/verify-ui)
3. SDK - [https://github.com/mosip/inji-verify/tree/release-0.13.x/inji-verify-sdk](https://github.com/mosip/inji-verify/tree/release-0.13.x/inji-verify-sdk)
4. API-Test - [https://github.com/mosip/inji-verify/tree/release-0.13.x/api-test](https://github.com/mosip/inji-verify/tree/release-0.13.x/api-test)

### Compatible modules

The following table outlines the tested and certified compatibility of Inji Verify 0.13.1 with other modules.

<table><thead><tr><th width="228.04827880859375">Module</th><th>Version</th></tr></thead><tbody><tr><td>Inji Mobile Wallet</td><td><a href="https://github.com/mosip/inji-wallet/tree/v0.17.0">0.17.0</a></td></tr><tr><td>Inji Web Wallet</td><td><a href="https://github.com/mosip/inji-web/tree/v0.12.0">0.12.0</a></td></tr><tr><td>Pixel-Pass library</td><td><a href="https://github.com/mosip/pixelpass/tree/v0.6.0">v0.6.0</a></td></tr><tr><td>vc-verifier library</td><td><a href="https://github.com/mosip/vc-verifier/tree/v1.3.0">v1.3.0</a></td></tr></tbody></table>

### Release Scope

Please refer to the list of items covered as part of [0.13.1](https://mosip.atlassian.net/issues/?filter=11694&jql=project%20%3D%20%22Inji%20Verify%22%20AND%20issuetype%20in%20%28Story%2C%20Task%2C%20Bug%29%20and%20fixversion%3D0.13.1) patch release.

### Bug Fixes

Below is the list of fixes as part of the 0.13.1 release:

<table><thead><tr><th width="222.41973876953125">Jira ID</th><th>Description</th></tr></thead><tbody><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1255">INJIVER-1255</a></td><td>The db_upgrade script for version 0.13.0 is missing the table creation script verify-vc_submission.sql. As a result, when upgrading from version 0.12.3 (which already had the database setup), the required table was not created, causing the inji-verify service to fail.</td></tr><tr><td><a href="https://mosip.atlassian.net/browse/INJIVER-1271">INJIVER-1271</a></td><td>VP Verification was failing for MOSIP National ID VC as there was a case-sensitive mismatch in “type” of config.json.</td></tr></tbody></table>

### Documentation

* [Feature documentation](../../overview/features.md)
* [Integration Guide](../../../inji-wallet/inji-mobile/technical-overview/integration-guide/openid4vp.md)
* [API Documentation](https://mosip.stoplight.io/studio/inji-verify)
* [Collab Guide](../../functional-overview/releases-1/inji-verify-collab-guide.md)
* [QA Report](test-report.md)
