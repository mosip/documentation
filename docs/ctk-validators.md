
## SBI Validators

| Name   |      Description      |  Test with Mock SBI |
|-----------------|-------------------|---------------|
| `SchemaValidator` | Validates the response for mandatory attributes and correct values. | |
| `SignatureValidator`| Validates the response signature. | |
| `ResponseMisMatchValidator`| Validates the response to check if bioCount and segments match the ones set in request. | |
| `KeyRotationValidator`| Validator to validate the device key rotation. | To verify Key Rotation testcases, we have to generate 3 set of device certificates `device.p12`.<br>• To generate device.p12 certificate, please follow the instructions given in [link](https://mosip.atlassian.net/l/cp/9u8PqrGi)<br>• In Compliance Tool kit, create a collection only with Key Rotation test case and Run Mock MDS.<br>• In CTK select respective device by performing `Scan Device` operation and run `key rotation` testcase.<br>• Stop the Mock MDS and rotate/change second Device.p12 in Keys folder.<br>• Relaunch mock MDS and select `Continue` on CTK. Now CKT saved second device key information.<br>• When CTK asks to rotate the device key, then Stop the Mock MDS and rotate/change third Device.p12 in Keys folder.<br>• Relaunch mock MDS and select `Continue` on CTK. Now CKT saved third device key information.<br>_Note_: _Rotate the device key in the MDS/SBI as many times as setup in project configuration_<br>CTK will provide a result of the overall key rotation testcase once the testcase has been run.|
| `TimeoutValidator` | Validates if response is received within the given timeout period or not. | To test **Timeout** testcases with Mock SBI:<br>Call POST API: `http://127.0.0.1:4501/admin/delay`<br>With request body,<br>{<br>    "type": "Biometric Device",<br> "delay": "10000",<br>   "method": [<br>     "RCAPTURE"]<br>}<br>To test **Force Capture** testcases with Mock SBI:<br>Call POST API: `http://127.0.0.1:4501/admin/delay`<br>With request body,<br>{<br>   "type": "Biometric Device",<br> "delay": "9500",<br>    "method": [<br>     "RCAPTURE"]<br>}<br>Please try to increase the delay gradually to execute the testcase successfully.|
| `ISOStandardsValidator` | Validates the `bioValue` in response of `rcapture` is as per ISO standards ISO19794-4:2011. | ISO standard validation with proper **ISO** file by using mock MDS:<br>•	Under an SBI project, create a collection by selecting ISO standard testcases.<br>•	Run the mock MDS/SBI with standard ISO files. Perform a Scan and select the appropriate device.<br>•	Run the ISO collection and verify the result status. ISO standard validation should be success.<br>ISO standard validation with **Non-ISO** files by using mock MDS:<br>•	Under an SBI project, create a collection by selecting ISO standard testcases.<br>• Run the mock MDS/SBI with Non-ISO standard files (In Default folder replace standard ISO file with Non-ISO file). Perform a Scan and select the appropriate device.<br>•	Run the ISO collection and verify the result status. ISO standard validation should be fail.|
| `BiometricsQualityCheckValidator` | Checks the quality of biometrics using all configured SDK services. | Biometrics quality check validation with **good quality** biometric:<br>•	In compliance-toolkit-default.properties, configure Bio SDK service and health check URLs under `mosip.toolkit.sbi.qualitycheck.finger.sdk.urls` property. Restart CTK pods/services.<br>Example:<br> ```mosip.toolkit.sbi.qualitycheck.finger.sdk.urls=[{"name": "Mock SDK qa-1201-b2 Env","url": "https://api-internal.qa-1201-b2.mosip.net/biosdk-service","healthUrl": "https://api-internal.qa-1201-b2.mosip.net/biosdk-service/actuator/health", "includeInResults":true}]```<br>•	Add Biometric quality testcase in CTK for all modalities (FP, Iris and Face for both Reg and Auth).<br>•	Run Mock MDS and increase biometric quality score to get more than threshold value.<br>•	In CTK scan the biometric devices and run the Biometric quality check testcases.<br>•	After testcase execution is done, please check testcase result status. Biometric quality check validator should pass.<br>Biometrics quality check validation with **poor quality**biometric:<br>•	Change the biometric quality score to less than the threshold value and run the Biometric quality check testcases.<br>•	After testcase execution is done, please check testcase result status. Biometric quality check validator should fail because quality score is less than threshold.|
| `TimeCheckValidator` | Validates if response is received within the given timestamp interval or not. | |

## SDK Validators
| Name   |      Description      |  Test with Mock SDK |
|-----------------|-------------------|---------------|
| `SchemaValidator`| Validates if response has all mandatory attributes and they have allowed values. | |
| `QualityCheckValidator`| Checks the quality score of the modality. | |
| `QualityCheckInvalidDataValidator`| Validates the status code for invalid data. | |
| `QualityCheckNoDataValidator`| Validates the status code for no data. | |
| `MatchValidator`| Validates if biomterics match for the modality. | |
| `MatchInvalidDataValidator`| Validates the status code for invalid data. | |
| `MatchNoDataValidator`| Validates the status code for no data. | |
| `MatchMultipleGalleryValidator`| Validates if biomterics match for the modality. | |
| `ExtractTemplateValidator`| Validates if input BDB data present in the Probe for the modality is valid. | |
| `ExtractTemplateInvalidDataValidator`| Validates if input BDB data present in the Probe for the modality is valid. | |
| `ExtractTemplateNoInputDataValidator`| Validates if no input BDB data present in the Probe. | |
| `ConvertDataValidator`| Validates the input BDB data present in the Probe. | |
| `ConvertInvalidDataValidator`| Validates if input BDB data present in the Probe for the modality is valid. | |
| `ConvertNoInputDataValidator`| Validates if no input BDB data present in the Probe. | |

## ABIS Validators
| Name   |      Description      |  Test with Mock ABIS |
|-----------------|-------------------|---------------|
| `SchemaValidator`| Validates if response has all mandatory attributes and they have allowed values. | |
| `ExpectedFailureReasonValidator` | Validates the failure reason to match the expected value | |
| `IdentifyDuplicateFoundValidator` | Validates the count of duplicates found by ABIS for the given referenceId | |
| `ExpectedDuplicateCountValidator` | Validates the duplicates found to match the expected value | |