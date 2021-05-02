#  Booking an appointment

##  Choosing a registration center for an appointment

###  Recommended centers based on postal code 
* The system recommends registration centers based on the postal code(s) of all the applicants for whom the appointment is to be booked
* The search results have the following information about the registration center: name, address, working hours, contact person, center type, and contact number
* The first registration center as per the search criteria is shown to the user on the map by default

###  Nearby centers based on user geo-location 
* An user can  enable location services, in the device/machine to select nearby centers
* The system checks for the latitude and longitude values of the user and  fetches all the registration centers within a 2 Km radius (configurable)
* The first registration center as per the search criteria is shown to the user on the map by default.

### Find a center 
* An user may opt to perform a text search to find a center based on which the system displays the registration centers
* It is a contextual search where the user selects search criteria and based on the selected search criteria enters relevant text
* The first registration center as per the search criteria is shown to the user on the map by default

## Get an appointment for the day 
* An user logs in to the pre-registration system  and opts to book an appointment for pre-registration application or Modify the appointment
* The system presents a list of Centers to the user to select the required registration center 
* The time selection with calendar days along with some slots available per calendar day will be displayed 
* The user can select any of the calendar days in which he/she wishes to book an appointment.
* Time slots of 15 minutes each are displayed (configurable)
* Each time slot with available slots will be displayed
* The user can select a slot and proceed to book an appointment or can go back to select another registration center

## Choosing appointment slots

###  Get slots availability 
The user opts to view the available slots for a selected registration center
* The system displays 7 calendar days (configurable) for the user to select a slot in the chosen center
* Calendar days which are holidays or non-working days for the selected registration center are greyed out or not shown to the user
* For a selected registration center 8 hours (configurable) are considered as working hours
* A user can view time slots of 15 minutes (configurable) each for the selected calendar day and view available slots for every time slot shown in the selected calendar day
* An applicant can further choose the preferred timeslot
* An user can confirm the appointment selection of the preferred/chosen time slot – Subsequently, the timeslot(s) are locked

##  Cancel appointment 
* An user can opt to cancel selected appointment\s against the application which is/are in booked status
* In such case the system notifies the user about the successful cancellation 
* Following a successful appointment cancellation the system unlocks the time slot of the registration center so that someone else can book it

## Re-book appointment 
* The system provides the user with the list of available appointment slots
* An user can select any of the appointment Date available and any of the appointment Slot available
* The user has to select against which pre-registration id the appointment slot is being booked
* The system maps appointment slot with all the pre-registration ids, which are selected for appointment booking
* If any pre-registration id does not have booking mapped, the user is notified if he wants to continue without booking
* An user at this stage may opt to search the registration center. In this case, the appointment-booking (time slot selected) done is removed
* An user cannot re-book the appointment if the appointment booking is less than 48 hours (configurable) from the time of booking

{% hint style="info" %}

* For details on the low level design please follow the page,
    * [Approach to pre-registration booking service](https://github.com/mosip/pre-registration/blob/1.1.5/design/pre-registration/pre-registration-booking-service.md)
* For details on the API specification on pre-registration booking follow this [page](Pre-Registration-APIs.md#booking-service-public)

{% endhint %}