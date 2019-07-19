# Approach for Notification Service

**Background**
- Exposing the REST API to notify via SMS or email to a citizen.

The target users are -
   - Pre-Registration UI

The key requirements -

-   Create the REST API to notify via SMS or email to a citizen while sending any notification. which internally call the kernel notification service.

The key non-functional requirements are

-   Log the each state while sending notification to a citizen:

-   Exception :
    -   Any exception occurred during sending notification, the same will
        be reported to the user with the user understandable exception.

**Solution**

**Notify :**

- Create a REST API as '/notify' POST method which accept the notification details, lang code, document for attachment as a request part parameters.

- notification details contains : name, pre-registration id, appointment date, appointment time, mobile number, email address and additionalRecipient.

- If the additionalRecipient is false then based on the pre-registration id do the REST call to reterive the pre-registration data, parse the ID JSON object to get the mobile number and email address out of it.

- Do the REST call to reterive the corresponding language notification templet based on requestd lang code.

- DO the REST call to the KERNEL notifiaction service based on SMS and Email. If it is successful send the success response otherwise throw an exception. 

**Class Diagram**
![pre-registration notification service](_images/_class_diagram/pre-registration-notify.png)
**Sequence Diagram**
![pre-registration notification service](_images/_sequence_diagram/pre-registration-notify.png)

**Error Code**
 While notify the OTP if there is any error then send the respective error code to the UI from API layer as Response object.

  Code   |       Type  | Message|
-----|----------|-------------|
PRG_ACK_001 |  Error   |   MOBILE_NUMBER_OR_EMAIL_ADDRESS_NOT_FILLED.
PRG_ACK_002 | Error | INCORRECT_MANDATORY_FIELDS.

**Dependency Modules**

Component Name | Module Name | Description | 
-----|----------|-------------|
  SMS Notifier    |   Kernel        |    To notify via SMS.
  Email Notifier | Kernel | To notify via email.
  Exception Manager  |  Kernel     |       To prepare the user defined exception and render to the user.
  Log        |          Kernel         |   To log the process.

**User Story References**

**User Story No.** |  **Reference Link** |
-----|----------|
**MOS-13142**      |     <https://mosipid.atlassian.net/browse/MOS-13142>
**MOS-14510**      |      <https://mosipid.atlassian.net/browse/MOS-14510>
