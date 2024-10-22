# Mimoto - BFF

Mimoto serves as a Backend for Frontend (BFF) for Inji Web, handling retrieval of default configurations and downloading VCs. It offers essential APIs to Inji Web, facilitates validations, and forwards requests to relevant services.

To support credential issuance from any issuer compatible with the **OpenID4VCI** protocol, Mimoto must be onboarded as an OIDC client. Refer [here](https://docs.mosip.io/inji/inji-mobile-wallet/customization-overview/credential\_providers#onboarding-mimoto-as-oidc-client-for-new-issuer) for more details on how to onboard Mimoto (BFF) as an OIDC client.

Detailed API documentation for Mimoto is accessible [here](https://mosip.stoplight.io/docs/mimoto).

{% hint style="info" %}
Configuration details to set up a new provider that can issue VC, can be found in the `mimoto-issuers-config.json` property file. Refer to [mimoto-issuers-config.json](https://github.com/mosip/mosip-config/blob/collab-old/mimoto-issuers-config.json) of Collab environment.

In `mimoto-issuers-config.json`, new providers can be added as per the well-known schema.
{% endhint %}

### Mimoto endpoints used by Inji Web:

1. **Fetch Issuers**:

{% swagger src="../../../../.gitbook/assets/mimoto_latest.json" path="/issuers" method="get" %}
[mimoto_latest.json](../../../../.gitbook/assets/mimoto_latest.json)
{% endswagger %}

2. **Fetch Issuer's Configuration**:

{% swagger src="../../../../.gitbook/assets/mimoto_latest.json" path="/issuers/{issuer-id}" method="get" %}
[mimoto_latest.json](../../../../.gitbook/assets/mimoto_latest.json)
{% endswagger %}

3. **Download PDF**:

{% swagger src="../../../../.gitbook/assets/mimoto (2) (1).json" path="/issuers/{issuer-id}/credentials/{credentialType}/download" method="get" %}
[mimoto (2) (1).json](<../../../../.gitbook/assets/mimoto (2) (1).json>)
{% endswagger %}

4. **Fetch Issuer Credentials**:

This API fetches the list of Credential Types offered by the issuer, sourced from the well-known configuration of the issuer. Users can filter credentials based on search parameter.

`https://api.collab.mosip.net/v1/mimoto/issuers/{issuer-id}/.well-known`

**Method Type: GET**

**Parameter**:

issuerid: ID of the issuer in string type.

**Response**

Response code 200

```
{
  "credential_issuer": "https://injicertify-insurance.dev1.mosip.net",
  "authorization_servers": [
    "https://esignet-insurance.dev1.mosip.net"
  ],
  "credential_endpoint": "https://injicertify-insurance.dev1.mosip.net/v1/certify/issuance/credential",
  "credential_configurations_supported": {
    "InsuranceCredential": {
      "format": "ldp_vc",
      "scope": "sunbird_rc_insurance_vc_ldp",
      "order": [
        "fullName",
        "policyName",
        "policyExpiresOn",
        "policyIssuedOn",
        "policyNumber",
        "mobile",
        "dob",
        "gender",
        "benefits",
        "email"
      ],
      "proof_types_supported": {
        "jwt": {
          "proof_signing_alg_values_supported": [
            "RS256",
            "PS256"
          ]
        }
      },
      "credential_definition": {
        "type": [
          "VerifiableCredential",
          "InsuranceCredential"
        ],
        "credentialSubject": {
          "fullName": {
            "display": [
              {
                "name": "Name",
                "locale": "en"
              }
            ]
          },
          "mobile": {
            "display": [
              {
                "name": "Phone Number",
                "locale": "en"
              }
            ]
          },
          "dob": {
            "display": [
              {
                "name": "Date of Birth",
                "locale": "en"
              }
            ]
          },
          "gender": {
            "display": [
              {
                "name": "Gender",
                "locale": "en"
              }
            ]
          },
          "benefits": {
            "display": [
              {
                "name": "Benefits",
                "locale": "en"
              }
            ]
          },
          "email": {
            "display": [
              {
                "name": "Email Id",
                "locale": "en"
              }
            ]
          },
          "policyIssuedOn": {
            "display": [
              {
                "name": "Policy Issued On",
                "locale": "en"
              }
            ]
          },
          "policyExpiresOn": {
            "display": [
              {
                "name": "Policy Expires On",
                "locale": "en"
              }
            ]
          },
          "policyName": {
            "display": [
              {
                "name": "Policy Name",
                "locale": "en"
              }
            ]
          },
          "policyNumber": {
            "display": [
              {
                "name": "Policy Number",
                "locale": "en"
              }
            ]
          }
        }
      },
      "display": [
        {
          "name": "Health Insurance",
          "locale": "en",
          "logo": {
            "url": "https://raw.githubusercontent.com/tw-mosip/file-server/master/StayProtectedInsurance.png",
            "alt_text": "a square logo of a Veridonia"
          },
          "background_image": {
            "uri": "https://api.dev1.mosip.net/inji/veridonia-logo.png"
          },
          "background_color": "#FDFAF9",
          "text_color": "#7C4616"
        }
      ]
    },
    "LifeInsuranceCredential": {
      "format": "ldp_vc",
      "scope": "life_insurance_vc_ldp",
      "order": [
        "fullName",
        "policyName",
        "policyExpiresOn",
        "policyIssuedOn",
        "policyNumber",
        "mobile",
        "dob",
        "gender",
        "benefits",
        "email"
      ],
      "proof_types_supported": {
        "jwt": {
          "proof_signing_alg_values_supported": [
            "RS256",
            "ES256"
          ]
        }
      },
      "credential_definition": {
        "type": [
          "VerifiableCredential",
          "LifeInsuranceCredential"
        ],
        "credentialSubject": {
          "fullName": {
            "display": [
              {
                "name": "Name",
                "locale": "en"
              }
            ]
          },
          "mobile": {
            "display": [
              {
                "name": "Phone Number",
                "locale": "en"
              }
            ]
          },
          "dob": {
            "display": [
              {
                "name": "Date of Birth",
                "locale": "en"
              }
            ]
          },
          "gender": {
            "display": [
              {
                "name": "Gender",
                "locale": "en"
              }
            ]
          },
          "benefits": {
            "display": [
              {
                "name": "Benefits",
                "locale": "en"
              }
            ]
          },
          "email": {
            "display": [
              {
                "name": "Email Id",
                "locale": "en"
              }
            ]
          },
          "policyIssuedOn": {
            "display": [
              {
                "name": "Policy Issued On",
                "locale": "en"
              }
            ]
          },
          "policyExpiresOn": {
            "display": [
              {
                "name": "Policy Expires On",
                "locale": "en"
              }
            ]
          },
          "policyName": {
            "display": [
              {
                "name": "Policy Name",
                "locale": "en"
              }
            ]
          },
          "policyNumber": {
            "display": [
              {
                "name": "Policy Number",
                "locale": "en"
              }
            ]
          }
        }
      },
      "display": [
        {
          "name": "Life Insurance",
          "locale": "en",
          "logo": {
            "url": "https://raw.githubusercontent.com/tw-mosip/file-server/master/StayProtectedInsurance.png",
            "alt_text": "a square logo of a Veridonia"
          },
          "background_image": {
            "uri": "https://api.dev1.mosip.net/inji/veridonia-logo.png"
          },
          "background_color": "#FDFAF9",
          "text_color": "#7C4616"
        }
      ]
    }
  }
}

```
