# Resident Services Deployment Guide


This guide contains all the information required for successful deployment and running of Resident Portal. It includes information about the Database and template scripts, seed data, roles, OIDC client setup, etc.

## DB scripts

Resident Service DB Scripts to be run: [DB scipts](https://github.com/mosip/resident-services/tree/master/db_scripts/mosip_resident)

## Master-data Template Scripts

The master-data templates required for the Resident portal are added to the [template](https://github.com/mosip/mosip-data/blob/master/mosip_master/xlsx/template.xlsx) and [template type](https://github.com/mosip/mosip-data/blob/master/mosip_master/xlsx/template_type.xlsx) DML excel files in `mosip/mosip-data` repository. These scripts need to be applied to the corresponding table.

### Keycloak Roles

`mosip-resident-client` needs to have below roles in keycloak:

* `RESIDENT`

* `SUBSCRIBE_AUTH_TYPE_STATUS_UPDATE_ACK_GENERAL`

* `SUBSCRIBE_AUTHENTICATION_TRANSACTION_STATUS_GENERAL`

* `SUBSCRIBE_CREDENTIAL_STATUS_UPDATE_GENERAL`

* `CREDENTIAL_REQUEST`

### Resident OIDC Client setup

Here is the document which explains how `resident-oidc` partner is onboarded through `partner-onboarder` after deployment.

For more, refer [here]().

 
