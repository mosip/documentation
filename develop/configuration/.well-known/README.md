# .well-known

eSignet publishes a small set of standard OIDC/OAuth discovery documents so a client can auto-configure itself — endpoint URLs, supported scopes and claims, signing algorithms, and more — rather than having those values hardcoded or configured by hand. For a new integration, these are usually the first thing to check. As with [Configure eSignet](../), the full technical detail for each lives in the repository; this page gives you the crux of each and links to the real file.

### Why does eSignet use the ".well-known" directory?

eSignet uses the ".well-known" directory to serve the following purposes:

* **Standardization**: To provide a standardized location for specific public files and resources related to web services and security. It makes it easier for developers and web clients using eSignet to know where to look for important information.
* **Security**: Security-related files and resources can be placed in the ".well-known" directory, such as the public certificate for encryption and signature verification.
* **Interoperability**: By following the ".well-known" convention, web developers using eSignet can ensure interoperability with various web standards and protocols. For example, eSignet shares the context file, which contains the structure of its verifiable credentials.
* **Ease of Configuration**: Web servers can be configured to serve files from the ".well-known" directory without needing custom configurations for each specific resource. This simplifies the server setup and maintenance process.
* **Transparency**: For matters related to security policies and contact information, such as in the "security.txt" file, placing them in a well-known location makes it transparent and easily accessible to anyone interested in the website's security practices.

### What Drives All Three

* **`issuer`** (env `MOSIP_ESIGNET_HOST`) — becomes the `issuer` field in every document.
* **`server.public_url`** (env `MOSIP_ESIGNET_BASE_URL`, falls back to `issuer`) — prefixed onto every endpoint path to build the full endpoint URLs.
* **CORS** — gated by `allowed_origin_regex`; unset means no `Access-Control-Allow-Origin` header on these endpoints.

All three are covered in [Configure eSignet](../#where-configuration-lives)'s basic settings.

### The Three Endpoints

#### jwks.json — The Public Keys Clients Use to Verify Tokens

`GET /oauth2/jwks` publishes the currently active signing keys; `/.well-known/jwks.json` is just an nginx alias to the same route. Key rotation is reflected here automatically.

Refer here for the further details

#### OAuth Authorization Server — Discovery for Plain OAuth Clients

`GET /.well-known/oauth-authorization-server` lets a plain OAuth client discover the token and authorization endpoints, and which grant types, client auth methods, and security features (PAR, DPoP, PKCE) are supported.

Refer here for the further details

#### OpenID Provider Configuration — Discovery for OIDC Clients

`GET /.well-known/openid-configuration` carries everything the OAuth Authorization Server document does, plus OIDC-only fields — the userinfo endpoint, supported scopes and claims, subject and signing/encryption algorithm types, and supported ACR values.

Refer here for the further details
