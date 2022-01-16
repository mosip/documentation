# Server Hardware Requirements

## Overview
MOSIP deployment is split into two distinct parts:
1. [ID lifecycle managament](id-lifecycle-management.md)
   * Pre-registration
   * Registration
2. [ID Authentication](id-authentication.md)

The requirements are specified at a high level in terms of **compute** (Virtual CPU, RAM) and **storage**.

We provide server side hardware estimates for [MOSIP core modules](https://github.com/mosip/mosip-infra/tree/1.2.0-rc2/deployment/v3/mosip) only. Estimates for [external components](https://github.com/mosip/mosip-infra/tree/1.2.0-rc2/deployment/v3/external) are not in the scope. 
The variables that largely determine the hardware requirements are:
1. Population of a country
1. Rate of enrollment
1. Usage of foundation ID by various services

## Pre-registration

## Registration (enrollment)
The registration compute resource are dependent on the max rate of enrollment desired. The processing throughput must match the enrollment rate to avoid pile up of pending registration packets. 

The data here is based on actual field data of a MOSIP deployment.  

* Rate of enrollment: 216000 per day
* Average packet size: 2MB
* Biometric modalities: Finger, iris, face
* Pod replication as given [here]()

### Compute requirements
* Configuration of compute node: 8 VCPU, 64GB RAM, 64GB disk store.
* Number of nodes: 21 

|Resource|Per node|Total|
|---|---|---|
|VCPU|8|168|
|RAM|64 GB|1344 GB|
|Node disk|64 GB|1344 GB|

### Storage requirements
Storage is dependent on population of a country (i.e. the number of UINs to be issued).  Storage requirements for various types of data are listed below.

|Data| Storage|
|---|---|
|Object Store (S3/Minio)|3.2 MB/packet/replication|
|Postgres storage|30 GB/million packets|
|[Landing zone](https://github.com/mosip/registration/blob/1.2.0-rc2/registration-processor/init/registration-processor-packet-receiver-stage/README.md#landing-zone)|Unprocessed packets * avg packet size\*| 
|Logs (Elasticsearch)| 80 GB/day|
|Monitoring (Prometheus)|1.2 GB/day|

\* Once UINs are issued, the packets may be removed from the landing zone as a copy is already saved in Object Store.  Therefore, the size of landing zone depends on the estimated lag in packet processing and packet uploads. 

## ID authentication



