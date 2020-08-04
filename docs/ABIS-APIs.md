This document defines the APIs specifications for various operations that ABIS can perform to integrate with MOSIP.

API specification version: **0.9**

Published Date: August 04, 2020

**Revision Note**

New [failure reason](#failure-reasons) (code - 6, 8, 9, 10, 11, 12) for ABIS have been added.

## Revision Note
Publish Date|Revision
------------|-------
May 07, 2020|This is the first formal publication of the interface as a versioned specification. Earlier draft are superseded by this document. The interface is revamped to make it friendlier to programmers and also has a new method for conversion.
June 09, 2020|A note related to targetFPIR was added
June 26, 2020|New [failure reason](#failure-reasons) (code - 6, 8, 9, 10, 11, 12) for ABIS have been added.
August 04, 2020|Analytics section has been added to the overall response for Identify

# Introduction
An ABIS system that integrates with MOSIP should support the following operations. 
* [Insert](#insert)
* [Identify](#identify)
* [Delete](#delete)
* [Ping](#ping)
* [Pending Jobs](#pending-jobs)
* [Reference Count](#reference-count)

{% hint style="info" %}
All ABIS operations are via. a message queue and are asynchronous.
{% endhint %}

# Parameters

## Common Parameters
Common parameters used for all ABIS operations:
Name | Description | Restrictions | Type
-----|-------------|--------------|------
requestID | ID that is associated with each request sent to ABIS | ABIS should not use this ID in any other context outside the request | UUID
referenceID | ID of a single registration record. Registration record is maintained in MOSIP. This ID is the mapping between MOSIP and ABIS | None | UUID
referenceURL | URL to the biometrics data stored in MOSIP. This URL will have read only access | None | HTTPS URL
biometricType | Type of biometric data sent in the request | FMR/FIR/IIR | String
returnValue | Code for response | [Standard Return Codes](#standard-return-codes) | String
failureReason | Code for failure reason | [Failure Reasons](#failure-reasons) | String

## Standard Return Codes
Code | Status
-----|---------
1 | Success
2 | Failed

## Failure Reasons
Code | Reason
-----|-------
1 | Internal error - Unknown
2 | Aborted
3 | Unexpected error
4 | Unable to serve the request
5 | Missing reference id
6 | Missing request id
7 | Unable to fetch biometric details
8 | Missing reference URL
9 | Missing requesttime
10 | Unable to serve insert request - reference id already exists
11 | Unable to serve insert request - CBEFF has no data
12 | Unable to serve identify request - reference id not found

# ABIS Operations
The following operations are supported by MOSIP:
* [Insert](#insert)
* [Identify](#identify)
* [Delete](#delete)
* [Ping](#ping)
* [Pending Jobs](#pending-jobs)
* [Reference Count](#reference-count)

## Insert 
* ABIS must get biometric data from referenceURL, process it and store it locally within the ABIS reference database 
	* The referenceURL is authenticated and authorized; ABIS needs to send a JWT token inside the request header COOKIE
	* The referenceURL is secure (HTTPS)
	* The referenceURL will be active for a certain time as decided by the MOSIP adoptor 
* referenceId must not be active prior to this operation i.e., it must not have been used before this operation
* De-duplication must not be performed in this operation
* MOSIP will provide biometric data in [CBEFF format](CBEFF-XML.md) to ABIS as a response of referenceURL and the data in CBEFF will not be encrypted

> Refer to [Authentication and Authorization API](AuthN-and-AuthZ-APIs.md#authenticate-using-clientid-and-secret-key) to get the JWT token. Request JSON expects clientid, secretkey and appid which will be provided by the MOSIP adoptor's System Integrator(SI).

### Insert Request
```JSON
{
  "id": "mosip.abis.insert",
  "version": "1.1",
  "requestId": "91234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
  "referenceId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "referenceURL": "https://mosip.io/biometric/45678"
}
```

### Success Response
```JSON
{
  "id": "mosip.abis.insert",
  "requestId": "91234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "1"
}
```

### Failure Response
```JSON
{
  "id": "mosip.abis.insert",
  "requestId": "91234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "2",
  "failureReason": "7"
}
```

## Identify
* All Insert requests added to the queue earlier must be serviced by ABIS when performing an Identify request.  
* Identify request provides a 1:N comparison. The given input is compared either against the gallery passed or if the gallery is not specified the entire database.
* The input for comparison can be provided by referenceID or referenceURL. 
	* If the referenceID is given it is used as the preferred option. The given referenceID must be existing in the ABIS database else ABIS will throw and error. 
	* If the referenceID is omitted or NULL and the referenceURL is passed the ABIS retrieves the biometrics provided in the referenceURL and compares the same against either a gallery or its database. 
	* If in case, both referenceID and referenceURL are missing ABIS throws an error.

{% hint style="info" %}
We are not using the referenceURL in Identify request for our current implementation. Hence, it will be an empty string for Identify request. MOSIP 
Aadoptors can have customized workflows where the referenceURL can be used.
{% endhint %}

* Identify request should give all candidates which are considered as a match based on ABIS thresholds.
* This request should not match against referenceID that is not in the reference database.
* The response now has a section for analytics that contains key value pairs. Values can be json objects also. The contents of the analytics section will be agreed upon by the MOSIP adoptor with the ABIS. Scores are also moved to this section and are not mandatory response parameters any more.
* Ordering or ranking of results is not explicitly specified and can be agreed upon between the MOSIP adoptor and the ABIS.
* The flags section of the request can be used to customize or control ABIS behavior by sending specific key value pairs.
* "targetFPIR" or "maxResults" are examples of such flags that can alter the ABIS behavior. These are optional attributes for MOSIP during an identify request. MOSIP expects the adoptors to define these parameters based on the accuracy expectations and the workflow requirements. These can be set at the ABIS configuration level and need not be part of the individual request at all.

To give an example, please find the following calculation for targetFPIR - which is the error rate at which identification requests are expected to return non-empty candidate list.

`round (-10 * log10 (target false positive identification rate))`

With this calculation:

Target False Positive Identification Rate	| targetFPIR
--------------------------------------------|------------------
1 in 1,000                                  | 30
1 in 10,000                                 | 40
1 in 100,000                                | 50

### Identify Request
```JSON
{
  "id": "mosip.abis.identify",
  "version": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
  "referenceId": "987654321-89AB-CDEF-0123-456789ABCDEF",
  "referenceURL": "",//will be an empty string, if not used
  "flags": { //optional
    //maxResults is an example and not a prescribed flag
	"maxResults": "10", 
	//targetFPIR is an example and not a prescribed flag
	"targetFPIR": "30",
    //there can be more following this	
	"flag1": "value1",
	"flag2": "value2" 
  },
  "gallery": {
    "referenceIds": [
      {
        "referenceId": "2abe7b7d-b58a-4466-a006-c79297281123"
      }, 
      {
        "referenceId": "7acce7b7d-b58a-4466-a006-c79297281456"
      }, 
      {
        "referenceId": "3bce7b7d-b58a-4466-a006-c79297281678"
      }, 
      {
        "referenceId": "5cce7b7d-b58a-4466-a006-c79297281098"
      }, 
      {
        "referenceId": "2cce7b7d-b58a-4466-a006-c79297281321"
      } 
    ]
  }
}
```

### Success Response
```JSON
{
  "id": "mosip.abis.identify",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "1",
  "candidateList": {
    "count": "1",
    "candidates": [
      {
        "referenceId": "7acce7b7d-b58a-4466-a006-c79297281456",
        "analytics": {
		  //internalScore is an example and not prescribed
		  "internalScore": "112", 
		  //confidence is an example and not prescribed
          "confidence": "90",
		  //there can be more following this	
		  "key1": "value1",
		  "key2": "value2"
        },
		// modality wise analytics
        "modalities": [ 
          {
            "biometricType": "FIR",
            "analytics": {
			  "confidence": "90",
              "internalScore": "112",
			  "key1": "value1",
			  "key2": "value2"
            }
          },
		  {
            "biometricType": "IIR",
            "analytics": {
			  "confidence": "90",
              "internalScore": "112",
			  "key1": "value1",
			  "key2": "value2"
            }
          },
		  {
            "biometricType": "FID",
            "analytics": {
			  "confidence": "90",
              "internalScore": "112",
			  "key1": "value1",
			  "key2": "value2"
            }
          }
        ]
      }
    ]
    "analytics": {
      //This is a optional section
      //Data in this section can be agreed upon between the MOSIP adoptor and the ABIS
	}
  }
}
```

### Failure Response
```JSON
{
  "id": "mosip.id.identify",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "2",
  "failureReason": "7"
}
```

## Delete
* Removes only the entry referred by the referenceId.
* This operation can be used to remove duplicates found by Identify.

### Delete Request
```JSON
{
  "id": "mosip.abis.delete",
  "version": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
  "referenceId": "7acce7b7d-b58a-4466-a006-c79297281456"
}
```

### Success response
```JSON
{
  "id": "mosip.abis.delete",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "1"
}
```

### Failure response
```JSON
{
  "id": "mosip.abis.delete",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "2",
  "failureReason": "1"
}
```

## Ping
* A Ping request should respond with a response on the liveness of the ABIS system.

### Ping Request
```JSON
{
  "id": "mosip.abis.ping",
  "version": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
}
```

### Success response
```JSON
{
  "id": "mosip.abis.ping",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": "1"
}
```

## Pending Jobs
* ABIS responds with the count of requests that are still pending.

### Pending Jobs Request
```JSON
{
  "id": "mosip.abis.pendingJobs",
  "version": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
}
```

### Success Response
```JSON
{
  "id": "mosip.abis.pendingJobs",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "jobscount": "10",
  "returnValue": "1"
}
```

## Reference Count
* ABIS will send a count of records in the reference database

### Reference Count Request
```JSON
{
  "id": "mosip.abis.referenceCount",
  "version": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
}
```

### Success Response
```JSON
{
  "id": "mosip.abis.referenceCount",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "count": "10",
  "returnValue": "1"
}
```

# References 
* [Biometric Data Specification](Biometric-Data-Specification.md) to know about biometric specification in MOSIP
* [CBEFF XML](CBEFF-XML.md) to how MOSIP stores biometric data
* [Authentication and Authorization API](AuthN-and-AuthZ-APIs.md#authenticate-using-clientid-and-secret-key) to get the JWT token
* [MOSIP's de-duplication process](Deduplication-and-Manual-Adjudication.md) for deatils about De-Duplication process in MOSIP
