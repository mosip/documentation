# PMS Configuration Guide

### Overview

The following guide outlines some important properties that can be customized for a given installation. Please note that this list is not exhaustive but serves as a checklist for reviewing properties that are likely to differ from the default settings. For a complete list of properties, refer to the files listed below.

### Configuration files

Partner Management Services uses the following configuration files:

Copy

```
application-default.properties
partner-management-default.properties
```

#### Auth allowed urls

This property is used by kernel-authcodeflowproxy-api to check request is coming from allowed urls not.

```
auth.allowed.urls=https://${mosip.pmp.host}/,https://${mosip.pmp.reactjs.ui.host}/
```

#### Key manager API calls

These properties are used to specify the keymanager API to upload certificates and get original partner uploaded certificates.

```
mosip.kernel.sign-url=${mosip.kernel.keymanager.url}/v1/keymanager/jwtSign
pms.cert.service.token.request.clientId=${mosip.pmp.auth.clientId}
pms.cert.service.token.request.issuerUrl=${mosip.kernel.authmanager.url}/v1/authmanager/authenticate/clientidsecretkey
pmp.ca.certificaticate.upload.rest.uri=${mosip.kernel.keymanager.url}/v1/keymanager/uploadCACertificate
pmp.partner.certificaticate.upload.rest.uri=${mosip.kernel.keymanager.url}/v1/keymanager/uploadPartnerCertificate
pmp.partner.certificaticate.get.rest.uri=${mosip.kernel.keymanager.url}/v1/keymanager/getPartnerCertificate/{partnerCertId}
pmp.partner.original.certificate.get.rest.uri=${mosip.kernel.keymanager.url}/v1/keymanager/getPartnerSignedCertificate/{partnerCertId}
pmp-keymanager.upload.other.domain.cert.rest.uri=${mosip.kernel.keymanager.url}/v1/keymanager/uploadOtherDomainCertificate
```

#### Auth Adapter rest template authentication configs

These properties are used to set attributes for partner management services.

* app id : ApplicationId for partner
* client id : Kernel auth client ID for partner management services
* client secret : Kernel auth secret key for partner management services

```
mosip.iam.adapter.clientid=${mosip.pmp.auth.clientId}
mosip.iam.adapter.clientsecret=${mosip.pmp.auth.secretKey}
mosip.iam.adapter.appid=${mosip.pmp.auth.appId}
```

#### Keycloak Configurations

These configurations are used to create user in keycloak and map to a role.

Note : All partner types should be created as roles in keycloak.

```
mosip.iam.realm.operations.base-url = ${keycloak.internal.url}/auth/admin/realms/{realmId}
mosip.iam.admin-url =${keycloak.internal.url}/auth/admin/
mosip.iam.admin-realm-id =admin
mosip.iam.roles-extn-url =realms/mosip/roles
mosip.iam.users-extn-url = realms/mosip/users
mosip.iam.role-user-mapping-url =/{userId}/role-mappings/realm
mosip.iam.open-id-url =${keycloak.internal.url}/auth/realms/{realmId}/protocol/openid-connect/
mosip.iam.master.realm-id=master
mosip.iam.default.realm-id=mosip
mosip.keycloak.admin.client.id=admin-cli
mosip.keycloak.admin.user.id=admin
mosip.keycloak.admin.secret.key=${keycloak.admin.password}
```

#### Auth Services API calls

These properties are used to specify the auth manager API to validate the token.

```
auth.server.validate.url=${mosip.kernel.authmanager.url}/v1/authmanager/authorize/admin/validateToken
auth.server.admin.validate.url=${mosip.kernel.authmanager.url}/v1/authmanager/authorize/admin/validateToken
auth.server.admin.allowed.audience=mosip-creser-client,mosip-datsha-client,mosip-ida-client,mosip-regproc-client,mosip-admin-client,mosip-reg-client,mosip-pms-client,mosip-resident-client,mosip-idrepo-client,mosip-deployment-client
auth.jwt.secret=authjwtsecret
auth.jwt.base=Mosip-Token

mosip.iam.adapter.issuerURL=${keycloak.internal.url}/auth/realms/mosip
mosip.authmanager.client-token-endpoint=${mosip.kernel.authmanager.url}/v1/authmanager/authenticate/clientidsecretkey
```

#### UI allowed roles

This property is used to populate required roles which should be allowed in UI.(Roles are nothing but partner types)

