---
description: Connecting secure components for seamless identity verification.
---

# eSignet Building Blocks

esignet-service is composed of a small composition root, the external ThunderID engine it plugs into, and a set of MOSIP-specific modules underneath. The diagram below is the map — each piece is explained briefly underneath it, with a link through to the full detail in the [Architecture Deep Dive](https://claude.ai/cowork/architecture-deep-dive.md) for anything you need to go deeper on.

<figure><img src="../../.gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>

### cmd/esignet (Composition Root)

`main.go` is where everything gets wired together at startup: it opens the Postgres and Redis connections, builds the client-management HTTP handler, and passes roughly twenty functional options into the ThunderID engine to plug in every MOSIP-specific piece below. See [esignet-service (Backend)](https://claude.ai/cowork/architecture-deep-dive.md#2-esignet-service-backend) for the full startup sequence.

### ThunderID Engine (External Module)

The generic, external engine esignet-service builds on. It supplies the flow runtime, token issuance, JWKS/JWT handling, consent orchestration, and the OIDC/OAuth HTTP endpoints themselves — the protocol machinery that every MOSIP-specific module below plugs into. See Architecture for how this fits into the bigger picture. Please refer the [Thunder ID](https://thunderid.dev/) to explore it in details.

### internal/engine — MOSIP Provider Implementations

The following six pieces are esignet-service's implementations of the ThunderID engine's provider interfaces — the part of the codebase that's actually MOSIP-specific.

* **actor\_provider** — bridges the engine's generic client concept to eSignet's own OAuth client model. See Client Management.
* **consent\_provider** — bridges the engine's authorization flow to eSignet's consent records, deciding when a user needs to be re-prompted for consent. See Consent Management.
* **flow\_provider** — loads and parses the declarative YAML flow definitions (`flow-esignet.yaml`, `otp-flow.yaml`) that drive every login and consent screen. See Authentication Flow Engine.
* **idsystem\_factory** — selects which identity backend — MOSIP IDA, Sunbird RC, or the mock provider — handles authentication at startup, based on a single environment variable. See Pluggable Identity-System Providers.
* **executors** — the custom flow-step logic (like the eSignet OTP executor) invoked as a flow moves from node to node. See Authentication Flow Engine.
* **design / i18n / OU / resource / attestation / captcha providers** — the remaining engine interfaces: screen layout, translations, organizational-unit context, static assets, device attestation, and CAPTCHA validation. See the Module Breakdown table for where each lives in the codebase.

### Domain Services

* **clientmgmt** — registers, updates, and looks up OAuth/OIDC relying-party clients, backed by Postgres. See Client Management for the full endpoint list.
* **consentmgmt** — captures and stores user consent decisions, keeping an append-only audit trail alongside the current decision. See Consent Management.

### Shared Infrastructure

* **security** — enforces JWT scope checks and request-time validation on the client-management API surface, backed by a polling JWKS cache. See Security.
* **httpmiddleware** — applies access logging and correlation IDs to every request that comes through esignet-service.
* **runtimestores** — the shared runtime store (in-memory or Redis) backing the client cache, the flow-definition cache, and the engine's own session and flow state. See Configuration & Runtime Store.
