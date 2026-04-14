# DHIS2

<mark style="color:$danger;">In Progress - Coming Soon!</mark>

## Overview

This document outlines the integration of eSignet (a digital identity verification system) with DHIS2 healthcare portals to streamline maternal health record management across three user-facing applications.

**eSignet's Role**: eSignet serves as the primary identity verification and authentication backbone, enabling secure National ID-based authentication across all portals. It verifies patient identity, fetches verified demographic details from the identity system, and manages user consent for data access—ensuring that every interaction within the healthcare ecosystem is tied to a verified identity.

The system uses this verified identity approach to ensure secure, verified access to patient information while preventing duplicates through PHN (Patient Health Number) validation. Data flows between DHIS2, eSignet, PHN systems, and FHIR servers to create an interoperable healthcare ecosystem that reduces manual errors and improves accessibility for patients, midwives, and doctors.

### Purpose

The purpose of this collaboration/engagement is to demonstrate how digital identity verification using eSignet can be integrated into healthcare workflows to streamline the registration, access, and management of maternal health records.

This approach enables secure and verified access to patient information across multiple systems while ensuring that patient identity is consistently validated at each interaction point within the healthcare ecosystem.

### Use Case Overview

This use case outlines an end-to-end **ANC (Ante Natal Care)** patient journey, integrating identity verification with healthcare systems using eSignet.

The solution is implemented across three distinct portals, each serving a specific role in the patient lifecycle:

* **PHM (Public Health Midwife)-Assisted DHIS2 Registration Portal**: For initial patient registration and new PHN issuance
* **Doctor-Assisted VOG Portal**: For accessing and updating patient medical records
* **Self-Service Health Portal**: For patients to view their own medical records and appointments

Across all portals, eSignet-based authentication using National ID is used to ensure secure access and accurate identification of the patient.

The system also integrates with backend systems such as:

* **PHN (Patient Health Number)** system for patient identification
* **FHIR (Fast Healthcare Interoperability Resources) server** for storing and exchanging health data

## Portal Workflows and User Journeys

### 1. PHM-Assisted DHIS2 Registration Portal

**Purpose**:
To register the pregnant mother in the health registry system and issue a Patient Health Number (PHN).

**User Journey**:

* The pregnant mother visits the PHM center.
* The Public Health Midwife (PHM) accesses the DHIS2 Registration Portal and logs in using National ID.
* The PHM initiates the registration process by selecting the **New Registration** option.

**Identity Verification using eSignet**:

* The PHM enters the patient’s National ID.
* eSignet triggers an OTP to the mobile number linked with the National ID.
* The patient provides the OTP and is authenticated successfully.
* The PHM obtains explicit consent from the patient and submits it on her behalf.

**Fetch userinfo**:

* Upon successful authentication, demographic details of patient such as **name, date of birth, and address** are fetched from the identity system **via eSignet** and auto-populated in the registration form.
* The PHM completes the remaining health-related information manually and submits the form.

**PHN Handling**:

* **If the patient already has a PHN**:
  * The patient registration form includes a field for **Existing PHN**.
  * If the patient has a PHN, the Public Health Midwife (PHM) enters it in this field to fetch demographic details from the PHN system.
  * The PHM then performs a **manual verification** by comparing the data retrieved from the PHN system with the demographic details obtained from the National ID system via eSignet.
  * If the information matches, the PHM proceeds with the registration.
* **If the patient does not have a PHN**:
  * The PHM completes the registration.
  * A new PHN is generated and assigned to the patient.
* The captured data is then pushed to the FHIR server.

### 2. Doctor-Assisted VOG Portal

**Purpose**:
To allow doctors to access and review patient medical history for diagnosis and treatment.

**User Journey**:

* The pregnant mother visits the maternal health (MH) center.
* The doctor logs into the VOG portal using their National ID.
* The doctor initiates a search by entering the patient’s PHN and selects **Search Record**.
* The patient’s health records are fetched from the FHIR server and become accessible to the doctor
* The doctor reviews the medical history, updates relevant information, and provides treatment.
* All updates made by the doctor are pushed to the FHIR server.

#### 3. Self-Service Health Portal

**Purpose**:
To enable patients to access their own ANC records and upcoming appointments.

**User Journey**:

* The pregnant mother accesses the DHIS2 Self-Service Health Portal.

**Identity Verification using eSignet**:

* The patient enters her National ID.
* An OTP is sent to the registered mobile number.
* The patient enters the OTP and is authenticated successfully.

**Post Authentication**:

* The portal displays:
  * Patient medical records
  * ANC visit history
  * Upcoming appointments

## How is eSignet Integrated
* eSignet is integrated as the primary authentication mechanism across all three portals.
* It is used to verify the patient’s identity using their National ID and to fetch demographic details from the identity system.
* eSignet also manages user consent for data access and sharing across systems.

## Benefits

* **Secure Identity Verification**: Ensures that all access to health records is tied to a verified National ID.
* **Improved Data Accuracy**: Reduces manual data entry errors through auto-population from the identity system.
* **Streamlined Patient Journey**: Enables seamless transitions across registration, treatment, and self-service access.
* **Interoperability**: Integration with FHIR server allows standardized data exchange across systems.
* **Reduced Duplication**: PHN verification prevents duplicate patient records.
* **Enhanced Accessibility**: Patients can access their health data independently through the self-service portal.

## High-Level Architecture

Refer to a [comprehensive article](https://developers.dhis2.org/blog/2026/02/mosip-integration-demo/) detailing the architecture outlining this integration. This article illustrates the overall system architecture, including:

* Integration between DHIS2 portals and eSignet
* Interaction with the identity system
* Data flow to and from the PHN system
* Storage and exchange of health records via the FHIR server

## Demo Recording

A recording of the demonstration conducted for this use case is available below:

{% embed url="https://www.youtube.com/watch?v=2KTFUAhd6LI" %}

### Abbreviations

| Abbreviation | Full Form                                  |
| ------------ | ------------------------------------------ |
| ANC          | Ante Natal Care                            |
| FHIR         | Fast Healthcare Interoperability Resources |
| MH           | Maternal Health                            |
| NeHR         | National e-Health Registry                 |
| PHM          | Public Health Midwife                      |
| PHN          | Patient Health Number                      |

