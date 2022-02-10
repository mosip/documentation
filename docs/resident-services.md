# Resident Services

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

The relationship of Resident services with other services is listed below. 

_Note: The numbers do not signify sequence of operations or the control flow._

![](_images/resident-services.png)

1. Resident Services invokes [ID Authentication](id-authentication-services.md) services to authenticate users.
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
Refer [API Documentation](https://mosip.github.io/documentation/1.2.0-rc2/1.2.0-rc2.html).

## Source code 
[Github repo](https://github.com/mosip/resident-services/tree/release-1.2.0).

