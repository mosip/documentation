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
[Pre-registration](pre-registration.md) is a resident facing web-based portal using which an individual can pre-enrol and book an appointment for registering in MOSIP. Pre-registration fundamentally helps the residents and Government organizations by saving the time and efforts required for basic data collection of the residents at the registration centers. The data pre-filled by the residents on the portal can be made available for use at the centers for quick access and seamless registration process.

The residents can visit the pre-registration portal and do the following:
* Enter demographic data and upload supporting documents
* Book an appointment for one or many users for registration by choosing a suitable registration center and a convinient time slot
* Receive appointment notifications
* Reschedule and Cancel appointments

Once the resident completes the above process, their data will be downloaded at the respective registration centers prior to their appointment.

### Registration (enrollment)
Registration is the process in which an individual/resident can visit a registration center with or without a pre-registration application ID. They can do a walk-in at the center and give their demographic or biometric details to an operator. In MOSIP, the [Registration Client](registration-client.md) captures the individual' details and packages the captured information in a secure way (in the form of encrypted packets) and sends it to [Registration Processor](registration-processor.md) for further processing.  

#### For adults
-    Resident/individual needs to visit a registration center.
-    Residents need to provide required information to register themselves in MOSIP (first time).
-    Registration officer captures’ individual’s information.
-    The captured information is sent to the [Registration Processor](registration-processor.md).
-    Various checks like biometrics quality, de-duplication, etc. performed in the Registration Processor with the individual's demographic data and biometrics.
-    If no duplicate is found, a Unique Identification Number(UIN) is allocated and ID credentials are sent to the individual via the country's configured printing and postal service.
-    Registration receipt(acknowledgement) containing the Registration Identity(RID), labels and data in the configured language, QR code (of the RID) provided to the resident at the center.
-    Notifications sent to the resident using the email ID and mobile number provided as a part of demographic data collection.

#### For infants/children
-    Child needs to visit the Registration center along with a guardian/parent.
-    Operator needs to capture only the child' face biometrics.
-    Parent/guardian' UIN or RID and biometrics needed for authentication.
-    Additionally, a **proof of relationship** document to be provided at the center.
-    An acknowledgement receipt will be provided to the infant' parent/guardian.

## ID data update/updating individual’s information
-    Residents can update their information in two ways:
        * By visiting the registration center: The demographic and biometric information can be updated at the centers.
        * Update of only the demographic information using [Resident Services](https://docs.mosip.io/1.2.0/modules/resident-services).
-  Registration receipt containing the Registration Identity(RID), labels and data in the configured language, QR code (of the RID) provided to the resident at the center.
-    Updated ID credentials sent to the resident via the country’ configured printing and postal service.
-    Notifications sent to the resident using the email ID and mobile number provided as a part of demographic data collection

## De-activate/re-activate individual’s ID
-  De-activate ID means an individual will not be able to authenticate themselves by using the UIN or VID. 
-  If a country wants to deactivate an individual’s ID for any specific reason, the system deactivates the individual’s ID after certain validations performed in the [Registration Processor](registration-processor.md). 
- Likewise, a country can also re-activate an individual’ ID as need be.

## Finding a lost ID
-  Individual to provide their biometric information in the Registration center.
-  De-duplication performed to find the individual' ID.
-  Registration receipt containing Registration Identity(RID)), labels and data in the configured language, QR code (of the RID) provided to the resident.
-  ID credentials sent to the resident via the country’ configured printing and postal service.
- Notifications sent to the resident using the email ID and mobile number provided as a apart of demographic data collection

## Correction process
- Incase the system finds an error in the demographic data, documents or biometric data provided by an individual, the correction flow is triggered.
- Before issuing the UIN for the individual, the incorrect or incomplete information provided by the individual is intimated to them.
- Once the corrected information is received by the system, a correction procedure is triggered.
- Updated ID credentials are sent to the resident via the country’ configured printing and postal service.
   



