#  Creating an application

##  Provide demographic data 

The user is provided with demographic form based on the [ID Object Definition](MOSIP-ID-Object-Definition.md) & [UI Specification](UI-Specification-for-Pre-Registration.md) for new pre-registration application, user fills demographic details (e.g., Full Name, Age/DOB, Gender, Residential status, Address, mobile number, email id, etc.). The system validates the fields entered, the system also checks for the mandatory fields. Additionally, the system validates for any blacklisted words entered (as configured by the country). Once validated a pre-registration request ID (PRID) is generated and the demographic details provided get mapped to that PRID.

{% hint style="info" %}
Consent is sought from the user for every new application created in the system.
{% endhint %}

## Provide consent 

Before filling the application form, the user is advised to provide their consent for storage and utilization of their personally identifiable information (PII). Consent is sought from the user for every new application created in the system. On providing their consent, the system redirects the user to start the pre-registration application (demographic details). The data as part of the consent form is rendered as set up by the administrator.

In case of closure of the Consent Pop-up, the following scenarios may arise:

* First-time login: On closure, the system alerts the user that he will be logged out due to not providing consent.
* Existing user login
   * Scenario 1: Create a new application from Dashboard: On closure, the user will be redirected to the dashboard page.
   * Scenario 2: Add Applicant from Preview Page: On closure, the user will be redirected to the preview page.

## Create multiple applications 

Once the demographic details are filled and the Documents are uploaded, if the user wishes to add an applicant, he/she can opt to select the 'Add An Applicant' option on the preview page or 'Create New Application' option on the Dashboard. The system associates a unique pre-registration id to the new application(s) created.

## Provide data in a preferred language 

The user can select their language of preference, which is referred to as Primary (from a list of 2 languages as set by the administrator) from the login screen, the other language from the list is considered as secondary. The user can then provide data in the preferred language (primary) as selected. The data on the right side of the demographic page will be transliterated to secondary language. The labels on the right-hand side will be translated to the Secondary language. The user can verify the transliterated data and edit it if required. The data will subsequently be stored in the database along with the respective language codes.

### Language Configuration 

In the below-listed scenarios, the system will render an error message on the Login page and inhibit pre-registration, and hence, the language configurations should be appropriately set up by the administrator.
* If Primary Language is set to a specific value and Secondary Language is marked as null/not set by an administrator, or
* If Secondary Language is set to a specific value and Primary Language is marked as null/not set by an administrator, or
* If both Primary and Secondary Language is marked as null/not set by the administrator.
   
Example: Primary set to English and Secondary not set or vice-versa, then the system will render the stated Error Message: "The system has encountered a technical error. Administrator to set up the necessary language configuration(s)." The error message will not have an option to exit, hence not allow the user to proceed further. On page refresh, the system will render the error message again and hence, inhibit pre-registrations. 

Considering a scenario, wherein if Primary language and Secondary language is configured to be the same, eg. English; then:
*The system will render the demographic page (with both left and right side for Primary and Secondary language) in the same language
* Values entered on the left side (Primary Language) will not be transliterated but auto-copied on the right side
* Values on the right side will remain un-editable
* As part of the packet, the system will send/store data in one language only, if language code is identified to be the same – eg. en (English)

##  Viewing "My Applications" (covers status) 
The pre-registrations created will be associated with the user id. The user can view all the pre-registrations created by him/her in the Dashboard. The pre-registration can be in three different status (Pending appointment, Booked, Expired)

|Status|Explanation|User Action|
|------|-----|-----|
|Pending appointment|Filled only demographic details|Upload documents and book an appointment|
|Pending appointment|Filled demographic details and uploaded documents |Book an appointment|
|Booked|  Filled demographic details, uploaded documents, and booked appointment|Visit the registration center on the appointment date and time|
|Expired| Appointed date has passed|N/A

The applications are sorted and displayed by the order of creation of an application. The first application created appears first, latest created/modified application appears at the end. If the user visits the registration center and consumes the appointment, then the application will be removed from the list. If the appointment date has passed, the status changes to "Expired" and is retained on the dashboard for further rebooking/modification as required.

## Modify application data 
The user can modify the pre-registration data by opting to select the "Modify" option for a specific application. The system provides the demographic form with pre-filled demo details and allows the user to edit the details as required. The system associates the modified demo details with the pre-registration id for which Modify information is initiated.

## Discard application 
The user can discard the pre-registration by clicking on the Delete icon for the pre-registration id for which he/she wishes to discard. The system provides the user with two options: 'Discard Entire Application' or 'Cancel appointment'. The user chooses to discard the entire application. The system deletes all the data mapped to the pre-registration id and cancels the appointment (if any).

{% hint style="info" %}

* For details on the low level design please follow the page,
    * [Approach to pre-registration demographic service](https://github.com/mosip/pre-registration/blob/1.1.5/design/pre-registration/pre-registration-demographic-service.md)
* For details on the API specification on pre-registration application follow this [page](Pre-Registration-APIs.md#demographic-service-public)

{% endhint %}