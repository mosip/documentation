# UI Specification for Registration Client

UI specification helps us identify how the data in an ID attribute (attributes of an ID object) is going to be retrieved from the UI. The UI screens in registration client application and pre-registration application are rendered using their respective UI specification JSON. We have different UI Specifications for Registration Client & Pre-registration which is derived from the ID Schema. Here we would be discussing about the properties used in the UI specification of Registration Client.

## Registration Client UI Specification

Here is one of the attributes in the Registration Client UI Specification.

```
{
  "id": "fullName",
  "description": "Full Name",
  "label": {
    "primary": "Full Name",
    "secondary": "الاسم الكامل"
  },
  "type": "simpleType",
  "minimum": 0,
  "maximum": 0,
  "controlType": "textbox",
  "fieldType": "default",
  "format": "none",
  "fieldCategory": "pvt",
  "inputRequired": true,
  "validators": [
    {
      "type": "regex",
      "validator": "^(?=.{3,50}$).*",
      "arguments": []
    }
  ],
  "bioAttributes": null,
  "requiredOn": [],
  "subType": "name",
  "contactType": null,
  "group": "FullName",
  "required": true
}
```

## UI Specification Properties

Below are the properties in registration client UI specification that are used to store ID attributes in an ID object.

| Name                 | Description                                                                 | Example                                                 |
| -------------------- | --------------------------------------------------------------------------- | ------------------------------------------------------- |
| id                   | Unique ID for each attribute in ID Object                                   | fullName                                                |
| description          | Description for the ID attribute                                            | ID Schema Version                                       |
| label                | Label used for displaying the ID attribute in the UI                        |                                                         |
| label.primary        | Label in primary language                                                   | Full Name                                               |
| label.secondary      | Label in secondary language                                                 | الاسم الكامل                                            |
| type                 | Data type                                                                   | number, string, documentType, biometricType, simpleType |
| minimum              | Minimum value if the data type is number                                    | 0                                                       |
| maximum              | Maximum value if the data type is number                                    | 0                                                       |
| controlType          | UI element used for displaying the ID attribute                             | textbox, checkbox, dropdown, date                       |
| fieldType            | Used to identify if it is a default field or a dynamic field                | default, dynamic                                        |
| format               | To validate the format should be in upper or lower case                     | lowercase, uppercase, none                              |
| fieldCategory        | Used to decide in which sub-packet the data will be placed                  | kyc, pvt, evidence, optional, none                      |
| inputRequired        | Used to identify if UI input is needed or not                               | true or false                                           |
| validators           | List of validators for the ID attribute                                     |                                                         |
| validators.type      | Type of validation engine                                                   | regex                                                   |
| validators.validator | Pattern / methodName / scriptName / expression for the validation           |                                                         |
| validators.arguments | List of arguments needed for the validator                                  |                                                         |
| bioAttributes        | List of biometric attributes                                                |                                                         |
| requiredOn           | List of rules using which system can decide to make the attribute mandatory |                                                         |
| requiredOn.engine    | Rule engine used                                                            |                                                         |
| requiredOn.expr      | Expression for the rule                                                     |                                                         |
| subType              | Used to identify it is which type of field                                  | location                                                |
| contactType          | Used to identify if the ID attributes belong to one of the contact types    | email, phone or postal                                  |
| group                | Used to group together the list of id attributes for update operation       |                                                         |
| required             | Used to decide if the ID attribute is mandatory or not                      | true or false                                           |

### ID

The id property is the unique id provided to a fields to uniquely identify it. The fields can be alpha-numeric without any spaces between them.

### Description

This is a non-mandatory property used to describe the ID attribute.

### Label

This property defines label name to be used in UI. The label has sub attributes as primary and secondary to store data in primary language and secondary language based on the country's configuration.

### Type

This property defines the field value type for the attribute. MOSIP supports primitive as well as user defined types.

Currently MOSIP supports the below data types, any MOSIP adopter can choose to define their own data types.

* string
* number
* integer
* simpleType
* documentType
* biometricType

Below are the definitions of the user defined data types currently being used in MOSIP.

