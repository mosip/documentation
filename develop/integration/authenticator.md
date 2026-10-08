# Authn Provider

### What an Authn Provider Does

An Authn Provider is the bridge between eSignet and an identity system. eSignet itself never talks to your identity system directly — it delegates that entirely to the Authn Provider, and limits its own responsibility to the parts that are the same for every deployment: OAuth2/OIDC/FAPI protocol compliance, consent capture and enforcement, and token issuance (ID token, access token) plus JWKS publishing.

The Authn Provider, in turn, is responsible for:

* Authenticating the user against the identity system
* Resolving a stable, provider-specific identifier for the authenticated user
* Fetching verified user attributes (KYC data) for whichever claims the user consented to share
* Returning all of that to eSignet in an agreed structure

Because the boundary between the two is a Go interface rather than a network protocol, the identity system behind an Authn Provider can be anything — a single database table for local testing, or a full national identity registry. eSignet only depends on the interface being implemented correctly, never on how the identity system itself is built. This is what replaces the Java version's separate "Authenticator Plugin" concept — same role in the integration, now expressed as a single Go interface.

### Who Should Implement This

Any organization — public or private — that wants to connect its own identity system to eSignet implements this interface.

### How It Works

The engine makes, at most, four calls into an Authn Provider during a login, always in this order — `SendOTP` only fires for OTP-based factors, and each `Get*` call only fires when the corresponding token from `Authenticate` is non-nil:

```
SendOTP           →  Authenticate        →  GetEntityReference   →  GetAttributes
(send-otp screen)    (kyc-auth: verify      (resolve/cache the      (kyc-exchange: fetch
                      the entered OTP/       "sub" claim for         only the consented
                      password/biometric)    consent + token         claims, after consent)
                                              issuance)
```

`Authenticate` can return either an opaque token (for `GetEntityReference` or `GetAttributes` to resolve later) or the resolved value directly — if you return the value directly, the engine skips the corresponding `Get*` call entirely.

_TBA - Sequence Diagram_

### The Interface

A provider is a Go package implementing `shared.ConsolidatedAuthnProvider`, which embeds the engine-level `providers.AuthnProviderInterface` and adds two eSignet-specific methods:

```go
type ConsolidatedAuthnProvider interface {
    providers.AuthnProviderInterface

    SendOTP(ctx context.Context, identifiers map[string]interface{},
        metadata *providers.AuthnMetadata) (*SendOTPResult, *common.ServiceError)

    GetSigningCertificates(ctx context.Context) ([]CertificateData, *common.ServiceError)
}
```

Including the embedded interface, a full implementation has eight methods in total. Three of them (`InitiateAuthentication`, `InitiateEnrollment`, `Enroll`) exist only for the engine's built-in passkey/WebAuthn executor, which none of eSignet's shipped flows currently use — you can safely stub these out unless you add a flow that exercises that path. The full method signatures, supporting types, and error-handling conventions are in the deep dive.

### A Reference Implementation

* **Mock** — talks to a mock identity system over HTTP; supports OTP, password, PIN, biometrics, and arbitrary KBI, with no cryptographic envelope on the payload. It's what Quickstart's Local Setup runs against, so it's the easiest place to see a real, working Authn Provider without standing up a production identity system. `internal/engine/mock`
* **MOSIP IDA** and **SunbirdRC** — the other two reference implementations, adding request encryption/signing and registry-search behavior respectively. Full detail in the deep dive. `internal/engine/mosip` · `internal/engine/sunbird`

### How to Register a New Provider

Providers are compiled into the binary at build time — there's no dynamic loading, no `.so` files, no registry. To add one:

1. Create a new package under `esignet-service/internal/engine/<yourprovider>/`, following the existing file layout (`authenticator.go`, `config.go`, `init.go`, `model.go`).
2. Implement `shared.ConsolidatedAuthnProvider` on a type in `authenticator.go`.
3. Add an `Init(...)` function that also returns an audit sink — your own, or `shared.NewNoopAuditor()` if you don't have one (see [Audit Plugin](audit.md)).
4. Add a `case "<yourprovider>":` branch to the provider factory's switch statement.
5. Rebuild.

Which provider actually runs at startup is chosen by the `MOSIP_ESIGNET_AUTHN_PROVIDER` environment variable (default `mock`).

### Further Details

The Authn Provider Deep Dive _(Link TBA)_ has the full interface and supporting-type definitions, the error-handling conventions, the exact `identifiers`/`credentials` field split per auth factor, configuration conventions, and the full reference-implementation comparison table for Mock, MOSIP IDA, and SunbirdRC.
