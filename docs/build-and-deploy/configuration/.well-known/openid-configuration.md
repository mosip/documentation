# openid-configuration



```json
{
  "issuer": "https://esignet.collab.mosip.net/v1/esignet",
  "authorization_endpoint": "https://esignet.collab.mosip.net/v1/esignet/authorize",
  "token_endpoint": "https://esignet.collab.mosip.net/v1/esignet/oauth/token",
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
    "mosip:idp:acr:static-code",
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
  "userinfo_encryption_enc_values_supported": [
    "A128GCM"
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
    "phone_number",
    "individual_id"
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
  ]
}
```
