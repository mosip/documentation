# Functional Overview

**Inji Verify** is a powerful tool for validating and verifying credentials through QR codes. Users can scan QR codes using smartphones or computers, retrieving credential information quickly. Advanced algorithms and the pixel pass library ensure QR code authenticity, providing real-time verification and instant feedback.

The portal displays valid credentials securely, including detailed information such as name, DOB, gender, expiration date, and associated claims, in a user-friendly interface. Inji Verify employs encryption techniques to protect sensitive information and prevent tampering.

Compatible with desktops, mobile devices, and laptops, Inji Verify includes a mobile responsive version with back camera capability. While tablet responsiveness is under development, users can access Inji Verify from anywhere with an internet connection.

The below given are the list of features for the Inji Verify Portal:

1. **QR Code Scanning:**
   * Inji Verify enables users to scan QR codes embedded in documents or digital certificates.
   * The built-in scanning feature allows for quick and convenient retrieval of credential information.
   * Users can scan QR codes using their smartphone's back camera and computers with a front camera capability.
2. **QR Code Upload:**
   * Users can upload images containing QR codes directly to Inji Verify for verification.
   * Provides an alternative to scanning, enabling access to and verification of credentials from uploaded documents.
   * Supports various formats like PDFs and images(JPEG, JPG, and PNG) containing QR codes.
   * Utilizes PixelPass library to automatically decode uploaded QR codes for accurate credential retrieval.
3. **Streamlined Credential Sharing:**
   1. Inji Verify leverages [**OpenID4VP**](https://openid.net/specs/openid-4-verifiable-presentations-1_0.html#name-cross-device-flow) standards to simplify the process of verifying the verifiable credentials (VCs). Instead of embedding the entire credential within the QR code and with the OpenIDVP online sharing feature the QR code is embedded with a URL that points to a secure storage location like Inji Web or any platform adhering to OpenID4VP standards. This reduces the size and complexity of the QR code, making it easier to scan and share across devices, while still ensuring secure credential verification.
4. **Docker Compose for Easy Installation:**
   1. Inji Verify offers a streamlined installation process by supporting Docker Compose. This containerization tool allows users to quickly set up and deploy the application without complex configuration steps.
5. **Validation and Verification:**
   * Upon scanning a QR code or uploading the QR Code, Inji Verify validates the authenticity of the credential data.
   * Advanced algorithms and cryptographic methods ensure that the QR code has not been tampered with and consumes [**pixel pass library v0.5.0**](https://www.npmjs.com/package/@mosip/pixelpass/v/0.5.0)**.**
   * Real-time verification provides instant feedback on the validity of the credential, giving users confidence in its authenticity.
   * PixelPass library now supports decoding of CBOR-encoded QR codes, enabling Inji Verify to verify CBO&#x52;**-**&#x65;ncoded QR codes. However, CBOR encoding capability within the PixelPass library is still under development.
6. **Credential Display:**
   * Valid credentials retrieved through QR code scanning or uploading QR codes are displayed securely within the Inji Verify portal.
   * Users can view detailed information about the credential, including name, DOB, gender, expiration date, and any associated claims.
   * The user-friendly interface facilitates a clear and concise data representation of the credential data for easy verification.
7. **OpenIDVP Cross Device flow**: OpenID for Verifiable Presentations (OpenID4VP) enables users to securely share their Verifiable Credentials (VCs) from their digital wallet with a verifier, even when they are using different devices.
   * A verifier requests specific credentials from the user.
   * The user’s wallet (on a different device) allows them to share either all or only the available credentials.
   * The shared credentials are then verified for authenticity and validity.
   * The verification result is displayed on Inji Verify confirming whether the credentials are valid or not.

This ensures a secure and flexible way of sharing credentials across different devices while maintaining privacy and control over what gets shared.

8. **Language Selection**: User can choose from the list of languages for a much better usability, hence the text description and VC result on the UI is displayed based on the language cosen. Inji Verify supports the following international languages which includes Portuguese, Spanish, French, English, Arabic, Khmer and the Indian vernacular langauges includes Tamil, Hindia and Kannada.

9. **UI Theme Customization**:  
   Inji Verify offers the flexibility to customize the user interface (UI) themes, allowing integrators or countries to tailor the appearance of the portal to meet their specific branding or regional requirements. This feature ensures a personalized and visually cohesive user experience.

10. **Cross-Platform Compatibility:**
   * Compatible with a wide range of devices and operating systems, including desktops, mobile devices, and laptops.
   * A mobile responsive version with back camera capability is now available.
   * Responsive design ensures optimal performance and usability across different screen sizes and resolutions.
   * Tablet responsiveness tested on specific devices; still under development.
   * Accessible from anywhere with an internet connection for convenient on-the-go verification.

{% hint style="info" %}
**Scan Feature QR Code Compatibility**:

* QR code versions supported for the scan feature range from v22 and below with consistent performance.
* Versions from v23 to v27 show inconsistent results due to varying data bytes based on the use case for verifiable credentials embedded into the QR code.
* Versions above v27 are not supported for the scan feature. If you have a QR code version above v27, please use the upload feature to upload the document or QR code for verification.

**Camera Resolution Requirement**:

* The device's front, back, or web camera resolution must exceed 12 megapixels.
* Resolutions below this range result in inconsistent QR code scanning.
* Cameras should be used in well-lit environments without filters, ensuring proper alignment for optimal scanning.

**Upload Feature QR Code Compatibility**:

* QR code versions supported for the upload feature range from v32 and below.
{% endhint %}

Inji Verify provides a reliable solution for validating and verifying verifiable credentials via QR codes. Its user-friendly interface, robust features, and cross-platform compatibility allow users to confidently verify credentials anytime, anywhere.
