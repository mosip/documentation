# ID Lifecycle Management

## Overview
Identity Lifecycle Management refers to the **process of issuing and managing user identities** in a given system. An individual can visit a registration center to get a new ID or update their ID details. A registration officer would typically capture the individual’s demographic (name, date of birth, gender, etc.) and biometric (face, iris, fingerprint image) details. 

The various life cycle events are briefly explained below:
* New ID issuance (for adults and infants)
* ID data update/update individual’s information
* De-activate/re-activate individual’s ID
* Lost ID
* Correction process

## New ID issuance 

![](_images/id-registration-process.jpg)

### Pre-registration
[Pre-registration](pre-registration.md) is a resident facing web-based portal that allows a resident to provide registration data, upload document proofs and book an appointment with a registeration center to complete the rest of the registration process.  This data can be accessed by the registration operators who could then complete registration process such as collectiong biometrics, verifying the documents and other formalties thus saving time and effort at the registration center.

A resident can access the re-registration portal and do the following:
* Enter demographic data and upload supporting documents
* Book an appointment for one or many users for registration by choosing a suitable registration center and a convinient time slot
* Receive appointment notifications
* Reschedule, update and cancel appointments


### Registration (enrollment)
Registration is a process that allows a resident to provide the demographic information and biometrics by visiting a registration center.  The [Registration Client](registration-client.md) operated by a registration officer is used to securely capture the details and send it to [Registration Processor](registration-processor.md) for processing and issuance of an ID.   If resident has pre-registered, the registration officer can retreive the registration data by giving the pre-registration ID on the registration client.

#### For adults
-    Resident visits a registration center.
-    Registration officer captures demographic details, biometrics and the documents and uploads the same for processing.
-    Upon successful registration, a registration ID (RID) is allocated to the resident and an acknowledgement slip containing the captured etails and the RID is issued (printed) to the resident as a proof of registration.  
-    Registration processor processes the registration details, performs quality checks and checks for duplicate entries (de-duplication).
-    Upon successful processing, a Unique Identification Number (UIN) is allocated to the resident and a notification is sent to the resident on the registered phone number and/or email. 
-    Upon failure in processing, the registration process is discarded and a notification is sent to the resident on the registered phone number and/or email.

#### For infants/children
-    Child visits the Registration center along with a guardian/parent.
-    Registration officer captures the demographic details along with the face photo.

_Note :  For infants/children less than 5 years old, the registration client doesn't capture the biometrics as they are still evolving.  However, the country may choose to override the same by modifying the rules accordingly_

-    Parent/guardian' UIN or RID and the biometrics needed for authentication is captured.
-    Additionally, a **proof of relationship** document is uploaded.
-    Upon successful registration, an acknowledgement receipt containing the registration ID is issued to the parent/gaurdian.

## ID data update/updating individual’s information
-    Residents can update their information in two ways:
        * By visiting the registration center: The demographic and biometric information can be updated at the centers.
        * Update of only the demographic information using [Resident Services](https://docs.mosip.io/1.2.0/modules/resident-services).
-  Registration receipt containing the Registration Identity(RID), labels and data in the configured language, QR code (of the RID) provided to the resident at the center.
-    Updated ID credentials sent to the resident via the country’ configured printing and postal service.
-    Notifications sent to the resident using the email ID and mobile number provided as a part of demographic data collection.

## De-activate/re-activate individual’s ID
-  De-activate ID means an individual will not be able to authenticate themselves by using the UIN or VID. 
-  If a country wants to deactivate an individual’s ID for any specific reason, the system deactivates the individual’s ID after certain validations performed in the [Registration Processor](registration-processor.md). 
- Likewise, a country can also re-activate an individual’ ID as need be.

## Finding a lost ID
-  Individual to provide their biometric information in the Registration center.
-  De-duplication performed to find the individual' ID.
-  Registration receipt containing Registration Identity(RID)), labels and data in the configured language, QR code (of the RID) provided to the resident.
-  ID credentials sent to the resident via the country’ configured printing and postal service.
- Notifications sent to the resident using the email ID and mobile number provided as a apart of demographic data collection.

## Correction process
- Incase the system finds an error in the demographic data, documents or biometric data provided by an individual, the correction flow is triggered.
- Before issuing the UIN for the individual, the incorrect or incomplete information provided by the individual is intimated to them.
- Once the corrected information is received by the system, a correction procedure is triggered.
- Updated ID credentials are sent to the resident via the country’ configured printing and postal service.
   



