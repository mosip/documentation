# oauth-configuration

eSignet's `oauth-configuration` well-known endpoint holds the map which is exactly the same as the [OAuth-authorization-server's](https://www.rfc-editor.org/rfc/rfc8414.html#section-2) well-known specification.

```json
{
  "issuer": "https://esignet.collab.mosip.net",
  "authorization_endpoint": "https://esignet.collab.mosip.net/authorize",
  "token_endpoint": "https://esignet.collab.mosip.net/v1/esignet/oauth/v2/token",
  "jwks_uri": "https://esignet.collab.mosip.net/.well-known/jwks.json",
  "token_endpoint_auth_methods_supported": [
    "private_key_jwt"
  ],
  "token_endpoint_auth_signing_alg_values_supported": [
    "RS256"
  ],
  "scopes_supported": [
    "profile",
    "email",
    "phone"
  ],
  "response_modes_supported": [
    "query"
  ],
  "grant_types_supported": [
    "authorization_code"
  ],
  "response_types_supported": [
    "code"
  ],
  "ui_locales_supported": ["en"]
}
```

* `issuer`: The base URL of the OpenID Connect provider. The value comes from the configuration property `mosip.esignet.discovery.issuer-id`.&#x20;
* `authorization_endpoint`: The URL where the authorization request can be initiated.&#x20;
* `token_endpoint`: The URL where the token exchange occurs to obtain an access token.&#x20;
* `token_endpoint_auth_methods_supported`: The supported authentication methods for the token endpoint. In this case, private\_key\_jwt is supported.&#x20;
* `token_endpoint_auth_signing_alg_values_supported`: The supported signing algorithms for the authentication of the token endpoint. In this case, RS256 (RSA with SHA-256) is supported.&#x20;
* `userinfo_endpoint`: The URL where additional user information can be requested. jwks\_uri: The URL where the JSON Web Key Set (JWKS) can be retrieved. The JWKS contains the public keys used to verify ID tokens and other JWTs.&#x20;
* `scopes_supported`: The supported scopes that can be requested during the authentication process. The value should come from the configuration property `mosip.esignet.supported.openid.scopes`. Common scopes include profile, email, and phone.&#x20;
* `response_types_supported`: The supported response types. In eSignet, we support only two values '`code`' and '`code token`', for the code flow and the code token flow.&#x20;
* `ui_locales_supported`: The supported user interface locales for localization. The value  comes from the configuration property `mosip.esignet.supported.ui.locales`. \
  Examples: en (English), fr (French), and ar (Arabic).
