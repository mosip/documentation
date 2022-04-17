# Configurations

## Overview

Properties that are shared across all modules are written in the file [`application-default.properties`](https://github.com/mosip/mosip-config/blob/release-1.2.0/application-default.properties).

Module-specific properties are written in respective `*.properties` files in [mosip-config](https://github.com/mosip/mosip-config/blob/release-1.2.0)

## Config server

Config server is a [Spring Cloud Config Server](https://cloud.spring.io/spring-cloud-config/multi/multi\_\_spring\_cloud\_config\_server.html) that serves the above properties to modules during run-time. The property files are downloaded when an application starts. The config server is installed as part of [sandbox installation](sandbox-deployment.md).

Some of the important properties that must be reviewed and modified for a specific deployment are listed below.

## Modules

Configurations of each MOSIP module will be available here:

* Administration
* Commons
* Datashare
* ID Authentication
* ID Repository
* Key Manager
* Packet Manager
* Partner Management
* Pre-registration
* [Registration Client](registration-client.md#configurations)
* [Registration Processor](registration-processor.md#configurations)
* Resident Services
* Resident Mobile Application
* WebSub

## Database
Refer to [Postgres DB configuration](postgres-db.md#configuration-parameters).

## HSM
Refer to [HSM configuration](hsm.md#configuration).

## Languages
**Mandatory Languages** - Languages that the user has to fill (can be auto translated) during the pre-registration & registration.

**Optional Languages** - Languages that are not mandatory but provided as a choice to the user. 

**User selected Language** - The language that the user selected at the time of login. The choices shown are union of Mandatory and Optional languages. The labels and alerts will be use the user selected language

**Prefered Language** - During registration of a registrant (user for whom identity is requested), he can choose his prefered language. This preference use used for all further notification (email, SMS or any other notification). 

Languages for the entire system are configured in application prorperties file:

```
mosip.mandatory-languages=eng,tam
mosip.optional-languages=fra,ara
```
> The i18n file for the respective language has to be added to the artifactory [Artifactory](https://github.com/mosip/artifactory-ref-impl). 
> The language codes are as per [ISO 639-2](https://www.loc.gov/standards/iso639-2/php/code_list.php)

