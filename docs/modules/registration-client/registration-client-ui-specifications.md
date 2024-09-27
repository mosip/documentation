# Registration Client UI Specifications

## Overview

The registration UI forms are rendered using respective UI specification JSON. This is derived from the [ID Schema](../../id-lifecycle-management/id-schema.md) defined by a country. Here, we would be discussing about the properties used in the UI specification of Registration Client.

In the Registration Client, currently, Registration Tasks(process) forms are configurable using the UI specifications.

Each process has multiple screens and each screen is rendered with one or more fields.

## Process/ Task spec JSON template

```
{
    "id": "<NEW/UPDATE/LOST/BIOMETRIC_CORRECTION process name as passed in the packet>",
    //order in which the process is displayed on the registration client home screen
    "order": 1,
    "flow": "<NEW/UPDATE/LOST/CORRECTION>",
    //Multi-lingual labels displayed based on the logged in language
    "label": {
        "eng": "Registration",
        "ara": "تسجيل",
        "fra": "Inscription"
    },
    //screen details - follows screen spec structure
    "screens": [
        {}
    ],
    //caption displays on-hover content
    "caption": {
        "eng": "Registration",
        "ara": "تسجيل",
        "fra": "Inscription"
    },
    //icon is the symbol that appears before the process label
    "icon": "registration.png",
    "isActive": true,
    //group names that should be by default selected during UDPATE UIN process
    "autoSelectedGroups": [
        ""
    ]
}
```

## Screen spec JSON template

```
    //Order of the screen in registration page
    "order": 1,
    "name": "<unique identifier for the screen>",
    "label": {
        "ara": "شاشة عينة",
        "fra": "Exemple d'écran",
        "eng": "Sample screen"
    },
    "caption": {
        "ara": "شاشة عينة",
        "fra": "Exemple d'écran",
        "eng": "Sample screen"
    },
    //field details - follows field spec structure
    "fields": [
        {}
    ],
    "layoutTemplate": null,
    //displays field to provide pre-reg application ID, data fetched from pre-reg application will be pre-filled in the current registration form
    "preRegFetchRequired": true,
    //enable below flag to capture additionalInfo request ID , applicable only during correction process
    "additionalInfoRequestIdRequired": false,
    //show or hide screens 
    "active": true
}
```

## Field spec JSON template

