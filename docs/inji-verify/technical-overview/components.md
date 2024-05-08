# Components

* **Inji Verify** serves as a verification platform for verifiable credentials, offering an intuitive web portal designed to streamline the process of verifying VC for users.
* **Technical Components of Verify:** The following component diagram illustrates the structure and components of Inji Verify. It offers a comprehensive explanation of how the platform operates and how its various elements interact to deliver its functionalities.

<figure><img src="../../.gitbook/assets/Inji Verify Arch 2 (1).jpg" alt=""><figcaption></figcaption></figure>

### Components:

Let's briefly explore the key components that constitute Inji Verify:

1. **Inji Verify:** This is the user-facing web portal developed on React. It serves as the primary interface for users to verify Verifiable Credentials.&#x20;
   1. Inji Verify offers functionalities for both scanning QR codes and uploading QR code files. Users interact with the portal to initiate the verification process and view the results.
2. **Pixel-Pass Library:** The [**Pixel-Pass Library**](https://www.npmjs.com/package/@mosip/pixelpass/v/0.1.4) is a set of software tools and utilities designed to assist in the decoding of QR codes. It provides functions and algorithms to interpret the data encoded within QR codes accurately.&#x20;
   1. The [**Pixel-Pass Library**](https://www.npmjs.com/package/@mosip/pixelpass/v/0.1.4) is integrated into Inji Verify to handle the decoding of QR code data received from scanned images or uploaded files.
3. **Pixel-Pass SDK:** The Pixel-Pass SDK is a comprehensive package of software tools, and libraries provided to developers to facilitate the integration of Pixel-Pass functionality into their applications.&#x20;
   1. In the context of Inji Verify, the Pixel-Pass SDK is utilized to pass the decoded data for verification to the SDK.
4. **Verification SDK:** The Verification SDK is a software toolkit used for verifying the authenticity and validity of Verifiable Credentials. It contains algorithms, cryptographic functions, and validation methods required to ensure the integrity of credential data.
   1. The Verification SDK is employed within Inji Verify to perform verification checks on the decoded data obtained from QR codes. It validates the information against predefined criteria and standards to determine the legitimacy of the presented credentials and shows the VC properties.
