# Configure eSignet

In this section, we have listed the properties that may change from implementation to implementation. All the properties used by eSignet with their default values can be found in the [esignet-default.properties](https://github.com/mosip/mosip-config/blob/master/esignet-default.properties).

## Basic Configurations

These are very basic configuration properties of the eSignet service. Most of them are set to ideal values by default.

* Generated **ID token expiry** time in seconds\
  `mosip.esignet.id-token-expire-seconds=3600`
* Generated **access token expiry** time in seconds\
  `mosip.esignet.access-token-expire-seconds=3600`
* Switch off or on the **captcha** token validation in the send OTP request\
  `mosip.esignet.send-otp.captcha-required=false`
* **Time** gap allowed **between** **authentication** **and** **consent** capture in seconds\
  `mosip.esignet.authentication-expire-in-secs`
* Applicable for QR code-based login: QR code is embedded with link-code which is used by wallet apps to link transactions between the wallet app and the browser. This is the property to define the **lifetime of a link code** in seconds.\
  `mosip.esignet.link-code-expire-in-secs=600`
* Regex to validate the input client ID\
  `mosip.esignet.supported-id-regex=\\S*`
* eSignet uses logback for logging. The **log level** of the application can be easily changed with this property.\
  `logging.level.io.mosip.esignet=INFO`

### OAuth and OpenID

* Property to define the list of **authorize scopes**\
  `mosip.esignet.supported.authorize.scopes={'manage-resident-vid'}`
* Property to define the list of **OpenId scopes**\
  `mosip.esignet.supported.openid.scopes={'profile','email','phone'}`
* Property to define the **OpenId scopes and user claim mappings** `mosip.esignet.openid.scope.claims={'profile' : {'name','picture','gender','birthdate','address'},'email' : {'email'}, 'phone' : {'phone_number'}}`

{% hint style="info" %}
To know more about the claims supported by eSignet, go through our [claims documentation](claims.md).
{% endhint %}

* **OAuth** configuration's **well-known endpoint** is based on the below configuration property. This holds the map which is exactly the same as the [oauth-authorization-server](https://www.rfc-editor.org/rfc/rfc8414.html#section-2)'s well-known spec.\
  `mosip.esignet.oauth.key-values`
* **OIDC** configuration **well known endpoint** is based on the below configuration property. This holds the map which is exactly the same as the [openid-configuration](https://openid.net/specs/openid-connect-discovery-1\_0.html#ProviderConfigurationResponse)'s well-known spec. `mosip.esignet.discovery.key-values`

### VC Issuance

* Property to define the list of **supported credential scopes** `mosip.esignet.supported.credential.scopes={'sample_vc_ldp'}`
* **Client nonce** used in VCI flow **expiry** in seconds\
  `mosip.esignet.cnonce-expire-seconds=20`
* **OIDC** **VCI** configuration **well known** **endpoint** is based on the below configuration property. This holds the map which is the same as the [openid-credential-issuer](https://openid.github.io/OpenID4VCI/openid-4-verifiable-credential-issuance-wg-draft.html#name-credential-issuer-metadata) well-known spec.\
  `mosip.esignet.vci.key-values`

## Cache

eSignet uses a cache to store all the details about UI transactions that are identified with a transaction ID. eSignet uses the spring-cache abstraction library. Hence eSignet could be connected with any spring-cache abstraction supported cache server.

* By default, it is set to simple to use springs **default in-memory cache** `spring.cache.type=simple`
* eSignet transitions the transaction details from one cache to another cache based on the transaction stage. Here is the list of **caches maintained in eSignet**\
  `mosip.esignet.cache.names=clientdetails,preauth,authenticated,authcodegenerated,userinfo,linkcodegenerated,linked,linkedcode,linkedauth,consented,authtokens,bindingtransaction,vcissuance`
* Property to set the **max size of cache**\
  `mosip.esignet.cache.size`

{% hint style="info" %}
This is applicable only for `simple` cache type
{% endhint %}

* Property to set the **Time To Live(TTL) per cache**, applicable to both `Redis` and `simple` cache `mosip.esignet.cache.expire-in-seconds`

{% hint style="info" %}
For cache other than `redis` and `simple`, based on the cache native TTL support a separate cache configuration should be added. Find the Redis cache config [here](https://github.com/mosip/esignet/blob/master/esignet-core/src/main/java/io/mosip/esignet/core/config/RedisCacheConfig.java).
{% endhint %}

## Plugin Integrations

In eSignet, we use runtime plugins to connect with external ID systems or VC Issuers. As per design we only load one implementation of the plugin interface.

The below properties define the plugin packages to be scanned and which implementations should be loaded into the spring context.

* Comma-separated list of **plugin implementation packages** to scan by spring `mosip.esignet.integration.scan-base-package=io.mosip.esignet.mock.integration`
* **Authenticator plugin** implementation is a conditional scanned bean based on the property below\
  `mosip.esignet.integration.authenticator=MockAuthenticationService`
* **Key binder plugin** implementation is a conditional scanned bean based on the property below `mosip.esignet.integration.key-binder=MockKeyBindingWrapperService`
* **Audit plugin** implementation is a conditional scanned bean based on the property below `mosip.esignet.integration.audit-plugin=LoggerAuditService`
* **VCI plugin** implementation is a conditional scanned bean based on the property below `mosip.esignet.integration.vci-plugin=MockVCIssuancePlugin`

Plugins may also have configurations defined. All those properties should be added in the [esignet-default.properties](https://github.com/mosip/mosip-config/blob/master/esignet-default.properties).

{% hint style="info" %}
Configuration properties with respect to mock plugins and MOSIP IDA plugins are by default added in the [esignet-default.properties](https://github.com/mosip/mosip-config/blob/master/esignet-default.properties) file in [mosip-config](https://github.com/mosip/mosip-config/tree/master) repository.
{% endhint %}

## Key Manager

The key manager connects with the configured keystore. Below are the configurations used:

* Type of keystore, Supported Types: PKCS11, PKCS12, Offline, JCE `mosip.kernel.keymanager.hsm.keystore-type=PKCS11`
* For PKCS11 provide Path of config file. For PKCS12 keystore type provide the p12/pfx file path. P12 file will be created internally so provide only the file path & file name. For Offline & JCE property can be left blank, and specified value will be ignored.\
  `mosip.kernel.keymanager.hsm.config-path=/config/softhsm-application.conf`
* Passkey of keystore for PKCS11, PKCS12.For Offline & JCE proer can be left blank. JCE passwords use other JCE-specific properties.\
  `mosip.kernel.keymanager.hsm.keystore-pass`

{% hint style="info" %}
Most of the other key manager configurations need not be changed.
{% endhint %}

## eSignet UI

List of properties used by the eSignet UI to render the UI accordingly.

* The below property holds the map of ui properties with default values `mosip.esignet.ui.config.key-values.`

Here is the list of keys used in the `mosip.esignet.ui.config.key-values` property.

### SBI for Biometric Authentication

* `sbi.env` - By default, SBI env is set to 'Develop'
* `sbi.port.range` - Port range to scan for any running SBI
* `sbi.timeout.DISC` - Timeout for SBI discovery endpoint in seconds
* `sbi.timeout.DINFO` - Timeout for SBI device info endpoint in seconds
* `sbi.timeout.CAPTURE` - Timeout for SBI capture endpoint in seconds
* `sbi.capture.count.face` - count is set to 1
* `sbi.capture.count.finger` - Number of fingers to be captured
* `sbi.capture.count.iris` - Number of iris to be captured
* `sbi.capture.score.face` - Quality score threshold for face
* `sbi.capture.score.finger` - Quality score threshold for finger
* `sbi.capture.score.iris` - Quality score threshold for iris
* `sbi.bio.subtypes.iris` - Biometric attribute name to be captured, otherwise it is set to 'UNKNOWN'
* `sbi.bio.subtypes.finger` - Biometric attribute name to be captured, otherwise it is set to 'UNKNOWN'

### Login Components

* `send.otp.channels` - Comma-separated channels list, through which OTP will be sent
* `resend.otp.delay.secs` - Timer to enable resend OTP button
* `otp.length` - Length of the OTP
* `password.regex` - Regex for UI validation
* `linked-transaction-expire-in-secs` - Number of seconds allowed for a linked transaction to complete in the wallet APP.
* `wallet.qr-code-buffer-in-secs` - New QR code will be autogenerated before the expiry of the current QR code, this property defines the time difference in seconds.
* `wallet.qr-code.auto-refresh-limit` - Limit for the QR code auto-refresh.
* `wallet.config` - List of wallets to be displayed for QR code-based login

### Consent screen

* `consent.screen.timeout-in-secs` - Timer on the consent page which will expire in the given second
* `consent.screen.timeout-buffer-in-secs` - Buffer time for the consent screen expiry timer

### Captcha

* `captcha.enable` - Comma-separated components list, where the captcha should be shown. Currently only supports the OTP page.
* `captcha.sitekey` - Site Key used to generate captcha.
