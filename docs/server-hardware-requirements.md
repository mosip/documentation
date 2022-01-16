# Server Hardware Requirements

## Overview
MOSIP deployment is split into two distinct parts:
1. [ID lifecycle managament](id-lifecycle-management.md)
   * Pre-registration
   * Registration
2. [ID Authentication](id-authentication.md)

We provide server side hardware estimates for [MOSIP core modules](https://github.com/mosip/mosip-infra/tree/1.2.0-rc2/deployment/v3/mosip) only. Estimates for [external components](https://github.com/mosip/mosip-infra/tree/1.2.0-rc2/deployment/v3/external) are not in the scope. The requirements are specified at a high level in terms of **compute** (Virtual CPU, RAM) and **storage**.

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
Configuration of compute node: 8 VCPU, 64GB RAM, 64GB disk store.
Number of nodes: 21 
|Resource|Per node|Total|
|---|---|---|
|VCPU|8|**168**|
|RAM|64GB|**1344GB**|
|Disk|64GB|**1344GB**|

### Storage requirements
Storage is dependent on population of a country (i.e. the number of UINs to be issued).  Storage requirements for various types of data are listed below.

|Data| Storage|
|---|---|
|Logs (Elasticsearch)| 80GB/day|
|Monitoring (Prometheus)|1.2 GB/day|
|Object Store (S3/Minio)|3.2MB/packet/replication|
|Postgres storage|30GB/million packets|

## ID authentication



