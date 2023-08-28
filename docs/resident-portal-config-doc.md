# Resident Portal: Configuration Guide

The provided guide presents a list of essential properties that can be customised according to a specific installation. Please note that this list is not exhaustive but rather acts as a checklist to review properties that are expected to differ from their default settings. If you require access to all properties, please refer to the files mentioned below.

## Configuration files

Resident Service uses the following configuration files:

```
application-default.properties
resident-default.properties
```

### Database

Properties used for configuring the database.

```
mosip.resident.database.hostname=postgres-postgresql.postgres
mosip.resident.database.port=5432
javax.persistence.jdbc.driver=org.postgresql.Driver
javax.persistence.jdbc.url=jdbc:postgresql://${mosip.resident.database.hostname}:${mosip.resident.database.port}/mosip_resident
javax.persistence.jdbc.user=residentuser
javax.persistence.jdbc.password=******
```

### Token generation

```
resident.appid=resident
resident.clientId=******
resident.secretKey=******
token.request.issuerUrl=${mosip.keycloak.issuerUrl}
```

### Online Verification Partner

```
ida.online-verification-partner-id=******
```

### DB properties to skip automatic table creation in startup

```
hibernate.show_sql=false
hibernate.hbm2ddl.auto=none
hibernate.temp.use_jdbc_metadata_defaults=false
hibernate.jdbc.lob.non_contextual_creation = true
spring.jpa.properties.hibernate.temp.use_jdbc_metadata_defaults=false
```

### Allowed Authentication types and default unlock duration

These are the authentication types allowed for a resident and default unlock duration.

```
auth.types.allowed=otp-email,otp-phone,demo,bio-FINGER,bio-IRIS,bio-FACE
resident.auth-type.default.unlock.duration.seconds=100
```

### Template type codes for allowed Auth-type list (auth.types.allowed)

Templates type codes for authentication types:

```
resident.otp-email.template.property.attribute.list=mosip.otp-email.template.property
resident.otp-phone.template.property.attribute.list=mosip.otp-phone.template.property
resident.demo.template.property.attribute.list=mosip.demo.template.property
resident.bio-FINGER.template.property.attribute.list=mosip.bio-finger.template.property
resident.bio-IRIS.template.property.attribute.list=mosip.bio-iris.template.property
resident.bio-FACE.template.property.attribute.list=mosip.bio-face.template.property
```

### Validation properties

Below are the properties used for validation purpose:

```
mosip.id.validation.identity.phone=^([6-9]{1})([0-9]{9})$
mosip.id.validation.identity.email=^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-zA-Z]{2,})$
resident.grievance-redressal.alt-email.chars.limit=128
resident.grievance-redressal.alt-phone.chars.limit=64
resident.grievance-redressal.comments.chars.limit=1024
resident.share-credential.purpose.chars.limit=1024
mosip.resident.eid.length=16
mosip.resident.eventid.searchtext.length=${mosip.resident.eid.length}
resident.message.allowed.special.char.regex=^[A-Za-z0-9 .,-]+$
resident.purpose.allowed.special.char.regex=^[A-Za-z0-9 .,-]+$
resident.id.allowed.special.char.regex=^[0-9]+$
resident.document.validation.transaction-id.regex=^[0-9]{10}$
resident.document.validation.document-id.regex=^[A-Za-z0-9-]{20,}$
resident.validation.is-numeric.regex=^[0-9]+$
resident.otp.validation.transaction-id.regex=^[0-9]{10}$
resident.validation.event-id.regex=^[0-9]{${mosip.resident.eid.length}}$
```

### Security

```
mosip.security.csrf-enable:false
mosip.security.secure-cookie:false
```
### Keycloak authentication client

```
token.request.appid=resident
token.request.clientId=******
token.request.secretKey=******
```

### Keycloak authentication allowed audience

```
auth.server.admin.allowed.audience=mosip-resident-client,mosip-reg-client,${mosip.iam.module.clientID}
```

### Mapping Identity json to map with the applicant id json

```
registration.processor.identityjson=identity-mapping.json
```

### Machine creation and search configs

Properties used for machine specification and center:

```
resident.update-uin.machine-name-prefix = resident_machine_
resident.update-uin.machine-spec-id = RESIDENT-1
resident.update-uin.machine-zone-code = MOR
resident.center.id=10007
resident.machine.id=10011
```

### Auth Adapter rest template authentication configs

```
mosip.iam.adapter.appid=resident
mosip.iam.adapter.clientid=******
mosip.iam.adapter.clientsecret=******
```

### Exclusion list of URL patterns that should not be part of authentication and authorization

