# Overview
This guide helps in understanding the pre-registration sample UI implementation.

## Pre-registration process
The key steps in this module are:
* Login/create a user account
* Create an Application
* Book an Appointment
* Receive a Confirmation

Below is the description of the options available in the sample UI Implementation

## Login/create a user account

### Preferred Language selection
The Pre-registration module in MOSIP supports multiple languages. On the login page, MOSIP provides the user an option to select the language of preference for accessing the pre-registration portal.  
The dropdown present on the Login page will display the list of languages. Once the language is selected by the user, the Field and button labels, error and information messages throughout the application will be displayed in the preferred language. 

### Login using email or phone number
Residents can log in to the portal by providing their email address or mobile number. The system validates the email ID or phone number entered, sends an OTP which the resident needs to enter. Once the OTP is validated, the user needs to fill the necessary details for booking an appointment. 

### CAPTCHA support
This is a configurable option provided to the ID issuer. Before requesting for an OTP, the system asks the resident to provide a CAPTCHA. CAPTCHA is used to mitigate DDoS attacks. Once the challenge provided in the CAPTCHA is solved by the resident, the request for an OTP is sent. 

### Logout/session timeout
If the resident wishes to log out of the pre-registration system, they can do so by clicking on the Logout option. The token issued during the authentication of user login is deleted and the user gets logged out of the system. If the user is inactive for say X minutes (X is configurable), the system notifies the user a minute before the configured timeout limit and logs out after a minute. In such a case, no user data is saved.

#### To login/ create a user account
1. Open the browser and visit the pre-registration portal.
2. Select the preferred language.
3. Enter your email address or phone number.
4. Click **Send OTP**.
The user receives an OTP on the registered email ID or the phone number.
5. Enter the OTP and click **Verify**.
Once the OTP is verified, you will see a pop up for selecting the languages for data entry.
6. Select the languages and click **Submit**.

## Create an Application
This section includes some of the key steps for creating an application.

### Language selection for Data capture
* After successful login, based on the language configurations set by the ID issuer, the residents will have the option to select their language of preference to fill up the application details.  
* A user logging in for the first time and having no applications will be prompted with a data capture language pop-up.
* The same set of languages will be used for the next set of applications created in the same session. 
* The language selected by the user in the login screen will be pre-selected in the data capture language pop-up.
**Note**: The user can change this by clicking on the **CHANGE DATA CAPTURE LANGUAGES** button.
          This choice will be available only if the ID issuer has configured usage of optional languages.
      
### Provide consent
Before filling the application form, the user is advised to provide their consent for storage and utilization of their personally identifiable information (PII). The consent is sought from the user for every new application created in the system. On providing their consent, the system redirects the user to start the pre-registration application (demographic details). The data as part of the consent form is rendered as setup by the administrator.

There may be a situation where the user opts to close the Consent Pop-up. In this case, the following scenarios may arise:
1. For a First- time login user:  On clicking **Cancel**, the system will redirect the user to the Dashboard page which means that the user will not be allowed to fill up the details for further processing.
2. For existing users: The existing users could choose to create more applications for their family or acquaintances. This can be possible from two places on the portal:
    a. Click **Create New Application** on the Dashboard: On cancelling the consent pop up while creating a new application, the user would be redirected to the Dashboard page.
    b. Click **Add an Applicant** from **Preview** page: On cancelling the consent pop up while creating a new application, the user would be redirected to the Preview page.

**Note**: Consent is sought from the user for every new application created in the system. The contents of the consent will be displayed in all data capture languages selected.

### Provide Demographic data

The demographic data that needs to be collected from the residents is configurable as per a country’s requirement. The user is provided with a demographic form based on the ID Object Definition & UI Specification for new pre-registration application. The residents are expected to fills demographic details (e.g., Full Name, Age/DOB, Gender, Residential status, Address, mobile number, email id, etc.). The system validates the fields entered, the system also checks for the mandatory fields. Additionally, the system validates for any blocklisted words entered as configured by the country. Once validated a pre-registration request ID (PRID) is generated and the demographic details provided by the residents gets mapped to that PRID.
On the Demographic Details page, the residents will be able to enter their data in their preferred language.   
A sample image is shown below.
![](_images/pre-registration-ui-sample.jpg)

### Upload Documents
MOSIP also empowers the countries with an option to configure the documents which needs to be uploaded by the residents for the registration process.

#### Attaching documents to the application
**Document Categories and Applicable Document Types** 
* When user provides their demographic data, the pre-registration system captures the data. 
* Based on the parameters (from the configuration) for example - gender, age and residential status (Foreigner, National) from the demographic data, applicant types are determined. The pre-registration system then sends the id to the mapping.
* Based on the Applicant type, the Applicable Document categories are received from the mapping. The pre-registration system then displays only applicable categories.
* The Document Category and type of documents in each category to be uploaded varies based on the applicant type. Pre-registration system displays only those types to the applicant.
* Once the documents are uploaded by applicant the system performs virus scan to check the integrity of the document. Once the virus scan is successful, the document is encrypted and stored in the object store.

**Referring to already uploaded documents**
* The POA (Proof of Address) document could be uploaded or can be referred to an already uploaded POA of an existing applicant
* The user could select a particular applicant document to which he wants to refer to.
* When Pre-registering for a family living at the same address, it is not required to upload the same POA repeatedly, instead, they could refer to the document as uploaded by the first family member thereby saving time and space.

