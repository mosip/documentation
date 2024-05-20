# Resident Portal Configuration Guide

The provided guide presents a list of essential properties that can be customised according to a specific installation. Please note that this list is not exhaustive but rather acts as a checklist to review properties that are expected to differ from their default settings. If you require access to all properties, please refer to the files mentioned below.

## Configuration files

Resident Service uses the following configuration files:

{% code overflow="wrap" lineNumbers="true" %}
```
application-default.properties
resident-default.properties
```
{% endcode %}

### Database

Properties used for configuring the database.

{% code overflow="wrap" lineNumbers="true" %}
```
mosip.resident.database.hostname=postgres-postgresql.postgres
mosip.resident.database.port=5432
javax.persistence.jdbc.driver=org.postgresql.Driver
javax.persistence.jdbc.url=jdbc:postgresql://${mosip.resident.database.hostname}:${mosip.resident.database.port}/mosip_resident
javax.persistence.jdbc.user=residentuser
javax.persistence.jdbc.password=******
```
{% endcode %}

### Token generation

{% code overflow="wrap" lineNumbers="true" %}
```
resident.appid=resident
resident.clientId=******
resident.secretKey=******
token.request.issuerUrl=${mosip.keycloak.issuerUrl}
```
{% endcode %}

### Online Verification Partner

{% code overflow="wrap" lineNumbers="true" %}
```
ida.online-verification-partner-id=******
```
{% endcode %}

### DB properties to skip automatic table creation in startup

{% code overflow="wrap" lineNumbers="true" %}
```
hibernate.show_sql=false
hibernate.hbm2ddl.auto=none
hibernate.temp.use_jdbc_metadata_defaults=false
hibernate.jdbc.lob.non_contextual_creation = true
spring.jpa.properties.hibernate.temp.use_jdbc_metadata_defaults=false
```
{% endcode %}

### Allowed Authentication types and default unlock duration

These are the authentication types allowed for a resident and default unlock duration.

{% code overflow="wrap" lineNumbers="true" %}
```
auth.types.allowed=otp-email,otp-phone,demo,bio-FINGER,bio-IRIS,bio-FACE
resident.auth-type.default.unlock.duration.seconds=100
```
{% endcode %}

### Template type codes for allowed Auth-type list (auth.types.allowed)

Templates type codes for authentication types:

{% code overflow="wrap" lineNumbers="true" %}
```
resident.otp-email.template.property.attribute.list=mosip.otp-email.template.property
resident.otp-phone.template.property.attribute.list=mosip.otp-phone.template.property
resident.demo.template.property.attribute.list=mosip.demo.template.property
resident.bio-FINGER.template.property.attribute.list=mosip.bio-finger.template.property
resident.bio-IRIS.template.property.attribute.list=mosip.bio-iris.template.property
resident.bio-FACE.template.property.attribute.list=mosip.bio-face.template.property
```
{% endcode %}

### Validation properties

Below are the properties used for validation purpose:

{% code overflow="wrap" lineNumbers="true" %}
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
{% endcode %}

### Security

{% code overflow="wrap" lineNumbers="true" %}
```
mosip.security.csrf-enable:false
mosip.security.secure-cookie:false
```
{% endcode %}

### Keycloak authentication client

{% code overflow="wrap" lineNumbers="true" %}
```
token.request.appid=resident
token.request.clientId=******
token.request.secretKey=******
```
{% endcode %}

### Keycloak authentication allowed audience

{% code overflow="wrap" lineNumbers="true" %}
```
auth.server.admin.allowed.audience=mosip-resident-client,mosip-reg-client,${mosip.iam.module.clientID}
```
{% endcode %}

### Identity mapping json file

Property used to get the identity mapping json

{% code overflow="wrap" lineNumbers="true" %}
```
registration.processor.identityjson=identity-mapping.json
identity-mapping-file-name=identity-mapping.json
identity-mapping-file-url=${config.server.file.storage.uri}${identity-mapping-file-name} 
identity-mapping-file-source=url:${identity-mapping-file-url}
```
{% endcode %}

