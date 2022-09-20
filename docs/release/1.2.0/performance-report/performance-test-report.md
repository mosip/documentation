# Performance Test Report

## Introduction

This document provides details on the performance measurement approach of prioritized scenarios of MOSIP modules and provides detailed reports on the results.

## Scope

APIs in all modules are prioritized based on the high load expectation and usage frequency by other modules.

There are 3 types of performance scenarios covered in this report

* Prioritized single API performance (For most modules)
* End to end UI API sequence performance (For pre-registration module)
* End to end message delivery performance (For web-sub module)

All individual test scenarios from the modules are listed below.

| **Module Name**  | **API Scenario**                  | **API Endpoint**                                                                 |
| ---------------- | --------------------------------- | -------------------------------------------------------------------------------- |
| Kernel           | Add Audits                        | v1/auditmanager/audits                                                           |
| Kernel           | Client Id - Secret Key            | v1/authmanager/authenticate/clientidsecretkey                                    |
| Kernel           | User Id Pwd                       | v1/authmanager/authenticate/internal/useridPwd                                   |
| Kernel           | Validate Token                    | v1/authmanager/authorize/admin/validateToken                                     |
| Kernel           | Generate OTP                      | v1/otpmanager/otp/generate                                                       |
| Kernel           | Validate OTP                      | v1/otpmanager/otp/validate?key={keyValidate}\&otp={otpValidate}                  |
| Kernel           | Send SMS                          | v1/notifier/sms/send                                                             |
| Kernel           | Send EMAIL                        | v1/notifier/email/send                                                           |
| Kernel           | Generate PRID                     | v1/pridgenerator/prid                                                            |
| Kernel           | Generate UIN                      | v1/idgenerator/uin                                                               |
| Kernel           | Generate VID                      | v1/idgenerator/vid                                                               |
| Kernel           | Generate RID                      | v1/ridgenerator/generate/rid/{centerID}/{machineID}                              |
| IDA              | Auth with OTP                     | idauthentication/v1/auth/{mispLicenseKey}/{rpPartnerId}/{rpApiKey}               |
| IDA              | KYC with OTP                      | idauthentication/v1/kyc/{mispLicenseKey}/{ekycPartnerId}/{ekycApiKey}            |
| IDA              | Auth with bio                     | idauthentication/v1/auth/{mispLicenseKey}/{rpPartnerId}/{rpApiKey}               |
| IDA              | KYC with bio                      | idauthentication/v1/kyc/{mispLicenseKey}/{ekycPartnerId}/{ekycApiKey}            |
| IDA              | Send OTP                          | idauthentication/v1/otp/{mispLicenseKey}/{rpPartnerId}/{rpApiKey}                |
| Pre-Registration | Prereg UI end to end flow         | Prereg UI end to end flow                                                        |
| Syncdata         | Public Key Verify                 | v1/syncdata/tpm/publickey/verify                                                 |
| Syncdata         | Get Certificate                   | v1/syncdata/getCertificate?applicationId={appID}\&referenceId={refID}            |
| Syncdata         | Get User Details                  | v1/syncdata/userdetails?keyindex={keyIndex}                                      |
| Syncdata         | Get Client Settings               | v1/syncdata/v2/clientsettings?keyindex={keyIndex}                                |
| Syncdata         | Get Configs                       | v1/syncdata/configs/{name}                                                       |
| Syncdata         | Get LatestID Schema               | v1/syncdata/latestidschema?schemaVersion={schemaVersion}                         |
| Syncdata         | Get CAcertificates                | v1/syncdata/getcacertificates                                                    |
| Regproc          | Sync Registration Packet Details  | registrationprocessor/v1/registrationstatus/sync                                 |
| Regproc          | Get Packet status                 | registrationprocessor/v1/registrationstatus/search                               |
| Regproc          | Upload Registration Packet        | registrationprocessor/v1/packetreceiver/registrationpackets                      |
| Resident         | Request/Send OTP                  | resident/v1/req/otp                                                              |
| Resident         | RID Check Status                  | resident/v1/rid/check-status                                                     |
| Resident         | Auth Lock                         | resident/v1/req/auth-lock                                                        |
| Resident         | Auth Unlock                       | resident/v1/req/auth-unlock                                                      |
| Resident         | Credential Request                | resident/v1/req/credential                                                       |
| Resident         | Auth History                      | resident/v1/req/auth-history                                                     |
| Resident         | Generate VID                      | resident/v1/vid                                                                  |
| Datashare        | Create Data Share URL             | v1/datashare/create/{policyId}/{subscriberId}                                    |
| Datashare        | Get Data Share File               | v1/datashare/get/{policyId}/{subscriberId}/{randomShareKey}                      |
| IDRepo           | Retrieve Identity using UIN       | idrepository/v1/identity/idvid/{uin}                                             |
| IDRepo           | Retrieve Identity using VID       | idrepository/v1/identity/idvid/{vid}                                             |
| IDRepo           | Add Identity                      | idrepository/v1/identity/                                                        |
| IDRepo           | Update Identity                   | idrepository/v1/identity/                                                        |
| IDRepo           | Auth Type Status                  | idrepository/v1/identity/authtypes/status                                        |
| IDRepo           | Create VID                        | idrepository/v1/vid                                                              |
| IDRepo           | Update VID                        | idrepository/v1/vid/{vidGenerated}                                               |
| Masterdata       | Get Registration Centers          | v1/masterdata/registrationcenters                                                |
| Masterdata       | Get Templates                     | v1/masterdata/templates                                                          |
| Masterdata       | Get Templates By Lang & Temp Code | v1/masterdata/templates/{lang\&TempTypeCode}                                     |
| Masterdata       | Get Latest ID Schema              | v1/masterdata/idschema/latest?schemaVersion={schemaVersion}                      |
| Masterdata       | Get Dynamic Fields                | v1/masterdata/dynamicfields?pageNumber=0\&pageSize=10\&sortBy=name\&orderBy=desc |
| Masterdata       | Get Users                         | v1/masterdata/users/{userID}/{time(yyyy-MM-dd'T'HH:mm:ss.sss'Z',)}               |
| Keymanager       | Encrypt Data                      | v1/keymanager/encrypt                                                            |
| Keymanager       | Encrypt Data With Pin             | v1/keymanager/encryptWithPin                                                     |
| Keymanager       | Generate JWT Signature            | v1/keymanager/jwtSign                                                            |
| Keymanager       | Decrypt Data                      | v1/keymanager/decrypt                                                            |
| Keymanager       | Decrypt Data With Pin API         | v1/keymanager/decryptWithPin                                                     |
| Keymanager       | Verify JWT Signature              | v1/keymanager/jwtVerify                                                          |

## Testing Tools & Techniques

