---
hidden: true
---

# Functional Overview

**Inji Verify** is a powerful tool for validating and verifying credentials through QR codes. Users can scan QR codes using smartphones or computers, retrieving credential information quickly. Advanced algorithms and the pixel pass library ensure QR code authenticity, providing real-time verification and instant feedback.

The portal displays valid credentials securely, including detailed information such as name, DOB, gender, expiration date, and associated claims, in a user-friendly interface. Inji Verify employs encryption techniques to protect sensitive information and prevent tampering.

Compatible with desktops, mobile devices, and laptops, Inji Verify includes a mobile responsive version with back camera capability. While tablet responsiveness is under development, users can access Inji Verify from anywhere with an internet connection.

The below given are the list of features for Inji Verify Portal:

1. **QR Code Scanning:**
   1. Inji Verify enables users to scan QR codes embedded in documents or digital certificates.
   2. The built-in scanning feature allows for quick and convenient retrieval of credential information.
   3. Users can scan QR codes using their smartphone's back camera and computers with a front camera capability.
2. **QR Code Upload:**
   1. Users can upload images containing QR codes directly to Inji Verify for verification.
   2. Provides an alternative to scanning, enabling access to and verification of credentials from uploaded documents.
   3. Supports various formats like PDFs and images(JPEG, JPG and PNG) containing QR codes.
   4. Utilizes PixelPass library to automatically decode uploaded QR codes for accurate credential retrieval.
