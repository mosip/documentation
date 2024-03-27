# Deduplication and Manual Adjudication

Providing unique identity for a resident is one of key features of any identity platform. Hence, in MOSIP, we provide features like demographic and biometric de-duplication followed by manual adjudication to identify the uniqueness of a resident's demographic and biometric details.

## De-Duplication

De-duplication is the process to find a duplicate by comparing the individual’s details (biometric and demographic data) with the data stored in the system.

### Demographic De-Duplication

In demographic de-duplication the MOSIP system compares some of the demographic data (i.e. Name, Date of Birth and Gender) of the resident against the data present in MOSIP System (the resident's those who have already registered in MOSIP). If any potential match is found, the MOSIP system sends the resident's biometrics to the ABIS system to confirm if the biometrics are also matching.

#### Process Flow

1. MOSIP System receives a request to perform demographic de-duplication for Person A.
2. MOSIP System performs demographic de-duplication for Person A by, i. Adding Person A's hashed demographic details (i.e. name, date of birth and gender) in the database. ii. Comparing Person's details against all the records in the database.
3. Let's say the MOSIP System find duplicates against three records - Person B, Person C and Person D. i. If Person B's registration has failed we consider Person B not to be a potential match for Person A. ii. If Person C's registration process in not complete, i.e. UIN is not generated for person C yet, we do not consider Person C to be a potential match for Person A in Demo Deduplication. iii. If Person D's registration is completed and a UIN is associated then we consider Person D to be a potential match for Person A.
4. Now the list of Potential Matches for Person A (here, we only have Person D as the only potential match, there can be a scenario where there are multiple potential matches for Person A) are sent to ABIS to perform de-duplication against the potential matches.
5. Here, we ask ABIS to just perform match of Person A's biometrics with Person D's biometrics, we call this process a Gallery Match in ABIS. As we are asking ABIS to perform biometric de-duplication of Person A against the gallery that we have sent. i. If the ABIS confirms that Person D's biometrics matches with Person A's biometrics, MOSIP would REJECT Person A's packet. ii. If the ABIS says that Person A's and Person D's biometrics are different, we move the packet for biometric deduplication.

![](\_images/biometrics/deduplication-deographic\_deduplication.png)

### Biometric De-Duplication

In biometric de-duplication the MOSIP system sends the biometrics of the resident to an ABIS System (Automated Biometrics Identification System). Here, the expectation from the ABIS system is to perform biometric de-duplication (1:N match) against all the records that it has stored earlier.

{% hint style="info" %}
Any Packet irrespective of it has gone through demographic de-duplication or ABIS gallery match, will have to go through the biometric de-duplication stage.
{% endhint %}

#### Process Flow

1. MOSIP system receives a request to perform biometric de-duplication for Person A.
2. MOSIP system sends an insert request to the ABIS system to insert Person A's biometrics in ABIS via. MOSIP-to-ABIS queue.
3. ABIS system processes the request sent by MOSIP and sends a response back to MOSIP via. ABIS-to-MOSIP queue.
4. MOSIP system now sends a identify request to the ABIS system to perform de-duplication for Person A in ABIS via. MOSIP-to-ABIS queue.
5. ABIS System processes the request and sends the list of potential matches back to MOSIP via. a ABIS-to-MOSIP queue.
6. Let's say the ABIS system has found duplicates against three records - Person B, Person C and Person D. i. If Person B's registration has been REJECTED, we consider Person B not to be a potential match for Person A. ii. If Person C's registration is under processing, we consider Person C to be a potential match for Person A. iii. If Person D's registration is completed and a UIN is associated, we consider Person D to be a potential match for Person A.
7. Now the list of Potential Matches for Person A (here, we have Person C and Person D as the potential matches) are sent to Manual Adjudication System to take the final decision.

![](\_images/biometrics/deduplication-biometric\_deduplication.png)

## Manual Adjudication

When biometric duplicates are found in ABIS, MOSIP system sends a request for Manual Adjudication to the Manual Adjudication System via. a queue. The system integrator can build the Manual Adjudication System, which would be listening to the MOSIP-to-ManualAdjudication queue for any Manual Adjudication requests and send a response back in the ManualAdjudication-to-MOSIP system after verifying the data.

The data sent to the Manual Adjudication system is driven by a policy defined in MOSIP and the specification is similar to ABIS identify request.

### Request sent to Manual Adjudication System

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

### Response received from Manual Adjudication System

```
{
  "id": "mosip.manual.adjudication.adjudicate",
  "requestId": "4d4f27d3-ec73-41c4-a384-bf87fce4969e",
  "responsetime": "2021-01-19T13:16:22.930Z",
  "returnValue": "1",
  "candidateList": {
    "count": "1",
    "candidates": [
      {
        "referenceId": "10002100741000120210107111325",
        "analytics": { //This section is optional and can be decided by the System Integrator.
          "primaryOperatorID": "110011",
          "primaryOperatorComments": "<comments provided by operator>",
          "secondaryOperatorID": "110012",
          "secondaryOperatorComments": "<comments provided by operator>",
          "key1": "value1",
          "key2": "value2"
        }
      }
    ],
    "analytics": { //This section is optional and can be decided by the System Integrator. This is used when there is no match found.
      "key1": "value1",
      "key2": "value2"
    }
  }
}
```

## Process Flow for Biometric Deduplication

![](\_images/biometrics/abis\_middleware-process\_flow.png)
