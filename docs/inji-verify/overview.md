# Overview

## **Pioneering Verifiable Credential Validation with Inji Verify**

**Inji Verify** stands out as a robust verification tool specifically designed to validate the verifiable credentials encoded in QR codes through an intuitive web portal interface. The process involves decoding the data stored within the QR code using the PixelPass library and subsequently validating the verifiable credential. These credentials represent a digitally secured version of both traditional paper and digital credentials, ensuring a secure and reliable method of verification across various industries and use cases.

**Certainly! Here's how the use cases for Inji Verify can be presented as given below:**

<table><thead><tr><th width="349">Use-Case</th><th>       Description</th></tr></thead><tbody><tr><td><strong>Education Sector</strong></td><td><ul><li><strong>Digital Certificates:</strong> Verify academic achievements and certificates issued by educational institutions using QR codes.</li></ul></td></tr><tr><td></td><td><ul><li><strong>Transcripts</strong>: Easily verify academic records and transcripts encoded in QR codes for admissions and employment purposes.</li></ul></td></tr><tr><td><strong>Healthcare Industry</strong></td><td><ul><li><strong>Medical Records:</strong> Securely verify patient medical records through QR codes, ensuring accuracy and privacy in healthcare settings.</li></ul></td></tr><tr><td></td><td><ul><li><strong>Prescription Verification:</strong> Verify prescriptions digitally encoded in QR codes to prevent errors and ensure medication safety.</li></ul></td></tr><tr><td><strong>Employment Verification</strong></td><td><ul><li><strong>Employee Credentials:</strong> The issued QR codes with verifiable employment credentials like job roles, certifications, and performance evaluations for HR verification.</li></ul></td></tr><tr><td><strong>Government Services</strong></td><td><ul><li><strong>Identity Verification:</strong> Provide digital IDs and licenses in QR codes for secure identity verification in government services and benefits access.</li></ul></td></tr><tr><td></td><td><ul><li><strong>Permits and Licenses:</strong> Verify permits, licenses, and regulatory compliance through QR codes, reducing administrative burdens.</li></ul></td></tr><tr><td><strong>Financial Transactions</strong></td><td><ul><li><strong>Banking Verification:</strong> Verify banking statements and financial records through QR codes for enhanced security in financial transactions.</li></ul></td></tr><tr><td><strong>Event Ticketing</strong></td><td><ul><li><strong>Digital Tickets:</strong> Use QR codes as digital tickets for events, concerts, and conferences to verify ticket validity and prevent unauthorized entry.</li></ul></td></tr><tr><td><strong>Supply Chain Management</strong></td><td><ul><li><strong>Product Authentication:</strong> Verify the authenticity and origin of products throughout the supply chain using QR codes, combating counterfeiting.</li></ul></td></tr><tr><td><strong>Travel and Hospitality</strong></td><td><ul><li><strong>Digital Passports:</strong> Use QR codes as digital passports or travel documents to facilitate seamless border control and verify traveler identities.</li></ul></td></tr></tbody></table>

In each scenario, Inji Verify leverages QR codes embedded with verifiable credentials to ensure secure and efficient verification across diverse sectors and applications.

**Key Components of Verifiable Credentials:**

1. **Credential Metadata:** Includes essential properties like the credential identifier, expiry date, and issuer information, all cryptographically signed by the issuer.
2. **Claims:** Immutable set of claims made about the credential subject, such as employee number and job title.
3. **Proofs:** Utilizes cryptographic methods to verify the data source and ensure data integrity.

#### **Benefits of Using Inji Verify for Seamless and Secure Credential Verification:**

* **Interoperability:**
  * Inji Verify integrates seamlessly with a wide range of existing platforms, including employee portals, health portals, agricultural portals, and more. It can be added as an additional layer to existing verifier systems, ensuring smooth interaction between users, and verifiers across different platforms and verification frameworks. This flexibility enhances compatibility and streamlines the verification process without disrupting current systems.
* **Modularity:**
  * The modular design of Inji Verify allows for easy customization and the addition of new features, ensuring flexibility to adapt to specific industry needs.
  * Each module functions independently, enabling seamless updates and scalability without affecting the core functionality of the system.
