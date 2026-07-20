# Upgrade Runbook 1.2.1.0

## Overview

MOSIP version 1.2.1.0 (Platform version) has been released with significant improvements, including a Java version upgrade, performance optimizations, and critical bug fixes. This runbook provides comprehensive guidance for migrating your existing MOSIP implementation from version 1.2.0.1 to 1.2.1.0 (Platform version).

## Intended Audience

This runbook is designed for countries, system integrators, and organizations currently running MOSIP version 1.2.0.1 who wish to upgrade to the latest version of the MOSIP Identity Platform i.e [1.2.1.0.](https://github.com/mosip/documentation/blob/1.2.0/docs/setup/upgrade/adopting-lts-1.2.0/link/README.md)

## What This Guide Covers

This document provides step-by-step instructions to help you:

* Prepare your environment for the upgrade
* Update database schemas and configurations
* Modify deployment scripts
* Upgrade dependencies
* Deploy upgraded MOSIP components safely and efficiently

Following these procedures ensures a smooth transition from version 1.2.0.1 to 1.2.1.0 with minimal disruption to your operations.

## Pre-Upgrade Checklist

* Base version of MOSIP platform should be 1.2.0.1. If the base version is older than 1.2.0.1 (For example MOSIP version 1.1.5.5 is installed), Please make sure to migrate to 1.2.0.1 by following guidance mentioned in [this run book](https://docs.mosip.io/1.2.0/setup/upgrade/adopting-lts-1.2.0/upgrade-runbook). You can refer to [MOSIP Versioning Principle](https://github.com/mosip/documentation/blob/1.2.0/docs/setup/upgrade/adopting-lts-1.2.0/link/README.md) to understand how does platform versioning and repository versioning works and follow different schemes.
* In case of customizations, the customized code must be updated and merged with the upgraded platform code. Refer to this [runbook](https://docs.mosip.io/1.2.0/setup/upgrade/java-21-migration-guide) as a guide for migrating from Java 11 to Java 21.

## Upgrade Procedure

### Environment Preparation

* Switch environment to maintenance mode (If applicable).
  * Notification to be provided to all the users on the downtime.
* Uninstall all MOSIP services using `delete.sh` or individual helm delete command.
  * Secrets and configmaps used from external services need to be backed up. (e.g. postgres, minio, hsm etc).
  * Take backup of secrets and configmaps available in **config-server** and other **namespace**.
  * Delete scripts should be run from individual [helm repo](https://github.com/mosip/mosip-infra/tree/v1.2.0.2/deployment/v3/mosip).
* Take backup of the required services (as listed below) for any restore:
  * Postgress
    * [Refer](https://github.com/mosip/mosip-infra/tree/release-1.2.1.x/deployment/v3/external/postgres#db-export)
      * Make sure to backup all the schema along with roles , users and password.
  * [SoftHSM](https://github.com/mosip/mosip-infra/tree/release-1.2.1.x/deployment/v3/external/hsm/softhsm#backup-softhsm) (this applies only to sandbox or testing environment upgrades and must not be used in production. For RealHSM, the upgrade process should be guided by the HSM administrator or the vendor.)
  * [minio](https://github.com/mosip/mosip-infra/tree/release-1.2.1.x/deployment/v3/external/object-store/minio)

### **Upgrade Sequence**

{% hint style="danger" %}
**Important**: Follow this sequence strictly.
{% endhint %}

* **Step 1**: **Upgrade of External Services**
  * Postgres server Upgrade
  * Minio Upgrade.
  * ActiveMQ Upgrade: delete and redeploy
* **Step 2**: Adding additional definitions to **keycloak**
* **Step 3**: DB schema Upgrade
* **Step 4**: Config Migrator Run
* **Step 5**: Skip redeployment of certain MOSIP services/batch jobs
* **Step 6: Deployment of additional artifcatory instance**
* Step 7: Deploy MOSIP services using relevant helm charts
* Step 8: Post-upgrade verification

Follow the detailed instructions provided for each steps to complete the upgrade process as below:

### Step 1: Upgrade of External Services

{% hint style="success" %}
* Platform v1.2.1.0 is tested and certified with Postgres 16. It should also work with both Postgres 15 as there is no intentional breaking changes. If you are skipping this then, recommended to test completely before moving the changes to production.
* Decision of upgrading postgres from existing version to latest version is fairly dependent on the SI and DBA’s advice.
* As part of our ref-impl v1.2.0.1 we were using postgres 15 and we upgrade to postgres 16 as part of v1.2.1.0.
{% endhint %}

#### **Upgrade postgres 15 to postgres 16**

* Refer to the provided commands below for installing postgres 16
  * Installation & Checks
  * ```
    sudo apt update
    sudo apt install postgresql-16 postgresql-contrib-16
    sudo pg_lsclusters
    psql --version
    dpkg -l | grep postgresql
    sudo pg_lsclusters
    sudo systemctl status postgresql
    sudo pg_lsclusters​
    ```

If an upgrade is planned, refer to the official documentation recommended by the SI/DBA. The following steps are applicable only to the sandbox/testing environment:

* Troubleshooting:
  * Upgrade Attempt
  * ```
    sudo pg_upgradecluster 15 main
    ```
  * Status & bin directory checks
  * ```
    sudo -u postgres psql -c "SELECT version();"
    sudo systemctl stop postgresql || true
    sudo pg_ctlcluster 16 main stop 
    sudo pg_ctlcluster 15 main stop
    ls -la /usr/lib/postgresql/15/bin
    ls -la /usr/lib/postgresql/16/bin
    sudo pg_lsclusters
    ```
  * Checking ports
  * ```
    sudo -u postgres psql -p 5433 -l
    sudo -u postgres psql -p 5433 -d mosip_idmap -c "SELECT version(); SELECT count(*) FROM vid;"
    sudo nano /etc/postgresql/16/main/postgresql.conf
    sudo pg_lsclusters
    sudo cp /etc/postgresql/15/main/pg_hba.conf /etc/postgresql/16/main/pg_hba.conf
    sudo cp /etc/postgresql/15/main/postgresql.conf /etc/postgresql/16/main/postgresql.conf.backup
    ```
  * Restart
  * ```
    sudo pg_ctlcluster 16 main restart
    sudo pg_lsclusters
    ```
  * VACUM
  * ```
    sudo -u postgres psql -p 5432 -d postgres -c "VACUUM ANALYZE;"
    sudo -u postgres psql -p 5433 -d postgres -c "VACUUM ANALYZE;"
    sudo systemctl status postgresql@16-main
    sudo pg_lsclusters
    sudo systemctl status postgresql@16-main
    sudo systemctl enable postgresql
    sudo systemctl enable postgresql@16-main
    sudo systemctl status postgresql@15-main
    ```
  * Drop old cluster
  * ```
    sudo pg_dropcluster 15 main --stop
    sudo pg_lsclusters
    sudo systemctl enable postgresql@16-main
    sudo systemctl status postgresql@16-main
    sudo pg_lsclusters
    ```

#### **Minio Upgrade**

{% hint style="success" %}
* Platform v1.2.1.0 is tested and certified with minio version RELEASE.2025-02-28T09-55-16Z. It should also work with both minio version RELEASE.2022-02-07T08-17-33Z as there is no intentional breaking changes. If you are skipping this, then, it is recommended to test it completely before moving the changes to production.
* As part of our ref-impl v1.2.0.1 to v1.2.1.0, we are upgrading as mentioned below for LTS version.
  * v1.2.0.1
    * **Chart** 10.1.6 **→ Image** 2022.2.7-debian-10-r0\
      👉 MinIO server version: RELEASE.2022-02-07T08-17-33Z
  * v1.2.1.0
    * **Chart** 15.0.6 **→ Image** 2025.2.28-debian-12-r1\
      👉 MinIO server version: RELEASE.2025-02-28T09-55-16Z
* In v1.2.1.0 ref-impl deployment and upgrade bitnami chart version 15.0.6 is considered.
* We are proposing export and import way for upgrading but completely Implementers choice under Minio Admin supervision.
{% endhint %}

[https://github.com/mosip/mosip-infra/blob/release-1.2.1.x/deployment/v3/external/object-store/minio/README.md#backup-and-restore-minio](https://github.com/mosip/mosip-infra/blob/release-1.2.1.x/deployment/v3/external/object-store/minio/README.md#backup-and-restore-minio)

Backup the older minio and restore the same to newer one deployed using helm chart following above mentioned document.

#### **ActiveMQ Upgrade**

{% hint style="success" %}
* If possible clear all the messages in Active MQ queues.
* Else, the same packets will be reprocessed whenever reprocessor stage picks up the same.
* As part of java upgrade on MOSIP services side some slowness was observed on older activeMQ hence we upgraded to latest one compatible with java 17 and above.
* Upgrade details:
  * Older version : apache-artemis-2.16.0
  * New version : apache-artemis-2.39.0
{% endhint %}

* Uninstall the existing ActiveMQ using the existing delete [script](https://github.com/mosip/mosip-infra/blob/v1.2.0.2/deployment/v3/external/activemq/delete.sh) from v1.2.0.1 tag.
* Install latest ActiveMQ using [install](https://github.com/mosip/mosip-infra/blob/release-1.2.1.x/deployment/v3/external/activemq/install.sh) script from v1.2.1.0 tag.

### **Step 2: Adding additional definitions to keycloak**

{% hint style="success" %}
Keycloak init takes care of adding all the relevant client, roles, client scopes required as part of 1.2.1.0.
{% endhint %}

* First delete the existing keycloak-init job using helm:
  * ```
    helm -n keycloak delete keycloak-init 
    ```
* Deploy and run latest `keycloak-init` job by following the [document](https://github.com/mosip/mosip-infra/tree/release-1.2.1.x/deployment/v3/external/iam) to add new set of clients, roles, mappers and client scopes.

### **Step 3: MOSIP Specific Database upgrades**

* Follow the [Instruction](https://github.com/mosip/postgres-init/blob/release-1.3.x/deploy/postgres/README.md#db-upgrade) for DB Upgrade from 1.2.0.1 to 1.2.1.0.

{% hint style="success" %}
- Ensure that `upgrade.csv` is updated with all schema-related upgrade versions. The list of databases and their upgrade versions, in the defined sequence, is available [here](https://github.com/mosip/postgres-init/blob/release-1.3.x/deploy/postgres/upgrade.csv).
- DB Upgrade scripts are available in **db\_upgrade\_scripts** directory of respective repos for respective modules.
- In case of your customisations please go through the db upgrade scripts once to avoid any conflicts and upgrade post goes by following this [document](https://github.com/mosip/postgres-init/tree/release-1.3.x/postgres-upgrade).
{% endhint %}

* In case of upgrading the production, after all the DB’s are upgraded successfully, check for the new db user `otpuser` created and update the password for the same to strong password and update the secrets in config-server secrets.
* In case of sandbox or testing environment , update the password for `otpuser` as `db-dbuser-password` in postgres namespace as pre configured.

### **Step 4: Config Migrator Run**

{% hint style="success" %}
* Prop\_migrator as mentioned in detailed steps only takes care of **\*.properties** files.
* Knowledge base used for prop\_migrator is as per MOSIP’s upgrade from v1.2.0.1 to v1.2.1.0.
* Customization’s related changes needs to be adjudicated and processed from **manual\_adjudication.csv** part of output of prop\_migrator.
* During the upgrade, review and compare all below mentioned files between versions v1.2.0.1 and v1.2.1.0, and incorporate only the necessary changes identified during the review. \*
  * \*.json
  * \*.mvel
  * \*.jsonld
  * \*.xsd
  * \*.toml
  * \*.xml
  * In **websub-service.toml**, the **MESSAGE\_DELIVERY\_TIMEOUT** value has been updated to **60.0** to allow additional time before the WebSub delivery timeout occurs. Update this value as needed based on your deployment requirements.
  * The default value of **mosip.regproc.landing.zone.type** is **ObjectStore**; you may continue using your existing configuration, but if you choose to switch this value to **ObjectStore**, ensure that all required packets in the **DMZServer** filesystem are migrated to the corresponding **ObjectStore** location before making the change. Migration of packets from **DMZServer** to **ObjectStore** is not in scope of this ref-impl upgrade document.
* Since the config server doesn't trim whitespaces, if any issue arises due to whitespace in a property, review the file and remove the unnecessary spaces.
* With Java 21 config server behavior, application must be used instead of \* when pulling files from the config server.\
  Update the property as shown below.
  *   Before :

      ```
      mosip.pms.esignet.claims-mapping-file-url=${spring_config_url_env}/*/${active_profile_env}/${spring_config_label_env}/identity-mapping.json
      ```
  *   After :

      ```
      mosip.pms.esignet.claims-mapping-file-url=${spring_config_url_env}/application/${active_profile_env}/${spring_config_label_env}/identity-mapping.json
      ```
* Create a new branch from the latest config branch to compare with the older version. When the migrator updates the latest-config directory, we can diff the changes and raise a pull request for the new branch. The migrator changes will be captured in the new branch, while latest-config remains unchanged for reference.
* Placeholders have been introduced in certain `.properties` files. Please do not remove them; instead, use them and provide the required values through the ConfigMap. These placeholders are intended to support easier configurability.
{% endhint %}

* Follow the [steps](https://github.com/mosip/mosip-infra/tree/release-1.2.1.x/deployment/v3/utils/prop_migrator) to migrate the configurations.

{% hint style="success" %}
- After the config migrator is executed against the knowledge base the latest-config directory will contain the updated configuration files which needs to be checked in to the current mosip-config branch.
- Please go through diff once before commiting to make sure parameters are handled properly.
- Once completed follow the above mentioned notes and commit changes to the current branch so that the same can be used against upgraded codebase.
{% endhint %}

### **Step 5: Skip redeployment of certain MOSIP services/batch jobs**

*   Add the pmp-revamp host to the global configmap manually.

    * Add the pmp-revamp host to the global configmap manually.\
      \* To add/update the pmp-revamp host in the **global ConfigMap,** Use the below command:

    ```
    kubectl patch configmap global -n default \
      --type merge \
      -p '{"data":{"mosip-pmp-revamp-ui-host":"pmp-revamp.<sandbox.xyz.net>"}}'
    ```

    Note: Please replace \`<[sandbox.xyz.net](http://sandbox.xyz.net)>\` with correct hostname.
* Do not run these services during redeployment:
  * **kernel keygen job - Comment out the helm command that installs kernel keygen from this** [**script**](https://github.com/mosip/mosip-infra/blob/release-1.2.1.x/deployment/v3/mosip/keymanager/install.sh)
  * **masterdata-loader - No need to run this** [**script**](https://github.com/mosip/mosip-infra/blob/release-1.2.1.x/deployment/v3/mosip/masterdata-loader/install.sh)
  * **regproc-reprocessor - Comment out the helm command that installs** **regproc-reprocessor** **from this** [**script**](https://github.com/mosip/mosip-infra/blob/release-1.2.1.x/deployment/v3/mosip/regproc/install.sh)**.**
  * **regproc saltgen job - Comment out the helm command that installs** **regproc saltgen** **from this** [**script**](https://github.com/mosip/mosip-infra/blob/release-1.2.1.x/deployment/v3/mosip/regproc/install.sh)**.**
  * **idrepo saltgen job - Comment out the helm command that installs** **idrepo saltgen** **from this** [**script**](https://github.com/mosip/mosip-infra/blob/release-1.2.1.x/deployment/v3/mosip/idrepo/install.sh)**.**
  * **ida keygen job - Comment out the helm command that installs** **regproc-reprocessor** **from this** [**script**](https://github.com/mosip/mosip-infra/blob/release-1.2.1.x/deployment/v3/mosip/idrepo/install.sh)**.**
  * **onboarder - No need to run this** [**script**](https://github.com/mosip/mosip-infra/blob/release-1.2.1.x/deployment/v3/mosip/partner-onboarder/install.sh)**.**
  * **conf-secrets - No need to run** [**script**](https://github.com/mosip/mosip-infra/blob/release-1.2.1.x/deployment/v3/mosip/conf-secrets/install.sh)**.**

### **Step 6: Deployment of additional artifcatory instance**

* We will need two Instances of artifactory as part of ref-impl v1.2.0.1 to v1.2.1.0 upgrade to support both JAVA11 and JAVA 21 components.
* **For regclient v1.2.0.2 (JAVA 11 component):**
  * As the **regclient** is not getting upgraded suggested to use **v1.2.0.2**, hence will continue to use artifactory-1.2.0.1 from helm chart to support older regclient-downloader.
  * Need this to be redeployed in new namespace to avoid changes in most of the install scripts. (new namespace : **artifactory-1202**)
  * Update the namespace in install script from v1.2.0.2 for artifactory. [link](https://github.com/mosip/mosip-infra/blob/v1.2.0.2/deployment/v3/mosip/artifactory/install.sh)
  * Execute the install script to install the same in artifactory-1202 namespace.
  * Delete reg-client-downloader if not deleted yet. [link](https://github.com/mosip/mosip-infra/blob/v1.2.0.2/deployment/v3/mosip/regclient/delete.sh)
  * Re-deploy reg-client downloader following. [link](https://github.com/mosip/mosip-infra/tree/release-1.2.1.x/deployment/v3/mosip/regclient)
* **Other one for rest of the services which needs the dependent artifacts from upgraded artifactory-1.3.0**. (JAVA 21 components)
  * Delete the older artifactory in case still runnning from artifactory namespace following. [link](https://github.com/mosip/mosip-infra/blob/v1.2.0.2/deployment/v3/mosip/artifactory/delete.sh)
  * Install the newer artifactory followng. [link](https://github.com/mosip/mosip-infra/blob/release-1.2.1.x/deployment/v3/mosip/artifactory/install.sh)

### **Steps 7: Deploy all the MOSIP application services from v1.2.1.0 of mosip-infra**

{% hint style="success" %}
* Artifactory version 1.3.0 is deployed correctly in artifactory namespace for all service except registration-client and eSignet
* Below will be the sequence in which the MOSIP services needs redeployment :
  * Config server
  * Captcha (Make sure we use the same existing captcha secrets).
  * Artifactory
  * keymanager (Comment out the keygen job from install script).
  * websub
  * kernel
  * mock-biosdk
  * packetmanager
  * datashare
  * pre-registration
  * id-repository
  * partner-management-service
  * mock-abis
  * mock-mv
  * registration processor
  * admin
  * id-authentication
  * print
  * mosip-file-server
  * resident services
  * registration client
{% endhint %}

* Deployment scripts are available [here](https://github.com/mosip/mosip-infra/tree/release-1.2.1.x/deployment/v3/mosip).

### **Step 8: Post-Upgrade Verification**

#### **Functional Checks**

* Schema Validation
  * All tables created/updated per upgrade scripts.
  * Constraints valid.
  * Indexes valid.
  * Materialized views refreshed (if present).
* Functional Validation
  * IDA Authentication API
  * Identity retrieval API
  * Credential issuance & revoke.\[VS1] \[VS2]
  * Admin UI functionality.

#### **System Health**

* Service logs
* Kafka consumer lags
* DB performance
* CPU/memory profile
* Scheduled jobs verification

#### **Integration Testing**

* Partner flows
* MDS/Devices
* Third-party identity provider (if any)
* Api-testrig deployment : [https://github.com/mosip/mosip-infra/tree/release-1.2.1.x/deployment/v3/testrig](https://github.com/mosip/mosip-infra/tree/release-1.2.1.x/deployment/v3/testrig)

## Rollback Strategy (db rollback, respective config rollback, services redeploy with older charts)

Rollback is **schema-specific** and must be done using:

\- Admin rollback

\- IDA rollback

\- Identity-service rollback

\- Credential-service rollback

Rollback must be performed **in reverse order of upgrade**.

## Final Notes

* Ensure backups are always tested before performing rollback.
* Apply DB scripts only on **primary node** in HA.
* Validate DR node replication.
* Keep a maintenance window.

## FAQ

1. What happens if there are pending messages in the ActiveMQ queues?\
   **A:** If any messages are pending, they will be moved to the Reprocess stage so they can be processed later.
