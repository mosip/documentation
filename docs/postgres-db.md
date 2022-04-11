# Postgres DB

## Overview

MOSIP uses [Postgres](https://www.postgresql.org) DB for all relational data storage. The DB creation SQL scripts are located under `/db_scripts` the folder of the module repository. In [sandbox deployment](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/v3/external/postgres), Postgres is installed as a docker inside the cluster. However, in production deployment, typically, Postgres will be installed external to the cluster.&#x20;

## Configurations

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
