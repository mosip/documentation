# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of

* Functionality
* Deployability
* Configurability
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software are also assessed. This ensures the readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform.

Testing scope has been focused on the below features:

* Inji certify Docker compose testing(VCI segregations)
* Docker compose testing for Insurance and Mock ID use case
* Inji certify - Insurance use case using namespace
* Inji certify - Mock IDA use case using namespace
* Inji certify - MOSIP ID use case using namespace(verified using idrepo UIN/VIDs only)
* Integration with INJI Web

## Swaggers links

[https://injicertify-mosipid.qa-inji.mosip.net/v1/certify/swagger-ui/index.html#/](https://injicertify-mosipid.qa-inji.mosip.net/v1/certify/swagger-ui/index.html#/)

[https://injicertify-mock.qa-inji.mosip.net/v1/certify/swagger-ui/index.html#/](https://injicertify-mock.qa-inji.mosip.net/v1/certify/swagger-ui/index.html#/)

[https://injicertify-insurance.qa-inji.mosip.net/v1/certify/swagger-ui/index.html#/](https://injicertify-insurance.qa-inji.mosip.net/v1/certify/swagger-ui/index.html#/)

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble a real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software, and thereby determines use cases/scenarios that the customers will execute. The persona's needs may be addressed through any of the following.

* Functionality
* Deployability
* Configurability
* Customizability

The verification methods may differ based on how the need was addressed.

## Verified configuration

Verification is performed on configurations as mentioned below

* Default configuration
  * English

## Feature Health



<figure><img src="../../../.gitbook/assets/inji_certify_0.9.0_tr_feature_health.png" alt=""><figcaption></figcaption></figure>



{% hint style="info" %}
**Note**:&#x20;

* UIN’s/VID’s generated with ID Repo were only used in verifying MOSIP ID, Reg-Client UIN were not verified.
* The Sunbird registry was pointing to Sunbird dev.
{% endhint %}

## Test execution statistics

### Functional test results

Below are the test metrics by performing functional testing. The process followed was black box testing which based its test cases on the specifications of the software component under test. The functional test was performed in combination with individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple configurations. The testing cycle included the simulation of multiple identity schema and respective UI schema configurations.

| **Total**                                               | **Passed** | **Failed** | **NA** |
| ------------------------------------------------------- | ---------- | ---------- | ------ |
| 311                                                     | 303        | 6          | 0      |
| Test Rate: 100%, With Pass Rate: 98% and Fail Rate : 2% |            |            |        |

### Detailed Test metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking, and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

### Stories Tested

<table><thead><tr><th>Details</th><th width="134">Stories Tested</th><th>Test Cases</th><th></th><th></th><th></th><th></th><th></th></tr></thead><tbody><tr><td>Total</td><td>Total</td><td>With Stories</td><td>w/o Stories</td><td>Pass</td><td>Fail</td><td>Not tested</td><td></td></tr><tr><td>Inji-Certify</td><td>4</td><td>311</td><td>311</td><td>0</td><td>305</td><td>6</td><td>0</td></tr><tr><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td><td> </td></tr><tr><td>Total</td><td>4</td><td>311</td><td>311</td><td>0</td><td>305</td><td>6</td><td>0</td></tr></tbody></table>

<table data-header-hidden><thead><tr><th width="696">Functional Testing - Stories Verified : 4</th></tr></thead><tbody><tr><td>Test cases : 311      Passed : 305     Failed : 6    Skipped : 0</td></tr><tr><td>Test Rate : 100%     With Pass Rate : 98%</td></tr></tbody></table>

### API + Docker compose testing

<table><thead><tr><th width="332">API +Docker compose testing</th><th></th><th></th><th></th><th></th></tr></thead><tbody><tr><td>Story</td><td>Test Results</td><td></td><td></td><td></td></tr><tr><td>INJICERT-41</td><td>85</td><td>83</td><td>2</td><td>0</td></tr><tr><td>INJICERT-13</td><td>72</td><td>71</td><td>1</td><td>0</td></tr><tr><td>INJICERT_186</td><td>72</td><td>70</td><td>2</td><td>0</td></tr><tr><td>INJICERT-189</td><td>82</td><td>81</td><td>1</td><td>0</td></tr></tbody></table>



## Tested with Components

| **Module/Repo**        | **Image**                             | **POM version** | **Dependent artifactID**          | **Comments**                                                                |
| ---------------------- | ------------------------------------- | --------------- | --------------------------------- | --------------------------------------------------------------------------- |
| Inji-certify-mosipid   | mosipqa/inji-certify:0.9.x            |                 | Digital-credential-plugin - 0.2.0 |                                                                             |
| Inji-certify-mock      | mosipqa/inji-certify:0.9.x            |                 | Digital-credential-plugin - 0.2.0 |                                                                             |
| Inji-certify-Insurance | mosipqa/inji-certify:0.9.x            |                 | Digital-credential-plugin - 0.2.0 |                                                                             |
| Inji-config            | mosipqa/config-server:1.1.2           |                 |                                   | [**v0.2.0**](https://github.com/mosip/inji-config/tree/v0.2.0)              |
| Keymanager             |                                       | 1.3.0-Snapshot  |                                   | [**v1.3.0-beta.1**](https://github.com/mosip/keymanager/tree/v1.3.0-beta.1) |
| Commons                |                                       | 1.3.0-Snapshot  |                                   | [**v1.3.0-beta.1**](https://github.com/mosip/commons/tree/v1.3.0-beta.1)    |
| Artifactory-certify    | mosipqa/artifactory-server:0.9.0-INJI |                 |                                   |                                                                             |
| eSignet                | eSignet-1.4.0                         |                 |                                   |                                                                             |



## Browser Versions Used For Testing

| Browser Versions Used For Testing |
| --------------------------------- |
| chrome: Version 127.0.6533.89     |
| Mac : version 16.6                |



The Github link for the xls file is **here**.
