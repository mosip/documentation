# Patient Registration Portal

### Section 1: Introduction & Overview

This guide walks you through the ANC (Antenatal Care) patient registration journey powered by the integration of eSignet with the [DHIS2 Registration Portal](https://mosip.integration.dhis2.org/dhis-web-login/). The focus of this guide is registration — the first and most critical step in the healthcare journey — where a Public Health Midwife (PHM) registers a pregnant mother into the national health registry using her verified National ID.

You can self-experience the complete registration flow by following the step-by-step instructions in this guide. You will need access to the DHIS2 Registration Portal, an eSignet-enabled test environment, and a test National ID with a registered mobile number for OTP delivery.

#### The Story: One Registration, One Identity, One Record

A pregnant mother visits her local PHM centre for the first time. Rather than filling out paper forms with details that may be incomplete or duplicated across facilities, her identity is verified in real time against the national ID system. In a matter of minutes, her demographic details are fetched automatically, a registration record is created in the [DHIS2 portal](https://mosip.integration.dhis2.org/dhis-web-login/), a Patient Health Number (PHN) is issued to uniquely identify her across all health services, and her complete record is securely stored in a central FHIR server — ready to be accessed by any authorised healthcare provider.

Her data belongs to her and is anchored to a single verified identity. No manual re-entry, no duplicate records, no paperwork to carry between visits.

#### The Platforms in This Guide

This guide focuses on two core platforms that work together to deliver a trusted, connected registration experience. DHIS2 is the health information software that powers the PHM Registration Portal — it is where the PHM logs in, enters clinical details, and submits the patient registration. Once registration is complete, the full patient record is automatically pushed to the FHIR Server — the central, shared health data repository that stores every patient record in a structured, interoperable format. The FHIR Server is what makes the patient's data available to any authorised health system beyond this registration step.

The portals and components covered in this guide are:

* [**DHIS2 PHM Registration Portal**](https://mosip.integration.dhis2.org/dhis-web-login/) — where the PHM registers the pregnant mother, verifies her identity via eSignet, and issues a Patient Health Number (PHN).
* **FHIR Server** — the central backend health data store that receives and stores the patient record immediately after registration.

#### The Shared Identity & Authentication Layer

Underpinning the registration process is a shared identity and authentication layer made up of MOSIP and eSignet. MOSIP is the national identity platform — it holds the verified demographic record (name, date of birth, address) and the registered mobile number for every National ID holder. eSignet is MOSIP's OpenID Connect-based authentication layer, used to verify the patient's identity against the National ID system at the point of registration. When a PHM initiates identity verification, eSignet triggers an OTP to the patient's registered mobile, confirms the response with MOSIP, obtains explicit data-sharing consent, and returns the verified demographic data to pre-populate the registration form — all within a single, seamless flow.

#### Registration Journey at a Glance

1. **PHM Logs into DHIS2 Portal** — The PHM authenticates via eSignet using her own National ID and accesses the DHIS2 Registration Portal dashboard.
2. **New Patient Registration Initiated** — The PHM selects the health facility and clicks "Create new person" to begin a new patient registration.
3. **Patient Identity Verified via eSignet** — The PHM clicks "Verify with National ID". eSignet sends an OTP to the patient's registered mobile. The patient provides the OTP. MOSIP confirms identity and returns verified demographics.
4. **Demographics Auto-Populated** — The patient's name, date of birth, and address are automatically filled in the registration form from MOSIP data. The PHM completes the remaining clinical details.
5. **PHN Issued** — A new Patient Health Number (PHN) is generated and assigned, or an existing PHN is linked if the patient is already in the system.
6. **Record Pushed to FHIR Server** — On submission, the complete patient record — verified identity, PHN, and clinical details — is automatically synced to the FHIR Server.

> 💡 **Note:** eSignet-based National ID authentication is used at two points in registration: once for the PHM to log in to the portal, and once to verify the patient's identity and fetch her demographic data from MOSIP.

***

### Section 2: PHM-Assisted DHIS2 Registration Portal

The PHM-Assisted Registration Portal is the entry point of the ANC journey. A Public Health Midwife (PHM) uses this portal to register pregnant mothers who visit the PHM centre. The portal integrates with eSignet to verify the patient's identity using her National ID, ensuring that every registration is tied to a government-verified identity from the very first step.

Once the patient's identity is verified and her demographic data is fetched automatically from MOSIP, the PHM completes the health-specific details and submits the registration. A Patient Health Number (PHN) is either retrieved — if the patient is already in the system — or newly generated and assigned to uniquely identify her across all future health services.

You can access the DHIS2 Registration Portal&#x20;

#### Who Uses This Portal?

* **Primary User:** Public Health Midwife (PHM) — logs in and operates the portal on behalf of the patient.
* **Patient:** Present at the PHM centre but does not operate the portal directly. She provides her National ID and receives the OTP on her registered mobile phone.

#### Step-by-Step: Patient Registration

1. **PHM Opens the Registration Portal** — The PHM navigates to the DHIS2 Registration Portal on the workstation at the PHM centre. The eSignet login page is displayed.
2. **PHM Logs in with National ID via eSignet** — The PHM clicks "Sign in with eSignet". The eSignet login page opens. The PHM enters her own National ID and completes OTP authentication to securely access the portal.
3. **Select Organisation Unit and New Registration** — After login, the PHM selects the health facility (organisation unit) and clicks "Create new person" on the dashboard to begin registering a new patient.
4. **Initiate Patient Identity Verification** — The PHM clicks the "Verify with National ID" button in the registration form. The eSignet verification page opens on-screen.
5. **Enter Patient's National ID** — The PHM enters the pregnant mother's National ID into the eSignet verification page.
6. **eSignet Triggers OTP to Patient** — eSignet sends a One-Time Password (OTP) to the mobile phone number linked to the patient's National ID in MOSIP. The patient receives the OTP on her phone.
7. **Patient Provides OTP** — The patient reads out the OTP she received. The PHM enters the OTP into the portal on the patient's behalf. The patient's identity is now successfully verified by eSignet and MOSIP.
8. **PHM Obtains Patient Consent** — eSignet displays a consent screen listing the demographic data that will be retrieved from MOSIP (name, date of birth, address). The PHM presents this to the patient, obtains explicit verbal consent, and clicks "Allow".
9. **Demographics Auto-Populated** — eSignet returns the patient's verified demographic details from MOSIP. The fields — full name, date of birth, and address — are automatically populated in the registration form. The PHM verifies these details with the patient.
10. **Check for Existing PHN** — The PHM asks whether the patient already has a Patient Health Number (PHN). Two paths are possible — see PHN Handling below.
11. **Complete Clinical Health Information** — The PHM completes the remaining registration details not covered by the identity system: gestational age, obstetric history, blood group, known conditions, and any other relevant clinical information.
12. **Submit Registration** — The PHM reviews the completed form and clicks "Save". The patient's registration record is created in the DHIS2 system.
13. **Record Pushed to FHIR Server** — The full patient record — verified demographics, PHN, and clinical details — is automatically synced to the FHIR server, making it immediately available to any authorised healthcare system.

#### PHN Handling — Two Scenarios

**Scenario A: Patient Already Has a PHN**

1. **PHM Enters Existing PHN** — The PHM enters the patient's existing PHN in the dedicated "Existing PHN" field on the registration form.
2. **PHN System Returns Existing Record** — The portal fetches the demographic details stored against that PHN from the PHN system.
3. **Manual Verification** — The PHM manually compares the data from the PHN system against the verified demographics fetched from MOSIP via eSignet. Both sets of data are displayed side by side.
4. **Proceed if Details Match** — If the information matches, the PHM confirms and proceeds with the registration linked to the existing PHN. If details do not match, the PHM escalates to a supervisor before proceeding.

**Scenario B: Patient Does Not Have a PHN**

1. **PHM Completes Registration Without PHN** — The PHM leaves the PHN field blank and completes the rest of the registration form normally.
2. **New PHN Generated** — Upon submission, the system automatically generates a new Patient Health Number (PHN) and assigns it to the patient.
3. **PHN Communicated to Patient** — The newly issued PHN is displayed on the confirmation screen. The PHM communicates the PHN to the patient, who should note it down for all future health visits.

> ⚠️ **Important:** The PHN is the patient's unique identifier across all health services. Once issued, it is the key used to retrieve and link her records across any facility or health system that is connected to the FHIR Server. The patient should keep it safe and bring it to every future visit.

***

### Section 3: FHIR Server — The Shared Health Data Layer

The FHIR (Fast Healthcare Interoperability Resources) server is the central health data repository that stores every patient record created through the DHIS2 Registration Portal. It operates in the background — end users never interact with it directly — but it is what gives the registration its lasting value. The moment a patient is registered and her record is submitted in the DHIS2 portal, that record is automatically pushed to the FHIR server, where it becomes available in a structured, standards-based format to any authorised health system.

FHIR is an international standard published by HL7 for exchanging healthcare information electronically. By storing patient data in FHIR format, the registration record can be shared across hospitals, labs, insurance systems, and government platforms without requiring custom integrations for every new connection.

#### What the FHIR Server Stores After Registration

When the PHM completes and submits a patient registration in the DHIS2 portal, the following data is pushed to the FHIR server:

* **Patient demographic record** — name, date of birth, and address, as verified via eSignet and MOSIP at the point of registration.
* **Patient Health Number (PHN)** — the unique identifier that links all future records for this patient.
* **Initial clinical information** — gestational age, blood group, obstetric history, and any other health details entered by the PHM during registration.

As the patient progresses through the health system, further records — such as ANC visit notes, observations, prescriptions, and appointment schedules — will be added to her FHIR record by authorised care providers.

#### How the FHIR Server Fits into Registration

| Step in Registration                        | What is Sent to the FHIR Server                                                                                                                     |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| PHM submits the completed registration form | A new FHIR Patient resource is created containing the verified demographics (from MOSIP via eSignet) and the assigned PHN.                          |
| Clinical details are saved                  | A FHIR Observation or Encounter resource is created containing the initial clinical data entered by the PHM (gestational age, blood group, etc.).   |
| PHN is issued or linked                     | The PHN is stored as the patient's primary identifier within the FHIR resource, enabling future lookup and record linking by any authorised portal. |

#### Why the FHIR Server Matters

Without the FHIR server, each registration would be an isolated record visible only within the DHIS2 portal. The FHIR server is what transforms the registration into a shared, living health record. Any authorised system — a doctor's portal, a hospital, a health insurance platform — can retrieve the patient's data using her PHN, without needing to ask her to re-register or re-verify her identity. The data entered by the PHM at registration is the foundation of everything that follows in the patient's health journey.

Because FHIR is a global open standard, this architecture is future-proof: new health systems can be connected to the same FHIR server at any time without rebuilding the registration workflow.

> 🔗 **FHIR:** The FHIR server is not a portal or application that users log into. It is a backend service that receives data automatically when the PHM submits a registration. From the PHM's perspective, the sync is invisible — the record is simply saved and available.

***

### Section 4: MOSIP & eSignet — The Shared Identity & Authentication Layer

MOSIP and eSignet form the trusted identity backbone of the DHIS2 registration workflow. Every time an identity needs to be verified — whether a PHM logging in to the portal or a patient's identity being confirmed before registration — MOSIP and eSignet handle that verification seamlessly in the background. From the end user's perspective, it is simply a button click followed by an OTP. What happens beneath is a secure, standards-based exchange between eSignet and the national identity system.

#### MOSIP — The National Identity Platform

MOSIP (Modular Open Source Identity Platform) is the government's foundational digital identity system. It issues and manages the National ID used by every person in the ecosystem — patients and PHMs alike. MOSIP holds the authoritative record of each person's verified demographic details and the mobile number linked to their National ID, which is used when delivering OTPs during authentication.

In the context of the DHIS2 ANC registration, MOSIP provides three critical things. First, it holds the verified demographic profile — name, date of birth, and address — for every National ID holder, which eSignet fetches and returns to the registration form after successful authentication. Second, it delivers the OTP to the patient's registered mobile number at the moment identity verification is triggered. Third, through its ID Authentication (IDA) service, it validates that the OTP entered is correct and that the identity has been successfully confirmed.

MOSIP itself has no consumer-facing interface in this workflow. It operates entirely as backend infrastructure, communicating with eSignet automatically and invisibly to both the PHM and the patient.

**Key MOSIP Concepts**

| Term                         | Meaning                                                                                                                                                                                               |
| ---------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **National ID**              | The unique, government-issued identity number assigned to every registered person. Used as the authentication identifier during eSignet login and patient verification.                               |
| **IDA (ID Authentication)**  | MOSIP's authentication service. When the PHM submits an OTP on behalf of the patient, eSignet calls MOSIP IDA to validate it and confirm the identity.                                                |
| **VID (Virtual ID)**         | A temporary, revocable alias for the National ID. Can be used in place of the full National ID during eSignet authentication to protect the real ID number from exposure.                             |
| **KYC (Know Your Customer)** | The verified demographic profile returned by MOSIP to eSignet after successful authentication. This data — name, date of birth, address — is what gets auto-populated in the DHIS2 registration form. |

#### eSignet — The Authentication Solution

eSignet is MOSIP's OpenID Connect (OIDC) authentication layer. It acts as the bridge between the MOSIP identity database and any application that needs to verify a user's identity. In the DHIS2 registration workflow, eSignet is used at two distinct points: first to authenticate the PHM when she logs in to the portal, and again to verify the patient's identity before her demographics are fetched for the registration form.

Think of eSignet as the "Verify with National ID" mechanism that appears at each authentication point. It handles the entire flow — prompting for the National ID, sending the OTP to the registered mobile, displaying the consent screen, and returning the verified data — so that neither the PHM portal nor the DHIS2 system needs to handle raw identity credentials directly.

**How eSignet Works in the Registration Portal**

1. **Authentication Triggered** — Either the PHM clicks "Sign in with eSignet" (for portal login) or "Verify with National ID" (for patient verification). The eSignet page is displayed.
2. **National ID Entered** — The relevant National ID is entered — the PHM's own ID for portal login, or the patient's ID for patient verification.
3. **OTP Delivered by MOSIP** — eSignet calls MOSIP, which sends a 6-digit OTP to the mobile number registered against that National ID. The OTP is valid for a limited time, typically 3 minutes.
4. **OTP Submitted** — The OTP is entered on the eSignet page. eSignet submits it to MOSIP IDA for validation.
5. **Consent Screen Displayed** — On successful OTP validation, eSignet shows a Consent screen listing the specific data claims that will be shared (e.g., name, date of birth, address). The user reviews and clicks "Allow".
6. **Verified Data Returned** — eSignet returns an authorisation token and the consented KYC data to the portal. For patient verification, this is what auto-populates the demographics fields in the registration form.

**Authentication Methods Available**

eSignet supports multiple ways for a user to prove their identity. In the DHIS2 registration context, OTP is the primary method used for both PHM login and patient verification:

* **OTP (One-Time Password):** MOSIP sends a 6-digit OTP to the registered mobile number. The user (or PHM on behalf of the patient) enters it to confirm identity. This is the method used in the registration portal.
* **Biometrics:** Fingerprint or iris scan via a registered biometric device, used in field registration scenarios where biometric hardware is available.
* **QR Code / Inji Wallet:** The user scans a QR code on the eSignet page using the Inji mobile wallet app, which authenticates using a locally stored Verifiable Credential.

**eSignet's Role in the Registration Portal**

| Authentication Point | Who Authenticates           | What eSignet Does                                                                                                                                                                              |
| -------------------- | --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Portal Login         | PHM (Public Health Midwife) | Verifies the PHM's identity against MOSIP. Returns an access token to the portal, granting the PHM access to the DHIS2 registration dashboard.                                                 |
| Patient Verification | Patient (via PHM)           | Verifies the patient's identity against MOSIP. Returns the patient's KYC data (name, DOB, address) to pre-populate the registration form. Displays a consent screen before any data is shared. |

> 💡 **Note:** The Consent screen is a mandatory privacy control. Before any personal demographic data is shared from MOSIP with the DHIS2 portal, eSignet displays exactly what will be shared. The patient must explicitly consent — verbal confirmation to the PHM, who clicks "Allow" on her behalf — before any data is transferred.

***

### Section 5: Glossary of Key Terms

| Term               | Definition                                                                                                                                                                                                                                |
| ------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **ANC**            | Antenatal Care — healthcare provided to pregnant women during pregnancy, covering medical check-ups, monitoring, and advice from conception to delivery.                                                                                  |
| **DHIS2**          | District Health Information Software 2 — an open-source, web-based platform for health data management, deployed in over 80 countries. Powers the PHM Registration Portal in this use case.                                               |
| **PHM**            | Public Health Midwife — the healthcare worker who operates the DHIS2 Registration Portal to register pregnant mothers at the PHM centre.                                                                                                  |
| **PHN**            | Patient Health Number — the unique identifier assigned to each registered patient. Issued at registration and used to retrieve and link health records across all connected health systems.                                               |
| **MOSIP**          | Modular Open Source Identity Platform — the national identity platform that issues and manages National IDs and provides the ID Authentication service used by eSignet.                                                                   |
| **National ID**    | The unique, government-issued identity number assigned to every registered person. Used as the authentication identifier for both PHM login and patient verification via eSignet.                                                         |
| **VID**            | Virtual ID — a temporary, revocable alias for the National ID. Can be used in place of the full National ID during eSignet authentication to protect the real ID number.                                                                  |
| **eSignet**        | MOSIP's OpenID Connect-based authentication service. Used in the DHIS2 portal to verify the PHM's identity (login) and the patient's identity (registration), returning verified KYC data to pre-populate the form.                       |
| **OIDC**           | OpenID Connect — the open authentication protocol that eSignet implements, enabling secure, standardised identity verification between the DHIS2 portal and MOSIP.                                                                        |
| **OTP**            | One-Time Password — a 6-digit code sent to the user's registered mobile number by MOSIP during eSignet authentication. Valid for a limited time (typically 3 minutes).                                                                    |
| **KYC**            | Know Your Customer — the verified demographic profile (name, date of birth, address) returned by MOSIP to eSignet after successful authentication. Auto-populates the patient registration form.                                          |
| **IDA**            | ID Authentication — the MOSIP service that validates OTPs submitted via eSignet, confirming that the identity has been successfully verified.                                                                                             |
| **Consent Screen** | The page displayed by eSignet after successful OTP authentication, listing exactly which demographic data will be shared with the DHIS2 portal. The PHM clicks "Allow" on the patient's behalf after obtaining verbal consent.            |
| **FHIR**           | Fast Healthcare Interoperability Resources — an international HL7 standard for structuring and exchanging healthcare data electronically.                                                                                                 |
| **FHIR Server**    | The central backend health data repository. Patient records created in the DHIS2 portal are automatically synced here upon registration, making them available to any authorised health system using the patient's PHN as the lookup key. |

To learn more about DHIS2 please [refer here](https://dhis2.org/).
