Registration Processor processes the data (demographic and biometric) of an Individual for quality and uniqueness and then issues a Unique Identification Number (UIN). It also provides functionality to update demographic and biometric data and issue a new UIN if lost.

# All modules

# System Events

The following events are triggered as part of System Event Type for all modules in Registration Processor

## Failure response for System Event Type

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that there was an unexpected exception occured | No ID | No ID Type 
2 | RPR_405 | System | Exception | This event specifies that there was a bad gateway | No ID | No ID Type 
3 | RPR_405 | System | Exception | This event specifies that the service is unavailable | No ID | No ID Type 
4 | RPR_405 | System | Exception | This event specifies that an internal server error has occured| No ID | No ID Type 
5 | RPR_405 | System | Exception | This event specifies that a time out error has occured| No ID | No ID Type 
6 | RPR_405 | System | Exception | This event specifies that there was an error while mapping the identity json | No ID | No ID Type 
7 | RPR_405 | System | Exception | This event specifies that there was an error while creating an object of Json value class | No ID | No ID Type 
8 | RPR_405 | System | Exception | This event specifies that the field could not be found | No ID | No ID Type 
9 | RPR_405| System | Exception | This event specifies that there was an error while parsing the json | No ID | No ID Type 
10 | RPR_405 | System | Exception | This event specifies that there was an error while converting the input streams to bytes | No ID | No ID Type
11 | RPR_405 | System | Exception | This event specifies that there was an error while parsing the date value | No ID | No ID Type 
12 | RPR_405 | System | Exception | This event specifies that there was an IO exception | No ID | No ID Type
13 | RPR_405 | System | Exception | This event specifies that there was a data access exception | No ID | No ID Type
14 | RPR_405 | System | Exception | This event specifies that there was a API resource exception | No ID | No ID Type 
15 | RPR_405 | System | Exception | This event specifies that there was a illegal access exception | No ID | No ID Type 
16 | RPR_405 | System | Exception | This event specifies that there was a invocation target exception | No ID | No ID Type 
17 | RPR_405 | System | Exception | This event specifies that there was a introspection exception | No ID | No ID Type 
18 | RPR_405 | System | Exception | This event specifies that the object store was not accessible | No ID | No ID Type 
19 | RPR_405 | System | Exception | This event specifies that the copying of packet tags to message events failed | No ID | No ID Type 

# Packet Receiver Stage

# User Events

The following events are triggered as part of User Event Type in Packet Receiver Stage

## Success response for User Event Type in Packet Receiver Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_407 | User | Add/Save| This event specifies that the packet receiver validation is successful. | No ID | No ID Type
2 | RPR_407 | User | Add/Save | This event specifies that the Packet is received and uploaded to landing zone | No ID | No ID Type

# System Events

The following events are triggered as part of System Event Type in Packet Receiver Stage

## Failure response for System Event Type in Packet Receiver Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that the size of the packet is invalid | No ID | No ID Type
2 | RPR_405 | System | Exception | This event specifies that the packet format is invalid | No ID | No ID Type 
3 | RPR_405 | System | Exception | This event specifies that the packet validation has failed | No ID | No ID Type 
4 | RPR_405 | System | Exception | This event specifies that a duplicate packet request has been received | No ID | No ID Type 
5 | RPR_405 | System | Exception | This event specifies that the packet is not available in the request | No ID | No ID Type 
6 | RPR_405 | System | Exception | This event specifies that an unknown exception was found | No ID | No ID Type 
7 | RPR_405 | System | Exception | This event specifies that the virus scan service is not responding | No ID | No ID Type 
8 | RPR_405 | System | Exception | This event specifies that the Packet Hash Sequence did not match | No ID | No ID Type 
9 | RPR_405 | System | Exception | This event specifies that there was a virus found in packet | No ID | No ID Type 
10 | RPR_405 | System | Exception | This event specifies that the API resource is not accessible | No ID | No ID Type 
11 | RPR_405 | System | Exception | This event specifies that the database is not accessible | No ID | No ID Type
12 | RPR_405 | System | Exception | This event specifies that the packet size is not matching | No ID | No ID Type 
13 | RPR_405 | System | Exception | This event specifies that the Registration Packet HashSequence is not equal to the synced packet HashSequence | No ID | No ID Type 
14 | RPR_405 | System | Exception | This event specifies that the packet decryption has failed | No ID | No ID Type  