### Machine creation and search configurations

Properties used for machine specification and center:

{% code overflow="wrap" lineNumbers="true" %}
```
resident.update-uin.machine-name-prefix = resident_machine_
resident.update-uin.machine-spec-id = RESIDENT-1
resident.update-uin.machine-zone-code = MOR
resident.center.id=10007
resident.machine.id=10011
```
{% endcode %}

### Auth Adapter rest template authentication configurations

{% code overflow="wrap" lineNumbers="true" %}
```
mosip.iam.adapter.appid=resident
mosip.iam.adapter.clientid=******
mosip.iam.adapter.clientsecret=******
```
{% endcode %}

### Exclusion list

* This is an exclusion list of URL patterns that should not be a part of authentication and authorization.
* Properties used to define the endpoints that should not be part of authentication.

{% code overflow="wrap" lineNumbers="true" %}
```
mosip.service.end-points=/**/req/otp,/**/proxy/**/*,/**/validate-otp,/**/channel/verification-status,/**/req/credential/**,/**/req/card/*,/**/req/auth-history,/**/rid/check-status,/**/req/auth-lock,/**/req/auth-unlock,/**/req/update-uin,/**/req/print-uin,/**/req/euin,/**/credential/types,/**/req/policy/**,/**/aid/status,/**/individualId/otp,/**/mock/**,/**/callback/**,/**/download-card,/**/download/registration-centers-list/**,/**/download/supporting-documents/**,/**/vid/policy,/**/vid,/vid/**,/**/download/nearestRegistrationcenters/**,/**/authorize/admin/validateToken,/**/logout/user,/**/aid-stage/**
```
{% endcode %}

### Configuration for re-captcha

{% code overflow="wrap" lineNumbers="true" %}
```
mosip.resident.captcha.enable=true
mosip.resident.captcha.id.validate=mosip.resident.captcha.id.validate
mosip.resident.captcha.sitekey=******
mosip.resident.captcha.secretkey=******
mosip.resident.captcha.resourse.url=http://resident-captcha.resident/resident/v1/captcha/validatecaptcha
mosip.resident.captcha.recaptcha.verify.url=https://www.google.com/recaptcha/api/siteverify
```
{% endcode %}

### Resident UI properties

These properties (comma separated values) are used to define the keys of the properties to be exposed to UI.

