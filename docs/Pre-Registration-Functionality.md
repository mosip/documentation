#  Login/create a user account

##  Login using email
User can login to the pre-registration portal by providing their email id. The system validates the email id, once validated sends an OTP to the email id as provided. The user enters the OTP as received. The system validates the OTP entered and redirects the user to fill demographic form (if first-time) or Dashboard (if existing user).

## Login using phone number 
The user can login to the pre-registration portal by providing their mobile number. The system validates the mobile number, once validated sends an OTP to the mobile number as provided. The user enters the OTP as received. The system validates the OTP entered and redirects the user to fill demographic form (if first-time) or Dashboard (if existing user).

## Automatic user id creation on first login 
The user logs in to the pre-registration portal with their mobile number or email id. After successful Authentication, the system checks if the user is first-time user or not. If the user is first-time user, the system creates a new record in the database. All the pre-registration ids created from there on will be mapped to this user id.

## Logout/session timeout 
If the user wishes to logout of the pre-registration system, he/she can opt to select the Logout option. The token issued during the Authentication of user Login is deleted and the user gets logged out of the system.
If the user is inactive for X minutes (X is configurable), the system notifies the user one minute before the configured timeout limit. In such case, the system will not save any user data.

#  Creating an application

##  Provide demographic data 

The user is provided with demographic form based on the [ID Object Definition](MOSIP-ID-Object-definition) for new pre-registration application, user fills demographic details (e.g., Full Name, Age/DOB, Gender, Residential status, Address, mobile number, email id, etc.). The system validates the fields entered, the system also checks for the mandatory fields. Additionally, the system validates for any blacklisted words entered (as configured by the country). Once validated a pre-registration request id (PRID) is generated and the demographic details provided gets mapped to that PRID.

Note: Consent is sought from the user for every new application created in the system.

## Provide consent 

An user Logs in to the pre-registration system with mobile number or email id and then opts to create a new application form. Before filling the form, the user is advised to provide their consent for storage and utilization of their personal information. The consent is sought from the user for every new application created in the system. On providing their consent, the system redirects the user to start the pre-registration application (demographic details). The data as part of the consent form is rendered as setup by the admin.

In case of closure of the Consent Pop-up, the following scenarios may arise:
1. First-time login: On closure, then system alerts the user that he will be logged out due to not providing consent.
1. Existing user login
   * Scenario 1: Create new application from Dashboard: On closure, the user will be redirected to Dashboard page.
   * Scenario 2: Add Applicant from Preview Page: On closure, the user will be redirected to Preview Page.

## Create multiple applications 

Once the demographic details are filled and the Documents are uploaded, if the user wishes to add an applicant, he/she can opt to select 'Add An Applicant' option on the preview page or 'Create New Application' option on the Dashboard. The system provides the user with demographic form based on the defined [ID Object Definition](MOSIP-ID-Object-definition) to fill. The system associates the pre-registration id to the new Application(s) created.

## Provide data in prreferred language 

The user can select their language of preference, which is referred as Primary (from a list of 2 languages as set by Admin) from the Login screen, the other language from the list is considered as secondary. The user can then provide data in the preferred language (primary) as selected. The data in the right side of the demographic page will be Transliterated to secondary language. The labels in the right hand side will be translated to the Secondary language. The user can verify the transliterated data and edit if required. The data will subsequently be stored in the database along with the respective language codes.

_Language Configuration_: 

1. In the below listed scenarios, system will render an error message on the Login page and inhibit pre-registration, and hence, the language configurations should be appropriately setup by the administrator.
- If Primary Language is set to a specific value and Secondary Language is marked as null/not set by Admin, or
- If Secondary Language is set to a specific value and Primary Language is marked as null/not set by Admin, or
- If both Primary and Secondary Language is marked as null/not set by Admin
(eg. Primary set to English and Secondary not set or vice-versa),  
then system will render the stated Error Message: “The system has encountered a technical error. Administrator to setup the necessary language configuration(s).” The error message will not have an option to exit, hence not allow the user to proceed further. On page refresh, the system will render the error message again and hence, inhibit pre-registrations. 

