#  Login/create a user account

##  Login using email or phone number
Residents can login to the pre-registration portal by providing their email id or mobile number. The system validates the email id or phone number, once validated sends an OTP which the resident enters. The system validates the OTP redirects the user to enter or edit the details for booking an appointment.

## Automatic user id creation on first login 
The resident logs in to the pre-registration portal with their mobile number or email id. After successful Authentication, the system checks if the user is first-time user or not. If the user is first-time user, the system creates a new record in the database. All the pre-registration ids created from there on will be mapped to this user id.

## Logout/session timeout 
If the resident wishes to logout of the pre-registration system, he/she can opt to select the Logout option. The token issued during the Authentication of user Login is deleted and the user gets logged out of the system.  If the user is inactive for X minutes (X is configurable), the system notifies the user one minute before the configured timeout limit and logs out after a minute. In such case, the system will not save any user data.

#  Creating an application

##  Provide demographic data 

The user is provided with demographic form based on the [ID Object Definition](MOSIP-ID-Object-Definition.md) & [UI Specification](UI-Specification-for-Pre-Registration.md) for new pre-registration application, user fills demographic details (e.g., Full Name, Age/DOB, Gender, Residential status, Address, mobile number, email id, etc.). The system validates the fields entered, the system also checks for the mandatory fields. Additionally, the system validates for any blacklisted words entered (as configured by the country). Once validated a pre-registration request id (PRID) is generated and the demographic details provided gets mapped to that PRID.

{% hint style="info" %}
Consent is sought from the user for every new application created in the system.
{% endhint %}

## Provide consent 

Before filling the application form, the user is advised to provide their consent for storage and utilization of their personally identifiable information (PII). The consent is sought from the user for every new application created in the system. On providing their consent, the system redirects the user to start the pre-registration application (demographic details). The data as part of the consent form is rendered as setup by the administrator.

In case of closure of the Consent Pop-up, the following scenarios may arise:

* First-time login: On closure, then system alerts the user that he will be logged out due to not providing consent.
* Existing user login
   * Scenario 1: Create new application from Dashboard: On closure, the user will be redirected to Dashboard page.
   * Scenario 2: Add Applicant from Preview Page: On closure, the user will be redirected to Preview Page.

## Create multiple applications 

Once the demographic details are filled and the Documents are uploaded, if the user wishes to add an applicant, he/she can opt to select 'Add An Applicant' option on the preview page or 'Create New Application' option on the Dashboard. The system associates unique pre-registration id to the new application(s) created.

## Provide data in preferred language 

The user can select their language of preference, which is referred as Primary (from a list of 2 languages as set by the administrator) from the login screen, the other language from the list is considered as secondary. The user can then provide data in the preferred language (primary) as selected. The data in the right side of the demographic page will be transliterated to secondary language. The labels in the right hand side will be translated to the Secondary language. The user can verify the transliterated data and edit if required. The data will subsequently be stored in the database along with the respective language codes.

### Language Configuration 

In the below listed scenarios, system will render an error message on the Login page and inhibit pre-registration, and hence, the language configurations should be appropriately setup by the administrator.
* If Primary Language is set to a specific value and Secondary Language is marked as null/not set by administrator, or
* If Secondary Language is set to a specific value and Primary Language is marked as null/not set by administrator, or
* If both Primary and Secondary Language is marked as null/not set by administrator.
	
Example: Primary set to English and Secondary not set or vice-versa, then system will render the stated Error Message: "The system has encountered a technical error. Administrator to setup the necessary language configuration(s)." The error message will not have an option to exit, hence not allow the user to proceed further. On page refresh, the system will render the error message again and hence, inhibit pre-registrations. 

Considering a scenario, wherein if Primary language and Secondary language is configured to be the same, eg. English; then:
*The system will render the demographic page (with both left and right side for Primary and Secondary lnaguage) in the same language
* Values entered on the left side (Primary Language) will not be transliterated but auto-copied on the right side
* Values on the right side will remain un-editable
* As part of the packet, system will send/store data in one language only, if language code is identified to be the same – eg. en (English)

