# Changes in Role Management based on Client IDs

## Partner Management Services

In previous versions (1.1.5.x) of our system, we utilized the `mosip-partner-client` for Partner Management Services (PMS). However, starting from version 1.2.0.1 onwards, we have implemented the use of `mosip-pms-client` instead. This transition has led to updates in service account roles, client scopes, and client configurations.

Please find below the details of the changes made to service account roles and client scopes.

#### **Service account roles for Partner-Management-Services**

<table><thead><tr><th width="273">mosip-partner-client (1.1.5.x)</th><th>mosip-pms-client (1.2.0.1)</th></tr></thead><tbody><tr><td>offline access</td><td>CREATE_SHARE</td></tr><tr><td>REGISTRATION_PROCESSOR</td><td>default_roles_mosip</td></tr><tr><td>uma_authorization</td><td>DEVICE_PROVIDER</td></tr><tr><td></td><td>PARTNER</td></tr><tr><td></td><td>PARTNER_ADMIN</td></tr><tr><td></td><td>PMS_ADMIN</td></tr><tr><td></td><td>PMS_USER</td></tr><tr><td></td><td>PUBLISH_APIKEY_APPROVED_GENERAL</td></tr><tr><td></td><td>PUBLISH_APIKEY_UPDATED _GENERAL</td></tr><tr><td></td><td>PUBLISH_CA_CERTIFICATE_UPLOADED_GENERAL</td></tr><tr><td></td><td>PUBLISH_MISP_LICENSE_GENERATED_GENERAL</td></tr><tr><td></td><td>PUBLISH_MISP_LICENSE_UPDATED_GENERAL</td></tr><tr><td></td><td>PUBLISH_OIDC_CLIENT_CREATED_GENERAL</td></tr><tr><td></td><td>PUBLISH_OIDC_CLIENT_UPDATED _GENERAL</td></tr><tr><td></td><td>PUBLISH_PARTNER _UPDATED _GENERAL</td></tr><tr><td></td><td>PUBLISH_POLICY_UPDATED _GENERAL</td></tr><tr><td></td><td>REGISTRATION_PROCESSOR</td></tr><tr><td></td><td>SUBSCRIBE_CA_CERTIFICATE_UPLOADED_GENERAL</td></tr><tr><td></td><td>ZONAL_ADMIN</td></tr></tbody></table>

#### **Client Scopes for Partner-Management-Services:**

| mosip-partner-client (1.1.5.x) | mosip-pms-client (1.2.0.1) |
| ------------------------------ | -------------------------- |
| email                          | add\_oidc\_client          |
| profile                        | email                      |
| roles                          | get\_certificate           |
| web-origins                    | profile                    |
|                                | roles                      |
|                                | send\_binding\_otp         |
|                                | update\_oidc\_client       |
|                                | uploaded\_certificate      |
|                                | wallet\_binding            |
|                                | web\_origins               |

### **Admin-Services**

In version 1.1.5.x, the `mosip-admin-client` was utilized for administrative services. We are also continuing to utilize the same client in version 1.2.0.1. While there have been modifications to the service account roles, the Client scopes have remained unchanged. Please find below the updated service account role adjustments. Additionally, it is worth noting that **MOSIP Commons** is also utilizing this client.

**Service account roles for Admin-Services:**

<table><thead><tr><th width="255">mosip-admin-client (1.1.5.x)</th><th>mosip-admin-client (1.2.0.1)</th></tr></thead><tbody><tr><td>MASTERDATA_ADMIN</td><td>Default-roles-mosip</td></tr><tr><td>offline_access</td><td>ZONAL_ADMIN</td></tr><tr><td>uma_authorization</td><td>offline-access</td></tr><tr><td></td><td>PUBLISH_MASTERDATA_IDAUTHENTICATION_TEMPLATES_GENERAL</td></tr><tr><td></td><td>PUBLISH_MASTERDATA_TITLES_GENERAL</td></tr><tr><td></td><td>PUBLISH_MOSIP_HOTLIST_GENERAL</td></tr><tr><td></td><td>uma_authorization</td></tr></tbody></table>

