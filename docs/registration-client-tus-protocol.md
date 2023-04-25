# TELEMETRY FROM REGISTRATION CLIENT 
 
Following are the metrics that are collected in the client application using the micrometer library:

* JVM Memory Metrics
* JVM Thread Metrics
* JVM GC Metrics
* JVM Heap Pressure Metrics
* Processor Metrics
* Class Loader Metrics
* Disk Metrics
* Packet Metrics based on client and server status

All the metrics collected are appended to `metrics.log` file. Rolling policy of the `metrics.log` is defined in registration-services `logback.xml`.

Below are the challenges faced in exporting the collected metrics from client application to the server for further analysis:

1. Unreliable network conditions on field.
2. Metrics files are mostly large files, and cannot afford retries on failed attempts.
3. Required HTTP based metrics export.

To overcome the above challenges, Registration Client is built with `tus-java-client` (version: 0.4.3) . Tusd server URL and the upload chunk-size are made configurable in the client application.

`mosip.registration.tus.server.url`: This is the server URL config which specifies to which URL the metrics files are to be uploaded.

`mosip.registration.tus.server.upload.chunksize`: This config defines the chunk size, which means, how much size of the file is to be uploaded at once. By default, this is given as 1024, which means 1KB

**Note**: 

* The `Tus protocol` is designed to enable resumable uploads of large files over HTTP, which can be useful for web applications that need to handle file uploads in unreliable network conditions or with large files that might take a long time to upload. For more information on TUS, refer [here](https://tus.io/).
* `Tusd` is a popular implementation of the Tus protocol that can be used as a standalone server. It is a part of the MOSIP deployment.

Each metric json logged into `metrics.log` file is tagged with machine name. Refer the below log lines with the machine names.

```
{"@timestamp":"2023-03-12T15:00:10.654+05:30","@version":"1","message":"{\"@timestamp\":\"2023-03-12T09:30:10.654Z\",\"name\":\"jvm.threads.states\",\"type\":\"gauge\",\"machine\":\"c1ml54597\",\"state\":\"waiting\",\"value\":8,\"unit\":\"threads\"}","logger_name":"io.mosip.registration.config.LoggingJsonMeterRegistry","thread_name":"logging-metrics-publisher","level":"INFO","level_value":20000}


{"@timestamp":"2023-03-12T15:00:10.654+05:30","@version":"1","message":"{\"@timestamp\":\"2023-03-12T09:30:10.654Z\",\"name\":\"jvm.threads.states\",\"type\":\"gauge\",\"machine\":\c1ml54597\",\"state\":\"timed-waiting\",\"value\":20,\"unit\":\"threads\"}","logger_name":"io.mosip.registration.config.LoggingJsonMeterRegistry","thread_name":"logging-metrics-publisher","level":"INFO","level_value":20000}


{"@timestamp":"2023-03-12T15:00:10.654+05:30","@version":"1","message":"{\"@timestamp\":\"2023-03-12T09:30:10.654Z\",\"name\":\"jvm.threads.states\",\"type\":\"gauge\",\"machine\":\"c1ml54597\",\"state\":\"blocked\",\"value\":0,\"unit\":\"threads\"}","logger_name":"io.mosip.registration.config.LoggingJsonMeterRegistry","thread_name":"logging-metrics-publisher","level":"INFO","level_value":20000}


{"@timestamp":"2023-03-12T15:00:10.654+05:30","@version":"1","message":"{\"@timestamp\":\"2023-03-12T09:30:10.654Z\",\"name\":\"jvm.threads.states\",\"type\":\"gauge\",\"machine\":\"c1ml54597\",\"state\":\"terminated\",\"value\":0,\"unit\":\"threads\"}","logger_name":"io.mosip.registration.config.LoggingJsonMeterRegistry","thread_name":"logging-metrics-publisher","level":"INFO","level_value":20000}


{"@timestamp":"2023-03-12T15:00:10.654+05:30","@version":"1","message":"{\"@timestamp\":\"2023-03-12T09:30:10.654Z\",\"name\":\"jvm.threads.states\",\"type\":\"gauge\",\"machine\":\"c1ml54597\",\"state\":\"new\",\"value\":0,\"unit\":\"threads\"}","logger_name":"io.mosip.registration.config.LoggingJsonMeterRegistry","thread_name":"logging-metrics-publisher","level":"INFO","level_value":20000}
```

* A job is scheduled to upload collected metrics to server from the client application. 
* Job runs with a fixed delay of 15 minutes. 
* Resumable file URLs are stored under `.metrics` folder of registration client. Once the complete file is uploaded to server, the metrics file is deleted locally.
