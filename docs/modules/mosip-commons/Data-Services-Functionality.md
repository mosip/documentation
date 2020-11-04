# Data mapper

Data mapper is used across MOSIP to facilitate mapping between DTO (Data Transfer Object) and entity. 

# Data Access Manager

Data Access Manager provides a DAO (Data Access Object) interface to do the following:

1. Provide an interface for connection to a Database
1. Provide an interface to support Database CRUD (Create, Read, Update, Delete) operation
1. Provide an interface to support a custom SQL
1. Provide an interface to call Database functions.

# Sync Handler

1. Sync Handler allows registration client to sync Master data, List of User, Roles and Respective Mappings and Configurations (Registration Client specific and Global Configs).
1. Sync Handler also allows Registration Client to push data from Client local database to Master Database.
1. As part of Master data Sync, the service receives a Machine ID and Timestamp, looks for a mapped Center ID to that Machine ID and responds to the Registration Client with the Center specific Master data for the following tables.
   * Registration Center Type
   * List of Registration Center
   * Template File Format
   * Template Type
   * Templates
   * Reason Category
   * List of Reasons
   * Document Category
   * Document Type
   * Mapping of Applicant Type-Document Category-Document Type (refer table "Valid Documents")
   * Machine Type
   * Machine Specifications
   * List of Machines
   * Device Types
   * Device Specifications
   * List of Devices
   * Location Hierarchy
   * List of Languages
   * List of Genders
   * Biometric Authentication Type
   * Biometric Attribute
   * Center-Machine Mapping
   * Center-Device Mapping
   * Center-Machine-Device Mapping
   * Center-Machine-User Mapping
   * Center-User Mapping
   * Sync Job Definition
1. The Sync Handler service only sends incremental changes based on the Timestamp received by the service.
1. For configuration, sync handler receives a request to sync configurations and will respond back with Registration Client specific and Global Configurations.
1. For User, Roles and Respective User-Role mappings, Sync handler receives Center ID and Timestamp and will respond to the Registration Client with Center specific incremental changes.

# ID Generator and Validator

## ID Generator

### Machine ID Generator
Upon receiving a request to generate Machine ID, the system generates Machine ID as per default Machine ID generation logic as mentioned below:

1. Machine ID should only be numeric
1. Machine ID generated should be of length of 5 digits
1. Each new Machine ID should be incremented by 1 for each new request
1. Machine ID generation should start from 10000
1. The number should not contain the restricted numbers defined by the ADMINs.

Responds with the Machine ID to the source.

Raises an alert in case of exceptions. 

### Registration Center ID Generator
Upon receiving a request to generate Registration Center ID, the system generates it as per default Registration Center ID generation logic.

Refer below for the process:

1. Registration Center ID is generated as per the defined logic mentioned below:
   * Registration Center ID should only be numeric
   * Registration Center ID generated should be of length of 5 digits
   * Each new Registration Center ID should be incremented by 1 for each new request
   * Registration Center ID generation should start from 10000
   * The number should not contain the restricted numbers defined by the ADMIN
1. In case of exceptions, system triggers relevant error messages
1. Responds with the Registration Center ID to the source
1. Raises an alert in case of exceptions.

### RID Generator
Upon receiving a request to generate RID with Machine ID and Center ID as input, the system generates it as per default RID generation logic.

Refer below for the process:

1. RID should be generated as per the defined logic mentioned below:
2. RID should only be numeric
3. First 5 Digit should be Registration Center ID
4. Next 5 Digits should be Machine ID
5. Next 5 Digits should be Running sequence
6. Last 14 Digits should be Timestamp
7. Total: 29 Digits 
8. Responds with the RID to the source
9. Raises an alert in case of exceptions and triggers the messages.

### MISP ID Generator
Upon receiving a request to generate MISP ID, the system generates it as per default MISP ID generation logic.

Refer below for the process:

1. MISP ID should be generated as per the defined logic mentioned below:
   * MISP ID should only be numeric
   * MISP ID generated should be of length of 3 digits (Configurable)
2. MISP ID generation should start from 100
3. Each new MISP ID should be incremented by one for each new request
4. The number should not contain the restricted numbers defined by the ADMIN
5. Responds with the MISP ID to the source
6. Raises an alert in case of exceptions and triggers the messages.

### PRID Generator
Upon receiving a request to generate PRID with input parameters, the system generates PRID as per default PRID generation logic.

Refer below for the process:

1. PRID generated should contain number of digits as configured by the ADMIN
1. PRID is generated as per the defined logic mentioned below:
   * The number should not contain any alphanumeric characters
   * The number should not contain any repeating numbers for 2 or more than 2 digits
   * The number should not contain any sequential number for 3 or more than 3 digits
   * The numbers should not be generated sequentially
   * The number should not have repeated block of numbers for 2 or more than 2 digits
   * The number should not contain the restricted numbers defined by the ADMIN
   * The last digit in the number should be reserved for a checksum
   * The number should not contain '0' or '1' as the first digit
1. Responds with the PRID to the source
1. Raises an alert in case of exceptions. 

### VID Generator
Upon receiving a request to generate VID, the system generates PRID as per default PRID generation logic.

Refer below for the process:

1. VID should be generated as per the defined logic mentioned below:
1. Responds with the VID to the source
1. Raises an alert in case of exceptions. 