**Client scopes are the same for mosip-admin-client in 1.2.0.1 & 1.1.5.1**

* email
* profile
* roles
* web-origins

### **Pre-registration**

In version 1.1.5.x, we utilized the 'mosip-prereg-client' for Pre-Registration. This client is also utilized in version 1.2.0.1. There have been modifications in the service account roles, while the client scopes have remained unchanged. Please find below the updated service account roles.

**Service account roles for Pre-Registration:**

| mosip-prereg-client in 1.1.5.x                                                                                                                             | mosip-prereg-client in 1.2.0.1                                                                                     |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| <ul><li>INDIVIDUAL</li><li>offline_access</li><li>PRE_REGISTRATION_ADMIN</li><li>PREREG</li><li>REGISTRATION_PROCESSOR</li><li>uma_authorization</li></ul> | <ul><li>default_roles_mosip</li><li>PRE_REGISTRATION_ADMIN</li><li>PREREG</li><li>REGISTRATION_PROCESSOR</li></ul> |

**Note**: Prior to proceeding with the upgrade, please ensure that the `INDIVIDUAL` role has been removed.

**Client scopes are the same for mosip-prereg-client in 1.2.0.1 & 1.1.5.1**

* email
* profile
* roles
* web-origins

### ID Authentication

In the previous version 1.1.5.x, the `mosip-ida-client` module was responsible for handling ID authentication. However, starting from version 1.2.0.1, we have switched to using `mpartner-default-auth` for this purpose. This transition has brought about several changes, including modifications to service account roles, client scopes, and client configurations. Below is an overview of the changes in service account roles and client scopes.

**Service account roles for id-authentication:**

<table><thead><tr><th width="269">mosip-ida-client in (1.1.5.x)</th><th>mpartner-default-auth (1.2.0.1)</th></tr></thead><tbody><tr><td><ul><li>AUTH</li><li>AUTH_PARTNER</li><li>ID_AUTHENTICATION</li><li>offline_access</li><li>uma_authorization</li></ul></td><td><ul><li>CREDENTIAL_REQUEST</li><li>default_roles_mosip</li><li>ID_AUTHENTICATION</li><li>offline_access</li><li>PUBLISH_ANONYMOUS_PROFILE_GENERAL</li><li>PUBLISH_AUTH_TYPE_STATUS_UPDATE_ACK_GENERAL</li><li>PUBLISH_AUTHENTICATION_TRANSACTION_STATUS_GENERAL</li><li>PUBLISH_CREDENTIAL_STATUS_UPDATE_GENERAL</li><li>PUBLISH_IDA_FRAUD_ANALYTICS_GENERAL</li><li>SUBSCRIBE_ACTIVATE_ID_INDIVIDUAL</li><li>SUBSCRIBE_APIKEY _APPROVED_GENERAL</li><li>SUBSCRIBE_APIKEY _UPDATED _GENERAL</li><li>SUBSCRIBE_AUTH_TYPE_STATUS_UPDATE_ACK_GENERAL</li><li>SUBSCRIBE_AUTH_TYPE_STATUS_UPDATE_INDIVIDUAL</li><li>SUBSCRIBE_CA_CERTIFICATE_UPLOADED_GENERAL</li><li>SUBSCRIBE_CREDENTIAL_ISSUED_INDIVIDUAL</li><li>SUBSCRIBE_DEACTIVATE_ID_INDIVIDUAL</li><li>SUBSCRIBE_MASTERDATA_IDAUTHENTICATION_TEMPLATES_GENERAL</li><li>SUBSCRIBE_MASTERDATA_TITLES_GENERAL</li><li>SUBSCRIBE_MISP_LICENSE_GENERATED_GENERAL</li><li>SUBSCRIBE_MISP_LICENSE_UPDATED_GENERAL</li><li>SUBSCRIBE_MOSIP_HOTLIST_GENERAL</li><li>SUBSCRIBE_OIDC_CLIENT_CREATED_GENERAL</li><li>SUBSCRIBE_OIDC_CLIENT_UPDATED_GENERAL</li><li>SUBSCRIBE_PARTNER_UPDATED_GENERAL</li><li>SUBSCRIBE_POLICY _UPDATED_GENERAL</li><li>SUBSCRIBE_REMOVE _ID_INDIVIDUAL</li><li>uma_authorization</li></ul></td></tr></tbody></table>