```
{
    "id": "<Unique identifier for the field, must be same as that described in the ID Schema>",
    //inputRequired is used to identify if UI input is needed or not
    "inputRequired": true,
    //type defines the datatype of the field, must be same as that is defined in the ID Schema
    "type": "<string/simpleType/documentType/biometricsType>",
    "controlType": "textbox/fileupload/dropdown/checkbox/button/date/ageDate/html/biometrics",
    //minimum- applicable only for date controlType(defined in days)
    "minimum": 0,
    //maximum- applicable only for date controlType(defined in days)
    "maximum": 365,
    "description": "<Field description>",
    "label": {
        "ara": "حقل العينة",
        "fra": "Exemple de champ",
        "eng": "Sample Field"
    },
    //fieldType is used to identify if it is a dynamic field
    "fieldType": "<default/dynamic>",
    //to validate the format should be in upper or lower case
    "format": "<lowercase/uppercase/none>",
    //list of validators for the field
    "validators": [
        {
            //type of validation engine (currently, only regex is supported)
            "type": "regex",
            //expression for the validation
            "validator": "^([0-9]{10,30})$",
            //list of arguments needed for the validator
            "arguments": [],
            //if null, its applicable for all languages, else validator expression can be provided for each langCode
            "langCode": null,
            /*error code to be used to display specific error message, if null, generic validation error message is displayed
                      There error codes must be configured in registration client i18n files*/
            "errorCode": "UI_100001"
        }
    ],
    //determines sharing and longevity policies applicable as defined in ID Schema
    "fieldCategory": "<pvt/evidence/kyc>",
    "alignmentGroup": "<fields belonging to same alignment group are placed horizontally next to each other>",
    //determines when to display and hide the field(set null if the field has to be displayed always)
    "visible": {
        "engine": "MVEL",
        "expr": "identity.get('ageGroup') == 'INFANT' && (identity.get('introducerRID') == nil || identity.get('introducerRID') == empty)"
    },
    "contactType": null,
    //used to group together the list of fields(only applicable in the Update UIN process)
    "group": "<grouping used in update UIN process>",
    "groupLabel": {
        "eng": "Sample group",
        "ara": "مجموعة العينة",
        "fra": "Groupe d'échantillons"
    },
    /*on change of the field value, configured Action will be triggered on other fields
                  Change action handlers should be implemented in registration client*/
    "changeAction": null,
    //enable or disable auto-transliteration
    "transliterate": false,
    /*provide the templateName(applicable only for html controlType fields)
          These templates should be configured in templates table*/
    "templateName": null,
    "fieldLayout": null,
    "locationHierarchy": null,
    //On any biometric exception, Need to capture exception photo as proof if the below flag is enabled
    "exceptionPhotoRequired": true,
    /*applicable only for BiometricsType field, defines the list of attributes to be captured
          All the supported biometric attributes are listed down for reference*/
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
    //capture of above mentioned bioAttributes can be conditionally mandated based on age group
    "conditionalBioAttributes": [
        {
            "ageGroup": "INFANT",
            "process": "ALL",
            "validationExpr": "face || (leftEye && rightEye)",
            "bioAttributes": [
                "face",
                "leftEye",
                "rightEye"
            ]
        }
    ],
    //set true/false to mark the field as mandatory or optional
    "required": true,
    //if requiredOn is defined, the evaluation result of requiredOn.expr takes the priority over "required" attribute
    "requiredOn": [
        {
            "engine": "MVEL",
            "expr": "identity.get('ageGroup') == 'INFANT' && (identity.get('introducerRID') == nil || identity.get('introducerRID') == empty)"
        }
    ],
    //used to identify the type of field
    "subType": "<document types / applicant / heirarchy level names>"
}
```

### Sample correction process SPEC: Biometric Correction

