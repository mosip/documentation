# Development and Integration with eSignet

This guide provides a step-by-step approach for developers who want to integrate their application as a **Relying Party (RP)** with **eSignet**.

### Prerequisites

Before integrating your Relying Party application with eSignet, ensure the following are in place:

| Requirement                                                       | Description                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ----------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Client registered with eSignet**                                | RP must be onboarded and issued a client\_id. client\_secret is not applicable.                                                                                                                                                                                                                                                                                                                                                                 |
| **eSignet well-known endpoint access**                            | <p>/.well-known/jwks.json</p><p>/.well-known/openid-configuration</p>                                                                                                                                                                                                                                                                                                                                                                           |
| **Client Authentication Method**                                  | <p>Only <strong>private_key_jwt</strong> is supported for token endpoint client authentication. Access to <strong>RSA/EC Private Key</strong> used by RP to sign the JWT during token request.<br><strong>Note</strong>: Should be securely stored and rotated periodically.</p>                                                                                                                                                                |
| **Registered Redirect URI**                                       | <p>Must be pre-configured with eSignet(during onboarding ). It may be:</p><ul><li>A <strong>frontend page</strong></li><li>A <strong>mobile app deeplink / custom scheme</strong></li><li>Or even a <strong>backend endpoint</strong></li></ul>                                                                                                                                                                                                 |
| **Scopes/Claims required by RP**                                  | <p>openid is mandatory. Optional scopes → profile, email, phone, or custom scopes if supported.</p><p><strong>Note</strong>: Check the /.well-known/openid-configuration for supported scopes and claims.</p>                                                                                                                                                                                                                                   |
| **Choose libraries for JWT Creation, Signing & OIDC Integration** | <p>Since <strong>private_key_jwt</strong> authentication requires the RP to generate a signed JWT for token requests, we recommend using well-supported cryptographic and OIDC client libraries. Developers may choose one based on their language/platform.</p><p>Reference: <a href="https://openid.net/developers/certified-openid-connect-implementations/">https://openid.net/developers/certified-openid-connect-implementations/</a></p> |

Always fetch the authorize, PAR, token, userinfo endpoint URL dynamically from .well-known/openid-configuration. This ensures your integration remains compatible even if environments or endpoints change.

### **🛠️ Step-by-Step implementation:**

#### Step 1: Redirect user to eSignet Authorization Endpoint

Add a **Sign-in with eSignet** button to your login page that links to the authorize URL. A lightweight JavaScript plugin is available from eSignet to render this button automatically. By default, the plugin can be loaded from:

```
https://<eSignet-domain>/plugins/sign-in-button-plugin.js
```