{% code overflow="wrap" lineNumbers="true" %}
```
resident.ui.propertyKeys=mosip.mandatory-languages,mosip.optional-languages,mosip.utc-datetime-pattern,mosip.iam.adapter.clientid,resident.datetime.pattern,mosip.resident.api.id.otp.request,mosip.resident.api.id.auth,mosip.resident.api.version.otp.request,mosip.resident.api.version.auth,mosip-prereg-host,mosip-prereg-ui-url,auth.types.allowed,resident.template.tnc.order-a-physical-card,resident.template.tnc.share-cred-with-partner,resident.template.tnc.update-demo,resident.view.history.serviceType.filters,resident.view.history.status.filters,resident.auth-type.default.unlock.duration.seconds,mosip.resident.grievance.url,mosip.api.public.host,mosip.resident.captcha.sitekey,mosip.resident.captcha.secretkey,mosip.webui.auto.logout.idle,mosip.webui.auto.logout.ping,mosip.webui.auto.logout.timeout,mosip.resident.download.registration.centre.file.name.convention,mosip.resident.download.supporting.document.file.name.convention,mosip.resident.download.personalized.card.naming.convention,mosip.resident.ack.manage_my_vid.name.convention,mosip.resident.ack.secure_my_id.name.convention,mosip.resident.ack.personalised_card.name.convention,mosip.resident.ack.update_my_data.name.convention,mosip.resident.ack.share_credential.name.convention,mosip.resident.ack.order_physical_card.name.convention,mosip.resident.ack.name.convention,mosip.resident.uin.card.name.convention,mosip.resident.vid.card.name.convention,mosip.resident.download.service.history.file.name.convention,mosip.resident.download.nearest.registration.centre.file.name.convention,auth.internal.id,auth.internal.version,mosip.registration.processor.print.id,mosip.registration.processor.application.version,vid.create.id,mosip.resident.create.vid.version,resident.vid.version,resident.vid.version.new,resident.revokevid.version,resident.revokevid.version.new,resident.vid.id,resident.vid.id.generate,resident.vid.policy.id,resident.vid.get.id,auth.type.status.id,resident.authlock.id,resident.checkstatus.id,resident.checkstatus.version,resident.euin.id,resident.printuin.id,resident.uin.id,resident.rid.id,resident.updateuin.id,resident.authunlock.id,resident.authhistory.id,resident.authLockStatusUpdateV2.id,resident.authLockStatusUpdateV2.version,resident.service.history.id,resident.service.history.version,resident.document.upload.id,resident.document.get.id,resident.document.get.version,resident.document.list.id,resident.document.list.version,resident.service.pin.status.id,resident.service.pin.status.version,resident.service.unpin.status.id,resident.service.unpin.status.version,resident.document.delete.id,resident.document.delete.version,resident.contact.details.update.id,resident.contact.details.send.otp.id,mosip.resident.service.status.check.id,mosip.resident.service.status.check.version,resident.service.unreadnotificationlist.id,resident.service.event.id,resident.service.event.version,resident.identity.info.id,resident.identity.info.version,resident.share.credential.id,resident.share.credential.version,mosip.resident.request.response.version,vid.revoke.id,resident.revokevid.id,mosip.resident.revokevid.id,mosip.resident.grievance.ticket.request.id,mosip.resident.grievance.ticket.request.version,resident.channel.verification.status.id,resident.channel.verification.status.version,resident.event.ack.download.id,resident.event.ack.download.version,resident.download.card.eventid.id ,resident.download.card.eventid.version,mosip.resident.request.vid.card.id,mosip.resident.request.vid.card.version,mosip.credential.request.service.id,mosip.credential.request.service.version,mosip.resident.checkstatus.individualid.id,mosip.resident.checkstatus.individualid.version,mosip.resident.download.personalized.card.id,mosip.resident.transliteration.transliterate.id,resident.ui.properties.id,resident.ui.properties.version,resident.nearby.centers.distance.meters,resident.ui.notification.update.interval.seconds,mosip.kernel.otp.expiry-time,resident.grievance-redressal.alt-email.chars.limit,resident.grievance-redressal.alt-phone.chars.limit,resident.grievance-redressal.comments.chars.limit,resident.share-credential.purpose.chars.limit,mosip.resident.eventid.searchtext.length,mosip.kernel.uin.length,mosip.kernel.vid.length,mosip.kernel.rid.length,mosip.resident.eid.length,mosip.kernel.otp.default-length,resident.message.allowed.special.char.regex,resident.purpose.allowed.special.char.regex,resident.id.allowed.special.char.regex,resident.version.new,mosip.resident.identity.auth.internal.id,resident.validation.event-id.regex,resident.document.validation.transaction-id.regex,resident.document.validation.document-id.regex,resident.validation.is-numeric.regex,resident.otp.validation.transaction-id.regex,,mosip.resident.captcha.enable,resident.download.reg.centers.list.id,resident.download.nearest.reg.centers.id,resident.download.supporting.documents.id,resident.send.card.id,resident.pinned.eventid.id,resident.unpinned.eventid.id,resident.auth.proxy.partners.id,resident.events.eventid.id,resident.notification.id,resident.profile.id,resident.notification.click.id,mosip.credential.store.id,resident.vids.id
```
{% endcode %}

### MOSIP e-Signet configuration

{% code overflow="wrap" lineNumbers="true" %}
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
{% endcode %}

### Auth Adapter ValidateTokenHelper

This property will directly apply the certs URL without the need for constructing the path from issuer URL. This is useful for keeping different certs URL for integrating with MOSIP e-Signet for offline token validation.

