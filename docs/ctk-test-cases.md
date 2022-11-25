# CTK Test Cases

Compliance Toolkit (CTK) is an online portal that can be used by the MOSIP’s partners to test their compliance with various biometrics related specifications published by MOSIP. CTK support SBI, SDK and ABIS specifications.

## What are the CTK test cases?

To support compliance with these specifications CTK has predefined test cases for each. 

* Each test case is run on a given method of the specs, for example: there will be a test case for “device” method of SBI specs.

* Each test case defines the attributes required to create the request to be sent to the method. 

* Each test case also defines the response expected from the method. 

* Each test case also defines the validators to be run the response received. 

* Each validator will perform a predefined check on the response. 

* If all validations are successful, then the test case is passed otherwise it is a failed test case. 

Partners can use CTK to run these test cases to check if their implementation adheres to the MOSIP’s specs or not. 

This test case is defined in JSON format and saved in the CTK database.

## Sample SBI test case

This test case is the check device discovery. This test case will be available for both `Registration` and `Auth `SBI projects and for all `device type` and `sub type` combinations.


```jsonc
{
"testCaseType": "SBI",
	"testName": "Discover device",
	"testId": "SBI1000",
	"specVersion": "0.9.5",
	"testDescription": "Test for the device discovery interface",
	"isNegativeTestcase": false,
	"methodName": ["device"],
	"requestSchema": ["DiscoverRequestSchema"],
	"responseSchema": ["DiscoverResponseSchema"],
	"validatorDefs": [
[{
		"name": "SchemaValidator",
"description": "Validates the response for mandatory attributes and  values"
		}, {
		"name": "SignatureValidator",
		"description": "Validates the response signature"
		}]
],
	"otherAttributes": {
		"purpose": ["Registration", "Auth"],
		"biometricTypes": ["Finger", "Iris", "Face"],
		"deviceSubTypes": ["Slap", "Single", 
"Double", "Full face"],
		"segments": [],
		"exceptions": [],
		"requestedScore": "",
		"bioCount": "",
		"deviceSubId": "" 
}
}
```

## Sample SDK test case

This test case is the check that the quality of face biometrics is good (above acceptable threshold). This test case will be available for `Face modality` and for `Quality Check project`.

```jsonc
{
		"testCaseType": "SDK",
		"testName": "Good face quality",
		"testId": "SDK2001",
"testDescription": "This testcase checks the biometrics   for face to be of good quality. ",
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
"description": "Validates if response has all mandatory attributes and they have allowed values"
			},
			{
				"name": "QualityCheckValidator",
"description": "Checks the quality score of the modality"
			}
			]
		],
		"otherAttributes": {
			"modalities": [
				"face"
			],
			"sdkPurpose": [
				"Check Quality"
			]
		}
	}
```

## Attributes in a test case

As it can be seen from the above two samples, few attributes are common across test cases for both SBI and SDK while few are optional. Below is the list of each attribute and its use.

| Name   | Type  | Description | Allowed Values |
|-----------------|-------------------|---------------|-----------|
|`testCaseType`  | Required | Type of test case  |SBI / SDK / ABIS|
|`testName` | Required | Name of test case  ||
|`testId `| Required |Unique ID for test case  | SBI10XX, SDK20XX|
|`specVersion `| Required  | Spec version being tested | 0.9.5/1.0.0 for SBI, <br> 0.9.0 for SDK|
|`testDescription`| Required | Test description. It can also include the steps to execute the test case.  |  |
|`isNegativeTestcase` | Required  | Indicates if the validators should expect a positive scenario or negative.  | E.g.: for bad face quality test, we expect a low score which is a negative scenario, so the validator should mark the test case as passed on receiving low score |
|`methodName` | Required | The name of the method to be invoked for the test case.  <br> It accepts an array. <br> <br> For SBI, this array will have only one value.  <br><br> For SDK, in case of a combination test case you can give 2 method names. <br> E.g.: ["extract-template", "check-quality"] | device(SBI), info(SBI), capture(SBI), rcapture(SBI), stream(SBI), insert(ABIS), identify(ABIS), delete(ABIS), init(SDK), check-quality(SDK), match(SDK), extract-template(SDK), convert-format(SDK), segment(SDK)|
|`requestSchema`|Required|Name of the JSON schema file which will be used to validate the HTTP request. This HTTP request will be used to invoke the HTTP method defined in the spec. <br> It accepts an array. <br>  <br> For SBI, this array will have only one value. <br> <br> For SDK, in case of a combination test case you can give 2 request schema names. <br> E.g: ["ExtractTemplateRequestSchema", "MatchRequestSchema"]|The request schema JSON files are saved in the MINIO in following folder structure. <br> E.g.: compliance-toolkit/schemas/sbi/0.9.5/ DiscoverRequestSchema.json|
|`responseSchema`|Required|Name of the JSON schema file which will be used to validate the HTTP response. This is the HTTP response that we will receive after invoking the HTTP method.<br> It accepts an array. <br><br> For SBI, this array will have only one value <br><br> For SDK, in case of a combination test case you can give 2 request schema names. <br> E.g.: ["ExtractTemplateResponseSchema", "MatchResponseSchema"]|The response schema JSON files are saved in the MINIO in following folder structure. <br> E.g.: compliance-toolkit/schemas/sbi/0.9.5/ DiscoverResponseSchema.json|
|`validatorDefs`|Required|Names of Validators that are to be invoked to run various validations on the response. <br> It accepts an array of arrays.<br> <br> Each array is list of validators to be applied to response of corresponding method in the test case.<br> <br> In case of SBI, it is an array with a single array. <br> <br> 
In case of SDK, for a combination test case it can be an array with list of arrays.|Validators are available in folder: `compliance-toolkit\src\main\java\io\mosip\compliance\toolkit\validators`|
|`validatorDefs.name`|Required|||
|`validatorDefs`||||



## How to add a test case to the Database

Any new test case is to be uploaded to the Database. You can also update an existing test case using the same steps.

1\.	Open postman and create a POST request.

2\.	URL endpoint https://api-internal.dev.mosip.net/v1/toolkit/saveTestCases

3\.	Copy the Authorization token in request header by logging into compliance toolkit in your env with a user having `GLOBAL_ADMIN` role. Open the developer tools and copy the Authorization token from the headers section under `Networks` tab. Add the Authorization token in postman, copy the token and place it in headers section of request (`Cookie=Authorization:eyAjksa...`)

![](_images/ctk-testcase.png)

4\. Copy test cases array JSON and prepare a request as shown below.

5\. Request body for saveTestCases request 

```jsonc
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

6\. Change the `requesttime` to current day and send the request.

## Where can you find the existing CTK testcases? 

In the location below, you can find all the existing testcases:
https://github.com/mosip/mosip-compliance-toolkit/tree/0.0.9-B1/resources

`compliance_test_definitions_sbi.json`- This has all existing SBI test cases

`compliance_test_definitions_sdk.json`- This has all existing SDK test cases


