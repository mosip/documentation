# Performance Report

## **Overview**

The eSignet Performance Testing Report provides a comprehensive analysis of the system’s responsiveness, reliability, and scalability under various operational conditions. It captures key performance metrics such as throughput, resource utilization and memory consumption. This report is designed to help stakeholders understand how eSignet performs in real-world scenarios, identify potential bottlenecks, and guide future optimizations to ensure a seamless and secure authentication experience.

## **Summary**

Load tests were conducted to assess the performance and stability of eSignet APIs. The mock-identity-system was used to artificially induce 1,3 and 5 second delay in 3 different tests to check for performance variability under different response times.

During each of the three 10‑hour test windows, the system successfully processed \~1.9 million authentications originating from 100,000 unique identities, maintaining a steady throughput of \~50 transactions per second. Throughout the test, all API response times consistently remained close to the 100‑millisecond SLA target (not including the artificial mock delay).

A Resource Calculator is provided to help estimate their hardware requirement to achieve similar performance at a larger scale.

No major performance degradation or bottlenecks were observed throughout the test duration. Based on the results, this module is assessed to be stable, performant, and ready for release. However, few issues have been recognized, documented and will be addressed in future release.

## **Performance Improvements**

In this release the core authentication engine has been migrated from Java to Go, for better long-term sustainability, performance and efficiency. Go, as a runtime, has been judged to be better suited to the kind of high-throughput, low-latency authentication workloads that a national identity backend needs to sustain. Improvements have been made in caching, connection management. Go configs have also been tuned to match varying possible auth response times.

## **Test Environment**

### **Deviation from the default**

* `mock-identity-system` service was used as an Identity authentication provider. The response delay was set to 1,3 and 5 seconds in three different tests.

### **Software Under Test**

Following ‘Images’ were under the scope of ‘Performance Testing’, and will be transferred as mosipid images

#### **Modules Segregation**

| Image ID                            | Branch Name    | Comments                                |
| ----------------------------------- | -------------- | --------------------------------------- |
| mosipqa/eSignet:2.0.x               |  release-2.0.x |                                         |
| mosipqa/oidc-ui:2.0.x               |  release-2.0.x |                                         |
| mosipqa/mock-identity-system:0.14.x | release-0.14.x | Repo used is mosip/eSignet-mock-service |

### **Test Data**

Performance data load was populated before the run to ensure realistic results.

| DB                        | Table Name     | Number Of Records (Target) | Number Of Records (Tested with) |
| ------------------------- | -------------- | -------------------------- | ------------------------------- |
| mosip\_mockidentitysystem | Mock\_identity | 100,000                    | 100,000                         |

### **Test Design**

* Test Duration: 10-Hours
* Test Type: Load Test
* Ramp Up: 15 mins
* Total TPS: 50

#### **Workload Model**

| Scenario Name                | API Endpoint                                           | SLA (ms) | Weightage/ Load Distribution | Throughput (TPS) | Target Volume |
| ---------------------------- | ------------------------------------------------------ | -------- | ---------------------------- | ---------------- | ------------- |
| S01 OTP Authentication       | S01 T01 Initiate PAR Endpoint                          |  100     |   80%                        |   40             |    1,440,000  |
|                              | S01 T02 Send Authorize Endpoint                        | 100      |                              |                  |               |
|                              | S01 T03 Flow Meta Endpoint                             | 100      |                              |                  |               |
|                              | S01 T04 1 Authentication Flow - Start Endpoint         | 100      |                              |                  |               |
|                              | S01 T04 2 Authentication Flow - ACR Endpoint           | 100      |                              |                  |               |
|                              | S01 T04 3 Authentication Flow - Individual ID Endpoint | 100      |                              |                  |               |
|                              | S01 T04 4 Authentication Flow - OTP Endpoint           | 100      |                              |                  |               |
|                              | S01 T04 5 Authentication Flow - Consent Endpoint       | 100      |                              |                  |               |
|                              | S01 T05 Obtain Authorization Code Endpoint             | 100      |                              |                  |               |
|                              | S01 T06 Obtain Access Token Endpoint                   | 100      |                              |                  |               |
|                              | S01 T07 User Info Endpoint                             | 100      |                              |                  |               |
| S02 Biometric Authentication | S02 T01 Initiate PAR Endpoint                          | 100      | 20%                          | 10               | 360,000       |
|                              | S02 T02 Send Authorize Endpoint                        | 100      |                              |                  |               |
|                              | S02 T03 Flow Meta Endpoint                             | 100      |                              |                  |               |
|                              | S02 T04 1 Authentication Flow - Start Endpoint         | 100      |                              |                  |               |
|                              | S02 T04 2 Authentication Flow - Select acr Endpoint    | 100      |                              |                  |               |
|                              | S02 T04 3 Authentication Flow - Individual ID Endpoint | 100      |                              |                  |               |
|                              | S02 T04 4 Authentication Flow - Bio Endpoint           | 100      |                              |                  |               |
|                              | S02 T04 5 Authentication Flow - Consent Endpoint       | 100      |                              |                  |               |
|                              | S02 T05 Obtain Authorization Code Endpoint             | 100      |                              |                  |               |
|                              | S02 T06 Obtain Access Token Endpoint                   | 100      |                              |                  |               |
|                              | S02 T07 User Info Endpoint                             | 100      |                              |                  |               |

