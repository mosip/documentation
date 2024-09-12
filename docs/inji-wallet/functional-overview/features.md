# Features

Below is a comprehensive overview of the features provided by Inji Wallet.

## Download, Verify and Store Verifiable Credentials

Downloading your digital credentials (IDs) with you at all times just got easier. This can be done as below:

### Downloading VC using the OpenID for VC Issuance flow:

Residents can download a VC using a configured third-party issuer which complies with OpenID for VCI standard. For Inji Wallet, MOSIP IDA (National ID) and Veridonia Insurance (Insurance credentials) are example integrations.

#### Credential Type Selection:

Inji Wallet introduces a new feature that empowers users to select the specific type of credential they require. Upon choosing an issuer, users are presented with a list of Credential Types issued by the ID provider. This functionality provides users with flexibility and control, allowing them to download their Verifiable Credentials to their precise needs.

#### VC Verification:

Inji Wallet offers a robust feature for verifying Verifiable Credentials using the Digital Bazaar library. This advanced functionality ensures that the issuer's signature is validated and verified based on the proof type provided by the issuer. This step is ingrained as part of the VC download flow. Currently, the support is for the RSA signature type, providing users with reliable verification capabilities. Additionally, we are actively working to expand our support to include the Ed25519 proof type, further enhancing the security and versatility of our verification process. With these advancements, users can trust that their Verifiable Credentials are verified with precision and integrity, regardless of the proof type utilized by the issuer.

#### **QR Code Generation:**

PixelPass library is capable of generating QR codes for Verifiable Credentials with smaller size data. The library is integrated with Inji Wallet and users can now see a QR code which has Verifiable Credentials embedded in it. These QR codes, visible in the detailed view of the card, offer a convenient way for users to share their credentials with relying parties or service providers. Users can display the QR code so that the relying party / service provider can either:

* Scan the QR code displayed in the wallet app showcased by the resident.
* Upload the QR code as an image to the service provider verification website.

Reference Implementation: QR Code generation for Veridonia Insurance VC.

To know more about QR code verification, read about Inji Verify [here](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features#qr-code-generation).

To understand the workflow, please refer [here](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features/feature-workflows#id-2.-downloading-verifying-and-storing-credentials).

## Sharing Verifiable Credentials without the Internet

* Inji Wallet allows users to securely share their downloaded VCs with other Inji users using Bluetooth Low Energy (BLE) technology, removing the necessity for an internet connection.

## Offline authentication of shared Verifiable Credentials

* Users can verify the authenticity of their shared VCs by taking a self-portrait photograph on their mobile device. Inji Wallet compares this photograph with the image on the VCs, confirming the correct source and owner.

## Streamlined SSO and User-Controlled Authentication

* The Inji Wallet application facilitates a Single Sign-On (SSO) function, empowering supported partners to enable a seamless login to online portals. This is achieved through the efficient process of scanning a QR code and sharing user data with their explicit consent.\
  \
  To understand the QR code login flow, refer [here](https://docs.esignet.io/end-user-guide/login-with-qr-code).\\
* Inji Wallet users have the ability to choose which downloaded VC should be enabled for online authentication and selectively share the credentials on their ID. This capability provides users with an additional layer of security and control over the utilization of their stored information.

## Data backup and restore

In order to safeguard against potential data loss in case of any unprecedented circumstances such as phone / app crashes, device change etc, and to improve user experience in the Inji app, users can now utilize the Backup and Restore feature for their Verifiable Credentials (VCs).

Depending on their device platform, users can choose to store and retrieve VCs securely using either Google Drive (for Android users) or iCloud (for iOS users). This is a one-time setup process, where Android users can select their respective Google email account, while iOS users can back-up data using their default logged-in Apple account.

To understand the backup and restore flow, refer [here](https://docs.mosip.io/inji/inji-mobile-wallet/overview/features/feature-workflows#id-5.-data-backup-and-restore).

## Security Features

Inji Wallet, as a digital Verifiable Credential wallet, implements robust measures to safeguard PII data and protect against cyber-attacks. Inji Wallet undergoes rigorous Penetration Testing and Threat Modelling by certified experts, further enhancing its resilience against cyber threats.

1. **Utilization of Hardware Keystore**:
   * Inji Wallet securely stores private encryption keys by utilizing the Android hardware keystore.
2. **Cryptographic Protection for PII Data**:
   * Inji Wallet employs industry-standard SHA-256 and Argon2 cryptographic libraries to hash and strengthen Personally Identifiable Information (PII) data. The app actively detects and responds to any suspicious activities, ensuring enhanced security of user data.
3. **Automatic biometric change detection**:
   * Inji Wallet automatically resets itself in case of biometric change, thereby ensuring the security of information.

## Ingenious Design

Inji Wallet functions as a comprehensive repository for a diverse array of VCs, leveraging its interface design to benefit users.

* **Multiple views of VCs**: Users can access multiple views of VCs, ranging from a mini view to detailed insights.
* **Organized UI**: Inji Wallet provides a clear demarcation between downloaded and received VCs enhancing user clarity.
* **Quick Access menu**: Users can now directly Share, Share with Selfie directly by accessing the kebab menu from the mini view in the Home Page and the detailed view of the VC.

For a quick look at these features, refer the [Inji Wallet User Guide](end-user-guide.md).

To understand the workflow of key features, refer [Feature Workflows](https://docs.mosip.io/inji/overview/features/feature-workflows).

Also, watch the video below for a quick glimpse of the features available.

{% embed url="https://www.youtube.com/watch?v=9Z1WuTd8q0M" %}
