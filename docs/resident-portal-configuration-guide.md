# Resident Portal Configuration Guide

### Overview

The guide here lists down some of the important properties that may be customized for a given installation. Note that the listing here is not exhaustive, but a checklist to review properties that are likely to be different from default. If you would like to see all the properties, then refer to the files listed below.

### Configuration files

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

### Logger related properties

URL pattern for logging filter. For example, "/callback/\*_" .Defaults to "/\*_".

```
logging.level.root=INFO
logging.level.io.mosip.resident.batch=INFO
logging.level.io.mosip.resident.filter=DEBUG
resident.logging.filter.enabled=false
resident.logging.filter.url.pattern=/*
```

### Rest template logger filter

This will print the request details such as URL, headers and body for debugging purpose. Default is false.

```
logging.level.io.mosip.resident.config.LoggingInterceptor=DEBUG
resident.rest.template.logging.interceptor.filter.enabled=false
```

### DB calls logger filter

This will print the repository method calls for debugging purpose. Default is false.

```
logging.level.io.mosip.resident.aspect.DatabaseLoggingAspect=DEBUG
resident.db.logging.aspect.enabled=false
```

### Micrometer metrics for DB response time & rest template API call response time

```
resident.db.metrics.aspect.enabled=true
resident.rest.template.metrics.interceptor.filter.enabled=true
```

### Websub topic subscription and WebsubCallbackRequestDecoratorFilter

```
subscriptions-delay-on-startup_millisecs=120000
re-subscription-interval-in-seconds=43200
resident.websub.request.decorator.filter.enabled=true
```

### Partner details

```
mosip.ida.partner.type=******
ida.online-verification-partner-id=******
idrepo-dummy-online-verification-partner-id=******
resident.share-credential.partner.type=******
resident.authentication-request.partner.type=******
resident.order-physical-card.partner.type=******
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

### Template type codes for allowed Auth-type list (auth.types.allowed)-

Templates type codes for authentication types

```
resident.otp-email.template.property.attribute.list=mosip.otp-email.template.property
resident.otp-phone.template.property.attribute.list=mosip.otp-phone.template.property
resident.demo.template.property.attribute.list=mosip.demo.template.property
resident.bio-FINGER.template.property.attribute.list=mosip.bio-finger.template.property
resident.bio-IRIS.template.property.attribute.list=mosip.bio-iris.template.property
resident.bio-FACE.template.property.attribute.list=mosip.bio-face.template.property
```

### Template type codes for Auth-type status-

Templates type codes for authentication types status

```
resident.UNLOCKED.template.property.attribute.list=mosip.unlocked.template.property
resident.LOCKED.template.property.attribute.list=mosip.locked.template.property
```

### Validation properties

Below are the properties used for validation purpose.

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

Properties used for machine specification and center

```
resident.update-uin.machine-name-prefix = resident_machine_
resident.update-uin.machine-spec-id = RESIDENT-1
resident.update-uin.machine-zone-code = MOR
resident.center.id=10007
resident.machine.id=10045
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

### Configuration for google re-captcha

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
resident.ui.propertyKeys=mosip.mandatory-languages,mosip.optional-languages,mosip.utc-datetime-pattern,mosip.iam.adapter.clientid,resident.datetime.pattern,mosip.resident.api.id.otp.request,mosip.resident.api.id.auth,mosip.resident.api.version.otp.request,mosip.resident.api.version.auth,mosip-prereg-host,mosip-prereg-ui-url,auth.types.allowed,resident.view.history.serviceType.filters,resident.view.history.status.filters,resident.auth-type.default.unlock.duration.seconds,mosip.resident.grievance.url,mosip.api.public.host,mosip.resident.captcha.sitekey,mosip.resident.captcha.secretkey,mosip.webui.auto.logout.idle,mosip.webui.auto.logout.ping,mosip.webui.auto.logout.timeout,mosip.resident.download.registration.centre.file.name.convention,mosip.resident.download.supporting.document.file.name.convention,mosip.resident.download.personalized.card.naming.convention,mosip.resident.ack.manage_my_vid.name.convention,mosip.resident.ack.secure_my_id.name.convention,mosip.resident.ack.personalised_card.name.convention,mosip.resident.ack.update_my_data.name.convention,mosip.resident.ack.share_credential.name.convention,mosip.resident.ack.order_physical_card.name.convention,mosip.resident.ack.name.convention,mosip.resident.uin.card.name.convention,mosip.resident.vid.card.name.convention,mosip.resident.download.service.history.file.name.convention,mosip.resident.download.nearest.registration.centre.file.name.convention,auth.internal.id,auth.internal.version,mosip.registration.processor.print.id,mosip.registration.processor.application.version,vid.create.id,mosip.resident.create.vid.version,resident.vid.version,resident.vid.version.new,resident.revokevid.version,resident.revokevid.version.new,resident.vid.id,resident.vid.id.generate,resident.vid.policy.id,resident.vid.get.id,auth.type.status.id,resident.authlock.id,resident.checkstatus.id,resident.checkstatus.version,resident.euin.id,resident.printuin.id,resident.uin.id,resident.rid.id,resident.updateuin.id,resident.authunlock.id,resident.authhistory.id,resident.authLockStatusUpdateV2.id,resident.authLockStatusUpdateV2.version,resident.service.history.id,resident.service.history.version,resident.document.upload.id,resident.document.get.id,resident.document.get.version,resident.document.list.id,resident.document.list.version,resident.service.pin.status.id,resident.service.pin.status.version,resident.service.unpin.status.id,resident.service.unpin.status.version,resident.document.delete.id,resident.document.delete.version,resident.contact.details.update.id,resident.contact.details.send.otp.id,mosip.resident.service.status.check.id,mosip.resident.service.status.check.version,resident.service.unreadnotificationlist.id,resident.service.event.id,resident.service.event.version,resident.identity.info.id,resident.identity.info.version,resident.share.credential.id,resident.share.credential.version,mosip.resident.request.response.version,vid.revoke.id,resident.revokevid.id,mosip.resident.revokevid.id,mosip.resident.grievance.ticket.request.id,mosip.resident.grievance.ticket.request.version,resident.channel.verification.status.id,resident.channel.verification.status.version,resident.event.ack.download.id,resident.event.ack.download.version,resident.download.card.eventid.id ,resident.download.card.eventid.version,mosip.resident.request.vid.card.id,mosip.resident.request.vid.card.version,mosip.credential.request.service.id,mosip.credential.request.service.version,mosip.resident.checkstatus.individualid.id,mosip.resident.checkstatus.individualid.version,mosip.resident.download.personalized.card.id,mosip.resident.transliteration.transliterate.id,resident.ui.properties.id,resident.ui.properties.version,resident.nearby.centers.distance.meters,resident.ui.notification.update.interval.seconds,mosip.kernel.otp.expiry-time,resident.grievance-redressal.alt-email.chars.limit,resident.grievance-redressal.alt-phone.chars.limit,resident.grievance-redressal.comments.chars.limit,resident.share-credential.purpose.chars.limit,mosip.resident.eventid.searchtext.length,mosip.kernel.uin.length,mosip.kernel.vid.length,mosip.kernel.rid.length,mosip.resident.eid.length,mosip.kernel.otp.default-length,resident.message.allowed.special.char.regex,resident.purpose.allowed.special.char.regex,resident.id.allowed.special.char.regex,resident.version.new,mosip.resident.identity.auth.internal.id,resident.validation.event-id.regex,resident.document.validation.transaction-id.regex,resident.document.validation.document-id.regex,resident.validation.is-numeric.regex,resident.otp.validation.transaction-id.regex,,mosip.resident.captcha.enable,resident.download.reg.centers.list.id,resident.download.nearest.reg.centers.id,resident.download.supporting.documents.id,resident.send.card.id,resident.pinned.eventid.id,resident.unpinned.eventid.id,resident.auth.proxy.partners.id,resident.events.eventid.id,resident.notification.id,resident.profile.id,resident.notification.click.id,mosip.credential.store.id,resident.vids.id,mosip.resident.zoom,mosip.resident.maxZoom,mosip.resident.minZoom
```

### Auth allowed urls

```
auth.allowed.urls=https://${mosip.resident.host}/,https://${mosip.resident.host}/resident-ui/,https://${mosip.resident.host}/resident-ui/**
```

### MOSIP E-Signet config

When enabling MOSIP E-Signet comment Mock Keycloak config, vise versa.

```
mosip.iam.module.clientID=******
mosip.iam.module.clientsecret=
mosip.iam.base.url=https://${mosip.esignet.host}/v1/esignet
mosip.iam.authorization_endpoint=https://${mosip.esignet.host}/authorize
mosip.iam.token_endpoint=${mosip.iam.base.url}/oauth/v2/token
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

This property will directly apply the certs URL without need for constructing the path from issuer URL. This is useful to keep a different certs URL for integrating with MOSIP IDP for offline token validation.

```
auth.server.admin.oidc.certs.url=${mosip.iam.certs_endpoint}
mosip.iam.logout.offline=true
auth.server.admin.validate.url=
mosip.resident.oidc.userinfo.jwt.verify.enabled=false
```

### Resident login configuration for E-Signet

