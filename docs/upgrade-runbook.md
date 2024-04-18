# 🈴 Upgrade Runbook

MOSIP has recently announced the release of its latest version, [1.2.0.1](https://docs.mosip.io/1.2.0/releases/release-notes-1.2.0.1). This new release brings about an architectural upgrade and addresses multiple bugs. To assist users in migrating from the MOSIP version 1.1.5.x to the latest version 1.2.0.1, a detailed Runbook has been provided, offering comprehensive guidance.

To set up the new environment and deploy the upgraded version of MOSIP, carefully follow the procedures outlined below step-by-step.

## Points to Consider

* The migration will only be supported if the latest version deployed is 1.1.5.x (mostly 1.1.5.5-P1 and above). Countries should ensure that MOSIP is updated to version 1.1.5.x before migrating to the newer version.
* Once the upgrade is completed, all the modules running on the server will be upgraded together.
* The IDA Database will not have any entries from version 1.1.4.
* Migration of websub event is not supported for countries transitioning from `db-based` websub to `kafka-based` websub.
* After migration, if a new machine is added for the Registration Client, it must be installed with the latest version of the Registration Client. We will not provide support for the old version.
* Partners who decrypt data encrypted by the key manager will support decryption with thumbprint support after upgrading to version 1.2.0.1. Therefore, backward support to encrypt without thumbprint is not available.
* Prior to migration, countries should prioritize packets stuck in between stages using the registration processor and complete the processing.
* Any third-party subsystems such as Manual adjudication/ABIS will not respond after migration for a request received before migration. Therefore, it is suggested that all subsystems, such as ABIS and manual adjudication, consume all the messages from ActiveMQ, complete the processing, mark all for reprocess, and respond back to registration processor before migration.
* Default resource allocation (CPU and memory) has been added to all the pods in version 1.2.0.1, so additional nodes may be required after the upgrade.
* The rollback process during the migration needs to be handled by the respective system integrators (SI).
* All the server services and registration clients will be running version 1.1.5.x.
* Registration packets available in MinIO and the landing zone can be version 1.1.4.x / 1.1.5.x.
* Existing Grafana and Kibana reports from version 1.1.5 are not required to be viewable in the upgraded environment.
* If there are additional attributes in the data share for manual adjudication, the manual adjudication system will ignore them and not fail.
* The first global admin user login does not need to be handled during the upgrade.
* Out of scope for migration:
  * Configuration of correction flow and related changes are not included in this migration.
  * Anonymous profiles for existing data are not handled in this upgrade.
  * Support for the Lost RID/AID search feature for packets synced before the migration is out of scope.

## Upgrade Process

This comprehensive upgrade process entails the deployment architecture upgrade from V2 to V3, as well as the MOSIP platform upgrade from version 1.1.5.5-P1 to 1.2.0.1. The various tasks involved in this process are organized into the following categories.

#### Upgrade of Deployment Architecture from V2 to V3

1. Installation and configuration of new environment with V3 architecture.
2. Deployment of external services.
3. Backup and restoration of external services.

#### Upgrade of Platform from version 1.1.5.5-P1 to 1.2.0.1

1. Upgrade of necessary external services.
2. Migration of properties.
3. Upgrade of MOSIP services.
4. Execution of activities once all upgraded services are operational.
5. Carrying out activities after completion of initial round of testing.

Let us go through the processes discussed above in detail.



<table data-view="cards"><thead><tr><th></th><th></th><th></th><th data-hidden data-card-cover data-type="files"></th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td></td><td></td><td></td><td><a href=".gitbook/assets/dau.png">dau.png</a></td><td><a href="upgrade-deployment-architecture.md">upgrade-deployment-architecture.md</a></td></tr><tr><td></td><td></td><td></td><td><a href=".gitbook/assets/pa.png">pa.png</a></td><td><a href="upgrade-platform.md">upgrade-platform.md</a></td></tr><tr><td></td><td></td><td></td><td><a href=".gitbook/assets/ai.png">ai.png</a></td><td><a href="upgrade-runbook/mock-services/">mock-services</a></td></tr></tbody></table>

