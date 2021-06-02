The registration client is a thick Java-based client where the resident's demographic and biometric details are captured along with the supporting documents in online or offline mode. The captured information is packaged in a secure tamper-proof way and send to the server for processing.

# Login and Authentication Service
The Login and Authentication Service ia about the process of logging into the Registration Client by Operator or Supervisor using various authentication modes such as user id, password, OTP and biometrics.

## User Event Type
The following events are triggered as part of User Event Type in Login and Authentication Service 

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | REG-AUTH-001 | User | Login with User ID | This event describes the process of logging into the Registration Client by Operator or Supervisor using his/her User ID. | User ID | User ID
2 | REG-AUTH-002 | User | Login with Password | This event describes the process of logging into the Registration Client by Operator or Supervisor using his/her Password. | User ID | User ID
3 | REG-AUTH-003 | User | Get the OTP | This event describes the process of getting the OTP in order to log in into the Registration Client by Operator or Supervisor. | User ID | User ID
4 | REG-AUTH-004 | User | Login with OTP | This event describes the process of logging into the Registration Client by Operator or Supervisor using his/her OTP. | User ID | User ID
5 | REG-AUTH-005 | User | Resend OTP | This event describes the process of resending the OTP to the Operator or Supervisor in case they have not received the OTP. | User ID | User ID
6 | REG-AUTH-006 | User | Login with Finger Print | This event describes the process of logging into the Registration Client by Operator or Supervisor using his/her Finger Print. | User ID | User ID
7 | REG-AUTH-007 | User | Login with Iris | This event describes the process of logging into the Registration Client by Operator or Supervisor using his/her Iris. | User ID | User ID
8 | REG-AUTH-008 | User | Login with Face | This event describes the process of logging into the Registration Client by Operator or Supervisor using his/her Face. | User ID | User ID
9 | REG-AUTH-009 | User | User Logout | This event describes the process of logout from the Registration Client by Operator or Supervisor. | User ID | User ID
10 | REG-AUTH-010 | User | Fetch Login Modes | This event describes the process of fetching the login modes for the Registration Client by Operator or Supervisor. | User ID | User ID
11 | REG-AUTH-013 | User | Fetch User Details | This event describes the process of fetching the user details of the Registration Client. | User ID | User ID
12 | REG-AUTH-015 | User | Fetch Center Details | This event describes the process of fetching the center details for the Registration Client. | User ID | User ID
13 | REG-AUTH-017 | User | Fetch Screens to be authorized | This event describes the process of fetching the screens to be authorized for the Registration Client. | User ID | User ID

# Navigation Events in Home Screen
The navigation links in home screen keeps the user oriented and makes its esier for them to move around to desired sections of the application.

## User Event Type
The following events are triggered as part of User Event Type under Home Screen Navigation

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | REG-EVT-002 | User | New Registration | This event specifies the navigation link action for New Registration. | Registration ID | Registration ID
2 | REG-EVT-001 | User | Lost UIN | This event specifies the navigation link action for Lost UIN. | Registration ID | Registration ID
3 | REG-EVT-003 | User | Update UIN | This event specifies the navigation link action for Updating the UIN. | Registration ID | Registration ID
4 | REG-EVT-004 | User | Approve Registration | This event specifies the navigation link action for approving the registration. | User ID | User ID
5 | REG-EVT-005 | User | Upload Packets | This event specifies the navigation link action for uploading the packets. | User ID | User ID
6 | REG-EVT-006 | User | Re-Registration of | This event specifies the navigation link action for Re-Registration. | User ID | User ID
7 | REG-NAV-003 | User | Data Synchronization | This event specifies the navigation link action for Data Synchronization in Registration Client. | User ID | User ID
8 | REG-NAV-004 | User | Downloading of Pre-Registration Data | This event specifies the navigation link action for downloading of Pre-Registration data to Registration Client. | User ID | User ID
9 | REG-NAV-006 | User | Onboarding of User | This event specifies the navigation link action for user onboarding in Registration Client. | User ID | User ID

## System Event Type
The following events are triggered as part of System Event Type under Home Screen Navigation
Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | REG-NAV-007 | System | Home Screen | This event specifies the navigation link action to redirect to Home Screen. | User ID | User ID

