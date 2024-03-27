# Partner Management

## Introduction

Partner Management provides services for various types of partners associated with the MOSIP system. Currently, in MOSIP we have identified some types of partners, but the adopters can choose to add many more partners.

1. Authentication Partners who provide authentication services to individuals who have registered in the MOSIP system.
2. MISP (MOSIP Infrastructure Service Provider) who provide infrastructure to send authentication request through as secure channel.
3. Device providers to provide MOSIP compliant devices for authentication & registration.
4. Foundational Trust Providers to provide chips in SBI 2.0 devices.
5. Credential or Print partners to generate ID Cards for the residents.
6. ABIS (Automated Biometric Integration System) to perform de-duplication. ... and many more,

Registered Partners are only allowed to access MOSIP services based on the roles provided to them by the MOSIP Partner Admin. These partners need to self register through MOSIP's Partner Management portal before the Partner Admin verifies their details and provides them access to MOSIP services. MOSIP services for a partner will work only when the Partner's credentials are registered in MOSIP and are verified by the service.

Partner Management also involves policy management for Partners. Each partner can access various services only based on a defined policy.

Based on partner type, MOSIP provides various services to respective partners.

## Detailed functionality

For detailed functionality of partner management please view our page, [Parter Management Functionality](Partner-Management-Functionality.md)

## Process Flows

### Device Provider

![](\_images/partner\_management/PMP-device\_provider-flow\_diagram.png)

### Foundational Trust Provider

![](\_images/partner\_management/PMP-ftp-flow\_diagram.png)

### Authentication Partner

![](\_images/partner\_management/PMP-authentication\_partner-flow\_diagram.png)

### Credential Partner

![](\_images/partner\_management/PMP-credential\_partner-flow\_diagram.png)

### MISP (MOSIP Infrastructure Service Provider)

![](\_images/partner\_management/PMP-misp-flow\_diagram.png)

### Policy Management

![](\_images/partner\_management/PMP-policy\_manager-flow\_diagram.png)

## Policy and Policy Group

### Policy

A Policy is a document in MOSIP which dictates various actions between the partner and MOSIP system. Policies for various partners may differ based on various use cases. Generally in MOSIP we have two types of Policies,

1. Authentication Policy, used by Authentication Partners
2. Credential Issuance Policy, used by Credential Partners

#### Sample Authentication Policy JSON

```
{
  "allowedAuthTypes": [
    {
      "authType": "otp",
      "mandatory": true
    },
    {
      "authType": "demo",
      "mandatory": false
    },
    {
      "authType": "bio",
      "authSubType": "FINGER",
      "mandatory": true
    },
    {
      "authType": "bio",
      "authSubType": "IRIS",
      "mandatory": false
    },
    {
      "authType": "bio",
      "authSubType": "FACE",
      "mandatory": false
    }
  ],
  "authTokenType": "random/partner/policy/policyGroup",
  "allowedKYCAttributes": [
    {
      "attributeName": "fullName"
    },
    {
      "attributeName": "dateOfBirth"
    },
    {
      "attributeName": "gender"
    },
    {
      "attributeName": "phone"
    },
    {
      "attributeName": "email"
    },
    {
      "attributeName": "addressLine1"
    },
    {
      "attributeName": "addressLine2"
    },
    {
      "attributeName": "addressLine3"
    },
    {
      "attributeName": "location1"
    },
    {
      "attributeName": "location2"
    },
    {
      "attributeName": "location3"
    },
    {
      "attributeName": "postalCode"
    }
  ]
}
```

#### Sample Credential Issuance Policy JSON

```
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

### Policy Group

A Policy Group is a sector or domain like banking, insurance, telecom etc, specific to a country. Any policy manager, partner manager and partner can belong to a specific policy group. MOSIP would require Policy Group master data prepared and defined beforehand by country, before creation of Partner, Partner Manager and Policy Manager.

### Policy Manager

Policy Manager would be creating and managing policies for the policy group he/she belongs to.

### PartnerAPIKey

For a partner to opt for an authentication policy, they have to generate PartnerAPIKey request with following sample parameters - PartnerCode, UseCaseDescription, SupportingInfo, Status etc. Once the PartnerAPIKey request is approved by Partner Manager, Partner is provided PartnerAPIKey that contains details like - PartnerAPIKey (combination of PartnerCode, policy group and policy), issuedOn, validTill, isActive etc)

### Logical View

![Partner Management Logical View](\_images/partner\_management/partner\_management\_logical\_diagram.png)

## Services

For detailed description of Partner Management Services, high and low level design refer to [partner management repo](https://github.com/mosip/mosip-partner-portal-api).

## Build and deploy

Refer to build and deploy instructions in [partner management repo](https://github.com/mosip/mosip-partner-portal-api).

## APIs

[Partner Management](Partner-Management-Service-APIs.md)
