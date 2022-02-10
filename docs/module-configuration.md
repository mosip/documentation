# Module Configuration

## Overview
Properties that are shared across all modules are written in file [`application-default.properties`](https://github.com/mosip/mosip-config/blob/release-1.2.0/application-default.properties). 

Module specific properties are written in respective `*.properties` files in [mosip-config](https://github.com/mosip/mosip-config/blob/release-1.2.0)

## Config server
Config server is a [Spring Cloud Config Server](https://cloud.spring.io/spring-cloud-config/multi/multi__spring_cloud_config_server.html) that serves above properties to modules during run-time. The property files are downloaded when an application starts. The config server is installed as part of [sandbox installation](sandbox-deployment.md).

---
Some of the important properties that must be reviewed and modified for a specific deployment are listed below.
## Database 

## HSM
Refer [HSM configuration](hsm.md#configuration).
 
## Languages
Langauges for the entire system are configured here:
```
mosip.mandatory-languages=eng
## Leave blank if no optional langauges
mosip.optional-languages=fra
```



