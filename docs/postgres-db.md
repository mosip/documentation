# Postgres DB

## Overview

MOSIP uses [Postgres](https://www.postgresql.org) DB for all relational data storage. The DB creation SQL scripts are located under `/db_scripts` the folder of the module repository. In [sandbox deployment](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/v3/external/postgres), Postgres is installed as a docker inside the cluster. However, in production deployment, typically, Postgres will be installed external to the cluster.&#x20;


### Entity Relationship Diagrams of all the MOSIP databases

[MOSIP_AUDIT](_images/mosip-audit-er.png)

[MOSIP_AUTHDEVICE](_images/mosip-authdevice-er.png)

[MOSIP_CREDENTIAL](_images/mosip-credential-er.png)

[MOSIP_HOTLIST](_images/mosip-hotlist-er.png)

[MOSIP_IDA](_images/mosip-ida-er.png)

[MOSIP_IDMAP](_images/mosip-idmap-er.png)

[MOSIP_IDREPO](_images/mosip-idrepo-er.png)

[MOSIP_KERNEL](_images/mosip-kernel-er.png)

[MOSIP_KEYMGR](_images/mosip-keymgr-er.png)

[MOSIP_MASTER](_images/mosip-master-er.png)

[MOSIP_PMS](_images/mosip-pms-er.png)

[MOSIP_PREREG](_images/mosip-prereg-er.png)

[MOSIP_REGDEVICE](_images/mosip-regdevice-er.png)

[MOSIP_REGPRC](_images/mosip-regprc-er.png)


### Configurations

* Connection details
  * `{module_name`}`_database_url`
  * `{module_name`}`_database_username`
  * `{module_name`}`_database_password`
  
* Hibernate configurations
  * `javax.persistence.jdbc.driver`
  * `hibernate.dialect`
  * `hibernate.jdbc.lob.non_contextual_creation`
  * `hibernate.hbm2ddl.auto`
  * `hibernate.show_sql`
  * `hibernate.format_sql`
  * `hibernate.connection.charSet`
  * `hibernate.cache.use_second_level_cache`
  * `hibernate.cache.use_query_cache`
  * `hibernate.cache.use_structured_entries`
  * `hibernate.generate_statistics`
  * `logging.level.org.hibernate.SQL`
  * `logging.level.org.hibernate.type`

