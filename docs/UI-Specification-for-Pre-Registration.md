This section contains the details about the UI specification that is currently being used in Pre-registration.

# UI Specification
Below are the properties in pre-registration UI specification that define the ID attributes.

Name | Description | Example
-----|-------------|--------
id | unique Ids for each field in ID Schema | fullname
description | description for the ID field | Full Name of Resident
labelName | label used for display in the UI | 
labelName.eng | label value in English | Full Name
labelName.ara | label value in Arabic | الاسم الكامل
labelName.fra | label value in French | Nom complet
controlType | UI element used for displaying the attribute | textbox, dropdown, date, fileupload
inputRequired | to identify if UI input is needed or not | true or false
validators | list of validators for the attribute |
validators.type | type of validaton engine | regex
validators.validator | pattern / methodName / scriptName / expression for the validation |
validators.arguments | list of arguments needed for the validator |
required | to decide if it is mandatory or not | true or false

## ID
The id property is the unique id provided to a fields to uniquely identify it. The fields can be alpha-numeric without any spaces between them.

The ID attributes currently being used for our current UI specifications are:

Attribute | Description
----------|---------------------
IDSchemaVersion | This attribute is used to store the version of the ID Schema
fullName | This attribute is used to store the full name of the resident
dateOfBirth | This attribute is used to store the date of birth of the resident
gender | This attriute is used to store the gender of the resident
residenceStatus | This attribute is used to store the resident status of the resident
addressLine1 | This attribute is used to store the address of the resident
addressLine2 | This attribute is used to store the address of the resident
addressLine3 | This attribute is used to store the address of the resident
region | This attribute is used to store the region of the resident
province | This attribute is used to store the province of the resident
city | This attribute is used to store the city of the resident
zone | This attribute is used to store the zone of the resident
postalCode | This attribute is used to store the postal code of the resident
phone | This attribute is used to store the phone number of the resident
email | This attribute is used to store the email id of the resident
proofOfAddress | This attribute is used to store the details for Proof of Address document
proofOfIdentity | This attribute is used to store the details for Proof of Identity document
proofOfRelationship | This attribute is used to store the details for Proof of Relationship document, in case of a minor
proofOfDateOfBirth | This attribute is used to store the details for Proof of Birth document
proofOfException | This attribute is used to store the details for Proof of Exception document, if the resident has an biometric exception
proofOfException-1 | This attribute is used to store the details for Proof of Exception document, if the resident has an biometric exception

## Description
This is a non-mandatory property used to describe the ID attribute.

## Label Name
This property defines label name to be used in UI. This property has sub attributes as the language code (eng, fra, ara) to store data in different languages based on the country's configuration.

## Control Type
This property defines what kind of UI component to be used to capture data in UI. Currently the values that can be used are:
* textbox
* dropdown
* date
* fileupload

## Input Required
This is a mandatory property which decides if the input is to be provided from the UI or not.

## Validator
This property enables us to add a the list of validators for the ID attribute. Each validator will have the below fields,

Fields | Description
-------|-------------
type | for validation engine type
validator | for pattern / methodName / scriptName / expression
arguments | array to hold parameter or dependent field ids required for validation

Currently, regex is supported by MOSIP, the adopter can choose to add various types of validators.

## Required
This is a mandatory property which is needed to identify if the ID attribute is mandatory or not.

