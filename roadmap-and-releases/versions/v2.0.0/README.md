# v2.0.0

**Release Number:** v2.0.0\
**Release Date:** 24th Sep, 2026

### Overview

[eSignet v2.0.0](https://github.com/mosip/esignet/tree/v2.0.0) is the GA release of eSignet's Go-based authentication engine, built on the Thunder ID engine. It builds on [v1.0.1 ](https://github.com/thunder-id/thunderid/tree/v1.0.1)tagged version of thunderId engine and carries forward full feature parity with eSignet (Java) [v1.8.0](https://github.com/mosip/esignet/tree/v1.8.0), unless explicitly called out as out of scope below. As with the beta, no end-user-facing behavior has changed as part of this migration — what's changed is the engine running underneath, along with the structural improvements described below.

{% hint style="warning" %}
This release does not include the eSignet Signup module. eKYC and Identity Assurance 1.0 capabilities remain on the Java-based Signup module for now and have not yet been migrated to Go.
{% endhint %}

***

### Major Highlights

#### 1. Go-Based Core Engine

eSignet's authentication engine has been rebuilt on **Go**, using the [**Thunder ID engine**](https://github.com/thunder-id/thunderid/tree/v1.0.1) — a Go-based identity provider engine from WSO2. This is the foundational change behind this release and everything else below builds on it.

#### 2. Flow-Graph Driven Authentication

The Go version renders every login and consent screen from a declarative flow graph rather than dynamic UI spec based rendering.&#x20;

#### 3. Feature Parity with eSignet v1.8.0

All eSignet features present in the latest Java release ([**v1.8.0**](https://github.com/mosip/esignet/tree/v1.8.0)) are carried forward in this Go-based release at full parity, except where explicitly listed as out of scope below. Authentication flows and standards compliance are unchanged for end users and integrators. The eSignet UI itself has seen only minimal, deliberate adjustments in this release — made specifically to keep the end-user login and consent experience unhindered and consistent with what users already know.

#### 4. Performance and Scalability

Performance testing for this release is complete: the Go-based engine delivers better throughput than the Java version at similar or lower resource usage. Please refer the full [performance report](performance-report.md).

#### 5. New eSignet (Go) Documentation

A complete documentation set for the Go-based eSignet is now available, covering architecture, the developer guide, relying party onboarding, and end-to-end integration. See [Documentation](./#documentation) below.

#### 6. Reference Plugin Implementations Retained

eSignet continues to support three reference identity-backend plugin implementations: **Mock** (for local development and testing), **MOSIP** (IDA integration), and **Sunbird** (Registered Claims registry) — all carried forward unchanged from the Java version.

***

### Breaking Changes

#### Relying Party Public Keys Must Include a kid

Relying party public keys shared during onboarding must now include a kid (Key ID) field in the JWK. **This is a breaking change**: relying parties onboarded under the Java-based eSignet must update their registered public key to include a kid before upgrading, or authentication requests will fail.

#### Authenticator Plugin Interface Replaced

The Java-based Authenticator Plugin interface has been replaced by a new authnprovider interface for integrating with identity systems in the Go version. Anyone who built a custom authenticator plugin against the Java interface will need to migrate it to the new interface. Please refer [here](https://github.com/mosip/esignet/blob/v2.0.0/docs/authn-provider-integration.md).

***

### Tech Upgrades and Key Changes

#### Audit Plugin Reimplemented in Go

The audit plugin has been reimplemented in Go alongside the rest of the engine.Please refer [here](https://github.com/mosip/esignet/blob/v2.0.0/docs/audit-plugin-integration.md).

#### Deployment Scripts and Guide Updated

Deployment scripts have been updated for the Go-based eSignet, and the deployment guide has been updated to match. Please refer [here](../../../build-and-deploy/on-prem-deployment-guide.md).

#### Local Setup via Docker Compose Retained

The Docker Compose-based local setup is retained from the Java version, so developers can continue bringing up eSignet and its dependencies on their own machine the same way as before. Please refer [here](../../../local-deployment/local-setup/).

#### Migration Handbook Available

A handbook covering the upgrade path from the Java-based eSignet to the Go version is now available. Please refer [here](https://github.com/mosip/esignet/blob/v2.0.0/docs/upgrade-1.8.0-to-2.0.0.md).

***

### Out of Scope

The following remain **not supported** in this release:

* **WLA (Wallet-based Login Authentication)** — login using a wallet (e.g. via the INJI Wallet) is not supported in this release.
* **Client management endpoint support for title and subtitle fields** during relying party (RP) onboarding is not supported in this release.
* **Database support is limited to PostgreSQL only** in this release; no other database backends are supported at this time.

***

### Story Development

Please [refer here](https://github.com/orgs/mosip/projects/22/views/6?filterQuery=milestone%3AeSignet_v2.0.0%2CeSignet_thunder_2.0.0_beta.1+and+type%3AFeature) for the full list of stories implemented for this release.

### Known Issues

Please [refer here](https://github.com/mosip/esignet/issues?q=label%3Aknown_issue%20state%3Aopen) for the full list of known issues in this release.

### Repositories Released

| Repository            | Version/Tag                                                            |
| --------------------- | ---------------------------------------------------------------------- |
| eSignet               | [v2.0.0](https://github.com/mosip/esignet/tree/v2.0.0)                 |
| eSignet-mock-services | [v0.14.0](https://github.com/mosip/esignet-mock-services/tree/v0.14.0) |

***

### Compatible Modules

#### eSignet compatibility with MOSIP

| Module/Repo | Compatible Version                                                            |
| ----------- | ----------------------------------------------------------------------------- |
| PMS         | [1.2.2.3](https://github.com/mosip/partner-management-services/tree/v1.2.2.3) |
| IDA         | [1.3.0](https://github.com/mosip/id-authentication/tree/v1.3.0)               |

#### eSignet compatibility with Sunbird

| Module/Repo | Compatible Version                                                          |
| ----------- | --------------------------------------------------------------------------- |
| Sunbird     | [v2.0.0-rc3](https://github.com/Sunbird-RC/sunbird-rc-core/tree/v2.0.0-rc3) |

***

### DB Changes

**eSignet**

* Please refer the [link here](https://github.com/mosip/esignet/blob/release-2.0.x/db_upgrade_script/mosip_esignet/sql/1.8.0_to_2.0.0_upgrade.sql) for the DB upgrade script
* Please refer the [link here](https://github.com/mosip/esignet/blob/release-2.0.x/db_upgrade_script/mosip_esignet/sql/1.8.0_to_2.0.0_rollback.sql) for the DB rollback script

***

### Configuration Changes

For a comprehensive view of all configuration properties in eSignet (Go) please [refer here](https://github.com/mosip/esignet/blob/release-2.0.x/esignet-service/.env.example).

***

### Documentation

#### API Documentation

* [eSignet v2.0.0 API](https://github.com/mosip/esignet/blob/release-2.0.x/docs/esignet-openapi.yaml)

#### eSignet Documentation

* [eSignet v2.0.0 ](../../../)

#### QA Report

* [Test report](test-report.md)

#### Performance Report

* [Performance report](performance-report.md)

