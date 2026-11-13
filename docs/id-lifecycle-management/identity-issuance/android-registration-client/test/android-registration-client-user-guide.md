# End User Guide

This user guide is designed to provide assistance to Operators and Supervisors in successfully installing, running, and registering applicants to obtain their Unique Identification Numbers (UIN) on tablet devices.

## Prerequisites

* Reliable and consistent Internet connectivity.
* Tablets running Android version 10 to 13.
* Tablets with a minimum of 4 GB RAM.
* The tablets need to be capable of capturing fingerprints, iris, and face (photo) biometrics. Additionally, they should also have the ability to scan documents. However, if the tablets do not support these capabilities, MOCK SBI can be used as an alternative.

### How to install Android Registration Client (ARC)

1. Download and install the APK on Android tablet.
2. Once ARC is installed, long press on the logo to copy the machine details.
3. On the [Admin Portal](https://docs.mosip.io/1.2.0/modules/administration/admin-portal-user-guide), using admin credentials, login and perform the following to add the device:
   * Go to `Resources/Machine` and click on **Create machine**
   * Add a new machine and enter the machine details:
     * Add the specs as **Mobile**
     * Map it to a Zone and Center
     * Add the Machine spec ID as **Mobile**
     * Enter Device name
     * Enter Public Key
     * Enter Sign Public Key
   * Create the role `Default` in KeyCloak with all the other roles.
   * Create the Operator’s user account in KeyCloak set the password and assign the role as `Default`, `REGISTRATION_OFFICER`, `Registration Operator`, `REGISTRATION_SUPERVISOR`
   * Login into Admin Portal to perform the following and add the user:
     * After login into the Admin Portal, go to `User Zone Mapping` and add the zone for the user and activate it.
     * Go to `User Center Mapping` and add the center for the user and activate it.

{% hint style="info" %}
**Note: The user should be assigned to the same Zone and Center as the device.**
{% endhint %}

4. The user should relaunch the ARC and log in using their valid credentials. Additionally, the operator has the option to select their preferred display language.

Upon successful login, the user will be directed to the Home page, which includes the following options:

* New Registration
* Operational Tasks
* Dashboard
* Settings (Future scope)

### New Registration

To begin the Registration process, the Operator is required to follow the steps outlined below.

1. Click on **New Registration card**.
2. Select the language to be used for data entry, which will be used to collect the resident's information. There will be a default language for data entry.
3. Choose the language in which the notification will be sent to the resident. Click **Submit** to proceed.

<div align="center"><figure><img src="../../../../.gitbook/assets/home_page.png" alt="" width="375"><figcaption><p>New registration</p></figcaption></figure></div>

<figure><img src="../../../../.gitbook/assets/language-select-1.png" alt="" width="375"><figcaption><p>New registration</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/language-select-2.png" alt="" width="380"><figcaption><p>New registration</p></figcaption></figure>

4. The operator will be redirected to the Consent page, where the resident must agree to the `terms and conditions` to proceed.
5. After accepting consent, the Operator will need to fill out the demographic data of the resident, including their name, age, date of birth, and address. Once all mandatory fields are completed, the **Continue** button will be enabled.

<figure><img src="../../../../.gitbook/assets/consent.png" alt="" width="375"><figcaption><p>New registration</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/demographic-1.png" alt="" width="375"><figcaption><p>New registration</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/demographic-2.png" alt="" width="375"><figcaption><p>New registration</p></figcaption></figure>

4. Upon clicking the **Continue** button, the Operator will be navigated to the `Document upload` page where they will need to:
   * Select the type of document (e.g. proof of identity, proof of address) from the drop-down menu.
   * Enter the **Reference Number** of the document.

<figure><img src="../../../../.gitbook/assets/document-1.png" alt="" width="375"><figcaption><p>Document upload</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/document-2.png" alt="" width="375"><figcaption><p>Document upload</p></figcaption></figure>

4. Upload the document by clicking on the **Scan** button to open the camera. The Operator can take a picture of the document and then choose from the following actions:
   * **Cancel**: Clicking on the "Cross" icon will remove the captured image and return the Operator to the previous screen.
   * **Crop**: The Operator can drag from the four corners of the captured image to crop it as needed.
   * **Save**: Clicking on the "Save" button will save the captured image and return the Operator to the previous Document Upload page.
   * **Retake**: Clicking on the "Retake" button will remove the captured image, reopen the camera, and allow the Operator to take a new photo.

<figure><img src="../../../../.gitbook/assets/document-3.png" alt="" width="375"><figcaption><p>Document upload</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/document-4.png" alt="" width="375"><figcaption><p>Document upload</p></figcaption></figure>

8. After ensuring all required information has been accurately entered into the `Document Upload` screen, the Operator can proceed by clicking on the **Continue** button to access the `Biometric Capture` page. Here, the Operator can capture the biometric data of the Resident, including a face photo, fingerprint, and iris scan.

#### **Face photo capture process**

* To capture the face photo, the Operator should click on the **Scan** button to activate the camera and take a picture.
* The image quality will be displayed on the screen and must meet a certain threshold to be considered acceptable.
* The Operator has three attempts to capture the biometric image.
* It is important to note that no exceptions can be made for the face photo biometric capture process.

<figure><img src="../../../../.gitbook/assets/biometric-14.png" alt="" width="375"><figcaption><p>Face photo capture process</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/biometric-15.png" alt="" width="375"><figcaption><p>Face photo capture process</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/biometric-16.png" alt="" width="375"><figcaption><p>Face photo capture process</p></figcaption></figure>

#### **Biometric Data Capture Process**:

* To capture biometric data, the Operator should click on the **Scan** button.
* This will allow the Operator to capture the biometric information.
* Once the data is captured, the image quality will be displayed on the screen and must meet the acceptable threshold limit.

**Note**: Three attempts are provided to capture the biometric data.

<figure><img src="../../../../.gitbook/assets/biometric-5.png" alt="" width="375"><figcaption><p>Biometric data capture process</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/righthand.png" alt="" width="375"><figcaption></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/lefthand.png" alt="" width="375"><figcaption></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/biometric-7.png" alt="" width="375"><figcaption><p>Biometric data capture process</p></figcaption></figure>

#### **Fingerprint Capture Process**:

If a thumb is missing or experiencing difficulties that prevent its fingerprint from being captured, the Operator is authorized to indicate an **exception**. To mark an exception, the operator must select the affected thumb and specify the type of exception as either _Temporary_ or _Permanent_. Additionally, the operator may include any relevant additional comments.

<figure><img src="../../../../.gitbook/assets/biometric-11.png" alt="" width="375"><figcaption><p>Fingerprint capture process</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/thumb.png" alt="" width="375"><figcaption><p>Fingerprint capture process</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/fingerprint.png" alt="" width="380"><figcaption><p>Fingerprint capture process</p></figcaption></figure>

#### **Iris Scanning Process**:

* To initiate the Iris scan, the Operator is required to click on the **Scan** button.
* This action will allow the Operator to capture the Iris image.
* Once the Iris has been successfully captured, the quality of the image will be displayed on the screen.
* The quality score needs to meet the established threshold limit.
* The Operator has three opportunities to capture the biometric data.

If one or both of the Irises are not detected or encounter issues that prevent successful capture, the Operator has the option to mark an exception. To do so, the Operator must identify the specific Iris that is problematic and indicate the type of exception- either _Temporary_ or _Permanent_. Additionally, the Operator may provide any relevant comments.

<figure><img src="../../../../.gitbook/assets/biometric-2.png" alt="" width="375"><figcaption><p>Iris scanning process</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/biometric-3.png" alt="" width="375"><figcaption><p>Iris scanning process</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/biometric-4.png" alt="" width="375"><figcaption><p>Iris scanning process</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/biometric-17.png" alt="" width="375"><figcaption><p>Iris scanning process</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/preview-1.png" alt="" width="375"><figcaption><p>Iris scanning process</p></figcaption></figure>

<figure><img src="../../../../.gitbook/assets/preview-2.png" alt="" width="375"><figcaption><p>Iris scanning process</p></figcaption></figure>

9. After all the biometric data has been properly captured or any exceptions have been noted, the **Continue** button will be activated. The Operator can then proceed by clicking on the **Continue** button, which will redirect them to the **Preview** page. The Preview page will display the following information:

* Application ID
* Timestamp of Registration
* Demographic data collected
* Documents submitted
* Biometric data recorded

From the Preview page, the Operator can navigate back to previous screens to make any necessary adjustments to the entered or captured data. Once the Operator has verified the accuracy of the entered data, they can proceed by clicking on the **Continue** button, which will direct them to the `Operator Authentication` page.

10. On the `Operator Authentication` page, operators are required to input their credentials (username and password) that were used during the login process.

Upon successful verification of the credentials, the packet will be uploaded to the server and the operator will be redirected to the `Acknowledgment` screen. This screen includes the following information:

* Application ID
* Timestamp of Registration
* Demographic data captured
* Documents uploaded
* Biometric data captured
* Print option
* QR code for the Application ID
* Option to initiate a new registration process.

<figure><img src="../../../../.gitbook/assets/operators authentication.png" alt="" width="375"><figcaption><p>Authentication page</p></figcaption></figure>

**Pending Approval:**

Upon successful verification of the credentials, the acknowledgment will be displayed, and the Application will be moved to the “Pending Approval” section. This feature will only be available for the User who has a Supervisor’s role assigned to him.

Once the packet is created by the Operator, as an additional check, the Supervisor will have to go through each application to make sure the details filled are coherent.

**Step 1:** The user goes to the “Pending Approval” section from the Operational Tasks section. The user will be taken to the page where they can see the list of all the Applications created by the Operator. All of these Applications will be “Pending”.

<div><figure><img src="../../../../.gitbook/assets/supervisor approval 1.png" alt=""><figcaption></figcaption></figure> <figure><img src="../../../../.gitbook/assets/supervisor approval 2.png" alt=""><figcaption><p>Supervisor's approval</p></figcaption></figure> <figure><img src="../../../../.gitbook/assets/supervisor approval 3.png" alt=""><figcaption></figcaption></figure></div>

**Step 2:** The Supervisor then clicks on the Application ID one by one. At this stage, the Supervisor can either Approve the Application or he can Reject it. If the Supervisor decides to reject it, they also will have to mandatorily mention the reason for rejection.

**Step 3:** Once the Application has been Approved or Rejected, the Supervisor will have to authenticate himself by clicking on the “Submit” button and thereby entering their Username and Password. The User can also bulk submit the Applications. The only pre-requisite is that the packet has to be in Approved or Rejected status (pending Applications cannot be submitted for uploading). Once they have successfully authenticated, the Application will be removed from the “Pending Approval” section and will be moved to the “Manage Application” Section.

<div><figure><img src="../../../../.gitbook/assets/supervisor approval 4.png" alt=""><figcaption></figcaption></figure> <figure><img src="../../../../.gitbook/assets/supervisor approval 5.png" alt=""><figcaption><p>Pending approval</p></figcaption></figure> <figure><img src="../../../../.gitbook/assets/supervisor approval 6.png" alt=""><figcaption></figcaption></figure></div>

**Step 4:** Once the Application is either Approved or Rejected by the Supervisor and is submitted, those packets can be uploaded to the server from the “Manage Application” section or can be exported to their local device storage.

**Manual Application upload/export**

Once the Application is either Approved or Rejected by the Supervisor, those packets can be uploaded to the server from the “Manage Application” section.

<figure><img src="../../../../.gitbook/assets/export n upload 1.png" alt="" width="375"><figcaption><p>Manage application</p></figcaption></figure>

**Step 1:** The user selects the packets they want to upload (bulk upload can also be done). Once selected, the user clicks on the “Upload” button, after which the packet syncs and gets uploaded if there is internet connectivity.

In case of a lack of internet connectivity, the User can also export the packet to their local device storage. They can also bulk export the packets by choosing the Applications and clicking on the Export button.

On choosing to upload, the packet is uploaded to the [Registration Processor](https://docs.mosip.io/1.2.0/modules/registration-processor). Once the packet has been successfully processed, a unique identification number (UIN) is generated.

1. **Print**- The operator can click on this option to obtain a physical copy of the acknowledgment.
2. **New Registration**- The operator can initiate another registration by clicking on this option.

In summary, the user (Operator/ Supervisor) can follow the aforementioned steps to register an individual by capturing demographic data, documents, and biometric data to generate their UIN.

**Operator Onboarding**: To begin the Onboarding process, the Operator is required to follow the steps outlined below. The operator, to log in to the Android Registration Client, will have to onboard himself. This functionality will be available on first-time online login only.

a. On logging in for the first time, the Operator will be taken to the screen where they will have the following two options:

1. **Get onboard:** This flow is present for the system to verify the Operator’s biometrics with their registered biometrics. This is to enable local deduplication. To get onboarded the operator must not be assigned "default" role.
2. **Skip to home:** This flow is to dodge “Operator’s Onboarding”. If the user selects this, they will be taken to the “Homepage” after which the user can get started with Resident registration. One of the prerequisites of this flow is to have the “Default” role mapped to the center.

<figure><img src="../../../../.gitbook/assets/image-20240612-100557.png" alt="" width="375"><figcaption><p>Operator’s Onboarding</p></figcaption></figure>

3.  **Steps to Onboard Operator’s Biometrics:**

    a. The user will be taken to the Biometrics Capture Homepage where he will be able to see all the below biometrics:

    1. Face capture
    2. Iris capture
    3. Left-hand finger capture
    4. Right-hand finger capture
    5. Thumb capture

<figure><img src="../../../../.gitbook/assets/onboard-operator-biometric-temp.png" alt="Onboard Operator" width="375"><figcaption></figcaption></figure>

b. The user will then have to capture all the above-listed biometrics one by one.\
c. Steps to capture the biometrics are given [**here**](android-registration-client-user-guide.md#face-photo-capture-process)**.**\
d. Once all the biometrics are duly captured, the below acknowledgment message will be displayed on the screen.

<figure><img src="../../../../.gitbook/assets/Acknowledgement.png" alt="" width="338"><figcaption><p>Acknowledgment page</p></figcaption></figure>

4. **Dashboard:** The Operator can access the dashboard where he can view the following:
   1. **Packets created:** This will show the total number of packets created from the time the Android Registration Client was installed.
   2. **Packets Synced:** This will show the total number of packets synced from the time the Android Registration Client was installed.
   3. **Packets Uploaded:** This will show the total number of packets uploaded from the time the Android Registration Client was installed.
   4. **User details:**
      1. User ID: This will show the list of User IDs of the Users mapped to the device.
      2. Username: This will show the list of usernames of the Users mapped to the device.
      3. Status: This will show the status of Users mapped to the device. This can take values such as onboarded, active, inactive, etc.

<figure><img src="../../../../.gitbook/assets/dashboard.png" alt="" width="375"><figcaption><p>User's dashboard</p></figcaption></figure>

In summary, the aforementioned steps can be followed by the user (Operator/ Supervisor) to onboard themselves, update their biometrics, or view the Dashboard.

**Update UIN**

In a scenario where the Resident wants to update their data, they can do so by letting the Operator know their UIN along with the data that needs to be updated. Residents can update their demographic details, documents, and biometrics using this feature.

**Step 1:** Go to “Update UIN” from the Homepage

**Step 2:** Enter the UIN of the Resident and choose the data to be updated.

<figure><img src="../../../../.gitbook/assets/update uin 1.png" alt="" width="375"><figcaption><p>Update UIN</p></figcaption></figure>

**Step 3:** Enter the data that the Resident wants to update. It could demographic data, documents, and biometrics.

<div><figure><img src="../../../../.gitbook/assets/update uin 2.png" alt=""><figcaption></figcaption></figure> <figure><img src="../../../../.gitbook/assets/update uin 3.png" alt=""><figcaption><p>Update data</p></figcaption></figure> <figure><img src="../../../../.gitbook/assets/update uin 4.png" alt=""><figcaption></figcaption></figure></div>

**Step 4:** Once all the required data is filled, the User will be taken to the Preview screen (data can still be modified) and then to the Acknowledgment screen (data cannot be updated hereafter).

<div><figure><img src="../../../../.gitbook/assets/update uin 5.png" alt=""><figcaption></figcaption></figure> <figure><img src="../../../../.gitbook/assets/update uin 6.png" alt=""><figcaption><p>Acknowledge data</p></figcaption></figure> <figure><img src="../../../../.gitbook/assets/update uin 7.png" alt=""><figcaption></figcaption></figure></div>

**Step 5:** The user will then have to authenticate himself using his Username and Password. Once the authentication is successful, the packet will be uploaded to the server.

5. **Logout:** Using this feature, once the user is done with their registration and other activities, they can logout. If no background tasks are running, the user will be immediately logged out. If there are tasks (like sync) running in the background, the user will be notified about the same. From here if the User wants to cancel the logout, the background activities will keep running where whereas if the user chooses to logout, they will be logged out and the background activities will be terminated.

<figure><img src="../../../../.gitbook/assets/logout 1.png" alt="" width="375"><figcaption><p>Logout screen</p></figcaption></figure>

#### Update operators biometrics

This feature will be used by the operators to update their biometrics. They can follow the below steps for the same:

a. The user will be taken to the Biometrics Capture Homepage where he will be able to see all the below biometrics:

1. Face capture
2. Iris capture
3. Left-hand finger capture
4. Right-hand finger capture
5. Thumb capture

<figure><img src="../../../../.gitbook/assets/update-operator-biometric-temp.png" alt="" width="375"><figcaption></figcaption></figure>

b. The user will then have to capture all the above-listed biometrics one by one.

c. Steps to capture the biometrics are given [**here**](https://docs.mosip.io/1.2.0/modules/android-registration-client/android-registration-client-user-guide#face-photo-capture-process)**.**

d. Once all the biometrics are duly captured, the below acknowledgment message will be displayed on the screen.

### Handles Feature Authentication: <a href="#handles-feature-authentication" id="handles-feature-authentication"></a>

**Assumption:** The Handles feature is enabled, and the email ID is designated as a Handle during registration.

**Scenarios:** A resident attempts to log into the Resident Portal using their Handle (i.e., email ID).

**Step 1:** Open the Resident Portal and navigate to **"UIN Services."**

<figure><img src="../../../../.gitbook/assets/Resident_portal_UI_services.png" alt=""><figcaption><p>UIN Services</p></figcaption></figure>

**Step 2:** The resident will be taken to the eSignet login page.

<figure><img src="../../../../.gitbook/assets/eSignet_login.png" alt=""><figcaption><p>eSignet Login Page</p></figcaption></figure>

**Step 3:** Choose the option to “Login using OTP”

<figure><img src="../../../../.gitbook/assets/Login_using_OTP.png" alt=""><figcaption><p>Login Using OTP</p></figcaption></figure>

**Step 4:** Enter the attributes marked as Handle (email ID in this case) and click on “Get OTP”. OTP will be sent to registered email ID and/or mobile number

<figure><img src="../../../../.gitbook/assets/Get_OTP (1).png" alt=""><figcaption><p>Get OTP</p></figcaption></figure>

**Step 5:** Enter the OTP received over the registered email ID and/or mobile number

<figure><img src="../../../../.gitbook/assets/Enter_OTP.png" alt=""><figcaption><p>Enter OTP</p></figcaption></figure>

**Step 6:** Select/De-select the Claims based on preference.

<figure><img src="../../../../.gitbook/assets/select_deselect.png" alt=""><figcaption><p>Select/Deselect Claims</p></figcaption></figure>

And click on the “Allow” button.

<figure><img src="../../../../.gitbook/assets/Allow.png" alt=""><figcaption><p>Click Allow</p></figcaption></figure>

**Step 7:** You have now successfully authenticated and logged into Resident Portal via eSignet using handles (email ID in this case).

<figure><img src="../../../../.gitbook/assets/Resident_Services.png" alt=""><figcaption><p>Resident Services</p></figcaption></figure>

## Registration Center Reassignment

Use these instructions to download pre-registration data and synchronize a registration machine after a registration center reassignment. For related documentation, see the [Android Registration Client User Guide](https://docs.mosip.io/1.2.0/id-lifecycle-management/identity-issuance/android-registration-client/test/android-registration-client-user-guide).

### Download Pre-registration Data

Download pre-registration data to the Registration Client.

<img src="../../../../.gitbook/assets/arc-120-1.png" alt="" width="375">

1. Select **Pre-Registration Data** to start the pre-registration sync. A backend job downloads the pre-registration data to the Registration Client.

<img src="../../../../.gitbook/assets/arc-120-2.png" alt="" width="375">

### Synchronize a Center Remap

Use Center Remap Sync after an administrator assigns a new registration center to an already registered operator.

1. When the machine detects the assignment, select the alert to open **Center Remap Sync**. Alternatively, select **Operational Tasks**, then select **Center Remap Sync**.
2. Select **Center Remap Sync** to start synchronization.

<img src="../../../../.gitbook/assets/arc-120-3.png" alt="" width="375">

<figure><img src="../../../../.gitbook/assets/arc-120-2.png" alt="" width="375"><figcaption></figcaption></figure>



A confirmation screen appears after synchronization completes successfully. The operator's registration center details are updated in their profile, and the operator can resume normal registration activities.

![](../../../../.gitbook/assets/arc-120-5.png) ![](../../../../.gitbook/assets/arc-120-6.png) ![](../../../../.gitbook/assets/arc-120-7.png)

#### Restrictions While Sync Is Pending

While Center Remap Sync is pending, the operator cannot perform regular registration activities. The alert remains visible until synchronization completes successfully. This restriction ensures that the machine is mapped to the correct registration center before further registration operations.

<figure><img src="../../../../.gitbook/assets/arc-120-8.png" alt="" width="375"><figcaption></figcaption></figure>

## Forgot Password

In a scenario where the Operator has forgotten their password, this feature enables the Operator to set a new password to be able to login using the new password and continue with registration tasks.

**Step 1**: Run Android Registration Client on your system to land on the Login page.

![](../../../../.gitbook/assets/arc-12-1.png)

**Step 2**: Click on Forgot Password option, You will then be redirected to the keycloak Login page.

![](../../../../.gitbook/assets/arc-12-2.png)

**Step 3**: Click on Forgot Password option on the Keycloak login page.

![](../../../../.gitbook/assets/arc-image3.png)

**Step 4**: Enter your Keycloak Username and click on Submit.

![](../../../../.gitbook/assets/arc-12-4.png)

**Step 5**: You will then receive an email over registered email Id to reset the password. This email contains a link to set a new password.

![](../../../../.gitbook/assets/arc-12-5.png)

**Step 6**: On clicking on the link to set a new password, you (Operator) will be taken to the keycloak page where you can enter the new password. On successfully entering the password twice, the password will be changed. This password can now be used to log into Android Registration Client (when in online mode). In offline mode, the User will still be able to login using the older password until the system goes online and syncs atleast once after resetting the password.

![](../../../../.gitbook/assets/arc-12-6.png)

## AID QR code scan

This feature enables the Operator to scan the QR code of the AID (Application ID) QR code generated during pre-registration. On successful scan, the Operator will be able to fetch the pre-registration data and pre-fill the registration form with the available data.

**Step 1**: Log into Android Registration Client, start new registration to land onto the "Demographic Details" Page.

**Step 2**: On the "Demographic Details" page, click on the scan button next to "Fetch Data" option. On clicking on the scan button, camera will open up.

![](../../../../.gitbook/assets/arc-12-7.png)

**Step 3**: You can then scan the QR code generated during Applicantʼs pre-registration.

![](../../../../.gitbook/assets/arc-12-8.png)

**Step 4**: On scanning, the Application ID field will be pre-filled with the AID. Along with that, other details, as filled during pre-registration, like Name, age, gender, documents etc. will also be auto filled.

The pre-filled data can also be edited based on the your (Operator) or Residentʼs preference.

![](../../../../.gitbook/assets/arc-12-9.png)

![](../../../../.gitbook/assets/arc-12-10.png)

## Lost UIN:

In a scenario where a Resident has lost their UIN, they can go to a registration center to retrieve their lost UIN. Below are the steps for the same:

**Step 1**: You (Operator) have to Launch Android Registration Client and login using valid credentials.

**Step 2**: Click on "Lost UIN" option on the home page.

**Step 3**: You (Operator) will then have to select the Data Entry Language and the Preferred Language of Communication.

![](../../../../.gitbook/assets/arc-12-11.png)

**Step 4** You can then ask and inform the Residents about the Consent and click on "Informed" button.

![](../../../../.gitbook/assets/arc-12-12.png)

**Step 5** You can fill the demographic details of the Resident. This is an optional step.

![](../../../../.gitbook/assets/arc-12-13.png)

**Step 6** You will have to capture all the biometrics of the Resident. This is a mandatory step.

![](../../../../.gitbook/assets/arc-12-14.png)

![](../../../../.gitbook/assets/arc-12-15.png)

**Step 7**: Once you (Operator) have duly captured the biometrics of the Resident, you can then proceed by clicking on the **Continue** button, which will redirect you to the **Preview** page. The Preview page will display the following information:

* Application ID
* Timestamp of Registration
* Demographic data collected (if any) Biometric data recorded

From the Preview page, you (Operator) have the the ability to navigate back to previous screens in order to make any necessary adjustments to the entered or captured data. Once you have verified the accuracy of the entered data, you can proceed by clicking on the **Continue** button, which will direct them to the Operator Authentication page.

**Step 8**: On the Operator Authentication page, you (operator) are required to input your credentials (username and password) that were used during the login process.

![](../../../../.gitbook/assets/arc-12-17.png)

**Step 9**: Once that is done successfully, the packet is uploaded to the server and you (operator) will be redirected to the Acknowledgment screen. This screen includes the following information:

* Application ID
* Timestamp of Registration
* Demographic data captured (if any)
* Biometric data captured
* Print option
* QR code for the Application ID
* Option to go to the Homepage

![](../../../../.gitbook/assets/arc-12-18.png)

## Reset password:

In a scenario where the you (Operator) wish to set a new password, you can set a new password using this feature post which you will be able to login using the new password and continue with registration tasks.

**Step 1**: Launch Android Registration Client and login using valid credentials.

**Step 2**: Click on the "Profile" Icon on the Home page

![](../../../../.gitbook/assets/arc-image19.png)

**Step 3**: On the Profile page, click on the "Reset Password" option.

![](../../../../.gitbook/assets/arc-12-20.png)

**Step 4**: On clicking on the "Reset Password" option, You will be redirected to the Keycloak Login page.

**Step 5**: You can then login using Keycloak credentials.

![](../../../../.gitbook/assets/arc-12-21.png)

**Step 6**: Once you have logged in, you will be taken to the Password section where you can set a New Password.

Once the password is reset, new password can be used to log into Android Registration Client (when in online mode).

Note: In offline mode, you will still be able to login using the older password until the system goes online and syncs atleast once after resetting the password.

![](../../../../.gitbook/assets/arc-12-22.png)

## Auto Logout

The Auto Logout feature enhances application security by automatically logging out users after a defined period of inactivity. This helps protect sensitive data and ensures that only authorized users maintain access to the Android Registration Client.

**How it works:**

The system continuously monitors user activity, such as touches or navigation events within the application. When inactivity exceeds a configurable threshold, the following sequence occurs:

**Step 1:** A warning message is displayed on the screen after the idle period, notifying the user of the impending automatic logout. The warning dialog shows a countdown timer indicating the remaining time before automatic logout occurs.

<figure><img src="../../../../.gitbook/assets/arc-auto-logout-warning.png" alt="" width="375"><figcaption><p>Auto logout warning message with countdown timer</p></figcaption></figure>

**Step 2:** During the warning period, the user has two options:

* Click the **"STAY LOGGED IN"** button to dismiss the warning and continue the session normally.
* Click the **"LOG OUT"** button to immediately log out of the application.

**Step 3:** If the user remains inactive and does not interact with the warning dialog (by clicking either button) during the warning period, the application automatically logs them out.

**Step 4:** Upon automatic logout, the feature securely clears all authentication states and session data, ensuring that no sensitive information remains accessible.

**Note:** The inactivity threshold and warning period duration are configurable settings that can be adjusted based on security requirements and operational needs.

## Biometrics Correction

The Biometric Correction feature enables operators to update and correct the biometric information of applicants, ensuring accurate association with their Unique Identification Number (UIN). When a resident's biometric data does not meet the required threshold during the registration process, the system generates an Additional Info Request ID. This ID is sent to the resident via notification, allowing them to schedule an appointment and update their biometric information at a registration centre.

**Step 1:** Create a packet with a lower biometric threshold.

<figure><img src="../../../../.gitbook/assets/arc-biometric-correction-1.png" alt="" width="375"><figcaption><p>Create packet with lower biometric threshold</p></figcaption></figure>

**Step 2:** You receive a notification with additional Info request ID.

<figure><img src="../../../../.gitbook/assets/arc-biometric-correction-2.png" alt="" width="375"><figcaption><p>Notification with additional Info request ID</p></figcaption></figure>

**Step 3:** Select the biometric correction feature from Home page.

<figure><img src="../../../../.gitbook/assets/arc-biometric-correction-3.png" alt="" width="375"><figcaption><p>Select biometric correction from Home page</p></figcaption></figure>

**Step 4:** Add an additional request ID and give valid biometrics.

<figure><img src="../../../../.gitbook/assets/arc-biometric-correction-4.png" alt="" width="375"><figcaption><p>Add request ID and capture biometrics</p></figcaption></figure>

**Step 5:** Preview for the given details.

<figure><img src="../../../../.gitbook/assets/arc-biometric-correction-5.png" alt="" width="375"><figcaption><p>Preview details</p></figcaption></figure>

**Step 6:** Authenticate the operator.

<figure><img src="../../../../.gitbook/assets/arc-biometric-correction-6.png" alt="" width="375"><figcaption><p>Operator authentication</p></figcaption></figure>

**Step 7:** You will receive an acknowledgment of your application.

<figure><img src="../../../../.gitbook/assets/arc-biometric-correction-7.png" alt="" width="375"><figcaption><p>Application acknowledgment</p></figcaption></figure>

**Step 8:** Approve the packet from the pending approvals.

<figure><img src="../../../../.gitbook/assets/arc-biometric-correction-8.png" alt="" width="375"><figcaption><p>Approve packet from pending approvals</p></figcaption></figure>

**Step 9:** Upload the packet.

<figure><img src="../../../../.gitbook/assets/arc-biometric-correction-9.png" alt="" width="375"><figcaption><p>Upload packet</p></figcaption></figure>

This is the process to create a biometric correction packet. After this, the data will be updated, and a UIN will be generated.

## GPS Location

This feature enables the Operator to automatically capture GPS location (latitude and longitude) when creating any packet through Android Registration Client. The GPS location is captured at the point of packet creation and attached as metadata to the packet, ensuring that the Operator's location is tracked for audit and verification purposes.

**Step 1:** Log into Android Registration Client using your login credentials.

**Step 2:** Start creating a packet for any of the following: New Registration, Lost UIN, Update UIN, or Applicant Correction.

**Step 3:** When you initiate packet creation, the system will automatically capture your current GPS coordinates (latitude and longitude) from the device. If this is the first time accessing location, you will be prompted to grant location permission. You can choose between "Precise" or "Approximate" location accuracy and select the permission duration (While using the app, Only this time, or Don't allow). This happens in the background without any additional action required from you once permission is granted.

<figure><img src="../../../../.gitbook/assets/arc-gps-location-permission.png" alt="" width="375"><figcaption><p>GPS location permission dialog</p></figcaption></figure>

**Step 4:** The captured GPS location will be attached to the packet as metadata when you submit the packet. The metadata includes latitude, longitude, and timestamp of when the location was captured.

{% hint style="info" %}
**Note:** If the device's location services are disabled or GPS is unavailable, the system will log a warning but will not block packet creation. The packet will be created with a flag indicating "No GPS data available" in the metadata.
{% endhint %}

## Settings

### Scheduled Jobs Settings

The Manage Scheduled Jobs feature allows admin and supervisor users to view, manage, and trigger scheduled sync/batch jobs directly from the Scheduled Jobs Settings screen within the Android Registration Client.

This feature provides visibility into system jobs (e.g., syncs, cleanup, updates) and enables supervisors to modify their scheduling configuration (cron expressions) on the local device.

This feature is useful to provide a centralised interface for administrators to monitor, update, and manually trigger scheduled jobs to ensure smooth and timely system operations.

The Scheduled Jobs Settings screen displays a list or grid of all configured jobs.

Each job entry includes:

* Job Name (e.g., Registration Packet Deletion Job)
* Next Run Time (calculated from cron expression)
* Last Run Time (from job execution logs)
* Cron Expression (editable field for supervisors)
* Manual Trigger Button (Run Now)

Each job's schedule is defined using a CRON expression.

**Steps to find the Scheduled jobs feature:**

**Step 1:** Click the settings button on the home page.

<figure><img src="../../../../.gitbook/assets/arc-settings-home.png" alt="" width="375"><figcaption><p>Settings button on home page</p></figcaption></figure>

**Step 2:** It will redirect to the settings page as referred in the image below. The first tab is the scheduled job, here you can access.

<figure><img src="../../../../.gitbook/assets/arc-scheduled-jobs-settings.png" alt="" width="375"><figcaption><p>Scheduled jobs settings page</p></figcaption></figure>

### Global Config Settings

This feature enables authorized users (Supervisors) to view and manage global configurations in a single Global Config Settings screen. The feature displays server values fetched from masterdata and allows supervisors to override these values locally on the device. Local configuration changes apply only to the current device and do not affect server-side configurations or other devices.

**Step 1:** Log into Android Registration Client using your login credentials (Supervisor role).

**Step 2:** From the home page, click on the **"Settings"** button. The Settings screen will display with various options.

<figure><img src="../../../../.gitbook/assets/arc-settings-home.png" alt="" width="375"><figcaption><p>Settings button on home page</p></figcaption></figure>

**Step 3:** On the Settings screen, click on the **"Global Configuration Settings"** tab. On clicking, the Global Config Settings page will open and display all configurations with their server values and local values.

<figure><img src="../../../../.gitbook/assets/arc-global-config-settings.png" alt="" width="375"><figcaption><p>Global Config Settings page</p></figcaption></figure>

**Step 4:** On the Global Config Settings page, you will see a table with three columns: Key, Server Value, and Local Value. The Server Value column shows the value set from the server (read-only). The Local Value column shows the current local value for that configuration key.

For configurations listed in the permitted configuration keys list, you can edit the Local Value by clicking on the Local Value field and entering the new value.

<figure><img src="../../../../.gitbook/assets/arc-global-config-edit.png" alt="" width="375"><figcaption><p>Edit Local Value</p></figcaption></figure>

**Step 5:** Once you have made changes to one or more Local Values, click on the **"Submit"** button. On clicking Submit, a confirmation dialog will appear showing the number of configurations to be updated.

<figure><img src="../../../../.gitbook/assets/arc-global-config-confirm.png" alt="" width="375"><figcaption><p>Confirmation dialog</p></figcaption></figure>

**Step 6:** Click **"Confirm"** in the dialog to save the changes. The system will save the configuration changes, display a success message, and automatically restart the app to apply the changes.

The updated Local Values will apply only to the current device where the Android Registration Client is running. The Server Value will remain unchanged and unaffected by local edits.

### Device Settings

This feature enables authorized users (Supervisors and Officers) to view and monitor all devices/peripherals connected to the Android Registration Client tablet. On opening the Device Settings page, the system will automatically scan for connected devices and display device information including device name, device ID, and connection status.

**Step 1:** Log into Android Registration Client using your login credentials (Supervisor or Officer role).

**Step 2:** From the home page, click on the **"Settings"** button. The Settings screen will display with various options.

<figure><img src="../../../../.gitbook/assets/arc-settings-home.png" alt="" width="375"><figcaption><p>Settings button on home page</p></figcaption></figure>

**Step 3:** On the Settings screen, click on the **"Device Settings"** tab. On clicking, the Device Settings page will open and automatically scan for connected devices.

On scanning, the connected devices will be displayed in a grid layout. For each device, you will see the Device ID, Device Name, and Connection Status.

If no devices are detected, you can click on the **"Scan Now"** button to manually trigger a device scan. The device list will refresh automatically based on scan results.

<figure><img src="../../../../.gitbook/assets/arc-device-settings.png" alt="" width="375"><figcaption><p>Device Settings page with Scan Now button</p></figcaption></figure>