3. **Streamlined Credential Sharing:**
   1. Inji Verify leverages [**OpenID4VP**](https://openid.net/specs/openid-4-verifiable-presentations-1_0.html#name-cross-device-flow) standards to simplify the process of verifying the verifiable credentials (VCs). Instead of embedding the entire credential within the QR code and with the OpenIDVP online sharing feature the QR code is embedded with a URL that points to a secure storage location like Inji Web or any platform adhering to OpenID4VP standards. This reduces the size and complexity of the QR code, making it easier to scan and share across devices, while still ensuring secure credential verification.
4. **Docker Compose for Easy Installation:**
   1. Inji Verify offers a streamlined installation process by supporting Docker Compose. This containerization tool allows users to quickly set up and deploy the application without complex configuration steps.
5. **Validation and Verification:**
   1. Upon scanning a QR code or uploading the QR Code, Inji Verify validates the authenticity and integrity of the credential data.
   2. Advanced algorithms and cryptographic methods ensure that the QR code has not been tampered with and consumes [**pixel pass library v0.5.0.**](https://www.npmjs.com/package/@mosip/pixelpass/v/0.5.0)
   3. Real-time verification provides instant feedback on the validity of the credential, giving users confidence in its authenticity.
   4. PixelPass library now supports decoding of CBOR-encoded QR codes, enabling Inji Verify to verify CBO&#x52;**-**&#x65;ncoded QR codes. However, CBOR encoding capability within the PixelPass library is still under development.
6. **Credential Display:**
   1. Valid credentials retrieved through QR code scanning or uploading QR codes are displayed securely within the Inji Verify portal.
   2. Users can view detailed information about the credential, including name, DOB, gender, expiration date, and any associated claims.
   3. The user-friendly interface provides a clear and concise representation of the credential data for easy verification.
7. **Ease of Integration for Verifier Applications:**

* Inji Verify offers modular SDK components—Scan/Upload and OpenID4VP Verifiable Presentation (VP) Verification—that enable relying party (verifier) applications to directly integrate VC verification workflows without the need to rely on the full Inji Verify application.
* These plug-and-play TypeScript components are designed for seamless integration with React + TypeScript stacks and support robust Verifiable Credential (VC) verification flows. Each component is distributed as an independent NPM module, promoting modularity, reusability, and ease of integration. A [comprehensive integration guide](../technical-overview/integration-guides/openid4vp-vp-verification-integration-guide.md) is available, covering installation, setup, and usage to streamline the adoption process.
* This flexible, SDK-first approach allows verifiers to rapidly implement VC verification workflows with minimal setup, enabling faster time-to-market for digital identity-enabled services.
* The Inji Verify UI itself serves as a reference implementation—demonstrating how these reusable SDK components can be orchestrated to build a complete verifier application. Developers are encouraged to embed only the components relevant to their needs within their own applications for a more tailored and efficient experience.
* This flexibility empowers developers to accelerate their VC verification implementation with minimal setup, enabling faster time-to-market for digital identity-enabled services.

**Note:** The **Inji Verify SDK- Scan / Upload component** to enable developers to easily embed VC verification capabilities into their verifier (relying party) applications will be coming out in future releases! Stay tuned!

8. **Generate QR Code based VP request for sharing credentials from wallet to Inji Verify for verification in different devices:** The OpenID for Verifiable Presentations (OpenID4VP) standard introduces the VP Token, enabling end-users to present Verifiable Presentations (VPs) to verifiers via a digital wallet. In scenarios where the verifier and the user's wallet operate on separate devices, the process unfolds as follows:​
   1. The verifier formulates an Authorization Request, which is then rendered as a QR code. This QR code encapsulates a Request URI, allowing the wallet to retrieve the complete request data, thereby keeping the QR code concise.
   2. The user scans the QR code using their digital wallet (e.g., Inji Wallet), which fetches the Authorization Request data and prepares the requested credentials. Depending on the wallet's contents, the user can share all or a subset of the requested credentials.​
   3. Utilizing the vp\_token response type and the direct\_post response mode, the wallet securely transmits the VPs directly to the verifier's specified endpoint via an HTTP POST request. ​
   4. Upon receipt, the verifier assesses the authenticity and validity of the presented credentials. The verification results are then displayed within Inji Verify, providing immediate feedback on the credential status.​

This cross-device flow ensures a secure and efficient method for users to share their verifiable credentials across different devices, enhancing both flexibility and user experience in credential verification processes.

9. **Backend Setup and Verification Mechanism :** Inji Verify's backend supports robust and secure verification of Verifiable Credentials (VCs). The integration of the vc-verifier library facilitates server-side verification of VCs, accommodating both Ed25519 (Signature 2018 & 2020) and RSA (Signature 2018) cryptographic standards.To ensure persistent and reliable data storage, the backend has transitioned from an in-memory H2 database to a PostgreSQL database which enhances data durability.
10. **Language Selection:** User can choose from the listed languages for better usability so that the text description and VC result on the UI is displayed based on the chosen language . Inji Verify supports the following international languages: Portuguese, Spanish, French, English, Arabic, Khmer and the following Indian langauges: Tamil, Hindi, Kannada
11. **UI Theme customization:** UI themes can be customized so that any integrators/ country can change the UI theme based on their requirements.
12. **Cross-Platform Compatibility**:
    1. Compatible with a wide range of devices and operating systems, including desktops, mobile devices, and laptops.
    2. A mobile responsive version with back camera capability is now available.
    3. Responsive design ensures optimal performance and usability across different screen sizes and resolutions.
    4. Tablet responsiveness tested on specific devices; still under development.
    5. Accessible from anywhere with an internet connection for convenient on-the-go verification.

*   **Scan Feature QR Code Compatibility**:

    * QR code versions supported for the scan feature range from v22 and below with consistent performance.
    * Versions from v23 to v27 show inconsistent results due to varying data bytes based on the use case for verifiable credentials embedded into the QR code.
    * Versions above v27 are not supported for the scan feature. If you have a QR code version above v27, please use the upload feature to upload the document or QR code for verification.

    **Camera Resolution Requirement**:

    * The device's front, back, or web camera resolution must exceed 12 megapixels.
    * Resolutions below this range result in inconsistent QR code scanning.
    * Cameras should be used in well-lit environments without filters, ensuring proper alignment for optimal scanning.

    **Upload Feature QR Code Compatibility**:

    * QR code versions supported for the upload feature range from v32 and below.

Inji Verify provides a reliable solution for validating and verifying verifiable credentials via QR codes. Its user-friendly interface, robust features, and cross-platform compatibility allow users to confidently verify credentials anytime, anywhere.