| **Tools**  | **Purpose**                                                 |
| ---------- | ----------------------------------------------------------- |
| **Jmeter** | To verify the Load and Performance of all the applications. |

## Approach

The approach to performance testing differs based on the testing scenarios and are detailed as per the categorization as below.

### Prioritized Single API Performance

* Run a single pod of the application hosting the required API
* Run four pods each of the dependent applications to cater the load implied from the test application
* Simulate varied load profilers like 10, 30, 50 etc.. concurrent users from Jmeter for that single API for a period of one hour
* Record the average and 90th percentile response time metrics specific to each load profiles
* Verify that JVMs show stable memory and CPU usage over the increasing load profiles.

### End to End UI API Sequence Performance

* Run a single pod for each application hosting the required APIs called directly from Jmeter
* Run four pods each of the dependent applications to cater the load implied from the test application
* Simulate varied load profilers like 50, 80, 100 etc.. concurrent users from Jmeter for end to end sequence of APIs called from UI for a period of one hour
* Record the average and 90th percentile response time metrics for entire end to end API sequence for each load profiles
* Verify that JVMs show stable memory and CPU usage over the increasing load profiles.

### End to End Message Delivery Performance

* Run a single pod for each application hosting the required APIs called directly from Jmeter
* Run four pods each of the dependent applications to cater the load implied from the test application
* Simulate varied load profilers like 10, 30, 50 etc.. concurrent users to publish continues messages to the test application for a period of one hour
* Record the average and 90th percentile response time metrics for publish API for each load profiles
* Record the average and 90th percentile delivery time metrics for entire end to end message delivery for each load profiles

## Build Details

| **Title**                              | **Description**                                                |
| -------------------------------------- | -------------------------------------------------------------- |
| **Build Tag Version**                  | 1.2.0-rc2                                                      |
| **Performance script source location** | https://github.com/mosip/mosip-performance-tests-mt/tree/1.2.0 |

## Environment Setup

### Hardware / VM details

| **CPU (cores)** | **Memory (GB)** | **HDD (GB)** | **OS**                   | **Count** | **Purpose**                |
| --------------- | --------------- | ------------ | ------------------------ | --------- | -------------------------- |
| 8               | 30              | 768          | Cent OS                  | 1         | Kubernetes console machine |
| 8               |                 |              | Kubernetes node machines |           |                            |
| 4               | 16              | 500          | Ubuntu                   | 1         | Database machine           |
| 4               | 16              | 835          | Windows                  | 3         | Jmeter test machines       |

### Pod Resource allocation

| **Pod/Application Names**           | **Resource Allocation (Limits)** |             |              |
| ----------------------------------- | :------------------------------: | :---------: | :----------: |
|                                     |          **Memory (M)**          | **CPU (m)** | **Heap (M)** |
| kernel-auditmanager-service         |               2500               |     1000    |     1750     |
| kernel-auth-service                 |               2250               |     500     |     1500     |
| kernel-otpmanager-service           |               1750               |     500     |     1000     |
| kernel-notification-service         |               1500               |     500     |     1000     |
| kernel-pridgenerator-service        |               1750               |     300     |     1000     |
| kernel-idgenerator-service          |               3500               |     500     |     2000     |
| kernel-ridgenerator-service         |               1750               |     500     |     1000     |
| ida-auth-service                    |               4000               |     4500    |     2000     |
| ida-otp-service                     |               3000               |     3000    |     2000     |
| prereg-application-service          |               2500               |     1000    |     2000     |
| kernel-syncdata-service             |               5000               |     500     |     4000     |
| regproc-registration-status-service |               4000               |     500     |     2000     |
| regproc-stage-group-1               |               5000               |     1000    |     4000     |
| resident-service                    |               3000               |     500     |     2000     |
| datashare-service                   |               3000               |     500     |     2000     |
| idrepo-identity-service             |               4000               |     1000    |     2000     |
| idrepo-vid-service                  |               3000               |     500     |     1000     |
| kernel-masterdata-service           |               2250               |     500     |     1500     |
| kernel-keymanager-service           |               5000               |     1000    |     4000     |

## Test Results

### Prioritized single API performance

**90th Percentile Response Times**

[Detailed response time details](https://docs.google.com/spreadsheets/d/1Vx3iIM3hY00f6O3\_0sxB0vJVPVZXI1i5JZ4vPXIDIZY/edit#gid=0)

Detailed Metrics for all 14 modules is available below:

#### Audit Manager

**Run 1: 50 concurrency**

**Jmeter Aggregate Report**

| Label                   | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min | Max  | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ----------------------- | --------- | ------- | ------ | -------- | -------- | -------- | --- | ---- | ------- | ---------- | --------------- | ----------- |
| Add Audit API Execution | 231236    | 777     | 395    | 2206     | 2700     | 3402     | 3   | 8420 | 0.00%   | 64.22209   | 38.88           | 186.99      |

**Response Time Percentile Graph using Jmeter**

![](<audit\_manager\_50\_jmeter\_response\_time\_percentile\_graph (1).png>)

**CPU and Memory Utilization Graphs using Grafana**

![](audit\_manager\_50\_grafana\_CPU\_utilization.png)

![](audit\_manager\_50\_grafana\_memory\_utilization.png)

**Application Response Time Graph from Kibana**

![](audit\_manager\_50\_kibana\_api\_response\_time.png)

**Dependent Application Response Time Graph from Kibana**

_Dependency app graph for auth manager service was empty so not attached._

**Run 2: 30 concurrency**

**Jmeter Aggregate Report**

| Label                   | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min | Max  | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ----------------------- | --------- | ------- | ------ | -------- | -------- | -------- | --- | ---- | ------- | ---------- | --------------- | ----------- |
| Add Audit API Execution | 266879    | 403     | 105    | 1199     | 1893     | 2409     | 2   | 3870 | 0.00%   | 74.12657   | 44.88           | 215.82      |

**Response Time Percentile Graph using Jmeter**

![](audit\_manager\_30\_jmeter\_response\_time\_percentile\_graph.png)

**CPU and Memory Utilization Graphs using Grafana**

![](audit\_manager\_30\_grafana\_CPU\_utilization.png)

![](audit\_manager\_30\_grafana\_memory\_utilization.png)

**Application Response Time Graph from Kibana**

![](audit\_manager\_30\_kibana\_api\_response\_time.png)

**Dependent Application Response Time Graph from Kibana**

_Application dependency graph was empty so not attached._

#### Auth Manager

**Run 1: 30 concurrency**

**Aggregate Report from Jmeter**

| Label                                | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ------------------------------------ | --------- | ------- | ------ | -------- | -------- | -------- | --- | ----- | ------- | ---------- | --------------- | ----------- |
| Client Id - Secret Key API Execution | 241902    | 449     | 202    | 483      | 597      | 3352     | 9   | 60051 | 0.16%   | 66.1073    | 290.08          | 28.49       |
| User Id Pwd API Execution            | 220878    | 488     | 488    | 680      | 711      | 872      | 70  | 6616  | 0.00%   | 61.34721   | 215.9           | 30          |
| Validate Token API Execution         | 451378    | 239     | 201    | 400      | 496      | 680      | 6   | 3506  | 0.00%   | 125.3778   | 582.61          | 235.51      |

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.007.png)

