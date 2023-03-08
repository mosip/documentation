# Manual Adjudication and Verification

* When biometric duplicates are found in ABIS, the MOSIP system sends a request for manual adjudication to the Manual Adjudication System via a queue. 
* The system integrator can build the Manual Adjudication System, which would be listening to the `MOSIP-to-ManualAdjudication` queue for any manual adjudication requests and sends a response back in the `ManualAdjudication-to-MOSIP` system after verifying the data.
* The data sent to the Manual Adjudication System is driven by a policy defined in MOSIP and the specification is similar to ABIS identify request.

The manual adjudication stage in [registration processor]() performs the following functions:
* Sends the applicant's demographic and biometric information (via queue + Datashare) to Manual Adjudication System (MAS).
* Receives decision from MAS and accordingly forwards the packets.
* If rejected, notifies the applicant.

### Manual Adjudication request to Queue is as follows:

```
{
  "id": "mosip.manual.adjudication.adjudicate",
  "version": "1.0",
  "requestId": "987654321-89AB-CDEF-0123-456789ABCDEF",
  "requesttime": "2019-02-14T12:40:59.768Z",
  "referenceId": "27847657360002520181208123456",
  "referenceURL": "<datashare url for regid>",
  "gallery": {
    "referenceIds": [
      {
        "referenceId": "27847657360002520181208123451",
        "referenceURL": "<data share for matchedRegId>"
      },
      {
        "referenceId": "27847657360002520181208123452",
        "referenceURL": "<data share for matchedRegId>"
      }
    ],
    "addtional": [
      {
        "abisId": "<abis app code>",
        "response": "<abis response text received>"
      }
    ]
  }
}
```
#### Request parameters 

`requestId`: request_id that is associated with each request present in `reg_manual_verification` table.

`referenceId`: reg_id that is associated with each request present in `reg_manual_verification` table.

`referenceURL`: Datashare url of biometrics, demographics(identity), audits, metainfo, documents of reg_id

`gallery`: contains the matched ref_id and referenceURL of matched ref_id.

### Sample request

```
{
  "id": "mosip.manual.adjudication.adjudicate",
  "version": "1.0",
  "requestId": "4d4f27d3-ec73-41c4-a384-bf87fce4969e",
  "referenceId": "10002100741000320210107125533",
  "requesttime": "2021-01-19T07:16:22.930Z",
  "referenceURL": "http://datashare-service/v1/datashare/get/mpolicy-default-adjudication/mpartner-default-adjudication/mpartner-default-adjudicationmpolicy-default-adjudication202011110619201EpLEjvD",
  "addtional": null,
  "gallery": {
    "referenceIds": [
      {
        "referenceId": "10002100741000120210107111325",
        "referenceURL": "http://datashare-service/v1/datashare/get/mpolicy-default-adjudication/mpartner-default-adjudication/mpartner-default-adjudicationmpolicy-default-adjudication202137493575474iefnvvsD"
      }
    ]
  }
}
```

### Manual adjudication response structure from MAS

```
{
  "id": "mosip.manual.adjudication.adjudicate",
  "requestId": "987654321-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2019-02-14T12:40:59.768Z",
  "returnValue": "1",
  "candidateList": {
    "count": "1",
    "candidates": [
      {
        "referenceId": "27847657360002520181208123451",
        "analytics": {
          //This section is optional 
          "primaryOperatorID": "110011",
          "primaryOperatorComments": "<comments provided by operator>",
          "secondaryOperatorID": "110012",
          "secondaryOperatorComments": "<comments provided by operator>",
          "key1": "value1",
          "key2": "value2"
        }
      }   
    ],
    "analytics": {
      // This section is optional
      "key1": "value1",
      "key2": "value2"
    }
  }
}
```

#### Response parameters

`returnValue`:   1-Success, 2-Failure

`candidateList`: It contains matched candidate referenceIds, count and analytics.

### Scenario:  No match -  response structure

```
{
  "id": "mosip.manual.adjudication.adjudicate",
  "requestId": "4d4f27d3-ec73-41c4-a384-bf87fce4969e",
  "responsetime": "2021-01-19T13:16:22.930Z",
  "returnValue": "1",
  "candidateList": {}
}
```

### Scenario: There are matches, response structure

```
{
  "id": "mosip.manual.adjudication.adjudicate",
  "requestId": "987654321-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2019-02-14T12:40:59.768Z",
  "returnValue": "1",
  "candidateList": {
    "count": "1",
    "candidates": [
      {
        "referenceId": "27847657360002520181208123451",
        "analytics": {
          //This section is optional 
          "primaryOperatorID": "110011",
          "primaryOperatorComments": "<comments provided by operator>",
          "secondaryOperatorID": "110012",
          "secondaryOperatorComments": "<comments provided by operator>",
          "key1": "value1",
          "key2": "value2"
        }
      }   
    ],
    "analytics": {
      // This section is optional
      "key1": "value1",
      "key2": "value2"
    }
  }
}
```

## Datashare structure 

Datashare contains biometrics, identity documents, metainfo, audits related to particular rid and the datashare URL contains encrypted form of this data.

### Sample Request URL

GET https://datashare-service/v1/datashare/get/mpolicy-default-adjudication/mpartner-default-adjudication/mpartner-default-adjudicationmpolicy-default-adjudication202011110619201EpLEjvD

```
{
  "id": "mosip.manual.adjudication.adjudicate",
  "requestId": "987654321-89AB-CDEF-0123-456789ABCDEF",
  "responsetime": "2019-02-14T12:40:59.768Z",
  "returnValue": "1",
  "candidateList": {
    "count": "1",
    "candidates": [
      {
        "referenceId": "27847657360002520181208123451",
        "analytics": {
          //This section is optional 
          "primaryOperatorID": "110011",
          "primaryOperatorComments": "<comments provided by operator>",
          "secondaryOperatorID": "110012",
          "secondaryOperatorComments": "<comments provided by operator>",
          "key1": "value1",
          "key2": "value2"
        }
      }   
    ],
    "analytics": {
      // This section is optional
      "key1": "value1",
      "key2": "value2"
    }
  }
}
```



