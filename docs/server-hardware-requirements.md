# Server Hardware Requirements

## Overview
MOSIP deployment is split into two distinct parts:
1. [ID lifecycle managament](id-lifecycle-management.md)
   * Pre-registration
   * Registration
2. [ID Authentication](id-authentication.md)

The requirements are specified at a high level in terms of **compute** (Virtual CPU, RAM) and **storage**.

We provide server side hardware estimates for [MOSIP core modules](https://github.com/mosip/mosip-infra/tree/1.2.0-rc2/deployment/v3/mosip) only. Estimates for [external components](https://github.com/mosip/mosip-infra/tree/1.2.0-rc2/deployment/v3/external) are not in the scope. See [Exclusions](#exclusions).

The variables that largely determine the hardware requirements are:
1. Population of a country
1. Rate of enrollment
1. Usage of foundation ID by various services

## Pre-registration

## Registration (enrollment)
The registration compute resources are related to the max rate of enrollment desired. The processing throughput must match the enrollment rate to avoid pile up of pending registration packets. 

The data here is based on actual field data of a MOSIP deployment.  

Assumptions:
* Rate of enrollment: 216000 per day
* Average packet size: 2MB
* Biometric modalities: Finger, iris, face
* Pod replication as given [here]()

### Compute requirements
* Configuration of compute node: 8 VCPU, 64GB RAM, 64GB disk store.
* Number of nodes: 21 

|Resource|Per node|Number of nodes|Total|
|---|---|---|---|
|VCPU|8|21|168|
|RAM|64 GB|21|1344 GB|
|Node disk|64 GB|21|1344 GB|

### Storage requirements
Storage is dependent on population of a country (i.e. the number of UINs to be issued).  Storage requirements for various types of data are listed below.

|Data| Storage|
|---|---|
|[Object Store](storage.md#object-store) (S3/Minio)|3200 GB/million packets/replication|
|Postgres storage|30 GB/million packets|
|[Landing zone](https://github.com/mosip/registration/blob/1.2.0-rc2/registration-processor/init/registration-processor-packet-receiver-stage/README.md#landing-zone)|Unprocessed packets X avg packet size\*| 
|Logs (Elasticsearch)| 80 GB/day|
|Monitoring (Prometheus)|1.2 GB/day|
|Kafka|TBD|
|ActiveMQ|TBD|

\* Once UINs are issued, the packets may be removed from the landing zone as a copy is already saved in Object Store.  Therefore, the size of landing zone depends on the estimated lag in packet processing and packet uploads. 

## ID authentication


## Exclusions
The compute and storage estimate for following components are not included:

|Component|Comments|
|---|---|
|Postgres| Only storage estimated above.|
|Object store| Only storage estimated above. |
|Bio SDK||
|HSM||
|[ABIS](abis.md)||
|Antvirus (AV)|Default scanner (ClamAV) in included, however, if you integrate your AV, the same needs to be estimated.|
|Load balancers||
|External IAM (for Rancher)||
|Disaster recovery(DR)||

{% hint style="warning" %}DR would significantly increase compute and storage requirements. It is expected that System Integrator works out the appropriate DR strategy and arrives at an estimate. {% endhint %}