```
mosip.iam.module.redirecturi=${mosip.api.internal.url}/resident/v1/login-redirect/
mosip.iam.module.login_flow.name=authorization_code
mosip.iam.module.login_flow.scope=openid profile Manage-Identity-Data Manage-VID Manage-Authentication Manage-Service-Requests Manage-Credentials
mosip.iam.module.login_flow.claims={"userinfo":{"name":{"essential":true},"picture":{"essential":true},"email":{"essential":true},"phone_number":{"essential":true},"individual_id":{"essential":true}}}
mosip.iam.module.login_flow.response_type=code
mosip.iam.module.admin_realm_id=mosip
```

### User-info claim attributes

Used in open-id-connect based login with UIN/VID in MOSIP-IDP

```
mosip.resident.identity.claim.individual-id=individual_id
mosip.resident.identity.claim.ida-token=ida_token
```

### Scopes

Used for login purpose

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

### Key manager encryption/decryption configuration

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

To configure the 'Object Store Configuration' update the 'Object Store URL'  and other properties as below:

object.store.s3.url=http://exampleurl:port

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

Property used whether to enable virus scanner flag

```
mosip.resident.virus-scanner.enabled=true
```

### VID Policy URL

Property used to get the vid policy json

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

This property is used to get the data format from MVEL file

```
resident-data-format-mvel-file-name=credentialdata.mvel
resident-data-format-mvel-file-url=${config.server.file.storage.uri}${resident-data-format-mvel-file-name} 
resident-data-format-mvel-file-source=url:${resident-data-format-mvel-file-url}
```

### WebSub Topic and callback properties for auth-type status event

Below websub properties used for authentication type status event

```
resident.websub.authtype-status.secret=******
resident.websub.authtype-status.topic=AUTH_TYPE_STATUS_UPDATE_ACK
resident.websub.callback.authtype-status.relative.url=${server.servlet.context-path}/callback/authTypeCallback
resident.websub.callback.authtype-status.url=${mosip.api.internal.url}${resident.websub.callback.authtype-status.relative.url}
```

### WebSub Topic and callback properties for auth-transaction status event

Below websub properties used for authentication transaction status event

```
resident.websub.authTransaction-status.secret=******
resident.websub.authTransaction-status.topic=AUTHENTICATION_TRANSACTION_STATUS
resident.websub.callback.authTransaction-status.relative.url=${server.servlet.context-path}/callback/authTransaction
resident.websub.callback.authTransaction-status.url=${mosip.api.internal.url}${resident.websub.callback.authTransaction-status.relative.url}
```

### WebSub Topic and callback properties for credential status event

Below websub properties used for credential status event

```
resident.websub.credential-status.secret=******
resident.websub.credential-status.topic=CREDENTIAL_STATUS_UPDATE
resident.websub.callback.credential-status.relative.url=${server.servlet.context-path}/callback/credentialStatusUpdate
resident.websub.callback.credential-status.url=${mosip.api.internal.url}${resident.websub.callback.credential-status.relative.url}
```

### WebSub Topic and callback properties for regproc complete workflow event

Below websub properties used for regproc complete workflow event

```
resident.websub.regproc.workflow.complete.secret=*****
mosip.regproc.workflow.complete.topic=REGISTRATION_PROCESSOR_WORKFLOW_COMPLETED_EVENT
resident.websub.callback.regproc.workflow.complete.relative.url=${server.servlet.context-path}/callback/regprocworkflow
resident.websub.callback.regproc.workflow.complete.url=${mosip.api.internal.url}${resident.websub.callback.regproc.workflow.complete.relative.url}
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

### Template type codes for email subject

```
resident.template.email.subject.request-received.DOWNLOAD_PERSONALIZED_CARD=cust-and-down-my-card-request-received-email-subject
resident.template.email.subject.success.DOWNLOAD_PERSONALIZED_CARD=cust-and-down-my-card-success-email-subject
resident.template.email.subject.failure.DOWNLOAD_PERSONALIZED_CARD=cust-and-down-my-card-failure-email-subject

resident.template.email.subject.request-received.ORDER_PHYSICAL_CARD=order-a-physical-card-request-received-email-subject
resident.template.email.subject.success.ORDER_PHYSICAL_CARD=order-a-physical-card-success-email-subject
resident.template.email.subject.failure.ORDER_PHYSICAL_CARD=order-a-physical-card-failure-email-subject

resident.template.email.subject.request-received.SHARE_CRED_WITH_PARTNER=share-cred-with-partner-request-received-email-subject
resident.template.email.subject.success.SHARE_CRED_WITH_PARTNER=share-cred-with-partner-success-email-subject
resident.template.email.subject.failure.SHARE_CRED_WITH_PARTNER=share-cred-with-partner-failure-email-subject

resident.template.email.subject.request-received.AUTH_TYPE_LOCK_UNLOCK=lock-unlock-auth-request-received-email-subject
resident.template.email.subject.success.AUTH_TYPE_LOCK_UNLOCK=lock-unlock-auth-success-email-subject
resident.template.email.subject.failure.AUTH_TYPE_LOCK_UNLOCK=lock-unlock-auth-failure-email-subject

resident.template.email.subject.request-received.UPDATE_MY_UIN=update-demo-data-request-received-email-subject
resident.template.email.subject.success.UPDATE_MY_UIN=update-demo-data-success-email-subject
resident.template.email.subject.failure.UPDATE_MY_UIN=update-demo-data-failure-email-subject
resident.template.email.subject.regproc-success.UPDATE_MY_UIN=update-demo-data-regproc-success-email-subject
resident.template.email.subject.regproc-failure.UPDATE_MY_UIN=update-demo-data-regproc-failure-email-subject
resident.template.email.subject.cancelled.UPDATE_MY_UIN=update-demo-data-discarded-email-subject

resident.template.email.subject.request-received.GENERATE_VID=gen-or-revoke-vid-request-received-email-subject
resident.template.email.subject.success.GENERATE_VID=gen-or-revoke-vid-success-email-subject
resident.template.email.subject.failure.GENERATE_VID=gen-or-revoke-vid-failure-email-subject

resident.template.email.subject.request-received.REVOKE_VID=gen-or-revoke-vid-request-received-email-subject
resident.template.email.subject.success.REVOKE_VID=gen-or-revoke-vid-success-email-subject
resident.template.email.subject.failure.REVOKE_VID=gen-or-revoke-vid-failure-email-subject

resident.template.email.subject.request-received.VID_CARD_DOWNLOAD=vid-card-download-request-received-email-subject
resident.template.email.subject.success.VID_CARD_DOWNLOAD=vid-card-download-success-email-subject
resident.template.email.subject.failure.VID_CARD_DOWNLOAD=vid-card-download-failure-email-subject

resident.template.email.subject.request-received.GET_MY_ID=get-my-uin-card-request-received-email-subject
resident.template.email.subject.success.GET_MY_ID=get-my-uin-card-success-email-subject
resident.template.email.subject.failure.GET_MY_ID=get-my-uin-card-failure-email-subject

resident.template.email.subject.request-received.VALIDATE_OTP=verify-my-phone-email-request-received-email-subject
resident.template.email.subject.success.VALIDATE_OTP=verify-my-phone-email-success-email-subject
resident.template.email.subject.failure.VALIDATE_OTP=verify-my-phone-email-failure-email-subject

resident.template.email.subject.success.SEND_OTP=receive-otp-mail-subject
```

### Template type codes for email content

```
resident.template.email.content.request-received.DOWNLOAD_PERSONALIZED_CARD=cust-and-down-my-card-request-received-email-content
resident.template.email.content.success.DOWNLOAD_PERSONALIZED_CARD=cust-and-down-my-card-success-email-content
resident.template.email.content.failure.DOWNLOAD_PERSONALIZED_CARD=cust-and-down-my-card-failure-email-content

resident.template.email.content.request-received.ORDER_PHYSICAL_CARD=order-a-physical-card-request-received-email-content
resident.template.email.content.success.ORDER_PHYSICAL_CARD=order-a-physical-card-success-email-content
resident.template.email.content.failure.ORDER_PHYSICAL_CARD=order-a-physical-card-failure-email-content

resident.template.email.content.request-received.SHARE_CRED_WITH_PARTNER=share-cred-with-partner-request-received-email-content
resident.template.email.content.success.SHARE_CRED_WITH_PARTNER=share-cred-with-partner-success-email-content
resident.template.email.content.failure.SHARE_CRED_WITH_PARTNER=share-cred-with-partner-failure-email-content

resident.template.email.content.request-received.AUTH_TYPE_LOCK_UNLOCK=lock-unlock-auth-request-received-email-content
resident.template.email.content.success.AUTH_TYPE_LOCK_UNLOCK=lock-unlock-auth-success-email-content
resident.template.email.content.failure.AUTH_TYPE_LOCK_UNLOCK=lock-unlock-auth-failure-email-content

resident.template.email.content.request-received.UPDATE_MY_UIN=update-demo-data-request-received-email-content
resident.template.email.content.success.UPDATE_MY_UIN=update-demo-data-success-email-content
resident.template.email.content.failure.UPDATE_MY_UIN=update-demo-data-failure-email-content
resident.template.email.content.regproc-success.UPDATE_MY_UIN=update-demo-data-regproc-success-email-content
resident.template.email.content.regproc-failure.UPDATE_MY_UIN=update-demo-data-regproc-failure-email-content
resident.template.email.content.cancelled.UPDATE_MY_UIN=update-demo-data-discarded-email-content