2. Considering a scenario, wherein if Primary language and Secondary language is configured to be the same, eg. English
then:
- The system will render the demographic page (with both left and right side for Primary and Secondary lnaguage) in the same language
- Values entered on the left side (Primary Language) will not be transliterated but auto-copied on the right side
- Values on the right side will remain un-editable
- As part of the packet, system will send/store data in one language only, if language code is identified to be the same – eg. ENG (English)

Therefore, it is important for the administrator to setup the configurations appropriately.

##  Viewing "My Applications" (covers status) 
The pre-registrations created will be associated with user id. The user can view all the pre-registrations created by him/her in the Dashboard. The pre-registration can be in 3 different status (Pending appointment, Booked, Expired)

|Status|Explanation|User Action|
|------|-----|-----|
|Pending appointment|Filled only demographic details|Upload documents and book an appointment|
|  |Filled demographic details and uploaded documents |Book an appointment|
|Booked|  Filled demographic details, uploaded documents, and booked appointment|Visit the registration center on the appointment date and time|
|Expired| Appointed date has passed|N/A

The applications are sorted and displayed by the order of creation of application. The first application created appears first, latest created/modified application appears at the end. If the user visits the registration centre and consumes the appointment, then the application will be removed from the list. If the appointment date has passed, the status changes to "Expired" and is retained on the dashboard for further rebooking/modification as required.


## Modify application data 
The user can modify the pre-registration data by opting to select the “Modify” option for a specific application. The system provides the demographic form with pre-filled demo details and allows the user to edit the details as required. The system associates the modified demo details with the pre-registration id for which Modify information is initiated.

Note: Modify application data cannot be done for an expired application

## Discard application 
The user can discard the pre-registration by clicking on the Delete icon for the pre-registration id for which he/she wishes to discard. The system provides the user with two options: ‘Discard entire Application’ or ‘Cancel appointment.' The user choses to discard entire application. The system deletes all the data mapped to the pre-registration id and cancels the appointment (if any).


#  Attaching documents to the application

## Document Categories and Applicable Document Types 
1. When user provides their demographic data, the pre-registration system captures the data. 
1. Based on the parameters (from Config file) for example - gender, age and residential status (Foreigner, National) from the demographic data, applicant types are determined. The pre-registration system then sends the id to the mapping.
1. Based on the Applicant type, the Applicable Document categories are received from the mapping. The pre-registration system then displays only applicable categories.
1. The Document Category and type of documents in each category to be uploaded varies based on the applicant type. pre-registration system displays only those types to the applicant.
1. Once the documents are uploaded by applicant the system performs virus scan to check the integrity of the document. Once the virus scan is done the document is encrypted and stored in the database

## Referring to already uploaded documents
* The POA (Proof of Address) document could be uploaded or can be referred to an already uploaded POA of an existing applicant
* The user could select a particular applicant document to which he wants to refer 
* When Pre-registering for a family  living at the same address  it is not required to upload same POA ,instead could refer to the document as uploaded by the first family member


#  Booking an appointment

##  Choosing a registration center for appointment

###  Recommended centers based on postal code 
1. The system recommends registration centers based on the postal code(s) of all the applicants for whom the appointment is to be booked
1. The search results have the following information about the registration center: name, address, working hours, contact person, center type, and contact number

1. The first registration center as per the search criteria is shown to the user on map by default

###  Nearby centers based on user geo-location 
1. An user can  enable location services, in the device/machine in order to select nearby centers
1. The system checks for Lat-Long values of the user and  fetches all the registration centers within 2 Km radius (configurable)
1. The first registration center as per the search criteria is shown to the user on map by default

### Find a center 
1. An user may opt to perform text search to find a center based on which the system displays the registration centers
1. It is a contextual search where the user selects a search criteria and based on the selected search criteria enters relevant text. 
1. The first registration center as per the search criteria is shown to the user on map by default

## Get appointment for the day 
1. An user logs in to the pre-registration system  and opts to book appointment for pre-registration application or Modify appointment
1. The system presents a  list of Centers to the user to select the required registration center 
1. The Time selection with calendar days along with number of slots available per calendar day will be displayed 
1. user can select any of the calendar day which he\she wishes to book appointment.
1. Time slots of 15 minutes each are displayed.
1. Each time slot with available slots will be displayed.
1. The user can select a slot and proceed to book appointment or can go back to select another registration center

