# Storage 

## Postgres DB
MOSIP uses [Postgres](https://www.postgresql.org/) DB for all relational data storage. The DB creation SQL scripts are located under `/db_scripts` folder of module repository. In [sandbox deployment](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/v3/external/postgres) Postgres is installed as a docker inside the cluster. However, in production deployment, typically, Postgres will be installed external to the cluster. The same may be configured in [module properties](module-configurations.md). 

## Object Store
S3 compatible object store like AWS S3 or [MinIO](https://min.io/) for storing the following:
1. Original registration encrypted packets
2. Pre-registration documents
3. Individual biometrics and documents
4. Datashare temporary data 

MOSIP services access the object store using standard S3 APIs.

Object Store is installed as part of [default sandbox deployment](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/v3/external/object_store).

For estimate of storage requirements for production deployment refer [Server Hardware Requirements](server-hardware-requirements.md).





