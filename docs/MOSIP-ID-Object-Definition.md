# MOSIP ID Object Definition

ID Object describes attributes that a country or entity will capture from an Individual. Since MOSIP is a generic identity platform the attributes of an ID cannot be predefined by MOSIP. One country may capture, say, 5 attributes and another 10. So to accommodate this flexibility MOSIP provides a feature to define ID Object. This will be the first step in using MOSIP. Once an ID Object is defined all applications built on top of MOSIP platform must conform to the same.

## ID Object Definition

In order to define the ID object, MOSIP adopters need to analyze the attributes that they need in their ID object. We have provided a [sample excel](https://github.com/mosip/documentation/tree/1.1.5/docs/\_sources/id\_schema/Sample\_ID\_Object\_Definition.xlsx) which might be helpful for adopter to analyze their ID attributes. The items that the adopter needs to analyze as part of tis exercise are:

* ID attributes that would be collected to identify a resident uniquely. Example: Attributes such as, Name, Gender, DateOfBirth, Address, Biometrics etc.
* Additional evidence attributes that would be collected as evidence. Example: Attributes such as proof documents (Identity, Address, Date of Birth, Relationship, etc) or Introducer.
* Optional attributes that would be collected for processing purpose but might need to discarded later.
* Validations for the above attributes. Example: Basic reg-ex validations for text fields, flow validations for capturing evidence data.
* Various work flows for various types of applicants (say, a minor or a resident without any evidence, etc.)

Once an adopter has proper clarity on the above topics, it is very easy for them to construct an ID schema.

## ID Schema

ID schema is a JSON schema which would be used for defining the structure, content, and (to some extent) semantics of an ID object. It lets us specify metadata (data about data) about what an ID object’s attributes mean and what values are valid for those attributes.

We use the ID schema JSON to validate the ID object when,

* ID object is created in Pre-registration
* ID object is created in Registration Client
* Packet is opened in Registration Processor
* ID data is stored in ID Repository

Below is a sample ID schema JSON.

```
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "description": "MOSIP Sample identity",
  "additionalProperties": false,
  "title": "MOSIP identity",
  "type": "object",
  "definitions": {
    "simpleType": {
      "uniqueItems": true,
      "additionalItems": false,
      "type": "array",
      "items": {
        "additionalProperties": false,
        "type": "object",
        "required": [
          "language",
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
      "type": "object",
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
      "type": "object",
      "properties": {
        "format": {
          "type": "string"
        },
        "version": {
          "type": "number",
          "minimum": 0
        },
        "value": {
          "type": "string"
        }
      }
    }
  },
  "properties": {
    "identity": {
      "additionalProperties": false,
      "type": "object",
      "required": [
        "IDSchemaVersion",
        "fullName",
        "dateOfBirth",
        "gender",
        "addressLine1",
        "addressLine2",
        "addressLine3",
        "region",
        "province",
        "city",
        "zone",
        "postalCode",
        "phone",
        "email",
        "proofOfIdentity",
        "individualBiometrics"
      ],
      "properties": {
        "proofOfAddress": {
          "bioAttributes": [],
          "fieldCategory": "pvt",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/documentType"
        },
        "gender": {
          "bioAttributes": [],
          "fieldCategory": "pvt",
          "format": "",
          "fieldType": "default",
          "$ref": "#/definitions/simpleType"
        },
        "city": {
          "bioAttributes": [],
          "validators": [
            {
              "validator": "^(?=.{0,50}$).*",
              "arguments": [],
              "type": "regex"
            }
          ],
          "fieldCategory": "pvt",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/simpleType"
        },
        "postalCode": {
          "bioAttributes": [],
          "validators": [
            {
              "validator": "^[(?i)A-Z0-9]{5}$|^NA$",
              "arguments": [],
              "type": "regex"
            }
          ],
          "fieldCategory": "pvt",
          "format": "none",
          "type": "string",
          "fieldType": "default"
        },
        "proofOfException-1": {
          "bioAttributes": [],
          "fieldCategory": "evidence",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/documentType"
        },
        "referenceIdentityNumber": {
          "bioAttributes": [],
          "validators": [
            {
              "validator": "^([0-9]{10,30})$",
              "arguments": [],
              "type": "regex"
            }
          ],
          "fieldCategory": "pvt",
          "format": "kyc",
          "type": "string",
          "fieldType": "default"
        },
        "individualBiometrics": {
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
          "fieldCategory": "pvt",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/biometricsType"
        },
        "province": {
          "bioAttributes": [],
          "validators": [
            {
              "validator": "^(?=.{0,50}$).*",
              "arguments": [],
              "type": "regex"
            }
          ],
          "fieldCategory": "pvt",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/simpleType"
        },
        "zone": {
          "bioAttributes": [],
          "fieldCategory": "pvt",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/simpleType"
        },
        "proofOfDateOfBirth": {
          "bioAttributes": [],
          "fieldCategory": "pvt",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/documentType"
        },
        "addressLine1": {
          "bioAttributes": [],
          "validators": [
            {
              "validator": "^(?=.{0,50}$).*",
              "arguments": [],
              "type": "regex"
            }
          ],
          "fieldCategory": "pvt",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/simpleType"
        },
        "addressLine2": {
          "bioAttributes": [],
          "validators": [
            {
              "validator": "^(?=.{3,50}$).*",
              "arguments": [],
              "type": "regex"
            }
          ],
          "fieldCategory": "pvt",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/simpleType"
        },
        "residenceStatus": {
          "bioAttributes": [],
          "fieldCategory": "kyc",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/simpleType"
        },
        "addressLine3": {
          "bioAttributes": [],
          "validators": [
            {
              "validator": "^(?=.{3,50}$).*",
              "arguments": [],
              "type": "regex"
            }
          ],
          "fieldCategory": "pvt",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/simpleType"
        },
        "email": {
          "bioAttributes": [],
          "validators": [
            {
              "validator": "^[A-Za-z0-9_\\-]+(\\.[A-Za-z0-9_]+)*@[A-Za-z0-9_-]+(\\.[A-Za-z0-9_]+)*(\\.[a-zA-Z]{2,})$",
              "arguments": [],
              "type": "regex"
            }
          ],
          "fieldCategory": "pvt",
          "format": "none",
          "type": "string",
          "fieldType": "default"
        },
        "parentOrGuardianRID": {
          "bioAttributes": [],
          "fieldCategory": "evidence",
          "format": "none",
          "type": "string",
          "fieldType": "default"
        },
        "parentOrGuardianBiometrics": {
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
          "fieldCategory": "pvt",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/biometricsType"
        },
        "fullName": {
          "bioAttributes": [],
          "validators": [
            {
              "validator": "^(?=.{3,50}$).*",
              "arguments": [],
              "type": "regex"
            }
          ],
          "fieldCategory": "pvt",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/simpleType"
        },
        "dateOfBirth": {
          "bioAttributes": [],
          "validators": [
            {
              "validator": "^(1869|18[7-9][0-9]|19[0-9][0-9]|20[0-9][0-9])/([0][1-9]|1[0-2])/([0][1-9]|[1-2][0-9]|3[01])$",
              "arguments": [],
              "type": "regex"
            }
          ],
          "fieldCategory": "pvt",
          "format": "none",
          "type": "string",
          "fieldType": "default"
        },
        "individualAuthBiometrics": {
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
          "fieldCategory": "pvt",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/biometricsType"
        },
        "parentOrGuardianUIN": {
          "bioAttributes": [],
          "fieldCategory": "evidence",
          "format": "none",
          "type": "string",
          "fieldType": "default"
        },
        "proofOfIdentity": {
          "bioAttributes": [],
          "fieldCategory": "pvt",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/documentType"
        },
        "IDSchemaVersion": {
          "bioAttributes": [],
          "fieldCategory": "none",
          "format": "none",
          "type": "number",
          "fieldType": "default",
          "minimum": 0
        },
        "proofOfException": {
          "bioAttributes": [],
          "fieldCategory": "evidence",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/documentType"
        },
        "phone": {
          "bioAttributes": [],
          "validators": [
            {
              "validator": "^[+]*([0-9]{1})([0-9]{9})$",
              "arguments": [],
              "type": "regex"
            }
          ],
          "fieldCategory": "pvt",
          "format": "none",
          "type": "string",
          "fieldType": "default"
        },
        "parentOrGuardianName": {
          "bioAttributes": [],
          "fieldCategory": "evidence",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/simpleType"
        },
        "proofOfRelationship": {
          "bioAttributes": [],
          "fieldCategory": "pvt",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/documentType"
        },
        "UIN": {
          "bioAttributes": [],
          "fieldCategory": "none",
          "format": "none",
          "type": "string",
          "fieldType": "default"
        },
        "region": {
          "bioAttributes": [],
          "validators": [
            {
              "validator": "^(?=.{0,50}$).*",
              "arguments": [],
              "type": "regex"
            }
          ],
          "fieldCategory": "pvt",
          "format": "none",
          "fieldType": "default",
          "$ref": "#/definitions/simpleType"
        }
      }
    }
  }
}
```

## ID JSON

ID JSON is an instance of the ID Schema (derived from ID Schema). It contains the basic details of an individual so that we can uniquely identify them in MOSIP.

Below is a sample ID JSON for private packet as per the schema defined above:

```
{
  "identity": {
    "proofOfAddress": {
      "value": "proofOfAddress",
      "type": "ECR",
      "format": "pdf"
    },
    "gender": [
      {
        "language": "eng",
        "value": "Male"
      },
      {
        "language": "ara",
        "value": "الذكر"
      }
    ],
    "city": [
      {
        "language": "eng",
        "value": "Kenitra"
      },
      {
        "language": "ara",
        "value": "القنيطرة"
      }
    ],
    "postalCode": "14022",
    "fullName": [
      {
        "language": "eng",
        "value": "Hassan Ali"
      },
      {
        "language": "ara",
        "value": "حسن علي"
      }
    ],
    "dateOfBirth": "2000/01/07",
    "referenceIdentityNumber": "5465665454",
    "individualBiometrics": {
      "format": "cbeff",
      "version": 1,
      "value": "individualBiometrics_bio_CBEFF"
    },
    "proofOfIdentity": {
      "value": "proofOfIdentity",
      "type": "CAN",
      "format": "pdf"
    },
    "IDSchemaVersion": 0.1,
    "province": [
      {
        "language": "eng",
        "value": "Kenitra"
      },
      {
        "language": "ara",
        "value": "القنيطرة"
      }
    ],
    "zone": [
      {
        "language": "eng",
        "value": "Ben Mansour"
      },
      {
        "language": "ara",
        "value": "بن منصور"
      }
    ],
    "phone": "6352000101",
    "addressLine1": [
      {
        "language": "eng",
        "value": "HSR Conlony"
      },
      {
        "language": "ara",
        "value": "هسر كُنلُني"
      }
    ],
    "addressLine2": [
      {
        "language": "eng",
        "value": "SECTOR-2"
      },
      {
        "language": "ara",
        "value": "سِكتُر-٢"
      }
    ],
    "residenceStatus": [
      {
        "language": "eng",
        "value": "Foreigner"
      },
      {
        "language": "ara",
        "value": "أجنبي"
      }
    ],
    "addressLine3": [
      {
        "language": "eng",
        "value": "HSRR"
      },
      {
        "language": "ara",
        "value": "هسرر"
      }
    ],
    "region": [
      {
        "language": "eng",
        "value": "Rabat Sale Kenitra"
      },
      {
        "language": "ara",
        "value": "جهة الرباط سلا القنيطرة"
      }
    ],
    "email": "hassan.ali2000@gmail.com"
  }
}
```

## UI Specification

UI specification helps us identify how the data in an ID attribute (attributes of an ID object) is going to be retrieved from the UI. The UI screens in registration client application and pre-registration application are rendered using their respective UI specification JSON. We have different UI Specifications for Registration Client & Pre-registration which is derived from the ID Schema.

For details about the UI specification of registration client & pre-registration please visit the respective pages,

* [UI Specification for Registration Client](UI-Specification-for-Registration-Client.md)
* [UI Specification for Pre-registration](UI-Specification-for-Pre-Registration.md)

## Relationship between ID Schema, ID Object & UI Specification

![](\_images/id\_schema/id\_schema\_concept.png)
