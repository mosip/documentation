# Build and Development Guide

This guide contains all the information required for successful deployment and running of Partner Management Portal. It includes information about the Database and roles.

### DB scripts

Partner Management Service DB Scripts to be run: [DB scripts](https://github.com/mosip/partner-management-services/tree/develop-pmp-revamp/db\_scripts/mosip\_pms)

### Keycloak Roles

`mosip-pms-client` needs to have below roles in keycloak:

* CREATE\_SHARE
* DEVICE\_PROVIDER
* PARTNER
* PARTNER\_ADMIN
* PMS\_ADMIN
* PMS\_USER
* PUBLISH\_APIKEY\_APPROVED\_GENERAL
* PUBLISH\_APIKEY\_UPDATED\_GENERAL
* PUBLISH\_CA\_CERTIFICATE\_UPLOADED\_GENERAL
* PUBLISH\_MISP\_LICENSE\_GENERATED\_GENERAL
* PUBLISH\_MISP\_LICENSE\_UPDATED\_GENERAL
* PUBLISH\_OIDC\_CLIENT\_CREATED\_GENERAL
* PUBLISH\_OIDC\_CLIENT\_UPDATED\_GENERAL
* PUBLISH\_PARTNER\_UPDATED\_GENERAL
* PUBLISH\_POLICY\_UPDATED\_GENERAL
* REGISTRATION\_PROCESSOR
* SUBSCRIBE\_CA\_CERTIFICATE\_UPLOADED\_GENERAL
* ZONAL\_ADMIN
