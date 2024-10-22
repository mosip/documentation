# Architecture

Inji Wallet is a mobile application designed to enhance user convenience by allowing them to securely download and manage their Verifiable Credentials (VC) offline. The diagram below illustrates the extensive features of Inji Wallet, highlighting the essential modules involved in issuing Verifiable Credentials.

Furthermore, this overview outlines various user flows, detailing the seamless processes users can follow. These processes include downloading VC by utilizing eSignet for authentication, securely activating VC, logging in to eSignet, and effortlessly sharing VCs.

.

<figure><img src="../../../.gitbook/assets/inji_architecture_diagram.png" alt=""><figcaption><p>Inji Wallet Architecture</p></figcaption></figure>

Let’s go through a brief overview these components.

* **eSignet**: Server enables user authorization and generates Verifiable Credentials (VCs) securely from user data.
* **Mimoto**: This is a BFF(Backend for Frontend) for routing API calls to services.
* **Tuvali**: This is an SDK that transfers data securely over BLE following OpenID4VPBLE specification.
* **Biometric SDK / Face Match SDK**: This is an SDK used for face verification.
* **Secure Key Store**: This is an SDK used for key-pair generation, signing and encryption/ decryption for Android.