# OSI Validator Stage

# User Events

The following events are triggered as part of User Event Type in OSI Validator Stage

## Success response for User Event Type in OSI Validator Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_402 | User | Update| This event specifies that the OSI validation was successful. | No ID | No ID Type

# System Events

The following events are triggered as part of System Event Type in OSI Validator Stage

## Failure response for System Event Type in OSI Validator Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that the OSI validation has failed | No ID | No ID Type
2 | RPR_405 | System | Exception | This event specifies that the packet store is not accessible | No ID | No ID Type
3 | RPR_405 | System | Exception | This event specifies that the API resource is not accessible | No ID | No ID Type
4 | RPR_405 | System | Exception | This event specifies that there was biometric type exception. | No ID | No ID Type
5 | RPR_405 | System | Exception | This event specifies that the request could not be processed	and should be tried again. | No ID | No ID Type

# Packet Classifier Stage

# User Events

The following events are triggered as part of User Event Type in Packet Classifier Stage

## Success response for User Event Type in Packet Classifier Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_402 | User | Update| This event specifies that the packet classifier was successful. | No ID | No ID Type

The following events are triggered as part of System Event Type in Packet Classifier Stage

## Failure response for System Event Type in Packet Classifier Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that the packet classifier has failed | No ID | No ID Type
2 | RPR_405 | System | Exception | This event specifies that the packet classification has failed | No ID | No ID Type
3 | RPR_405 | System | Exception | This event specifies that the tag generation has failed | No ID | No ID Type
4 | RPR_405 | System | Exception | This event specifies that getting the required Id object field names from tag generator has failed. | No ID | No ID Type
5 | RPR_405 | System | Exception | This event specifies that the Idobject mapping file field was not accessible | No ID | No ID Type
6 | RPR_405 | System | Exception | This event specifies that the Field's schema data type is not supported. | No ID | No ID Type
7 | RPR_405 | System | Exception | This event specifies that the JSON parsing of field value according to the schema type has failed. | No ID | No ID Type
8 | RPR_405 | System | Exception | This event specifies that the JSON parsing to java object has failed. | No ID | No ID Type
9 | RPR_405 | System | Exception | This event specifies that the JSON parsing of meta info has failed. | No ID | No ID Type
10 | RPR_405 | System | Exception | This event specifies that the Mapping field name is not present in identity mapping json. | No ID | No ID Type
11 | RPR_405 | System | Exception | This event specifies that the required value is not available in the configured language for field. | No ID | No ID Type
12 | RPR_405 | System | Exception | This event specifies that the FieldDTO or non string field value is null. | No ID | No ID Type
13 | RPR_405 | System | Exception | This event specifies that the sync registration entity is not available. | No ID | No ID Type
14 | RPR_405 | System | Exception | This event specifies that the Exception Biometrics entry is not available in metainfo map. | No ID | No ID Type
15 | RPR_405 | System | Exception | This event specifies that the Operations data entry is not avaiable in metainfo map. | No ID | No ID Type
16 | RPR_405 | System | Exception | This event specifies that the Meta data entry is not avaiable in metainfo map. | No ID | No ID Type
17 | RPR_405 | System | Exception | This event specifies that the Age Group Range Map configuration does not contain age group for given age. | No ID | No ID Type
18 | RPR_405 | System | Exception | This event specifies that the captured registered devices entry is not avaiable in the metainfo map. | No ID | No ID Type

# Packet Uploader Stage

# User Events

The following events are triggered as part of User Event Type in Packet Uploader Stage

## Success response for User Event Type in Packet Uploader Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_402 | User | Update | This event specifies that the packet is uploaded to the file system successfully. | No ID | No ID Type
2 | RPR_402 | User | Packet Archiving | This event specifies that the packet is successfully archived. | No ID | No ID Type

The following events are triggered as part of System Event Type in Packet Uploader Stage

