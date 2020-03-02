ID definition is the key to use MOSIP. ID definition describes the attributes a country or entity will capture from an Individual. Since, MOSIP is a generic Identity platform the attributes of an ID cannot be predefined by MOSIP. One country may capture 5 attributes and another 10 attributes. So, to accommodate this flexibility MOSIP provides a feature where a country defines an ID object definition schema. This will be the first step in using MOSIP. Once an ID object schema is defined, all applications built on top of MOSIP platform to capture data MUST conform to the ID object schema.

* As a rule of thumb, only attributes related to an individual (demographic and biometric), his/her parent/guardian attributes (demographic and biometric) should be captured in the ID object
* All other data captured in the field like operator/supervisor data should not be part of the ID object
* Schema can use predefined JSON data types to define attributes
* Schema can also create User Defined Types (UDTs) to specify the format of data to be captured. For example, biometrics data should always be in CBEFF ISO 19795 - 1 format. This helps in specifying the format of the data that is captured
* MOSIP will provide in-built validators for certain data types like CBEFF which can be used for data validation

Below is a sample ID object definition schema and a sample of a JSON object based on the schema.

```JSON
{
  "$id": "http://mosip.io/id_object/1.0/id_object.json",
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "MOSIP ID schema",
  "description": "Sample ID schema",
  "type": "object",
  "additionalProperties": false,
  "properties": {
    "identity": {
      "title": "identity",
      "description": "This schema holds all the attributes of an Identity",
      "type": "object",
      "additionalProperties": true,
      "properties": {
        "IDSchemaVersion": {
          "type": "number",
          "minimum": 0
        },
        "UIN": {
          "type": "integer",
          "minimum": 0
        },
        "fullName": {
          "$ref": "#/definitions/simpleType"
        },
        "dateOfBirth": {
          "type": "string"
        },
        "age": {
          "type": "integer"
        },
        "gender": {
          "$ref": "#/definitions/simpleType"
        },
        "addressLine1": {
          "$ref": "#/definitions/simpleType"
        },
        "addressLine2": {
          "$ref": "#/definitions/simpleType"
        },
        "addressLine3": {
          "$ref": "#/definitions/simpleType"
        },
        "region": {
          "$ref": "#/definitions/simpleType"
        },
        "province": {
          "$ref": "#/definitions/simpleType"
        },
        "city": {
          "$ref": "#/definitions/simpleType"
        },
        "postalCode": {
          "type": "string"
        },
        "phone": {
          "type": "string"
        },
        "email": {
          "type": "string"
        },
        "residenceStatus": {
          "$ref": "#/definitions/simpleType"
        },
        "parentOrGuardianName": {
          "$ref": "#/definitions/simpleType"
        },
        "parentOrGuardianRID": {
          "type": "integer",
          "minimum": 0
        },
        "parentOrGuardianUIN": {
          "type": "integer",
          "minimum": 0
        },
        "proofOfAddress": {
          "$ref": "#/definitions/documentType"
        },
        "proofOfIdentity": {
          "$ref": "#/definitions/documentType"
        },
        "proofOfRelationship": {
          "$ref": "#/definitions/documentType"
        },
        "proofOfDateOfBirth": {
          "$ref": "#/definitions/documentType"
        },
        "proofOfException": {
          "$ref": "#/definitions/documentType"
        },
        "individualBiometrics": {
          "$ref": "#/definitions/biometricsType"
        },
        "parentOrGuardianBiometrics": {
          "$ref": "#/definitions/biometricsType"
        }
      }
    }
  },
  "definitions": {
    "simpleType": {
      "type": "array",
      "additionalItems": false,
      "uniqueItems": true,
      "items": {
        "type": "object",
        "required": [
          "language",
          "value"
        ],
        "additionalProperties": false,
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
      },
      "additionalProperties": false
    },
    "biometricsType": {
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
      },
      "additionalProperties": false
    }
  }
}
```

Below is a sample JSON as per the schema defined above 

```JSON
{
  "identity": {
    "IDSchemaVersion": 1,
    "UIN": 9687061394,
    "fullName": [
      {
        "language": "ara",
        "value": "ابراهيم بن علي"
      },
      {
        "language": "fra",
        "value": "Ibrahim Ibn Ali"
      }
    ],
    "dateOfBirth": "1955/04/15",
    "age": 45,
    "gender": [
      {
        "language": "fra",
        "value": "Femelle"
      }
    ],
    "addressLine1": [
      {
        "language": "ara",
        "value": "عنوان العينة سطر 1"
      },
      {
        "language": "fra",
        "value": "exemple d'adresse ligne 1"
      }
    ],
    "addressLine2": [
      {
        "language": "ara",
        "value": "عنوان العينة سطر 2"
      },
      {
        "language": "fra",
        "value": "exemple d'adresse ligne 2"
      }
    ],
    "addressLine3": [
      {
        "language": "ara",
        "value": "عنوان العينة سطر 2"
      },
      {
        "language": "fra",
        "value": "exemple d'adresse ligne 2"
      }
    ],
    "region": [
      {
        "language": "fra",
        "value": "RSK"
      }
    ],
    "province": [
      {
        "language": "fra",
        "value": "Kénitra"
      }
    ],
    "city": [
      {
        "language": "fra",
        "value": "Kénitra"
      }
    ],
    "postalCode": "10111",
    "phone": "9876543210",
    "email": "abc@xyz.com",
    "localAdministrativeAuthority": [
      {
        "language": "fra",
        "value": "QRHS"
      }
    ],
    "parentOrGuardianRID": 212124324784912,
    "parentOrGuardianUIN": 212124324784912,
    "parentOrGuardianName": [
      {
        "language": "ara",
        "value": "سلمى"
      },
      {
        "language": "fra",
        "value": "salma"
      }
    ],
    "residenceStatus": "abc",
    "proofOfAddress": {
      "format": "pdf",
      "type": "RNC",
      "value": "fileReferenceID"
    },
    "proofOfIdentity": {
      "format": "txt",
      "type": "PAN card",
      "value": "fileReferenceID"
    },
    "proofOfRelationship": {
      "format": "pdf",
      "type": "Passeport",
      "value": "fileReferenceID"
    },
    "proofOfDateOfBirth": {
      "format": "pdf",
      "type": "passport",
      "value": "fileReferenceID"
    },
    "individualBiometrics": {
      "format": "cbeff",
      "version": 1,
      "value": "fileReferenceID"
    },
    "parentOrGuardianBiometrics": {
      "format": "cbeff",
      "version": 1.1,
      "value": "fileReferenceID"
    }
  }
}
```
All operations related to ID will have a place holder to receive the ID Object as per the schema, validate it as per the schema and store it AS IS. For example, when an Individual creates a Pre-Registration, the API for Pre-Registration will look as below

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
Also, please refer to [**ID Repository API**](ID-Repository-API) on how an ID Object is managed in MOSIP.