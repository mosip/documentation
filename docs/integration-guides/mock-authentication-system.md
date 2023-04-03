# Mock Authentication System

This guide helps with the steps to mock the authentication server. 

{% hint style="info" %}
Note: It is for development purpose only.
{% endhint %}

We run mock-identity-system, with endpoints to create individual, authenticate individual, share data of an individual and mock send-otp operations.
>Repository: https://github.com/mosip/esignet-mock-services/tree/0.9.0/mock-identity-system

>configuration: https://github.com/mosip/mosip-config/blob/qa-1201-B2/mock-identity-system-default.properties


## Setup

1. Set the mock implementation details in properties
    ```
    mosip.esignet.integration.scan-base-package=io.mosip.esignet.mock.integration
    mosip.esignet.integration.authenticator=MockAuthenticationService
    mosip.esignet.integration.key-binder=MockKeyBindingWrapperService
    mosip.esignet.integration.audit-plugin=LoggerAuditService
   
    mosip.esignet.mock.authenticator.get-identity-url=https://${mosip.api.public.host}/v1/mock-identity-system/identity
    mosip.esignet.mock.authenticator.kyc-auth-url=https://${mosip.api.public.host}/v1/mock-identity-system/kyc-auth
    mosip.esignet.mock.authenticator.kyc-exchange-url=https://${mosip.api.public.host}/v1/mock-identity-system/kyc-exchange
    mosip.esignet.mock.authenticator.ida.otp-channels=email,phone
    mosip.esignet.mock.authenticator.send-otp=https://${mosip.api.public.host}/v1/mock-identity-system/send-otp
    mosip.esignet.mock.supported.bind-auth-factor-types={'WLA'}
    ```
   
2. Add mock implementation jar into e-Signet classpath.
    >Repository : https://github.com/mosip/esignet-mock-services/tree/0.9.0/mock-esignet-integration-impl

3. And an entry in key_policy_def table of mosip_esignet DB:

   `INSERT INTO KEY_POLICY_DEF(APP_ID,KEY_VALIDITY_DURATION,PRE_EXPIRE_DAYS,ACCESS_ALLOWED,IS_ACTIVE,CR_BY,CR_DTIMES) VALUES('MOCK_BINDING_SERVICE', 1095, 50, 'NA', true, 'mosipadmin', now());`


4. Add Persona. Create identity endpoint of mock-identity-system is used to add mock individuals into the system.
   > POST https://${mosip.api.public.host}/v1/mock-identity-system/identity
   ```
   {
    "individualId": "6721840162",
    "pin": "12345",
    "fullName": [
    {
    "language": "eng",
    "value": "Xavier J"
    }
    ],
    "gender": [
    {
    "language": "eng",
    "value": "Male"
    }
    ],
    "dateOfBirth": "04/08/1857",
    "streetAddress": [
    {
    "language": "eng",
    "value": "Cresent road"
    }
    ],
    "locality": [
    {
    "language": "eng",
    "value": "CIT colony"
    }
    ],
    "region": [
    {
    "language": "eng",
    "value": "Chennai"
    }
    ],
    "postalCode": "570100",
    "country": [
    {
    "language": "eng",
    "value": "India"
    }
    ],
    "encodedPhoto": "string",
    "email": "xavier.jj@gmail.com",
    "phone": "0394423242"
    }
   ```


With mock individuals created in mock-identity-system, The individualId created could now be used with e-Signet to perform PIN / OTP / BIO / QR-code based login.