# Overview

**Inji Wallet** is a mobile application specifically created to streamline all types of identification and credentials into one digital wallet. This innovative solution allows for identity verification through a straightforward selfie.

It offers a secure, trustworthy, and dependable mobile Verifiable Credentials wallet designed to fulfil the following functions:

* Download and **store Verifiable Credentials (VC)** securely within the wallet. Also, serves as a secure **user wallet** for storing and managing ID credentials. Additionally, it streamlines the process of **obtaining authenticated ID credentials**.
* **Share Verifiable Credentials** with the relying parties without requiring an internet connection, utilizing Bluetooth Low Energy (BLE). Supports **decentralized ID verification** through offline sharing.
* Conduct **offline face authentication** against the stored VCs to verify the user's presence while sharing the Vcs to the 'Service Providers'.
* Enable users to **log in to online portals** of relying parties by scanning a QR code, facilitating seamless access to their services.Facilitates seamless access to multiple websites and services using the same login information, enhancing convenience and security.
* Allows users to have full control over the data shared with service providers, ensuring **privacy protection**.
* **Simplifies the registration process** for government benefits, such as pensions or healthcare services, and enhances efficiency in situations where users need to provide their identification credentials. For example, it enables the presentation of VCs during airport security checks.

The application is constructed using the [React Native framework](https://reactnative.dev/), ensuring compatibility with both Android and iOS mobile operating systems. It leverages [Xstate state machines](https://xstate.js.org/docs/) for efficient application state management. The digital credentials produced by the mobile app adhere to the [Verifiable Credentials (VC) Data Model](https://www.w3.org/TR/vc-data-model/).

**How does Inji Wallet work?**

* Inji Wallet users can obtain their Verifiable credential by utilizing their unique ID (e.g., UIN or VID in case of a National ID issued by the government) or using the card details/information they possess (KBI method).
* Users are required to authenticate their request through an OTP sent to their registered mobile number or email address.
* Only upon successful validation, the Verifiable credential will be downloaded and securely stored within the app.
* Once a Verifiable credential is downloaded, users can share it with relying parties via Bluetooth, using the [BLE protocol](https://tlodderstedt.github.io/openid-for-verifiable-presentations-offline-1\_0-00.html).
* To further authenticate the digital VC, users can opt for offline face authentication during transactions.
* Inji Wallet also offers integration with eSignet, allowing residents to log in to relying party portals by scanning a QR code.
* Users have control over the information shared with the relying party through user consent.
* Inji Wallet is compatible with [**OpenID**](https://openid.net/developers/how-connect-works/) protocol and has the capability to onboard a variety of Identity Providers (IdP). This, in turn, provides users with multiple options for Verifiable Credential (VC) issuers.
* Inji Wallet ensures the authenticity of digital signatures provided by the issuer for each ID before downloading it to the local device. Subsequently, it generates a HASH for each digital ID stored, utilizing it to verify the integrity of the ID before displaying it within the app at any time.

Moreover, Inji Wallet serves individuals in remote locations with limited network accessibility. The credentials stored within the Inji Wallet app only require a one-time download, allowing the app to verify both online and offline IDs at any given moment, eliminating the need for network connectivity.

#### Backend Systems

* The app uses [Mimoto APIs](https://mosip.stoplight.io/docs/mimoto) for generating VCs, downloading and activation.
* It uses [eSignet APIs](https://mosip.stoplight.io/docs/identity-provider/jlmszj6dlxigw-e-signet) for online login.

For any queries or contributions, please engage with us [here](https://community.mosip.io/c/inji/16).
