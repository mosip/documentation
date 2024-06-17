# Configuring eSignet

This document detail steps to configure eSignet for MOSIP.

## eSignet as MISP Partner

Once, both MOSIP and eSignet are deployed, eSignet needs to be onboarded in MOSIP as a MISP partner and a new policy called the MISP policy needs to be mapped to the eSignet MISP partner.

Below is the policy that should be mapped to the eSignet MISP partner.

```json
{
  "allowAuthRequestDelegation":true,
  "allowKycRequestDelegation":true,
  "trustBindedAuthVerificationToken":true,
  "allowKeyBindingDelegation":true
}
```

Once the MISP is created and mapped to the above policy, a license key for the eSignet should be created and it should be updated in the `esignet-default.properties` against the property name : `mosip.esignet.misp.license.key`.

This license key would be used when the [MOSIP IDA APIs](../e-signet/ida.md#appendix-api-specifications) are called for eSignet based authentication or exchange.

## Configuring OIDC claims and KYC attributes

During the initial setup, the default OIDC claims should to be mapped with the allowed KYC attributes in the relying party policy in the [identity-mapping.json ](https://github.com/mosip/mosip-config/blob/master/identity-mapping.json)of MOSIP's configurations.

Below is sample how this mapping file is added to the default mapping file of MOSIP.

```json
{
  "identity":{
    "name":{
      "value":"fullName"
    },
    "gender":{
      "value":"gender"
    },
    "birthdate":{
      "value":"dateOfBirth"
    },
    "picture":{
      "value":"face"
    },
    "individual_id":{
      "value":"individual_id"
    },
    "street_address":{
      "value":"addressLine1,addressLine2,addressLine3"
    },
    "locality":{
      "value":"city"
    },
    "region":{
      "value":"region"
    },
    "postal_code":{
      "value":"postalCode"
    },
    "country":{
      "value":"province"
    }
  }
}
```

## Configuring ACR and AMR values

During the initial setup, the ACR and AMR values needs to be mapped to the MOSIP authentication types in the [amr-acr-mapping.json](https://github.com/mosip/mosip-config/blob/master/amr-acr-mapping.json).

```json
{
  "amr" : {
    "PWD" :  [{ "type": "PWD" }],
    "PIN" :  [{ "type": "PIN" }],
    "OTP" :  [{ "type": "OTP" }],
    "Wallet" :  [{ "type": "WLA" }],
    "L1-bio-device" :  [{ "type": "BIO", "count": 1 }]
  },
  "acr_amr" : {
    "mosip:idp:acr:password" : ["PWD"],
    "mosip:idp:acr:static-code" : ["PIN"],
    "mosip:idp:acr:generated-code" : ["OTP"],
    "mosip:idp:acr:linked-wallet" : [ "Wallet" ],
    "mosip:idp:acr:biometrics" : [ "L1-bio-device" ]
  }
}
```

## Plugin Configurations

The package and the implementation class names for the plugins needs to be configured in the [esignet-default.properties](https://github.com/mosip/mosip-config/blob/master/esignet-default.properties) file.

```properties
mosip.esignet.integration.scan-base-package=io.mosip.authentication.esignet.integration
mosip.esignet.integration.binding-validator=BindingValidatorServiceImpl
mosip.esignet.integration.authenticator=IdaAuthenticatorImpl
mosip.esignet.integration.key-binder=IdaKeyBinderImpl
mosip.esignet.integration.audit-plugin=IdaAuditPluginImpl
mosip.esignet.integration.vci-plugin=IdaVCIssuancePluginImpl
```

## ID Authentication Integration Configurations

The below configurations related to MOSIP IDA integration should be updated in the [esignet-default.properties](https://github.com/mosip/mosip-config/blob/master/esignet-default.properties) for KYC authentication, exchange, key binding and VCI exchange.

```properties
mosip.esignet.authenticator.ida-auth-id=mosip.identity.kycauth
mosip.esignet.authenticator.ida-exchange-id=mosip.identity.kycexchange
mosip.esignet.authenticator.ida-send-otp-id=mosip.identity.otp
mosip.esignet.authenticator.ida-version=1.0
mosip.esignet.authenticator.ida-domainUri=https://${mosip.esignet.host}
mosip.esignet.authenticator.ida.cert-url=https://${mosip.api.public.host}/mosip-certs/ida-partner.cer
mosip.esignet.authenticator.ida.kyc-auth-url=https://${mosip.api.internal.host}/idauthentication/v1/kyc-auth/delegated/${mosip.esignet.misp.license.key}/
mosip.esignet.authenticator.ida.kyc-exchange-url=https://${mosip.api.internal.host}/idauthentication/v1/kyc-exchange/delegated/${mosip.esignet.misp.license.key}/
mosip.esignet.authenticator.ida.send-otp-url=https://${mosip.api.internal.host}/idauthentication/v1/otp/${mosip.esignet.misp.license.key}/
mosip.esignet.binder.ida.key-binding-url=https://${mosip.api.internal.host}/idauthentication/v1/identity-key-binding/delegated/${mosip.esignet.misp.license.key}/
mosip.esignet.authenticator.ida.get-certificates-url=https://${mosip.api.internal.host}/idauthentication/v1/internal/getAllCertificates
mosip.esignet.authenticator.ida.auth-token-url=https://${mosip.api.internal.host}/v1/authmanager/authenticate/clientidsecretkey
mosip.esignet.authenticator.ida.audit-manager-url=https://${mosip.api.internal.host}/v1/auditmanager/audits
mosip.esignet.authenticator.ida.client-id=mosip-ida-client
mosip.esignet.authenticator.ida.secret-key=${mosip.ida.client.secret}
mosip.esignet.authenticator.ida.app-id=ida
mosip.esignet.authenticator.ida-env=Developer
mosip.esignet.authenticator.ida.otp-channels=email,phone

mosip.esignet.ida.vci-user-info-cache=userinfo
mosip.esignet.ida.vci-exchange-id=mosip.identity.vciexchange
mosip.esignet.ida.vci-exchange-version=1.0
mosip.esignet.ida.vci-exchange-url=https://${mosip.api.internal.host}/idauthentication/v1/vci-exchange/delegated/${mosip.esignet.misp.license.key}/
```
