# How to add more test cases

Compliance Tool Kit (CTK) is an online portal that can be used by MOSIP partners to test the compliance of their product developed as per the specifications (specs) published by MOSIP. CTK currently supports compliance verification of SBI, SDK and ABIS specifications.

## What are the CTK test cases?

To verify the compliance of the partner software with MOSIP specifications, MOSIP has created predefined test cases for the type of specification.

* Each test case in CTK runs on a given method of the specs. For example, there will be a test case for the `device` method of SBI specs.
* Each test case in CTK defines the attributes required to create the request to be sent to the partner application.
* Each test case also defines the response expected from the partner application.
* Each test case also defines the validators to be run in the response received.
* Each validator also performs a predefined check on the response.
* If all validations are successful, the test case is considered as passed, otherwise, the test case fails.

Partners can use CTK to run these test cases to verify if their implementation adheres to the MOSIP’s specs or not.

These test cases are defined in JSON format and saved in the CTK database.

## Sample SBI test case

This test case is for verifying the **check device discovery** endpoint of an SBI. This test case is available for both `Registration` and `Auth` SBI projects and all `device type` and `sub type` combinations.

```
{
   "testCaseType": "SBI",
   "testName": "Discover device",
   "testId": "SBI1000",
   "specVersion": "0.9.5",
   "testDescription": "This test case verifies schema and signature of the device discovery interface",
   "isNegativeTestcase": false,
   "methodName": [
      "device"
   ],
   "requestSchema": [
      "DiscoverRequestSchema"
   ],
   "responseSchema": [
      "DiscoverResponseSchema"
   ],
   "validatorDefs": [
      [
         {
            "name": "SchemaValidator",
            "description": "Validates the response for mandatory attributes and  values"
         },
         {
            "name": "SignatureValidator",
            "description": "Validates the response signature"
         }
      ]
   ],
   "otherAttributes": {
      "purpose": [
         "Registration",
         "Auth"
      ],
      "biometricTypes": [
         "Finger",
         "Iris",
         "Face"
      ],
      "deviceSubTypes": [
         "Slap",
         "Single",
         "Double",
         "Full face"
      ],
      "segments": [
         
      ],
      "exceptions": [
         
      ],
      "requestedScore": "",
      "bioCount": "",
      "deviceSubId": ""
   }
}
```

## Sample SDK test case

This test case is for verifying the **quality of face biometrics** (if it is above the acceptable threshold). This test case will be available for `Face modality` only and for the `Quality Check project`.

```
{
   "testCaseType": "SDK",
   "testName": "Good face quality",
   "testId": "SDK2001",
   "testDescription": "This test case verifies the biometrics for the face to be of good quality.",
   "specVersion": "0.9.0",
   "isNegativeTestcase": false,
   "methodName": [
      "check-quality"
   ],
   "requestSchema": [
      "CheckQualityRequestSchema"
   ],
   "responseSchema": [
      "CheckQualityResponseSchema"
   ],
   "validatorDefs": [
      [
         {
            "name": "SchemaValidator",
            "description": "Validates if the response has all mandatory attributes and they have allowed values"
         },
         {
            "name": "QualityCheckValidator",
            "description": "Checks the quality score of the modality"
         }
      ]
   ],
   "otherAttributes":{
      "modalities":[
         "face"
      ],
      "sdkPurpose":[
         "Check Quality"
      ]
   }
}
```

## Sample ABIS test case

This test case is for verifying the **insert** endpoint of an ABIS. This test case is available for all ABIS projects.

```
{
   "testCaseType": "ABIS",
   "testName": "Insert one person\"s biomterics in ABIS",
   "testId": "ABIS3000",
   "specVersion": "0.9.0",
   "testDescription": "Insert one person\"s biomterics in ABIS",
   "isNegativeTestcase": false,
   "methodName": [
      "insert"
   ],
   "requestSchema": [
      "InsertRequestSchema"
   ],
   "responseSchema": [
      "InsertResponseSchema"
   ],
   "validatorDefs": [
      [
         {
            "name": "SchemaValidator",
            "description": "Validates if response has all mandatory attributes and they have allowed values"
         }
      ]
   ],
   "otherAttributes": {
      "bulkInsert": false,
      "insertCount": "1"
   }
}
```

## Attributes in a test case

As can be seen from the above samples, few attributes are common across the test cases for SBI, SDK and ABIS while few are optional. Below is the list of each attribute and its use.

