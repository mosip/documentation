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

* For details on the low level design please follow the page,
    * [Approach to pre-registration appointment acknowledgment screen]()
    * [Approach to pre-registration notifications](https://github.com/mosip/pre-registration/blob/1.1.5/design/pre-registration/pre-registration-notification-service.md)
* For changing the email and SMS template please view our page on [pre-registration configurations](../../../api-reference/Pre-Registration-Configuration.md#templates-used-by-pre-registration)

{% endhint %}