{% code overflow="wrap" lineNumbers="true" %}
```
auth.server.admin.oidc.certs.url=${mosip.iam.certs_endpoint}
mosip.iam.logout.offline=true
auth.server.admin.validate.url=
mosip.resident.oidc.userinfo.jwt.verify.enabled=false
```
{% endcode %}

### Resident login configurations for e-Signet

{% code overflow="wrap" lineNumbers="true" %}
```
mosip.iam.module.redirecturi=${mosip.api.internal.url}/resident/v1/login-redirect/
mosip.iam.module.login_flow.name=authorization_code
mosip.iam.module.login_flow.scope=openid profile Manage-Identity-Data Manage-VID Manage-Authentication Manage-Service-Requests Manage-Credentials
mosip.iam.module.login_flow.claims={"userinfo":{"name":{"essential":true},"picture":{"essential":true},"email":{"essential":true},"phone_number":{"essential":true},"individual_id":{"essential":true}}}
mosip.iam.module.login_flow.response_type=code
mosip.iam.module.admin_realm_id=mosip
```
{% endcode %}

### User-info claim attributes

Used in `open-id-connect` based login with UIN/VID in MOSIP e-Signet(IDP)

{% code overflow="wrap" lineNumbers="true" %}
```
mosip.resident.identity.claim.individual-id=individual_id
mosip.resident.identity.claim.ida-token=ida_token
```
{% endcode %}

### Scopes

Used for login purpose:

{% code overflow="wrap" lineNumbers="true" %}
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
{% endcode %}

### Key manager encryption/ decryption configuration

Properties used to define application and reference id.

{% code overflow="wrap" lineNumbers="true" %}
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
{% endcode %}

### Object Store configuration

**For Minio**: object.store.s3.url=http://minio.minio:9000

**For AWS**: object.store.s3.url=s3.${s3.region}.amazonaws.com

{% code overflow="wrap" lineNumbers="true" %}
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
{% endcode %}

### Virus Scanner configuration

Property used to enable virus scanner flag

{% code overflow="wrap" lineNumbers="true" %}
```
mosip.resident.virus-scanner.enabled=true
```
{% endcode %}

### VID Policy URL

Property used to get the vid policy json:

{% code overflow="wrap" lineNumbers="true" %}
```
mosip.resident.vid-policy-url=${config.server.file.storage.uri}mosip-vid-policy.json
```
{% endcode %}

### Resident UI Schema JSON file

Property used to get the UI schema json

{% code overflow="wrap" lineNumbers="true" %}
```
resident-ui-schema-file-name-prefix=resident-ui
resident-ui-schema-file-url=${config.server.file.storage.uri}${resident-ui-schema-file-name-prefix}
resident-ui-schema-file-source-prefix=url:${resident-ui-schema-file-url}
```
{% endcode %}

### Credential Data format MVEL file name

This property is used to get the data format from MVEL file:

{% code overflow="wrap" lineNumbers="true" %}
```
resident-data-format-mvel-file-name=credentialdata.mvel
resident-data-format-mvel-file-url=${config.server.file.storage.uri}${resident-data-format-mvel-file-name} 
resident-data-format-mvel-file-source=url:${resident-data-format-mvel-file-url}
```
{% endcode %}

### WebSub Topic and callback properties for auth-type status event

Below websub properties are used for authentication type status event:

{% code overflow="wrap" lineNumbers="true" %}
```
resident.websub.authtype-status.secret=******
resident.websub.authtype-status.topic=AUTH_TYPE_STATUS_UPDATE_ACK
resident.websub.callback.authtype-status.relative.url=${server.servlet.context-path}/callback/authTypeCallback
resident.websub.callback.authtype-status.url=${mosip.api.internal.url}${resident.websub.callback.authtype-status.relative.url}
```
{% endcode %}

### WebSub Topic and callback properties for auth-transaction status event

Below websub properties used for authentication transaction status event:

{% code overflow="wrap" lineNumbers="true" %}
```
resident.websub.authTransaction-status.secret=******
resident.websub.authTransaction-status.topic=AUTHENTICATION_TRANSACTION_STATUS
resident.websub.callback.authTransaction-status.relative.url=${server.servlet.context-path}/callback/authTransaction
resident.websub.callback.authTransaction-status.url=${mosip.api.internal.url}${resident.websub.callback.authTransaction-status.relative.url}
```
{% endcode %}

