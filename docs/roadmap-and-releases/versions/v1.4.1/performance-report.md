---
hidden: true
---

# Performance Report

## Overview

The eSignet Performance Report provides a comprehensive analysis of the system’s responsiveness, reliability, and scalability under various operational conditions. It captures key performance metrics such as throughput, resource utilization and memory consumption. This report is designed to help stakeholders understand how eSignet performs in real-world scenarios, identify potential bottlenecks, and guide future optimizations to ensure a seamless and secure digital identity experience.

Read more about eSignet: [eSignet Documentation\
](https://docs.esignet.io)Further reading for eSignet integration with MOSIP: [MOSIP eSignet | MOSIP Docs 1.2.0](https://docs.mosip.io/1.2.0/interoperability/integrations/e-signet)

## Scope

This performance report focuses specifically on benchmarking and evaluating eSignet v1.4.1 under controlled test conditions using a mock Identity Authentication (IDA) system. The key areas covered within the scope of this report include:

1. Performance testing is limited to eSignet v1.4.1 and does not extend to earlier or future versions.
2. Only OTP-based authentication flows were included in the performance assessment. Other factors such as biometrics or password-based flows were excluded.
3. The system was tested to achieve and maintain a constant throughput of 100 Transactions Per Second (TPS), both with and without intentional delays introduced in the mock IDA system. The goal was to ensure consistent performance while remaining within the predefined Service Level Agreements (SLAs) for response times.
4. All performance bottlenecks, failures, or irregularities encountered during testing were documented. Where applicable, fixes and optimizations were implemented and validated to ensure compliance with performance targets.

## Approach

To perform the test run, **Apache - JMeter** was used as the load testing tool to simulate **106 users**, maintaining a consistent **throughput of 100 Transactions Per Second (TPS)** for a duration of **30 minutes**.

1. **The Constant Throughput Timer** was set to **100 × 60 = 6000 samples per minute** as the target throughput, with **100,000 sample data was** prepared for the run. For example, if the total number of user samples reaches **117,000**, the first **100,000** sample data will be unique, and the **100,001st** sample data will be a repeat of the **1st** sample data from the entry list.
2. To mimic a real-world scenario, an **additional delay of 1000ms** was introduced for the **send-OTP**, **auth**, and **token** endpoints in the mock identity system. Consequently, the **SLA was updated to 1.5 seconds**, and number of virtual users required to achieve the throughput of 100TPS was calculated using the **Little’s Law**.

## Tools Used

1. Jmeter to simulate the user load.
2. Jprofiler to profile JVM and the application code.

## Summary

1. Focus: OTP-based authentication flows only
2. Scenarios tested:
   1. With 1-second induced delay in mock Identity Authentication (IDA) system
   2. Without induced delay
3. Load conditions:
   1. Sustained 100 Transactions Per Second (TPS)
   2. 106 concurrent virtual users
   3. 30-minute duration
4. Test environment configuration:
   1. eSignet: 2 pods (1500m CPU, 2250Mi memory each)
   2. Mock ID system: 2 pods (300m CPU, 2250Mi memory each)
5. Results:
   1. Target throughput achieved
   2. All Service Level Agreements (SLAs) consistently met
   3. Excellent performance and stability under high load and delayed response conditions

### **Test Results Summary**

| API Endpoint                   | Response time (no delay) | Response time (with delay) | SLA      |
| ------------------------------ | ------------------------ | -------------------------- | -------- |
| /authorization/send-otp        | 58 ms                    | 1260 ms                    | ≤1500 ms |
| /authorization/v3/authenticate | 79 ms                    | 1258 ms                    | ≤1500 ms |
| /oauth/v2/token                | 76 ms                    | 1267 ms                    | ≤1500 ms |

### **Scenarios Considered**

The performance run is carried out with below assumptions and considerations:

1. Requirement here is to check the performance of eSignet APIs integrating with MOCK IDA.
2. We will be considering the OTP auth factor. The remaining auth factors follow the same flow as the OTP auth factor.

### **SLA:**

We are considering that the integrated ID system will take 1.5 secs for below integration points to return back the response:

1. **Send OTP  (**/authorization/send-ot&#x70;**)**
2. **KYC Auth  (**/authorization/v3/authenticat&#x65;**)**
3. **KYC Exchange  (**/oauth/v2/toke&#x6E;**)**

<table data-full-width="true"><thead><tr><th width="214.21875">Module Name</th><th width="134.56640625">Scenario to be tested</th><th width="356.984375">API Endpoint</th><th width="135.8515625">Accepted Response Time</th><th>Weightage</th></tr></thead><tbody><tr><td><p>eSignet</p><p><strong>Pre-requisite:</strong></p><ol start="1"><li>Client ID is generated using eSignet API(/v1/esignet/client-mgmt/oidc-client).</li><li>eSignet API requires PMS auth Token</li></ol></td><td>User authentication with OTP</td><td><ol><li>/csrf/token → GET</li></ol><ol start="2"><li>/authorization/v2/oauth-details → POST</li></ol><ol start="3"><li>/authorization/send-otp → POST</li></ol><ol start="4"><li>/authorization/v3/authenticate → POST</li></ol><ol start="5"><li>/authorization/auth-code → POST</li></ol><ol start="6"><li>/oauth/v2/token → POST</li></ol><ol start="7"><li><strong>/oidc/userinfo</strong> → GET</li></ol></td><td><ol><li>&#x3C;=100ms</li></ol><ol start="2"><li>&#x3C;=100ms</li></ol><ol start="3"><li>&#x3C;=1.5s</li></ol><ol start="4"><li>&#x3C;=1.5s</li></ol><ol start="5"><li>&#x3C;=100ms</li></ol><ol start="6"><li>&#x3C;=1.5s</li></ol><ol start="7"><li>&#x3C;=100ms</li></ol></td><td>100%</td></tr></tbody></table>

## Test Environment

### Deviation from the default deployment 

1. Migration from the softhsm to PK12.\
   \
   As part of the performance evaluation, a key deviation from the default deployment was the **migration from SoftHSM to PKCS#12 (PK12)** for key storage. This change enhanced compatibility and operational efficiency such that eSignet met its SLA targets under both normal and stress conditions.

### Software (Under Test)

Following ‘Images’ were under the scope of ‘Performance Testing’:

#### Modules Segregation

| Image ID                                                   | Tag Name                                                                                               | Comments                                                                      |
| ---------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------- |
| mosipid/esignet:1.4.1                                      |  [release-1.4.1](https://github.com/mosip/esignet/tree/v1.4.1)                                         |                                                                               |
| <p>mosipid/mock-identity-system:release-0.11.0</p><p> </p> | [release-0.11.0](https://github.com/mosip/esignet-mock-services/tree/v0.11.0/mock-identity-system)     | The changes are tested with mosipqa image and are available in release-0.11.x |
| mosipid/mock-relying-party-ui:0.9.2                        | [release-0.9.2](https://github.com/mosip/esignet-mock-services/tree/v0.9.2/mock-relying-party-ui)      |                                                                               |
| mosipid/mock-relying-party-service:0.9.2                   | [release-0.9.2](https://github.com/mosip/esignet-mock-services/tree/v0.9.2/mock-relying-party-service) |                                                                               |
| mosipid/oidc-ui:1.4.1                                      | [release-1.4.1](https://github.com/mosip/esignet/tree/v1.4.1/oidc-ui)                                  |                                                                               |

#### Test Data

Performance data load has been populated before the run to ensure realistic results.

| DB                           | Table Name  | Number Of Records/Sample Data |
| ---------------------------- | ----------- | ----------------------------- |
| <p>mock identity</p><p> </p> |  uin        |  100000                       |
|                              |  fullName   | 100000                        |
|                              |  emailId    | 100000                        |
|                              | phoneNumber | 100000                        |

### Test Design

* **Test Duration**: 30 mins
* **Test Type**: Load
* **Ramp Up**: 3 mins

#### **User distribution among the scenarios**

<table data-full-width="true"><thead><tr><th>Scenario Name</th><th>Module Name</th><th width="203.640625">API Endpoint</th><th>HTTP Method</th><th width="126.734375">SLA(ms) &#x3C;=</th><th width="129.25">Weightage/Load Distribution</th><th width="85.49609375">Users</th><th>Throughput (TPS)</th></tr></thead><tbody><tr><td><p>User with OTP authentication</p><p> </p></td><td><p> eSignet-service</p><p> </p></td><td> /csrf/token </td><td>GET</td><td> 100</td><td><p> </p><p> 100</p></td><td><p> </p><p> 106</p></td><td><p> </p><p> 100</p></td></tr><tr><td></td><td> </td><td>/authorization/v2/oauth-details </td><td>POST</td><td>100</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td>/authorization/send-otp </td><td>POST</td><td>1500</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td>/authorization/v3/authenticate </td><td>POST</td><td>1500</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td>/authorization/auth-code </td><td>POST</td><td>100</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td>/oauth/v2/token </td><td>POST</td><td>1500</td><td></td><td></td><td></td></tr><tr><td></td><td></td><td><strong>/oidc/userinfo</strong>  </td><td>GET</td><td>100</td><td></td><td></td><td></td></tr></tbody></table>

### Resource level configuration

| Container name       | 100TPS             |                                                                                                                                                                                                                                                                                                      |
| -------------------- | ------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
|                      | **Number of pods** | **Resource configuration**                                                                                                                                                                                                                                                                           |
| eSignet              | 2                  | <p>resources:</p><p>            limits:</p><p>              cpu: 1500m</p><p>              memory: 2250Mi</p><p>            requests:</p><p>              cpu: 1500m</p><p>              memory: 2250Mi</p><ul><li>name: JDK_JAVA_OPTIONS</li></ul><p>              value: '-Xms2250M -Xmx2250M'</p> |
| mock-identity-system | 2                  | <p>resources:</p><p>            limits:</p><p>              cpu: '300m'</p><p>              memory: 2250Mi</p><p>            requests:</p><p>              cpu: 300m</p><p>              memory: 2250Mi</p><ul><li>name: JDK_JAVA_OPTIONS</li></ul><p>              value: '-Xms1500M -Xmx1500M'</p> |

## Test Result

#### Performance test execution results

| **Application Name**        | eSignet              |
| --------------------------- | -------------------- |
| **Test Duration**           | 13/03/2025 (30 mins) |
| **Number of Virtual Users** | 106                  |
| **Status**                  | Pass                 |

### Test Report

1. Test results for 100 TPS with 106 users for a 30-minute run, simulating the real-time ID system by adding a fixed 1-second processing time for each endpoint (send-OTP, auth, and token).

| **Scenario Name**            | <p><strong>Transaction Name</strong></p><p> </p><p> </p> | **API Endpoint**                | **HTTP Method** | **100 TPS & users : 106**                     |                 |             |              |         |             |
| ---------------------------- | -------------------------------------------------------- | ------------------------------- | --------------- | --------------------------------------------- | --------------- | ----------- | ------------ | ------- | ----------- |
|                              |                                                          |                                 |                 | **Date : 09/06/2025 (half an hour duration)** |                 |             |              |         |             |
|                              |                                                          |                                 |                 | **# Samples**                                 | **Min**         | **Average** | **90% Line** | **Max** | **Error %** |
| User with OTP authentication | S01 T01 GetCsrf                                          |  /csrf/token                    | GET             | 25969                                         | 7               | 12          | 17           | 358     | 0.00%       |
|                              | S01 T02 OAuthdetails                                     | /authorization/v2/oauth-details | POST            | 25968                                         | 6               | 12          | 17           | 391     | 0.00%       |
|                              | S01 T03 Send OTP                                         | /authorization/send-otp         | POST            | 25968                                         | 1017            | 1095        | 1260         | 1719    | 0.00%       |
|                              | S01 T04 Authentication                                   | /authorization/v3/authenticate  | POST            | 25952                                         | 1025            | 1101        | 1258         | 1754    | 0.03%       |
|                              | S01 T05 Autorization                                     | /authorization/auth-code        | POST            | 25934                                         | 7               | 14          | 19           | 1026    | 0.00%       |
|                              | S01 T06 Token                                            | /oauth/v2/token                 | POST            | 25934                                         | <p>1030<br></p> | 1106        | 1267         | 1964    | 0.00%       |
|                              | S01 T07 Userinfo                                         | **/oidc/userinfo**              | GET             | 25918                                         | 6               | 12          | 17           | 437     | 0.00%       |

### Metrics

**Table of eSignet endpoint metrics**

<figure><img src="../../../.gitbook/assets/Perfromance 1.4.1 - Endpoint Metrics.png" alt=""><figcaption></figcaption></figure>

**Time chart of 90th percentile response time for eSignet services**

<figure><img src="../../../.gitbook/assets/Performance 1.4.1 - Timechart 90th percentile Response time.png" alt=""><figcaption></figcaption></figure>



#### Dependent services metrics

**Table of mock identity system endpoint metrics and time-chart of 90th percentile response time**

<figure><img src="../../../.gitbook/assets/Perfromance 1.4.1 - Table of mock identity system endpoint metrics.png" alt=""><figcaption></figcaption></figure>

#### CPU Utilisation

<figure><img src="../../../.gitbook/assets/Performance 1.4.1 - CPU Utilization.png" alt=""><figcaption></figcaption></figure>

#### Memory Utilisation

<figure><img src="../../../.gitbook/assets/Performance 1.4.1 - Memory Utilization.png" alt=""><figcaption></figcaption></figure>

## Resource Calculator

Please refer the details [resource calculator published here](https://github.com/mosip/esignet/tree/develop/performance-test) for sizing guidelines.

## Performance Analysis

### KPI Comparison

The key performance metrics from the overall run focused on the **response times** of the endpoints: **send-OTP**, **KYC-Auth**, and **KYC-Exchange** from the integrated identity system to achieve 100/sec through put is shown below.

| End points       | Expected response time (ms) | Actual Response time (ms) |
| ---------------- | --------------------------- | ------------------------- |
| **send-OTP**     | 1500                        | 1260                      |
| **KYC-Auth**     | 1500                        | 1258                      |
| **KYC-Exchange** | 1500                        | 1267                      |

### Bottlenecks

Based on the scope of the performance run, **no bottlenecks or issues were observed**.

### Recommendation

The performance of the system was evaluated based on the defined scope and approach, achieving a consistent **throughput of 100 transactions per second (TPS)** during a **30-minute run with 106 users**. It is recommended to use a **Resource Calculator** for estimating requirements and scaling for the desired number of users and transactions.

## Annexure:

* References:
  * [Little's law](https://en.wikipedia.org/wiki/Little's_law)
  * [Little’s Law in Performance Testing](https://www.perfmatrix.com/littles-law-in-performance-testing/)



