## Table Of Content
* [1. Partner Management - SSP](#1-partner-management---ssp) 
    * [1.1 Partners - Create/Read/Update/Delete](#11-partners---createreadupdatedelete-) _(MSP_FR_1.1)_
    * [1.2 Policies - Create/Read/Update/Delete](#12-policies---createreadupdatedelete-) _(MSP_FR_1.2)_
    * [1.3 Partner-Policy Mapping - Create/Read/Update/Delete](#13-partner-policy-mapping---createreadupdatedelete-) _(MSP_FR_1.3)_
    * [1.4 MISP-Partner Mapping - Create/Read/Delete](#14-misp-partner-mapping---createreaddelete-) _(MSP_FR_1.4)_
    * [1.5 Validate and Re-issue Digital Certificate to Partner](#15-validate-and-re-issue-digital-certificate-to-partner-) _(MSP_FR_1.5)_
    * [1.6 Distribution of Public Keys to Partners](#16-distribution-of-public-keys-to-partners-) _(MSP_FR_1.6)_


# 1. Partner Management - SSP
## 1.1 Partners - Create/Read/Update/Delete [**[↑]**](#table-of-content)
### A. Create Partner
Upon receiving request to create a Partner with input parameters (Partner ID, Partner Organization Name, Partner Contact Number, Partner Email ID, Partner Address, IsActive), the system stores the data in the database

Throws an error message if mandatory parameters are missing
### B. Read Partner
Upon receiving request to fetch a Partner with input parameters (Partner ID and/or Partner Organization Name), the system fetches the data existing against the input parameter received.

1. If only Partner ID is received, fetches data against the Partner ID from the database
2. If Partner Organization Name is received, fetches data against the Partner Organization Name from the DB
3. If both Partner ID and Partner Organization Name is received, fetches data against the combination of both the input parameters
4. If the input parameter received is null or empty, fetches all the data
5. Fetches only active data from the database
6. If the data does not exist for input parameters received, throws the appropriate message. 
7. In case of exceptions, system should trigger relevant error messages. 
### C. Update Partner
Upon receiving a request to update a Partner with input parameters (Partner ID, Partner Organization Name, Partner Contact Number, Partner Email ID, Partner Address, IsActive) the system updates the data as per the below steps:

1. Partner ID serves as search criteria to update the record in the database
2. Updates the data received against the data already existing in the database against the Partner ID received
3. If the mandatory input parameters are missing, throws the appropriate message. 
4. In case of exceptions, system triggers relevant error messages. 
### D.  Delete Partner
Upon receiving a request to delete a Partner with input parameters (Partner ID), the system deletes the data as requested

1. Responds to the source with the required message
2. If the mandatory input parameters are missing, throw the appropriate message
3. In case of exceptions, system triggers relevant error messages

## 1.2 Policies - Create/Read/Update/Delete [**[↑]**](#table-of-content)

### A. Create Policy
Upon receiving a request to create a Policy with input parameters (Policy ID, Policy Name, Policy Description, Policy Json File, IsActive), the system stores the data in the database and responds to the source with the required message

1. If the mandatory input parameters are missing, throw the appropriate message
2. In case of exceptions, system should trigger relevant error messages
### B. Read Policy
1. The system receives a request to fetch a Policy with input parameters (Policy ID and/or Policy Name)
2. Fetches the data existing against the input parameter received
3. Responds to the source with the required data
   * If only Policy ID is received, fetches data against the Policy ID from the database 
   * If Policy Name is received, fetches data against the Policy Name from the database
   * If both Policy ID and Policy Name is received, fetches data against the combination of both the input parameters
   * If the input parameter received is null or empty, fetches all the data
   * Fetches only active data from the database
   * If the data does not exist for input parameters received, throws the appropriate message. 
4. In case of exceptions, system triggers relevant error messages
### C. Update Policy
Upon receiving a request to update a Policy with input parameters (Policy ID, Policy Name, Policy Description, Policy Json File, IsActive), the system updates the data and responds to the source with the required message

1. Policy ID serves as search criteria to update the record in the database
2. Updates the data received against the data already existing in the database against the Policy ID received
3. If the mandatory input parameters are missing, throws the appropriate message
4. In case of exceptions, system triggers relevant error messages
### D. Delete Policy
Upon receiving a request to delete a Policy with input parameters (Policy ID) the system deletes the data as requested and responds to the source with the required message

1. If the mandatory input parameters are missing, throws the appropriate message
2. In case of exceptions, system triggers relevant error messages.

## 1.3 Partner-Policy Mapping - Create/Read/Update/Delete [**[↑]**](#table-of-content)

### A. Create Partner-Policy Mapping
Upon receiving a request to create a Partner-Policy Mapping with input parameters (Partner ID, Policy ID, IsActive), the system stores the data in the database and responds to the source with the required message:

1. Input parameters must be present as mentioned below:
   * Partner ID - Mandatory
   * Policy ID - Mandatory
   * IsActive - Mandatory
2. There can only be one Policy mapped to a Partner
3. If the mandatory input parameters are missing, the system throws the appropriate message
4. In case of exceptions, system triggers relevant error messages. 
### B. Read Policy Json File based on Partner ID
Upon receiving a request to fetch a Policy with input parameters (Partner ID), the system fetches the data existing against the input parameter received and responds to the source with the required data as per the below steps:

1. Fetches the Policy mapped to the Partner ID received in input
2. Fetches only active data from the database
3. If the mandatory input parameters are missing, throws the appropriate message. 
4. If the data does not exist for input parameters received, throws the appropriate message
5. In case of exceptions, system triggers relevant error messages. 
### C. Update Partner-Policy Mapping
Upon receiving a request to update a Partner-Policy Mapping with input parameters (Partner ID, Policy ID, IsActive), the system updates the data and responds to the source with the required message as per the below steps:

1. Input parameters must be present as mentioned below:
   * Partner ID - Mandatory
   * Policy ID - Mandatory
   * IsActive - Mandatory
2. Partner ID serves as search criteria to update the record in the database
3. There can only be one Policy mapped to a Partner
4. Updates the data received against the data already existing in the database against the Partner ID received
5. If the mandatory input parameters are missing, throw the appropriate message
6. In case of exceptions, system triggers relevant error messages. 
### D. Delete Partner-Policy Mapping
Upon receiving a request to delete a Partner-Policy Mapping with input parameters (Partner ID, Policy ID), the system deletes the data as requested and Responds to the source with the required message

1. Input parameters must be present as mentioned below:
   * Partner ID - Mandatory
   * Policy ID - Mandatory
2. If the mandatory input parameters are missing, throw the appropriate message
3. In case of exceptions, system triggers relevant error messages. 


## 1.4 MISP-Partner Mapping - Create/Read/Delete [**[↑]**](#table-of-content)

### A. Create Partner-Policy Mapping
Upon receiving a request to create a MISP-Partner Mapping with input parameters (MISP ID, Partner ID, IsActive), the system store the data in the database and Responds to the source with the required message
1. One MISP can be mapped to multiple Partners
2. One Partner can be mapped to multiple MISPs
3. If the mandatory input parameters are missing, the system throws an appropriate message
4. In case of exceptions, system triggers relevant error messages
### B. Read MISP-Partner Mapping
Upon receiving a request to fetch a MISP-Partner mapping (MISP ID and/or Partner ID), the system fetches the data existing against the input parameter received and responds to the source with the required data
1. If only MISP ID is received, system fetches data against the MISP ID from the database
2. If Partner ID is received, fetches data against the Partner ID from the database
3. If both MISP ID and Partner ID is received, fetches data against the combination of both the input parameters
4. If the input parameter received is null or empty, fetches all the data
5. Fetches only active data from the database
6. If the mandatory input parameters are missing, throws the appropriate message. 
7. If the data does not exist for input parameters received, throws the appropriate message. 
8. In case of exceptions, system triggers relevant error messages
### C. Delete Partner-Policy Mapping
Upon receiving a request to delete a MISP-Partner Mapping with input parameters (MISP ID, Partner ID), the system Deletes the data as mentioned in Acceptance Criteria and responds to the source with the required message
1. If the mandatory input parameters are missing, throws the appropriate message
2. In case of exceptions, system triggers relevant error messages.

## 1.5 Validate and Re-issue Digital Certificate to Partner [**[↑]**](#table-of-content)

Upon receiving a request to validate the Digital Certificate provided by a Partner with Input (Digital Certificate), the system does the following:
1. Validates the Digital Certificate
2. Signs the Digital Certificate with MOSIP's Certificate and issue a Certificate Chain
3. Responds with the signed certificate to the source
4. If the mandatory input parameters are missing, throws the appropriate message. 
5. In case of exceptions, system triggers relevant error messages

## 1.6 Distribution of Public Keys to Partners [**[↑]**](#table-of-content)

Upon receiving a request to get Public Key with an input parameter (Date Time-stamp) the system performs the following steps:
1. The system calls the Key Manager Service to get the Public Key with Input Parameter (Application ID, Reference ID, Date Time-Stamp)
2. Retrieves the Public Key as per the timestamp. 
3. Responds to the source with the Private Key
4. The Public Key should be a valid and active key for the Time-Stamp received
5. The Public Key corresponds to the Private Key used by the IDA
6. If the mandatory input parameters are missing, system throws the appropriate message. 
7. In case of exceptions, system triggers relevant error messages.

