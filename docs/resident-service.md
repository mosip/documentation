# Resident Service

## Overview
Resident services are the self-services which are used by the residents themselves via a portal. Resident Portal is a web based UI application that provides residents of a country the services related to their Unique Identification Number (UIN).
The key services provided are:
* Check registration status
* Lock/unlock authentication 
* Download card 
* Request printed card
* Request Virtual ID (VID)
* Request authentication history
* Update personal details

{% hint style="info" %}
Every resident services API call authenticates via an OTP except for the Registration ID(RID) status
{% endhint %}

## Resident services functionality
Below are some of the features associated with Resident services,

### Functional features
* Ability to track application status
* Manage ID
    * Download for credentials such as a printable card with QR code
    * Update of demographic data
    * Request for re-print of card
    * Request for new virtual ID
* Privacy features
    * View authentication history
    * Block and unblock authentication modes
    * On-demand creation and revocation of virtual ID

### Technical features
* The back-end is a set of services with a REST API interface (provided by MOSIP)
* The front-end is a portal to be developed by the adopter according to their requirements
* Email or phone number based login

## Functionality
* **Registration status**- This feature allows an individual to track status of their UIN generation.
Input- The individual needs to provide the Registration ID (received during UIN registration). OTP is not required here.
Output- The system validates this RID and on successful validation, sends the status of UIN generation to the individual's registered mobile number and/or email ID.
* **Auth lock**- Resident can lock or unlock their authentication
Input- 
Output-
## Services
For detailed description of Resident Services, code and design, refer to resident services repo

## Build and deploy
For build and deploy instructions, refer to resident services repo

## APIs
For details on resident services APIs, refer to

## Specifications
To know more about the resident service portal specifications, read 
A prototype UI app illustrating the functionality of the portal may be made available by MOSIP for reference. 
