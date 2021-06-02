# Identity Services

## Create Identity Data and Documents in Repository
* Upon receiving the request to store identity details of individual in ID Repository, the system validates input ID attributes in the request against MOSIP ID defined for the country.
    1. Stores ID JSON of an individual generated during registration
    2. Receives and stores individual biometric documents generated during registration
    3. Receives and stores documents of proofs provided by individual at the time of registration
    4. On successful storage of identity for an individual, status of UIN of the individual is marked as 'ACTIVATED'

## Retrieve the Stored Identity Details by UIN
* Upon receiving a request to retrieve identity details of an individual based on input UIN and type as an optional parameter, the system performs the following steps to retrieve the stored identity details and related documents

    1. Validates if input UIN is 'ACTIVATED'
    2. Retrieves latest ID of individual
    3. The system retrieves and sends a response based on the type of request as follows:
        * If demographic details are requested, system retrieves demographic documents in the response
        * If biometric details are requested, system retrieves biometric documents in the response
        * If both biometric and demographic details are requested, system retrieves both biometric and demographic documents in the response

## Retrieve the Stored Identity Details by RID
* Upon receiving a request to retrieve identity details of an individual based on input RID and type as an optional parameter, the system performs the following steps to retrieve the stored identity details and related documents:

    1. Retrieves UIN mapped to input RID
    2. Validates if mapped UIN is 'ACTIVATED'
    3. Retrieves latest ID of individual
    4. The system retrieves and sends a response based on the type of request as follows:
        * If demographic details are requested, system retrieves demographic documents in the response
        * If biometric details are requested, system retrieves biometric documents in the response
        * If both biometric and demographic details are requested, system retrieves both biometric and demographic documents in the response

## Update Identity Data and Documents in Repository
* Upon receiving a request to update identity details of an individual, the system performs the following steps:

    1. Validate if input UIN is 'ACTIVATED'
    2. Updates input ID attributes of individual
    3. If request contains demographic documents, the system updates with the latest documents received
    4. If request contains biometric document of individual, the system updates with the latest documents received
    5. If request updates status of UIN as 'DEACTIVATED' or 'BLOCKED', the system updates the same
    6. Sends the response with updated ID details of individual

## To Do
## API Details
 * [API Documentation](https://nayakrounak.gitbook.io/mosip-docs/v/1.2.0/modules/id-repository/Credential-Service-API-Documentation.md)

* Configuration Parameters
    * List of parameters and how they alter the behaviour of the API

## Links to related content
* Links to design documentation
* Links to How To articles

