# ID Schema

## Overview

**ID Schema** is a standard [JSON schema](https://json-schema.org/understanding-json-schema/) that defines dataset that can be stored in the Identity repository for a resident. The schema allows the adopters to customize the fields that's needed for running the identity program.&#x20;

Defining the ID Schema is the first step towards creating a foundational ID system. Once defined, all applications built on top of the MOSIP platform must conform to the same.

We should not confuse ID Schema with what you see on the screen of the Registration client/Pre-registration. ID Schema is the final data that you would like to store against each user in the final ID Repository. Quite often we collect more data than listed in ID Schema. This is essential to validate the user's claim. We should consider these data as transactional and will never reach the final ID Repository.

## Understanding ID Schema

This guide is intended for adopters who would customize the default ID Schema to suit the needs of a specific deployment.

### Terminology

* **Field**: Unit of data collected from residents (eg. `fullName`, `dateOfBirth`, `proofOfIdentity` etc).
* **Field attribute**: Qualification of Field (eg. `fieldCategory`, `fieldType`, etc).
* **Definition**: Custom data types are defined for collecting different types of data:
  * `simpleType`: Multiple languages.
  * `documentType`: Document metadata.
  * `biometricType`: Biometric file [CBEFF XML](cbeff-xml.md) metadata

### JSON keys

* `bioAttributes`:
  * `leftEye`, `rightEye`, `leftIndex`, `leftRing`, `leftLittle`, `leftMiddle`, `rightIndex`, `rightRing`, `rightMiddle`, `rightLittle`, `rightThumb`, `leftThumb`, `face`,
* `fieldCategory`
  * `none`: Cannot be used for any purpose. But will be stored in id.json (default subpacket). These are used in exceptional cases when we need to store some data for future reference in case of investigating an ID fraud or if law mandates the storage of such data.&#x20;
  * `pvt`: Private information, can be used in authentication. A limited data that can be used for authentication & kyc.
  * `kyc`: Information that can be disclosed to partners either as a credential or through the ekyc API's.
  * `evidence`: Field is treated as proof and may be subjected to removal. In certain countries law mandates deletion of such data once the Identity of the user is verified. Marking some of the fields as `evidence` helps in deleting them without violating the source of truth signatures.
  * `optional`: Field is treated as proof and will be removed after a predefined interval (defined as policy).
* `format`
  * `lowercased:` Value stored in lower case format
  * `uppercased:` Value stored in upper case format
  * `none:` No format applied to the data
* `validators`
  * `type`: Validation engine type. Supported type as of now is `regex`
  * `validator`: Based on the type the actual script is placed here.  In case the `type` is `regex` then the actual regex pattern is used here.
  * `arguments`: Array to hold parameter or dependent field IDs required for validation.
* `subType`
  * For every `documentType` field, `document category code` must be the value of this key. This document category code is used to validate the provided document types in the ID object.

Refer to the [sample ID Schema](\_files/id-schema/id-schema-sample.json). A guide to customising the same is given below.

ID schema is loaded as a part of master data to `identity_schema` table in `mosip_masterdata` DB.

### Dependencies

If any changes are made to the default ID Schema, make sure the following dependencies are updated as well:

1. UI Specifications
   * [Pre-registration](pre-registration-ui-specifications.md)
   * [Registration Client](registration-client-ui-specifications.md)
2. [Identity Mapping JSON](https://github.com/mosip/mosip-config/blob/develop3-v3/identity-mapping.json)
3. [ID Authentication Mapping JSON](https://github.com/mosip/mosip-config/blob/develop3-v3/id-authentication-mapping.json)
4. [Applicanttype MVEL](https://github.com/mosip/mosip-config/blob/develop3-v3/applicanttype.mvel)

## Versions of ID Schema

ID Schema is identified based on its version in the MOSIP system. On publishing of ID Schema, the schema is versioned. Every ID Object stores the ID Schema version which is validated during ID Object validation.

## Good Practice

The following is the list of good practice that MOSIP recommends for creating your ID Schema.

* As a privacy by design practice we recommended that the number of fields is kept to a usable minimum in order to avoid profiling.
* Larger number of data results in serious data quality issues.&#x20;
* Keeping the field minimum ensures everyone is inclusively add to the foundational identity.
* As a best guide limit the total number of fields to be less than 10.
* Stick to one version of ID Schema for better compatibility.&#x20;