##  Viewing "My Applications" (covers status) 
The pre-registrations created will be associated with user id. The user can view all the pre-registrations created by him/her in the Dashboard. The pre-registration can be in three different status (Pending appointment, Booked, Expired)

|Status|Explanation|User Action|
|------|-----|-----|
|Pending appointment|Filled only demographic details|Upload documents and book an appointment|
|Pending appointment|Filled demographic details and uploaded documents |Book an appointment|
|Booked|  Filled demographic details, uploaded documents, and booked appointment|Visit the registration center on the appointment date and time|
|Expired| Appointed date has passed|N/A

The applications are sorted and displayed by the order of creation of application. The first application created appears first, latest created/modified application appears at the end. If the user visits the registration center and consumes the appointment, then the application will be removed from the list. If the appointment date has passed, the status changes to "Expired" and is retained on the dashboard for further rebooking/modification as required.

## Modify application data 
The user can modify the pre-registration data by opting to select the "Modify" option for a specific application. The system provides the demographic form with pre-filled demo details and allows the user to edit the details as required. The system associates the modified demo details with the pre-registration id for which Modify information is initiated.

## Discard application 
The user can discard the pre-registration by clicking on the Delete icon for the pre-registration id for which he/she wishes to discard. The system provides the user with two options: 'Discard entire Application' or 'Cancel appointment'. The user chooses to discard entire application. The system deletes all the data mapped to the pre-registration id and cancels the appointment (if any).

#  Attaching documents to the application

## Document Categories and Applicable Document Types 
* When user provides their demographic data, the pre-registration system captures the data. 
* Based on the parameters (from the configuration) for example - gender, age and residential status (Foreigner, National) from the demographic data, applicant types are determined. The pre-registration system then sends the id to the mapping.
* Based on the Applicant type, the Applicable Document categories are received from the mapping. The pre-registration system then displays only applicable categories.
* The Document Category and type of documents in each category to be uploaded varies based on the applicant type. pre-registration system displays only those types to the applicant.
* Once the documents are uploaded by applicant the system performs virus scan to check the integrity of the document. Once the virus scan is successful, the document is encrypted and stored in the object store.

## Referring to already uploaded documents
* The POA (Proof of Address) document could be uploaded or can be referred to an already uploaded POA of an existing applicant
* The user could select a particular applicant document to which he wants to refer 
* When Pre-registering for a family  living at the same address  it is not required to upload same POA again and again,instead could refer to the document as uploaded by the first family member saving space and time.

#  Booking an appointment

##  Choosing a registration center for appointment

###  Recommended centers based on postal code 
* The system recommends registration centers based on the postal code(s) of all the applicants for whom the appointment is to be booked
* The search results have the following information about the registration center: name, address, working hours, contact person, center type, and contact number
* The first registration center as per the search criteria is shown to the user on map by default

###  Nearby centers based on user geo-location 
* An user can  enable location services, in the device/machine in order to select nearby centers
* The system checks for the lattitude and Longitude values of the user and  fetches all the registration centers within 2 Km radius (configurable)
* The first registration center as per the search criteria is shown to the user on map by default.

### Find a center 
* An user may opt to perform text search to find a center based on which the system displays the registration centers
* It is a contextual search where the user selects a search criteria and based on the selected search criteria enters relevant text. 
* The first registration center as per the search criteria is shown to the user on map by default

## Get appointment for the day 
* An user logs in to the pre-registration system  and opts to book appointment for pre-registration application or Modify appointment
* The system presents a list of Centers to the user to select the required registration center 
* The time selection with calendar days along with number of slots available per calendar day will be displayed 
* The user can select any of the calendar day which he/she wishes to book an appointment.
* Time slots of 15 minutes each are displayed (configurable).
* Each time slot with available slots will be displayed.
* The user can select a slot and proceed to book appointment or can go back to select another registration center

## Choosing appointment slots