| Name                                  | Type     | Description                                                                                                                                                                                                                                                                                                                                                                                                           | Allowed Values                                                                                                                                                                                                    |
| ------------------------------------- | -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `testCaseType`                        | Required | Type of test case                                                                                                                                                                                                                                                                                                                                                                                                     | SBI / SDK / ABIS                                                                                                                                                                                                  |
| `testName`                            | Required | Name of test case                                                                                                                                                                                                                                                                                                                                                                                                     |                                                                                                                                                                                                                   |
| `testId`                              | Required | Unique ID for test case                                                                                                                                                                                                                                                                                                                                                                                               | SBI10XX, SDK20XX                                                                                                                                                                                                  |
| `specVersion`                         | Required | Spec version being tested                                                                                                                                                                                                                                                                                                                                                                                             | <p>0.9.5/1.0.0 for SBI,<br>0.9.0 for SDK</p>                                                                                                                                                                      |
| `testDescription`                     | Required | Test description. It can also include the steps to execute the test case.                                                                                                                                                                                                                                                                                                                                             |                                                                                                                                                                                                                   |
| `isNegativeTestcase`                  | Required | Indicates if the validator is for a positive or a negative scenario.                                                                                                                                                                                                                                                                                                                                                  | E.g.: for a bad face quality test, we expect a low score which is a negative scenario, so the validator should mark the test case as passed on receiving low score                                                |
| `inactive`| Optional | Indicates that the test case is not active.| E.g.: The testcase SDK2026 is marked as inactive. So the user is unable to obtain this testcase.|
| `inactiveForAndroid`| Optional | Indicates that the test case is not active in CTK Android App.| E.g.: The testcase SBI1070 is marked as inactiveForAndroid. So the user is unable to obtain this testcase on android app.|
| `methodName`                          | Required | <p>The name of the method to be invoked for the test case.<br>It accepts an array.<br><br>For SBI, this array will have only one value.<br><br>For SDK, in case of a combination test case you can give 2 method names.<br>E.g.: ["extract-template", "check-quality"]</p>                                                                                                                                            | device(SBI), info(SBI), capture(SBI), rcapture(SBI), stream(SBI), insert(ABIS), identify(ABIS), delete(ABIS), init(SDK), check-quality(SDK), match(SDK), extract-template(SDK), convert-format(SDK), segment(SDK) |
| `requestSchema`                       | Required | <p>Name of the JSON schema file which will be used to validate the HTTP request. This HTTP request will be used to invoke the HTTP method defined in the spec.<br>It accepts an array.<br><br>For SBI, this array will have only one value.<br><br>For SDK, in case of a combination test case you can give 2 request schema names.<br>E.g: ["ExtractTemplateRequestSchema", "MatchRequestSchema"]</p>                | <p>The request schema JSON files are saved in the MINIO in the following folder structure.<br>E.g.: compliance-toolkit/schemas/sbi/0.9.5/ DiscoverRequestSchema.json</p>                                          |
| `responseSchema`                      | Required | <p>Name of the JSON schema file which will be used to validate the HTTP response. This is the HTTP response that we will receive after invoking the HTTP method.<br>It accepts an array.<br><br>For SBI, this array will have only one value<br><br>For SDK, in case of a combination test case you can give 2 request schema names.<br>E.g.: ["ExtractTemplateResponseSchema", "MatchResponseSchema"]</p>            | <p>The response schema JSON files are saved in the MINIO in the following folder structure.<br>E.g.: compliance-toolkit/schemas/sbi/0.9.5/ DiscoverResponseSchema.json</p>                                        |
| `validatorDefs`                       | Required | <p>Names of Validators that are to be invoked to run various validations on the response.<br>It accepts an array of arrays.<br><br>Each array is a list of validators to be applied to the response of the corresponding method in the test case.<br><br>In the case of SBI, it is an array with a single array.<br><br>In the case of SDK, for a combination test case it can be an array with a list of arrays.</p> | Validators are available in the folder: `compliance-toolkit\src\main\java\io\mosip\compliance\toolkit\validators`                                                                                                 |
| `validatorDefs.name`                  | Required | Name of the Java class which implements the `BaseValidator.java interface`.                                                                                                                                                                                                                                                                                                                                           | <p>Must implement method<br><code>ValidationResultDto validateResponse(ValidationInputDto responseDto)</code></p>                                                                                                 |
| `validatorDefs.description`           | Required | <p>Description of the validations performed.<br>These are shown in UI along with the test case description.</p>                                                                                                                                                                                                                                                                                                       |                                                                                                                                                                                                                   |
| `otherAttributes`                     | Optional | Extra attributes about a test case                                                                                                                                                                                                                                                                                                                                                                                    |                                                                                                                                                                                                                   |
| `otherAttributes.purpose`             | SBI      | <p>Valid only for SBI test case.<br>It accepts an array.<br>The project purpose is used to filter the test cases with matching purposes.</p>                                                                                                                                                                                                                                                                          | Registration, Auth                                                                                                                                                                                                |
| `otherAttributes.biometricTypes`      | SBI      | <p>Valid only for SBI test case.<br>The project device type is used to filter the test cases with matching <code>biometricTypes</code>.<br>It accepts an array.</p>                                                                                                                                                                                                                                                   | <p>Finger,<br>Iris,<br>Face</p>                                                                                                                                                                                   |
| `otherAttributes.deviceSubTypes`      | SBI      | <p>Valid only for SBI test case.<br>The project device type is used to filter the test cases with matching <code>deviceSubTypes</code>.<br>It accepts an array.</p>                                                                                                                                                                                                                                                   | <p>Slap,<br>Single,<br>Touchless,<br>Single,<br>Double,<br>Full face</p>                                                                                                                                          |
| `otherAttributes.segments`            | SBI      | <p>Valid only for SBI test case.<br>It accepts an array.<br>This array is used to populate “bioSubType” attribute in the request sent to the SBI method.<br>Before the values are sent they are mapped to corresponding values. E.g.: RightIndex will be mapped to Right IndexFinger.</p>                                                                                                                             | <p>LeftIndex,<br>LeftMiddle,<br>LeftRing,<br>LeftLittle,<br>LeftThumb,<br>RightIndex,<br>RightMiddle,<br>RightRing,<br>RightLittle,<br>RightThumb,<br>UNKNOWN,<br>Left,<br>Right</p>                              |
| `otherAttributes.exceptions`          | SBI      | <p>Valid only for SBI test case.<br>It accepts an array.<br>This array is used to populate the <code>exception</code> attribute in the request sent to the SBI method.<br>Before the values are sent they are mapped to corresponding values. E.g.: RightIndex will be mapped to Right IndexFinger.</p>                                                                                                               | <p>LeftIndex,<br>LeftMiddle,<br>LeftRing,<br>LeftLittle,<br>LeftThumb,<br>RightIndex,<br>RightMiddle,<br>RightRing,<br>RightLittle,<br>RightThumb,<br>UNKNOWN,<br>Left,<br>Right</p>                              |
| `otherAttributes.requestedScore`      | SBI      | <p>Valid only for SBI test case.<br>It accepts a string or null.<br>This value is used to populate <code>requestedScore</code> attribute in the request sent to the SBI method.</p>                                                                                                                                                                                                                                   |                                                                                                                                                                                                                   |
| `otherAttributes.bioCount`            | SBI      | <p>Valid only for SBI test case.<br>It accepts a string or null.<br>This value is used to populate the <code>bioCount</code> attribute in the request sent to the SBI method.</p>                                                                                                                                                                                                                                     |                                                                                                                                                                                                                   |
| `otherAttributes.deviceSubId`         | SBI      | <p>Valid only for SBI test case.<br>It accepts a string or null. This value is used to populate the <code>deviceSubId</code> attribute in the request sent to the SBI method.</p>                                                                                                                                                                                                                                     |                                                                                                                                                                                                                   |
| `otherAttributes.timeout`             | SBI      | <p>Valid only for SBI test case.<br>It accepts a string or null.<br>This value is used to populate the “timeout” attribute in the request sent to the SBI method.</p>                                                                                                                                                                                                                                                 |                                                                                                                                                                                                                   |
| `otherAttributes.resumeBtn`           | SBI      | <p>Valid only for SBI test case.<br>It accepts a string or null.<br>This value is used to display a Resume button in UI before the SBI method is invoked. This pauses the test run and makes it possible for the user to make some changes in the SBI before the test case is executed. Helps in Device Status test cases.</p>                                                                                        |                                                                                                                                                                                                                   |
| `otherAttributes.resumeAgainBtn`      | SBI      | <p>Valid only for SBI test case.<br>It accepts a string or null.<br>This value is used to display a Resume Again button in UI after the SBI method is invoked. This pauses the test run and makes it possible for the user to make some changes in the SBI after the test case is executed. Helps in Device Status test cases.</p>                                                                                    |                                                                                                                                                                                                                   |
|`otherAttributes.hashValidationTestCase`| SBI | Valid only for SBI test case. This value is used to determine if the test case is hash-validation testcase or not. The application will perform hash validations for different captures if the testcase is a hash validation testcase. | |
|`otherAttributes.transactionId`| SBI | Valid only for SBI test case. It accepts a string. This value is used to populate the `transactionId` attribute in the request sent to the SBI method. For these testcases, SBI will give an error response. | |
|`otherAttributes.invalidRequestAttribute`| SBI | It accepts a string. This value is used to populate the invalid attribute in the request sent to the SBI method. | |
|`otherAttributes.qualityAssessmentTestCase`| SBI | Valid only for SBI test case. This value is used to determine if the test case is quality assessment testcase or not.  It's used for creating quality assessment collection. | |
|`otherAttributes.ageGroup`| SBI | Valid only for SBI test case. It accepts a string. This is used to define the different age groups, and it will also be available only for quality assessment test cases. | |
|`otherAttributes.gender`| SBI | Valid only for SBI test case. It accepts a string. This is used to define the different gender, and it will also be available only for quality assessment test cases. | |
|`otherAttributes.occupation`| SBI | Valid only for SBI test case. It accepts a string. This is used to define the different occupations, and it will also be available only for quality assessment test cases. | |
|`otherAttributes.race`| SBI | Valid only for SBI test case. It accepts a string. This is used to define the different races, and it will also be available only for quality assessment test cases. | |
|`otherAttributes.testCaseRepeatCount`| SBI | Valid only for SBI test case. It accepts a string. This value is used to repeat the testcase based on the count.| |
| `otherAttributes.modalities`          | SDK      | <p>This is applicable only for SDK testcases.<br>It accepts an array.</p>                                                                                                                                                                                                                                                                                                                                             | <p>finger,<br>face,<br>iris</p>                                                                                                                                                                                   |
| `otherAttributes.sdkPurpose`          | SDK      | <p>Valid only for SDK test case.<br>It accepts an array.<br>The project purpose is used to filter the test cases with matching sdkPurpose.</p>                                                                                                                                                                                                                                                                        | <p>Check Quality,<br>Matcher,<br>Extract Template,<br>Convert Format,<br>Segment</p>                                                                                                                              |
| `otherAttributes.convertSourceFormat` | SDK      | <p>Valid only for SDK test case.<br>It accepts a string.<br>For <code>convert-format</code> test cases this value is used as the input source format.</p>                                                                                                                                                                                                                                                             | <p>ISO19794_4_2011,<br>ISO19794_5_2011,<br>ISO19794_6_2011</p>                                                                                                                                                    |
| `otherAttributes.convertTargetFormat` | SDK      | <p>Valid only for SDK test case.<br>It accepts a string.<br>For <code>convert-format</code> test cases this value is used as the output source format.</p>                                                                                                                                                                                                                                                            | <p>IMAGE/JPEG,<br>IMAGE/PNG,<br>ISO19794_4_2011/JPEG,<br>ISO19794_5_2011/JPEG,<br>ISO19794_4_2011/PNG,<br>ISO19794_5_2011/PNG,<br>ISO19794_6_2011/PNG</p>                                                         |
|`otherAttributes.bulkInsert`| ABIS | Valid only for ABIS test case. This value is used to check the bulk insert condition. If we add more than one person's record, then it will be true. | |
|`otherAttributes.insertCount`| ABIS | Valid only for ABIS test case. It accepts a string. This value is used to determine how many times the insert should happen. | |
|`otherAttributes.insertReferenceId`| ABIS | Valid only for ABIS test case. It accepts a string. This value is used to determine if the given reference ID already exists or not.| |
|`otherAttributes.identifyReferenceId`| ABIS | Valid only for ABIS test case. It accepts a string. It is used to identify the duplicant count of a given reference ID. | |
|`otherAttributes.identifyGalleryIds`| ABIS | Valid only for ABIS test case. It accepts a string. It is used to find the duplicant for the reference ID against the given gallery ID. | |
|`otherAttributes.expectedDuplicateCount`| ABIS | Valid only for ABIS test case. It accepts a string. It is used to define the expected duplicant count. | |
|`otherAttributes.expectedFailureReason`| ABIS | Valid only for ABIS test case. It accepts a string. It is used to define the expected failure reason. | |