_We only have the graph for Validate token as the previous ones were cleared_

**CPU and Memory Utilization Graphs using Grafana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.008.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.008.png)

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.004.png)

**Dependent Application Response Time from Kibana**

_Dependency app graph was empty so so not attached._

**Notes:**

_Keycloak was having issue by end of client id secret key API run, so the keycloak was restarted before the start of user id password API_

**Run 2: 50 concurrency**

**Aggregate Report from Jmeter**

| Label                                | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ------------------------------------ | --------- | ------- | ------ | -------- | -------- | -------- | --- | ----- | ------- | ---------- | --------------- | ----------- |
| Client Id - Secret Key API Execution | 243069    | 740     | 499    | 1694     | 2100     | 2833     | 9   | 7511  | 0.00%   | 67.51412   | 296.36          | 29.09       |
| User Id Pwd API Execution            | 27121     | 5519    | 3290   | 11676    | 22351    | 43894    | 40  | 60047 | 0.39%   | 9.05834    | 31.82           | 4.42        |
| Validate Token API Execution         | 181953    | 989     | 810    | 2107     | 2496     | 3206     | 6   | 8111  | 0.00%   | 50.53694   | 234.74          | 94.93       |

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.009.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.010.png)

**CPU and Memory Utilization Graphs using Grafana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.011.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.012.png)

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.013.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.014.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.015.png)

**Dependent Application Response Time Graph from Kibana**

_Dependency app graph was empty so so not attached._

**Notes:**

_Keycloak was having issue by end of user id password API run, so the keycloak was restarted before the start of validate token API_

#### Kernel services

**Run 1: 30 concurrency**

**Aggregate Report from Jmeter**

| Label                                  | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| -------------------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | --- | ----- | ------- | ---------- | --------------- | ----------- |
| Generate OTP API Execution             | 87777     | 1229    | 1104   | 2160     | 2496     | 3207     | 5   | 7418  | 0.00%   | 24.37841   | 15.57           | 48.04       |
| Validate OTP API Execution             | 150000    | 1275    | 1128   | 2192     | 2404     | 3196     | 0   | 6268  | 0.02%   | 23.4176    | 14.89           | 42.63       |
| Notification Manager SMS API Request   | 433004    | 246     | 99     | 692      | 808      | 1119     | 2   | 2625  | 0.00%   | 120.2695   | 80.92           | 259.67      |
| Notification Manager EMAIL API Request | 69727     | 1550    | 1396   | 2992     | 3602     | 5101     | 4   | 13607 | 0.04%   | 14.87585   | 9.48            | 41.37       |
| PRID Generator API Execution           | 102606    | 1052    | 1022   | 1893     | 2073     | 2432     | 5   | 5104  | 0.00%   | 28.49246   | 11.74           | 51          |
| Generate UIN API Execution             | 39971     | 2698    | 2672   | 2813     | 2833     | 3536     | 127 | 8776  | 0.00%   | 11.09746   | 26.27           | 23.71       |
| Generate VID API Execution             | 205377    | 154     | 139    | 266      | 321      | 423      | 5   | 12380 | 6.39%   | 193.1971   | 458.89          | 412.75      |
| RID Generator API Execution            | 368802    | 291     | 193    | 743      | 930      | 1324     | 5   | 5761  | 0.00%   | 102.4346   | 63.42           | 221.07      |

**Note:** _idgenerator- generate vid api threw error as “VID not available for allocation error”, so it ran only for around 20 mins rest all other api’s ran for the complete 1 hour run._

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.010.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.009.png)

**CPU and Memory Utilization Graphs using Grafana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.002.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.002.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.016.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.011.png)

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.017.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.004.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.018.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.013.png)

**Note:** _idgenerator & pridgenerator services are vertx apps so there are no kibana graphs for the same_

**Dependent Application Response Time Graph from Kibana**

_Dependency app graph was empty so above are the graphs for the application services from kibana_

**Notes:** _Some of the kernel service api’s failed with oomkilled & authentication failed issues, so restarted the same and then continued the load test from the next set of api’s that’s why we have multiple graphs from jmeter & grafana._

**Run 2: 10 & 50 concurrency**

**Aggregate Report from Jmeter**

| Label                                  | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| -------------------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | --- | ----- | ------- | ---------- | --------------- | ----------- |
| Generate OTP API Execution             | 768397    | 45      | 9      | 92       | 95       | 100      | 5   | 299   | 0.00%   | 213.4406   | 135.9           | 420.63      |
| Generate OTP API Request               | 90000     | 42      | 8      | 90       | 91       | 94       | 4   | 184   | 0.00%   | 225.8061   | 143.77          | 445         |
| Validate OTP API Execution             | 90000     | 48      | 14     | 92       | 95       | 100      | 6   | 1209  | 0.00%   | 201.6066   | 127.78          | 366.99      |
| Notification Manager EMAIL API Request | 135462    | 264     | 195    | 606      | 893      | 1198     | 3   | 6299  | 0.00%   | 37.62565   | 23.92           | 104.68      |
| Notification Manager SMS API Request   | 4085605   | 23      | 1      | 2        | 2        | 8        | 1   | 60063 | 99.89%  | 1134.873   | 414.17          | 2450.28     |
| PRID Generator API Execution           | 77782     | 462     | 459    | 792      | 853      | 949      | 8   | 2303  | 0.00%   | 21.60354   | 8.86            | 38.67       |
| RID Generator API Execution            | 1881518   | 86      | 16     | 80       | 97       | 136      | 1   | 60184 | 99.91%  | 516.4455   | 1062.7          | 1114.59     |
| Generate UIN API Execution             | 41290     | 870     | 875    | 896      | 905      | 924      | 87  | 1785  | 0.00%   | 11.46714   | 27.12           | 24.5        |
| Generate VID API Execution             | 1132665   | 157     | 114    | 330      | 355      | 396      | 4   | 3560  | 87.76%  | 314.6231   | 763.26          | 672.26      |

**Note:** _idgenerator- generate vid api threw error as “VID not available for allocation error”, so it ran only for around 10 mins & also notification manager sms api & rid generator api failed completely with 502 bad gateway errors for 50 concurrency._

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.010.png) ![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.007.png)

**CPU and Memory Utilization Graphs using Grafana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.002.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.003.png)