The button may follow specific branding guidelines such as name, logo usage, color scheme, and size. These are typically defined by the Identity Provider. eSignet provides a [**UI Storybook**](https://mosip.github.io/mosip-sdk/?path=/docs/javascript-sign-in-with-esignet--docs) that demonstrates recommended styles and customization options for relying party implementations:\
Additionally, sign-in-button-plugin.js provides **PAR** and **DPoP** support. Refer storybook to know more details on how to configure and use the par\_callback and dpop\_callback parameter.

\{% details title="eSignet Authorization Endpoint Specification" %\}

```
openapi: 3.0.1
paths:
  /authorize:
    get:
      tags:
        - OIDC
      summary: Authorization Endpoint
      description: |-
        This is the authorize endpoint of Open ID Connect (OIDC). The relying party applications will do a browser redirect to this endpoint with all required details passed as query parameters.

        This endpoint will respond with a basic HTML page to load a JS application in the browser. UI JS application will then echo all the query parameters received in this endpoint to the "/authorization/oauth-details" endpoint as the request body.

        All the validations on the query parameter values will be performed in the "/authorization/oauth-details" endpoint.

        **Authentication & Authroization**: None
      operationId: get-authorize
      parameters:
        - name: scope
          in: query
          description: Specifies what access privileges are being requested for Access Tokens. The scopes associated with Access Tokens determine what resources will be available when they are used to access OAuth 2.0 protected endpoints. OpenID Connect requests MUST contain the OpenID scope value.
          required: true
          schema:
            type: string
            enum:
              - openid profile
              - openid
              - profile
              - email
              - address
              - phone
              - offline_access
            default: openid profile
        - name: response_type
          in: query
          description: 'The value set here determines the authorization processing flow. To use the Authorization Code Flow, the value should be configured to "code".'
          required: true
          schema:
            const: code
        - name: client_id
          in: query
          description: Valid OAuth 2.0 Client Identifier in the Authorization Server.
          required: true
          schema:
            type: string
            maxLength: 256
        - name: redirect_uri
          in: query
          description: Redirection URI to which the response would be sent. This URI must match one of the redirection URI values during the client ID creation.
          required: true
          schema:
            type: string
            format: uri
        - name: state
          in: query
          description: 'Opaque value used to maintain state between the request and the callback. Typically, Cross-Site Request Forgery (CSRF, XSRF) mitigation is done by cryptographically binding the value of this parameter with a browser cookie.'
          schema:
            type: string
            maxLength: 256
        - name: nonce
          in: query
          description: 'String value used to associate a Client session with an ID Token, and to mitigate replay attacks. The value is passed through unmodified from the Authentication Request to the ID Token.'
          schema:
            type: string
        - name: display
          in: query
          description: ASCII string value that specifies how the Authorization Server displays the authentication and consent user interface pages to the end user.
          schema:
            type: string
            enum:
              - page
              - popup
              - touch
              - wap
        - name: prompt
          in: query
          description: Space delimited case-sensitive list of ASCII string values that specifies whether the Authorization Server prompts the End-User for re-authentication and consent.
          schema:
            type: string
            enum:
              - none
              - login
              - consent
              - select_account
            examples:
              - consent
        - name: max_age
          in: query
          description: 'Maximum Authentication Age. This specifies the allowable elapsed time in seconds since the last time the end user was actively authenticated by the OP. If the elapsed time is greater than this value, then the OP MUST attempt to actively re-authenticate the end user. The max_age request parameter corresponds to the OpenID 2.0 PAPE [OpenID.PAPE] max_auth_age request parameter. When max_age is used, the ID Token returned MUST include an auth_time claim value.'
          schema:
            type: number
        - name: ui_locales
          in: query
          description: 'End user''s preferred languages and scripts for the user interface, represented as a space-separated list of BCP47 [RFC5646] language tag values, ordered by preference. For instance, the value "fr-CA fr en" represents a preference for French as spoken in Canada, then French (without a region designation), followed by English (without a region designation). An error SHOULD NOT result if some or all of the requested locales are not supported by the OpenID Provider.'
          schema:
            type: string
        - name: acr_values
          in: query
          description: 'Requested Authentication Context Class Reference values. Space-separated string that specifies the acr values that the Authorization Server is being requested to use for processing this Authentication Request, with the values appearing in order of preference. The Authentication Context Class satisfied by the authentication performed is returned as the acr Claim Value, as specified in Section 2. The acr Claim is requested as a Voluntary Claim by this parameter.'
          schema:
            type: string
            enum:
              - 'mosip:idp:acr:password'
              - 'mosip:idp:acr:static-code'
              - 'mosip:idp:acr:generated-code'
              - 'mosip:idp:acr:linked-wallet'
              - 'mosip:idp:acr:biometrics'
              - 'mosip:idp:acr:knowledge'
              - 'mosip:idp:acr:id-token'
        - name: claims_locales
          in: query
          description: 'End-User''s preferred languages and scripts for Claims being returned, represented as a space-separated list of BCP47 [RFC5646] language tag values, ordered by preference. An error SHOULD NOT result if some or all of the requested locales are not supported by the OpenID Provider.'
          schema:
            type: string
        - name: claims
          in: query
          description: This parameter is used to request specific claims to be returned. The value is a JSON object listing the requested claims. The claims parameter value is represented in an OAuth 2.0 request as UTF-8 encoded JSON.
          schema:
            type: string
        - name: code_challenge
          in: query
          description: 'A challenge derived from the code_verifier, This is required if its a VC scoped request.'
          schema:
            type: string
        - name: code_challenge_method
          in: query
          description: 'A method that was used to derive code challenge, This will be required if code_challenge is provided.'
          schema:
            type: string
        - schema:
            type: string
          in: query
          description: ID Token previously issued by the Authorization Server being passed as a hint about the End-User's current or past authenticated session with the Client.
          name: id_token_hint
        - schema:
            type: string
          in: query
          description: 'The request URI corresponding to the pushed authorization request posted. This URI is a single-use reference to the respective request data in the subsequent authorization request.'
          name: request_uri
      responses:
        '200':
          description: |-
            OK

            Loads JS application, and validates the provided query parameters using oauth-details endpoint.
      servers:
        - url: 'https://esignet.collab.mosip.net/v1/esignet'
      x-stoplight:
        id: bx55bzakduy97
```

\{% enddetails %\}

#### **PAR Support in Authorization Request**

eSignet supports **Pushed Authorization Requests (PAR)** as per OAuth 2.0 standards.\
Using PAR, the RP first submits authorization request parameters directly to eSignet through a **secure back-channel PAR endpoint**, then receives a request\_uri which is used in the authorize URL.

\{% details title="eSignet PAR Endpoint Specification" %\}

```
openapi: 3.0.1
paths:
  /oauth/par:
    post:
      tags:
        - OIDC
      summary: PAR Endpoint
      description: |-
        **PAR - Pushed Authorization Request**

        1. Message body of an this request with parameters formatted with x-www-form-urlencoded using a character encoding of UTF-8
        2. Add "pushed_authorization_request_endpoint" in the authorization server metadata.
        3. Client must adds its authentication credentials to the request body using the same rules as for token endpoint request.
        4. Authenticate the client in the same way as at the token endpoint.
        5. Reject the request if the request_uri authorization request parameter is provided.
        6. Validate the request parmeters in the body as it would be validated in oauth-details request.
        7. Upon successful verification, the server MUST generate a request URI and provide it in the response with a 201 HTTP status code.

        **request_uri** should be in this format: 'urn:ietf:params:oauth:request_uri:<secure random alpha-numeric string with max length of 25>'

        Successfully verified request parameters should be stored in the "par" cache with request_uri as the key. Objects in the "par" cache are set with TTL.
        TTL should be configurable and the expires_in parameter in the response should return same value.

        **Not supported:**
          1. client authentication parameters in the PAR request header.
          2. The request parameter as defined in JAR [RFC9101].
          3. API rate limit is left to the infra to handle.
          4. Use of non-registered redirect_uri's are not allowed.
      operationId: post-oauth-par
      requestBody:
        content:
          application/x-www-form-urlencoded:
            schema:
              type: object
              required:
                - scope
                - response_type
                - client_id
                - redirect_uri
                - client_assertion
                - client_assertion_type
              properties:
                scope:
                  type: string
                  description: Specifies what access privileges are being requested for Access Tokens. The scopes associated with Access Tokens determine what resources will be available when they are used to access OAuth 2.0 protected endpoints. OpenID Connect requests MUST contain the OpenID scope value.
                response_type:
                  type: string
                  description: 'Value that determines the authorization processing flow to be used. When using the Authorization Code Flow, this value is code.'
                  x-stoplight:
                    id: 06op369n6ipx2
                client_id:
                  type: string
                  description: OAuth 2.0 Client Identifier valid at the Authorization Server
                  x-stoplight:
                    id: loecaliscjne7
                redirect_uri:
                  type: string
                  description: Redirection URI to which the response will be sent. This URI MUST exactly match one of the Redirection URI values for the Client pre-registered
                  x-stoplight:
                    id: obnx0myaatag7
                state:
                  type: string
                  description: client state value echoed.
                nonce:
                  type: string
                  description: Client's nonce value echoed.
                display:
                  type: string
                  description: ASCII string value that specifies how the Authorization Server displays the authentication and consent user interface pages to the End-User.
                prompt:
                  type: string
                  description: 'Space delimited, case sensitive list of ASCII string values that specifies whether the Authorization Server prompts the End-User for re-authentication and consent.'
                acr_values:
                  type: string
                  description: |-
                    Space separated ACR values, Unknown ACR are ignored. Only registered ACR values will be considered.
                    if none of the provided acr value is among the registered values, Error response is returned with error code "invalid_acr".
                claims:
                  $ref: '#/components/schemas/Claim'
                max_age:
                  type: number
                  description: 'Maximum Authentication Age. Specifies the allowable elapsed time in seconds since the last time the End-User was actively authenticated by the OP. If the elapsed time is greater than this value, the OP MUST attempt to actively re-authenticate the End-User. (The max_age request parameter corresponds to the OpenID 2.0 PAPE [OpenID.PAPE] max_auth_age request parameter.) When max_age is used, the ID Token returned MUST include an auth_time Claim Value.'
                claims_locales:
                  type: string
                  description: 'End-User''s preferred languages and scripts for Claims being returned, represented as a space-separated list of BCP47 [RFC5646] language tag values, ordered by preference. An error SHOULD NOT result if some or all of the requested locales are not supported by the OpenID Provider.'
                ui_locales:
                  type: string
                  description: 'End-User''s preferred languages and scripts for the user interface, represented as a space-separated list of BCP47 [RFC5646] language tag values, ordered by preference. For instance, the value "fr-CA fr en" represents a preference for French as spoken in Canada, then French (without a region designation), followed by English (without a region designation). An error SHOULD NOT result if some or all of the requested locales are not supported by the OpenID Provider.'
                code_challenge:
                  type: string
                  description: 'A challenge derived from the code verifier, to be verified against later.'
                code_challenge_method:
                  const: S256
                  description: A method that was used to derive code challenge.
                  type: string
                id_token_hint:
                  type: string
                  description: ID Token previously issued by the Authorization Server being passed as a hint about the End-User's current or past authenticated session with the Client.
                client_assertion_type:
                  const: 'urn:ietf:params:oauth:client-assertion-type:jwt-bearer'
                  description: Type of the client assertion part of this request.
                  type: string
                client_assertion:
                  type: string
                  description: The value of the "client_assertion" parameter contains a single JWT.
                dpop_jkt:
                  type: string
                  description: 'The value of the dpop_jkt authorization request parameter is the JWK Thumbprint [RFC7638] of the proof-of-possession public key using the SHA-256 hash function.'
            examples:
              example-1:
                value:
                  client_id: WMX5pO6dYdCFR3iaVWGclVPNxTNSADDv
                  scope: openid profile
                  response_type: code
                  redirect_uri: 'https://fastlane.com/homepage'
                  display: popup
                  prompt: login
                  acr_values: 'mosip:idp:acr:generated-code'
                  claims:
                    userinfo:
                      name:
                        essential: true
                      phone_number:
                        essential: true
                      email:
                        essential: false
                      address:
                        essential: true
                    id_token: {}
                  nonce: 973eieljzng
                  state: eree2311
                  claims_locales: en
                  code_challenge: UK95aVX_y3R44DF3hssd3wATvtZmO_WejE0P33-pwTs
                  code_challenge_method: S256
                  client_assertion: eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJXTVg1cE82ZFlkQ0ZSM2lhVldHY2xWUE54VE5TQUREdiIsImlzcyI6IldNWDVwTzZkWWRDRlIzaWFWV0djbFZQTnhUTlNBRER2IiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6ODA4MC92MS9lc2lnbmV0L29hdXRoL3BhciIsImlhdCI6MTUxNjIzOTAyMn0.B250eeJsmBesAlYXhK-QUSi6bLOFqHCaKgXocGgUJvp5XjaiWLH1H722pjaXRaK3Eczs3HTW8RxDKQefiT6AIm4ZgQjacNZzlzca_tIc8-5_WWzVUAIfvv6NJ9SLTKJdlvXJKFhhCeLrCsvENJsfZRborkrh-cVMod3iLTK3lPFz0ylwhZ5NV1L9mgVM-0-HQO3HnG0UI0zokmZXDzkmrJsnMV_NPkSnJsaxpGsw9R9Ma5RTGqg7_l-okB5EadUoOMV8OKnloqzja1NXrBGCQZoAq2GDg9bchgHaQoTnZXpaVLgGWxlHOkLXGj15aK_JzGf_JOBRg12mamatWj_ZYA
                  client_assertion_type: 'urn:ietf:params:oauth:client-assertion-type:jwt-bearer'
      responses:
        '201':
          description: CREATED
          content:
            application/json:
              schema:
                type: object
                properties:
                  request_uri:
                    type: string
                    description: The request URI corresponding to the authorization request posted. This URI is a single-use reference to the respective request data in the subsequent authorization request.
                  expires_in:
                    type: number
                    description: A JSON number that represents the lifetime of the request URI in seconds as a positive integer.
                  error:
                    type: string
                    description: 'Error code, available in error response.'
                    enum:
                      - invalid_request
                      - invalid_client_id
                      - invalid_redirect_uri
                      - invalid_scope
                      - invalid_acr
                      - invalid_response_type
                      - invalid_display
                      - invalid_prompt
                  error_description:
                    type: string
                    description: 'Error description, available in error response.'
              examples:
                example-1:
                  value:
                    request_uri: 'urn:ietf:params:oauth:request_uri:6esc_11ACC5bwc014ltc14eY22c'
                    expires_in: 10
                example-2:
                  value:
                    error: invalid_request
                    error_description: invalid_request
      servers:
        - url: 'https://esignet.collab.mosip.net/v1/esignet'
      x-stoplight:
        id: 9zp5uhyyzp9w6
    parameters:
      - schema:
          type: string
        in: header
        name: DPoP
        description: 'A DPoP proof is a JWT [RFC7519] that is signed (using JSON Web Signature (JWS) [RFC7515]) with a private key chosen by the client. For more details refer - https://datatracker.ietf.org/doc/html/rfc9449#section-4.2'
```

\{% enddetails %\}



{% hint style="success" %}


**Notes:**

* scope defines what user attributes RP can request.
* claims enables RP to decide which user attributes are optional & mandatory.
* Always generate fresh state & nonce to prevent replay & CSRF.
* acr\_values defines authentication method options, RP must choose based on the required assurance level.
* The redirect\_uri provided must be an absolute, fully qualified URL (without any wildcard or regex). This URI is then matched against the redirect URIs stored in the eSignet database for the same Client ID. Since the stored URIs may include wildcards or patterns, the matching process allows partial or regex-based checks rather than requiring an exact match.
* The prompt=consent parameter should be used if the Relying Party (RP) requires eSignet to present a consent screen to the user during every authentication flow.\
  If this parameter is omitted, consent is shown only during the first authorization request, and will be shown again only when the previously granted consent expires (expire duration is configured per client).
{% endhint %}



#### Step 2: User Authenticates and Consent on eSignet Screen

eSignet handles:

🔐 Authentication with the chosen authentication method. Eg: OTP / Biometrics / Wallet\
🔐 Consent screen (only if claims are shared)

**Successful authentication**

If authentication succeeds, the user is redirected to the redirect\_uri specified in the authorization request, along with an authorization code returned in the code query parameter.

**Failed authentication**

If authentication fails, the user is redirected to the same redirect\_uri, but with an error code returned in the error query parameter. It is the RP’s responsibility to handle the error appropriately.

#### Step 3: Exchange Code for Tokens

Exchange authorization code for an Access token using the token endpoint. It is always suggested to use the token endpoint URL published in the .well-known/openid-configuration. This ensures your integration remains compatible even if environments or endpoints change.

Refer the below for token endpoint details:

\{% details title="eSignet Token Endpoint Specification" %\}

```
openapi: 3.0.1
paths:
    /oauth/v2/token:
    post:
      tags:
        - OIDC
      summary: Token Endpoint V2
      description: |-
        Once the client / relying party application receives the authorization code through redirect, this OIDC complaint endpoint will be called from the relying party backend application to get the ID and access token.

        1. The only supported client authentication methods : <b>private_key_jwt</b>
        2. clientAssertion is a signed JWT with Clients private key, corresponding public key should be shared with IdP during the OIDC client registration process.
        3. clientAssertion JWT payload must be as below: 

        The JWT MUST contain the following REQUIRED Claim Values and MAY contain the additional OPTIONAL Claim Values:

        **iss**<span style="color:#FF0000">*</span> (Issuer): This MUST contain the client_id of the OAuth Client.

        **sub**<span style="color:#FF0000">*</span> (Subject): This MUST contain the client_id of the OAuth Client.

        **aud**<span style="color:#FF0000">*</span> (Audience): Value that identifies the authorization server as an intended audience. The authorization server MUST verify that it is an intended audience for the token. The audience SHOULD be the URL of the authorization server's token endpoint.

        **exp**<span style="color:#FF0000">*</span> (Expiration): Time on or after which the ID token MUST NOT be accepted for processing.

        **iat**<span style="color:#FF0000">*</span>: Time at which the JWT was issued.</p>

        **jti**<span style="color:#FF0000">*</span>: Random unique string</p>

        **Note**: The Client Assertion JWT can contain other Claims. Any Claims used that are not understood WILL be ignored.</p>
      operationId: post-token-v2
      requestBody:
        description: ''
        content:
          application/x-www-form-urlencoded:
            schema:
              type: object
              properties:
                grant_type:
                  const: authorization_code
                  description: Authorization code grant type.
                code:
                  type: string
                  description: 'Authorization code, sent as query param in the client''s redirect URI.'
                client_id:
                  type: string
                  description: Client Id of the OIDC client.
                client_assertion_type:
                  const: 'urn:ietf:params:oauth:client-assertion-type:jwt-bearer'
                  description: Type of the client assertion part of this request.
                client_assertion:
                  type: string
                  description: 'Private key signed JWT, This JWT payload structure is defined above as part of request description.'
                redirect_uri:
                  type: string
                  description: Valid client redirect_uri. Must be same as the one sent in the authorize call.
                code_verifier:
                  type: string
                  description: |-
                    A cryptographically random string that is used to correlate the
                          authorization request to the token request.
              required:
                - grant_type
                - code
                - client_assertion_type
                - client_assertion
                - redirect_uri
            examples:
              Example 1:
                value:
                  grant_type: authorization_code
                  code: tyemdnjdfornfedg
                  client_id: WMX5pO6dYdCFR3iaVWGclVPNxTNSADDv-kV7VBcnzvY
                  client_assertion_type: 'urn:ietf:params:oauth:client-assertion-type:jwt-bearer'
                  client_assertion: eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2OTg2MzE0NjAsIm5iZiI6MTY5ODYzMTQ2MCwiZXhwIjoxNjk4NjMxNTI1LCJqdGkiOiI1ZFFjaWhtb2lfQTlXMmlERGpYcDgiLCJzdWIiOiJXTVg1cE82ZFlkQ0ZSM2lhVldHY2xWUE54VE5TQUREdi1rVjdWQmNuenZZIiwiaXNzIjoiV01YNXBPNmRZZENGUjNpYVZXR2NsVlBOeFROU0FERHYta1Y3VkJjbnp2WSIsImF1ZCI6Imh0dHBzOi8vZXNpZ25ldC5jb2xsYWIubW9zaXAubmV0L3YxL2VzaWduZXQvb2F1dGgvdG9rZW4ifQ.G-OxPmb2wBq7R52PELNss9FCwvv_i2456FE4oag25BuZjwH6CgB8LDLmfCJdzeLGRuFp_MrKskGTkpsWI0RWLNtqZ7jvQTvSq8zQICusIFh9kcciWbkMsOZQqN91gPtdrn3WRS6xD7TxzwvrAeuqx4lTBbWNYTF2GQ3Zagq0t6ogOtPWg0wNioW3m11jWIdwooJ8jI2Z5oN772Lerrs1AXMnipLxQm4rdMM54taeHFrrXyxqFjoiq-bglrpHtCqeG6QFqhpQrRlIsLLoli8F1LU8Mu3Fw7ifCd6KEj9JNM_sPHjAy-JRg_dgjNdHL5tqtHzUsD5sSmLop33U4WH3Ow
                  redirect_uri: 'https://fastlane.com/homepage'
                  code_verifier: MN1Q0nNAKkqOu5EaNBKf2gYD4maYv9ZxLd-48N2_kTM
      responses:
        '200':
          description: OK
          content:
            application/json:
              schema:
                type: object
                properties:
                  id_token:
                    type: string
                    description: |-
                      Identity token in JWT format. Will have the below claims in the payload.
                      <ul>
                      <li>iss</li>
                      <li>sub</li>
                      <li>aud</li>
                      <li>exp</li>
                      <li>iat</li>
                      <li>auth_time</li>
                      <li>nonce</li>
                      <li>acr</li>
                      <li>at_hash</li>
                      </ul>

                      It is non-null only in OIDC flow. otherwise the id_token is not returned.
                  access_token:
                    type: string
                    description: The access token in JWT format. This token that will be used to call the UserInfo endpoint.
                  token_type:
                    enum:
                      - Bearer
                      - DPoP
                    description: 'The type of the access token, set to either Bearer or DPoP'
                  expires_in:
                    type: number
                    description: 'The lifetime of the access token, in seconds.'
                    format: duration
                  c_nonce:
                    type: string
                    description: JSON string containing a nonce to be used to create a proof of possession of key material when requesting a Credential.
                  c_nonce_expires_in:
                    type: number
                    description: JSON integer denoting the lifetime in seconds of the c_nonce.
                required:
                  - access_token
                  - token_type
                  - expires_in
              examples:
                Example 1:
                  value:
                    token_type: Bearer
                    access_token: eyJraWQiOiJLT19tVHBfc1QwemxGRVVkX25UdGhmbzl0RTlTX21GQnJ6OTFwZjd5RFFBIiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJQVlJtZkRwZ1pKcXZMTWZZcTZwcUItTDNZQTZXR3dYZmxiTlJpVWF6THJjIiwiYXVkIjoiaHR0cHM6XC9cL2VzaWduZXQtbW9jay5jb2xsYWIubW9zaXAubmV0XC92MVwvZXNpZ25ldFwvdmNpXC9jcmVkZW50aWFsIiwiY19ub25jZV9leHBpcmVzX2luIjo0MCwiY19ub25jZSI6IkN0OXJwUUZiOTZRU1N3Z0hBZkRPIiwic2NvcGUiOiJzYW1wbGVfdmNfbGRwIiwiaXNzIjoiaHR0cHM6XC9cL2VzaWduZXQtbW9jay5jb2xsYWIubW9zaXAubmV0XC92MVwvZXNpZ25ldCIsImV4cCI6MTY5ODYzNTczOSwiaWF0IjoxNjk4NjMyMTM5LCJjbGllbnRfaWQiOiI4OFZqdDM0YzVUd3oxb0oifQ.EAWkcaDUTMH1FcrXdsj4s-y9t8gVB1YBiIZ6VqZD3ZSGR3OrkIQUN2y8vbtvXJv8WAVV_0pvphFjIa9gVRP63_vdZipJ3h04vYcpyfTn50Yml-77uhB_JgHeQWZ0rnCQ1LQGSdSYKro9A1smevVCb1vyPf6QoQPumzKHJ9Jg7SojyhXON2sdIn94Xc5-gok-jGQEapbIBm3RhUEsFPGl7MjaMqBpodV-JOuEi0j_7VfxhLTXXoYZm_-h2aZCWJ9MQDtUC8TwNp-ap5f-O4lQx_M79jyn2mXa0NtoPPIQeffnCPq-uS43C0LZ9CQTfwIC4xV8-x2ema2fHWvtebSsmQ
                    expires_in: 3600
                    c_nonce: Ct9rpQFb96QSSwgHAfDO
                    c_nonce_expires_in: 40
          headers:
            Cache-Control:
              schema:
                const: no-store
            Pragma:
              schema:
                const: no-cache
        '400':
          description: Bad Request
          content:
            application/json:
              schema:
                type: object
                properties:
                  error:
                    type: string
                    enum:
                      - invalid_transaction
                      - invalid_assertion
                      - invalid_redirect_uri
                      - invalid_input
                      - unknown_error
                      - invalid_request
                      - invalid_assertion_type
                      - invalid_pkce_code_verifier
                      - unsupported_pkce_challenge_method
                      - pkce_failed
                      - invalid_dpop_proof
                      - use_dpop_nonce
                    description: The error code.
                  error_description:
                    type: string
                    description: Optional text providing additional information about the error that occurred.
                required:
                  - error
      servers:
        - url: 'https://esignet.collab.mosip.net/v1/esignet'
      x-stoplight:
        id: bx4h4esbzst37
    parameters:
      - schema:
          type: string
        in: header
        name: DPoP
        description: 'A DPoP proof is a JWT [RFC7519] that is signed (using JSON Web Signature (JWS) [RFC7515]) with a private key chosen by the client. For more details refer - https://datatracker.ietf.org/doc/html/rfc9449#section-4.2'        description: 'A DPoP proof is a JWT [RFC7519] that is signed (using JSON Web Signature (JWS) [RFC7515]) with a private key chosen by the client. For more details refer - https://datatracker.ietf.org/doc/html/rfc9449#section-4.2'
```

\{% enddetails %\}

#### Step 4: Verify & Parse the Access & ID Token

Access token generated by eSignet follow \[RFC9068] JSON Web Token (JWT) Profile for OAuth 2.0 Access Tokens.

* Validate JWT signature using public key published on eSignet /.well-known/jwks.json
* Validate aud, iss, exp, iat in both the tokens.
* Additionally validate auth\_time, nonce, acr, at\_hash in the ID token.

💡**Key Notes:**

* eSignet does not support user claims in ID token.
* The sub claim in ID and access token is a pairwise pseudonymous identifier.

Avoid storing **ID Tokens** or **Access Tokens** in browser localStorage or sessionStorage. If an attacker gains access to the browser context, they can extract the tokens and impersonate the user.

Instead, it is recommended to perform the token exchange and validation on the RP backend and maintain a **secure server-side session**. The user’s browser should only store a short-lived, HTTP-only, SameSite cookie that maps to this session for stronger protection model.

#### Step 5: Get Consented User Claims Using Access Token

If the Relying Party (RP) needs user attributes (e.g., eKYC data), the developer must implement a call to the userinfoendpoint using the Access Token obtained during token exchange.\
Always fetch the endpoint URL dynamically from .well-known/openid-configuration

This ensures your integration remains compatible even if environments or endpoints change.

The userinfo response is returned as a **signed JWT (JWS)** by default. The RP must validate the JWT signature using the public keys from /.well-known/jwks.json

If required, the RP can be configured to request an encrypted (JWE) userinfo response for additional security.

💡**Key Notes:**

* The sub claim in the userinfo JWT will match the sub present in both the Access Token and ID Token, ensuring user identity continuity.
* Use the claims\_locales parameter in the authorize request if user attributes need to be returned in a specific language. (This is supported only when the identity system maintains multilingual claims.)

Refer the below for userinfo endpoint details:

\{% details title="eSignet Userinfo Endpoint Specification" %\}

```
openapi: 3.0.1
paths:
      /oidc/userinfo:
    get:
      tags:
        - OIDC
      summary: UserInfo Endpoint
      description: |-
        Once the access token is received via the token endpoint, relying party backend application can call this OIDC compliant endpoint to request for the user claims.

        Consented user claims will be returned as a JWT. This JWT will be a nested JWT which is a signed using JWS and then encrypted using JWE. 


        **Example**: Assuming the below are the requested claims by the relying party

        name : { "essential" : true }

        phone: { "essential" : true }

        **Response 1**: When consent is provided for both name and phone number:

        { "name" : "John Doe", "phone" : "033456743" }

        **Response 2**: When consent is provided for only name:

        { "name" : "John Doe" }

        **Response 3**: When Claims are requested with claims_locales : "en fr"

        { "name#en" : "John Doe", "name#fr" : "Jean Doe", "phone" : "033456743" } 

        **Supported User Info Claims**
        <ul>
        <li>sub - Partner Specific User Token (PSUT)</li>
        <li>name</li>
        <li>address</li>
        <li>gender</li>
        <li>birthdate</li>
        <li>profile photo</li>
        <li>email</li>
        <li>phone</li>
        <li>locale</li>
        <li>Custom - individual_id (You share this claim as a system-level config and it can be UIN, perceptual VID or temporary VID)</li>
        </ul>
      operationId: get-userinfo
      responses:
        '200':
          description: OK
          content:
            application/jwt:
              schema:
                type: string
                description: 'The response is signed and then encrypted, with the result being a Nested JWT. Signed using the authentication system''s private key. Signed full JWT will then be encrypted using OIDC client''s public key.'
                format: jwt
              examples:
                Example 1:
                  value: eyJraWQiOiJlU0dtNm5LcGppUHRJMnAzbVVWNHBWWm9nY0VHaExMV2dCNXNuUzNvbUNzIiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiIyNTgwMDg2NDcxMDgzMDEzNjAzMjA2NDYwMDYwMDU4NDE3NTEiLCJhZGRyZXNzIjp7ImxvY2FsaXR5IjoiUmFiYXQgIn0sIm5hbWUiOiJhcnZpbmQiLCJwaG9uZV9udW1iZXIiOiI3ODY0ODQ2MzQzIiwiZW1haWwiOiJhcmF2aW5kaDIwOTBAZ21haWwuY29tIn0.WqkXaalFJu1nzAgoSmLKOHddX7_tkgcTEZRK8uedfl6rbNRZ7Lv0uayTT--3r4Z0Wlnjh1pUMreFvKd1yfirIf0LaPvuTBe5AVRRUMGPhPkSCq_ietytg75uNUH-Z91jLluh8mIZ5BlsGf_MfdkKD10pvzG9cWowWeWlD2hj-YNw05SUAdvZtHeN8ayMTaPOa-Jc0Sv3kXS0xM6Geizq5QCpIWaavZNw9GJF8GEizGK3klq3od9PfHKrh8XruUFM849iyAShIUTgr9mFlWzHVuTqbpcc2ZptLY_egOq8qKA5guBEplB92PlaxQQeyxRvMezZtDiRdzf5BSpM_1ok0g
        '401':
          description: Unauthorized
          headers:
            WWW-AUTHENTICATE:
              schema:
                type: string
                enum:
                  - invalid_token
                  - unknown_error
                  - invalid_dpop_proof
                  - use_dpop_nonce
              description: 'Bearer error=invalid_token,  error_description=MOSIPIDP123: A user info request was made with an access token that was not recognized.'
      security:
        - Authorization-access_token: []
        - Authorization-DPoP: []
      servers:
        - url: 'https://esignet.collab.mosip.net/v1/esignet'
      x-stoplight:
        id: 6iqtka3aua3f2
    parameters:
      - schema:
          type: string
        in: header
        name: DPoP
        description: 'A DPoP proof is a JWT [RFC7519] that is signed (using JSON Web Signature (JWS) [RFC7515]) with a private key chosen by the client. For more details refer - https://datatracker.ietf.org/doc/html/rfc9449#section-4.2'
  components:
    securitySchemes:
      Authorization-DPoP:
        type: http
        scheme: DPoP
        description: 'A DPoP-bound access token is sent using the Authorization request header field with an authentication scheme of DPoP.'
      Authorization-access_token:
        type: http
        description: Access token received from /token endpoint
        scheme: bearer
```

\{% enddetails %\}

📄 Sample userinfo JWT payload:

```
{
  "sub": "63EBC25D699305A26EE740A955852EAB2E6527BFF2F5E9E5562B502DACECD020",
  "address": {
    "street_address": "#991, 47 Street, 6 block",
    "country": "India",
    "locality": "Bengaluru",
    "region": "Bengaluru Urban",
    "postal_code": "14022"
  },
  "gender": "Male",
  "phone": "91000395660",
  "name": "Manoj",
  "email": "manoj@mail.com"
}
```

📄 Sample userinfo JWT payload (with claims in 2 languages):

```
{
  "sub": "63EBC25D699305A26EE740A955852EAB2E6527BFF2F5E9E5562B502DACECD020",
  "name#en": "Manoj",
  "address#en": {
    "formatted#en": "#991, 47 Street, 6 block"
  },
  "phone": "91600395660",
  "gender#kn": "ಗಂಡು",
  "name#kn": "ಮನೋಜ್",
  "address#kn": {
    "formatted#kn": "#991, 47 ಸ್ಟ್ರೀಟ್, 6 ಬ್ಲಾಕ್"
  },
  "gender#en": "Male",
  "email": "manoj@mail.com"
}
```
