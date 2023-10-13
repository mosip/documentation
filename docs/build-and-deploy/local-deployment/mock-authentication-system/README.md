# Mock Authentication System

This guide helps with the steps to mock the authentication server.

{% hint style="info" %}
Note: It is for development purposes only.
{% endhint %}

We run the mock identity system, with endpoints to create an individual, authenticate an individual, share data of the individual and mock send-OTP operations.

**GitHub Repository**

{% embed url="https://github.com/mosip/esignet-mock-services/tree/0.9.0/mock-identity-system" %}

**Configurations**

{% embed url="https://github.com/mosip/mosip-config/blob/qa-1201-B2/mock-identity-system-default.properties" %}

## Setup

1.  Set the mock implementation details in the `esignet-default.properties`\


    ```properties
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
2.  Add mock implementation jar into e-Signet service classpath.

    > Build this module : https://github.com/mosip/esignet-mock-services/tree/0.9.0/mock-esignet-integration-impl using below command
    >
    > `mvn clean install -Dgpg.skip=true`


3. And an entry in the `key_policy_def` table of `mosip_esignet` DB:

```sql
INSERT INTO 
KEY_POLICY_DEF(APP_ID, KEY_VALIDITY_DURATION, PRE_EXPIRE_DAYS, ACCESS_ALLOWED, 
IS_ACTIVE, CR_BY, CR_DTIMES) 
VALUES('MOCK_BINDING_SERVICE', 1095, 50, 'NA', true, 'mosipadmin', now());
```

4. To add a new persona, using the create identity endpoint of the mock identity system, add a mock individual into the system.

```
POST https://api.dev.mosip.net/v1/mock-identity-system/identity

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

With mock individuals created in the mock identity system, The individual ID created could now be used with e-Signet to perform PIN / OTP / BIO / QR-code-based login.