_**Note:** The grafana graphs for the other services like otpmanager, ridgenerator, pridgenerator & id generator services are lost as they were old data_

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.014.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.018.png)

**Note:** _idgenerator & pridgenerator services are vertx apps so there are no kibana graphs for the same_

**Dependent Application Response Time from Kibana**

_Dependency app graph was empty so above are the graphs for the application services from kibana_

**Notes:** _Some of the kernel service api’s failed with oomkilled & authentication failed issues, so restarted the same and then continued the load test from the next set of api’s that’s why we have multiple graphs from jmeter & grafana._

#### IDA

**Run 1: 10 concurrency**

**Aggregate Report from Jmeter**

| Label                             | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min | Max  | Error % | Throughput | Received KB/sec | Sent KB/sec |
| --------------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | --- | ---- | ------- | ---------- | --------------- | ----------- |
| Send OTP Execution                | 15743     | 2286    | 2396   | 2804     | 2933     | 3192     | 25  | 3855 | 0.01%   | 4.371      | 12.22           | 19.2        |
| ID Auth Request With OTP          | 23060     | 1560    | 1547   | 2058     | 2192     | 2424     | 175 | 3185 | 0.02%   | 6.40415    | 17.91           | 33.45       |
| EKYC Auth Request With OTP        | 22252     | 1616    | 1614   | 2129     | 2265     | 2500     | 294 | 3286 | 0.02%   | 6.17927    | 794.05          | 32.46       |
| ID Auth Request With Biometrics   | 21804     | 1649    | 1639   | 2200     | 2343     | 2611     | 252 | 3794 | 0.02%   | 6.05471    | 16.93           | 220.35      |
| EKYC Auth Request With Biometrics | 21042     | 1709    | 1691   | 2285     | 2434     | 2728     | 210 | 3712 | 0.02%   | 5.84423    | 750.99          | 212.86      |

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.019.png)

**CPU and Memory Utilization Graphs using Grafana**

_Grafana graphs were erased for older data_

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.020.png)

**Dependent Application Response Time from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.021.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.018.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.014.png)

**Run 2: 30 concurrency**

**Aggregate Report from Jmeter**

| Label                             | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min  | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| --------------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | ---- | ----- | ------- | ---------- | --------------- | ----------- |
| Send OTP Execution                | 13576     | 7958    | 7995   | 8996     | 9308     | 10123    | 4293 | 12046 | 0.03%   | 3.76589    | 10.54           | 16.55       |
| ID Auth Request With OTP          | 20202     | 5348    | 5353   | 6020     | 6261     | 6805     | 2174 | 8238  | 0.02%   | 5.60468    | 15.68           | 29.28       |
| EKYC Auth Request With OTP        | 19889     | 5430    | 5445   | 6142     | 6402     | 6949     | 1027 | 8252  | 0.02%   | 5.51885    | 709.21          | 28.99       |
| ID Auth Request With Biometrics   | 19403     | 5568    | 5581   | 6357     | 6639     | 7252     | 670  | 9007  | 0.02%   | 5.38179    | 15.06           | 195.86      |
| EKYC Auth Request With Biometrics | 18949     | 5702    | 5726   | 6538     | 6853     | 7509     | 353  | 8850  | 0.02%   | 5.25693    | 675.52          | 191.47      |

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.019.png)

**CPU and Memory Utilization Graphs using Grafana**

_Grafana graphs were erased for older data._

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.018.png)

**Dependent Application Response Time from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.018.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.022.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.015.png)

#### Registration Processor

**Run 1: 30 concurrency**

**Aggregate Report from Jmeter**

| Label                                    | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ---------------------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | --- | ----- | ------- | ---------- | --------------- | ----------- |
| Sync Registration Packet API Execution   | 53535     | 2017    | 1878   | 3029     | 3519     | 4997     | 199 | 14424 | 0.00%   | 14.86683   | 15.96           | 51.03       |
| Get Packet status API Execution          | 87599     | 1232    | 1233   | 1552     | 1630     | 1776     | 243 | 60013 | 0.00%   | 24.32718   | 181.49          | 63.17       |
| Upload Registration Packet API Execution | 3510      | 30911   | 30991  | 33291    | 34363    | 38198    | 478 | 53099 | 0.00%   | 0.96944    | 0.86            | 1948.02     |

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.023.png)

**CPU and Memory Utilization Graphs using Grafana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.003.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.016.png)

**Application Response Time Graph from Kibana**

_No data was captured for registration processor registration status service graph in Kibana for the entire test duration._

_**Note:** Registration processor stage group 1 service is a vertx app so there is no Kibana graph for this._

**Dependent Application Response Time from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.024.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.025.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.026.png)

**Run 2: 10 concurrency**

**Aggregate Report from Jmeter**

| Label                                    | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ---------------------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | --- | ----- | ------- | ---------- | --------------- | ----------- |
| Sync Registration Packet API Execution   | 64649     | 556     | 550    | 676      | 708      | 909      | 207 | 2110  | 0.00%   | 17.95645   | 19.27           | 61.64       |
| Get Packet status API Execution          | 49530     | 726     | 703    | 978      | 1036     | 1133     | 169 | 60012 | 0.00%   | 13.7564    | 145.97          | 35.72       |
| Upload Registration Packet API Execution | 6690      | 5386    | 1260   | 11404    | 12258    | 14306    | 123 | 18888 | 0.00%   | 1.85473    | 1.65            | 3727.21     |

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.007.png)

**CPU and Memory Utilization Graphs using Grafana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.002.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.011.png)

**Application Response Time Graph from Kibana**

_No data was captured for registration processor registration status service graph in Kibana for the entire test duration._

_**Note:** registration processor stage group 1 service is a vertx app, so there is no kibana graph for this._

**Dependent Application Response Time from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.025.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.025.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.024.png)

#### Syncdata

**Run 1: 30 concurrency**

**Aggregate Report from Jmeter**

| Label                             | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min  | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| --------------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | ---- | ----- | ------- | ---------- | --------------- | ----------- |
| Public Key Verify API Execution   | 435249    | 247     | 209    | 458      | 574      | 866      | 21   | 5613  | 0.00%   | 120.8957   | 171.66          | 338.84      |
| Get Certificate API Execution     | 353275    | 305     | 269    | 546      | 654      | 891      | 20   | 2089  | 0.00%   | 98.12497   | 276.26          | 181.01      |
| Get User Details API Execution    | 11736     | 9213    | 9166   | 9695     | 10276    | 14573    | 730  | 22247 | 0.00%   | 3.25181    | 11.79           | 6.16        |
| Get Client Settings API Execution | 48931     | 2207    | 1999   | 3703     | 4397     | 5803     | 196  | 10803 | 0.00%   | 13.58629   | 2368.66         | 25.82       |
| Get Configs API Execution         | 20427     | 5290    | 5193   | 5911     | 6286     | 7203     | 1106 | 10596 | 0.00%   | 5.66731    | 262.18          | 10.24       |
| Get LatestID Schema API Execution | 356781    | 302     | 218    | 651      | 836      | 1276     | 20   | 3355  | 0.00%   | 99.10027   | 1510.41         | 179.43      |
| Get CAcertificates API Execution  | 238505    | 452     | 369    | 878      | 1101     | 1648     | 28   | 4755  | 0.00%   | 66.24493   | 7158.97         | 119.1       |

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.001.png)