#### WebSub Topic and callback properties for credential status event

Below websub properties used for credential status event:

{% code overflow="wrap" lineNumbers="true" %}
```
resident.websub.credential-status.secret=******
resident.websub.credential-status.topic=CREDENTIAL_STATUS_UPDATE
resident.websub.callback.credential-status.relative.url=${server.servlet.context-path}/callback/credentialStatusUpdate
resident.websub.callback.credential-status.url=${mosip.api.internal.url}${resident.websub.callback.credential-status.relative.url}
```
{% endcode %}

### TokenId generator

{% code overflow="wrap" lineNumbers="true" %}
```
mosip.kernel.tokenid.uin.salt=******
mosip.kernel.tokenid.partnercode.salt=******
```
{% endcode %}

### Mask functions

Properties used to get the data format from MVEL file.

{% code overflow="wrap" lineNumbers="true" %}
```
resident.email.mask.function=maskEmail
resident.phone.mask.function=maskPhone
resident.data.mask.function=convertToMaskData
```
{% endcode %}

### Batch job configuration for credential status update

{% code overflow="wrap" lineNumbers="true" %}
```
mosip.resident.update.service.status.job.enabled=false
mosip.resident.update.service.status.job.initial-delay=60000
#Interval for checking the credential status for async requests. Note, this is done as a fallback though credential status update is hanlded in resident service via websub notification.
mosip.resident.update.service.status.job.interval.millisecs=600000
```
{% endcode %}

### Template type codes for terms and conditions

{% code overflow="wrap" lineNumbers="true" %}
```
resident.template.tnc.order-a-physical-card=tnc-order-a-physical-card
resident.template.tnc.share-cred-with-partner=tnc-share-cred-with-partner
resident.template.tnc.update-demo=tnc-update-demo
```
{% endcode %}

### Template type codes for email subject

{% code overflow="wrap" lineNumbers="true" %}
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
{% endcode %}

### Template type codes for email content

{% code overflow="wrap" lineNumbers="true" %}
```
resident.template.email.content.request-received.cust-and-down-my-card=cust-and-down-my-card-request-received-email-content
resident.template.email.content.success.cust-and-down-my-card=cust-and-down-my-card-success-email-content
resident.template.email.content.failure.cust-and-down-my-card=cust-and-down-my-card-failure-email-content

resident.template.email.content.request-received.order-a-physical-card=order-a-physical-card-request-received-email-content
resident.template.email.content.success.order-a-physical-card=order-a-physical-card-success-email-content
resident.template.email.content.failure.order-a-physical-card=order-a-physical-card-failure-email-content

resident.template.email.content.request-received.share-cred-with-partner=share-cred-with-partner-request-received-email-content
resident.template.email.content.success.share-cred-with-partner=share-cred-with-partner-success-email-content
resident.template.email.content.failure.share-cred-with-partner=share-cred-with-partner-failure-email-content

resident.template.email.content.request-received.lock-unlock-auth=lock-unlock-auth-request-received-email-content
resident.template.email.content.success.lock-unlock-auth=lock-unlock-auth-success-email-content
resident.template.email.content.failure.lock-unlock-auth=lock-unlock-auth-failure-email-content

resident.template.email.content.request-received.update-demo-data=update-demo-data-request-received-email-content
resident.template.email.content.success.update-demo-data=update-demo-data-success-email-content
resident.template.email.content.failure.update-demo-data=update-demo-data-failure-email-content

resident.template.email.content.request-received.gen-or-revoke-vid=gen-or-revoke-vid-request-received-email-content
resident.template.email.content.success.gen-or-revoke-vid=gen-or-revoke-vid-success-email-content
resident.template.email.content.failure.gen-or-revoke-vid=gen-or-revoke-vid-failure-email-content

resident.template.email.content.request-received.vid-card-download=vid-card-download-request-received-email-content
resident.template.email.content.success.vid-card-download=vid-card-download-success-email-content
resident.template.email.content.failure.vid-card-download=vid-card-download-failure-email-content

resident.template.email.content.request-received.get-my-uin-card=get-my-uin-card-request-received-email-content
resident.template.email.content.success.get-my-uin-card=get-my-uin-card-success-email-content
resident.template.email.content.failure.get-my-uin-card=get-my-uin-card-failure-email-content

resident.template.email.content.request-received.verify-my-phone-email=verify-my-phone-email-request-received-email-content
resident.template.email.content.success.verify-my-phone-email=verify-my-phone-email-success-email-content
resident.template.email.content.failure.verify-my-phone-email=verify-my-phone-email-failure-email-content

resident.template.email.content.success.send-otp=receive-otp-mail-content
resident.template.email.content.success.validate-otp=validate-otp-mail-content
```
{% endcode %}

