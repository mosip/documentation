---
hidden: true
---

# Credential Revocation

## Revoked Credential Detection (Verifier)

### Overview

Inji Verify detects whether a presented verifiable credential (VC) has been revoked by its issuer and clearly surfaces that status in verification results. For JSON-LD credentials, Inji Verify evaluates revocation using the W3C Bitstring Status List (Status List 2021). SD-JWT credentials currently do not carry compatible revocation metadata and are treated accordingly (see Supported Credential Types).

This feature focuses on the verifier experience: how revocation is checked during QR-based verification, file upload, and OpenID4VP flows (cross-device and same-device), and how results are displayed for operational decisions.

### Why It Matters

* Protects relying parties: Prevents acceptance of credentials that an issuer has invalidated (lost, compromised, or superseded).
* Maintains trust: Ensures only valid, current credentials pass verification.
* Clear outcomes: Distinct UI states for Valid, Revoked, Expired, Pending, and No Status Information.
* Operational consistency: A predictable policy point for handling network outages or issuer status list issues.

### Where You See It in Inji Verify

* Scan QR Code: Revocation status is evaluated and shown with the verification result card(s).
* Upload QR Code: Same evaluation path as scan; status shown on result cards.
* VP Verification (Cross Device and Same Device): Each credential card shows its status; multi-credential responses display per-card states.
* Result actions: Expand view and Download JSON include the resolved status.

### Supported Credential Types

* JSON-LD Verifiable Credentials (LDP-VC):
  * Supported when the VC contains `credentialStatus` with `statusPurpose == "revocation"` and compatible Status List metadata.
  * Multi-bit status lists are supported (`statusSize > 1`): bit value 0 → valid, value > 0 → revoked.
  * Status List Credential (SLC) signature verification is performed when supported by platform and libraries.
* SD-JWT (Selective Disclosure JWT):
  * Revocation check is currently bypassed due to lack of standardized status-list metadata in typical SD-JWT deployments.
  * Verification still enforces signature validation and expiry as applicable.
* Credentials without `credentialStatus` or unsupported `statusPurpose`:
  * Shown with "No Status Information" (policy-driven handling); expiry and signature checks still apply.

### How Revocation Checking Works (Verifier)

1. Extract status metadata:
   * From the VC’s `credentialStatus`, read status list parameters like `statusListCredential`, `statusListIndex`, and `statusPurpose`.
2. Fetch Status List Credential (SLC):
   * Retrieve the issuer’s SLC (often via HTTPS). Respect caching and reasonable TTLs to avoid excessive network calls.
3. Decode the status list:
   * Parse and decode `encodedList` according to W3C Bitstring Status List semantics.
   * Use `statusListIndex` and `statusSize` to locate the correct bit segment for the VC.
4. Validate the SLC (when supported):
   * Verify issuer signature over the SLC.
   * Confirm the issuer matches the VC.
5. Determine status:
   * Bit value 0 → Valid (not revoked).
   * Bit value > 0 → Revoked.
   * Network or decoding issues → Pending.
   * Missing/unsupported status metadata → No Status Information.
6. Display in UI:
   * Each credential card shows a clear badge: Valid, Revoked, Expired, Pending, or No Status Information.

### UI States and Verifier Guidance

* Valid: Credential passes signature, expiry, and revocation checks.
* Revoked: Credential is explicitly marked revoked in the status list; reject.
* Expired: Credential validity period has ended; reject per policy.
* Pending: Status could not be confirmed (offline, SLC unreachable, decode error). Handle per verifier policy — e.g., retry or reject.
* No Status Information: The credential format or issuer metadata does not provide revocation details; rely on signature, issuer trust, and expiry policy.

### Learn More

* End User Guide: See the verification flows and screenshots in [End User Guide](../../functional-overview/end-user-guide/#credential-display-capability).
* Wallet Feature Reference: The holder-side behavior is described in [Revocation of Verifiable Credentials (Wallet)](../../../inji-wallet/inji-mobile/overview/features/revocation-of-verifiable-credentials.md).
* W3C Specification: [VC Bitstring Status List](https://www.w3.org/TR/vc-bitstring-status-list/).
