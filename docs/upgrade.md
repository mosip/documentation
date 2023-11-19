# Upgrade Runbook

MOSIP has recently launched a new version, 1.2.0.1. This release features an architectural upgrade and resolves several bugs. The QA run book provides comprehensive guidance for users to migrate from the current version of MOSIP (1.1.5.x) to the latest version (1.2.0.1). 

To set up the new environment and deploy the upgraded version of MOSIP, carefully follow the procedures outlined below step-by-step.

## Points to Consider
- The migration will only be supported if the latest version deployed is 1.1.5.x (mostly 1.1.5.5-P1 and above). Countries should ensure that MOSIP is updated to version 1.1.5.x before migrating to the newer version.
- Once the upgrade is completed, all the modules running on the server will be upgraded together.
- The IDA Database will not have any entries from version 1.1.4.
- Migration of websub event is not supported for countries transitioning from `db-based` websub to `kafka-based` websub.
- After migration, if a new machine is added for the Registration Client, it must be installed with the latest version of the Registration Client. We will not provide support for the old version.
- Partners who decrypt data encrypted by the key manager will support decryption with thumbprint support after upgrading to version 1.2.0.1. Therefore, backward support to encrypt without thumbprint is not available.
- Prior to migration, countries should prioritize packets stuck in between stages using the reprocessor and complete the processing.
- Any third-party subsystems such as Manual adjudication/ABIS will not respond after migration for a request received before migration. Therefore, it is suggested that all subsystems, such as ABIS and manual adjudication, consume all the messages from ActiveMQ, complete the processing, mark all for reprocess, and respond back to regproc before migration.
- Default resource allocation (CPU and memory) has been added to all the pods in version 1.2.0.1, so additional nodes may be required after the upgrade.
- The rollback process during the migration needs to be handled by the respective system integrators (SI).
- All the server services and registration clients will be running version 1.1.5.x.
- Registration packets available in minIO and the landing zone can be version 1.1.4.x / 1.1.5.x.
- Existing Grafana and Kibana reports from version 1.1.5 are not required to be viewable in the upgraded environment.
- If there are additional attributes in the data share for manual adjudication, the manual adjudication system will ignore them and not fail.
- The first global admin user login does not need to be handled during the upgrade.
- Default resource allocation (CPU and memory) has been added to all the pods in version 1.2.0.1, so additional nodes may be required after the upgrade.
- Out of scope for the migration:
    - Configuration of correction flow and related changes are not included in this migration.
    - Anonymous profiles for existing data are handled in this upgrade.
    - Support for the Lost RID/AID search feature for packets synced before the migration is out of scope.
 
  
## Upgrade Process

This comprehensive upgrade process entails the deployment architecture upgrade from V2 to V3, as well as the MOSIP platform upgrade from version 1.1.5.5-P1 to 1.2.0.1. The various tasks involved in this process are organized into the following categories.

#### Upgrade of deployment architecture from V2 to V3

1. Installation and configuration of new environment with V3 architecture.

2. Deployment of external services.

3. Backup and restoration of external services.

#### Upgrade of platform from version 1.1.5.5-P1 to 1.2.0.1

1. Upgrade of necessary external services.

2. Migration of properties.

3. Upgrade of MOSIP services.
   
4. Execution of activities once all upgraded services are operational.

5. Carrying out activities after completion of initial round of testing.

Let us go through the processes discussed above in detail.

### New environment setup with V3 architecture 

This is required for migration from V2 to V3 architecture

1. Make sure to have all the pre-requisites ready as per the details present in the section [pre-requisites](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#pre-requisites)

2. Setup Wireguard [Bastion host](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#wireguard)

3. Setup wireguard client in your local and complete the [configuration](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#setup-wireguard-client-in-your-pc)

4. Setup [Observation K8 cluster](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#observation-k8s-cluster-setup-and-configuration)

5. Configure [Observation k8 cluster](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#observation-k8s-cluster-ingress-and-storage-class-setup)

6. Observation cluster’s [nginx setup](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#setting-up-nginx-server-for-observation-k8s-cluster)

7. Observation cluster [applications setup](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#observation-k8s-cluster-apps-installation)

8. Observation cluster [keycloak-rancher integration](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#keycloak-rancher-ui-integration)

9. Setup new [MOSIP k8 cluster](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#mosip-k8s-cluster-setup)

10. MOSIP k8 cluster [configuration](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#mosip-k8-cluster-global-configmap-ingress-and-storage-class-setup)

11. MOSIP cluster [nginx setup](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#mosip-k8-cluster-nginx-server-setup)

12. Setting up [Monitoring](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#monitoring-module-deployment) for MOSIP cluster

13. Setting up [Alerting](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#alerting-setup) for MOSIP cluster

14. Setting up [Logging](https://docs.mosip.io/1.2.0/deploymentnew/v3-installation/on-prem-installation-guidelines#logging-module-setup-and-installation) for MOSIP cluster

### External services deployment  
(Required for V2 to V3 architecture migration)

Setup postgres server
Note: 1. Please deploy postgres server in a seperate node. 
            2. Make sure postgres initialisation is not done. Only install postgres.

Setup Keycloak server
Note: Make sure keycloak initialisation is not done. Only install keycloak.

Setup Softhsm

Setup Minio server

Setup ClamAV

Setup ActiveMQ

Setup Message Gateway

Setup docker registry secrets if using private dockers
Note: You need these only if you are accessing Private Docker Registries. Skip if all your dockers are downloaded from public Docker Hub.

Setup Captcha for required domains

Setup Landing page for new MOSIP cluster
