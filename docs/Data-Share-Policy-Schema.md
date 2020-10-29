```JSON
{
  "$id": "http://mosip.io/dataShare_policy_object/1.0/dataShare_policy_object.json",
  "$schema": "http://json-schema.org/draft-04/schema#",
  "title": "Data Share Policy schema",
  "description": "MOSIP Data Share Policy schema",
  "type": "object",
  "properties": {
    "dataSharePolicies": {
	  "title": "Data Share Polies",
      "description": "This schema holds a data share policies configured for a data share partner.",
      "type": "object",
      "properties": {
        "typeOfShare": {
          "type": "string"
        },
        "validForInMinutes": {
          "type": "string"
        },
        "transactionsAllowed": {
          "type": "string"
        },
        "encryptionType": {
          "type": "string"
        },
        "shareDomain": {
          "type": "string"
        },
        "source": {
          "type": "string"
        }
      },
      "required": [
        "typeOfShare",
        "validForInMinutes",
        "transactionsAllowed",
        "encryptionType",
        "shareDomain",
        "source"
      ]
    },
    "shareableAttributes": {
      "type": "array",
      "items": [
        {
          "type": "object",
          "properties": {
            "attributeName": {
              "type": "string"
            },
            "group": {
              "type": "string"
            },
            "source": {
              "type": "array",
              "items": [
                {
                  "type": "object",
                  "properties": {
                    "attribute": {
                      "type": "string"
                    },
                    "filter": {
                      "type": "array",
                      "items": [
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string"
                            }
                          },
                          "required": []
                        },
                        {
                          "type": "object",
                          "properties": {
                            "type": {
                              "type": "string"
                            },
                            "subType": {
                              "type": "array",
                              "items": [
                                {
                                  "type": "string"
                                },
                                {
                                  "type": "string"
                                }
                              ]
                            }
                          },
                          "required": []
                        },
                        {
                          "type": "object",
                          "properties": {
                            "language": {
                              "type": "string"
                            }
                          },
                          "required": []
                        }
                      ]
                    }
                  },
                  "required": [
                    "attribute"
                  ]
                }
              ]
            },
            "encrypted": {
              "type": "boolean"
            },
            "format": {
              "type": "string"
            }
          },
          "required": [
            "attributeName",
            "source",
            "encrypted"
          ]
        }
      ]
    }
  },
  "required": [
    "dataSharePolicies",
    "shareableAttributes"
  ]
}
```