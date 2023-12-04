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

A Persona is a fictional character/ user profile created to represent a user type that might use a product/ or a service in a similar way. Persona-based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/ scenarios that the customers will execute. The persona's needs may be addressed through any of the following:

* Functionality
* Deployability
* Configurability
* Customizability

The verification methods may differ based on how the need was addressed.

For regression check, `MOSIP Test Rig`, an automation testing suite is indigenously designed and developed for supporting persona-based testing. MOSIP Test Rig covers end-to-end test execution and reporting. The end-to-end functional test scenarios are written starting from pre-registration, to the creation of the packet in the registration centre, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutations and combinations of cases being covered. MOSIP Test Rig will be an open-source artifact which can also be enhanced and used by countries to validate the SI deliveries before going live. Persona classes include both negative and positive personas. Negative persona classes include users like Bribed Registration Office, Malicious Insider etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

## Verified configuration

Verification is performed on the configuration mentioned below:

* Default configuration- with 1 Language (English)

## Main feature tested

* Deployment testing as per the Upgrade Runbook.
* Reprocess the packets (which are generated and paused in 1.1.5.x at various stages) after the upgrade.
* Reg.Client 1.1.5.5 and Reg.Client 1.2.0.1 
* Reg.Client upgraded from 1.1.5.5 to 1.2.0.1

## External API verification results for all modules

The below section provides details on API test metrics for all modules by executing MOSIP functional automation Framework. All external API test executions were performed at module-level isolation. Each endpoint is tested with the test data and expectations of each test data are mapped to assert the test case.

| **Total** | **Passed** | **Failed** | **Skipped** |
| --------- | ---------- | ---------- | ----------- |
| 3369     | 2596       | 230       | 543         |

**Test Rate: 83.88** with **Pass Rate: 76.25%**

Here is the detailed breakdown of metrics:

|     **Module**     | **Total** | **Passed** | **Failed** | **Skipped** |
| :----------------: | :-------: | :--------: | :--------: | :---------: |
|  ID Repository  |    321    |     282    |      39    |      0      |
|  Resident  |     1132    |     550     |      48     |      534      |
|   Master Data  |    923    |     837    |      81     |      5      |
|  ID Authentication     |    482   |     433   |     45     |      4      |
|  Partner Management   |    511    |     494    |      17     |      0      |

Functional and automation test rig code base branch which is used for the metrics are:

https://github.com/mosip/mosip-functional-tests/tree/release-1.2.0.1

https://github.com/mosip/mosip-automation-tests/tree/release-1.2.0.1


### Testing End-to-End flow(s)

End-to-end flows are a set of stateful test cases that expects the results across multiple modules. The test does not cover the intermediary stages, rather concentrates on the end result for a given data. The test covers both negative scenarios and positive scenarios with real world scenarios. Below are the end-to-end scenarios test metrics by executing MOSIP Automation Framework.

| **Total** | **Passed** | **Failed** | **Skipped** |
| --------- | ---------- | ---------- | ----------- |
| 150       | 84         | 62         | 4         |

**Test Rate:** 97.33% with **Pass Rate:** 56%

### Detailed Test metrics

Below are the detailed test metrics by performing manual/ automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

### Sonar Report

|Repo Name|	Version|	Branch Name|	Coverage|
|----------|--------|-------------|----------|
|admin-services|	1.2.0.1-B1|	release-1.2.0.1|	79.2%|
|admin-ui|	1.2.0.1-B2|	release-1.2.0.1|	0%|
|audit-manager|	1.2.0.1-B2|	release-1.2.0.1|	100%|
|id-authentication|	1.2.0.1-B5|	release-1.2.0.1|	70.9%|
|id-repository|	1.2.0.1-B2|	release-1.2.0.1|	81.2%|
|commons|	1.2.0.1-B2|	release-1.2.0.1|	82.7%|
|packet-manager|	1.2.0.1-B2|	release-1.2.0.1|	0%|
|durian|	1.2.0.1-B2|	release-1.2.0.1|	84.8%|
|keymanager|	1.2.0.1-B3|	release-1.2.0.1|	21.8%|
|partner-management-services|	1.2.0.1-B4|	release-1.2.0.1|	74.4%|
|pre-registration|	1.2.0.1-B2|	release-1.2.0.1|	81%|
|Print|	1.2.0.1-B2|	release-1.2.0.1|	2.4%|
|Registration|	1.2.0.1-B3|	release-1.2.0.1|	81.2%|
|resident-services|	1.2.0.1-B3|	release-1.2.0.1|	77.3%|
|registration-client|	1.2.0.1-B2|	release-1.2.0.1|	73.7%|
|mosip-openid-bridge|	1.2.0.1-B3|	release-1.2.0.1|	81%|
|khazana|	1.2.0.1-B2|	release-1.2.0.1|	2.1%|
|biosdk-client|	1.2.0.1-B3|	release-1.2.0.1|	100%|



