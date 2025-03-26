# Components

Inji Wallet utilizes multiple libraries to provide a seamless experience.

These libraries are accessible as NPM modules, allowing seamless integration with other mobile wallets.

The libraries are as follows:

1. Tuvali - Sharing via BLE SDK
2. Face Match SDK
3. Secure Keystore SDK
4. PixelPass SDK
5. VCI-client SDK
6. OpenID4VP - Online Sharing SDK
7. BLE Verifier SDK
8. Telemetry SDK(coming soon)

<figure><img src="../../../.gitbook/assets/InjiWalletComponents.png" alt=""><figcaption></figcaption></figure>

### **1. Tuvali - Sharing via BLE SDK**

* The transfer of downloaded Verifiable Credential from the Wallet to Verifier is facilitated by a React Native library named Tuvali.
* Tuvali enables offline VC transfer between mobile devices via Bluetooth Low Energy (BLE).\
  \
  The below table represents the supported roles for Android and iOS devices.

<table><thead><tr><th width="134">Wallet</th><th width="131">Verifier</th><th>VC transfer support</th></tr></thead><tbody><tr><td>Android</td><td>Android</td><td>Yes</td></tr><tr><td>iOS</td><td>Android</td><td>Yes</td></tr><tr><td>Android</td><td>iOS</td><td>No</td></tr><tr><td>iOS</td><td>iOS</td><td>No</td></tr></tbody></table>

