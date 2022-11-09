# MOSIP Token Seeder

## Overview

MOSIP Token Seeder (**MTS**) is a standalone service that outputs [MOSIP Token ID](https://docs.mosip.io/1.2.0/id-lifecycle-management/identifiers#token-id) for a given input list of UIN/VIDs after performing authentication with [IDA](https://docs.mosip.io/1.2.0/id-authentication). The service is a convenience module that makes it easy for [Relying Parties](https://docs.mosip.io/1.2.0/id-authentication#relying-parties-and-policies) to perform bulk authentication to onboard users to their systems. One of the intended use cases of MTS is to seed existing beneficiary registries for deduplication. Similarly, entities like banks can run the MTS service to onboard users.

## Features of MTS

* Bulk upload
* Support for multiple inputs and outputs (see diagram below). For instance, a CSV file may be uploaded, and the downloaded file will contain a column with tokens populated.
* REST interface.
* PII at rest is encrypted. Further, the PII is erased after processing.
* Works in asynchronous mode - queues all the requests.

<figure><img src=".gitbook/assets/seeder.png" alt=""><figcaption></figcaption></figure>

## Inputs

1. CSV&#x20;
2. ODK based&#x20;
3. JSON&#x20;
4. Google Sheets (_TBD_)
5. Form.IO Sheets (_TBD_)
6. Verifiable Credentials (VC) (_TBD_)

## Outputs

1. CSV
2. JSON

### Delivery type

1. Download&#x20;
2. Callback
3. Synchronous response
4. WebSub (_TBD_)
5. SFTP (_TBD_)

## Design

![](\_images/mosip-token-seeder-block-diagram.png)

### Authtoken API

Authtoken API is a RESTful interface to accept various auth request input for the Token Seeder system. The API works in a complete asynchronous mode. [Relying party](https://docs.mosip.io/1.2.0/id-authentication#relying-parties-and-policies) is returned a request identifier when they make successful authtoken request. Status check API can be used to poll the status of the request placed. In case the status returns a processed state, the output can be accessed, as configured in the primary request for. Eg. If the request was for a file download, the file download API can be called to return the output file.\
\
Refer [MOSIP Token Seeder API](https://mosip.stoplight.io/docs/mosip-token-seeder/branches/main) for a detailed API documentation.

### Token seeder

Token seeder is a batch processing module which initiates the token authentication process. Once a new request is enqueued into the token seeder, it fetches the same and sends the request on a record level to the authenticator module. Token seeder is also responsible for updating the success and failure status to the database.\
There is also a expiry program for clearing off the request already processed from the system based on the expiry settings configured.

### Authenticator

Authenticator process takes in a valid authentication request and performs the demographic authentication with the [MOSIP IDA](https://docs.mosip.io/1.2.0/id-authentication) server. Each auth request is well formed, encrypted and signed before its sent to the [MOSIP IDA](https://docs.mosip.io/1.2.0/id-authentication). It passes on the response received to the caller regardless of the status received.\
Authenticator module can also be used as a individual library outside of MOSIP token seeder for any use case it applies to.

## Other links

### API documentation

Refer [API](https://mosip.stoplight.io/docs/mosip-token-seeder/branches/main).

### Source code

Refer [GitHub](https://github.com/mosip/mosip-token-seeder).

### Test

Refer [Test Cases](https://github.com/mosip/test-management/tree/master/integration/MTS)

### Installation

Refer [README](https://github.com/mosip/mosip-token-seeder/blob/release-1.0.1/README.md).
