# Components

There are two important components in Inji:

1. Offline VC sharing component
2. Face matching component

These components have been explained in the section below.

## Offline VC sharing component

Transfer VC from Wallet to Verifier is facilitated by a react native library called [Tuvali](https://github.com/mosip/tuvali). This library is integrated into Inji to allow offline VC transfer between mobile devices over `Bluetooth Low Energy (BLE)`.

The below table represents the supported roles for Android and iOS devices.

_Note_: iOS as Verifier is not supported.

| **Wallet** | **Verifier** | VC transfer support |
| ---------- | ------------ | ------------------- |
| Android    | Android      | Yes                 |
| iOS        | Android      | Yes                 |
| Android    | iOS          | No                  |
| iOS        | iOS          | No                  |

* To know more about Tuvali's implementation, refer [here](architecture/tuvali.md).
* To learn about Tuvali permissions and requirements, refer [here](architecture/tuvali-requirements.md).
* To know about the Tuvali and Inji integration and API documentation, refer [here](architecture/tuvali-inji.md).

_Note_: Tuvali is actively developed and maintained by MOSIP.

## Face matching component

Inji uses the face matcher SDK to perform offline face authentication.

The SDK is used in the two scenarios below:

1. During offline VC sharing: Residents can perform selfie authentication before sharing the VC with the relying party. Once the resident chooses to do so, the app will open the camera and the resident can take a selfie. This selfie image will be validated against the VC image to verify the Resident's presence.
2. During online login: Residents can scan the QR code from the relying party portal and choose to log in using Inji to avail of services. In this process, the resident has to go through offline selfie auth against the VC to verify presence.

The face matcher SDK internally has the native implementation for Android and iOS where [Tensorflow](https://www.tensorflow.org/) and [Google ML Kit](https://developers.google.com/ml-kit) is used to identify face.

The SDK internally uses a `tflite model` which has to be created by the country. The model can be trained using resident faces. Once the model is created, it will be stored in the MOSIP file server.

After the resident installs the app, it will download the model in the background and keep it in the cache. Inji will then use the same model for face matching.

Countries can create their custom face matcher implementation inside this library and use it in Inji.

Please refer [here](../specifications/face-SDK-specifications.md) to check the API spec for the face matcher model.
