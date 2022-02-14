# Partner Policies

## Overview
Partner policies control the data that needs to be shared with a partner. The policies reside in [`auth_policy` table](https://github.com/mosip/partner-management-services/blob/release-1.2.0/db_scripts/mosip_pms/ddl/pms-auth_policy.sql) of `mosip_pms` DB. 

### Policy types
|Policy type|Partners|Description|
|---|---|---|
|Auth policy|AP|Specifies [authentication types](id-authentication.md#authentication-types) and [KYC](id-authentication.md#kyc-authentication) fields to be shared during authentication.|
|Datashare policy|Online Verification Partner, Credential Partner, Manual Adjudiation, ABIS partner|Specifies data to be shared with partners|

Policies are not applicable for Device Provider, FTM Provider and MISP Partner as data is shared is not with them.

Refer to the [default policies](https://github.com/mosip/partner-management-services/blob/release-1.2.0/db_scripts/mosip_pms/dml/pms-auth_policy.csv) loaded while installing MOSIP.

## Policy group
Common policies are grouped example 'Telecom', 'Banking', 'Insurance' etc. 










