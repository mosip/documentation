# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of:

* Functionality
* Deployability
* Configurability
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries. Since MOSIP is an "API First" product platform.

**Testing scope has been focused around the below features:**

* Inji certify Docker compose testing (Data provider plugin(csv), mdoc mdl)
* Docker compose testing for Mock Data Provider plugin (csv), Farmer use case - 1.1 & 2.0 VC
* Inji certify - Insurance use case using namespace (VC issuance plugin) - 1.1 VC
* Inji certify - Mock IDA use case using namespace (Data provider plugin(Postgres)) - 1.1 & 2.0 VC
* Inji certify - MOSIP ID use case using namespace (VC issuance plugin) - 1.1 VC
* Integration with INJI Web - Limited to download only 1.1 VC

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.

* Functionality
* Deployability
* Configurability
* Customizability

The verification methods may differ based on how the need was addressed.

## Verified configuration

**Verification is performed on configurations as mentioned below**

* Default configuration
  * English

## Feature Health

<figure><img src="../../../.gitbook/assets/inji_certify_components_0.10.0_release.png" alt=""><figcaption></figcaption></figure>

{% hint style="success" %}
**Note**:



* **Docker setup** - Authorization endpoints pointing to **collab.mosip.net**
* **Postgres plugin** - In Qa-inji1 env, authorization endpoints pointing to **released.mosip.net** and manual changes must be done in DB to fetch VC (as mock identity image in released env in **mosipid/mock-identity-system:0.9.3** but data provider supports 0.10.x version of mock-identity service) - Update PSUT value of individual id and data type limitations for the same column
{% endhint %}

## Test execution statistics

### Functional test results

Below are the test metrics by performing functional testing. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

| **Total** | **Passed** | **Failed** | **NA** |
| --------- | ---------- | ---------- | ------ |
| 565       | 527        | 34         | 4      |

Test Rate: 100%, With Pass Rate: 93% and Fail Rate: 6%

### Automation Statistics

* Sunbird Use Case

| **Total** | **Passed** | **Failed** | **Ignored** |
| --------- | ---------- | ---------- | ----------- |
| 129       | 53         | 5          | 71          |

Test Rate: 100%, With Pass Rate: 96% and Fail Rate: 3.8%

5 Failures are known issues can be tracked in INJICERT-681

* Mock Use Case

| **Total** | **Passed** | **Failed** | **Ignored** |
| --------- | ---------- | ---------- | ----------- |
| 129       | 41         | 0          | 88          |

Test Rate: 100%, With Pass Rate: 100% and Fail Rate: 0%

Ignored scenarios are Not related to particular use case

* Mosipid Use Case

| **Total** | **Passed** | **Failed** | **Ignored** |
| --------- | ---------- | ---------- | ----------- |
| 129       | 26         | 0          | 103         |

Test Rate: 100%, With Pass Rate: 100% and Fail Rate: 0%

Ignored scenarios are Not related to particular use case

### Detailed Test metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

**The various metrics that assist in test tracking and efficiency are as follows:**

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

## Tested with Components

| **Module/Repo**        | **Image**                   | **POM version**      | **Dependent artifactID**          | **Comments**                                                                                                       |
| ---------------------- | --------------------------- | -------------------- | --------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| Inji-certify-mosipid   | mosipqa/inji-certify:0.10.x |                      | Digital-credential-plugin - 0.3.0 |                                                                                                                    |
| Inji-certify-mock      | mosipqa/inji-certify:0.10.x |                      | Digital-credential-plugin - 0.3.0 |                                                                                                                    |
| Inji-certify-Insurance | mosipqa/inji-certify:0.10.x |                      | Digital-credential-plugin - 0.3.0 |                                                                                                                    |
| Inji-config            | mosipqa/config-server:1.1.2 |                      |                                   | [https://github.com/mosip/inji-config/tree/release-0.5.x](https://github.com/mosip/inji-config/tree/release-0.5.x) |
| Keymanager             |                             | 1.3.0-beta2 Snapshot |                                   | To be released as a part of certify                                                                                |
| eSignet                | eSignet-1.4.1               |                      |                                   |                                                                                                                    |
