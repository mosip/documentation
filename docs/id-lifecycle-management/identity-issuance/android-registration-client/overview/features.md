# Features

## Android Registration Client

Android Registration Client provides several essential features designed to enhance user convenience and system efficiency.

It facilitates seamless user registration by offering an intuitive interface that supports quick data entry and ensures rigorous data validation to minimize errors.

Read through to know more about the key features of Android Registration:

### 1. Operator/ Supervisor Login (offline and online)

Operators can securely login using their credentials, whether in offline or online mode, to carry out various registration transactions. To enable offline login, the operator must have previously logged in and synchronized their data over a network.

### 2. Multi-language Support

The Android Registration Client supports multiple languages for content display and data entry.

* **Display Language** Display Language refers to the language used for rendering UI elements such as labels and headings. With the Android Registration Client, Operators have the option to choose their preferred language for UI display. This language selection can be made on the login screen. Currently, the supported display languages include Arabic, French, and English.
* New languages can be added by following the below steps:
* Additional languages can be configured by adding localization files in the lib/l10n folder present in the root project directory("android\_registration\_client").
* The languages that are rendered on the UI will be based on the country configuration (after master data sync). The default display language is English. Other languages will be available in the UI after the master data sync.

To know more, refer to [Flutter doc-Internationalizing Flutter apps](https://docs.flutter.dev/ui/accessibility-and-localization/internationalization).

* **Data Entry Language**: The Data Entry Language refers to the specific language utilized by the Operator while gathering data, which is then stored on the server in that selected language. During the registration process, the Operator can choose the language preference for the data collected, allowing applicants to provide information in their desired language. This language selection option becomes available upon initiating a new registration. The responsibility for managing the data entry language lies within the UI Spec, and any modifications or changes can be made through that specification.

### 3. Auto-Sync/ manual sync

On launching the Android Registration Client and logging in for the first time, the system automatically syncs the following data:

* **Configuration sync**: Sync of properties which drives in deciding the ARC UI functionality. For example: Invalid login attempts, idle timeout, thresholds, etc.
* **Masterdata sync**: As a part of this sync, supporting information like Dynamic field data, templates, locations, screen authorization, blocklisted words, etc. are pulled in.
* **UserDetails sync**: userID, along with their status is synced. Only the user details belonging to machine mapped center will be synced.
* **Certificate sync**: Certificates used to validate the server signatures, device CA certificates, and public key (specific to a center and machine, also called policy key) used to encrypt the registration packet will be synced.

### 4. New Registrations

Operators can register a resident using the `New Registration` feature. The registration process can be customized through the Android Registration Client [UI specification](../develop/ui-spec-documentation.md). The required data for registering an applicant are as follows:

* **Consent**: Before the registration process, applicants must provide consent to the terms and conditions presented on the consent screen. This explicitly asks the applicant to grant permission for storing and using their Personally Identifiable Information (PII).
* **Demographic Details**: Once the consent is obtained, the Operator will enter the demographic data of the applicant in the language preferred by the applicant. This includes details such as their name, gender, date of birth, and residential address.
* **Documents Upload**: Following the completion of the demographic details, the Operator can select the document type, input the reference, and upload the supporting documents provided by the applicant. Supporting documents may include Proof of Address, Proof of Identity, and Proof of Birth, based on the country-specific requirements.
* **Biometrics**: After the documents have been uploaded, the Operator will proceed to capture the applicant's biometrics. The biometrics captured are as follows:

```
- Fingerprints
- Iris 
- Photograph
- Exception photograph
```

The acquisition of biometric data is regulated by the country. The country has control over the capture of each type of biometric (fingerprint, iris, or face) through the global configuration. When the Operator selects the **Capture** button, the biometric SBI application is accessed to capture the biometrics.

Once the biometrics are obtained, the data and control are returned to the Android Registration Client. To obtain the resident's biometrics, the quality of the captured image must exceed the threshold specified by the country. The biometrics can be captured a set number of times if necessary to meet the quality threshold. In situations where none of the captured images meet the threshold, the image with the highest quality score will be saved.

If the resident has a biometric exception (such as a missing finger/eye or very poor finger/iris quality), the Operator can designate that particular biometric as an exception. However, the Operator must still capture the resident's exception photo.

Biometrics exceptions: If the resident has a biometric exception (such as a missing finger/eye or very poor finger/iris quality), the Operator can designate that particular biometric as an exception. However, the Operator must still capture the resident's exception photo.

* **Preview section**: The Operator can review the data entered by the applicant, including demographic information, uploaded documents, and captured biometrics. This preview allows the Operator to ensure the accuracy of the entered data. If any mistakes are found, the Operator can easily go back to the corresponding section and make the necessary corrections. If the data is correct, the Operator can proceed to the next step, which is to authenticate themselves.
* **Operator authentication**: Once both the Operator and applicant have confirmed that the data is accurately filled, the Operator is required to authenticate themselves using their credentials. After a successful authentication, the data packets are created and only then the sync and upload operations can be performed.
* **Acknowledgment section**: Following the completion of the new registration process, an acknowledgment receipt is generated. This receipt includes the AID(Application ID), captured demographic data in the selected language, a photograph of the resident, and a ranking of each finger from 1 to 10, with 1 representing the finger with the best quality. The receipt is designed to be easily printed.
* **Packet sync and upload**: After the applicant's registration form has been completed and the Operator has authenticated themselves, a packet sync must be performed. This can be done either manually or as a background job(auto sync and upload of packets). Packet sync ensures that the packet is prepared for uploading and the status of the uploaded packet is synchronized with the server. Once the packet sync is completed, the system will proceed to upload the packet to the server when an internet connection is available. If there is no network access, the system will attempt to upload the packet as soon as connectivity is established.

### 5. Operator onboarding

To log in to the Android Registration Client, the operator must complete the onboarding process. This functionality is available only during the first online login. The operator must onboard by capturing their fingerprints, thumbprints, iris, and face. Once these are captured, the operator can start registering residents and using other services.

### 6. Dashboard

The Operator can access the dashboard where he can view the following:

1. **Packets created:** This will show the total number of packets created from the time the Android Registration Client was installed.
2. **Packets Synced:** This will show the total number of packets synced from the time the Android Registration Client was installed.
3. **Packets Uploaded:** This will show the total number of packets uploaded from the time the Android Registration Client was installed.
4. **User details:**
   1. **User ID:** This will show the list of User IDs of the Users mapped to the device.
   2. **Username:** This will show the list of usernames of the Users mapped to the device.
   3. **Status:** This will show the status of Users mapped to the device. This can take values such as onboarded, active, inactive, etc.

### 7. Supervisor's Approval

Once the packet is created by the Operator, as an additional check, the Supervisor will have to go through each application to make sure the details filled are coherent. At this stage, the Supervisor can either Approve the Application or he can Reject it. If the Supervisor decides to reject it, they also will have to mandatorily mention the reason for rejection. Once the Application has been Approved or Rejected, the Supervisor will have to authenticate himself by entering his Username and Password. Once they have successfully authenticated, the Application will be removed from the “Supervisor’s Approval” section and will be moved to the “Manage Application” Section.

{% hint style="info" %}
This feature will only be available for a users having “Supervisor” role.
{% endhint %}

### 8. Manual Application upload/export

Once the Application is either Approved or Rejected by the Supervisor, those packets can be uploaded to the server from the “Manage Application” section. If there is internet connectivity, the packet will be synced and uploaded to the server but in case of lack of internet connectivity, the User can also export the packet to their local device storage.

### 9. Update UIN

In a scenario where the Resident wants to update their data, they can do so by letting the Operator know their UIN and the data that needs to be updated. Residents can update their demographic details, documents, and biometrics using this feature.

### 10. Logout

Using this feature, once the user is done with their registration and other activities, they can logout. If no background tasks are running, the user will be immediately logged out. If there are tasks (like sync) running in the background, the user will be notified about the same. From here if the User wants to cancel the logout, the background activities will keep running whereas if the user chooses to logout, they will be logged out and the background activities will be terminated.

### 11. Match SDK
 This feature ensures that Operator biometrics are not mistakenly captured during an applicant’s registration. When enabled, local deduplication is performed to match the applicant’s biometrics against the Operator’s onboarded biometrics. If a match is found, the biometric data will not be saved, and the Operator will be blocked from proceeding. An error message stating “Biometrics Matched With Operator Biometrics, Please Try Again” will be displayed. This check works in both online and offline modes and is configurable via the system settings. If disabled, the registration flow continues normally.


### 12. Update operator's biometrics

In a scenario where the operator wants to update his biometric section from operational tasks to update.

### 13. Handles Feature

The Handles Feature is designed to streamline citizen registration and authentication. During registration, specific attributes such as email or national ID can be designated as a handle. This handle serves as a unique identifier that can later be used for authentication for various services. Handles can also be used to update data in case of data discrepancies. By allowing flexible and secure identification, the feature enhances the accuracy and integrity of citizen records while simplifying user interactions with government systems-

### 14. Lost UIN

In a scenario where the Resident has forgotten their UIN, the Operator can use the “Retrieve Lost UIN” option to initiate a request by capturing the resident’s consent, optional demographic details, and mandatory biometrics. After verifying the data in the preview screen and authenticating themselves, the Operator can generate and upload the packet to the server, following which an acknowledgment receipt with the new Application ID (AID) will be shown.

### 15. Scan AID QR Code

This feature allows Operators to scan a resident’s pre-registration AID QR code to auto-fill their demographic and document data during a new registration. After logging in and selecting “New Registration", the Operator chooses display and notification languages, captures consent, and proceeds to the demographic page. From here, they can scan the AID QR code or enter it manually. If the AID is valid, the system fetches the pre-filled demographic and document data. The Operator can then proceed to capture biometrics and complete registration. This works whether or not the pre-registration was done for the same center and zone, using on-demand fetch if needed. Alternate flows include continuing without scanning or by manually entering the AID.

### 16. Reset Password

This feature allows Operators and Supervisors to reset their password using the “Reset Password” option available in the Profile section. On clicking the option, users are redirected to the Keycloak login page (this link is configurable) where they can update their password. After resetting the password, users can return to the ARC login page and sign in with the new password.

### 17. Forgot Password

If a Supervisor or Operator forgets their password, they can use the "Forgot Password" option available on the login screen. After entering their username, users will be redirected to the Keycloak login page (configurable link) where they can click the "Forgot Password" link. This triggers an email to the registered email ID with instructions to reset the password. Once the password is updated, users can return to the ARC login page and log in using their new password.

### 18. Auto Logout

The Auto Logout feature enhances application security by automatically logging out users after a defined period of inactivity. The system monitors user activity, and when inactivity exceeds a configurable threshold, a warning message appears with a countdown timer. Users can choose to stay logged in or log out immediately. If the user remains inactive during the warning period, the application automatically logs them out and securely clears all authentication states and session data.

### 19. GPS Location

This feature enables the Operator to automatically capture GPS location (latitude and longitude) when creating any packet through Android Registration Client. The GPS location is captured at the point of packet creation and attached as metadata to the packet, ensuring that the Operator's location is tracked for audit and verification purposes. If the device's location services are disabled or GPS is unavailable, the system will log a warning but will not block packet creation.

### 20. Biometrics Correction

The Biometric Correction feature enables operators to update and correct the biometric information of applicants, ensuring accurate association with their Unique Identification Number (UIN). When a resident's biometric data does not meet the required threshold during the registration process, the system generates an Additional Info Request ID. This ID is sent to the resident via notification, allowing them to schedule an appointment and update their biometric information at a registration centre.

### 21. Scheduled Jobs Settings

The Manage Scheduled Jobs feature allows admin and supervisor users to view, manage, and trigger scheduled sync/batch jobs directly from the Scheduled Jobs Settings screen. This feature provides visibility into system jobs (e.g., syncs, cleanup, updates) and enables supervisors to modify their scheduling configuration (cron expressions) on the local device. Each job entry displays the Job Name, Next Run Time, Last Run Time, Cron Expression (editable), and a Manual Trigger Button (Run Now).

### 22. Global Config Settings

This feature enables authorized users (Supervisors) to view and manage global configurations in a single Global Config Settings screen. The feature displays server values fetched from masterdata and allows supervisors to override these values locally on the device. Local configuration changes apply only to the current device and do not affect server-side configurations or other devices. Supervisors can edit Local Values for permitted configuration keys and submit changes, which will automatically restart the app to apply the updates.

### 23. Device Settings

This feature enables authorized users (Supervisors and Officers) to view and monitor all devices/peripherals connected to the Android Registration Client tablet. On opening the Device Settings page, the system will automatically scan for connected devices and display device information including device name, device ID, and connection status. If no devices are detected, users can click on the "Scan Now" button to manually trigger a device scan.

### 24. Responsive Landscape Orientation Support

The Android Registration Client now fully supports landscape orientation across key screens and workflows. This enhancement ensures a seamless and responsive experience when devices are used horizontally particularly useful for tablets, rugged field devices, and setups where landscape mode improves visibility, usability, or ergonomics. UI components dynamically adjust to maintain clarity, readability, and smooth navigation, offering operators greater flexibility in diverse registration environments.

### 25. Adaptive Small Screen (Phone) Experience

We’ve optimised the Android Registration Client for smaller screens to ensure a clean, intuitive, and efficient experience on mobile phones. Layouts, forms, and action buttons are now adaptive, automatically adjusting to the constraints of smaller displays without compromising functionality. This enhancement enables field officers and mobile registration teams to operate the client comfortably on compact devices, ensuring consistent performance across a wider range of Android form factors.

### 26. Pre-Registration Data Management

Pre-Registration Data Management enables the Android Registration Client (ARC) to securely download, store, and manage pre-registration applications for faster and more reliable registration. ARC supports scheduled and on-demand batch downloads of pre-registration data and stores it securely in encrypted local storage for offline use. It allows operators to access any valid pre-registration application regardless of the originally booked registration center and automatically cleans up locally stored data through configurable background jobs to optimize device storage.

### 27. Center Remapping

Center Remapping Support enables the Android Registration Client (ARC) to seamlessly transition a registration machine from one registration center to another while maintaining operational integrity. ARC ensures that all pending center-specific activities are completed before remapping, securely removes data associated with the previous center, synchronizes the device with the new center’s configuration and performs a controlled restart to complete the transition. It also tracks critical activities such as packet approvals, uploads, confirmations, and deletions throughout the remapping process.