## Failure response for System Event Type in Packet Uploader Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that the packet was not found in the landing zone | No ID | No ID Type
2 | RPR_405 | System | Exception | This event specifies that the file is already exists in file store and its now deleted from landing zone | No ID | No ID Type
3 | RPR_405 | System | Exception | This event specifies that the Packet store set by the System is not accessible | No ID | No ID Type
4 | RPR_405 | System | Exception | This event specifies that the registration packet virus scan has failed | No ID | No ID Type
5 | RPR_405 | System | Exception | This event specifies that the Virus scanner service has failed| No ID | No ID Type
6 | RPR_405 | System | Exception | This event specifies that the JSCH connection has failed | No ID | No ID Type
7 | RPR_405 | System | Exception | This event specifies that the packet could not be retreived from the nginx URL | No ID | No ID Type
8 | RPR_405 | System | Exception | This event specifies that the Registration packet is not in Sync with Sync table | No ID | No ID Type
9 | RPR_405 | System | Exception | This event specifies that the Registration packet decryption has failed | No ID | No ID Type
10 | RPR_405 | System | Exception | This event specifies that the packet upload has failed during cleanup | No ID | No ID Type
11 | RPR_405 | System | Exception | This event specifies that the packet upload failed during the archival | No ID | No ID Type
12 | RPR_405 | System | Exception | This event specifies that the there was a failure in uploading the packet to Packet Store | No ID | No ID Type

# Packet Validator Stage

# User Events

The following events are triggered as part of User Event Type in Packet Validator Stage

## Success response for User Event Type in Packet Validator Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_402 | User | Update | This event specifies that the packet validation was successful. | No ID | No ID Type

The following events are triggered as part of System Event Type in Packet Validator Stage

## Failure response for System Event Type in Packet Validator Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that the structural validation has failed | No ID | No ID Type
2 | RPR_405| System | Exception | This event specifies that the data is not available in Master DB | No ID | No ID Type
3 | RPR_405 | System | Exception | This event specifies that the attribute is not available in ID JSON for master data validation | No ID | No ID Type
4 | RPR_405 | System | Exception | This event specifies that the resource was not found for master data validation | No ID | No ID Type
5 | RPR_405 | System | Exception | This event specifies that there was an invalid attribute value for master data validation | No ID | No ID Type
6 | RPR_405  | System | Exception | This event specifies that the the API resource was not accessible | No ID | No ID Type
7 | RPR_405 | System | Exception | This event specifies that the ID Schema validation has failed | No ID | No ID Type
8 | RPR_405 | System | Exception | This event specifies that the document type was invalid for document validation | No ID | No ID Type
9 | RPR_405 | System | Exception | This event specifies that the ID Json was not found | No ID | No ID Type
10 | RPR_405 | System | Exception | This event specifies that the document validation failed for applicant | No ID | No ID Type
11 | RPR_405 | System | Exception | This event specifies that the packet was rejected by the supervisor. | No ID | No ID Type
12 | RPR_405 | System | Exception | This event specifies that the an error has occured in the packet manager. | No ID | No ID Type
13 | RPR_405 | System | Exception | This event specifies that the ID Schema validation has failed. | No ID | No ID Type
14 | RPR_405 | System | Exception | This event specifies that the UIN is deactivated | No ID | No ID Type
15 | RPR_405 | System | Exception | This event specifies that the mandatory field validation has failed| No ID | No ID Type
16 | RPR_405 | System | Exception | This event specifies that there was a registration type mismatch | No ID | No ID Type
17 | RPR_405 | System | Exception | This event specifies that the UIN is invalid | No ID | No ID Type

# Quality Checker Stage

# User Events

The following events are triggered as part of User Event Type in Quality Checker Stage

## Success response for User Event Type in Quality Checker Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_402 | User | Update | This event specifies that the Quality check was successful. | No ID | No ID Type

The following events are triggered as part of System Event Type in Quality Checker Stage

## Failure response for System Event Type in Quality Checker Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that the Registration table was not accessible | No ID | No ID Type
2 | RPR_405 | System | Exception | This event specifies that the result was not found | No ID | No ID Type
3 | RPR_405 | System | Exception | This event specifies that there was a invalid QC User Id  | No ID | No ID Type
4 | RPR_405 | System | Exception | This event specifies that the Registration ID was invalid | RID | Registration Id
5 | RPR_405 | System | Exception | This event specifies that it was unable to find Biometric file name in ID JSON | No ID | No ID Type
6 | RPR_405 | System | Exception | This event specifies that it was unable to find Biometric file in the Packet | No ID | No ID Type
7 | RPR_405 | System | Exception | This event specifies that a Biometric Exception was received form IDA | No ID | No ID Type
8 | RPR_405 | System | Exception | This event specifies that the requested biometric type was not found | No ID | No ID Type
9 | RPR_405 | System | Exception | This event specifies that the Individual Biometric Parameter was not found in the ID JSON | No ID | No ID Type
10 | RPR_405 | System | Exception | This event specifies that the Quality ccore of the Biometrics captured was below the threshold | No ID | No ID Type
11 | RPR_405 | System | Exception | This event specifies that the Packet store set by the System is not accessible | No ID | No ID Type
12 | RPR_405 | System | Exception | This event specifies that an unknown exception has occured | No ID | No ID Type
13 | RPR_405 | System | Exception | This event specifies that an exception has occured in the packet manager | No ID | No ID Type

