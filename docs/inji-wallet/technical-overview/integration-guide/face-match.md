# Face Match

Face Match is an optional component in Inji Wallet. This is built as a standard that allows anyone to integrate their Facematch SDK. Its expected that the wallet providers would integrate the SDK that matches the specification.

The current [specification](../specifications/face-sdk-specifications.md) is in draft state.

## Contribution

We extend our sincere appreciation to the **IRIScan team** for their invaluable support to MOSIP by providing an opensource face match SDK for our internal reference integration. We are truly impressed by your commitment and outstanding contribution. We welcome and invite our other esteemed partners to collaborate with MOSIP, for a similar integration.

### Repository

{% embed url="https://github.com/biometric-technologies/biometric-sdk-react-native" %}

### NPM Package

{% embed url="https://www.npmjs.com/package/@iriscan/biometric-sdk-react-native" %}

## Installation

* To install any face sdk module, please add it's dependency in the `package.json` file.
* Once done rebuild the Inji Wallet.
* The Inji Wallet should be able to integrate and use the face sdk.

### Face Compare with liveness is coming soon

* This feature enables Inji Wallet to verify specific parameters for liveness. We utilize local face verification to guarantee the user's presence during a transaction. This measure is implemented to combat fraud, going beyond the [ISO/IEC 30101](https://www.iso.org/standard/83828.html) standard.
* The following guidelines apply to individuals who are developing the face SDK:
  1. It is prohibited to collect any personally identifiable information (PII) or phone details.
  2. Inji Wallet includes built-in telemetry, and all telemetry data must be transmitted to the designated system. Telemetry enhances Inji Wallet's observability features by capturing specific events, creating measures, and monitoring various user actions and events.
  3. Recording or transmitting IP addresses, user details, Phone IMEI, phone numbers, or user photos in telemetry or logs is strictly prohibited.
  4. The use of phone numbers and device fingerprints should be limited to managing the SDK license.
