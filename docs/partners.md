# Partners

## Overview
The MOSIP platform requires integration with several other systems.  Typically, a System Integrator (SI) would assemble all the pieces together to build a complete national ID solution.  All entities that participate in providing the external components are called MOSIP Partners. 

![](_images/mosip-ecosystem.jpg)

## Partner types

|Partner type|Description|Label\*|
|---|---|---|
|Authentication Partner| Entities that use MOSIP for authentication like banks, telecom, Govt. institutes etc.|`Auth_Partner`|
|Online Verification Partner|Authorised and entrusted partners who host MOSIP Authentication module to provide authentication service to various partners. Even MOSIPs IDA module an is an Online Verification Partner.|`Online_Verification_Partner`|
|Credential Partner|Provider of credentials like printed ID card, QR code etc. to residents|`Credential_Partner`|
|Device Partner| Provider of biometric devices that connect to registration client and authentication apps|`Device_Provider`|
|FTM Partner|Providers of L1 compatible Foundational Trust Module (FTM) integrated in biometric devices|`FTM_Provider`|
|Manual Adjudication Partner| Providers of Manual Adjudication Systems(MAS); enrollment data is shared with MAS|`Manual_Adjudication`|
|ABIS Partner|Provider of [ABIS](abis.md)|`ABIS_Partner`|
|MISP|MOSIP Infra Service Provider (MISP) provide network infrastructure/channel/pipe to various Authentication Partners to connect to the MOSIP system. Example, broadband service providers.|`MISP_Partner`| 

\* Label:  Reference in `partner_type` table of `mosip_pms` database.

## Partner onboarding
Partners need to be onboarded to MOSIP system to establish trust.  MOSIP [Partner Management Services](partner-management.md)(PMS) offers functionality to onboard partners.  The front end of PMS - the PMS portal may be used by partners to onboard themselves.  See [Partner Onboarding](partner-onboarding.md) for further details.

## MOSIP Partner Program
The MOSIP Partner Programme (MPP) was initiated to help stakeholders connect with MOSIP, and become part of an ecosystem invested in building foundational digital ID systems that are trustworthy, secure, efficient, and interoperable, while being customised to specific needs. 

Refer MPP document [here](https://www.mosip.io/uploads/resources/60914c1597184Program-partner-V7.pdf) for further details.

## PMS Module
MOSIP provides Partner Management Services (PMS) module.   