# Secure Zone Notification Stage

# User Events

The following events are triggered as part of User Event Type in Secure Zone Notification Stage

## Success response for User Event Type in Secure Zone Notification Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_401 | User | Add/Save | This event specifies that the secure zone notification was successful. | No ID | No ID Type

The following events are triggered as part of System Event Type in Secure Zone Notification Stage

## Failure response for System Event Type in Secure Zone Notification Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that an exception has occured in secure zone notification stage | No ID | No ID Type
2 | RPR_405 | System | Exception | This event specifies that the Registration table was not accessible | No ID | No ID Type

# Message Sender Stage

# User Events

The following events are triggered as part of User Event Type in Message Sender Stage

## Success response for User Event Type in Message Sender Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_402 | User | Update | This event specifies that the message sending stage was successfully executed. | No ID | No ID Type

The following events are triggered as part of System Event Type in Message Sender Stage

## Failure response for System Event Type in Message Sender Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that the template was not found | No ID | No ID Type
2 | RPR_405 | System | Exception | This event specifies that the processing of template has failed | No ID | No ID Type
3 | RPR_405 | System | Exception | This event specifies that the packet store set by the system is not accessible | No ID | No ID Type
4 | RPR_405 | System | Exception | This event specifies that the template generation has failed | No ID | No ID Type
5 | RPR_405 | System | Exception | This event specifies that the phone number was not found | No ID | No ID Type
6 | RPR_405 | System | Exception | This event specifies that the Email ID was not found | No ID | No ID Type
7 | RPR_405 | System | Exception | This event specifies that the configuration and language code was not found | No ID | No ID Type
8 | RPR_405 | System | Exception | This event specifies that it was unable to send the notification since UIN was not found for the lost packet | UIN | UIN
9 | RPR_405 | System | Exception | This event specifies that the template configuration and language was not found | No ID | No ID Type
10 | RPR_405 | System | Exception | This event specifies that the Message Sender Stage has failed | No ID | No ID Type
11 | RPR_405 | System | Exception | This event specifies that either Email ID or Phone or Template or Notification Type is Missing | No ID | No ID Type
12 | RPR_405 | System | Exception | This event specifies that the email sending has failed | No ID | No ID Type
13 | RPR_405 | System | Exception | This event specifies that the SMS sending has failed | No ID | No ID Type

# Print Stage

# User Events

The following events are triggered as part of User Event Type in Print Stage

## Success response for User Event Type in Print Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_402 | User | Update | This event specifies that the print request was submitted successfully. | No ID | No ID Type
2 | RPR_402 | User | Update | This event specifies that the print and post event was completed successfully. | No ID | No ID Type

The following events are triggered as part of System Event Type in Print Stage

