# Components

## Offline VC sharing component

Transfer VC from Wallet to Verifier is facilitated by a react native library called [Tuvali](https://github.com/mosip/tuvali). This library is integrated into inji to allow offline VC transfer between mobile devices over Bluetooth Low Energy (BLE).

Below table represents the supported roles for Android and IOS devices. IOS as Verifier is not supported.

| Wallet  | Verifier | VC transfer support |
| ------- | -------- | ------------------- |
| Android | Android  | Yes                 |
| IOS     | Android  | Yes                 |
| Android | IOS      | No                  |
| IOS     | IOS      | No                  |

Refer to Tuvali implementation details [here](./tuvali.md)

Refer to Tuvali Permissions, requirements details [here](./tuvali-requirements.md)

Refer to Tuvali & Inji Integration along with API documentation [here](./tuvali-inji.md)

> Note: Tuvali is actively developed & maintained by MOSIP.
