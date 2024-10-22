# Overview

The **Inji Mobile application** is designed to securely store all types of digital credentials, from national IDs to certificates, in one easy-to-use mobile wallet. It offers a simple way to manage and share trusted data through Verifiable Credentials (VCs), making it portable, convenient, secure, and private for users.

Key features of Inji Mobile include secure storage, seamless sharing, and offline verification capabilities including face authentication, making it an essential tool for users managing digital credentials.

#### **Key Features and Capabilities:**

* **Secure Download and Storage of Verifiable Credentials (VCs):** The Inji Mobile allows users to download, store, and manage their Verifiable Credentials securely. This makes it a dependable mobile solution for keeping identity credentials, ensuring users have access to their digital IDs anytime, anywhere.
* **Seamless Offline Credential Sharing:** Users can share their credentials with service providers without requiring internet connectivity by utilizing **Bluetooth Low Energy (BLE)** technology. This offline sharing supports decentralized ID verification, making it possible to share VCs even in areas with limited to no internet connectivity, ensuring the user’s credentials are always accessible. This offline capability makes it ideal for users in rural or low-connectivity areas.
* **Offline Face Authentication for Secure Transactions:** The app offers offline face authentication, verifying the user’s presence during credential sharing with service providers. This feature adds an additional layer of security when sharing credentials, ensuring the identity of the user is authenticated in real-time.
* **QR Code-Based Access to Online Services:** The wallet enables users to log in to service provider portals by scanning QR codes, simplifying access to various services. It also supports **single sign-on (SSO)** capabilities, allowing users to access multiple services with the same credentials securely.
* **Privacy and Control Over Data Shared:** Inji Mobile puts users in control of their data, allowing them to decide what information is shared with service providers. This consent-driven approach ensures that users' privacy is protected throughout all interactions.
* **Enhanced Efficiency for Government Services:** Inji Mobile streamlines the registration process for government benefits, such as pensions and healthcare services. It also facilitates the use of VCs during travel and at security checkpoints, such as airports, ensuring that digital IDs are always readily accessible.
* **Robust Security with Verifiable Credentials:** The digital credentials managed within Inji Mobile adhere to the **Verifiable Credentials (VC) Data Model**, ensuring the adherence to global standards for security and authenticity. Before downloading to the device, each credential is authenticated by the issuer's digital signature, and a unique **HASH** is generated to verify the integrity of the credential at any time.

#### **How Inji Mobile Works:**

* Inji Mobile allows users to securely obtain and manage their verifiable credentials through a simple process. Users can download their credentials by using their unique ID (such as UIN or VID for a government-issued National ID) or the card details they already have (via the KBI method).
* To validate their identity, users authenticate their request with a one-time password (OTP) sent to their registered mobile number or email.
* Once validated, the verifiable credential is securely downloaded and stored in the app.
* These credentials can then be shared with relying parties via Bluetooth, using the [**BLE protocol**](https://tlodderstedt.github.io/openid-for-verifiable-presentations-offline-1\_0-00.html).
* For added security, users have the option to authenticate their credentials through offline face verification during transactions.
* Inji Mobile also integrates with [**eSignet**](https://docs.esignet.io/versions/v1.2.0), enabling users to log in to service provider portals by simply scanning a QR code.
* Users maintain full control over what information is shared, through the consent mechanism that comes along.
* Inji Mobile is compatible with the [**OpenID**](https://openid.net/developers/how-connect-works/) protocol, offering a wide range of Identity Providers (IdP) for users to select from when downloading their verifiable credentials.
* Inji Mobile ensures that the digital signatures of the issuer are verified before the credential is stored, and it generates a unique HASH for each ID to confirm its integrity before displaying it in the app.

#### **Technology and Integration:**

* The app leverages [**Mimoto APIs**](https://mosip.stoplight.io/docs/mimoto) for generating, downloading and activating Verifiable Credentials (VCs).
* Additionally, it utilizes [**eSignet APIs**](https://mosip.stoplight.io/docs/identity-provider/jlmszj6dlxigw-e-signet) to enable seamless online login for users.\


To summarize, Inji Mobile is an all-in-one mobile solution for securely managing and sharing Verifiable Credentials. By offering both online and offline features, privacy protection, and seamless integration with service providers, it empowers individuals to have complete control over their digital credentials, wherever they are.

**For any queries or contributions, please engage with us** [**here**](https://community.mosip.io/c/inji/16)**.**