**Client Scopes for id-authentication:**

| mosip-ida-client (1.1.5.x)                                                | mpartner-default-auth (1.2.0.1)                                                                                              |
| ------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| <ul><li>email</li><li>profile</li><li>roles</li><li>web-origins</li></ul> | <ul><li>add_oidc_client</li><li>email</li><li>profile</li><li>roles</li><li>update_oidc_client</li><li>web-origins</li></ul> |

### Digital-card-service

In the previous version, 1.1.5.x, we did not employ any clients for our digital card service. However, in the latest version, 1.2.0.1, we have implemented the use of the `mpartner-default-digitalcard` client. Please find below the service account roles and client scopes associated with the `mpartner-default-digitalcard` client.

**Service account roles assigned to \_mpartner-default-digitalcard**\_\*\* in 1.2.0.1\*\*

* CREATE\_SHARE
* CREDENTIAL\_REQUEST
* default\_roles\_mosip
* PRINT\_PARTNER
* PUBLISH\_CREDENTIAL\_STATUS\_UPDATE\_GENERAL
* SUBSCRIBE\_ CREDENTIAL\_ISSUED\_INDIVIDUAL
* SUBSCRIBE\_IDENTITY\_CREATED\_GENERAL
* SUBSCRIBE\_IDENTITY\_UPDATED \_GENERAL

**Client scopes assigned to \_mpartner-default-digitalcard**\_\*\* in 1.2.0.1\*\*

* email
* profile
* roles
* web-origins

### Print

In version 1.1.5.x, we do not employ any clients for printing. However, beginning from version 1.2.0.1, we utilize the `mpartner-default-prin`t client. Please find below the service account roles and client scopes associated with the `mpartner-default-print` client.

**Service account roles assigned to \_mpartner-default-print**\_\*\* in 1.2.0.1\*\*

* CREATE\_SHARE
* default\_roles\_mosip
* PUBLISH\_CREDENTIAL\_STATUS\_UPDTAE\_GENERAL
* SUBSCRIBE\_ CREDENTIAL\_ISSUED\_INDIVIDUAL

**Client scopes assigned to \_mpartner-default-print**\_\*\* in 1.2.0.1\*\*

* email
* profile
* roles
* web-origins

### ID Repository

In version 1.1.5.x, we utilized the `mosip-regproc-client` for id-repository. Starting from version 1.2.0.1, we have transitioned to using `mosip-idrepo-client`. This switch has led to modifications in service account roles, client scopes, and client settings. Below are the details of the changes in service account roles and client scopes.

**Client Scopes for id-repository:**

<table><thead><tr><th width="282">mosip-regproc-client (1.1.5.x)</th><th>mosip-idrepo-client (1.2.0.1)</th></tr></thead><tbody><tr><td><ul><li>email</li><li>profile</li><li>roles</li><li>web-origins</li></ul></td><td><ul><li>email</li><li>profile</li><li>roles</li><li>web-origins</li></ul></td></tr></tbody></table>

**Service account roles for id-repository:**

