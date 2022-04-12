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

Refer to [Postgres DB configuration](postgres-db.md#configurations).

## HSM

Refer to [HSM configuration](hsm.md#configuration).

## Languages

Languages for the entire system are configured here:

```
mosip.mandatory-languages=eng
mosip.optional-languages=fra
```