resident.template.email.content.request-received.GENERATE_VID=gen-or-revoke-vid-request-received-email-content
resident.template.email.content.success.GENERATE_VID=gen-or-revoke-vid-success-email-content
resident.template.email.content.failure.GENERATE_VID=gen-or-revoke-vid-failure-email-content

resident.template.email.content.request-received.REVOKE_VID=gen-or-revoke-vid-request-received-email-content
resident.template.email.content.success.REVOKE_VID=gen-or-revoke-vid-success-email-content
resident.template.email.content.failure.REVOKE_VID=gen-or-revoke-vid-failure-email-content

resident.template.email.content.request-received.VID_CARD_DOWNLOAD=vid-card-download-request-received-email-content
resident.template.email.content.success.VID_CARD_DOWNLOAD=vid-card-download-success-email-content
resident.template.email.content.failure.VID_CARD_DOWNLOAD=vid-card-download-failure-email-content

resident.template.email.content.request-received.GET_MY_ID=get-my-uin-card-request-received-email-content
resident.template.email.content.success.GET_MY_ID=get-my-uin-card-success-email-content
resident.template.email.content.failure.GET_MY_ID=get-my-uin-card-failure-email-content

resident.template.email.content.request-received.VALIDATE_OTP=verify-my-phone-email-request-received-email-content
resident.template.email.content.success.VALIDATE_OTP=verify-my-phone-email-success-email-content
resident.template.email.content.failure.VALIDATE_OTP=verify-my-phone-email-failure-email-content

resident.template.email.content.success.SEND_OTP=receive-otp-mail-content
```

### Template type codes for SMS content

```
resident.template.sms.request-received.DOWNLOAD_PERSONALIZED_CARD=cust-and-down-my-card-request-received_SMS
resident.template.sms.success.DOWNLOAD_PERSONALIZED_CARD=cust-and-down-my-card-success_SMS
resident.template.sms.failure.DOWNLOAD_PERSONALIZED_CARD=cust-and-down-my-card-failure_SMS

resident.template.sms.request-received.ORDER_PHYSICAL_CARD=order-a-physical-card-request-received_SMS
resident.template.sms.success.ORDER_PHYSICAL_CARD=order-a-physical-card-success_SMS
resident.template.sms.failure.ORDER_PHYSICAL_CARD=order-a-physical-card-failure_SMS

resident.template.sms.request-received.SHARE_CRED_WITH_PARTNER=share-cred-with-partner-request-received_SMS
resident.template.sms.success.SHARE_CRED_WITH_PARTNER=share-cred-with-partner-success_SMS
resident.template.sms.failure.SHARE_CRED_WITH_PARTNER=share-cred-with-partner-failure_SMS

resident.template.sms.request-received.AUTH_TYPE_LOCK_UNLOCK=lock-unlock-auth-request-received_SMS
resident.template.sms.success.AUTH_TYPE_LOCK_UNLOCK=lock-unlock-auth-success_SMS
resident.template.sms.failure.AUTH_TYPE_LOCK_UNLOCK=lock-unlock-auth-failure_SMS

resident.template.sms.request-received.UPDATE_MY_UIN=update-demo-data-request-received_SMS
resident.template.sms.success.UPDATE_MY_UIN=update-demo-data-success_SMS
resident.template.sms.failure.UPDATE_MY_UIN=update-demo-data-failure_SMS
resident.template.sms.regproc-success.UPDATE_MY_UIN=update-demo-data-regproc-success_SMS
resident.template.sms.regproc-failure.UPDATE_MY_UIN=update-demo-data-regproc-failure_SMS
resident.template.sms.cancelled.UPDATE_MY_UIN=update-demo-data-discarded-SMS

resident.template.sms.request-received.GENERATE_VID=gen-or-revoke-vid-request-received_SMS
resident.template.sms.success.GENERATE_VID=gen-or-revoke-vid-success_SMS
resident.template.sms.failure.GENERATE_VID=gen-or-revoke-vid-failure_SMS

resident.template.sms.request-received.REVOKE_VID=gen-or-revoke-vid-request-received_SMS
resident.template.sms.success.REVOKE_VID=gen-or-revoke-vid-success_SMS
resident.template.sms.failure.REVOKE_VID=gen-or-revoke-vid-failure_SMS

resident.template.sms.request-received.VID_CARD_DOWNLOAD=vid-card-download-request-received_SMS
resident.template.sms.success.VID_CARD_DOWNLOAD=vid-card-download-success_SMS
resident.template.sms.failure.VID_CARD_DOWNLOAD=vid-card-download-failure_SMS

resident.template.sms.request-received.GET_MY_ID=get-my-uin-card-request-received_SMS
resident.template.sms.success.GET_MY_ID=get-my-uin-card-success_SMS
resident.template.sms.failure.GET_MY_ID=get-my-uin-card-failure_SMS

resident.template.sms.request-received.VALIDATE_OTP=verify-my-phone-email-request-received_SMS
resident.template.sms.success.VALIDATE_OTP=verify-my-phone-email-success_SMS
resident.template.sms.failure.VALIDATE_OTP=verify-my-phone-email-failure_SMS

resident.template.sms.success.SEND_OTP=receive-otp
```

### Template type codes for purpose (success) content

```
resident.template.purpose.success.DOWNLOAD_PERSONALIZED_CARD=cust-and-down-my-card-positive-purpose
resident.template.purpose.success.ORDER_PHYSICAL_CARD=order-a-physical-card-positive purpose
resident.template.purpose.success.SHARE_CRED_WITH_PARTNER=share-cred-with-partner-positive-purpose
resident.template.purpose.success.AUTH_TYPE_LOCK_UNLOCK=lock-unlock-auth-positive-purpose
resident.template.purpose.success.UPDATE_MY_UIN=update-demo-data-positive-purpose
resident.template.purpose.success.GENERATE_VID=gen-or-revoke-vid-positive-purpose
resident.template.purpose.success.REVOKE_VID=gen-or-revoke-vid-positive-purpose
resident.template.purpose.success.GET_MY_ID=get-my-uin-card-positive-purpose
resident.template.purpose.success.VALIDATE_OTP=verify-my-phone-email-positive-purpose
resident.template.purpose.success.VID_CARD_DOWNLOAD=vid-card-download-positive-purpose
```

### Template type codes for purpose (in-progress/failure) content

```
resident.template.purpose.failure.DOWNLOAD_PERSONALIZED_CARD=cust-and-down-my-card-negative-purpose
resident.template.purpose.failure.ORDER_PHYSICAL_CARD=order-a-physical-card-negative purpose
resident.template.purpose.failure.SHARE_CRED_WITH_PARTNER=share-cred-with-partner-negative-purpose
resident.template.purpose.failure.AUTH_TYPE_LOCK_UNLOCK=lock-unlock-auth-negative-purpose
resident.template.purpose.failure.UPDATE_MY_UIN=update-demo-data-negative-purpose
resident.template.purpose.failure.GENERATE_VID=gen-or-revoke-vid-negative-purpose
resident.template.purpose.failure.REVOKE_VID=gen-or-revoke-vid-negative-purpose
resident.template.purpose.failure.GET_MY_ID=get-my-uin-card-negative-purpose
resident.template.purpose.failure.VALIDATE_OTP=verify-my-phone-email-negative-purpose
resident.template.purpose.failure.VID_CARD_DOWNLOAD=vid-card-download-negative-purpose
```

## Template type codes for purpose (Cancelled) content

```
resident.template.purpose.cancelled.UPDATE_MY_UIN=update-demo-data-cancelled-purpose
```

## Template type codes for purpose(Identity updated) content

```
resident.template.purpose.regproc-success.UPDATE_MY_UIN=update-demo-data-regproc-success-purpose
```

### Template type codes for summary (success) content

```
resident.template.summary.success.DOWNLOAD_PERSONALIZED_CARD=cust-and-down-my-card-success-summary
resident.template.summary.success.ORDER_PHYSICAL_CARD=order-a-physical-card-success-summary
resident.template.summary.success.SHARE_CRED_WITH_PARTNER=share-cred-with-partner-success-summary
resident.template.summary.success.AUTH_TYPE_LOCK_UNLOCK=lock-unlock-auth-success-summary
resident.template.summary.success.UPDATE_MY_UIN=update-demo-data-success-summary
resident.template.summary.success.GENERATE_VID=gen-or-revoke-vid-success-summary
resident.template.summary.success.REVOKE_VID=gen-or-revoke-vid-success-summary
resident.template.summary.success.GET_MY_ID=get-my-uin-card-success-summary
resident.template.summary.success.VALIDATE_OTP=verify-my-phone-email-success-summary
resident.template.summary.success.VID_CARD_DOWNLOAD=vid-card-download-positive-summary
```

## Template type code for summary (cancelled) content

```
resident.template.summary.cancelled.UPDATE_MY_UIN=update-demo-data-cancelled-summary
```

## Template type code for summary (regproc-success) content

```
resident.template.summary.regproc-success.UPDATE_MY_UIN=update-demo-data-regproc-success-summary
```

### Template type codes for acknowledgement PDFs

```
resident.template.ack.share-cred-with-partner=acknowledgement-share-cred-with-partner
resident.template.ack.manage-my-vid=acknowledgement-manage-my-vid
resident.template.ack.order-a-physical-card=acknowledgement-order-a-physical-card
resident.template.ack.download-a-personalized-card=acknowledgement-download-a-personalized-card
resident.template.ack.update-demographic-data=acknowledgement-update-demographic-data
resident.template.ack.verify-email-id-or-phone-number=acknowledgement-verify-email-id-or-phone-number
resident.template.ack.secure-my-id=acknowledgement-secure-my-id
resident.template.ack.authentication.request=acknowledgment-authentication-request
resident.template.ack.get.my.id=acknowledgment-get-my-id
resident.template.ack.vid.card.download=acknowledgment-vid-card-download
```

### Template type codes for supporting documents, service history, registration centers and vid card

```
resident.template.support-docs-list=supporting-docs-list
mosip.resident.service.history.template.type.code=service-history-type
resident.template.registration.centers.list=registration-centers-list
mosip.resident.vid.card.template.property=vid-card-type
```

### Template required properties

```
resident.template.date.pattern=dd-MM-yyyy
resident.template.time.pattern=HH:mm:ss
resident.ui.track-service-request-url=https://${mosip.resident.host}/#/uinservices/trackservicerequest?eid=
```

### View history filters

```
resident.view.history.serviceType.filters=ALL,AUTHENTICATION_REQUEST,SERVICE_REQUEST,DATA_UPDATE_REQUEST,ID_MANAGEMENT_REQUEST,DATA_SHARE_REQUEST
resident.view.history.status.filters=ALL,SUCCESS,IN_PROGRESS,FAILED,CANCELED
```

### Maximum data to download in a PDF

```
resident.service-history.download.max.count=100
resident.registration-centers.download.max.count=100
```

### The Registration centers will be searched based on the distance value in meters from the Geo location identified

```
resident.nearby.centers.distance.meters=2000
```

### Page size in Bell Icon Notification list and view history

```
resident.notifications.default.page.size=100
resident.view-history.default.page.size=10
```

### Token related config

```
auth.validate.id-token=true
idToken=id_token
auth.token.header=Authorization
mosip.resident.access_token.auth_mode.claim-name=acr
mosip.resident.oidc.id_token.ida_token.claim-name=sub
mosip.resident.oidc.auth_token.expiry.claim-name=exp
mosip.resident.oidc.userinfo.encryption.enabled=false
mosip.client.assertion.reference.id=
mosip.include.payload=true
mosip.include.certificate=true
mosip.include.cert.hash=false
```

### Rectangle coordinates for PDF signed data

```
mosip.resident.service.uincard.lowerleftx=73
mosip.resident.service.uincard.lowerlefty=100
mosip.resident.service.uincard.upperrightx=300
mosip.resident.service.uincard.upperrighty=300
mosip.resident.service.uincard.signature.reason="Digitally Signed"
```

### File name for the downloaded PDFs

```
mosip.resident.download.registration.centre.file.name.convention=Registration_centers_{timestamp}
mosip.resident.download.supporting.document.file.name.convention=Supporting_documents_{timestamp}
mosip.resident.download.personalized.card.naming.convention=Personalised_card_{eventId}_{timestamp}
mosip.resident.ack.manage_my_vid.name.convention=Ack_{featureName}_{eventId}_{timestamp}
mosip.resident.ack.secure_my_id.name.convention=Ack_{featureName}_{eventId}_{timestamp}
mosip.resident.ack.personalised_card.name.convention=Ack_{featureName}_{eventId}_{timestamp}
mosip.resident.ack.update_my_data.name.convention=Ack_{featureName}_{eventId}_{timestamp}
mosip.resident.ack.share_credential.name.convention=Ack_{featureName}_{eventId}_{timestamp}
mosip.resident.ack.order_physical_card.name.convention=Ack_{featureName}_{eventId}_{timestamp}
mosip.resident.ack.name.convention=Ack_{featureName}_{eventId}_{timestamp}
mosip.resident.uin.card.name.convention=UIN_{eventId}_{timestamp}
mosip.resident.vid.card.name.convention=VID_{eventId}_{timestamp}
mosip.resident.download.service.history.file.name.convention=View_history_{timestamp}
mosip.resident.download.nearest.registration.centre.file.name.convention=Registration_centers_{timestamp}
mosip.resident.download.card.naming.convention=Get_my_UIN_{timestamp}
```

### Credential request config for sharing credential to partner

```
mosip.resident.request.credential.credentialType=vercred
mosip.resident.request.credential.credentialType=euin
mosip.resident.request.credential.isEncrypt=true
mosip.resident.request.credential.encryption.key=******

