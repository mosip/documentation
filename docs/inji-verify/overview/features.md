# Features

Inji Verify offers a seamless credential verification experience through QR code scanning, upload functionality, and Pixel Pass SDK integration for accurate decoding. Utilizing a robust Verification SDK ensures the authenticity and integrity of credentials. The portal displays credentials accurately based on issuer configurations and handles errors effectively. With a user-friendly, responsive interface, real-time verification, and scalable performance, Inji Verify provides an efficient and flexible verification solution.

Here is a comprehensive summary of the features offered by Inji Verify.

1. **QR Code Scanning:** Inji Verify allows users to easily scan QR codes using their device's camera, enabling swift verification of credentials. For mobile scans, a zoom slider is available now to adjust magnification, enhancing the scanning and verification experience.
2. **Upload QR Code:** Users can upload QR code images directly to the portal for verification, providing flexibility in the verification process.
   * Supports various formats like PDFs and images(JPEG, JPG, and PNG) containing QR codes.
3. **Verifying QR Codes Using OpenID4VP Standards (Online Sharing)**
   * **Streamlined Credential Sharing**: Inji Verify utilizes[ **OpenID4VP**](https://openid.net/specs/openid-4-verifiable-presentations-1_0.html#name-cross-device-flow) standards, embedding a URL in the QR code for online credential sharing, reducing the need for embedding dense Verifiable Credentials (VCs).
   * **Efficient Scanning**: Users can scan the QR code, which directs them to a secure VC storage location like [**Inji Web**](https://docs.mosip.io/inji/inji-web/functional-overview/features#store-verifiable-credentials-vc) or any other platform adhering to OpenID4VP standards.
   * **Secure Authorization Flow**: Upon scanning the QR code, Inji Verify initiates an authorization request, securely retrieving and verifying the credential from Inji Web.
   * **Cross-Device Sharing**: Supports seamless cross-device credential sharing, simplifying verification and minimizing QR code complexity.
   * **Same-Device Sharing**: Inji Verify now supports OpenID4VP Same Device Flow, where both the verifier and wallet operate on the same mobile device.
   * **Docker Compose for Easy Installation**: Simplifies deployment and setup through Docker Compose, allowing quick and efficient installation.
4. **Docker Compose for Easy Installation**: Simplifies deployment and setup through Docker Compose, allowing quick and efficient installation.
5. **Pixel Pass Integration:** Inji Verify seamlessly integrates with Pixel Pass SDK, ensuring accurate decoding of QR code data for verification purposes.
   * PixelPass library now supports decoding of CBOR-encoded QR codes, enabling Inji Verify to verify CBO&#x52;**-**&#x65;ncoded QR codes. However, CBOR encoding capability within the PixelPass library is still under development.
6. **Verification SDK:** The portal utilizes a robust Verification SDK to validate decoded data, ensuring the authenticity and integrity of the credentials.
7. **Credential Display**: Inji Verify retrieves display properties of credentials from the issuer's well-known configuration, ensuring a consistent and accurate representation of credential details.
   * **Valid Credential Display**: These credentials are currently active and verified using the Inji Verify Portal.
   * **Invalid Credential Display**: These credentials are active but invalid.
   * **Expired Credential Display**: These credentials have passed their validity period and are no longer active.
8. **OpenIDVP Cross Device flow**: OpenID for Verifiable Presentations (OpenID4VP) enables users to securely share their Verifiable Credentials (VCs) from their digital wallet with a verifier, even when they are using different devices.

* A verifier requests specific credentials from the user.
* The user’s wallet (on a different device) allows them to share either all or only the available credentials.
* The shared credentials are then verified for authenticity and validity.
* The verification result is displayed on Inji Verify, confirming whether the credentials are valid or not.

This ensures a secure and flexible way of sharing credentials across different devices while maintaining privacy and control over what gets shared.

9. **OpenIDVP Same Device flow**: Inji Verify now supports OpenID4VP Same Device Flow, where both the verifier and mobile wallet operate on the same mobile device.

* The verifier sends an Authorization Request (with `presentation_definition`) via deep link.
* The wallet processes the request, authenticates the user, gathers consent, and returns a `vp_token` via redirect (`response_mode=direct_post`).
* Inji Verify parses the `vp_token`, validates the claims, and displays Verifiable Credential (VC) results (valid, expired, or invalid) with color-coded status.
* Multiple VCs can be displayed in card format, each with expandable details and a JSON download option.
* This enables a seamless, app-like user experience for mobile users without requiring a second device.

10. **Ease of Integrating Modular SDK Components with Verifier Applications**:
   * Inji Verify provides modular SDK components that empower verifier (relying party) applications to seamlessly integrate VC verification workflows—without relying on the full Inji Verify reference application.
   * **Scan/Upload Component** – Enables QR code scanning or file upload for verifying credentials.
   * **OpenID4VP VP Verification Component** – Supports Verifiable Presentation: Cross Device and Same Device flows aligned with the OpenID4VP specification
   * These plug-and-play components are:
     * Developed using TypeScript and Optimized for React environments
     * Published as independent NPM modules to ensure flexibility and reusability
   * This flexibility enables verifiers to easily integrate VC verification into their own UI, use only the modules they need and reduce dependency on the entire Inji Verify codebase
   * The Inji Verify UI is provided as a reference implementation to demonstrate how the SDK components can be orchestrated in a full-fledged verifier application. It is not required for adoption. Developers are encouraged to go through step-by-step [integration guide](../technical-overview/integration-guides/openid4vp-vp-verification-integration-guide.md) and selectively embed only the components relevant to their business needs.

**Note**: Inji Verify SDK components supports React version- 18.2.0

11. **Backend Setup**: Inji Verify's backend supports robust and secure verification of Verifiable Credentials (VCs). The integration of the vc-verifier library facilitates server-side verification of VCs, accommodating both Ed25519 (Signature 2018 & 2020) and RSA (Signature 2018) cryptographic standards. To ensure persistent and reliable data storage, the backend has transitioned from an in-memory H2 database to a PostgreSQL database which enhances data durability.
12. **Language Selection**: User can choose from the listed languages for better usability such that the text description and VC result on the UI is displayed based on the chosen language. Inji Verify supports the following international languages which includes Portuguese, Spanish, French, English, Arabic, Khmer and the Indian vernacular langauges includes Tamil, Hindia and Kannada.
13. **UI Theme customization**: UI themes can be customized so that any integrators/ country can change the UI theme based on their requirements.
14. **Server setup for VC and VP proof Verification**: Server setup for VC and VP proof Verification: The vc-verifier library has been integrated into Inji Verify to enable server-side verification of both Verifiable Credentials (VCs) and Verifiable Presentations (VPs) which supports key types: `Ed25519VerificationKey2018`, `Ed25519VerificationKey2020`, and `RSAVerificationKey2018` .
15. **Error Handling:** The portal features comprehensive error handling mechanisms, guiding users in case of invalid QR codes, or expired QR codes and decoding failures.
16. **User-friendly Interface**: Inji Verify offers an intuitive interface, providing a seamless experience for users to navigate and verify credentials effortlessly. The new version includes a responsive design for mobile devices across various browsers, enhancing the ease of exploring, scanning, and uploading features.
17. **Real-time Verification:** Users can verify credentials in real time, ensuring prompt validation and reducing verification delays.
18. **Scalability:** Inji Verify is designed to scale efficiently, accommodating growing user demands and ensuring optimal performance under varying load conditions.

{% hint style="warning" %}
**Note**: Currently the scope of VCs that can be verified are:

* VCs adhering to **W3C VC Data Model** 1.1 and 2.0 standards, promoting interoperability and adherence to industry specifications.
* **Algorithms** supported: Ed25519 Verification Key 2018, Ed25519 Verification Key 2020, RSA Verification Key 2018
* **VC format** support: JSON-LD
* **Verification methods** supported:
  * verificationMethod is `did:web` and in combination with proofValue or jws\
    \*verificationMethod is `https://` and in combination with proofValue or jws
{% endhint %}

For more detailed information on each step and the underlying systems, click [**here**](../functional-overview/workflow.md)**.**



<!-- 

## Additional Technical Specifications and Compatibility

19. **Cross-Platform Compatibility**:
    1. Compatible with a wide range of devices and operating systems, including desktops, mobile devices, and laptops.
    2. A mobile responsive version with back camera capability is now available.
    3. Responsive design ensures optimal performance and usability across different screen sizes and resolutions.
    4. Tablet responsiveness tested on specific devices; still under development.
    5. Accessible from anywhere with an internet connection for convenient on-the-go verification.

20. **QR Code Version Compatibility and Technical Requirements**:

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

21. **Enhanced Security and Data Protection**:
    * Inji Verify employs encryption techniques to protect sensitive information and prevent tampering.
    * Advanced algorithms and cryptographic methods ensure that QR codes have not been tampered with.
    * Utilizes [**pixel pass library v0.5.0**](https://www.npmjs.com/package/@mosip/pixelpass/v/0.5.0) for secure QR code processing.
    * Real-time verification provides instant feedback on credential validity, giving users confidence in authenticity.

22. **Future SDK Development Roadmap**:

{% hint style="info" %}
**Note:** The **Inji Verify SDK- Scan / Upload component** to enable developers to easily embed VC verification capabilities into their verifier (relying party) applications will be coming out in future releases! Stay tuned!
{% endhint %}

-->