# Postgres DB

MOSIP uses [Postgres](https://www.postgresql.org/) DB for all relational data storage. The DB creation SQL scripts are located under `/db_scripts` folder of module repository. In [sandbox deployment](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/v3/external/postgres) Postgres is installed as a docker inside the cluster. However, in production deployment, typically, Postgres will be installed external to the cluster. The same may be configured in [module properties](module-configurations.md). 

