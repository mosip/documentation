# oauth-configuration

eSignet's `oauth-configuration` well-known endpoint holds the map which is exactly the same as the [OAuth-authorization-server's](https://www.rfc-editor.org/rfc/rfc8414.html#section-2) well-known specification.

```json
{
  'issuer': '${mosip.esignet.discovery.issuer-id}',
  'authorization_endpoint': '${mosipbox.public.url}${server.servlet.path}/authorize',
  'token_endpoint': '${mosipbox.public.url}${server.servlet.path}/token',
  'token_endpoint_auth_methods_supported': {'private_key_jwt'},
  'token_endpoint_auth_signing_alg_values_supported': {'RS256'},
  'userinfo_endpoint': '${mosipbox.public.url}${server.servlet.path}/userinfo',
  'jwks_uri': '${mosipbox.public.url}${server.servlet.path}/jwks.json',
  'registration_endpoint': '${mosipbox.public.url}${server.servlet.path}/register',
  'scopes_supported': ${mosip.esignet.supported.openid.scopes},
  'response_types_supported': {'code', 'code token'},
  'service_documentation': '${mosipbox.public.url}${server.servlet.path}/service_documentation.html',
  'ui_locales_supported': ${mosip.esignet.supported.ui.locales}
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
