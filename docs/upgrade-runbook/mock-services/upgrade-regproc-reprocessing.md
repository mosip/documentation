# Registration Processor: How to Reprocess from the beginning

This document provides instructions on manually reprocessing all packets from the beginning after migration. The 1.2.0.1 release introduces multiple new stages and a new tagging mechanism. All packets that have not been processed before migration will be reprocessed to ensure they go through the new stages.

To facilitate packet reprocessing, MOSIP provides a Python script. This approach involves fetching all RIDs from the database using a query and processing them from the beginning. Please consult the documentation for [instructions on setting up and running the reprocessing script](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/sandbox-v2/utils/reprocess). The query can be found in the [config.py](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/sandbox-v2/utils/reprocess/config.py) file.

Note: This script is highly customizable, and each country can modify it according to their specific requirements. This document outlines the general approach for reprocessing packets. If a country has special needs, the query will need to be adjusted accordingly.

The following command should be used to reprocess packets:

```
$ ./reprocess.py --db
```

It is important to first reprocess just one packet after migration to ensure that all stages are functioning correctly. This can be accomplished by setting the limit to 1. Please refer to the explanation below for instructions on changing the limit.

**APPROACH 1**

DEFAULT QUERY

```
query="SELECT reg_id, process, workflow_instance_id FROM registration WHERE latest_trn_status_code IN ('SUCCESS', 'REPROCESS', 'IN_PROGRESS') AND reg_process_retry_count <= 500 AND latest_trn_dtimes < (SELECT NOW() - INTERVAL '1 DAY') AND status_code NOT IN ('PROCESSED', 'FAILED', 'REJECTED') LIMIT 1000"
```

The default query reprocesses all packets that were not "PROCESSED" or "REJECTED" before migration. The query uses a limit of 1000 packets and a 1-second delay between each packet. This means that when the script is executed, it will reprocess 1000 packets one by one with a 1-second interval. These settings can be adjusted if necessary in the [config.py](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/sandbox-v2/utils/reprocess/config.py) file:

```
LIMIT 1000 # Can be changed as needed.
latest_trn_dtimes < (SELECT NOW() - INTERVAL '1 DAY') # Can be changed based on the time difference during migration.
delay = 1 # Seconds
```

This query also selects packets that are one day old (latest_trn_dtimes < (SELECT NOW() - INTERVAL '1 DAY')). This ensures that the script does not reprocess the same packets repeatedly. The time frame should be adjusted according to the system downtime caused by migration.

A country can determine the number of packets to be reprocessed in each batch and set the limit accordingly. The script should be executed the necessary number of times. For example, if there are 10000 pending packets and the limit is set to 1000, the script should be run 10 times.

**APPROACH 2**

This approach is designed for countries where packets are not directly routed from the securezone. In cases where the country has disabled routing from the securezone by setting the below property to false, the securezone notification stage should be disregarded. This is because any packets that have not moved beyond the securezone will be taken care of by the automated reprocessor.

Property: `securezone.routing.enabled=false`

This approach is similar to APPROACH 1 with one key difference. It utilizes the `latest_trn_type_code` in the query to specifically target packets that are stuck in these stages for reprocessing. It will disregard packets stuck in other stages.

**Note**: If any custom stage is introduced by the country, the `latest_trn_type_code` should be added to the query.

Query: 

```
query="select reg_id,process,workflow_instance_id from registration where latest_trn_status_code in ('SUCCESS', 'REPROCESS', 'IN_PROGRESS') and reg_process_retry_count<=500 and latest_trn_dtimes < (SELECT NOW() - INTERVAL '1 DAY') and status_code NOT IN ('PROCESSED', 'FAILED', 'REJECTED')
and latest_trn_type_code in ('UPLOAD_PACKET', 'VALIDATE_PACKET', 'QUALITY_CHECK', 'OSI_VALIDATE', 'BIOMETRIC_AUTHENTICATION', 'DEMOGRAPHIC_VERIFICATION', 'BIOGRAPHIC_VERIFICATION', 'MANUAL_VERIFICATION', 'UIN_GENERATOR') LIMIT 1000"
 
```
