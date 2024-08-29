# Build and Development Guide

This guide contains all the information required for successful deployment and running of Partner Management Portal. It includes information about the Database and roles.

### DB scripts

Partner Management Service DB Scripts to be run: [DB scripts](https://github.com/mosip/partner-management-services/tree/develop-pmp-revamp/db\_scripts/mosip\_pms)

### Keycloak Roles

`mosip-pms-client` needs to have below roles in keycloak:

* `CREATE_SHARE`\`
* `DEVICE_PROVIDER`
* `PARTNER`
* `PARTNER_ADMIN`
* `PMS_ADMIN`
* `PMS_USER`
* `PUBLISH_APIKEY_APPROVED_GENERAL`
* `PUBLISH_APIKEY_UPDATED_GENERAL`
* `PUBLISH_CA_CERTIFICATE_UPLOADED_GENERAL`
* `PUBLISH_MISP_LICENSE_GENERATED_GENERAL`
* `PUBLISH_MISP_LICENSE_UPDATED_GENERAL`
* `PUBLISH_OIDC_CLIENT_CREATED_GENERAL`
* `PUBLISH_OIDC_CLIENT_UPDATED_GENERAL`
* `PUBLISH_PARTNER_UPDATED_GENERAL`
* `PUBLISH_POLICY_UPDATED_GENERAL`
* `REGISTRATION_PROCESSOR`
* `SUBSCRIBE_CA_CERTIFICATE_UPLOADED_GENERAL`
* `ZONAL_ADMIN`

### **Config Changes:**

Add below property to partner-management-default.properties file in mosip-config repository to Deploy PMS Revamp 1.3.0-DP.1 release in your env.

```
## This property is used by kernel-authcodeflowproxy-api to check request is coming from allowed urls not.
auth.allowed.urls=https://${mosip.pmp.host}/,https://${mosip.pmp.reactjs.ui.host}/
```

