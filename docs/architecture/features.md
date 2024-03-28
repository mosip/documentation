# Features

Below is a comprehensive overview of the features provided by Inji.

### Security Features

Inji, as a digital Verifiable Credential wallet, implements robust measures to safeguard PII data and protect against cyber-attacks. Inji undergoes rigorous Penetration Testing and Threat Modelling by certified experts, further enhancing its resilience against cyber threats.

1. **Utilization of Hardware Keystore**:
   * Inji securely stores private encryption keys by utilizing the Android hardware keystore.
2. **Cryptographic Protection for PII Data**:
   * Inji employs industry-standard SHA-256 and Argon2 cryptographic libraries to hash and strengthen Personally Identifiable Information (PII) data. The app actively detects and responds to any suspicious activities, ensuring enhanced security of user data.
3. **Automatic biometric change detection**:
   * Inji automatically resets itself in case of biometric change, thereby ensuring the security of information.

### Download and save Verifiable Credentials

Downloading your digital credentials (IDs) with you at all          times just got easier. This can be done in three ways:

* **Downloading VC using the UIN/ VID:** Residents can use the country-provided ID (UIN/VID) to download their cards and avail of various government and private services.
* **Downloading VC using the Application ID (AID):** Residents can also use their Application ID provided to them during the registration process to be able to download their card.
* **Downloading VC using the OpenID for VC Issuance flow:** Residents can download a VC using configured third-party issuer which complies with OpenID for VCI standard. For Inji mobile, MOSIP IDA and Sunbird Insurance are example integrations.

### Sharing Verifiable Credentials without the Internet

* Inji allows users to securely share their downloaded VCs with other Inji users using Bluetooth Low Energy (BLE) technology, removing the necessity for an internet connection.

### Offline authentication of shared Verifiable Credentials

* Users can verify the authenticity of their shared VCs by taking a self-portrait photograph on their mobile device. Inji compares this photograph with the image on the VCs, confirming the correct source and owner.

### Streamlined SSO and User-Controlled Authentication

* The Inji mobile application facilitates a Single Sign-On (SSO) function, empowering supported partners to enable a seamless login to online portals. This is achieved through the efficient process of scanning a QR code and sharing user data with their explicit consent.

&#x20;      To understand the QR code login flow, refer [here](https://docs.esignet.io/end-user-guide/login-with-qr-code).

* Inji users have the ability to choose which downloaded VC should be enabled for online authentication and selectively share the credentials on their ID. This capability provides users with an additional layer of security and control over the utilization of their stored information.

### Data Backup and Restore

In order to safeguard against potential data loss in case of any unprecedented circumstances such as phone / app crashes, device change etc, and to improve user experience in the Inji app, users can now utilize the Backup and Restore feature for their Verifiable Credentials (VCs).

Depending on their device platform, users can choose to store and retrieve VCs securely using either Google Drive (for Android users) or iCloud (for iOS users). This is a one-time setup process, where Android users can select their respective Google email account, while iOS users can back-up data using their default logged-in Apple account.

To understand the backup and restore flow, refer here.

### Ingenious Design

Inji functions as a comprehensive repository for a diverse array of VCs, leveraging its interface design to benefit users.

* **Multiple views of VCs**: Users can access multiple views of VCs, ranging from an overview to detailed insights.
* **Organized UI**: Inji provides a clear demarcation between downloaded and received VCs enhancing user clarity.

For a quick look at these features, refer the [Inji User Guide](../end-user-guide.md).

To understand the workflow of key features, refer [Feature Workflows](https://docs.mosip.io/inji/overview/features/feature-workflows).

Also, watch the video below for a quick glimpse of the features available.

{% embed url="https://www.youtube.com/watch?v=9Z1WuTd8q0M" %}