**CPU and Memory Utilization Graphs using Grafana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.006.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.002.png)

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.024.png)

**Dependent Application Response Time from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.027.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.028.png)

**Run 2: 10 & 50 concurrency**

**Aggregate Report from Jmeter**

| Label                             | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min  | Max  | Error % | Throughput | Received KB/sec | Sent KB/sec |
| --------------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | ---- | ---- | ------- | ---------- | --------------- | ----------- |
| Public Key Verify API Execution   | 390125    | 460     | 355    | 947      | 1206     | 1815     | 21   | 6124 | 0.00%   | 108.3583   | 153.65          | 303.7       |
| Get Certificate API Execution     | 300097    | 599     | 500    | 1172     | 1429     | 2005     | 20   | 5102 | 0.00%   | 83.34947   | 234.5           | 153.76      |
| Get User Details API Execution    | 11773     | 3058    | 3054   | 3205     | 3261     | 3534     | 833  | 5279 | 0.00%   | 3.2678     | 11.84           | 6.19        |
| Get Client Settings API Execution | 52127     | 690     | 692    | 902      | 1001     | 1199     | 79   | 1900 | 0.00%   | 14.478     | 2524.09         | 27.51       |
| Get Configs API Execution         | 18717     | 1923    | 1806   | 2206     | 2386     | 3310     | 1006 | 4100 | 0.00%   | 5.19704    | 240.42          | 9.39        |
| Get LatestID Schema API Execution | 298200    | 603     | 416    | 1369     | 1780     | 2732     | 21   | 7979 | 0.00%   | 82.82468   | 1262.19         | 149.96      |
| Get CA certificates API Execution | 220333    | 816     | 599    | 1747     | 2248     | 3424     | 28   | 8297 | 0.00%   | 61.19382   | 6613.03         | 110.02      |

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.001.png)

**CPU and Memory Utilization Graphs using Grafana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.011.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.003.png)

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.029.png)

**Dependent Application Response Time from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.026.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.024.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.030.png)

#### Resident

**Run 1: 30 concurrency**

**Aggregate Report from Jmeter**

| Label                      | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min  | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| -------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | ---- | ----- | ------- | ---------- | --------------- | ----------- |
| Request OTP                | 5277      | 20527   | 13618  | 60012    | 60013    | 60021    | 1325 | 60079 | 11.29%  | 1.45586    | 1.33            | 2.92        |
| RID Check Status           | 73109     | 1477    | 1013   | 3220     | 4260     | 6770     | 105  | 21521 | 0.00%   | 20.29957   | 12.91           | 40.1        |
| Auth Lock API              | 16981     | 6364    | 5670   | 10923    | 12893    | 17213    | 567  | 31744 | 0.00%   | 4.71056    | 3.19            | 9.53        |
| Auth Unlock API            | 16223     | 6662    | 5966   | 11496    | 13537    | 17909    | 375  | 33340 | 0.00%   | 4.49985    | 3.06            | 9.26        |
| Request Credential API     | 16253     | 6652    | 5994   | 12227    | 14217    | 19044    | 273  | 38494 | 0.00%   | 4.50174    | 2.95            | 9.83        |
| Auth History API           | 5100      | 21221   | 18707  | 37493    | 44213    | 59170    | 1479 | 60023 | 0.82%   | 1.41057    | 0.99            | 2.89        |
| Generate VID API Execution | 14410     | 7504    | 6832   | 12998    | 15335    | 20769    | 600  | 37105 | 0.00%   | 3.99359    | 2.67            | 8.06        |

**Response Time Percentile Graph using Jmeter**

![](<Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.005 (1).png>)

**CPU and Memory Utilization Graphs using Grafana**

_**CPU container usage grafana graphs are not available for resident service container**_

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.011.png)

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.029.png)

**Dependent Application Response Time from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.031.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.026.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.029.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.028.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.031.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.025.png)

**Run 2: 10 concurrency**

**Aggregate Report from Jmeter**

| Label                      | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min  | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| -------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | ---- | ----- | ------- | ---------- | --------------- | ----------- |
| Request OTP                | 4810      | 7493    | 7549   | 8397     | 8635     | 9405     | 1463 | 13833 | 0.00%   | 1.33296    | 0.93            | 2.67        |
| RID Check Status           | 56043     | 641     | 562    | 1101     | 1379     | 1959     | 103  | 3881  | 0.00%   | 15.56573   | 9.91            | 30.75       |
| Auth Lock API              | 10000     | 2411    | 2010   | 4085     | 4872     | 6406     | 258  | 9587  | 0.02%   | 4.12136    | 2.79            | 8.34        |
| Auth Unlock API            | 10000     | 2438    | 2060   | 4165     | 4900     | 6349     | 401  | 9044  | 0.02%   | 4.08215    | 2.77            | 8.4         |
| Request Credential API     | 10000     | 2440    | 1557   | 5310     | 6421     | 9416     | 215  | 13339 | 0.02%   | 4.0734     | 2.67            | 8.9         |
| Auth History API           | 4490      | 8025    | 7987   | 9591     | 10157    | 11535    | 2059 | 14581 | 0.00%   | 1.24482    | 0.85            | 2.55        |
| Generate VID API Execution | 10000     | 2720    | 2090   | 5090     | 6213     | 8163     | 385  | 11400 | 0.02%   | 3.6507     | 2.45            | 7.37        |

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.032.png)

**CPU and Memory Utilization Graphs using Grafana**

_**CPU container usage grafana graphs are not available for resident service container**_

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.033.png)

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.027.png)

**Dependent Application Response Time from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.024.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.031.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.026.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.027.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.026.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.034.png)

#### Datashare

**Run 1: 30 concurrency**

**Aggregate Report from Jmeter**

| Label                           | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min  | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ------------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | ---- | ----- | ------- | ---------- | --------------- | ----------- |
| Create Data Share URL Execution | 13434     | 8044    | 7901   | 11306    | 12400    | 14202    | 1421 | 18805 | 0.00%   | 3.72685    | 3.44            | 3845.7      |
| Get Data Share File Execution   | 185315    | 582     | 302    | 804      | 2775     | 4705     | 8    | 12710 | 0.00%   | 51.47058   | 4263.17         | 115.79      |

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.007.png)