```
"definitions": {
  "simpleType": {
    "uniqueItems": true,
    "additionalItems": false,
    "type": "array
    "items": {
	  "additionalProperties": false,
	  "type": "object
	  "required": [
	    "language
	    "value"
	  ],
	  "properties": {
	    "language": {
		  "type": "string"
	    },
	    "value": {
		  "type": "string"
	    }
	  }
    }
  },
  "documentType": {
    "additionalProperties": false,
    "type": "object
    "properties": {
	  "format": {
	    "type": "string"
	  },
	  "type": {
	    "type": "string"
	  },
	  "value": {
	    "type": "string"
	  }
    }
  },
  "biometricsType": {
    "additionalProperties": false,
    "type": "object
    "properties": {
	  "format": {
	    "type": "string"
	  },
	  "version": {
	    "type": "number
	    "minimum": 0
	  },
	  "value": {
	    "type": "string"
	  }
    }
  }
}
```

### Minimum

This property is applicable for only number fields to add UI level validation for minimum value.

### Maximum

Similar to minimum, this property is applicable to only number fields to add UI level validation for maximum value. It is applicable only if the value is greater than zero.

### Control Type

This property defines what kind of UI component to be used to capture data in UI. Currently the values that can be used are:

* textbox
* dropdown
* dob
* fileupload

### Field Type

This property identifies if the ID attribute is country specific (specified as dynamic) or is already defined in the platform (specified as default).

### Format

This property is used to add a simple validation in the UI level.

Currently, the allowed values here are

* lowercased - To validate if the data entered by the user is in lower case
* uppercased - To validate if the data entered by the user is in upper case

MOSIP adopter can choose to add more values for different types of validations.

### Field Category

This property defines where the ID attributes will be placed in packet structure. Currently, the new packet structure has three parts; private, evidence and optional. For more details on packet structure please go through our documentation on [Registration Packet](Registration-Packet.md).

| Values   | Description                                                                                                                                                        |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| none     | The ID attribute will be stored in all the packets.                                                                                                                |
| pvt      | It is for private information which will be used for authentication & will be stored in private packet.                                                            |
| evidence | This data is treated as proof and can be later removed by the adopter. This data will be stored in evidence packet.                                                |
| optional | This data is also treated as proof data for the registration and can be removed later by the adopter based on policy. This data will be stored in optional packet. |

### Input Required

This is a mandatory property which decides if the input is to be provided from the UI or not. Items which are marked as true will be validated using the ID object validator.

### Validator

This property enables us to add a the list of validators for the ID attribute. Each validator will have the below fields,

| Fields    | Description                                                            |
| --------- | ---------------------------------------------------------------------- |
| type      | for validation engine type                                             |
| validator | for pattern / methodName / scriptName / expression                     |
| arguments | array to hold parameter or dependent field ids required for validation |

Currently, regex is supported by MOSIP, the adopter can choose to add various types of validators.

### Bio Attributes

This property contains the list of biometric attributes that can be captured by the ID attributes which have type "biometricType".

* leftEye
* rightEye
* rightIndex
* rightLittle
* rightRing
* rightMiddle
* leftIndex
* leftLittle
* leftRing
* leftMiddle
* leftThumb
* rightThumb
* face

For various ID attribute there are different rules to capture biometrics,

* individualBiometrics - all the biometrics needs to be captured here if the resident is not an child
* individualAuthBiometrics - only one biometric is needed for authentication
* parentOrGuardianBiometrics - only one biometric is needed for authentication

### Required On

This property contains a list of rules which decides if the attribute is mandatory or not. It has additional fields, engine and expr which are used to specify the rule engine and the expression.

Example for individualAuthBiometrics:

```
"requiredOn": [
  {
    "engine": "MVEL",
    "expr": "!identity.isChild && identity.isUpdate && !(identity.updatableFieldGroups contains 'Biometrics' || identity.updatableFieldGroups contains 'GuardianDetails')"
  }
]
```

This expression states that, individual biometric authentication capture is madatory when,

* the resident is not child
* the resident has come for update
* the resident is not updating his/her biometrics
* the guardian of the resident is not providing his/her biometrics

Which means, the applicant is an adult applicant who has come to the registration center to update only his/her demographics details, so we must capture his/her biometrics for authentication.

