# Components

Inji utilizes multiple libraries to provide a seamless experience.

These libraries are accessible as NPM modules, allowing seamless integration with other mobile wallets.&#x20;

The libraries are as follows:\

1. &#x20;NPM module for sharing via BLE
2. &#x20;NPM module for matching faces
3. &#x20;NPN module for using secure keystore
4. &#x20;NPM module of Telemetry (coming soon)


#### **1. NPM Module for Sharing via BLE** ([Tuvali](https://www.npmjs.com/package/mosip-react-native-tuvali))

* The transfer of downloaded Verifiable Credential from the Wallet to Verifier is facilitated by a React Native library named Tuvali.
* [Tuvali](https://github.com/mosip/tuvali) enables offline VC transfer between mobile devices via Bluetooth Low Energy (BLE).\
  \
  The below table represents the supported roles for Android and iOS devices.

<table><thead><tr><th width="134">Wallet</th><th width="131">Verifier</th><th>VC transfer support </th></tr></thead><tbody><tr><td>Android</td><td>Android</td><td>Yes</td></tr><tr><td>iOS</td><td>Android</td><td>Yes</td></tr><tr><td>Android</td><td>iOS</td><td>No</td></tr><tr><td>iOS</td><td>iOS</td><td>No</td></tr></tbody></table>

* Tuvali is actively developed and maintained by MOSIP.
* It does not support iOS for initiating the BLE exchanges, hence preventing two iOS devices from transferring VC.

**Note**:&#x20;

* To learn more about Tuvali's implementation, refer [here](https://docs.mosip.io/inji/tuvali).\
* For information on Tuvali permissions and requirements, refer [here](https://docs.mosip.io/inji/tuvali/tuvali-requirements).\
* To understand Tuvali and Inji integration, along with API documentation, refer [here](https://docs.mosip.io/inji/tuvali/tuvali-inji).

#### 2. NPM Module for Matching Faces

The face matcher SDK internally implements native functionalities for Android and iOS, utilizing [Tensorflow](https://www.tensorflow.org/) and [Google ML Kit](https://developers.google.com/ml-kit) to identify faces.

This SDK internally employs a `tflite` model, which must be created by the integrating party. The model, trained using resident faces, is stored on the MOSIP file server. Inji currently utilizes the face matcher SDK (soon to be replaced by the NPM module) for offline face authentication.\

The SDK is employed in two scenarios:\

**During Offline VC Sharing**: Residents can perform selfie authentication before sharing the VC with the relying party. The app opens the camera, allowing residents to take a selfie, which is then validated against the VC image to verify the resident's presence.\
\
**During Online Login**: Residents can scan the QR code from the relying party portal and opt to log in using Inji for services. In this process, residents undergo selfie authentication against the VC to confirm their presence.

Upon the initial launch of Inji, the model is downloaded in the background and stored in the cache. Refer here to check the API spec for the face matcher model.

### 3. NPN module for using react-native-secure keystore([Secure Keystore](https://www.npmjs.com/package/mosip-react-native-secure-keystore))

The [react-native-secure-keystore](https://github.com/mosip/secure-keystore) library is a react native module. This is used to create, store key-pairs in android hardware keystore, allows encryption, decryption and HMAC calculation.

It also helps to sign with aliases, created as part of key pair generation.

As the description says, this module is only for Android devices which support hardware keystore.

To check all the API supported by this module, refer [here](https://github.com/mosip/secure-keystore/blob/develop/src/interface.ts). 

**Note**:&#x20;

* This feature is exclusive to the Android operating system.
* It is only compatible with devices that have a hardware keystore.

### 4. NPM module of Telemetry&#x20;

This [telemetry](https://github.com/mosip/sunbird-telemetry-sdk) module is derived from the [sunbird telemetry](https://github.com/project-sunbird/sunbird-telemetry-sdk) module. It is responsible for generating events that can provide valuable analytics.

_Note_: The publication of this project is currently a work in progress and has not been released yet. Stay tuned for further announcements

\


&#x20;

\

\
\
\


\
\


--------------------------------------------------------------------------------------
\--------------------------------------------------------------------------------

Below is the description of the two most important components of Inji:

1. Offline VC sharing component
2. Face matching component

## Offline VC sharing component

Transfer VC from Wallet to Verifier is facilitated by a `react native library` called [Tuvali](https://github.com/mosip/tuvali). This library is integrated into Inji to allow the offline VC transfer between mobile devices over `Bluetooth Low Energy (BLE)`.

The below table represents the supported roles for Android and iOS devices.

_Note_: iOS as Verifier is not supported.

| **Wallet** | **Verifier** | **VC transfer support** |
| ---------- | ------------ | ----------------------- |
| Android    | Android      | Yes                     |
| iOS        | Android      | Yes                     |
| Android    | iOS          | No                      |
| iOS        | iOS          | No                      |

* To know more about Tuvali's implementation, refer [here](https://docs.mosip.io/inji/tuvali).
* To learn about Tuvali permissions and requirements, refer [here](https://docs.mosip.io/inji/tuvali/tuvali-requirements).
* To know about the Tuvali and Inji integration and API documentation, refer [here](https://docs.mosip.io/inji/tuvali/tuvali-inji).

_Note_: Tuvali is actively developed and maintained by MOSIP.

## Face matching component

Inji uses the face matcher SDK to perform offline face authentication.

The SDK is used in the two scenarios below:

1. **During offline VC sharing**: Residents can perform selfie authentication before sharing the VC with the relying party. Once the resident chooses to do so, the app will open the camera and the resident can take a selfie. This selfie image will be validated against the VC image to verify the Resident's presence.
2. **During online login**: Residents can scan the QR code from the relying party portal and choose to log in using Inji to avail services. In this process, the resident has to go through selfie authentication against the VC to verify presence.

The face matcher SDK internally has the native implementation for Android and iOS where [Tensorflow](https://www.tensorflow.org/) and [Google ML Kit](https://developers.google.com/ml-kit) is used to identify face.

The SDK internally uses a `tflite model` which has to be created by the country. The model can be trained using resident faces. Once the model is created, it will be stored in the MOSIP file server.

After the resident installs the app, it will download the model in the background and keep it in the cache. Inji will then use the same model for face matching.

Countries can create their custom face matcher implementation inside this library and use it in Inji.

Please refer [here](../specifications/face-SDK-specifications.md) to check the API spec for the face matcher model.