## **Test Results**

### **Performance test execution results**

#### **Test 1**

| **Application Name**           | eSignet (under 5 second mock response delay)   |
| ------------------------------ | ---------------------------------------------- |
| **Test Duration**              | 7/9/26, 1:56 PM - 11:56 PM (10-Hours)          |
| **Number of parallel threads** | 802                                            |
| **Status**                     | <mark style="color:$success;">**GREEN**</mark> |

#### **Test 2**

| **Application Name**           | eSignet (under 3 second mock response delay)   |
| ------------------------------ | ---------------------------------------------- |
| **Test Duration**              | 8/9/26, 10:27 AM – 8:27 PM (10-Hours)          |
| **Number of parallel threads** | 516                                            |
| **Status**                     | <mark style="color:$success;">**GREEN**</mark> |

#### **Test 3**

| **Application Name**           | eSignet (under 1 second mock response delay)   |
| ------------------------------ | ---------------------------------------------- |
| **Test Duration**              | 8/9/26, 9:00 PM - 9/9/26 7:00 PM (10-Hours)    |
| **Number of parallel threads** | 191                                            |
| **Status**                     | <mark style="color:$success;">**GREEN**</mark> |

### **Test Reports**

#### **Test 1 - under 5 second mock response delay**

| Scenario Name                | Transaction Name                                       | API Endpoint                     | 50 TPS 802 VUsers           |         |             |              |         |             |
| ---------------------------- | ------------------------------------------------------ | -------------------------------- | --------------------------- | ------- | ----------- | ------------ | ------- | ----------- |
|                              |                                                        |                                  | **Date: 7/9/26 (10 Hours)** |         |             |              |         |             |
|                              |                                                        |                                  | **# Samples**               | **Min** | **Average** | **95% Line** | **Max** | **Error %** |
| S01 OTP Authentication       | S01 T01 Initiate PAR Endpoint                          | /oauth2/par → POST               | 1,582,426                   | 4       | 9           | 15           | 275     | 0.0%        |
|                              | S01 T02 Send Authorize Endpoint                        | /oauth2/authorize → GET          | 1,582,426                   | 6       | 14          | 25           | 272     | 0.0%        |
|                              | S01 T03 Flow Meta Endpoint                             | /flow/meta → GET                 | 1,582,426                   | 13      | 22          | 35           | 293     | 0.0%        |
|                              | S01 T04 1 Authentication Flow - Start Endpoint         | /flow/execute(start) → POST      | 1,582,422                   | 6       | 13          | 24           | 282     | 0.0%        |
|                              | S01 T04 2 Authentication Flow - ACR Endpoint           | /flow/execute(select-acr) → POST | 1,582,420                   | 6       | 13          | 24           | 280     | 0.0%        |
|                              | S01 T04 3 Authentication Flow - Individual ID Endpoint | /flow/execute(submit-uin) → POST | 1,582,418                   | 5,010   | 5,019       | 5,031        | 5,667   | 0.0%        |
|                              | S01 T04 4 Authentication Flow - OTP Endpoint           | /flow/execute(submit-otp) → POST | 1,582,205                   | 5,013   | 5,024       | 5,037        | 5,301   | 0.0%        |
|                              | S01 T04 5 Authentication Flow - Consent Endpoint       | /flow/execute(consent) → POST    | 1,581,984                   | 5,015   | 5,030       | 5,046        | 5,322   | 0.0%        |
|                              | S01 T05 Obtain Authorization Code Endpoint             | /oauth2/auth/callback → POST     | 1,581,754                   | 6       | 15          | 27           | 260     | 0.0%        |
|                              | S01 T06 Obtain Access Token Endpoint                   | /oauth2/token → POST             | 1,581,750                   | 5       | 12          | 22           | 263     | 0.0%        |
|                              | S01 T07 User Info Endpoint                             | /oauth2/userinfo → GET           | 1,581,748                   | 6       | 13          | 23           | 231     | 0.0%        |
| S02 Biometric Authentication | S02 T01 Initiate PAR Endpoint                          | /oauth2/par → POST               | 359,798                     | 4       | 9           | 16           | 93      | 0.0%        |
|                              | S02 T02 Send Authorize Endpoint                        | /oauth2/authorize → GET          | 359,794                     | 6       | 15          | 31           | 256     | 0.0%        |
|                              | S02 T03 Flow Meta Endpoint                             | /flow/meta → GET                 | 359,793                     | 13      | 24          | 42           | 286     | 0.0%        |
|                              | S02 T04 1 Authentication Flow - Start Endpoint         | /flow/execute(start) → POST      | 359,792                     | 6       | 13          | 27           | 221     | 0.0%        |
|                              | S02 T04 2 Authentication Flow - Select acr Endpoint    | /flow/execute(select-acr) → POST | 359,791                     | 6       | 13          | 24           | 231     | 0.0%        |
|                              | S02 T04 3 Authentication Flow - Individual ID Endpoint | /flow/execute(submit-uin) → POST | 359,791                     | 6       | 13          | 24           | 256     | 0.0%        |
|                              | S02 T04 4 Authentication Flow - Bio Endpoint           | /flow/execute(submit-otp) → POST | 359,791                     | 5,012   | 5,024       | 5,039        | 5,283   | 0.0%        |
|                              | S02 T04 5 Authentication Flow - Consent Endpoint       | /flow/execute(consent) → POST    | 359,739                     | 5,017   | 5,032       | 5,054        | 5,295   | 0.0%        |
|                              | S02 T05 Obtain Authorization Code Endpoint             | /oauth2/auth/callback → POST     | 359,686                     | 6       | 15          | 30           | 199     | 0.0%        |
|                              | S02 T06 Obtain Access Token Endpoint                   | /oauth2/token → POST             | 359,682                     | 5       | 12          | 22           | 130     | 0.0%        |
|                              | S02 T07 User Info Endpoint                             | /oauth2/userinfo → GET           | 359,680                     | 6       | 12          | 23           | 129     | 0.0%        |

