# Postgres DB

## Overview

MOSIP uses [Postgres](https://www.postgresql.org/) DB for all relational data storage. The DB creation SQL scripts are located under `/db_scripts` folder of module repository. In [sandbox deployment](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/v3/external/postgres) Postgres is installed as a docker inside the cluster. However, in production deployment, typically, Postgres will be installed external to the cluster. The same may be configured in [module properties](module-configurations.md). 

### ER Diagrams of all the databases part of MOSIP

[MOSIP_AUDIT](_images/mosip_audit_er.png)

[MOSIP_AUTHDEVICE](_images/mosip_authdevice_er.png)

[MOSIP_CREDENTIAL](_images/mosip_credential_er.png)

[MOSIP_HOTLIST](_images/mosip_hotlist_er.png)

[MOSIP_IDA](_images/mosip_ida_er.png)

[MOSIP_IDMAP](_images/mosip_idmap_er.png)

[MOSIP_IDREPO](_images/mosip_idrepo_er.png)

[MOSIP_KERNEL](_images/mosip_kernel_er.png)

[MOSIP_KEYMGR](_images/mosip_keymgr_er.png)

[MOSIP_MASTER](_images/mosip_master_er.png)

[MOSIP_PMS](_images/mosip_pms_er.png)

[MOSIP_PREREG](_images/mosip_prereg_er.png)

[MOSIP_REGDEVICE](_images/mosip_regdevice_er.png)

[MOSIP_REGPRC](_images/mosip_regprc_er.png)
