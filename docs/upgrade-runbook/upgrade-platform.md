# Platform Upgrade

This document outlines the necessary steps for upgrading the Platform from version 1.1.5.5-P1 to 1.2.0.1.

## Step 1: Upgrade of necessary services

1. **Postgres**:

* Check and remove the duplicate thumbprint entries in keymanager `ca_cert_store`. Refer the [document](mock-services/upgrade-db-script-error.md) to know more.
* Refer the [link](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/postgres#db-upgrade) for DB upgrade scripts to update the DB.
* Change `shareDomain` in all the relevant policies to point to latest datashare
  * Change shareDomain's value from `datashare-service` to `datashare.datashare` in the `policy_file_id` column for each partner.
* Check and rectify the partner name mismatch issue for certificate renewal. To know more, refer [here](mock-services/upgrade-partner-organization-name.md).
* Follow this [link](mock-services/upgrade-partner-certificate-expired.md) to check on the validity of the partner certificate and for renewal/ extension if required.
* Check mvel expression, id schema and document mappings and add the required applicant document mappings. Click [here](mock-services/upgrade-applicant-typemvel-scriptmigration.md) to know more.

2. **Keycloak**:

* Follow the steps mentioned [here](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/external/iam#import-init) to execute upgrade keycloak init with `import-init.yaml`.
* Verify all the existing users of admin and update the roles according to the latest role matrix. To know more about the existing users, refer [here](mock-services/upgrade-admin-services-roles-guide.md).
* In Keycloak, it is important to ensure that the VID / UIN of each operator and supervisor is collected and updated in the individualId field. Failure to do so may cause complications during the onboarding or re-onboarding processes to new or existing machines, as well as during the biometrics update process for these users.
* Manually update roles for client IDs that have been added as part of customization. For more information about the changes, please refer [here](mock-services/upgrade-changes-in-role-management.md).

3. **Activemq**:

* Clear all the objects along with topics in the activemq or deploy a fresh instance of activemq with no previous data

4. **ABIS**:

* Stop and clear all the inprogress items as it will be reprocessed freshly.
* Review the queue names and update if required (mosip-to-abis and abis-to-mosip).

5. **Manual adjudication system**:
   * Stop and clear all the in-progress items as it will be reprocessed freshly.
   * Review the queue names and update if required (mosip-to-adjudication and adjudication-to-mosip).
6. **Manual verification system**:
   * Stop and clear all in-progress items as it will be reprocessed freshly.
   * Review the queue names and update if required (mosip-to-verification and verification-to-mosip).
7. Run the data movement to the necessary three tables using the provided script. Afterward, run the migration script to re-encrypt the data and perform the movement of data from the bucket to the folder (This step is only necessary if the pre-registration has been upgraded from version 1.1.3.x). Please consult the provided [document](https://github.com/mosip/migration-utility/blob/develop/pre-reg-113-115/README.md) for detailed instructions on how to carry out the data movement process.

## Step 2: Migration of Properties

* Refer this [document](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/v3/utils/prop\_migrator/README.md) to run the property migration script.
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

* Take the latest version of the identity-mapping.json file (1.2.0.1) from `mosip-config` and update the mapping values based on the country's id schema. Please refer [here](mock-services/upgrade-identity-json-file.md) for instructions on making the necessary updates.
* Additionally, make adjustments to the `mvel` config file for the application type according to each country's specific requirements. For more details on how to modify the mvel config file, please refer [here](mock-services/upgrade-applicant-typemvel-scriptmigration.md).
* The camel routes need to be modified to accommodate the new workflow commands and ensure proper integration with external subsystems such as manual adjudication and manual verification. To understand the specific changes required, refer [here](mock-services/upgrade-camel-route-changes.md).
* Please ensure that the `mosip.regproc.packet.classifier.tagging.agegroup.ranges` property is aligned with the camel route.xml file.

## Step 3: Upgrade of MOSIP

* To begin, set up the Configuration server.
* Next, configure and setup the Artifactory.
* Proceed with the installation in the specified sequence. Refer to the provided [link](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/v3/mosip#install) for the correct order.
* Execute the `salt generation job` to generate salts for the newly created table in the regproc.
* Run the `key generation job` to ensure that all new module keys comply with the `key_policy_def` table.

**Note**: Disable the `masterdata loader` and `regproc-reprocessor`.

## Step 4: Execution of activities once all upgraded services are operational

* To resend the partner and policy details to IDA, please run the PMS utility job once. You can find the steps to run the job [here](https://github.com/mosip/migration-utility/blob/develop/pms-115-120/README.md).
* The UI specs for pre-registration should be published via the MasterData API in version 1.2.0. Previously, in version 1.1.5, the UI specs were saved in the config server. To upgrade the UI specs, please refer [here](mock-services/upgrade-prereg-ui-specifications.md).
* To proceed with the masterdata country specific upgrade scripts, please follow the instructions outlined [here](https://github.com/mosip/mosip-data/blob/1.2.0.1/mosip\_master/data\_upgrade/1.1.5.5\_to\_1.2.0.1/README.md).
* Please create all the required applicant type details according to the `applicanttype.mvel` file created in the property migration section. For more information, please refer to the document [here](mock-services/upgrade-applicant-typemvel-scriptmigration.md).
* Starting from version 1.2.0.1, it is mandatory to prepend the thumbprint for all encryptions. Therefore, we need to ensure that the certificate thumbprint for a particular partner exactly matches in both the keymanager and IDA `key_alias` tables. To learn how to check thumbprints and for further steps, please refer [here](mock-services/upgrade-handling-unequal-certificates.md).
* Please check and rectify any mixed case user names in the user details and zone mapping. For more information, refer [here](mock-services/upgrade-handling-case-insensitive-duplicates.md).
* Finally, restart all the services to take care of old data caching.

## Step 5: Carrying out activities after completion of initial round of testing

1. Configure the Registration Client upgrade at the server side. Please refer to this [link](mock-services/upgrade-registration-client.md) for further instructions.
2. Run the query to identify all the packets stuck between the stages. Use the manual reprocess utility to reprocess all the RIDs found using the above query. Please refer to this [link](mock-services/upgrade-regproc-reprocessing.md) to carry out the reprocess.
3. Initiate the regproc reprocessor.
4. In case packets continue to fail due to performance issues, follow the steps mentioned in the [document](mock-services/upgrade-non-recoverable-packets.md) to process packets from the beginning.
5. Perform the ID Repository tasks. Run the archival script and reprocess SQL script on the credential transaction table as specified in the [document](https://github.com/mosip/data-archive/tree/release-1.2.0.1/data-archive/archive-jobs/mosip\_credential#readme).
6. Backup and delete any unnecessary tables and databases.
7. Manually remove the "mosip\_regdevice" and "mosip\_authdevice" databases, as they have been moved to "mosip\_pms".
8. Delete all tables ending with "\<table\_name>\_to\_be\_deleted" and "\<table\_name>\_migr\_bkp".

### Optional Steps

1. Ensure that the datashare property is properly configured in the abis policy for the domain. Please refer to this [link](mock-services/upgrade-new-datashare-properties.md) for more detailed information.
2. Remove any unnecessary roles for clients and users.
3. When the admin portal becomes accessible, the admin user should generate the master keys that have been recently added to the `key_policy_def` table. This can be done using the admin UI master key generation page (Keymanager) for the `ADMIN_SERVICES` and `RESIDENT` roles. Only proceed with this step if the corresponding entries are not already available in the `key_alias` table of keymanager. For more detailed instructions, please consult the provided [document](https://docs.mosip.io/1.2.0/modules/administration/admin-portal-user-guide#generatemasterkey).
4. During the pre-registration upgrade process, if the encryption key is `REGISTRATION,` which is an old key, it must be updated. To update the encryption key, please refer to the migration utility process by clicking [here](https://github.com/mosip/migration-utility/blob/develop/pre-reg-113-115/README.md#migration-utility).
