# Components

## Offline VC sharing component

Transfer VC from Wallet to Verifier is facilitated by a react native library called [Tuvali](https://github.com/mosip/tuvali). This library is integrated into Inji to allow offline VC transfer between the mobile devices over `Bluetooth Low Energy (BLE)`.

Below table represents the supported roles for Android and iOS devices. 

_Note_: iOS as Verifier is not supported.

| **Wallet**  | **Verifier** | VC transfer support |
| ------- | -------- | ------------------- |
| Android | Android  | Yes                 |
| iOS     | Android  | Yes                 |
| Android | iOS      | No                  |
| iOS     | iOS      | No                  |

To know more about Tuvali implementation, refer [here](architecture/tuvali.md).

To know more about Tuvali permissions and requirements, refer [here](architecture/tuvali-requirements.md).

To know about the Tuvali and Inji integration along with the API documentation, refer [here](architecture/tuvali-inji.md).

_Note_: Tuvali is actively developed and maintained by MOSIP.


## Face matching component

The [face matcher sdk](https://github.com/mosip/mosip-mobileid-sdk) is used by INJI to perform offline face authentication. 
The sdk is used in below 2 scenarios -
1. During offline VC sharing: Resident can perform selfie auth before sharing VC with relying party. Once resident choose to do so, app will open camera and clicks selfie. This selfie image will be validated against the VC image to verify Resident presence.
2. During online login: Resident can scan QR code from relying party portal and choose to login using INJI to avail services. In this process resident has to go through offline selfie auth against VC to verify presence.

The face matcher sdk internally has native implementation for Android and iOS where [Tensorflow](https://www.tensorflow.org/) and [Google ML Kit](https://developers.google.com/ml-kit) is used to identify face.
The sdk internally uses a tflite model which has to be created by country. The model can be trained using resident faces. Once model is created it will be stored in mosip file server. 
After Resident installs app, it will download model in background and keep it in cache. INJI will then use same model for face matching.

Country can create their custom face matcher implementation inside this library and use it in INJI App.

Please refer [here](../specifications/face-SDK-specifications.md) to check the API spec for face matcher model.