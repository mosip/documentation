# Introduction

An ABIS system that integrates with MOSIP should support the following operations. All ABIS operations are via a message queue and asynchronous.

# Parameters

## Parameters

Common parameters used for all ABIS operations:

Name | Description | Restrictions | Default Value | Example
-----|----------|-------------|--------------|---------------
requestID | ID that is associated with each request sent to ABIS | ABIS should not use this ID in any other context outside the request | | 80bd41f8-31b2-46ac-ac9c-3534fc1b220e (UUID)
referenceID |  Id of a single registration record. Registration record is maintained in MOSIP. This ID is the mapping between MOSIP and ABIS | None | | 80bd41f8-31b2-46ac-ac9c-3534fc1b220e (UUID)
referenceURL | URL to the biometrics data stored in MOSIP. This URL will have read only access | None | | 
biometricType | Type of biometric data sent in the request | FMR/FIR/IIR | |
Return Value | Response | None | None | Integer
failureReason | Response | None | None | Integer

## Standard return codes

0 | not used
--|---------
1 | Success
2 | Failed

## Failure reasons

Code | Reason
-----| ------
1 | Internal error - Unknown
2 | Aborted
3 | Unexpected error
4 | Unable to serve the request
5 | Missing reference id
7 | Unable to fetch biometric details

# ABIS Operations
All the below operations send biometric data in [CBEFF format](CBEFF-XML.md). 

## Insert 
```json
//Request
{
  "id": "mosip.abis.insert",
  "ver: "1.1",
  "requestId": "91234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
  "referenceId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "referenceURL": "https://mosip.io/biometric/45678"
}

//Success response
{
  "id": "mosip.abis.insert",
  "requestId": "91234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": 1
}

//Failure response
{
  "id": "mosip.abis.insert",
  "requestId": "91234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": 2,
  "failureReason": 7
}
```

- ABIS must get biometric data from referenceURL, process it and store it locally within the ABIS reference database 
- referenceId must not be active prior to this operation i.e., it must not have been used before this operation
- De-duplication must not be performed in this operation
- MOSIP must provide CBEFF format biometric data to ABIS

## Identify
```json
{
  "id": "mosip.abis.identify",
  "ver": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
  "referenceId": "987654321-89AB-CDEF-0123-456789ABCDEF",
  "referenceUrl": "https://mosip.io/registrationprocessor/v1/bio-dedupe/biometricfile/2cce7b7d-b58a-4466-a006-c79297281789",
  "flags": { //Optional
	"maxResults": 10, //maxResults is an example and not a prescribed flag
	"targetFPIR": 30, //targetFPIR is an example and not a prescribed flag
	"flag1": "value1",
	"flag2": "value2" // there can be more following this
  },
  "gallery": {
    "referenceIds" : [
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

//Success response
{
  "id": "mosip.abis.identify",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": 1,
  "candidateList": {
    "count": 1,
    "candidates": [
      {
        "referenceId": "7acce7b7d-b58a-4466-a006-c79297281456",
        "analytics":
          {
	    "internalScore": "112", // example and not prescribed
            "confidence": "90", // example and not prescribed
            "key1": "value1",
            "key2": "value2"
          },
        "modalities": [ // Modalitywise analytics
          {
            "biometricType": "FIR",
            "analytics":
              {
				"confidence": "90",
            	"internalScore": "112",
                "key1": "value1",
                "key2": "value2"
              }
          },
		  {
            "biometricType": "IIR",
            "analytics":
              {
				"confidence": "90",
            	"internalScore": "112",
                "key1": "value1",
                "key2": "value2"
              }
          },
		  {
            "biometricType": "FID",
            "analytics":
              {
				"confidence": "90",
            	"internalScore": "112",
                "key1": "value1",
                "key2": "value2"
              }
          },
        ]
      }
    ]
  }
}

//Failure response
{
  "id": "mosip.id.identify",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": 2,
  "failureReason": 7
}
```

- All INSERT requests added to the queue earlier must be serviced by ABIS when performing an IDENTIFY request.  
- Identify request provides a 1:N comparison. The given input is compared either against the gallery passed or if the gallery is not specified the entire database.
- The input for comparison can be provided by referenceID or referenceUrl. If the referenceID is given it is used as the preferred option. The given referenceID must be existing in the ABIS database else ABIS will throw and error. If the referenceID is omitted or NULL and the referenceURL is passed the ABIS retrieves the biometrics provided in the referenceURL and compares the same against either a gallery or its database. In case both referenceID and referenceURL are missing ABIS throws an error.
- Identify should give all candidates which are considered as a match based on ABIS thresholds.
- This request should not match against referenceID that is not in the reference database.
- The flags section of the request can be used to customize or control ABIS behavior by sending specific key value pairs. targetFPIR or maxResults are examples of such flags that can alter the ABIS behavior. Implementations can agree with the ABIS on what these flags should be called and how they will be interpreted.
- The response not has a section for Analytics that contains key value pairs. Values can be json objects also. The contents of the analytics section will be agreed upon by the implementation with the ABIS. Scores are also moved to this section and are not mandatory response parameters any more.
- Ordering or ranking of results is not explicitly specified and can be agreed upon between the implementation and the ABIS. 

## Delete

```json
//Request
{
  "id": "mosip.abis.delete",
  "ver": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
  "referenceId": ""
}

//Success response
{
  "id": "mosip.abis.delete",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": 1
}

//Failure response
{
  "id": "mosip.abis.delete",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": 2,
  "failureReason": 1
}
```

- Removes only the entry referred by the referenceId.
- This operation can be used to remove duplicates found by Identify.

## Ping

```json
//Request
{
  "id": "mosip.abis.ping",
  "ver": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
}

//Success response
{
  "id": "mosip.abis.ping",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "returnValue": 1
}
```

- A Ping request should respond with a response on the liveness of the ABIS system.


## Pending Jobs

```json
//Request
{
  "id": "mosip.abis.pendingJobs",
  "ver": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
}

//Success response
{
  "id": "mosip.abis.pendingJobs",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "jobscount": "",
  "returnValue": 1
}
```

- ABIS responds with the count of requests that are still pending.

## Reference Count

```json
//Request
{
  "id": "mosip.abis.referenceCount",
  "ver": "1.1",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2020-03-29T07:01:24.692Z",
}

//Success response
{
  "id": "mosip.abis.referenceCount",
  "requestId": "01234567-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2020-03-29T07:01:24.692Z",
  "count": "",
  "returnValue": 1
}
```

- ABIS will send a count of records in the reference database
