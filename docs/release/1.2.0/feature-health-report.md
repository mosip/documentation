This document illustates the module wise features in MOSIP 1.2.0 and their functionality with the working status.

## Legends
|Legend|Status|Description|
| :-: | :-: |:-|
|![](../_images/1.2.0/check.png) | Passed | Feature(s) working as designed |
|![](../_images/1.2.0/remove.png) | Failed | Feature(s) working as designed |
|![](../_images/1.2.0/n.png) | Not Verified | Feature(s) not verified |
|![](../_images/1.2.0/p.png) | Partially Working | Feature(s) not completely working as designed |


## Pre-registration
|Feature | Status |
|:- | :-: |
|Login using email OTP |![](../_images/1.2.0/check.png)|
|Login using SMS OTP |![](../_images/1.2.0/n.png)|
|Captcha |![](../_images/1.2.0/check.png)|
|Create application |![](../_images/1.2.0/check.png)|
|Appointment booking |![](../_images/1.2.0/check.png)|
|Notifications - E-mail |![](../_images/1.2.0/check.png)|
|Notifications - SMS |![](../_images/1.2.0/n.png) |
|Download and print acknowlagement |![](../_images/1.2.0/check.png)|
|Upload document(s) |![](../_images/1.2.0/check.png)|
|Appointment cancellation |![](../_images/1.2.0/check.png)|
|Appointment re-booking |![](../_images/1.2.0/check.png)|
|Group booking |![](../_images/1.2.0/check.png)|
|Discard Application |![](../_images/1.2.0/check.png)|
|Multi-Language support |![](../_images/1.2.0/check.png)|
|Dynamic UI |![](../_images/1.2.0/check.png)|
|Audit |![](../_images/1.2.0/check.png)|

## Registration Client
|Feature | Status |
|:- | :-: |
|Master data sync |![](../_images/1.2.0/check.png)|
|First user onboarding |![](../_images/1.2.0/check.png)|
|Operator/Supervisor onboarding |![](../_images/1.2.0/check.png)|
|New registration -  using sync'd PRID |![](../_images/1.2.0/check.png)|
|New registration - using online PRID |![](../_images/1.2.0/check.png)|
|New Registration - without PRID |![](../_images/1.2.0/check.png)|
|New Registration - with valid introducer UIN/RID |![](../_images/1.2.0/check.png)|
|New Registration - with Exceptions |![](../_images/1.2.0/check.png)|
|Update - Demographics |![](../_images/1.2.0/check.png)|
|Update - Biometrics |![](../_images/1.2.0/check.png)|
|Lost UIN - Adult |![](../_images/1.2.0/check.png)|
|Lost UIN - Child |![](../_images/1.2.0/check.png)|
|Acknowledge preview have related/catpured data |![](../_images/1.2.0/check.png)|
|Child becomes Adult - update biometrics |![](../_images/1.2.0/check.png)|
|Officer biometric update |![](../_images/1.2.0/check.png)|
|Bio Login - Fingerprint/IRIS/Face using mockSDK |![](../_images/1.2.0/check.png)|
|Packet creation authentication (approval) via Bio Auth |![](../_images/1.2.0/check.png)|
|EOD Authentication via Bio Auth |![](../_images/1.2.0/check.png)|
|EOD Authentication via Password |![](../_images/1.2.0/check.png)|
|Multi-Factor Auth - Finger + Password: Packet Auth |![](../_images/1.2.0/check.png)|
|Offline Registration |![](../_images/1.2.0/check.png)|
|Password Re-set |![](../_images/1.2.0/check.png)|
|Remap Center |![](../_images/1.2.0/check.png)|
|Auotmatic Upload packet with & without EOD |![](../_images/1.2.0/check.png)|
|Save applications to device |![](../_images/1.2.0/check.png)|
|Application status check |![](../_images/1.2.0/check.png)|
|Dynamic UI |![](../_images/1.2.0/check.png)|
|Multi language support |![](../_images/1.2.0/check.png)|
|Registration client with TPM-enabled |![](../_images/1.2.0/check.png)|
|Registration client without TPM |![](../_images/1.2.0/n.png) |
|Audit |![](../_images/1.2.0/n.png) |

## Registration Processor
|Feature | Status |
|:- | :-: |
|Demo - De-duplication |![](../_images/1.2.0/check.png)|
|Biometric - De-duplication |![](../_images/1.2.0/check.png)|
|Manual adjudication |![](../_images/1.2.0/n.png) |
|Audit |![](../_images/1.2.0/check.png)|
|Notification based on user preferred language |![](../_images/1.2.0/check.png)|
|Policy based packet processing	|![](../_images/1.2.0/check.png)|
|Support for pause resume |![](../_images/1.2.0/check.png)|
|Hotlisting	|![](../_images/1.2.0/check.png)|
|Biometric correction |![](../_images/1.2.0/check.png)|

