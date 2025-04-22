# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of

* Functionality
* Deployability
* Configurability
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform.

Testing scope has been focused on the following features:\\

* Inji certify Docker compose testing (Removal of artifactory dependency – Data provider CSV plugin and mdoc plugin) which covered Farmer Use case
* Esignet compatibility with 1.5.1 version and 1.4.1 version
* Insurance, Mock (Issuance and Data provider (Postgres plugin)), MosipId which covered Land registry, school use case also
* Integration with Inji Web and Inji verify
* Keycloak integration with Injicertify
* Ed25519 signing of VC request – Scope from automation
* Support of ECC k1 verification signature

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble real-time implementation.

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

## Feature Health

<figure><img src="../../../.gitbook/assets/ic-0-11-0-tr-1.png" alt="" width="188"><figcaption></figcaption></figure>

Note:

1. For keycloak integration – keycloak is pointing to dev2 env
2. For Esignet compatibility
   1. eSignet 1.5.1 from dev2 env
   2. eSignet 1.4.1 from released env

## Test execution statistics

### Functional test results

Below are the test metrics by performing functional testing. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, and End-To-End flows across multiple configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">NA</td></tr><tr><td valign="top">643</td><td valign="top">612</td><td valign="top">28</td><td valign="top">2</td></tr><tr><td valign="top">Test Rate: 99%, With Pass Rate: 95% and Fail Rate: 4.35%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

Automation Statistics

* Sunbird use case

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Ignored</td><td valign="top">Known issues</td></tr><tr><td valign="top">225</td><td valign="top">61</td><td valign="top">0</td><td valign="top">155</td><td valign="top">9</td></tr><tr><td valign="top">Test Rate: 100%, With Pass Rate: 96% and Fail Rate: 4%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

* Mock Use case

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Ignored</td><td valign="top">Known issues</td></tr><tr><td valign="top">225</td><td valign="top">47</td><td valign="top">0</td><td valign="top">169</td><td valign="top">9</td></tr><tr><td valign="top">Test Rate: 100%, With Pass Rate: 96% and Fail Rate: 4%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

* Mock (Data provider) Use case

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Ignored</td><td valign="top">Known Issues</td></tr><tr><td valign="top">225</td><td valign="top">79</td><td valign="top">0</td><td valign="top">137</td><td valign="top">9</td></tr><tr><td valign="top">Test Rate: 100%, With Pass Rate: 96% and Fail Rate: 4%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

{% hint style="info" %}
**Note** - Ignored scenarios are Not related to particular use case and 9 scenarios are known issues can be tracked from INJICERT-681, Mosip id use case is being ignored from Automation for the current release.
{% endhint %}

### Detailed Test Metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of tests passed / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

## Tested with Components

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Module/Repo</td><td valign="top">Image</td><td valign="top">POM version</td><td valign="top">Dependent artifactID</td><td valign="top">Comments</td></tr><tr><td valign="top">Inji-certify-mosipid</td><td valign="top">mosipqa/inji-certify-with-plugins:0.11.x</td><td valign="top"></td><td valign="top">Digital-credential-plugin - 0.4.0</td><td valign="top"></td></tr><tr><td valign="top">Inji-certify-mock</td><td valign="top">mosipqa/inji-certify-with-plugins:0.11.x</td><td valign="top"></td><td valign="top">Digital-credential-plugin - 0.4.0</td><td valign="top"></td></tr><tr><td valign="top">Inji-certify-Insurance</td><td valign="top">mosipqa/inji-certify-with-plugins:0.11.x</td><td valign="top"></td><td valign="top">Digital-credential-plugin - 0.4.0</td><td valign="top"></td></tr><tr><td valign="top">Inji-certify- landregistry</td><td valign="top">mosipqa/inji-certify-with-plugins:0.11.x</td><td valign="top"></td><td valign="top">Digital-credential-plugin - 0.4.0</td><td valign="top"></td></tr><tr><td valign="top">Inji-certify- academic</td><td valign="top">mosipqa/inji-certify-with-plugins:0.11.x</td><td valign="top"></td><td valign="top">Digital-credential-plugin - 0.4.0</td><td valign="top"></td></tr><tr><td valign="top">Mdoc-mdl</td><td valign="top">mosipqa/inji-certify-with-plugins:0.11.x</td><td valign="top"></td><td valign="top">Digital-credential-plugin - 0.4.0</td><td valign="top"></td></tr><tr><td valign="top">Inji-config</td><td valign="top">Releasing from release-0.8.x branch</td><td valign="top"></td><td valign="top">Digital-credential-plugin - 0.4.0</td><td valign="top"><a href="https://github.com/mosip/inji-config/tree/release-0.8.x">https://github.com/mosip/inji-config/tree/release-0.8.x</a></td></tr><tr><td valign="top">Keymanager</td><td valign="top"></td><td valign="top">1.3.0-beta.2</td><td valign="top"></td><td valign="top">Will be released as 1.3.0-beta.2</td></tr><tr><td valign="top">eSignet</td><td valign="top"><p>eSignet-1.4.1</p><p>eSignet-1.5.1</p></td><td valign="top"></td><td valign="top"></td><td valign="top"><p>1.5.1 eSignet from dev2 env</p><p>1.4.1 eSignet from released env</p></td></tr></tbody></table>
