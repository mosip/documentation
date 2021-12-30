# Overview

This module enables a user/resident to:
* Enter demographic data and upload supporting documents
* Book an appointment for one or many users for registration by choosing a suitable registration center and a convinient time slot
* Receive appointment notifications
* Reschedule and Cancel appointments

Once the resident completes the above process, their data will be downloaded at the respective registration centers prior to their appointment. This data will further be used during the registration process.

MOSIP pre-registration module supports multiple languages. 

# Why do we need to pre-register on MOSIP?

The pre-registration functionality helps the residents and the Government organizations by saving the time and efforts required for basic data collection of residents at the registration centers. The data pre-filled by the residents on the portal can be made available for use at the centers for quick access and seamless registration process.

![](../_images/overview/ID_Registration_process.jpg)

# Pre-Registration Process

## Create an application

* User provides consent
* User provides demographic information
* User uploads supporting documents (Proof of Address, Birth certificate, etc.)
* a pre-registration request ID (PRID) is generated and provided to the user.

## Book an appointment

* User selects a registration center based on postal code, geo-location, etc.
* The available slots are displayed
* An option to cancel and re-book the appointment is made available


## Receiving acknowledgement notifications

* An acknowledgement is sent via email/SMS 
* The user can print the acknowledgement containing PRID and QR code. 
*  This QR code can be scanned at the in-person registration centers.

## Download of pre-registration data at Registration Centers

* User provides the PRID/QR code at the registration center.
* The registration form gets pre-filled with the pre-registration data.

# Services

Pre-registration module consists of the following services:
* Application 
* Booking
* Batchjob
* Captcha
* Datasync

For more details, refer to [pre-registration repo](https://github.com/pjoshi751/pre-registration/tree/develop)

# Build and deploy
To access the build and read through the deployment instructions, refer to [pre-registration repo](https://github.com/pjoshi751/pre-registration/tree/develop).

# APIs
For detailed functionality of pre-registration APIs, refer to [pre-registration APIs](../../../api-reference/Pre-Registration-APIs.md).

# UI Reference Implementation
MOSIP provides a **reference** implementation of the Pre-registration UI that may be customized as per country needs. The sample implementation is available at [reference implementation repository](https://github.com/mosip/mosip-ref-impl).

# Configurations
For details related to pre-registration configurations, refer to [pre-registration configuration](https://github.com/pjoshi751/pre-registration/blob/develop/docs/configuration.md).
