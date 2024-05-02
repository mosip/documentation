# ID Authentication Services

## Overview

ID Authentication is built as an independent service that can be seeded with data for authentication by any system, including MOSIP. In the current design, we can have multiple IDA modules running from a single issuer.

The ID Authentication (IDA) module of MOSIP consists of the following services:

1. Authentication Services
2. OTP Service
3. Internal Services

## Authentication Services

The services mentioned below are used by Authentication or e-KYC Partners.

* Authentication Service: used to authenticate an individual's UIN/VID using one or more authentication types.
* KYC Authentication Service: used to request e-KYC for an individual's UIN/VID using one or more authentication types.

![](\_images/authentication-flow.png)

## OTP Request Service

OTP Request Service is used by Authentication/e-KYC Partners to generate OTP for an individual's UIN/VID. The generated OTP is stored in IDA DB for validation during OTP Authentication.

![](\_images/otp-request-flow.png)

## Internal Services

1. Internal Authentication Service - The authentication service used by internal MOSIP modules such as Resident Service, Registration Processor and Registration Client to authenticate individuals.
2. Internal OTP Service - used by Resident Service to generate OTP for an Individual for performing OTP Authentication.
3. Authentication Transaction History Service - used by Resident Service to retrieve a paginated list of authentication and OTP Request transactions for an individual.

### Credential issuance callback

* [ID Authentication](id-authentication.md) uses the credential data of the individuals for performing authentication.
* This credential is requested by [ID Repository](id-repository.md) upon any UIN insertion/update or VID creation.
* The credential is created by Credential Service uploaded to [Datashare](datashare.md) service and the Datashare URL is sent to ID-Authentication using [WebSub](websub.md) message.
* WebSub invokes the credential-issuance callback in [ID Authentication](id-authentication.md) where the credential data is downloaded from Datashare and then stored in IDA DB.

![](\_images/ida-credential-flow.png)

## Key generation

ID Authentication needs the below [keys](keys.md) to be generated during the deployment for usage in Authentication Service.

1. `IDA IDENTITY_CACHE`(K18) symmetric key to encrypt and decrypt the Zero-knowledge 10K random keys
2. `IDA ROOT` master key(K15)), `IDA module` master key(K16), `IDA-SIGN` master key
3. Base keys `CRED_SERVICE`(K22), `IDA-FIR`(K21), `INTERNAL`(K19), `PARTNER`(K20)

## Authentication client demo app

This is a reference application to demonstrate how authentication and KYC can be performed by [Authentication Partners](partners.md#partner-types).

Refer to the [repository](https://github.com/mosip/authentication-demo-ui/tree/release-1.2.0) for more details.

Below is the sample authentication demo UI image.

![](\_images/sample-auth-demo-ui.png)

## Authentication Error Eventing

The ID Authentication service now offers an **Authentication Error Eventing** feature. When an authentication related error occurs, a message will prompt to the user to retry after a few minutes. In the meantime, Kafka event will be triggered to publish the data to the designated topic, allowing subscribers to receive a message for further processing.

This feature can be utilized for different use cases such as on demand template extraction, report generations, to identify any fraudulent occurrence etc.

One such use case is on demand template extraction. In an instance where a user has successfully registered and obtained a valid UIN/VID but encounters an error during authentication due to unavailability of the entered UIN/VID in the IDA DB, this feature comes into play. This issue tends to occur particularly during periods of high registration and UIN generation volumes, where additional time is needed for data transmission from the ID Repo to the IDA DB. This authentication error eventing feature will help in capturing the errors related to this issue and event will be created. subscribers can capture this event and process them accordingly to enable the template extraction to proceed with the authentication/verification process.

This feature is designed to be a plugin feature in IDA, which can be configured based on the requirement. To enable the feature below property should be marked as `True`:

`mosip.ida.authentication.error.eventing.enabled=true`

Once this property is enabled, related kafka property setup should be installed to utilize the feature.

For further guidance on this feature, you can refer to the documentation provided in the following link [here](https://github.com/mosip/id-authentication/blob/release-1.2.1.x/docs/authentication_error_eventing.md)

Subscribers who will be subscribing to the event should be onboarded as authentication partners. To on board subscribers below steps needed to be followed: 

**Steps to onboard the partners**:

1. Create a policygroup by the name `mpolicygroup-default-tempextraction`
2. The policy should be configured to not allow any authentication to be carryout but the partner except reading the kafka event. To attain this, `allowedAuthTypes` should be marked as `null`

For example:

```
{"authTokenType":"partner","allowedKycAttributes":[{"attributeName":"fullName"},{"attributeName":"gender"},{"attributeName":"residenceStatus"},{"attributeName":"dateOfBirth"},{"attributeName":"photo"}],"kycLanguages":["ara","eng"],"allowedAuthTypes":[]}
```
3. Now publish the policygroup and policy
4. Refer this [link](https://docs.mosip.io/1.2.0/partners#authentication-partner-ap) to onboard the subscribers as authentication partners. The name of the partner should be `mpartner-default-tempextraction`

**Note**: This feature is exclusively available in ID Authentication version 1.2.1.0 only. To configure the latest version of IDA and access this new feature, please refer to this link [here](https://github.com/mosip/id-authentication/blob/release-1.2.1.x/docs/authentication_error_eventing.md) 

## Configuration

Refer to [ID Authentication Configuration Guide](https://github.com/mosip/id-authentication/blob/release-1.2.0/docs/configuration.md).

## Developer Guide

To know more about the developer setups, read:

1. [ID Authentication Service Developers Guide](https://docs.mosip.io/1.2.0/modules/id-authentication-services/id-authentication-service-developer-guide)
2. [ID Authentication OTP Service Developers Guide](https://docs.mosip.io/1.2.0/modules/id-authentication-services/id-authentication-otp-service-developer-guide)
3. [ID Authentication Internal Service Developers Guide](https://docs.mosip.io/1.2.0/modules/id-authentication-services/id-authentication-internal-service-developer-guide)

## API

Refer [API Documentation](https://mosip.github.io/documentation/1.2.0/1.2.0.html).

## Source code

[Github repo](https://github.com/mosip/id-authentication/tree/release-1.2.0).
