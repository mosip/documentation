# Developer Guide 1.0

This page details only on very specific areas of MOSIP Token Seeder. For a elaborate understanding on the MTS API, please refer the API documentation page.

## API documentation

Refer [API documentation](https://mosip.stoplight.io/docs/mosip-token-seeder/branches/main).

### CSV format

{% file src="../../../.gitbook/assets/sample_input.csv" %}

When using above format, you may not need any mapping configuration. But in case you change any column name in the csv, please do provide the same in the mapping configuration.

{% file src="../../../.gitbook/assets/sample_output.csv" %}

Output might have mix of successful and failed records except for the case where whole of the input throws error. If successful, the record would be having the token placed against the vid. And if there is error processing a record, the same is updated against the vid and the [error code](mosip-token-seeder-api.md#failure-details) and description is mentioned along.

## Status messages

#### `submitted`&#x20;

`submitted` is the first status immediately after you have placed a authtoken request.

#### `invalid`

If in case there is basic validation error such that the request could not be processed, the request in marked as `invalid`.&#x20;

#### `submitted_with_errors`

Once the system passes through the basic validation but has found that none of the records can go through due to varied record level validation issues, the system will update the request with `submitted_with_errors` status.

#### `processing`

This status is updated when the seeder enqueues the request for `processing`.

#### `processed`

Once the request is completed processing and ready for a result, the system updates the record with `processed` status. There can be error codes mentioned in the output line items in case few but not entire records have any processing error.

#### `processed_with_errors`

When the request is processed but every record in the request has some or other processing errors, the system updates the request with `processed_with_errors` status.

#### _Delay in status update_

In case there is a prior request placed with considerably higher number of records, and you have placed  subsequent request submitted even before getting output for your earlier request, the system might take a while to update the status of your newer request. It might be still in the `submitted` state until the system finds a window to start processing. &#x20;

## Error codes

| Error Code    | Error Message                                                 |
| ------------- | ------------------------------------------------------------- |
| ATS-REQ-001   | json is not in valid format                                   |
| ATS-REQ-003   | name is not provided                                          |
| ATS-REQ-004   | gender is empty                                               |
| ATS-REQ-006   | date of birth is empty                                        |
| ATS-REQ-008   | address is empty                                              |
| ATS-REQ-009   | vid or its mapping not present                                |
| ATS-REQ-010   | name or its mapping not present                               |
| ATS-REQ-011   | gender or its mapping not present                             |
| ATS-REQ-012   | dateOfBirth or its mapping not present                        |
| ATS-REQ-015   | fullAddress or its mapping not present                        |
| ATS-REQ-016   | no auth request found for the given identifier                |
| ATS-REQ-017   | auth request not processed yet                                |
| ATS-REQ-018   | no odk baseurl provided                                       |
| ATS-REQ-019   | no email provided                                             |
| ATS-REQ-020   | no password provided                                          |
| ATS-REQ-021   | no odk project id provided                                    |
| ATS-REQ-022   | no odk form id provided                                       |
| ATS-REQ-023   | no submissions found for odk pull                             |
| ATS-REQ-100   | unknown error                                                 |
| ATS-REQ-101   | none of the record form a valid request                       |
| ATS-REQ-102   | invalid input                                                 |
| AUT\_CRY\_001 | Error parsing encryption certificate provided in config file. |
| AUT\_CRY\_002 | Error reading P12 file provided in config file.               |
| AUT\_CRY\_003 | Error Encrypting Auth Data                                    |
| AUT\_CRY\_004 | Error Signing Auth Request Data                               |
| AUT\_BAS\_001 | Not Able to process auth request                              |

There are cases where MTS might successfully pass on the request but IDA generates error based on the its implementation scenario. MTS will log such error directly to the output json/csv/file.\
In any case there are uncaught errors thrown by IDA, MTS will output the same as unknown error (ATS-REQ-100).&#x20;

## Mapping config

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

Except for name and full address, the majority of the fields in authdata are direct mapping. MTS expects that there can be exceptions for name and full address for which the mapping is configured as a string array. For example, if the calling application or program stores the address fields in separate variables or columns like addressline1, addressline2, street, area, or zipcode; the same can be supplied directly as authdata with mapping supplied as a list of variable or column names as in the calling program.



## Field formats

| Field       | Format/Options                                   | Validation |
| ----------- | ------------------------------------------------ | ---------- |
| vid         | only valid vid/uin generated by MOSIP            | Mandatory  |
| name        | string                                           | Mandatory  |
| gender      | male/female/others                               | Mandatory  |
| dob         | "YYYY/MM/DD"                                     | Mandatory  |
| phoneNumber | country specific length without any country code | Optional   |
| emailId     | string                                           | Optional   |
| fullAddress | string                                           | Mandatory  |
