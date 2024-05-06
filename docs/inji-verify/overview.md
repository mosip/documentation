# Inji Verify: Overview

## **Pioneering Verifiable Credential Validation with Inji Verify**

**Inji Verify** serves as a robust validation tool designed to authenticate verifiable credentials embedded in QR codes through a user-friendly web portal interface. The process involves matching the data stored within the QR code, decoding it using the pixelpass library, and subsequently validating the variable credential. Verifiable Credentials represent a digital and cryptographically secured version of both paper and digital credentials, ensuring a secure and trustworthy method of verification across various industries and scenarios.

**Key Components of Verifiable Credentials:**

1. **Credential Metadata:** Contains essential properties such as the credential identifier, expiry date, and issuer information, cryptographically signed by the issuer.
2. **Claims:** Tamper-proof set of claims made about the credential subject, such as employee number and job title.
3. **Proofs:** Cryptographic methods enable verification of the data source and ensure data integrity.

**Importance of Interoperability:** Interoperability plays a crucial role in the realm of Verifiable Credentials, facilitating seamless sharing and verification across different systems and organizations. Standardized formats ensure efficiency, security, and reliability in the verification process, akin to the universal acceptance of a passport standard among countries.

**Usage of Inji Verify:** Inji Verify offers a range of features tailored to meet the verification needs of users and relying parties:

* **Scanning of QR Code:** Users can utilize the scan feature to capture QR codes embedded within documents.
* **Uploading of QR Code:** Alternatively, users have the option to upload QR codes for verification purposes.

**Verifiable QR Codes:**

* Verifiable QR codes employ digital signatures to ensure the authenticity and integrity of the data contained within them, offering enhanced security.
* They are utilized for sensitive information such as personal identification details, financial records, and medical data.
* Verifiable QR codes contain embedded verifiable credentials, providing cryptographic proof of their authenticity and trustworthiness.

**Device Requirements:** To ensure successful authentication and verification, devices used for scanning QR codes must meet specific requirements:

* Camera with a minimum photo quality of 720p and image resolution of 8 to 16 megapixels.
* Disabling of visual effects and enhancements during scanning.
* Compatibility with Internet browsers supporting the use of the device's camera.
* Scanning is to be performed in a well-lit environment without any filters or dark mode settings.

**QR Code Version Compatibility:** To ensure successful verification specifically for the scan feature the VC should be encoded in QR code version 21 and version 22 with a VC character limit of 1500.

**Conclusion:** Inji Verify empowers users with a reliable and secure means of verifying verifiable credentials embedded within QR codes, ensuring data integrity and trustworthiness across diverse use cases and industries. By adhering to standardized formats and leveraging cryptographic methods, Inji Verify sets a new standard for digital credential verification.
