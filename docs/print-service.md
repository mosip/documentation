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
* **WebSub**: WebSub is a websocket used by MOSIP for sharing data with MOSIP partners. MOSIP’s print stage shares the credential with the partner printing system through WebSub. The credentials shared are in the form of Verifiable Credentials (VCs). 