## Failure response for System Event Type in Print Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that there was an error while generating the PDF for UIN Card | No ID | No ID Type
2 | RPR_405 | System | Exception | This event specifies that the UIN was not found in the database | No ID | No ID Type
3 | RPR_405 | System | Exception | This event specifies that the PDF generation has Failed | No ID | No ID Type
4 | RPR_405 | System | Exception | This event specifies that the Queue connection is null | No ID | No ID Type
5 | RPR_405 | System | Exception | This event specifies that there was an error while generating the QR Code | No ID | No ID Type
6 | RPR_405 | System | Exception | This event specifies that there was an error while setting up the applicant photo | No ID | No ID Type
7 | RPR_405 | System | Exception | This event specifies that there was an error while setting the QR Code for UIN card | No ID | No ID Type
8 | RPR_405 | System | Exception | This event specifies that the ID Repo response is null | No ID | No ID Type
9 | RPR_405 | System | Exception | This event specifies that the ID Repo response has no documents | No ID | No ID Type
10 | RPR_405 | System | Exception | This event specifies that there was an error while getting response from Print and Postal service provider | No ID | No ID Type
11 | RPR_405 | System | Exception | This event specifies that there was an error while print data validation | No ID | No ID Type
12 | RPR_405 | System | Exception | This event specifies that it was a Invalid CardType| UIN | UIN
13 | RPR_405 | System | Exception | This event specifies that it was a Invalid IdType | UIN,VID,RID | UIN,VID,RID
14 | RPR_405 | System | Exception | This event specifies that the UIN is not valid | UIN | UIN
15 | RPR_405 | System | Exception | This event specifies that the VID is not valid | VID | VID
16 | RPR_405 | System | Exception | This event specifies that the RID is not valid | RID | RID
17 | RPR_405 | System | Exception | This event specifies that there was an error while creating the VID | No ID | No ID Type
18 | RPR_405 | System | Exception | This event specifies that it could not generate/regenerate VID as per policy,Please use existing VID | VID | VID
19 | RPR_405 | System | Exception | This event specifies that the input parameter was missing | No ID | No ID Type
20 | RPR_405 | System | Exception | This event specifies that there was a invalid input parameter | No ID | No ID Type
21 | RPR_405 | System | Exception | This event specifies that the Pdf was not added to queue due to queue failure | No ID | No ID Type
22 | RPR_405 | System | Exception | This event specifies that the uin card was resent for printing | No ID | No ID Type
23 | RPR_405 | System | Exception | This event specifies that there was an error while QR Code generation | No ID | No ID Type
24 | RPR_405 | System | Exception | This event specifies that there was an error while creating the VID | No ID | No ID Type
25 | RPR_405 | System | Exception | This event specifies that there was a PDF signature error | No ID | No ID Type
26 | RPR_405 | System | Exception | This event specifies that the print request has failed | No ID | No ID Type
27 | RPR_405 | System | Exception | This event specifies that the API  resource was not accessible | No ID | No ID Type

# Re-Processor Stage

# User Events

The following events are triggered as part of User Event Type in Re-Processor Stage

## Success response for User Event Type in Re-Processor Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_402 | User | Update | This event specifies that the packet reprocessing was successfull. | No ID | No ID Type
2 | RPR_402 | User | Update | This event specifies that the request sent to reprocessor was successfull. | No ID | No ID Type
3 | RPR_402 | User | Update | This event specifies that the packet reprocessing has failed | No ID | No ID Type

The following events are triggered as part of System Event Type in Re-Processor Stage

## Failure response for System Event Type in Re-Processor Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that the Reprocessor stage has failed | No ID | No ID Type

# ABIS Handler Stage

# User Events

The following events are triggered as part of User Event Type in ABIS Handler Stage

## Success response for User Event Type in ABIS Handler Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_402 | User | Update | This event specifies that the ABIS handler stage was successfull. | No ID | No ID Type
2 | RPR_402 | User | Update | This event specifies that the Abis insert Requests was sucessfully sent to the Queue. | No ID | No ID Type

The following events are triggered as part of System Event Type in ABIS Handler Stage

## Failure response for System Event Type in ABIS Handler Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that the Abis Queue details are not found | No ID | No ID Type
2 | RPR_405 | System | Exception | This event specifies that the potential match records are not found for demo dedupe potential match | No ID | No ID Type
3 | RPR_405 | System | Exception | This event specifies that there was an internal error occured in Abis handler identify request| No ID | No ID Type
4 | RPR_405 | System | Exception | This event specifies that it was unable to find ABIS Reference ID | No ID | No ID Type
5 | RPR_405 | System | Exception | This event specifies that it was unable to find latest Transaction ID | No ID | No ID Type
6 | RPR_405 | System | Exception | This event specifies that it was unable to find Identify Request | No ID | No ID Type
7 | RPR_405 | System | Exception | This event specifies that it was unable to find ABIS Connection Properties | No ID | No ID Type
8 | RPR_405 | System | Exception | This event specifies that an unknown exception was found| No ID | No ID Type
9 | RPR_405 | System | Exception | This event specifies that it was unable to find ABIS Batch ID | No ID | No ID Type
10 | RPR_405 | System | Exception | This event specifies that it was unable to connect with the ABIS Queue | No ID | No ID Type
11 | RPR_405 | System | Exception | This event specifies that an Internal error has occured | No ID | No ID Type
12 | RPR_405 | System | Exception | This event specifies that a duplicate insert response is received from abis for same request id | No ID | No ID Type
13 | RPR_405 | System | Exception | This event specifies that a duplicate identify response is received from abis for same request id  | No ID | No ID Type

