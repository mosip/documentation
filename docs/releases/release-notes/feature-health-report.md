# Feature Health Report

This document illustates the module wise features in MOSIP 1.2.0 and their functionality with the working status.

### Legends

|                 Legend                |       Status      | Description                                   |
| :-----------------------------------: | :---------------: | --------------------------------------------- |
|  ![](../../.gitbook/assets/check.png) |       Passed      | Feature(s) working as designed                |
| ![](../../.gitbook/assets/remove.png) |       Failed      | Feature(s) working as designed                |
|    ![](../../.gitbook/assets/n.png)   |    Not Verified   | Feature(s) not verified                       |
|    ![](../../.gitbook/assets/p.png)   | Partially Working | Feature(s) not completely working as designed |

### Pre-registration

| Feature                           |                Status                |
| --------------------------------- | :----------------------------------: |
| Login using email OTP             | ![](../../.gitbook/assets/check.png) |
| Login using SMS OTP               |   ![](../../.gitbook/assets/n.png)   |
| Captcha                           | ![](../../.gitbook/assets/check.png) |
| Create application                | ![](../../.gitbook/assets/check.png) |
| Appointment booking               | ![](../../.gitbook/assets/check.png) |
| Notifications - E-mail            | ![](../../.gitbook/assets/check.png) |
| Notifications - SMS               |   ![](../../.gitbook/assets/n.png)   |
| Download and print acknowlagement | ![](../../.gitbook/assets/check.png) |
| Upload document(s)                | ![](../../.gitbook/assets/check.png) |
| Appointment cancellation          | ![](../../.gitbook/assets/check.png) |
| Appointment re-booking            | ![](../../.gitbook/assets/check.png) |
| Group booking                     | ![](../../.gitbook/assets/check.png) |
| Discard Application               | ![](../../.gitbook/assets/check.png) |
| Multi-Language support            | ![](../../.gitbook/assets/check.png) |
| Dynamic UI                        | ![](../../.gitbook/assets/check.png) |
| Audit                             | ![](../../.gitbook/assets/check.png) |

### Registration Client

| Feature                                                   |                Status                |
| --------------------------------------------------------- | :----------------------------------: |
| Master data sync                                          | ![](../../.gitbook/assets/check.png) |
| First user onboarding                                     | ![](../../.gitbook/assets/check.png) |
| Operator/Supervisor onboarding                            | ![](../../.gitbook/assets/check.png) |
| New registration - using sync'd PRID                      | ![](../../.gitbook/assets/check.png) |
| New registration - using online PRID                      | ![](../../.gitbook/assets/check.png) |
| New Registration - without PRID                           | ![](../../.gitbook/assets/check.png) |
| New Registration - with valid introducer UIN/RID          | ![](../../.gitbook/assets/check.png) |
| New Registration - with exceptions                        |   ![](../../.gitbook/assets/p.png)   |
| Update - Demographics                                     | ![](../../.gitbook/assets/check.png) |
| Update - Biometrics                                       | ![](../../.gitbook/assets/check.png) |
| Lost UIN - Adult                                          | ![](../../.gitbook/assets/check.png) |
| Lost UIN - Child                                          | ![](../../.gitbook/assets/check.png) |
| Acknowledge preview have related/catpured data            | ![](../../.gitbook/assets/check.png) |
| Child becomes Adult - update biometrics                   | ![](../../.gitbook/assets/check.png) |
| Officer biometric update                                  | ![](../../.gitbook/assets/check.png) |
| Bio Login - Fingerprint/IRIS/Face (MockSDK)               | ![](../../.gitbook/assets/check.png) |
| Packet creation authentication using biometrics (MockSDK) | ![](../../.gitbook/assets/check.png) |
| EOD authentication using biometrics (MockSDK)             | ![](../../.gitbook/assets/check.png) |
| EOD authentication using password                         | ![](../../.gitbook/assets/check.png) |
| Offline Registration                                      | ![](../../.gitbook/assets/check.png) |
| Password Re-set                                           | ![](../../.gitbook/assets/check.png) |
| Remap Center                                              |   ![](../../.gitbook/assets/p.png)   |
| Auotmatic Upload packet with & without EOD                | ![](../../.gitbook/assets/check.png) |
| Save applications to device                               | ![](../../.gitbook/assets/check.png) |
| Application status check                                  | ![](../../.gitbook/assets/check.png) |
| Dynamic UI                                                | ![](../../.gitbook/assets/check.png) |
| Multi language support                                    | ![](../../.gitbook/assets/check.png) |
| Registration client with TPM-enabled                      | ![](../../.gitbook/assets/check.png) |
| Registration client without TPM                           |   ![](../../.gitbook/assets/n.png)   |
| Audit                                                     |   ![](../../.gitbook/assets/n.png)   |