# New Registration Flow
An operator can initiate the process of registering an new applicant in the MOSIP ecosystem by filling the new registration form with the resident.

## User Event Type
The following events are triggered as part of New Registration

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | REG-EVT-007 | User | Capturing of Demographic Details| This event describes that the capturing of demographic details has started. | Registration ID | Registration ID
2 | REG-EVT-008 | User | Fetch Pre-Registration Data | This event describes that the data for selected Pre-Registration ID is being fetched. | Registration ID | Registration ID
3 | REG-EVT-084 | User | Save Demographic Details | This event describes that the demographic details are being saved to Data Transfer Object. | Registration ID | Registration ID
4 | REG-EVT-009 | User | Next Screen Navigation | This event specifies the navigation link action for next screen after capturing the demographic details. | Registration ID | Registration ID
5 | REG-EVT-089 | User | Scan Documents | This event triggers the action for scanning of documents. | Registration ID | Registration ID
6 | REG-EVT-090 | User | View Documents | This event triggers the action for viewing of documents. | Registration ID | Registration ID
7 | REG-EVT-091 | User | Delete Documents| This event triggers the action for deleting the documents. | Registration ID | Registration ID
8 | REG-EVT-010 | User | Scan Proof of Address Dcoument | This event triggers the action for scanning the Proof of Address document. | Registration ID | Registration ID
9 | REG-EVT-011 | User | View Proof of Address Dcoument | This event triggers the action for viewing the Proof of Address document. | Registration ID | Registration ID
10 | REG-EVT-012 | User | Delete Proof of Address Dcoument | This event triggers the action for deleting the Proof of Address document. | Registration ID | Registration ID
11 | REG-EVT-013 | User | Scan Proof of Identity Dcoument | This event triggers the action for scanning the Proof of Identity document. | Registration ID | Registration ID
12 | REG-EVT-014 | User | View Proof of Identity Dcoument | This event triggers the action for viewing the Proof of Identity document. | Registration ID | Registration ID
13 | REG-EVT-015 | User | Delete Proof of Identity Dcoument | This event triggers the action for deleting the Proof of Identity document. | Registration ID | Registration ID
14 | REG-EVT-016 | User | Scan Proof of Residence Dcoument | This event triggers the action for scanning the Proof of Residence document. | Registration ID | Registration ID
15 | REG-EVT-017 | User | View Proof of Residence Dcoument | This event triggers the action for viewing the Proof of Residence document. | Registration ID | Registration ID
16 | REG-EVT-018 | User | Delete Proof of Residence Dcoument | This event triggers the action for deleting the Proof of Residence document. | Registration ID | Registration ID
17 | REG-EVT-019 | User | Scan Proof of Birth Dcoument | This event triggers the action for scanning the Proof of Birth document. | Registration ID | Registration ID
18 | REG-EVT-020 | User | View Proof of Birth Dcoument | This event triggers the action for viewing the Proof of Birth document. | Registration ID | Registration ID
19 | REG-EVT-021 | User | Delete Proof of Birth Dcoument | This event triggers the action for deleting the Proof of Birth document. | Registration ID | Registration ID
20 | REG-EVT-022 | User | Scan Proof of Exception Dcoument | This event triggers the action for scanning the Proof of Exception document. | Registration ID | Registration ID
21 | REG-EVT-023 | User | View Proof of Exception Dcoument | This event triggers the action for viewing the Proof of Exception document. | Registration ID | Registration ID
22 | REG-EVT-024 | User | Delete Proof of Exception Dcoument | This event triggers the action for deleting the Proof of Exception document. | Registration ID | Registration ID
23 | REG-EVT-025 | User | Next Screen Navigation | This event specifies the navigation link action for next screen after uploading the documents. | Registration ID | Registration ID
24 | REG-EVT-026 | User | Back Screen Navigation | This event specifies the navigation link action for back screen after uploading the documents. | Registration ID | Registration ID
25 | REG-EVT-027 | User | Marking Biometric Exception | This event describes the action for marking of biometric exception for the user. | Registration ID | Registration ID
26 | REG-EVT-065 | User | Removing Biometric Exception | This event describes the action for removing of biometric exception for the user. | Registration ID | Registration ID
27 | REG-EVT-030 | User | Scanning of Left Fingerprint Slap | This event describes the action for Scanning of Left Fingerprint Slap. | Registration ID | Registration ID
28 | REG-EVT-031 | User | Scanning of Right Fingerprint Slap | This event describes the action for Scanning of Right Fingerprint Slap. | Registration ID | Registration ID
29 | REG-EVT-032 | User | Scanning Thumb Print | This event describes the action for Scanning of Thumb prints. | Registration ID | Registration ID
30 | REG-EVT-034 | User | Scanning of Iris | This event describes the action for Scanning of both the Iris. | Registration ID | Registration ID
31 | REG-EVT-039 | User | Face Capture | This event describes the action for capturing of individuals face. | Registration ID | Registration ID
32 | REG-EVT-040 | User | Exception in Face Capture | This event describes the action for capturing an exception image instead of individuals face capture. | Registration ID | Registration ID
33 | REG-EVT-041 | User | Next Screen Navigation | This event specifies the navigation link action for next screen after capturing the biometric details. | Registration ID | Registration ID
34 | REG-EVT-042 | User | Back Screen Navigation | This event specifies the navigation link action for back screen after face photo capture. | Registration ID | Registration ID
35 | REG-EVT-043 | User | Preview and Edit Demographic details | This event describes the action to preview and edit the demographic details. | Registration ID | Registration ID
36 | REG-EVT-044 | User | Preview and Edit Document details | This event describes the action to preview and edit the document details. | Registration ID | Registration ID
37 | REG-EVT-045 | User | Preview and Edit Biometric details | This event describes the action to preview and edit the biometric details. | Registration ID | Registration ID
38 | REG-EVT-046 | User | Next Screen Navigation | This event specifies the navigation link action for next screen after Registration Preview. | Registration ID | Registration ID
39 | REG-EVT-047 | User | Back Screen Navigation | This event specifies the navigation link action for back screen after Registration Preview. | Registration ID | Registration ID
40 | REG-EVT-048 | User | Operator Authentication | This event describes the action for operator authentication with password on click of submit. | Registration ID | Registration ID
41 | REG-EVT-049 | User | Operator Authentication | This event describes the action of getting the OTP for operator authentication. | Registration ID | Registration ID
42 | REG-EVT-050 | User | Operator Authentication | This event describes the action for operator authentication with OTP on submitting the OTP. | Registration ID | Registration ID
43 | REG-EVT-051 | User | Operator Authentication | This event describes the action for operator authentication with resend OTP. | Registration ID | Registration ID
44 | REG-EVT-052 | User | Operator Authentication | This event describes the action for operator authentication with finger print on capture and submit. | Registration ID | Registration ID
45 | REG-EVT-053 | User | Operator Authentication | This event describes the action for operator authentication with iris on capture and submit. | Registration ID | Registration ID
46 | REG-EVT-054 | User | Operator Authentication | This event describes the action for operator authentication with face on capture and submit. | Registration ID | Registration ID
47 | REG-EVT-057 | User | Supervisor Authentication | This event describes the action for supervisor authentication with password on click of submit. | Registration ID | Registration ID
48 | REG-EVT-058 | User | Supervisor Authentication | This event describes the action of getting the OTP for supervisor authentication. | Registration ID | Registration ID
49 | REG-EVT-059 | User | Supervisor Authentication | This event describes the action for supervisor authentication with OTP on submitting the OTP. | Registration ID | Registration ID
50 | REG-EVT-060 | User | Supervisor Authentication | This event describes the action for supervisor authentication with resend OTP. | Registration ID | Registration ID
51 | REG-EVT-061 | User | Supervisor Authentication | This event describes the action for supervisor authentication with finger print on capture and submit. | Registration ID | Registration ID
52 | REG-EVT-062 | User | Supervisor Authentication | This event describes the action for supervisor authentication with iris on capture and submit. | Registration ID | Registration ID
53 | REG-EVT-063 | User | Supervisor Authentication | This event describes the action for supervisor authentication with face on capture and submit. | Registration ID | Registration ID
54 | REG-EVT-064 | User | Supervisor Authentication Preview | This event specifies the option of preview for supervisor authentication before submit. | Registration ID | Registration ID

