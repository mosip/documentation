```JSON
{
  "$id": "http://mosip.io/vid_policy_object/1.0/vid_policy_object.json",
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "VID Policy schema",
  "description": "MOSIP VID Policy schema",
  "type": "object",
  "additionalProperties": false,
  "properties": {
    "vidPolicies": {
      "title": "VID Policies",
      "description": "This schema holds all the VID policies configured for a country.",
      "type": "array",
      "additionalItems": false,
      "uniqueItems": true,
      "items": {
        "type": "object",
        "required": [
          "vidType",
          "vidPolicy"
        ],
        "additionalProperties": false,
        "properties": {
          "vidType": {
            "type": "string",
            "pattern": "^(Perpetual|Temporary)$"
          },
          "vidPolicy": {
            "$ref": "#/definitions/vidPolicyType"
          }
        }
      }
    }
  },
  "definitions": {
    "vidPolicyType": {
      "type": "object",
      "properties": {
        "validForInMinutes": {
          "type": [
            "integer",
            "null"
          ]
        },
        "transactionsAllowed": {
          "type": [
            "integer",
            "null"
          ],
          "minimum": 1,
          "maximum": 1
        },
        "instancesAllowed": {
          "type": "integer",
          "minimum": 1
        },
        "autoRestoreAllowed": {
          "type": "boolean"
        },
        "restoreOnAction": {
          "type": "string",
          "pattern": "^(REVOKE|REGENERATE)$"
        }
      },
      "additionalProperties": false
    }
  }
}
```