#### **Test 2 - under 3 second mock response delay**

| Scenario Name                | Transaction Name                                       | API Endpoint                     | 50 TPS 516 VUsers           |         |             |              |         |             |
| ---------------------------- | ------------------------------------------------------ | -------------------------------- | --------------------------- | ------- | ----------- | ------------ | ------- | ----------- |
|                              |                                                        |                                  | **Date: 8/9/26 (10 Hours)** |         |             |              |         |             |
|                              |                                                        |                                  | **# Samples**               | **Min** | **Average** | **95% Line** | **Max** | **Error %** |
| S01 OTP Authentication       | S01 T01 Initiate PAR Endpoint                          | /oauth2/par → POST               | 1,611,896                   | 4       | 7           | 11           | 162     | 0.0%        |
|                              | S01 T02 Send Authorize Endpoint                        | /oauth2/authorize → GET          | 1,611,893                   | 6       | 13          | 22           | 290     | 0.0%        |
|                              | S01 T03 Flow Meta Endpoint                             | /flow/meta → GET                 | 1,611,893                   | 13      | 35          | 86           | 268     | 0.0%        |
|                              | S01 T04 1 Authentication Flow - Start Endpoint         | /flow/execute(start) → POST      | 1,611,893                   | 6       | 40          | 89           | 268     | 0.0%        |
|                              | S01 T04 2 Authentication Flow - ACR Endpoint           | /flow/execute(select-acr) → POST | 1,611,893                   | 6       | 42          | 89           | 3124    | 0.0%        |
|                              | S01 T04 3 Authentication Flow - Individual ID Endpoint | /flow/execute(submit-uin) → POST | 1,611,893                   | 3,010   | 3,054       | 3,100        | 3877    | 0.0%        |
|                              | S01 T04 4 Authentication Flow - OTP Endpoint           | /flow/execute(submit-otp) → POST | 1,611,757                   | 3,013   | 3,063       | 3,118        | 3673    | 0.0%        |
|                              | S01 T04 5 Authentication Flow - Consent Endpoint       | /flow/execute(consent) → POST    | 1,611,619                   | 3,018   | 3,066       | 3,127        | 3295    | 0.0%        |
|                              | S01 T05 Obtain Authorization Code Endpoint             | /oauth2/auth/callback → POST     | 1,611,483                   | 6       | 29          | 75           | 302     | 0.0%        |
|                              | S01 T06 Obtain Access Token Endpoint                   | /oauth2/token → POST             | 1,611,469                   | 5       | 11          | 27           | 190     | 0.0%        |
|                              | S01 T07 User Info Endpoint                             | /oauth2/userinfo → GET           | 1,611,462                   | 6       | 11          | 17           | 222     | 0.0%        |
| S02 Biometric Authentication | S02 T01 Initiate PAR Endpoint                          | /oauth2/par → POST               | 359,593                     | 4       | 19          | 56           | 192     | 0.0%        |
|                              | S02 T02 Send Authorize Endpoint                        | /oauth2/authorize → GET          | 359,590                     | 6       | 27          | 86           | 239     | 0.0%        |
|                              | S02 T03 Flow Meta Endpoint                             | /flow/meta → GET                 | 359,590                     | 13      | 36          | 88           | 258     | 0.0%        |
|                              | S02 T04 1 Authentication Flow - Start Endpoint         | /flow/execute(start) → POST      | 359,590                     | 6       | 29          | 80           | 239     | 0.0%        |
|                              | S02 T04 2 Authentication Flow - Select acr Endpoint    | /flow/execute(select-acr) → POST | 359,585                     | 6       | 28          | 77           | 257     | 0.0%        |
|                              | S02 T04 3 Authentication Flow - Individual ID Endpoint | /flow/execute(submit-uin) → POST | 359,582                     | 6       | 25          | 73           | 247     | 0.0%        |
|                              | S02 T04 4 Authentication Flow - Bio Endpoint           | /flow/execute(submit-otp) → POST | 359,578                     | 3,012   | 3,042       | 3,099        | 3296    | 0.0%        |
|                              | S02 T04 5 Authentication Flow - Consent Endpoint       | /flow/execute(consent) → POST    | 359,552                     | 3,017   | 3,051       | 3,121        | 3344    | 0.0%        |
|                              | S02 T05 Obtain Authorization Code Endpoint             | /oauth2/auth/callback → POST     | 359,522                     | 6       | 25          | 75           | 229     | 0.0%        |
|                              | S02 T06 Obtain Access Token Endpoint                   | /oauth2/token → POST             | 359,519                     | 5       | 21          | 71           | 236     | 0.0%        |
|                              | S02 T07 User Info Endpoint                             | /oauth2/userinfo → GET           | 359,519                     | 6       | 32          | 91           | 273     | 0.0%        |

