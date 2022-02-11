# Testing Scope
The scope of testing is to verify fitment to the specification from the perspective of  

- Functionality
- Deployability
- Configurability
- Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, Verification scope required comprehensive automation testing for all the MOSIP APIs. An automation Test Rig is created for the same. All MOSIP UIs are reference implementations and these were verified through UI automation Test rig for RegClient and Admin UI.

# Test Approach
Persona based approach has been adopted to perform the IV&V, by simulating test scenarios that resemble a real-time implementation. 

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following. 

- Functionality  
- Deployability  
- Configurability  
- Customizability

The verification methods may differ based on how the need was addressed. 

For regression check, “MOSIP Test Rig” - an automation testing suite - which is indigenously designed and developed for supporting persona based testing. MOSIP Test Rig covers the end to end test execution and reporting. The end to end functional test scenarios are written starting from pre-registration, to creation of packet in registration centre, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutation and combinations of cases being covered. MOSIP Test Rig will be an open source artifact which can also be enhanced and used by countries to validate the SI deliveries before going live. Persona classes include both negative and positive personas. Negative persona classes include users like Bribed Registration Office, Malicious Insider etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

# Verified configuration 
Verification is performed on various configurations as mentioned below 

- Default configuration - with 3 Lang 
- Virtual countries
  - 1 Lang configuration
  - 2 Lang configuration
  - 3 Lang configuration

# Test execution statistics 

## Functional test results by modules
Below are the test metrics by performing functional testing using mockMDS and mockABIS

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
Below section provides details on API test metrics by executing MOSIP functional automation Framework

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
Below are the end-to-end scenarios test metrics by executing MOSIP Automation Framework 

|**Total**|**Passed**|**Failed**|**Skipped**|
| :-: | :-: | :-: | :-: |
|54|53|0|1|
  
Test Rate : 98% with Pass Rate : 100%

## Testing with Real Device 
Below are the test metrics by performing functional testing with Tech5SDK, Syncbyte devices and mockABIS

|**Total**|**Passed**|**Failed**|**Skipped**|
| :-: | :-: | :-: | :-: |
|475|356|55|64|

Test Rate : 86% with Pass Rate : 86%

