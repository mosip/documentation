# Storage 

## Postgres DB

## Object Store
S3 compatible object store like AWS S3 or [MinIO](https://min.io/) for storing the following:
1. Original registration encrypted packets
2. Pre-registration documents
3. Individual biometrics and documents
4. Datashare temporary data 

MOSIP services acces the object store using standard S3 APIs.

Object Store is installed as part of standard sandbox deployment and procedure to install the same is available [here](https://github.com/mosip/mosip-infra/tree/1.2.0-rc2/deployment/v3/external/object_store)

For estimate of storage requirements for production deployment refer [Server Hardware Requirements](server-hardware-requirements.md)





