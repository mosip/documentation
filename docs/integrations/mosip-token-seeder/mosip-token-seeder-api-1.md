# MTS Developer Guide

## API Documentation

Ref [Api](https://mosip.stoplight.io/docs/mosip-token-seeder/branches/main)

## Authtoken (JSON) <a href="#mosip-token-seeder-default" id="mosip-token-seeder-default"></a>

An endpoint to receive an array of authdata records to generate MOSIP token IDs. On placing a successful authtoken request, the caller will be returned with a request identifier, and the request will be queued to the seeder for asynchronous processing. The request identifier can be used to check the status of the authtoken request.

## Authtoken (CSV)

This is an endpoint for receiving a CSV file in order to generate a MOSIP token. On placing a successful authtoken request, the caller will be returned with a request identifier, and the request will be queued to the seeder for asynchronous processing. The request identifier can be used to check the status of the authtoken request.

#### CSV Format

{% file src="../../.gitbook/assets/sample_input.csv" %}

When using above format, you may not need any mapping configuration. But in case you change any column name in the csv, please do provide the same in the mapping configuration.

{% file src="../../.gitbook/assets/sample_output.csv" %}

Output might have mix of successful and failed records except for the case where whole of the input throws error. If successful, the record would be having the token placed against the vid. And if there is error processing a record, the same is updated against the vid and the [error code](mosip-token-seeder-api-1.md#failure-details) and description is mentioned along.

## Authtoken (ODK)

Seeds token for the ODK data pulled from the ODK Central, based on the config submitted. Unlike authtoken API for JSON and CSV, here there is no input supplied in the request directly. Instead, an ODK configuration is submitted along with the input, and the API will try to fetch submissions from ODK central and store them in an in-memory DB. The API will then queue the request to the seeder and return the request identifier.

## Fetch Status

Fetches the status of the request for the request identifier passed in.

## Download File

If the delivery type submitted in an authtoken request is "download" and the status check revealed for the request is "processed," this api can return you the file generated as the output of tokenization. The input expected in this API is the same request identifier.

## Failure Details

| Error Code    | Error Message                                                 |
| ------------- | ------------------------------------------------------------- |
| ATS-REQ-001   | json is not in valid format                                   |
| ATS-REQ-002   | invalid vid construct                                         |
| ATS-REQ-003   | name is not provided                                          |
| ATS-REQ-004   | gender is empty                                               |
| ATS-REQ-006   | date of birth is empty                                        |
| ATS-REQ-007   | not a valid date format for date of birth                     |
| ATS-REQ-008   | address is empty                                              |
| ATS-REQ-009   | vid or its mapping not present                                |
| ATS-REQ-010   | name or its mapping not present                               |
| ATS-REQ-011   | gender or its mapping not present                             |
| ATS-REQ-012   | dateOfBirth or its mapping not present                        |
| ATS-REQ-013   | phoneNumber or its mapping not present                        |
| ATS-REQ-014   | emailId or its mapping not present                            |
| ATS-REQ-015   | fullAddress or its mapping not present                        |
| ATS-REQ-016   | no auth request found for the given identifier                |
| ATS-REQ-017   | auth request not processed yet                                |
| ATS-REQ-18    | no odk baseurl provided                                       |
| ATS-REQ-19    | no email provided                                             |
| ATS-REQ-20    | no password provided                                          |
| ATS-REQ-21    | no odk project id provided                                    |
| ATS-REQ-22    | no odk form id provided                                       |
| ATS-REQ-23    | no submissions found for odk pull                             |
| ATS-REQ-100   | unknown error                                                 |
| ATS-REQ-101   | none of the record form a valid request                       |
| ATS-REQ-102   | invalid input                                                 |
| AUT\_CRY\_001 | Error parsing encryption certificate provided in config file. |
| AUT\_CRY\_002 | Error reading P12 file provided in config file.               |
| AUT\_CRY\_003 | Error Encrypting Auth Data                                    |
| AUT\_CRY\_004 | Error Signing Auth Request Data                               |
| AUT\_BAS\_001 | Not Able to process auth request                              |

## Mapping Config

The names on the left side of the mapping config denotes the original expected names and the value part will hold the change of name, if any. The mapping config if not supplied, the system will assume that there are no changes in the names used. The same applies if any one or more element of the mapping is not provided.

```json
"mapping": {
      "vid": "vid_1",                                          //default:"vid"
      "name": [                                                //default:"name"
        "firstname","middlename","lastname"
      ],
      "gender": "gender",                                      //default:"gender"
      "dob": "dob",                                            //default:"dob"
      "phoneNumber": "phoneNumber",                            //default:"phoneNumber"
      "emailId": "emailId",                                    //default:"emailId"
      "fullAddress": [                                         //default:"fullAddress"
        "addressline1", "addressline2","city","state","pincode"
      ]
    }
```

## Field formats

| Field  | Format/Options                                   | Default |
| ------ | ------------------------------------------------ | ------- |
| vid    | only valid vid generated by MOSIP                |         |
| dob    | "YYYY/MM/DD"                                     |         |
| phone  | country specific length without any country code |         |
| gender | male/female/others                               |         |