**VID generation policy**

1. VID generated should contain the number of digits as configured.
1. Validates if the VID is generated as per the defined logic mentioned below:
   * The number should not contain any alphanumeric characters
   * The number should not contain any repeating numbers for 2 or more than 2 digits
   * The number should not contain any sequential number for 3 or more than 3 digits
   * The numbers should not be generated sequentially
   * The number should not have repeated block of numbers for 2 or more than 2 digits
   * The number should not contain the restricted numbers defined by the ADMIN
   * The last digit in the number should be reserved for a checksum
   * The number should not contain '0' or '1' as the first digit.
1. Expired VID should not be sent in response.

### Token ID Generator
Upon receiving a request to generate Token ID (with input parameters (TSP ID, UIN), the system generates token ID as per default Token ID generation logic

Refer below for the process:

1. Token ID should be generated based on the below logic using received UIN and Partner ID
2. Token ID = SHA256( SHA256(UIN + SALT) + Partner ID + SALT
3. Validate if all mandatory input parameters have been received as listed below for each specific request
   * UIN - Mandatory
   * Partner ID - Mandatory
4. Raise an exception if input parameter is missing. Refer messages section
5. Token ID length should be of 36 digits

### Partner ID Generator
Upon receiving a request to generate partner ID, the system generates it as per default partner ID generation logic.

Refer below for the process:

1. Partner ID is only be numeric
1. Partner ID generated is be of length of 4 digits
1. Partner ID length is be configurable
1. Each new Partner ID should be incremented by 1 for each new request
1. Partner ID generation is start from 1000
1. In case of exceptions, system triggers relevant error messages. 

### MISP License Key Generator
Upon receiving a request to generate License Key, the system generates it as per default License Key generation logic and responds with the License Key to the source

1. License Key is generated as per the defined logic mentioned below:
   * License Key Generation follows a random generation pattern
   * License Key is alphanumeric
   * License Key generated is of length of 8 digits
   * License Key is mapped to expiry (Expiry to be configured by admin).
2. In case of exceptions, system triggers relevant error messages

## ID Validator

### UIN Validator
Upon receiving a request to validate the UIN, the system validates the UIN against the defined policy

Refer below for the process:

1. Validates if the UIN is of configured length.
1. Validates the UIN by verifying the checksum
1. Validates if the UIN received as per the UIN generation logic
1. Responds to the source with an appropriate message 
1. Raises an alert in case of exceptions. 

### PRID Validator
Upon receiving a request to validate the PRID, the system validates the PRID against the defined policy

Refer below for the process:

1. Validates if the received PRID contains number of digits as configured by the ADMIN
1. Validates the PRID received as per the PRID generation logic 
1. Responds to the source with an appropriate message 
1. Raises an alert in case of exceptions. 

### VID Validator
Upon receiving a request to validate the VID with input parameters (UIN), the system validates the VID against the defined VID policy

Refer below for the process:

1. Validates if the VID is of configured length.
1. Validates the VID by verifying the checksum
1. Validates if the VID received as per the VID generation logic
1. Responds to the source with an appropriate message and raises an alert in case of exceptions.

### RID Validator

RID is generated in the following manner:

* First 5 Digit: Registration Center ID
* Next 5 Digits: Machine ID
* Next 5 Digits: Running sequence
* Last 14 Digits: Timestamp
* Total: 29 Digits

RID Validation performs pattern validation on RID and provides three methods to validate RID.

1. Receive a RID, check whether RID is of configured length or not and respond with whether RID is valid or invalid
1. Receive a RID along with Registration Center ID and Machine ID. Check whether RID is of configured length or not and whether Registration Center ID and Machine ID are attached to the RID or not. Respond with whether RID is valid or invalid
1. Receive a RID along with Registration Center ID, Machine ID, Sequence Length and Timestamp Length. Check whether RID is proper or not as per the input received. Respond with whether RID is valid or invalid.

### Partner ID Validator

1. The system receives a request to check status of a Partner with an input parameter (Partner ID)
2. Checks the length of the Partner ID
3. Checks the status of the Partner ID
4. Responds to the source according to the conditions mentioned below:
   * If the length of Partner ID is not of the configured length, respond with message "INVALID"
   * If the Partner ID is Inactive, respond with message "INACTIVE"
   * If the Partner ID is of configured length and is Active, respond with "ACTIVE"
5. Throws an error if an input parameter is empty
6. In case of exceptions, system triggers relevant error messages.

### License Key Status Validator

The system receives a request to check status of the License Key with an input parameter (License Key)

1. Checks the length of the License Key
2. Fetches the status of the License Key
3. Throw an error if an input parameter is empty
4. Responds to the source according to the conditions mentioned below:
   * If the length of License Key is not 8 digits, respond with message "INVALID"
   * If the License Key is expired as per the expiry period configured, respond with message "EXPIRED"
   * If the status of License Key is "SUSPENDED", respond with message "SUSPENDED"
   * If the status of License Key is "BLOCKED", respond with message "BLOCKED"
   * If the status of License Key is "ACTIVE", respond with message "ACTIVE"
   * License Key should be mapped to expiry (Expiry to be configured by admin).
5. In case of exceptions, system triggers relevant error messages. 

