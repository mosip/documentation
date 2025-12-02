# OAuth Autorization Server Well-Known

## Overview <a href="#overview" id="overview"></a>

The `oauth-configuration` well-known endpoint in eSignet exposes metadata that describes the capabilities, endpoints, and supported features of the authorization server. This metadata follows the OpenID Connect Discovery and OAuth 2.0 Authorization Server Metadata specifications ([RFC 8414](../../../../readme/standards.md#id-2.-supported-standards-and-rfcs)), enabling client applications to automatically obtain configuration details required for integration.

The values published by eSignet at this endpoint align with the standard OAuth Authorization Server well-known specifications.

## Oauth - Authorization server Configuration  <a href="#oauth-authorization-server-configuration" id="oauth-authorization-server-configuration"></a>

Please refer below for more details.

```json
{
  "issuer": "https://esignet.es-dev1.mosip.net",
  "authorization_endpoint": "https://esignet.es-dev1.mosip.net/authorize",
  "token_endpoint": "https://esignet.es-dev1.mosip.net/v1/esignet/oauth/v2/token",
  "jwks_uri": "https://esignet.es-dev1.mosip.net/.well-known/jwks.json",
  "pushed_authorization_request_endpoint": "https://esignet.es-dev1.mosip.net/v1/esignet/oauth/par",
  "token_endpoint_auth_methods_supported": [
    "private_key_jwt"
  ],
  "token_endpoint_auth_signing_alg_values_supported": [
    "RS256",
    "PS256",
    "ES256"
  ],
  "scopes_supported": [
    "openid",
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
  "authorization_response_iss_parameter_supported": true
}
```

{% hint style="info" %}
As per the FAPI 2.0 Security Profile, the OAuth Authorization Server now includes a new parameter: `authorization_response_iss_parameter_supported`.
{% endhint %}

## Parameter Details and Descriptions <a href="#parameter-details-and-descriptions" id="parameter-details-and-descriptions"></a>

* `issuer`: The base URL of the OpenID Connect provider. The value comes from the configuration property `mosip.esignet.discovery.issuer-id`.
* `authorization_endpoint`: The URL where the authorization request can be initiated.
* `token_endpoint`: The URL where the token exchange occurs to obtain an access token.
* `token_endpoint_auth_methods_supported`: The supported authentication methods for the token endpoint. In this case, private\_key\_jwt is supported.
* `token_endpoint_auth_signing_alg_values_supported`: The supported signing algorithms for the authentication of the token endpoint. In this case, RS256 (RSA with SHA-256) is supported.
* `userinfo_endpoint`: The URL where additional user information can be requested. jwks\_uri: The URL where the JSON Web Key Set (JWKS) can be retrieved. The JWKS contains the public keys used to verify ID tokens and other JWTs.
* `scopes_supported`: The supported scopes that can be requested during the authentication process. The value should come from the configuration property `mosip.esignet.supported.openid.scopes`. Common scopes include profile, email, and phone.
* `response_types_supported`: The supported response types. In eSignet, we support only two values '`code`' and '`code token`', for the code flow and the code token flow.
* `ui_locales_supported`: The supported user interface locales for localization. The value comes from the configuration property `mosip.esignet.supported.ui.locales`.\
  Examples: en (English), fr (French), and ar (Arabic).
* `authorization_response_iss_parameter_supported`: Indicates whether the authorization server includes the `iss` (issuer) parameter in the authorization response. In eSignet, this value is always set to `true` by default.
