# Resident Services Deployment Guide

This guide contains all the information required for successful deployment and running of Resident Portal. It includes information about the Database and template scripts, seed data, roles, OIDC client setup, etc.

## DB scripts

Resident Service DB Scripts to be run: [DB scripts](https://github.com/mosip/resident-services/tree/v1.2.1.0/db\_scripts/mosip\_resident)

## Master-data Template Scripts

The master-data templates required for the Resident portal are added to the [template](https://github.com/mosip/mosip-data/blob/develop/mosip\_master/xlsx/template.xlsx) and [template type](https://github.com/mosip/mosip-data/blob/develop/mosip\_master/xlsx/template\_type.xlsx) DML excel files in [mosip/mosip-data](https://github.com/mosip/mosip-data/tree/v1.2.1.0) repository. These scripts need to be applied to the corresponding table.

## Keycloak Roles

`mosip-resident-client` needs to have below roles in keycloak:

* `RESIDENT`
* `SUBSCRIBE_AUTH_TYPE_STATUS_UPDATE_ACK_GENERAL`
* `SUBSCRIBE_AUTHENTICATION_TRANSACTION_STATUS_GENERAL`
* `SUBSCRIBE_CREDENTIAL_STATUS_UPDATE_GENERAL`
* `SUBSCRIBE_REGISTRATION_PROCESSOR_WORKFLOW_COMPLETED_EVENT_GENERAL`
* `CREDENTIAL_REQUEST`

### Resident OIDC Client setup

Here is the document which explains how `resident-oidc` partner is onboarded through [partner-onboarder after deployment](https://github.com/mosip/mosip-onboarding/tree/v1.2.0.1).

For more details on how to configure the Resident OIDC client, refer [here](resident-services-configure-resident-oidc-client.md).
