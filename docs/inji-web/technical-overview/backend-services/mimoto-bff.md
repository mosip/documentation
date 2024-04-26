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

{% swagger src="../../../.gitbook/assets/mimoto_latest.json" path="/issuers" method="get" %}
[mimoto_latest.json](../../../.gitbook/assets/mimoto_latest.json)
{% endswagger %}

2. **Fetch Issuer's Configuration**:

{% swagger src="../../../.gitbook/assets/mimoto_latest.json" path="/issuers/{issuer-id}" method="get" %}
[mimoto_latest.json](../../../.gitbook/assets/mimoto_latest.json)
{% endswagger %}

3. **Download PDF**: 

{% swagger src="../../../.gitbook/assets/mimoto (2) (1).json" path="/issuers/{issuer-id}/credentials/{credentialType}/download" method="get" %}
[mimoto (2) (1).json](<../../../.gitbook/assets/mimoto (2) (1).json>)
{% endswagger %}

4. **Fetch Issuer Credentials**:

This API fetches the list of Credential Types offered by the issuer, sourced from the well-known configuration of the issuer. Users can filter credentials based on search parameter.

`https://api.collab.mosip.net/residentmobileapp/issuers/{issuerid}/credentialTypes?search={credentials}`

**Method Type: GET**

### Parameter: 

issuerid: ID of the issuer in string type.

### Query parameter

credentials: Search parameter for credential display name in string type.

### Response

Response code 200
```
{
  "id": "mosip.resident.vid",
  "version": "v1",
  "str": null,
  "responsetime": "2022-10-31T05:08:14.846Z",
  "metadata": null,
  "response": {
    "supportedCredentials": [
      {
        "format": "ldp_vc",
        "id": "InsuranceCredential",
        "scope": "sunbird_rc_insurance_vc_ldp",
        "display": [
          {
            "name": "MOSIP Insurance",
            "logo": {
              "url": "https://api.collab.mosip.net/inji/mosip-logo.png",
              "alt_text": "insurance logo"
            },
            "locale": "en",
            "background_color": "#fafcff",
            "text_color": "#00284d"
          }
        ],
        "proof_types_supported": [
          "jwt"
        ],
        "credential_definition": {
          "type": [
            "VerifiableCredential",
            "InsuranceCredential"
          ],
          "credentialSubject": {
            "fullName": {
              "display": [
                {
                  "name": "Full Name",
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
            },
            "gender": {
              "display": [
                {
                  "name": "Gender",
                  "locale": "en"
                }
              ]
            },
            "expiresOn": {
              "display": [
                {
                  "name": "Expiry Date",
                  "locale": "en"
                }
              ]
            },
            "dob": {
              "display": [
                {
                  "name": "Date Of Birth",
                  "locale": "en"
                }
              ]
            }
          }
        }
      },
      {
        "format": "ldp_vc",
        "id": "LifeInsuranceCredential_ldp",
        "scope": "life_insurance_vc_ldp",
        "display": [
          {
            "name": "Sunbird Life Insurance",
            "logo": {
              "url": "https://sunbird.org/images/sunbird-logo-new.png",
              "alt_text": "Sunbird life insurance logo"
            },
            "locale": "en",
            "background_color": "#fefcfa",
            "text_color": "#7C4616"
          }
        ],
        "proof_types_supported": [
          "jwt"
        ],
        "credential_definition": {
          "type": [
            "VerifiableCredential",
            "LifeInsuranceCredential"
          ],
          "credentialSubject": {
            "fullName": {
              "display": [
                {
                  "name": "Full Name",
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
            },
            "gender": {
              "display": [
                {
                  "name": "Gender",
                  "locale": "en"
                }
              ]
            },
            "policyExpiresOn": {
              "display": [
                {
                  "name": "Expiry Date",
                  "locale": "en"
                }
              ]
            },
            "dob": {
              "display": [
                {
                  "name": "Date Of Birth",
                  "locale": "en"
                }
              ]
            }
          }
        }
      }
    ],
    "authorization_endpoint": "https://esignet.collab.mosip.net/authorize"
  },
  "errors": null
}
```

