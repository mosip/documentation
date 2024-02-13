# Update identity-mapping json file in configuration

As part of the migration process, we will be updating the latest version of the `identity-mapping.json` file (1.2.0.1) from the `mosip-config`. This update involves modifying the mapping values to align with the id schema of the respective country.

To guide you through the updating process, please refer to the following information:

In the provided sample `identity-mapping.json`, the focus will be solely on modifying the mapper values to match the id schema of the country.

```
{
   "identity":{
      "IDSchemaVersion":{
         "value":"IDSchemaVersion"
      },
      "name":{
         "value":"fullName"
      },
      "gender":{
         "value":"gender"
      },
      "dob":{
         "value":"dateOfBirth"
      },
      "age":{
         "value":"age"
      },
      "introducerRID":{
         "value":"introducerRID"
      },
      "introducerUIN":{
         "value":"introducerUIN"
      },
      "introducerVID":{
         "value":"introducerVID"
      },
      "introducerName":{
         "value":"introducerName"
      },
      "phone":{
         "value":"phone"
      },
      "phoneNumber":{
         "value":"phone"
      },
      "email":{
         "value":"email"
      },
      "emailId":{
         "value":"email"
      },
      "uin":{
         "value":"UIN"
      },
      "vid":{
         "value":"VID"
      },
      "individualBiometrics":{
         "value":"individualBiometrics"
      },
      "introducerBiometrics":{
         "value":"introducerBiometrics"
      },
      "individualAuthBiometrics":{
         "value":"individualAuthBiometrics"
      },
      "officerBiometricFileName":{
         "value":"officerBiometricFileName"
      },
      "supervisorBiometricFileName":{
         "value":"supervisorBiometricFileName"
      },
      "residenceStatus":{
         "value":"residenceStatus"
      },
      "preferredLanguage":{
         "value":"preferredLang"
      },
      "locationHierarchyForProfiling":{
         "value":"zone,postalCode"
      },
      "addressLine1":{
         "value":"addressLine1"
      },
      "addressLine2":{
         "value":"addressLine2"
      },
      "addressLine3":{
         "value":"addressLine3"
      },
      "location1":{
         "value":"city"
      },
      "location2":{
         "value":"region"
      },
      "location3":{
         "value":"province"
      },
      "postalCode":{
         "value":"postalCode"
      },
      "location4":{
         "value":"zone"
      },
      "fullAddress":{
         "value":"addressLine1,addressLine2,addressLine3,city,region,province,postalCode"
      },
      "bestTwoFingers":{
         "value":"bestTwoFingers"
      },
      "birthdate":{
         "value":"dateOfBirth"
      },
      "picture":{
         "value":"face"
      },
      "phone_number":{
         "value":"phone"
      },
      "address":{
         "value":"addressLine1,addressLine2,addressLine3,city,region,province,postalCode"
      },
      "individual_id":{
         "value":"individual_id"
      },
      "street_address":{
         "value":"addressLine1,addressLine2,addressLine3"
      },
      "locality":{
         "value":"city"
      },
      "region":{
         "value":"region"
      },
      "postal_code":{
         "value":"postalCode"
      },
      "country":{
         "value":"province"
      }
   },
   "metaInfo":{
      "value":"metaInfo"
   },
   "audits":{
      "value":"audits"
   },
   "documents":{
      "poa":{
         "value":"proofOfAddress"
      },
      "poi":{
         "value":"proofOfIdentity"
      },
      "por":{
         "value":"proofOfRelationship"
      },
      "pob":{
         "value":"proofOfDateOfBirth"
      },
      "poe":{
         "value":"proofOfException"
      }
   },
   "attributeUpdateCountLimit":{
      "fullName":2,
      "gender":1,
      "dob":1,
      "age":1
   }
}
```

According to the `identity-mapping.json` file mentioned above, we need to verify if a **value** is present in the country's ID schema. If the value exists, we can retain it as is. Otherwise, we should update the value in the `identity-mapping.json` file.

To illustrate, let's consider a few examples:

