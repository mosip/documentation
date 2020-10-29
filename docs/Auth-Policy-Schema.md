```JSON
{
  "$id": "http://mosip.io/auth_policy_object/1.0/auth_policy_object.json",
  "$schema": "http://json-schema.org/draft-07/schema",
  "type": "object",
  "title": "Authentication Policy Schema",
  "description": "This schema holds all the authentication policies configured for an authentication partner.",
  "default": {},
  "required": [
    "authTokenType",
    "allowedKycAttributes",
    "allowedAuthTypes"
  ],
  "properties": {
    "authTokenType": {
      "$id": "#/properties/authTokenType",
      "type": "string",
      "title": "Authentication Token Type schema",
      "description": "This schema holds the type of authentication token that should be sent to the authentication partner.",
      "default": ""
    },
    "allowedKycAttributes": {
      "$id": "#/properties/allowedKycAttributes",
      "type": "array",
      "title": "Allowed KYC Attributes schema",
      "description": "This schema holds the KYC attributes that should be sent to the authentication partner.",
      "default": [],
      "additionalItems": true,
      "items": {
        "$id": "#/properties/allowedKycAttributes/items",
        "anyOf": [
          {
            "$id": "#/properties/allowedKycAttributes/items/anyOf/0",
            "type": "object",
            "title": "The first anyOf schema",
            "description": "An explanation about the purpose of this instance.",
            "default": {},
            "required": [
              "attributeName"
            ],
            "properties": {
              "attributeName": {
                "$id": "#/properties/allowedKycAttributes/items/anyOf/0/properties/attributeName",
                "type": "string",
                "title": "Attribute Name schema",
                "description": "The Attribute that needs to be sent to the authentication partner.",
                "default": ""
              }
            },
            "additionalProperties": true
          }
        ]
      }
    },
    "allowedAuthTypes": {
      "$id": "#/properties/allowedAuthTypes",
      "type": "array",
      "title": "The allowedAuthTypes schema",
      "description": "An explanation about the purpose of this instance.",
      "default": [],
      "additionalItems": true,
      "items": {
        "$id": "#/properties/allowedAuthTypes/items",
        "anyOf": [
          {
            "$id": "#/properties/allowedAuthTypes/items/anyOf/0",
            "type": "object",
            "title": "The first anyOf schema",
            "description": "An explanation about the purpose of this instance.",
            "default": {},
            "required": [
              "authType",
              "mandatory"
            ],
            "properties": {
              "authType": {
                "$id": "#/properties/allowedAuthTypes/items/anyOf/0/properties/authType",
                "type": "string",
                "title": "The authType schema",
                "description": "An explanation about the purpose of this instance.",
                "default": ""
              },
              "authSubType": {
                "$id": "#/properties/allowedAuthTypes/items/anyOf/0/properties/authSubType",
                "type": "string",
                "title": "The authSubType schema",
                "description": "An explanation about the purpose of this instance.",
                "default": ""
              },
              "mandatory": {
                "$id": "#/properties/allowedAuthTypes/items/anyOf/0/properties/mandatory",
                "type": "boolean",
                "title": "The mandatory schema",
                "description": "An explanation about the purpose of this instance.",
                "default": false
              }
            },
            "additionalProperties": true
          }
        ]
      }
    }
  },
  "additionalProperties": true
}
```