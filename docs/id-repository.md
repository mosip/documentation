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

Below is the entity relationship diagram illustrated for ID Repository.
![Pre-registration login page](_images/pre-reg-login.png)

*NOTE:* The numbers do not signify sequence of operations or control flow. Arrows indicate the data flow.

## Identity service
* Stores, updates, retrieves identity information and also to 
* Retrieves and updates [UIN](identifiers.md#uin) status.

Identity service uses Biometric SDK (server) to extract templates from provided biometric data.

Below is the entity relationship diagram illustrated for Identity service.
![Pre-registration login page](_images/pre-reg-login.png)

*NOTE:* The numbers do not signify sequence of operations or control flow. Arrows indicate the data flow.

1. Keymanager - Encrypts/decrypts data
2. Credential request generator - Issues credentials for new/updated UIN data
3. Object Store - Stores/retrieves biometrics and demographic documents
4. DB - All demographic data of UIN and references to biometric and demographic files stored in object store are stored in mosip_idrepo db.
5. Partner management - retrieves online verification partners to issue credentials.
6. Audit manager - Audit logs are logged into Auditmanager.
7. Biometric SDK - extracts template for input biometric data.
8. Auth Adapter - Integrates with KeyCloak for authentication
9. Masterdata - Retreives Identity schema based on input schema version
10. WebSub - Publishes events related to UIN updation and auth type status updates.
11. Kernel ID Generator - Generates UIN
12. VID Service – fetches the list of VIDs associated with UIN to issue credential of update UIN and to create and activate draft VID.

## VID service
VID Service provides functionality to create/update Virtual IDs mapped against an UIN. It also provides facility to update status of VID. VIDs are created based on the VID policy defined in the configuration.

Below is the entity relationship diagram illustrated for VID service.

![Pre-registration login page](_images/pre-reg-login.png)


*NOTE:* The numbers do not signify sequence of operations or control flow. Arrows indicate the data flow.

1. Keymanager - Encrypts/decrypts data
2. Credential request generator - Issues credentials for new/updated uin data.
3 DB - All VID related data is stored in mosip_idmap db.
4. Partner management - retrieves online verification partners to issue credentials.
5. Audit manager - Audit logs are logged into Auditmanager.
6. Auth Adapter - Integrates with KeyCloak for authentication.
7. WebSub - Publish events related to VID updation.
8. Kernel ID Generator - Generates VID.
9. Identity Service - Checks the status of UIN to create VID


## Credential service
### Credential types
Default supported credential types:
1. `auth`
1. `qrcode`
1. `euin`
1. `reprint`

Below is the entity relationship diagram illustrated for Credential service.

![Pre-registration login page](_images/pre-reg-login.png)

*NOTE:* The numbers do not signify sequence of operations or control flow. Arrows indicate the data flow.

1. Keymanager - Encrypts/decrypts data and also to sign data.
2. WebSub - Subscribes to get notifications related to credential status from IDA.
3. DataShare - creates datashare url for sharable attributes
4. Identity service - retrievez identity data for UIN/VID.
5. Partner management - retrieves policies related to credential type and also retrieves policy for bio-extraction.
6. Auth Adapter - Integrates with KeyCloak for authentication.

## Credential Request Generator
This service creates request for credential issuance.

Below is the entity relationship diagram illustrated for Credential Request Generator.

![Pre-registration login page](_images/pre-reg-login.png)

*NOTE:* The numbers do not signify sequence of operations or control flow. Arrows indicate the data flow.

Credential Request generator:
1. Keymanager - Encrypts/decrypts data
2. Auth Adapter - Integrates with KeyCloak for authentication.

## Salt generator 
This is a one-time job that populates salts that are used to hash and encrypt data for Identity and VID services. This job must be executed before deploying these services.  The following tables are populated:
* `uin_hash_salt` in `mosip_idrepo` DB.
* `uin_encrypt_salt` in `mosip_idmap` DB.

In MOSIP sandbox the job is run [here](https://github.com/mosip/mosip-infra/blob/1.2.0-rc2/deployment/v3/mosip/idrepo/install.sh).

## API
Refer [API Documentation](https://mosip.github.io/documentation/1.2.0-rc2/1.2.0-rc2.html).

## Source code 
[Github repo](https://github.com/mosip/id-repository/tree/1.2.0-rc2).