```
{
   "id": "BIOMETRIC_CORRECTION",
   "order": 4,
   "flow": "CORRECTION"
   "label": {
       "eng": "Biometric correction",
       "ara": "التصحيح البيومتري",
       "fra": "Correction biométrique"
   },
   "screens": [
       {
           "order": 1,
           "name": "consentdet",
           "label": {
               "ara": "موافقة",
               "fra": "Consentement",
               "eng": "Consent"
           },
           "caption": {
               "ara": "موافقة",
               "fra": "Consentement",
               "eng": "Consent"
           },
           "fields": [
               {
                   "id": "consentText",
                   "inputRequired": true,
                   "type": "simpleType",
                   "minimum": 0,
                   "maximum": 0,
                   "description": "Consent",
                   "label": {},
                   "controlType": "html",
                   "fieldType": "default",
                   "format": "none",
                   "validators": [],
                   "fieldCategory": "evidence",
                   "alignmentGroup": null,
                   "visible": null,
                   "contactType": null,
                   "group": "consentText",
                   "groupLabel": null,
                   "changeAction": null,
                   "transliterate": false,
                   "templateName": "Registration Consent",
                   "fieldLayout": null,
                   "locationHierarchy": null,
                   "conditionalBioAttributes": null,
                   "required": true,
                   "bioAttributes": null,
                   "requiredOn": [],
                   "subType": "consentText"
               },
               {
                   "id": "consent",
                   "inputRequired": true,
                   "type": "string",
                   "minimum": 0,
                   "maximum": 0,
                   "description": "consent accepted",
                   "label": {
                       "ara": "الاسم الكامل الكامل الكامل",
                       "fra": "J'ai lu et j'accepte les termes et conditions pour partager mes PII",
                       "eng": "I have read and accept terms and conditions to share my PII"
                   },
                   "controlType": "checkbox",
                   "fieldType": "default",
                   "format": "none",
                   "validators": [],
                   "fieldCategory": "evidence",
                   "alignmentGroup": null,
                   "visible": null,
                   "contactType": null,
                   "group": "consent",
                   "groupLabel": null,
                   "changeAction": null,
                   "transliterate": false,
                   "templateName": null,
                   "fieldLayout": null,
                   "locationHierarchy": null,
                   "conditionalBioAttributes": null,
                   "required": true,
                   "bioAttributes": null,
                   "requiredOn": [],
                   "subType": "consent"
               },
               {
                   "id": "preferredLang",
                   "inputRequired": true,
                   "type": "string",
                   "minimum": 0,
                   "maximum": 0,
                   "description": "user preferred Language",
                   "label": {
                       "ara": "لغة الإخطار",
                       "fra": "Langue de notification",
                       "eng": "Notification Langauge"
                   },
                   "controlType": "button",
                   "fieldType": "dynamic",
                   "format": "none",
                   "validators": [],
                   "fieldCategory": "pvt",
                   "alignmentGroup": "group1",
                   "visible": null,
                   "contactType": null,
                   "group": "PreferredLanguage",
                   "groupLabel": null,
                   "changeAction": null,
                   "transliterate": false,
                   "templateName": null,
                   "fieldLayout": null,
                   "locationHierarchy": null,
                   "conditionalBioAttributes": null,
                   "required": true,
                   "bioAttributes": null,
                   "requiredOn": [],
                   "subType": "preferredLang"
               }
           ],
           "layoutTemplate": null,
           "preRegFetchRequired": false,
           "additionalInfoRequestIdRequired": false,
           "active": false
       },
       {
           "order": 2,
           "name": "BiometricDetails",
           "label": {
               "ara": "التفاصيل البيومترية",
               "fra": "Détails biométriques",
               "eng": "Biometric Details"
           },
           "caption": {
               "ara": "التفاصيل البيومترية",
               "fra": "Détails biométriques",
               "eng": "Biometric Details"
           },
           "fields": [
               {
                   "id": "individualBiometrics",
                   "inputRequired": true,
                   "type": "biometricsType",
                   "minimum": 0,
                   "maximum": 0,
                   "description": "",
                   "label": {
                       "ara": "القياسات الحيوية الفردية",
                       "fra": "Applicant Biometrics",
                       "eng": "Applicant Biometrics"
                   },
                   "controlType": "biometrics",
                   "fieldType": "default",
                   "format": "none",
                   "validators": [],
                   "fieldCategory": "pvt",
                   "alignmentGroup": null,
                   "visible": null,
                   "contactType": null,
                   "group": "Biometrics",
                   "groupLabel": null,
                   "changeAction": null,
                   "transliterate": false,
                   "templateName": null,
                   "fieldLayout": null,
                   "locationHierarchy": null,
                   "conditionalBioAttributes": [
                       {
                           "ageGroup": "INFANT",
                           "process": "ALL",
                           "validationExpr": "face",
                           "bioAttributes": [
                               "face"
                           ]
                       }
                   ],
                   "required": true,
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
                   "requiredOn": [],
                   "subType": "applicant"
               },
               {
                   "id": "proofOfException",
                   "inputRequired": false,
                   "type": "documentType",
                   "minimum": 0,
                   "maximum": 0,
                   "description": "proofOfException",
                   "label": {
                       "ara": "إثبات الاستثناء",
                       "fra": "Exception Proof",
                       "eng": "Exception Proof"
                   },
                   "controlType": "fileupload",
                   "fieldType": "default",
                   "format": "none",
                   "validators": [],
                   "fieldCategory": "evidence",
                   "alignmentGroup": null,
                   "visible": null,
                   "contactType": null,
                   "group": "Documents",
                   "groupLabel": null,
                   "changeAction": null,
                   "transliterate": false,
                   "templateName": null,
                   "fieldLayout": null,
                   "locationHierarchy": null,
                   "conditionalBioAttributes": null,
                   "required": false,
                   "bioAttributes": null,
                   "requiredOn": [],
                   "subType": "POE"
               }
           ],
           "layoutTemplate": null,
           "preRegFetchRequired": false,
           "additionalInfoRequestIdRequired": true,
           "active": false
       }
   ],
   "caption": {
       "eng": "Biometric correction",
       "ara": "التصحيح البيومتري",
       "fra": "Correction biométrique"
   },
   "icon": "UINUpdate.png",
   "isActive": true,
   "autoSelectedGroups": null
}
```
