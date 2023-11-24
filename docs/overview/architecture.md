# Architecture

Inji is a mobile application designed to enhance user convenience by allowing them to securely download and manage their Verifiable Credentials (VC) offline. The diagram below illustrates the extensive features of Inji, highlighting the essential modules involved in issuing Verifiable Credentials.

Furthermore, this overview outlines various user flows, detailing the seamless processes users can follow. These processes include downloading VC through OTP, utilizing eSignet for authentication, securely activating VC, logging in to eSignet, and effortlessly sharing VCs.

<figure><img src="../.gitbook/assets/Inji_Arch (1).png" alt=""><figcaption><p>Inji Architecture</p></figcaption></figure>

Let us go through a brief overview of these flows.

#### Download VC via OTP

* **Mimoto**: BFF routing API calls to services.
* **Resident Service**: Validates UIN/VID/AID, sends OTP, validates OTP, sends download request to Credential Service.
* **Credential Service**: Issues credential over WebSub to Mimoto.
* Flow:
  * Users register with MOSIP for UIN/VID/AID.
  * Enters UIN/VID/AID, receives OTP.
  * Successful OTP entry triggers credential issuance.
  * Inji app polls status; downloads VC if issued.

#### Download via eSignet

* **eSignet**: Used for VC activation and download.
* Flow:
  * User registers with eSignet, and receives an access token.
  * Access token initiates JWT-proof download request.

#### Activate VC

* **Secure Hardware Keystore:** SDK for key generation and storage.
* Flow:
  * User activates VC with binding OTP.
  * Triggers wallet binding, stores thumbprint.

#### &#x20;Login to eSignet

* Flow:
  * User scans QR code, generates JWT (thumbprint, private key), logs in, shares claims.

#### VC Share

* **Tuvali**: Handles Bluetooth connection, data transfer for VC sharing.
* **File Storage**: Stores VC files.
* **MMKV Storage**: Stores VC keys, HMAC for VC files.
* Flow:
  * Verifier shares QR; Wallet scans for BLE connection.
  * Wallet selects VC to share with/without face authentication.

#### Libraries Used for Key Pairs

* **iOS**: react-native-secure-key-store.
* **Android**: Hardware keystore.