mosip.digital.card.credential.type=PDFCard
mosip.credential.issuer=******
```

### Claim names

```
mosip.resident.name.token.claim-name=name
mosip.resident.photo.token.claim-photo=picture
mosip.resident.individual.id.claim.name=individual_id
mosip.resident.email.token.claim-email=email
mosip.resident.phone.token.claim-phone=phone_number
```

### Value based properties

```
otpChannel.email=email
otpChannel.mobile=phone
mosip.idrepo.vid.reactive-status=ACTIVE
resident.dateofbirth.pattern=yyyy/MM/dd
mosip.resident.photo.attribute.name=photo
mosip.resident.order.card.payment.enabled=true
resident.update.preferred.language.by.name=true
resident.documents.category=individualBiometrics
mosip.resident.schema.attribute-name=attributeName
mosip.resident.applicant.name.property=applicantName
mosip.resident.authentication.mode.property=authenticationMode
resident.attribute.names.without.documents.required=preferredLanguage,email,phone
resident.additional.identity.attribute.to.fetch=UIN,email,phone,dateOfBirth,fullName,photo
```

### OTP Flooding

Configure Time limit for OTP Flooding scenario (in minutes).

```
otp.request.flooding.duration=1
otp.request.flooding.max-count=10
```

### Maximum file size and types for uploading document

```
mosip.max.file.upload.size.in.bytes=2306867
mosip.allowed.extension=pdf,jpeg,png,jpg
```

### Reg-proc packet status codes

```
resident.success.packet-status-code.list=PROCESSED,SUCCESS,UIN_GENERATED
resident.in-progress.packet-status-code.list=PROCESSING,REREGISTER,RESEND,RECEIVED,UPLOAD_PENDING,AWAITING_INFORMATION,REPROCESS
resident.failure.packet-status-code.list=REJECTED,FAILED,REPROCESS_FAILED
```

### Reg-proc packet transaction type codes

```
resident.REQUEST_RECEIVED.packet-transaction-type-code.list=PACKET_RECEIVER,VIRUS_SCAN,SECUREZONE_NOTIFICATION,UPLOAD_PACKET,VALIDATE_PACKET,PACKET_CLASSIFICATION
resident.VALIDATION_STAGE.packet-transaction-type-code.list=CMD_VALIDATION,OPERATOR_VALIDATION,QUALITY_CLASSIFIER,SUPERVISOR_VALIDATION,INTRODUCER_VALIDATION,BIOMETRIC_AUTHENTICATION,EXTERNAL_INTEGRATION
resident.VERIFICATION_STAGE.packet-transaction-type-code.list=DEMOGRAPHIC_VERIFICATION,MANUAL_ADJUDICATION,VERIFICATION,BIOGRAPHIC_VERIFICATION
resident.UIN_GENERATION_STAGE.packet-transaction-type-code.list=UIN_GENERATOR,BIOMETRIC_EXTRACTION,NOTIFICATION,FINALIZATION,PACKET_REPROCESS
resident.CARD_READY_TO_DOWNLOAD.packet-transaction-type-code.list=PRINT_SERVICE,PRINT_POSTAL_SERVICE,PRINT
```

### Sequence order of reg-proc transaction type codes

```
sequence-order=Request received, Validation stage, Verification stage, Uin generation stage, Card ready to download
```

### Synchronous events

```
resident.request.success.status.list.AUTHENTICATION_REQUEST=AUTHENTICATION_SUCCESSFUL,Y
resident.request.failed.status.list.AUTHENTICATION_REQUEST=AUTHENTICATION_FAILED,N
resident.request.cancelled.status.list.AUTHENTICATION_REQUEST=

resident.request.new.status.list.DOWNLOAD_PERSONALIZED_CARD=NEW
resident.batchjob.process.success.status.list.DOWNLOAD_PERSONALIZED_CARD=CARD_DOWNLOADED
resident.request.failed.status.list.DOWNLOAD_PERSONALIZED_CARD=FAILED
resident.request.cancelled.status.list.DOWNLOAD_PERSONALIZED_CARD=

resident.request.new.status.list.GET_MY_ID=NEW
resident.request.in-progress.status.list.GET_MY_ID=OTP_REQUESTED
resident.request.success.status.list.GET_MY_ID=CARD_DOWNLOADED,OTP_VERIFIED
resident.request.failed.status.list.GET_MY_ID=FAILED
resident.request.cancelled.status.list.GET_MY_ID=

resident.request.new.status.list.BOOK_AN_APPOINTMENT=
resident.request.success.status.list.BOOK_AN_APPOINTMENT=
resident.request.failed.status.list.BOOK_AN_APPOINTMENT=
resident.request.cancelled.status.list.BOOK_AN_APPOINTMENT=

resident.request.new.status.list.GENERATE_VID=NEW
resident.request.success.status.list.GENERATE_VID=VID_GENERATED
resident.request.failed.status.list.GENERATE_VID=FAILED
resident.request.cancelled.status.list.GENERATE_VID=

