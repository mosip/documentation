# Pre-Registration UI Upgrade

The Pre-Registration UI-spec file `pre-registration-demographic.json` was previously included in the mosip-config repository in version 1.1.5.\*, but starting from version 1.2.0, it should be manually published using the master data UI-spec API.

### How to define and publish UI specifications?

1.  Go to Swagger `clientIdSecretKey` to get the Authentication token:

    ```
    {env_url}/v1/authmanager/swagger-ui/index.html?configUrl=/v1/authmanager/v3/api-docs/swagger-config#/authmanager/clientIdSecretKey

    "request": {
      "clientId": "mosip-reg-client",
      "secretKey": {secret_key},
      "appId": "admin"
    } 
    ```
2. Go to Swagger `defineUISpec` to define the new UI Specifications

```
{env_url}/v1/masterdata/swagger-ui/index.html?configUrl=/v1/masterdata/v3/api-docs/swagger-config#/ui-spec-controller/defineUISpec"

request": {
    "identitySchemaId": {id of latest identity schema},
    "domain": "pre-registration",
    "type": "schema",
    "title": "Pre-registration UI Specification",
    "description": "Pre-registration UI Specification",
    "jsonspec": {Add New UI Spec}
 }
```

4. Go to `publishUISpec` to Publish the newly defined UI Spec

```
  {env_url}/v1/masterdata/swagger-ui/index.html?configUrl=/v1/masterdata/v3/api-docs/swagger-config#/ui-spec-controller/publishUISpec

  get the id from the defineUISpec response and add it in request

  "request": {
      "id": "{}",
    "effectiveFrom": "2022-07-28T08:42:07.706Z"
    }  
```

4. Once done, check the `master.ui_spec` table.

### Changes in UI Specifications

