# Changes in Role Management

## Partner Management Services

In previous versions (1.1.5.x) of our system, we utilized the `mosip-partner-client` for Partner Management Services (PMS). However, starting from version 1.2.0.1 onwards, we have implemented the use of `mosip-pms-client` instead. This transition has led to updates in service account roles, client scopes, and client configurations.&#x20;

Please find below the details of the changes made to service account roles and client scopes.

#### **Service account roles for Partner-Management-Services**

<table><thead><tr><th width="273"> mosip-partner-client (1.1.5.x)</th><th>mosip-pms-client (1.2.0.1)</th></tr></thead><tbody><tr><td>offline access</td><td>CREATE_SHARE</td></tr><tr><td>REGISTRATION_PROCESSOR</td><td>default_roles_mosip</td></tr><tr><td>uma_authorization</td><td>DEVICE_PROVIDER</td></tr><tr><td></td><td>PARTNER</td></tr><tr><td></td><td>PARTNER_ADMIN</td></tr><tr><td></td><td>PMS_ADMIN</td></tr><tr><td></td><td>PMS_USER</td></tr><tr><td></td><td>PUBLISH_APIKEY_APPROVED_GENERAL</td></tr><tr><td></td><td>PUBLISH_APIKEY_UPDATED _GENERAL</td></tr><tr><td></td><td>PUBLISH_CA_CERTIFICATE_UPLOADED_GENERAL</td></tr><tr><td></td><td>PUBLISH_MISP_LICENSE_GENERATED_GENERAL</td></tr><tr><td></td><td>PUBLISH_MISP_LICENSE_UPDATED_GENERAL</td></tr><tr><td></td><td>PUBLISH_OIDC_CLIENT_CREATED_GENERAL</td></tr><tr><td></td><td>PUBLISH_OIDC_CLIENT_UPDATED _GENERAL</td></tr><tr><td></td><td>PUBLISH_PARTNER _UPDATED _GENERAL</td></tr><tr><td></td><td>PUBLISH_POLICY_UPDATED _GENERAL</td></tr><tr><td></td><td>REGISTRATION_PROCESSOR</td></tr><tr><td></td><td>SUBSCRIBE_CA_CERTIFICATE_UPLOADED_GENERAL</td></tr><tr><td></td><td>ZONAL_ADMIN</td></tr></tbody></table>

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