resident.request.new.status.list.REVOKE_VID=NEW
resident.request.success.status.list.REVOKE_VID=VID_REVOKED
resident.request.failed.status.list.REVOKE_VID=FAILED
resident.request.cancelled.status.list.REVOKE_VID=

resident.request.new.status.list.SEND_OTP=
resident.request.success.status.list.SEND_OTP=
resident.request.failed.status.list.SEND_OTP=
resident.request.cancelled.status.list.SEND_OTP=

resident.request.new.status.list.VALIDATE_OTP=OTP_REQUESTED
resident.request.success.status.list.VALIDATE_OTP=OTP_VERIFIED
resident.request.failed.status.list.VALIDATE_OTP=OTP_VERIFICATION_FAILED
resident.request.cancelled.status.list.VALIDATE_OTP=

resident.request.new.status.list.DEFAULT=
resident.request.success.status.list.DEFAULT=
resident.request.failed.status.list.DEFAULT=
resident.request.cancelled.status.list.DEFAULT=
```

### Asyc Request Types

```
resident.async.request.types=VID_CARD_DOWNLOAD,ORDER_PHYSICAL_CARD,SHARE_CRED_WITH_PARTNER,UPDATE_MY_UIN
```

### Asynchronous events

```
resident.request.new.status.list.SHARE_CRED_WITH_PARTNER=NEW
resident.request.in-progress.status.list.SHARE_CRED_WITH_PARTNER=ISSUED
resident.request.success.status.list.SHARE_CRED_WITH_PARTNER=RECEIVED,DATA_SHARED_SUCCESSFULLY,STORED
resident.request.failed.status.list.SHARE_CRED_WITH_PARTNER=FAILED
resident.request.notification.status.list.SHARE_CRED_WITH_PARTNER=FAILED,RECEIVED,DATA_SHARED_SUCCESSFULLY,STORED

resident.request.new.status.list.ORDER_PHYSICAL_CARD=NEW
resident.request.in-progress.status.list.ORDER_PHYSICAL_CARD=PAYMENT_CONFIRMED,ISSUED,PRINTING,IN_TRANSIT
resident.request.success.status.list.ORDER_PHYSICAL_CARD=CARD_DELIVERED
resident.request.failed.status.list.ORDER_PHYSICAL_CARD=FAILED,PAYMENT_FAILED
resident.request.notification.status.list.ORDER_PHYSICAL_CARD=PAYMENT_CONFIRMED,ISSUED,PRINTING,IN_TRANSIT,CARD_DELIVERED,FAILED,PAYMENT_FAILED,CARD_DELIVERED

resident.request.new.status.list.UPDATE_MY_UIN=NEW
resident.request.in-progress.status.list.UPDATE_MY_UIN=PROCESSING,PAUSED,RESUMABLE,REPROCESS,PAUSED_FOR_ADDITIONAL_INFO
resident.request.success.status.list.UPDATE_MY_UIN=PROCESSED,DATA_UPDATED,STORED,CARD_READY_TO_DOWNLOAD,CARD_DOWNLOADED
resident.request.failed.status.list.UPDATE_MY_UIN=FAILED,REJECTED,REPROCESS_FAILED
resident.request.notification.status.list.UPDATE_MY_UIN=PROCESSED,DATA_UPDATED,STORED,CARD_READY_TO_DOWNLOAD,CARD_DOWNLOADED,FAILED,REJECTED,REPROCESS_FAILED

resident.request.new.status.list.AUTH_TYPE_LOCK_UNLOCK=NEW
resident.request.in-progress.status.list.AUTH_TYPE_LOCK_UNLOCK=
resident.request.success.status.list.AUTH_TYPE_LOCK_UNLOCK=COMPLETED
resident.request.failed.status.list.AUTH_TYPE_LOCK_UNLOCK=FAILED
resident.request.notification.status.list.AUTH_TYPE_LOCK_UNLOCK=COMPLETED,FAILED