### Template type codes for sms content

{% code overflow="wrap" lineNumbers="true" %}
```
resident.template.sms.request-received.cust-and-down-my-card=cust-and-down-my-card-request-received_SMS
resident.template.sms.success.cust-and-down-my-card=cust-and-down-my-card-success_SMS
resident.template.sms.failure.cust-and-down-my-card=cust-and-down-my-card-failure_SMS

resident.template.sms.request-received.order-a-physical-card=order-a-physical-card-request-received_SMS
resident.template.sms.success.order-a-physical-card=order-a-physical-card-success_SMS
resident.template.sms.failure.order-a-physical-card=order-a-physical-card-failure_SMS

resident.template.sms.request-received.share-cred-with-partner=share-cred-with-partner-request-received_SMS
resident.template.sms.success.share-cred-with-partner=share-cred-with-partner-success_SMS
resident.template.sms.failure.share-cred-with-partner=share-cred-with-partner-failure_SMS

resident.template.sms.request-received.lock-unlock-auth=lock-unlock-auth-request-received_SMS
resident.template.sms.success.lock-unlock-auth=lock-unlock-auth-success_SMS
resident.template.sms.failure.lock-unlock-auth=lock-unlock-auth-failure_SMS

resident.template.sms.request-received.update-demo-data=update-demo-data-request-received_SMS
resident.template.sms.success.update-demo-data=update-demo-data-success_SMS
resident.template.sms.failure.update-demo-data=update-demo-data-failure_SMS

resident.template.sms.request-received.gen-or-revoke-vid=gen-or-revoke-vid-request-received_SMS
resident.template.sms.success.gen-or-revoke-vid=gen-or-revoke-vid-success_SMS
resident.template.sms.failure.gen-or-revoke-vid=gen-or-revoke-vid-failure_SMS

resident.template.sms.request-received.vid-card-download=vid-card-download-request-received_SMS
resident.template.sms.success.vid-card-download=vid-card-download-success_SMS
resident.template.sms.failure.vid-card-download=vid-card-download-failure_SMS

resident.template.sms.request-received.get-my-uin-card=get-my-uin-card-request-received_SMS
resident.template.sms.success.get-my-uin-card=get-my-uin-card-success_SMS
resident.template.sms.failure.get-my-uin-card=get-my-uin-card-failure_SMS

resident.template.sms.request-received.verify-my-phone-email=verify-my-phone-email-request-received_SMS
resident.template.sms.success.verify-my-phone-email=verify-my-phone-email-success_SMS
resident.template.sms.failure.verify-my-phone-email=verify-my-phone-email-failure_SMS

resident.template.sms.success.send-otp=receive-otp
resident.template.sms.success.validate-otp=validate-otp
```
{% endcode %}

### Template type codes for purpose (success) content