## Choosing appointment slots

###  Get slots availability 
The user opts to view the available slots for a selected registration center.
1. The system displays 7 calendar days (configurable) for the user to select a slot in the chosen center
1. Calendar day\s which are  Holidays or non-working days for the selected registration center are greyed out or not shown to the user
1. For a Selected registration center 8 hours (configurable) are considered as working hours
1. An user can view time slots of 15 minutes (configurable) each for the selected calendar day and view available slots for every time slot shown in the selected calendar day
1. An applicant can further choose the preferred timeslot
1. An user can confirm the appointment selection of the preferred/chosen time slot – Subsequently the timeslot(s) are locked

##  Cancel appointment 
1. An user can opt to cancel selected appointment\s against application which is\are in Booked Status.
1. In such case the system notifies the user about the successful cancellation 
1. Following a successful appointment Cancellation the system unlocks the time slot of the registration center

### Auto-cancel appointment based on change in working days/holidays 
Additionally, in case of any change made by the administrator in terms of updating a working day/Non-holiday day to a non-working day/holiday for a registration center or updating the working hours of a registration center, the system will automatically cancel the affected appointment(s) and trigger a notification to the mobile number or email id of the associated PRID, notifying regarding cancellation of appointment. 

## Re-book appointment 
1. The system provides the user with the list of available appointment Slots
1. An user can select any of the appointment Date available and any of the appointment Slot available
1. The user has to select against which pre-registration id the appointment slot is being booked
1. The system maps appointment slot with all the pre-registration ids, which are selected for appointment booking
1. If any pre-registration id does not have booking mapped, the user is notified if he wants to continue without booking
1. An user at this stage may opt to search registration center. In this case the appointment-booking (Time Slot selected) done is removed
1. An user cannot  Re-book the appointment if the appointment booking is less than 48 hours (configurable) from time of booking

# Appointment acknowledgement 

1. An Acknowledgement is triggered after cuccessful completion of pre-registration (booking an appointment)
1. The acknowledgement contains the following information: name, pre-registration id, age/DoB, mobile number, email id and registration center details, appointment date, appointment time)
1. A QR code is generated based on the demographic details and the pre-registration ID. This QR code can be scanned at the registration center to fetch the details of the user provided during pre-registration process

## Download acknowledgement 
User can choose to print the acknowledgement or can download the acknowledgement as PDF and print later.

The acknowledgement template is language and channel (email, sms, on screen) specific.

##  Send acknowledgement to email/phone
The system sends an acknowledgement to the  applicant through SMS/email as per the details provided in demographic form. However, the trigger of notification is driven by the Notification configuration setup by the administrator, to allow a notification to be triggered by SMS/email/both or none.

In case of multiple applications, the system sends notifications for each applicant to the details provided in the demographic form of that applicant.

Additionally, user can opt to manually trigger notification(s) to the contact details of additional recipients. However, this is driven by the Notification configuration setup by the administrator, to allow a notification to be triggered by SMS/email/both or none.

The confirmation acknowledgement is also rendered on screen with a confirmation message of the notification being triggered. (Subject to the notification parameter configuration and if any mobile/email id was provided)

# Registration Client Services

##  Retrieve application data by PRID

Upon receiving the registration center id, date range (start date, end date) for the List of pre-registrations, user id (Registration Officer/Supervisor) from Registration client, the pre-registration system processes the information.
1. The system generates a Transaction id
1. The system then Fetches all the pre-registrations within the Date Range (Start Range, End Date) and for the registration center id received and calculates the count of the pre-registration ids being sent.
1. The system sends the List of pre-registration ids along with count of pre-registrations.
1. The system receives the pre-registration id/ids for which pre-registration Data has to be sent.
1. The system sends the zip file per pre-registration id consisting of Demo Data, Files, and appointment Time.

#  Audit 

When any transaction is performed, then the same is captured as part of MOSIP Audit Trails, which can be further used for Reporting/Analytics as required.
