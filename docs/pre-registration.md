# Pre-registration

## Overview

Pre-registration module enables a resident to:

* enter demographic data and upload supporting documents,
* book an appointment for one or many users for registration by choosing a suitable registration center and a convenient time slot,
* receive appointment notifications,
* reschedule and cancel appointments.

Once the resident completes the above process, their data is downloaded at the respective registration centers prior to their appointment, thus, saving enrollment time. The module supports multiple languages.

MOSIP provides backend APIs for this module along with a reference implementation of [pre-registration portal](pre-registration.md#pre-registration-portal).

## Pre-registration process

![](\_images/pre-reg-process.png)

### Create an application

* User provides consent
* User provides demographic information
* User uploads supporting documents (Proof of Address, Birth certificate, etc.)
* A pre-registration request ID known as [AID](identifiers.md#rid-aid) is generated and provided to the user.

_Note_:  The AID was formerly called PRID in the pre-registration context.
### Book an appointment

* User selects a registration center based on postal code, geo-location, etc.
* The available slots are displayed
* An option to cancel and re-book the appointment is made available

### Receiving acknowledgement notifications

* An acknowledgement is sent via email/SMS
* The user can print the acknowledgement containing AID and QR code.
* This QR code can be scanned at the in-person registration centers.

### Download of pre-registration data at registration centers

* User provides the AID/ QR code at the registration center.
* The registration form gets pre-filled with the pre-registration data.

## Pre-registration module

The relationship of the pre-registration module with other services is explained here. _NOTE: The numbers do not signify sequence of operations or control flow_

![](\_images/pre-reg-entity.png)

1. Fetch [ID Schema](id-schema/) details with the help of Syncdata service.
2. Fetch a new OTP for the user on the login page.
3. Log all events.
4. Pre-Registration interacts with Keycloak via [`kernel-auth-adapater`](https://github.com/mosip/mosip-openid-bridge/tree/release-1.2.0). The Pre-Reg module communicates with endpoints of other MOSIP modules. However, to access these endpoints, a token is required. This token is obtained from Keycloak.
5. Database used by pre-reg.
6. Generate a new AID for the application.
7. Send OTP in the email/SMS to the user.
8. Registration Processor uses reverse sync to mark the pre-reg application as consumed.
9. Registration clients use [Datasync service](https://github.com/mosip/pre-registration/tree/release-1.2.0/pre-registration/pre-registration-datasync-service) to get the pre-reg application details for a given registration center, booking date and AID.
10. Request data from MasterData service to get data for dropdowns, locations, consent forms etc..

## Services

Pre-registration module consists of the following services:

* [Application](https://github.com/mosip/pre-registration/tree/release-1.2.0/pre-registration/pre-registration-application-service)
* [Booking](https://github.com/mosip/mosip-ref-impl/tree/release-1.2.0/pre-registration-booking-service)
* [Batchjob](https://github.com/mosip/pre-registration/tree/release-1.2.0/pre-registration/pre-registration-batchjob)
* [Datasync](https://github.com/mosip/pre-registration/tree/release-1.2.0/pre-registration/pre-registration-datasync-service)
* [Captcha](https://github.com/mosip/pre-registration/tree/release-1.2.0/pre-registration/pre-registration-captcha-service)

For more details, refer to [Pre-registration repo](https://github.com/pjoshi751/pre-registration/tree/develop).

## Pre-registration portal

MOSIP provides a **reference** implementation of the pre-registration portal that may be customized as per country needs. The sample implementation is available at [reference implementation repository](https://github.com/mosip/mosip-ref-impl). For getting started with the pre-registration, refer to the [Pre-registration user guide](pre-registration-user-guide.md)

## Build and deploy

To access the build and read through the deployment instructions, refer to [Pre-registration repo](https://github.com/mosip/pre-registration/tree/release-1.2.0).

## Configurations

For details related to Pre-registration configurations, refer to [Pre-registration configuration](https://github.com/mosip/pre-registration/blob/release-1.2.0/docs/configuration.md).

## Developer Guide
To know more about the developer setup, read [Pre-registration Developers Guide](https://docs.mosip.io/1.2.0/modules/pre-registration/pre-registration-developer-setup).

## API

Refer [API Documentation](https://mosip.github.io/documentation/1.2.0/1.2.0.html).

## Source code

[Github repo](https://github.com/mosip/pre-registration/tree/release-1.2.0).
