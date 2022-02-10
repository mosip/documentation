# ID Authentication Services

## Overview
ID Authentication (IDA) module of MOSIP consists of following services:
1. Authentication
1. OTP
1. Internal Authentication

## Authentication 
Authentication service is used by Authentication/E-KYC Partners to
* authenticate an individual's UIN/VID using one ore more authentication types.
* request e-KYC for an individul's UIN/VID using one ore more authentication types.

![](_images/authentication-flow.png)

## OTP Request
OTP Request is used by Authentication/e-KYC Partners to generate OTP for an individual's UIN/VID. The generated OTP is stored in IDA DB for validation during OTP Authentication.

![](_images/otp-request-flow.png)

## Internal Authentication
* [ID-Authentication](id-authetication.md) uses credential data of the individuals for performing authentication. 
* This credential is requested by [ID-Repository](id-repository.md) upon any UIN insertion/update or VID creation. 
* The credential is created by Credential Service uploaded to [Datashare](datashare.md)) service and the Datashare URL sent to ID-Authentication using [WebSub](websub.md) message. 
* Websub invokes the credential-issuance callback in [ID-Authentication](id-authentication.md) where the credential data is downloaded from Datashare and then stored into IDA DB.

![](_images/ida-credential-flow.png)

## Key generation 
TBD.

## Authentication client demo app
This is a reference application to demonstrate how authentication and KYC can be performed by [Authentication Partners](partners.md#partner-types). 

Refer to the [repository](https://github.com/mosip/authentication-demo-ui/tree/1.2.0-rc2) for more details.

## Configuration
Refer to [ID Authentication Configuration Guide](https://github.com/mosip/id-authentication/blob/release-1.2.0/docs/configuration.md).

## API
Refer [API Documentation](https://mosip.github.io/documentation/1.2.0-rc2/1.2.0-rc2.html).

## Source code 
[Github repo](https://github.com/mosip/id-authentication/tree/1.2.0-rc2).








