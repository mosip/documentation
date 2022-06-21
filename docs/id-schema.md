# ID Schema

## Overview

**ID Schema** is a standard [JSON schema](https://json-schema.org/understanding-json-schema/) that defines data fields set to be captured from a resident. It is recommended that the number of fields is kept to a usable minimum inorder to avoid profiling, minimize errors during data capture and avoid transactional fields.

Defining the ID Schema is the the first step towards creating a foundational ID system. Once defined, all applications built on top of the MOSIP platform must conform to the same.

Refer to the [sample ID Schema](\_files/id-schema/id-schema-sample.json). A guide to customise the same is given below.

ID schema is loaded as a part of master data to `identity_schema` table in `mosip_masterdata` DB.

## Understanding ID Schema

This guide is intended for adopters who would customize the default ID Schema to suit the needs of a specific deployment.

### Terminology

* **Field**: Unit of data collected from residents (eg. `fullName`, `dateOfBirth`, `proofOfIdentity` etc).
* **Field attribute**: Qualification of Field (eg. `fieldCategory`, `fieldType`, etc).
* **Definition**: Custom data types defined for collecting different types of data:
  * `simpleType`: Multiple languages.
  * `documentType`: Document metdata.
  * `biometricType`: Biometric file [CBEFF XML](id-schema.md) metadata

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
* `subType`
  *  For every document type field, document category code must be the value to this key. This document category code is used to validate the provided document types in the ID object.
  

### Dependencies

If any changes are made to the default ID Schema, make sure the following dependencies are updated as well:

1. UI Specifications
   * [Pre-registration](pre-registration-ui-specifications.md)
   * [Registration Client](registration-client-ui-specifications.md)
2. [Identity Mapping JSON](https://github.com/mosip/mosip-config/blob/develop3-v3/identity-mapping.json)
3. [ID Authentication Mapping JSON](https://github.com/mosip/mosip-config/blob/develop3-v3/id-authentication-mapping.json)
4. [Applicanttype MVEL](https://github.com/mosip/mosip-config/blob/develop3-v3/applicanttype.mvel)

## Versions of ID Schema

ID Schema is identified based on its version in MOSIP system. On publish of ID Schema, schema is versioned. Every ID Object stores the ID Schema version which is validated during ID Object validation.
