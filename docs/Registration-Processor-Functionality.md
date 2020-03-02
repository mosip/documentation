# ID Lifecycle Management 
When an individual visits a registration center to get an ID or update his/her ID details, a registration officer captures the individual’s demographic (name, date of birth, gender, etc.) and biometric (face, iris, fingerprint image) details in a Registration Client. The Registration Client packages the captured information in a secure way (in the form of encrypted packets) and sends it to Registration Processor for further processing. 

The packet received from the Registration Client goes through various sanity checks and validations to perform various life cycle events. The various life cycle events that can be processed by Registration Processor are:
1. New ID Issuance
1. Update individual’s Information
1. De-activate individual’s ID
1. Re-activate individual’s ID
1. Find an individual’s ID

## New ID issuance 

A new ID issuance requires an individual to visit a registration center and provide the required information to register himself/herself in MOSIP for the first time.

When a registration officer captures an individual’s information, the Registration Client packages the captured information in the form of encrypted packets and sends it to Registration Processor. After the encrypted packet reaches the Registration Processor, the system tries to find a duplicate using the individual’s information (i.e. demographic and biometric information) in the system (this process is known as Deduplication). If the system does not find any duplicates of the individual’s information, then the system registers the individual and allocates a unique ID and sends his/her ID credential through the country's configured printing and postal service .

During the allocation of the Unique Identification Number (UIN), the system also allocates a Virtual Identification Number (VID) to the individual. VID is an alternative to UIN and is a temporary number that can be used for authentications of an individual. The individual can provide the VID instead of UIN to authenticate themselves and protect their UIN from being accessed by someone else. 

MOSIP generates two types of VID such as Perpetual VID and Temporary VID. 
1. Perpetual VID: Registration Processor will create a new perpetual VID once UIN is generated successfully.
1. Temporary VID: individual can use Resident portal to generate or re-generate a new temporary VID.

## Update individual’s information 
After an ID is created for an individual, then he/she can choose to update his/her demographic or biometric information. The system provides two different channels by which an individual can update his/her information - by visiting a registration center and by using the resident portal.

In both the cases, the individual’s information is securely packaged and sent to Registration Processor. After all successful validations, the system updates the individual’s information and sends his/her updated ID credential through the country’s configured printing and postal service.

A country decides the channel and data attributes that can be updated for the individual. In the current implementation, 

1. An individual can update his/her demographic and biometric information when he/she visits the registration center.
1. An individual can update his/her demographic information when he/she uses the resident portal.

## De-activate individual’s ID 
This feature is used to de-activate an individual’s ID. When an individual’s ID is deactivated, then he/she will not be able to authenticate himself/herself by using UIN or VID.

If a country wants to deactivate an individual’s ID due to any specific reason, the system deactivates the individual’s ID after certain validations are performed in Registration Processor.

##  Re-activate individual’s ID 
This feature is used to re-activate an individual’s deactivated ID. When the individual is re-activated then he/she will be able to authenticate himself/herself by using UIN or VID.

If a country wants to reactivate an individual’s deactivated ID due to any specific reason, the system reactivates the individual’s deactivated ID after certain validations are performed in Registration Processor.

## Find an individual’s ID 
When an individual forgets their ID information he/she can find it by providing their biometric information in the Registration Center. Registration processor then uses the captured biometrics to find the individual’s ID and sends his/her ID credential to their registered address through the country's configured printing and postal service.


# Configurable workflow 
## Orchestration 

Orchestration is the process of configuring various independent services, which will coordinate and manage to achieve a business goal.

In Registration Processor, there are various independent stages (such as Packet Receiver Stage, Packet Validator Stage, Operator Supervisor and Introducer Validator Stage, Demographic Deduplication Stage, Biometric Deduplication Stage, UIN Allocator Stage, Notification Stage, Printing and Postal Stage, etc.), which will perform their own set of validations or operations. 

These all stages are connected to each other using a workflow manager to perform various ID lifecycles events for an individual. 

## Retry processing (in case of exceptions/failures) 
When multiple systems interact with each other, there might be a communication issues due to a network lag. Registration Processor interacts with multiple external systems (Printing and Postal Service Provider, ABIS system, country’s external ID systems). Hence, there is high probability of having network failures between the two systems. 

Instead of failing to process the packets because of such network issues, Registration Processor provides a feature to retry connecting with the external system after a second or two for a certain number of times (which is configurable).


## Resume workflow 
MOSIP system has the capability to recover and continue packet processing if any incident happens which stops processing of some of the packets. These incidents can be: an external/internal stage is not responding, database connection is lost, dependent packets have not been processed, etc.

In case of such incidents, the system have a mechanism in place which identifies any packets that are stuck at a particular stage for a long period of time and resume processing at a configured time.

## Integration 
Packet processing is divided broadly into three sections such as pre-processing, processing and post processing. Each section has a set of stages which are orchestrated together to create workflow. A System Integrator can customize workflow by adding or by removing stages.

If a country wants to integrate MOSIP with their system to share information to/from MOSIP then MOSIP has provision for system integrator to plugin external system to pull or push data very easily with some customization in the workflow.

