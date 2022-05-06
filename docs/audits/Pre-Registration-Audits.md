The Pre-Registration module enables a resident to:
	- Enter demographic data & upload supporting documents
	- Book an appointment for one or many users for registration by choosing a suitable registration center and time slot
	- Receive appointment notifications
	- Reschedule and cancel appointments
	- Resident data is sent to the designated registration center before appointment that can be used during the registration process.

# Pre-Registration Service
This service manages to provide the following service to the Pre-registration application.

    - Demographic - This service details used by Pre-Registration portal to maintain the demographic data by providing his/her basic details.
    - Document- This service enables Pre-Registration portal to request for uploading the document for a particular pre-registration.
    - QrCodeGenerator- This service details used by Pre-Registration portal to generate QR Code.
    - Transliteration- This service details used by Pre-Registration portal to provide transliteration from primary to secondary language.
    - Notification- This service details used by Pre-Registration portal to trigger notification via SMS or email.
    - Login - This service details used by Pre-Registration portal to authenticate user by sending OTP to the user, validating with userid    and OTP.

## User Event Type
The following events are triggered as part of User Event Type in ID Pre-Registration Service

### Retrieval Event Information for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PRE_401 | User | Retrieve | This event specifies that the retrieval of all Pre-Registration id, Full name, Status and Appointment details by user id was successful. | User ID | User ID
2 | PRE_401 | User | Retrieve | This event specifies that the Retrieval of document is successfull. | User ID | User ID

### Update Event Information for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PRE_402 | User | Update | This event specifies that the Pre-Registration data is sucessfully updated in the demographic table. | NO ID | No ID

### Delete Event Information for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PRE_403 | User | Delete | This event specifies that the Document is successfully deleted from the document table. | Multiple ID | Multiple ID
2 | PRE_403 | User | Delete | This event specifies that the Pre-Registration data is successfully deleted from demographic table. | NO ID | No ID

### Upload Event Information for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PRE_404 | User | Upload | This event specifies that the Document is uploaded & the respective Pre-Registration data is saved in the document table. | NO ID | NO ID

### Data Sync Event Information for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PRE_406 | User | Data Sync | This event specifies that the Retrieval of all the Preregistration Id was successful. | PRE REG ID | PRID
2 | PRE_406 | User | Data Sync  | This event specifies that the Retrieval of the Preregistration data was successful. | PRE REG ID | PRID

### Reverse Sync Event Information for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PRE_408 | User | Reverse Sync  | This event specifies that the Reverse Data sync & the consumed PreRegistration id's are successfully saved in the database. | NO ID | NO ID

### Copy Event Information for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PRE_409 | User | Copy | This event specifies that the document copied from source PreId to destination PreId is successfully saved in the document table. | NO ID | NO ID

### Authentication Event Information for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PRE_410 | User | Authentication | This event specifies that the Otp has been sent sucessfully. | User ID | User ID
2 | PRE_410 | User | Authentication | This event specifies that the user has logged in sucessfully. | User ID | User ID
3 | PRE_410 | User | Authentication | This event specifies that the user has logged out sucessfully. | User ID | User ID

### Consumed Status Event Information for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PRE_412 | User | Consumed Status | This event specifies that the consumed status is updated & the consumed PreRegistration id's are successfully saved in the database. | PRID | Pre-Registration ID

### Expired Status Event Information for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PRE_413 | User | Expired Status | This event specifies that the expired status is updated & the expired PreRegistration id's are successfully saved in the database. | PRID | Pre-Registration ID

## System Event Type
The following events are triggered as part of System Event Type in ID Pre-Registration Service

### Exception Event Information for System Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PRE_405 | System | Exception | This event specifies that the retrieval of all the Preregistration Id was unsuccessful. | NO ID | NO ID
2 | PRE_405 | System | Exception | This event specifies that the retrieval of the Preregistration data was unsuccessful. | NO ID | NO ID
3 | PRE_405 | System | Exception | This event specifies that the reverse data sync has failed. | NO ID | NO ID
4 | PRE_405 | System | Exception | This event specifies that the document upload failed & the respective Pre-Registration data save was unsuccessfull. | NO ID | NO ID
5 | PRE_405 | System | Exception | This event specifies that the document failed to copy from source Preregistration Id to destination Preregistration Id. | NO ID | NO ID
6 | PRE_405 | System | Exception | This event specifies that the retrieval of document has failed. | NO ID | NO ID
7 | PRE_405 | System | Exception | This event specifies that the document deletion has failed. | NO ID | NO ID
8 | PRE_405 | System | Exception | This event specifies that the Otp sending has failed. | NO ID | NO ID
9 | PRE_405 | System | Exception | This event specifies that the User has failed to log-in. | User ID | User ID
10 | PRE_405 | System | Exception | This event specifies that the User has failed to log-out. | User ID | User ID
11 | PRE_405 | System | Exception | This event specifies that the Expired status was not updated. | NO ID | NO ID
12 | PRE_405 | System | Exception | This event specifies that there was a failure while saving the Pre-Registration data. | NO ID | NO ID
13 | PRE_405 | System | Exception | This event specifies that there was a failure while updating the Pre-Registration data. | NO ID | NO ID
14 | PRE_405 | System | Exception | This event specifies that the retrieve of all the Pre-Registration data has failed. | NO ID | NO ID
15 | PRE_405 | System | Exception | This event specifies that the deletion of Pre-Registration data has failed. | NO ID | NO ID
16 | PRE_405 | System | Exception | This event specifies that there was a failure in updating the consumed status | NO ID | NO ID
17 | PRE_405 | System | Exception | This event specifies that it has failed to trigger the notification to the user | NO ID | NO ID
18 | PRE_405 | System | Exception | This event specifies that the Add availability for booking has failed | NO ID | NO ID

### Persist Event Information for System Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PRE_407 | System | Persist | This event specifies that the availability for booking successfully saved in the database. | NO ID | NO ID
2 | PRE_407 | System | Persist | This event specifies that the Pre-Registration data is sucessfully saved in the demographic table. | NO ID | NO ID

### Notification Event Information for System Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | PRE_411 | System | Notification | This event specifies that the Pre-Registration data is sucessfully triggered as notification to the user. | NO ID | NO ID
