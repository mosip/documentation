# Overview

Inji Mobile wallet is a mobile application specifically created to streamline all types of identification and credentials into one digital wallet. This innovative solution allows for identity verification through a straightforward selfie. It has capabilities for issuance to certify anyone or anything, verification toolkit, and governance & trust frameworks.

It offers a secure, trustworthy, and dependable mobile Verifiable Credentials wallet designed to fulfil the following functions:
Inji stands as a secure, trustworthy, and dependable mobile Verifiable Credentials wallet designed to fulfil the following functions:

* Download and **store Verifiable credentials (VC)** securely within the wallet.
* Conduct **offline face authentication** against the stored VCs to verify the user's presence.
* **Share Verifiable credentials** with relying parties without requiring an internet connection, utilizing Bluetooth Low Energy (BLE).
* Enable users to **log in to online portals** of relying parties by scanning a QR code, facilitating seamless access to their services.

The application is constructed using the [React Native framework](https://reactnative.dev/), ensuring compatibility with both Android and iOS mobile operating systems. It leverages [Xstate state machines](https://xstate.js.org/docs/) for efficient application state management. The digital credentials produced by the mobile app adhere to the [Verifiable Credentials (VC) Data Model](https://www.w3.org/TR/vc-data-model/).

**How does Inji work?**

* Inji users can obtain their Verifiable credential by utilizing their unique ID (e.g., UIN or VID issued by the government).
* Users are required to authenticate their request through an OTP sent to their registered mobile number or email address.
* Only upon successful validation, the Verifiable credential will be downloaded and securely stored within the app.
* Once a Verifiable credential is downloaded, users can share it with relying parties via Bluetooth, using the [BLE protocol](https://tlodderstedt.github.io/openid-for-verifiable-presentations-offline-1\_0-00.html).
* To further authenticate the digital VC, users can opt for offline face authentication during transactions.
* Inji also offers integration with eSignet, allowing residents to log in to relying party portals by scanning a QR code.
* Users have control over the information shared with the relying party through user consent.
* Inji is compatible with [**OpenID**](https://openid.net/developers/how-connect-works/) protocol and has the capability to onboard a variety of Identity Providers (IdP). This, in turn, provides users with multiple options for Verifiable Credential (VC) issuers.
* Inji ensures the authenticity of digital signatures provided by the issuer for each ID before downloading it to the local device. Subsequently, it generates a HASH for each digital ID stored, utilizing it to verify the integrity of the ID before displaying it within the app at any time.

#### Backend Systems

* The app uses [Mimoto APIs](https://mosip.stoplight.io/docs/mimoto) for generating VCs, downloading and activation.
* It uses [eSignet APIs](https://mosip.stoplight.io/docs/identity-provider/jlmszj6dlxigw-e-signet) for online login.