## ID Authentication
|Feature | Status |
|:- | :-: |
|Auth (Bio/Demo/OTP) using UIN |![](../_images/1.2.0/check.png)|
|Auth (Bio/Demo/OTP) using VID |![](../_images/1.2.0/check.png)|
|Multi-factor auth using UIN |![](../_images/1.2.0/check.png)|
|Multi-factor auth using VID |![](../_images/1.2.0/check.png)|
|e-KYC (Bio/Demo/OTP) using UIN |![](../_images/1.2.0/check.png)|
|e-KYC (Bio/Demo/OTP) using VID |![](../_images/1.2.0/check.png)|
|e-KYC multi-factor auth using UIN |![](../_images/1.2.0/check.png)|
|e-KYC multi-factor auth using VID |![](../_images/1.2.0/check.png)|
|Auth lock/unlock |![](../_images/1.2.0/check.png)|
|Create UIN |![](../_images/1.2.0/check.png)|
|Deactivate/reactivate UIN |![](../_images/1.2.0/check.png)|
|VID generation (Perpetual/Temporary) |![](../_images/1.2.0/check.png)|
|Audit |![](../_images/1.2.0/check.png)|

## Resident Services
|Feature | Status |
|:- | :-: |
|Update demo details|![](../_images/1.2.0/remove.png)|
|View auth history|![](../_images/1.2.0/check.png)|
|Download UIN card|![](../_images/1.2.0/check.png)|
|Download masked UIN card|![](../_images/1.2.0/remove.png)|
|Revoke VIDs|![](../_images/1.2.0/p.png)|
|Lock/Unlock auth (Bio/Demo)|![](../_images/1.2.0/check.png)|
|Generate VID (Perpetual/Temporary)|![](../_images/1.2.0/check.png)|
|Audit|![](../_images/1.2.0/check.png)|
|Check Packet Status|![](../_images/1.2.0/check.png)|

## Admin Services
|Feature | Status |
|:- | :-: |
|User mapping - To Zone/RegCenter |![](../_images/1.2.0/check.png)|
|Center - Create/Edit/Activate/Deactivate/Decommission |![](../_images/1.2.0/check.png)|
|Device  - Create/Edit/Activate/Deactivate/Decommission |![](../_images/1.2.0/p.png)|
|Machine - Create/Edit/Activate/Deactivate/Decommission |![](../_images/1.2.0/check.png)|
|Packet Status - for given RID |![](../_images/1.2.0/p.png)|
|Packet Pause/Resume - for given RID |![](../_images/1.2.0/remove.png)|
|CenterType - Create/Edit/Activate |![](../_images/1.2.0/check.png)|
|CenterType - Cloning to logged in language |![](../_images/1.2.0/check.png)|
|BlockListedWords - Create/Edit/Activate/Deactivate |![](../_images/1.2.0/check.png)|
|HolidayList - Create/Edit/Activate/Deactivate |![](../_images/1.2.0/check.png)|
|HolidayList - Cloning to logged in language |![](../_images/1.2.0/p.png)|
|Template - Create/Edit/Activate/Deactivate |![](../_images/1.2.0/check.png)|
|Template - Cloning to logged in language |![](../_images/1.2.0/remove.png)|
|Dynamicfield - Create/Update/Activate/Deactivate |![](../_images/1.2.0/check.png)|
|Device Specification - Create/Edit/Activate/Deactivate |![](../_images/1.2.0/check.png)|
|Machine Specification - Create/Edit/Activate/Deactivate |![](../_images/1.2.0/check.png)|
|Machine Type - Create/Edit/Activate/Deactivate |![](../_images/1.2.0/check.png)|
|Document Type - Create/Edit/Activate/Deactivate |![](../_images/1.2.0/check.png)|
|Document Category- Create/Edit/Activate/Deactivate |![](../_images/1.2.0/check.png)|
|Document Category Type - Create/Edit/Activate/Deactivate |![](../_images/1.2.0/check.png)|
|Device type-Create/Update/Activate/Deactivate |![](../_images/1.2.0/check.png)|
|Bulk upload - Packets |![](../_images/1.2.0/remove.png)|
|Bulk upload - MasterData  - Insert/Update/Delete to a table |![](../_images/1.2.0/p.png)|
|Keymanager - Generate CSR |![](../_images/1.2.0/check.png)|
|Keymanager - Generate MasterKey |![](../_images/1.2.0/check.png)|
|Keymanager - Get certificate |![](../_images/1.2.0/check.png)|
|Keymanager - Upload certificate for APID and RID |![](../_images/1.2.0/check.png)|
|Keymanager - Upload other domain certificate for APID and RID |![](../_images/1.2.0/check.png)|
|Multi Language support |![](../_images/1.2.0/check.png)|
|Retrieve Lost RID |![](../_images/1.2.0/p.png)|

## Partner Management
|Feature | Status |
|:- | :-: |
|Partner - Register/Activate/Deactivate |![](../_images/1.2.0/check.png)|
|Partner Certificates Upload |![](../_images/1.2.0/check.png)|
|Upload CA Certificate |![](../_images/1.2.0/check.png)|
|Download Certificate |![](../_images/1.2.0/remove.png)|
|Partner - Policy Mapping |![](../_images/1.2.0/check.png)|
|Policy Group - Create/Edit/Activate/Deactivate |![](../_images/1.2.0/check.png)|
|Auth Policy - Create/Edit/Activate/Deactivate |![](../_images/1.2.0/check.png)|
|Data share Policy - Create/Edit/Activate/Deactivate |![](../_images/1.2.0/check.png)|
|Partner policy mapping - Map policy/Approve/Reject |![](../_images/1.2.0/check.png)|
|Device details - Create/Edit/Activate/Deactivate/SBI details |![](../_images/1.2.0/check.png)|
|FTM details - Create/Edit/Approve/Reject |![](../_images/1.2.0/check.png)|
|Upload CA certificate |![](../_images/1.2.0/check.png)|
|Audit |![](../_images/1.2.0/check.png)|