# Bio Dedupe Stage

# User Events

The following events are triggered as part of User Event Type in Bio Dedupe Stage

## Success response for User Event Type in Bio Dedupe Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_402 | User | Update | This event specifies that the packet dedupe was successfull. | No ID | No ID Type
2 | RPR_402 | User | Update | This event specifies that a potential match was found while processing bio dedupe. | No ID | No ID Type
3 | RPR_402 | User | Update | This event specifies that a unique match was found for the Biometrics Received. | No ID | No ID Type

The following events are triggered as part of System Event Type in Bio Dedupe Stage

## Failure response for System Event Type in Bio Dedupe Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that the Bio Dedupe has failed | No ID | No ID Type
2 | RPR_405 | System | Exception | This event specifies that it was unable to access the packet from Packet Store | No ID | No ID Type
3 | RPR_405 | System | Exception | This event specifies that the Biometric Insertion has failed in ABIS | No ID | No ID Type
4 | RPR_405 | System | Exception | This event specifies that an ABIS Internal error has occurred | No ID | No ID Type
5 | RPR_405 | System | Exception | This event specifies that a Datashare exception has occured | No ID | No ID Type

# Biometric Authentication Stage

# User Events

The following events are triggered as part of User Event Type in Biometric Authentication Stage

## Success response for User Event Type in Biometric Authentication Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_402 | User | Update | This event specifies that the Biometric Authentication was successfull. | No ID | No ID Type

The following events are triggered as part of System Event Type in Biometric Authentication Stage

## Failure response for System Event Type in Biometric Authentication Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that the Biometric Authentication has failed | No ID | No ID Type
2 | RPR_405 | System | Exception | This event specifies that there was a IO exception | No ID | No ID Type
3 | RPR_405 | System | Exception | This event specifies that the API resource was not accessible | No ID | No ID Type
4 | RPR_405 | System | Exception | This event specifies that the request could not be processed | No ID | No ID Type
5 | RPR_405 | System | Exception | This event specifies that the registration table was not accessible | No ID | No ID Type

# Demo Dedupe Stage

# User Events

The following events are triggered as part of User Event Type in Demo Dedupe Stage

## Success response for User Event Type in Demo Dedupe Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_402 | User | Update | This event specifies that the demo dedupe was successfull. | No ID | No ID Type

The following events are triggered as part of System Event Type in Demo Dedupe Stage

## Failure response for System Event Type in Demo Dedupe Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_402 | System | Exception | This event specifies that a Potential duplicate packet was found for registration id | RID | Registration ID
2 | RPR_402 | System | Exception | This event specifies that the Demographic Deduplication was Skipped | No ID | No ID Type
3 | RPR_405 | System | Exception | This event specifies that an ABIS response details was found.Hence sending to manual adjudication | No ID | No ID Type
4 | RPR_405 | System | Exception | This event specifies that the API resource was not accessible | No ID | No ID Type

# Manual Verification Stage

# User Events

The following events are triggered as part of User Event Type in Manual Verification Stage

## Success response for User Event Type in Manual Verification Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_402 | User | Update | This event specifies that the Manual verification was approved. | No ID | No ID Type

The following events are triggered as part of System Event Type in Manual Verification Stage

