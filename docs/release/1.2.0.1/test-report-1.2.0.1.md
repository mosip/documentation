# Test Report

## Scope

The scope of testing is to verify fitment to the specification from the perspective of:

* Functionality
* Deployability
* Configurability
* Customizability

Verification is performed not only from the end-user perspective but also from the System Integrator (SI) point of view. Hence, the configurability and extensibility of the software are also assessed. This ensures the readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, the verification scope required comprehensive automation testing for all the MOSIP APIs. An automated Test Rig is created for the same.

## Test approach

Persona based approach has been adopted to perform the IV\&V(Independent Verification and Validation) by simulating the test scenarios that resemble a real-time implementation.

A Persona is a fictional character / user profile created to represent a user type that might use a product/ or a service in a similar way. Persona-based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/ scenarios that the customers will execute. The persona's needs may be addressed through any of the following:

* Functionality
* Deployability
* Configurability
* Customizability

The verification methods may differ based on how the need was addressed.

For regression check, `MOSIP Test Rig`, an automation testing suite is indigenously designed and developed for supporting persona-based testing. MOSIP Test Rig covers end-to-end test execution and reporting. The end-to-end functional test scenarios are written starting from pre-registration, to the creation of the packet in the registration centre, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutations and combinations of cases being covered. MOSIP Test Rig will be an open-source artifact which can also be enhanced and used by countries to validate the SI deliveries before going live. Persona classes include both negative and positive personas. Negative persona classes include users like Bribed Registration Office, Malicious Insider etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

## Verified configuration

Verification is performed on various configurations as mentioned below:

* Default configuration - with 3 Languages (English/Arabic/French)

## Main feature tested

* Admin
* Pre-Registration
* Registration Client
* Registration Processor
* PMS
* Resident
* IDRepo
* ID Auth

## Feature Health

<figure><img src="../../.gitbook/assets/feature Health.png" alt=""><figcaption></figcaption></figure>

## Test execution statistics

**Functional test results**

Below are the test metrics by performing functional testing using mock MDS, mock Auth and mock ABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared inline with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

| Total | Passed | Failed | Skipped |
| ----- | ------ | ------ | ------- |
| 2722  | 2537   | 178    | 7       |

**Test Rate: 100%** with **Pass rate: 93.19%**

Here is the detailed breakdown of metrics:

| Module            | Total | Passed | Failed | Skipped |
| ----------------- | ----- | ------ | ------ | ------- |
| API Based Testing | 2538  | 2373   | 160    | 5       |
| UI Based testing  | 184   | 167    | 15     | 2       |

**Note**: In API Based testing, 5 test cases are marked as skipped as they were not automated. In UI Based testing, 2 test cases are marked as skipped as they were enhancement test cases.

**DSL - End to end scenarios results**

**End-to-End Scenarios**

| Status  | Test Cases |
| ------- | ---------- |
| Total   | 163        |
| Pass    | 123        |
| Fail    | 36         |
| Skipped | 4          |

**Detailed Test metrics**

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

API Test rig reports were generated by below sha id for mosipqa/automationtests:1.2.0.1 image

sha256:48a30113bdf426630bd5f2275d3661dca92c4a26c4311c3e7232edeef04308a6

## Sonar Report

| Repository Name             | Branch Name     | Coverage (>80%) | Reliability (0) | Security (0) | Hotspots (0) | Duplications (Less than 3%) |
| --------------------------- | --------------- | --------------- | --------------- | ------------ | ------------ | --------------------------- |
| partner-management-portal   | release-1.2.0.1 | -               | 42              | 0            | 0            | 11.7                        |
| partner-management-services | release-1.2.0.1 | 76.8            | 2               | 0            | 0            | 11.7                        |
| admin-ui                    | release-1.2.0.1 | -               | 54              | 0            | 0            | 18.2                        |
| durian                      | release-1.2.0.1 | 85.2            | 5               | 0            | 0            | 0.0 %                       |
| registration                | release-1.2.0.1 | 80.9            | 2               | 0            | 1            | 4.6                         |
| packet-manager              | release-1.2.0.1 | 0%              | 7               | 0            | 0            | 1.2                         |
| id-repository               | release-1.2.0.1 | 79.9            | 9               | 0            | 0            | 1.80%                       |
| digital-card-service        | release-1.2.0.1 | 0               | 4               | 0            | 0            | 1.4                         |
| pre-registration            | release-1.2.0.1 | 81              | 48              | 0            | 0            | 1.9                         |
| pre-registration-ui         | release-1.2.0.1 | -               | 53              | 0            | 2            | 2.9                         |
| id-authentication           | release-1.2.0.1 | 72.4            | 10              | 0            | 0            | 2.2                         |
| otp-manager                 | release-1.2.0.1 | 53.51           | 0               | 0            | 0            | 0.0 %                       |
| resident-services           | release-1.2.0.1 | 77.30%          | 0               | 0            | 0            | 1.30%                       |
| registration-client         | release-1.2.0.1 | 73.7            | 21              | 0            | 5            | 7.5                         |
