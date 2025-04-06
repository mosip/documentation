# Workflow customization

Workflow in Inji Wallet is achieved by finite-state machine components. State machines are written using a library called [xstate](https://xstate.js.org/docs/recipes/react.html). All the state machines are available in the machines folder of the Inji Wallet codebase. There are few machines under the screens folder but these are too specific to those features.

Here is a list of state machines and their responsibilities. The developers can choose to use the existing state machine components and customize the workflow as per their needs.

## app.ts

This is the root state machine for the application. On initialisation, it starts other state machines from:

* store.ts
* auth.ts
* vcMetaMachine.ts
* settings.ts
* activityLog.ts
* requestMachine.ts
* scanMachine.ts
* backup.ts
* backupRestore.ts

## store.ts

This state machine takes care of actions related to storing and retrieving data on the mobile phone. It exposes the wrapper to all the other state machines to work with data stored on the device.

It also performs the custom encryption and decryption required for saving and retrieving data from the underlying store.

As of now, the store state machine uses following two libraries which abstracts how the data is stored between iOS and Android:

* [react-native-mmkv-storage](https://github.com/ammarahm-ed/react-native-mmkv-storage) - stores all the meta information and references of the encrypted VC.
* [react-native-fs](https://www.npmjs.com/package/react-native-fs) - stores the encrypted VC as a separate file,

## auth.ts

This state machine helps to set up authentication for the application. It allows users to choose between biometric and passcode-based authentication on the first launch. It also updates the app state as authorized or unauthorized based on user action on first launch.

On first launch, once the user selects language preference, and goes through intro sliders, user has been asked to choose the unlock method.

After selecting the unlock method as passcode or biometric, the user is navigated to Home screen Once user is on home screen, app state is considered as authorized. Once a user logs out from settings, the state is considered as unauthorized.

## vcItemMachine.ts

This state machine is spawned for every VC downloaded, and tracks its lifecycle. This contains all the activities/state related to VC like:

* load VC
* activate VC
* activate/delete/pin/unpin VC
* verifies the credentials

## vcMetaMachine.ts

This state machine takes care of the all the meta information related to all VCs.

## issuersMachine.ts

This state machine list of issuers in the user interface, as well as downloads and caches the issuer's configuration. It also performs the following actions:

* download credential
* verify the verifiable credential
* store the verifiable credential

## backup.ts

This state machine performs all action related to backing up of the verifiable credentials on google drive or iCloud.

## backupRestore.ts

This state machine performs all action related to restoring and verifying the backed up verifiable credentials from google drive or iCloud.

## settings.ts

This state machine helps to show contents and interactions on the settings screen of the application. This facilitates options like language switch, enable/disable biometric unlock etc.

## activityLog

This state machine helps to view the audit log of the different activities on the application and shows it on a separate screen. Some of the activities that are shown are VC download, VC receive, VC sent events etc.

## requestMachine.ts

This state machine is instantiated when the user launches the verification section which displays the QR code. This QR is generated with content from a low-level [offline VC-sharing component](../components.md#offline-vc-sharing-component). The content of the QR code is scanned by a wallet Inji Wallet application to establish connection with verifier and share the VC credential. Once the VC is received on the Verifier side, the state machine allows seeing the received VC details as well for Verification.

## scanMachine.ts

This state machine is instantiated when the user launches the scanner section which opens up the camera to scan the QR code presented by the Verifier. The scanned data is fed into the underlying [offline VC sharing component](../components.md#offline-vc-sharing-component) to allow the discovery of the Verifier device and establish a connection to it. Once the connection is established, the user is allowed to select the downloaded VCs that can be shared with Verifier. The state machine also allows selfie/face verification before sharing VC.

## QrLoginMachine.ts

This state machine facilitates flow for `Login with QR code` through Open ID connect from various portals. This is launched when the user opens up the scanner and scans a QR code from a website that supports login with Inji Wallet. Once the scan is performed, the user can review the required claims and select voluntary claims to be submitted. Once the submission is done successfully, the portal will be able to redirect automatically and logs the user in.

## pinInput.ts

This is a utility state machine which is used to facilitate PIN/OTP login wherever required in the application.

## faceSanner.ts

This is a state machine which facilitates the interactions to face scanning. It is used to support face authentication in Login with a QR code, sharing with selfies flow.

## biometrics.ts

This state machine facilitates toggling biometric unlock on/off settings screen. This also allows setting up and using biometric unlock for the application.
