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

4. **Search Issuer**:

This API filters the issuers based on the search criteria entered in the search bar on the Home page of Inji Web.

`{{HOST}}/issuers?search=Sunbird`


   ```
   openapi: 3.0.1
x-stoplight:
  id: 5bf5a1n68g4tq
info:
  title: mimoto
  description: mimoto
  license:
    name: Mosip
    url: https://docs.mosip.io/platform/license
  version: '1.0'
servers:
  - url: https://api.collab.mosip.net/residentmobileapp
    description: For Swagger
paths:
  /issuers/{issuer-id}/credentialTypes:
    get:
      operationId: getCredentialTypes
      parameters:
        - name: issuer-id
          in: path
          required: true
          schema:
            type: string
        - name: search
          in: query
          required: false
          schema:
            type: string
      description: This API fetches and allows searching for Credential Types offered by the issuer, all sourced from the issuer's well-known configuration.
      responses:
        '200':
          description: OK
          content:
            application/json:
              x-examples:
                Example 1:
                  supportedCredentials:
                    - format: ldp_vc
                      id: InsuranceCredential
                      scope: sunbird_rc_insurance_vc_ldp
                      display:
                        - name: MOSIP Insurance
                          logo:
                            url: https://api.collab.mosip.net/inji/mosip-logo.png
                            alt_text: insurance logo
                          locale: en
                          background_color: '#fafcff'
                          text_color: '#00284d'
                      proof_types_supported:
                        - jwt
                      credential_definition:
                        type:
                          - VerifiableCredential
                          - InsuranceCredential
                        credentialSubject:
                          fullName:
                            display:
                              - name: Full Name
                                locale: en
                          policyName:
                            display:
                              - name: Policy Name
                                locale: en
                          policyNumber:
                            display:
                              - name: Policy Number
                                locale: en
                          gender:
                            display:
                              - name: Gender
                                locale: en
                          expiresOn:
                            display:
                              - name: Expiry Date
                                locale: en
                          dob:
                            display:
                              - name: Date Of Birth
                                locale: en
                    - format: ldp_vc
                      id: LifeInsuranceCredential_ldp
                      scope: life_insurance_vc_ldp
                      display:
                        - name: Sunbird Life Insurance
                          logo:
                            url: https://sunbird.org/images/sunbird-logo-new.png
                            alt_text: Sunbird life insurance logo
                          locale: en
                          background_color: '#fefcfa'
                          text_color: '#7C4616'
                      proof_types_supported:
                        - jwt
                      credential_definition:
                        type:
                          - VerifiableCredential
                          - LifeInsuranceCredential
                        credentialSubject:
                          fullName:
                            display:
                              - name: Full Name
                                locale: en
                          policyName:
                            display:
                              - name: Policy Name
                                locale: en
                          policyNumber:
                            display:
                              - name: Policy Number
                                locale: en
                          gender:
                            display:
                              - name: Gender
                                locale: en
                          policyExpiresOn:
                            display:
                              - name: Expiry Date
                                locale: en
                          dob:
                            display:
                              - name: Date Of Birth
                                locale: en
                  authorization_endpoint: http://localhost:8088/authorize
              examples:
                Success response:
                  value:
                    id: mosip.resident.vid
                    version: v1
                    str: null
                    responsetime: '2022-10-31T05:08:14.846Z'
                    metadata: null
                    response:
                      supportedCredentials:
                        - format: ldp_vc
                          id: InsuranceCredential
                          scope: sunbird_rc_insurance_vc_ldp
                          display:
                            - name: MOSIP Insurance
                              logo:
                                url: https://api.collab.mosip.net/inji/mosip-logo.png
                                alt_text: insurance logo
                              locale: en
                              background_color: '#fafcff'
                              text_color: '#00284d'
                          proof_types_supported:
                            - jwt
                          credential_definition:
                            type:
                              - VerifiableCredential
                              - InsuranceCredential
                            credentialSubject:
                              fullName:
                                display:
                                  - name: Full Name
                                    locale: en
                              policyName:
                                display:
                                  - name: Policy Name
                                    locale: en
                              policyNumber:
                                display:
                                  - name: Policy Number
                                    locale: en
                              gender:
                                display:
                                  - name: Gender
                                    locale: en
                              expiresOn:
                                display:
                                  - name: Expiry Date
                                    locale: en
                              dob:
                                display:
                                  - name: Date Of Birth
                                    locale: en
                        - format: ldp_vc
                          id: LifeInsuranceCredential_ldp
                          scope: life_insurance_vc_ldp
                          display:
                            - name: Sunbird Life Insurance
                              logo:
                                url: https://sunbird.org/images/sunbird-logo-new.png
                                alt_text: Sunbird life insurance logo
                              locale: en
                              background_color: '#fefcfa'
                              text_color: '#7C4616'
                          proof_types_supported:
                            - jwt
                          credential_definition:
                            type:
                              - VerifiableCredential
                              - LifeInsuranceCredential
                            credentialSubject:
                              fullName:
                                display:
                                  - name: Full Name
                                    locale: en
                              policyName:
                                display:
                                  - name: Policy Name
                                    locale: en
                              policyNumber:
                                display:
                                  - name: Policy Number
                                    locale: en
                              gender:
                                display:
                                  - name: Gender
                                    locale: en
                              policyExpiresOn:
                                display:
                                  - name: Expiry Date
                                    locale: en
                              dob:
                                display:
                                  - name: Date Of Birth
                                    locale: en
                      authorization_endpoint: http://localhost:8088/authorize
                    errors: null
                Failure response:
                  value:
                    id: null
                    version: v1
                    str: null
                    responsetime: '2022-10-31T05:07:34.789Z'
                    metadata: null
                    response: null
                    errors:
                      - errorCode: RESIDENT-APP-026
                        errorMessage: Api not accessible failure
                Failure response 2:
                  value:
                    id: null
                    version: v1
                    str: null
                    responsetime: '2022-10-31T05:07:34.789Z'
                    metadata: null
                    response: null
                    errors:
                      - errorCode: RESIDENT-APP-035
                        errorMessage: Invalid issuer ID
components:
  schemas:
    AppVIDGenerateRequestDTO:
      type: object
      properties:
        individualId:
          type: string
        individualIdType:
          type: string
        otp:
          type: string
        vidType:
          type: string
        transactionID:
          type: string
    AppOTPRequestDTO:
      type: object
      properties:
        individualId:
          type: string
        individualIdType:
          type: string
        otpChannel:
          type: array
          items:
            type: string
        transactionID:
          type: string
    IndividualIdOtpRequestDTO:
      type: object
      properties:
        aid:
          type: string
        otpChannel:
          type: array
          items:
            type: string
        transactionID:
          type: string
    AuthUnlockRequestDTO:
      type: object
      properties:
        transactionID:
          type: string
        individualIdType:
          type: string
        individualId:
          type: string
        otp:
          type: string
        authType:
          type: array
          items:
            type: string
        unlockForSeconds:
          type: string
    AuthLockRequestDTO:
      type: object
      properties:
        transactionID:
          type: string
        individualIdType:
          type: string
        individualId:
          type: string
        otp:
          type: string
        authType:
          type: array
          items:
            type: string
    AppCredentialRequestDTO:
      type: object
      properties:
        individualId:
          type: string
        otp:
          type: string
        transactionID:
          type: string
        issuer:
          type: string
        credentialType:
          type: string
        user:
          type: string
    CredentialDownloadRequestDTO:
      type: object
      properties:
        individualId:
          type: string
        requestId:
          type: string
    CredentialDownloadResponseDTO:
      type: object
      properties:
        credential:
          $ref: '#/components/schemas/JsonNode'
        verifiableCredential:
          $ref: '#/components/schemas/JsonNode'
    JsonNode:
      type: object
    Event:
      type: object
      properties:
        id:
          type: string
        transactionId:
          type: string
        type:
          $ref: '#/components/schemas/Type'
        timestamp:
          type: string
        dataShareUri:
          type: string
        data:
          type: object
          additionalProperties:
            type: object
    EventModel:
      type: object
      properties:
        publisher:
          type: string
        topic:
          type: string
        publishedOn:
          type: string
        event:
          $ref: '#/components/schemas/Event'
    Type:
      type: object
      properties:
        namespace:
          type: string
        name:
          type: string
    GenericResponseDTO:
      type: object
      properties:
        status:
          type: string
        message:
          type: string
    AidStatusRequestDTO:
      type: object
      properties:
        aid:
          type: string
        otp:
          type: string
        transactionID:
          type: string
```
