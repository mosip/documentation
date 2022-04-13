# Postgres DB

## Overview

MOSIP uses [Postgres](https://www.postgresql.org) DB for all relational data storage. The DB creation SQL scripts are located under `/db_scripts` the folder of the module repository. In [sandbox deployment](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/v3/external/postgres), Postgres is installed as a docker inside the cluster. However, in production deployment, typically, Postgres will be installed external to the cluster.&#x20;


### Entity Relationship Diagrams of all the MOSIP databases

[mosip_audit](_images/mosip-audit-er.png)

[mosip_authdevice](_images/mosip-authdevice-er.png)

[mosip_credential](_images/mosip-credential-er.png)

[mosip_hotlist](_images/mosip-hotlist-er.png)

[mosip_ida](_images/mosip-ida-er.png)

[mosip_idmap](_images/mosip-idmap-er.png)

[mosip_idrepo](_images/mosip-idrepo-er.png)

[mosip_kernel](_images/mosip-kernel-er.png)

[mosip_keymgr](_images/mosip-keymgr-er.png)

[mosip_master](_images/mosip-master-er.png)

[mosip_pms](_images/mosip-pms-er.png)

[mosip_prereg](_images/mosip-prereg-er.png)

[mosip_regdevice](_images/mosip-regdevice-er.png)

[mosip_regprc](_images/mosip-regprc-er.png)


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

