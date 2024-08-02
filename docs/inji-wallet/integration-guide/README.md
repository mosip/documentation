# Integration Guides

Below are the guidelines and specifications for integrating any software development kit (SDK) with Inji Wallet:

1.  The SDK should be implemented as a npm module that supports the React Native framework.

    For example, the npm modules, [**tuvali**](https://www.npmjs.com/package/@mosip/tuvali) and [**secure-keystore**](https://www.npmjs.com/package/@mosip/secure-keystore)**,** demonstrate suitable implementations.
2.  The SDK should provide simple APIs for integration purposes.

    These APIs should include an API for instantiation or initialization, such as the **init** or **constructor** API.
3. The SDK should also include additional APIs that perform the necessary actions.
4.  There should be an API available to **disconnect** the SDK, if needed.

    If possible, it would be beneficial for these APIs to be **asynchronous**. This enables users to continue using the application without experiencing any UI blocking.
5. To enhance logging and traceability, the API may accept an optional parameter known as `traceabilityId`.

By adhering to these specifications, the integrated SDK will enhance the functionality and usability of the application.

This section contains various guides and information that could benefit the developers, system integrators, relying parties and end users.

For more information on how to get started with integrations, read through:

1. Tuvali - Sharing via BLE
2. Face Match
3. Secure Keystore
4. BLE Verifier
5. PixelPass
6. Telemetry (details coming up soon)

<table data-view="cards"><thead><tr><th></th><th></th><th></th><th data-hidden data-card-cover data-type="files"></th><th data-hidden data-card-target data-type="content-ref"></th></tr></thead><tbody><tr><td></td><td></td><td></td><td><a href="../../.gitbook/assets/Tuvali (2).png">Tuvali (2).png</a></td><td><a href="tuvali/">tuvali</a></td></tr><tr><td></td><td></td><td></td><td><a href="../../.gitbook/assets/Face Match.png">Face Match.png</a></td><td><a href="face-match.md">face-match.md</a></td></tr><tr><td></td><td></td><td></td><td><a href="../../.gitbook/assets/ble-verifier.png">ble-verifier.png</a></td><td><a href="ble-verifier.md">ble-verifier.md</a></td></tr><tr><td></td><td></td><td></td><td><a href="../../.gitbook/assets/background - Copy (3).png">background - Copy (3).png</a></td><td><a href="secure-keystore.md">secure-keystore.md</a></td></tr><tr><td></td><td></td><td></td><td><a href="../../.gitbook/assets/PixelPass.png">PixelPass.png</a></td><td><a href="pixelpass.md">pixelpass.md</a></td></tr><tr><td></td><td></td><td></td><td><a href="../../.gitbook/assets/Telemetry.png">Telemetry.png</a></td><td><a href="telemetry.md">telemetry.md</a></td></tr></tbody></table>
