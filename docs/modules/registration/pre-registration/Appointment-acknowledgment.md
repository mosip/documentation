# Appointment acknowledgment

* An Acknowledgement is triggered after successful completion of pre-registration (booking an appointment)
* The acknowledgment contains the following information: name, pre-registration id, age/DoB, mobile number, email id and registration center details, appointment date, appointment time)
* A QR code that contains the pre-registration ID
* This QR code can be scanned at the registration center to fetch the details to be used during the registration process

## Download acknowledgment
Users can choose to print or download the acknowledgment as a PDF.

##  Send acknowledgment to email/phone
The system sends an acknowledgment to the applicant to the registered phone (SMS) or email as per the details provided in the demographic form.  In the case of multiple applications, the system sends notifications for each applicant to the details provided in the demographic form of that applicant.

Additionally, users can opt to manually trigger a notification(s) to the contact details of additional recipients. However, this is driven by the Notification configuration setup by the administrator, to allow notification to be triggered by SMS/email/both or none.

The confirmation acknowledgment is also rendered on screen with a confirmation message of the notification being triggered (Subject to the notification parameter configuration and if any mobile/email id was provided).

{% hint style="info" %}

## To Do
## API Details
 * [API Documentation](https://nayakrounak.gitbook.io/mosip-docs/v/1.2.0/modules/registration/pre-registration/Pre-Reg-API-Documentation.md)

* Configuration Parameters
    * List of parameters and how they alter the behaviour of the API

## Links to related content
* Link to design documentation,
* Links to How To articles
