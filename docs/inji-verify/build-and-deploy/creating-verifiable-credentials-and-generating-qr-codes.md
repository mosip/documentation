# Generate QR Code

This guide will assist in creating a verifiable credential from an existing data source, converting it into a QR code, and then verifying the QR code online.

#### **Steps to Generate Verifiable Credential:**

1. **Install Inji Certify**: Follow the installation guide available on the [**Github Repository**](https://github.com/mosip/inji-certify/tree/v0.8.0?tab=readme-ov-file).
2. **Generate Verifiable Credential**: By following the provided documentation, users will be able to generate a verifiable credential in JSON-LD format using Inji Certify.
3. Copy the credential body(value of 'credential' from credential response) from the generated credential from Inji Certify to pass it as a data parameter to `generateQRCode` from Pixelpass library.&#x20;

#### **Steps to Generate QR Code:**

1. Steps to create QR code using node -
   * Create a directory and npm init
   * npm install @mosip/pixelpass
   * Enter node shell -&#x20;
   * `const {generateQRData} = require('@mosip/pixelpass')`
   * `generateQRCode(JSON.stringify(JSON.parse(<credential_data>)))`
2. **Save QR Code Image**: Copy the image data and paste it into the browser URL. Save the QR code image.

#### **Steps to Verify QR Code:**

The below steps are valid once it is deployed in your local system by following the[ **local setup guide.**](https://docs.mosip.io/inji/inji-verify/build-and-deploy/local-setup)

1. **Open Inji Verify Portal**: Access the Inji Verify portal in your browser once it is deployed in your local setup.
2. **Upload QR Code**: Select the 'upload QR code' option and upload the QR code retrieved from the Pixelpass integrated app. To see how the upload feature works you can refer to our [**end-user guide**](https://docs.mosip.io/inji/inji-verify/functional-overview/end-user-guide).
3. **Verify QR Code**: If the QR code is valid, credentials will be displayed along with a success message.
