---
description: Below are some frequently asked questions (FAQs) about eSignet.
---

# FAQs

## About eSignet

<details>

<summary><strong>What is eSignet?</strong></summary>

**eSignet** is a digital identity verification tool that simplifies access to online services. It allows users to identify themselves using various [authentication methods](../readme/features.md#supported-authentication-methods) and supports multiple forms of IDs as handles (e.g. National ID, Phone Number, Email ID, etc.).

In today's era of digital transformation, there has been a global shift towards moving most services online. To facilitate personalized access to these online services, a secure and trusted digital identity is crucial. eSignet strives to provide a user-friendly and effective method for individuals to authenticate themselves and utilize online services while also having the option to share their profile information. Moreover, eSignet supports multiple modes of identity verification to ensure inclusivity and broaden access, thereby reducing potential digital barriers.

To know more eSignet please refer [here](../).

</details>

<details>

<summary><strong>How can I use eSignet?</strong></summary>

You can integrate with eSignet based on the type of entity, such as an ID system, a relying party, or a digital wallet. For more details, please go through our [integration guides](../develop/integration/).

If you are interested in trying out eSignet right away, you can use our sandbox for testing. Please go through our [Try it out ](../local-deployment/try-it-out/)section for more details.

</details>

<details>

<summary><strong>What are the various modes of authentication that eSignet supports?</strong></summary>

eSignet provides multiple authentication methods, as listed below:

* OTP Authentication
* Biometric Authentication
* Password-based Authentication
* Knowledge-Based Identification (KBI)

For a full list of supported authentication methods, refer to the [eSignet features](../readme/features.md).

{% hint style="info" icon="wallet" %}
**Note:** Wallet-based authentication is not supported in eSignet v2.0.0. It will be added in an upcoming release to bring the Go version to feature parity with eSignet (Java).
{% endhint %}

</details>

<details>

<summary><strong>Who are the intended users of eSignet?</strong></summary>

The intended users of eSignet include:

* Government ID Agencies that need secure verification mechanisms to deliver services to their residents.
* Individuals or residents accessing online services.
* Businesses and/or Service Providers that require streamlined methods to authenticate beneficiaries and provide services.

</details>

<details>

<summary><strong>How scalable is eSignet? Can it handle a significant increase in user volume?</strong></summary>

eSignet is simple, lightweight, and powerful. The Go-based implementation compiles to a single binary with a minimal memory footprint, making horizontal scaling straightforward. It uses [Redis](https://redis.io/) as a shared OIDC transaction and flow state store, enabling stateless multi-instance deployments behind a load balancer. It can scale effortlessly to handle large user volumes while acting as a middle layer for identity verification.

For capacity planning, refer to the [latest performance report](../roadmap-and-releases/versions/v2.0.0/performance-report.md). It ships JMeter scripts and a TPS thread-setting calculator to estimate the required threads and sustainable throughput for a target TPS. Published resource calculator is available [here](https://github.com/mosip/esignet/blob/release-2.0.x/performance-test/resource_calculator_eSignet_2.0.0.xlsx).

</details>

<details>

<summary><strong>How does eSignet ensure the security and privacy of user data?</strong></summary>

eSignet applies several data-minimization and data-protection controls to limit exposure of personal information:

* **Data minimization:** eSignet issues access tokens tied to user identifiers and releases only the claims explicitly requested and consented to by the user. Authentication inputs (OTP, biometric, KBI fields) are processed in-flight and are not persisted by eSignet.
* **Consent:** The login process occurs exclusively on the eSignet platform. A built-in consent flow requires users to explicitly grant or withhold access to each requested claim before any information is shared with a relying party. Consent decisions are recorded with an expiry and can be withdrawn.
* **Protected data flow:** The Go implementation enforces JWE-encrypted ID tokens and userinfo responses (configured per client), DPoP-bound access tokens when enabled per client via `additionalConfig.dpop_bound_access_tokens` (preventing token replay by a different client), and JTI replay prevention on incoming signed assertions. All signing and encryption keys are managed by the embedded Go keymanager, configured via `KEYMANAGER_*` environment variables, with optional HSM (PKCS#11) backing.

</details>

<details>

<summary><strong>What technologies are used in the development of eSignet?</strong></summary>

For a complete breakdown of the technology stack used in the Go-based eSignet implementation, refer to the [Technology Stack](../readme/technology.md) document.

</details>

<details>

<summary><strong>Why should an entity adopt eSignet?</strong></summary>

eSignet is an open-source, flexible solution that follows standard protocols ([OAuth 2.1](https://oauth.net/2.1/), [OpenID Connect](https://openid.net/specs/openid-connect-core-1_0.html), [FAPI 2.0](https://openid.net/specs/fapi-security-profile-2_0.html)) for easy integration and high security, ensuring no vendor lock-in. As a MOSIP product, it integrates with any trusted ID system and offers a secure, adaptable identity verification solution.

</details>

## Features and Functionality

<details>

<summary><strong>What unique features does eSignet offer?</strong></summary>

* **Standards-based security:** [OAuth 2.1](https://oauth.net/2.1/), [OpenID Connect](https://openid.net/specs/openid-connect-core-1_0.html), [FAPI 2.0](https://openid.net/specs/fapi-security-profile-2_0.html) (PAR + DPoP + `private_key_jwt`), PKCE, JWE-encrypted responses.
* **Declarative authentication flows:** Authentication logic is defined as YAML flow graphs (`data/flows/*.yaml`) and interpreted at runtime, no code changes required to modify the login flow.
* **Multiple pluggable identity backends:** MOSIP IDA (OTP + KYC), [SunbirdRC](https://github.com/Sunbird-RC/sunbird-rc-core) KBI, and a mock backend for development/testing.
* **Embedded key manager:** On every startup the keymanager idempotently provisions a full key hierarchy: a `ROOT` CA; `OIDC_SERVICE` component master key (`RSA_2048`), EC signing key (`EC_SECP256R1_SIGN`), and cache encryption key (`CACHE_ENCRYPT`); and `OIDC_PARTNER` component master key (`RSA_2048`). `KEYMANAGER_KEYSTORE_TYPE` selects the PKCS#11 (HSM) or PKCS#12 (file) backend at runtime.
* **User centricity:** Single identity credential access across services, mandatory user consent, and multiple authentication methods.
* **Flexible CAPTCHA support:** [Google reCAPTCHA](https://www.google.com/recaptcha/), [Cloudflare Turnstile](https://www.cloudflare.com/products/turnstile/), and [hCaptcha](https://www.hcaptcha.com/) are all supported.

Refer [here](../readme/features.md) to know more about features of eSignet.

</details>

<details>

<summary><strong>What standards does eSignet follows?</strong></summary>

eSignet implements the following standards:

* [**OAuth 2.1**](https://oauth.net/2.1/) and [**OpenID Connect Core 1.0**](https://openid.net/specs/openid-connect-core-1_0.html)
* [**FAPI 2.0**](https://openid.net/specs/fapi-security-profile-2_0.html) (Financial-grade API Security Profile)
* [**RFC 9126**](https://www.rfc-editor.org/rfc/rfc9126) — Pushed Authorization Requests (PAR)
* [**RFC 9449**](https://www.rfc-editor.org/rfc/rfc9449) — DPoP (Demonstrating Proof of Possession)
* [**Secure Biometric Interface (SBI)**](https://standards.ieee.org/ieee/3167/10925/) for biometric device compatibility
* [**JWE**](https://www.rfc-editor.org/rfc/rfc7516) **/** [**JWS**](https://www.rfc-editor.org/rfc/rfc7515) (RFC 7516, 7515) for encrypted and signed token responses
* To know more about eSignet standards, please refer [here](../readme/standards.md).

</details>

<details>

<summary><strong>How many types of authentication methods does eSignet support today</strong>?</summary>

The types of authentication methods supported by eSignet are [available here](../readme/features.md).

</details>

## Partner Integrations

<details>

<summary><strong>Can you provide examples of successful integrations with potential partners?</strong></summary>

eSignet will be deployed across various platforms, focusing on secure authentication. The solution actively explores integration opportunities with new partners and countries, with proof of concept (POC) completed in multiple countries. Below are some examples of eSignet integrations:

* **Health Management**: The POC for eSignet integration with the Health Management portal is complete, enabling OTP and biometric-based authentication for seamless access to health services, with user verification against migrated ID data.
* **SuperApp Integration:** eSignet will be integrated into a multi-service SuperApp for basic registration, login, and enhanced eKYC. Development is underway, and completion is expected soon.
* **Insurance Portal**: Integration of eSignet with a health insurance portal is underway, using migrated ID data for secure authentication and quick access to insurance services.
* **University Authentication**: eSignet is being implemented for face authentication of students and staff, verified against university ID data for access to services like exams, hostel assignments, and meal identification.
* **Government and Private Services**: A brownfield implementation of MOSIP is in progress, with eSignet integration planned to authenticate users with National ID data across government and private services.
* **Self-Service Portal for Benefits Delivery**: The POC for eSignet integration with OpenG2P is complete, allowing residents to authenticate via National ID data and register for Benefits Delivery.

</details>

<details>

<summary><strong>What is ThunderID and how does it relate to eSignet?</strong></summary>

[ThunderID](https://github.com/thunder-id/thunderid) is an open-source Go-based OAuth 2.1 / OpenID Connect engine that eSignet embeds as a Go module dependency. It handles all protocol endpoints (authorize, token, JWKS, discovery, introspect, userinfo, PAR, DPoP, etc.) and the flow execution engine.

eSignet acts as a MOSIP-specific embedder: it injects MOSIP-aware providers (identity authentication, key management, consent storage, client registry) into the ThunderID engine via functional options, and registers its own client management API on top. This means eSignet benefits from ThunderID's protocol correctness and standards coverage while retaining full control over identity verification logic.

</details>

<details>

<summary><strong>Does eSignet support FAPI 2.0?</strong></summary>

Yes. The Go implementation supports the [FAPI 2.0 Security Profile](https://openid.net/specs/fapi-security-profile-2_0.html). FAPI 2.0 requirements are enforced per-client via the `additionalConfig` object in the `POST /client-mgmt/client` registration payload:

```
{
  "additionalConfig": {
    "require_pushed_authorization_requests": true,
    "dpop_bound_access_tokens": true,
    "require_pkce": true
  }
}
```

* `require_pushed_authorization_requests: true` — forces the client to POST authorization parameters to `POST /oauth2/par` first and use the returned `request_uri` in the subsequent `GET /oauth2/authorize` redirect.
* `dpop_bound_access_tokens: true` — rejects any token request from this client that does not include a valid `DPoP` proof header.
* `clientAuthMethods: ["private_key_jwt"]` — the client authenticates at the token endpoint using a signed JWT rather than a shared secret.

Refer to the [Postman collection](https://github.com/mosip/esignet/tree/master/postman-collection) (folder "FAPI 2.0") in the repository for a working example.

</details>

<details>

<summary><strong>Does eSignet support JWE-encrypted token responses?</strong></summary>

Yes. Per-client JWE ([RFC 7516](https://www.rfc-editor.org/rfc/rfc7516)) encryption is configured in two steps:

1.  **Set the response type** in the `additionalConfig` object when registering via `POST /client-mgmt/client`:

    ```
    {
      "additionalConfig": {
        "userinfo_response_type": "JWE",
        "id_token_response_type": "JWE"
      }
    }
    ```
2. **Register the encryption public key** via `PATCH /client-mgmt/client/{client_id}` using the `encPublicKey` field. Both RSA (`RSA-OAEP-256`, `RSA-OAEP`) and EC (`ECDH-ES`, `ECDH-ES+A128KW`, etc.) keys are supported. Setting `encPublicKey` to `null` clears the key. The signing public key (`publicKey`) set at registration cannot be changed; if it is compromised, create a new client.

When JWE is active, the RP must possess the corresponding private key to decrypt the `id_token` and userinfo response.

</details>

## Architecture

<details>

<summary><strong>How is the Go-based eSignet structured?</strong></summary>

For a detailed breakdown of the project structure, refer to the [esignet-service README](https://github.com/Infosys/esignet/blob/master/esignet-service/README.md).

The [ThunderID](https://github.com/thunder-id/thunderid) engine is embedded as a Go module; `main.go` calls `thunderidengine.New(mux, ...options)` and all standard protocol endpoints are registered automatically.

</details>

<details>

<summary><strong>What changed from the Java version to the Go version?</strong></summary>

| Dimension           | Java eSignet                             | Go eSignet                                                               |
| ------------------- | ---------------------------------------- | ------------------------------------------------------------------------ |
| Language / runtime  | Java 11 / Spring Boot                    | Go 1.26, single binary                                                   |
| Protocol logic      | Internal Java services                   | Delegated to [ThunderID](https://github.com/thunder-id/thunderid) engine |
| Key management      | MOSIP keymanager (Java microservice)     | Embedded Go keymanager (`KEYMANAGER_*` env vars)                         |
| Configuration       | `application.properties` / Spring Config | `data/deployment.yaml` + environment variables                           |
| Authentication flow | Hard-coded Java controllers              | Declarative YAML flow graphs                                             |
| Database access     | Spring Data JPA / Hibernate              | Raw SQL via `pgx/v5` + `sqlc`                                            |
| Metrics             | Spring Actuator / Micrometer             | [Prometheus](https://prometheus.io/) endpoint                            |
| Transaction store   | Redis or in-memory                       | Redis or in-memory                                                       |

</details>

<details>

<summary><strong>How does key management work in the Go version?</strong></summary>

The Go version ships an **embedded Go keymanager** — no separate Java microservice is required. It is configured exclusively via `KEYMANAGER_*` environment variables and automatically provisions a two-level key hierarchy on first startup:

* `OIDC_SERVICE` — the signing key for ID tokens and JWKS
* `OIDC_PARTNER` — per-partner signing/encryption keys

Two backends are supported, selected at runtime via `KEYMANAGER_KEYSTORE_TYPE`:

* **PKCS#11** (production builds with CGO enabled): uses a hardware HSM or [SoftHSM2](https://www.opendnssec.org/softhsm/). Requires a CGO-enabled binary and the PKCS#11 shared library.
* **PKCS#12** (default dev builds, CGO disabled): keys are stored in an encrypted `.p12` file on disk. No native dependencies required.

Certificate upload/download is available at `/system-info/certificate` and `/system-info/uploadCertificate`.

</details>

<details>

<summary><strong>How are authentication flows defined in the Go version?</strong></summary>

Authentication logic is expressed as declarative YAML flow graphs stored in `data/flows/`. The main flow file is `flow-esignet.yaml`. Each flow is a directed graph of named nodes; each node calls a registered executor.

eSignet registers two custom executors in addition to the 30+ built-in [ThunderID](https://github.com/thunder-id/thunderid) executors:

| Executor              | Purpose                                                              |
| --------------------- | -------------------------------------------------------------------- |
| `eSignetOtpExecutor`  | Dispatches OTP via the selected IDA backend (MOSIP, SunbirdRC, mock) |
| `ClearInputsExecutor` | Clears sensitive user inputs between authentication retries          |

The YAML flow supports branching (OTP, password, biometric, KBI sub-flows), looping (re-prompting on failed consent), and convergence before the final authorization assertion.

</details>

## Configuration and Setup

<details>

<summary><strong>Which version of eSignet can be used?</strong></summary>

Always use the latest GA (Generally Available) release of eSignet for the best security, features, and performance. Refer to the [GitHub releases page](https://github.com/mosip/esignet/releases) for the latest versioned release. If you are an existing eSignet user, use the upgrade scripts provided in the repository to migrate to a newer version.

</details>

<details>

<summary><strong>How do I migrate from eSignet 1.8.0 java version to eSignet Go version?</strong></summary>

Upgrading eSignet from Java to Go is a seamless process, involving a few configuration changes and a database upgrade. See the [Upgrade Handbook: Java to Go](https://github.com/mosip/esignet/blob/master/docs/upgrade-1.8.0-to-2.0.0.md) for the full steps.

</details>

<details>

<summary><strong>Where can I access the source code?</strong></summary>

You can access the source code from the [eSignet GitHub repository](https://github.com/mosip/esignet). The `esignet-service/` directory contains the Go backend; `oidc-ui/` contains the React frontend.

</details>

<details>

<summary><strong>Is there documentation available for setting up eSignet locally?</strong></summary>

Yes. A `docker-compose/` directory is provided with a `docker-compose.yaml` that spins up PostgreSQL and Redis. Refer to the [README](https://github.com/mosip/esignet/blob/master/docker-compose/README.md) at the repository root for step-by-step local setup instructions.

</details>

<details>

<summary><strong>How is eSignet configured in the Go version?</strong></summary>

Runtime configuration spans several sources:

* **`esignet-service/data/deployment.yaml`** — core server, database, Redis, OAuth, and issuer settings. Environment variables are expanded inline using `${ENV_VAR_NAME}` syntax.
* **`data/flows/*.yaml`** — declarative authentication flow graphs (e.g. `flow-esignet.yaml`), which define login logic and executor sequences.
* **`KEYMANAGER_*` environment variables** — keystore backend selection (`KEYMANAGER_KEYSTORE_TYPE`), PKCS#11 module path/PIN, or PKCS#12 file path/password.
* **CAPTCHA variables** (e.g. `MOSIP_ESIGNET_CAPTCHA_VALIDATOR_URL`) — endpoint and credentials for server-side CAPTCHA token validation.
* **`oidc-ui` configuration** — frontend environment variables with the `VITE_` prefix, set during the `oidc-ui` build or via its deployment configuration.

Key sections in `deployment.yaml` include:

```
server:
  port: 8088

issuer: "https://esignet.example.org"

oauth:
  token:
    accessTokenExpiry: 3600
    idTokenExpiry: 3600
    refreshTokenExpiry: 86400

db:
  host: "${DB_HOST}"
  port: "${DB_PORT}"
  name: "${DB_NAME}"
  username: "${DB_USERNAME}"
  password: "${DB_PASSWORD}"

redis:
  host: "${REDIS_HOST}"
  port: "${REDIS_PORT}"
```

Environment variable overrides apply only to values declared with `${ENV_VAR_NAME}` placeholders in the YAML (e.g. `host: "${REDIS_HOST}"`). Literal values such as `server.port`, `issuer`, and token expiries must be changed directly in the YAML file or via a Helm values override.

</details>

<details>

<summary><strong>How is a relying party onboarded to eSignet - integrated with MOSIP</strong></summary>

Relying parties are considered Auth partners in MOSIP and must complete [authentication partner onboarding](https://docs.mosip.io/1.2.0/id-lifecycle-management/support-systems/partner-management-services/functional-overview/end-user-guide) before registering a client:

* **Self-service onboarding:** Partners self-register on the [MOSIP PMS portal](https://docs.mosip.io/1.2.0/id-lifecycle-management/support-systems/partner-management-services/functional-overview/collab-pmp-guide).
* **Onboarder script:** Partners are provisioned using the [partner-onboarder](https://github.com/mosip/esignet/tree/develop-go/partner-onboarder) script bundled in the repository.
* **Assisted Onboarding** Alternatively, partners can also initiate the onboarding process by filling out the form [here](https://docs.google.com/forms/d/e/1FAIpQLSerko7k1wiy1sjgfRSfRU5Bjkb7cKc0t2z0FmKt6mSLBqJGXQ/viewform). Once submitted, partners will receive their credentials via email shortly.

When onboarding through MOSIP PMS, PMS invokes the `/client-mgmt/client` endpoint directly as part of the partner and policy configuration — partners do not call it themselves. In standalone (non-MOSIP) deployments, the client is registered by calling the `/client-mgmt/client` API (or the profile-specific `/client-mgmt/oidc-client` for backward compatibility) with a bearer token scoped to `client_mgmt_write`.

</details>

<details>

<summary><strong>How to configure password authentication in eSignet?</strong></summary>

Two conditions must be satisfied:

1. **Register the password ACR on the client:** include the ACR value `mosip:idp:acr:password` in the `authContextRefs` array when creating or updating a client via the `/client-mgmt/client` API.
2. **The integrated ID system must support password-based authentication:** the configured identity backend (MOSIP IDA, SunbirdRC, or mock) must be able to verify the resident's password credential.

No separate ACR-AMR mapping file is required — the mapping is handled within the YAML flow graph (`flow-esignet.yaml`). Refer to the [eSignet API documentation](../develop/api.md) for the full client registration payload schema.

</details>

<details>

<summary><strong>How to add a new language in eSignet?</strong></summary>

Localization strings live in the eSignet service data directory at [`esignet-service/data/i18n/`](https://github.com/mosip/esignet/tree/develop-go/esignet-service/data/i18n), with one YAML file per language named using its [ISO 639-1](https://www.iso.org/iso-639-language-codes.html) code (e.g. `en.yaml`, `fr.yaml`). The service auto-discovers the available languages by scanning this folder, so there is no separate registration file. To add a new language:

1. Go to `esignet-service/data/i18n/` (the folder resolved from `DATA_DIR`).
2. Copy `en.yaml` and rename it with the ISO 639-1 language code (e.g. `fr.yaml` for French).
3. Translate the values in the new file, keeping the top-level namespace keys unchanged.
4. Restart or redeploy the eSignet service so the new file is picked up. Requests then resolve via BCP47 matching (for example, `fr-FR` falls back to `fr`), with `en` as the final fallback.

</details>

<details>

<summary><strong>How to remove a language from the eSignet default setup?</strong></summary>

1. Delete the language's YAML file (e.g. `fr.yaml`) from [`esignet-service/data/i18n/`](https://github.com/mosip/esignet/tree/develop-go/esignet-service/data/i18n).
2. Restart or redeploy the eSignet service so the language is no longer listed.

</details>

<details>

<summary><strong>How to configure the expected quality score, timeouts, and number of biometric attributes to be captured in eSignet?</strong></summary>

These SBI capture parameters are passed to the [`@mosip/secure-biometric-interface-integrator`](https://www.npmjs.com/package/@mosip/secure-biometric-interface-integrator) widget by the `oidc-ui` React app. They are currently defined as the `DEFAULT_SBI_ENV` defaults in [`oidc-ui/src/components/SbiComponent/SbiComponent.tsx`](https://github.com/mosip/esignet/blob/develop-go/oidc-ui/src/components/SbiComponent/SbiComponent.tsx) and are **not** overridable via environment variables:

```
const DEFAULT_SBI_ENV = {
  env: "Staging",
  captureTimeout: 30,
  faceCaptureCount: 1,
  faceCaptureScore: 80,
  fingerCaptureCount: 1,
  fingerCaptureScore: 80,
  irisCaptureCount: 1,
  irisCaptureScore: 80,
  portRange: "4501-4600",
  discTimeout: 15,
  dinfoTimeout: 30,
  // ...
};
```

To change the quality-score thresholds (0–100), capture counts, or timeouts (in seconds), edit this object and rebuild/redeploy the `oidc-ui` container.

</details>

<details>

<summary><strong>How to enable or disable the captcha in eSignet UI?</strong></summary>

CAPTCHA is wired into the authentication flow, not `deployment.yaml`. The `captcha` block lives in the flow definition [`esignet-service/data/flows/flow-esignet.yaml`](https://github.com/mosip/esignet/blob/develop-go/esignet-service/data/flows/flow-esignet.yaml), and its values are supplied through environment variables (see [`.env.example`](https://github.com/mosip/esignet/blob/develop-go/esignet-service/.env.example)):

```
# Provider shown by the UI and its public site key
MOSIP_ESIGNET_CAPTCHA_SITE_PROVIDER=hcaptcha   # e.g. recaptcha | turnstile | hcaptcha
MOSIP_ESIGNET_CAPTCHA_SITE_KEY=<public-site-key>

# Server-side token validation (skipped when the URL is unset)
MOSIP_ESIGNET_CAPTCHA_VALIDATOR_URL=https://<captcha-service-host>/v1/captcha/validatecaptcha
# Use http:// only for isolated local development (no outbound HTTPS available)
MOSIP_ESIGNET_CAPTCHA_MODULE_NAME=esignet
MOSIP_ESIGNET_CAPTCHA_TIMEOUT_SECS=10
```

To disable CAPTCHA entirely, remove the `CAPTCHA_BOX` node reference from the relevant steps in `flow-esignet.yaml`. Do **not** leave `MOSIP_ESIGNET_CAPTCHA_VALIDATOR_URL` unset in production — omitting it causes CAPTCHA tokens to be accepted without server-side verification, which defeats bot protection. Leaving the URL unset is only acceptable for isolated local development where no CAPTCHA service is reachable. The providers selectable via `MOSIP_ESIGNET_CAPTCHA_SITE_PROVIDER` are:

* **`recaptcha`** — [Google reCAPTCHA](https://www.google.com/recaptcha/)
* **`turnstile`** — [Cloudflare Turnstile](https://www.cloudflare.com/products/turnstile/)
* **`hcaptcha`** — [hCaptcha](https://www.hcaptcha.com/)

</details>

<details>

<summary><strong>How to configure Redis for OIDC transaction storage?</strong></summary>

[Redis](https://redis.io/) is used as the shared OIDC transaction and flow state store and is required for multi-instance deployments. Configure it in `deployment.yaml`:

```
redis:
  host: "${REDIS_HOST}"
  port: "${REDIS_PORT}"
  password: "${REDIS_PASSWORD}"
  db: 0
  tls: true   # set to false only for isolated local development; always true for production
```

Redis is selected by setting `MOSIP_ESIGNET_CACHE_TYPE=redis`. For single-instance development setups, use the in-memory runtime store instead by setting `MOSIP_ESIGNET_CACHE_TYPE=inmemory` (any value other than `redis` selects the in-memory store). This is not suitable for production as state is lost on restart.

</details>

<details>

<summary><strong>How to configure PKCS#11 / HSM key storage?</strong></summary>

Keystore selection is a **runtime** setting driven by `KEYMANAGER_*` environment variables (read by the keymanager at startup), not a `deployment.yaml` block. The PKCS#11 backend additionally requires a CGO-enabled binary, since it links a native PKCS#11 module.

To use a hardware HSM or [SoftHSM2](https://www.opendnssec.org/softhsm/) in production, build with CGO enabled (see `make.sh`) and set:

```
# PKCS#11 requires a CGO_ENABLED=1 build
KEYMANAGER_KEYSTORE_TYPE=PKCS11
KEYMANAGER_PKCS11_MODULE_PATH=/usr/lib/softhsm/libsofthsm2.so
KEYMANAGER_PKCS11_TOKEN_LABEL=esignet
KEYMANAGER_PKCS11_SLOT_ID=<slot-id>
KEYMANAGER_PKCS11_PIN=${HSM_PIN}
```

For development without an HSM, use the file-based PKCS#12 backend (the only backend available in the default `CGO_ENABLED=0` build):

```
KEYMANAGER_KEYSTORE_TYPE=PKCS12
KEYMANAGER_PKCS12_FILE_PATH=/opt/mosip/keystore.p12
KEYMANAGER_PKCS12_PASSWORD=${KEYSTORE_PASSWORD}
KEYMANAGER_PKCS12_ALLOW_INSECURE_SOFTWARE_KEYSTORE=true
```

On first startup, the two-level key hierarchy (`OIDC_SERVICE`, `OIDC_PARTNER`) is provisioned automatically.

</details>

<details>

<summary><strong>How to register or create a client ID in eSignet?</strong></summary>

In order to utilize eSignet for authenticating users and obtaining their information, relying parties are required to:

1. Register as a client in the eSignet system using one of the client management endpoints below. All endpoints require a bearer token (`Authorization: Bearer <token>`) carrying the appropriate scope.
2. Integrate with eSignet APIs, following the guidelines provided by [OpenID Connect](https://openid.net/specs/openid-connect-core-1_0.html), on their web or mobile applications.

The Go implementation exposes three registration profiles:

| Method  | Endpoint                                | Profile                                        | Scope required      |
| ------- | --------------------------------------- | ---------------------------------------------- | ------------------- |
| `POST`  | `/client-mgmt/client`                   | Generic — **recommended for new integrations** | `client_mgmt_write` |
| `PUT`   | `/client-mgmt/client/{client_id}`       | Generic — full update                          | `client_mgmt_write` |
| `PATCH` | `/client-mgmt/client/{client_id}`       | Generic — partial update                       | `client_mgmt_write` |
| `GET`   | `/client-mgmt/client/{client_id}`       | Generic — fetch                                | `client_mgmt_read`  |
| `POST`  | `/client-mgmt/oidc-client`              | OIDC profile (legacy compat)                   | `client_mgmt_write` |
| `PUT`   | `/client-mgmt/oidc-client/{client_id}`  | OIDC profile — full update                     | `client_mgmt_write` |
| `POST`  | `/client-mgmt/oauth-client`             | OAuth profile                                  | `client_mgmt_write` |
| `PUT`   | `/client-mgmt/oauth-client/{client_id}` | OAuth profile — full update                    | `client_mgmt_write` |

Use `/client-mgmt/client` for all new integrations. The `/client-mgmt/oidc-client` endpoint is retained for backward compatibility with existing Java-era integrations. Refer to the [API documentation](../develop/api.md) for the full registration payload schema.

For MOSIP-integrated environments, relying parties are Auth partners and must complete partner onboarding on the MOSIP PMS portal before calling the client management API. Refer the [guide here](https://docs.mosip.io/1.2.0/id-lifecycle-management/support-systems/partner-management-services/functional-overview/end-user-guide) for auth partner oanboarding steps.

</details>

<details>

<summary><strong>How to configure Knowledge-Based Identification (KBI) with SunbirdRC?</strong></summary>

The [SunbirdRC](https://github.com/Sunbird-RC/sunbird-rc-core) KBI authenticator (`internal/engine/sunbird/`) identifies users by matching fields from the KBI form against records in a SunbirdRC registry. The fields displayed in the KBI form are driven by the registry schema. If more than one registry entry matches the provided details, authentication is denied.

Configure the SunbirdRC backend through [environment variables](https://github.com/mosip/esignet/blob/develop-go/esignet-service/.env.example).\
\
The current compatible Sunbird RC version is v2.0.0-rc3.

</details>

<details>

<summary><strong>Where can I find Prometheus metrics for eSignet?</strong></summary>

The Go binary exposes a [Prometheus](https://prometheus.io/)-compatible metrics endpoint on a **separate private listener** — not the main application port and not routed through the public gateway/ingress. It is only reachable within the cluster (for example, by Prometheus). The listener defaults to port `9090` and is configurable via the `METRICS_PORT` environment variable (or `metrics_port` in `deployment.yaml`):

```
GET http://<host>:9090/metrics
```

Key metrics include active OIDC transactions, token issuance counts, authentication attempt counts by method and outcome, and key manager operation latencies. Configure scraping in your Prometheus `prometheus.yml` or via a Kubernetes `ServiceMonitor`. For a reference Kubernetes setup, see the [Helm charts](https://github.com/mosip/esignet/tree/develop-go/helm) in the repository.

</details>