### Success Response for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | REG-EVT-066 | User | Packet Creation | This event describes that the packet was created successfully. | Registration ID | Registration ID

### Failure Response for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | REG-EVT-074 | User | Packet Creation | This event describes that there was an internal error during packet creation | Registration ID | Registration ID

# End of Day Activities
As a part of EOD activities the supervisor can review the registration acknowledgement, retrieve the packets, approve or reject the packets and finally upload the packets to the server.

## User Event Type
The following events are triggered as part of end of day activities

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | REG-PKT-001 | User | Retrieve Packet | This event describes that Packets which are in created state for approval are retrived. | User ID | User ID
2 | REG-EVT-071 | User | Approve Packet| This event describes that the packet approval was successful. | User ID | User ID
3 | REG-EVT-072 | User | Reject Packet | This event describes that the packet rejection was successful. | User ID | User ID
4 | REG-PKT-002 | User | Packet Updation | This event describes that Packets which are in created state are updated. | User ID | User ID
5 | REG-SYNC-006 | User | Sync Packet Status| This event describes that the registration packet status is synced from server to the client. | User ID | User ID
6 | REG-EXPT-PKT-001 | User | Export Packet | This event describes that the registration packets are exported to the external device. | User ID | User ID
7 | REG-EVT-068 | User | Upload Packet | This event describes that the registration packet was uploaded successfully to the server. | User ID | User ID

