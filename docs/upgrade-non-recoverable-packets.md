# Registration Processor: Processing non-recoverable packets from the start

After running the reprocess utility and regproc reprocessor, it is possible that a few packets may end up in the FAILED status. This can occur due to various reasons such as environment instability or high parallel processing of packets. The following steps will help in identifying if such packets exist and how to handle them.

To handle these packets, please follow the below steps:

1. Use the sample query below to find out if there are packets in a non-recoverable state:

```
SELECT * FROM registration WHERE status_code='FAILED' AND latest_trn_Dtimes > '2023-10-10 10:00:00.000000' AND cr_Dtimes < '2023-08-25 00:00:00.000000';
```

Here, `cr_Dtimes` should be less than the time of upgrade completion and the processing of the first packet. `latest_trn_Dtimes` should be greater than the time of upgrade completion and the processing of the first packet. If there are no packets in this status, no further action is required. If any packets are found with the above status, proceed to step 2.

2. Before running the reprocess utility to process the packet from the beginning [as per the APPROACH 1 in document](upgrade-regproc-reprocessing.md), update the DEFAULT QUERY in the [config.py](https://github.com/mosip/mosip-infra/blob/1.2.0.1/deployment/sandbox-v2/utils/reprocess/config.py) file as per the requirements to process non-recoverable records.

The sample query is as follows:

```
SELECT reg_id, process, workflow_instance_id, iteration FROM registration WHERE status_code='FAILED' AND latest_trn_Dtimes > '2023-10-10 10:00:00.000000' AND cr_Dtimes < '2023-08-25 00:00:00.000000' LIMIT 1000;
```

Here, the status code should be set to FAILED. `cr_Dtimes` should be less than the time of upgrade completion and the processing of the first packet. `latest_trn_Dtimes` should be greater than the time of upgrade completion and the processing of the first packet.

After changing the query in [config.py](https://github.com/mosip/mosip-infra/blob/release-1.2.0.1/deployment/sandbox-v2/utils/reprocess/config.py), please refer to the documentation on [how to set up and run the reprocessor script](https://github.com/mosip/mosip-infra/tree/release-1.2.0.1/deployment/sandbox-v2/utils/reprocess).

To reprocess packets, use the following command:

```
$ ./reprocess.py --db
```

