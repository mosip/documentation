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
