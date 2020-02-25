## Table Of Contents

- [1. Operator Services](#1-operator-services-)
  * [1.1 Registration Officer and Supervisor on-boarding](#11-registration-officer-and-supervisor-on-boarding-) _(REG_FR_1.1)_
  * [1.2 Login/Authentication](#12-loginauthentication-) _(REG_FR_1.2)_
  * [1.3 Logout](#13-logout-) _(REG_FR_1.3)_
- [2. Data Sync](#2-data-sync-)
  * [2.1 Master Data Sync](#21-master-data-sync-) _(REG_FR_2.1)_
  * [2.2 Configuration Sync](#22-configuration-sync-) _(REG_FR_2.2)_
  * [2.3 Client to Server Sync](#23-client-to-server-sync-) _(REG_FR_2.3)_
  * [2.4 Packet Status Sync](#24-packet-status-sync-) _(REG_FR_2.4)_
  * [2.5 Pre-registration Data Download](#25-pre-registration-data-download-) _(REG_FR_2.5)_
- [3. Health Check](#3-health-check-)
  * [3.1 Peripherals Check](#31-peripherals-check-) _(REG_FR_3.1)_
  * [3.2 Disk Space Check](#32-disk-space-check-) _(REG_FR_3.2)_
  * [3.3 Virus Scan/Security Scan](#33-virus-scansecurity-scan-) _(REG_FR_3.3)_
- [4. Registration Data Services](#4-registration-data-services-)
  * [4.1 New Registration](#41-new-registration-) _(REG_FR_4.1)_
  * [4.2 UIN Update](#42-uin-update-) _(REG_FR_4.2)_
  * [4.3 Lost UIN](#43-lost-uin-) _(REG_FR_4.3)_
  * [4.4 Acknowledgement and Notifications](#44-acknowledgement-and-notifications-) _(REG_FR_4.4)_
  * [4.5 Biometric Capture (SDK Integration, Extract and Match)](#45-biometric-capture-sdk-integration-extract-and-match-) _(REG_FR_4.5)_
  * [4.6 Biometric Exceptions](#46-biometric-exceptions-) _(REG_FR_4.6)_
  * [4.7 Registration Officer and Supervisor Approval](#47-registration-officer-and-supervisor-approval-) _(REG_FR_4.7)_
  * [4.8 End of Day Approval Process & Re-registration](#48-end-of-day-process-) _(REG_FR_4.8)_
- [5. Geo-location](#5-geo-location-) _(REG_FR_5)_
- [6. Language Support](#6-language-support-)
  * [6.1 Translation](#61-translation-) _(REG_FR_6.1)_
  * [6.2 Transliteration](#62-transliteration-) _(REG_FR_6.2)_
- [7. Packet Upload](#7-packet-upload-)
  * [7.1 Registration Packet Upload](#71-registration-packet-upload-) _(REG_FR_7.1)_
  * [7.2 Packet Exporter & Offline Upload from External Device](#72-offline-upload-packet-exporter-) _(REG_FR_7.2)_
    * [7.2.1 Export Packets to External Device](#721-export-packets-to-external-device-) _(REG_FR_7.2.1)_
    * [7.2.2 Upload Packets from External Device to Server - To be Developed](#722-upload-packets-from-external-device-to-server-) _(REG_FR_7.2.2)_
- [8. Analytics and Audit Logs](#8-analytics-and-audit-logs-) _(REG_FR_8)_
- [9. Data Security](#9-data-security-) _(REG_FR_9)_
- [10. Installation and Software Version Upgrade](#10-software-version-upgrade-) _(REG_FR_10)_
- [11. Clean up](#11-clean-up-)
  * [11.1 Data retention policies](#111-data-retention-policies-) _(REG_FR_11.1)_
  * [11.2 Machine Retirement & Re-mapping](#112-machine-retirement-) _(REG_FR_11.2)_
- [List of Configurable Parameters and Processes](#list-of-configurable-parameters-and-processes-)
- [Process View](#process-view-)

## 1. Operator Services [**[↑]**](#table-of-contents)
### 1.1 Registration Officer and Supervisor on-boarding [**[↑]**](#table-of-contents)

When a registration officer or supervisor is onboarded  on an online client machine for the first time, they provide their biometric details, which will be stored and mapped to the client machine locally. This locally stored data helps to authenticate a supervisor or registration officer.

Registration Client enables capturing an officer's biometrics during on-boarding to support login, local duplicate checks, and registration submission.

**Map registration officers and supervisors to a client machine**

Initially, a machine will have no officers onboarded. The first registration officer or supervisor will be on-boarded by an administrator. Thereafter this registration officer or supervisor can on-board other registration officers.
The system allows the following to occur for a successful on-boarding of a registration officer: 
1. The system will on-board an officer using biometrics.
   * The quality threshold of  the biometrics is predefined.
1. The system will only allow to onboard an active registration officer. 
1. Onboarding is allowed only when the machine is online. 
1. The system will not allow to onboard a blacklisted officer/supervisor. 
1. An onboarded officer/supervisor will be able to take the machine offline and login to use the machine in offline mode.
1. The system allows to onboard a multiple officers to the machine within the same center.  
1. The system does not allow onboarding officers/supervisors who belong to different center.
1. Multiple officers can be onboarded but only one supervisor would be allowed to onboard.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registrtaion-on-board-user.md)

### 1.2 Login/Authentication [**[↑]**](#table-of-contents)

#### A. Allows biometric login of the Registration Officer or Supervisor to the client application

MOSIP supports single factor and multi factor login including iris, fingerprint, and face capture. An admin configuration setting determines the mode of login.

System allows registration officer to provide their username, iris, fingerprint, face photo to login. The system validates the registration officer’s provided details and logs in the registration officer on successful validation.

_Note_: While a User attempts to login to Registration Client, the system will match the Username and compare it with the locally stored usernames using a case-insensitive logic

#### B. Temporarily lock the registration officer account after five unsuccessful login attempts.
1. The MOSIP system temporarily locks the registration officer’s account in case he/she provides an invalid password for five times continuously to login.
1. Upon the fifth unsuccessful attempt to login, displays an error message 
1. The temporarily account lock lasts for 30 minutes (configured by an admin).
1. The same error message is displayed for any subsequent login attempt within 30 minutes.
1. After 30 minutes, the lock is released and the count of invalid login attempts is reset to zero.
1. The same is implemented if the fingerprint, iris, face, or multifactor login fails five times.
1. System captures and stores the transaction details for audit purpose (except PII data).

#### C. Authenticate online/offline login of the Supervisor to the client application [**[↑]**](#table-of-contents)
If the Registration Client is offline, then system allows the supervisor to log in the client machine only with a password-based login. Whereas, if the Registration Client is online, the supervisor can log in to the client machine with all various type of login such as Password-based login, OTP based login, etc.

When a supervisor opts to log in the client machine, the system displays the appropriate options as per the mode of login.

* If the mode of login is username and password, displays the password-based login.
* If the mode of login is username and OTP, display the OTP based login. 


**(i) Password-based login**

The mode of login is configured by admin, if the login is configured as Password-based login, the supervisor will be able to login the client machine in both online and offline mode using their password.

1. System allows the registration officer to provide their credential and submit.
1. System validates that the username belongs to an on boarded registration officer or supervisor on that client.
1. System validates that the password matches with the registration officer’s password stored locally. The local password will be fetched from the server during data sync. [**Refer to the section related to Data Sync**](#2-data-sync-).
1. System validates that the registration officer is not blacklisted. The blacklisted registration officer details will be fetched from the server during data sync. [**Refer to the section related to Data Sync**](#2-data-sync-).
1. System validates that the registration officer has a role of registration officer or supervisor. 
1. System allows a registration officer to create a new password if he/she has forgotten their password or wants to change for any other specific reason.

**(ii) OTP based login**

If the client machine is online and the supervisor is mapped to the client machine, then the system allows supervisor to login with the OTP. The system allows supervisor to enter their username and authenticate himself or herself with OTP.

1. Allows the registration officer to enter their username and submit.
1. Validates that the username belongs to an on-boarded registration officer or supervisor on that client.
1. The system generates and sends an OTP by SMS to the registration officer’s registered mobile number. Use the template defined in admin for the OTP message. 
1. Allows the registration officer to enter the OTP and submit.
   * Alternatively, allows the registration officer to change entered username.
   * Alternatively, allows the registration officer to request for resending the OTP.
1. Validates that the OTP submitted matches with the one that was generated and is submitted within its validity period.
1. Validates that the registration officer is not blacklisted. The blacklisted registration officer details will be fetched from the server during data sync. [**Refer to the section related to Data Sync**](#2-data-sync-).
1. Validates that the registration officer has a role of registration officer or supervisor.
1. On successful validation of all conditions above, displays the logged in screen to the registration officer 
#### D. Restrict access to each MOSIP feature to authorized registration officers. [**[↑]**](#table-of-contents)

In MOSIP system, a registration officer can have multiple role. When a registration officer is registered on admin portal, the system allows a registration officer to assign multiple roles.

MOSIP system has a role based Privileges of a registration officer. [**Please refer Git for more details on the roles and Privileges of a registration officer**](_files/requirements/MOSIP_Roles%20and%20Responsibility_Matrix_16Jan19.xlsx). 
1. Both registration officers and supervisors can access the following features. The role to rights mapping is configurable at a country level. The list given below corresponds to the default configuration.
   * Login
   * On-board registration officers
   * On-board devices
   * New registration
   * UIN update
   * UIN de- and re-activation
   * Lost UIN
   * Sync data
   * Export packets to local folder (Work in Progress)
   * Upload packets through FTP (Work in Progress)
   * Virus scan
   * Update client software
4. Only supervisors can access the following features:
   * Approve registration
   * Reports
1. A super admin can access all features.
1. If a registration officer is not authorized to access a feature, the system notifies the registration officer by a message. 

[**Link to design for Login**](/mosip/mosip-platform/blob/master/design/registration/registration-login.md)

[**Link to design for Multi-authentication**](/mosip/mosip-platform/blob/master/design/registration/registration-multi-authentication.md)

[**Link to design for authorization**](/mosip/mosip-platform/blob/master/design/registration/registration-authorization.md)

### 1.3 Logout [**[↑]**](#table-of-contents)
When a registration officer or supervisor opts to logout, the system allows them to do so by provisioning the following:
1. Allows the registration officer to choose appropriate option (button or link) in order to log out
1. Logs out the registration officer of their session.
   * While logging out, does not allow the registration officer to perform any actions that require them to be logged in.
1. Alternatively, closing the client window will also log out the registration officer.
1. Alternatively, if the registration officer has remained inactive for a configured duration, he/she will be automatically logged out.
   * Inactive/idle time is defined as the time during which the registration officer has not submitted or retrieved data using the client application or navigated to a different page.
   * Any such action when performed resets the time to zero.
   * The auto log out duration is configured by admin. The default value can be taken as 15 minutes.
   * Alerts the registration officer ‘x’ minutes before reaching the auto logout time limit. The system displays a countdown timer in the alert. The registration officer can choose to dismiss the alert and continue working. This will also reset the timer to zero.
   * The duration before which to display the alert is configured by admin. The default value can be taken as 2 minutes. That is, if auto logout time is 15 minutes then an alert will display after 13 minutes.
5. Upon logout, any unsaved data will be lost. Data will not be automatically saved in the database and will not be retained in memory.
1. The System also captures and stores the transaction details for audit purpose (except PII data).

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-login.md)

## 2. Data Sync [**[↑]**](#table-of-contents)
### 2.1 Master Data Sync [**[↑]**](#table-of-contents)

The Registration Client can work both in online and offline mode. When the client machine is switching from offline to online mode, the locally saved data will be synced with the server.
The data sync can happen through an automated process at a set frequency or a registration officer can manually initiate a sync.

#### A. Choose the 'Opt to Register' option. 

Upon receiving a request to start a new registration, the system performs the following steps:
1. Validates the time since the last sync from server to client has not exceeded the maximum duration permitted (configured from admin portal).
   * Sync includes Master data, Login credentials, Pre-registration data, Registration center config, Registration center setup, User role setup, Policies, Registration packet status.
2. Validates the time since the last export of registration packets from client to server has not exceeded the maximum duration permitted, if applicable (configured from admin portal).
1. Validates the number of registration packets on the client yet to be exported to server has not exceeded the maximum limit, if applicable (configured from admin portal).
1. Reads the config setting that determines if the geo-location of the machine needs to be captured before every registration or captured at beginning of day only.
1. Before every registration, the system captures geo-location of the machine and validates that the captured location is within x meters of the registration center location (Both x and the center location are configured from the admin portal).
1. If captured at beginning of day only, validates that the beginning-of-day location is within x meters of the registration center location.
1. On successful validation, sends a response and proceeds to the next step of choosing a pre-registered or non pre-registered applicant.
1. In case of failures validation, triggers appropriate error messages.
1. System sends a success response and allows it to proceed to the next step.
1. System captures and stores the transaction details for audit purpose (except PII data).


Please refer to [**file**](_files/requirements/MOSIP%20Masterdata%20Types.xlsx) for more details on the type of master data that is synced.


### 2.2 Configuration Sync [**[↑]**](#table-of-contents)

Please refer [**Git**](/mosip/mosip-config/blob/master/config/) for a detailed list of parameters that can be configured as ON and OFF by a country while commencing a new registration.

Based on the configuration (turn on or turn off), the system allows a registration officer to capture applicable biometrics, authenticates, and completes the registration. 


### 2.3 Client to Server Sync [**[↑]**](#table-of-contents)

1. The Registration Client receives a request to sync data (through manual trigger or scheduled job) from client to server.
2. Client in turn sends request with the applicable data to server.
   * Registration officer on-boarding data with mapping to that machine is synced.
   * Registration packets are synced
   * Only the additions, deletions, and modifications made since the last sync are sent.
3. Client receives response from server as a success or failure message.
4. Client displays a success or failure message on the UI
5. Registration officer on-boarding data such as user id, machine id, center id will be synced
6. Alternatively, if the client machine is not online
   * Displays an error message and does not sync when a registration officer tries to initiate a manual sync.
   * Does not sync when an automatic sync is triggered.

### 2.4 Packet Status Sync [**[↑]**](#table-of-contents)

The system performs the following steps to ensure packet status sync from server to client to read the status of the registration packets sent:
1. The system allows a registration officer to either sync manually or automatically based on configured frequency.
1. The system allows the application to request using registration packet ID and receive the registration packet status from the server
1. The system displays the status (in progress/completed) of the operation to pull registration packet IDs from registration server.
### 2.5 Pre-registration Data Download [**[↑]**](#table-of-contents)


#### A. Register a pre-registered individual by searching & fetching pre-registration data associated to a pre-registration ID from local system or server

When a registration officer starts a new registration by entering a pre-registration ID of an individual, the system checks if an exact match for the ID available in local database.
1. If available, checks if an updated pre-registration packet for that ID is available on the server.
   * If available, downloads the pre-registration packet from the server and pre-populate on screen.
   * If update is not available on server, the system displays the data from local database.
   * If client if offline, the system displays the data from the local database.
1. If data are not available in local database, checks if data for that ID are available on the server.
   * If available, downloads the pre-registration packet from the server and pre-populate on screen.
1. Based on the availability of data, the system populates the demographic details of the individual and pre-populates the registration form.
1. The demographic details can still be edited at this stage. Additionally, the system validates for any blacklisted words entered (as configured by the Country)
1. The registration officer can then view the documents, which were uploaded during pre-registration
1. If no matching PRID available in local system and server, the system displays an error message.

#### B. Registration Client allows downloading of pre-registration data in real time or manually for a specific PRID
**(i) Real time downloads of Pre-registration data**

1. When a registration officer starts a new registration by entering a pre-registration ID and opts to fetch pre-registration data, the system checks if the pre-registration ID entered has a match in the local system
1. The system then fetches the demographic details of the individual and pre populate the registration form if there is exactly one match for pre-registration ID in the local system

**(ii) Manual downloads of Pre-registration data**

A registration officer can download the pre-registration data while being online. The system allows the registration officer to download the demographic data of an applicant.

Bulk pre-registration data can be downloaded only for that specific registration center. However, by keying in a specific Pre-registration ID (PRID), pre-registration data associated to that specific PRID can be downloaded (for/from any center)

It is possible to download the pre-registration data within the date range (Current date - End Date). This date range is  configurable.

The downloaded pre-registration data overwrites the previously downloaded data for the same pre-registration ID

The downloaded pre-registration data is stored locally in the registered machine as configured.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-sync-job.md)

- Note: Additionally, we have the Policies sync, User to role mapping sync, Public Key Sync and User Salt Sync that takes place from Server to Client

## 3. Health Check [**[↑]**](#table-of-contents)
### 3.1 Peripherals Check [**[↑]**](#table-of-contents)
The system has the provision to show if the client machine has internet connectivity or not. 

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-device-integration.md)


### 3.2 Disk Space Check [**[↑]**](#table-of-contents)
If disk space is insufficient, system displays an error message and data entered by registration officer will be not be saved. Then registration officer will clean up to make sufficient space on the client machine and try the registration again.

Upon receiving a request to create a registration packet at the end of data capture and authentication steps, the system validates the disk space available on the client machine to store the registration packet as follows:
1. The configured size of the potential registration packet includes the following:
   * Data includes demographic, biometric, photographs, OSI authentication, registration metadata, audit data, and acknowledgement scan.
2. Calculates the disk space, which is available in the configured packet storage location.
1. Validates if the storage location is sufficient to store the registration packet.
1. In case of successful validation, responds with success message and proceeds further. 
1. In case of unsuccessful validation, registration officer will not be able to proceed with registration.
1. System captures and stores the transaction details for audit purpose (except PII data).

### 3.3 Virus Scan/Security Scan [**[↑]**](#table-of-contents)

Upon receiving a request to perform a virus scan of the registration packets on the client machine, the system performs the following steps:
1. When the client application is open, the system scans the registration packets at a configured frequency.
1. Checks if viruses are available in the registration packets, which are stored on the client machine.
   * All registration packets on the machine will be scanned.
3. At the end of the scan, displays an alert message (Security scan detected viruses in the following files [List of files]. Please take necessary action or contact the administrator) on screen if a virus is detected.
1. If the client application is not open at the configured time, the scan will be queued up and runs only when the client application is open.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-virus-scanner.md)

## 4. Registration Data Services [**[↑]**](#table-of-contents)
### 4.1 New Registration [**[↑]**](#table-of-contents)

Registration officer initiates a new registration for a non pre-registered individual or a pre-registered individual (by entering the PRID) and follows the below process to complete registration:

#### A. Capture consent from the individual for data storage and utilization				
1. For every registration, the system provides an option for the registration officer to mark an individual's consent as Yes or No
1. The registration officer marks consent after confirming with the individual offline.
1. Whether the consent is marked as Yes/No, it will not have any impact on issuance of UIN for that individual and the system will not execute any validations in this regard during packet processing.

#### B. Transliteration

Refer to the section related to [**Transliteration**](#62-transliteration-).
#### C. Register an individual who is less than 5 years old.
1. MOSIP does not have an explicit ‘Category’ for registering children less than five years. However, the date of birth will automatically determine the category of the applicant, which can be setup by the country as required.
1. When a registration officer starts a new registration, the system determines if the registration is for a child using the date of birth.
<br>**NOTE**: The system automatically calculates the age of an applicant using the date of birth. With the age of an applicant, the system provides the default date of birth as configured.
1. If the date of birth indicates that the registration is for a child is less than 5 years on the date of registration, and if parent/guardian’s UIN exists. Then the system captures parent/guardian's details: UIN/Name/Biometrics/Proof of relationship. 
1. If the date of birth indicates that the registration is for a child is less than 5 years and if parent/guardian’s UIN does not exist then the system ensures parent/guardian is registered first and at least RID is available.
   * A unique RID (request ID is generated) on successful completion of registration process. Please refer to [**Wiki**](FRS-Data-Services#4-id-generator-and-validator) for more details.
1. The system captures parent/guardian's details: Registration ID/Name/-Biometrics/PoR (Processor will pick up parent/guardian's registration first prior to child)
#### D. Register a non-pre-registered individual 
When a registration officer starts a new registration for a non-pre-registered individual (an individual who does not have PRID), the registration officer will capture the demographic and biometric details to register the individuals.

#### E. Enter the demographic details for registration

**(i) The Registration Officer opts to initiate a new registration**
1. The system allows the registration officer to enter the individual’s demographic details such as Name, Gender, DOB, Residential Address, and other fields based on the [**ID Object Definition**](MOSIP-ID-Object-definition). 
1. The system validates the entered demographic fields.
1. If demographic fields validation fails, the system displays an error message.
1. On successful validation, the system proceeds to next step.

**(ii) The Registration Officer selects a pre-registration for registration**

1. Registration officer enters the PRID provided by a pre-registered individual. 
1. The registration officer enters demographic details or edits pre-filled demographic details (details rendered from the provided PRID).
1. The Registration Client validates the entered demographic data as per the [**field definition document**](_files/requirements/requirements_detailing_references/Reg.%20Client/MOS-1220%20New%20Registration%20Field%20Definition.docx).
1. Displays error message(s) on screen in case of validation failure.
1. On successful validation, proceeds to next step.
#### F. Copy address from the previous registration
When the address details of the previous registration and the current registration is same, the system allows the registration officer to copy the same address as previous registration. This feature helps the registration officer to save the time while registering the individual who has the same address as previous registration.

#### G. Scan and upload of POI, POA and POR
1. Registration officer can upload documents during registration of an individual, for example, POA (Proof of Address), POI (Proof of Identity), POR (Proof of Relationship), etc.
1. The registration officer collects these documents from the individual and scans them if the uploaded document during pre-registration doesn't meet the required quality.
1. The following parameters will be met while uploading the documents:
   * System lists various document categories as applicable
   * For each document category, system enables selection of one document type from the list of valid documents
   * The system validates if the document uploaded is in permissible file format (PDF, PNG, GIF, etc.)
   * The system does not allow registration officer to upload more than one document per category
   * The system performs size check after document upload and direct the registration officer to upload again, if the document size is more than 1 MB (document size is configurable)
   * The system displays the name of the document adjacent to the Document Category for which the document is uploaded 
1. The registration officer can delete files uploaded erroneously
1. The registration officer can view the uploaded file(s)

#### H. Capture an individual's fingerprints as per specification
Fingerprint capture is configurable (Turn ON or OFF) by the admin at the country level.

**Turn ON or OFF fingerprints capture**

1. If fingerprints capture is turned ON, registration officer captures the individual’s fingerprints using fingerprint device.
1. Alternatively, if fingerprint capture is turned OFF, the system does not show any provision for fingerprint capture and proceeds to the next step.

When the registration officer uses fingerprint capture device to capture the individual left and right hand palm, the left thumb and the right thumb simultaneously, the system performs the following steps:
1. Displays the quality score and threshold score for each captured image.
   * Quality score will be generated by the biometric SDK. If the captured quality score is greater than the threshold score set by the country, the biometrics scan is deemed accepted.
1. Allows the registration officer to re-try each capture up to a maximum number of times (as configured) if threshold score is not met for one or more fingers.
1. Rejects further capture if the number of capture attempts are greater than the configured limits.
1. Determines and displays rank for each finger. The finger with the highest quality score is ranked 1 and so on till 10 (excluding exceptions)
1. Validates all the available fingerprints that have been captured, the fingerprints, which are above threshold quality and the maximum retries attempted.
1. Retains only that capture which has the highest quality score.
1. If the required biometric quality is not achieved while a registration officer is capturing biometrics of an individual (e.g., missing finger(s)), then the system mandates to capture a biometric exception for that individual.
1. Captures and stores the transaction details for audit purpose (except PII data).

#### I. Capture an individual's face photograph and exception photograph.
When a registration officer opts to capture photo of an individual, the system initiates a photo capture and performs the following steps:
1. Validates that an on-boarded camera is connected to the machine.
   * If an on-boarded camera is not found, displays an error message.
   * If more than one on-boarded camera is connected, the system will first search for configured web camera names and will connect to the camera. If the camera with configured name is not found, then first device will be connected.
1. Displays the face photo preview before capturing.
1. Allows the registration officer to initiate face capture.
1. Sends request to the camera for face photo capture.
1. Receives the face photo from the camera.
1. Display the face photo on screen.
1. Allows the registration officer to proceed to verify quality score.
1. Allows exception photo capture only if an exception has been marked.
   * Step 1 to 7 must be performed to capture the exception photo.
1. If the quality score of the photo captured is less than the threshold score, the system allows registration officer to retry face capture. [**Refer to Retry Capture of Face Photo**](#l-retry-capture-of-face-photo)
1. System captures and stores the transaction details for audit purpose (except PII data).
#### J. Retry Capture of Face Photo
While registering an individual, a registration officer captures the face photo of the individual. If the quality score of the photo captured is less than the threshold score, the system allows registration officer to retry face capture
1. The system displays the quality score and the threshold score for the capture.
1. The registration officer proceeds to the next step if the quality score >= threshold or if the maximum number of retry attempts as configured is reached.
1. The system validates that:
   * the photo has been captured, and
   * the photo quality score is above threshold quality (or) the maximum retries (as configured) have been attempted.
4. The system maintains a count of the number of retries of face photo for the current registration.
1. Every time a retry is captured, the earlier quality score and threshold score are replaced by the current quality score and threshold score on screen.
1. A retry is allowed only after at least x seconds since the previous capture. The value x is configurable (default value is 10 seconds)
1. The quality score is determined by the biometric SDK and the threshold limits are configured by the admin.
1. The system does not allow further capture if the number of capture attempts are greater than the configured limits and displays an alert message that the retry limit is reached and photo of sufficient quality is not obtained.
1. When the retry limit is reached and photo of sufficient quality is not obtained, the best quality photo is retained. The best photo will be displayed on screen along with its quality score.
1. All the above rules apply to exception photo capture as well.

#### K. Capture Iris as per defined specifications
When the registration officer scans the individual’s irises either individually or together, the system performs the following steps:
1. Displays the quality score and threshold for each captured iris.
1. Allows the registration officer to re-try each capture up to a maximum number of times (as configured) if threshold score is not met for one or both irises.
1. The quality score is determined and the threshold limits are configured.
1. If the quality score meets threshold, a re-capture is not allowed.
1. Validates all available irises that have been captured, the irises, which are above threshold quality and the maximum retries attempted.
1. Retains only the capture, which has the highest quality score.
1. System captures and stores the transaction details for audit purpose (except PII data).

#### L. MOSIP Device Manager (MDM)
All devices that collect biometric data for MOSIP should operate within the defined specification. The MOSIP device specification provides compliance guidelines to devices for them to work with MOSIP. The compliance is based on device capability, trust and communication protocols. A MOSIP compliant device would follow the standards established in this document. It is expected that the devices are compliant to this specification and tested and validated. The details of each of these are outlined [**here**](/mosip/mosip-docs/wiki/MOSIP-Device-Service-Specification)

#### M. Device Validation
- All devices connected to Registration Client should be registered devices. 
- On having logged in to Registration Client, when the Operator attempts to capture any modality of biometrics, system will validate if the connected Finger print scanning device/Iris device/Photo Capture device is registered, based on the Device ID. 
- If the system is online, then the validation is executed against the master data in the server (Master data relevant to the registered devices)
- If the system is offline, then the validation will be executed against the master data synced locally in the machine from which devices are being connected (Master data relevant to the registered devices)
- If the device is identified to be registered as part of the Master data, then the device can be used & Operator is allowed to proceed with biometrics capture. Subsequently, the connected device(s) are then mapped to the machine from which the devices are connected - [Backend mapping of Machine with connected device(s)]
- If the device is identified to be un-registered as part of the Master data of registered devices, then the Operator cannot proceed with biometrics capture
For details on the specifications of the API and validation, refer [**here**](/mosip/mosip-docs/wiki/FRS-Administrator-Services#105-device-detail-validation-)

#### N. Restrict registration if the duration since the last export or upload is more than the configured limit
When the registration officer opts to start a new registration or UIN update. The system determines the time of the most recent export or upload (automatic uploads and manual uploads) of registration packets.
If the duration since the last export or upload is not more than the configured limit, then system displays the demographic details page or UIN update page. If the configured limit is exceeded, then system displays an error message.

_Note_: Once all the required demographic and biometric data is captured, the registration packet is created as per the defined specifications. For New Registration, UIN Update or Lost UIN packet, the Registration Client Version Number will also be sent as part of the packet metadata information (As part of the Optional parameter)

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-New.md)

### 4.2 UIN Update [**[↑]**](#table-of-contents)
When an individual visits the registration center to update their demographic or biometric details, the registration officer captures the updated data as provided by the individual in the system. Refer the following process: 
#### A. UIN Updates Turn ON or OFF

The UIN update feature is configurable by a country. Admin can turn either ON or OFF the UIN update feature.

When an individual approaches the registration officer for UIN update, the following scenarios may arise:

1. If UIN update is turned ON by a country, the registration officer can proceed to capture the individual’s updated details.
1. Alternatively, if UIN Update is turned OFF by a country the registration officer will not be able to carry out the UIN Update process.

#### B. Registration Client allows update to UIN data only for configured fields
1. An admin can configure the fields that are available for update through the Registration Client. The configuration applies at a country level.
1. In admin portal, the admin can set fields (demographic, biometric, etc.) based on their requirement to update.   
1. If none of the fields is set up to be update-able, then the system does not allow a registration officer to update any field\s 

#### C. UIN Update
1. The registration officer selects the fields to update for an individual seeking modification of UIN data. The Officer may select one or more of the following fields to update the corresponding data: Name, Age or Date of Birth, Gender, Foreigner/National, Address, Email ID, Phone Number, PIN/Residence Card Number, parent/guardian Details, Biometrics.
Based on whether the field “Parent/Guardian Details” is checked for Update, system will identify if the update is initiated for an Adult/Child
1. Registration officer further captures the mandatory demographic attributes (individual's name is captured) and other demographic fields selected for update. In case of update of parent/guardian details, the applicable fields that are updated will be ‘Parent/Guardian Name’ and ‘Parent/Guardian UIN’. At this stage, the system also validates that the parent/guardian’s UIN is different from the individual’s UIN. If they are identified to be the same, an error message would be rendered 
1. Registration officer then uploads documents. The applicable documents are determined by the system based on the fields marked for update
EG: PoI is mandatory if Name, Age/DoB, Gender is updated
EG: PoA is mandatory if Address is updated
EG: PoR is mandatory if Parent/Guardian Details is marked for update (It may be the only field or combined with other fields for a Child). If it is combined update with other fields for a Child/Adult, then the relevant categories will also be mandated.
The System will render a standard set of mapped Doc Types for each Doc Category, irrespective of whether the individual is Adult or Child. The selection of applicable document type per Category is left to the discretion of the Operator.
1. If biometrics were selected for update, the registration officer marks exceptions and scans all biometrics. Else scans any one biometric.
1. Registration officer captures face photo and exception photo.
1. After capturing all the biometric and demographic details the registration officer can see a preview of the data captured and performs registration officer authentication.
1. If biometric exceptions were marked, supervisor performs authentication.
1. A unique RID (request ID is generated) on successful completion of registration process. Please refer to [**Wiki**](FRS-Data-Services#4-id-generator-and-validator) for more details.
1. System initiates the process to update UIN after the RID is generated.
   * Receiving a RID do not mean UIN update is successful.
1. Registration officer views and prints acknowledgement. 
1. SMS and/or email notifications are sent to the individual if the contact details are entered during the update process (Subject to notification configuration, refer Sec. 4.4.B)
1. Refer to the [**Track Status of UIN Update**](FRS-Resident-Services#7-track-status-of-uin-update-) in Resident Services.

#### D. UIN Update of Child

The system automatically calculates the age of an individual using date of birth. When  individual’s age is less than 5 years (child) during UIN update, the registration officer captures UIN, name, and any one biometric (fingerprint or iris) of the parent/guardian and face photo of the individual (child) to complete the UIN update request. Refer below for the process:
1. If ‘Parent/Guardian details’ is selected for update, then a registration officer will capture the UIN, Name and any one biometric of the Parent/Guardian (fingerprint / iris).
1. If the Parent/Guardian does not have any fingerprint and any iris, then the registration officer marks all exceptions of the Parent/Guardian and proceed to capture photo of the Parent/Guardian.
1. A UIN update of a child cannot be initiated without capturing biometrics of the parent. The system displays an error message for such attempts.


[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-update-UIN.md)

### 4.3 Lost UIN [**[↑]**](#table-of-contents)

When an individual has lost his UIN and visits registration center for retrieval of UIN, the registration officer captures the biometric and demographic details of the individual and processes a request to retrieve the lost UIN. The system sends a notification to the individual upon successful creation of the UIN retrieval request. (Subject to notification configuration, refer Sec. 4.4.B)

The registration officer performs the following steps to retrieve a lost UIN of the individual:

1. Enters demographic details such as name, age or date of birth, etc. of the individual who has lost their UIN. 
   * None of the demographic fields is mandatory.
2. Marks biometric exceptions and captures all fingerprints, irises, face photo and exception photo of the individual.
1. Views a preview of details captured of the individual.
1. Performs registration officer authentication by providing credentials in the configured mode.
1. Supervisor performs supervisor authentication for individuals with exceptions.
1. Views acknowledgement of Lost UIN request with a Registration ID assigned to it.
1. System initiates the process to retrieve a lost UIN after the RID is provided to the individual.
   * Receiving a RID do not mean UIN is successfully retrieved.
8. Prints acknowledgement of the UIN, then SMS and email notifications are sent to the individual if contact details of the individual are entered. (Subject to notification configuration, refer Sec. 4.4.B)
1. The individual will be informed after a Lost UIN gets retrieve. Refer to [**Notification**](FRS-Registration-Processor#331-notification-pluggable-by-si-) (Subject to notification configuration, refer Sec. 4.4.B)
1. System captures and stores the transaction details for audit purpose (except PII data).

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-lost-UIN.md)

### 4.4 Acknowledgement and Notifications [**[↑]**](#table-of-contents)

#### A. Printing the registration receipt.
1. Upon completion of a registration, the system generates a unique RID 
1. The system generates the registration receipt.
1. The registration receipt contains details in a print-friendly format.
   * Receipt includes labels and data in two languages - the default language and the secondary language as configured. 
   * All labels and fields are in the default language. Only name and address labels and fields are shown in the secondary language
   * Receipt displays the 2D bar code
   * It also provides the finger print ranking of each finger from 1 to 10, 1 being the finger with the best quality. The finger with higher quality can further be used by the individual, for biometric/Finger Print authentication
4. This print friendly receipt can then be printed using a printer

#### B. Acknowledgement receipt sent by email on completion of registration process [**[↑]**](#table-of-contents)
Note: Notification Configuration: The trigger of notification is driven by the Notification configuration setup by the administrator, to allow a notification to be triggered by SMS/Email/Both or None

1.The system sends an acknowledgement email to the individual after a registration is completed and Registration ID has been generated and assigned as per the configured notification language. (Subject to notification configuration, refer Sec. 4.4.B)
   * Notification language is set by a country's admin, who determines in which language, a notification is sent to the individual. Notification language can be either primary language or combination of both primary and secondary language.
   * In case of UIN Update or Lost UIN, the system sends a notification to the individual.
2. The email template is defined by the admin at country level.
3. Email is sent to the email address entered during registration.
4. The subject and the body of the acknowledgement email are configured by admin.
5. No email is sent under the following scenario
   * If mode of confirmation is not set to ‘email’ or ‘email and SMS’ or is set to 'None'
   * If an email address is not provided during registration
   * If the client is not online during registration completion
#### C. Acknowledgement receipt sent by SMS on completion of registration process (Subject to notification configuration, refer Sec. 4.4.B)
1.  The system sends an acknowledgement SMS to the individual after a registration is completed and Registration ID has been generated and assigned as per the configured notification language.
   * Notification language is set by a country's admin, who determines in which language, a notification is sent to the individual. Notification language can be either primary language or combination of both primary and secondary language.
   * In case of UIN Update or Lost UIN, the system sends a notification to the individual.
2. The template of the SMS is defined by the admin at the country level.
3. The “from” ID of the SMS will be set up by the System Integrator.
4. The system triggers the SMS to the mobile number provided during registration.
5. The SMS contains the details as per the template configured by a country.
6. An SMS is triggered regardless of the applicant being an adult or child as determined by the date of birth.
7. The system will not be able to send SMS, if the client is not online at the time of registration completion.

#### D. Sending email and SMS acknowledgements to additional recipients
This feature enables Registration Client to send SMS and email acknowledgements to additional recipient\s (other than the individual’s primary email ID and mobile number).

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-acknowledgement-notification.md)

### 4.5 Biometric Capture (SDK Integration, Extract and Match) [**[↑]**](#table-of-contents)

Registration Client performs a local duplicate check for irises and face of an individual against the mapped registration officers' biometrics
1. The registration officer captures the irises of the individual and opts to proceed further in the registration process
1. The system performs a local duplicate check of the individual’s irises with the irises of all the registration officers on-boarded to the client.
1. In case of forced capture, the system uses only the best capture for local duplicate check
1. The iris images of the individual are compared with the irises of the registration officers mapped to the client.
1. Each iris is matched individually.
1. The two captured irises are also compared against each other to identify a potential duplicate.
1. The biometric SDK determines the match score, and this is compared with the threshold match score. If match score >= threshold then it is a match.
1. If at least one iris match is found, the system displays an alert, sets retry count to zero, and requires recapture of both irises.
1. If a match is not found, allows the registration officer to proceed to the face capture step
1. The registration officer captures the face photo and opts to proceed further in the registration process
1. On force capture/successful capture of face performs a local duplicate check of face of the individual against faces of all registration officers on-boarded to the client.
1. In case of forced capture uses only the best capture for local duplicate check
1. The system performs a local duplicate check of the individual’s face with the faces of all the registration officers on-boarded to the client.
1. If a match is found, the system displays an error message and require individual to provide the face scan again.
1. When no match is found, the system proceeds to the next step (Registration Preview).
1. The number of recapture attempts due to local duplicate check failures is not capped.

Please refer to [**Wiki**](MOSIP-Biometric-APIs) for more details on the MOSIP Biometric APIs.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-MOSIP-bio-device-integration.md)

### 4.6 Biometric Exceptions [**[↑]**](#table-of-contents)
If the required biometric quality is not achieved while a registration officer is capturing biometrics of an individual (e.g., missing finger(s), missing iris(es), etc.), then the system mandates to capture a biometric exception for that individual. Refer the following process:
#### A. Low quality biometrics marked as reason for exceptions

1. During a registration process while capturing biometrics, if the configured threshold is not met for fingerprints and/or irises in spite of the x attempts (configurable) to capture the biometrics, then system mandates capture of exception photo 
1. Also, system automatically flags the reason for exception as ‘Low Quality of biometrics’. 
1. If the individual has missing biometrics and low quality of biometrics, both the reasons are auto-associated. Here also the system mandates capture of exception photo.

#### B. Mark fingerprint and iris exceptions for an individual

1. During a registration process after the demographic details and documents have been captured, the system allows a registration officer to mark biometric exceptions for missing finger(s) and missing iris(es) if the individual has any such exceptions.
1. If ‘Biometric Exception’ is ‘Yes’, at least one missing biometric must be mandatorily marked.
1. The registration officer can mark the missing finger(s) and missing iris(es).

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-New.md)

### 4.7 Registration Officer and Supervisor Approval [**[↑]**](#table-of-contents)

When a registration officer captures biometric exceptions of an individual, then a supervisor has to validate/approve that biometric exception. This approval is required to authenticate the captured biometric exception of the individual.

**Supervisor authentication for biometric exceptions**

1. The 'supervisor authentication for exceptions' process is configurable and can be switched ON or OFF at a country level by the admin 
1. A registration officer completes registration officer authentication at the end of registering an individual with exceptions.
1. If a country has opted to turned on supervisor authentication, a supervisor is required to enter their credentials
1. The mode of supervisor authentication is a configurable at the country level. It can be set to password, OTP, fingerprint, or multifactor.
1. In case of OTP authentication, the client first sends a request to server to generate the OTP, then allows the supervisor to provide OTP and requests the server to match the input value with the generated OTP.
1. In case of multifactor authentication, the client prompts the supervisor to provide credentials in the order configured and authenticates each input before proceeding to the entry of the next credential.
1. On successful validation, the system proceeds to the next step of Registration ID generation and displays of registration acknowledgement.
1. If the validation fails, the system displays an error message and allows registration officer to try again. Unlimited attempts are allowed.
1. Based on country-specific requirements, it is also possible for the registration officer and supervisor to be the same person. In this case, the registration officer and supervisor will be required to provide biometrics twice in succession, once as part of the Officer authentication and once for supervisor authentication of exceptions.
1. Alternatively, if supervisor authentication is turned OFF, system does not show the supervisor authentication option at all and a registration officer may proceed to the next step (acknowledgement).

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-New.md)

### 4.8 End of Day Approval Process & Re-registration [**[↑]**](#table-of-contents)

#### A. Approval of registrations through an end of day process.

As a process, MOSIP enables a designated registration officer to review/approve every registration at the end of day before the packet is sent to Registration Processor. This process is done to prevent fraudulent of the packets.

Supervisor can log in to the Registration Client application and view a list of Registration ID that are awaiting for approval

The supervisor may opt to see the details of one or many Registration ID. The supervisor can view the details on the right hand side pane 

The supervisor then chooses to either approve or reject the registration.

The supervisor must provide a reason in case of rejection. 

The supervisor then authenticates the registration by providing any one biometric - fingerprint, iris, or face.
The system then confirms on successful approval.

1. In case of authentication failure, the supervisor can try again by providing the same or different biometric.
1. The packet status will change only when supervisor completes authentication. Else, the packet status will revert to its original status.
1. The packets, which are approved or rejected followed by successful authentication are removed from the ‘Pending Approval’ list.
1. The approved and rejected packets are placed in the upload location on the client and will be sent to server during the next upload.  The server would archive the rejected packets and process the approved packets.  

#### B. Supervisor can inform individuals to 'Re-register'
During pre-processing of the packet, if the Registration Processor finds an error in the packet such as decryption failure, then an individual will not be communicated automatically to re-register. In such cases, Registration processor marks a status of the packet as re-register so that a supervisor informs the individual to re-register his/her application. Refer below for the process:

1. A supervisor can view the packets whose status has been received from the processor as ‘Re-register’.
1. The system displays the list of Registration IDs that have been flagged as ‘re-register’ during packet status sync from the processor.
1. The supervisor can see the registration details (the acknowledgement slip) for Registration ID\s
1. Supervisor informs the individual by phone, email, physical mail, or physical visit to re-register. This is an offline process.
1. Supervisor also records it in the system that he has ‘Informed’ the individual
   * If unable to contact the individual, the supervisor records it as ‘Can’t inform'.
6. The supervisor then authenticates by providing biometric data -fingerprint, Iris, or face. Further, selects the specific finger or iris being provided.
1. The supervisor authenticates with locally stored biometric and with the results.
   * On successful authentication, the actioned packets are removed from the ‘-Re-register’ list.
   * On unsuccessful authentication, the registration officer can retry their authentication with the same or a different biometric

#### C. Authenticated registrations report (WIP)
The system allows the supervisor to view a report of approved registrations for the past 15 days.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-eod-process.md)

## 5. Geo-location [**[↑]**](#table-of-contents)
Upon receiving a request to geotag a registration machine, the system performs the following steps:
1. Validates that an on-boarded GPS device is connected to the machine.
   * If an on-boarded GPS device is not found, then displays an error message.
   * If more than one on-boarded GPS device is connected, then proceeds with the first GPS device that the system finds as it scans the ports of the machine.
2. Requests the GPS device to capture a location.
1. Receives the latitude and longitude from the GPS device.
   * If signal is weak and GPS device is unable to capture location, then displays an error message.
4. Proceeds to perform following validations:
   * If location capture is required only at the beginning of day, the co-ordinates are stored and validations are performed when opting to start a new registration.
   * If location capture is required only at the beginning of day and location could not be captured at beginning of the day, then attempts to capture the location during the first registration of the day.
   * The latitude and longitude will be stored in the packet when the packet is created.
5. System captures and stores the transaction details for audit purpose (except PII data).

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-device-integration.md)

## 6. Language Support [**[↑]**](#table-of-contents)
The Registration Client supports two languages, a primary language in which all pages of the application are rendered, and demographic details of an individual are also rendered in secondary language for convenience of the registration officer. The default primary and secondary languages are driven by an admin configuration and can be setup by the admin as required. Transliteration from the primary to secondary language is supported for registration officer entered text fields.

_Language Configuration_:

1. In the below listed scenarios, system will render an error message on the Login page and inhibit Registration, and hence, the language configurations should be appropriately setup by the administrator.
- If Primary Language is set to a specific value and Secondary Language is marked as Null/not set by Admin, or
- If Secondary Language is set to a specific value and Primary Language is marked as Null/not set by Admin, or
- If both Primary and Secondary Language is marked as Null/not set by Admin
(EG: Primary set to English and Secondary not set or vice-versa),  
then system will render the stated Error Message: “The system has encountered a technical error. Administrator to setup the necessary language configuration(s).” The error message will not have an option to exit, hence not allow the user to proceed further. On page refresh, the system will render the error message again and hence, inhibit registrations. Therefore, it is important for the administrator to setup the configurations appropriately.
In case configurations are setup correctly, but post Login, if a sync is initiated through the option in the homepage, and then if it is identified that either Primary/Secondary language/both are not defined, then the system will render the same error message on the homepage and not allow the user to proceed further.

2. Considering a scenario, wherein if Primary language and Secondary language is configured to be the same, EG: English
then:
- The system will render the demographic page (with both left and right side for Primary and Secondary language) in the same language
- Values entered on the left side (Primary Language) will not be transliterated but auto-copied on the right side
- Values on the right side will remain un-editable
- As part of the packet, system will send/store data in one language only, if language code is identified to be the same – EG: ENG (English)

Therefore, it is important for the administrator to setup the configurations appropriately.

### 6.1 Translation [**[↑]**](#table-of-contents)

**A Registration Officer can view static data translated to secondary language**

1. In MOSIP, the primary and secondary languages are configured by the admin.
1. Admin configures all the static data in both primary and secondary languages so that the registration officer can view all the pages of client application in primary (default) and second (translated) languages. 
1. If the both languages are configured in one language, the system displays the text in default language only.


### 6.2 Transliteration [**[↑]**](#table-of-contents)

**Registration Client enables viewing transliterated data**

The Registration Client application will support two type of languages: Primary language (the language in which the registration officer enters data) and secondary language (transliteration language). The secondary language is country specific and is set by the administrator.

When a registration officer starts a new registration, update or lost UIN process and provides demographic data (Full Name, Address Line 1, Address Line 2, Address Line 3, and parent/guardian Name) of an individual in the primary language. The system transliterates the data and displays in the corresponding secondary language fields.

Registration officer can invoke the virtual keyboard to edit transliterated data and proceeds with registration. The following rules are followed during transliteration.
1. Editing transliterated language does not change the data entered in the primary language.
1. The system also validates the maximum character length in the transliterated language and in primary language.
1. If secondary language is not configured, the system does not do any transliteration and will display empty space instead.
1. Numeric data are not transliterated. The same numeric data are displayed in the secondary language section of the page, which are not editable.

Master data selections are not transliterated. Instead, the master data as setup in the secondary language is displayed in the relevant section.

The registration officer can then view the preview page.

The system then enables a registration officer to view the registration confirmation page. The data, which are transliterated and edited earlier are also shown in the secondary language.


[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-muti-lingual-support.md)
## 7. Packet Upload [**[↑]**](#table-of-contents)
### 7.1 Registration Packet Upload [**[↑]**](#table-of-contents) 

#### A. Upload the packet
1. The system allows a registration officer to view a list of packets and may opt to upload one or multiple packets from a list of packets.
1. After the registration officer selects the packet(s), he/she can upload the selected packet(s) to server.

#### B. Push those packets that are marked 'Resend' to the server

1. When the registration officer or supervisor navigates to the ‘Upload Packets’ page, the list of RIDs that are pending packets to upload will be displayed.
   * Pending packets are those packets, which are not sent to the server due to various reasons (e.g. Sanity Check and Validation failure in the Registration Processor) and have been marked for resending.
2. When the registration officer or supervisor selects the ‘Upload’ option, the pending packets will be uploaded to the server.
3. The result of each packet uploaded will be displayed as ‘Success’ or ‘Failure’.
   * Packets that are successfully sent or resent will not be sent again unless the server requests for them.
   * Packets for which upload fails will continue to be in pending state.
4. System captures and stores the transaction details for audit purpose (except PII data).

#### C. Enable a real time packet upload when system is online upon registration submission

**(i) When EoD process is turned ON**

1. Registration Client checks if the system is online as soon as the assigned approver (such as supervisor) approves or rejects a new registration or UIN update.
1. If client is online, the Registration Client sends Registration ID to server and then the packets are marked as “Ready to upload” and auto uploaded to server.
1. If client is offline or on low bandwidth, then when the client next comes online, the Registration ID’s are sent to server through scheduled or manual sync and the packets are then marked as “ready to upload”.
1. Once the packets are ready for upload, packets are uploaded in two ways:
   * The registration officer can initiate upload to server using upload function.
   * Export to external storage device for subsequent upload as required.
5. System captures and stores the transaction details for audit purpose (except PII data).

**(ii) When EoD process is turned OFF**

1. Registration Client checks if system is online as soon as the registration officer submits a new registration or UIN update.
1. If client is online, the Registration Client sends Registration Id to server and then the packets are marked as “Ready to upload” and auto uploaded to server.
1. If client is offline or on low bandwidth, then when the client next comes online, the Registration ID’s are sent to server through scheduled or manual sync and the packets are then marked as “ready to upload”.
1. Once the packets are ready for upload, packets are uploaded in two ways:
   * The registration officer can initiate upload to server using client’s upload function.
   * Export to external storage device for subsequent upload as required.
5. System captures and stores the transaction details for audit purpose (except PII data).

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-packetupload.md)

### 7.2 Packet Exporter & Offline Upload from External Device [**[↑]**](#table-of-contents)

#### 7.2.1 Export Packets to External Device [**[↑]**](#table-of-contents)
System exports registration packet data from client machine to an external device as follows:
1. This feature allows the registration officer to select a destination folder to export the packets. By default all packets that are listed/eligible to be uploaded, are exported to the external device
   * The destination folder includes the laptop/desktop, an external hard drive or a remote location
   * External storage devices are not necessary to be MOSIP-registered devices
1. When the destination folder is selected, registration officer initiates export of packets
1. System exports the packets to the selected folder and performs the following steps:
   * Identifies the packets in ‘Ready to Upload’ state.
   * If EoD process is turned ON, packets that have been approved or rejected and packet ID sync is completed are considered ‘Ready to Upload’
   * If EoD process is turned OFF, packets are considered ‘Ready to Upload’ as soon as the registration is submitted and packet ID sync is completed
   * Puts the packets in the destination folder
1. All the Registration Officers and supervisors on-boarded to the client machine will be able to export all packets
1. Supports the partial export. If the system is able to export some packets to the folder and no other files due to lack of storage space or unavailability of the folder, the successfully exported packets will remain in the destination folder.
1. For partial or full failure, the system displays error message
1. System captures and stores the transaction details for audit purpose (except PII data)

#### 7.2.2 Upload Packets from External Device to Server (To be Developed) [**[↑]**](#table-of-contents)
1. Once the server acknowledges that the packets have been received (which is uploaded from the external device to the server through a defined mechanism - Yet to be defined/developed), the packets in the client will be marked as ‘Uploaded’ upon the next sync with Server.
   * Packets that remain in ‘Ready to Upload’ status will be exported again when the next export is executed.
   * Packets in ‘Uploaded’ or any other status will not be exported again.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registrtaion-packet_export.md)

## 8. Analytics and Audit Logs [**[↑]**](#table-of-contents) 
System captures and stores details of each transaction during registration process for audit purpose (except PII data). The audit data is stored in the audit database. When the client machine is working in an offline mode, the audit log is synced with the server as when the client machine is online. 
## 9. Data Security [**[↑]**](#table-of-contents)
Registration Client integrates with Trusted Platform Model (TPM) data integrity. For enhanced security and integrity purposes, data captured from individuals are saved securely in local system and then shared to server. The details saved locally will be encrypted. Database encryption is also mandatory.

MOSIP performs the following:

1. Signing the data (This process is called as Signature) using Private Key provided by the TPM
   * This process will ensure that the request to the server has been dispatched from a registered or trusted Registration Client machine
2. Validates the signature against the actual data using the Public Key or Public Part. The application does not connect or access the underlying TPM to validate the Signature. This validation ensures that the request is from a registered or trusted Registration Client machine
1. Encrypts and decrypts the data using RSA algorithm in TPM. [**Please refer to Wiki for more details on TPM**](Registration-Client).

**System security and tampering of packets**

The system uses a machine and centre specific public key to encrypt. Only the server which has the respective private key, machine id and centre id can decrypt the encrypted packet. The data stored in database and application binaries are encrypted using TPM public key and registration officers will not be able to access directly.


[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration-key-management.md)

## 10. Installation and Software Version Upgrade [**[↑]**](#table-of-contents)

#### A. Registration Officer or Supervisor can download and unzip the client application set up kit

For initial installation of the client software on a particular machine, supervisor or registration officer will download an installable software (setup kit). Then unzip the setup kit and install it in the client machine.

When a registration officer or supervisor opts to download setup kit and selects the OS-specific setup kit to download, the system allows the registration officer to download the setup kit to the storage location chosen by the registration officer. 
1. Registration officer then unzips the setup kit.
1. Extract the files and folders from the zip file to the chosen location.
1. Allows the registration officer to verify that the files and folder structure are as described in the design document.
1. System captures and stores the download transaction details for audit purpose (except PII data). 

#### B. Update the client software from the server
If a software update is available, then the system will provide an option to supervisor or registration officer to update either immediately or later. If the maximum number of days without software update has been exceeded, then the system will mandate a registration officer to update the software.

The system follows the following steps during the update process:
1. When the client is online, the system automatically checks for updates if available.
1. If an update is available, the system displays a message “Updates are available” and provides two options to the registration officer 
   * Update now or 
   * Update later.
1. If the registration officer opts to select “Update now” option, then the registration officer can download and installs software and launches the application.
1. The updates are downloaded as patch updates.
1. When installation is in progress, the registration officer cannot perform any action on the client.
1. Once installation is completed, the registration officer can start working on the client.
1. If update is not successful, the system provides error message and provides both the options (Update Now or Update Later) again.
1. If the registration officer opts to select “Update later” option, then the system checks if the freeze period has been reached.
   * If the freeze period has not been reached, the system allows the registration officer to continue with registration
   * If freeze period has been reached, the system does not allow the registration officer for registration without updating the software.
   * The client will be locked for registration, if x days (configuration setting) have passed since the last check for updates and mandates the registration officer to update the software.
1. If updates are not available, the system launches the application.
1. If update is not successful, the client returns to its earlier version.
1. System captures and stores the transaction details for audit purpose (except PII data).

Refer to [**Wiki**](Registration-Client-Setup) for more details.


## 11. Clean up [**[↑]**](#table-of-contents)

Pre-registration and registration data are automatically deleted from the client machine upon consumption and upon intimation from the server respectively. 
* Pre-registration data is deleted from the client machine immediately after consumption for a registration.
* Registration packets that are identified as ‘processed’ are deleted by a periodic process.
* Audit data is deleted after it is sent to the server.
* All deletion is executed by a periodic process after retention of the data for a configured duration.

### 11.1 Data retention policies [**[↑]**](#table-of-contents)

#### A. Read packet status and delete packets
When the Registration Client receives a request through manual trigger or scheduled job to sync data, the system performs the following steps to read a packet status and delete the packets:
1. Sends the data sync request to server.
1. Receives response from server with packet statuses.
   * Server sends status of those registration packets that were created in the specific machine, and that status that has changed since the last sync.
1. Saves the statuses ‘Processing’, ‘Processed’ or ‘Resend’ as received for each packet. Statuses of other packets are not updated.
1. Immediately deletes the packets from the local machine whose status is received as ‘Processed’.
1. Displays an alert in case of sync failure.
   * The on-screen message is only indicated if the sync was a success or failure.
   * Detailed errors can be viewed in the transaction logs.
1. The system does not allow registration officer to perform any activities when the data sync is running.
1. If the Registration Client is not online or not open during a scheduled sync, the sync will be queued up and will be executed later. 
1. When the Registration Client is next launched and is online, checks if the previous scheduled sync was executed. If not executed earlier, then immediately starts the sync.
1. System captures and stores the transaction details for audit purpose (except PII data).
#### B. Delete transaction history (audit logs) post sync with server and the retention period
 
When a set of audit data is uploaded to the server and the server has acknowledged receipt of the audit data, the system performs the following steps to delete transaction history (audit logs) post sync with server and the retention period:
1. Runs on a daily process to identify audit data that has been sent to the server and acknowledgement is received from the server.
   * The audit data acknowledgement received from the server >= x hours ago. X is configured at a country level.
2. Deletes the identified audit data from the client machine.
1. Executes at a time and frequency as configured. 
   * The process takes place only when the Registration Client is in open and running situation. If the Registration Client is not open during a scheduled run, it is executed as soon as the client is next started up.
4. Does not delete audit data, if that is yet to be sent to the server.
1. System captures and stores the transaction details.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration/registration_packet_deletion_job.md)

### 11.2 Machine Retirement [**[↑]**](#table-of-contents)

Machine is termed as machine retirement due to following reason:
* If the machine has obsolete specification.
* When the machine is moved from one center to another (re-mapped), then the machine will retire from that old center.

Before the machine is decommissioned, the following checks must be performed:

1. All packets created must either be uploaded to server or exported to external device.
2. All pending end of day approvals are completed and re-registrations pending action are cleared, refer below for more details
3. All data locally saved in the machine must be cleaned up.

Re-mapping of Machine:
If a Machine has been re-mapped to another center, then:
1. Officer will not be allowed to do any operation in Registration Client except,
- Login/Logout
- Approve packets as part of End of Day Approval process
- Upload Packets
- Inform Residents to Re-Register and mark action accordingly
2. Once Packet Approval and Informing Resident is Completed, then
- Packets will be auto uploaded if anything is pending
- Initial Sync Flag is Turned On
3. Once the Officer logs out and tries to login again, then
- New Master data gets downloaded for the newly mapped Center

### List of Configurable Parameters and Processes [**[↑]**](#table-of-contents)

1. Configurable Parameters
    
   [**Link to Configurable Parameters of Registration Services**](/mosip/mosip-config/blob/master/config/registration.properties)

2. Configurable Processes 
* (Work in Progress) 


### Process View [**[↑]**](#table-of-contents)
[**Link to Process View of Registration Services**](Process-view#2-registration-client-)