resident.request.new.status.list.VID_CARD_DOWNLOAD=NEW
resident.request.in-progress.status.list.VID_CARD_DOWNLOAD=ISSUED
resident.request.success.status.list.VID_CARD_DOWNLOAD=STORED,CARD_READY_TO_DOWNLOAD,CARD_DOWNLOADED
resident.request.failed.status.list.VID_CARD_DOWNLOAD=FAILED
resident.request.notification.status.list.VID_CARD_DOWNLOAD=STORED,CARD_READY_TO_DOWNLOAD,CARD_DOWNLOADED,FAILED
```

### Attributes name based template type codes

Define property name in below format-\
resident.\<attribute name>.template.property.attribute.list

```
resident.PHONE.template.property.attribute.list=mosip.phone.template.property
resident.EMAIL.template.property.attribute.list=mosip.email.template.property
resident.GENERATE_VID.template.property.attribute.list=mosip.generated.template.property
resident.REVOKE_VID.template.property.attribute.list=mosip.revoked.template.property
```

### Template type codes for event status code

```
resident.event.status.SUCCESS.template.property=mosip.event.status.success.template
resident.event.status.FAILED.template.property=mosip.event.status.failed.template
resident.event.status.IN_PROGRESS.template.property=mosip.event.status.inprogress.template
resident.event.status.CANCELED.template.property=mosip.event.status.cancelled.template
```

### Template type codes for event types

Define property name in below format-\
resident.event.type.\<eventType>.template.property

```
resident.event.type.AUTHENTICATION_REQUEST.template.property=mosip.event.type.AUTHENTICATION_REQUEST
resident.event.type.SHARE_CRED_WITH_PARTNER.template.property=mosip.event.type.SHARE_CRED_WITH_PARTNER
resident.event.type.DOWNLOAD_PERSONALIZED_CARD.template.property=mosip.event.type.DOWNLOAD_PERSONALIZED_CARD
resident.event.type.ORDER_PHYSICAL_CARD.template.property=mosip.event.type.ORDER_PHYSICAL_CARD
resident.event.type.GET_MY_ID.template.property=mosip.event.type.GET_MY_ID
resident.event.type.UPDATE_MY_UIN.template.property=mosip.event.type.UPDATE_MY_UIN
resident.event.type.GENERATE_VID.template.property=mosip.event.type.GENERATE_VID
resident.event.type.REVOKE_VID.template.property=mosip.event.type.REVOKE_VID
resident.event.type.AUTH_TYPE_LOCK_UNLOCK.template.property=mosip.event.type.AUTH_TYPE_LOCK_UNLOCK
resident.event.type.VID_CARD_DOWNLOAD.template.property=mosip.event.type.VID_CARD_DOWNLOAD
resident.event.type.SEND_OTP.template.property=mosip.event.type.SEND_OTP
resident.event.type.VALIDATE_OTP.template.property=mosip.event.type.VALIDATE_OTP
resident.event.type.DEFAULT.template.property=mosip.event.type.DEFAULT
```

### Template type codes for service types

Define property name in below format-\
resident.service-type.\<serviceType>.template.property

```
resident.service-type.AUTHENTICATION_REQUEST.template.property=mosip.service.type.AUTHENTICATION_REQUEST
resident.service-type.SERVICE_REQUEST.template.property=mosip.service.type.SERVICE_REQUEST
resident.service-type.DATA_UPDATE_REQUEST.template.property=mosip.service.type.DATA_UPDATE_REQUEST
resident.service-type.ID_MANAGEMENT_REQUEST.template.property=mosip.service.type.ID_MANAGEMENT_REQUEST
resident.service-type.DATA_SHARE_REQUEST.template.property=mosip.service.type.DATA_SHARE_REQUEST
resident.service-type.ASYNC.template.property=mosip.service.type.ASYNC
```

### Template type codes for id-authentication request types description

Define property name in below format-\
resident.id-auth.request-type.\<authTypeCode>.\<statusCode>.descr

```
resident.id-auth.request-type.OTP-REQUEST.SUCCESS.descr=mosip.ida.auth-request.OTP-REQUEST.Y.descr
resident.id-auth.request-type.OTP-AUTH.SUCCESS.descr=mosip.ida.auth-request.OTP-AUTH.Y.descr
resident.id-auth.request-type.DEMO-AUTH.SUCCESS.descr=mosip.ida.auth-request.DEMO-AUTH.Y.descr
resident.id-auth.request-type.FINGERPRINT-AUTH.SUCCESS.descr=mosip.ida.auth-request.FINGERPRINT-AUTH.Y.descr
resident.id-auth.request-type.IRIS-AUTH.SUCCESS.descr=mosip.ida.auth-request.IRIS-AUTH.Y.descr
resident.id-auth.request-type.FACE-AUTH.SUCCESS.descr=mosip.ida.auth-request.FACE-AUTH.Y.descr
resident.id-auth.request-type.STATIC-PIN-AUTH.SUCCESS.descr=mosip.ida.auth-request.STATIC-PIN-AUTH.Y.descr
resident.id-auth.request-type.STATIC-PIN-STORAGE.SUCCESS.descr=mosip.ida.auth-request.STATIC-PIN-STORAGE.Y.descr
resident.id-auth.request-type.EKYC-AUTH.SUCCESS.descr=mosip.ida.auth-request.EKYC-AUTH.Y.descr
resident.id-auth.request-type.KYC-AUTH.SUCCESS.descr=mosip.ida.auth-request.KYC-AUTH.Y.descr
resident.id-auth.request-type.KYC-EXCHANGE.SUCCESS.descr=mosip.ida.auth-request.KYC-EXCHANGE.Y.descr
resident.id-auth.request-type.IDENTITY-KEY-BINDING.SUCCESS.descr=mosip.ida.auth-request.IDENTITY-KEY-BINDING.Y.descr
resident.id-auth.request-type.TOKEN-REQUEST.SUCCESS.descr=mosip.ida.auth-request.TOKEN-REQUEST.Y.descr
resident.id-auth.request-type.TOKEN-AUTH.SUCCESS.descr=mosip.ida.auth-request.TOKEN-AUTH.Y.descr
resident.id-auth.request-type.UNKNOWN.SUCCESS.descr=mosip.ida.auth-request.UNKNOWN.Y.descr
resident.id-auth.request-type.OTP-REQUEST.FAILED.descr=mosip.ida.auth-request.OTP-REQUEST.N.descr
resident.id-auth.request-type.OTP-AUTH.FAILED.descr=mosip.ida.auth-request.OTP-AUTH.N.descr
resident.id-auth.request-type.DEMO-AUTH.FAILED.descr=mosip.ida.auth-request.DEMO-AUTH.N.descr
resident.id-auth.request-type.FINGERPRINT-AUTH.FAILED.descr=mosip.ida.auth-request.FINGERPRINT-AUTH.N.descr
resident.id-auth.request-type.IRIS-AUTH.FAILED.descr=mosip.ida.auth-request.IRIS-AUTH.N.descr
resident.id-auth.request-type.FACE-AUTH.FAILED.descr=mosip.ida.auth-request.FACE-AUTH.N.descr
resident.id-auth.request-type.STATIC-PIN-AUTH.FAILED.descr=mosip.ida.auth-request.STATIC-PIN-AUTH.N.descr
resident.id-auth.request-type.STATIC-PIN-STORAGE.FAILED.descr=mosip.ida.auth-request.STATIC-PIN-STORAGE.N.descr
resident.id-auth.request-type.EKYC-AUTH.FAILED.descr=mosip.ida.auth-request.EKYC-AUTH.N.descr
resident.id-auth.request-type.KYC-AUTH.FAILED.descr=mosip.ida.auth-request.KYC-AUTH.N.descr
resident.id-auth.request-type.KYC-EXCHANGE.FAILED.descr=mosip.ida.auth-request.KYC-EXCHANGE.N.descr
resident.id-auth.request-type.IDENTITY-KEY-BINDING.FAILED.descr=mosip.ida.auth-request.IDENTITY-KEY-BINDING.N.descr
resident.id-auth.request-type.TOKEN-REQUEST.FAILED.descr=mosip.ida.auth-request.TOKEN-REQUEST.N.descr
resident.id-auth.request-type.TOKEN-AUTH.FAILED.descr=mosip.ida.auth-request.TOKEN-AUTH.N.descr
resident.id-auth.request-type.UNKNOWN.FAILED.descr=mosip.ida.auth-request.UNKNOWN.N.descr
```

### Template type codes for authentication modes (authTypeCode)

Define property name in below format-\
resident.auth-type-code.\<authTypeCode>.code

```
resident.auth-type-code.OTP-REQUEST.code=mosip.auth-type-code.OTP-REQUEST
resident.auth-type-code.OTP-AUTH.code=mosip.auth-type-code.OTP-AUTH
resident.auth-type-code.DEMO-AUTH.code=mosip.auth-type-code.DEMO-AUTH
resident.auth-type-code.FINGERPRINT-AUTH.code=mosip.auth-type-code.FINGERPRINT-AUTH
resident.auth-type-code.IRIS-AUTH.code=mosip.auth-type-code.IRIS-AUTH
resident.auth-type-code.FACE-AUTH.code=mosip.auth-type-code.FACE-AUTH
resident.auth-type-code.STATIC-PIN-AUTH.code=mosip.auth-type-code.STATIC-PIN-AUTH
resident.auth-type-code.STATIC-PIN-STORAGE.code=mosip.auth-type-code.STATIC-PIN-STORAGE
resident.auth-type-code.EKYC-AUTH.code=mosip.auth-type-code.EKYC-AUTH
resident.auth-type-code.KYC-AUTH.code=mosip.auth-type-code.KYC-AUTH
resident.auth-type-code.KYC-EXCHANGE.code=mosip.auth-type-code.KYC-EXCHANGE
resident.auth-type-code.IDENTITY-KEY-BINDING.code=mosip.auth-type-code.IDENTITY-KEY-BINDING
resident.auth-type-code.TOKEN-REQUEST.code=mosip.auth-type-code.TOKEN-REQUEST
resident.auth-type-code.TOKEN-AUTH.code=mosip.auth-type-code.TOKEN-AUTH
resident.auth-type-code.PWD.code=mosip.auth-type-code.PWD
resident.auth-type-code.PIN.code=mosip.auth-type-code.PIN
resident.auth-type-code.OTP.code=mosip.auth-type-code.OTP
resident.auth-type-code.Wallet.code=mosip.auth-type-code.Wallet
resident.auth-type-code.L1-bio-device.code=mosip.auth-type-code.L1-bio-device
```

### Flag to retrieve UIN or VID

Below property will retrieve VID when requested. Default is false so, UIN will be retrieved. Endpoints using below property- /individualId/otp, /aid/status.

```
resident.flag.use-vid-only=true
```

### Class name of the referenceValidator

Commenting or removing this property will disable reference validator.

```
mosip.kernel.idobjectvalidator.referenceValidator=io.mosip.kernel.idobjectvalidator.impl.IdObjectReferenceValidator
```

### Request time validation

For validating request time as per before & after time limit (in seconds) in contact-details/update API.

```
resident.future.time.limit=60
resident.past.time.limit=60
```

### Date time formatting styles

The java.time.format.FormatStyle enum to use for date time formatting based on locale. Allowed values with examples are:&#x20;

* FULL ('Tuesday, April 12, 1952 AD' or '3:30:42pm PST')
* LONG('January 12, 1952')
* MEDIUM ('Jan 12, 1952')
* SHORT ('12.13.52' or '3:30pm')

Current value is MEDUIM. For more details refer to the enum.

```
resident.date.time.formmatting.style=MEDIUM
resident.date.time.replace.special.chars={" ": "_", "," : "", ":" : "."}
```

### Cache expiration time (in milliseconds)

```
resident.cache.expiry.time.millisec.templateCache=86400000
resident.cache.expiry.time.millisec.partnerCache=86400000
resident.cache.expiry.time.millisec.getValidDocumentByLangCode=86400000
resident.cache.expiry.time.millisec.getLocationHierarchyLevelByLangCode=86400000
resident.cache.expiry.time.millisec.getImmediateChildrenByLocCodeAndLangCode=86400000
resident.cache.expiry.time.millisec.getLocationDetailsByLocCodeAndLangCode=86400000
resident.cache.expiry.time.millisec.getCoordinateSpecificRegistrationCenters=86400000
resident.cache.expiry.time.millisec.getApplicantValidDocument=86400000
resident.cache.expiry.time.millisec.getRegistrationCentersByHierarchyLevel=86400000
resident.cache.expiry.time.millisec.getRegistrationCenterByHierarchyLevelAndTextPaginated=86400000
resident.cache.expiry.time.millisec.getRegistrationCenterWorkingDays=86400000
resident.cache.expiry.time.millisec.getLatestIdSchema=86400000
resident.cache.expiry.time.millisec.getGenderCodeByGenderTypeAndLangCode=86400000
resident.cache.expiry.time.millisec.getDocumentTypesByDocumentCategoryAndLangCode=86400000
resident.cache.expiry.time.millisec.getDynamicFieldBasedOnLangCodeAndFieldName=86400000
resident.cache.expiry.time.millisec.getCenterDetails=86400000
resident.cache.expiry.time.millisec.getImmediateChildrenByLocCode=86400000
resident.cache.expiry.time.millisec.getLocationHierarchyLevels=86400000
resident.cache.expiry.time.millisec.getAllDynamicFieldByName=86400000
```

### Separators

Usage: resident.attribute.separator.\<attribute>=\<separator string>

```
resident.attribute.separator.fullAddress=, 
```

### Thread properties

Async thread for audit calls. Limit the number of async threads created in Resident services. This count is divided into 4 thread groups configured in 'io.mosip.resident.config.Config' class.

```
mosip.resident.async-core-pool-size=100
mosip.resident.async-max-pool-size=100
```

### Logo property

This property is used in all downloaded PDF files.

```
mosip.pdf.header.logo.url=https://mosip.io/images/mosipn-logo.png
```

### Map (zoom in & out)

These properties are used in reg-center feature for map zoom in & out.

```
mosip.resident.zoom=14
mosip.resident.maxZoom=18
mosip.resident.minZoom=5
```

### Transliteration workaround properties

Transliteration work around property since eng to fra directly is not supported in icu4j.This can be added for any other unsupported language also.

For example, resident-transliteration-workaround-for-\<fromLanguageCode>-\<toLanguageCode> = fromLanguageCode-intermediateLanguageCode-toLanguageCode.

For this, intermediate language code transliteration should work in both ways.

```
resident-transliteration-workaround-for-eng-fra=eng-hin,hin-fra
resident-transliteration-workaround-for-eng-spa=eng-hin,hin-spa
```

## Reg-processer-credential-partner-policy-url

This is a policy url to fetch delimeter to download card after updating uin.

```
mosip.resident.reg-processer-credential-partner-policy-url=${config.server.file.storage.uri}registration-processor-credential-partners.json
```

### The request IDs used in Resident REST APIs

```
mosip.resident.api.id.otp.request=mosip.identity.otp.internal
mosip.resident.api.id.auth=mosip.identity.auth.internal
auth.internal.id=mosip.identity.auth.internal
mosip.registration.processor.print.id=mosip.registration.print
vid.create.id=mosip.vid.create
resident.vid.id=mosip.resident.vid
resident.vid.id.generate=mosip.resident.vid.generate
resident.vid.policy.id=mosip.resident.vid.policy
resident.vid.get.id=mosip.resident.vid.get
auth.type.status.id=mosip.identity.authtype.status.update
resident.authlock.id=mosip.resident.authlock
resident.checkstatus.id=mosip.resident.checkstatus
resident.euin.id=mosip.resident.euin
resident.printuin.id=mosip.resident.printuin
resident.uin.id=mosip.resident.uin
resident.rid.id=mosip.resident.rid
resident.updateuin.id=mosip.resident.updateuin
resident.authunlock.id=mosip.resident.authunlock
resident.authhistory.id=mosip.resident.authhistory
resident.authLockStatusUpdateV2.id=mosip.resident.auth.lock.unlock
resident.service.history.id=mosip.service.history.get
resident.document.upload.id=mosip.resident.document.upload
resident.document.get.id=mosip.resident.document.get
resident.document.list.id=mosip.resident.document.list
resident.service.pin.status.id=mosip.resident.pin.status
resident.service.unpin.status.id=mosip.resident.unpin.status
resident.document.delete.id=mosip.resident.document.delete
resident.contact.details.update.id=mosip.resident.contact.details.update.id
resident.contact.details.send.otp.id=mosip.resident.contact.details.send.otp.id
mosip.resident.service.status.check.id=mosip.registration.external.status
resident.service.unreadnotificationlist.id=mosip.resident.service.history.unread
resident.service.event.id=mosip.resident.event.status
resident.identity.info.id=mosip.resident.identity.info
resident.share.credential.id=mosip.resident.share.credential
vid.revoke.id=mosip.vid.update
resident.revokevid.id=mosip.resident.vidstatus
mosip.resident.revokevid.id=mosip.resident.vid.revoke
mosip.resident.grievance.ticket.request.id=mosip.resident.grievance.ticket.request
resident.channel.verification.status.id=mosip.resident.channel.verification.status
resident.event.ack.download.id=mosip.resident.event.ack.download
resident.download.card.eventid.id =mosip.resident.download.card.eventid
mosip.resident.request.vid.card.id=mosip.resident.request.vid.card
mosip.credential.request.service.id=mosip.credential.request.service.id
mosip.resident.checkstatus.individualid.id=mosip.resident.check-stage-status
mosip.resident.download.personalized.card.id=mosip.resident.download.personalized.card
mosip.resident.transliteration.transliterate.id=mosip.resident.transliteration.transliterate
resident.ui.properties.id=resident.ui.properties
mosip.resident.identity.auth.internal.id=mosip.identity.auth.internal
mosip.resident.user.profile.id=mosip.resident.profile
resident.download.reg.centers.list.id=mosip.resident.download.reg.centers.list
resident.download.nearest.reg.centers.id=mosip.resident.download.nearest.reg.centers
resident.download.supporting.documents.id=mosip.resident.download.supporting.documents
resident.send.card.id=mosip.resident.send.card
resident.pinned.eventid.id=mosip.resident.pinned.eventid
resident.unpinned.eventid.id=mosip.resident.unpinned.eventid
resident.auth.proxy.partners.id=mosip.resident.auth.proxy.partners
resident.events.eventid.id=mosip.resident.events.eventid
resident.notification.id=mosip.resident.notification.get
resident.profile.id=mosip.resident.profile.get
resident.notification.click.id=mosip.resident.notification.click
mosip.credential.store.id=mosip.credential.store
resident.vids.id=mosip.resident.vids.get
mosip.resident.download.uin.card=mosip.resident.download.uin.card
mosip.registration.processor.registration.sync.id=mosip.registration.sync
id.repo.update=mosip.id.update
mosip.resident.get.pending.drafts=mosip.resident.get.pending.drafts
mosip.resident.discard.pending.drafts=mosip.resident.discard.pending.drafts
```

## The request versions used in Resident REST APIs

```
mosip.resident.api.version.otp.request=1.0
mosip.resident.api.version.auth=1.0
auth.internal.version=1.0
mosip.registration.processor.application.version=1.0
mosip.resident.create.vid.version=v1
resident.vid.version=v1
resident.vid.version.new=1.0
resident.revokevid.version=v1
resident.revokevid.version.new=1.0
resident.version.new=1.0
resident.checkstatus.version=v1
resident.authLockStatusUpdateV2.version=1.0
resident.service.history.version=1.0
resident.document.get.version=1.0
resident.document.list.version=1.0
resident.service.pin.status.version=v1
resident.service.unpin.status.version=v1
resident.document.delete.version=1.0
mosip.resident.service.status.check.version=1.0
resident.service.event.version=1.0
resident.identity.info.version=1.0
resident.share.credential.version=1.0
mosip.resident.request.response.version=1.0
mosip.resident.grievance.ticket.request.version=1.0
resident.channel.verification.status.version=1.0
resident.event.ack.download.version=1.0
resident.download.card.eventid.version=1.0
mosip.resident.request.vid.card.version=1.0
mosip.credential.request.service.version=1.0
mosip.resident.checkstatus.individualid.version=1.0
resident.ui.properties.version=1.0
mosip.resident.get.pending.drafts.version=1.0
mosip.resident.discard.pending.drafts.version=1.0
```

### Auth Services API calls

```
IDA_INTERNAL=${mosip.ida.internal.url}/idauthentication/v1/internal
INTERNALAUTH=${IDA_INTERNAL}/auth
INTERNALAUTHTRANSACTIONS=${IDA_INTERNAL}/authTransactions
KERNELENCRYPTIONSERVICE=${IDA_INTERNAL}/getCertificate
OTP_GEN_URL=${IDA_INTERNAL}/otp
KERNELAUTHMANAGER=${mosip.kernel.authmanager.url}/v1/authmanager/authenticate/clientidsecretkey
```

### Credential Req & service calls

```
CREDENTIAL_STATUS_URL=${mosip.idrepo.credrequest.generator.url}/v1/credentialrequest/get/
CREDENTIAL_REQ_URL=${mosip.idrepo.credrequest.generator.url}/v1/credentialrequest/requestgenerator
CREDENTIAL_CANCELREQ_URL=${mosip.idrepo.credrequest.generator.url}/v1/credentialrequest/cancel/
CREDENTIAL_TYPES_URL=${mosip.idrepo.credential.service.url}/v1/credentialservice/types
```

### IdRepo identity Service calls

```
IDREPO_IDENTITY=${mosip.idrepo.identity.url}/idrepository/v1/identity
IDREPOSITORY=${IDREPO_IDENTITY}/
IDREPOGETIDBYUIN=${IDREPO_IDENTITY}/idvid
IDREPOGETIDBYRID=${IDREPO_IDENTITY}/idvid
IDREPO_IDENTITY_URL=${IDREPO_IDENTITY}/idvid/{id}
GET_RID_BY_INDIVIDUAL_ID=${IDREPO_IDENTITY}/rid/{individualId}
IDREPO_IDENTITY_UPDATE_COUNT=${IDREPO_IDENTITY}/{individualId}/update-counts
AUTHTYPESTATUSUPDATE=${IDREPO_IDENTITY}/authtypes/status
IDREPO_IDENTITY_GET_DRAFT_UIN=${IDREPO_IDENTITY}/draft/uin/{UIN}
IDREPO_IDENTITY_DISCARD_DRAFT=${IDREPO_IDENTITY}/draft/discard/
```

### IdRepo vid Service calls

```
IDREPO_VID=${mosip.idrepo.vid.url}/idrepository/v1/vid
CREATEVID=${IDREPO_VID}
GETUINBYVID=${IDREPO_VID}
IDAUTHCREATEVID=${IDREPO_VID}
IDAUTHREVOKEVID=${IDREPO_VID}
RETRIEVE_VIDS=${IDREPO_VID}/uin/
```

### Key manager API calls

```
KEYMANAGER=${mosip.kernel.keymanager.url}/v1/keymanager
ENCRYPTURL=${KEYMANAGER}/encrypt
DECRYPT_API_URL=${KEYMANAGER}/decrypt
mosip.resident.keymanager.encrypt-uri=${KEYMANAGER}/encrypt
mosip.resident.keymanager.decrypt-uri=${KEYMANAGER}/decrypt
PACKETSIGNPUBLICKEY=${KEYMANAGER}/tpmsigning/publickey
mosip.keymanager.jwt.sign.end.point=${KEYMANAGER}/jwtSign
PDFSIGN=${KEYMANAGER}/pdf/sign
```

### Master Data api calls

```
MASTER=${mosip.kernel.masterdata.url}/v1/masterdata
TEMPLATES=${MASTER}/templates
MACHINEDETAILS=${MASTER}/machines
MACHINESEARCH=${MASTER}/machines/search
MACHINECREATE=${MASTER}/machines
CENTERDETAILS=${MASTER}/registrationcenters
VALID_DOCUMENT_BY_LANGCODE_URL=${MASTER}/validdocuments/{langCode}
LOCATION_HIERARCHY_LEVEL_BY_LANGCODE_URL=${MASTER}/locationHierarchyLevels/{langcode}
LOCATION_HIERARCHY=${MASTER}/locationHierarchyLevels
IMMEDIATE_CHILDREN_BY_LOCATIONCODE_AND_LANGCODE_URL=${MASTER}/locations/immediatechildren/{locationcode}/{langcode}
LOCATION_INFO_BY_LOCCODE_AND_LANGCODE_URL=${MASTER}/locations/info/{locationcode}/{langcode}
IMMEDIATE_CHILDREN_BY_LOCATION_CODE=${MASTER}/locations/immediatechildren
REGISTRATION_CENTER_FOR_LOCATION_CODE_URL=${MASTER}/registrationcenters/{langcode}/{hierarchylevel}/names
REGISTRATION_CENTER_BY_LOCATION_TYPE_AND_SEARCH_TEXT_PAGINATED_URL=${MASTER}/registrationcenters/page/{langcode}/{hierarchylevel}/{name}
COORDINATE_SPECIFIC_REGISTRATION_CENTERS_URL=${MASTER}/getcoordinatespecificregistrationcenters/{langcode}/{longitude}/{latitude}/{proximitydistance}
APPLICANT_VALID_DOCUMENT_URL=${MASTER}/applicanttype/{applicantId}/languages
WORKING_DAYS_BY_REGISTRATION_ID=${MASTER}/workingdays/{registrationCenterID}/{langCode}
LATEST_ID_SCHEMA_URL =${MASTER}/idschema/latest
TEMPLATES_BY_LANGCODE_AND_TEMPLATETYPECODE_URL=${MASTER}/templates/{langcode}/{templatetypecode}
DYNAMIC_FIELD_BASED_ON_LANG_CODE_AND_FIELD_NAME=${MASTER}/dynamicfields/{fieldName}/{langcode}
DYNAMIC_FIELD_BASED_ON_FIELD_NAME=${MASTER}/dynamicfields/{fieldName}
DOCUMENT_TYPE_BY_DOCUMENT_CATEGORY_AND_LANG_CODE=${MASTER}/documenttypes/{documentcategorycode}/{langcode}
```

### Notification service

```
SMSNOTIFIER=${mosip.kernel.notification.url}/v1/notifier/sms/send
EMAILNOTIFIER=${mosip.kernel.notification.url}/v1/notifier/email/send
resident.notification.emails=mosiptestuser@gmail.com
resident.notification.message=Notification has been sent to the provided contact detail(s)
```

### Partner manager service URLs

```
PMS_PARTNER_MANAGER=${mosip.pms.partnermanager.url}/v1/partnermanager
POLICY_REQ_URL=${PMS_PARTNER_MANAGER}/partners/{partnerId}/credentialtype/{credentialType}/policies
PARTNER_API_URL=${PMS_PARTNER_MANAGER}/partners
PARTNER_DETAILS_NEW_URL=${PMS_PARTNER_MANAGER}/partners/v2
mosip.pms.pmp.partner.rest.uri=${PMS_PARTNER_MANAGER}/partners?partnerType=${mosip.ida.partner.type}
```

### Reg-proc service calls

```
REGPROCPRINT=http://regproc-group7.regproc/registrationprocessor/v1/print/uincard
SYNCSERVICE=${mosip.regproc.status.service.url}/registrationprocessor/v1/registrationstatus/sync
PACKETRECEIVER=${mosip.packet.receiver.url}/registrationprocessor/v1/packetreceiver/registrationpackets
GET_RID_STATUS=${mosip.regproc.transaction.service.url}/registrationprocessor/v1/registrationtransaction/search/{rid}
REGISTRATIONSTATUSSEARCH=${mosip.regproc.status.service.url}/registrationprocessor/v1/registrationstatus/externalstatus/search
```

### Resident API calls

```
mosip.service-context=${server.servlet.context-path}
RESIDENT_SERVICE=${mosip.resident.url}${mosip.service-context}
RESIDENT_REQ_CREDENTIAL_URL=${RESIDENT_SERVICE}/req/credential/status/
GET_ORDER_STATUS_URL=${RESIDENT_SERVICE}/mock/print-partner/check-order-status
mosip.resident.download-card.url=${mosip.api.public.url}${mosip.service-context}/download-card/event/{eventId}
mosip.resident.grievance.url=${mosip.api.public.url}${mosip.service-context}/mock/external/grievance/redressel?name={name}&emailId={email}&phoneNo={phone}&eventId={eventId}
```

### Other service calls

```
MIDSCHEMAURL=${mosip.kernel.syncdata.url}/v1/syncdata/latestidschema
DIGITAL_CARD_STATUS_URL=${mosip.digitalcard.service.url}/v1/digitalcard/
RIDGENERATION=${mosip.kernel.ridgenerator.url}/v1/ridgenerator/generate/rid
otp-generate.rest.uri=${mosip.kernel.otpmanager.url}/v1/otpmanager/otp/generate
mosip.resident.service.mock.pdf.url=https://uidai.gov.in/images/New_eAadhaar1.pdf
mosip.kernel.masterdata.audit-url=${mosip.kernel.auditmanager.url}/v1/auditmanager/audits
```

### Identity Mapping json

Below config is used to get identity mapping and get remaining update count for the Identity Attributes .&#x20;

This is used in Resident in Update UIN feature to show remaining update count for the Identity Attribute.

```
{
	"identity": {
		"IDSchemaVersion": {
			"value": "IDSchemaVersion"
		},
		"selectedHandles" : {
			"value" : "selectedHandles"
		},
		"name": {
			"value": "fullName"
		},
		"gender": {
			"value": "gender"
		},
		"dob": {
			"value": "dateOfBirth"
		},
		"age": {
			"value": "age"
		},
		"introducerRID": {
			"value": "introducerRID"
		},
		"introducerUIN": {
			"value": "introducerUIN"
		},
		"introducerVID": {
			"value": "introducerVID"
		},
		"introducerName": {
			"value": "introducerName"
		},
		"phone": {
			"value": "phone"
		},
		"phoneNumber": {
			"value": "phone"
		},
		"email": {
			"value": "email"
		},
		"emailId": {
			"value": "email"
		},
		"uin": {
			"value": "UIN"
		},
		"vid": {
			"value": "VID"
		},
		"individualBiometrics": {
			"value": "individualBiometrics"
		},
		"introducerBiometrics": {
			"value": "introducerBiometrics"
		},
		"individualAuthBiometrics": {
			"value": "individualAuthBiometrics"
		},
		"officerBiometricFileName": {
			"value": "officerBiometricFileName"
		},
		"supervisorBiometricFileName": {
			"value": "supervisorBiometricFileName"
		},
		"residenceStatus": {
			"value": "residenceStatus"
		},
		"preferredLanguage": {
			"value": "preferredLang"
		},
		"locationHierarchyForProfiling": {
			"value": "zone,postalCode"
		},
		"addressLine1": {
			"value": "addressLine1"
		},
		"addressLine2": {
			"value": "addressLine2"
		},
		"addressLine3": {
			"value": "addressLine3"
		},
		"location1": {
			"value": "city"
		},
		"location2": {
			"value": "region"
		},
		"location3": {
			"value": "province"
		},
		"postalCode": {
			"value": "postalCode"
		},
		"location4": {
			"value": "zone"
		},
		"fullAddress": {
			"value": "addressLine1,addressLine2,addressLine3,city,region,province,postalCode"
		},
		"bestTwoFingers": {
			"value": "bestTwoFingers"
		},
		"birthdate": {
			"value": "dateOfBirth"
		},
		"picture": {
			"value": "face"
		},
		"phone_number": {
			"value": "phone"
		},
		"address": {
			"value": "addressLine1,addressLine2,addressLine3,city,region,province,postalCode"
		},

		"individual_id": {
			"value": "individual_id"
		},
		"attributes": {
		   "value": "fln,ad1,ad2,ad3,cit,reg,pro,poc,cph,em,ph,gen,dob"
		},  
		"street_address": {
			"value": "addressLine1,addressLine2,addressLine3"
		},
		"locality": {
			"value": "city"
		},
		"region": {
			"value": "region"
		},
		"postal_code": {
			"value": "postalCode"
		},
		"country": {
			"value": "province"
		},
		"password": {
			"value": "password"
		}
	},
	"metaInfo": {
		"value": "metaInfo"
	},
	"audits": {
		"value": "audits"
	},
	"documents": {
		"poa": {
			"value": "proofOfAddress"
		},
		"poi": {
			"value": "proofOfIdentity"
		},
		"por": {
			"value": "proofOfRelationship"
		},
		"pob": {
			"value": "proofOfDateOfBirth"
		},
		"poe": {
			"value": "proofOfException"
		}
	},
	"attributeUpdateCountLimit": {
		"fullName": 2,
		"gender": 4,
		"dateOfBirth": 3

		
		
	}
}
```

### Mvel File config

This file contains Mvel method definitions for masking attributes, getting password and formatting attributes.

This is used in Resident for downloading PDF card and for masking attributes in share credential feature and personalise card feature.

[https://github.com/mosip/mosip-config/blob/pla-1.2.0.1/credentialdata.mvel](https://github.com/mosip/mosip-config/blob/pla-1.2.0.1/credentialdata.mvel)
