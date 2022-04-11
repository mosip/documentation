# Postgres DB

## Overview

MOSIP uses [Postgres](https://www.postgresql.org/) DB for all relational data storage. The DB creation SQL scripts are located under `/db_scripts` folder of module repository. In [sandbox deployment](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/v3/external/postgres) Postgres is installed as a docker inside the cluster. However, in production deployment, typically, Postgres will be installed external to the cluster. The same may be configured in [module properties](module-configurations.md). 

### ER Diagrams of all the databases part of MOSIP

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
