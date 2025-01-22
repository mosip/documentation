# openid-configuration

eSignet's `openid-configuration` well-known endpoint holds the map, which is the same as the [openid-configuration's](https://openid.net/specs/openid-connect-discovery-1_0.html#ProviderConfigurationResponse) well-known specification.

```json
{
  "issuer": "https://esignet.collab.mosip.net",
  "authorization_endpoint": "https://esignet.collab.mosip.net/authorize",
  "token_endpoint": "https://esignet.collab.mosip.net/v1/esignet/oauth/v2/token",
  "userinfo_endpoint": "https://esignet.collab.mosip.net/v1/esignet/oidc/userinfo",
  "jwks_uri": "https://esignet.collab.mosip.net/v1/esignet/oauth/.well-known/jwks.json",
  "scopes_supported": [
    "profile",
    "email",
    "phone"
  ],
  "response_types_supported": [
    "code"
  ],
  "acr_values_supported": [
    "mosip:idp:acr:password",
    "mosip:idp:acr:generated-code",
    "mosip:idp:acr:linked-wallet",
    "mosip:idp:acr:biometrics"
  ],
  "userinfo_signing_alg_values_supported": [
    "RS256"
  ],
  "userinfo_encryption_alg_values_supported": [
    "RSAXXXXX"
  ],
  "response_modes_supported": [
    "query"
  ],
  "token_endpoint_auth_methods_supported": [
    "private_key_jwt"
  ],
  "token_endpoint_auth_signing_alg_values_supported": [
    "RS256"
  ],
  "id_token_signing_alg_values_supported": [
    "RS256"
  ],
  "claim_types_supported": [
    "normal"
  ],
  "claims_supported": [
    "name",
    "address",
    "gender",
    "birthdate",
    "picture",
    "email",
    "phone_number"
  ],
  "claims_locales_supported": [
    "en"
  ],
  "display_values_supported": [
    "page",
    "popup",
    "touch",
    "wap"
  ],
  "ui_locales_supported": [
    "en"
  ],
  "claims_in_verified_claims_supported" : [
  "name",
  "address",
  "gender",
  "birthdate",
  "picture",
  "email",
  "phone_number" 
  ]
}
```

* `issuer`: The base URL or identifier of the OpenID Connect provider. The value comes from the configuration property mosip.esignet.discovery.issuer-id.
* `authorization_endpoint`: The URL where the authorization request can be initiated.
* `token_endpoint`: The URL where the token exchange occurs to obtain an access token.
* `userinfo_endpoint`: The URL where additional user information can be requested.
* `introspection_endpoint`: The URL where the token introspection can be performed to validate token information.
* `jwks_uri`: The URL where the JSON Web Key Set (JWKS) can be retrieved. The JWKS contains the public keys used to verify ID tokens and other JWTs.
* `scopes_supported`: The supported scopes that can be requested during the authentication process. The value comes from the configuration property `mosip.esignet.supported.openid.scopes`.
* `response_types_supported`: The supported response types for the authorization request. The value comes from the configuration property mosip.esignet.supported.response.types.
* `response_modes_supported`: The supported response modes for the authorization request. The value is \["query"], indicating that only the query response mode is supported.
* `token_endpoint_auth_methods_supported`: The supported authentication methods for the token endpoint. The value is based on the configuration property `mosip.esignet.supported.client.auth.methods`.
* `token_endpoint_auth_signing_alg_values_supported`: The supported signing algorithms for the authentication of the token endpoint. In this case, the value is \["RS256"], indicating that only the RS256 (RSA with SHA-256) algorithm is supported.
* `userinfo_signing_alg_values_supported`: The supported signing algorithms for the user information endpoint. The value is \["RS256"], indicating that only the RS256 algorithm is supported for signing user information.
* `userinfo_encryption_alg_values_supported`: The supported encryption algorithms for the user information endpoint. The value is \["RSAXXXXX"], suggesting that a specific encryption algorithm (represented as "RSAXXXXX") is supported. The actual algorithm should be provided.
* `userinfo_encryption_enc_values_supported`: The supported encryption methods for the user information endpoint. The value is \["A128GCM"], indicating that only the A128GCM encryption method is supported.
* `id_token_signing_alg_values_supported`: The supported signing algorithms for ID tokens. The value is \["RS256"], indicating that only the RS256 algorithm is supported for signing ID tokens.
* `claim_types_supported`: The supported claim types. The value is \["normal"], suggesting that only normal claims are supported.
* `claims_parameter_supported`: Specifies whether the claims parameter is supported in authorization requests. The value is true, indicating that the claims parameter is supported.
* `display_values_supported`: The supported display values for the user interface. The value is based on the configuration property mosip.esignet.supported.ui.displays.
* `subject_types_supported`: The supported subject types. The value is \["pairwise"], indicating that only pairwise subject types are supported.
* `claims_supported`: The supported claims that can be included in ID tokens and user info responses. The value is a list of claim names, such as "`iss`", "`sub`", "`acr`", "`name`", etc.
* `acr_values_supported`: The supported authentication context class references (ACR). The value is an empty object {}, indicating that no specific ACR values are supported.
* `request_parameter_supported`: Specifies whether the request parameter is supported in authorization requests. The value is false, indicating that the request parameter is not supported.
* `ui_locales_supported`: The supported user interface locales. The value is an empty object {}, suggesting that no specific UI locales are supported.
* `claims_in_verified_claims_supported:` Supported verified claim names.
