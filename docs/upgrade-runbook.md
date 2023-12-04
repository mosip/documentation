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

### New environment setup with V3 Architecture 

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

1. Setup [postgres server](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/postgres/README.md)

   **Note**:
   
   i. Deploy postgres server in a seperate node.
   
   ii. Make sure postgres initialisation is not done (only install postgres).

3. Setup [Keycloak server](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/iam#install)

   **Note**: Make sure keycloak initialisation is not done (only install keycloak).

4. Setup [Softhsm](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/hsm/softhsm/README.md#install)

5. Setup [Minio server](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/object-store/minio/README.md#helm-chart-based-install)

6. Setup [ClamAV](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/antivirus/clamav/README.md#install)

7. Setup [ActiveMQ](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/activemq/README.md#install)

8. Setup [Message Gateway](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/msg-gateway/README.md#email-and-sms-gateways)

9. Setup docker [registry secrets](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/docker-secrets/README.md) if you are using private dockers.

   **Note**: These instructions are only applicable if you need to access Private Docker Registries. You may disregard them if all of your Docker containers are downloaded from the public Docker Hub.

10. Setup [Captcha](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/captcha/README.md#install) for the required domains.

11. Setup [Landing page](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/external/landing-page/README.md#install) for new MOSIP cluster.

### External services backup and restore

(Required for V2 to V3 architecture migration)

1. Softhsm (only required if softhsm is used instead of real HSM)

   i. [Backup keys](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/hsm/softhsm#backup)

   ii. [Restore old key](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/hsm/softhsm#restore) 

   iii. Update softhsm ida and softhsm kernel security pin

2. Postgres 

   i. [Export](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/postgres#db-export) 

   ii. [Import](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/postgres#db-import)

   iii. secret creation

   iv. Increase postgres `max_connections` to 1000

3. Keycloak 

   i. [Export](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/iam#export)

   ii. [Import](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/iam#import)

4. Minio 

   i. Export the existing Minio as directory

   ii. [Clone Minio](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/object-store/minio#minio-clone)

5. Kafka  

   i. setup external minio for backup.  

   ii. backup kafka  

   iii. restore kafka 

6. Conf-secrets 

Update the secrets in existing secrets in (conf-secrets namspace)[https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/mosip/conf-secrets#secrets-to-be-updated-for-migartion-scenerios].

7. Packets in landing to be copied from old environment to the upgraded environment or same NFS folder can be mounted to regproc packet server and group 1 stage groups. Refer [here](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/mosip/regproc/upgrade) for more details.

 * dmz-sc.yaml

 * dmz-pkt-pv.yaml

 * dmz-pkt-pvc.yaml

 * dmz-landing-pv.yaml

 * dmz-landing-pvc.yaml

### Upgrade of required external services  

1. **Postgres**: 

  * Check and remove the duplicate thumbprint entries in keymanager ca_cert_store
     
  * Refer the [link]() for DB upgrade scripts to update the DB  

  * Change `shareDomain` in all the relevant policies to point to latest datashare

      * Change shareDomain's  value from `datashare-service` to `datashare.datashare` in the `policy_file_id` column for each partner.

  * Check and rectify the partner name mismatch issue for certificate renewal

  * Check mvel expression, id schema and document mappings and add the required applicant document mappings

2. **Keycloak**: 

  * Follow the steps mentioned [here]() to execute upgrade keycloak init with `import-init.yaml`.

  * Verify all the existing users of admin and update the roles according to the latest role matrix. To know more about the existing users, refer [here]().

  * In Keycloak, it is important to ensure that the VID / UIN of each operator and supervisor is collected and updated in the individualId field. Failure to do so may cause complications during the onboarding or re-onboarding processes to new or existing machines, as well as during the biometrics update process for these users.

  * Manually update roles for client IDs that have been added as part of customization. For more information about the changes, please refer [here]().

3. **Activemq**: 

  * Clear all the objects along with topics in the activemq or deploy a fresh instance of activemq with no previous data

4. **ABIS**: 

  * Stop and clear all the inprogres items as it will be reprocessed freshly    

  * Review the queue names and update if required (mosip-to-abis and abis-to-mosip)

5. **Manual adjudication system**: 

   * Stop and clear all the inprogres items as it will be reprocessed freshly  

   * Review the queue names and update if required (mosip-to-adjudication and adjudication-to-mosip) 

6. **Manual verification system**: 

   * Stop and clear all the inprogres items as it will be reprocessed freshly  

   * Review the queue names and update if required (mosip-to-verification and verification-to-mosip)
     
7. Run the data movement to the necessary three tables using the provided script. Afterward, run the migration script to re-encrypt the data and perform the movement of data from the bucket to the folder (This step is only necessary if the pre-registration has been upgraded from version 1.1.3.x). Please consult the provided [document]() for detailed instructions on how to carry out the data movement process.

### Property migration  

* Refer this document to run the property migration script

* Update `registration-processor-default.properties` reprocess elapse time to a larger time to avoid reprocessing before migration is fully complete (registration.processor.reprocess.elapse.time=315360000).

* Add the below properties to `syncdata-default.properties` file if reg-client versions 1.1.5.4 and below are to be supported additionally.

```
#Properties needed for 1.1.5.4 and previous version reg-client compatibility (Tag mismatch error)
mosip.kernel.client.crypto.iv-length=16
mosip.kernel.client.crypto.aad-length=12
```

* Configuration property files required to be updated for language specific deployments. Please follow the below snippet. 

**Note**: Ensure that the transliteration line is not commented out, even for a single language.

```
## Transliteration
mosip.kernel.transliteration.arabic-language-code=ara
mosip.kernel.transliteration.english-language-code=eng
# Added this property for backward compatibility as it is misspelled in <1.2.0 versions of kernel-transliteration library
mosip.kernel.transliteration.franch-language-code=fra
```

* Take the latest version of the identity-mapping.json file (1.2.0.1) from `mosip-config` and update the mapping values based on the country's id schema. Please refer [here]() for instructions on making the necessary updates.

* Additionally, make adjustments to the `mvel` config file for the application type according to each country's specific requirements. For more details on how to modify the mvel config file, please refer [here]().

* The camel routes need to be modified to accommodate the new workflow commands and ensure proper integration with external subsystems such as manual adjudication and manual verification. To understand the specific changes required, refer [here]().

* Please ensure that the mosip.regproc.packet.classifier.tagging.agegroup.ranges property is aligned with the camel route.xml file.

### MOSIP services upgrade

* To begin, set up the Configuration server.

* Next, configure and setup the Artifactory.

* Proceed with the installation in the specified sequence. Refer to the provided [link](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/mosip#install) for the correct order.

* Execute the `salt generation job` to generate salts for the newly created table in the regproc.

* Run the `key generation job` to ensure that all new module keys comply with the `key_policy_def` table.

**Note**: Disable the `masterdata loader` and `regproc-reprocessor`.

### Activities once all the upgraded services are operational

* To resend the partner and policy details to IDA, please run the PMS utility job once. You can find the steps to run the job [here]()..

* The UI specs for pre-registration should be published via the MasterData API in version 1.2.0. Previously, in version 1.1.5, the UI specs were saved in the config server. To upgrade the UI specs, please refer [here]().

* To proceed with the masterdata country specific upgrade scripts, please follow the instructions outlined [here]().

* Please create all the required applicant type details according to the `applicanttype.mvel` file created in the property migration section. For more information, please refer to the document [here]().

* Starting from version 1.2.0.1, it is mandatory to prepend the thumbprint for all encryptions. Therefore, we need to ensure that the certificate thumbprint for a particular partner exactly matches in both the keymanager and IDA `key_alias` tables. To learn how to check thumbprints and for further steps, please refer [here]().

* Please check and rectify any mixed case user names in the user details and zone mapping.

* Finally, restart all the services to take care of old data caching.

### Activities after completing the first round of testing:

1. Configure the Registration client upgrade at the server side. Please refer to this [link]() for further instructions.

2. Run the query to identify all the packets stuck between the stages. Use the manual reprocess utility to reprocess all the RIDs found using the above query. Please refer to this [link]() to carry out the reprocess.

3. Initiate the regproc reprocessor.

4. In case packets continue to fail due to performance issues, follow the steps mentioned in the [document]() to process packets from the beginning.

5. Perform the ID repository tasks. Run the archival script and reprocess SQL script on the credential transaction table as specified in the document.

6. Backup and delete any unnecessary tables and databases.

7. Manually remove the "mosip_regdevice" and "mosip_authdevice" databases, as they have been moved to "mosip_pms".

8. Delete all tables ending with "<table_name>_to_be_deleted" and "<table_name>_migr_bkp".

### Optional Steps

1. Ensure that the datashare property is properly configured in the abis policy for the domain. Please refer to this [link]() for more detailed information.

2. Remove any unnecessary roles for clients and users.

3. When the admin portal becomes accessible, the admin user should generate the master keys that have been recently added to the `key_policy_def` table. This can be done using the admin UI master key generation page (Keymanager) for the `ADMIN_SERVICES` and `RESIDENT` roles. Only proceed with this step if the corresponding entries are not already available in the `key_alias` table of keymanager. For more detailed instructions, please consult the provided [document]().
