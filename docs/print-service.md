# Print Service Integration

This document explains the **Print Service** and other components along with a detailed technical understanding of the architecture and design of integrating MOSIP with external print partners.

## Overview

As per the current approach, after a UIN is successfully processed, the Registrations Processor’s Printing Stage calls the Credential Service to create a credential for print. This credential is pushed to the WebSub and the Printing systems consumes the same.

MOSIP has introduced the Print Service as a reference implementation to print the _euin_, _reprint_, _qrcode_, [credential types]() in PDF format. This service is intended to be customized and used by a card printing agency who will need to on-board onto MOSIP as a Credential Partner before deploying the service.

Below is an entity relationship diagram highlighting the relationship of Print Service with other modules.

![](\_images/print-service.png)

1.	Receives events from [WebSub](https://docs.mosip.io/1.2.0/modules/websub).
2.	Fetches [templates](https://github.com/mosip/print/blob/release-1.2.0.1/docs/configuration.md#template) from Masterdata.
3.	After creating the PDF card, Print Service uploads the same to [Datashare](https://docs.mosip.io/1.2.0/modules/datashare).
4.	Publishes event to WebSub with updated status and Datashare link.

The card data in JSON format is published as a WebSub event. The print service consumes the data from event, decrypts using partner private key and converts into PDF using a pre-defined [template](https://github.com/mosip/print/blob/release-1.2.0.1/docs/configuration.md#template).
To know more about the different configurations, steps for build and deployment, refer to the documentation in the [Print](https://github.com/mosip/print) repository.

## Design

**MOSIP Server**: All the components that are responsible for generating and sharing credentials resides inside the MOSIP server. Registration requests or updates are sent to the MOSIP server for processing.  The MOSIP server after successfully processing the registration data generates a Unique Identification Number (UIN) which is unique to every resident of a country.   

**Print Stage**: This is a component inside the MOSIP server which is responsible for generating a credential and sharing it with the Partner printing system.

**Partner Printing System**: An external printing solution onboarded as a ‘credential partner’ by MOSIP using MOSIP’s partner management framework. It securely consumes the credential from the MOSIP server through a standard interface and uses the data inside the credential for printing. The partner printing system may offer the following services based on the country’s printing choices
    * Ability to print plastic cards 
    * Ability to print a PDF document and email it to the registered email ID
    * Generate a QR code to be used while printing ID cards
    * A centralized printing management system developed by a third party that might manage the printing and posting of ID cards to designated residents
    
**WebSub**: WebSub is a websocket used by MOSIP for sharing data with MOSIP partners. MOSIP’s print stage shares the credential with the partner printing system through [WebSub](https://docs.mosip.io/1.2.0/modules/websub). The credentials shared are in the form of [Verifiable Credentials(VCs)](). 

## Architecture

The below diagram depicts the technical architecture of the solution. 

**Print Stage** : This s a stage on the MOSIP server that requests the credential request generator to generate a credential for a given print partner or partners based on a custom-built logic. For example, the custom logic may be to route the print request to a a specific regional print partner.  

**Credential Request Generator**: This is a component on the MOSIP server that stores the credential request in the Credential transaction Database to be consumed by the Credential Service.  

**Credential Service** : This is a component on the MOSIP server that is responsible for generating a credential. The credential service does the following 

* Constructs the credential based on the partner policy (that defines the type of the credential and the data that must be shared as a part of the credential) and stores the credential into the datashare.    
* The datashare returns the URL which is published by the credential service inside WebSub event hub as a message against a partner topic.   
* WebSub picks up the event from the event hub and shares it with the Partner Print System through a callback mechanism via a standard REST interface.
* The partner print system retrieves the datashare URL from the event and downloads the credential from the Datashare and returns the status back to WebSub. 
* The following statuses may be returned:

    * RECEIVED: Indicates that the credential request has been received.
    * DOWNLOADED: Indicates that the credential has been downloaded.
    * VALIDATED : Indicates that the credential has been validated.
    * PRINTED: Indicates that the credential has been printed.
    * ERROR: An error occurred while processing the credential.

To know more, refer [Credential Service](https://docs.mosip.io/1.2.0/modules/id-repository#credential-service).

To learn about the Credential Types, refer [Verifiable Credentials Data Model v1.1](https://www.w3.org/TR/vc-data-model/).

## Partner Print System 

The partner print system has to be amended with the functionality to receive the credential from MOSIP and interpret it. The following are key sequence of operations:

1. Receive the datashare URL of the credential from WebSub
2. Download the credential from the datashare URL 
3. Decrypt the credential using the private key
4. Validate the credential
5. Parse and extract the demographic and biometric data (eg:- photograph) 
6. Print the ID card 

_Note_: The way the credential is processed and interpreted is left to the implementation of the partner printing system and is outside the scope of MOSIP.   

The partner printing system is expected to expose an API end point for MOSIP to publish the datashare URL of the credential.   

## Implementing Print Service (Partner Printing System)

For MOSIP to communicate with the partner printing system,  the partner printing system is expected to implement a print service.   

_Note_: The print service may be considered as an extension to the functionality of the partner printing system.  It may also be implemented as a separate microservice and linked to the partner printing system.  The technology, architecture and language of the print service implementation is outside the scope of MOSIP.

For implementing the print service, following is the procedure:

* The Print Service will be called/ invoked only by WebSub (Subscription engine) with credential request event using registered callback URL.

_Sample callback url_: `https://{PrintProviderName}-printservice.print/v1/print/callback/notifyPrint`

_Sample credential request:_

```
{
	"publisher": "CREDENTIAL_SERVICE",
	"topic": "{mosip.partner.id}/CREDENTIAL_ISSUED",
	"publishedOn": "2023-05-04T13:21:01.565Z",
	"event": {
		"id": "324190df-3071-429a-9eec-182008c7b123",
		"transactionId": "37238d20-3dcd-4aa3-851b-6240956fb432",
		"type": {
			"namespace": "mosip",
			"name": "mosip"
		},
		"timestamp": "2023-05-04T13:21:01.565Z",
		"dataShareUri": "http://datashare.datashare/v1/datashare/get/mpolicy-default-euin/mpartner-default-print/mpartner-default-printmpolicy-default-euin20230504132101mDBLJnCc",
		"data": {
			"registrationId": "10013100370000520230504123911",
			"ExpiryTimestamp": "9999-12-31T23:59:59.100",
			"TransactionLimit": null,
			"proof": {
				"signature": "eyJ4NWMiOlsiTUlJRHRUQ0NBcDJnQXdJQkFnSUlFTDN2UzV5VHVGRXdEUVlKS29aSWh2Y05BUUVMQlFBd2NERUxNQWtHQTFVRUJoTUNTVTR4Q3pBS_yPau0n049iZ81r0QV1MrKppldeGyklbH8jAdtIvoVI6COkW6QSzeimHI9EB1L9g"
			},
			"credentialType": "vercred",
			"protectionKey": "959920"
		}
	}
}
```

* Once the request is received by the Print Service, it immediately sends back the `CredentialStatusEvent` "RECEIVED" to WebSub indicating that it has received the credential URL.

_Sample status update request:_

```
{
	"publisher": "PRINT_SERVICE",
	"topic": "CREDENTIAL_STATUS_UPDATE",
	"publishedOn": "2023-03-30T06:51:48.177Z",
	"event": {
		"id": "1389e511-914e-4696-b1db-6ce8723d7212",
		"requestId": "8b388343-ab91-4ade-b68f-5f248060f0bd",
		"timestamp": "2023-03-30 06:51:48.177843",
		"status": "RECEIVED",
		"url": "https://api-internal.mosip.net/v1/datashare/get/mpolicy-default-resident/mpartner-default-resident/{mosip.datashare.partner.id}mpolicy-default-resident20230324065147HVeiufGl"
	}
}
```

* Download the encrypted credential using the dataShareURL.
* Upon successfully downloading the credential, publish the `CredentialStatusEvent` as "DOWNLOADED" to WebSub to update the status.
* Decrypt the credential using partner printing system’s private key.
    * Sample Decrypted Response: Please refer the Verifiable Credential section below.
* Validate the credential using the credential’s JWS signature inside the credential proof section
* Publish the `CredentialStatusEvent` "VALIDATED" to WebSub to update the status.
* Consume the validated credential and process it for further printing. The processing of the credential is left to the implementation of the partner printing system. For example, the partner printing system may parse and format the credential and store it in a database or a Message Queue as per the design and implementation of the partner printing system.
* After successfully printing, publish the  CredentialStatusEvent "PRINTED" to WebSub to update the status. 
* If any error is observed during the above process, publish the `CredentialStatusEvent` "ERROR" to WebSub to update the status.  

 A sample response for error would be:
 
 ```
 {
	"publisher": "PRINT_SERVICE",
	"topic": "CREDENTIAL_STATUS_UPDATE",
	"publishedOn": "2023-03-30T06:51:48.177Z",
	"event": {
		"id": "1389e511-914e-4696-b1db-6ce8723d7212",
		"requestId": "8b388343-ab91-4ade-b68f-5f248060f0bd",
		"timestamp": "2023-03-30 06:51:48.177843",
		"status": "ERROR",
		"msg": "Unable to decrypt credential data"
		"url": "https://api-internal.mosip.net/v1/datashare/get/mpolicy-default-resident/mpartner-default-resident/{mosip.datashare.partner.id}mpolicy-default-resident20230324065147HVeiufGl"
	}
}
```

_Note_: The “ERROR” status and the message next to it.

The following are standard error messages that should be returned to MOSIP: 

* “Unable to decrypt credential data”
* “Unable to download credential”
* “Unable to validate credential”
* “Error receiving credential event”
* “Unable to print”


