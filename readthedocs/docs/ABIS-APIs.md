An ABIS system that integrates with MOSIP should support the following operations. All ABIS operations are via a message queue and asynchronous.

### Common parameters used for all ABIS operations

Name | Description | Restrictions | Default Value | Example
-----|----------|-------------|--------------|---------------
requestID | ID that is associated with each request sent to ABIS | ABIS should not use this ID in any other context outside the request | | 80bd41f8-31b2-46ac-ac9c-3534fc1b220e (UUID)
referenceID |  Id of a single registration record. Registration record is maintained in MOSIP. This ID is the mapping between MOSIP and ABIS | None | | 80bd41f8-31b2-46ac-ac9c-3534fc1b220e (UUID)
referenceURL | URL to the biometrics data stored in MOSIP. This URL will have read only access | None | | 
biometricType | Type of biometric data sent in the request | FMR/FIR/IIR | |
Return Value | Response | None | None | Integer
failureReason | Response | None | None | Integer
scaledScore | Score of the match against the population | None | None | Integer
targetFPIR | FPIR score as per the formula | None | None | Integer
maxResults | maximum number of results returned for IDENTIFY operation | 30 | 30 | Integer

### Standard return codes
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

All the below operations send biometric data in CBEFF format. (Please refer to the [**link**](MOSIP-Biometric-Data-Specifications#cbeff-xml) for sample cbeff data)
### INSERT (insert biometric data of an Individual)
```
//Request
{
	"id" : "mosip.abis.insert",
	"ver" : "1.0",
	"requestId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"timestamp" : "1539777717",
	"referenceId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"referenceURL" : "https://mosip.io/biometric/45678"
        	
}

//Success response
{
	"id" : "mosip.abis.insert",
	"requestId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"timestamp" : "1539777717",
	"returnValue" : "1"
}

//Failure response
{
	"id" : "mosip.abis.insert",
	"requestId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"timestamp" : "1539777717",
	"returnValue" : "2",
	"errorCode" : "1"
	"failureReason" : ""
}
```
### Behavior of Insert
 - ABIS must get biometric data from referenceURL, process it and store it locally within the ABIS reference database 
 - referenceId must not be active prior to this operation i.e., it must not have been used before this operation
 - De-duplication must not be performed in this operation
 - MOSIP must provide CBEFF format biometric data to ABIS

### IDENTIFY
```
//Request
{
	"id" : "mosip.abis.identify",
	"ver" : "1.0",
	"requestId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"timestamp" : "1539777717",
	"referenceId" : "987654321-89AB-CDEF-0123-456789ABCDEF",
        "referenceUrl" : "https://mosip.io/registrationprocessor/v1/bio-dedupe/biometricfile/2cce7b7d-b58a-4466-a006-c79297281789",
	"maxResults" : 10,
	"targetFPIR" : 30,
	"gallery" : {
		"referenceIds" : [ {
			  "referenceId" : "2cce7b7d-b58a-4466-a006-c79297281123"
			}, {
			  "referenceId" : "2cce7b7d-b58a-4466-a006-c79297281456"
			}, {
			  "referenceId" : "2cce7b7d-b58a-4466-a006-c79297281678"
			}, {
			  "referenceId" : "2cce7b7d-b58a-4466-a006-c79297281098"
			}, {
			  "referenceId" : "2cce7b7d-b58a-4466-a006-c79297281321"
			} 
		]
  }
}

//Success response
{
	"id" : "mosip.abis.identify",
	"requestId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"timestamp" : "1539777717",
	"returnValue" : "1",
	"candidateList" : {
	 "count" : "",
	 "candidates" : [
	{
	 "referenceId" : "",
	 "internalScore": "",
	 "scaledScore" : "",
	 "analytics": [
	   {
		"key1": "value1",
		"key2": "value2"
	   }
	 ],
	 "scores": [
	  {
	   "biometricType": "FIR",
	   "scaledScore": "",
	   "internalScore": "",
	   "analytics": [
		{
		 "key1": "value1",
		 "key2": "value2"
		}
	   ]
	  },
	  {
	   "biometricType": "IIR",
	   "scaledScore": "",
	   "internalScore": "",
	   "analytics": [
	    {
		 "key1": "value1",
		 "key2": "value2"
	    }
	   ]
	  }
	 ]
	}
   ]
  }
}

//Failure response
{
	"id" : "mosip.id.identify",
	"requestId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"timestamp" : "1539777717",
	"returnValue" : "2",
	"errorCode" : "7"
	"failureReason" : ""
}
```

### Behavior of IDENTIFY
 - IDENTIFY request MUST provide a 1:n comparison
 - The input set for comparison can be provided by referenceID
 - The collection against which the input set has to be matched is specified by a set of referenceID's. 
   If referenceId is provided, atleast one referenceID must be provided in the input. The provided referenceID's must be 
   present in the reference database.
 - If IDENTIFY is against all the entries in ABIS, then gallery attribute MUST not be specified
 - maxResults specify how many results can be returned. By default this will be 10
 - IDENTIFY should give all candidates which match targetFIPR or a better score than the targetFIPR
 - This request should not match against referenceID that is not in the reference database
 - If referenceID is not NULL, then, ABIS performs 1:n comparison against all the entries in ABIS using the referenceID
 - If referenceID is NULL and referenceURL is provided, then, ABIS performs 1:n comparison against all the entries in ABIS using the referenceURL
 - If referenceID and reference URL both are NULL, then, ABIS throws an error (error code 5)

### DELETE
```
//Request
{
	"id" : "mosip.abis.delete",
	"ver" : "1.0",
	"requestId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"timestamp" : "1539777717",
	"referenceId" : ""
}

//Success response
{
	"id" : "mosip.abis.delete",
	"requestId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"timestamp" : "1539777717",
	"returnValue" : ""
}

//Failure response
{
	"id" : "mosip.abis.delete",
	"requestId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"timestamp" : "1539777717",
	"returnValue" : "",
	"errorCode" : "1"
	"failureReason" : ""
}
```

### Behavior of DELETE
- Removes only the entry referred by the referenceId
- This operation can be used to remove duplicates found by Identify

### PING
```
//Request
{
	"id" : "mosip.abis.ping",
	"ver" : "1.0",
	"requestId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"timestamp" : "1539777717"
}

//Success response
{
	"id" : "mosip.abis.ping",
	"requestId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"timestamp" : "1539777717",
	"returnValue" : "",
	"failureReason" : ""
}
```

### Behavior of PING
A PING request should respond with a response on the liveness of the ABIS system

### Pending Jobs
```
//Request
{
	"id" : "mosip.abis.pendingJobs",
	"ver" : "1.0",
	"requestId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"timestamp" : "1539777717"
}

//Success response
{
	"id" : "mosip.abis.pendingJobs",
	"requestId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"timestamp" : "1539777717",
	"jobscount" : "",
	"returnValue" : "",
	"failureReason" : ""	
}
```

### Behavior of Pending Jobs
- ABIS responds with the count of requests that are still pending

### Reference Count
```
//Request
{
	"id" : "mosip.abis.referenceCount",
	"ver" : "1.0",
	"requestId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"timestamp" : "1539777717"
}

//Success response
{
	"id" : "mosip.abis.referenceCount",
	"requestId" : "01234567-89AB-CDEF-0123-456789ABCDEF",
	"timestamp" : "1539777717",
	"count" : "",
	"returnValue" : "",
	"failureReason" : ""	
}
```
### Behavior of Reference Count
- ABIS will send a count of records in the reference database
