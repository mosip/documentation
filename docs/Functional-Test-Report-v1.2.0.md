**31-01-2022**

#Testing Scope
The scope of testing is to verify fitment to the specification from the perspective of  

- Functionality  
- Deployability  
- Configurability  
- Customizability

Verification is performed not only from the end user perspective but also from the System Integrator (SI) point of view. Hence Configurability and Extensibility of the software is also assessed. This ensures readiness of software for use in multiple countries. Since MOSIP is an “API First” product platform, Verification scope required comprehensive automation testing for all the MOSIP APIs. An automation Test Rig is created for the same. All MOSIP UIs are reference implementations and these were verified through UI automation Test rig for RegClient and Admin UI.

#Test Approach
Persona based approach has been adopted to perform the IV&V, by simulating test scenarios that resemble a real-time implementation. 

A Persona is a fictional character/user profile created to represent a user type that might use a product/or a service in a similar way. Persona based testing is a software testing technique that puts software testers in the customer's shoes, assesses their needs from the software and thereby determines use cases/scenarios that the customers will execute. The persona needs may be addressed through any of the following. 

- Functionality  
- Deployability  
- Configurability  
- Customizability

The verification methods may differ based on how the need was addressed. 

For regression check, “MOSIP Test Rig” - an automation testing suite - which is indigenously designed and developed for supporting persona based testing. MOSIP Test Rig covers the end to end test execution and reporting. The end to end functional test scenarios are written starting from pre-registration, to creation of packet in registration centre, processing the packet through the registration processor, generating UIN and authenticating identity using IDA through various permutation and combinations of cases being covered. MOSIP Test Rig will be an open source artifact which can also be enhanced and used by countries to validate the SI deliveries before going live. Persona classes include both negative and positive personas. Negative persona classes include users like Bribed Registration Office, Malicious Insider etc. The needs of positive persona classes must be met, whereas the needs of negative persona classes must be effectively restricted by the software.

# Build Details 

|Title|Description|
| :- | :- |
|Build Tag Version|<TBD>|
|Source Location|<TBD>|
|Biometric Device Vendor |<TBD>|
|ABIS Vendor|<TBD>|

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
|Test Rate : 100%  With Pass Rate : 93%|

Here is the detailed breakdown of metrics

||**Test cases**|
| :-: | :-: |
|<p></p><p></p><p></p><p></p><p>Pre Registration</p>|Total|645|
||Passed|632|
||Failed|13|
||Skipped|0|
|<p></p><p></p><p></p><p></p><p>Registration Client</p>|Total|680|
||Passed|649|
||Failed|31|
||Skipped|0|
|<p></p><p></p><p></p><p></p><p>RegProc</p>|Total|542|
||Passed|494|
||Failed|48|
||Skipped|0|
|<p></p><p></p><p></p><p></p><p>Resident</p>|Total|230|
||Passed|194|
||Failed|36|
||Skipped|0|
|<p></p><p></p><p></p><p></p><p>Admin</p>|Total|796|
||Passed|711|
||Failed|85|
||Skipped|0|
|<p></p><p></p><p></p><p></p><p>IDA</p>|Total|940|
||Passed|910|
||Failed|30|
||Skipped|0|
|<p></p><p></p><p></p><p></p><p>Partner Management</p>|Total|450|
||Passed|434|
||Failed|16|
||Skipped|0|

## External API verification results by modules
Below section provides details on API test metrics by executing MOSIP functional automation Framework

|**Total**|**Passed**|**Failed**|**Skipped**|
| :-: | :-: | :-: | :-: |
|1753|1745|8|0|
|External Endpoints : 444   Tested : 412|
|Test Rate : 92%  With Pass Rate : 99%|

Here is the detailed breakdown of metrics

||**End Points**|**Automated**||**Test cases**|
| :-: | :-: | :-: | :-: | :-: |
|<p></p><p></p><p>Pre Registration</p>|47|36|Total|199|
||||Passed|196|
||||Failed|3|
|<p></p><p></p><p></p><p>ID Repo</p>|21|20|Total|109|
||||Passed|108|
||||Failed|1|
|<p></p><p></p><p></p><p></p><p>MasterData</p>|269|257|Total|896|
||||Passed|896|
||||Failed|0|
|<p></p><p></p><p></p><p></p><p>Resident</p>|17|16|Total|111|
||||Passed|107|
||||Failed|4|
|<p></p><p></p><p></p><p></p><p>IDA</p>|8|8|Total|142|
||||Passed|142|
||||Failed|0|
|<p></p><p></p><p></p><p></p><p>PMS</p>|82|77|Total|296|
||||Passed|296|
||||Failed|0|

## Testing End To End flow(s) 
Below are the end-to-end scenarios test metrics by executing MOSIP Automation Framework 

|**Total**|**Passed**|**Failed**|**Skipped**|
| :-: | :-: | :-: | :-: |
|54|53|0|1|
|Test Rate : 98%  With Pass Rate : 100%|

## Testing with Real Device 
Below are the test metrics by performing functional testing with Tech5SDK, Syncbyte devices and mockABIS

|**Total**|**Passed**|**Failed**|**Skipped**|
| :-: | :-: | :-: | :-: |
|475|356|55|64|
|Test Rate : 86%  With Pass Rate : 86%|