{% code overflow="wrap" lineNumbers="true" %}
```
resident.template.purpose.success.cust-and-down-my-card=cust-and-down-my-card-positive-purpose
resident.template.purpose.success.order-a-physical-card=order-a-physical-card-positive purpose
resident.template.purpose.success.share-cred-with-partner=share-cred-with-partner-positive-purpose
resident.template.purpose.success.lock-unlock-auth=lock-unlock-auth-positive-purpose
resident.template.purpose.success.update-demo-data=update-demo-data-positive-purpose
resident.template.purpose.success.gen-or-revoke-vid=gen-or-revoke-vid-positive-purpose
resident.template.purpose.success.get-my-uin-card=get-my-uin-card-positive-purpose
resident.template.purpose.success.verify-my-phone-email=verify-my-phone-email-positive-purpose
resident.template.purpose.success.vid-card-download=vid-card-download-positive-purpose
```
{% endcode %}

### Template type codes for purpose (in-progress/failure) content

{% code overflow="wrap" lineNumbers="true" %}
```
resident.template.purpose.failure.cust-and-down-my-card=cust-and-down-my-card-negative-purpose
resident.template.purpose.failure.order-a-physical-card=order-a-physical-card-negative purpose
resident.template.purpose.failure.share-cred-with-partner=share-cred-with-partner-negative-purpose
resident.template.purpose.failure.lock-unlock-auth=lock-unlock-auth-negative-purpose
resident.template.purpose.failure.update-demo-data=update-demo-data-negative-purpose
resident.template.purpose.failure.gen-or-revoke-vid=gen-or-revoke-vid-negative-purpose
resident.template.purpose.failure.get-my-uin-card=get-my-uin-card-negative-purpose
resident.template.purpose.failure.verify-my-phone-email=verify-my-phone-email-negative-purpose
resident.template.purpose.failure.vid-card-download=vid-card-download-negative-purpose
```
{% endcode %}

### Template type codes for summary (success) content

{% code overflow="wrap" lineNumbers="true" %}
```
resident.template.summary.success.cust-and-down-my-card=cust-and-down-my-card-success-summary
resident.template.summary.success.order-a-physical-card=order-a-physical-card-success-summary
resident.template.summary.success.share-cred-with-partner=share-cred-with-partner-success-summary
resident.template.summary.success.lock-unlock-auth=lock-unlock-auth-success-summary
resident.template.summary.success.update-demo-data=update-demo-data-success-summary
resident.template.summary.success.gen-or-revoke-vid=gen-or-revoke-vid-success-summary
resident.template.summary.success.get-my-uin-card=get-my-uin-card-success-summary
resident.template.summary.success.verify-my-phone-email=verify-my-phone-email-success-summary
resident.template.summary.success.vid-card-download=vid-card-download-positive-summary
```
{% endcode %}

### Template type codes for acknowledgement PDFs

{% code overflow="wrap" lineNumbers="true" %}
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
{% endcode %}

### Template type codes for supporting documents, service history, registration centers and VID card

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
resident.view.history.status.filters=all,Success,In Progress,Failed
```

### Maximum data to download in a PDF

```
resident.service-history.download.max.count=100
resident.registration-centers.download.max.count=100
```

### Registration Center search configuration

The Registration centers will be searched based on the distance value in meters from the Geo location identified

```
resident.nearby.centers.distance.meters=2000
```

### Page size in Bell Icon Notification list and view history

```
resident.notifications.default.page.size=100
resident.view-history.default.page.size=10
```

### Token related configuration

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

### Credential request configuration

```
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

### Synchronous events