Registration processor architecture gives flexibility to customize the workflow to plug-in additional stages and exclude existing stages as per the business need.

## Multiple workflows 
An ID goes through various lifecycles (ID issuance, update of ID information, activating or deactivating an ID) and each lifecycle has its own set of stages to achieve the end goal. 

These stages are glued together to form a workflow. Hence, based on the ID lifecycle, Registration Processor has multiple workflows.

Having multiple workflow increase reusability of stages, readability of workflow configured for each event and maintainability of each workflow which also involve customizing workflow based on the country’s need.

## Scalability and throughput 
MOSIP is scalable so that it can handle any kind of processing load or request in the future without disturbing the base architecture. MOSIP infrastructure can handle additional processing request based on the requirement of a country. The architecture is designed in such a way that it is flexible to support scalability and holds the request until the end goal is achieved.

#  Processing of packet
## Pre-processing validations 
###  Sanity check 
When Registration Processor receives a packet, the system performs various sanity checks on the packet, such as:

1. Authentication of the request: If the request is coming from a verified source.
1. Virus scan: In-memory virus scan of the packet received.
1. Packet integrity check: If the packet received was not tampered during transit by performing checksum validation.
1. Packet size check: If the packet received was not tampered during transit by validating the size of the packet.
1. Packet format check: If the packet format is per the configured format.
1. Duplicate check: If the request received is not a duplicate request.

### Virus scan 
Virus Scanning is an important process, which helps to detect and move the virus infected packets to the quarantine zone. With a good virus scanner integrated in MOSIP will prevent virus interference.

Whenever virus scanning is performed in Registration Processor, the encrypted packets are first scanned and then the packets are decrypted in-memory and scanned.

Virus scanning is performed twice in Registration Processor:
1. When a packet is received by Registration Processor.
1. When Registration Processor stores the packet in its internal secure file system.

### Machine-Center mapping 
When a packet is created in Registration Client, the packet will be created using a registered machine, devices, registration officer, registration supervisor, and registration center.

To make sure that the packets are created as per the defined rules, the system performs the following validations:
1. Registration Center must be active when the packet was created.
1. User (registration officer/registration supervisor) must be active when the packet was created.
1. Machine and devices, in which packet was created must be active when the packet was created.
1. User, machine and center must be mapped when the packet was created.
1. Packet must be created in working days and not in holidays.
1. The GPS must be captured when a packet is created.

### Officer & supervisor validation 
When a packet is created in Registration Client, the officer or supervisor will authenticate himself/herself and the same is captured in the packet. There are three modes by which an officer or supervisor can authenticate himself/herself, which are listed below:
1. Biometric authentication
1. Password based authentication
1. OTP based authentication

In case of biometric authentication, Registration Processor authenticates the officer/supervisor again after receiving the packet from the Registration Client.

## Processing 
###  Individual's data validations* 
#### Data quality check
The system provides a feature to integrate with an SDK to identify and validate the age and gender captured by the registration officer against the photo of the resident. 

This validation helps system to identify the mistake, that are performed by the registration officer. 

_*This is factored for future releases and is not part of current implementation_
 
#### Biometrics quality check 
The biometrics captured (face, fingerprint or iris) for an individual is used to authenticate the individual. If the quality of the biometric image captured during registration were low, then authentication for the individual using biometrics will not be accurate.

Hence, the system provides a feature to integrate with an SDK to validate if the quality of biometrics captured of an individual is above the configured threshold. If the quality of the biometric captured is lower than the threshold configured, then Registration Processor does not allow ID generation for the individual.

#### Doc validation - OCR* 
When an individual visits the Registration Center to get an ID or update his/her information, the officer manually enters various demographic information for the individual, which might cause a human error. To avoid such issues, the system provides the feature to integrate with an SDK, which validates the fields that are manually entered against the corresponding documents.

_*This is factored for future releases and is not part of current implementation._

###  Functional validations 
####  File & document validation 

When the Registration Packets are received from Registration Client, the system checks if all the files listed in the packet are available. If available, the system verifies if the documents required for an individual are present in the packet as per the data captured. In order to perform this validation, the mapping of the data captured and mandatory document required can be configured by the country.
 
For Example:
1. If name is captured, the country can add a validation for Proof of Identity.
1. If address is captured, the country can add a validation for Proof of Address.

#### Introducer validation 
An Introducer in MOSIP is one who introduces someone attempting to register without any valid document or proof of identity. In the current implementation, in the context of Minor's registration Introducer is the parent or guardian of the minor (child) who approaches the center for registration. 

A minor is not mature enough to provide biometrics (like fingerprints or iris) as they are under developed during the time of registration, hence, the parent or guardian acts as the Introducer to register the minor in MOSIP.

When a minor is registered, the Registration Client mandates the capture of the ID and biometrics of the parent or guardian, which is used for authenticating the parent or guardian in Registration Processor.

To support the Principle of Inclusion, an Introducer can be any individual whose biometrics are registered in MOSIP.