#### **Test 3 - under 1 second mock response delay**

| Scenario Name                | Transaction Name                                       | API Endpoint                     | 50 TPS 191 VUsers           |         |             |              |         |             |
| ---------------------------- | ------------------------------------------------------ | -------------------------------- | --------------------------- | ------- | ----------- | ------------ | ------- | ----------- |
|                              |                                                        |                                  | **Date: 8/9/26 (10 Hours)** |         |             |              |         |             |
|                              |                                                        |                                  | **# Samples**               | **Min** | **Average** | **95% Line** | **Max** | **Error %** |
| S01 OTP Authentication       | S01 T01 Initiate PAR Endpoint                          | /oauth2/par → POST               | 1,617,619                   | 4       | 7           | 11           | 105     | 0.0%        |
|                              | S01 T02 Send Authorize Endpoint                        | /oauth2/authorize → GET          | 1,617,613                   | 7       | 15          | 35           | 119     | 0.0%        |
|                              | S01 T03 Flow Meta Endpoint                             | /flow/meta → GET                 | 1,617,613                   | 14      | 35          | 63           | 120     | 0.0%        |
|                              | S01 T04 1 Authentication Flow - Start Endpoint         | /flow/execute(start) → POST      | 1,617,613                   | 7       | 27          | 52           | 273     | 0.0%        |
|                              | S01 T04 2 Authentication Flow - ACR Endpoint           | /flow/execute(select-acr) → POST | 1,617,613                   | 7       | 24          | 47           | 134     | 0.0%        |
|                              | S01 T04 3 Authentication Flow - Individual ID Endpoint | /flow/execute(submit-uin) → POST | 1,617,613                   | 1,011   | 1,032       | 1,056        | 1,687   | 0.0%        |
|                              | S01 T04 4 Authentication Flow - OTP Endpoint           | /flow/execute(submit-otp) → POST | 1,617,567                   | 1,014   | 1,037       | 1,062        | 1,707   | 0.0%        |
|                              | S01 T04 5 Authentication Flow - Consent Endpoint       | /flow/execute(consent) → POST    | 1,617,520                   | 1,018   | 1,042       | 1,069        | 4,605   | 0.0%        |
|                              | S01 T05 Obtain Authorization Code Endpoint             | /oauth2/auth/callback → POST     | 1,617,474                   | 6       | 17          | 36           | 122     | 0.0%        |
|                              | S01 T06 Obtain Access Token Endpoint                   | /oauth2/token → POST             | 1,617,474                   | 6       | 11          | 19           | 99      | 0.0%        |
|                              | S01 T07 User Info Endpoint                             | /oauth2/userinfo → GET           | 1,617,469                   | 6       | 10          | 13           | 78      | 0.0%        |
| S02 Biometric Authentication | S02 T01 Initiate PAR Endpoint                          | /oauth2/par → POST               | 360,350                     | 4       | 12          | 28           | 88      | 0.0%        |
|                              | S02 T02 Send Authorize Endpoint                        | /oauth2/authorize → GET          | 360,350                     | 7       | 21          | 51           | 112     | 0.0%        |
|                              | S02 T03 Flow Meta Endpoint                             | /flow/meta → GET                 | 360,350                     | 14      | 28          | 54           | 123     | 0.0%        |
|                              | S02 T04 1 Authentication Flow - Start Endpoint         | /flow/execute(start) → POST      | 360,350                     | 7       | 18          | 43           | 114     | 0.0%        |
|                              | S02 T04 2 Authentication Flow - Select acr Endpoint    | /flow/execute(select-acr) → POST | 360,350                     | 7       | 17          | 43           | 126     | 0.0%        |
|                              | S02 T04 3 Authentication Flow - Individual ID Endpoint | /flow/execute(submit-uin) → POST | 360,349                     | 7       | 18          | 42           | 105     | 0.0%        |
|                              | S02 T04 4 Authentication Flow - Bio Endpoint           | /flow/execute(submit-otp) → POST | 360,349                     | 1,013   | 1,032       | 1,065        | 1,131   | 0.0%        |
|                              | S02 T04 5 Authentication Flow - Consent Endpoint       | /flow/execute(consent) → POST    | 360,339                     | 1,018   | 1,040       | 1,076        | 1,157   | 0.0%        |
|                              | S02 T05 Obtain Authorization Code Endpoint             | /oauth2/auth/callback → POST     | 360,329                     | 6       | 18          | 46           | 108     | 0.0%        |
|                              | S02 T06 Obtain Access Token Endpoint                   | /oauth2/token → POST             | 360,326                     | 6       | 14          | 35           | 124     | 0.0%        |
|                              | S02 T07 User Info Endpoint                             | /oauth2/userinfo → GET           | 360,321                     | 6       | 16          | 44           | 219     | 0.0%        |

