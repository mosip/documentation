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

![](_images/rs-feature-list)

The relationship of Resident services with other services is listed below. 

_Note: The numbers do not signify sequence of operations or the control flow._

![](_images/resident-services.png)

1. Resident Services invokes [ID Authentication Services](id-authentication-services.md)  to authenticate users.
2. It invokes the Masterdata services to get language templates and machine details.
3. To create perpetual and temporary VID and to revoke VID, resident services calls ID Repository.
4. To sync packets and upload packets, resident services connects to [registration processor](registration-processor.md).
5. Resident services sends all the audit logs to Audit manager.
6. Notifier handles all the communication from resident services.
7. Download UIN card can be handled through credential services.
8. [Partner Management Services](partner-management-services.md) provides all the credential policies to resident services.
9. Creating packets is done through [packet manager](packet-manager.md) in resident services.

## Services
For detailed description of Resident Services, code and design, refer to [resident services repo](https://github.com/mosip/resident-services/tree/release-1.2.0).

## API
Refer [API Documentation](https://mosip.github.io/documentation/release-1.2.0/release-1.2.0.html).

## Source code 
[Github repo](https://github.com/mosip/resident-services/tree/release-1.2.0).