```
resident.request.success.status.list.AUTHENTICATION_REQUEST=AUTHENTICATION_SUCCESSFUL,Y
resident.request.failed.status.list.AUTHENTICATION_REQUEST=AUTHENTICATION_FAILED,N

resident.request.new.status.list.DOWNLOAD_PERSONALIZED_CARD=NEW
resident.batchjob.process.success.status.list.DOWNLOAD_PERSONALIZED_CARD=CARD_DOWNLOADED
resident.request.failed.status.list.DOWNLOAD_PERSONALIZED_CARD=FAILED

resident.request.new.status.list.GET_MY_ID=NEW
resident.request.in-progress.status.list.GET_MY_ID=OTP_REQUESTED
resident.request.success.status.list.GET_MY_ID=CARD_DOWNLOADED,OTP_VERIFIED
resident.request.failed.status.list.GET_MY_ID=FAILED

resident.request.new.status.list.BOOK_AN_APPOINTMENT=
resident.request.success.status.list.BOOK_AN_APPOINTMENT=
resident.request.failed.status.list.BOOK_AN_APPOINTMENT=

resident.request.new.status.list.GENERATE_VID=NEW
resident.request.success.status.list.GENERATE_VID=VID_GENERATED
resident.request.failed.status.list.GENERATE_VID=FAILED

resident.request.new.status.list.REVOKE_VID=NEW
resident.request.success.status.list.REVOKE_VID=VID_REVOKED
resident.request.failed.status.list.REVOKE_VID=FAILED

resident.request.new.status.list.SEND_OTP=
resident.request.success.status.list.SEND_OTP=
resident.request.failed.status.list.SEND_OTP=

resident.request.new.status.list.VALIDATE_OTP=OTP_REQUESTED
resident.request.success.status.list.VALIDATE_OTP=OTP_VERIFIED
resident.request.failed.status.list.VALIDATE_OTP=OTP_VERIFICATION_FAILED

resident.request.new.status.list.DEFAULT=
resident.request.success.status.list.DEFAULT=
resident.request.failed.status.list.DEFAULT=
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

Define property name in below format-

resident..template.property.attribute.list

```
resident.fullName.template.property.attribute.list=mosip.full.name.template.property
resident.dateOfBirth.template.property.attribute.list=mosip.date.of.birth.template.property
resident.UIN.template.property.attribute.list=mosip.uin.template.property
resident.perpetualVID.template.property.attribute.list=mosip.perpetual.vid.template.property
resident.phone.template.property.attribute.list=mosip.phone.template.property
resident.email.template.property.attribute.list=mosip.email.template.property
resident.fullAddress.template.property.attribute.list=mosip.address.template.property
resident.addressLine1.template.property.attribute.list=mosip.address.line1.template.property
resident.addressLine2.template.property.attribute.list=mosip.address.line2.template.property
resident.addressLine3.template.property.attribute.list=mosip.address.line3.template.property
resident.province.template.property.attribute.list=mosip.province.template.property
resident.city.template.property.attribute.list=mosip.city.template.property
resident.zone.template.property.attribute.list=mosip.zone.template.property
resident.postalCode.template.property.attribute.list=mosip.postal.code.template.property
resident.region.template.property.attribute.list=mosip.region.template.property
resident.gender.template.property.attribute.list=mosip.gender.template.property
resident.photo.template.property.attribute.list=mosip.photo.template.property
resident.preferredLang.template.property.attribute.list=mosip.preferred.language.template.property
resident.default.template.property.attribute.list=mosip.defualt.template.property
```

### Class name of the referenceValidator

Commenting or removing this property will disable reference validator.

```
mosip.kernel.idobjectvalidator.referenceValidator=io.mosip.kernel.idobjectvalidator.impl.IdObjectReferenceValidator
```

### Cache expiration time (in milliseconds)

```
template.cache.expiry.time.millisec=86400000
```

### Request time validation

For validating request time as per before and after time limit (in seconds) in contact-details/update API.

```
resident.future.time.limit=60
resident.past.time.limit=60
```

### Date time formatting styles

The java.time.format.FormatStyle enum to use for date time formatting based on locale. Allowed values with examples are:

* FULL ('Tuesday, April 12, 1952 AD' or '3:30:42pm PST')
* LONG('January 12, 1952')
* MEDIUM ('Jan 12, 1952')
* SHORT ('12.13.52' or '3:30pm')

Current value is MEDUIM. For more details refer to the enum.

```
resident.date.time.formmatting.style=MEDIUM
resident.date.time.replace.special.chars={" ": "_", "," : "", ":" : "."}
```

### Logger related properties

URL pattern for logging filter. For example, "/callback/" .Defaults to "/".

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

### Websub properties

```
subscriptions-delay-on-startup_millisecs=120000
re-subscription-interval-in-seconds=43200
resident.websub.request.decorator.filter.enabled=true
```
