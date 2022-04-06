# Testing Scope
The scope of testing is to verify fitment to the specification from the perspective of  

- Functionality
- Deployability
- Configurability
- Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, Verification scope required comprehensive automation testing for all the MOSIP APIs. An automation Test Rig is created for the same. All MOSIP UIs are reference implementations and these were verified through UI automation Test rig for Registration Client and Admin UI.

# Test Approach
Persona based approach has been adopted to perform the IV&V, by simulating test scenarios that resemble a real-time implementation. 

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following. 

- Functionality  
- Deployability  
- Configurability  
- Customizability

The verification methods may differ based on how the need was addressed. 

For regression check, “MOSIP Test Rig” - an automation testing suite - which is indigenously designed and developed for supporting persona based testing. MOSIP Test Rig covers the end to end test execution and reporting. The end-to-end functional test scenarios are written starting from pre-registration, to creation of packet in registration centre, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutation and combinations of cases being covered. MOSIP Test Rig will be an open source artifact which can also be enhanced and used by countries to validate the SI deliveries before going live. Persona classes include both negative and positive personas. Negative persona classes include users like Bribed Registration Office, Malicious Insider etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

# Verified configuration 
Verification is performed on various configurations as mentioned below 

- Default configuration - with 3 Languages
- Virtual countries
  - 1 Language configuration
  - 2 Language configuration
  - 3 Language configuration

# Test execution statistics 

## Functional test results by modules

Below are the test metrics by performing functional testing using mockMDS and mockABIS. The process followed was black box testing which based its test cases on the specifications of the software component under test. Functional test was performed in combination of individual module testing as well as integration testing. Test data were prepared inline with the user stories. Expected results were monitored by examining the user interface. The coverage includes GUI testing, System testing, End-To-End flows across multiple languages and configurations. The testing cycle included simulation of multiple identity  schema and respective UI schema configurations.

|**Total**|**Passed**|**Failed**|**Skipped**|
| :-: | :-: | :-: | :-: |
|4283|4024|259|0|

Test Rate : 100%  with Pass Rate : 93%

Here is the detailed breakdown of metrics

|**Module**|**Total**|**Passed**|**Failed**|**Skipped**|
| :-: | :-: | :-: | :-: | :-: |
|Pre Registration|645|632|13|0|
|Registration Client|680|649|31|0|
|Registration Processor|542|494|48|0|
|Resident|230|194|36|0|
|Admin|796|711|85|0|
|ID Authentication|940|910|30|0|
|Partner Management|450|434|16|0|

## External API verification results by modules

Below section provides details on API test metrics by executing MOSIP functional automation Framework. All external API test executions were performed at module level isolation. Each end point is tested with the test data and expectations of each test data are mapped to assert the test case.

|**Total**|**Passed**|**Failed**|**Skipped**|
| :-: | :-: | :-: | :-: |
|1753|1745|8|0|

Total number of external endpoints : 444 and total tested : 414

Test Rate : 93% with Pass Rate : 99%

Here is the detailed breakdown of metrics

|**Module**|**End Points**|**Automated**|**Test cases**|**Passed**|**Failed**|
| :-: | :-: | :-: | :-: | :-: | :-: |
|Pre Registration|47|36|199|196|3|
|ID Repository|21|20|109|108|1|
|Master Data|269|257|896|896|0|
|Resident|17|16|111|107|4|
|ID Authentication|8|8|142|142|0|
|Partner Management|82|77|296|296|0|

## Testing End To End flow(s)

End-To-End flows are a set of stateful test cases that expects the results across multiple modules. The test does not cover the intermediary stages, rather concentrates on the end result for a given data. The test covers both negative scenarios and positive scenarios with real world scenarios. Below are the End-To-End scenarios test metrics by executing MOSIP Automation Framework.

|**Total**|**Passed**|**Failed**|**Skipped**|
| :-: | :-: | :-: | :-: |
|54|53|0|1|
  
Test Rate : 98% with Pass Rate : 100%

## Testing with Real Device 

Below are the test metrics by performing functional testing with Tech5 SDK, Syncbyte devices and combination of real and mockABIS based on the scenario being tested. The test cases cover the real device/SDK/ABIS integration points. The responses from the system are validated at the integration points and results are asserted at the end of the flow. The logical endpoint differs depending on the test scenario being executed. These are executed with the help of the MOSIP supported partners.

|**Total**|**Passed**|**Failed**|**Skipped**|
| :-: | :-: | :-: | :-: |
|475|356|55|64|

Test Rate : 86% with Pass Rate : 86%

## Detailed Test metrics

Below are the detailed test metrics by performing manual/automation testing. The project metrics are derived from Defect density, Test coverage, Test execution coverage, test tracking and efficiency. 

The various metrics that assist in test tracking and efficiency are as follows:

* Passed Test Case Coverage: It measures the percentage of passed test cases.(Number of passed tests / Total number of tests executed) x 100
* Failed Test Case Coverage: It measures the percentage of all the failed test cases. (Number of failed tests / Total number of test cases executed) x 100

You can find all our test cases executed in MOSIP [here: (mosip/test-management)](https://github.com/mosip/test-management/tree/1.2.0/1.2.0).