```
mosip.pms.ui.required.roles=AUTH_PARTNER,DEVICE_PROVIDER,CREDENTIAL_PARTNER,FTM_PROVIDER,MISP_PARTNER,POLICYMANAGER,PARTNER_ADMIN
```

#### URL to redirect after logout

These properties specify the url to redirect after logout and the end session endpoint in OIDC.

```
mosip.iam.post-logout-uri-param-key=post_logout_redirect_uri
mosip.iam.end-session-endpoint-path=/protocol/openid-connect/logout
```

#### MOSIP E-Signet config

These configurations specify the E-Signet claims mapping file url, amr-acr mapping file url and the service apis for create and update OIDC and OAuth Client.

```
mosip.pms.esignet.claims-mapping-file-url=https://raw.githubusercontent.com/mosip/mosip-config/develop/identity-mapping.json
mosip.pms.esignet.amr-acr-mapping-file-url=https://raw.githubusercontent.com/mosip/mosip-config/develop/amr-acr-mapping.json
mosip.pms.esignet.config-url=${mosip.esignet.service.url}/v1/esignet/oidc/.well-known/openid-configuration

mosip.pms.esignet.oidc-client-create-url=${mosip.esignet.service.url}/v1/esignet/client-mgmt/oidc-client
mosip.pms.esignet.oidc-client-update-url=${mosip.esignet.service.url}/v1/esignet/client-mgmt/oidc-client

mosip.pms.esignet.oauth-client-create-url=${mosip.esignet.service.url}/v1/esignet/client-mgmt/oauth-client
mosip.pms.esignet.oauth-client-update-url=${mosip.esignet.service.url}/v1/esignet/client-mgmt/oauth-client
```

#### User Session Idle Timeout

These properties are used to set the user inactivity idle time.

* Inactivity Timer : Specifies the duration (in minutes) before the session is timed out due to inactivity.
* Prompt Timer : Specifies the duration (in minutes) before the user is prompted about the impending session timeout.

Copy

```
mosip.pms.session.inactivity.timer=25
mosip.pms.session.inactivity.prompt.timer=5
```

#### Axios Timeout

This property is used to set the server request and response time(in minutes) for Axios.

Copy

```
mosip.pms.axios.timeout=3
```

#### OIDC Client Attributes

These properties are used to set attributes for OIDC client creation and update.

* Grant Types : Specifies the grant types used by the OIDC client.
* Client Authentication Methods : Specifies the client authentication methods.

Copy

```
mosip.pms.oidc.clients.grantTypes=authorization_code 
mosip.pms.oidc.clients.clientAuthMethods=private_key_jwt
```

#### Partner Type Roles

These properties specify partner type roles that are used to grant access to various APIs in partner management service.

Copy

```
mosip.role.pms.getallcertificatedetails=AUTH_PARTNER,ABIS_PARTNER,SDK_PARTNER,DEVICE_PROVIDER,FTM_PROVIDER,CREDENTIAL_PARTNER,PARTNER_ADMIN,ONLINE_VERIFICATION_PARTNER
mosip.role.pms.getallrequestedpolicies=AUTH_PARTNER,ABIS_PARTNER,SDK_PARTNER,CREDENTIAL_PARTNER,PARTNER_ADMIN,ONLINE_VERIFICATION_PARTNER
mosip.role.pms.getallapprovedauthpartnerpolicies=AUTH_PARTNER,PARTNER_ADMIN
mosip.role.pms.getallapprovedpartneridswithpolicygroups=AUTH_PARTNER,ABIS_PARTNER,SDK_PARTNER,CREDENTIAL_PARTNER,PARTNER_ADMIN,ONLINE_VERIFICATION_PARTNER
mosip.role.pms.getallapikeysforauthpartners=AUTH_PARTNER,PARTNER_ADMIN
mosip.role.pms.getalloidcclients=AUTH_PARTNER,PARTNER_ADMIN
mosip.role.pms.userconsent=AUTH_PARTNER,ABIS_PARTNER,SDK_PARTNER,DEVICE_PROVIDER,FTM_PROVIDER,CREDENTIAL_PARTNER,PARTNER_ADMIN,ONLINE_VERIFICATION_PARTNER
mosip.role.pms.getallpolicygroups=AUTH_PARTNER,CREDENTIAL_PARTNER,ONLINE_VERIFICATION_PARTNER,ABIS_PARTNER,MANUAL_ADJUDICATION,PARTNER_ADMIN,POLICYMANAGER
```
