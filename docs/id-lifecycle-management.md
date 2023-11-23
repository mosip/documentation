# 🆔 ID Lifecycle Management

## Overview

Identity Lifecycle Management refers to the **process of issuing and managing user identities** in a given system. An individual can visit a registration centre to get a new ID or update their ID details. A registration officer would typically capture the individual’s demographic (name, date of birth, gender, etc.) and biometric (face, iris, and fingerprint image) details.

The various life cycle events are briefly explained below:

* New ID issuance (for adults and infants)
* ID data update or update individual’s information
* De-activate or re-activate the individual’s ID
* Lost ID
* Correction process

## New ID issuance

![](\_images/id-registration-process.jpg)

### Pre-registration

[Pre-registration](pre-registration.md) is a resident-facing web-based portal that allows a resident to provide registration data, upload document proofs and book an appointment with a registration centre to complete the rest of the registration process. This data can be accessed by the registration officers who could then complete the registration process such as collecting biometrics, verifying the documents and other formalities thus saving time and effort at the registration centre.

A resident can access the pre-registration portal and do the following:

* Enter demographic data and upload supporting documents
* Book an appointment for one or many users for registration by choosing a suitable registration centre and a convenient time slot
* Receive appointment notifications
* Reschedule, update and cancel appointments

### Registration (enrolment)

Registration is a process that allows a resident to provide demographic information and biometrics by visiting a registration centre. The [Registration Client](registration-client.md) operated by a registration officer is used to securely capture the details and send them to [Registration Processor](registration-processor.md) for processing and issuance of an ID. If a resident has pre-registered, the registration officer can retrieve the registration data by giving the pre-registration ID to the Registration Client.

#### For adults

* The resident visits a registration centre.
* The registration officer captures demographic details, biometrics and documents and uploads the same for processing.
* Upon successful registration, a registration ID (RID) is allocated to the resident and an acknowledgement slip containing the captured details and the RID is issued (printed) to the resident as proof of registration.
* The registration processor processes the registration details perform quality checks and checks for duplicate entries (de-duplication).
* Upon successful processing, a Unique Identification Number (UIN) is allocated to the resident and a notification is sent to the resident on the registered phone number and/or email.
* Upon a failure in processing, the registration process is discarded and a notification is sent to the resident on the registered phone number and/or email.

#### For infants/children

* A child visits the registration centre along with a guardian/parent.
* The registration officer captures the demographic details along with the face photo.

_Note: For infants/children less than 5 years old, the Registration Client does not capture the biometrics as they are still evolving. However, the country may choose to override the same by modifying the rules accordingly._

* Parent/guardian' UIN or RID and the biometrics needed for authentication are captured.
* Additionally, a **proof of relationship** document is uploaded.
* Upon successful registration, an acknowledgement receipt containing the registration ID is issued to the parent/guardian.

## ID data update/updating individual’s information

* Residents can update their information in two ways:
  * By visiting the registration centre: The demographic and biometric information can be updated at the centres.
  * Update only the demographic information using [Resident Services](https://docs.mosip.io/1.2.0/modules/resident-services).
* Registration receipt containing the Registration Identity(RID), labels and data in the configured language, and QR code (of the RID) provided to the resident at the centre.
* Updated ID credentials were sent to the resident via the country’s configured printing and postal service.
* Notifications were sent to the resident using the email ID and mobile number provided as a part of demographic data collection.

## De-activate/re-activate individual’s ID

* De-activate ID means an individual will not be able to authenticate themselves by using the UIN or VID.
* If a country wants to deactivate an individual’s ID for any specific reason, the system deactivates the individual’s ID after certain validations are performed in the [Registration Processor](registration-processor.md).
* Likewise, a country can also re-activate an individual’s ID as need be.

## Finding a lost ID

In the event of loss of the ID, the resident can go to the nearest registration centre and provide his/her biometrics and optionally provide demographic details. The details are sent to the MOSIP server which performs a biometric and demographic match. Upon a successful match, MOSIP provides mechanisms to retrieve the UIN of the resident which may be printed and delivered to the resident. Notifications are sent to the resident's registered email and/or phone.

## Correction process

* In case the system finds an error in the demographic data, documents or biometric data provided by an individual, the correction flow is triggered.
* Before issuing the UIN for the individual, the incorrect or incomplete information provided by the individual is intimated to them.
* Once the corrected information is received by the system, a correction procedure is triggered.
* Updated ID credentials are sent to the resident via the country’s configured printing and postal service.
