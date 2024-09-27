**Release Name**: MTS 1.0

**Release Version**: Version 1.0.0

**Upgrade From**: NA

**Release Date**: 6th October, 2022

## Overview

The 1.0.0 version of MTS covers basic features of [MOSIP Token Seeder](https://docs.mosip.io/1.2.0/integrations/mosip-token-seeder) as listed below.
This version is tested for functionality. Non-functional requirements (Performance, scale etc.) will be taken up in subsequent releases.

## Features covered

Authentication and token issuance using MOSIP Token Seeder with input/output formats and specifications as stated below:
* Input type: CSV, JSON, ODK
* Output type: CSV, JSON
* Delivery type: Download
* Asynchronous token seeding
* Status API
* Download API
* Authfield Mapping
* Dockerization
* Helm chart
* Processes 5k entries in one request

## Compatibility

MTS 1.0.0 is compatible with following versions of MOSIP IDA:
* MOSIP v1.1.5.x
* MOSIP v1.2.0.x

## Repositories released

1. [MTS repository](https://github.com/mosip/mosip-token-seeder/tree/release-1.0.0)
2. Test repositories
    * [Functional tests](https://github.com/mosip/test-management/tree/master/integration/MTS) 
    
## Documentation

* For a basic overview, refer [architecture and high level design](https://docs.mosip.io/1.2.0/integrations/mosip-token-seeder)
* Functional **user stories**:
  * Authentication and token issuance using MTS with input/output formats as stated below:
    * <Input: JSON/CSV format> and <Output: JSON/CSV format> - [#MOSIP-23029](https://mosip.atlassian.net/browse/MOSIP-23029)
    * <Input: ODK format> and <Output: JSON/CSV format> - [#MOSIP-23224](https://mosip.atlassian.net/browse/MOSIP-23224)
* For API documentation, click [here](https://mosip.stoplight.io/docs/mosip-token-seeder/branches/main/sksp54oilqzun-mosip-token-seeder)
* For installation, refer [README](https://github.com/mosip/openg2p/blob/develop/mosip_token_seeder/README.md)
* [Known issues](https://mosip.atlassian.net/issues/?filter=11025) 
