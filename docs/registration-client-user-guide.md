# Registration Client User Guide

## Overview

This guide describes the various functions provided in the Home page of the reference UI implementation of the registration client.

![](\_images/reg-client-orig.png)

## Menu bar

The Registration Client menu bar displays the following:

* MOSIP logo
* Home button
* Logged in username
* Center name
* Machine name
* Server connection status symbol (shows if the client is online or offline)
* [Settings icon](registration-client-settings-page.md)
* Breadcrumbs (User Guide/Reset Password/Logout)

![](\_images/reg-client-menu.png)

## Operational tasks

### Synchronize Data

Synchronize data is the data required to make the Registration Client(RC) functional. Full sync is performed initially during the launch of the RC for the first time. Post this, the RC syncs only the changes from sever and this is called as the delta sync. Synchronize data is automated and can be triggered manually. This happens automatically while launching the RC and is also manually initiated by the operator.

1. **Configuration sync**: Sync of properties which drives in deciding the RC UI functionality. For example: Invalid login attempts, idle timeout, thresholds, etc.
2. **Masterdata sync** : As a part of this sync, supporting information like Dynamic fields data, templates, locations, screen authorization, blocklisted words, etc. are pulled in.
3. **UserDetails sync**: userID, along with their status is synced. Only the user details belonging to machine mapped center will be synced.
4. **Certificate sync**: Certificates used to validate the server signatures, device CA certificates, public key (specific to a center and machine, also called as policy key) used to encrypt the registration packet will be synced.
5. **Packet sync**:
   * All the approved/rejected Registration IDs(RIDs) will be synced to the server.
   * All the synced RID packets will be uploaded to the server.
   * All the uploaded packet status will be synced from server.

### Download Pre-Registration Data

An operator can download the pre-registration data of a machine mapped center while being online and store it locally in the registration machine for offline use. Now, when the system is offline and the pre-registration data is already downloaded, the operator can enter the pre-registration ID to auto-populate the registration form. Provided the machine is online, any pre-registration application can be downloaded irrespective of the center booked by the resident.

This pre-registration data is downloaded from pre-registration API as an encrypted packet and stored in the local storage.There is a batch job running in background for deleting the pre-registration packets after configurable number of days.

_Note_- Date Range of pre-registration data to be downloaded and storage location of pre-registration data in the registration machine is configurable. Also, this is synced as a part of configuration sync.

### Update Operator Biometrics

Using this option, the operators can onboard themselves anytime.

