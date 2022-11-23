# Developer Guide 1.1

This page details only on very specific areas of MOSIP Token Seeder. For a elaborate understanding on the MTS API, please refer the API documentation page.

## API documentation

Refer [API documentation](https://mosip.stoplight.io/docs/mosip-token-seeder/branches/1.1.0).

### CSV format

{% file src="../../../.gitbook/assets/sample_input.csv" %}

When using above format, you may not need any mapping configuration. But in case you change any column name in the csv, please do provide the same in the mapping configuration.

{% file src="../../../.gitbook/assets/sample_output.csv" %}

Output might have mix of successful and failed records except for the case where whole of the input throws error. If successful, the record would be having the token placed against the vid. And if there is error processing a record, the same is updated against the vid and the [error code](mosip-token-seeder-api-1.md#failure-details) and description is mentioned along.

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

In case there is a prior request placed with considerably higher number of records, and you have placed subsequent request submitted even before getting output for your earlier request, the system might take a while to update the status of your newer request. It might be still in the `submitted` state until the system finds a window to start processing. &#x20;



## Callback

Call back functionality enables MTS api to submit the output to a specified URI. Callback might also need authorization on most occasions. MTS currently supports following authorization types.

#### Bearer Token &#x20;

If the caller can supply a token while calling the MTS api, it can be configured in the `authStaticBearer` attribute of `callbackProperties` section.&#x20;

```
"authStaticBearer": {
        "token": "string"
      }
```

#### **Odoo**

The functionality is added to support the OpenG2P use case where in OpenG2P odoo modules can call the MTS and get the result directly imported to odoo database. Following are the parameters supported.

```
"authOdoo": {
        "authUrl": "http://example.com",
        "database": "string",
        "username": "string",
        "password": "string",
        "extraHeaders": {}
      },
```

#### OAuth

[OAuth ](https://oauth.net/2/)protocol is also supported in MTS callback functionality. This helps numerous systems which implements OAuth specification to integrate with MTS seamlessly. Below are the configurations available to setup OAuth based callback.&#x20;

```
"authOauth": {
        "authUrl": "http://example.com",
        "username": "",
        "password": "",
        "clientId": "",
        "clientSecret": "",
        "extraHeaders": {}
      },
```

## Error codes

| Error Code    | Error Message                                                       |
| ------------- | ------------------------------------------------------------------- |
| ATS-REQ-001   | json is not in valid format                                         |
| ATS-REQ-003   | name is not provided                                                |
| ATS-REQ-004   | gender is empty                                                     |
| ATS-REQ-006   | date of birth is empty                                              |
| ATS-REQ-008   | address is empty                                                    |
| ATS-REQ-009   | vid or its mapping not present                                      |
| ATS-REQ-010   | name or its mapping not present                                     |
| ATS-REQ-011   | gender or its mapping not present                                   |
| ATS-REQ-012   | dateOfBirth or its mapping not present                              |
| ATS-REQ-015   | fullAddress or its mapping not present                              |
| ATS-REQ-016   | no auth request found for the given identifier                      |
| ATS-REQ-017   | auth request not processed yet                                      |
| ATS-REQ-018   | no odk baseurl provided                                             |
| ATS-REQ-019   | no email provided                                                   |
| ATS-REQ-020   | no password provided                                                |
| ATS-REQ-021   | no odk project id provided                                          |
| ATS-REQ-022   | no odk form id provided                                             |
| ATS-REQ-023   | no submissions found for odk pull                                   |
| ATS-REQ-024   | callbackProperties cannot be empty for deliverytype callback        |
| ATS-REQ-025   | requestFileName is not valid in callbackProperties                  |
| ATS-REQ-026   | callInBulk cannot be false for csv output                           |
| ATS-REQ-027   | unsupported authType in CallbackProperties                          |
| ATS-REQ-028   | authOdoo cannot be empty for authType odoo                          |
| ATS-REQ-029   | authOauth cannot be empty for authType oauth                        |
| ATS-REQ-030   | authStaticBearer cannot be empty for authType staticBearer          |
| ATS-REQ-031   | authUrl in authOdoo, cannot be empty for authType odoo              |
| ATS-REQ-032   | username in authOdoo, cannot be empty for authType odoo             |
| ATS-REQ-033   | database in authOdoo, cannot be empty for authType odoo             |
| ATS-REQ-034   | token in authStaticBearer cannot be empty for authType staticBearer |
| ATS-REQ-100   | unknown error                                                       |
| ATS-REQ-101   | none of the record form a valid request                             |
| ATS-REQ-102   | invalid input                                                       |
| ATS-REQ-103   | outputFormat is not a valid jq expression                           |
| ATS-REQ-104   | for csv output, outputFormat cannot be list. Has to be json         |
| AUT\_CRY\_001 | Error parsing encryption certificate provided in config file.       |
| AUT\_CRY\_002 | Error reading P12 file provided in config file.                     |
| AUT\_CRY\_003 | Error Encrypting Auth Data                                          |
| AUT\_CRY\_004 | Error Signing Auth Request Data                                     |
| AUT\_BAS\_001 | Not Able to process auth request                                    |
|               |                                                                     |

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

## Output format

With the output formatting capability, MTS can give you the result exactly the way in which you would want it ready for your further processing of data. The output format string to be supplied follows the [jq format](https://stedolan.github.io/jq/).  In case the output format is not supplied, the default output will be generated which will be the same as the previous versions. The below section details on an example case for output formatting.&#x20;

#### Sample authdata Input for MTS&#x20;

```
{
    "vid": "456564345214",
    "demographics":{
            "fname": "Peter",
            "lname": "Parker",
            "gender": "male"
        },
    "contacts": [{
        "email": "peter.parker@somewhere.com",
        "fulladdress":"Cecilia Chapman, 711-2880 Nulla St.,Mankato Mississippi 96522, (257) 563-7401"
    }]
}
```

#### Output format string

<pre><code><strong>"{
</strong>    \"pcn\": .input.vid,
    \"firstName\": .input.demographics.fname,
    \"lastName\": .input.demographics.lname,
    \"gender\": .input.demographics.gender,
    \"email\": .input.contacts[0].lname,
    \"address\": .input.contacts[0].fulladdress,
    \"authToken\": .output.token,
    \"authTokenStatus\": .output.status,
    \"authTokenError\": (.output.errorCode + \"::\" + .output.errorMessage),
}"</code></pre>

#### Authtoken output

<pre><code>{
    "pcn": "456564345214",
    "firstName": "Peter",
    "lastName": "Parker",
    "gender": "male",
    "email": "peter.parker@somewhere.com",
    "address": "Cecilia Chapman, 711-2880 Nulla St.,Mankato Mississippi 96522, (257) 563-7401",
<strong>    "authToken": "2944061782623593820388819382121346429",
</strong>    "authTokenStatus": "error",
    "authTokenError": ""   
}</code></pre>

**`input`**keyword in the output format string is used to represent the data you input into MTS as authdata parameter. **`output`** keyword is used to identify that you intend to pick the data from the default auth request result. Please find below a sample for the default auth request output. &#x20;

```
{
    "vid": "456564345214",
    "token": "2944061782623593820388819382121346429",
    "status": "success",
    "errorCode": "",
    "errorMessage": "",
}
```

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
