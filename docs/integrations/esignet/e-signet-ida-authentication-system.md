# IDA as authentication system

IDA is integrated as authentication system in e-Signet services with the below two endpoints:

1. [kyc-auth endpoint](https://mosip.stoplight.io/docs/id-authentication/branches/main/e1010cf7b1ea6-kyc-auth)
2. [kyc-exchange endpoint](https://mosip.stoplight.io/docs/id-authentication/branches/main/645a92f1b98c0-kyc-exchange)

![](../../\_images/ida-esignet-integration.png)

## Configurations

1. To get the mapping of OIDC claims with MOSIP KYC-attributes, click [here](https://github.com/mosip/mosip-config/blob/develop-v3/identity-mapping.json).
2. To get the mapping of auth types in policy with ACR values, click [here](https://github.com/mosip/mosip-config/blob/develop-v3/amr-acr-mapping.json).
3.  Below configurations are required to be set in `idp-default.properties`.\


    IdP-service will be onboarded as MISP partner

    ```
    mosip.idp.misp.license.key=<license key of MISP partner will be set here>
    ```

    [IDA wrapper implementation](https://github.com/mosip/idp/blob/master/authentication-wrapper/src/main/java/io/mosip/idp/authwrapper/service/IdentityAuthenticationService.java)

    ```
    mosip.idp.authn.wrapper.impl=IdentityAuthenticationService
    ```

    URL to download IDA partner certificate used to encrypt the kyc-auth request

    ```
    mosip.idp.authn.ida.cert-url=https://raw.githubusercontent.com/mosip/mosip-config/develop-v3/ida-partner.cer
    ```

    Other properties required by the IDA wrapper implementation

    ```
    mosip.idp.authn.ida.kyc-auth-url=https://${mosip.api.internal.host}/idauthentication/v1/kyc-auth/delegated/${mosip.idp.misp.license.key}/
    mosip.idp.authn.ida.kyc-exchange-url=https://${mosip.api.internal.host}/idauthentication/v1/kyc-exchange/delegated/${mosip.idp.misp.license.key}/
    mosip.idp.authn.ida.send-otp-url=https://${mosip.api.internal.host}/idauthentication/v1/otp/${mosip.idp.misp.license.key}/
    mosip.idp.authn.wrapper.ida-domainUri=https://${mosip.idp.host}
    mosip.idp.authn.wrapper.ida-env=Developer
    mosip.idp.authn.ida.otp-channels=email,phone
    ```
