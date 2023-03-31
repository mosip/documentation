# Workflow state machine components
Workflow in Inji divided into multiple finite state machine components. State machines are written using a library called xtate. 
All the state machines are available in machines folder of inji codebase. Here are list of state machines and their responsibilities. The implementers can choose to use the existing state machine components and customise the workflow as per the need.

## app.ts
This is the root state machine for the application. On initialisation it starts other state machines from
- store.ts
- auth.ts
- vc.ts
- settings.ts
- activityLog.ts
- request.ts
- scan.ts
- revoke.ts


## store.ts
This state machine takes care of actions related to storing and retrieving data on the mobile phone. It exposes wrapper to all the other state machines to work with data stored on the device. It also performs the custom encryption and decryption required for saving and retrieving data from the underlying store. As of now, the store state machine uses a library called [async-storage](https://react-native-async-storage.github.io/async-storage/docs/api) which abstracts how data is stored between IOS and Android. 

## auth.ts
This state machine helps to setup authentication for the application. It allows user to choose between biometric and passcode based authetication on the first launch.

## vc.ts
This state machine helps to show a couple of screens related to VC. One is My VCs where all user downloaded VCs will be shown. Another one is Received VCs where all received VCs can be shown.

## vcItem.ts
TODO:

## settings.ts
This state machine helps to show contents and interactions on the settings screen of the application. This facilitates options like language switch, enable/disable biometric unlock etc.

## activityLog
This state machine helps to view the audit log of the different activities on the application and shows it on a separate screen. Some of the activities that are shown are VC download, VC receive, VC sent events etc.

## request.ts
This state machine is instantiated when the user launches the verification section which display QR code. This QR is generated with content from low level [offline VC sharing component](../architecture/components.md#offline-vc-sharing-component). The content of the QR code is scanned by a wallet inji application to establish connection with verifier and share the VC credential. Once the VC is received on the Verifier side, the state machine allows to see the received VC details as well for Verification.

## scan.ts
This state machine is instantiated when the user launches the scanner section which opens up camera to scan the QR code presented by the Verifier. The scanned data is fed into underlying [offline VC sharing component](../architecture/components.md#offline-vc-sharing-component) to allow discovery of the Verifier device and establishing connnection to it. Once the connection is established, the user is allowed select the downloaded VCs that can be shared to Verifier. The state machine also allows selfie/face verification before sharing VC.

## revoke.ts
TODO:

## QrLoginMachine.ts
This state machine facilitates flow for Login with QR code through Open ID connect from various portals. This is launched when the user opens up scanner and scans a QR code from a website that supports login with Inji. Once scan is peformed, the user can review the required claims and select volunatry claims to be submitted. Once the submission is done successfully, the portal will be able to redirect automatically and logs the user in.

## pinInput.ts
This is a utility state machine which is used to facilitate pin/otp login wherever required in the application.

## faceSanner.ts
This is a state machine which facilitates interactions to face scanning. It is used in multiple places like Login with QR code, share with selfie etc.

## biometrics.ts
This state machine facilitates toggling biometric unlock on/off on settings screen. This also allows setting up and using biometric unlock for the application.

