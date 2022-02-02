# ID Repository

## Overview
ID Repository contains the record of identity of an individual, and provides API based mechanism to store, retrieve and update identity details by other MOSIP modules. ID Repository is used by [Registration Processor](registration-processor.md), [ID Authentication](id-authentication-services.md) and [Resident Services](resdient-services.md)

## Services
ID Repository mdoule consists of following components:
1. Identity service
1. VID service 
1. Credential service
1. Credential Request Generator
1. Salt generator 

## Identity service
* Stores, updates, retrieves identity information and also to 
* Retrieves and updates [UIN](identifiers.md#uin) status.

Identity service uses Biometric SDK (server) to extract templates from provided biometric data.

## VID service
VID Service provides functionality to create/update Virtual IDs mapped against an UIN. It also provides facility to update status of VID. VIDs are created based on the VID policy defined in the configuration.

## Credential service
### Credential types
Default supported credential types:
1. `auth`
1. `qrcode`
1. `euin`
1. `reprint`

## Credential Request Generator
This service creates request for credential issuance.

## Salt generator 
This is a one-time job that populates salts that are used to hash and encrypt data for Identity and VID services. This job must be executed before deploying these services.  The following tables are populated:
* `uin_hash_salt` in `mosip_idrepo` DB.
* `uin_encrypt_salt` in `mosip_idmap` DB.

In MOSIP sandbox the job is run [here](https://github.com/mosip/mosip-infra/blob/1.2.0-rc2/deployment/v3/mosip/idrepo/install.sh).

## API
Refer [API Documentation](https://mosip.github.io/documentation/1.2.0-rc2/1.2.0-rc2.html).

## Source code 
[Github repo](https://github.com/mosip/id-repository/tree/1.2.0-rc2)