**Preview the Data**
Once the user fills up the demographic details and uploads the required documents, they will be able to preview the data. On the Preview page, the residents can choose to **modify** the demographic details by clicking on the modify button at the top right corner. Similarly, they can modify the uploaded documents, but clicking modify at the bottom right corner.
On this page, the user also has an option to add another applicant by clicking **Add an Applicant**. Further, the user can click **Book Now** to book an appointment.

**Create multiple applications**
Once the demographic details are filled and the documents are uploaded, the user can add more applicants. To do so, they can select Add an Applicant option on the preview page or Create New Application option on the Dashboard. The system associates an unique pre-registration ID to the new application(s) created.

### Viewing My Applications

Once the application is created, there could be multiple statuses depending on the data filled by the user/resident or the actions performed by them. The user can view all the pre-registration applications created by them in the Dashboard. The different statuses with a brief explanation are mentioned below:

The applications are sorted and displayed by the order of creation of application. The first application created appears first, latest created/modified application appears at the end. If the user visits the registration center and consumes the appointment, then the application will be removed from the list. If the appointment date has passed, the status changes to "Expired" and is retained on the dashboard for further rebooking/modification as required.

### Modify application data
The user can modify the pre-registration data by opting to select the **modify** option for a specific application. The system provides the demographic form with pre-filled demo details and allows the user to edit the details as required. The system associates the modified demo details with the pre-registration id for which Modify information is initiated.

### Discard application
The user can discard the pre-registration by clicking on the **Delete** icon for the pre-registration ID for which they wish to discard. The system provides the user with two options: **Discard entire Application** or **Cancel** appointment. If the user chooses to discard the entire application, the system deletes all the data mapped to the pre-registration ID and cancels the appointment (if any).

## Booking an appointment
### Choosing a registration center for an appointment
#### Centers recommended based on postal code
* The system recommends registration centers based on the postal code(s) of all the applicants for whom the appointment is to be booked
* The search results have the following information about the registration center: name, address, working hours, contact person, center type, and contact number
* The first registration center as per the search criteria is shown to the user on map by default

#### Centers based on user geo-location
* An user can enable location services, in the device/computer in order to select nearby centers
* The system checks for the latitude and Longitude values of the user and  fetches all the registration centers within 2 Km radius (configurable)
* The first registration center as per the search criteria is shown to the user on map by default.

#### Centers based on search criteria selected 
* An user may opt to perform a text search to find a center based on which the system displays the registration centers
* It is a contextual search where the user selects a search criteria and based on the selected search criteria enters relevant text. 
* The first registration center as per the search criteria is shown to the user on map by default

#### Get appointment for the day
* An user logs in to the pre-registration portal and opts to book appointment for pre-registration application or Modify the appointment
* The system presents a list of centers to the user to select the required registration center 
* The time selection with calendar days along with number of slots available per calendar day will be displayed 
* The user can select any of the calendar day for which they wish to book an appointment.
* Time slots of 15 minutes each are displayed (configurable).
* Each time slot with available slots will be displayed.
* The user can select a slot and proceed to book appointment or can go back to select another registration center

### Choosing appointment slots

#### Get slots availability
This is again a configurable option provided which can be set as according to a country’ requirements. In this page, the user can view the available slots in a selected registration center.
* The system displays 7 calendar days (configurable) for the user to select a slot in the chosen center
* Calendar days which are Holidays or non-working days for the selected registration center are greyed out or not shown to the user
* For a selected registration center 8 hours (configurable) are considered as working hours
* A user can view time slots of 15 minutes (configurable) each for the selected calendar day and view available slots for every time slot shown in the selected calendar day
* An applicant can further choose the preferred timeslot
* An user can confirm the appointment selection of the preferred/chosen time slot – Subsequently the timeslot(s) are locked

### Cancel appointment
* The user can opt to cancel the selected appointment\s against the application which i\are in Booked Status.
* In such a case, the system notifies the user about the successful cancellation 
* Following a successful appointment cancellation, the system unlocks the time slot of the registration center to ensure that someone else can book it.

### Re-book appointment
* The system provides the user with the list of available appointment slots
* The user can select any appointment date available and the appointment slot available
* The user has to select against which pre-registration ID the appointment slot is being booked
* The system maps appointment slot with all the pre-registration IDs, which are selected for appointment booking
* If any pre-registration ID does not have booking mapped, the user is notified if they want to continue without the booking
* A user at this stage may opt to search for a registration center. In this case, the appointment-booking (Time Slot selected) done is removed
* An user cannot  Re-book the appointment if the appointment booking is less than 48 hours (configurable) from time of booking

#### Appointment acknowledgement
* An Acknowledgement is triggered after successful completion of pre-registration (booking an appointment)
* The acknowledgement contains the following information: name, pre-registration ID, age/DoB, mobile number, email id and registration center details, appointment date, appointment time)
* A QR code containing the pre-registration ID is generated. This QR code can be scanned at the registration center to fetch the details to be used during the registration process.
* User can choose to print or download the acknowledgement as PDF.

## Receive a Confirmation
### NOTIFICATIONS 
**Send acknowledgement to email/phone**
* The system sends an acknowledgement to the applicant to the registered phone (SMS) or email as per the details provided in demographic form. In case of multiple applications, the system sends notifications for each applicant to the details provided in the demographic form of that applicant.
* Additionally, user can opt to manually trigger notification(s) to the contact details of additional recipients. However, this is driven by the Notification configuration setup by the administrator, to allow a notification to be triggered by SMS/email/both or none.
* The confirmation acknowledgement is also rendered on screen with a confirmation message of the notification being triggered. (Subject to the notification parameter configuration and if any mobile/email id was provided)