Property used to define the endpoints that should not be part of authentication.

```
mosip.service.end-points=/**/req/otp,/**/proxy/**/*,/**/validate-otp,/**/channel/verification-status,/**/req/credential/**,/**/req/card/*,/**/req/auth-history,/**/rid/check-status,/**/req/auth-lock,/**/req/auth-unlock,/**/req/update-uin,/**/req/print-uin,/**/req/euin,/**/credential/types,/**/req/policy/**,/**/aid/status,/**/individualId/otp,/**/mock/**,/**/callback/**,/**/download-card,/**/download/registration-centers-list/**,/**/download/supporting-documents/**,/**/vid/policy,/**/vid,/vid/**,/**/download/nearestRegistrationcenters/**,/**/authorize/admin/validateToken,/**/logout/user,/**/aid-stage/**
```

### Configuration for re-captcha

```
mosip.resident.captcha.enable=true
mosip.resident.captcha.id.validate=mosip.resident.captcha.id.validate
mosip.resident.captcha.sitekey=******
mosip.resident.captcha.secretkey=******
mosip.resident.captcha.resourse.url=http://resident-captcha.resident/resident/v1/captcha/validatecaptcha
mosip.resident.captcha.recaptcha.verify.url=https://www.google.com/recaptcha/api/siteverify
```

### Comma separated values of property keys to be exposed to UI

This property is used to define the keys of the properties to be exposed to UI.

```
resident.ui.propertyKeys=mosip.mandatory-languages,mosip.optional-languages,mosip.utc-datetime-pattern,mosip.iam.adapter.clientid,resident.datetime.pattern,mosip.resident.api.id.otp.request,mosip.resident.api.id.auth,mosip.resident.api.version.otp.request,mosip.resident.api.version.auth,mosip-prereg-host,mosip-prereg-ui-url,auth.types.allowed,resident.template.tnc.order-a-physical-card,resident.template.tnc.share-cred-with-partner,resident.template.tnc.update-demo,resident.view.history.serviceType.filters,resident.view.history.status.filters,resident.auth-type.default.unlock.duration.seconds,mosip.resident.grievance.url,mosip.api.public.host,mosip.resident.captcha.sitekey,mosip.resident.captcha.secretkey,mosip.webui.auto.logout.idle,mosip.webui.auto.logout.ping,mosip.webui.auto.logout.timeout,mosip.resident.download.registration.centre.file.name.convention,mosip.resident.download.supporting.document.file.name.convention,mosip.resident.download.personalized.card.naming.convention,mosip.resident.ack.manage_my_vid.name.convention,mosip.resident.ack.secure_my_id.name.convention,mosip.resident.ack.personalised_card.name.convention,mosip.resident.ack.update_my_data.name.convention,mosip.resident.ack.share_credential.name.convention,mosip.resident.ack.order_physical_card.name.convention,mosip.resident.ack.name.convention,mosip.resident.uin.card.name.convention,mosip.resident.vid.card.name.convention,mosip.resident.download.service.history.file.name.convention,mosip.resident.download.nearest.registration.centre.file.name.convention,auth.internal.id,auth.internal.version,mosip.registration.processor.print.id,mosip.registration.processor.application.version,vid.create.id,mosip.resident.create.vid.version,resident.vid.version,resident.vid.version.new,resident.revokevid.version,resident.revokevid.version.new,resident.vid.id,resident.vid.id.generate,resident.vid.policy.id,resident.vid.get.id,auth.type.status.id,resident.authlock.id,resident.checkstatus.id,resident.checkstatus.version,resident.euin.id,resident.printuin.id,resident.uin.id,resident.rid.id,resident.updateuin.id,resident.authunlock.id,resident.authhistory.id,resident.authLockStatusUpdateV2.id,resident.authLockStatusUpdateV2.version,resident.service.history.id,resident.service.history.version,resident.document.upload.id,resident.document.get.id,resident.document.get.version,resident.document.list.id,resident.document.list.version,resident.service.pin.status.id,resident.service.pin.status.version,resident.service.unpin.status.id,resident.service.unpin.status.version,resident.document.delete.id,resident.document.delete.version,resident.contact.details.update.id,resident.contact.details.send.otp.id,mosip.resident.service.status.check.id,mosip.resident.service.status.check.version,resident.service.unreadnotificationlist.id,resident.service.event.id,resident.service.event.version,resident.identity.info.id,resident.identity.info.version,resident.share.credential.id,resident.share.credential.version,mosip.resident.request.response.version,vid.revoke.id,resident.revokevid.id,mosip.resident.revokevid.id,mosip.resident.grievance.ticket.request.id,mosip.resident.grievance.ticket.request.version,resident.channel.verification.status.id,resident.channel.verification.status.version,resident.event.ack.download.id,resident.event.ack.download.version,resident.download.card.eventid.id ,resident.download.card.eventid.version,mosip.resident.request.vid.card.id,mosip.resident.request.vid.card.version,mosip.credential.request.service.id,mosip.credential.request.service.version,mosip.resident.checkstatus.individualid.id,mosip.resident.checkstatus.individualid.version,mosip.resident.download.personalized.card.id,mosip.resident.transliteration.transliterate.id,resident.ui.properties.id,resident.ui.properties.version,resident.nearby.centers.distance.meters,resident.ui.notification.update.interval.seconds,mosip.kernel.otp.expiry-time,resident.grievance-redressal.alt-email.chars.limit,resident.grievance-redressal.alt-phone.chars.limit,resident.grievance-redressal.comments.chars.limit,resident.share-credential.purpose.chars.limit,mosip.resident.eventid.searchtext.length,mosip.kernel.uin.length,mosip.kernel.vid.length,mosip.kernel.rid.length,mosip.resident.eid.length,mosip.kernel.otp.default-length,resident.message.allowed.special.char.regex,resident.purpose.allowed.special.char.regex,resident.id.allowed.special.char.regex,resident.version.new,mosip.resident.identity.auth.internal.id,resident.validation.event-id.regex,resident.document.validation.transaction-id.regex,resident.document.validation.document-id.regex,resident.validation.is-numeric.regex,resident.otp.validation.transaction-id.regex,,mosip.resident.captcha.enable,resident.download.reg.centers.list.id,resident.download.nearest.reg.centers.id,resident.download.supporting.documents.id,resident.send.card.id,resident.pinned.eventid.id,resident.unpinned.eventid.id,resident.auth.proxy.partners.id,resident.events.eventid.id,resident.notification.id,resident.profile.id,resident.notification.click.id,mosip.credential.store.id,resident.vids.id
```

