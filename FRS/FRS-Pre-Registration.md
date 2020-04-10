## Table of Contents

* [1. Overview](#1-overview-)
* [2. Features](#2-features)
  * [2.1 Login/Creating a User Account](#21-logincreating-a-user-account) _(PRE_FR_1)_
    * [2.1.1 Login using Email](#211-login-using-email-) _(PRE_FR_1.1)_
    * [2.1.2 Login using Phone Number](#212-login-using-phone-number-) _(PRE_FR_1.2)_
    * [2.1.3 Automatic User ID Creation on First Login](#213-automatic-user-id-creation-on-first-login-) _(PRE_FR_1.3)_ 
    * [2.1.4 Logout/Session Timeout](#214-logoutsession-timeout-) _(PRE_FR_1.4)_
  * [2.2 Creating an Application](#22-creating-an-application) _(PRE_FR_2)_
    * [2.2.1 Provide Demographic Data](#221-provide-demographic-data-) _(PRE_FR_2.1)_
    * [2.2.2 Provide Consent](#222-provide-consent-) _(PRE_FR_2.2)_
    * [2.2.3 Create Multiple Applications](#223-create-multiple-applications-) _(PRE_FR_2.3)_
    * [2.2.4 Provide Data in Preferred Language](#224-provide-data-in-preferred-language-) _(PRE_FR_2.4)_
    * [2.2.5 Viewing "My Applications" (covers status)](#225-viewing-my-applications-covers-status-) _(PRE_FR_2.5)_
    * [2.2.6 Modify Application Data](#226-modify-application-data-) _(PRE_FR_2.6)_
    * [2.2.7 Discard Application](#227-discard-application-) _(PRE_FR_2.7)_
  * [2.3 Attaching Documents to the Application](#23-attaching-documents-to-the-application) _(PRE_FR_3)_
    * [2.3.1 Document Categories and Applicable Document Types](#231-document-categories-and-applicable-document-types-) _(PRE_FR_3.1)_
    * [2.3.2 Referring to already Uploaded Documents](#232-referring-to-already-uploaded-documents-) _(PRE_FR_3.2)_
  * [2.4 Booking an Appointment](#24-booking-an-appointment) _(PRE_FR_4)_
    * [2.4.1 Choosing a Registration Center for Appointment](#241-choosing-a-registration-center-for-appointment-) _(PRE_FR_4.1)_
      * [2.4.1.1 Recommended Centers based on Postal Code](#2411-recommended-centers-based-on-postal-code-) 
      * [2.4.1.2 Nearby Centers based on User Geo-location](#2412-nearby-centers-based-on-user-geo-location-) 
      * [2.4.1.3 Find a Center](#2413-find-a-center-) 
    * [2.4.2 Get Appointment for the Day](#242-get-appointment-for-the-day-) _(PRE_FR_4.2)_
    * [2.4.3 Choosing Appointment Slots](#243-choosing-appointment-slots) _(PRE_FR_4.3)_
      * [2.4.3.1 Get Slots Availability](#2431-get-slots-availability-) 
    * [2.4.4 Cancel Appointment](#244-cancel-appointment-) _(PRE_FR_4.4)_
      * [2.4.4.1 Auto-cancel Appointment based on change in working days/holidays](#2441-auto-cancel-appointment-based-on-change-in-working-daysholidays-) _(PRE_FR_4.4.1)_
    * [2.4.5 Re-book Appointment](#245-re-book-appointment-) _(PRE_FR_4.5)_
  * [2.5 Appointment Acknowledgement (PRID)](#25-appointment-acknowledgement-prid-) _(PRE_FR_5)_
    * [2.5.1 Download Acknowledgement](#251-download-acknowledgement-) _(PRE_FR_5.1)_
    * [2.5.2 Send Acknowledgement to Email/Phone](#252-send-acknowledgement-to-emailphone-) _(PRE_FR_5.2)_
  * [2.6 Registration Client Services](#26-registration-client-services) _(PRE_FR_6)_
    * [2.6.1 Retrieve Application Data by PRID](#261-retrieve-application-data-by-prid-) _(PRE_FR_6.1)_
  * [2.7 List of Configurable Parameters and Processes](#27-list-of-configurable-parameters-and-processes-) _(PRE_FR_7)_
  * [2.8 Audit](#28-audit-)_(PRE_FR_8)_
* [Pre Registration API](#pre-registration-api-)
* [Process View](#process-view-)
# 1. Overview [**[↑]**](#table-of-contents)
The pre-registration module enables a user to book an appointment for one or many Individuals for registration. It allows a user to enter their demographic details and book appointment by choosing a suitable registration center and time slot and then notifies user on a successful booking. This module also has the provision for appointment rescheduling and cancellation.

# 2. Features
## 2.1 Login/Creating a User Account
### 2.1.1 Login using Email [**[↑]**](#table-of-contents)
The Individual can login to the Pre-registration Portal by providing their Email Id. The system validates the email Id, once validated sends an OTP to the email Id as provided. The Individual enters the OTP as received. The system validates the OTP entered and redirects the Individual to fill Demographic form (if first-time) or Dashboard (if existing user).

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-login-service.md)


### 2.1.2 Login using Phone Number [**[↑]**](#table-of-contents)
The Individual can login to the Pre-registration Portal by providing their Mobile Number. The system validates the Mobile Number, once validated sends an OTP to the Mobile Number as provided. The Individual enters the OTP as received. The system validates the OTP entered and redirects the Individual to fill Demographic form (if first-time) or Dashboard (if existing user).

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-login-service.md)

### 2.1.3 Automatic User ID Creation on First Login [**[↑]**](#table-of-contents)
The Individual logs in to the Pre-Registration portal with their Mobile Number or Email Id. After successful Authentication, the system checks if the Individual is first-time user or not. If the Individual is first-time user, the system creates a new record in the database. All the Pre-registration Ids created from there on will be mapped to this User Id.

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-login-service.md)

### 2.1.4 Logout/Session Timeout [**[↑]**](#table-of-contents)
If the Individual wishes to logout of the Pre-Registration system, he/she can opt to select the Logout option. The Token issued during the Authentication of User Login is deleted and the user gets logged out of the system.
If the user is inactive for X minutes (X is configurable), the system notifies the user one minute before the configured timeout limit. In such case, the system will not save any user data.

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-login-service.md)

## 2.2 Creating an Application
### 2.2.1 Provide Demographic Data [**[↑]**](#table-of-contents)

The Individual is provided with Demographic form based on the [**ID Object Definition**](MOSIP-ID-Object-definition) for new pre-registration application, Individual Fills Demographic Details (e.g., Full Name, Age/DOB, Gender, Residential status, Address, Mobile Number, Email Id, etc.). The system validates the fields entered, the system also checks for the Mandatory fields. Additionally, the system validates for any blacklisted words entered (as configured by the Country)
Once validated the **Pre-Registration Id is generated** (Pre-registration Request Id) and the Demographic details provided gets mapped to that PRID.

Note: Consent is sought from the user for every new application created in the system

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-demographic-service.md)

### 2.2.2 Provide Consent [**[↑]**](#table-of-contents)

An Individual Logs in to the pre-registration system with Mobile Number or Email ID and then opts to create a new Application form. Before filling the form, the Individual is advised to provide their consent for storage and utilization of their personal information. The consent is sought from the user for every new application created in the system. On providing their consent, the system redirects the Individual to start the Pre-Registration Application (Demographic Details). The data as part of the consent form is rendered as setup by the admin.

In case of closure of the Consent Pop-up, the following scenarios may arise:
1. First-time login: On closure, then system alerts the user that he will be logged out due to not providing consent.
1. Existing User login
   * Scenario 1 Create new Application from Dashboard: On closure, the Individual will be redirected to Dashboard page.
   * Scenario 2 Add Applicant from Preview Page: On closure, the individual will be redirected to Preview Page.


### 2.2.3 Create Multiple Applications [**[↑]**](#table-of-contents)

Once the Demographic Details are filled and the Documents are uploaded, if the Individual wishes to add an applicant, he/she can opt to select 'Add An Applicant' option on the preview page or 'Create New Application' option on the Dashboard. The system provides the Individual with Demographic form based on the defined ID Object Definition to fill. The system associates the pre-registration Id to the new Application(s) created.

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-demographic-service.md)

### 2.2.4 Provide Data in Preferred Language [**[↑]**](#table-of-contents)

The Individual can select their language of preference, which is referred as Primary (from a list of 2 languages as set by Admin) from the Login screen, the other language from the list is considered as secondary. The Individual can then provide data in the preferred language (primary) as selected. The data in the right side of the Demographic page will be Transliterated to secondary language. The labels in the right hand side will be translated to the Secondary language. The Individual can verify the transliterated data and edit if required. The data will subsequently be stored in the database along with the respective language codes.

_Language Configuration_: 

1. In the below listed scenarios, system will render an error message on the Login page and inhibit Pre-registration, and hence, the language configurations should be appropriately setup by the administrator.
- If Primary Language is set to a specific value and Secondary Language is marked as Null/not set by Admin, or
- If Secondary Language is set to a specific value and Primary Language is marked as Null/not set by Admin, or
- If both Primary and Secondary Language is marked as Null/not set by Admin
(EG: Primary set to English and Secondary not set or vice-versa),  
then system will render the stated Error Message: “The system has encountered a technical error. Administrator to setup the necessary language configuration(s).” The error message will not have an option to exit, hence not allow the user to proceed further. On page refresh, the system will render the error message again and hence, inhibit pre-registrations. 

2. Considering a scenario, wherein if Primary language and Secondary language is configured to be the same, EG: English
then:
- The system will render the demographic page (with both left and right side for Primary and Secondary lnaguage) in the same language
- Values entered on the left side (Primary Language) will not be transliterated but auto-copied on the right side
- Values on the right side will remain un-editable
- As part of the packet, system will send/store data in one language only, if language code is identified to be the same – EG: ENG (English)

Therefore, it is important for the administrator to setup the configurations appropriately.

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-transliteration-service.md)

### 2.2.5 Viewing "My Applications" (covers status) [**[↑]**](#table-of-contents)
The Pre-Registrations created will be associated with User Id. The Individual can view all the Pre-Registrations created by him/her in the Dashboard. The Pre-Registration can be in 3 different status (Pending Appointment, Booked, Expired)

|Status|Explanation|User Action|
|------|-----|-----|
|**Pending Appointment**|Filled only demographic details|Upload documents and book an appointment|
|  |Filled demographic details and uploaded documents |Book an appointment|
|**Booked**|  Filled demographic details, uploaded documents, and booked appointment|Visit the registration center on the appointment date and time|
|**Expired**| Appointed date has passed|N/A

The applications are sorted and displayed by the order of creation of application. The first application created appears first, latest created/modified application appears at the end. If the individual visits the Registration Centre and consumes the appointment, then the application will be removed from the list. If the appointment date has passed, the status changes to "Expired" and is retained on the dashboard for further rebooking/modification as required.

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-demographic-service.md)

### 2.2.6 Modify Application Data [**[↑]**](#table-of-contents)
The individual can modify the pre-registration data by opting to select the “Modify” option for a specific application. The system provides the Demographic form with pre-filled demo details and allows the individual to edit the details as required. The system associates the modified demo details with the Pre-Registration Id for which Modify information is initiated.

Note: Modify application data cannot be done for an expired application

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-demographic-service.md)

### 2.2.7 Discard Application [**[↑]**](#table-of-contents)
The Individual can discard the Pre-Registration by clicking on the Delete icon for the Pre-Registration Id for which he/she wishes to discard. The system provides the Individual with two options: ‘Discard entire Application’ or ‘Cancel Appointment.' The Individual chooses to discard entire Application. The system deletes all the data mapped to the Pre-Registration Id and cancels the appointment (if any).

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-demographic-service.md)

## 2.3 Attaching Documents to the Application
### 2.3.1 Document Categories and Applicable Document Types [**[↑]**](#table-of-contents)
1. When an Individual provides their Demographic data, the Pre-registration system captures the data. 
1. Based on the parameters (from Config file) for example - gender, age and residential status (Foreigner, National) from the demographic data, applicant types are determined. The Pre-Registration system then sends the Id to the mapping.
1. Based on the Applicant type, the Applicable Document categories are received from the Mapping. The Pre-Registration system then displays only applicable categories.
1. The Document Category and type of documents in each category to be uploaded varies based on the applicant type. Pre-registration system displays only those types to the applicant.
1. Once the documents are uploaded by applicant the system performs virus scan to check the integrity of the document. Once the virus scan is done the document is encrypted and stored in the database

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-document-service.md)

### 2.3.2 Referring to already Uploaded Documents [**[↑]**](#table-of-contents)

* The POA (Proof of Address) document could be uploaded or can be referred to an already uploaded POA of an existing applicant
* The individual could select a particular applicant document to which he wants to refer 
* When Pre-registering for a family  living at the same address  it is not required to upload same POA ,instead could refer to the document as uploaded by the first family member



[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-document-service.md)


## 2.4 Booking an Appointment
### 2.4.1 Choosing a Registration Center for Appointment [**[↑]**](#table-of-contents)

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-booking-service.md)

#### 2.4.1.1 Recommended Centers based on Postal Code [**[↑]**](#table-of-contents)
1. The system recommends registration centers based on the postal code(s) of all the applicants for whom the appointment is to be booked
1. The search results have the following information about the Registration Center: Name, Address, Working Hours, Contact Person, Center Type, and Contact Number

1. The First Registration Center as per the search criteria is shown to the Individual on Map by default

#### 2.4.1.2 Nearby centers based on User Geo-location [**[↑]**](#table-of-contents)
1. An Individual can  enable location services,  in the device/machine in order to select nearby centers
1. The system checks for Lat-Long values of the Individual and  fetches all the Registration Centers within 2 KM Radius (configurable)
1. The First Registration Center as per the search criteria is shown to the Individual on Map by default

#### 2.4.1.3 Find a Center [**[↑]**](#table-of-contents)
1. An Individual may opt to perform text search to find a center based on which the system displays the registration centers

1. It is a contextual search where the individual selects a search criteria and based on the selected search criteria enters relevant text. 

1. The First Registration Center as per the search criteria is shown to the Individual on Map by default

### 2.4.2 Get Appointment for the Day [**[↑]**](#table-of-contents)
1. An Individual logs in to the pre-registration system  and opts to Book Appointment for Pre-Registration Application or Modify Appointment
1. The system presents a  list of Centers to the user to select the required Registration Center 
1. The Time selection with calendar days along with number of slots available per calendar day will be displayed 
1. Individual can select any of the calendar day which he\she wishes to Book Appointment.
1. Time slots of 15 minutes each are displayed.
1. Each time slot with Available slots will be displayed.
1. The Individual can select a slot and proceed to Book Appointment or can go back to select another Registration Center

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-booking-service.md)



### 2.4.3 Choosing Appointment Slots

#### 2.4.3.1 Get Slots Availability [**[↑]**](#table-of-contents)
The user opts to view the available slots for a selected registration center.
1. The system displays 7 calendar days (configurable) for the Individual to select a slot in the chosen center
1. Calendar day\s which are  Holidays or non-working days for the selected Registration Center are greyed out or not shown to the user
1. For a Selected Registration Center 8 hours (configurable) are considered as working hours
1. An Individual can view time slots of 15 minutes (configurable) each for the selected calendar day and view Available slots for every time slot shown in the selected calendar day
1. An applicant can further choose the preferred timeslot
1. An individual can confirm the appointment selection of the preferred/chosen time slot – Subsequently the timeslot(s) are locked


### 2.4.4 Cancel Appointment [**[↑]**](#table-of-contents)
1. An Individual can opt to cancel selected Appointment\s against application which is\are in Booked Status.
1. In such case the system notifies the user about the successful cancellation (Subject to the Notification Configuration - Refer Sec. 2.5.2)
1. Following a successful Appointment Cancellation the system unlocks the time slot of the Registration Center

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-booking-service.md)

#### 2.4.4.1 Auto-cancel appointment based on change in working days/holidays [**[↑]**](#table-of-contents)
Additionally, in case of any change made by the administrator in terms of updating a working day/Non-holiday day to a non-working day/holiday for a Registration Center or updating the working hours of a Registration Center, the system will automatically cancel the affected appointment(s) and trigger a notification to the mobile number or email id of the associated PRID, notifying regarding cancellation of appointment. (Subject to the Notification Configuration - Refer section 2.5.2)

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-batch-job.md)

### 2.4.5 Re-book Appointment [**[↑]**](#table-of-contents)
1. The system provides the user with the list of available Appointment Slots
1. An Individual can select any of the Appointment Date available and any of the Appointment Slot available
1. The Individual has to select against which Pre-Registration Id the Appointment slot is being booked
1. The system maps appointment slot with all the Pre-Registration Ids, which are selected for Appointment Booking
1. If any Pre-Registration Id does not have Booking mapped, the user is notified if he wants to continue without booking
1. An Individual at this stage may opt to search Registration Center. In this case the appointment-booking (Time Slot selected) done is removed
1. An Individual cannot  Re-book the Appointment if the appointment Booking is less than 48 hours (configurable) from time of booking

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-booking-service.md)


## 2.5 Appointment Acknowledgement (PRID) [**[↑]**](#table-of-contents)
1. An Acknowledgement is triggered after Successful completion of Pre-Registration (Booking an appointment)
1. The acknowledgement contains the following information: Name, Pre-Registration Id, Age/DoB, Mobile Number, Email Id and Registration Center Details, Appointment Date, Appointment Time)
1. A QR code is generated based on the demographic details and the pre-registration ID. This QR code can be scanned at the registration center to fetch the details of the individual provided during pre-registration process

### 2.5.1 Download Acknowledgement [**[↑]**](#table-of-contents)
Individual can choose to print the Acknowledgement or can Download the Acknowledgement as PDF and print later

The acknowledgement template is language and channel (email, sms, on screen) specific.

[**Reference Templates**](https://github.com/mosip/documentation/wiki/_files/requirements/templates/Pre-registration.zip)

### 2.5.2 Send Acknowledgement to Email/Phone [**[↑]**](#table-of-contents)
The system sends an acknowledgement to the  applicant through SMS/Email as per the details provided in Demographic form. However, the trigger of notification is driven by the Notification configuration setup by the administrator, to allow a notification to be triggered by SMS/Email/Both or None.

In case of multiple applications, the system sends notifications for each applicant to the details provided in the demographic form of that applicant.

Additionally, an individual can opt to manually trigger notification(s) to the contact details of additional recipients. However, this is driven by the Notification configuration setup by the administrator, to allow a notification to be triggered by SMS/Email/Both or None.

The confirmation acknowledgement is also rendered on screen with a confirmation message of the notification being triggered. (Subject to the notification parameter configuration and if any mobile/email id was provided)

[**Link to design for notification**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-notification-service.md)

[**Link to design for QR code**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-generate-qr-code-service.md)


## 2.6 Registration Client Services
### 2.6.1 Retrieve Application Data by PRID [**[↑]**](#table-of-contents)
Upon receiving the Registration Center Id, Date Range (Start Date, End Date) for the List of Pre-Registrations, User Id (Registration Officer/Supervisor) from Registration client, the Pre-Registration system processes the information.
1. The system generates a Transaction Id
1. The system then Fetches all the Pre-Registrations within the Date Range (Start Range, End Date) and for the Registration Center Id received and calculates the count of the Pre-Registration Ids being sent.
1. The system sends the List of Pre-Registration Ids along with count of Pre-Registrations.
1. The system receives the Pre-Registration Id/Ids for which Pre-Registration Data has to be sent.
1. The system sends the zip file per Pre-Registration Id consisting of Demo Data, Files, and Appointment Time.

[**Link to design**](https://github.com/mosip/pre-registration/tree/master/design/pre-registration/pre-registration-data-sync-service.md)


## 2.7 List of Configurable Parameters and Processes [**[↑]**](#table-of-contents)
1. Configurable Parameters [**[↑]**](#table-of-contents)

   [**Link to Configurable Parameters of Pre-registration**](https://github.com/mosip/mosip-config/blob/master/config-templates/pre-registration-env.properties)

2. Configurable Processes 
* (Work in Progress)
## 2.8 Audit [**[↑]**](#table-of-contents)
When any transaction is performed, then the same is captured as part of MOSIP Audit Trails, which can be further used for Reporting/Analytics as required.

## Pre Registration API [**[↑]**](#table-of-contents)
[**Refer to Wiki for more details on Pre-registration API**](https://mosipdoc.gitbook.io/platform/quick-links/apis/pre-registration-apis)
## Process View [**[↑]**](#table-of-contents)
[**Link to Process View of Pre-registration**](https://mosipdoc.gitbook.io/platform/quick-links/modules/pre-registration#process-flow)
