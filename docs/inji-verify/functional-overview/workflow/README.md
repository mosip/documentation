# Workflow

### Overview

This section explains how Inji Verify requests and validates verifiable credentials. It covers OpenID4VP-based sharing and QR-based verification.

Use the pages below to understand each verification flow and its implementation details.

* [OpenID4VP Cross Device Flow](openid4vp-cross-device-flow.md)\
  The verifier shows a QR code. The wallet scans it and returns `vp_token` via `direct_post`.
* [OpenID4VP Same Device Flow](openid4vp-same-device-flow.md)\
  Verifier and wallet run on the same device. The flow uses app redirects.
* [Upload or Scan QR Code flow](upload-or-scan-qr-code-flow.md)\
  Verify by scanning or uploading a QR. Supports embedded VC data and OpenID4VP QR codes.
* [Inji Verify SDK](inji-verify-sdk.md)\
  UI components and callbacks to embed Inji Verify flows in your relying party app.