# Sample UI Specification
```JSON
{
  "identity": [
    {
      "id": "fullName",
      "description": "Enter Full Name",
      "labelName": {
        "eng": "Full Name",
        "ara": "الاسم الكامل",
        "fra": "Nom complet"
      },
      "controlType": "textbox",
      "inputRequired": true,
      "validators": [
        {
          "type": "regex",
          "validator": "^(?=.{0,50}$).*",
          "arguments": []
        }
      ],
      "required": true
    },
    {
      "id": "dateOfBirth",
      "description": "Enter DOB",
      "labelName": {
        "eng": "Date Of Birth",
        "ara": "تاريخ الولادة",
        "fra": "Date de naissance"
      },
      "controlType": "date",
      "inputRequired": true,
      "validators": [],
      "required": true
    },
    {
      "id": "gender",
      "description": "Enter Gender",
      "labelName": {
        "eng": "Gender",
        "ara": "جنس",
        "fra": "Le genre"
      },
      "controlType": "dropdown",
      "inputRequired": true,
      "validators": [],
      "required": true
    },
    {
      "id": "residenceStatus",
      "description": "Residence status",
      "labelName": {
        "eng": "Residence Status",
        "ara": "حالة الإقامة",
        "fra": "Statut de résidence"
      },
      "controlType": "dropdown",
      "inputRequired": true,
      "validators": [],
      "required": true
    },
    {
      "id": "addressLine1",
      "description": "addressLine1",
      "labelName": {
        "eng": "Address Line1",
        "ara": "العنوان السطر 1",
        "fra": "Adresse 1"
      },
      "controlType": "textbox",
      "inputRequired": true,
      "validators": [
        {
          "type": "regex",
          "validator": "^(?=.{0,50}$).*",
          "arguments": []
        }
      ],
      "required": true
    },
    {
      "id": "addressLine2",
      "description": "addressLine2",
      "labelName": {
        "eng": "Address Line2",
        "ara": "العنوان السطر 2",
        "fra": "Adresse 2"
      },
      "controlType": "textbox",
      "inputRequired": true,
      "validators": [
        {
          "type": "regex",
          "validator": "^(?=.{0,50}$).*",
          "arguments": []
        }
      ],
      "required": false
    },
    {
      "id": "addressLine3",
      "description": "addressLine3",
      "labelName": {
        "eng": "Address Line3",
        "ara": "العنوان السطر 3",
        "fra": "Adresse 3"
      },
      "controlType": "textbox",
      "inputRequired": true,
      "validators": [
        {
          "type": "regex",
          "validator": "^(?=.{0,50}$).*",
          "arguments": []
        }
      ],
      "required": false
    },
    {
      "id": "region",
      "description": "region",
      "labelName": {
        "eng": "Region",
        "ara": "منطقة",
        "fra": "Région"
      },
      "controlType": "dropdown",
      "inputRequired": true,
      "validators": [
        {
          "type": "regex",
          "validator": "^(?=.{0,50}$).*",
          "arguments": []
        }
      ],
      "required": true
    },
    {
      "id": "province",
      "description": "province",
      "labelName": {
        "eng": "Province",
        "ara": "المحافظة",
        "fra": "Province"
      },
      "controlType": "dropdown",
      "inputRequired": true,
      "validators": [
        {
          "type": "regex",
          "validator": "^(?=.{0,50}$).*",
          "arguments": []
        }
      ],
      "required": true
    },
    {
      "id": "city",
      "description": "city",
      "labelName": {
        "eng": "City",
        "ara": "مدينة",
        "fra": "Ville"
      },
      "controlType": "dropdown",
      "inputRequired": true,
      "validators": [
        {
          "type": "regex",
          "validator": "^(?=.{0,50}$).*",
          "arguments": []
        }
      ],
      "required": true
    },
    {
      "id": "zone",
      "description": "zone",
      "labelName": {
        "eng": "Zone",
        "ara": "منطقة",
        "fra": "Zone"
      },
      "controlType": "dropdown",
      "inputRequired": true,
      "validators": [],
      "required": true
    },
    {
      "id": "postalCode",
      "description": "postalCode",
      "labelName": {
        "eng": "Postal Code",
        "ara": "الكود البريدى",
        "fra": "code postal"
      },
      "controlType": "dropdown",
      "inputRequired": true,
      "validators": [
        {
          "type": "regex",
          "validator": "^[(?i)A-Z0-9]{5}$|^NA$",
          "arguments": []
        }
      ],
      "required": true
    },
    {
      "id": "phone",
      "description": "phone",
      "labelName": {
        "eng": "Phone",
        "ara": "هاتف",
        "fra": "Téléphone"
      },
      "controlType": "textbox",
      "inputRequired": true,
      "validators": [
        {
          "type": "regex",
          "validator": "^([6-9]{1})([0-9]{9})$",
          "arguments": []
        }
      ],
      "required": true
    },
    {
      "id": "email",
      "description": "email",
      "labelName": {
        "eng": "Email",
        "ara": "البريد الإلكتروني",
        "fra": "Email"
      },
      "controlType": "textbox",
      "inputRequired": true,
      "validators": [
        {
          "type": "regex",
          "validator": "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-zA-Z]{2,})$",
          "arguments": []
        }
      ],
      "required": true
    },
    {
      "id": "proofOfAddress",
      "description": "proofOfAddress",
      "labelName": [
        {
          "value": "Address Proof",
          "language": "eng"
        }
      ],
      "controlType": "fileupload",
      "inputRequired": true,
      "validators": [],
      "required": false
    },
    {
      "id": "proofOfIdentity",
      "description": "proofOfIdentity",
      "labelName": [
        {
          "value": "Identity Proof",
          "language": "eng"
        }
      ],
      "controlType": "fileupload",
      "inputRequired": true,
      "validators": [],
      "required": true
    },
    {
      "id": "proofOfRelationship",
      "description": "proofOfRelationship",
      "labelName": [
        {
          "value": "Relationship Proof",
          "language": "eng"
        }
      ],
      "controlType": "fileupload",
      "inputRequired": true,
      "validators": [],
      "required": true
    },
    {
      "id": "proofOfDateOfBirth",
      "description": "proofOfDateOfBirth",
      "labelName": [
        {
          "value": "DOB Proof",
          "language": "eng"
        }
      ],
      "controlType": "fileupload",
      "inputRequired": true,
      "validators": [],
      "required": true
    },
    {
      "id": "proofOfException",
      "description": "proofOfException",
      "labelName": [
        {
          "value": "Exception Proof",
          "language": "eng"
        }
      ],
      "controlType": "fileupload",
      "inputRequired": true,
      "validators": [],
      "required": true
    },
    {
      "id": "proofOfException-1",
      "description": "proofOfException",
      "labelName": [
        {
          "value": "Exception Proof 2",
          "language": "eng"
        }
      ],
      "controlType": "fileupload",
      "inputRequired": true,
      "validators": [],
      "required": true
    }
  ],
  "locationHierarchy": [
    "region",
    "province",
    "city",
    "zone",
    "postalCode"
  ]
}
```