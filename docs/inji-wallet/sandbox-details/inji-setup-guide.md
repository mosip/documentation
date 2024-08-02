# Inji Wallet Setup Guide

Welcome to the Inji Wallet Setup Guide tailored specifically for our Collab Environment! This guide is designed to assist you in setting up and configuring the [**Inji Wallet**](https://docs.mosip.io/inji) wallet app in our sandbox Collab environment. By following the steps outlined in this guide, you will be able to smoothly install and utilize the Inji Wallet app, empowering you to explore its features and functionalities effectively. Whether you're a Developer, System Integrator, or an enthusiast eager to dive into the world of digital identity, this guide will provide you with the necessary information to get started with Inji Wallet in our [**Collab**](https://collab.mosip.net/) environment. Let's begin this journey of seamless setup and exploration!

### Pre-requisites

Before you start with setting up Inji Wallet, ensure you have the following in place.

1. Inji Wallet APK File: 
   * If you are using an Android smartphone, click [here](https://drive.google.com/drive/folders/1SRHhFxQBNfOc-cdPU8VlKecIdc-WkuGZ) to get the Inji Wallet `apk` file for installation.
   * Transfer the `apk` file onto the smartphone on which it is to be installed.
2. Inji Wallet Test Flight Access: 
   * If you are using an iOS device, fill out the [form](https://docs.google.com/forms/d/e/1FAIpQLSd\_P4OMwimjTxGlJ2bfLob2TIt9UaaZDQF3sBO74e9TBST-vQ/viewform) here to get access to the Inji Wallet app on test flight.
     * Ensure you have downloaded the test flight application from your app store
   * You will receive an email on the email ID (associated to the Apple ID) provided in the form.
   * Follow the instructions in the email and access Inji Wallet from the iOS device on which it has to be installed.
3.  UIN Credentials:

    * Issuance of UIN (Unique identification number) as a demo credential will allow you to explore Inji Wallet’s capabilities and experience seamless VC sharing firsthand.
    * Fill out the [form ](https://docs.google.com/forms/d/e/1FAIpQLSc2I0CQqlYRIrEmcJ3J3tKlYOVNcYNj88YZe4MMwU2RZTrjOA/viewform)here and we will generate the demo credentials, which you can use subsequently on the Inji Wallet app to download and share Verifiable Credentials (VCs).

    _Note_: Please use 111111 as the OTP, for any OTP based feature in Collab environment.
4. For sample Insurance Credentials, please provide the below details in the eSignet authentication page:
   * Policy Number: 170-620-124
   * Name: Abhishek G
   * DoB: 07/07/1995

### Step-by-Step Process

To effectively set up the Inji Wallet app and manage Verifiable Credentials (VCs), follow these detailed steps:

**Step 1: Install the Inji Wallet Resident App**

1. For a step-by-step guide on how to install the Inji Wallet application, click [here](../end-user-guide.md).
2. You can visit this [section](https://docs.mosip.io/inji/inji-mobile-wallet/end-user-guide#installing-inji-mobile) for more detailed instructions in the guide.

**Step 2: Install the Inji Wallet App - To be used as Verifier App**

1. Follow the same installation process mentioned above in step 1.
2. Setup another instance of the Inji Wallet app on an android device, which can serve as the Verifier app.

**Step 3: Download National ID VC Using UIN/VID**

1. Download your credential (VC) onto the app by using your demo UIN.
2. To learn how to download VCs using the Unique Identification Number (UIN) or Virtual ID (VID) feature, click [here](../end-user-guide.md#id-1.-download-national-id-mosip-vc). Refer to the section titled `Download credentials using UIN / VID` feature in the guide .

**Step 4**: **Download Insurance Credentials Using Policy Details**

* Refer to the sample insurance credentials under 'Prerequisites' section.
* Refer [here](../end-user-guide.md#id-2.-download-insurance-vc) for step-wise download.
* You can view the QR Code for insurance credentials in the detailed view.

**Step 5: Start Sharing the Credentials**

1. **Quick Share**
   * To understand the process of sharing credentials from the Resident app to the Verifier app, click [here](../end-user-guide.md#sharing-credentials).
   * Navigate to the section titled `Sharing Credentials` for detailed instructions.
2. **Share with Face Verification**
   * Discover how to share credentials with the added security of face verification by clicking [here](../end-user-guide.md#share-share-with-selfie-from-home-page-quick-access-menu).
   * Refer to the section titled `Face Authentication Flow` for a step-by-step guide.

### Creating your own credentials

This section outlines the process of creating your own insurance credentials, generating a QR code, and verifying the QR code using Inji Verify.

**Step 1: Creation**:&#x20;

Inji Certify also offers to generate your own credentials which can be used for testing / development purposes.

To understand the steps to generate your own Insurance credentials, refer [here](https://docs.mosip.io/inji/inji-verify/build-and-deploy/creating-verifiable-credentials-and-generating-qr-codes#steps-to-generate-verifiable-credential).&#x20;

**Step 2: QR Code generation**:

Using Inji Wallet app you can get the QR Code for Insurance Credentials

To generate a QR Code using PixelPass library, please refer to the steps [here](https://docs.mosip.io/inji/inji-verify/build-and-deploy/creating-verifiable-credentials-and-generating-qr-codes#steps-to-generate-qr-code).'

**Step 3: QR Code verification**:

The above generated QR Code can be verified using Inji Verify, by uploading the QR Code. To know more, please click [here](https://docs.mosip.io/inji/inji-verify/build-and-deploy/creating-verifiable-credentials-and-generating-qr-codes#steps-to-verify-qr-code).&#x20;



### Additional Resources

Watch this informative video titled [**Inji Wallet Product Demo to Download and Share VC**](https://youtu.be/JWxJfHMVMFI?si=\_VtK4\_MaIcs0f\_Yh) for a visual walkthrough of the features.

Click [here](https://docs.mosip.io/inji) for detailed information about Inji Wallet.

> By following these instructions, you will be equipped to seamlessly set up the Inji Wallet application and effectively share your Verifiable Credentials.

### Get In Touch

If you require any assistance or encounter any issues during the testing and integration process, kindly reach out to us through the support mechanism provided below.

* Navigate to [Community](http://community.mosip.io/).
* Provide a detailed description about the support you require or provide detailed information about the issue you have encountered, including steps to reproduce, error messages, logs and any other relevant details.

_Thank you. Wishing you a pleasant experience!_