For more details, refer [Operator Onboarding Guide](https://docs.mosip.io/1.2.0/modules/registration-client/operator-onboarding).

![](\_images/reg-client-biometric-page.png)

### Application upload

* Application upload refers to upload of supervisor reviewed registration packets (approved and rejected). From this page, the operator can export the packets to any location on their machine on clicking **Save to Device** button.
* Upload of registration packet from this page internally performs two operations in sequence:
  * Sync registration metadata to server
  * On successful sync of metadata, actual registration packets are uploaded to the server.

**Client Status**: This column displays the status of a registration packet based on the above mentioned operation.

1. APPROVED
2. REJECTED
3. SYNCED
4. EXPORTED

**Server Status**:

On success,

1. PUSHED
2. PROCESSED
3. ACCEPTED

On failure,

1. REREGISTER
2. REJECTED
3. RESEND

### Registration Type

This column displays the type of registration packet (New packet, Lost packet, Update packet, Correction packet)

### Center Remap Sync

* When a machine is re-mapped from one center to another center, all the pending activities in the machine related to the former center needs to be completed.
* On successful completion of pending tasks, the former center's details will be deleted from the local Derby DB and a full sync will be initiated to pull in the new center details.

#### What are the pending tasks related to a center?

* Packet Approvals/rejections
* Packet upload
* Server confirmation on receiving a packet
* Deletion of packets after receiving a confirmation
* Deletion of pre-registration packets
* Deletion of center specific data like the public/policy key

_Note_- After completing the above tasks, a _restart_ will be prompted to initiate the full sync with new center details.

### Check Updates

* Clicking on this button, triggers a check for any new client version availability in the upgrade server.
* The machine must be online to be able to check updates.
* If there is any new version available, a confirmation pop-up is displayed to the operator for starting the upgrade or a reminder is displayed.

## Registration Tasks

The operator can initiate any task from amongst- New registrations, Update UIN, Lost UIN, Correction flow. To get started, the operator needs to select a language for data entry. The number of languages displayed in the UI is configurable and depends on the country.

### New registration

An operator can initiate the process of registering a new applicant in the MOSIP ecosystem by filling the new registration form with the resident.

![](\_images/reg-client-new-registration.png)

Below are few of the processes that needs to be completed for a new registration.

1. **Capture consent**- For every registration, the registration client provides an option for the operator to mark an individual's consent for data storage and utilization.
2. **Enter demographic data and upload documents** If the resident has a pre-registration application ID, the operator can auto-populate the demographic data and the documents by entering the pre-registration ID. If the resident does not have a pre-registration ID, the operator can enter the resident’s demographic details (such as Name, Gender, DOB, Residential Address, etc.) and upload the documents (such as Proof of Address, Proof of Identity, Proof of Birth) based on the [ID Schema](id-schema.md) defined by the country.
3. **Capture biometrics of a resident** The capture of biometrics is governed by the country, i.e. capture of each modality (fingerprint, iris or face) can be controlled by the country using the global configuration. When the operator clicks on the **Capture** button and tries to capture the biometrics of the resident, the device needs to make the capture when the quality of the biometrics is more than the threshold configured by the country. The device will try to capture the biometrics until the quality threshold has crossed or the device capture timeout has crossed which is also configurable.

After the timeout has occurred and the captured quality of biometrics is less than the threshold, registration client provides an option to re-try capture of biometrics but for a particular number of times which is also configurable. If the resident has a biometric exception (resident is missing a finger/iris or quality of finger/iris is very poor) the operator can mark that particular biometrics as **exception** but the operator has to capture the resident's exception photo.

What is the difference between an adult' and an infant' biometric capture?

* For an adult, all the configured biometrics can be captured.
* For an infant, by default, only the face biometrics is allowed to be captured.

1. **Concept of biometric exception**

* Permanent or temporary missing / defective fingers or irises can be marked as exception during registration process.
* Marked exception finger / iris names are sent as part of `rcapture` request to SBI.
* A photo of resident is captured highlighting his/her biometric exceptions called as Proof of exception (POE).
* Biometric exception photo is captured by the biometric face camera device.
* Until 1.2.0, POE was collected only as `documentType` field. From 1.2.0.1, Captured biometric exception photo is stored in the biometric data file (CBEFF xml file).

### Update UIN

When a resident visits the registration center to update their demographic or biometric details, the operator captures the updated data as provided by the resident in the registration client. The resident needs to give their UIN and also select the field(s) that needs an update. The image below gives an idea of the update UIN process Flow in the registration client.

![](\_images/reg-client-update-uin.png)

{% hint style="info" %}
_The UIN update feature is configurable by the adopters. The Admin can turn ON or OFF, the UIN update feature using the configuration._
{% endhint %}

### Lost UIN

There are two situations where a Lost UIN flow is used. I am listing here the situations.&#x20;

* The registrant has lost their Identity details.
* The registrant never received his identity due to a wrong address/email/phone

The registrant visits the registration centre to retrieve the same. The operator then captures the biometrics and the demographic details of the individual and processes a request to retrieve the lost UIN. As biometrics play a crucial role in identifying a person's identity, it is mandated to provide the biometrics as a part of the Lost UIN flow. Other details like demographic data, and uploading documents are optional.

![](\_images/reg-client-lost-uin.png)

* As a part of Lost UIN flow, the contact details like the phone number/ e-mail address of the UIN holder can also be **updated** and stored in the ID Repository based on the value provided for the property `uingenerator.lost.packet.allowed.update.fields` which is specified in the Registration Processor properties.
* If the value already exists for the above mentioned property and once the lost UIN is found, details of the identity of the individual are sent to the newly provided phone number/ e-mail address.

`Example: uingenerator.lost.packet.allowed.update.fields= phone,email`

### Correction process

For a resident whose UIN is yet not generated, they can get a request intimation to re-provide their details with a RequestId. The same _AddtionalInfo RequestId_ must be provided to the operator during the correction flow.

![](\_images/reg-client-biometric-correction.png)

_Note_- The above mentioned Registration tasks are completely configurable through UI Specs<>

### Preview and Packet authentication

* The operator can preview the data filled and navigate back to the respective tabs in case of corrections.
* Once the resident and the operator are satisfied with the data being captured, the operator can proceed to the Authenticate tab and provide his valid credentials to mark the complete of the registration task.

![](\_images/reg-client-preview.png)

### Acknowledgement receipt and printing

Once the registration process (new registration, UIN update or lost UIN, correction) is completed, the registration client generates an acknowledgement receipt. This receipt contains a QR code of the Registration application ID, captured demographic data in the selected language, photograph of the resident and ranking of each finger from 1 to 10 (1 being the finger with the best quality). This receipt is print friendly and can be used for printing using any printer.

The image below is that of a sample acknowledgement receipt.

![](\_images/re-client-acknowledgement.png)

## End-of-day processes

### Pending Approval

The Supervisor has the exclusive authority to approve/reject packets. The supervisor is supposed to manually re-verify the registrations before uploading them to the server. This page enables them to perform this activity.

**Steps to approve/reject packets**

1. Click on any of the registrations listed in the left pane. The registration details are displayed on the right pane.
2. Supervisor needs to manually verify all the details in the right pane.
3. Supervisor can click **Approve/Reject** button based on their verification.
4. To mark the completion of this approval process, they need to click on **Authenticate** and provide their credentials.
5. On successful authentication, approved/rejected packets will be removed from here and be seen on the **Application Upload** page.

### Re-registrations

All the registrations which are being marked with the RE-REGISTER status is listed here.

### Dashboard

On clicking Dashboard, the Registration client dashboard HTML template is rendered. Default dashboard displays information about the operator, Packets and the Sync Activities.

![](\_images/reg-client-dashboard.png)

### News and updates

This section has been reserved for the countries to be able to display their live news and updates. This can be implemented as per a country's requirements.

### Consent

During the training of the Operators, It must be ensured that consent is obtained directly from the resident whose personal information is being collected and processed. There is no technical way to handle this scenario, so the operator training must include this activity as a manual process and emphasize upon strictly following the same.
