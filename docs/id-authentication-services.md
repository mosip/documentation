# ID Authentication Services

## Overview
ID Authentication (IDA) module of MOSIP consists of following services:
1. [Authentication](https://github.com/mosip/id-authentication/tree/release-1.2.0/authentication/authentication-service)
1. [OTP](https://github.com/mosip/id-authentication/tree/release-1.2.0/authentication/authentication-otp-service)
1. [Internal Authentication](https://github.com/mosip/id-authentication/tree/release-1.2.0/authentication/authentication-internal-service)

## Authentication flow

Authentication service is used by Authentication/E-KYC Partners to,
* authenticate an individual's UIN/VID using one ore more authentication types.
* request e-KYC for an individul's UIN/VID using one ore more authentication types.

![](_images/authentication-flow.png)

## OTP Request flow

OTP Request is used by Authentication/e-KYC Partners to generate OTP for an individual's UIN/VID. The generated OTP is stored in IDA DB for validation during OTP Authentication.

![](_images/otp-request-flow.png)

## Key generation 
TBD.

## Authentication client demo app
This is a reference application to demonstrate how authentication and KYC can be performed by [Authentication Partners](partners.md#partner-types). 

Refer to the [repository](https://github.com/mosip/mosip-ref-impl/tree/1.2.0-rc2/authentication-demo-ui) for more details.

## Configuration
Refer to [ID Authentication Configuration Guide](https://github.com/mosip/id-authentication/blob/release-1.2.0/docs/configuration.md).

## API
Refer [API Documentation](https://mosip.github.io/documentation/1.2.0-rc2/1.2.0-rc2.html).

## Source code 
[Github repo](https://github.com/mosip/id-authentication/tree/1.2.0-rc2).