### Sub type

This property helps the system to uniquely identify a attribute if we are not able to identify it using the type.

Example: In individualBiometrics, individualAuthBiometrics and parentOrGuardianBiometrics the types are same i.e. biometricType; hence to uniquely identify them we created sub types such as applicant, applicant-auth and introducer respectively.

### Contact Type

This property is used to identify the contact attributes. Here we have categorized the contact types into three categories, i.e. email, phone and postal (all the postal address related items).

### Group

This property is used to group the ID attributes so that we can select them in the update screen.

Examples:

* We have grouped all the address items as "Location", so that the resident needs to just select the group to update, i.e. the Location and in update screen he/she would be able to update all the location attributes.
* ID attributes related to Parent or Guardian are grouped together as "GuardianDetails".

### Required

This is a mandatory property which is needed to identify if the ID attribute is mandatory or not.

## Sample UI Specification

```
[
  {
    "id": "IDSchemaVersion",
    "description": "ID Schema Version",
    "label": {
      "primary": "IDSchemaVersion"
    },
    "type": "number",
    "minimum": 0,
    "maximum": 0,
    "controlType": null,
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "none",
    "inputRequired": false,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "IdSchemaVersion",
    "contactType": null,
    "group": null,
    "required": true
  },
  {
    "id": "UIN",
    "description": "UIN",
    "label": {
      "primary": "UIN"
    },
    "type": "string",
    "minimum": 0,
    "maximum": 0,
    "controlType": "textbox",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "none",
    "inputRequired": false,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "UIN",
    "contactType": null,
    "group": null,
    "required": false
  },
  {
    "id": "fullName",
    "description": "Full Name",
    "label": {
      "primary": "Full Name",
      "secondary": "الاسم الكامل"
    },
    "type": "simpleType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "textbox",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [
      {
        "type": "regex",
        "validator": "^(?=.{3,50}$).*",
        "arguments": []
      }
    ],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "name",
    "contactType": null,
    "group": "FullName",
    "required": true
  },
  {
    "id": "dateOfBirth",
    "description": "dateOfBirth",
    "label": {
      "primary": "DOB",
      "secondary": "دوب"
    },
    "type": "string",
    "minimum": 0,
    "maximum": 0,
    "controlType": "ageDate",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [
      {
        "type": "regex",
        "validator": "^(1869|18[7-9][0-9]|19[0-9][0-9]|20[0-9][0-9])/([0][1-9]|1[0-2])/([0][1-9]|[1-2][0-9]|3[01])$",
        "arguments": []
      }
    ],
    "bioAttributes": null,
    "requiredOn": [
      {
        "engine": "MVEL",
        "expr": "identity.isNew || (identity.isUpdate && (identity.updatableFieldGroups contains 'GuardianDetails' || identity.updatableFieldGroups contains 'DateOfBirth'))"
      }
    ],
    "subType": "dateOfBirth",
    "contactType": null,
    "group": "DateOfBirth",
    "required": true
  },
  {
    "id": "gender",
    "description": "gender",
    "label": {
      "primary": "Gender",
      "secondary": "جنس"
    },
    "type": "simpleType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "dropdown",
    "fieldType": "default",
    "format": "",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "Gender",
    "contactType": null,
    "group": "Gender",
    "required": true
  },
  {
    "id": "addressLine1",
    "description": "addressLine1",
    "label": {
      "primary": "AddressLine1",
      "secondary": "العنوان السطر 1"
    },
    "type": "simpleType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "textbox",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [
      {
        "type": "regex",
        "validator": "^(?=.{3,50}$).*",
        "arguments": []
      }
    ],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "addressLine1",
    "contactType": "Postal",
    "group": "Address",
    "required": true
  },
  {
    "id": "addressLine2",
    "description": "addressLine2",
    "label": {
      "primary": "AddressLine2",
      "secondary": "سطر العنوان 2"
    },
    "type": "simpleType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "textbox",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [
      {
        "type": "regex",
        "validator": "^(?=.{3,50}$).*",
        "arguments": []
      }
    ],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "addressLine2",
    "contactType": "Postal",
    "group": "Address",
    "required": false
  },
  {
    "id": "addressLine3",
    "description": "addressLine3",
    "label": {
      "primary": "AddressLine3",
      "secondary": "العنوانالخط 3"
    },
    "type": "simpleType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "textbox",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [
      {
        "type": "regex",
        "validator": "^(?=.{3,50}$).*",
        "arguments": []
      }
    ],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "addressLine3",
    "contactType": "Postal",
    "group": "Address",
    "required": false
  },
  {
    "id": "residenceStatus",
    "description": "residenceStatus",
    "label": {
      "primary": "Residence Status",
      "secondary": "حالة الإقامة"
    },
    "type": "simpleType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "dropdown",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "residenceStatus",
    "contactType": null,
    "group": "ResidenceStatus",
    "required": false
  },
  {
    "id": "referenceIdentityNumber",
    "description": "referenceIdentityNumber",
    "label": {
      "primary": "Reference Identity Number",
      "secondary": "حالة الإقامة"
    },
    "type": "string",
    "minimum": 0,
    "maximum": 0,
    "controlType": "textbox",
    "fieldType": "default",
    "format": "kyc",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [
      {
        "type": "regex",
        "validator": "^([0-9]{10,30})$",
        "arguments": []
      }
    ],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "none",
    "contactType": null,
    "group": "ReferenceIdentityNumber",
    "required": false
  },
  {
    "id": "region",
    "description": "region",
    "label": {
      "primary": "Region",
      "secondary": "منطقة"
    },
    "type": "simpleType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "dropdown",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "Region",
    "contactType": "Postal",
    "group": "Location",
    "required": true
  },
  {
    "id": "province",
    "description": "province",
    "label": {
      "primary": "Province",
      "secondary": "المحافظة"
    },
    "type": "simpleType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "dropdown",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "Province",
    "contactType": "Postal",
    "group": "Location",
    "required": true
  },
  {
    "id": "city",
    "description": "city",
    "label": {
      "primary": "City",
      "secondary": "مدينة"
    },
    "type": "simpleType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "dropdown",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "City",
    "contactType": "Postal",
    "group": "Location",
    "required": true
  },
  {
    "id": "zone",
    "description": "zone",
    "label": {
      "primary": "Zone",
      "secondary": "منطقة"
    },
    "type": "simpleType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "dropdown",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "Zone",
    "contactType": null,
    "group": "Location",
    "required": true
  },
  {
    "id": "postalCode",
    "description": "postalCode",
    "label": {
      "primary": "Postal Code",
      "secondary": "الكود البريدى"
    },
    "type": "string",
    "minimum": 0,
    "maximum": 0,
    "controlType": "dropdown",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "Postal Code",
    "contactType": "Postal",
    "group": "Location",
    "required": true
  },
  {
    "id": "phone",
    "description": "phone",
    "label": {
      "primary": "Phone",
      "secondary": "هاتف"
    },
    "type": "string",
    "minimum": 0,
    "maximum": 0,
    "controlType": "textbox",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [
      {
        "type": "regex",
        "validator": "^[+]*([0-9]{1})([0-9]{9})$",
        "arguments": []
      }
    ],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "Phone",
    "contactType": "email",
    "group": "Phone",
    "required": true
  },
  {
    "id": "email",
    "description": "email",
    "label": {
      "primary": "Email",
      "secondary": "البريد الإلكتروني"
    },
    "type": "string",
    "minimum": 0,
    "maximum": 0,
    "controlType": "textbox",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [
      {
        "type": "regex",
        "validator": "^[A-Za-z0-9_\\-]+(\\.[A-Za-z0-9_]+)*@[A-Za-z0-9_-]+(\\.[A-Za-z0-9_]+)*(\\.[a-zA-Z]{2,})$",
        "arguments": []
      }
    ],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "Email",
    "contactType": "email",
    "group": "Email",
    "required": true
  },
  {
    "id": "parentOrGuardianName",
    "description": "parentOrGuardianName",
    "label": {
      "primary": "Parent Name",
      "secondary": "اسم الوالدين"
    },
    "type": "simpleType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "textbox",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "evidence",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [
      {
        "engine": "MVEL",
        "expr": "( identity.isNew && identity.isChild ) || ( identity.isUpdate && identity.isChild )"
      }
    ],
    "subType": "parentOrGuardianName",
    "contactType": null,
    "group": "GuardianDetails",
    "required": false
  },
  {
    "id": "parentOrGuardianRID",
    "description": "parentOrGuardianRID",
    "label": {
      "primary": "Parent RID",
      "secondary": "الوالد RID"
    },
    "type": "string",
    "minimum": 0,
    "maximum": 0,
    "controlType": "textbox",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "evidence",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [
      {
        "engine": "MVEL",
        "expr": "( identity.isChild && (identity.parentOrGuardianUIN == nil || identity.parentOrGuardianUIN == empty) )"
      }
    ],
    "subType": "RID",
    "contactType": null,
    "group": "GuardianDetails",
    "required": false
  },
  {
    "id": "parentOrGuardianUIN",
    "description": "parentOrGuardianUIN",
    "label": {
      "primary": "Parent UIN",
      "secondary": "الأصل UIN"
    },
    "type": "string",
    "minimum": 0,
    "maximum": 0,
    "controlType": "textbox",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "evidence",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [
      {
        "engine": "MVEL",
        "expr": "( identity.isChild && (identity.parentOrGuardianRID == nil || identity.parentOrGuardianRID == empty) )"
      }
    ],
    "subType": "UIN",
    "contactType": null,
    "group": "GuardianDetails",
    "required": false
  },
  {
    "id": "proofOfAddress",
    "description": "proofOfAddress",
    "label": {
      "primary": "Address Proof",
      "secondary": "إثبات العنوان"
    },
    "type": "documentType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "fileupload",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [
      {
        "engine": "MVEL",
        "expr": "identity.isNew || ( identity.isUpdate && (identity.updatableFields contains 'addressLine1' || identity.updatableFields contains 'addressLine2' || identity.updatableFields contains 'addressLine3'))"
      }
    ],
    "subType": "POA",
    "contactType": null,
    "group": "Documents",
    "required": false
  },
  {
    "id": "proofOfIdentity",
    "description": "proofOfIdentity",
    "label": {
      "primary": "Identity Proof",
      "secondary": "إثبات الهوية"
    },
    "type": "documentType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "fileupload",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [
      {
        "engine": "MVEL",
        "expr": "identity.isNew || ( identity.isUpdate && identity.updatableFields contains 'fullName')"
      }
    ],
    "subType": "POI",
    "contactType": null,
    "group": "Documents",
    "required": true
  },
  {
    "id": "proofOfRelationship",
    "description": "proofOfRelationship",
    "label": {
      "primary": "Relationship Proof",
      "secondary": "إثبات العلاقة"
    },
    "type": "documentType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "fileupload",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [
      {
        "engine": "MVEL",
        "expr": "( identity.isNew && identity.isChild ) || ( identity.isUpdate && (identity.updatableFieldGroups contains 'GuardianDetails' || identity.isChild))"
      }
    ],
    "subType": "POR",
    "contactType": null,
    "group": "Documents",
    "required": false
  },
  {
    "id": "proofOfDateOfBirth",
    "description": "proofOfDateOfBirth",
    "label": {
      "primary": "DOB Proof",
      "secondary": "دليل DOB"
    },
    "type": "documentType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "fileupload",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [
      {
        "engine": "MVEL",
        "expr": "identity.isUpdate && identity.updatableFields contains 'dateOfBirth'"
      }
    ],
    "subType": "POB",
    "contactType": null,
    "group": "Documents",
    "required": false
  },
  {
    "id": "proofOfException",
    "description": "proofOfException",
    "label": {
      "primary": "Exception Proof",
      "secondary": "إثبات الاستثناء"
    },
    "type": "documentType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "fileupload",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "evidence",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "POE",
    "contactType": null,
    "group": "Documents",
    "required": false
  },
  {
    "id": "proofOfException-1",
    "description": "proofOfException",
    "label": {
      "primary": "Exception Proof",
      "secondary": "إثبات الاستثناء 2"
    },
    "type": "documentType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "fileupload",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "evidence",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": null,
    "requiredOn": [],
    "subType": "POE",
    "contactType": null,
    "group": "Documents",
    "required": false
  },
  {
    "id": "individualBiometrics",
    "description": "",
    "label": {
      "primary": "Applicant Biometrics",
      "secondary": "القياسات الحيوية الفردية"
    },
    "type": "biometricsType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "biometrics",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": [
      "leftEye",
      "rightEye",
      "rightIndex",
      "rightLittle",
      "rightRing",
      "rightMiddle",
      "leftIndex",
      "leftLittle",
      "leftRing",
      "leftMiddle",
      "leftThumb",
      "rightThumb",
      "face"
    ],
    "requiredOn": [
      {
        "engine": "MVEL",
        "expr": "(identity.isNew || identity.isLost || ( identity.isUpdate && identity.updatableFieldGroups contains 'Biometrics'))"
      }
    ],
    "subType": "applicant",
    "contactType": null,
    "group": "Biometrics",
    "required": true
  },
  {
    "id": "individualAuthBiometrics",
    "description": "Used to hold biometrics only for authentication",
    "label": {
      "primary": "Authentication Biometrics",
      "secondary": "القياسات الحيوية الفردية"
    },
    "type": "biometricsType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "biometrics",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": [
      "leftEye",
      "rightEye",
      "rightIndex",
      "rightLittle",
      "rightRing",
      "rightMiddle",
      "leftIndex",
      "leftLittle",
      "leftRing",
      "leftMiddle",
      "leftThumb",
      "rightThumb",
      "face"
    ],
    "requiredOn": [
      {
        "engine": "MVEL",
        "expr": "!identity.isChild && identity.isUpdate && !(identity.updatableFieldGroups contains 'Biometrics' || identity.updatableFieldGroups contains 'GuardianDetails')"
      }
    ],
    "subType": "applicant-auth",
    "contactType": null,
    "group": null,
    "required": false
  },
  {
    "id": "parentOrGuardianBiometrics",
    "description": "",
    "label": {
      "primary": "Guardian Biometrics",
      "secondary": "القياسات الحيوية للوالدين"
    },
    "type": "biometricsType",
    "minimum": 0,
    "maximum": 0,
    "controlType": "biometrics",
    "fieldType": "default",
    "format": "none",
    "fieldCategory": "pvt",
    "inputRequired": true,
    "validators": [],
    "bioAttributes": [
      "leftEye",
      "rightEye",
      "rightIndex",
      "rightLittle",
      "rightRing",
      "rightMiddle",
      "leftIndex",
      "leftLittle",
      "leftRing",
      "leftMiddle",
      "leftThumb",
      "rightThumb",
      "face"
    ],
    "requiredOn": [
      {
        "engine": "MVEL",
        "expr": "(identity.isChild && identity.isNew) || (identity.isUpdate && identity.updatableFieldGroups contains 'GuardianDetails')"
      }
    ],
    "subType": "introducer",
    "contactType": null,
    "group": "Biometrics",
    "required": false
  }
]
```

The above attributes which are available in the current MOSIP platform, adopters can choose to add new attributes or remove attributes based on their requirement.

## Steps to create your own UI specification

1. Create the basic ID Object definition & ID Schema as per your requirement.
2. If any of your attributes needs pre-defined master data (example: Blood Group)
   * The adopters can use our [Dynamic Fields API](Dynamic-Fields-APIs.md) to create dynamic master data
   * Then the adopter can add this field in the UI specification and mark the field type as dynamic
3. Once all the attributes are added, the adopter can create the UI Specification for registration client using the [ID Schema APIs](ID-Schema-APIs.md).
4. Once the UI Specification is created it needs to be published. Once published, the ID schema version is updated & an ID Schema is generated from the registration client UI specification for verification.
5. The adopters now can verify the structure of the ID schema derived against the one that they had defined earlier & make modifications as required.
6. Then the [UI specification for Pre-registration](UI-Specification-for-Pre-Registration.md) needs to be created and should be updated in the file "pre-registration-demographic.json".
7. Once the file is placed the property "mosip.idschema.version" in pre-registration properties file should be updated to the latest ID schema version.
8. All the services needs to be re-started to use the new UI.
