# Resident Services

## Overview
Resident services are the self-services which are used by the residents themselves via a portal. Resident Portal is a web based UI application that provides residents of a country the services related to their Unique Identification Number (UIN). The residents can perform various operations related to UIN/VID and can raise concerns if any through the portal.

The key services provided by resident services are:
1.	Get information (no validation required)
    * Get the list of the registration center
    *	Get the list of supporting documents
2.	Get my UIN using UIN/ VID/ AID (validation required)
3.	Verify email ID and/or phone number (validation required)
4.	Login using UIN/ AID/ VID and OTP/ biometrics/ QR code (validation required) to:
	  * View History
    *	Share credentials with a partner
    *	Order a physical card
    *	Download a personalized card
    *	Track a service request
    *	Secure my ID
    *	Manage my VID
    *	Self-update my data
    *	Get notifications
    *	View the name, photo, and last login details of the logged-in user
    *	Logout
5.	Multi-browser support
6.	Multi-language support
7.	Redirection to pre-registration portal for the following features: (log in using email ID/phone number: (validation required)
    *	Book an appointment for new enrolment (pre-registration)
    *	Book an appointment to retrieve lost UIN
    *	Book an appointment to update UIN


Below is an image summarizing the features provided in Resident Services portal.

![](_images/rs-feature-list.png)

The relationship of Resident services with other services is listed below. 

_Note: The numbers do not signify sequence of operations or the control flow._

![](_images/resident-services.png)

1.	Audit Manager: Resident services sends all the audit logs to the Audit manager.
2.	Digital card service: Resident services use this service to download the PDF of the UIN card or VID card.
3.	Print partner: Resident services use this service to perform activities related to the printing of the credential.
4.	Credential Request Generator Service: Resident services use this service to share the credential with various partners like print partners, authentication partners, and digital card partners.
5.	ID Repository Identity Service: Resident services use this service to retrieve the identity information of a credential and to lock/unlock authentication types.
6.	ID Repository VID service: Resident services use this service to generate/revoke various types of VIDs.
7.	ID Authentication: This service is used by Resident services to authenticate users.
8.	MOSIP IdP: This is used to authenticate and authorize the users in an event of logging in using UIN/ VID.
9.	Resident UI: This is the interface through which users can interact with the Resident services.
10.	Web Sub: This is used to get asynchronous notification from IDA for acknowledgment purposes.
11.	Registration Processor: This is used to sync and upload packets for features pertaining to changes in identity data.
12.	Packet Manager: Resident services use this service to create packets.
13.	Partner Management Service: Resident services uses this service to get information about various partners and policies.
14.	Keycloak: Resident services uses this to authenticate in order to access the MOSIP internal APIs.
15.	Master data service: Resident services invoke the Master Data services to get various templates and machine details.
16.	Notification service: Resident services uses this service to send various notifications through email or SMS.
17.	Key Manager: Resident services uses this manager to encrypt or decrypt the data used across features.


## Design principles

The design of the Resident portal has to embody the following principles:

* __One-stop solution__: The resident portal is designed to have components that aim to solve all the queries, issues, or discrepancies of the residents and will act as a one-stop solution for all the requirements.
* __Self-Sovereign__:- Once the ID is issued by an authority the user/resident/citizen chooses to control this in their choice of devices with no central authority.
* __Inclusive__: The Resident portal aims to be available in all browsers while also catering to the needs of visually impaired, dyslexic and colour-blind folks.
* __Presence assurance__: The Resident portal would put in all its efforts to assure presence.
* __Works Remote__: The resident portal should be able to share credentials when data needs to be shared through remote mode.
* __Trusted__: The identity verification process on the device should be trusted so that it can be used in service delivery without any concern.
* __Grievance redressal__: The Resident portal will ensure that in case of any concerns or grievance, the issue is raised and resolved through the portal itself.

## Services
For detailed description of Resident Services, code and design, refer to [resident services repo](https://github.com/mosip/resident-services/tree/release-1.2.0).

## Resident portal
MOSIP provides a reference implementation of the Resident portal that can be customized as per the country’s needs. The sample implementation is available at *insert reference implementation repository link*. 
For getting started with the resident portal, refer to the *Resident services user guide link*

## Build and deploy
To access the build and read through the deployment instructions, refer to insert resident services repo link

## Configurations
For details related to resident portal configurations, refer to *insert Resident services configuration link*

## Developers Guide
For a detailed description of Resident Services, code, and design, refer to *insert resident services developer’s guide link*

## API
Refer [API Documentation](https://mosip.github.io/documentation/release-1.2.0/release-1.2.0.html).

## Source code 
[Github repo](https://github.com/mosip/resident-services/tree/release-1.2.0).

