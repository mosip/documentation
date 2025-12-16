# Integration Guides

This section provides guidelines and specifications for integrating any software development kit (SDK) with **Inji Wallet**. It also contains references to available SDKs and tools that developers, system integrators, relying parties, and end users may find useful.

### SDK Integration Specifications

To ensure seamless integration with **Inji Wallet**, SDKs must follow these requirements:

* **Availability**
  * The SDK should be published as an **npm module** for integration with React Native applications.
  * For **Android**, integration must be supported via a **Maven dependency**.
  * For **iOS**, integration must be supported via **Swift Package Manager (SPM)**. For example, the npm modules [**tuvali**](https://www.npmjs.com/package/@mosip/tuvali) and [**secure-keystore**](https://www.npmjs.com/package/@mosip/secure-keystore) demonstrate suitable implementations.
* **API Design**
  * Provide a simple API surface for easy integration.
  * Must include an **initialization API** (e.g., `init` or a constructor API).
  * Include all necessary functional APIs to perform core actions.
  * Provide a **disconnect API** to safely detach the SDK when needed.
  * Preferably design APIs to be **asynchronous**, allowing users to continue app usage without UI blocking.
* **Traceability & Logging**
  * APIs may optionally accept a parameter such as `traceabilityId` to enhance logging and request traceability.

### **Build Your Own Wallet with Inji Libraries**

Use Inji’s modular SDKs and libraries to assemble a wallet tailored to your needs. Each library provides specific capabilities that can be integrated into your application.

Build your own wallet using Inji libraries – click [here](building-verifiable-credentials-wallet-with-inji-libraries/)!

**List of Libraries and SDKs**

* [**VCI Client Library**](../architecture.md) – Issue and download Verifiable Credentials (VCs).
* [**PixelPass Library**](../architecture.md) – Compress, encode, and decode JSON for QR codes.
* [**OpenID4VP Library**](../architecture.md) – Enable credential sharing through OpenID4VP protocols.
* [**BLE Verifier Library** ](../architecture.md)– Verify VCs received over Bluetooth.
* [**Tuvali Library** ](../architecture.md)**(BLE Sharing)** – Share credentials offline via Bluetooth Low Energy.
* [**Secure Keystore Library** ](../architecture.md)– Manage secure storage of keys and sensitive data.
* [**Face Match SDK** ](../architecture.md)– Add biometric face matching for enhanced verification.
* [**Telemetry**](../architecture.md) – (Details coming soon!) for monitoring and analytics.