#### Deduplication – demographic, biometrics 
Deduplication is the process to find a duplicate by comparing the individual’s details (biometric and demographic data) with the data stored in the system.
* Demographic deduplication 
    1. The system compares the demographic details (name, gender, and date of birth) of the individual with the data available in the system to find a potential match.
    1. If a potential match is found, then the system sends the packet to [ABIS](Automated-Biometric-Identification-System-(ABIS)) to perform 1:1 biometric match (it is an additional check to confirm that it is a duplicate).
    1. If a potential match is not found in ABIS or demographic deduplication, then system sends the packet to perform biometric deduplication.

* Biometric deduplication 
1. The system performs biometric deduplication (1:N, where N indicates the whole set of biometric available in the system) by sending the data to ABIS 
1.  ABIS compares the biometric data received with the whole set of the data to find a potential match based on a configured threshold.
1. If a potential match is found in the ABIS, then the system sends the packet for manual verification.
1. If a manual verifier (experts who know more about biometrics) finds a duplicate, then the system rejects the packet.
1. If the manual verifier or ABIS does not find a duplicate, then the system sends the packet for UIN generation.

###  External system integration 
_All the below functions can be plugged in by a System Integrator into MOSIP system.  MOSIP provides interfaces for integration._

####  Data verification 

Data verification is a process in which the system can verify the data captured during a registration with the data received from an external system to ensure accuracy and consistency. It helps to determine whether data was accurately translated, is complete and supports the interoperability standards.

The System Integrator can plug-in a stage in the workflow, where the stage can communicate with any external system to receive some information and validate it with the information captured at the Registration Center.


#### Data enrichment 
Data enrichment is a value adding process, where external data from multiple sources is added to the existing data sets in MOSIP to enhance the quality and richness of the data.  MOSIP receives some data from the external system in the form of Packet (as per MOSIP Standards). The system has the capability to receive this updated packet from external sources and process it with the packet received from Registration Client.

#### Manual verification for external system data update 
When there are any discrepancies between the data received from external system vs. the data captured during registration, a country may opt to manually verify the data.  The System Integrator in such case may build a Manual Verification Module for external system data mismatch. 

#### Manual adjudication 
When biometric deduplicates are found in ABIS, the System Integrator can plug-in the Manual Adjudication Stage, which would send the biometric and demographic data of the duplicates to a Manual Adjudicator. The Manual Adjudicator now can perform various validations on the duplicate data and inform the MOSIP system if the two records are duplicates or not.

#### ABIS integration 
The MOSIP System, in-order to perform biometric deduplication (validate if there are no biometric duplicates in system), integrates with an ABIS.

ABIS Middleware which is designed by MOSIP and MOSIP Middleware designed by ABIS is used to communicate between MOSIP system and ABIS.

###  ID issuance 
####  Identity generation - UIN generation and association

After all the business validations are completed, the system gets a Unique Identification Number (UIN) from the UIN generation API and allocates the UIN by sending the new UIN number and the individual's information to ID Repository. 

#### Store/update ID Repository 

After all the business validations are performed for a new ID issuance or updating an individual’s information, this information is sent to ID Repository for storing or updating the information respectively. 

####  Data extractor for ID authentication 
The system that extracts the latest copy of an individual’s data after the individual has registered in MOSIP or has updated their data in MOSIP and sends it to ID Authentication. Now, ID Authentication can use the latest copy of the individual’s data for authentication.         

### Capture audit trails/analytics data
When any transaction is performed in MOSIP system or the packet fails any validations or any system level exception happens, then the same is captured as part of MOSIP audit trails, which can be further used for reporting/analytics as required.

##  Post-processing 
###  Notification 

Notification (SMS/Email as configured), which is received by an individual is the final step of all the life cycle processes. System sends a notification to the individual for various life cycle scenarios such as, successful or un-successful issuance of UIN, update of UIN data, activate or deactivate UIN, finding a lost UIN, etc. using templates defined in the system.
 
### Print & post 
When an individual’s ID is created or an individual’s data is updated, the system sends the individual’s physical ID credential to the individual’s registered address. 

This feature is the post processing integration point for Registration Processor, where a country can generate the PDF of the individual’s ID and sends it to the country’s configured printing and postal service provider. The printing and postal service provider in turn would print the physical ID credential and deliver it to the individual’s registered address.


###  Packet processing status 
After the Registration Client sends the packet to Registration Processor, it starts processing the packet. Registration Processor enables the Registration Client to know the processing status of such packets. The probable packet statuses are as follows:
1. PROCESSING: The packet is under processing.
1. PROCESSED: The packet has been processed and Registration Client deletes the packet from its storage location.
1. RESEND: Initial validation like virus scan and packet integrity check have failed for the packet for a configured number of times and Registration Client needs to resend the packet for processing.
1. RE-REGISTER: The packet has failed a business validation like center-machine check, supervisor and officer validation, etc., due to which the system will not be able to process the packet. The registration officer will intimate the individual to come back to the center and re-register, post which registration client can delete the packet from its storage location.
1. REJECTED: A duplicate packet was found against the individual’s biometrics. As processing of the packet is completed, Registration Client can delete the packet from it storage location.