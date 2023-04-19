# Client management with PMS

1.  e-Signet is onboarded as MISP partner in MOSIP system with the below policy:

    ```json
     {
     "allowAuthRequestDelegation": true,
     "allowKycRequestDelegation": true,
     "trustBindedAuthVerificationToken": true,
     "allowKeyBindingDelegation": true
     }
    ```
2. License key of the MISP partner must be updated in the `esignet-default.properties`.\
   Property name : `mosip.esignet.misp.license.key`
3. Create and Update of OIDC clients are managed via PMS.\


{% swagger src=".gitbook/assets/partner-management-service-openapi.json" path="/oidc/client" method="post" %}
[partner-management-service-openapi.json](.gitbook/assets/partner-management-service-openapi.json)
{% endswagger %}



1.  Relying party is onboarded as a Auth partner. Auth partner is required to have the below allowed auth-types in the policy.

    ```json
    { "allowedAuthTypes" : [
                            {"authSubType":"","authType":"kycauth","mandatory":false},
                            {"authSubType":"","authType":"kycexchange","mandatory":false},
                            {"authSubType":"","authType":"otp-request","mandatory":false},
                           ]
    }
    ```
2. An auth-partner may have one or more OIDC clients.
3. SHA-256 hash of the OIDC client public key is considered as clientID.
4.  Authentication Context References(ACR) and user claims are derived based on the policy of the auth partner.

    a. `allowedKycAttributes` are used to derive user claims using the identity\_mapping.json

    b. `allowedAuthTypes` are used to derive ACR values using the amr-acr-mapping.json
5. Client management endpoints of e-Signet oidc-service is invoked from PMS with the derived values, clientId and the provided public-key.
6. Also, the client-details with policy and partner details are sent as an event to MOSIP IDA system.

## Configurations

1. To get the mapping of OIDC claims with MOSIP KYC-attributes.
2. To get the mapping of auth types in policy with ACR values.

## Sample auth-policy of a relying party

```json
{"authTokenType":"policy",
  "allowedKycAttributes":[{"attributeName":"fullName"},
    {"attributeName":"gender"},
    {"attributeName":"phone"},
    {"attributeName":"email"},
    {"attributeName":"dateOfBirth"},
    {"attributeName":"city"},
    {"attributeName":"face"},
    {"attributeName":"addressLine1"}],
  "allowedAuthTypes":[{"authSubType":"IRIS","authType":"bio","mandatory":false},
    {"authSubType":"FINGER","authType":"bio","mandatory":false},
    {"authSubType":"","authType":"otp","mandatory":false},
    {"authSubType":"FACE","authType":"bio","mandatory":false},
    {"authSubType":"","authType":"otp-request","mandatory":false},
    {"authSubType":"","authType":"kycauth","mandatory":false},
    {"authSubType":"","authType":"kycexchange","mandatory":false},
    {"authSubType":"","authType":"wla","mandatory":false}]
}
```
