# MOSIP Token Seeder

## Overview

MOSIP Token Seeder (**MTS**) is a standalone service that outputs [MOSIP Token ID](https://docs.mosip.io/1.2.0/id-lifecycle-management/identifiers#token-id) for a given input list of UIN/VIDs after performing authentication with [IDA](https://docs.mosip.io/1.2.0/id-authentication). The service is a convenience module that makes it easy for [Relying Parties](https://docs.mosip.io/1.2.0/id-authentication#relying-parties-and-policies) to perform bulk authentication to onboard users to their systems. One of the intended use cases of MTS is to seed existing beneficiary registries for deduplication. Similarly, entities like banks can run the MTS service to onboard users.

## Features of MTS

* Bulk upload
* Support for multiple inputs and outputs (see diagram below). For instance, a CSV file may be uploaded, and the downloaded file will contain a column with tokens populated.
* [REST interface](./#api).
* PII at rest is encrypted. Further, the PII is erased after processing.
* Works in asynchronous mode - queues all the requests.

![](https://github.com/mosip/openg2p/raw/main/docs/.gitbook/assets/seeder.png)

## Inputs

1. Direct Plain KYC Request
2. CSV Upload
3. ODK based upload
4. JSON Array Upload
5. Google Sheets upload
6. Form.IO Sheets upload
7. VC

## Outputs

1. Direct Synchronous Response
2. CSV
3. JSON

### Delivery type

1. Synchronous Response
2. Web Sub
3. SFTP
4. Download URL
5. Callback

## Design

![](\_images/mosip-token-seeder-block-diagram.png)

### Authtoken API

Authtoken API is a RESTful interface to accept various auth request input for the Token Seeder system. The API works in a complete asynchronous mode. [Relying party](https://docs.mosip.io/1.2.0/id-authentication#relying-parties-and-policies) is returned a request identifier when they make successful authtoken request. Status check API can be used to poll the status of the request placed. In case the status returns a processed state, the output can be accessed, as configured in the primary request for. Eg. If the request was for a file download, the file download API can be called to return the output file.\
&#x20;\
Refer [MOSIP Token Seeder API](mosip-token-seeder-api.md) for a detailed API documentation.

### Token seeder

Token seeder is a batch processing module which initiates the token authentication process. Once a new request is enqueued into the token seeder, it fetches the same and sends the request on a record level to the authenticator module. Token seeder is also responsible for updating the success and failure status to the database.\
There is also a expiry program for clearing off the request already processed from the system based on the expiry settings configured.       &#x20;

### Authenticator

Authenticator process takes in a valid authentication request and performs the demographic authentication with the [MOSIP IDA](https://docs.mosip.io/1.2.0/id-authentication) server. Each auth request is well formed, encrypted and signed before its sent to the [MOSIP IDA](https://docs.mosip.io/1.2.0/id-authentication). It passes on the response received to the caller regardless of the status received. \
Authenticator module can also be used as a individual library outside of MOSIP token seeder for any use case it applies to.&#x20;

## Other links

### API documentation

Refer [API](mosip-token-seeder-api.md).

### Source code

Refer [GitHub](https://github.com/mosip/mosip-token-seeder).

### Test

### User stories

Refer [Jira](https://mosip.atlassian.net/browse/MOSIP-23029).

### Installation

Refer [README](https://github.com/mosip/openg2p/blob/develop/mosip\_token\_seeder/README.md).