### Registration Processor

| Feature                                       |                Status                |
| --------------------------------------------- | :----------------------------------: |
| Demo - De-duplication                         | ![](../../.gitbook/assets/check.png) |
| Biometric - De-duplication                    | ![](../../.gitbook/assets/check.png) |
| Manual adjudication                           |   ![](../../.gitbook/assets/n.png)   |
| Audit                                         | ![](../../.gitbook/assets/check.png) |
| Notification based on user preferred language | ![](../../.gitbook/assets/check.png) |
| Policy based packet processing                | ![](../../.gitbook/assets/check.png) |
| Support for pause resume                      | ![](../../.gitbook/assets/check.png) |
| Hotlisting                                    | ![](../../.gitbook/assets/check.png) |
| Biometric correction                          | ![](../../.gitbook/assets/check.png) |

### ID Authentication

| Feature                              |                Status                |
| ------------------------------------ | :----------------------------------: |
| Auth (Bio/Demo/OTP) using UIN        | ![](../../.gitbook/assets/check.png) |
| Auth (Bio/Demo/OTP) using VID        | ![](../../.gitbook/assets/check.png) |
| Multi-factor auth using UIN          | ![](../../.gitbook/assets/check.png) |
| Multi-factor auth using VID          | ![](../../.gitbook/assets/check.png) |
| e-KYC (Bio/Demo/OTP) using UIN       | ![](../../.gitbook/assets/check.png) |
| e-KYC (Bio/Demo/OTP) using VID       | ![](../../.gitbook/assets/check.png) |
| e-KYC multi-factor auth using UIN    | ![](../../.gitbook/assets/check.png) |
| e-KYC multi-factor auth using VID    | ![](../../.gitbook/assets/check.png) |
| Auth lock/unlock                     | ![](../../.gitbook/assets/check.png) |
| Create UIN                           | ![](../../.gitbook/assets/check.png) |
| Deactivate/reactivate UIN            | ![](../../.gitbook/assets/check.png) |
| VID generation (Perpetual/Temporary) | ![](../../.gitbook/assets/check.png) |
| Audit                                | ![](../../.gitbook/assets/check.png) |

### Resident Services

| Feature                            |                 Status                |
| ---------------------------------- | :-----------------------------------: |
| Update demo details                | ![](../../.gitbook/assets/remove.png) |
| View auth history                  |  ![](../../.gitbook/assets/check.png) |
| Download UIN card                  |  ![](../../.gitbook/assets/check.png) |
| Download masked UIN card           | ![](../../.gitbook/assets/remove.png) |
| Revoke VIDs                        |    ![](../../.gitbook/assets/p.png)   |
| Lock/Unlock auth (Bio/Demo)        |  ![](../../.gitbook/assets/check.png) |
| Generate VID (Perpetual/Temporary) |  ![](../../.gitbook/assets/check.png) |
| Audit                              |  ![](../../.gitbook/assets/check.png) |
| Check Packet Status                |  ![](../../.gitbook/assets/check.png) |

### Admin Services

