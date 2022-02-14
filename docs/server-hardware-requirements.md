# Server Hardware Requirements

## Overview
MOSIP deployment is split into two distinct parts:
1. [ID lifecycle managament](id-lifecycle-management.md)
   * Pre-registration
   * Registration
2. [ID Authentication](id-authentication.md)

The server side hardware estimates for the above are specified at a high level in terms of **compute** (Virtual CPU, RAM) and **storage** requirements.  We provide estimates for [MOSIP core modules](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/v3/mosip) only. [External components](https://github.com/mosip/mosip-infra/tree/release-1.2.0/deployment/v3/external) are not in the scope. See [Exclusions](#exclusions).

The variables that largely determine the hardware requirements are:
1. Population of a country
1. Rate of enrollment
1. Usage of foundation ID by various services

## Pre-registration
Refer to [Pre-registration Resource Calculator XLS](_files/pre-reg-resource-calculator.xls)

Allow for 20% additional compute and storage for monitoring and any overheads.

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

|Resource|Per node|Nodes|Total|
|---|---:|---:|---:|
|VCPU|8|21|**168**|
|RAM (GB)|64|21|**1344**|
|Node disk (GB)|64|21|**1344**|

### Storage requirements
Storage is dependent on population of a country (i.e. the number of UINs to be issued).  Storage requirements for various types of data are listed below.

|Data| Storage|Comments|
|---|:---:|---|
|[Object Store](storage.md#object-store) (S3/Minio)|3200 GB/million packets/replication|Replication factor to be applied based on replication strategy|
|Postgres storage|30 GB/million packets|Includes all databases|
|[Landing zone](https://github.com/mosip/registration/blob/release-1.2.0/registration-processor/init/registration-processor-packet-receiver-stage/README.md#landing-zone)|Unprocessed packets X avg packet size|The size of landing zone depends on the estimated lag in packet processing and packet uploads. Once UINs are issued, the packets may be removed from the landing zone as a copy is already saved in Object Store| 
|Logs (Elasticsearch)| 80 GB/day|Logs maybe archived after, say, 2 weeks|
|Monitoring (Prometheus)|1.2 GB/day||
|Kafka|TBD||
|ActiveMQ|TBD||

## ID authentication
Refer to [IDA Resource Calculator XLS](_files/ida-resource-calculator.xlsx)

Allow for 20% additional compute and storage for monitoring and any overheads.

## Exclusions
The compute and storage estimates for following components are not included:

|Component|Comments|
|---|---|
|Postgres| Only storage estimated above.|
|Object store| Only storage estimated above. |
|Bio SDK||
|[HSM](hsm.md)||
|[ABIS](abis.md)||
|Antvirus (AV)|Default scanner (ClamAV) in included, however, if you integrate your AV, the same needs to be estimated.|
|Load balancers||
|External IAM (for Rancher)||
|Disaster recovery(DR)||

{% hint style="warning" %}DR would significantly increase compute and storage requirements. It is expected that System Integrator works out the appropriate DR strategy and arrives at an estimate. {% endhint %}