The [Pre-registration UI Specifications](https://docs.mosip.io/1.2.0/modules/pre-registration/pre-registration-ui-specifications) document provides details about all UI spec attributes. This document can be referred to in order to identify the changes between versions 1.1.5 and 1.2.0.1.

The following new attributes have been added:

* subType (optional - for dynamic dropdowns)
* transliteration (mandatory to enable transliteration)
* locationHierarchyLevel (mandatory to be added in each location dropdown to indicate the location hierarchy level)
* parentLocCode (mandatory to be added in the topmost dropdown in the location hierarchy to indicate the parent for it. It can also be omitted, in which case the mosip.country.code property will be used)
* `gender` Attribute should be mandatory, and the parameter `required` should be `true`
* The control type for the date of birth should be changed to `ageDate`
* The labelName should be provided with the "languageCode" as the "key" and the label as the "value". Example: {"labelName": { "eng": "Date Of Birth", "ara": "تاريخ الولادة", "fra": "Date de naissance" \}}
* visibleCondition (optional)
* requiredCondition (optional)
* alignmentGroup (optional)
* containerStyle (optional)
* headerStyle (optional)
* changeAction (optional)



### UI Specifications of 1.1.5 and 1.2.0

### 1.1.5

```
{

              "identity": [{

                                           "id": "IDSchemaVersion",

                                           "description": "ID Schema Version",

                                           "type": "number",

                                           "controlType": null,

                                           "fieldType": "default",

                                           "inputRequired": false,

                                           "validators": [],

                                           "required": true

                             },

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

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^(?=.{0,50}$).*",

                                                          "arguments": [

 

                                                          ]

                                           }],

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

                                           "fieldType": "default",

                                           "type": "string",

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

                                           "fieldType": "dynamic",

                                           "type": "simpleType",

                                           "validators": [

 

                                           ],

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

                                           "fieldType": "dynamic",

                                           "type": "simpleType",

                                           "validators": [

 

                                           ],

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

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^(?=.{0,50}$).*",

                                                          "arguments": [

 

                                                          ]

                                           }],

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

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^(?=.{0,50}$).*",

                                                          "arguments": [

 

                                                          ]

                                           }],

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

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^(?=.{0,50}$).*",

                                                          "arguments": [

 

                                                          ]

                                           }],

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

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^(?=.{0,50}$).*",

                                                          "arguments": [

 

                                                          ]

                                           }],

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

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^(?=.{0,50}$).*",

                                                          "arguments": [

 

                                                          ]

                                           }],

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

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^(?=.{0,50}$).*",

                                                          "arguments": [

 

                                                          ]

                                           }],

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

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [

 

                                           ],

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

                                           "fieldType": "default",

                                           "type": "string",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^[(?i)A-Z0-9]{5}$|^NA$",

                                                          "arguments": [

 

                                                          ]

                                           }],

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

                                           "fieldType": "default",

                                           "type": "string",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^([6-9]{1})([0-9]{9})$",

                                                          "arguments": [

 

                                                          ]

                                           }],

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

                                           "fieldType": "default",

                                           "type": "string",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-zA-Z]{2,})$",

                                                          "arguments": [

 

                                                          ]

                                           }],

                                           "required": true

                             },

                             {

                                           "id": "proofOfAddress",

                                           "description": "proofOfAddress",

                                           "labelName": [{

                                                          "value": "Address Proof",

                                                          "language": "eng"

                                           }],

                                           "controlType": "fileupload",

                                           "inputRequired": true,

                                           "validators": [

 

                                           ],

                                           "required": false

                             },

                             {

                                           "id": "proofOfIdentity",

                                           "description": "proofOfIdentity",

                                           "labelName": [{

                                                          "value": "Identity Proof",

                                                          "language": "eng"
                                           }],

                                           "controlType": "fileupload",

                                           "inputRequired": true,

                                           "validators": [

                                           ],

                                           "required": true

                             },

                             {

                                           "id": "proofOfRelationship",

                                           "description": "proofOfRelationship",

                                           "labelName": [{

                                                          "value": "Relationship Proof",

                                                          "language": "eng"
                                           }],

                                           "controlType": "fileupload",

                                           "inputRequired": true,

                                           "validators": [

                                           ],

                                           "required": true

                             },

                             {

                                           "id": "proofOfDateOfBirth",

                                           "description": "proofOfDateOfBirth",

                                           "labelName": [{

                                                          "value": "DOB Proof",

                                                          "language": "eng"

                                           }],

                                           "controlType": "fileupload",

                                           "inputRequired": true,

                                           "validators": [

                                            ],

                                           "required": true

                             },

                             {

                                           "id": "proofOfException",

                                           "description": "proofOfException",

                                           "labelName": [{

                                                          "value": "Exception Proof",

                                                          "language": "eng"

                                           }],

                                           "controlType": "fileupload",

                                           "inputRequired": true,

                                           "validators": [

                                           ],

                                           "required": true
                             }

              ],

              "locationHierarchy": ["region", "province", "city", "zone", "postalCode"]
}
```

### 1.2.0

```
{

              "identity": {

                             "identity": [{

                                           "id": "IDSchemaVersion",

                                           "description": "ID Schema Version",

                                           "type": "number",

                                           "controlType": null,

                                           "fieldType": "default",

                                           "inputRequired": false,

                                           "validators": [],

                                           "required": true

                             }, {

                                           "id": "fullName",

                                           "description": "Enter Full Name",

                                           "labelName": {

                                                          "eng": "Full Name",

                                                          "ara": "الاسم الكامل",

                                                          "fra": "Nom complet"

                                           },

                                           "controlType": "textbox",

                                           "inputRequired": true,

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^(?=.{0,50}$).*",

                                                          "arguments": []

                                           }],

                                           "required": true,

                                           "transliteration": true

                             }, {

                                           "id": "dateOfBirth",

                                           "description": "Enter DOB",

                                           "labelName": {

                                                          "eng": "Date Of Birth",

                                                          "ara": "تاريخ الولادة",

                                                          "fra": "Date de naissance"

                                           },

                                           "controlType": "ageDate",

                                           "inputRequired": true,

                                           "fieldType": "default",

                                           "type": "string",

                                           "validators": [],

                                           "required": true

                             }, {

                                           "id": "gender",

                                           "description": "Enter Gender",

                                           "labelName": {

                                                          "eng": "Gender",

                                                          "ara": "جنس",

                                                          "fra": "Le genre"

                                           },

                                           "controlType": "dropdown",

                                           "inputRequired": true,

                                           "fieldType": "dynamic",

                                           "subType": "gender",

                                           "type": "simpleType",

                                           "validators": [],

                                           "required": true

                             }, {

                                           "id": "residenceStatus",

                                           "description": "Residence status",

                                           "labelName": {

                                                          "eng": "Residence Status",

                                                          "ara": "حالة الإقامة",

                                                          "fra": "Statut de résidence"

                                           },

                                           "controlType": "dropdown",

                                           "inputRequired": true,

                                           "fieldType": "dynamic",

                                           "subType": "residenceStatus",

                                           "type": "simpleType",

                                           "validators": [],

                                           "required": true

                             }, {

                                           "id": "addressLine1",

                                           "description": "addressLine1",

                                           "labelName": {

                                                          "eng": "Address Line1",

                                                          "ara": "العنوان السطر 1",

                                                          "fra": "Adresse 1"

                                           },

                                           "controlType": "textbox",

                                           "inputRequired": true,

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^(?=.{0,50}$).*",

                                                          "arguments": []

                                           }],

                                           "required": true,

                                           "transliteration": true

                             }, {

                                           "id": "addressLine2",

                                           "description": "addressLine2",

                                           "labelName": {

                                                          "eng": "Address Line2",

                                                          "ara": "العنوان السطر 2",

                                                          "fra": "Adresse 2"

                                           },

                                           "controlType": "textbox",

                                           "inputRequired": true,

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^(?=.{0,50}$).*",

                                                          "arguments": []

                                           }],

                                           "required": false,

                                           "transliteration": true

                             }, {

                                           "id": "addressLine3",

                                           "description": "addressLine3",

                                           "labelName": {

                                                          "eng": "Address Line3",

                                                          "ara": "العنوان السطر 3",

                                                          "fra": "Adresse 3"

                                           },

                                           "controlType": "textbox",

                                           "inputRequired": true,

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^(?=.{0,50}$).*",

                                                          "arguments": []

                                           }],

                                           "required": false,

                                           "transliteration": true

                             }, {

                                           "id": "region",

                                           "description": "region",

                                           "labelName": {

                                                          "eng": "Region",

                                                          "ara": "منطقة",

                                                          "fra": "Région"

                                           },

                                           "controlType": "dropdown",

                                           "inputRequired": true,

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^(?=.{0,50}$).*",

                                                          "arguments": []

                                           }],

                                           "parentLocCode": "MOR",

                                           "locationHierarchyLevel": 1,

                                           "required": true

                             }, {

                                           "id": "province",

                                           "description": "province",

                                           "labelName": {

                                                          "eng": "Province",

                                                          "ara": "المحافظة",

                                                          "fra": "Province"

                                           },

                                           "controlType": "dropdown",

                                           "inputRequired": true,

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^(?=.{0,50}$).*",

                                                          "arguments": []

                                           }],

                                           "locationHierarchyLevel": 2,

                                           "required": true

                             }, {

                                           "id": "city",

                                           "description": "city",

                                           "labelName": {

                                                          "eng": "City",

                                                          "ara": "مدينة",

                                                          "fra": "Ville"

                                           },

                                           "controlType": "dropdown",

                                           "inputRequired": true,

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^(?=.{0,50}$).*",

                                                          "arguments": []

                                           }],

                                           "locationHierarchyLevel": 3,

                                           "required": true

                             }, {

                                           "id": "zone",

                                           "description": "zone",

                                           "labelName": {

                                                          "eng": "Zone",

                                                          "ara": "منطقة",

                                                          "fra": "Zone"

                                           },

                                           "controlType": "dropdown",

                                           "inputRequired": true,

                                           "fieldType": "default",

                                           "type": "simpleType",

                                           "validators": [],

                                           "locationHierarchyLevel": 4,

                                           "required": true

                             }, {

                                           "id": "postalCode",

                                           "description": "postalCode",

                                           "labelName": {

                                                          "eng": "Postal Code",

                                                          "ara": "الكود البريدى",

                                                          "fra": "code postal"

                                           },

                                           "controlType": "dropdown",

                                           "inputRequired": true,

                                           "fieldType": "default",

                                           "type": "string",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^[(?i)A-Z0-9]{5}$|^NA$",

                                                          "arguments": []

                                           }],

                                           "locationHierarchyLevel": 5,

                                           "required": true

                             }, {

                                           "id": "phone",

                                           "description": "phone",

                                           "labelName": {

                                                          "eng": "Phone",

                                                          "ara": "هاتف",

                                                          "fra": "Téléphone"

                                           },

                                           "controlType": "textbox",

                                           "inputRequired": true,

                                           "fieldType": "default",

                                           "type": "string",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^([6-9]{1})([0-9]{9})$",

                                                          "arguments": []

                                           }],

                                           "required": true

                             }, {

                                           "id": "email",

                                           "description": "email",

                                           "labelName": {

                                                          "eng": "Email",

                                                          "ara": "البريد الإلكتروني",

                                                          "fra": "Email"

                                           },

                                           "controlType": "textbox",

                                           "inputRequired": true,

                                           "fieldType": "default",

                                           "type": "string",

                                           "validators": [{

                                                          "type": "regex",

                                                          "validator": "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-zA-Z]{2,})$",

                                                          "arguments": []

                                           }],

                                           "required": true

                             }, {

                                           "id": "proofOfAddress",

                                           "description": "proofOfAddress",

                                           "labelName": {

                                                          "ara": "إثبات العنوان",

                                                          "fra": "Address Proof",

                                                          "eng": "Address Proof"

                                           },

                                           "controlType": "fileupload",

                                           "inputRequired": true,

                                           "validators": [],

                                           "subType": "POA",

                                           "required": false

                             }, {

                                           "id": "proofOfIdentity",

                                           "description": "proofOfIdentity",

                                           "labelName": {

                                                          "ara": "إثبات الهوية",

                                                          "fra": "Identity Proof",

                                                          "eng": "Identity Proof"

                                           },

                                           "controlType": "fileupload",

                                           "inputRequired": true,

                                           "validators": [],

                                           "subType": "POI",

                                           "required": true

                             }, {

                                           "id": "proofOfRelationship",

                                           "description": "proofOfRelationship",

                                           "labelName": {

                                                          "ara": "إثبات العلاقة",

                                                          "fra": "Relationship Proof",

                                                          "eng": "Relationship Proof"

                                           },

                                           "controlType": "fileupload",

                                           "inputRequired": true,

                                           "validators": [],

                                           "subType": "POR",

                                           "required": true

                             }, {

                                           "id": "proofOfDateOfBirth",

                                           "description": "proofOfDateOfBirth",

                                           "labelName": {

                                                          "ara": "دليل DOB",

                                                          "fra": "DOB Proof",

                                                          "eng": "DOB Proof"

                                           },

                                           "controlType": "fileupload",

                                           "inputRequired": true,

                                           "validators": [],

                                           "subType": "POB",

                                           "required": true

                             }, {

                                           "id": "proofOfException",

                                           "description": "proofOfException",

                                           "labelName": {

                                                          "ara": "إثبات الاستثناء",

                                                          "fra": "Exception Proof",

                                                          "eng": "Exception Proof"

                                           },

                                           "controlType": "fileupload",

                                           "inputRequired": true,

                                           "validators": [],

                                           "subType": "POE",

                                           "required": true

                             }],

                             "locationHierarchy": ["region", "province", "city", "zone", "postalCode"]

              }

}
```
