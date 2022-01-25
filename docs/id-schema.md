# ID Schema 

## Overview
**ID Schema** is a standard [JSON schema](https://json-schema.org/understanding-json-schema/) that defines the data to be captured from an individual. MOSIP recommends collecting minimal data from the residents. However, information collected from residents may vary country to country. The ID Schema is flexible to accommodate such variations. 

Defining this schema becomes the fundamental step while using MOSIP. Once defined, all applications built on top of MOSIP platform must conform to the same.

The default schema used with MOSIP Sandbox installation is available [here](https://github.com/mosip/mosip-infra/blob/1.2.0-rc2/deployment/v3/mosip/kernel/masterdata/samples/idschema.json). A guide to customise the same is given below.

ID schema is loaded as a part of master data to `identity_schema` table in `mosip_masterdata` DB.

## Customisation guide
This guide is intented for adopters who would customise the default ID Schema to suit the needs of a specific deployment.

### Terminology
* **Field**: Unit of date collected from residents (eg. `fullName`, `dateOfBirth`, `proofOfIdentity` etc).   
* **Field attribute**:  Qualification of Field (eg. `fieldCategory`, `fieldType`, etc). 
* **Definition**: Custom data types defined by MOSIP for collecting different types of data:
    * `simpleType`: Multiple langauages.
    * `documentType`: Document metdata.
    * `biometricType`: Biometric file [CBEFF XML]() metadata  

### JSON keys
* `bioAttributes`:

    * `leftEye`, `rightEye`, `leftIndex`, `leftRing`, `leftLittle`, `leftMiddle`, `rightIndex`, `rightRing`, `rightMiddle`, `rightLittle`, `rightThumb`, `leftThumb`, `face`,

* `fieldCategory`
    * `none`: Cannot be used for any purpose. But will be stored in id.json (default sub packet).
    * `pvt`: Private information, can be used only auth.
    * `kyc`: Information that can be disclosed to partners including IDA.
    * `evidence`: Field is treated as proof and may be subjected to removal.
    * `optional`: Field is treated as proof and will be removed after predefined interval (defined as policy).

* `format`
   * `lowercased` 
   * `uppercased`

* `validators`
    * `type`: Validation engine type
    * `validator`: Regex
    * `arguments`: Array to hold parameter or dependent field ids required for validation.

### Dependencies
If any changes are made to the default ID Schema, make sure the following dependencies are updated as well:
1. UI Specification for Pre-registration and Registration Client
1. [Identity Mapping JSON](https://github.com/mosip/mosip-config/blob/develop3-v3/identity-mapping.json)
1. [ID Authentication Mapping JSON](https://github.com/mosip/mosip-config/blob/develop3-v3/id-authentication-mapping.json)
1. [Applicanttype MVEL](https://github.com/mosip/mosip-config/blob/develop3-v3/applicanttype.mvel)

## Versions of ID Schema
