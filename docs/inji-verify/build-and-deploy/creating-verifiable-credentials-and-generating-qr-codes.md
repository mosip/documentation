# Creating Verifiable Credentials and Generating QR Codes

#### This guide outlines the process of generating a verifiable credential from the Sunbird Registry, converting it into a QR code, and verifying the QR code online.

#### **Steps to Generate Verifiable Credential:**

1. **Install Inji Certify**: Follow the installation guide available on the [**Github Repository**](https://github.com/mosip/inji-certify/tree/v0.8.0?tab=readme-ov-file).
2. **Generate Verifiable Credential**: By following the provided documentation, users will be able to generate a Verifiable Credential in JSON-LD format using Inji Certify.

#### **Steps to Generate QR Code:**

1. **Create a Sample Node Application**: Begin by creating a sample Node.js application.
2. **Add npm**: Integrate the npm package i.e. [**pixel pass library** ](https://www.npmjs.com/package/@mosip/pixelpass/v/0.1.4)into the web-based application.
3. **Generate QR Code**: Copy the credential body (value of **'credential'** from the credential response) obtained from the generated credential in Inji Certify. Pass this as a data parameter to the generateQRCode function.&#x20;
   1. Detailed generation steps are available on the [**Github repository**](https://github.com/tw-mosip/pixelpass/blob/develop/js/Readme.md). This function returns the PNG data of the QR code.
4. **Save QR Code Image**: Copy the image data and paste it into the browser URL. Save the QR code image.

#### **Steps to Verify QR Code:**

The below steps are valid once it is deployed in your local system by following the[ **local setup guide.**](https://docs.mosip.io/inji/inji-verify/build-and-deploy/local-setup)

1. **Open Inji Verify Portal**: Access the Inji Verify portal in your browser once it is deployed in your local setup
2. **Upload QR Code**: Select the 'upload QR code' option and upload the QR code retrieved from the Pixelpass integrated app. To see how the upload feature works you can refer to our [**end-user guide**](https://docs.mosip.io/inji/inji-verify/functional-overview/end-user-guide).
3. **Verify QR Code**: If the QR code is valid, credentials will be displayed along with a success message.

By following these steps, users can seamlessly generate and verify verifiable credentials using the [**Sunbird Registry**](https://rc.sunbird.org/api-reference/registry) and associated tools.