* The fullName field is not included in the ID schema. Instead, it consists of firstName, middleName, and lastName. Therefore, we should replace the fullName with firstName, middleName, and lastName in the identity-mapping.json file.

* Similarly, the introducerUIN field is not present in the schema, but instead, it has introducerCredentialID. Hence, we need to substitute introducerUIN with introducerCredentialID in the mapping.json file.

* Additionally, since addressLine1 is not part of the schema, we should replace its value with presentAddressLine1, which is present.

* Lastly, the phone field is not found in the schema, but mobileno is present. Thus, we need to replace phone with mobileno in the mapping.json file.

* Our task is to compare each field value in the identity-mapping.json file with the ID schema and update it with the appropriate value based on the schema.

#### Sample Country’s ID schema

```
{
   "$schema":"http://json-schema.org/draft-07/schema#",
   "description":"string",
   "additionalProperties":false,
   "title":"string",
   "type":"object",
   "definitions":{
      "simpleType":{
         "uniqueItems":true,
         "additionalItems":false,
         "type":"array",
         "items":{
            "additionalProperties":false,
            "type":"object",
            "required":[
               "language",
               "value"
            ],
            "properties":{
               "language":{
                  "type":"string"
               },
               "value":{
                  "type":"string"
               }
            }
         }
      },
      "documentType":{
         "additionalProperties":false,
         "type":"object",
         "required":[
            "format",
            "type",
            "value"
         ],
         "properties":{
            "refNumber":{
               "type":"string"
            },
            "format":{
               "type":"string"
            },
            "type":{
               "type":"string"
            },
            "value":{
               "type":"string"
            }
         }
      },
      "biometricsType":{
         "additionalProperties":false,
         "type":"object",
         "properties":{
            "format":{
               "type":"string"
            },
            "version":{
               "type":"number",
               "minimum":0
            },
            "value":{
               "type":"string"
            }
         }
      }
   },
   "properties":{
      "identity":{
         "additionalProperties":false,
         "type":"object",
         "required":[
            "IDSchemaVersion",
            "firstName",
            "dateOfBirth",
            "pobCountry",
            "pobProvince",
            "pobCity",
            "gender",
            "residenceStatus",
            "bloodType",
            "permanentCountry",
            "permanentAddressLine1",
            "addressCopy",
            "presentCountry",
            "presentAddressLine1",
            "modeOfClaim",
            "proofOfAddress",
            "individualBiometrics"
         ],
         "properties":{
            "presentProvince":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,50}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "pobCountry":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,50}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "pobProvince":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,50}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "permanentBarangay":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "mobileno":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "type":"string",
               "fieldType":"default"
            },
            "suffix":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{1,3}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "proofOfDateOfBirth":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/documentType"
            },
            "introducerSuffix":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{1,3}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"evidence",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "introducerMiddleName":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"(?=(?:^\\w|Ñ|Ü|ü|ñ))([A-Z0-9a-zñÑ -.‘_ Üü]+)(?<=[^ ])$",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"evidence",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "presentCity":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,50}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "firstName":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"(?=(?:^\\w|Ñ|Ü|ü|ñ))([A-Z0-9a-zñÑ -.‘_ Üü]+)(?<=[^ ])$",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "IDSchemaVersion":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"none",
               "format":"none",
               "type":"number",
               "fieldType":"default",
               "minimum":0
            },
            "proofOfException":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"evidence",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/documentType"
            },
            "registrationType":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"dynamic",
               "$ref":"#/definitions/simpleType"
            },
            "permanentCountry":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,50}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "presentCountry":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,50}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "permanentProvince":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,50}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "proofOfRelationship":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/documentType"
            },
            "UIN":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"none",
               "format":"none",
               "type":"string",
               "fieldType":"default"
            },
            "maritalStatus":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"dynamic",
               "$ref":"#/definitions/simpleType"
            },
            "presentAddressLine1":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,255}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "presentZipcode":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "lastName":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"(?=(?:^\\w|Ñ|Ü|ü|ñ))([A-Z0-9a-zñÑ -.‘_ Üü]+)(?<=[^ ])$",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "presentAddressLine2":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,255}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "presentAddressLine3":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,255}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "guardianFirstName":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"(?=(?:^\\w|Ñ|Ü|ü|ñ))([A-Z0-9a-zñÑ -.‘_ Üü]+)(?<=[^ ])$",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"evidence",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "presentAddressLine4":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,255}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "proofOfAddress":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/documentType"
            },
            "gender":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"pvt",
               "format":"",
               "fieldType":"dynamic",
               "$ref":"#/definitions/simpleType"
            },
            "modeOfClaim":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"dynamic",
               "$ref":"#/definitions/simpleType"
            },
            "proofOfConsent":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/documentType"
            },
            "guardianSuffix":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{1,3}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"evidence",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "bloodType":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"pvt",
               "format":"",
               "fieldType":"dynamic",
               "$ref":"#/definitions/simpleType"
            },
            "introducerFirstName":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"(?=(?:^\\w|Ñ|Ü|ü|ñ))([A-Z0-9a-zñÑ -.‘_ Üü]+)(?<=[^ ])$",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"evidence",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "guardianLastName":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"(?=(?:^\\w|Ñ|Ü|ü|ñ))([A-Z0-9a-zñÑ -.‘_ Üü]+)(?<=[^ ])$",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"evidence",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "individualBiometrics":{
               "bioAttributes":[
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
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/biometricsType"
            },
            "presentBarangay":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "residenceStatus":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"kyc",
               "format":"none",
               "fieldType":"dynamic",
               "$ref":"#/definitions/simpleType"
            },
            "email":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^[A-Za-z0-9_\\-]+(\\.[A-Za-z0-9_]+)*@[A-Za-z0-9_-]+(\\.[A-Za-z0-9_]+)*(\\.[a-zA-Z]{2,})$",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "type":"string",
               "fieldType":"default"
            },
            "guardianMiddleName":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"(?=(?:^\\w|Ñ|Ü|ü|ñ))([A-Z0-9a-zñÑ -.‘_ Üü]+)(?<=[^ ])$",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"evidence",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "parentOrGuardianRID":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"evidence",
               "format":"none",
               "type":"string",
               "fieldType":"default"
            },
            "permanentZipcode":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "pobCity":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,50}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "addressCopy":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^[YN]$",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "type":"string",
               "fieldType":"default"
            },
            "dateOfBirth":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(1869|18[7-9][0-9]|19[0-9][0-9]|20[0-9][0-9])/([0][1-9]|1[0-2])/([0][1-9]|[1-2][0-9]|3[01])$",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "type":"string",
               "fieldType":"default"
            },
            "individualAuthBiometrics":{
               "bioAttributes":[
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
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/biometricsType"
            },
            "proofOfIdentity":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/documentType"
            },
            "introducerCredentialID":{
               "bioAttributes":[
                  
               ],
               "fieldCategory":"evidence",
               "format":"none",
               "type":"string",
               "fieldType":"default"
            },
            "permanentAddressLine1":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,255}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "guardianBiometrics":{
               "bioAttributes":[
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
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/biometricsType"
            },
            "middleName":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"(?=(?:^\\w|Ñ|Ü|ü|ñ))([A-Z0-9a-zñÑ -.‘_ Üü]+)(?<=[^ ])$",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "permanentCity":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,50}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "permanentAddressLine2":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,255}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "permanentAddressLine3":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,255}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "introducerLastName":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"(?=(?:^\\w|Ñ|Ü|ü|ñ))([A-Z0-9a-zñÑ -.‘_ Üü]+)(?<=[^ ])$",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"evidence",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            },
            "permanentAddressLine4":{
               "bioAttributes":[
                  
               ],
               "validators":[
                  {
                     "langCode":null,
                     "validator":"^(?=.{0,255}$).*",
                     "arguments":[
                        
                     ],
                     "type":"regex"
                  }
               ],
               "fieldCategory":"pvt",
               "format":"none",
               "fieldType":"default",
               "$ref":"#/definitions/simpleType"
            }
         }
      }
   }
}
```
