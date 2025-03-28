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
   * The verification result is displayed on Inji Verify confirming whether the credentials are valid or not.

This ensures a secure and flexible way of sharing credentials across different devices while maintaining privacy and control over what gets shared.

9. **Language Selection**: User can choose from the listed languages for better usability such that the text description and VC result on the UI is displayed based on the chosen language. Inji Verify supports the following international languages which includes Portuguese, Spanish, French, English, Arabic, Khmer and the Indian vernacular langauges includes Tamil, Hindia and Kannada.

10. **UI Theme customization**: UI themes can be customized so that any integrators/ country can change the UI theme based on their requirements.

11. **Server setup for VC Verification**: The vc-verifier library has been integrated into Inji Verify to enable server-side verification of Verifiable Credentials (VCs) using Ed25519  key signatures 2018, 2020 and RSA key signature 2018.

12. **Error Handling:** The portal features comprehensive error handling mechanisms, guiding users in case of invalid QR codes, or expired QR codes and decoding failures.
13. **User-friendly Interface**: Inji Verify offers an intuitive interface, providing a seamless experience for users to navigate and verify credentials effortlessly. The new version includes a responsive design for mobile devices across various browsers, enhancing the ease of exploring, scanning, and uploading features.
14. **Real-time Verification:** Users can verify credentials in real time, ensuring prompt validation and reducing verification delays.
15. **Scalability:** Inji Verify is designed to scale efficiently, accommodating growing user demands and ensuring optimal performance under varying load conditions.


**Note**: Currently the scope of VCs that can be verified are:

   * VCs adhering to **W3C VC Data Model** 1.1 and 2.0 standards, promoting interoperability and adherence to industry specifications.
   * **Algorithms** supported: Ed25519 Verification Key 2018, Ed25519 Verification Key 2020, RSA Verification Key 2018
   * **VC format** support: JSON-LD
   * **Verification methods** supported:
      * verificationMethod is `did:web` and in combination with proofValue or jws
      *verificationMethod is `https://` and in combination with proofValue or jws


For more detailed information on each step and the underlying systems, click [**here**](workflow.md)**.**
