# ID Lifecycle Management

Identity Lifecycle Management refers to the **process of issuing and managing user identities** in a given system. 
The various life cycle events are briefly explained below:
* New ID issuance (for adults and infants)
* ID data update/update individual’s information
* De-activate/re-activate individual’s ID
* Lost ID
* Correction process

## New ID issuance 

### Pre-Registration
Pre-registration fundamentally helps the residents and Government organizations by saving the time and efforts required for basic data collection of the residents at the registration centers. The residents can visit the pre-registration portal and do the following:
* Enter demographic data and upload supporting documents
* Book an appointment for one or many users for registration by choosing a suitable registration center and a convinient time slot
* Receive appointment notifications
* Reschedule and Cancel appointments

Once the resident completes the above process, their data will be downloaded at the respective registration centers prior to their appointment.

#### For adults
-	Resident/individual needs to visit a registration center
-	Residents need to provide required information to register themselves in MOSIP (first time)
-	Registration officer captures’ individual’s information
-	The captured information is sent to the Registration Processor
-	Various checks like biometrics quality, de-duplication, etc. performed in the Registration Processor with the individual's demographic data and biometrics
-	If no duplicate is found, a Unique Identification Number(UIN) is allocated and ID credentials are sent to the individual via the country's configured printing and postal service.
-	Registration receipt(acknowledgement) containing the Registration Identity(RID), labels and data in the configured language, QR code (of the RID) provided to the resident at the center.
-	Notifications sent to the resident using the email ID and mobile number provided as a part of demographic data collection

#### For infants/children

-	Child needs to visit the Registration center along with a guardian/parent.
-	Operator needs to capture only the child' face biometrics.
-	Parent/guardian' UIN or RID and biometrics needed for authentication.
-	Additionally, a **Proof of Relationship** document to be provided at the center.
-	An acknowledgement receipt will be provided to the infant' parent/guardian.

## ID data update/Updating individual’s information

-	Residents can update their information in two ways:
    * By visiting the registration center: The demographic and biometric information can be updated at the centers.
    * Using Resident services: Update of only the demographic information.
-  Registration receipt containing the Registration Identity(RID)), labels and data in the configured language, QR code (of the RID) provided to the resident at the center.
-	Updated ID credentials sent to the resident via the country’ configured printing and postal service.
-	Notifications sent to the resident using the email ID and mobile number provided as a part of demographic data collection

## De-activate/Re-activate individual’s ID

-	De-activate ID means an individual will not be able to authenticate themselves by using the UIN or VID. 
-	If a country wants to deactivate an individual’s ID for any specific reason, the system deactivates the individual’s ID after certain validations performed in the Registration Processor.
-	 Likewise, a country can also re-activate an individual’ ID as need be.

## Finding a Lost ID
-	Individual to provide their biometric information in the Registration center.
-  De-duplication performed to find the individual' ID.
-  Registration receipt containing Registration Identity(RID)), labels and data in the configured language, QR code (of the RID) provided to the resident.
-  ID credentials sent to the resident via the country’ configured printing and postal service.
- Notifications sent to the resident using the email ID and mobile number provided as a apart of demographic data collection

## Correction process
- Incase the system finds an error in the demographic data, documents or biometric data provided by an individual, the correction flow is triggered.
- Before issuing the UIN for the individual, the incorrect or incomplete information provided by the individual is intimated to them.
- Once the corrected information is received by the system, a correction procedure is triggered.
- Updated ID credentials are sent to the resident via the country’ configured printing and postal service.
   