**CPU and Memory Utilization Graphs using Grafana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.002.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.003.png)

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.024.png)

**Dependent Application Response Time from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.027.png)

**Run 2: 10 & 50 concurrency**

**Aggregate Report from Jmeter**

| Label                           | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ------------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | --- | ----- | ------- | ---------- | --------------- | ----------- |
| Create Data Share URL Execution | 13253     | 2716    | 2528   | 4035     | 4532     | 5426     | 249 | 12256 | 0.00%   | 3.6798     | 3.4             | 3797.15     |
| Get Data Share File Execution   | 179001    | 1004    | 602    | 2498     | 2899     | 3520     | 10  | 7101  | 0.00%   | 49.71529   | 33.6            | 111.84      |

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.001.png)

**CPU and Memory Utilization Graphs using Grafana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.003.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.035.png)

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.034.png)

**Dependent Application Response Time from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.024.png)

#### ID Repository

**Run 1: 30 concurrency**

**Aggregate Report from Jmeter**

| Label                        | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ---------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | --- | ----- | ------- | ---------- | --------------- | ----------- |
| Add Identity (bio) Execution | 9000      | 7407    | 7366   | 9210     | 9878     | 11094    | 110 | 15147 | 27.29%  | 4.02176    | 2.88            | 4397.92     |
| Retrieve Identity using UIN  | 505883    | 213     | 198    | 295      | 358      | 697      | 22  | 1304  | 0.22%   | 140.5188   | 243.91          | 303.41      |
| Retrieve Identity using VID  | 130678    | 825     | 506    | 1701     | 1913     | 2452     | 13  | 3792  | 0.46%   | 36.29708   | 62.91           | 78.59       |
| Create VID Execution         | 105575    | 1022    | 798    | 1992     | 2296     | 2501     | 99  | 3618  | 0.48%   | 29.32075   | 20.84           | 69.64       |
| Update Identity Execution    | 15000     | 3167    | 3085   | 4707     | 5207     | 6402     | 121 | 9115  | 2.49%   | 9.3834     | 6.7             | 34.79       |
| Update VID Execution         | 15000     | 1455    | 1403   | 2388     | 2496     | 2699     | 5   | 3516  | 0.67%   | 20.48912   | 15.76           | 49.04       |

_**Note:** Add Identity api threw a lot of duplicate key constraint errors \~27.29 %_

_\norg.postgresql.util.PSQLException: ERROR: duplicate key value violates unique constraint "uk\_uin\_reg\_id"_

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.032.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.007.png)

**CPU and Memory Utilization Graphs using Grafana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.035.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.011.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.008.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.003.png)

**Application Response Time Graph from Kibana**

_No data was captured for the Kibana graphs of id repository identity & VID services_

**Dependent Application Response Time from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.026.png)

**Run 2: 10 & 50 concurrency**

**Aggregate Report from Jmeter**

| Label                        | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min | Max  | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ---------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | --- | ---- | ------- | ---------- | --------------- | ----------- |
| Retrieve Identity using UIN  | 389893    | 461     | 313    | 994      | 1209     | 1598     | 28  | 2317 | 0.22%   | 108.2907   | 187.86          | 233.82      |
| Retrieve Identity using VID  | 110457    | 325     | 191    | 800      | 914      | 1194     | 12  | 1983 | 0.46%   | 30.67593   | 53.14           | 66.42       |
| Add Identity (bio) Execution | 15000     | 2868    | 2901   | 3402     | 3750     | 4196     | 140 | 4896 | 26.35%  | 3.46978    | 2.48            | 3794.32     |
| Update Identity Execution    | 20000     | 1269    | 1328   | 1973     | 2276     | 2900     | 14  | 4586 | 3.86%   | 7.84082    | 5.57            | 29.07       |
| Auth Type Status Execution   | 306901    | 586     | 418    | 1198     | 1496     | 1892     | 33  | 2702 | 0.00%   | 85.2427    | 53.28           | 226.51      |
| Create VID Execution         | 77102     | 466     | 302    | 1002     | 1181     | 1513     | 45  | 2271 | 0.48%   | 21.41616   | 15.2            | 50.86       |
| Update VID Execution         | 13950     | 576     | 423    | 1138     | 1282     | 1612     | 0   | 2377 | 0.51%   | 17.23997   | 13.23           | 41.26       |

_**Note:** Add Identity API threw a lot of duplicate key constraint errors \~27.29 %_

_\norg.postgresql.util.PSQLException: ERROR: duplicate key value violates unique constraint "uk\_uin\_reg\_id"_

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.036.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.023.png)

**CPU and Memory Utilization Graphs using Grafana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.006.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.006.png)

**Application Response Time Graph from Kibana**

_No data was captured for the Kibana graphs of ID repository identity & VID services_

**Dependent Application Response Time from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.018.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.013.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.004.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.037.png)

#### Masterdata

**Run 1: 30 & 50 concurrency**

**Aggregate Report from Jmeter**

| Label                                           | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ----------------------------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | --- | ----- | ------- | ---------- | --------------- | ----------- |
| Get Registration Centres API Execution          | 21480     | 5030    | 4901   | 7806     | 9098     | 10898    | 253 | 17595 | 0.00%   | 5.96056    | 3609.27         | 10.74       |
| Get Templates API Execution                     | 170957    | 1051    | 802    | 2505     | 2992     | 4294     | 4   | 10242 | 0.00%   | 47.46712   | 4540.57         | 85.06       |
| Get Templates By Lang & Temp Code API Execution | 47241     | 2285    | 2002   | 3885     | 4555     | 5526     | 4   | 9282  | 0.00%   | 13.11962   | 16.77           | 23.87       |
| Get Latest ID Schema API Execution              | 69179     | 2601    | 2501   | 4388     | 5200     | 6573     | 5   | 10700 | 0.00%   | 19.20952   | 279.19          | 34.84       |
| Get Dynamic Fields API Execution                | 55536     | 1944    | 1884   | 2893     | 3098     | 3416     | 14  | 5094  | 0.00%   | 15.42405   | 81.76           | 28.45       |
| Get Users API Execution                         | 44399     | 2432    | 2295   | 4196     | 4597     | 5785     | 6   | 9189  | 0.00%   | 12.3283    | 9.31            | 22.42       |

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.001.png)

**CPU and Memory Utilization Graphs using Grafana**

_No data was captured for the Grafana - CPU & memory container usage graphs_

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.004.png)

**Dependent Application Response Time from Kibana**

_No data was captured for dependency apps in kibana_

**Run 2: 10 & 30 concurrency**

**Aggregate Report from Jmeter**