| mosip-regproc-client (1.1.5.x)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | mosip-idrepo-client (1.2.0.1)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <ul><li>ABIS_PARTNER</li><li>CENTRAL_ADMIN</li><li>CENTRAL_APPROVER</li><li>CREDENTIAL_INSURANCE</li><li>CREDETIAL_PARTNER</li><li>Default</li><li>DEVICE_PROVIDER</li><li>DIGITAL_CARD</li><li>FTM_PROVIDER</li><li>GLOBAL_ADMIN</li><li>INDIVIDUAL</li><li>KEY_MAKER</li><li>MASTERDATA_ADMIN</li><li>MISP</li><li>MISP_PARTNER</li><li>ONLINE_VERIFICATION_PARTNER</li><li>POLICYMANAGER</li><li>PRE_REGISTRATION</li><li>PRE_REGISTRATION_ADMIN</li><li>PREREG</li><li>REGISTRATION_ADMIN</li><li>REGISTRATION_OFFICER</li><li>REGISTRATION_OPERATOR</li><li>REGISTRATION_SUPERVISOR</li><li>ZONAL_ADMIN</li><li>ZONAL_APPROVER</li></ul> | <ul><li>default_roles_mosip</li></ul><ul><li>ID_REPOSITORY</li><li>offline_access</li><li>PUBLISH_ACTIVATE_ID_ALL_INDIVIDUAL</li><li>PUBLISH_AUTH_TYPE_STATUS_UPDATE_ALL_INDIVIDUAL</li><li>PUBLISH_AUTHENTICATION_TRANSACTION_STATUS_GENERAL</li><li>PUBLISH_DEACTIVATE_ID_ALL_INDIVIDUAL</li><li>PUBLISH_IDENTITY_CREATED_GENERAL</li><li>PUBLISH_IDENTITY_UPDATED _GENERAL</li><li>PUBLISH_REMOVE _ID_ALL_INDIVIDUAL</li><li>PUBLISH_VID_CRED_STATUS_UPDATE_GENERAL</li><li>SUBSCRIBE_VID_CRED_STATUS_UPDATE_GENERAL</li><li>uma_authorization</li></ul> |

### Resident Services

In version 1.1.5.x, we utilized the `mosip-resident-client` for Resident Services. This client is also employed in version 1.2.0.1. Although there were modifications in service account roles, the client scopes remain unchanged. Below the details of the alterations made in service account roles.

**Service account roles for Resident-Services:**

| mosip-resident-client (1.1.5.x)                                                                                                    | mosip-resident-client (1.2.0.1)                                                                                                                                                                                                                                                                         |
| ---------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <ul><li>CREDENTIAL_ISSUANCE</li><li>CREDENTIAL_REQUEST</li><li>offline_access</li><li>RESIDENT</li><li>uma_authorization</li></ul> | <ul><li>CREDENTIAL_REQUEST</li><li>default_roles_mosip</li><li>offline_access</li><li>RESIDENT</li><li>SUBSCRIBE_AUTH_TYPE_STATUS_UPDATE_ACK_GENERAL</li><li>SUBSCRIBE_AUTHENTICATION_TRANSACTION_STATUS_GENERAL</li><li>SUBSCRIBE_CREDENTIAL_STATUS_UPDATE_GENERAL</li><li>uma_authorization</li></ul> |

**Client Scopes for Resident-Services:**

| mosip-resident -client (1.1.5.x)                                          | mosip- resident -client (1.2.0.1)                                                                                 |
| ------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| <ul><li>email</li><li>profile</li><li>roles</li><li>web-origins</li></ul> | <ul><li>email</li><li>ida_token</li><li>individual_id</li><li>profile</li><li>roles</li><li>web-origins</li></ul> |

### **Compliance-Tool-Kit**

In previous iterations (1.1.5.x) of our system, we did not employ any clients for the compliance toolkit. However, beginning with version 1.2.0.1, we have implemented the use of `mosip_toolkit_clien`t. The following information outlines the service account roles and client scopes associated with `mosip_toolkit_client`.

**Service account roles assigned to \_mosip\_toolkit\_client**\_\*\* in 1.2.0.1\*\*

* default\_roles\_mosip

**Client scopes assigned to \_mosip\_toolkit\_client**\_\*\* in 1.2.0.1\*\*

* email
* profile
* roles
* web-origins