#### **High Level Observations:**

* The system successfully sustained 50 authentications per second for 10 consecutive hours using 100,000 unique mock identities.
* No noticeable degradation in response times was observed during the entire test duration.
* After excluding the intentionally introduced mock delay, the response times across all three test scenarios were largely comparable.
* The 95th percentile response time remained below 100 ms for the majority of measurements. Only 4 out of 66 results exceeded this threshold, with the highest recorded value being 127 ms (Test 2 - S01 T04 5), which remains within an acceptable range.

### **Metrics**

#### **Response Times Over time**

**Test 1**

<figure><img src="../../../.gitbook/assets/image (26).png" alt=""><figcaption></figcaption></figure>



**Test 2**

<figure><img src="../../../.gitbook/assets/test2_Screenshot 2026-09-10 123639.png" alt=""><figcaption></figcaption></figure>

**Test 3**

<figure><img src="../../../.gitbook/assets/test3_Screenshot 2026-09-10 123712.png" alt=""><figcaption></figcaption></figure>

**Observations:**

All transaction response times remained consistent and stable throughout the 10-hour test.

#### **Throughput**

**Test 1**

<figure><img src="../../../.gitbook/assets/test1_Screenshot 2026-09-10 124235.png" alt=""><figcaption></figcaption></figure>