### MOSIP e-Signet config

When enabling MOSIP e-Signet, comment Mock Keycloak config and vise versa.

```
mosip.iam.module.clientID=******
mosip.iam.module.clientsecret=
mosip.iam.base.url=https://${mosip.esignet.host}/v1/esignet
mosip.iam.authorization_endpoint=https://${mosip.esignet.host}/authorize
mosip.iam.token_endpoint=${mosip.iam.base.url}/oauth/token
mosip.iam.userinfo_endpoint=${mosip.iam.base.url}/oidc/userinfo
mosip.iam.certs_endpoint=${mosip.iam.base.url}/oauth/.well-known/jwks.json
auth.server.admin.issuer.uri=${mosip.iam.base.url}
auth.server.admin.issuer.domain.validate=true
auth.server.admin.oidc.userinfo.url=${mosip.iam.userinfo_endpoint}
mosip.iam.module.token.endpoint.private-key-jwt.auth.enabled=true
mosip.iam.module.token.endpoint.private-key-jwt.expiry.seconds=7200
mosip.resident.oidc.userinfo.jwt.signed=true
```

### Auth Adapter ValidateTokenHelper

This property will directly apply the certs URL without the need for constructing the path from issuer URL. This is useful for keeping different certs URL for integrating with MOSIP e-Signet for offline token validation.

```
auth.server.admin.oidc.certs.url=${mosip.iam.certs_endpoint}
mosip.iam.logout.offline=true
auth.server.admin.validate.url=
mosip.resident.oidc.userinfo.jwt.verify.enabled=false
```

### Resident login configuration for e-Signet

```
mosip.iam.module.redirecturi=${mosip.api.internal.url}/resident/v1/login-redirect/
mosip.iam.module.login_flow.name=authorization_code
mosip.iam.module.login_flow.scope=openid profile Manage-Identity-Data Manage-VID Manage-Authentication Manage-Service-Requests Manage-Credentials
mosip.iam.module.login_flow.claims={"userinfo":{"name":{"essential":true},"picture":{"essential":true},"email":{"essential":true},"phone_number":{"essential":true},"individual_id":{"essential":true}}}
mosip.iam.module.login_flow.response_type=code
mosip.iam.module.admin_realm_id=mosip
```

### User-info claim attributes

Used in open-id-connect based login with UIN/VID in MOSIP e-Signet(IDP)

```
mosip.resident.identity.claim.individual-id=individual_id
mosip.resident.identity.claim.ida-token=ida_token
```

### Scopes

Used for login purpose:

```
mosip.scope.resident.getinputattributevalues=Manage-Identity-Data
mosip.scope.resident.patchrevokevid=Manage-VID
mosip.scope.resident.postgeneratevid=Manage-VID
mosip.scope.resident.getvids=Manage-VID
mosip.scope.resident.getAuthTransactions=Manage-Service-Requests
mosip.scope.resident.postAuthTypeUnlock=Manage-Authentication
mosip.scope.resident.postAuthTypeStatus=Manage-Authentication
mosip.scope.resident.getAuthLockStatus=Manage-Authentication
mosip.scope.resident.patchUpdateUin=Manage-Identity-Data
mosip.scope.resident.getServiceAuthHistoryRoles=Manage-Service-Requests
mosip.scope.resident.postSendPhysicalCard=Manage-Credentials
mosip.scope.resident.getUnreadServiceList=Manage-Service-Requests
mosip.scope.resident.getNotificationCount=
mosip.scope.resident.getNotificationClick=Manage-Service-Requests
mosip.scope.resident.getupdatedttimes=Manage-Service-Requests
mosip.scope.resident.postRequestDownloadPersonalizedCard=Manage-Credentials
mosip.scope.resident.postRequestShareCredWithPartner=Manage-Credentials
mosip.scope.resident.postUnPinStatus=Manage-Service-Requests
mosip.scope.resident.postPinStatus=Manage-Service-Requests
mosip.scope.resident.getDownloadCard=Manage-Credentials
mosip.scope.resident.postPersonalizedCard=Manage-Credentials
mosip.scope.resident.getOrderRedirect=Manage-Credentials
```

### Key manager encryption/ decryption configuration

Properties used to define application and reference id.

```
APPLICATION_Id=RESIDENT
PARTNER_REFERENCE_Id=mpartner-default-resident
mosip.resident.keymanager.application-name=RESIDENT
mosip.resident.keymanager.reference-id=resident_document
mosip.datashare.application.id=PARTNER
mosip.datashare.reference.id=mparter-default-euin
mosip.resident.oidc.keymanager.reference.id=IDP_USER_INFO
mosip.resident.sign.pdf.application.id=KERNEL
mosip.resident.sign.pdf.reference.id=SIGN
```

### Object Store configuration

**For Minio**: object.store.s3.url=http://minio.minio:9000

**For AWS**: object.store.s3.url=s3.${s3.region}.amazonaws.com

```
mosip.resident.object.store.account-name=resident
mosip.resident.object.store.bucket-name=resident
mosip.resident.object.store.adapter-name=s3Adapter
object.store.s3.use.account.as.bucketname=true
object.store.s3.accesskey=******
object.store.s3.secretkey=******
object.store.s3.url=http://minio.minio:9000
object.store.s3.region=${s3.region}
object.store.s3.readlimit=10000000
```

### Virus Scanner configuration

Property used to enable virus scanner flag

```
mosip.resident.virus-scanner.enabled=true
```

### VID Policy URL

Property used to get the vid policy json:

```
mosip.resident.vid-policy-url=${config.server.file.storage.uri}mosip-vid-policy.json
```

### Resident UI Schema JSON file

Property used to get the UI schema json

```
resident-ui-schema-file-name-prefix=resident-ui
resident-ui-schema-file-url=${config.server.file.storage.uri}${resident-ui-schema-file-name-prefix}
resident-ui-schema-file-source-prefix=url:${resident-ui-schema-file-url}
```

### Identity Mapping JSON file

Property used to get the identity mapping json

```
identity-mapping-file-name=identity-mapping.json
identity-mapping-file-url=${config.server.file.storage.uri}${identity-mapping-file-name} 
identity-mapping-file-source=url:${identity-mapping-file-url}
```

### Credential Data format MVEL file name

This property is used to get the data format from MVEL file:

```
resident-data-format-mvel-file-name=credentialdata.mvel
resident-data-format-mvel-file-url=${config.server.file.storage.uri}${resident-data-format-mvel-file-name} 
resident-data-format-mvel-file-source=url:${resident-data-format-mvel-file-url}
```

### WebSub Topic and callback properties for auth-type status event

Below websub properties are used for authentication type status event:

```
resident.websub.authtype-status.secret=******
resident.websub.authtype-status.topic=AUTH_TYPE_STATUS_UPDATE_ACK
resident.websub.callback.authtype-status.relative.url=${server.servlet.context-path}/callback/authTypeCallback
resident.websub.callback.authtype-status.url=${mosip.api.internal.url}${resident.websub.callback.authtype-status.relative.url}
```

### WebSub Topic and callback properties for auth-transaction status event

Below websub properties used for authentication transaction status event:

```
resident.websub.authTransaction-status.secret=******
resident.websub.authTransaction-status.topic=AUTHENTICATION_TRANSACTION_STATUS
resident.websub.callback.authTransaction-status.relative.url=${server.servlet.context-path}/callback/authTransaction
resident.websub.callback.authTransaction-status.url=${mosip.api.internal.url}${resident.websub.callback.authTransaction-status.relative.url}
```

#### WebSub Topic and callback properties for credential status event

Below websub properties used for credential status event:

```
resident.websub.credential-status.secret=******
resident.websub.credential-status.topic=CREDENTIAL_STATUS_UPDATE
resident.websub.callback.credential-status.relative.url=${server.servlet.context-path}/callback/credentialStatusUpdate
resident.websub.callback.credential-status.url=${mosip.api.internal.url}${resident.websub.callback.credential-status.relative.url}
```

### TokenId generator

```
mosip.kernel.tokenid.uin.salt=******
mosip.kernel.tokenid.partnercode.salt=******
```

### Mask functions

Properties used to get the data format from MVEL file.

```
resident.email.mask.function=maskEmail
resident.phone.mask.function=maskPhone
resident.data.mask.function=convertToMaskData
```

### Batch job configuration for credential status update

```
mosip.resident.update.service.status.job.enabled=false
mosip.resident.update.service.status.job.initial-delay=60000
#Interval for checking the credential status for async requests. Note, this is done as a fallback though credential status update is hanlded in resident service via websub notification.
mosip.resident.update.service.status.job.interval.millisecs=600000
```

### Template type codes for terms & conditions

```
resident.template.tnc.order-a-physical-card=tnc-order-a-physical-card
resident.template.tnc.share-cred-with-partner=tnc-share-cred-with-partner
resident.template.tnc.update-demo=tnc-update-demo
```

### Template type codes for email subject

```
resident.template.email.subject.request-received.cust-and-down-my-card=cust-and-down-my-card-request-received-email-subject
resident.template.email.subject.success.cust-and-down-my-card=cust-and-down-my-card-success-email-subject
resident.template.email.subject.failure.cust-and-down-my-card=cust-and-down-my-card-failure-email-subject

resident.template.email.subject.request-received.order-a-physical-card=order-a-physical-card-request-received-email-subject
resident.template.email.subject.success.order-a-physical-card=order-a-physical-card-success-email-subject
resident.template.email.subject.failure.order-a-physical-card=order-a-physical-card-failure-email-subject

resident.template.email.subject.request-received.share-cred-with-partner=share-cred-with-partner-request-received-email-subject
resident.template.email.subject.success.share-cred-with-partner=share-cred-with-partner-success-email-subject
resident.template.email.subject.failure.share-cred-with-partner=share-cred-with-partner-failure-email-subject

resident.template.email.subject.request-received.lock-unlock-auth=lock-unlock-auth-request-received-email-subject
resident.template.email.subject.success.lock-unlock-auth=lock-unlock-auth-success-email-subject
resident.template.email.subject.failure.lock-unlock-auth=lock-unlock-auth-failure-email-subject

resident.template.email.subject.request-received.update-demo-data=update-demo-data-request-received-email-subject
resident.template.email.subject.success.update-demo-data=update-demo-data-success-email-subject
resident.template.email.subject.failure.update-demo-data=update-demo-data-failure-email-subject

resident.template.email.subject.request-received.gen-or-revoke-vid=gen-or-revoke-vid-request-received-email-subject
resident.template.email.subject.success.gen-or-revoke-vid=gen-or-revoke-vid-success-email-subject
resident.template.email.subject.failure.gen-or-revoke-vid=gen-or-revoke-vid-failure-email-subject

resident.template.email.subject.request-received.vid-card-download=vid-card-download-request-received-email-subject
resident.template.email.subject.success.vid-card-download=vid-card-download-success-email-subject
resident.template.email.subject.failure.vid-card-download=vid-card-download-failure-email-subject

resident.template.email.subject.request-received.get-my-uin-card=get-my-uin-card-request-received-email-subject
resident.template.email.subject.success.get-my-uin-card=get-my-uin-card-success-email-subject
resident.template.email.subject.failure.get-my-uin-card=get-my-uin-card-failure-email-subject

resident.template.email.subject.request-received.verify-my-phone-email=verify-my-phone-email-request-received-email-subject
resident.template.email.subject.success.verify-my-phone-email=verify-my-phone-email-success-email-subject
resident.template.email.subject.failure.verify-my-phone-email=verify-my-phone-email-failure-email-subject

resident.template.email.subject.success.send-otp=receive-otp-mail-subject
resident.template.email.subject.success.validate-otp=validate-otp-mail-subject
```




