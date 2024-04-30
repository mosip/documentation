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