| Feature                                                       |                 Status                |
| ------------------------------------------------------------- | :-----------------------------------: |
| User mapping - To Zone/RegCenter                              |  ![](../../.gitbook/assets/check.png) |
| Center - Create/Edit/Activate/Deactivate/Decommission         |  ![](../../.gitbook/assets/check.png) |
| Device - Create/Edit/Activate/Deactivate/Decommission         |    ![](../../.gitbook/assets/p.png)   |
| Machine - Create/Edit/Activate/Deactivate/Decommission        |  ![](../../.gitbook/assets/check.png) |
| Packet Status - for given RID                                 |    ![](../../.gitbook/assets/p.png)   |
| Packet Pause/Resume - for given RID                           | ![](../../.gitbook/assets/remove.png) |
| CenterType - Create/Edit/Activate                             |  ![](../../.gitbook/assets/check.png) |
| CenterType - Cloning to logged in language                    |  ![](../../.gitbook/assets/check.png) |
| BlockListedWords - Create/Edit/Activate/Deactivate            |  ![](../../.gitbook/assets/check.png) |
| HolidayList - Create/Edit/Activate/Deactivate                 |  ![](../../.gitbook/assets/check.png) |
| HolidayList - Cloning to logged in language                   |    ![](../../.gitbook/assets/p.png)   |
| Template - Create/Edit/Activate/Deactivate                    |  ![](../../.gitbook/assets/check.png) |
| Template - Cloning to logged in language                      | ![](../../.gitbook/assets/remove.png) |
| Dynamicfield - Create/Update/Activate/Deactivate              |  ![](../../.gitbook/assets/check.png) |
| Device Specification - Create/Edit/Activate/Deactivate        |  ![](../../.gitbook/assets/check.png) |
| Machine Specification - Create/Edit/Activate/Deactivate       |  ![](../../.gitbook/assets/check.png) |
| Machine Type - Create/Edit/Activate/Deactivate                |  ![](../../.gitbook/assets/check.png) |
| Document Type - Create/Edit/Activate/Deactivate               |  ![](../../.gitbook/assets/check.png) |
| Document Category- Create/Edit/Activate/Deactivate            |  ![](../../.gitbook/assets/check.png) |
| Document Category Type - Create/Edit/Activate/Deactivate      |  ![](../../.gitbook/assets/check.png) |
| Device type-Create/Update/Activate/Deactivate                 |  ![](../../.gitbook/assets/check.png) |
| Bulk upload - Packets                                         | ![](../../.gitbook/assets/remove.png) |
| Bulk upload - MasterData - Insert/Update/Delete to a table    |    ![](../../.gitbook/assets/p.png)   |
| Keymanager - Generate CSR                                     |  ![](../../.gitbook/assets/check.png) |
| Keymanager - Generate MasterKey                               |  ![](../../.gitbook/assets/check.png) |
| Keymanager - Get certificate                                  |  ![](../../.gitbook/assets/check.png) |
| Keymanager - Upload certificate for APID and RID              |  ![](../../.gitbook/assets/check.png) |
| Keymanager - Upload other domain certificate for APID and RID |  ![](../../.gitbook/assets/check.png) |
| Multi Language support                                        |  ![](../../.gitbook/assets/check.png) |
| Retrieve Lost RID                                             |    ![](../../.gitbook/assets/p.png)   |

### Partner Management

| Feature                                                      |                 Status                |
| ------------------------------------------------------------ | :-----------------------------------: |
| Partner - Register/Activate/Deactivate                       |  ![](../../.gitbook/assets/check.png) |
| Partner Certificates Upload                                  |  ![](../../.gitbook/assets/check.png) |
| Upload CA Certificate                                        |  ![](../../.gitbook/assets/check.png) |
| Download Certificate                                         | ![](../../.gitbook/assets/remove.png) |
| Partner - Policy Mapping                                     |  ![](../../.gitbook/assets/check.png) |
| Policy Group - Create/Edit/Activate/Deactivate               |  ![](../../.gitbook/assets/check.png) |
| Auth Policy - Create/Edit/Activate/Deactivate                |  ![](../../.gitbook/assets/check.png) |
| Data share Policy - Create/Edit/Activate/Deactivate          |  ![](../../.gitbook/assets/check.png) |
| Partner policy mapping - Map policy/Approve/Reject           |  ![](../../.gitbook/assets/check.png) |
| Device details - Create/Edit/Activate/Deactivate/SBI details |  ![](../../.gitbook/assets/check.png) |
| FTM details - Create/Edit/Approve/Reject                     |  ![](../../.gitbook/assets/check.png) |
| Upload CA certificate                                        |  ![](../../.gitbook/assets/check.png) |
| Audit                                                        |  ![](../../.gitbook/assets/check.png) |
