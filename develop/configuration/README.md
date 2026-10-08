# Configure eSignet

Once an eSignet instance is up and running, tuning its behavior happens across a small, well-defined set of places — environment variables, a service YAML file, declarative UI assets, and per-client fields. All of it is documented directly in the eSignet repository, verified against the actual implementation, rather than duplicated here — configuration changes with the code, and a copy in this doc site would drift out of date. This page gives you the crux of each reference file and points you to the real one.

### Where Configuration Lives

* **Environment variables and `esignet-service/data/deployment.yaml`** — most service-level settings, resolved as `env var > deployment.yaml > compiled-in default`.
* **Declarative UI assets** (`<DATA_DIR>/{flows,layouts,themes,i18n}/*.yaml`) — where ACR and login-ID behavior actually live, since neither is a `deployment.yaml` property.
* **Per-client rows** in the `client_detail` table, set via the `/client-mgmt/*` API — claims, ACR values, redirect URIs, and other per-application settings.
* **`oidc-ui`'s own runtime config** (`window._env_`, `theme/config.json`) — build-time and runtime settings for the login/consent UI itself.

### The Reference Files

#### Configuration: The Full Property Reference

The full list of environment variables and `deployment.yaml` settings for `esignet-service` and `oidc-ui`. Refer to it whenever you need an exact variable name, default value, or precedence rule.

See the full reference here _(Link TBA)_ for every property and detail.

#### ACR: Which Authentication Methods a Client Can Request

Defines the fixed `mosip:idp:acr:*` values a client's `authContextRefs` can request, the ACR-to-AMR mapping advertised in discovery, and how each ACR value maps to an actual login screen (OTP, password, biometrics, KBI) in the flow YAML.

See the full reference here _(Link TBA)_ for every property and detail.

#### Claims: What Personal Data a Client Can Receive

Defines the two-plane claim model — a per-client claims allow-list and a deployment-wide scope-to-claims mapping, with a claim released only if it appears in both — plus how ID token and userinfo delivery (signed vs. encrypted) is configured per client.

See the full reference here _(Link TBA)_ for every property and detail.

#### Login ID: What Identifiers Users Can Log In With

Defines the shipped login-ID types — UIN/VID, mobile number, email, and NRC ID, plus a fifth KBI-only identifier — and each one's validation rule. Configured directly in the flow YAML, not `deployment.yaml`.

See the full reference here _(Link TBA)_ for every property and detail.

