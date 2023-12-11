# Guidelines for integrating SDK with Inji

For any software development kit (SDK) integration with Inji, the following specifications are expected:

1. The SDK should be implemented as an npm module that supports the React Native framework.

   For example, the npm modules `mosip-react-native-tuvali` and `mosip-react-native-secure-keystore` demonstrate suitable implementations.

2. The SDK should provide simple APIs for integration purposes.

   These APIs should include an API for instantiation or initialization, such as the "init" or "constructor" API.

3. The SDK should also include additional APIs that perform the necessary actions.

   * There should be an API available to **disconnect** or **close** the SDK, if needed.

   * If possible, it would be beneficial for these APIs to be **asynchronous**. This enables users to continue using the application without experiencing any UI blocking.

By adhering to these specifications, the integrated SDK will enhance the functionality and usability of the application.

## Face Match [SDK](https://github.com/mosip/mosip-mobileid-sdk/tree/IrisScan) Integration

The following APIs are available for consumption:

1. **Init API**: This API is asynchronous and is used for initializing the given SDK. During initialization, the API validates the license, downloads the latest model file if needed, or informs the server about its usage if required. It is expected that this API only returns errors when there is a critical issue with the initialization process. In offline scenarios, the API should return true to ensure smooth usage.

*  The API should immediately return true if initialization has already been completed.

* The API optionally accepts a traceabilityId parameter for enhanced logging and traceability purposes. In Inji, the AppId is used.

   ```
   async function init(path: string): Promise<boolean> {
  Initialise....
  if (successfully initialised) {
    return true;
  }
  return false;
  }
  ```

2. **Face Authentication API**: This API is an asynchronous tool that compares two images, allowing for different image formats such as PNG, JPG, or HEIC. By returning a boolean value, the API confirms a successful match or indicates an unsuccessful one. 

* In order to ensure fraud prevention in compliance with ISO/IEC 30101, the faceAuth verification should include passive liveness checks, such as picture in picture.

* To enhance logging and traceability, the API may accept an optional parameter known as traceabilityId.

* In Inji, it is AppId.

  ```
  async function faceAuth(capturedImage: string, vcImage: string): Promise<boolean> {
  Compare capturedImage & vcImage.....
  if (matched) {
    return true;
  }
  return false;
  }
  ```

 3. faceAuth with **liveness is coming soon**: This feature enables Inji to verify specific parameters for liveness. We utilize local face verification to guarantee the user's presence during a transaction. This measure is implemented to combat fraud, going beyond the [ISO/IEC 30101](https://www.iso.org/standard/83828.html) standard.

    The following guidelines apply to individuals who are developing the face SDK:

    1. It is prohibited to collect any personally identifiable information (PII) or phone details.

    2. Inji includes built-in telemetry, and all telemetry data must be transmitted to the designated system. Telemetry enhances Inji's observability features by capturing specific events, creating measures, and monitoring various user actions and events.

    3. Recording or transmitting IP addresses, user details, Phone IMEI, phone numbers, or user photos in telemetry or logs is strictly prohibited.

    4. The use of phone numbers and device fingerprints should be limited to managing the SDK license.
   
## BLE Verifier [SDK](https://mosip.atlassian.net/wiki/spaces/Inji/pages/1170112529) Integration

The following APIs are exposed to instantiate, start the transfer and stop the transfer

1. **Constructor (config)**: This API initializes the BLE module using the provided configuration. This initialization process allows for the sharing of configuration information for advertisement purposes. A new instance is created with each initialization.

   * It is recommended to use one instance per session and to initialize a new instance for each subsequent session.

   * The configuration passed to the constructor includes a parameter called `deviceName`. This name is included in the advertisement payload during the BLE advertisement. It is important to note that this field has a character limit of 11 characters.

    ```
    constructor(configOptions: ConfigOptions) {
    Initialise verifier service with provided configuration
          }
    ConfigOptions {
    deviceName: string;
    }
    ```

2. StartTransfer() —> new Promise(Presentation) or error

   This internally establishes a connection and initiates the transfer

   ```
   startTransfer() {
   Start Advertisement
   Interact with tuvali to start advertisement
   update state to Advertising
   }
   ```
3. StopTransfer()

   This API has to be called explicitly to stop the connection after a successful transfer or user wants to cancel the transfer.

   ```
   stopTransfer() {
   disconnect the connection
   update state to Idle
   }
   ```

4. Types of states supported:

   * Idle

   * Advertising

   * Connected

   * Secure Connection Established

   * Requested

   * Received

   * Error

   * Disconnected
  
     Transitions between states is shown below:
  
     

     If either the sender or receiver decides to cancel the transfer at any stage, the state will transition to Disconnected and become Idle as a result.

     To know more, refer the BLE Verifier Sdk [documentation](https://github.com/mosip/ble-verifier-sdk/tree/develop#readme) for more details.

 ## Inji integration workflow with BLE Verifier SDK and Face Match SDK

     

