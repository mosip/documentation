# Postgres DB

## Overview

MOSIP uses [Postgres](https://www.postgresql.org) DB for all relational data storage. The DB creation SQL scripts are located under `/db_scripts` the folder of the module repository. In [sandbox deployment](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/v3/external/postgres), Postgres is installed as a docker inside the cluster. However, in production deployment, typically, Postgres will be installed external to the cluster.

## ER diagrams

Entity relationships diagrams for all databases used in MOSIP are given below.

* [mosip\_audit](../../\_images/mosip-audit-er.png)
* [mosip\_authdevice](../../\_images/mosip-authdevice-er.png)
* [mosip\_credential](../../\_images/mosip-credential-er.png)
* [mosip\_hotlist](../../\_images/mosip-hotlist-er.png)
* [mosip\_ida](../../\_images/mosip-ida-er.png)
* [mosip\_idmap](../../\_images/mosip-idmap-er.png)
* [mosip\_idrepo](../../\_images/mosip-idrepo-er.png)
* [mosip\_kernel](../../\_images/mosip-kernel-er.png)
* [mosip\_keymgr](../../\_images/mosip-keymgr-er.png)
* [mosip\_master](../../\_images/mosip-master-er.png)
* [mosip\_pms](../../\_images/mosip-pms-er.png)
* [mosip\_prereg](../../\_images/mosip-prereg-er.png)
* [mosip\_regdevice](../../\_images/mosip-regdevice-er.png)
* [mosip\_regprc](../../\_images/mosip-regprc-er.png)

## Configuration parameters

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

### Production DB configuration

These are some of the _reference settings_ of a production database. It is expected that these are reviewed and finalized for a given deployment.

```
resources: 
  limits: {}
  #   cpu: 250m
  #   memory: 1Gi
  requests: 
    cpu: 8000m
    memory: 32000Mi

postgresqlExtendedConf:                 
   wal_level: logical
   max_wal_senders: 20
   max_replication_slots: 10
   shared_buffers: 16GB                         
   max_prepared_transactions: 1000
   huge_pages: try                              
   work_mem: 16MB                       # min 64kB
   maintenance_work_mem: 3GB            # min 1MB
   effective_cache_size: 32GB                   
   log_min_duration_statement: 1000
```