| Label                                           | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min  | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ----------------------------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | ---- | ----- | ------- | ---------- | --------------- | ----------- |
| Get Registration Centres API Execution          | 2281      | 15799   | 15772  | 18399    | 19296    | 21013    | 1904 | 23509 | 0.00%   | 0.63243    | 382.95          | 1.14        |
| Get Templates API Execution                     | 93851     | 1149    | 1198   | 2190     | 2533     | 2997     | 4    | 5791  | 0.00%   | 26.0657    | 2493.37         | 46.71       |
| Get Templates By Lang & Temp Code API Execution | 46088     | 780     | 699    | 1300     | 1403     | 1592     | 4    | 2905  | 0.00%   | 12.79908   | 16.36           | 23.29       |
| Get Latest ID Schema API Execution              | 68743     | 1570    | 1399   | 2694     | 2865     | 3896     | 5    | 5604  | 0.00%   | 19.09314   | 277.5           | 34.62       |
| Get Dynamic Fields API Execution                | 58867     | 611     | 489    | 1113     | 1200     | 1301     | 11   | 1531  | 0.00%   | 16.34786   | 86.66           | 30.16       |
| Get Users API Execution                         | 43642     | 824     | 901    | 1320     | 1475     | 1595     | 6    | 2602  | 0.00%   | 12.12249   | 9.15            | 22.04       |

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.032.png)

**CPU and Memory Utilization Graphs using Grafana**

_**No data was captured in Grafana for CPU & memory container usage graphs**_

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.018.png)

**Dependent Application Response Time from Kibana**

_No data was captured for dependency apps in Kibana._

#### Key Manager

**Run 1: 30 & 50 concurrency**

**Aggregate Report from Jmeter**

| Label                                | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min  | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ------------------------------------ | --------- | ------- | ------ | -------- | -------- | -------- | ---- | ----- | ------- | ---------- | --------------- | ----------- |
| Encrypt Data API Execution           | 1053790   | 170     | 189    | 287      | 297      | 386      | 6    | 1604  | 0.00%   | 292.7122   | 317.26          | 753.15      |
| Encrypt Data With Pin API Execution  | 10443     | 10346   | 10406  | 13892    | 14705    | 16399    | 1589 | 19495 | 0.00%   | 2.89775    | 2.2             | 6.92        |
| Generate JWT Signature API Execution | 558466    | 321     | 310    | 437      | 485      | 798      | 14   | 1579  | 0.00%   | 155.117    | 417.01          | 392.79      |
| Decrypt Data API Execution           | 516634    | 348     | 335    | 475      | 528      | 858      | 14   | 1442  | 0.00%   | 143.4985   | 93.17           | 428.67      |
| Decrypt Data With Pin API Execution  | 10349     | 10442   | 10515  | 14208    | 15288    | 17010    | 1704 | 21202 | 0.00%   | 2.87069    | 1.86            | 7.13        |
| Verify JWT Signature API Execution   | 1582654   | 113     | 90     | 209      | 305      | 628      | 3    | 1404  | 0.00%   | 439.616    | 297.94          | 1995.87     |

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.001.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.032.png)

**CPU and Memory Utilization Graphs using Grafana**

_No data was captured in Grafana for CPU & memory container usage graphs._

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.018.png) ![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.022.png)

**Dependent Application Response Time from Kibana**

_No data was captured for dependency apps in Kibana._

**Run 2: 10 & 80 concurrency**

**Aggregate Report from Jmeter**

| Label                                | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min  | Max  | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ------------------------------------ | --------- | ------- | ------ | -------- | -------- | -------- | ---- | ---- | ------- | ---------- | --------------- | ----------- |
| Encrypt Data API Execution           | 927329    | 310     | 292    | 583      | 707      | 930      | 6    | 1901 | 0.00%   | 257.552    | 279.65          | 662.68      |
| Encrypt Data With Pin API Execution  | 10361     | 3475    | 3401   | 4305     | 4694     | 5296     | 711  | 6699 | 0.00%   | 2.87609    | 2.19            | 6.87        |
| Generate JWT Signature API Execution | 521059    | 552     | 531    | 669      | 895      | 1146     | 17   | 2150 | 0.00%   | 144.718    | 388.77          | 366.46      |
| Decrypt Data API Execution           | 488850    | 588     | 549    | 827      | 1051     | 1366     | 15   | 4124 | 0.00%   | 135.7712   | 88.16           | 405.59      |
| Decrypt Data With Pin API Execution  | 10089     | 3568    | 3500   | 4402     | 4699     | 5299     | 1109 | 6497 | 0.00%   | 2.80138    | 1.82            | 6.96        |
| Verify JWT Signature API Execution   | 1214824   | 236     | 95     | 602      | 808      | 1334     | 3    | 2998 | 0.00%   | 337.423    | 229.34          | 1531.91     |

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.032.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.001.png)

**CPU and Memory Utilization Graphs using Grafana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.011.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.006.png)

**Application Response Time Graph from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.004.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.015.png)

**Dependent Application Response Time from Kibana**

_No data was captured for dependency apps in kibana._

### End to End UI API Sequence Performance Metrics

#### Pre-registration

**Run 1: 50 concurrency**

**90th Percentile response time ( End to end UI flow) - 18.9 sec**

**Aggregate Report from Jmeter**

| Label                                               | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min  | Max   | Error % | Throughput | Received KB/sec | Sent KB/sec |
| --------------------------------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | ---- | ----- | ------- | ---------- | --------------- | ----------- |
| PreReg Launch                                       | 2481      | 14      | 6      | 29       | 57       | 151      | 4    | 612   | 0.00%   | 0.68942    | 2.5             | 0.34        |
| PreReg Send OTP                                     | 2481      | 5400    | 3910   | 12575    | 16399    | 24523    | 34   | 45492 | 0.00%   | 0.68841    | 0.48            | 0.29        |
| PreReg Validate OTP                                 | 2480      | 3369    | 2189   | 8182     | 11242    | 19216    | 49   | 34813 | 0.00%   | 0.68807    | 2.15            | 1.16        |
| PreReg Enter Demographic Details And Click Continue | 2473      | 17520   | 15587  | 30322    | 34981    | 45715    | 1175 | 72550 | 0.00%   | 0.68645    | 23.3            | 6.15        |
| PreReg Upload Documents                             | 2463      | 7707    | 6095   | 15331    | 18711    | 28729    | 392  | 41042 | 0.00%   | 0.68532    | 3.17            | 371.05      |
| PreReg Click Continue After Uploading Documents     | 2455      | 14692   | 13030  | 26844    | 31673    | 40660    | 243  | 56219 | 0.00%   | 0.68426    | 7.93            | 3.53        |
| PreReg Preview Document Details And Continue        | 2446      | 14298   | 12314  | 25695    | 30528    | 38385    | 1667 | 54085 | 0.00%   | 0.68189    | 8.23            | 2.21        |
| PreReg Select Center And Continue                   | 2438      | 3410    | 2213   | 8151     | 10711    | 17372    | 65   | 32880 | 0.00%   | 0.68227    | 41.99           | 1.32        |
| PreReg Select Slot And Continue                     | 2438      | 6837    | 5402   | 13687    | 17525    | 25248    | 201  | 38337 | 5.41%   | 0.68167    | 4.19            | 2.97        |
| PreReg Logout                                       | 2431      | 17      | 11     | 45       | 66       | 84       | 7    | 442   | 0.00%   | 0.68089    | 2.45            | 0.87        |
| TOTAL                                               | 24586     | 7328    | 4598   | 18901    | 24527    | 35440    | 4    | 72550 | 0.54%   | 6.81687    | 95.81           | 388.5       |

