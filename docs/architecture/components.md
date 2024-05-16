# Components

Inji Mobile utilizes multiple libraries to provide a seamless experience.

These libraries are accessible as NPM modules, allowing seamless integration with other mobile wallets.

The libraries are as follows:

1. Tuvali - Sharing via BLE
2. Face Match
3. Secure Keystore
4. BLE Verifier
5. PixelPass
6. Telemetry (coming soon)

#### **1. Tuvali - Sharing via BLE**

* The transfer of downloaded Verifiable Credential from the Wallet to Verifier is facilitated by a React Native library named Tuvali.
* [Tuvali](https://github.com/mosip/tuvali) enables offline VC transfer between mobile devices via Bluetooth Low Energy (BLE).\
  \
  The below table represents the supported roles for Android and iOS devices.

<table><thead><tr><th width="134">Wallet</th><th width="131">Verifier</th><th>VC transfer support</th></tr></thead><tbody><tr><td>Android</td><td>Android</td><td>Yes</td></tr><tr><td>iOS</td><td>Android</td><td>Yes</td></tr><tr><td>Android</td><td>iOS</td><td>No</td></tr><tr><td>iOS</td><td>iOS</td><td>No</td></tr></tbody></table>

* Tuvali is actively developed and maintained by MOSIP.
* It does not support iOS for initiating the BLE exchanges, hence preventing two iOS devices from transferring VC.

**Note**:

* To learn more about Tuvali's implementation, refer [here](https://docs.mosip.io/inji/integration-guide/tuvali).
* For information on Tuvali's permissions and requirements, refer [here](https://docs.mosip.io/inji/integration-guide/tuvali/tuvali-requirements).
* To understand Tuvali and Inji Mobile integration, along with API documentation, refer[ here](https://docs.mosip.io/inji/integration-guide/tuvali/tuvali-inji).
* To check the NPM module, click [here](https://www.npmjs.com/package/@mosip/tuvali).

#### **2. Face Match**

The face matcher SDK internally implements native functionalities for Android and iOS, utilizing [Tensorflow](https://www.tensorflow.org/) and [Google ML Kit](https://developers.google.com/ml-kit) to identify faces.

This SDK internally employs a `tflite` model, which must be created by the integrating party. The model, trained using resident faces, is stored on the MOSIP file server. Inji Mobile currently utilizes the face matcher SDK (soon to be replaced by the NPM module) for offline face authentication.

The SDK is employed in two scenarios:

**During Offline VC Sharing**: Residents can perform selfie authentication before sharing the VC with the relying party. The app opens the camera, allowing residents to take a selfie, which is then validated against the VC image to verify the resident's presence.\
\
**During Online Login**: Residents can scan the QR code from the relying party portal and opt to log in using Inji Mobile for services. In this process, residents undergo selfie authentication against the VC to confirm their presence.

Upon the initial launch of Inji Mobile, the model is downloaded in the background and stored in the cache. Refer [here](../integration-guide/face-match.md) to check the API specifications for the face matcher model.

### **3. Secure Keystore**

The [secure-keystore](https://github.com/mosip/secure-keystore) library is a module in the React Native framework. It is designed for the purpose of creating and storing key-pairs in the hardware keystore of Android devices. The library also supports encryption, decryption, and HMAC calculation functionalities.

It also helps to sign with aliases, created as part of key pair generation.

As the description says, this module is only for Android devices which support hardware keystore.

To check all the APIs supported by this module, refer [here](https://github.com/mosip/secure-keystore/blob/develop/src/interface.ts).

**Note**:

* This feature is exclusive to the Android operating system.
* It is only compatible with devices that have a hardware keystore.
* To check the NPM module, click [here](https://www.npmjs.com/package/@mosip/secure-keystore).

### **4. BLE Verifier**

The [BLE Verifier](https://github.com/mosip/ble-verifier-sdk/tree/develop) is the module built for verifiers for receiving VC via BLE. This is a wrapper built on Tuvali with simplified APIs.

To know more about API and how to integrate, refer [here](../integration-guide/ble-verifier.md).

**Note**:

* To check the NPM module, click [here](https://www.npmjs.com/package/@mosip/ble-verifier-sdk).

### 5. PixelPass

PixelPass library creates a QR code for the given Verifiable Credentials data which is of smaller size. The library uses zlib compression and base45 encoding. In addition, PixelPass can also Decode QR data encoded by the library. The library is actively developed and maintained by MOSIP.

{% hint style="info" %}
Note:&#x20;

* Refer to the PixelPass repository [here](https://github.com/mosip/pixelpass/tree/develop/js#readme).
* To understand about the installation and the API documentation, refer [here](../inji-mobile-wallet/integration-guide/pixelpass.md).
* For a hands-on experience of Generate a VC, Generate QR Code for the VC and Verify the same using Inji Verify, please click [here](https://docs.mosip.io/inji/inji-verify/build-and-deploy/creating-verifiable-credentials-and-generating-qr-codes).
* To check the NPM module, click[ here](https://www.npmjs.com/package/@mosip/pixelpass).
{% endhint %}

### **6. Telemetry**

The [telemetry](https://github.com/mosip/sunbird-telemetry-sdk) module is derived from the [sunbird telemetry](https://github.com/project-sunbird/sunbird-telemetry-sdk) module. It is responsible for generating events that can provide valuable analytics.

_**Note**_: _The publication of this project is currently a work in progress and has not been released yet. Stay tuned for further announcements!_

> To know more about each of these, refer [Integration Guides](https://docs.mosip.io/inji/integration-guide).
