# Features

Inji Verify offers a seamless credential verification experience through QR code scanning, upload functionality, and Pixel Pass SDK integration for accurate decoding. Utilizing a robust Verification SDK ensures the authenticity and integrity of credentials. The portal displays credentials accurately based on issuer configurations and handles errors effectively. With a user-friendly, responsive interface, real-time verification, and scalable performance, Inji Verify provides an efficient and flexible verification solution.

Here is a comprehensive summary of the features offered by Inji Verify.

1. **QR Code Scanning:** Inji Verify allows users to easily scan QR codes using their device's camera, enabling swift verification of credentials.
2. **Upload QR Code:** Users can upload QR code images directly to the portal for verification, providing flexibility in the verification process.
   * Supports various formats like PDFs and images(JPEG, JPG, and PNG) containing QR codes.
3. **Pixel Pass Integration:** Inji Verify seamlessly integrates with Pixel Pass SDK, ensuring accurate decoding of QR code data for verification purposes.
   * PixelPass library now supports decoding of CBOR-encoded QR codes, enabling Inji Verify to verify CBOR**-**encoded QR codes. However, CBOR encoding capability within the PixelPass library is still under development.
4. **Verification SDK:** The portal utilizes a robust Verification SDK to validate decoded data, ensuring the authenticity and integrity of the credentials.
5. **Credential Display**: Inji Verify retrieves display properties of credentials from the issuer's well-known configuration, ensuring a consistent and accurate representation of credential details.
   * **Valid Credential Display**: These credentials are currently active and verified using the Inji Verify Portal.
   * **Invalid Credential Display**: These credentials are active but invalid.
   * **Expired Credential Display**: These credentials have passed their validity period and are no longer active.
6. **Error Handling:** The portal features comprehensive error handling mechanisms, guiding users in case of invalid QR codes, or expired QR codes and decoding failures.
7. **User-friendly Interface**: Inji Verify offers an intuitive interface, providing a seamless experience for users to navigate and verify credentials effortlessly. The new version includes a responsive design for mobile devices across various browsers, enhancing the ease of exploring, scanning, and uploading features.
8. **Real-time Verification:** Users can verify credentials in real time, ensuring prompt validation and reducing verification delays.
9. **Scalability:** Inji Verify is designed to scale efficiently, accommodating growing user demands and ensuring optimal performance under varying load conditions.

For more detailed information on each step and the underlying systems, click [**here.**](https://mosip.atlassian.net/wiki/spaces/PROD/pages/1297121401/Inji+Verify+Workflow)