_**Note:** Error percentage for pre-registration is due to the unavailability of slots for 53 unique registration centres._

_Slots were generated for 947 unique reg centres and for the rest 53 centres slots were not created so this needs to be debugged further._

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.032.png)

**CPU and Memory Utilization Graphs using Grafana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.033.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.003.png)

**Self-response time graphs from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.022.png)

**Dependent Application Response Time from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.015.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.013.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.004.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.037.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.004.png)

_**Notes:** Prereg is connected to the internal database because when we tried connecting it to the external database we were getting failures while booking appointments manually._

**Run 2: 80 concurrency**

**90th Percentile response time ( End to end UI flow) - 30.9 sec**

**Aggregate Report from Jmeter**

| Label                                               | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min  | Max    | Error % | Throughput | Received KB/sec | Sent KB/sec |
| --------------------------------------------------- | --------- | ------- | ------ | -------- | -------- | -------- | ---- | ------ | ------- | ---------- | --------------- | ----------- |
| PreReg Launch                                       | 2389      | 66      | 9      | 183      | 412      | 707      | 4    | 1084   | 0.00%   | 0.66437    | 2.4             | 0.33        |
| PreReg Send OTP                                     | 2389      | 8777    | 6358   | 19932    | 25454    | 34345    | 31   | 60013  | 0.08%   | 0.66207    | 0.46            | 0.28        |
| PreReg Validate OTP                                 | 2385      | 5905    | 4286   | 12937    | 16567    | 28790    | 60   | 46664  | 0.00%   | 0.661      | 2.3             | 1.12        |
| PreReg Enter Demographic Details And Click Continue | 2381      | 29540   | 26824  | 50104    | 56729    | 70781    | 3687 | 99983  | 0.00%   | 0.66017    | 22.78           | 5.89        |
| PreReg Upload Documents                             | 2358      | 13605   | 11462  | 26031    | 32216    | 46567    | 752  | 62849  | 0.04%   | 0.6566     | 3.04            | 355.5       |
| PreReg Click Continue After Uploading Documents     | 2350      | 24769   | 21697  | 42821    | 53048    | 76185    | 764  | 118903 | 0.04%   | 0.65785    | 7.62            | 3.39        |
| PreReg Preview Document Details And Continue        | 2336      | 22505   | 19701  | 39685    | 47397    | 67283    | 1633 | 96086  | 0.13%   | 0.65444    | 7.89            | 2.12        |
| PreReg Select Center And Continue                   | 2319      | 5791    | 3802   | 13131    | 18470    | 29293    | 63   | 60365  | 0.04%   | 0.65156    | 39.94           | 1.26        |
| PreReg Select Slot And Continue                     | 2316      | 11313   | 9361   | 21756    | 27996    | 39136    | 303  | 61613  | 5.70%   | 0.65044    | 3.99            | 2.83        |
| PreReg Logout                                       | 2309      | 139     | 25     | 499      | 648      | 986      | 8    | 1387   | 0.00%   | 0.65443    | 2.36            | 0.84        |
| TOTAL                                               | 23532     | 12254   | 7990   | 30921    | 39493    | 57968    | 4    | 118903 | 0.60%   | 6.51774    | 91.88           | 371.52      |

_**Note:**_

* _Error percentage for pre-registration is due to the unavailability of slots for 53 unique reg centres. Slots were generated for 947 unique reg centres and for the rest 53 centres slots were not created so this needs to be debugged further._
* _Got some 504 gateway timeout errors for a few of the transactions before booking an appointment._

**Response Time Percentile Graph using Jmeter**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.001.png)

**CPU and Memory Utilization Graphs using Grafana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.003.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.038.png)

**Self-response time graphs from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.018.png)

**Dependent Application Response Time from Kibana**

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.022.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.004.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.013.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.004.png)

![](Aspose.Words.847091e4-d70a-4b8a-b618-47c1e39d7377.013.png)

_**Notes:** Pre-registration is connected to the internal database because when we tried connecting it to an external database we were getting failures while booking appointments manually._

### **End to End Message Delivery Performance Metrics**

#### 30 concurrency

* 90th Percentile response time
  * Publish (10 subscribers, 8 topics) - 0.221 sec
  * End to end message delivery (10 subscribers, 8 topics) -
    * finalAvgNinetiethPercentile=5777.9 sec finalAvgTurnAroundTime=3327.8 sec
    * Aggregate Report from Jmeter
* Aggregate Report from Jmeter

| Label            | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min | Max  | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ---------------- | --------- | ------- | ------ | -------- | -------- | -------- | --- | ---- | ------- | ---------- | --------------- | ----------- |
| Publish Messages | 605668    | 177     | 173    | 221      | 239      | 295      | 5   | 1759 | 0.00%   | 168.2339   | 52.74           | 333.1       |

* Response Time Percentile Graph using Jmeter

![](Aspose.Words.668508f4-1422-4536-a598-08ce0b014cd1.001.png)

#### 50 concurrency

* 90th Percentile response time
  * Publish (10 subscribers, 8 topics) - 0.25 sec
  * End to end message delivery (10 subscribers, 8 topics)
    * finalAvgNinetiethPercentile = 9810 sec
    * finalAvgTurnAroundTime = 5719.9 sec
* Aggregate Report from Jmeter

| Label            | # Samples | Average | Median | 90% Line | 95% Line | 99% Line | Min | Max  | Error % | Throughput | Received KB/sec | Sent KB/sec |
| ---------------- | --------- | ------- | ------ | -------- | -------- | -------- | --- | ---- | ------- | ---------- | --------------- | ----------- |
| Publish Messages | 861179    | 208     | 202    | 252      | 270      | 316      | 4   | 2083 | 0.00%   | 239.2059   | 74.99           | 473.62      |

* Response Time Percentile Graph using Jmeter

![](Aspose.Words.668508f4-1422-4536-a598-08ce0b014cd1.002.png)
