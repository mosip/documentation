# Face Match SDK

* This is the module built for performing face match verification. 
* The library takes two images as base64 encoded strings and returns a boolean (match or no match).

Because of its nature being Open Source, Inji has utilised it to perform face verification while transferring VC to relying party.

Following is the repository being referred
{% embed url="https://github.com/biometric-technologies/biometric-sdk-react-native" %}

## Installation

* By adding a module dependency in package.json
The code is copied to different repo for now. Publishing this as npm module is WIP.
Refer: https://github.com/mosip/mosip-mobileid-sdk/tree/IrisScan

* Once npm module is published, that will be integrated as dependency.

## API Specification

### Init API
* This API is asynchronous and is used for initializing the given SDK. During initialization, the API validates the license, downloads the latest model file if needed, or informs the server about its usage if required. It is expected that this API only returns errors when there is a critical issue with the initialization process. In offline scenarios, the API should return true to ensure smooth usage.

* The API should immediately return true if initialization has already been completed.

* To enhance logging and traceability, the API may accept an optional parameter known as traceabilityId. In Inji, AppId is being used.

**Usage**

* Import the init the method from module

```
import {init} from 'mosip-mobileid-sdk';

## refer to /src/index.tsx init method for usage
```

**Signature**
 ```
   async function init(path: string): Promise<boolean> {
   if (already initialised) {
    return true;
   }
  Initialise....
  if (successfully initialised) {
    return true;
  }
  return false;
  }
  ```

**Parameters**

| **Name**      | **Description**                              | **Type**   |
| ------------- | -------------------------------------------- | ---------- |
| url           | Secure url of the model                      | Secure url |

_Standard Return Codes (true or false)_

| **Response** | **Status** |
|--------------|------------|
| true         | Success    |
| false        | Error      |

### Face Authentication API
* This API is an asynchronous tool that compares two images, allowing for different image formats such as PNG, JPG, or HEIC. By returning a boolean value, the API confirms a successful match or indicates an unsuccessful one.

* In order to ensure fraud prevention in compliance with [ISO/IEC 30101](https://www.iso.org/standard/83828.html), the faceAuth verification should include passive liveness checks, such as picture in picture.

* To enhance logging and traceability, the API may accept an optional parameter known as traceabilityId. In Inji, AppId is being used.

**Usage**

* Import the faceAuth the method from module to compare

```
import { faceAuth } from "mosip-mobileid-sdk";

## refer to /machines/faceScanner.ts verifyImage method for usage
```

**Signature**
 ```
  async function faceAuth(capturedImage: string, vcImage: string): Promise<boolean> {
  logic to compare capturedImage & vcImage.....
  if (matched) {
    return true;
  }
    return false;
  }
  ```

**Parameters**

| **Name**      | **Description**                          | **Type**              |
| ------------- | ---------------------------------------- | --------------------- |
| capturedImage | The image that is captured by the camera | base64 encoded string |
| vcImage       | The face image received in VC            | base64 encoded string |

_Standard Return Codes (match or no match)_

| **response** | **Status**  |
|--------------| ----------- |
| true         | Matched     |
| false        | Not Matched |
| false        | Error       |


### Face Authentication with liveness is coming soon

* This feature enables Inji to verify specific parameters for liveness. We utilize local face verification to guarantee the user's presence during a transaction. This measure is implemented to combat fraud, going beyond the [ISO/IEC 30101](https://www.iso.org/standard/83828.html) standard.

* The following guidelines apply to individuals who are developing the face SDK:
  1. It is prohibited to collect any personally identifiable information (PII) or phone details.
  
  2. Inji includes built-in telemetry, and all telemetry data must be transmitted to the designated system. Telemetry enhances Inji's observability features by capturing specific events, creating measures, and monitoring various user actions and events.

  3. Recording or transmitting IP addresses, user details, Phone IMEI, phone numbers, or user photos in telemetry or logs is strictly prohibited.

  4. The use of phone numbers and device fingerprints should be limited to managing the SDK license.

_Note: A big thanks to the Iriscan team for supporting MOSIP by providing this face match SDK. Your contribution and dedication is highly commendable._