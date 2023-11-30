# Features

Below is a comprehensive overview of the features provided by Inji.

### Security Features

Inji, as a digital wallet, implements robust measures to safeguard PII data and protect against cyber attacks.

1. **Utilization of Hardware Keystore**:
   * Inji securely stores private encryption keys by utilizing the Android hardware keystore.
2. **Cryptographic Protection for PII Data**:
   * Inji employs industry-standard SHA-256 and Argon2 cryptographic libraries to hash and strengthen Personally Identifiable Information (PII) data. The app actively detects and responds to any suspicious activities, ensuring enhanced security of user data.
3. **Automatic Reset for Stolen or Transferred Devices**:
   * Inji automatically resets itself in case of device theft or ownership change, thereby ensuring the security of information.
4. **Certified Security Measures**:
   * Inji undergoes rigorous Penetration Testing and Threat Modelling by certified experts, further enhancing its resilience against cyber threats.

### Download and save Verifiable Credentials

1. **OpenID Support**
   * Inji offers support for OpenID, enabling a smooth onboarding experience for identity providers (IdP).
2. **Download Options**
   * Inji supports the use of the country-provided Identification Number (UIN/VID) to download identity proof, granting access to various government and private services.
   * Alternatively, the Application ID (AID) provided during the registration process can also be used to initiate the download of identity proofs.

### Sharing Identity Proofs without the Internet

* Inji allows users to securely share their downloaded identity proofs with other Inji users using Bluetooth Low Energy (BLE) technology, removing the necessity for an internet connection.

### Offline authentication of shared Identity proofs

* Users can verify the authenticity of their shared ID proof by taking a self-portrait photograph on their mobile device. Inji compares this photograph with the image on the ID proof, confirming the correct source and owner of the proof.

### Streamlined SSO and User-Controlled Authentication

* The Inji mobile application facilitates a Single Sign-On (SSO) function, empowering supported partners to enable a seamless login to online portals. This is achieved through the efficient process of scanning a QR code and sharing user data with their explicit consent.
* Inji users have the ability to choose which downloaded ID proof should be enabled for online authentication and selectively share the credentials on their ID. This capability provides users with an additional layer of security and control over the utilization of their stored information.

### Ingenious Design

Inji functions as a comprehensive repository for a diverse array of identity proofs, leveraging its clever interface design to benefit users.

* **Multiple views of Identity proofs**: Users can access multiple views of IDs, ranging from an overview to detailed insights.
* **Practical Sorting logic**: The sorting and filtering logic is meticulously crafted, ensuring relevance and practicality in day-to-day use.
* **Organized UI**: Inji provides a clear demarcation between downloaded and received identity proofs enhancing user clarity and organization.
* Downloading your digital credentials (ID) with you at all times just got easier.
* This can be done in three ways:
  * **Downloading VC using the UIN/ VID:** Residents can use the country-provided ID (UIN/VID) to download their cards and avail of various government and private services.
  * **Downloading VC using the Application ID:** Residents can also use their Application ID provided to them during the registration process to be able to download their card.
  * **Downloading VC using the OpenID for VC Issuance flow:** Residents can download a VC using a configured third-party issuer which follows OpenID for VCI standard.

For a quick look at these features, refer the [Inji User Guide](https://docs.mosip.io/1.2.0/modules/inji-user-guide).

To understand the QR code login flow, refer [here](https://docs.esignet.io/esignet-end-user-guide/login-flow-qr-code).

To understand the workflow of key features, refer [Feature Workflows](https://docs.mosip.io/inji/overview/features/feature-workflows).

Also, watch the video below for a quick glimpse of the features available.

{% embed url="https://www.youtube.com/watch?v=9Z1WuTd8q0M" %}