* Tuvali is actively developed and maintained by MOSIP.
  * [Kotlin Implementation](https://github.com/mosip/tuvali)
  * [Swift Implementation](https://github.com/mosip/tuvali-ios-swift)
* It does not support iOS for initiating the BLE exchanges, hence preventing two iOS devices from transferring VC.

{% hint style="info" %}
Note:

* To learn more about Tuvali's implementation, refer [here](https://docs.mosip.io/inji/integration-guide/tuvali).
* For information on Tuvali's permissions and requirements, refer [here](https://docs.mosip.io/inji/integration-guide/tuvali/tuvali-requirements).
* To understand Tuvali and Inji Wallet integration, along with API documentation, refer[ here](https://docs.mosip.io/inji/integration-guide/tuvali/tuvali-inji).
* Maven snapshots are available [here](https://oss.sonatype.org/content/repositories/snapshots/io/mosip/tuvali/)
{% endhint %}

### **2. Face Match SDK**

The face matcher SDK internally implements native functionalities for Android and iOS, utilizing [Tensorflow](https://www.tensorflow.org/) and [Google ML Kit](https://developers.google.com/ml-kit) to identify faces.

This SDK internally employs a `tflite` model, which must be created by the integrating party. The model, trained using resident faces, is stored on the MOSIP file server. Inji Wallet currently utilizes the face matcher SDK (soon to be replaced by the NPM module) for offline face authentication.

The SDK is employed in two scenarios:

**During Offline VC Sharing**: Residents can perform selfie authentication before sharing the VC with the relying party. The app opens the camera, allowing residents to take a selfie, which is then validated against the VC image to verify the resident's presence.\
\
**During Online Login**: Residents can scan the QR code from the relying party portal and opt to log in using Inji Wallet for services. In this process, residents undergo selfie authentication against the VC to confirm their presence.

Upon the initial launch of Inji Wallet, the model is downloaded in the background and stored in the cache. Refer [here](integration-guide/face-match.md) to check the API specifications for the face matcher model.

### **3. Secure Keystore SDK**

The secure-keystore library is designed for creating and storing key pairs in the hardware keystore of devices. The library supports encryption, decryption, HMAC calculation, and signing with aliases created during key pair generation.

This library is available for both Android and iOS platforms:

* **For Android**: Refer to the [secure-keystore Kotlin library](https://github.com/mosip/secure-keystore).
* **For iOS**: Refer to the [secure-keystore-iOS Swift library](https://github.com/mosip/secure-keystore-ios-swift).

Inji Wallet integrates with the secure-keystore library to ensure secure key management. To optimize the key size during credential download requests, Inji Wallet uses RSA-2048, ECR1, ECK1, ED25519 keys.

To check all the APIs supported by this module, refer [here](../../technical-overview/components.md).

{% hint style="info" %}
**Note:**

* Compatible with devices that support a hardware keystore.
* To understand the library and access API documentation, refer [here](integration-guide/secure-keystore.md).
* Maven snapshots are available [here](https://oss.sonatype.org/content/repositories/snapshots/io/mosip/secure-keystore/).
{% endhint %}

### **4. PixelPass SDK**

The PixelPass library offers a powerful solution for creating and decoding QR codes for Verifiable Credentials (VCs). It is designed to optimize the size of the data encoded within a QR code, making it easier to store and share credential information. The library achieves this by utilizing advanced compression and encoding techniques, ensuring smaller QR codes that maintain the integrity and security of the data.

PixelPass uses zlib compression with a level 9 setting, which significantly reduces the data size before encoding. It then applies base45 encoding to further compress the data into a QR code-friendly format. Additionally, the library can decode any QR code data previously encoded using its own compression and encoding algorithms, ensuring seamless interoperability.

Additionally, for a JSON data, the library employs CBOR encoding and decoding to minimize the size even further. When a JSON Mapper similar to [Claim 169](https://docs.mosip.io/1.2.0/overview/standards-and-specifications/169-qr-code-specification) is provided, PixelPass maps the data, applies CBOR encoding/decoding, and compresses the data, achieving maximum size reduction. Developed and maintained by MOSIP, PixelPass is continually updated to provide reliable and efficient QR code generation and decoding capabilities.

{% hint style="info" %}
Note:

* Refer to the PixelPass repository
  * [Kotlin Implementation](https://github.com/mosip/pixelpass/tree/master/kotlin)
  * [JS Implementation](https://github.com/mosip/pixelpass/tree/master/js)
  * [Swift Implementation](https://github.com/mosip/pixelpass-ios-swift)
* To understand about the installation and the API documentation, refer [here](integration-guide/pixelpass.md).
* For a hands-on experience of Generate a VC, Generate QR Code for the VC and Verify the same using Inji Verify, please click [here](https://docs.inji.io/inji-verify/build-and-deploy/creating-verifiable-credentials-and-generating-qr-codes).
* To check the NPM module, click[ here](https://www.npmjs.com/package/@mosip/pixelpass).
* Maven snapshots are available [here](https://oss.sonatype.org/content/repositories/snapshots/io/mosip/pixelpass/)
{% endhint %}

### **5. VCI-client SDK**

VCI-Client library carries out the credential request from the consumer application (mobile wallet or web) and redirects the issuance/issuer. The library creates a request with the credential format, jwtproof of the wallet, issuer metadata and the access token received for authorization and provides VC as the response back to the consumer application for storage.

{% hint style="info" %}
Note:

* Refer to the VCI-Client repository
  * [Kotlin Implementation](https://github.com/mosip/inji-vci-client/blob/master/kotlin/README.md)
  * [Swift Implementation](https://github.com/mosip/inji-vci-client-ios-swift)
* To understand about the installation and the API documentation, refer [here](https://docs.mosip.io/inji/inji-mobile-wallet/integration-guide/vci-client).
* Maven snapshots are available [here](https://oss.sonatype.org/content/repositories/snapshots/io/mosip/inji-vci-client/)
{% endhint %}

### **6. OpenID4VP - Online Sharing SDK**

This OpenID4VP library enables consumer applications (mobile wallet) to share users Verifiable Credentials with Verifiers who request them online. It adheres to the OpenID4VP specification which outlines the standards for requesting and presenting Verifiable Credentials.

#### **This library follows the below steps to share the Verifiable Presentation with the Requested Verifier:**

1. Receives the Verifier's Authorization Request sent by the consumer application (mobile wallet).
2. Authenticates the Verifier using the received **client\_id** and validates the whole Request to check if the required details are present or not and then returns the Authorization Request to the consumer application if all the validations are successful.
3. Receives the list of Verifiable Credentials from the consumer application which are selected by the consumer application end-user based on the credentials requested as part of Verifier Authorization request.
4. Constructs the vp\_token without proof section and sends it back to the consumer application for generating Json Web Signature (JWS).
5. Receives the generated signature along with the other details and generates vp\_token with proof section & presentation\_submission.
6. Sends a POST request with generated vp\_token and presentation\_submission to the received Verifier's response\_uri endpoint.

{% hint style="info" %}
Note:

* Refer to the inji-openid4vp repository
  * [Kotlin Repository](https://github.com/mosip/inji-openid4vp)
  * [Swift Repository](https://github.com/mosip/inji-openid4vp-ios-swift)
* To understand about the installation and the API documentation, refer [here](https://docs.mosip.io/inji/inji-wallet/inji-mobile/technical-overview/integration-guide/openid4vp).
* Maven snapshots are available [here](https://oss.sonatype.org/content/repositories/snapshots/io/mosip/inji-openid4vp/)
{% endhint %}

### **7. BLE Verifier SDK**

The [BLE Verifier](https://github.com/mosip/ble-verifier-sdk/tree/develop) is the module built for verifiers for receiving VC via BLE. This is a wrapper built on Tuvali with simplified APIs.

To know more about API and how to integrate, refer [here](integration-guide/ble-verifier.md).

{% hint style="info" %}
Note:

* To check the NPM module, click [here](https://www.npmjs.com/package/@mosip/ble-verifier-sdk).
{% endhint %}

### **8. Telemetry SDK**

The [telemetry](https://github.com/mosip/sunbird-telemetry-sdk) module is derived from the [sunbird telemetry](https://github.com/project-sunbird/sunbird-telemetry-sdk) module. It is responsible for generating events that can provide valuable analytics.

_**Note**_: _The publication of this project is currently a work in progress and has not been released yet. Stay tuned for further announcements!_

> To know more about each of these, refer [Integration Guides](https://docs.mosip.io/inji/integration-guide).
