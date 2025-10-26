# Test Report

### Testing Scope

The scope of testing is to verify fitment to the specification from the perspective of &#x20;

* Functionality &#x20;
* Deployability &#x20;
* Configurability &#x20;
* Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures the readiness of software for use in multiple countries.

The Inji testing scope revolves around the following flows:\


* Biometric unlock&#x20;
* Passcodes unlock&#x20;
* VC download via MOSIP&#x20;
* VC download via e-signet&#x20;
* VC downloads via Sunbird&#x20;
* Pinning a VC&#x20;
* Normal VC sharing with VID
* Deleting VC&#x20;
* Face Auth on Resident's phone with VID&#x20;
* Multi language support
* Credential registry&#x20;
* Backup and restore&#x20;
* Wallet binding&#x20;
* Deep link navigation
* OpenID4VP
* QR code Login
* Key Management
* Credential Offer
* SD JWT VC download
* SVG VC
* Logout&#x20;

### Test Approach

Persona-based approach has been adopted to perform the IV\&V by simulating test scenarios that resemble real-time implementation.&#x20;

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona-based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software, and thereby determines use cases/scenarios that the customers will execute. The persona's needs may be addressed through any of the following.&#x20;

* Functionality &#x20;
* Deployability &#x20;
* Configurability &#x20;
* Customizability

The verification methods may differ based on how the need was addressed.&#x20;

### Verified configuration&#x20;

Verification is performed on various configurations as mentioned below&#x20;

* Default configuration - with 1 Lang • Feature Health

On Android Device:

<figure><img src="../../../../.gitbook/assets/image (14).png" alt=""><figcaption></figcaption></figure>

On iOS Device:

<figure><img src="../../../../.gitbook/assets/image (15).png" alt=""><figcaption></figcaption></figure>

### Test execution statistics&#x20;

#### Functional test results by modules

Below are the test metrics by performing functional testing using mock MDS and mock ABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. The functional test was performed in combination with individual module testing as well as integration testing. Test data were prepared in line with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included the simulation of multiple identity schema and respective UI schema configurations.

| **Total** | **Passed** | **Failed** | **Skipped (N/A)** |
| --------- | ---------- | ---------- | ----------------- |
| 4068      | 3659       | 409        | 0                 |

**Test Rate:** 100%  **Pass Rate:** 89.94%\


Here is the detailed breakdown of metrics for each module:

| **Platform**          | **Test Case Type** | **Count** |
| --------------------- | ------------------ | --------- |
| **On Android Device** | Total              | 2118      |
|                       | Passed             | 1918      |
|                       | Failed             | 200       |
|                       | Skipped (N/A)      | 0         |
| **On iOS Device**     | Total              | 1950      |
|                       | Passed             | 1741      |
|                       | Failed             | 209       |
|                       | Skipped (N/A)      | 0         |

#### API test rig results:

Below are the test metrics for Mimoto API Test rig:

| **Total** | **Passed** | **Failed** | **Known Issue / Ignored** |
| --------- | ---------- | ---------- | ------------------------- |
| 316       | 279        | 0          | KI-4 and Ignored-33       |

**Test Rate:** 88%  **Pass Rate:** 100%

#### **VC Verifier Library result:**

Below are the test metrics for VC Verifier:

| **Total** | **Passed** | **Failed** | **Known Issue / Ignored** |
| --------- | ---------- | ---------- | ------------------------- |
| 122       | 85         | 37         | 0                         |

**Test Rate:** 100%  **Pass Rate:** 69.67%\


### Testing with various device combinations&#x20;

Below are the test metrics for performing the VC Sharing functionality on various device combinations

<figure><img src="../../../../.gitbook/assets/image (16).png" alt=""><figcaption></figcaption></figure>

<table data-header-hidden><thead><tr><th valign="top"></th><th valign="top"></th><th valign="top"></th><th valign="top"></th></tr></thead><tbody><tr><td valign="top">Total</td><td valign="top">Passed</td><td valign="top">Failed</td><td valign="top">Skipped</td></tr><tr><td valign="top">240</td><td valign="top">220</td><td valign="top">20</td><td valign="top">0</td></tr></tbody></table>

Test Rate: 100% With Pass Rate: 91.66%

#### Device and Component Details:

<table data-header-hidden><thead><tr><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom"><strong>Devices Used For Testing</strong></td></tr><tr><td valign="bottom">Vivo Y73 with Android 13 BLE 5.0</td></tr><tr><td valign="bottom">SS Galaxy A03 core with Android 11 BLE 4.2</td></tr><tr><td valign="bottom">iPhone 11 with iOS 18.3.2 BLE 5.0</td></tr><tr><td valign="bottom">iPhone 7 with iphone 15.8 BLE 4.2</td></tr><tr><td valign="bottom">Redmi 7A Android 10 BLE 4.2</td></tr><tr><td valign="bottom">Redmi 6A Android 9 BLE 4.2</td></tr><tr><td valign="bottom">Techno POVA 6 NEO - Android 14 BLE 5.0</td></tr><tr><td valign="bottom">iTel - Android 14 BLE 5.0</td></tr><tr><td valign="bottom">iPhone 14 - iOS 18.6.2 BLE 5.3</td></tr><tr><td valign="bottom">OPPO A59 5G - Android 13 BLE 5.3</td></tr><tr><td valign="bottom">ONE PLUS 12R - ANDROID 15 BLE 5.3</td></tr><tr><td valign="bottom">Xiaomi RedMi NOTE 13 PRO - Android 15 BLE 5.2</td></tr><tr><td valign="bottom">Infinix NOTE 50X 5G - ANDROID 15 BLE 5.4</td></tr><tr><td valign="bottom">iPhone 13 - iOS 18.6.2 BLE 5.0</td></tr></tbody></table>

\


<table data-header-hidden><thead><tr><th valign="bottom"></th></tr></thead><tbody><tr><td valign="bottom"><strong>Tested with Inji components qa-inji1</strong></td></tr><tr><td valign="bottom">mosipqa/inji-verify-service:0.15.x</td></tr><tr><td valign="bottom">mosipqa/inji-verify-ui:0.15.x</td></tr><tr><td valign="bottom">mosipqa/inji-certify-with-plugins:0.12.x</td></tr><tr><td valign="bottom">mosipqa/apitest-mimoto:0.19.x</td></tr><tr><td valign="bottom">mosipqa/mimoto:develop</td></tr><tr><td valign="bottom">mosipqa/inji-web:develop</td></tr><tr><td valign="bottom"><strong>Tested with components - Released env</strong></td></tr><tr><td valign="bottom">mosipid/mimoto:0.19.0</td></tr><tr><td valign="bottom">mosipid/apitest-mimoto:0.19.0</td></tr><tr><td valign="bottom">mosipid/inji-certify-with-plugins:0.12.1</td></tr><tr><td valign="bottom">mosipid/esignet-with-plugins:1.6.2</td></tr><tr><td valign="bottom">mosipid/authentication-service:1.2.1.0</td></tr><tr><td valign="bottom">mosipid/authentication-internal-service:1.2.1.0</td></tr><tr><td valign="bottom">mosipid/authentication-otp-service:1.2.1.0</td></tr><tr><td valign="bottom">mosipid/kernel-notification-service:1.2.0.1</td></tr><tr><td valign="bottom">mosipid/registration-processor-stage-group-1:1.2.1.1</td></tr></tbody></table>

### Detailed Test Metrics

Below are the detailed test metrics by performing manual testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency.&#x20;

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Cases Coverage: It measures the percentage of passed test cases. (Number of tests passed / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all failed test cases. (Number of failed tests / Total number of test cases executed) x 100
