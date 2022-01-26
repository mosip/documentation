# Partners

## Overview
The MOSIP platform requires integration with several other systems.  Typically, a System Integrator (SI) would assemble all the pieces together to build a complete national ID solution.  All entities that participate in providing the external components are called MOSIP Partners. 

![](_images/mosip-ecosystem.jpg)

## Partner types
|Partner type|Description|Label\*|
|---|---|---|
|Authentication Partner| Entities that use MOSIP for authentication like banks, telecom, Govt. institutes etc.|`Auth_Partner`|
|Online Verification Partner|Authorised and entrusted partners who host [IDA](id-authentication.md) module to provide authentication service to various partners. Even MOSIPs IDA module an is an Online Verification Partner.|`Online_Verification_Partner`|
|Credential Partner|Provider of credentials like printed ID card, QR code etc. to residents|`Credential_Partner`|
|Device Partner| Provider of biometric devices that connect to registration client and authentication apps|`Device_Provider`|
|FTM Partner|Providers of [L1](biometric-devices.md#l1) compatible Foundational Trust Module (FTM) integrated in biometric devices|`FTM_Provider`|
|Manual Adjudication Partner| Providers of Manual Adjudication Systems(MAS); enrollment data is shared with MAS|`Manual_Adjudication`|
|ABIS Partner|Provider of [ABIS](abis.md)|`ABIS_Partner`|
|MISP|MOSIP Infra Service Provider (MISP) provide network infrastructure/channel/pipe to various Authentication Partners to connect to the MOSIP system. Example, broadband service providers.|`MISP_Partner`| 

\* Label:  Reference in `partner_type` table of `mosip_pms` database.

## Partner policies
Partner policies control the data needs to be shared with a partner. The policies reside in [`auth_policy` table](https://github.com/mosip/partner-management-services/blob/1.2.0-rc2/db_scripts/mosip_pms/ddl/pms-auth_policy.sql) of `mosip_pms` DB. 

### Policy types
|Policy type|Partners|Description|
|---|---|---|
|Auth policy|AP|specifies [authentication types](id-authentication.md#authentication-types)and [KYC](id-authentication.md#kyc) fields to be shared during authentication.|
|Datashare policy|all partners except AP|specifies data to be shared with partners|

Refer to the [default policies](https://github.com/mosip/partner-management-services/blob/1.2.0-rc2/db_scripts/mosip_pms/dml/pms-auth_policy.csv) loaded while installing MOSIP.

## Partner onboarding
Onboarding of a partner refers to registering a partner in a particular deployment of MOSIP.  Partners need to be onboarded to establish trust.  The onboarding process consists of loading partner details in database, exchanging certificates etc, detailed in the later sections.  Such onboarding is required to be done on any fresh MOSIP installation.  For instance, if you install a sandbox, you would need to follow the onboarding process for each partner.

The sections below describe onboarding process for each type of partner.

### MISP 
1. MISP should have a trusted X.509 certificate with chain of CA certificates.
1. MISP self-registers on PMS portal providing partner id, name, organisation name (same as in certificate), partner type (`MISP_type`) (_This functionality will be available on the portal in 1.2.x version of MOSIP_)
1. MISP uploades all certificates.
1. MOSIP Admin generates MISP license key and provides to MISP.

### Authentication Partner (AP)
1. Policy for the AP must be pre-defined (see [Partner policies](#partner-policies)). 
1. AP should have a trusted X.509 certificate with chain of CA certificates.
1. AP registers with MISP and obtains MISP license key (this steup is outside of MOSIP system).
1. The MISP used by AP should have been already onboarded on to MOSIP.
1. AP self-registers on PMS portal providing partner id, name, organisation name (same as in certificate), partner type (`Auth_Partner`) etc.
1. AP uploades all certificates.
1. AP selects the policy group and policy. This request is sent to MOSIP Admin for approval. 
1. On approval, AP generates API key that can be used along with MISP license key to interact with IDA system. 

### Device Partner (DP)
1. DP should have a trusted X.509 certificate with chain of CA certificates.
1. DP self-registers on PMS portal providing partner id, name, organisation name (same as in certificate), partner type (`Device_Provider`) etc.
1. DP uploades all certificates.
1. Any approval from MOSIP? (TODO) 

### FTM Partner (FTMP)
1. FTMP should have a trusted X.509 certificate with chain of CA certificates.
1. FTMP self-registers on PMS portal providing partner id, name, organisation name (same as in certificate), partner type (`FTM_Provider`) etc.
1. FTMP uploades all certificates.
1. TODO

### Credential Partner (CP)
1. Datashare policy must be pre-defined (see [Partner policies](#partner-policies)). 
1. CP should have a trusted X.509 certificate with chain of CA certificates.
1. CP self-registers on PMS portal providing partner id, name, organisation name (same as in certificate), partner type (`Credential_Partner`) etc.
1. CP uploades all certificates.
1. CP selects the policy group and policy. 
1. CP maps policy to one of the supported [credential types](https://github.com/mosip/id-repository/tree/1.2.0-rc2/id-repository/credential-service).
1. CP adds biometric extractors for the policy.

### Online Verification Partner (OVP)
1. Datashare policy must be pre-defined (see [Partner policies](#partner-policies)). 
1. OVP should have a trusted X.509 certificate with chain of CA certificates.
1. OVP self-registers on PMS portal providing partner id, name, organisation name (same as in certificate), partner type (`Credential_Partner`) etc. _(Using APIs, as OVP support on PMS Portal is available in later version of MOSIP.)_
1. OVP uploades all certificates.
1. OVP selects the policy group and policy. 
1. OVP maps policy to `auth` [credential type](https://github.com/mosip/id-repository/tree/1.2.0-rc2/id-repository/credential-service).
1. OVP adds biometric extractors for the policy.

## MOSIP Partner Program
The MOSIP Partner Programme (MPP) was initiated to help stakeholders connect with MOSIP, and become part of an ecosystem invested in building foundational digital ID systems that are trustworthy, secure, efficient, and interoperable, while being customised to specific needs. 

Refer MPP document [here](https://www.mosip.io/uploads/resources/60914c1597184Program-partner-V7.pdf) for further details.

## PMS module
Refer [Partner Management Services](partner-management-services.md).

