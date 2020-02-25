## Table Of Contents
- [Registration Processor](#registration-processor-)
 - [1. ID Lifecycle Management](#1-id-lifecycle-management-) 
   * [1.1 New ID Issuance](#11-new-id-issuance-) _(RPR_FR_1.1)_
   * [1.2 Update Individual’s Information](#12-update-individuals-information-) _(RPR_FR_1.2)_
   * [1.3 De-activate Individual’s ID](#13-de-activate-individuals-id-) _(RPR_FR_1.3)_
   * [1.4 Re-activate Individual’s ID](#14-re-activate-individuals-id-) _(RPR_FR_1.4)_
   * [1.5 Find an Individual’s ID](#15-find-an-individuals-id-) _(RPR_FR_1.5)_
 - [2. Configurable Workflow](#2-configurable-workflow-) 
   * [2.1 Orchestration](#21-orchestration-) _(RPR_FR_2.1)_
   * [2.2 Retry Processing (In case of exceptions/failures)](#22-retry-processing-in-case-of-exceptionsfailures-) _(RPR_FR_2.2)_
   * [2.3 Resume Workflow](#23-resume-workflow-) _(RPR_FR_2.3)_
   * [2.4 Integration (System Integrator can integrate their system with MOSIP)](#24-integration-system-integrator-can-integrate-their-system-with-mosip-) _(RPR_FR_2.4)_
   * [2.5 Multiple Workflows](#25-multiple-workflows-) _(RPR_FR_2.6)_
   * [2.6 Scalability and Throughput](#26-scalability-and-throughput-) _(RPR_FR_2.7)_
 - [3. Types of Stages](#3-types-of-stages-) 
   * [3.1 Pre-processing Validations](#31-pre-processing-validations-) 
     * [3.1.1 Sanity Check](#311-sanity-check-) _(RPR_FR_3.1)_
     * [3.1.2 Virus Scan](#312-virus-scan-) _(RPR_FR_3.2)_
     * [3.1.3 Machine-Center Mapping](#313-machine-center-mapping-) _(RPR_FR_3.4)_
     * [3.1.4 Officer & Supervisor Validation](#314-officer--supervisor-validation-) _(RPR_FR_3.6)_
   * [3.2 Processing](#32-processing-) 
     * [3.2.1 Individual Data Validations](#321-individual-data-validations-) 
       * [3.2.1.1 Data Quality Check: Photo, Age, Gender Data Check](#3211-data-quality-check-photo-age-gender-data-check-) _(RPR_FR_3.7)_
       * [3.2.1.2 Biometrics Quality Check](#3212-biometrics-quality-check-) _(RPR_FR_3.8)_
       * [3.2.1.3 Doc. Validation - OCR](#3213-doc-validation---ocr-) _(RPR_FR_3.9)_
     * [3.2.2 Functional Validations](#322-functional-validations-) 
       * [3.2.2.1 File & Document Validation](#3221-file--document-validation-) _(RPR_FR_3.10)_
       * [3.2.2.2 Introducer Validation](#3222-introducer-validation-) _(RPR_FR_3.11)_
       * [3.2.2.3 Deduplication – Demographic, Biometrics](#3223-deduplication--demographic-biometrics-) _(RPR_FR_3.12)_
     * [3.2.3 External System Integration: (Elaborate with examples)](#323-external-system-integration-elaborate-with-examples-) 
       * [3.2.3.1 Data Verification (Pluggable by SI – Not part of MOSIP)](#3231-data-verification-pluggable-by-si--not-part-of-mosip-) _(RPR_FR_3.13)_
       * [3.2.3.2 Data Enrichment](#3232-data-enrichment-) _(RPR_FR_3.14)_
       * [3.2.3.3 Manual Verification for ext. system data update (Pluggable by SI)](#3233-manual-verification-for-ext-system-data-update-pluggable-by-si-) _(RPR_FR_3.15)_
       * [3.2.3.4 Manual Adjudication (Pluggable by SI)](#3234-manual-adjudication-pluggable-by-si-) _(RPR_FR_3.16)_
       * [3.2.3.5 ABIS Integration (Incl. ABIS Middleware)](#3235-abis-integration-incl-abis-middleware-) _(RPR_FR_3.17)_
     * [3.2.4 ID Issuance](#324-id-issuance-) 
       * [3.2.4.1 Identity Generation (Refer to UIN Generation service) – Incl. UIN Generation and UIN association](#3241-identity-generation-refer-to-uin-generation-service--incl-uin-generation-and-uin-association-) _(RPR_FR_3.18)_
       * [3.2.4.2 Store/Update ID Repository (Refer to ID-Auth)](#3242-storeupdate-id-repository-refer-to-id-auth-) _(RPR_FR_3.19)_
       * [3.2.4.3 Data Extractor for ID Authentication](#3243-data-extractor-for-id-authentication-)
     * [3.2.5 Capture Audit Trails/Analytics Data](#325-capture-audit-trailsanalytics-data-) _(RPR_FR_3.20)_
   * [3.3 Post-Processing](#33-post-processing-) 
     * [3.3.1 Notification (Pluggable by SI)](#331-notification-pluggable-by-si-) _(RPR_FR_3.21)_
     * [3.3.2 Print & Post (Pluggable by SI)](#332-print--post-pluggable-by-si-) _(RPR_FR_3.22)_
   * [3.4 Packet Processing Status](#34-packet-processing-status-) _(RPR_FR_3.23)_
* [List of Configurable Parameters and Processes](#list-of-configurable-parameters-and-processes-)
* [Registration Processor API](#registration-processor-api-)
* [Process View](#process-view-)

# Registration Processor [**[↑]**](#table-of-contents)
# 1. ID Lifecycle Management [**[↑]**](#table-of-contents)
When an individual visits a registration center to get an ID or update his/her ID details, a registration officer captures the individual’s demographic (name, date of birth, gender, etc.) and biometric (face, iris, fingerprint image) details in a Registration Client. The Registration Client packages the captured information in a secure way (in the form of encrypted packets) and sends it to Registration Processor for further processing. 

The packet received from the Registration Client goes through various sanity checks and validations to perform various life cycle events. The various life cycle events that can be processed by Registration Processor are:
1. [New ID Issuance](#11-new-id-issuance-)
1. [Update Individual’s Information](#12-update-individuals-information-) 
1. [De-activate Individual’s ID](#13-de-activate-individuals-id-) 
1. [Re-activate Individual’s ID](#14-re-activate-individuals-id-)
1. [Find an Individual’s ID](#15-find-an-individuals-id-)


## 1.1 New ID Issuance [**[↑]**](#table-of-contents)

A new ID issuance requires an individual to visit a registration center and provide the required information to register himself/herself in MOSIP for the first time.

When a registration officer captures an individual’s information, the Registration Client packages the captured information in the form of encrypted packets and sends it to Registration Processor. After the encrypted packet reaches the Registration Processor, the system tries to find a duplicate using the individual’s information (i.e. demographic and biometric information) in the system (this process is known as Deduplication). If the system does not find any duplicates of the individual’s information, then the system registers the individual and allocates a unique ID and sends his/her ID credential through the country's configured printing and postal service .

During the allocation of the Unique Identification Number (UIN), the system also allocates a Virtual Identification Number (VID) to the individual. VID is an alternative to UIN and is a temporary number that can be used for authentications of an individual. The individual can provide the VID instead of UIN to authenticate themselves and protect their UIN from being accessed by someone else. 

MOSIP generates two types of VID such as Perpetual VID and Temporary VID. 
1. **Perpetual VID**: Registration Processor will create a new perpetual VID once UIN is generated successfully.
1. **Temporary VID**: Individual can use Resident portal to generate or re-generate a new temporary VID.

Refer to [**VID Services**]( FRS-Resident-Services#11-vid-service-) in Resident Services for more details.

## 1.2 Update Individual’s Information [**[↑]**](#table-of-contents)
After an ID is created for an Individual, then he/she can choose to update his/her demographic or biometric information. The system provides two different channels by which an individual can update his/her information - by visiting a registration center and by using the resident portal.

In both the cases, the individual’s information is securely packaged and sent to Registration Processor. After all successful validations, the system updates the individual’s information and sends his/her updated ID credential through the country’s configured printing and postal service.

A country decides the channel and data attributes that can be updated for the individual. In the current implementation, 

1. An individual can update his/her demographic and biometric information when he/she visits the registration center.
1. An individual can update his/her demographic information when he/she uses the resident portal.


[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_update_packet.md)

## 1.3 De-activate individual’s ID [**[↑]**](#table-of-contents)
This feature is used to de-activate an individual’s ID. When an individual’s ID is deactivated, then he/she will not be able to authenticate himself/herself by using UIN or VID.

If a country wants to deactivate an individual’s ID due to any specific reason, the system deactivates the individual’s ID after certain validations are performed in Registration Processor.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_activate_deactivate_uin.md)
## 1.4 Re-activate individual’s ID [**[↑]**](#table-of-contents)
This feature is used to re-activate an individual’s deactivated ID. When the individual is re-activated then he/she will be able to authenticate himself/herself by using UIN or VID.

If a country wants to reactivate an individual’s deactivated ID due to any specific reason, the system reactivates the individual’s deactivated ID after certain validations are performed in Registration Processor.


[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_activate_deactivate_uin.md)

## 1.5 Find an Individual’s ID [**[↑]**](#table-of-contents)
When an individual forgets their ID information he/she can find it by providing their biometric information in the Registration Center. Registration processor then uses the captured biometrics to find the individual’s ID and sends his/her ID credential to their registered address through the country's configured printing and postal service.


# 2. Configurable Workflow [**[↑]**](#table-of-contents)
## 2.1 Orchestration [**[↑]**](#table-of-contents)

Orchestration is the process of configuring various independent services, which will coordinate and manage to achieve a business goal.

In Registration Processor, there are various independent stages (such as Packet Receiver Stage, Packet Validator Stage, Operator Supervisor and Introducer Validator Stage, Demographic Deduplication Stage, Biometric Deduplication Stage, UIN Allocator Stage, Notification Stage, Printing and Postal Stage, etc.), which will perform their own set of validations or operations. 

These all stages are connected to each other using a workflow manager to perform various ID lifecycles events for an individual. 

Please refer to [**Git**](/mosip/mosip-platform/blob/master/design/registration-processor/orchestration_workflow.md) to understand how Orchestration is done in MOSIP.

[**Link to design for HTTP Integration Stage**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_http_integration.md)

[**Link to design for External System Integration Stage**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_external_system_integration.md)

## 2.2 Retry Processing (In case of exceptions/failures) [**[↑]**](#table-of-contents)

When multiple systems interact with each other, there might be a communication issues due to a network lag. Registration Processor interacts with multiple external systems (Printing and Postal Service Provider, ABIS system, Country’s External ID Systems). Hence, there is high probability of having network failures between the two systems. 

Instead of failing to process the packets because of such network issues, Registration Processor provides a feature to retry connecting with the external system after a second or two for a certain number of times (which is configurable).


## 2.3 Resume Workflow [**[↑]**](#table-of-contents)
MOSIP system has the capability to recover and continue packet processing if any incident happens which stops processing of some of the packets. These incidents can be: an external/internal stage is not responding, database connection is lost, dependent packets have not been processed, etc.

In case of such incidents, the system have a mechanism in place which identifies any packets that are stuck at a particular stage for a long period of time and resume processing at a configured time.

Please refer to [**Git**](/mosip/mosip-platform/blob/master/design/registration-processor/orchestration_workflow.md) to understand orchestration workflow in MOSIP.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_reprocess.md)

## 2.4 Integration (System Integrator can integrate their system with MOSIP) [**[↑]**](#table-of-contents)
Packet processing is divided broadly into three sections such as pre-processing, processing and post processing. Each section has a set of stages which are orchestrated together to create workflow. System integrator can customize workflow by adding or by removing stages.

If a country wants to integrate MOSIP with their system to share information to/from MOSIP then MOSIP has provision for system integrator to plugin external system to pull or push data very easily with some customization in the workflow.

Registration processor architecture gives flexibility to customize the workflow to plug-in additional stages and exclude existing stages as per the business need.

Please refer to [**Git**](/mosip/mosip-platform/blob/master/design/registration-processor/External_System_Integration_Guide.md) for more details in external system integration guide.

[**Link to design for HTTP Integration Stage**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_http_integration.md)

[**Link to design for External System Integration Stage**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_external_system_integration.md)


## 2.5 Multiple Workflows [**[↑]**](#table-of-contents)

An ID goes through various lifecycles (ID Issuance, Update of ID information, Activating or Deactivating an ID) and each lifecycle has its own set of stages to achieve the end goal. 

These stages are glued together to form a workflow. Hence, based on the ID lifecycle, Registration Processor has multiple workflows.

Having multiple workflow increase reusability of stages, readability of workflow configured for each event and maintainability of each workflow which also involve customizing workflow based on the country’s need.


[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_update_packet.md)

## 2.6 Scalability and Throughput [**[↑]**](#table-of-contents)
MOSIP is scalable so that it can handle any kind of processing load or request in the future without disturbing the base architecture. MOSIP infrastructure can handle additional processing request based on the requirement of a country. The architecture is designed in such a way that it is flexible to support scalability and holds the request until the end goal is achieved.

[**Link to Non-Functional Requirements**](MOSIP-Non-Functional-Requirements)

# 3. Types of Stages [**[↑]**](#table-of-contents)
## 3.1 Pre-processing Validations [**[↑]**](#table-of-contents)
### 3.1.1 Sanity Check [**[↑]**](#table-of-contents)
When Registration Processor receives a packet, the system performs various sanity checks on the packet, such as:

1. **Authentication of the Request** - The system validates if the request is coming from a verified source.
1. **Virus Scan** - The system performs in-memory virus scan of the packet received.
1. **Packet Integrity Check** - The system validates if the packet received was not tampered during transit by performing check sum validation.
1. **Packet Size Check** - The system validates if the packet received was not tampered during transit by validating the size of the packet.
1. **Packet Format Check** - The system validates if the packet format is per the configured format.
1. **Duplicate Check** - The system validates if the request received is not a duplicate request.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_packet_validator.md)

### 3.1.2 Virus Scan [**[↑]**](#table-of-contents)
Virus Scanning is an important process, which helps to detect and move the virus infected packets to the quarantine zone. With a good virus scanner integrated in MOSIP will prevent virus interference.

Whenever virus scanning is performed in Registration Processor, the encrypted packets are first scanned and then the packets are decrypted in-memory and scanned.

Virus scanning is performed twice in Registration Processor:
1. When a packet is received by Registration Processor.
1. When Registration Processor stores the packet in its internal secure file system.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_virus_scanner.md)

### 3.1.3 Machine-Center Mapping [**[↑]**](#table-of-contents)
When a packet is created in Registration Client, the packet will be created using a registered machine, devices, registration officer, registration supervisor, and registration center.

To make sure that the packets are created as per the defined rules, the system performs the following validations:
1. Registration Center must be active when the packet was created.
1. User (registration officer/registration supervisor) must be active when the packet was created.
1. Machine and devices, in which packet was created must be active when the packet was created.
1. User, machine and center must be mapped when the packet was created.
1. Packet must be created in working days and not in holidays.
1. The GPS must be captured when a packet is created.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_OSI_validation.md)

### 3.1.4 Officer & Supervisor Validation [**[↑]**](#table-of-contents)

When a packet is created in Registration Client, the officer or supervisor will authenticate himself/herself and the same is captured in the packet. There are three modes by which an officer or supervisor can authenticate himself/herself, which are listed below:
1. Biometric Authentication
1. Password Based Authentication
1. OTP Based Authentication

In case of Biometric Authentication, Registration Processor authenticates the Officer/Supervisor again after receiving the packet from the Registration Client.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_OSI_validation.md)
## 3.2 Processing [**[↑]**](#table-of-contents)
### 3.2.1 Individual Data Validations [**[↑]**](#table-of-contents)
#### 3.2.1.1 Data Quality Check: Photo, Age, Gender Data Check [**[↑]**](#table-of-contents)
The system provides a feature to integrate with an SDK to identify and validate the age and gender captured by the registration officer against the photo of the resident. 

This validation helps system to identify the mistake, that are performed by the registration officer. 

**WIP - This is factored for future releases and is not part of current implementation.**
 

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_packet_receiver_stage.md)
#### 3.2.1.2 Biometrics Quality Check [**[↑]**](#table-of-contents)
The biometrics captured (Face, Fingerprint or Iris) for an individual is used to authenticate the individual. If the quality of the biometric image captured during registration were low, then authentication for the individual using biometrics will not be accurate.

Hence, the system provides a feature to integrate with an SDK to validate if the quality of biometrics captured of an individual is above the configured threshold. If the quality of the biometric captured is lower than the threshold configured, then Registration Processor does not allow ID generation for the individual.

#### 3.2.1.3 Doc. Validation - OCR [**[↑]**](#table-of-contents)
When an individual visits the Registration Center to get an ID or update his/her information, the officer manually enters various demographic information for the individual, which might cause a human error. To avoid such issues, the system provides the feature to integrate with an SDK, which validates the fields that are manually entered against the corresponding documents.

**WIP - This is factored for future releases and is not part of current implementation.**


[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_packet_validator.md)
### 3.2.2 Functional Validations [**[↑]**](#table-of-contents)
#### 3.2.2.1 File & Document Validation [**[↑]**](#table-of-contents)

When the Registration Packets are received from Registration Client, the system checks if all the files listed in the packet are available. If available, the system verifies if the documents required for an individual are present in the packet as per the data captured. In order to perform this validation, the mapping of the data captured and mandatory document required can be configured by the country.
 
For Example:
1. If name is captured, the country can add a validation for Proof of Identity.
2. If address is captured, the country can add a validation for Proof of Address.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_packet_validator.md)

#### 3.2.2.2 Introducer Validation [**[↑]**](#table-of-contents)

An Introducer in MOSIP is one who introduces someone attempting to register without any valid document or proof of identity. In the current implementation, in the context of Minor's registration Introducer is the Parent or Guardian of the minor (child) who approaches the center for registration. 

A minor is not mature enough to provide biometrics (like Finger Prints or Iris) as they are under developed during the time of registration, hence, the Parent or Guardian acts as the Introducer to register the minor in MOSIP.

When a minor is registered, the Registration Client mandates the capture of the ID and biometrics of the Parent or Guardian, which is used for authenticating the Parent or Guardian in Registration Processor.

To support the Principle of Inclusion, an Introducer can be any individual whose biometrics are registered in MOSIP.


[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_OSI_validation.md)

#### 3.2.2.3 Deduplication – Demographic, Biometrics [**[↑]**](#table-of-contents)
Deduplication is the process to find a duplicate by comparing the individual’s details (biometric and demographic data) with the data stored in the system.
#### A. Demographic deduplication [**[↑]**](#table-of-contents)

1. The system compares the demographic details (name, gender, and date of birth) of the individual with the data available in the system to find a potential match.
2. If a potential match is found, then the system sends the packet to [**Automated Biometric Identification System**](Automated-Biometric-Identification-System-(ABIS)-Interface) to perform 1:1 biometric match (it is an additional check to confirm that it is a duplicate).
3. If a potential match is not found in [**Automated Biometric Identification System**](Automated-Biometric-Identification-System-(ABIS)-Interface) or Demographic deduplication, then system sends the packet to perform biometric deduplication.
#### B. Biometric deduplication [**[↑]**](#table-of-contents)
1. The system performs Biometric deduplication (1:N, where N indicates the whole set of biometric available in the system) by sending the data to [**Automated Biometric Identification System**](Automated-Biometric-Identification-System-(ABIS)-Interface).
2. [**Automated Biometric Identification System**](Automated-Biometric-Identification-System-(ABIS)-Interface) compares the biometric data received with the whole set of the data to find a potential match based on a configured threshold.
3. If a potential match is found in [**Automated Biometric Identification System**](Automated-Biometric-Identification-System-(ABIS)-Interface), then the system sends the packet for manual verification.
4. If a manual verifier (experts who know more about biometrics) finds a duplicate, then the system rejects the packet.
5. If the manual verifier or [**Automated Biometric Identification System**](Automated-Biometric-Identification-System-(ABIS)-Interface) does not find the duplicate, then the system sends the packet for UIN generation.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_demo_dedupe.md)

### 3.2.3 External System Integration: (Elaborate with examples) [**[↑]**](#table-of-contents)
#### 3.2.3.1 Data Verification (Pluggable by SI – Not part of MOSIP) [**[↑]**](#table-of-contents)

Data verification is a process in which the system can verify the data captured during a registration with the data received from an external system to ensure accuracy and consistency. It helps to determine whether data was accurately translated, is complete and supports the interoperability standards.

The System Integrator can plug-in a stage in the workflow, where the stage can communicate with any external system to receive some information and validate it with the information captured at the Registration Center.

[**Link to design for External System Integration Stage**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_external_system_integration.md)

[**Link to design for HTTP Integration Stage**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_http_integration.md)

**WIP - This is factored for future releases and is not part of current implementation.**


#### 3.2.3.2 Data Enrichment [**[↑]**](#table-of-contents)

Data enrichment is a value adding process, where external data from multiple sources is added to the existing data sets in MOSIP to enhance the quality and richness of the data.
MOSIP receives some data from the external system in the form of Packet (as per MOSIP Standards). The System has the capability to receive this updated packet from external sources and process it with the packet received from Registration Client.

**WIP - This is factored for future releases and is not part of current implementation.**


#### 3.2.3.3 Manual Verification for ext. system data update (Pluggable by SI) [**[↑]**](#table-of-contents)

When there are any discrepancies between the data received from external system vs. the data captured during registration, a country may opt to manually verify the data. 
The System Integrator in such case may build a Manual Verification Module for External System data mismatch. MOSIP will enable the system integrator to integrate the manual verification system with MOSIP platform.

**WIP - This is factored for future releases and is not part of current implementation.**


[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_manual_adjudication.md)

#### 3.2.3.4 Manual Adjudication (Pluggable by SI) [**[↑]**](#table-of-contents)

When Biometric Deduplicates are found in [**Automated Biometric Identification System**](Automated-Biometric-Identification-System-(ABIS)-Interface), the System Integrator can plug-in the Manual Adjudication Stage, which would send the biometric and demographic data of the duplicates to a Manual Adjudicator. The Manual Adjudicator now can perform various validations on the duplicate data and inform the MOSIP system if the two records are duplicates or not.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_manual_adjudication.md)
#### 3.2.3.5 ABIS Integration (Incl. ABIS Middleware) [**[↑]**](#table-of-contents)

The MOSIP System, in-order to perform Biometric Deduplication (validate if there are no biometric duplicates in system), integrates with an ABIS system ([**Automated Biometric Identification System**](Automated-Biometric-Identification-System-(ABIS)-Interface)). 

ABIS Middleware, which is designed by MOSIP and MOSIP Middleware, designed by [**Automated Biometric Identification System**](Automated-Biometric-Identification-System-(ABIS)-Interface) is used to communicate between MOSIP system and ABIS.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_ABIS_Integration.md)

### 3.2.4 ID Issuance [**[↑]**](#table-of-contents)
#### 3.2.4.1 Identity Generation (Refer to UIN Generation service) – Incl. UIN Generation and UIN association [**[↑]**](#table-of-contents)

After all the business validations are completed, the system gets a Unique Identification Number (UIN) from the [**UIN Generation**](UIN-Generation) API and allocates the UIN by sending the new UIN number and the individual's information to [**ID repository**](ID-Repository-API).

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_uin_generator.md)
#### 3.2.4.2 Store/Update ID Repository (Refer to ID-Auth) [**[↑]**](#table-of-contents)

After all the business validations are performed for a new ID issuance or updating an individual’s information, this information is sent to [**ID repository**](ID-Repository-API) for storing or updating the information respectively. 

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_uin_generator.md) 
#### 3.2.4.3 Data Extractor for ID Authentication [**[↑]**](#table-of-contents)

The system that extracts the latest copy of an individual’s data after the Individual has registered in MOSIP or has updated their data in MOSIP and sends it to ID Authentication. Now, ID Authentication can use the latest copy of the Individual’s data for Authentication.         

**WIP - This is factored for future releases and is not part of current implementation.**


### 3.2.5 Capture Audit Trails/Analytics Data [**[↑]**](#table-of-contents)

When any transaction is performed in MOSIP system or the packet fails any validations or any system level exception happens, then the same is captured as part of MOSIP Audit Trails, which can be further used for Reporting/Analytics as required.

## 3.3 Post-Processing [**[↑]**](#table-of-contents)
### 3.3.1 Notification (Pluggable by SI) [**[↑]**](#table-of-contents)

Notification (SMS/Email as configured), which is received by an individual is the final step of all the life cycle processes. System sends a notification to the individual for various life cycle scenarios such as, successful or un-successful issuance of UIN, update of UIN data, activate or deactivate UIN, finding a lost UIN, etc. using kernel [**Template Merger**](FRS-Common-Services#45-template-merger-) and [**Notification Manager**](FRS-Common-Services#4-notification-).

### 3.3.2 Print & Post (Pluggable by SI) [**[↑]**](#table-of-contents)

When an individual’s ID is created or an individual’s data is updated, the system sends the individual’s physical ID credential to the individual’s registered address. 

This feature is the post processing integration point for Registration Processor, where a country can generate the PDF of the individual’s ID and sends it to the country’s configured printing and postal service provider. The printing and postal service provider in turn would print the physical ID credential and deliver it to the individual’s registered address.

[**Link to design**](/mosip/mosip-platform/blob/master/design/registration-processor/Approach_for_printing_stage.md)

### 3.4 Packet Processing Status [**[↑]**](#table-of-contents)

After the Registration Client sends the packet to Registration Processor, it starts processing the packet. Registration Processor enables the Registration Client to know the processing status of such packet\s. The probable packet statuses are as follows:
1. PROCESSING – The packet is under processing.
1. PROCESSED – The packet has been processed and Registration Client deletes the packet from its storage location.
1. RESEND – Initial validation like virus scan and packet integrity check have failed for the packet for a configured number of times and Registration Client needs to resend the packet for processing.
1. RE-REGISTER – The packet has failed a business validation like center-machine check, supervisor and officer validation, etc., due to which the system will not be able to process the packet. The registration officer will intimate the individual to come back to the center and re-register, post which registration client can delete the packet from its storage location.
1. REJECTED – A duplicate packet was found against the individual’s biometrics. As processing of the packet is completed, Registration Client can delete the packet from it storage location.

### List of Configurable Parameters and Processes [**[↑]**](#table-of-contents)

1. Configurable Parameters

   [**Link to Configurable Parameters of Registration Processor**](/mosip/mosip-config/blob/master/config/registration-processor.properties)

2. Configurable Processes 
* (Work in Progress) 
### Registration Processor API [**[↑]**](#table-of-contents)
[**Please refer to Wiki for more details on the Registration Processor API**](Registration-Processor-APIs).

### Process View [**[↑]**](#table-of-contents)
[**Link to Process View of Registration processor**](Process-view#3-registration-processor-)
