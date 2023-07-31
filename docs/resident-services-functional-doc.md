# Functional Design Document

Resident Portal is a self-help web portal that can be used by the residents of a country to avail the services related to their Unique Identification Number (UIN). The key services provided are:

* UIN services
    * View My History
    * Secure My ID
    * Manage My VID
    * Track My Request
    * Download My Personalized Card
    * Update My Data
    * Share My Credential
* Get Information
    * Supporting Documents
    * Registration Center
* Verify Email ID/Phone number
* Get My UIN
* Booking an Appointment

Below is the detailed explanation of each of the features mentioned above.


<<< >>>

### View My History

The residents can view the history of all the transactions associated with their logged-in UIN/ AID/ VID. They can also view their details and if any unaccounted entry is found, a report can be raised against the same.

![](_images/rs-view-my-history.jpg)

Below is the list of APIs:

**GET /service-history/{lang-code}**: This API is to get the service history of one or more service types. These entries can be fetched for a certain period (start date and end date). The result will be paginated. This is an authenticated API.


