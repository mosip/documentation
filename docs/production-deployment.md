# Production Deployment

## Overview
While System Integrators (SI) have a choice of implementing their own deployment tools, MOSIP provides reference implementation of Kubernetes based prouction grade deployment called [V3](https://github.com/mosip/mosip-infra/tree/develop/deployment/v3)_(currently offered as Beta)_. 

There are two distinct parts to the installation:
1. [Kubernetes infra](https://github.com/mosip/k8s-infra)
1. [MOSIP components](https://github.com/mosip/mosip-infra/tree/develop/deployment/v3)

You may also install sandboxes using the same infrastructure (recommended).

## Production hardening 
Below is a 'laundry list' of various checks that you must perform before actual roll out of a deployment. This list is *not* exhaustive and it is expected SIs use this list as reference and augment their out their own hardning procedures.

## System deployment checklist 

1. Change log level to INFO in application properties.
1. Enable persistence in all modules. On cloud change the storage class from 'Delete' to 'Retain'.  If you already have PV as 'Delete', you can edit the PV config and change it to 'Retain' (without having to change storage class)
1. Make sure storage class allows expansion of storage.
1. Review size of persistent volumes and update.
1. Increase the number of nodes in the cluster according to expected load.  
1. Set up backup for Longhorn.
1. Disable registration processor External Stage if not required.
1. Set rate control (throttling) parameters for PreReg.
1. Reprocessor cronjob frequency and other settings
1. All cronjobs timings according to the country (check property files)
1. Valid urls redirect in Keycloak - set specific urls.
1. Keycloak Realm connection timeout settings - review all.
1. Postgres [production configuration](../profiles/production/postgres/values.yaml)
1. Disable '111111' default OTP.
1. Review idschema attribute names again name is Datashare policy and Auth policy for any partner (including IDA).
1. Review attributes specified in `ida-zero-knowledge-unencrypted-credential-attributes`
1. Review 1id-authentication-mapping.json` in config vis-a-vis attribute names in idschema
1. Scripts to clean up processed packets in landing zone.
1. On-prem K8s cluster production configuration as given [here](rke_cluster_hardening.md).
1. Increase `replicaCount` for Clamav.
1. Kafka: disable option to delte a topic: [`deleteTopicEnable: false`](../external/kafka/values.yaml)
1. Archival of logs: Since logs data grows at a rapid pace, the data needs to be achived frequently. Set up an archival process.
1. Multifactor authentication for both Rancher and Keycloak.

1. Security:
  1. Review all Wireguard keys. Are all keys accounted for? Do the machines with Wireguard keys have sufficient protection - like firewalls, password/biometric login etc.
  1. Are correct cluster roles assigned to users in Rancher? Is [RBAC](https://github.com/mosip/k8s-infra/blob/main/rancher/README.md#rbac) set properly? 
  1. Do the users of Rancher have strong passwords only known to them?
  1. Is Rancher and Keycloak accessible only on Wireguard and not on public net? 
  1. Who holds the Keycloak Admin credentials? Are the credentials secure?


