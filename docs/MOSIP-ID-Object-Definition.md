ID definition is the key to use MOSIP. ID definition describes the attributes a country or entity will capture from an Individual. Since, MOSIP is a generic identity platform, the attributes of an ID cannot be predefined by MOSIP. One country may capture 5 attributes and another 10 attributes. So, to accommodate this flexibility MOSIP provides a feature where a country defines an ID object definition schema. This will be the first step in using MOSIP. Once an ID object schema is defined, all applications built on top of MOSIP platform to capture data must conform to the ID object schema.

* As a rule of thumb, only attributes related to a resident (demographic and biometric), his/her parent/guardian attributes (demographic and biometric) or evidence data (documents) should be captured in the ID object
* All other data captured in the field like operator/supervisor data should not be part of the ID object
* Schema can use predefined JSON data types to define attributes
* Schema can also create User Defined Types (UDTs) to specify the format of data to be captured. For example, biometrics data should always be in CBEFF ISO 19795 - 1 format. This helps in specifying the format of the data that is captured
* Schema can also categorize where the data will be stored using a property called "field category"; which will have values such as pvt, kyc, evidence, optional or none to store data in various sub-packets (i.e. private, evidence and optional) based on rules defined in packet manager.
* MOSIP will provide in-built validators for certain data types like CBEFF which can be used for data validation

Below is a sample ID object definition schema and a sample of a JSON object based on the schema:
```JSON
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

Below is a sample JSON for Private packet as per the schema defined above: 
```JSON
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

All operations related to ID will have a place holder to receive the ID Object as per the schema, validate it as per the schema and store it AS IS. For example, when an Individual creates a Pre-Registration, the API for Pre-Registration will look as below:
```
//CREATE Pre-Registration
request body
{
	"id" : "mosip.pre-registration.create",
	"version" : "1.0",	
	"request" : 
	{
		//JSON request as per the id object schema defined by the country				
	}
}
```
Also, please refer to, 
* [ID Repository API](ID-Repository-APIs.md) on how an ID Object is managed in MOSIP
* [UI Specification for Registration Client] on how ID data is collected from Registration Client UI
* [UI Specification for Pre-registration] on how ID data is collected from Pre-registration UI
