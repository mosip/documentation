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

As can be seen from the above two samples, few attributes are common across test cases for both SBI and SDK while few are optional. Here is list of each attribute and its use.

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