###  Get slots availability 
The user opts to view the available slots for a selected registration center.
* The system displays 7 calendar days (configurable) for the user to select a slot in the chosen center
* Calendar days which are  Holidays or non-working days for the selected registration center are greyed out or not shown to the user
* For a selected registration center 8 hours (configurable) are considered as working hours
* A user can view time slots of 15 minutes (configurable) each for the selected calendar day and view available slots for every time slot shown in the selected calendar day
* An applicant can further choose the preferred timeslot
* An user can confirm the appointment selection of the preferred/chosen time slot – Subsequently the timeslot(s) are locked

##  Cancel appointment 
* An user can opt to cancel selected appointment\s against application which is/are in Booked Status.
* In such case the system notifies the user about the successful cancellation 
* Following a successful appointment cancellation the system unlocks the time slot of the registration center so that someone else can book it.

## Re-book appointment 
* The system provides the user with the list of available appointment Slots
* An user can select any of the appointment Date available and any of the appointment Slot available
* The user has to select against which pre-registration id the appointment slot is being booked
* The system maps appointment slot with all the pre-registration ids, which are selected for appointment booking
* If any pre-registration id does not have booking mapped, the user is notified if he wants to continue without booking
* An user at this stage may opt to search registration center. In this case the appointment-booking (Time Slot selected) done is removed
* An user cannot  Re-book the appointment if the appointment booking is less than 48 hours (configurable) from time of booking

# Appointment acknowledgement

* An Acknowledgement is triggered after successful completion of pre-registration (booking an appointment)
* The acknowledgement contains the following information: name, pre-registration id, age/DoB, mobile number, email id and registration center details, appointment date, appointment time)
* A QR code which contains the pre-registration ID. 
* This QR code can be scanned at the registration center to fetch the details to be used during the registration process.

## Download acknowledgement
User can choose to print or download the acknowledgement as PDF.

##  Send acknowledgement to email/phone
The system sends an acknowledgement to the  applicant to the registered phone (SMS) or email as per the details provided in demographic form.  In case of multiple applications, the system sends notifications for each applicant to the details provided in the demographic form of that applicant.

Additionally, user can opt to manually trigger notification(s) to the contact details of additional recipients. However, this is driven by the Notification configuration setup by the administrator, to allow a notification to be triggered by SMS/email/both or none.

The confirmation acknowledgement is also rendered on screen with a confirmation message of the notification being triggered. (Subject to the notification parameter configuration and if any mobile/email id was provided)

# Registration Client Services

## Retrieve application data by PRID

Upon receiving the registration center id, date range (start date, end date) for the List of pre-registrations, user id (Registration Officer/Supervisor) from Registration client, the pre-registration system processes the information.
* The system generates a Transaction id
* The system then fetches all the pre-registrations within the Date Range (Start Range, End Date) and for the registration center id received and calculates the count of the pre-registration ids being sent.
* The system sends the List of pre-registration ids along with count of pre-registrations.
* The system receives the pre-registration id/ids for which pre-registration Data has to be sent.
* The system sends the zip file per pre-registration id consisting of Demo Data, Files, and appointment Time.

# Batch Job Services

There are three batch jobs that run in Pre-registration based on a cron scheduler.

## Consumed Status Batch Job

This batch job identifies the Pre-Registrations for which registration packets are created and are under processing in server. The details about these Pre-registration are removed from pre-Registration database and are moved to an Archival tables in pre-registration called as consumed tables.      Later the data in consumed tables can be archived or removed based on the adopter's need.

## Expiered Status Batch Job

This batch job identifies the pre-registrations which have expiered and updates the status of these pre-registrations as "Expiered".

## Booking Batch Job

Booking batch job, runs every day to perform some standard tasks:

1. Creating the booking slots (if not available) for next 140 days (configurable) using the details available for the centers like, center working hours, lunch breaks, no. of Kiosks, slot booking times & holidays.

2. Canceling bookings & sending notifications to the residents, if any emergency holiday has been declared for a center.

#  Audit 

When any transaction is performed, then the same is captured as part of MOSIP Audit Trails, which can be further used for reporting and analytics as required.