## Failure response for System Event Type in Manual Verification Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that there was a Invalid file request | No ID | No ID Type
2 | RPR_405 | System | Exception | This event specifies that the requested file is not present | No ID | No ID Type
3 | RPR_405 | System | Exception | This event specifies that there was a invalid status update | No ID | No ID Type
4 | RPR_405 | System | Exception | This event specifies that no assigned record was found | No ID | No ID Type
5 | RPR_405 | System | Exception | This event specifies that the fields can not be empty | No ID | No ID Type
6 | RPR_405 | System | Exception | This event specifies that there was a missing input parameter - requesttime | No ID | No ID Type
7 | RPR_405 | System | Exception | This event specifies that there was a missing input parameter - id 	 | No ID | No ID Type
8 | RPR_405 | System | Exception | This event specifies that there was a invalid input parameter - version  | No ID | No ID Type
9 | RPR_405 | System | Exception | This event specifies that there was a invalid input parameter - requesttime | No ID | No ID Type
10 | RPR_405 | System | Exception | This event specifies that there was a invalid input parameter - id | No ID | No ID Type
11 | RPR_405 | System | Exception | This event specifies that there was a invalid argument exception | No ID | No ID Type
12 | RPR_405 | System | Exception | This event specifies that an unknown exception has occured | No ID | No ID Type
13 | RPR_405 | System | Exception | This event specifies that there was a request decoding exception | No ID | No ID Type
14 | RPR_405 | System | Exception | This event specifies that the User Id does not exists in the master list | No ID | No ID Type
15 | RPR_405 | System | Exception | This event specifies that the User is not in ACTIVE status | No ID | No ID Type
16 | RPR_405 | System | Exception | This event specifies that the Registration Id should not be null or empty | RID | Registration ID
17 | RPR_405 | System | Exception | This event specifies that the User Id should not be empty or null | No ID | No ID Type
18 | RPR_405 | System | Exception | This event specifies that the Packet was not found in Packet Store | No ID | No ID Type
19 | RPR_405 | System | Exception | This event specifies that there was a missing input parameter - version | No ID | No ID Type
20 | RPR_405 | System | Exception | This event specifies that the match type is Invalid | No ID | No ID Type
21 | RPR_405 | System | Exception | This event specifies that the manual verification was rejected | No ID | No ID Type
22 | RPR_405 | System | Exception | This event specifies that the Registration Id should not be empty or null| RID | Registration ID
23 | RPR_405 | System | Exception | This event specifies that the No matched reference id found for given RID | RID | Registration ID
24 | RPR_405 | System | Exception | This event specifies that there was a table not accessible exception in manual verification | No ID | No ID Type
25 | RPR_405 | System | Exception | This event specifies that an invalid message was received from the queue | No ID | No ID Type

# UIN Generator Stage

# User Events

The following events are triggered as part of User Event Type in UIN Generator Stage

## Success response for User Event Type in UIN Generator Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_402 | User | Update | This event specifies that the UIN generation was successful. | UIN | UIN
2 | RPR_402 | User | Update | This event specifies that the UIN generation was successful. | UIN | UIN
3 | RPR_402 | User | Update | This event specifies that the UIN generation was successful. | UIN | UIN
4 | RPR_402 | User | Update | This event specifies that the UIN generation was successful. | UIN | UIN
5 | RPR_402 | User | Update | This event specifies that the UIN generation was successful. | UIN | UIN

The following events are triggered as part of System Event Type in UIN Generator Stage

## Failure response for System Event Type in UIN Generator Stage

Sl No. | Event ID | Event Type | Event Name | Description | Reference ID | Reference ID Type
-------|----------|------------|------------|-------------|--------------|-------------------
1 | RPR_405 | System | Exception | This event specifies that the packet store set by the System is not accessible | No ID | No ID Type
2 | RPR_405 | System | Exception | This event specifies that there was an error while parsing the Json | No ID | No ID Type
3 | RPR_405 | System | Exception | This event specifies that the API resource was not accessible | No ID | No ID Type
4 | RPR_405 | System | Exception | This event specifies that there was an IO exception | No ID | No ID Type
5 | RPR_405 | System | Exception | This event specifies that the VID status is not active | VID | Virtual ID
6 | RPR_405 | System | Exception | This event specifies that the UIN updation has failed | UIN | UIN
7 | RPR_405 | System | Exception | This event specifies that the UIN is already activated | UIN | UIN
8 | RPR_405 | System | Exception | This event specifies that the UIN is already deactivated | UIN | UIN
9 | RPR_405 | System | Exception | This event specifies that the UIN activation has failed | UIN | UIN
10 | RPR_405 | System | Exception | This event specifies that the UIN reactivation has failed | UIN | UIN
11 | RPR_405 | System | Exception | This event specifies that the UIN deactivation has failed | UIN | UIN
12 | RPR_405 | System | Exception | This event specifies that the VID creation has failed | VID | Virtual ID
13 | RPR_405 | System | Exception | This event specifies that the UIN was not found for the matched RID | UIN | UIN
14 | RPR_405 | System | Exception | This event specifies that the UIN Generation has failed | UIN | UIN