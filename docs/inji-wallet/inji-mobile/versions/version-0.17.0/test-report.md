# Test Report

## Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of&#x20;

* Functionality
* Deployability
* Configurability
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures the readiness of software for use in multiple countries.

The Inji testing scope revolves around the following flows:

* Biometric unlock
* Passcodes unlock
* VC download via MOSIP
* VC download via e-signet
* VC downloads via Sunbird
* Pinning a VC
* Normal VC sharing with VID
* Deleting VC
* Face Auth on Resident's phone with VID
* Multi language support
* Credential registry
* Backup and restore
* Wallet binding
* Deep link navigation
* OpenID4VP
* QR code Login
* Key Management
* Logout

## Test Approach

Persona based approach has been adopted to perform the IV\&V, by simulating test scenarios that resemble real-time implementation.

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following.

* Functionality
* Deployability
* Configurability
* Customizability

The verification methods may differ based on how the need was addressed.

## Verified configuration

Verification is performed on various configurations as mentioned below

* Default configuration - with 1 Lang\


## Feature Health

<figure><img src="../../../../.gitbook/assets/inji_wallet_0.17.0_feature_health_android.png" alt=""><figcaption></figcaption></figure>





<figure><img src="../../../../.gitbook/assets/inji_wallet_0.17.0_feature_health_ios.png" alt=""><figcaption></figcaption></figure>

## Test execution statistics

### Functional test results by modules

Below are the test metrics by performing functional testing using mock MDS and mock ABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. The functional test was performed in combination with individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity schema and respective UI schema configurations.

<p align="center"> </p>

<table><thead><tr><th width="375.52734375" valign="top">Total</th><th valign="top">Passed</th><th valign="top">Failed</th><th valign="top">Skipped (N/A)</th></tr></thead><tbody><tr><td valign="top">3718</td><td valign="top">3359</td><td valign="top">359</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100% With Pass Rate: 90%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

&#x20;

Here is the detailed breakdown of metrics for each module:

&#x20;

<table><thead><tr><th width="460.4140625" valign="top"></th><th valign="top">Test cases</th><th></th></tr></thead><tbody><tr><td valign="top"> </td><td valign="top"></td><td></td></tr><tr><td valign="top"><p> </p><p> </p><p> </p><p>On Android Device</p></td><td valign="top">Total</td><td>1946</td></tr><tr><td valign="top">Passed</td><td valign="top">1768</td><td></td></tr><tr><td valign="top">Failed</td><td valign="top">178</td><td></td></tr><tr><td valign="top">Skipped (N/A)</td><td valign="top">0</td><td></td></tr><tr><td valign="top"><p> </p><p> </p><p> </p><p>On iOS Device</p><p> </p><p> </p></td><td valign="top">Total</td><td>1772</td></tr><tr><td valign="top">Passed</td><td valign="top">1591</td><td></td></tr><tr><td valign="top">Failed</td><td valign="top">181</td><td></td></tr><tr><td valign="top">Skipped (N/A)</td><td valign="top">0</td><td></td></tr></tbody></table>

&#x20;Testing with various device combinations

Below are the test metrics by performing VC Sharing functionality on various device combinations&#x20;



<figure><img src="../../../../.gitbook/assets/inji_wallet_0.17.0_feature_health_combined.png" alt=""><figcaption></figcaption></figure>



<table><thead><tr><th width="381.78515625" valign="top">Total</th><th valign="top">Passed</th><th valign="top">Failed</th><th valign="top">Skipped</th></tr></thead><tbody><tr><td valign="top">192</td><td valign="top">179</td><td valign="top">13</td><td valign="top">0</td></tr><tr><td valign="top">Test Rate: 100% With Pass Rate: 93.22%</td><td valign="top"></td><td valign="top"></td><td valign="top"></td></tr></tbody></table>

&#x20;

### Device and Component Details:

<table data-header-hidden><thead><tr><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Tested with Inji components qa-inji1</td></tr><tr><td valign="bottom">mosipqa/inji-verify-service:0.13.x</td></tr><tr><td valign="bottom">mosipqa/inji-verify-ui:0.13.x</td></tr><tr><td valign="bottom">mosipqa/inji-certify-with-plugins:develop</td></tr><tr><td valign="bottom">mosipid/apitest-mimoto:0.17.1</td></tr><tr><td valign="bottom">mosipqa/mimoto:develop</td></tr><tr><td valign="bottom">mosipqa/inji-web:0.13.x</td></tr><tr><td valign="bottom"></td></tr><tr><td valign="bottom">Tested with components - Released env</td></tr><tr><td valign="bottom">mosipid/apitest-mimoto:0.17.1</td></tr><tr><td valign="bottom">mosipid/apitest-mimoto:0.17.1</td></tr><tr><td valign="bottom">mosipid/inji-verify-service:0.12.3</td></tr><tr><td valign="bottom">mosipid/inji-verify-ui:0.12.3</td></tr><tr><td valign="bottom">mosipid/inji-certify-with-plugins:0.11.0</td></tr><tr><td valign="bottom">mosipid/inji-web:0.12.0</td></tr><tr><td valign="bottom">mosipid/esignet-with-plugins:1.5.1</td></tr><tr><td valign="bottom">mosipid/authentication-service:1.2.1.0</td></tr><tr><td valign="bottom">mosipid/authentication-internal-service:1.2.1.0</td></tr><tr><td valign="bottom">mosipid/authentication-otp-service:1.2.1.0</td></tr><tr><td valign="bottom">mosipid/kernel-notification-service:1.2.0.1</td></tr><tr><td valign="bottom">mosipid/registration-processor-stage-group-1:1.2.1.1</td></tr></tbody></table>

&#x20;

<table data-header-hidden><thead><tr><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom">Devices Used For Testing</td></tr><tr><td valign="bottom"><em>Vivo Y73 with Android 13 BLE 5.0</em></td></tr><tr><td valign="bottom"><em>SS Galaxy A03 core with Android 11 BLE 4.2</em></td></tr><tr><td valign="bottom"><em>iPhone 11 with iOS 18.3.2 BLE 5.0</em></td></tr><tr><td valign="bottom"><em>iPhone 8 with i-OS 16.7 BLE 5.0</em></td></tr><tr><td valign="bottom"><em>iPhone 7 with iphone 15.8 BLE 4.2</em></td></tr><tr><td valign="bottom"><em>Redmi 7A Android 10 BLE 4.2</em></td></tr><tr><td valign="bottom">Redmi note 10 lite Android 13 BLE 5.0</td></tr><tr><td valign="bottom">Redmi K20 pro Android 13 BLE 5.0</td></tr><tr><td valign="bottom"><em>Redmi 6A Android 9 BLE 4.2</em></td></tr></tbody></table>



### Detailed Test Metrics

Below are the detailed test metrics by performing manual testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of tests passed / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all failed test cases. (Number of failed tests / Total number of test cases executed) x 100

### Execution Test Summary

* Well known and wallet metadata story verification was performed against the qa-inji1 env.

Other story verification performed against released env.
