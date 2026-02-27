# Revocation of Verifiable Credentials

### Overview

Revocation in Inji Mobile Wallet is the mechanism that allows the wallet to determine and display whether a stored verifiable credential (VC) is **revoked or not**. Inji uses the [**W3C Bitstring Status List**](https://www.w3.org/TR/vc-bitstring-status-list/) mechanism to evaluate revocation for supported credential formats. The revocation check runs automatically when credentials are downloaded, and can be triggered manually by the user. To get more details on the technical implementation and design of this feature, click [here](https://github.com/mosip/inji-wallet/blob/master/docs/revocation-support.md) to explore.

### Why This Feature Matters

* **Protects Verifiers & Holders:** Prevents use of credentials that an issuer has invalidated (e.g., lost, compromised, or superseded).
* **Maintains Trust:** Ensures relying parties receive only valid credentials and avoids false acceptances.
* **User Safety & Compliance:** Alerts users that a credential is no longer usable and prevents them from unknowingly sharing revoked data.
* **Offline-first UX:** The wallet supports offline scenarios (BLE) and indicates pending status when online checks are unavailable.
* **Status recheck:** Status checks are performed when the credential is first downloaded and can be triggered manually by the user.

### Supported Credential Types

* **Fully supported (revocation checks):**
  * `ldp_vc` (Linked Data Proof VC) with an `credentialStatus` entry that follows [**W3C Bitstring Status List**](https://www.w3.org/TR/vc-bitstring-status-list/) semantics.
  * Status entries where `statusPurpose == "revocation"`.
  * Multi-bit status lists (`statusSize > 1`) are supported (0 = valid, >0 = revoked).
* **Not yet checked (bypass for now):**
  * `sd-jwt` (SD-JWT) — revocation check currently bypassed (future work planned).
  * `mDoc`/`mDL` — depending on issuer support; currently may be bypassed if the credential lacks a StatusList entry.
  * Any credential without an `credentialStatus` entry or with unsupported `statusPurpose`.

### How does the Revocation Flow Work?

#### **User Flow (Step-by-Step)**

* When a verifiable credential is downloaded into the wallet, the app automatically checks whether it is still valid.
* The wallet looks up the status for every credential downloaded, where the wallet checks if the issuing authority has marked it as still active or revoked (no longer valid).
* The wallet verifies the information before trusting the response. The wallet makes sure the data is correct:
  * a) It checks that the file is valid.
  * b) It checks that the information is up-to-date.
  * c) It checks (on Android) that the file is digitally signed and secure.
* The wallet updates the screen, and the app now shows the correct status:
  * a) 🟢 **Valid** — You can use or share it
  * b) 🔴 **Revoked** — You cannot use it
  * c) 🟡 **Pending** — Try again later; internet may be required
* Wallet logs the activity. The action (“Status checked”) is saved in your **History** so you always know when the last check happened.

<div data-with-frame="true"><figure><img src="../../../../.gitbook/assets/OpenID4VP Credential-2025-12-10-041250.png" alt=""><figcaption></figcaption></figure></div>

### Current Limitations

1. **Format coverage:**
   * Revocation checks currently apply only to credentials using the [**W3C Bitstring Status List**](https://www.w3.org/TR/vc-bitstring-status-list/) (LDP-VC). SD-JWT and some other credential formats are **bypassed** for status checks until issuers provide compatible status-list metadata or wallet libraries add support.
2. **iOS signature verification:**
   * Full cryptographic signature verification of the Status List Credential is **skipped on iOS** for the current release (processing still decodes bitstring). iOS signature verification is planned for a future update.
3. **Network dependence & offline UX:**
   * When offline or when the status list URL is unreachable, the wallet marks the status as **PENDING**. Verifiers must treat PENDING per their policy (some verifiers may allow conditional acceptance; others must reject).
4. **Revocation push & near-real-time updates:**
   * Current flow is pull-based; there is no push notification mechanism for immediate issuer-driven revocation propagation to wallets. This may cause brief windows of stale state between issuer revocation and wallet recheck.
5. **Multi-purpose status entries:**
   * Wallet currently supports only `statusPurpose = "revocation"`. Other purposes (e.g., `suspension`) are not handled.
6. **Error reporting granularity:**
   * Some failure states map to a generic `PENDING`; more granular error messaging could help users and integrators diagnose issues (e.g., signature failure, decode error, invalid index).
7. **Scale of encodedList:**
   * Very large encodedList files for population-scale deployments may require optimized storage, streaming, and verification strategies (e.g., segmented lists, CDN usage).

### Learn More

* [Revocation Check - Inji Wallet](https://github.com/mosip/inji-wallet/blob/master/docs/revocation-support.md): To learn how revocation works with Inji Mobile Wallet