* **Enhanced Security with Verifiable QR Codes:**
  * Verifiable QR codes utilize digital signatures to safeguard the authenticity and integrity of the data, ensuring secure handling of sensitive information such as personal IDs, financial records, and medical data.
* **Seamless PixelPass library Integration:**
  * The integration of the [**PixelPass**](https://www.npmjs.com/package/@mosip/pixelpass/v/0.5.0) library enables Inji Verify to efficiently decode CBOR-encoded QR codes, ensuring a smooth and reliable verification process.
* **Optimized Device Requirements for Scanning:**
  * To ensure accurate and reliable verification, devices used for scanning QR codes should meet certain criteria, including:
    * A camera with at least 12 megapixels and 1020p quality.
    * Scanning without visual effects or enhancements.
    * Browser compatibility for camera access.
    * Adequate lighting conditions without filters or dark mode.
* **QR Code Version Compatibility:**
  * For successful verification using the scan feature, the verifiable credential (VC) should be encoded in QR code versions 27 and below.

#### **Usage of Inji Verify:**

Inji Verify offers a comprehensive set of features tailored to meet the verification needs of both users and relying parties:

* **QR Code Scanning:** Users can easily scan QR codes embedded within documents using their devices.
* **QR Code Uploading:** Alternatively, users can upload QR codes or documents which has the QR code printed on them for verification, providing flexibility in the verification process.
* **Verifying QR Codes Using OpenID4VP Standards(Online Sharing):**
  * **Streamlined Credential Sharing**: Inji Verify uses OpenID4VP standards for online sharing, embedding a URL in the QR code instead of dense Verifiable Credentials (VCs).
  * **Efficient Scanning**: Users can scan the QR code, which points to a secure VC storage location like [**Inji Web**](https://docs.mosip.io/inji/inji-web/functional-overview/features#store-verifiable-credentials-vc) or any similar portal like Inji Web which adheres to OpenIDVP standards.
  * **Secure Authorization Flow**: Upon scanning, Inji Verify initiates an authorization request, retrieving and verifying the credential securely from Inji Web.
  * **Cross-Device Sharing**: Supports cross-device sharing, reducing QR code complexity and enabling seamless verification.
  * **Enhanced User Experience**: Simplifies the verification process, ensuring efficient and secure credential validation.

#### **Future Implementations Planned for Inji Verify**

* **Online Verification using OpenID4VP Flow**:\
  Inji Verify is planning to implement a streamlined online verification process using the [**OpenID4VP**](https://openid.net/specs/openid-4-verifiable-presentations-1\_0.html#name-cross-device-flow) flow. The Verifier prepares an Authorization Request and renders it as a QR code, which the User (Holder) scans using their wallet, such as Inji Wallet. This process utilizes the response type vp\_token along with the response mode direct\_post, ensuring a secure exchange of credentials. To keep the QR code compact and secure, the actual Authorization Request includes only a Request URI, which the wallet uses to retrieve the full request data. This streamlined online verification process allows users to maintain privacy while providing cryptographic proof of their credentials.
* **Offline Verification using BLE Technology**:\
  Future updates will also include the ability to verify credentials offline using Bluetooth Low Energy (BLE) technology, adhering to OpenID standards. This approach is designed for environments where internet connectivity is limited or unavailable. Holders can share their credentials with verifiers via BLE, allowing for quick and secure credential validation without the need for an online connection. This offline solution will ensure flexibility and accessibility in remote or network-constrained areas, expanding the use cases for Inji Verify in various sectors.

#### **Conclusion**

Inji Verify is a powerful tool for securely verifying credentials encoded in QR codes. With an easy-to-use interface and features like QR code scanning, file uploads, and support for CBOR encoded and JSON-LD QR codes via PixelPass, it provides reliable credential verification across industries. Using cryptographic methods and standardized formats, Inji Verify ensures the authenticity of credentials, making verification simple and trustworthy for both users and service providers. Future updates will include offline verification, and enhancing security and privacy with advanced OpenID standards.