## How to add a test case to the Database

Any new test case is to be uploaded to the database. Editing the testcases is not possible, the only actions you can take are to activate or deactivate them using the same steps.

1\. Open postman and create a POST request.

2\. URL endpoint `https://{base_URL}/v1/toolkit/saveTestCases`

3\. Copy the `Authorization` token in the request header by logging into the Compliance Toolkit in your env with a user having a `CTK_ADMIN` role. Open the developer tools and copy the Authorization token from the headers section under the `Networks` tab. Add the Authorization token in postman, copy the token and place it in the headers section of the request (`Cookie=Authorization:eyAjksa...`)

4\. Copy the test cases array JSON and prepare a request as shown below.

5\. Request body for saveTestCases request

```
{
    "version": "1.0",
    "requesttime": "2022-10-29T06:06:51.174Z",
    "metadata": null,
    "request": {
        "testCases": [
<Paste the testcases here>
        ]
    }
}
```

6\. Change the `requesttime` to the current day and send the request.

## Where can you find the existing CTK test cases?

In the location below, you can find all the existing test cases: `https://github.com/mosip/compliance-toolkit-testcases/tree/release-1.4.0`

* `compliance_test_definitions_sbi.json`: has all existing SBI test cases
* `compliance_test_definitions_sdk.json`: has all existing SDK test cases
* `compliance_test_definitions_abis.json`: has all existing ABIS test cases