## System Event Type
The following events are triggered as part of end of day activities

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | REG-UPL-PKT-001 | System | Upload Packet | This event describes that the packet was uploaded to the server through sync.| User ID | User ID

# Synchronization Activities
The Synchronization service gives information about the various sync activities that take place between the server and the registration client, such as Pre-Reg Sync, packet count,Geo sync etc.

## User Event Type
The following events are triggered as part of synchronization activities

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | REG-SYNC-011 | User | Fetch Info Sync Service | This event describes that the SyncJobInfo containing the sync control list and yet to export packet count are fetched successfully| Application ID | Application ID
2 | REG-SYNC-012 | User | Sync Validation | This event describes that the Validation of the sync status ended successfully.| Application ID | Application ID
3 | REG-SYNC-013 | User | Sync Count Validation | This event the validation of yet to export packets frequency with the configured limit count.| Application ID | Application ID
4 | REG-SYNC-014 | User | Sync Geographic Validation | This event describes that the Validation of the geographic information ended successfully.| Application ID | Application ID
5 | REG-PKT-003 | User | Pending Packet Count Validation | This event describes that the action for validating the count of pending packets.| Application ID | Application ID
6 | REG-PKT-004 | User | Pending Packet Duration Validation | This event describes that the action for validating the duration of pending packets.| Application ID | Application ID
7 | REG-SYNC-007 | User | Sync Pre-Registration Packet | This event describes that the pre-registration data is synced from server to the registration client.| Application ID | Application ID
8 | REG-AUTH-020 | User | Center Machine Remap Service | This event describes that the machine is remapped to another center.| Application ID | Application ID

# Scheduler Service
The scheduler service periodically check all the open sessions to determine which ones have been idle for a time greater than the idle timeout set.

## System Event Type
The following events are triggered as part of scheduler service

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|------------------
1 | REG-SCH-001 | System | Scheduler Utility | This event describes that the scheduler started sucessfully. | Application ID | Application ID
2 | REG-SCH-002 | System | Refresh Timeout | This event describes the time task remainder alert. | Application ID | Application ID
3 | REG-SCH-003 | System | Session Timeout | This event describes the time task session has expired. | Application ID | Application ID

# Mosip Device Manager Service
Thw Mosip Device Manager Service which runs on a particular port automatically scans all the devices (Eg. Biometric Device) and stores the information in device registry.The service gives the information about the device availabilty.

## User Event Type
The following events are triggered as part of Mosip Device Manager service

### Success Response for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|------------------
1 | REG-EVT-088 | User | Device Information | This event specifies that the device is found/available| Application ID.| Application ID | Application ID
2 | REG-EVT-086 | User | Biometric Capture Status | This event specifies that the biometric capture was successful.| Application ID | Application ID

### Failure Response for User Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|------------------
1 | REG-EVT-087 | User | Device Information | This event specifies that the device is not found/unavailable| Application ID | Application ID
2 | REG-EVT-085 | User | Biometric Capture Status | This event specifies that the biometric capture was unsuccessful.| Application ID | Application ID
