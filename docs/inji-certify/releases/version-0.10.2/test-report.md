# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of

* Functionality
* Deployability
* Configurability
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries. Since MOSIP is an "API First" product platform.

Testing scope has been focused around the below features

* Docker compose testing for Mock Data Provider plugin (csv), Framer use case - 1.1 & 2.0 VC
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

Verification is performed on configurations as mentioned below

* Default configuration
  * English

**Note:**

1. Docker setup - Authorization endpoints pointing to **collab.mosip.net**

## Test execution statistics

### Automation Statistics

#### Sunbird use case

| **Total** | **Passed** | **Failed** | **Ignored** |
| --------- | ---------- | ---------- | ----------- |
| 129       | 53         | 0          | 67          |

Test Rate: 100%,\
With Pass Rate: 96% and Fail Rate: 0%

#### Mock use case

| **Total** | **Passed** | **Failed** | **Ignored** |
| --------- | ---------- | ---------- | ----------- |
| 129       | 41         | 0          | 79          |

Test Rate: 100%,\
With Pass Rate: 100% and Fail Rate: 0%



#### Mosipid use case

| **Total** | **Passed** | **Failed** | **Ignored** |
| --------- | ---------- | ---------- | ----------- |
| 129       | 26         | 0          | 94          |

Test Rate: 100%,\
With Pass Rate: 100% and Fail Rate: 0%

Ignored scenarios are not related to particular use case and 9 scenarios are known issues that can be tracked in INJICERT-681.

## Detailed Test metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of tests passed / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100
