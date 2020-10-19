# Overview
Data share service is used to share data across the MOSIP platform. The share understands the sensitivity of the information and applied for necessary protection and manages the roles. The roles decide who can access the data in what way.

# Functionality

The basic functionality of data share is to construct objects and share them. This functionality can be used by module in MOSIP. Every data that the data share module receives will be treated as an object.

Below are the sub-features of data share:
* Ability to create an object 
* Ability to write an object
* Ability to add metadata to an object
* Ability to close an object
* Ability to share a tokenized secure URL
* Ability to encrypt the data with the given public key or credentials
* Ability to set TTL (Time to Live) on data
* Ability to set roles that can access the given URL
* Ability to delete an object
	* Delete upon first access
	* Delete upon TTL (default defined by policy)
	* Delete upon the creator's request (revoke)

# Use Cases 

As mentioned above data share can be used by any module in MOSIP. Here are some of the use cases where we use data share.

## ABIS Data Share

ABIS system expects the biometric data to be shared by MOSIP via. a data share URL. In order to do so, ABIS middileware needs to share biometric data to ABIS systems (multiple ABISs eg: ABIS1, ABIS2, etc.) based on the policy defined for respective ABIS Systems.

The policy for data share defines,
* What data should be shared with a particular ABIS Instance?
* Should the data be encrypted? 
* What is the encryption type?
* From where should the data be picked?
* What is the validity for the data share URL?
* How many times the data share URL be accessed?

Below is a sample ABIS data share policy:
```JSON
{
  "dataSharePolicies": {
    "typeOfShare": "Data Share",
    "validForInMinutes": 30,
    "transactionsAllowed": 2,
    "encryptionType": "Partner Secret",
    "shareDomain": "mosip.io",
    "source": "Packet Manager"
  },
  "shareableAttributes": [
    {
      "attributeName": "biometrics",
      "group": "CBEFF",
      "source": [
        {
          "attribute": "registration-client/NEW/individualBiometrics",
          "filter": [
            {
              "type": "Iris"
            },
			{
              "type": "Finger"
            }
          ]
        }
      ],
      "encrypted": true,
      "format": "extraction"
    }
  ]
}
```

## Authentication Data Share

Once any data is created or updated in ID Repository the data needs to be shared with multiple ABIS instances. Similar to ABIS middleware, the credential issuance module in MOSIP shares the biometric and demographic data to Authentication systems (multiple Authentication Systems) based on the policy defined for respective Authentication systems.

Below is a sample Authentication data share policy:
```JSON
{
  "dataSharePolicies": {
    "typeOfShare": "Data Share",
    "validForInMinutes": 30,
    "transactionsAllowed": 2,
    "encryptionType": "Partner Secret",
    "shareDomain": "mosip.io",
    "source": "ID Repository"
  },
  "shareableAttributes": [
    {
      "attributeName": "fullName",
      "source": [
        {
          "attribute": "fullName"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "dateOfBirth",
      "source": [
        {
          "attribute": "dateOfBirth"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "gender",
      "source": [
        {
          "attribute": "gender"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "phone",
      "source": [
        {
          "attribute": "phone"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "email",
      "source": [
        {
          "attribute": "email"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "addressLine1",
      "source": [
        {
          "attribute": "addressLine1"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "addressLine2",
      "source": [
        {
          "attribute": "addressLine2"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "addressLine3",
      "source": [
        {
          "attribute": "addressLine3"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "region",
      "source": [
        {
          "attribute": "region"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "province",
      "source": [
        {
          "attribute": "province"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "city",
      "source": [
        {
          "attribute": "city"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "postalCode",
      "source": [
        {
          "attribute": "postalCode"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "biometrics",
      "group": "CBEFF",
      "source": [
        {
          "attribute": "individualBiometrics"
        }
      ],
      "encrypted": true,
      "format": "extraction"
    }
  ]
}
```

## Credentical Data Share

When any credential issuance is requested from a resident for generating a QR Code or printing of an id card, a data share URL is created for the print partners. Similar to ABIS middleware, the credential issuance module in MOSIP shares the residents  data to printing systems (based on multiple use cases) based on the policy defined for respective Printing systems & use cases.

Below is a sample QR code data share policy:
```JSON
{
  "dataSharePolicies": {
    "typeOfShare": "Data Share",
    "validForInMinutes": 30,
    "transactionsAllowed": 2,
    "encryptionType": "Partner Secret",
    "shareDomain": "mosip.io",
    "source": "ID Repository"
  },
  "shareableAttributes": [
    {
      "attributeName": "fullName",
      "source": [
        {
          "attribute": "fullName",
          "filter": [
            {
              "language": "eng"
            }
          ]
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "dateOfBirth",
      "source": [
        {
          "attribute": "dateOfBirth"
        }
      ],
      "encrypted": false,
      "format": "YYYY"
    },
    {
      "attributeName": "gender",
      "source": [
        {
          "attribute": "gender"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "phone",
      "source": [
        {
          "attribute": "phone"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "email",
      "source": [
        {
          "attribute": "email"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "addressLine1",
      "source": [
        {
          "attribute": "addressLine1"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "addressLine2",
      "source": [
        {
          "attribute": "addressLine2"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "addressLine3",
      "source": [
        {
          "attribute": "addressLine3"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "region",
      "source": [
        {
          "attribute": "region"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "province",
      "source": [
        {
          "attribute": "province"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "city",
      "source": [
        {
          "attribute": "city"
        }
      ],
      "encrypted": false
    },
    {
      "attributeName": "postalCode",
      "source": [
        {
          "attribute": "postalCode"
        }
      ],
      "encrypted": false
    }
  ]
}
```
