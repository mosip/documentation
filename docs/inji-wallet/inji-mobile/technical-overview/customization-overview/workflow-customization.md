# Workflow Customization

## Overview

Every user journey in **Inji Wallet** (release **1.x**) — onboarding, downloading a credential, sharing it online or offline, backing it up, logging in with a QR code — is modelled as a **finite-state machine (FSM)**. Modelling flows as state machines keeps the behaviour explicit and predictable: at any point in time the app is in exactly one well-defined state, and it can only move to another state in response to a known event.

The state machines are written with [**XState v4**](https://xstate.js.org/docs/) (`xstate@^4.35.0`) and live in the [`machines/`](https://github.com/mosip/inji-wallet/tree/master/machines) folder of the Inji Wallet codebase. A few very screen-specific machines live under `screens/`, but the reusable, customizable workflow logic is concentrated in `machines/`.

Implementers can reuse the existing machines as-is, extend them (add states, actions, guards, or services), or replace a whole flow with their own machine — this page explains how the machines are structured and wired together so you can do that confidently.

{% hint style="info" %}
XState is a data structure + interpreter. Editing a machine is mostly editing a plain JavaScript object (the state chart) plus its associated `actions`, `guards`, and `services`. You rarely need to touch the React screens to change a workflow — you change the machine that drives them.
{% endhint %}

## How the machines are wired together

Inji Wallet uses a **multi-actor** architecture. A root machine boots the app and **spawns** long-lived child machines ("service actors"). These references are kept in a shared context object (`AppServices`, exposed through `shared/GlobalContext`) so any part of the app can `send` events to any machine.

```
app.ts (root)
  │
  ├── store            → machines/store.ts               (spawned first — storage/crypto gateway)
  │
  └── on READY, spawns the service actors ──────────────────────────────
        ├── auth             → machines/auth.ts
        ├── vcMeta           → machines/VerifiableCredential/VCMetaMachine
        │     └── spawns one vcItem per credential → VCItemMachine
        ├── settings         → machines/settings.ts
        ├── activityLog      → machines/activityLog.ts
        ├── backup           → machines/backupAndRestore/backup
        ├── backupRestore    → machines/backupAndRestore/restore
        ├── scan             → machines/bleShare/scan          (offline share – sender)
        └── request          → machines/bleShare/request       (Android only – offline receive)
```

Machines that are spawned **on demand** (not at boot) include:

* `IssuersMachine` — the OpenID4VCI download journey, driven from the Issuers/Home screen.
* `openID4VPMachine` — online sharing (OpenID4VP), spawned by `IssuersMachine`/sharing flows.
* `QrLoginMachine` — "Login with QR code" (OpenID Connect), spawned from the scanner.
* `faceScanner`, `pinInput`, `biometrics` — utility machines used inside other flows.

### The factory-and-spawn pattern

Every service machine exports a **factory function** `createXMachine(serviceRefs)` alongside the machine instance. `app.ts` calls the factory with the current `serviceRefs` and `spawn`s it, so the child machine can reach its siblings:

```ts
// machines/app.ts (excerpt)
serviceRefs.vcMeta = spawn(
  createVcMetaMachine(serviceRefs),
  vcMetaMachine.id,
);
```

### How machines talk to each other

* **Parent → child:** `send(EVENT, { to: context.serviceRefs.<name> })`.
* **Child → parent:** `sendParent(EVENT)`.
* **App-wide broadcasts:** `app.ts` forwards lifecycle changes (focus/blur, online/offline) to every service actor by re-emitting the event with an `APP_` prefix (see the `forwardToServices` action). So a child machine can react to `APP_ONLINE`, `APP_OFFLINE`, `APP_ACTIVE`, etc.
* **Storage:** no machine touches the disk directly. They all send `StoreEvents.GET/SET/…` to the `store` actor, which centralises encryption/decryption and persistence.

## Anatomy of a machine (the file convention)

Simple machines are a single file (e.g. `auth.ts`, `settings.ts`). The larger flows follow a **modular convention** — one folder per feature, with responsibilities split across files. Taking `machines/Issuers/` as the reference:

| File | Responsibility |
| --- | --- |
| `IssuersModel.ts` | Declares the machine **context** (data) and the **events** it accepts, using `createModel(...)`. This is the type-safe contract for the machine. |
| `IssuersMachine.ts` | The **state chart** — states, transitions, `initial` state, invoked services. Wires in the actions/guards/services below. |
| `IssuersActions.ts` | Pure `assign`/side-effect **actions** that mutate context or fire effects. |
| `IssuersGuards.ts` | **Guard** (condition) functions used in `cond:` to choose between transitions. |
| `IssuersService.ts` | **Services** — the async work (API calls, crypto, SDK calls) invoked by states. |
| `IssuersSelectors.ts` | **Selectors** — read helpers that components use to derive UI state from the machine. |
| `IssuersEvents.ts` | Shared event creators (when events are reused across files). |
| `*.typegen.ts` | **Auto-generated** type-safety helpers for XState. Do not edit by hand — they are regenerated for you (see _Keep typegen in sync_ under [How to customize a workflow](#how-to-customize-a-workflow)). |

The single-file machines (`auth.ts`, `store.ts`, `settings.ts`, …) keep the same building blocks (`model`, `states`, `actions`, `guards`, `services`) inline within one file.

{% hint style="info" %}
Many machine files begin with an `@xstate-layout` comment. That hash is used by the [Stately](https://stately.ai/) / [XState VS Code](https://marketplace.visualstudio.com/items?itemName=statelyai.stately-vscode) visual editor to render and round-trip the chart. You can paste a machine into the [XState Visualizer](https://stately.ai/viz) to see and edit the flow graphically.
{% endhint %}

## Machine reference

The machines are grouped below by the capability they power. Each entry describes what the machine is responsible for and the concrete flows it drives.

## Bootstrap & core

### app.ts

The **root** machine. On start it first spawns `store`, checks/generates cryptographic key pairs, fetches remote configuration (cache TTL and other properties via Mimoto's `allProperties` API), loads the credential-registry and eSignet host from storage, and only then spawns the remaining service actors and moves to the `ready` (parallel) state. In `ready` it continuously tracks **app focus** and **network** status and broadcasts them to all children. It also handles deep links for QR login, OpenID4VP, and credential offers.

**Flows covered:**

* Cold-start boot sequence: storage → key pairs → config → service actors → `ready`.
* App lifecycle broadcasting (focus/blur, online/offline) to every child machine.
* Deep-link routing for QR login, OpenID4VP requests, and credential offers.

### store.ts

The single gateway for all persistence. It exposes `GET`/`SET`/`APPEND`/`REMOVE`/`CLEAR` style events to the rest of the app and performs the **encryption/decryption** for data at rest. It abstracts the underlying storage engines:

* [`react-native-mmkv-storage`](https://github.com/ammarahm-ed/react-native-mmkv-storage) — stores metadata and references to encrypted VCs.
* [`react-native-fs`](https://www.npmjs.com/package/react-native-fs) — stores each encrypted VC as a separate file.

Key material is held in the hardware-backed keystore (see [Secure Keystore](../integration-guide/secure-keystore.md)).

### auth.ts

Sets up and enforces app-level authentication. On first launch — after language selection and the intro sliders — the user chooses an unlock method (passcode or biometric). Reaching the Home screen marks the app **authorized**; logging out from Settings marks it **unauthorized**.

### settings.ts

Backs the Settings screen and its interactions: language switching, toggling biometric unlock, changing the credential-registry / eSignet host, viewing received cards, etc.

### activityLog.ts

Maintains the audit trail shown on the History screen — VC downloaded, VC received, VC shared, and similar events.

### biometrics.ts

Handles enabling/disabling biometric unlock from Settings and performing the biometric unlock itself.

### pinInput.ts

A small utility machine that drives PIN/OTP entry wherever it is needed in the app.

## Credential issuance — OpenID4VCI

### Issuers/IssuersMachine.ts

Owns the **entire OpenID4VCI download journey**. It calls Mimoto's `/issuers` and `/issuers/{id}` endpoints to list issuers and cache their configuration, then, for the selected issuer, it:

* performs OIDC authorization (authorization-code and pre-authorized/credential-offer flows, including transaction-code / `tx_code` prompts),
* generates the key pair and builds the proof JWT for the credential request,
* downloads the credential via the [VCI-Client SDK](../integration-guide/vci-client.md),
* verifies the credential, and
* hands it to `vcMeta`/`store` to be persisted.

It also handles **credential offers received via deep link** and reacts to network changes. This is the primary machine to extend when adding a new issuance capability. See also the [Credential Provider](credential_providers.md) customization.

**Flows covered:**

* Authorization-code flow — user authenticates with the issuer/eSignet, then the credential is requested and downloaded.
* Pre-authorized / credential-offer flow — including `tx_code` (transaction code) prompts and consent screens.
* Credential offer opened via deep link, guarded so it is only accepted when the machine is in a safe state.

## Credential lifecycle

### VerifiableCredential/VCMetaMachine

Manages the **metadata for all credentials** — the "My VCs" list on Home and the "Received VCs" list. It tracks download progress/success/failure and, for each stored credential, **spawns a `VCItemMachine`** to manage that credential individually.

**Flows covered:**

* Loading and maintaining the My VCs and Received VCs lists from `store`.
* Tracking in-progress downloads and surfacing download success/failure banners.
* Spawning and tearing down a per-credential `VCItemMachine` as VCs are added/removed.

### VerifiableCredential/VCItemMachine

Spawned **once per credential**, this machine tracks a single VC's lifecycle: loading it from memory or from the server, fetching the issuer `.well-known`, verifying the credential, pinning/unpinning, activating for online login, showing QR/details, and deletion. Any new per-credential feature belongs here. It is a `parallel` machine so utility state (load/refresh) and feature state can progress independently.

**Flows covered:**

* Load a VC from memory, or (re)download and store it from the issuer when missing.
* Verify the credential and refresh the issuer `.well-known` metadata.
* Per-card actions — pin/unpin, view QR/details, and delete.

## Online sharing — OpenID4VP

### openID4VP/openID4VPMachine

Drives **online credential presentation** using OpenID4VP (via the [OpenID4VP SDK](../integration-guide/openid4vp.md)). It receives the authorization request (scanned or via deep link), lets the user select which VC(s) to present, optionally performs **face authentication** (share-with-selfie) through `faceScanner`, constructs and sends the Verifiable Presentation to the verifier, and logs the activity.

**Flows covered:**

* Simple presentation — select VC(s) and share the Verifiable Presentation with the verifier.
* Share-with-selfie — the same flow gated behind a face-authentication consent + capture step.
* Requests arriving from a full scan vs. the Home mini-view vs. an OpenID4VP deep link.

## Offline sharing — BLE (Tuvali)

Offline sharing uses the [Tuvali BLE SDK](../integration-guide/tuvali/) and the [BLE Verifier](../integration-guide/ble-verifier.md) integration.

### bleShare/scan/scanMachine.ts

Instantiated when the user opens the **scanner** to share a credential. It scans the verifier's QR code, discovers and connects to the verifier device over BLE, lets the user pick which downloaded VC(s) to share, optionally runs selfie/face verification, and transmits the credential.

**Flows covered:**

* Scan verifier QR → BLE device discovery → secure connection handshake.
* Select VC(s), optional selfie/face verification, then transmit over BLE.
* Connection/transfer error and retry handling (e.g. Bluetooth off, verifier out of range).

### bleShare/request/requestMachine.ts

The receiving side (spawned on **Android only**). Instantiated when a device acts as a verifier: it displays the QR code, accepts the incoming BLE connection, receives the shared VC, and lets the user view/verify the received credential.

**Flows covered:**

* Generate and display the QR code that a wallet scans to initiate sharing.
* Accept the incoming BLE connection and receive the shared VC.
* Show and verify the received credential, then store it under Received VCs.

## Login with QR — OpenID Connect

### QrLogin/QrLoginMachine.ts

Powers **"Login with QR code"** on portals that support OpenID Connect with Inji Wallet. After scanning the login QR, the user reviews the mandatory claims and selects any voluntary claims, and on successful submission the portal logs the user in and redirects automatically.

**Flows covered:**

* Scan a portal login QR and resolve the requested essential vs. voluntary claims.
* Consent capture — user confirms essential claims and opts into voluntary ones.
* Optional face-verification consent before submitting, then automatic portal redirect on success.

## Face authentication

### faceScanner.ts

Encapsulates the face-capture interaction. It is reused wherever face authentication is required — share-with-selfie (both online OpenID4VP and offline BLE flows). See the [Face Match integration](../integration-guide/face-match.md).

## Backup & Restore

Backup/restore protect the wallet's credentials to the user's own cloud (Google Drive on Android, iCloud on iOS).

### backupAndRestore/backup

Handles backing up the encrypted credentials to cloud storage.

**Flows covered:**

* Trigger a backup (manual or automatic), package the encrypted VCs, and upload to the user's cloud.
* Report progress and last-backup status back to the Settings screen.

### backupAndRestore/restore

Handles fetching, decrypting, and verifying the backed-up credentials during restore.

**Flows covered:**

* Locate and download the latest backup from the user's cloud.
* Decrypt, verify, and re-import the credentials into local storage.

### backupAndRestore/backupAndRestoreSetup

Handles the one-time setup/consent (cloud sign-in, account selection) shared by both the backup and restore flows.

## How to customize a workflow

### 1. Change behaviour inside an existing flow

Most customizations are one of these:

* **Add or change a state / transition** — edit the state chart in the machine file (e.g. `IssuersMachine.ts`). Add the new `states:` node and the `on:` transitions that reach it.
* **Add an action** — add it to the corresponding `*Actions.ts` (or the `actions` block for single-file machines) and reference it by name from the chart.
* **Add a condition** — add a guard to `*Guards.ts` and reference it via `cond:` on a transition.
* **Add async work** — add a service to `*Services.ts` and `invoke:` it from a state.
* **Expose new data to the UI** — add a selector in `*Selectors.ts`; screens read machine state through these selectors, not by reaching into context directly.

### 2. Keep typegen in sync after editing

XState v4 uses `tsTypes` files (`*.typegen.ts`) to give type-safe `actions`, `guards`, and `services`. These files are generated for you — never edit them by hand. Inji Wallet relies on the [Stately / XState VS Code extension](https://marketplace.visualstudio.com/items?itemName=statelyai.stately-vscode), which regenerates the matching `*.typegen.ts` automatically whenever you save a machine that declares `tsTypes: {} as import('./X.typegen').Typegen0`.

After adding or renaming an action, guard, or service, save the file (or run typegen via `@xstate/cli` if you have it installed) so TypeScript stays in sync. If a name in the chart has no counterpart in the generated types, the build will flag it.

### 3. Add a brand-new machine

1. Create the folder/files following the [convention above](#anatomy-of-a-machine-the-file-convention) (`Model`, `Machine`, `Actions`, `Guards`, `Services`, `Selectors`).
2. Export a `createYourMachine(serviceRefs)` factory if the machine needs to talk to siblings.
3. If it should live for the whole session, `spawn` it in `app.ts` inside `spawnServiceActors` and add its ref to `AppServices` (`shared/GlobalContext`). Otherwise spawn it on demand from the parent flow that needs it.
4. Wire the screen to it via selectors and `send`.

### 4. Visualize while you work

Open a machine in the [XState Visualizer](https://stately.ai/viz) or the Stately VS Code extension to see the chart, simulate events, and validate that every state is reachable before you write tests.

### 5. Test your changes

Each machine ships with a co-located `*.test.ts`. Model your new states/transitions the same way and run:

```bash
npm test -- machines/<your-machine>
```

## Related pages

* [Architecture](../architecture.md) & [Components](../components.md) — where these machines sit in the wider app.
* [Configuration](configuration.md) — server-driven properties consumed by these flows.
* [Credential Provider](credential_providers.md) — adding a new issuer to the OpenID4VCI flow.
* [Integration Guide](../integration-guide/) — the SDKs (VCI-Client, OpenID4VP, Tuvali, Face Match, Secure Keystore) invoked by the machine `services`.