**Test 2**

<figure><img src="../../../.gitbook/assets/test2_Screenshot 2026-09-10 124019.png" alt=""><figcaption></figcaption></figure>

**Test 3**

<figure><img src="../../../.gitbook/assets/test3_Screenshot 2026-09-10 124132.png" alt=""><figcaption></figcaption></figure>

**Observations:**

* Throughput remained stable throughout the 10-hour performance test, with no significant degradation observed over the duration.
* The OTP Authentication flow (S01) sustained approximately 44 TPS, while the Biometric Authentication flow (S02) sustained approximately 10 TPS.
* Combined, the two authentication flows achieved an aggregate throughput of more than 50 TPS.

#### **Resource Utilisation** _(Grouped by Service)_

1. **eSignet**

<figure><img src="../../../.gitbook/assets/test1_Screenshot 2026-09-08 165712.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/test2_Screenshot 2026-09-09 023416.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/test3_Screenshot 2026-09-10 094845.png" alt=""><figcaption></figcaption></figure>

**Observation:**

* No performance bottlenecks or issues were observed in the 3 tests.
* The CPU remained consistently at \~80% of 4CPU throughout the 10-hour test.
* The memory was stable. But the consumption changed with mock delay.
  * 5sec delay = 950MB
  * 3sec delay = 600MB
  * 1sec delay = 300MB

2. **oidc-ui**

<figure><img src="../../../.gitbook/assets/test1_Screenshot 2026-09-08 165822.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/test2_Screenshot 2026-09-09 023324.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/test3_Screenshot 2026-09-10 095025.png" alt=""><figcaption></figcaption></figure>

**Observation:**

