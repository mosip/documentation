# ID Repository

## Overview
ID Repository contains the record of identity of an individual, and provides API based mechanism to store, retrieve and update identity details by other MOSIP modules. ID Repository is used by [Registration Processor](registration-processor.md), [ID Authentication](id-authentication-services.md) and [Resident Services](resdient-services.md)

## Services
ID Repository mdoule consists of following services:
1. Identity 
1. VID 
1. Credential
1. Credential Request Generator

## Salt generator 
This is a one-time job that populates salts that are used to hash and encrypt data for Identity and VID services. This job must be executed before deploying these services.  The following tables are populated:
* `uin_hash_salt` in `mosip_idrepo` DB.
* `uin_encrypt_salt` in `mosip_idmap` DB.
In MOSIP sandbox the job is run [here](https://github.com/mosip/mosip-infra/blob/1.2.0-rc2/deployment/v3/mosip/idrepo/install.sh).
