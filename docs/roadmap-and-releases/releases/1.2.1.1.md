# 1.2.1.1

**Release Version:** v1.2.1.1

**Release Type:** Major Release

**Release Date:** <mark style="color:red;">**Coming Soon**</mark>!

### Overview

This major release delivers performance, stability, and resource optimization enhancements to the Registration Processor ecosystem, with a focus on improving packet processing efficiency, optimizing resource utilization, and reducing processing overhead across the pipeline.

Building on the improvements introduced and validated during the Release Candidate phase, this release includes code-level optimizations, infrastructure improvements, and processing-stage enhancements aimed at improving scalability, operational stability, and overall processing efficiency under higher workloads.

### Major Areas of Work

**JVM & Resource Optimization**

* Improved JVM memory and garbage collection tuning to reduce processing delays and improve pod stability under high-throughput scenarios.
* Enhanced Kubernetes resource calibration to ensure better memory utilization and stable workload execution.
* Fine-tuned worker pool and concurrency configurations to improve resource utilization across processing stages.

**Packet Processing Performance Improvements**

* Optimized packet validation and classification stages by reducing duplicate service calls and enabling parallel execution of independent operations.
* Improved processing efficiency for biometric validation, document validation, and metadata retrieval.
* Reduced redundant Packet Manager and database calls across multiple processing stages to minimize processing overhead and latency.
* Introduced code-level optimizations across the packet processing pipeline to improve overall processing efficiency.

**Database & Reprocessing Optimization**

* Enhanced database performance for packet reprocessing through indexing improvements, reducing query execution time and improving retry handling efficiency.
* Optimized database interactions involved in reprocessing workflows to reduce unnecessary processing overhead.

**Workflow & ABIS Throughput Improvements**

* Improved ABIS middleware processing by offloading heavy response handling to worker threads.
* Optimized workflow internal actions through parallel execution of independent service operations.
* Improved concurrency management across processing stages for more efficient workload execution.

**Operational Stability Improvements**

* Introduced asynchronous logging and worker pool fine-tuning capabilities to reduce processing overhead.
* Improved worker pool handling to enable better concurrency management across processing stages.
* Implemented multiple code-level refinements to improve reliability, resilience, and stability during large-scale packet processing.

### Stories Released

| Feature                        | Description                                                                                                                   | Issue                                                         |
| ------------------------------ | ----------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| System Performance Enhancement | Performance optimization and code-level enhancements to improve Registration Processor processing efficiency and scalability. | [GIT-2384](https://github.com/mosip/registration/issues/2384) |

### Bugs Fixed

| Bug                                       | Description                                                                                                                                                                                    | Issue                                                         |
| ----------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------- |
| Regproc Group 2 and Group 5 Startup Delay | Registration Processor (Regproc) Group 2 and Group 5 have a longer startup time compared to other groups and may take additional time to become fully operational after deployment or restart. | [GIT-2382](https://github.com/mosip/registration/issues/2382) |

### Repositories Released

| Repository          | Tag                                                                 |
| ------------------- | ------------------------------------------------------------------- |
| mosip-config        | [v1.3.1](https://github.com/mosip/mosip-config/tree/v1.3.1)         |
| mosip-data          | [v1.3.2](https://github.com/mosip/mosip-data/tree/v1.3.2)           |
| commons             | [v1.3.1](https://github.com/mosip/commons/tree/v1.3.1)              |
| khazana             | [v1.3.2](https://github.com/mosip/khazana/tree/v1.3.2)              |
| key-manager         | [v1.4.1](https://github.com/mosip/keymanager/tree/v1.4.1)           |
| registration        | [v1.3.1](https://github.com/mosip/registration/tree/v1.3.1)         |
| mosip-ref-impl      | [v1.3.1](https://github.com/mosip/mosip-ref-impl/tree/v1.3.1)       |
| id-repository       | [v1.3.1](https://github.com/mosip/id-repository/tree/v1.3.1)        |
| id-authentication   | [v1.3.1](https://github.com/mosip/id-authentication/tree/v1.3.1)    |
| mosip-mock-services | [v1.3.1](https://github.com/mosip/mosip-mock-services/tree/v1.3.1)  |
| packet-manager      | [v1.3.1](https://github.com/mosip/packet-manager/tree/v1.3.1)       |
| durian              | [v1.3.1](https://github.com/mosip/durian/tree/v1.3.1)               |
| audit-manager       | [v1.3.2](https://github.com/mosip/audit-manager/tree/v1.3.2)        |
| biosdk-services     | [v1.3.1](https://github.com/mosip/biosdk-services/tree/v1.3.1)      |
| websub              | [v1.3.2](https://github.com/mosip/websub/tree/v1.3.2)               |
| artifactory         | [v1.3.2](https://github.com/mosip/artifactory-ref-impl/tree/v1.3.2) |
| infra               | [v0.3.0](https://github.com/mosip/infra/tree/0.3.0)                 |
| k8s-infra           | [v1.2.1.3](https://github.com/mosip/k8s-infra/tree/v1.2.1.3)        |
| mosip-infra         | [v1.2.1.1](https://github.com/mosip/mosip-infra/tree/v1.2.1.1)      |

### Known Issues

Below are the key bugs marked as known issues for this release. Please refer to the complete list of known issues for this release in the MOSIP issue tracker.

| Issue      | Description                                                                                                            |
| ---------- | ---------------------------------------------------------------------------------------------------------------------- |
| MOSIP-1827 | Composite repo environment variables are hardcoded in deployment instead of being configured through ConfigMap/Secret. |
| MOSIP-1951 | Hardcoding in DSL for checking configuration parameters using actuator/environment values.                             |

### Compatible Modules

|                             |                    |
| --------------------------- | ------------------ |
| Module/Repo                 | Compatible Version |
| partner-management-services | v1.2.2.3           |
| resident-ui                 | v0.9.0             |
| eSignet                     | v1.4.1             |
| registration-client         | v1.2.0.2           |
| mosip-automation-test       | v1.4.0             |

### Dependency Matrix

| Component                                           | Version                | Helm Chart Version (if applicable) |
| --------------------------------------------------- | ---------------------- | ---------------------------------- |
| Keycloak                                            | v7.1.18                |                                    |
| Kafka                                               | 3.2.1                  | 3.8.0                              |
| Kafka-Zookeeper                                     | 3.8.0                  | 18.3.1                             |
| Mock-SMTP                                           | 1.0.0                  | 1.0.0                              |
| ActiveMQ                                            | 2.39.0                 | 0.0.3                              |
| MinIO                                               | 2025.2.28-debian-12-r1 | 15.0.6                             |
| Redis (used only if eSignet exists)                 | v7.0.5                 | 17.3.14                            |
| Postgres                                            | v16                    | 13.1.5                             |
| SoftHSM (recommended only for sandbox environments) | v2                     | 12.0.1                             |
| ClamAV                                              | v1.2                   | 3.1.0                              |

### Documentation

* [QA Report](https://docs.mosip.io/1.2.0/roadmap-and-releases/releases/v1.2.1.1-rc.1/test-report)