* Performance remained stable throughout the 10-hour run.
* The CPU remained consistent around 0.25 per pod.
* Memory stayed around \~130MiB per pod for 5 second delay test. For 1sec and 3sec delay tests it stayed around 70MiB per pod.
* The OIDC UI can reliably handle approximately 300-400 concurrent connections with the allocated resources (0.3 vCPU and 500 MiB memory). But a larger number of connections can trigger connection churn. An issue has been created to address this in future. [\[BUG\] oidc-ui nginx connection churn and uneven distribution issue at high load · Issue #2583 · mosip/eSignet](https://github.com/mosip/esignet/issues/2583)

3. **mockid**

<figure><img src="../../../.gitbook/assets/test1_Screenshot 2026-09-08 165822 (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/test2_Screenshot 2026-09-09 023512.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/test3_Screenshot 2026-09-10 095103.png" alt=""><figcaption></figcaption></figure>

**Observation:**

* No performance bottlenecks or issues were observed in the 3 tests.

4. **redis**

<figure><img src="../../../.gitbook/assets/test1_Screenshot 2026-09-08 180420.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/test2_Screenshot 2026-09-09 023542.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../../.gitbook/assets/test3_Screenshot 2026-09-10 095128.png" alt=""><figcaption></figcaption></figure>

**Observation:**

* No performance bottlenecks or issues were observed in the 3 tests.

## **Resource Calculator**

Attached is the resource calculator excel tool.

[resource\_calculator\_eSignet\_2.0.0](https://github.com/mosip/esignet/blob/release-2.0.x/performance-test/resource_calculator_eSignet_2.0.0.xlsx)

### **Resource level configuration**

The following configuration was used for the performance test.

| NameSpace       | Deployment           | Resources  |                 |              |                 | No.of Pods |
| --------------- | -------------------- | ---------- | --------------- | ------------ | --------------- | ---------- |
|                 |                      | **Limits** |                 | **Requests** |                 |            |
|                 |                      | **CPU(m)** | **Memory (Mi)** | **CPU(m)**   | **Memory (Mi)** |            |
| eSignet-go-mock | eSignet-go-mock      | 4000       | 1000            | 4000         | 1000            | 1          |
| eSignet-go-mock | oidc-ui-go-mock      | 300        | 500             | 300          | 500             | 4          |
| mockid          | mock-identity-system | 1000       | 1500            | 300          | 500             | 3          |

## **Comparison with eSignet Java**

The primary goal of the migration to the Go engine is to reduce infrastructure resource requirements while maintaining, or improving, the existing level of responsiveness. To evaluate this objective, the performance characteristics of both codebases were compared.

The most recent major performance test and report for the Java-based eSignet 1.4.x release was used as the baseline for comparison against the latest eSignet 2.0.0 (Go) release.

### **Resource Requirement Comparison**

| Release              | Target TPS | vCPU | RAM (GB) |
| -------------------- | ---------- | ---- | -------- |
| eSignet 2.0.0 (Go)   | 292        | 71   | 61       |
| eSignet 1.4.x (Java) | 292        | 294  | 524      |

**Observation:**

* For the same target peak load of 292 TPS, eSignet 2.0.0 requires approximately 76% less CPU and 88% less memory compared to the Java-based eSignet 1.4.x release.
* While the improvement is less pronounced at lower TPS levels, the Go-based implementation was consistently observed to have significant reductions in resource consumption.

**Additional notes:**

* The target TPS and corresponding infrastructure requirements (vCPU and RAM) were calculated using the eSignet Resource Calculator.
* The calculation was based on field-provided assumptions of
  * 105 million total population
  * 50 million registered users (approx)
  * 1 million peak-hour users (approx)
* **Important Note**: The resource calculator published with eSignet 1.4.x contained a defect where the Performance Run TPS value was incorrectly populated with the RPS value. As a result, the published value was shown as 100, whereas the correct TPS value should have been 14.4. This issue is planned to be fixed in the eSignet 1.8.1 release. The corrected TPS value has already been applied internally when generating the comparison presented above. ([Issue #2584](https://github.com/mosip/esignet/issues/2584)).

### **Response Time Comparison**

| eSignet 1.4.x (with 1 sec Delay) |               |         |                                 |                                     | eSignet 2.0.0 (with 1 sec Delay)    |                                 |         |               |                                                        |
| -------------------------------- | ------------- | ------- | ------------------------------- | ----------------------------------- | ----------------------------------- | ------------------------------- | ------- | ------------- | ------------------------------------------------------ |
| **Transaction Name**             | **# Samples** | **TPS** | **Response time (90th pct) ms** | **Total Time (without mock delay)** | **Total Time (without mock delay)** | **Response time (90th pct) ms** | **TPS** | **# Samples** | **Transaction Name**                                   |
| S01 T01 GetCsrf                  | 25,969        | 14.4    | 17                              | **17**                              | **-**                               |                                 |         |               |                                                        |
|                                  |               |         |                                 | **-**                               | **9**                               | 9                               | 44.0    | 1,582,426     | S01 T01 Initiate PAR Endpoint                          |
| S01 T02 OAuthdetails             | 25,968        | 14.4    | 17                              | **17**                              | **127**                             | 24                              | 44.0    | 1,582,426     | S01 T02 Send Authorize Endpoint                        |
|                                  |               |         |                                 |                                     |                                     | 57                              | 44.0    | 1,582,426     | S01 T03 Flow Meta Endpoint                             |
|                                  |               |         |                                 |                                     |                                     | 46                              | 44.0    | 1,582,422     | S01 T04 1 Authentication Flow - Start Endpoint         |
| S01 T03 Send OTP                 | 25,968        | 14.4    | 1260                            | **518**                             | **144**                             | 41                              | 44.0    | 1,582,420     | S01 T04 2 Authentication Flow - ACR Endpoint           |
| S01 T04 Authentication           | 25,952        | 14.4    | 1258                            |                                     |                                     | 1048                            | 44.0    | 1,582,418     | S01 T04 3 Authentication Flow - Individual ID Endpoint |
|                                  |               |         |                                 |                                     |                                     | 1055                            | 44.0    | 1,582,205     | S01 T04 4 Authentication Flow - OTP Endpoint           |
| S01 T05 Authorization            | 25,934        | 14.4    | 19                              | **19**                              | **88**                              | 1060                            | 44.0    | 1,581,984     | S01 T04 5 Authentication Flow - Consent Endpoint       |
|                                  |               |         |                                 |                                     |                                     | 28                              | 44.0    | 1,581,754     | S01 T05 Obtain Authorization Code Endpoint             |
| S01 T06 Token                    | 25,934        | 14.4    | 1267                            | **267**                             | **15**                              | 15                              | 44.0    | 1,581,750     | S01 T06 Obtain Access Token Endpoint                   |
| S01 T07 Userinfo                 | 25,918        | 14.4    | 17                              | **17**                              | **12**                              | 12                              | 44.0    | 1,5,81,748    | S01 T07 User Info Endpoint                             |
| **Total**                        |               |         |                                 | **855**                             | **395**                             |                                 |         |               |                                                        |

**Observation:**

* The overall end-to-end processing time (excluding mock delay) was reduced from approximately 855 ms in eSignet 1.4.x to 395 ms in eSignet 2.0.0, representing an improvement of approximately 54%.
* Despite the substantially higher throughput, the endpoint response times in eSignet 2.0.0 remained well within 100 milliseconds (ignoring mock delay) for individual API requests.

**Additional Notes:**

* Transaction names differ between the two releases due to changes in the engine architecture and authentication flow. Table colour coding has been used to help identify and compare equivalent stages of the authentication journey.
* The 90th percentile response time metric is used in this comparison to maintain consistency with the performance data previously published for eSignet 1.4.x. In other section of this performance report 95th percentile response time metric will be used to maintain consistency with latest MOSIP performance reports.

## **Performance Analysis**

### **KPI**

The performance test was conducted to ensure this release is able to achieve a stable rate of 50 authentication per second. The test achieved 50tps for 10 hours without any degradation.

Additionally, the hardware resources used to achieve this rate of transaction per second (TPS) has been shared via Resource Calculator document. It can be used to estimate resources required for higher processing as per specific needs of client countries.

### **Bottlenecks**

Based on the defined scope and the results of this performance test, no major bottlenecks or performance‑limiting issues were observed. All services operated within acceptable resource boundaries. Most API response times remained below the 100ms target with only minor breaches. (max was 127ms)

### **Recommendation**

* eSignet 2.0.0 is recommended for release. The build sustained the target rate of 50 authentications per second for 10 continuous hours in all three test runs, with a 0.0% error rate and no degradation in response time or throughput over the duration.
* It has been observed that memory consumption increases with upstream ID Authentication latency. Successful tests have been conducted for 1, 3 and 5 second latency with recommended resources. However, if ID Authentication latency is expected to be greater than 5seconds, the resource calculator needs to be updated with new test data within the “Resource used in Internal Test” section.
* The oidc-ui-nginx connection churn observed in oidc-ui at high connection counts is tracked under [Issue #2583](https://github.com/mosip/esignet/issues/2583).The issue remains manageable as long as the resource calculator recommendation for oidc-ui pod count is followed.\
  .

## **Conclusion**

eSignet 2.0.0 is able to reliably process authentication at the rate of 50 transactions per second (TPS) for 10-hours. The Resource Calculator can be used to estimate the hardware requirements for higher TPS rate for larger populations.
