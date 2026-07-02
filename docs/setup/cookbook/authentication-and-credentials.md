# Authentication and Credentials

## Authentication with eSignet (OTP and Biometrics)

eSignet is the authentication front door for residents. The pilot uses a mock relying-party (RP) portal --- typically a sample health portal bundled with eSignet to demonstrate authentication flows end to end.

### OTP authentication

1. Resident enters their ID at the mock RP portal.
2. eSignet sends a one-time password to the resident's registered mobile or email.
3. Resident enters the OTP and is authenticated.
4. Resident gives consent by allowed a set of attributes (claims) to the RP.
5. RP receives an authentication assertion and grants access to the demo service.

### Biometric authentication

6. Resident enters their ID at the mock RP portal.
7. Operator captures a single fingerprint (or iris) on the authentication device.
8. eSignet matches the live capture against the stored biometric template.
9. Resident gives consent by allowed a set of attributes (claims) to the RP.
10. RP receives an authentication assertion and grants access to the demo service.

{% hint style="info" %}
**Real-life scenarios to rehearse** Run at least one OTP-only flow (resident has no fingerprint), one biometric flow, one fingerprint failure that falls back to OTP, and one deliberate impersonation attempt that should fail. These are the cases the country team will see at scale.
{% endhint %}

## Issuing and Using INJI Wallet

INJI Wallet is the resident-side companion to MOSIP. It allows the resident to download a verifiable credential of their ID and present it back to relying parties without having to repeat the registration process. The pilot exercises both INJI Wallet (mobile) and INJI Web.

### Method

* Resident installs INJI Wallet on Android or iPhone (or opens INJI Web).
* Resident authenticates to the country MOSIP environment using their ID and an OTP via eSignet.
* MOSIP issues a verifiable credential into the wallet.
* Resident presents the credential to the mock health portal; the portal verifies the credential cryptographically and grants the demo service.

### Edge cases worth rehearsing

* Resident loses the phone and re-issues the credential on a new device.
* Resident has no smartphone --- INJI Web is used from a shared kiosk.
* Credential is revoked centrally and the wallet refuses presentation at the Relying Party.
